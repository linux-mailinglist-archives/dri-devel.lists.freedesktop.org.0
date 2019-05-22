Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619026AE7
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 21:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733BB89B62;
	Wed, 22 May 2019 19:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAF289B4D;
 Wed, 22 May 2019 19:22:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 267E420644;
 Wed, 22 May 2019 19:22:24 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 043/375] drm/nouveau/bar/nv50: ensure BAR is mapped
Date: Wed, 22 May 2019 15:15:43 -0400
Message-Id: <20190522192115.22666-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522192115.22666-1-sashal@kernel.org>
References: <20190522192115.22666-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558552944;
 bh=t5xengB7nNuo2KSH7Jj1ZxDwNMwXO7ggXnUm8qMUaWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P86AuJrAyjGNPkCOo5wvqwhZCddKJtLeF3xXWVWnTsWZlQGkuIJM2xcZVJUsdiiGL
 /N2gIyqbGJuLCMxAs1JvixgpszUZIPMNWXPUFPofQbtQ45s3779XRFrxFWoR1tZ7H/
 5KdmBoKt3JXwoygfa0Fqxo+ZFFv8FqV6tJnWnY7A=
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Jon Derrick <jonathan.derrick@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9uIERlcnJpY2sgPGpvbmF0aGFuLmRlcnJpY2tAaW50ZWwuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgZjEwYjgzZGUxZmQ0OTIxNmE0YzY1NzgxNmY0ODAwMTQzN2U0YmRkNSBdCgpJZiB0
aGUgQkFSIGlzIHplcm8gc2l6ZSwgaXQgaW5kaWNhdGVzIGl0IHdhcyBuZXZlciBzdWNjZXNzZnVs
bHkgbWFwcGVkLgpFbnN1cmUgdGhhdCB0aGUgQkFSIGlzIHZhbGlkIGR1cmluZyBpbml0aWFsaXph
dGlvbiBiZWZvcmUgYXR0ZW1wdGluZyB0bwp1c2UgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKb24gRGVy
cmljayA8am9uYXRoYW4uZGVycmlja0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbiBTa2Vn
Z3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jh
ci9udjUwLmMgfCAxMiArKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvYmFyL252NTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L2Jhci9udjUwLmMKaW5kZXggMTU3YjA3NmExMjcyMy4uMzhjOWMwODY3NTRiNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmFyL252NTAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iYXIvbnY1MC5jCkBAIC0xMDks
NyArMTA5LDcgQEAgbnY1MF9iYXJfb25laW5pdChzdHJ1Y3QgbnZrbV9iYXIgKmJhc2UpCiAJc3Ry
dWN0IG52a21fZGV2aWNlICpkZXZpY2UgPSBiYXItPmJhc2Uuc3ViZGV2LmRldmljZTsKIAlzdGF0
aWMgc3RydWN0IGxvY2tfY2xhc3Nfa2V5IGJhcjFfbG9jazsKIAlzdGF0aWMgc3RydWN0IGxvY2tf
Y2xhc3Nfa2V5IGJhcjJfbG9jazsKLQl1NjQgc3RhcnQsIGxpbWl0OworCXU2NCBzdGFydCwgbGlt
aXQsIHNpemU7CiAJaW50IHJldDsKIAogCXJldCA9IG52a21fZ3B1b2JqX25ldyhkZXZpY2UsIDB4
MjAwMDAsIDAsIGZhbHNlLCBOVUxMLCAmYmFyLT5tZW0pOwpAQCAtMTI3LDcgKzEyNywxMCBAQCBu
djUwX2Jhcl9vbmVpbml0KHN0cnVjdCBudmttX2JhciAqYmFzZSkKIAogCS8qIEJBUjIgKi8KIAlz
dGFydCA9IDB4MDEwMDAwMDAwMFVMTDsKLQlsaW1pdCA9IHN0YXJ0ICsgZGV2aWNlLT5mdW5jLT5y
ZXNvdXJjZV9zaXplKGRldmljZSwgMyk7CisJc2l6ZSA9IGRldmljZS0+ZnVuYy0+cmVzb3VyY2Vf
c2l6ZShkZXZpY2UsIDMpOworCWlmICghc2l6ZSkKKwkJcmV0dXJuIC1FTk9NRU07CisJbGltaXQg
PSBzdGFydCArIHNpemU7CiAKIAlyZXQgPSBudmttX3ZtbV9uZXcoZGV2aWNlLCBzdGFydCwgbGlt
aXQtLSAtIHN0YXJ0LCBOVUxMLCAwLAogCQkJICAgJmJhcjJfbG9jaywgImJhcjIiLCAmYmFyLT5i
YXIyX3ZtbSk7CkBAIC0xNjQsNyArMTY3LDEwIEBAIG52NTBfYmFyX29uZWluaXQoc3RydWN0IG52
a21fYmFyICpiYXNlKQogCiAJLyogQkFSMSAqLwogCXN0YXJ0ID0gMHgwMDAwMDAwMDAwVUxMOwot
CWxpbWl0ID0gc3RhcnQgKyBkZXZpY2UtPmZ1bmMtPnJlc291cmNlX3NpemUoZGV2aWNlLCAxKTsK
KwlzaXplID0gZGV2aWNlLT5mdW5jLT5yZXNvdXJjZV9zaXplKGRldmljZSwgMSk7CisJaWYgKCFz
aXplKQorCQlyZXR1cm4gLUVOT01FTTsKKwlsaW1pdCA9IHN0YXJ0ICsgc2l6ZTsKIAogCXJldCA9
IG52a21fdm1tX25ldyhkZXZpY2UsIHN0YXJ0LCBsaW1pdC0tIC0gc3RhcnQsIE5VTEwsIDAsCiAJ
CQkgICAmYmFyMV9sb2NrLCAiYmFyMSIsICZiYXItPmJhcjFfdm1tKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
