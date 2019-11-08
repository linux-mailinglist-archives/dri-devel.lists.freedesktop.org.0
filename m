Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C9FF4607
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 12:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7467C6F94F;
	Fri,  8 Nov 2019 11:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5F16F94F;
 Fri,  8 Nov 2019 11:40:02 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AE39222C2;
 Fri,  8 Nov 2019 11:40:01 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 085/205] qxl: fix null-pointer crash during
 suspend
Date: Fri,  8 Nov 2019 06:35:52 -0500
Message-Id: <20191108113752.12502-85-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573213202;
 bh=i2tWQS8K0Ossgcc5vBYSM8RWjs14zDUfRjUMgb8DQSQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RI6D1H6WT2fLDZwloPGP2np3P381NSN9GYXoNXBGBIqQBf1FP83xmUZlJh26XbDGH
 XNGcMyCSHaOROvwMzT5GHM6XuMhwcxAFSV4R3iOLXhIFcCqn1kqBp7aNZVnKs9WzBf
 2cjQ7CknoIyUPYs/qNiQb0bVs9KJL6gXUCAOLY9w=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Peter Wu <peter@lekensteyn.nl>,
 spice-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXIgV3UgPHBldGVyQGxla2Vuc3RleW4ubmw+CgpbIFVwc3RyZWFtIGNvbW1pdCA3
OTQ4YTJiMTU4NzMzMTlkMWJmZjRkMzdjMDliOWYyYmY4N2I5MDIxIF0KCiJjcnRjLT5oZWxwZXJf
cHJpdmF0ZSIgaXMgbm90IGluaXRpYWxpemVkIGJ5IHRoZSBRWEwgZHJpdmVyIGFuZCB0aHVzIHRo
ZQoiY3J0Y19mdW5jcy0+ZGlzYWJsZSIgY2FsbCB3b3VsZCBjcmFzaCAocmVzdWx0aW5nIGluIHN1
c3BlbmQgZmFpbHVyZSkuCkZpeCB0aGlzIGJ5IGNvbnZlcnRpbmcgdGhlIHN1c3BlbmQvcmVzdW1l
IGZ1bmN0aW9ucyB0byB1c2UgdGhlCmRybV9tb2RlX2NvbmZpZ19oZWxwZXJfKiBoZWxwZXJzLgoK
VGVzdGVkIHN5c3RlbSBzbGVlcCB3aXRoIFFFTVUgMy4wIHVzaW5nICJlY2hvIG1lbSA+IC9zeXMv
cG93ZXIvc3RhdGUiLgpEdXJpbmcgc3VzcGVuZCB0aGUgZm9sbG93aW5nIG1lc3NhZ2UgaXMgdmlz
aWJsZSBmcm9tIFFFTVU6CgogICAgc3BpY2Uvc2VydmVyL2Rpc3BsYXktY2hhbm5lbC5jOjI0MjU6
ZGlzcGxheV9jaGFubmVsX3ZhbGlkYXRlX3N1cmZhY2U6IGNhbnZhcyBhZGRyZXNzIGlzIDB4N2Zk
MDVkYTY4MzA4IGZvciAwIChhbmQgaXMgTlVMTCkKICAgIHNwaWNlL3NlcnZlci9kaXNwbGF5LWNo
YW5uZWwuYzoyNDI2OmRpc3BsYXlfY2hhbm5lbF92YWxpZGF0ZV9zdXJmYWNlOiBmYWlsZWQgb24g
MAoKVGhpcyBzZWVtcyB0byBiZSB0cmlnZ2VyZWQgYnkgUVhMX0lPX05PVElGWV9DTUQgYWZ0ZXIK
UVhMX0lPX0RFU1RST1lfUFJJTUFSWV9BU1lOQywgYnV0IGFzaWRlIGZyb20gdGhlIHdhcm5pbmcg
dGhpbmdzIHN0aWxsCnNlZW0gdG8gd29yayAodGVzdGVkIHdpdGggYm90aCB0aGUgR1RLIGFuZCAt
c3BpY2Ugb3B0aW9ucykuCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBXdSA8cGV0ZXJAbGVrZW5zdGV5
bi5ubD4KTGluazogaHR0cDovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQv
MjAxODA5MDQyMDI3NDcuMTQ5NjgtMS1wZXRlckBsZWtlbnN0ZXluLm5sClNpZ25lZC1vZmYtYnk6
IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2
LmMgfCAyNiArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3F4bC9xeGxfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwppbmRleCAyNDQ1
ZTc1Y2Y3ZWE2Li5kMDBmNDVlZWQwM2NhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwpAQCAtMTM2LDIw
ICsxMzYsMTEgQEAgc3RhdGljIGludCBxeGxfZHJtX2ZyZWV6ZShzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQogewogCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gZGV2LT5wZGV2OwogCXN0cnVjdCBxeGxf
ZGV2aWNlICpxZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKLQlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7
Ci0KLQlkcm1fa21zX2hlbHBlcl9wb2xsX2Rpc2FibGUoZGV2KTsKLQotCWNvbnNvbGVfbG9jaygp
OwotCXF4bF9mYmRldl9zZXRfc3VzcGVuZChxZGV2LCAxKTsKLQljb25zb2xlX3VubG9jaygpOwor
CWludCByZXQ7CiAKLQkvKiB1bnBpbiB0aGUgZnJvbnQgYnVmZmVycyAqLwotCWxpc3RfZm9yX2Vh
Y2hfZW50cnkoY3J0YywgJmRldi0+bW9kZV9jb25maWcuY3J0Y19saXN0LCBoZWFkKSB7Ci0JCWNv
bnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3MgKmNydGNfZnVuY3MgPSBjcnRjLT5oZWxw
ZXJfcHJpdmF0ZTsKLQkJaWYgKGNydGMtPmVuYWJsZWQpCi0JCQkoKmNydGNfZnVuY3MtPmRpc2Fi
bGUpKGNydGMpOwotCX0KKwlyZXQgPSBkcm1fbW9kZV9jb25maWdfaGVscGVyX3N1c3BlbmQoZGV2
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJcXhsX2Rlc3Ryb3lfbW9uaXRvcnNfb2Jq
ZWN0KHFkZXYpOwogCXF4bF9zdXJmX2V2aWN0KHFkZXYpOwpAQCAtMTc1LDE0ICsxNjYsNyBAQCBz
dGF0aWMgaW50IHF4bF9kcm1fcmVzdW1lKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgdGhh
dykKIAl9CiAKIAlxeGxfY3JlYXRlX21vbml0b3JzX29iamVjdChxZGV2KTsKLQlkcm1faGVscGVy
X3Jlc3VtZV9mb3JjZV9tb2RlKGRldik7Ci0KLQljb25zb2xlX2xvY2soKTsKLQlxeGxfZmJkZXZf
c2V0X3N1c3BlbmQocWRldiwgMCk7Ci0JY29uc29sZV91bmxvY2soKTsKLQotCWRybV9rbXNfaGVs
cGVyX3BvbGxfZW5hYmxlKGRldik7Ci0JcmV0dXJuIDA7CisJcmV0dXJuIGRybV9tb2RlX2NvbmZp
Z19oZWxwZXJfcmVzdW1lKGRldik7CiB9CiAKIHN0YXRpYyBpbnQgcXhsX3BtX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
