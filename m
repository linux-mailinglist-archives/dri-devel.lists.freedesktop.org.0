Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D6AB1482
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 20:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE746EDEF;
	Thu, 12 Sep 2019 18:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A176A6EDEF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 18:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id C63963F4C5;
 Thu, 12 Sep 2019 20:39:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U74XvwymYWs1; Thu, 12 Sep 2019 20:39:15 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 35B3A3F323;
 Thu, 12 Sep 2019 20:39:14 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 95CA23601AA;
 Thu, 12 Sep 2019 20:39:14 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Restore ttm prefaulting
Date: Thu, 12 Sep 2019 20:38:54 +0200
Message-Id: <20190912183854.28194-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568313554; bh=CyuvDsHAgnkMSf5gazXmiPZhShvqJTly6XlzEoXi1jM=;
 h=From:To:Cc:Subject:Date:From;
 b=iSqj2hn44LfSGxpN3L9A57mAFeF+z+2tIsr6r2WhrbN92U0jg+/xgs3YJpSXd0f1c
 fNQeohGUT737K+VjNjW0g2CG/axqjO/IPVrVTpskv4WqUEG957k52pL1N5foAgdZIH
 aJ33EdX7bMpYp5t3EGvIEG9+o+K/d8X0KtTuGDCU=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=iSqj2hn4; 
 dkim-atps=neutral
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com, Souptick Joarder <jrdr.linux@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKQ29tbWl0IDRk
YWE0ZmJhM2EzOCAoImdwdTogZHJtOiB0dG06IEFkZGluZyBuZXcgcmV0dXJuIHR5cGUgdm1fZmF1
bHRfdCIpCmJyb2tlIFRUTSBwcmVmYXVsdGluZy4gU2luY2Ugdm1mX2luc2VydF9taXhlZCgpIHR5
cGljYWxseSBhbHdheXMgcmV0dXJucwpWTV9GQVVMVF9OT1BBR0UsIHByZWZhdWx0aW5nIHN0b3Bz
IGFmdGVyIHRoZSBzZWNvbmQgUFRFLgoKUmVzdG9yZSAoYWxtb3N0KSB0aGUgb3JpZ2luYWwgYmVo
YXZpb3VyLiBVbmZvcnR1bmF0ZWx5IHdlIGNhbiBubyBsb25nZXIKd2l0aCB0aGUgbmV3IHZtX2Zh
dWx0X3QgcmV0dXJuIHR5cGUgZGV0ZXJtaW5lIHdoZXRoZXIgYSBwcmVmYXVsdGluZwpQVEUgaW5z
ZXJ0aW9uIGhpdCBhbiBhbHJlYWR5IHBvcHVsYXRlZCBQVEUsIGFuZCB0ZXJtaW5hdGUgdGhlIGlu
c2VydGlvbgpsb29wLiBJbnN0ZWFkIHdlIGNvbnRpbnVlIHdpdGggdGhlIHByZS1kZXRlcm1pbmVk
IG51bWJlciBvZiBwcmVmYXVsdHMuCgpGaXhlczogNGRhYTRmYmEzYTM4ICgiZ3B1OiBkcm06IHR0
bTogQWRkaW5nIG5ldyByZXR1cm4gdHlwZSB2bV9mYXVsdF90IikKQ2M6IFNvdXB0aWNrIEpvYXJk
ZXIgPGpyZHIubGludXhAZ21haWwuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0
cm9tQHZtd2FyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDE2
ICsrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggNWE1ODBhZGViOWQxLi5hYTE4
ZThhNTM3MjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtMjkwLDE1ICsyOTAsMTMgQEAg
dm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYs
CiAJCWVsc2UKIAkJCXJldCA9IHZtZl9pbnNlcnRfcGZuKCZjdm1hLCBhZGRyZXNzLCBwZm4pOwog
Ci0JCS8qCi0JCSAqIFNvbWVib2R5IGJlYXQgdXMgdG8gdGhpcyBQVEUgb3IgcHJlZmF1bHRpbmcg
dG8KLQkJICogYW4gYWxyZWFkeSBwb3B1bGF0ZWQgUFRFLCBvciBwcmVmYXVsdGluZyBlcnJvci4K
LQkJICovCi0KLQkJaWYgKHVubGlrZWx5KChyZXQgPT0gVk1fRkFVTFRfTk9QQUdFICYmIGkgPiAw
KSkpCi0JCQlicmVhazsKLQkJZWxzZSBpZiAodW5saWtlbHkocmV0ICYgVk1fRkFVTFRfRVJST1Ip
KQotCQkJZ290byBvdXRfaW9fdW5sb2NrOworCQkvKiBOZXZlciBlcnJvciBvbiBwcmVmYXVsdGVk
IFBURXMgKi8KKwkJaWYgKHVubGlrZWx5KChyZXQgJiBWTV9GQVVMVF9FUlJPUikpKSB7CisJCQlp
ZiAoaSA9PSAwKQorCQkJCWdvdG8gb3V0X2lvX3VubG9jazsKKwkJCWVsc2UKKwkJCQlicmVhazsK
KwkJfQogCiAJCWFkZHJlc3MgKz0gUEFHRV9TSVpFOwogCQlpZiAodW5saWtlbHkoKytwYWdlX29m
ZnNldCA+PSBwYWdlX2xhc3QpKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
