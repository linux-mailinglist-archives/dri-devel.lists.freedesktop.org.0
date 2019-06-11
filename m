Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3C841CE4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536AE892B4;
	Wed, 12 Jun 2019 06:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53A6891C7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 12:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 4E98A3FA61;
 Tue, 11 Jun 2019 14:25:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB2Bejz6D5Zt; Tue, 11 Jun 2019 14:25:09 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E2ECA3F53F;
 Tue, 11 Jun 2019 14:25:08 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A21EC361B57;
 Tue, 11 Jun 2019 14:25:08 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thellstrom@vmwopensource.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/9] drm/ttm: Allow the driver to provide the ttm struct
 vm_operations_struct
Date: Tue, 11 Jun 2019 14:24:49 +0200
Message-Id: <20190611122454.3075-5-thellstrom@vmwopensource.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611122454.3075-1-thellstrom@vmwopensource.org>
References: <20190611122454.3075-1-thellstrom@vmwopensource.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=vmwopensource.org; s=mail; t=1560255908;
 bh=0OCS847VhF4p4ZkW88dxoqjOEDCCvJZwECAtiDuXG38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0174Lzv6lxagtJ/fYaMLdPUN7MtIl7bIqarLqppevQLSO9EeRncOZMWD6rPQfqe/f
 6MUHVadnKAFWfQGPofbV7Zq7+N4dqEz/28kN9ds0OptA6w/rjvDcL/StAja9pH2e8f
 26v4wwvgPUcu5ovqmH+77yVdjzS/l/X9K+i9FyDI=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=vmwopensource.org header.i=@vmwopensource.org
 header.b=0174Lzv6; 
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
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKQWRkIGEgcG9p
bnRlciB0byB0aGUgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IGluIHRoZSBib19kZXZpY2Us
IGFuZAphc3NpZ24gdGhhdCBwb2ludGVyIHRvIHRoZSBkZWZhdWx0IHZhbHVlIGN1cnJlbnRseSB1
c2VkLgoKVGhlIGRyaXZlciBjYW4gdGhlbiBvcHRpb25hbGx5IG1vZGlmeSB0aGF0IHBvaW50ZXIg
YW5kIHRoZSBuZXcgdmFsdWUKY2FuIGJlIHVzZWQgZm9yIGVhY2ggbmV3IHZtYSBjcmVhdGVkLgoK
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3ZtLmMgfCA2ICsrKy0tLQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8
IDYgKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXggYzdkZTY2N2Q0ODJhLi42OTUzZGQyNjQxNzIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwpAQCAtMTczOSw2ICsxNzM5LDcgQEAgaW50IHR0bV9ib19kZXZpY2Vf
aW5pdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAltdXRleF9sb2NrKCZ0dG1fZ2xvYmFs
X211dGV4KTsKIAlsaXN0X2FkZF90YWlsKCZiZGV2LT5kZXZpY2VfbGlzdCwgJmdsb2ItPmRldmlj
ZV9saXN0KTsKIAltdXRleF91bmxvY2soJnR0bV9nbG9iYWxfbXV0ZXgpOworCWJkZXYtPnZtX29w
cyA9ICZ0dG1fYm9fdm1fb3BzOwogCiAJcmV0dXJuIDA7CiBvdXRfbm9fc3lzOgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3ZtLmMKaW5kZXggNmRhY2ZmNDljMWNjLi4xOTZlMTNhMGFkYWQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYwpAQCAtMzk1LDcgKzM5NSw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX3ZtX2Fj
Y2VzcyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCXJl
dHVybiByZXQ7CiB9CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qg
dHRtX2JvX3ZtX29wcyA9IHsKK2NvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCB0dG1f
Ym9fdm1fb3BzID0gewogCS5mYXVsdCA9IHR0bV9ib192bV9mYXVsdCwKIAkub3BlbiA9IHR0bV9i
b192bV9vcGVuLAogCS5jbG9zZSA9IHR0bV9ib192bV9jbG9zZSwKQEAgLTQ0OCw3ICs0NDgsNyBA
QCBpbnQgdHRtX2JvX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAogCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCiAJCWdvdG8gb3V0X3VucmVmOwogCi0J
dm1hLT52bV9vcHMgPSAmdHRtX2JvX3ZtX29wczsKKwl2bWEtPnZtX29wcyA9IGJkZXYtPnZtX29w
czsKIAogCS8qCiAJICogTm90ZTogV2UncmUgdHJhbnNmZXJyaW5nIHRoZSBibyByZWZlcmVuY2Ug
dG8KQEAgLTQ4MCw3ICs0ODAsNyBAQCBpbnQgdHRtX2ZiZGV2X21tYXAoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAKIAl0dG1fYm9fZ2V0
KGJvKTsKIAotCXZtYS0+dm1fb3BzID0gJnR0bV9ib192bV9vcHM7CisJdm1hLT52bV9vcHMgPSBi
by0+YmRldi0+dm1fb3BzOwogCXZtYS0+dm1fcHJpdmF0ZV9kYXRhID0gYm87CiAJdm1hLT52bV9m
bGFncyB8PSBWTV9NSVhFRE1BUDsKIAl2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwgVk1fRE9OVEVY
UEFORDsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNs
dWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCmluZGV4IGM5YjhiYTQ5MmYyNC4uYTJkODEwYTI1
MDRkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCisrKyBiL2lu
Y2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKQEAgLTQ0Miw2ICs0NDIsOSBAQCBleHRlcm4g
c3RydWN0IHR0bV9ib19nbG9iYWwgewogICogQGRyaXZlcjogUG9pbnRlciB0byBhIHN0cnVjdCB0
dG1fYm9fZHJpdmVyIHN0cnVjdCBzZXR1cCBieSB0aGUgZHJpdmVyLgogICogQG1hbjogQW4gYXJy
YXkgb2YgbWVtX3R5cGVfbWFuYWdlcnMuCiAgKiBAdm1hX21hbmFnZXI6IEFkZHJlc3Mgc3BhY2Ug
bWFuYWdlcgorICogQHZtX29wczogUG9pbnRlciB0byB0aGUgc3RydWN0IHZtX29wZXJhdGlvbnNf
c3RydWN0IHVzZWQgZm9yIHRoaXMKKyAqIGRldmljZSdzIFZNIG9wZXJhdGlvbnMuIFRoZSBkcml2
ZXIgbWF5IG92ZXJyaWRlIHRoaXMgYmVmb3JlIHRoZSBmaXJzdAorICogbW1hcCgpIGNhbGwuCiAg
KiBscnVfbG9jazogU3BpbmxvY2sgdGhhdCBwcm90ZWN0cyB0aGUgYnVmZmVyK2RldmljZSBscnUg
bGlzdHMgYW5kCiAgKiBkZGVzdHJveSBsaXN0cy4KICAqIEBkZXZfbWFwcGluZzogQSBwb2ludGVy
IHRvIHRoZSBzdHJ1Y3QgYWRkcmVzc19zcGFjZSByZXByZXNlbnRpbmcgdGhlCkBAIC00NjAsNiAr
NDYzLDcgQEAgc3RydWN0IHR0bV9ib19kZXZpY2UgewogCXN0cnVjdCB0dG1fYm9fZ2xvYmFsICpn
bG9iOwogCXN0cnVjdCB0dG1fYm9fZHJpdmVyICpkcml2ZXI7CiAJc3RydWN0IHR0bV9tZW1fdHlw
ZV9tYW5hZ2VyIG1hbltUVE1fTlVNX01FTV9UWVBFU107CisJY29uc3Qgc3RydWN0IHZtX29wZXJh
dGlvbnNfc3RydWN0ICp2bV9vcHM7CiAKIAkvKgogCSAqIFByb3RlY3RlZCBieSBpbnRlcm5hbCBs
b2Nrcy4KQEAgLTQ4OCw2ICs0OTIsOCBAQCBzdHJ1Y3QgdHRtX2JvX2RldmljZSB7CiAJYm9vbCBu
b19yZXRyeTsKIH07CiAKK2V4dGVybiBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qg
dHRtX2JvX3ZtX29wczsKKwogLyoqCiAgKiBzdHJ1Y3QgdHRtX2xydV9idWxrX21vdmVfcG9zCiAg
KgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
