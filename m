Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51AB8E6F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055726E915;
	Thu, 15 Aug 2019 08:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146886E885;
 Thu, 15 Aug 2019 00:49:16 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id C4EEE3EA18;
 Thu, 15 Aug 2019 00:49:14 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH RFC 06/11] drm/bridge: analogix-anx78xx: add support for
 avdd33 regulator
Date: Wed, 14 Aug 2019 20:48:49 -0400
Message-Id: <20190815004854.19860-7-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830155;
 bh=DC5vyeikJaV2JnfcQHCSqPpy7s9WUUfxIAq5L9wP3LQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vjNJnlZ8n/UZaPOd7acB6r2zozVALV/w0H9lqBa1P0XLgtR4Q+Zujaw5Hn7jkRNoj
 rUf/jsrnmCF2mU3kjVTQxl3A0854aZ0MRGCX0rhU1DmJPlLfoNHk+vAQZuFDBaXba3
 LXlEaTrh9oHiy/f6XnfwufapRSZ8iT+ztXoC6t2w=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIHRoZSBhdmRkMzMgcmVndWxhdG9yIHRvIHRoZSBhbmFsb2dpeC1hbng3
OHh4IGRyaXZlci4KTm90ZSB0aGF0IHRoZSByZWd1bGF0b3IgaXMgY3VycmVudGx5IGVuYWJsZWQg
ZHVyaW5nIGRyaXZlciBwcm9iZSBhbmQKZGlzYWJsZWQgd2hlbiB0aGUgZHJpdmVyIGlzIHJlbW92
ZWQuIFRoaXMgaXMgY3VycmVudGx5IGhvdyB0aGUKZG93bnN0cmVhbSBNU00ga2VybmVsIHNvdXJj
ZXMgZG8gdGhpcy4KCkxldCdzIG5vdCBtZXJnZSB0aGlzIHVwc3RyZWFtIGZvciB0aGUgbWVhbiB0
aW1lIHVudGlsIEkgZ2V0IHRoZSBleHRlcm5hbApkaXNwbGF5IGZ1bGx5IHdvcmtpbmcgb24gdGhl
IE5leHVzIDUgYW5kIHRoZW4gSSBjYW4gc3VibWl0IHByb3BlcgpzdXBwb3J0IHRoZW4gdGhhdCBw
b3dlcnMgZG93biB0aGlzIHJlZ3VsYXRvciBpbiB0aGUgcG93ZXIgb2ZmIGZ1bmN0aW9uLgoKU2ln
bmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMgfCAzMyArKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCmluZGV4IDhkYWVlNmIxZmE4OC4uNDhhZGYw
MTA4MTZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4
eHguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwpAQCAt
NDgsNiArNDgsNyBAQCBzdGF0aWMgY29uc3QgdTggYW54Nzh4eF9pMmNfYWRkcmVzc2VzW10gPSB7
CiAKIHN0cnVjdCBhbng3OHh4X3BsYXRmb3JtX2RhdGEgewogCXN0cnVjdCByZWd1bGF0b3IgKmR2
ZGQxMDsKKwlzdHJ1Y3QgcmVndWxhdG9yICphdmRkMzM7CiAJc3RydWN0IGdwaW9fZGVzYyAqZ3Bp
b2RfaHBkOwogCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kX3BkOwogCXN0cnVjdCBncGlvX2Rlc2Mg
KmdwaW9kX3Jlc2V0OwpAQCAtNzA3LDEwICs3MDgsNDIgQEAgc3RhdGljIGludCBhbng3OHh4X3N0
YXJ0KHN0cnVjdCBhbng3OHh4ICphbng3OHh4KQogCXJldHVybiBlcnI7CiB9CiAKK3N0YXRpYyB2
b2lkIGFueDc4eHhfZGlzYWJsZV9yZWd1bGF0b3JfYWN0aW9uKHZvaWQgKl9kYXRhKQoreworCXN0
cnVjdCBhbng3OHh4X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0gX2RhdGE7CisKKwlyZWd1bGF0b3Jf
ZGlzYWJsZShwZGF0YS0+YXZkZDMzKTsKK30KKwogc3RhdGljIGludCBhbng3OHh4X2luaXRfcGRh
dGEoc3RydWN0IGFueDc4eHggKmFueDc4eHgpCiB7CiAJc3RydWN0IGFueDc4eHhfcGxhdGZvcm1f
ZGF0YSAqcGRhdGEgPSAmYW54Nzh4eC0+cGRhdGE7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJmFu
eDc4eHgtPmNsaWVudC0+ZGV2OworCWludCBlcnI7CisKKwkvKiAzLjNWIGRpZ2l0YWwgY29yZSBw
b3dlciByZWd1bGF0b3IgICovCisJcGRhdGEtPmF2ZGQzMyA9IGRldm1fcmVndWxhdG9yX2dldChk
ZXYsICJhdmRkMzMiKTsKKwlpZiAoSVNfRVJSKHBkYXRhLT5hdmRkMzMpKSB7CisJCWVyciA9IFBU
Ul9FUlIocGRhdGEtPmF2ZGQzMyk7CisJCWlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikKKwkJCURS
TV9FUlJPUigiYXZkZDMzIHJlZ3VsYXRvciBub3QgZm91bmRcbiIpOworCisJCXJldHVybiBlcnI7
CisJfQorCisJZXJyID0gcmVndWxhdG9yX2VuYWJsZShwZGF0YS0+YXZkZDMzKTsKKwlpZiAoZXJy
KSB7CisJCURSTV9FUlJPUigiRmFpbGVkIHRvIGVuYWJsZSBhdmRkMzMgcmVndWxhdG9yOiAlZFxu
IiwgZXJyKTsKKwkJcmV0dXJuIGVycjsKKwl9CisKKwllcnIgPSBkZXZtX2FkZF9hY3Rpb24oZGV2
LCBhbng3OHh4X2Rpc2FibGVfcmVndWxhdG9yX2FjdGlvbiwKKwkJCSAgICAgIHBkYXRhKTsKKwlp
ZiAoZXJyIDwgMCkgeworCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBzZXR1cCByZWd1bGF0b3Ig
Y2xlYW51cCBhY3Rpb24gJWRcbiIsCisJCQllcnIpOworCQlyZXR1cm4gZXJyOworCX0KIAogCS8q
IDEuMFYgZGlnaXRhbCBjb3JlIHBvd2VyIHJlZ3VsYXRvciAgKi8KIAlwZGF0YS0+ZHZkZDEwID0g
ZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgImR2ZGQxMCIpOwotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
