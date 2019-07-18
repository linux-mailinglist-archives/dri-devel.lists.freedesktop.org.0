Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1838D6C48B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED396E2CD;
	Thu, 18 Jul 2019 01:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B1E6E2CD;
 Thu, 18 Jul 2019 01:45:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 384C05D674;
 Thu, 18 Jul 2019 01:45:23 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8547019D70;
 Thu, 18 Jul 2019 01:45:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 23/26] drm/amdgpu/dm: Resume short HPD IRQs before resuming
 MST topology
Date: Wed, 17 Jul 2019 21:42:46 -0400
Message-Id: <20190718014329.8107-24-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 18 Jul 2019 01:45:23 +0000 (UTC)
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
Cc: Anthony Koo <Anthony.Koo@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Harry Wentland <hwentlan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, David Francis <David.Francis@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Ugd2UncmUgZ29pbmcgdG8gYmUgcmVwcm9iaW5nIHRoZSBlbnRpcmUgdG9wb2xvZ3kgc3Rh
dGUgb24gcmVzdW1lCm5vdyB1c2luZyBzaWRlYmFuZCB0cmFuc2FjdGlvbnMsIHdlIG5lZWQgdG8g
ZW5zdXJlIHRoYXQgd2UgYWN0dWFsbHkgaGF2ZQpzaG9ydCBIUEQgaXJxcyBlbmFibGVkIGJlZm9y
ZSBjYWxsaW5nIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZSgpLgpTbywgZG8gdGhhdC4K
CkNjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+CkNjOiBJbXJlIERlYWsgPGltcmUu
ZGVha0BpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgpDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDBlZjQ5ZGIwZjA4
ZC4uZTMzZTA4MGNmMTZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTEwNDEsMTUgKzEwNDEsMTUgQEAgc3RhdGljIGludCBk
bV9yZXN1bWUodm9pZCAqaGFuZGxlKQogCS8qIHByb2dyYW0gSFBEIGZpbHRlciAqLwogCWRjX3Jl
c3VtZShkbS0+ZGMpOwogCi0JLyogT24gcmVzdW1lIHdlIG5lZWQgdG8gIHJld3JpdGUgdGhlIE1T
VE0gY29udHJvbCBiaXRzIHRvIGVuYW1ibGUgTVNUKi8KLQlzM19oYW5kbGVfbXN0KGRkZXYsIGZh
bHNlKTsKLQogCS8qCiAJICogZWFybHkgZW5hYmxlIEhQRCBSeCBJUlEsIHNob3VsZCBiZSBkb25l
IGJlZm9yZSBzZXQgbW9kZSBhcyBzaG9ydAogCSAqIHB1bHNlIGludGVycnVwdHMgYXJlIHVzZWQg
Zm9yIE1TVAogCSAqLwogCWFtZGdwdV9kbV9pcnFfcmVzdW1lX2Vhcmx5KGFkZXYpOwogCisJLyog
T24gcmVzdW1lIHdlIG5lZWQgdG8gIHJld3JpdGUgdGhlIE1TVE0gY29udHJvbCBiaXRzIHRvIGVu
YW1ibGUgTVNUKi8KKwlzM19oYW5kbGVfbXN0KGRkZXYsIGZhbHNlKTsKKwogCS8qIERvIGRldGVj
dGlvbiovCiAJZHJtX2Nvbm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZGRldiwgJml0ZXIpOwogCWRy
bV9mb3JfZWFjaF9jb25uZWN0b3JfaXRlcihjb25uZWN0b3IsICZpdGVyKSB7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
