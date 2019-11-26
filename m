Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0B109990
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 08:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08D36E21C;
	Tue, 26 Nov 2019 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E386E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 07:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05B8EB14E;
 Tue, 26 Nov 2019 07:25:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH 2/4] drm/mgag200: Store flags from PCI driver data in device
 structure
Date: Tue, 26 Nov 2019 08:25:43 +0100
Message-Id: <20191126072545.22663-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126072545.22663-1-tzimmermann@suse.de>
References: <20191126072545.22663-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZsYWdzIGZpZWxkIGluIHN0cnVjdCBtZ2FfZGV2aWNlIGhhcyBiZWVuIHVudXNlZCBzbyBm
YXIuIFdlIG5vdwp1c2UgaXQgdG8gc3RvcmUgZmxhZyBiaXRzIGZyb20gdGhlIFBDSSBkcml2ZXIu
CgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5oICB8IDggKysrKysrKysK
IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jIHwgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5o
CmluZGV4IDk3NjQwNDYzNDA5Mi4uNGI0ZjljZTc0YTg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfZHJ2LmgKQEAgLTE1MSw2ICsxNTEsNyBAQCBlbnVtIG1nYV90eXBlIHsKIH07CiAK
ICNkZWZpbmUgTUdBRzIwMF9UWVBFX01BU0sJKDB4MDAwMDAwZmYpCisjZGVmaW5lIE1HQUcyMDBf
RkxBR19NQVNLCSgweDAwZmZmZjAwKQogCiAjZGVmaW5lIElTX0cyMDBfU0UobWRldikgKG1kZXYt
PnR5cGUgPT0gRzIwMF9TRV9BIHx8IG1kZXYtPnR5cGUgPT0gRzIwMF9TRV9CKQogCkBAIC0xODgs
NiArMTg5LDEzIEBAIG1nYWcyMDBfdHlwZV9mcm9tX2RyaXZlcl9kYXRhKGtlcm5lbF91bG9uZ190
IGRyaXZlcl9kYXRhKQogewogCXJldHVybiAoZW51bSBtZ2FfdHlwZSkoZHJpdmVyX2RhdGEgJiBN
R0FHMjAwX1RZUEVfTUFTSyk7CiB9CisKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZworbWdh
ZzIwMF9mbGFnc19mcm9tX2RyaXZlcl9kYXRhKGtlcm5lbF91bG9uZ190IGRyaXZlcl9kYXRhKQor
eworCXJldHVybiBkcml2ZXJfZGF0YSAmIE1HQUcyMDBfRkxBR19NQVNLOworfQorCiAJCQkJLyog
bWdhZzIwMF9tb2RlLmMgKi8KIGludCBtZ2FnMjAwX21vZGVzZXRfaW5pdChzdHJ1Y3QgbWdhX2Rl
dmljZSAqbWRldik7CiB2b2lkIG1nYWcyMDBfbW9kZXNldF9maW5pKHN0cnVjdCBtZ2FfZGV2aWNl
ICptZGV2KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFp
bi5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMKaW5kZXggNTE3YzU2
OTNhZDY5Li5lMWJjNWIwYWE3NzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFp
bi5jCkBAIC05NCw2ICs5NCw3IEBAIHN0YXRpYyBpbnQgbWdhZzIwMF9kZXZpY2VfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVjdCBtZ2FfZGV2aWNlICptZGV2ID0gZGV2LT5kZXZf
cHJpdmF0ZTsKIAlpbnQgcmV0LCBvcHRpb247CiAKKwltZGV2LT5mbGFncyA9IG1nYWcyMDBfZmxh
Z3NfZnJvbV9kcml2ZXJfZGF0YShmbGFncyk7CiAJbWRldi0+dHlwZSA9IG1nYWcyMDBfdHlwZV9m
cm9tX2RyaXZlcl9kYXRhKGZsYWdzKTsKIAogCS8qIEhhcmRjb2RlIHRoZSBudW1iZXIgb2YgQ1JU
Q3MgdG8gMSAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
