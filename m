Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB07B4DDB9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 01:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA4C6E7EA;
	Thu, 20 Jun 2019 23:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334D96E580;
 Thu, 20 Jun 2019 23:21:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39B77780E6;
 Thu, 20 Jun 2019 23:21:53 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DF086090E;
 Thu, 20 Jun 2019 23:21:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Don't skip display settings in hwmgr_resume()
Date: Thu, 20 Jun 2019 19:21:26 -0400
Message-Id: <20190620232127.25436-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 20 Jun 2019 23:21:56 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoeSB0aGlzIGlzLCBidXQgZm9yIHNvbWUgcmVhc29uOgoK
OTIxOTM1ZGM2NDA0ICgiZHJtL2FtZC9wb3dlcnBsYXk6IGVuZm9yY2UgZGlzcGxheSByZWxhdGVk
IHNldHRpbmdzIG9ubHkgb24gbmVlZGVkIikKCkJyZWFrcyBydW50aW1lIFBNIHJlc3VtZSBvbiB0
aGUgUmFkZW9uIFBSTyBXWCAzMTAwIChMZXhhKSBpbiBvbmUgdGhlCnByZS1wcm9kdWN0aW9uIGxh
cHRvcHMgSSBoYXZlLiBUaGUgaXNzdWUgbWFuaWZlc3RzIGFzIHRoZSBmb2xsb3dpbmcKbWVzc2Fn
ZXMgaW4gZG1lc2c6CgpbZHJtXSBVVkQgYW5kIFVWRCBFTkMgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1
bGx5LgphbWRncHUgMDAwMDozYjowMC4wOiBbZHJtOmFtZGdwdV9yaW5nX3Rlc3RfaGVscGVyIFth
bWRncHVdXSAqRVJST1IqIHJpbmcgdmNlMSB0ZXN0IGZhaWxlZCAoLTExMCkKW2RybTphbWRncHVf
ZGV2aWNlX2lwX3Jlc3VtZV9waGFzZTIgW2FtZGdwdV1dICpFUlJPUiogcmVzdW1lIG9mIElQIGJs
b2NrIDx2Y2VfdjNfMD4gZmFpbGVkIC0xMTAKW2RybTphbWRncHVfZGV2aWNlX3Jlc3VtZSBbYW1k
Z3B1XV0gKkVSUk9SKiBhbWRncHVfZGV2aWNlX2lwX3Jlc3VtZSBmYWlsZWQgKC0xMTApLgoKQW5k
IGhhcHBlbnMgYWZ0ZXIgYWJvdXQgNi0xMCBydW50aW1lIFBNIHN1c3BlbmQvcmVzdW1lIGN5Y2xl
cyAoc29tZXRpbWVzCnNvb25lciwgaWYgeW91J3JlIGx1Y2t5ISkuIFVuZm9ydHVuYXRlbHkgSSBj
YW4ndCBzZWVtIHRvIHBpbiBkb3duCnByZWNpc2VseSB3aGljaCBwYXJ0IGluIHBzbV9hZGp1c3Rf
cG93ZXJfc3RhdGVfZHluYW1pYyB0aGF0IGlzIGNhdXNpbmcKdGhlIGlzc3VlLCBidXQgbm90IHNr
aXBwaW5nIHRoZSBkaXNwbGF5IHNldHRpbmcgc2V0dXAgc2VlbXMgdG8gZml4IGl0LgpIb3BlZnVs
bHkgaWYgdGhlcmUgaXMgYSBiZXR0ZXIgZml4IGZvciB0aGlzLCB0aGlzIHBhdGNoIHdpbGwgc3Bh
cmsKZGlzY3Vzc2lvbiBhcm91bmQgaXQuCgpGaXhlczogOTIxOTM1ZGM2NDA0ICgiZHJtL2FtZC9w
b3dlcnBsYXk6IGVuZm9yY2UgZGlzcGxheSByZWxhdGVkIHNldHRpbmdzIG9ubHkgb24gbmVlZGVk
IikKQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29t
PgpDYzogUmV4IFpodSA8UmV4LlpodUBhbWQuY29tPgpDYzogTGlrdW4gR2FvIDxMaWt1bi5HYW9A
YW1kLmNvbT4KQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIHY1LjErClNpZ25lZC1vZmYt
Ynk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9o
d21nci9od21nci5jCmluZGV4IDZjZDY0OTdjNmZjMi4uMGUxYjJkOTMwODE2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9od21nci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMKQEAgLTMyNSw3ICszMjUsNyBA
QCBpbnQgaHdtZ3JfcmVzdW1lKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJaWYgKHJldCkKIAkJ
cmV0dXJuIHJldDsKIAotCXJldCA9IHBzbV9hZGp1c3RfcG93ZXJfc3RhdGVfZHluYW1pYyhod21n
ciwgdHJ1ZSwgTlVMTCk7CisJcmV0ID0gcHNtX2FkanVzdF9wb3dlcl9zdGF0ZV9keW5hbWljKGh3
bWdyLCBmYWxzZSwgTlVMTCk7CiAKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
