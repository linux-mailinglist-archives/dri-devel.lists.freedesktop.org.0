Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D782EFC4CC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 11:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346956E79D;
	Thu, 14 Nov 2019 10:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55E36E799
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 10:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id CC5CD3FA1F;
 Thu, 14 Nov 2019 11:56:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pc-MRjIjOWwU; Thu, 14 Nov 2019 11:56:55 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4E4BA3F595;
 Thu, 14 Nov 2019 11:56:55 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id DF6FB360325;
 Thu, 14 Nov 2019 11:56:54 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org,
	linux-graphics-maintainer@vmware.com
Subject: [PATCH 3/3] drm/vmwgfx: Use coherent memory if there are dma mapping
 size restrictions
Date: Thu, 14 Nov 2019 11:56:45 +0100
Message-Id: <20191114105645.41578-4-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114105645.41578-1-thomas_os@shipmail.org>
References: <20191114105645.41578-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573729014; bh=LcwhsjSfgvPwEPybg1KKTl1EgtxPXk4KU0Jzzmk4BQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgwKbyVKry+j+0FsJxewd5leqwZBzhomk0g7CNu+KpqOtxW3RUUnoBS1XzKwRBvti
 H9HYILLNcJCrKIscAzL+grqkK3o7FmRbCkQY+xHr9HvOCCWEW8hp9e+LQvR6oOMffe
 FHrxxNfaXtKKZtFFyAgyZvA0b6PiJezZMCeNZfL4=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=IgwKbyVK; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: Christoph Hellwig <hch@infradead.org>,
 Thomas Hellstrom <thellstrom@vmware.com>, Brian Paul <brianp@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKV2UncmUgZ3Jh
ZHVhbGx5IG1vdmluZyB0b3dhcmRzIHVzaW5nIERNQSBjb2hlcmVudCBtZW1vcnkgaW4gbW9zdApz
aXR1YXRpb25zLCBhbHRob3VnaCBUVE0gaW50ZXJhY3Rpb25zIHdpdGggdGhlIERNQSBsYXllcnMg
aXMgc3RpbGwgYQp3b3JrLWluLXByb2dyZXNzLiBNZWFud2hpbGUsIHVzZSBjb2hlcmVudCBtZW1v
cnkgd2hlbiB0aGVyZSBhcmUgc2l6ZQpyZXN0cmljdGlvbnMgbWVhbmluZyB0aGF0IHRoZXJlIGlz
IGEgY2hhbmNlIHRoYXQgc3RyZWFtaW5nIGRtYSBtYXBwaW5nCm9mIGxhcmdlIGJ1ZmZlciBvYmpl
Y3RzIG1heSBmYWlsLgoKQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4K
U2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpS
ZXZpZXdlZC1ieTogQnJpYW4gUGF1bCA8YnJpYW5wQHZtd2FyZS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCAyMCArKysrKysrKysrKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9kcnYuYwppbmRleCA4ZDQ3OWE0MTFjZGQuLjI0ZjhkODhkNGIyOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKQEAgLTU2NSw3ICs1NjUsMTUgQEAgc3RhdGlj
IGludCB2bXdfZG1hX3NlbGVjdF9tb2RlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpCiAJ
CVt2bXdfZG1hX21hcF9wb3B1bGF0ZV0gPSAiQ2FjaGluZyBETUEgbWFwcGluZ3MuIiwKIAkJW3Zt
d19kbWFfbWFwX2JpbmRdID0gIkdpdmluZyB1cCBETUEgbWFwcGluZ3MgZWFybHkuIn07CiAKLQlp
ZiAodm13X2ZvcmNlX2NvaGVyZW50KQorCS8qCisJICogZG1hX21heF9tYXBwaW5nX3NpemUoKSAh
PSBTSVpFX01BWCBtZWFucyBzb21ldGhpbmcgaXMgZ29pbmcKKwkgKiBvbiBpbiB0aGUgZG1hIGxh
eWVyIHRoYXQgdGhlIGRtYV9tYXBfYmluZCBvciBkbWFfbWFwX3BvcHVsYXRlIG1vZGVzCisJICog
YXJlIG5vdCB3b3JraW5nIHdlbGwgd2l0aCwgb3IgaGF2ZW4ndCBiZWVuIHRlc3RlZCB3aXRoLgor
CSAqIFRoaXMgdHlwaWNhbGx5IGhhcHBlbnMgd2hlbiB0aGUgU1dJT1RMQiBpcyBhY3RpdmUuIEZh
bGwgYmFjayB0bworCSAqIGNvaGVyZW50IG1lbW9yeSBpbiB0aG9zZSBjYXNlcy4KKwkgKi8KKwlp
ZiAoZG1hX21heF9tYXBwaW5nX3NpemUoZGV2X3ByaXYtPmRldi0+ZGV2KSAhPSBTSVpFX01BWCB8
fAorCSAgICB2bXdfZm9yY2VfY29oZXJlbnQpCiAJCWRldl9wcml2LT5tYXBfbW9kZSA9IHZtd19k
bWFfYWxsb2NfY29oZXJlbnQ7CiAJZWxzZSBpZiAodm13X3Jlc3RyaWN0X2lvbW11KQogCQlkZXZf
cHJpdi0+bWFwX21vZGUgPSB2bXdfZG1hX21hcF9iaW5kOwpAQCAtNjY4LDEwICs2NzYsOCBAQCBz
dGF0aWMgaW50IHZtd19kcml2ZXJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25l
ZCBsb25nIGNoaXBzZXQpCiAJCWRldl9wcml2LT5jYXBhYmlsaXRpZXMyID0gdm13X3JlYWQoZGV2
X3ByaXYsIFNWR0FfUkVHX0NBUDIpOwogCX0KIAotCi0JcmV0ID0gdm13X2RtYV9zZWxlY3RfbW9k
ZShkZXZfcHJpdik7Ci0JaWYgKHVubGlrZWx5KHJldCAhPSAwKSkgewotCQlEUk1fSU5GTygiUmVz
dHJpY3RpbmcgY2FwYWJpbGl0aWVzIGR1ZSB0byBJT01NVSBzZXR1cC5cbiIpOworCWlmICh2bXdf
ZG1hX21hc2tzKGRldl9wcml2KSB8fCB2bXdfZG1hX3NlbGVjdF9tb2RlKGRldl9wcml2KSkgewor
CQlEUk1fV0FSTigiUmVmdXNpbmcgRE1BIGR1ZSB0byBsYWNrIG9mIERNQSBzdXBwb3J0LiIpOwog
CQlyZWZ1c2VfZG1hID0gdHJ1ZTsKIAl9CiAKQEAgLTc0MCwxMCArNzQ2LDYgQEAgc3RhdGljIGlu
dCB2bXdfZHJpdmVyX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBj
aGlwc2V0KQogCWlmIChkZXZfcHJpdi0+Y2FwYWJpbGl0aWVzICYgU1ZHQV9DQVBfQ0FQMl9SRUdJ
U1RFUikKIAkJdm13X3ByaW50X2NhcGFiaWxpdGllczIoZGV2X3ByaXYtPmNhcGFiaWxpdGllczIp
OwogCi0JcmV0ID0gdm13X2RtYV9tYXNrcyhkZXZfcHJpdik7Ci0JaWYgKHVubGlrZWx5KHJldCAh
PSAwKSkKLQkJZ290byBvdXRfZXJyMDsKLQogCWRtYV9zZXRfbWF4X3NlZ19zaXplKGRldi0+ZGV2
LCBtaW5fdCh1bnNpZ25lZCBpbnQsIFUzMl9NQVggJiBQQUdFX01BU0ssCiAJCQkJCSAgICAgU0NB
VFRFUkxJU1RfTUFYX1NFR01FTlQpKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
