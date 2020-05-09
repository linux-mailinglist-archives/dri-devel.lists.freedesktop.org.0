Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977641CC218
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 16:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1A46E34E;
	Sat,  9 May 2020 14:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AF86E354
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 14:16:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id E812F200AA;
 Sat,  9 May 2020 16:16:41 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 lee.jones@linaro.org
Subject: [PATCH v2 01/10] backlight: Add backlight_device_get_by_name()
Date: Sat,  9 May 2020 16:16:10 +0200
Message-Id: <20200509141619.32970-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200509141619.32970-1-noralf@tronnes.org>
References: <20200509141619.32970-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=R7It5+ZX c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=SJz97ENfAAAA:8 a=vKVk4XFhGoKKoRoBPQAA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: jingoohan1@gmail.com, daniel.thompson@linaro.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgd2F5IHRvIGxvb2t1cCBhIGJhY2tsaWdodCBkZXZpY2UgYmFzZWQgb24gaXRzIG5hbWUu
CldpbGwgYmUgdXNlZCBieSBhIFVTQiBkaXNwbGF5IGdhZGdldCBnZXR0aW5nIHRoZSBuYW1lIGZy
b20gY29uZmlnZnMuCgpDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KQ2M6IERh
bmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CkNjOiBKaW5nb28gSGFu
IDxqaW5nb29oYW4xQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29u
QGxpbmFyby5vcmc+CkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpT
aWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBk
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9iYWNrbGlnaHQuYyB8IDIxICsrKysrKysrKysrKysrKysr
KysrKwogaW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaCAgICAgICAgICAgfCAgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdodC5j
CmluZGV4IGNhYzNlMzVkNzYzMC4uOTJkODBhYTBjMGVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9i
YWNrbGlnaHQuYwpAQCAtNDMyLDYgKzQzMiwyNyBAQCBzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAq
YmFja2xpZ2h0X2RldmljZV9nZXRfYnlfdHlwZShlbnVtIGJhY2tsaWdodF90eXBlIHR5cGUpCiB9
CiBFWFBPUlRfU1lNQk9MKGJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X3R5cGUpOwogCisvKioKKyAq
IGJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X25hbWUgLSBHZXQgYmFja2xpZ2h0IGRldmljZSBieSBu
YW1lCisgKiBAbmFtZTogRGV2aWNlIG5hbWUKKyAqCisgKiBUaGlzIGZ1bmN0aW9uIGxvb2tzIHVw
IGEgYmFja2xpZ2h0IGRldmljZSBieSBpdHMgbmFtZS4gSXQgb2J0YWlucyBhIHJlZmVyZW5jZQor
ICogb24gdGhlIGJhY2tsaWdodCBkZXZpY2UgYW5kIGl0IGlzIHRoZSBjYWxsZXIncyByZXNwb25z
aWJpbGl0eSB0byBkcm9wIHRoZQorICogcmVmZXJlbmNlIGJ5IGNhbGxpbmcgYmFja2xpZ2h0X3B1
dCgpLgorICoKKyAqIFJldHVybnM6CisgKiBBIHBvaW50ZXIgdG8gdGhlIGJhY2tsaWdodCBkZXZp
Y2UgaWYgZm91bmQsIG90aGVyd2lzZSBOVUxMLgorICovCitzdHJ1Y3QgYmFja2xpZ2h0X2Rldmlj
ZSAqYmFja2xpZ2h0X2RldmljZV9nZXRfYnlfbmFtZShjb25zdCBjaGFyICpuYW1lKQoreworCXN0
cnVjdCBkZXZpY2UgKmRldjsKKworCWRldiA9IGNsYXNzX2ZpbmRfZGV2aWNlX2J5X25hbWUoYmFj
a2xpZ2h0X2NsYXNzLCBuYW1lKTsKKworCXJldHVybiBkZXYgPyB0b19iYWNrbGlnaHRfZGV2aWNl
KGRldikgOiBOVUxMOworfQorRVhQT1JUX1NZTUJPTChiYWNrbGlnaHRfZGV2aWNlX2dldF9ieV9u
YW1lKTsKKwogLyoqCiAgKiBiYWNrbGlnaHRfZGV2aWNlX3VucmVnaXN0ZXIgLSB1bnJlZ2lzdGVy
cyBhIGJhY2tsaWdodCBkZXZpY2Ugb2JqZWN0LgogICogQGJkOiB0aGUgYmFja2xpZ2h0IGRldmlj
ZSBvYmplY3QgdG8gYmUgdW5yZWdpc3RlcmVkIGFuZCBmcmVlZC4KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvYmFja2xpZ2h0LmggYi9pbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5oCmluZGV4IGM3
ZDZiMmU4YzNiNS4uNTZlNDU4MGQ0ZjU1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2JhY2ts
aWdodC5oCisrKyBiL2luY2x1ZGUvbGludXgvYmFja2xpZ2h0LmgKQEAgLTE5MCw2ICsxOTAsNyBA
QCBleHRlcm4gdm9pZCBiYWNrbGlnaHRfZm9yY2VfdXBkYXRlKHN0cnVjdCBiYWNrbGlnaHRfZGV2
aWNlICpiZCwKIGV4dGVybiBpbnQgYmFja2xpZ2h0X3JlZ2lzdGVyX25vdGlmaWVyKHN0cnVjdCBu
b3RpZmllcl9ibG9jayAqbmIpOwogZXh0ZXJuIGludCBiYWNrbGlnaHRfdW5yZWdpc3Rlcl9ub3Rp
ZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKTsKIGV4dGVybiBzdHJ1Y3QgYmFja2xpZ2h0
X2RldmljZSAqYmFja2xpZ2h0X2RldmljZV9nZXRfYnlfdHlwZShlbnVtIGJhY2tsaWdodF90eXBl
IHR5cGUpOworc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5
X25hbWUoY29uc3QgY2hhciAqbmFtZSk7CiBleHRlcm4gaW50IGJhY2tsaWdodF9kZXZpY2Vfc2V0
X2JyaWdodG5lc3Moc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJkLCB1bnNpZ25lZCBsb25nIGJy
aWdodG5lc3MpOwogCiAjZGVmaW5lIHRvX2JhY2tsaWdodF9kZXZpY2Uob2JqKSBjb250YWluZXJf
b2Yob2JqLCBzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSwgZGV2KQotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
