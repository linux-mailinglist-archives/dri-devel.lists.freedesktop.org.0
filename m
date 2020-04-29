Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920F1BDCDA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 14:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697126EE60;
	Wed, 29 Apr 2020 12:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5C16EE7F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:57:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id D5C058014B;
 Wed, 29 Apr 2020 14:48:49 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Date: Wed, 29 Apr 2020 14:48:21 +0200
Message-Id: <20200429124830.27475-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429124830.27475-1-noralf@tronnes.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=AvXAIt1P c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=SJz97ENfAAAA:8 a=vKVk4XFhGoKKoRoBPQAA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgd2F5IHRvIGxvb2t1cCBhIGJhY2tsaWdodCBkZXZpY2UgYmFzZWQgb24gaXRzIG5hbWUu
CldpbGwgYmUgdXNlZCBieSBhIFVTQiBkaXNwbGF5IGdhZGdldCBnZXR0aW5nIHRoZSBuYW1lIGZy
b20gY29uZmlnZnMuCgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KQ2M6IERh
bmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CkNjOiBKaW5nb28gSGFu
IDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxu
b3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0
LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvYmFja2xpZ2h0Lmgg
ICAgICAgICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9iYWNrbGlnaHQuYwppbmRleCBjYWMzZTM1ZDc2MzAuLjkyZDgwYWEwYzBl
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMKKysrIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYmFja2xpZ2h0LmMKQEAgLTQzMiw2ICs0MzIsMjcgQEAg
c3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X3R5cGUoZW51
bSBiYWNrbGlnaHRfdHlwZSB0eXBlKQogfQogRVhQT1JUX1NZTUJPTChiYWNrbGlnaHRfZGV2aWNl
X2dldF9ieV90eXBlKTsKIAorLyoqCisgKiBiYWNrbGlnaHRfZGV2aWNlX2dldF9ieV9uYW1lIC0g
R2V0IGJhY2tsaWdodCBkZXZpY2UgYnkgbmFtZQorICogQG5hbWU6IERldmljZSBuYW1lCisgKgor
ICogVGhpcyBmdW5jdGlvbiBsb29rcyB1cCBhIGJhY2tsaWdodCBkZXZpY2UgYnkgaXRzIG5hbWUu
IEl0IG9idGFpbnMgYSByZWZlcmVuY2UKKyAqIG9uIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGFuZCBp
dCBpcyB0aGUgY2FsbGVyJ3MgcmVzcG9uc2liaWxpdHkgdG8gZHJvcCB0aGUKKyAqIHJlZmVyZW5j
ZSBieSBjYWxsaW5nIGJhY2tsaWdodF9wdXQoKS4KKyAqCisgKiBSZXR1cm5zOgorICogQSBwb2lu
dGVyIHRvIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGlmIGZvdW5kLCBvdGhlcndpc2UgTlVMTC4KKyAq
Lworc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X25hbWUo
Y29uc3QgY2hhciAqbmFtZSkKK3sKKwlzdHJ1Y3QgZGV2aWNlICpkZXY7CisKKwlkZXYgPSBjbGFz
c19maW5kX2RldmljZV9ieV9uYW1lKGJhY2tsaWdodF9jbGFzcywgbmFtZSk7CisKKwlyZXR1cm4g
ZGV2ID8gdG9fYmFja2xpZ2h0X2RldmljZShkZXYpIDogTlVMTDsKK30KK0VYUE9SVF9TWU1CT0wo
YmFja2xpZ2h0X2RldmljZV9nZXRfYnlfbmFtZSk7CisKIC8qKgogICogYmFja2xpZ2h0X2Rldmlj
ZV91bnJlZ2lzdGVyIC0gdW5yZWdpc3RlcnMgYSBiYWNrbGlnaHQgZGV2aWNlIG9iamVjdC4KICAq
IEBiZDogdGhlIGJhY2tsaWdodCBkZXZpY2Ugb2JqZWN0IHRvIGJlIHVucmVnaXN0ZXJlZCBhbmQg
ZnJlZWQuCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5oIGIvaW5jbHVkZS9s
aW51eC9iYWNrbGlnaHQuaAppbmRleCBjN2Q2YjJlOGMzYjUuLjU2ZTQ1ODBkNGY1NSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaAorKysgYi9pbmNsdWRlL2xpbnV4L2JhY2ts
aWdodC5oCkBAIC0xOTAsNiArMTkwLDcgQEAgZXh0ZXJuIHZvaWQgYmFja2xpZ2h0X2ZvcmNlX3Vw
ZGF0ZShzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmQsCiBleHRlcm4gaW50IGJhY2tsaWdodF9y
ZWdpc3Rlcl9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKTsKIGV4dGVybiBpbnQg
YmFja2xpZ2h0X3VucmVnaXN0ZXJfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYik7
CiBleHRlcm4gc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5
X3R5cGUoZW51bSBiYWNrbGlnaHRfdHlwZSB0eXBlKTsKK3N0cnVjdCBiYWNrbGlnaHRfZGV2aWNl
ICpiYWNrbGlnaHRfZGV2aWNlX2dldF9ieV9uYW1lKGNvbnN0IGNoYXIgKm5hbWUpOwogZXh0ZXJu
IGludCBiYWNrbGlnaHRfZGV2aWNlX3NldF9icmlnaHRuZXNzKHN0cnVjdCBiYWNrbGlnaHRfZGV2
aWNlICpiZCwgdW5zaWduZWQgbG9uZyBicmlnaHRuZXNzKTsKIAogI2RlZmluZSB0b19iYWNrbGln
aHRfZGV2aWNlKG9iaikgY29udGFpbmVyX29mKG9iaiwgc3RydWN0IGJhY2tsaWdodF9kZXZpY2Us
IGRldikKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
