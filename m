Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D517B86559
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015B36E878;
	Thu,  8 Aug 2019 15:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702B26E86C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:12:10 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8592F28CAC1;
 Thu,  8 Aug 2019 16:12:08 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 15/19] drm/imx: pd: Use bus format/flags provided by the
 bridge when available
Date: Thu,  8 Aug 2019 17:11:46 +0200
Message-Id: <20190808151150.16336-16-boris.brezillon@collabora.com>
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

Tm93IHRoYXQgYnJpZGdlcyBjYW4gZXhwb3NlIHRoZSBidXMgZm9ybWF0L2ZsYWdzIHRoZXkgZXhw
ZWN0LCB3ZSBjYW4KdXNlIHRob3NlIGluc3RlYWQgb2YgdGhlIHJlbHlpbmcgb24gdGhlIGRpc3Bs
YXlfaW5mbyBwcm92aWRlZCBieSB0aGUKY29ubmVjdG9yICh3aGljaCBpcyBvbmx5IHZhbGlkIGlm
IHRoZSBlbmNvZGVyIGlzIGRpcmVjdGx5IGNvbm5lY3RlZAp0byBicmlkZ2UgZWxlbWVudCBkcml2
aW5nIHRoZSBwYW5lbC9kaXNwbGF5KS4KCldlIGFsc28gZXhwbGljaXRseSBleHBvc2UgdGhlIGJ1
cyBmb3JtYXRzIHN1cHBvcnRlZCBieSBvdXIgZW5jb2RlciBieQpmaWxsaW5nIGVuY29kZXItPm91
dHB1dF9idXNfY2FwcyB3aXRoIHByb3BlciBpbmZvLgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJl
emlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jIGIvZHJpdmVycy9n
cHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKaW5kZXggMzVmMjBlZGFiOWZkLi41N2ZlZTQ4
ZDZiYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jCkBAIC0xMTUsOCAr
MTE1LDE4IEBAIHN0YXRpYyBpbnQgaW14X3BkX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciwKIAlzdHJ1Y3QgaW14X2NydGNfc3RhdGUgKmlteF9jcnRjX3N0
YXRlID0gdG9faW14X2NydGNfc3RhdGUoY3J0Y19zdGF0ZSk7CiAJc3RydWN0IGRybV9kaXNwbGF5
X2luZm8gKmRpID0gJmNvbm5fc3RhdGUtPmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvOwogCXN0cnVj
dCBpbXhfcGFyYWxsZWxfZGlzcGxheSAqaW14cGQgPSBlbmNfdG9faW14cGQoZW5jb2Rlcik7CisJ
c3RydWN0IGRybV9icmlkZ2Vfc3RhdGUgKmJyaWRnZV9zdGF0ZSA9IE5VTEw7CisJc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZTsKIAotCWlmICghaW14cGQtPmJ1c19mb3JtYXQgJiYgZGktPm51bV9i
dXNfZm9ybWF0cykgeworCWJyaWRnZSA9IGRybV9icmlkZ2VfY2hhaW5fZ2V0X2ZpcnN0X2JyaWRn
ZShlbmNvZGVyKTsKKwlpZiAoYnJpZGdlKQorCQlicmlkZ2Vfc3RhdGUgPSBkcm1fYXRvbWljX2dl
dF9uZXdfYnJpZGdlX3N0YXRlKGNydGNfc3RhdGUtPnN0YXRlLAorCQkJCQkJCSAgICAgICBicmlk
Z2UpOworCisJaWYgKGJyaWRnZV9zdGF0ZSAmJiBicmlkZ2Vfc3RhdGUtPmlucHV0X2J1c19jZmcu
Zm10KSB7CisJCWlteF9jcnRjX3N0YXRlLT5idXNfZm9ybWF0ID0gYnJpZGdlX3N0YXRlLT5pbnB1
dF9idXNfY2ZnLmZtdDsKKwkJaW14X2NydGNfc3RhdGUtPmJ1c19mbGFncyA9IGJyaWRnZV9zdGF0
ZS0+aW5wdXRfYnVzX2NmZy5mbGFnczsKKwl9IGVsc2UgaWYgKCFpbXhwZC0+YnVzX2Zvcm1hdCAm
JiBkaS0+bnVtX2J1c19mb3JtYXRzKSB7CiAJCWlteF9jcnRjX3N0YXRlLT5idXNfZmxhZ3MgPSBk
aS0+YnVzX2ZsYWdzOwogCQlpbXhfY3J0Y19zdGF0ZS0+YnVzX2Zvcm1hdCA9IGRpLT5idXNfZm9y
bWF0c1swXTsKIAl9IGVsc2UgewpAQCAtMTUyLDEwICsxNjIsMTggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fZW5jb2Rlcl9oZWxwZXJfZnVuY3MgaW14X3BkX2VuY29kZXJfaGVscGVyX2Z1bmNz
ID0gewogCS5hdG9taWNfY2hlY2sgPSBpbXhfcGRfZW5jb2Rlcl9hdG9taWNfY2hlY2ssCiB9Owog
CitzdGF0aWMgY29uc3QgdTMyIGlteF9wZF9idXNfZm10c1tdID0geworCU1FRElBX0JVU19GTVRf
UkdCODg4XzFYMjQsCisJTUVESUFfQlVTX0ZNVF9SR0I1NjVfMVgxNiwKKwlNRURJQV9CVVNfRk1U
X1JHQjY2Nl8xWDE4LAorCU1FRElBX0JVU19GTVRfUkdCNjY2XzFYMjRfQ1BBREhJLAorfTsKKwog
c3RhdGljIGludCBpbXhfcGRfcmVnaXN0ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKIAlzdHJ1
Y3QgaW14X3BhcmFsbGVsX2Rpc3BsYXkgKmlteHBkKQogewogCXN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlciA9ICZpbXhwZC0+ZW5jb2RlcjsKKwlzdHJ1Y3QgZHJtX2J1c19jYXBzICpidXNfY2Fw
cyA9ICZlbmNvZGVyLT5vdXRwdXRfYnVzX2NhcHM7CiAJaW50IHJldDsKIAogCXJldCA9IGlteF9k
cm1fZW5jb2Rlcl9wYXJzZV9vZihkcm0sIGVuY29kZXIsIGlteHBkLT5kZXYtPm9mX25vZGUpOwpA
QCAtMTczLDYgKzE5MSwxNCBAQCBzdGF0aWMgaW50IGlteF9wZF9yZWdpc3RlcihzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLAogCWRybV9lbmNvZGVyX2luaXQoZHJtLCBlbmNvZGVyLCAmaW14X3BkX2Vu
Y29kZXJfZnVuY3MsCiAJCQkgRFJNX01PREVfRU5DT0RFUl9OT05FLCBOVUxMKTsKIAorCWlmIChp
bXhwZC0+YnVzX2Zvcm1hdCkgeworCQlidXNfY2Fwcy0+c3VwcG9ydGVkX2ZtdHMgPSAmaW14cGQt
PmJ1c19mb3JtYXQ7CisJCWJ1c19jYXBzLT5udW1fc3VwcG9ydGVkX2ZtdHMgPSAxOworCX0gZWxz
ZSB7CisJCWJ1c19jYXBzLT5zdXBwb3J0ZWRfZm10cyA9IGlteF9wZF9idXNfZm10czsKKwkJYnVz
X2NhcHMtPm51bV9zdXBwb3J0ZWRfZm10cyA9IEFSUkFZX1NJWkUoaW14X3BkX2J1c19mbXRzKTsK
Kwl9CisKIAlpZiAoIWlteHBkLT5icmlkZ2UpIHsKIAkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRk
KCZpbXhwZC0+Y29ubmVjdG9yLAogCQkJCSZpbXhfcGRfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
