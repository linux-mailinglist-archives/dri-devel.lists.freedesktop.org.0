Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DFDB0933
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09776EBAD;
	Thu, 12 Sep 2019 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E656E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:21:36 +0000 (UTC)
Received: from p200300ccff0b59001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0b:5900:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i86J7-0006kp-9U; Wed, 11 Sep 2019 19:21:29 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i86J7-0003M5-0o; Wed, 11 Sep 2019 19:21:29 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 2/2] backlight: lm3630a: add an enable gpio for the HWEN pin
Date: Wed, 11 Sep 2019 19:21:06 +0200
Message-Id: <20190911172106.12843-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190911172106.12843-1-andreas@kemnade.info>
References: <20190911172106.12843-1-andreas@kemnade.info>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sPMO8vcrRK/jL3rN+4QkorWNycje82WGvrWvZkHcz44=; b=nQIeaSRKdjHALYED3UM4qdoZaj
 ay1z5xTneTJmZeyPryoIfinTJ7Wa2z7azMYWQHLs4Sq+6Xoh9/zr8lMELMLwGMA8HD1OnMEmmvnsv
 Am+q25RuMlzHUpmF3HDg0AFOx+q4GjftewUadKNHpwEsJKVgMGEkex/C99DpuZ78XkSk=;
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
Cc: Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIG5vdyBqdXN0IGVuYWJsZSBpdCBpbiB0aGUgcHJvYmUgZnVuY3Rpb24gdG8gYWxsb3cgaTJj
CmFjY2Vzcy4gRGlzYWJsaW5nIGFsc28gbWVhbnMgcmVzZXR0aW5nIHRoZSByZWdpc3RlciB2YWx1
ZXMKdG8gZGVmYXVsdCBhbmQgYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgZG9lcyBub3QgZ2l2
ZQpwb3dlciBzYXZpbmdzLgoKVGVzdGVkIG9uIEtvYm8gQ2xhcmEgSEQuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZWFzIEtlbW5hZGUgPGFuZHJlYXNAa2VtbmFkZS5pbmZvPgotLS0KY2hhbmdlcyBpbiB2
MjoKLSBzaW1wbGlmaWNhdGlvbgotIGNvcnJlY3QgZ3BpbyBkaXJlY3Rpb24gaW5pdGlhbGlzYXRp
b24KCmNoYW5nZXMgaW4gdjM6Ci0gcmVtb3ZlZCBsZWdhY3kgaW5jbHVkZQoKIGRyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0z
NjMwYV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCmluZGV4IDhm
ODRmMzY4NGYwNC4uZDllNjdiOWIyNTcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9sbTM2MzBhX2JsLmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9i
bC5jCkBAIC0xMiw2ICsxMiw3IEBACiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogI2luY2x1
ZGUgPGxpbnV4L2ludGVycnVwdC5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgorI2luY2x1
ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9wd20uaD4KICNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kYXRhL2xtMzYzMGFfYmwuaD4KIApAQCAtNDgsNiArNDksNyBA
QCBzdHJ1Y3QgbG0zNjMwYV9jaGlwIHsKIAlzdHJ1Y3QgbG0zNjMwYV9wbGF0Zm9ybV9kYXRhICpw
ZGF0YTsKIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmxlZGE7CiAJc3RydWN0IGJhY2tsaWdo
dF9kZXZpY2UgKmJsZWRiOworCXN0cnVjdCBncGlvX2Rlc2MgKmVuYWJsZV9ncGlvOwogCXN0cnVj
dCByZWdtYXAgKnJlZ21hcDsKIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdtZDsKIH07CkBAIC01MzUs
NiArNTM3LDEzIEBAIHN0YXRpYyBpbnQgbG0zNjMwYV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50LAogCX0KIAlwY2hpcC0+cGRhdGEgPSBwZGF0YTsKIAorCXBjaGlwLT5lbmFibGVfZ3Bp
byA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwgImVuYWJsZSIsCisJCQkJ
CQlHUElPRF9PVVRfSElHSCk7CisJaWYgKElTX0VSUihwY2hpcC0+ZW5hYmxlX2dwaW8pKSB7CisJ
CXJ2YWwgPSBQVFJfRVJSKHBjaGlwLT5lbmFibGVfZ3Bpbyk7CisJCXJldHVybiBydmFsOworCX0K
KwogCS8qIGNoaXAgaW5pdGlhbGl6ZSAqLwogCXJ2YWwgPSBsbTM2MzBhX2NoaXBfaW5pdChwY2hp
cCk7CiAJaWYgKHJ2YWwgPCAwKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
