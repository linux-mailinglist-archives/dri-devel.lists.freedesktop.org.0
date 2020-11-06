Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BC82AA15D
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 00:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9065F6EB56;
	Fri,  6 Nov 2020 23:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E82B6EB56
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 23:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604705431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ew4rIAC9gbf7d0rKjHF4qfpwnpt8uKp6YFkSycCbhTQ=;
 b=jKHBIs8H5ZyMKOL9LggYmFzjyUwlz4C1x41jx608hWW59FKwGfFSWXI4WzaaGQNzUV0xyV
 C25GOIT11Ji2DHFZ++XxVx+Bk+oaWQsqYv0RwL4lciqIRVf8skvXMd7f1ZRLLsLQRvQXhQ
 YQ5YvKmBp6OBMiBdiPbDOgRZxYZGZ04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-g3HBWZfpNrCTU2cWf8kZmg-1; Fri, 06 Nov 2020 18:30:27 -0500
X-MC-Unique: g3HBWZfpNrCTU2cWf8kZmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B2FD801F9A;
 Fri,  6 Nov 2020 23:30:26 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 065F462A15;
 Fri,  6 Nov 2020 23:30:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/nouveau/kms/nv50-: Fix clock checking algorithm in
 nv50_dp_mode_valid()
Date: Fri,  6 Nov 2020 18:30:15 -0500
Message-Id: <20201106233016.2481179-3-lyude@redhat.com>
In-Reply-To: <20201106233016.2481179-1-lyude@redhat.com>
References: <160459060724988@kroah.com>
 <20201106233016.2481179-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgSSB0aG91Z2h0IEkgaGFkIHRoaXMgY29ycmVjdCAoc2luY2UgaXQgYWN0dWFsbHkgZGlk
IHJlamVjdCBtb2RlcwpsaWtlIEkgZXhwZWN0ZWQgZHVyaW5nIHRlc3RpbmcpLCBWaWxsZSBTeXJq
YWxhIGZyb20gSW50ZWwgcG9pbnRlZCBvdXQKdGhhdCB0aGUgbG9naWMgaGVyZSBpc24ndCBjb3Jy
ZWN0LiBtYXhfY2xvY2sgcmVmZXJzIHRvIHRoZSBtYXggZGF0YSByYXRlCnN1cHBvcnRlZCBieSB0
aGUgRFAgZW5jb2Rlci4gU28sIGxpbWl0aW5nIGl0IHRvIHRoZSBvdXRwdXQgb2YgZHNfY2xvY2sg
KHdoaWNoCnJlZmVycyB0byB0aGUgbWF4aW11bSBkb3RjbG9jayBvZiB0aGUgZG93bnN0cmVhbSBE
UCBkZXZpY2UpIGRvZXNuJ3QgbWFrZSBhbnkKc2Vuc2UuIEFkZGl0aW9uYWxseSwgc2luY2Ugd2Un
cmUgdXNpbmcgdGhlIGNvbm5lY3RvcidzIGJwYyBhcyB0aGUgY2Fub25pY2FsIEJQQwp3ZSBzaG91
bGQgdXNlIHRoaXMgaW4gbW9kZV92YWxpZCB1bnRpbCB3ZSBzdXBwb3J0IGR5bmFtaWNhbGx5IHNl
dHRpbmcgdGhlIGJwcApiYXNlZCBvbiBiYW5kd2lkdGggY29uc3RyYWludHMuCgpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyMC1TZXB0ZW1iZXIvMjgw
Mjc2Lmh0bWwKCkZvciBtb3JlIGluZm8uCgpTbywgbGV0J3MgcmV3cml0ZSB0aGlzIHVzaW5nIFZp
bGxlJ3MgYWR2aWNlLgoKQ2hhbmdlcyBtYWRlIGZvciBzdGFibGUgYmFja3BvcnQ6CiogNS45IGRp
ZG4ndCB1c2UgZHJtX2RwX2Rvd25zdHJlYW1fbWF4X2RvdGNsb2NrKCkgeWV0LCBzbyByZW1vdmUg
dGhhdCAodGhlCiAgZml4IGlzIHN0aWxsIGltcG9ydGFudCByZWdhcmRsZXNzKQoKdjI6CiogVmls
bGUgcG9pbnRlZCBvdXQgSSBtaXhlZCB1cCB0aGUgZG90Y2xvY2sgYW5kIHRoZSBsaW5rIHJhdGUu
IFNvIGZpeCB0aGF0Li4uCiogLi4uYW5kIGFsc28gcmVuYW1lIGFsbCB0aGUgdmFyaWFibGVzIGlu
IHRoaXMgZnVuY3Rpb24gdG8gYmUgbW9yZSBhcHByb3ByaWF0ZWx5CiAgbGFiZWxlZCBzbyBJIHN0
b3AgbWl4aW5nIHRoZW0gdXAuCiogUmV1c2UgdGhlIGJwcCBmcm9tIHRoZSBjb25uZWN0b3IgZm9y
IG5vdyB1bnRpbCB3ZSBoYXZlIGR5bmFtaWMgYnBwIHNlbGVjdGlvbi4KKiBVc2UgdXNlIERJVl9S
T1VORF9VUCBmb3IgY2FsY3VsYXRpbmcgdGhlIG1vZGUgcmF0ZSBsaWtlIGk5MTUgZG9lcywgd2hp
Y2ggd2UKICBzaG91bGQgYWxzbyBoYXZlIGJlZW4gZG9pbmcgZnJvbSB0aGUgc3RhcnQKClNpZ25l
ZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkZpeGVzOiA0MDlkMzgxMzli
NDIgKCJkcm0vbm91dmVhdS9rbXMvbnY1MC06IFVzZSBkb3duc3RyZWFtIERQIGNsb2NrIGxpbWl0
cyBmb3IgbW9kZSB2YWxpZGF0aW9uIikKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzog
QmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBCZW4gU2tlZ2dz
IDxic2tlZ2dzQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9kcC5jIHwgMTIgKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHAuYwppbmRleCA0
MDY4M2UxMjQ0YzNmLi45YzA2ZDFjYzQzOTA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9kcC5jCkBAIC0xMTQsNyArMTE0LDggQEAgbnY1MF9kcF9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IsCiAJCSAgIHVuc2lnbmVkICpvdXRfY2xvY2spCiB7CiAJY29u
c3QgdW5zaWduZWQgbWluX2Nsb2NrID0gMjUwMDA7Ci0JdW5zaWduZWQgbWF4X2Nsb2NrLCBjbG9j
ayA9IG1vZGUtPmNsb2NrOworCXVuc2lnbmVkIGludCBtYXhfcmF0ZSwgbW9kZV9yYXRlLCBjbG9j
ayA9IG1vZGUtPmNsb2NrOworCWNvbnN0IHU4IGJwcCA9IGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZv
LmJwYyAqIDM7CiAKIAlpZiAobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSAm
JiAhb3V0cC0+Y2Fwcy5kcF9pbnRlcmxhY2UpCiAJCXJldHVybiBNT0RFX05PX0lOVEVSTEFDRTsK
QEAgLTEyMiwxMiArMTIzLDEzIEBAIG52NTBfZHBfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yLAogCWlmICgobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHXzNEX01B
U0spID09IERSTV9NT0RFX0ZMQUdfM0RfRlJBTUVfUEFDS0lORykKIAkJY2xvY2sgKj0gMjsKIAot
CW1heF9jbG9jayA9IG91dHAtPmRwLmxpbmtfbnIgKiBvdXRwLT5kcC5saW5rX2J3OwotCWNsb2Nr
ID0gbW9kZS0+Y2xvY2sgKiAoY29ubmVjdG9yLT5kaXNwbGF5X2luZm8uYnBjICogMykgLyAxMDsK
KwltYXhfcmF0ZSA9IG91dHAtPmRwLmxpbmtfbnIgKiBvdXRwLT5kcC5saW5rX2J3OworCW1vZGVf
cmF0ZSA9IERJVl9ST1VORF9VUChjbG9jayAqIGJwcCwgOCk7CisJaWYgKG1vZGVfcmF0ZSA+IG1h
eF9yYXRlKQorCQlyZXR1cm4gTU9ERV9DTE9DS19ISUdIOworCiAJaWYgKGNsb2NrIDwgbWluX2Ns
b2NrKQogCQlyZXR1cm4gTU9ERV9DTE9DS19MT1c7Ci0JaWYgKGNsb2NrID4gbWF4X2Nsb2NrKQot
CQlyZXR1cm4gTU9ERV9DTE9DS19ISUdIOwogCiAJaWYgKG91dF9jbG9jaykKIAkJKm91dF9jbG9j
ayA9IGNsb2NrOwotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
