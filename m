Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7757DFBF2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 04:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B146E375;
	Tue, 22 Oct 2019 02:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D7A6E38A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 02:41:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-QjKFinjDMgW6eY09foP7QA-1; Mon, 21 Oct 2019 22:41:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23FCA8017D9;
 Tue, 22 Oct 2019 02:41:22 +0000 (UTC)
Received: from malachite.redhat.com (ovpn-120-98.rdu2.redhat.com
 [10.10.120.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCA9060126;
 Tue, 22 Oct 2019 02:41:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 12/14] drm/amdgpu/dm: Resume short HPD IRQs before resuming
 MST topology
Date: Mon, 21 Oct 2019 22:36:07 -0400
Message-Id: <20191022023641.8026-13-lyude@redhat.com>
In-Reply-To: <20191022023641.8026-1-lyude@redhat.com>
References: <20191022023641.8026-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: QjKFinjDMgW6eY09foP7QA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571712087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wf3I4OIkp0qm6tO7brfVABcNpcqMbdi2p8pnXmDdjTc=;
 b=DRNOreMxGrscVzzPj2fzM+VvJ/nUAcIqoSTrgbMBnpW9V3D2ArnO9L2DYvJppbsX61ZWsL
 1Zv7K+5n1fjql7wfDi8qSmwzgAnLHlkX7opVBRRu9ipCq50j4+05OugeOov6hnEQ01unsc
 0vE7CZ1HuTi/3kSbrz1c0j56/TB9TKs=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Leo Li <sunpeng.li@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Juston Li <juston.li@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Francis <David.Francis@amd.com>, Harry Wentland <hwentlan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Ugd2UncmUgZ29pbmcgdG8gYmUgcmVwcm9iaW5nIHRoZSBlbnRpcmUgdG9wb2xvZ3kgc3Rh
dGUgb24gcmVzdW1lCm5vdyB1c2luZyBzaWRlYmFuZCB0cmFuc2FjdGlvbnMsIHdlIG5lZWQgdG8g
ZW5zdXJlIHRoYXQgd2UgYWN0dWFsbHkgaGF2ZQpzaG9ydCBIUEQgaXJxcyBlbmFibGVkIGJlZm9y
ZSBjYWxsaW5nIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZSgpLgpTbywgZG8gdGhhdC4K
CkNoYW5nZXMgc2luY2UgdjM6CiogRml4IHR5cG8gaW4gY29tbWVudHMKCkNjOiBKdXN0b24gTGkg
PGp1c3Rvbi5saUBpbnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+
CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzog
SGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
fCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYwppbmRleCA4ODdiYzFkNWQ5ZTIuLjhmNjdkMzAxYWQ4MSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0xMTg2LDE1ICsx
MTg2LDE1IEBAIHN0YXRpYyBpbnQgZG1fcmVzdW1lKHZvaWQgKmhhbmRsZSkKIAkvKiBwcm9ncmFt
IEhQRCBmaWx0ZXIgKi8KIAlkY19yZXN1bWUoZG0tPmRjKTsKIAotCS8qIE9uIHJlc3VtZSB3ZSBu
ZWVkIHRvICByZXdyaXRlIHRoZSBNU1RNIGNvbnRyb2wgYml0cyB0byBlbmFtYmxlIE1TVCovCi0J
czNfaGFuZGxlX21zdChkZGV2LCBmYWxzZSk7Ci0KIAkvKgogCSAqIGVhcmx5IGVuYWJsZSBIUEQg
UnggSVJRLCBzaG91bGQgYmUgZG9uZSBiZWZvcmUgc2V0IG1vZGUgYXMgc2hvcnQKIAkgKiBwdWxz
ZSBpbnRlcnJ1cHRzIGFyZSB1c2VkIGZvciBNU1QKIAkgKi8KIAlhbWRncHVfZG1faXJxX3Jlc3Vt
ZV9lYXJseShhZGV2KTsKIAorCS8qIE9uIHJlc3VtZSB3ZSBuZWVkIHRvIHJld3JpdGUgdGhlIE1T
VE0gY29udHJvbCBiaXRzIHRvIGVuYWJsZSBNU1QqLworCXMzX2hhbmRsZV9tc3QoZGRldiwgZmFs
c2UpOworCiAJLyogRG8gZGV0ZWN0aW9uKi8KIAlkcm1fY29ubmVjdG9yX2xpc3RfaXRlcl9iZWdp
bihkZGV2LCAmaXRlcik7CiAJZHJtX2Zvcl9lYWNoX2Nvbm5lY3Rvcl9pdGVyKGNvbm5lY3Rvciwg
Jml0ZXIpIHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
