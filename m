Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B69C6684
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 02:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9880610E318;
	Wed, 13 Nov 2024 01:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="EU8hazD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id B26AD10E318
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 01:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=fZZMT+/Mq1IzQAs8XttbFYcD4jt6sLWoadgWnzFFMgI=; b=E
 U8hazD+bQ+l5AfskLn/jugyDjzXaPEQ4avhYDLxkgiJ4l7Xpze87V0YMGaDtzJnA
 PrQKW6fa1oNO5SAna9Xmqk/W4HcXzecT6w4NQTfrZGM6xpX9ijKVnRxznzmLX29/
 y2zXOcLr9m5H5FHalDHS5VDn1JIDQAkZIhWXV2zB50=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Wed, 13 Nov 2024 09:16:49 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 13 Nov 2024 09:16:49 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: quentin.schulz@theobroma-systems.com, hjc@rock-chips.com, 
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Heiko Stuebner" <heiko.stuebner@cherry.de>, 
 sebastian.reichel@collabora.com
Subject: Re:[PATCH 1/2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240425195506.2935955-2-heiko@sntech.de>
References: <20240425195506.2935955-1-heiko@sntech.de>
 <20240425195506.2935955-2-heiko@sntech.de>
X-NTES-SC: AL_Qu2YA/idv04r7ySbY+kZnEobh+Y5UcK2s/ki2YFXN5k0mCTmyg4+bG5cLH7q9fmiKiCmoQmLURl14P5jTa5KbpiYvcCAmhgeX8QvpwslBgwR
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4cbc446f.f07.193231835a1.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gSgvCgDHTywB_jNnjV0lAA--.56349W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMx2WXmcz+UKPeAACs8
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CisgU2ViYXN0aW5hLApIaSBTZWJhc3RpYW4sICBJIHRoaW5rIHlvdSBhbHNvIG5lZWQgdGhpcyBw
YXRjaCB3aGVuIHlvdSB0ZXN0IERTSSBvbiByazM1ODggd2l0aCAgRFNJMiBzdXBwb3J0IHBhdGNo
IGZyb20gSGVpa28uCgpBdCAyMDI0LTA0LTI2IDAzOjU1OjA1LCAiSGVpa28gU3R1ZWJuZXIiIDxo
ZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+RnJvbTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVi
bmVyQGNoZXJyeS5kZT4KPgo+VGhlIGNsb2NrIGlzIGluIEh6IHdoaWxlIHRoZSB2YWx1ZSBjaGVj
a2VkIGFnYWluc3QgaXMgaW4ga0h6LCBzbwo+YWN0dWFsIGZyZXF1ZW5jaWVzIHdpbGwgbmV2ZXIg
YmUgYWJsZSB0byBiZSBiZWxvdyB0byBtYXggdmFsdWUuCj5GaXggdGhpcyBieSBzcGVjaWZ5aW5n
IHRoZSBtYXgtdmFsdWUgaW4gSHogdG9vLgo+Cj5GaXhlczogNWEwMjhlOGYwNjJmICgiZHJtL3Jv
Y2tjaGlwOiB2b3AyOiBBZGQgc3VwcG9ydCBmb3IgcmszNTg4IikKPlNpZ25lZC1vZmYtYnk6IEhl
aWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckBjaGVycnkuZGU+Cj4tLS0KPiBkcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyB8IDQgKystLQo+IDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5pbmRleCA5YmVlMWZkODhlNmEyLi41MjM4
ODBhNGU4ZTc0IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlw
X2RybV92b3AyLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
dm9wMi5jCj5AQCAtMTcxOSw3ICsxNzE5LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgcmszNTg4
X2NhbGNfY3J1X2NmZyhzdHJ1Y3Qgdm9wMl92aWRlb19wb3J0ICp2cCwgaW50IGlkLAo+IAkJZWxz
ZQo+IAkJCWRjbGtfb3V0X3JhdGUgPSB2X3BpeGNsayA+PiAyOwo+IAo+LQkJZGNsa19yYXRlID0g
cmszNTg4X2NhbGNfZGNsayhkY2xrX291dF9yYXRlLCA2MDAwMDApOwo+KwkJZGNsa19yYXRlID0g
cmszNTg4X2NhbGNfZGNsayhkY2xrX291dF9yYXRlLCA2MDAwMDAwMDApOwo+IAkJaWYgKCFkY2xr
X3JhdGUpIHsKPiAJCQlkcm1fZXJyKHZvcDItPmRybSwgIkRQIGRjbGtfb3V0X3JhdGUgb3V0IG9m
IHJhbmdlLCBkY2xrX291dF9yYXRlOiAlbGQgS0haXG4iLAo+IAkJCQlkY2xrX291dF9yYXRlKTsK
PkBAIC0xNzM2LDcgKzE3MzYsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyByazM1ODhfY2FsY19j
cnVfY2ZnKHN0cnVjdCB2b3AyX3ZpZGVvX3BvcnQgKnZwLCBpbnQgaWQsCj4gCQkgKiBkY2xrX3Jh
dGUgPSBOICogZGNsa19jb3JlX3JhdGUgTiA9ICgxLDIsNCApLAo+IAkJICogd2UgZ2V0IGEgbGl0
dGxlIGZhY3RvciBoZXJlCj4gCQkgKi8KPi0JCWRjbGtfcmF0ZSA9IHJrMzU4OF9jYWxjX2RjbGso
ZGNsa19vdXRfcmF0ZSwgNjAwMDAwKTsKPisJCWRjbGtfcmF0ZSA9IHJrMzU4OF9jYWxjX2RjbGso
ZGNsa19vdXRfcmF0ZSwgNjAwMDAwMDAwKTsKPiAJCWlmICghZGNsa19yYXRlKSB7Cj4gCQkJZHJt
X2Vycih2b3AyLT5kcm0sICJNSVBJIGRjbGsgb3V0IG9mIHJhbmdlLCBkY2xrX291dF9yYXRlOiAl
bGQgS0haXG4iLAo+IAkJCQlkY2xrX291dF9yYXRlKTsKPi0tIAo+Mi4zOS4yCg==
