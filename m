Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE44455D9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA41897D4;
	Fri, 14 Jun 2019 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3689AA6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:31:49 +0000 (UTC)
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:45246 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1hbQl4-0003Xj-KH; Thu, 13 Jun 2019 15:31:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim
 4.82_1-5b7a7c0-XX) (envelope-from <rmk@armlinux.org.uk>)
 id 1hbQl2-0007zE-0t; Thu, 13 Jun 2019 15:31:16 +0100
In-Reply-To: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
References: <20190613142943.vhgiy6yvyjz6uqlp@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Sven Van Asbroeck <thesven73@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [PATCH v2 05/13] drm/i2c: tda998x: store audio port enable in settings
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1hbQl2-0007zE-0t@rmk-PC.armlinux.org.uk>
Date: Thu, 13 Jun 2019 15:31:16 +0100
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TmDIVm+kaTKf8BLScMjLCQuBmoH6/cqkG29LqYAu2k4=; b=E+ywKRcTLndiG7XgBHUDMAmldP
 PPkbQSBQbGpyHBYrBiLxLbEw28lj195R41g/E2ymYjKdsX0lOrbfQY/3E2c+38KcEVFV+hUrqT5i1
 eBIzo6qIk55vXKWnUvK8ZT+jFAmtKCdB3yOI8hNSX4f+iOaSjzzUIj4vMCZYg5IZu3GhYRoUpJnZv
 5SMLf4VHn4KguZSgiSZU68tGpR4xw3NAxz3C5q5/JGrQBPe/C2qXNFL4tHFq4gSfMFu0iOPSZai4W
 d28Qg9Hb3j0Chup6Eg99xeIQfhGi+UqLgryNYj3W0Ti85AuewpUrtTD2qthqaK/ilb6GssXx1nwuK
 wtrbD6Uw==;
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RvcmUgdGhlIGF1ZGlvIHBvcnQgZW5hYmxlIHJlZ2lzdGVyIGluIHRoZSBhdWRpbyBzZXR0aW5n
cyBzdHJ1Y3R1cmUsCndoaWNoIGNhbiBuZXZlciBiZSB6ZXJvIGZvciBhIHZhbGlkIGF1ZGlvIGNv
bmZpZ3VyYXRpb24uICBVc2UgdGhpcyB0bwpzaWduYWwgd2hldGhlciB3ZSBoYXZlIGF1ZGlvIGNv
bmZpZ3VyZWQsIHJhdGhlciB0aGFuIEFGTVRfVU5VU0VELgoKU2lnbmVkLW9mZi1ieTogUnVzc2Vs
bCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTJjL3RkYTk5OHhfZHJ2LmMgfCAxOCArKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9k
cnYuYwppbmRleCA5YjNlNDdmNDA4Y2EuLjk1OTBjNGY5Mjk2OSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pMmMvdGRh
OTk4eF9kcnYuYwpAQCAtNDIsNiArNDIsNyBAQCBzdHJ1Y3QgdGRhOTk4eF9hdWRpb19wb3J0IHsK
IAogc3RydWN0IHRkYTk5OHhfYXVkaW9fc2V0dGluZ3MgewogCXN0cnVjdCB0ZGE5OTh4X2F1ZGlv
X3BhcmFtcyBwYXJhbXM7CisJdTggZW5hX2FwOwogCXU4IGkyc19mb3JtYXQ7CiAJdTggY3RzX247
CiB9OwpAQCAtOTYxLDEwICs5NjIsMTQgQEAgc3RhdGljIGludCB0ZGE5OTh4X2NvbmZpZ3VyZV9h
dWRpbyhzdHJ1Y3QgdGRhOTk4eF9wcml2ICpwcml2LAogCXU4IGJ1Zls2XSwgY2xrc2VsX2FpcCwg
Y2xrc2VsX2ZzLCBhZGl2OwogCXUzMiBuOwogCisJLyogSWYgYXVkaW8gaXMgbm90IGNvbmZpZ3Vy
ZWQsIHRoZXJlIGlzIG5vdGhpbmcgdG8gZG8uICovCisJaWYgKHNldHRpbmdzLT5lbmFfYXAgPT0g
MCkKKwkJcmV0dXJuIDA7CisKIAlhZGl2ID0gdGRhOTk4eF9nZXRfYWRpdihwcml2LCBzZXR0aW5n
cy0+cGFyYW1zLnNhbXBsZV9yYXRlKTsKIAogCS8qIEVuYWJsZSBhdWRpbyBwb3J0cyAqLwotCXJl
Z193cml0ZShwcml2LCBSRUdfRU5BX0FQLCBzZXR0aW5ncy0+cGFyYW1zLmNvbmZpZyk7CisJcmVn
X3dyaXRlKHByaXYsIFJFR19FTkFfQVAsIHNldHRpbmdzLT5lbmFfYXApOwogCiAJLyogU2V0IGF1
ZGlvIGlucHV0IHNvdXJjZSAqLwogCXN3aXRjaCAoc2V0dGluZ3MtPnBhcmFtcy5mb3JtYXQpIHsK
QEAgLTEwNzQsOSArMTA3OSw5IEBAIHN0YXRpYyBpbnQgdGRhOTk4eF9hdWRpb19od19wYXJhbXMo
c3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCiAJZm9yIChpID0gMDsgaSA8IEFSUkFZ
X1NJWkUocHJpdi0+YXVkaW9fcG9ydCk7IGkrKykKIAkJaWYgKHByaXYtPmF1ZGlvX3BvcnRbaV0u
Zm9ybWF0ID09IGF1ZGlvLnBhcmFtcy5mb3JtYXQpCi0JCQlhdWRpby5wYXJhbXMuY29uZmlnID0g
cHJpdi0+YXVkaW9fcG9ydFtpXS5jb25maWc7CisJCQlhdWRpby5lbmFfYXAgPSBwcml2LT5hdWRp
b19wb3J0W2ldLmNvbmZpZzsKIAotCWlmIChhdWRpby5wYXJhbXMuY29uZmlnID09IDApIHsKKwlp
ZiAoYXVkaW8uZW5hX2FwID09IDApIHsKIAkJZGV2X2VycihkZXYsICIlczogTm8gYXVkaW8gY29u
ZmlndXJhdGlvbiBmb3VuZFxuIiwgX19mdW5jX18pOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CkBA
IC0xMTE2LDggKzExMjEsNyBAQCBzdGF0aWMgdm9pZCB0ZGE5OTh4X2F1ZGlvX3NodXRkb3duKHN0
cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKIAltdXRleF9sb2NrKCZwcml2LT5hdWRpb19t
dXRleCk7CiAKIAlyZWdfd3JpdGUocHJpdiwgUkVHX0VOQV9BUCwgMCk7Ci0KLQlwcml2LT5hdWRp
by5wYXJhbXMuZm9ybWF0ID0gQUZNVF9VTlVTRUQ7CisJcHJpdi0+YXVkaW8uZW5hX2FwID0gMDsK
IAogCW11dGV4X3VubG9jaygmcHJpdi0+YXVkaW9fbXV0ZXgpOwogfQpAQCAtMTYyMyw4ICsxNjI3
LDcgQEAgc3RhdGljIHZvaWQgdGRhOTk4eF9icmlkZ2VfbW9kZV9zZXQoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSwKIAogCQl0ZGE5OTh4X3dyaXRlX2F2aShwcml2LCBhZGp1c3RlZF9tb2RlKTsK
IAotCQlpZiAocHJpdi0+YXVkaW8ucGFyYW1zLmZvcm1hdCAhPSBBRk1UX1VOVVNFRCAmJgotCQkg
ICAgcHJpdi0+c2lua19oYXNfYXVkaW8pCisJCWlmIChwcml2LT5zaW5rX2hhc19hdWRpbykKIAkJ
CXRkYTk5OHhfY29uZmlndXJlX2F1ZGlvKHByaXYsICZwcml2LT5hdWRpbyk7CiAJfQogCkBAIC0x
NzA1LDYgKzE3MDgsNyBAQCBzdGF0aWMgaW50IHRkYTk5OHhfc2V0X2NvbmZpZyhzdHJ1Y3QgdGRh
OTk4eF9wcml2ICpwcml2LAogCQlib29sIHNwZGlmID0gcC0+YXVkaW9fcGFyYW1zLmZvcm1hdCA9
PSBBRk1UX1NQRElGOwogCiAJCXByaXYtPmF1ZGlvLnBhcmFtcyA9IHAtPmF1ZGlvX3BhcmFtczsK
KwkJcHJpdi0+YXVkaW8uZW5hX2FwID0gcC0+YXVkaW9fcGFyYW1zLmNvbmZpZzsKIAkJcHJpdi0+
YXVkaW8uaTJzX2Zvcm1hdCA9IEkyU19GT1JNQVRfUEhJTElQUzsKIAogCQlyYXRpbyA9IHNwZGlm
ID8gNjQgOiBwLT5hdWRpb19wYXJhbXMuc2FtcGxlX3dpZHRoICogMjsKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
