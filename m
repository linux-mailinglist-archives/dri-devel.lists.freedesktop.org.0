Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB707498D7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 08:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CC16E0DE;
	Tue, 18 Jun 2019 06:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3D66E0DA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 06:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0A4943F89F;
 Tue, 18 Jun 2019 08:25:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyr-JFy63eTu; Tue, 18 Jun 2019 08:24:57 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 79B803F7AA;
 Tue, 18 Jun 2019 08:24:57 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 26D0A361975;
 Tue, 18 Jun 2019 08:24:57 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= <thomas@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/vmwgfx: Use VMW_DEBUG_KMS for vmwgfx mode-setting
 user errors
Date: Tue, 18 Jun 2019 08:24:41 +0200
Message-Id: <20190618062442.14647-3-thomas@shipmail.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618062442.14647-1-thomas@shipmail.org>
References: <20190618062442.14647-1-thomas@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1560839097; bh=/S3AWZoTZcSPRyMnU7yGUt7AqVu6ziwzvDAmvYhklEo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HVPGnpNrn+CEBUrjkRRW7PKNQPtO9kMZmc/VxUEoosx+t4qgJim9g91t3QdbzyHRJ
 RtuU6sDGsvfmOpAyhYwhrzn2guPHZ6MNuym8mVQmttrENo8ud8msOXTqvwCekX0gPq
 wOMtuCPj0jvYlKhQac7Mu5ogwAf86riWfSTuhJuU=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=HVPGnpNr; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
 Deepak Rawat <drawat@vmware.com>, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGVlcGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNvbT4KCkZvciBlcnJvcnMgZHVyaW5n
IGxheW91dCBjaGFuZ2UgaW9jdGwgdXNlIFZNV19ERUJVR19LTVMgaW5zdGVhZCBvZgpEUk1fRVJS
T1IuCgpTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgpSZXZp
ZXdlZC1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jIHwgMTUgKysrKysrKysrKy0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2ttcy5jCmluZGV4IDdmOTI2NGE3MmUxZC4uZTcyMjJmYTJjZmRmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYwpAQCAtMTQ2Miw3ICsxNDYyLDcgQEAgc3Rh
dGljIGludCB2bXdfa21zX2NoZWNrX2Rpc3BsYXlfbWVtb3J5KHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCiAJCWlmIChkZXZfcHJpdi0+YWN0aXZlX2Rpc3BsYXlfdW5pdCA9PSB2bXdfZHVfc2NyZWVu
X3RhcmdldCAmJgogCQkgICAgKGRybV9yZWN0X3dpZHRoKCZyZWN0c1tpXSkgPiBkZXZfcHJpdi0+
c3RkdV9tYXhfd2lkdGggfHwKIAkJICAgICBkcm1fcmVjdF9oZWlnaHQoJnJlY3RzW2ldKSA+IGRl
dl9wcml2LT5zdGR1X21heF9oZWlnaHQpKSB7Ci0JCQlEUk1fRVJST1IoIlNjcmVlbiBzaXplIG5v
dCBzdXBwb3J0ZWQuXG4iKTsKKwkJCVZNV19ERUJVR19LTVMoIlNjcmVlbiBzaXplIG5vdCBzdXBw
b3J0ZWQuXG4iKTsKIAkJCXJldHVybiAtRUlOVkFMOwogCQl9CiAKQEAgLTE0ODYsNyArMTQ4Niw3
IEBAIHN0YXRpYyBpbnQgdm13X2ttc19jaGVja19kaXNwbGF5X21lbW9yeShzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCSAqIGxpbWl0IG9uIHByaW1hcnkgYm91bmRpbmcgYm94CiAJICovCiAJaWYg
KHBpeGVsX21lbSA+IGRldl9wcml2LT5wcmltX2JiX21lbSkgewotCQlEUk1fRVJST1IoIkNvbWJp
bmVkIG91dHB1dCBzaXplIHRvbyBsYXJnZS5cbiIpOworCQlWTVdfREVCVUdfS01TKCJDb21iaW5l
ZCBvdXRwdXQgc2l6ZSB0b28gbGFyZ2UuXG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCkBA
IC0xNDk2LDcgKzE0OTYsNyBAQCBzdGF0aWMgaW50IHZtd19rbXNfY2hlY2tfZGlzcGxheV9tZW1v
cnkoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJYmJfbWVtID0gKHU2NCkgYm91bmRpbmdfYm94
LngyICogYm91bmRpbmdfYm94LnkyICogNDsKIAogCQlpZiAoYmJfbWVtID4gZGV2X3ByaXYtPnBy
aW1fYmJfbWVtKSB7Ci0JCQlEUk1fRVJST1IoIlRvcG9sb2d5IGlzIGJleW9uZCBzdXBwb3J0ZWQg
bGltaXRzLlxuIik7CisJCQlWTVdfREVCVUdfS01TKCJUb3BvbG9neSBpcyBiZXlvbmQgc3VwcG9y
dGVkIGxpbWl0cy5cbiIpOwogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0KIAl9CkBAIC0xNjQ1LDYg
KzE2NDUsNyBAQCBzdGF0aWMgaW50IHZtd19rbXNfY2hlY2tfdG9wb2xvZ3koc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKIAkJc3RydWN0IHZtd19jb25uZWN0b3Jfc3RhdGUgKnZtd19jb25uX3N0YXRl
OwogCiAJCWlmICghZHUtPnByZWZfYWN0aXZlICYmIG5ld19jcnRjX3N0YXRlLT5lbmFibGUpIHsK
KwkJCVZNV19ERUJVR19LTVMoIkVuYWJsaW5nIGEgZGlzYWJsZWQgZGlzcGxheSB1bml0XG4iKTsK
IAkJCXJldCA9IC1FSU5WQUw7CiAJCQlnb3RvIGNsZWFuOwogCQl9CkBAIC0xNzAxLDggKzE3MDIs
MTAgQEAgdm13X2ttc19hdG9taWNfY2hlY2tfbW9kZXNldChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAogCQlyZXR1cm4gcmV0OwogCiAJcmV0ID0gdm13X2ttc19jaGVja19pbXBsaWNpdChkZXYsIHN0
YXRlKTsKLQlpZiAocmV0KQorCWlmIChyZXQpIHsKKwkJVk1XX0RFQlVHX0tNUygiSW52YWxpZCBp
bXBsaWNpdCBzdGF0ZVxuIik7CiAJCXJldHVybiByZXQ7CisJfQogCiAJaWYgKCFzdGF0ZS0+YWxs
b3dfbW9kZXNldCkKIAkJcmV0dXJuIHJldDsKQEAgLTI0MDEsNyArMjQwNCw5IEBAIGludCB2bXdf
a21zX3VwZGF0ZV9sYXlvdXRfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwKIAkJaWYgKGRybV9yZWN0c1tpXS54MSA8IDAgfHwgIGRybV9yZWN0c1tpXS55MSA8IDAgfHwK
IAkJICAgIGRybV9yZWN0c1tpXS54MiA+IG1vZGVfY29uZmlnLT5tYXhfd2lkdGggfHwKIAkJICAg
IGRybV9yZWN0c1tpXS55MiA+IG1vZGVfY29uZmlnLT5tYXhfaGVpZ2h0KSB7Ci0JCQlEUk1fRVJS
T1IoIkludmFsaWQgR1VJIGxheW91dC5cbiIpOworCQkJVk1XX0RFQlVHX0tNUygiSW52YWxpZCBs
YXlvdXQgJWQgJWQgJWQgJWRcbiIsCisJCQkJICAgICAgZHJtX3JlY3RzW2ldLngxLCBkcm1fcmVj
dHNbaV0ueTEsCisJCQkJICAgICAgZHJtX3JlY3RzW2ldLngyLCBkcm1fcmVjdHNbaV0ueTIpOwog
CQkJcmV0ID0gLUVJTlZBTDsKIAkJCWdvdG8gb3V0X2ZyZWU7CiAJCX0KLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
