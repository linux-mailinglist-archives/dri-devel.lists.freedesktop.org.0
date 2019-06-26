Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DD55FD2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB256E272;
	Wed, 26 Jun 2019 03:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A485F6E271
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:43:54 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-98.mobile.att.net
 [107.77.172.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 997E3214DA;
 Wed, 26 Jun 2019 03:43:53 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/34] drm/mediatek: unbind components in
 mtk_drm_unbind()
Date: Tue, 25 Jun 2019 23:43:10 -0400
Message-Id: <20190626034335.23767-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034335.23767-1-sashal@kernel.org>
References: <20190626034335.23767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520634;
 bh=69JBGRVZZebGFp3cKz817XpiF0fevRucteMGEfPlY0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b396NENMU9PnPwl0m579tc7BpXGyS1hwh5+A9Vvx2+DxXIV25M8uzpR4GOJV3BJUg
 mXdRPVA/S66JRuG/zgVNqSIQTlLZ31K9I8+2rNFvILWwz6FFkNkNh6EiRXpglfagzg
 3hc/hMJE4aCXMnyRDHRBCvUPRGe1jTY/rP2UNha8=
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
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgoKWyBVcHN0cmVhbSBjb21t
aXQgZjBmZDg0ODM0MjgwMmJjMGY3NDYyMGQzODdlZWFkNTNlODkwNTgwNCBdCgpVbmJpbmRpbmcg
Y29tcG9uZW50cyAoaS5lLiBtdGtfZHNpIGFuZCBtdGtfZGlzcF9vdmwvcmRtYS9jb2xvcikgd2ls
bAp0cmlnZ2VyIG1hc3RlcihtdGtfZHJtKSdzIC51bmJpbmQoKSwgYW5kIGN1cnJlbnRseSBtdGtf
ZHJtJ3MgdW5iaW5kCndvbid0IGFjdHVhbGx5IHVuYmluZCBjb21wb25lbnRzLiBEdXJpbmcgdGhl
IG5leHQgYmluZCwKbXRrX2RybV9rbXNfaW5pdCgpIGlzIGNhbGxlZCwgYW5kIHRoZSBjb21wb25l
bnRzIGFyZSBhZGRlZCBiYWNrLgoKLnVuYmluZCgpIHNob3VsZCBjYWxsIG10a19kcm1fa21zX2Rl
aW5pdCgpIHRvIHVuYmluZCBjb21wb25lbnRzLgoKQW5kIHNpbmNlIGNvbXBvbmVudF9tYXN0ZXJf
ZGVsKCkgaW4gLnJlbW92ZSgpIHdpbGwgdHJpZ2dlciAudW5iaW5kKCksCndoaWNoIHdpbGwgYWxz
byB1bnJlZ2lzdGVyIGRldmljZSwgaXQncyBmaW5lIHRvIHJlbW92ZSBvcmlnaW5hbCBmdW5jdGlv
bnMKY2FsbGVkIGhlcmUuCgpGaXhlczogMTE5ZjUxNzM2MjhhICgiZHJtL21lZGlhdGVrOiBBZGQg
RFJNIERyaXZlciBmb3IgTWVkaWF0ZWsgU29DIE1UODE3My4iKQpTaWduZWQtb2ZmLWJ5OiBIc2lu
LVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVs
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDYgKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwppbmRleCA0N2VjNjA0Mjg5YjcuLmJiZTU3
YWQ5YWNmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKQEAgLTM5MCw2
ICszOTAsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
OwogCiAJZHJtX2Rldl91bnJlZ2lzdGVyKHByaXZhdGUtPmRybSk7CisJbXRrX2RybV9rbXNfZGVp
bml0KHByaXZhdGUtPmRybSk7CiAJZHJtX2Rldl9wdXQocHJpdmF0ZS0+ZHJtKTsKIAlwcml2YXRl
LT5kcm0gPSBOVUxMOwogfQpAQCAtNTU5LDEzICs1NjAsOCBAQCBzdGF0aWMgaW50IG10a19kcm1f
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHN0YXRpYyBpbnQgbXRrX2RybV9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbXRrX2RybV9w
cml2YXRlICpwcml2YXRlID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Ci0Jc3RydWN0IGRy
bV9kZXZpY2UgKmRybSA9IHByaXZhdGUtPmRybTsKIAlpbnQgaTsKIAotCWRybV9kZXZfdW5yZWdp
c3Rlcihkcm0pOwotCW10a19kcm1fa21zX2RlaW5pdChkcm0pOwotCWRybV9kZXZfcHV0KGRybSk7
Ci0KIAljb21wb25lbnRfbWFzdGVyX2RlbCgmcGRldi0+ZGV2LCAmbXRrX2RybV9vcHMpOwogCXBt
X3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKIAlvZl9ub2RlX3B1dChwcml2YXRlLT5tdXRl
eF9ub2RlKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
