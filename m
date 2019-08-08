Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C186552
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960986E865;
	Thu,  8 Aug 2019 15:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50206E871
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:12:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0E8A228CAC6;
 Thu,  8 Aug 2019 16:12:10 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 17/19] drm/bridge: lvds-encoder: Implement bus format
 negotiation for sn75lvds83
Date: Thu,  8 Aug 2019 17:11:48 +0200
Message-Id: <20190808151150.16336-18-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808151150.16336-1-boris.brezillon@collabora.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFNONzVMVkRTODMgYnJpZGdlIHN1cHBvcnQgc2V2ZXJhbCBpbnB1dCBmb3JtYXRzIGV4Y2Vw
dCB0aGUgaW5wdXQKZm9ybWF0IGlzIGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhlIGV4cGVjdGVkIG91
dHB1dCBmb3JtYXQuIExldCdzIGV4cHJlc3MKdGhhdCBjb25zdHJhaW50IGJ5IHNldHRpbmcgdGhl
IGJyaWRnZV9zdGF0ZS0+b3V0cHV0X2J1c19jZmcuZm10IGZpZWxkCnRvIHRoZSBhcHByb3ByaWF0
ZSB2YWx1ZS4KClRoZSBwcmV2aW91cyBlbGVtZW50IGluIHRoZSBjaGFpbiBtaWdodCBiZSBhYmxl
IHRvIHVzZSB0aGlzIGluZm9ybWF0aW9uCnRvIHBpY2sgdGhlIGFwcHJvcHJpYXRlIG91dHB1dCBi
dXMgZm9ybWF0LgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rl
ci5jIHwgNDggKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDgg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1l
bmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rlci5jCmluZGV4IGRh
NzAxM2M1ZmFmMS4uOGQzOTlkMTgyOGIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2x2ZHMtZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1lbmNv
ZGVyLmMKQEAgLTE1OSw5ICsxNTksNTcgQEAgc3RhdGljIGludCBsdmRzX2VuY29kZXJfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBp
bnQgc243NWx2ZHM4M19hdG9taWNfY2hlY2soc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKKwkJ
CQkgICBzdHJ1Y3QgZHJtX2JyaWRnZV9zdGF0ZSAqYnJpZGdlX3N0YXRlLAorCQkJCSAgIHN0cnVj
dCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKKwkJCQkgICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9zdGF0ZSAqY29ubl9zdGF0ZSkKK3sKKwlpbnQgcmV0OworCisJcmV0ID0gZHJtX2F0b21pY19i
cmlkZ2VfY2hvb3NlX291dHB1dF9idXNfY2ZnKGJyaWRnZV9zdGF0ZSwgY3J0Y19zdGF0ZSwKKwkJ
CQkJCSAgICAgIGNvbm5fc3RhdGUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwkvKgor
CSAqIFRoZSBvdXRwdXQgYnVzIGZvcm1hdCBoYXMgYSBkaXJlY3QgaW1wYWN0IG9uIHRoZSBleHBl
Y3RlZCBpbnB1dCBidXMKKwkgKiBmb3JtYXQuCisJICovCisJc3dpdGNoIChicmlkZ2Vfc3RhdGUt
Pm91dHB1dF9idXNfY2ZnLmZtdCkgeworCWNhc2UgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRf
SkVJREE6CisJY2FzZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDdYNF9TUFdHOgorCQkvKgorCQkg
KiBKRUlEQSBhbmQgU1BXRyB2YXJpYW50cyB0aGVvcmV0aWNhbGx5IHJlcXVpcmUgZGlmZmVyZW50
IHBpbgorCQkgKiBtYXBwaW5nLCBidXQgTUVESUFfQlVTX0ZNVF8gZGVmaW5pdGlvbnMgZG8gbm90
IGFsbG93CisJCSAqIGZpbmVkLWdyYWluZWQgcGluIHBsYWNlbWVudCBkZWZpbml0aW9uLCBhbmQg
dGhpcyBpcworCQkgKiBzb21ldGhpbmcgd2UgZXhwZWN0IHRvIGJlIHRha2VuIGNhcmUgb2YgYXQg
Ym9hcmQgZGVzaWduCisJCSAqIHRpbWUsIHNvIGxldCdzIGlnbm9yZSB0aGlzIGZvciBub3cuCisJ
CSAqIElmIGl0IGJlY29tZXMgYSBwcm9ibGVtLCB3ZSBjYW4gYWx3YXlzIGFkZCBhIHdheSB0byBv
dmVycmlkZQorCQkgKiB0aGUgYnVzIGZvcm1hdCB3aXRoIGEgRlcgcHJvcGVydHkuCisJCSAqLwor
CQlicmlkZ2Vfc3RhdGUtPmlucHV0X2J1c19jZmcuZm10ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhf
MVgyNDsKKwkJYnJlYWs7CisJY2FzZSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDdYM19TUFdHOgor
CQlicmlkZ2Vfc3RhdGUtPmlucHV0X2J1c19jZmcuZm10ID0gTUVESUFfQlVTX0ZNVF9SR0I2NjZf
MVgxODsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJYnJpZGdlX3N0YXRlLT5pbnB1dF9idXNfY2Zn
LmZtdCA9IDA7CisJCWJyZWFrOworCX0KKworCS8qIFByb3BhZ2F0ZSB0aGUgYnVzX2ZsYWdzLiAq
LworCWJyaWRnZV9zdGF0ZS0+aW5wdXRfYnVzX2NmZy5mbGFncyA9IGJyaWRnZV9zdGF0ZS0+b3V0
cHV0X2J1c19jZmcuZmxhZ3M7CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
bHZkc19lbmNvZGVyX29wcyBzbjc1bHZkczgzX29wcyA9IHsKKwkuYXRvbWljX2NoZWNrID0gc243
NWx2ZHM4M19hdG9taWNfY2hlY2ssCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBsdmRzX2VuY29kZXJfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gImx2ZHMtZW5j
b2RlciIgfSwKIAl7IC5jb21wYXRpYmxlID0gInRoaW5lLHRoYzYzbHZkbTgzZCIgfSwKKwl7IC5j
b21wYXRpYmxlID0gInRpLHNuNzVsdmRzODMiLCAuZGF0YSA9ICZzbjc1bHZkczgzX29wcyB9LAog
CXt9LAogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGx2ZHNfZW5jb2Rlcl9tYXRjaCk7Ci0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
