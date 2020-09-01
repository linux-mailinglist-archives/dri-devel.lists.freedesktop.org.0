Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7496B259231
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 17:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2C6E862;
	Tue,  1 Sep 2020 15:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8025D6E461;
 Tue,  1 Sep 2020 15:05:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so1493571wme.5;
 Tue, 01 Sep 2020 08:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDT78MRZVCv7l7K+SspRYoMu/sm8Rwq6ANFU1fvaMTc=;
 b=CpwsHI/GTkzrOumwq6yiJ/H248FGNBJtwbM4dd5mgvCaQ8k0YRhHbbW8BQpTvj4o4E
 cl1+Q1TDRS+YkUhXE/NQZVpTjgS/E4pXYBzuVnYan3sK8N481uXCOoxZvPO+ocLi+Mye
 xlDQOT+hoVrf2nmhr9sOeYYqfvLFe5jdSKH0qTaejGRLmWw6IBVFwa8zXmP+AT6hSaf3
 EfYGNFsg8fPMXqFvxW/tHE7ZodOHM8Vu0rIY0X6oQJqlg2XwZpKgjUQ2wZ5QjgH/1rND
 Xv/LT0MnfRDFCNROqZrEHINneTNLV+FW6v9LbUr2n0IDFAV6DwbxEQMJiK1sPK4+4U4O
 jfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDT78MRZVCv7l7K+SspRYoMu/sm8Rwq6ANFU1fvaMTc=;
 b=uTB6Zc7R6Tvs9MSzaisRudHKTyekH5uFtjkix3hNKCEZ25unp59Fq3HXwo7WSCktFx
 fNjpwxhULRaWbCRIrKkcuxVXqrYQ425QJ+pMrKBAGnMcOsios+FCRRrwG7L9msD777lF
 XnbVG8v3uINLu+RH1crkqutjVTkSIRFEk/6+VyX6+IUJLr8tjpbyKwqjh/Cs135pAtY8
 tUnwnYGISgwHM7/dNRL3RTzQEyWOmAEYrhaS8hgpfZERkMZsP7CeFY9udOYIGXiajvmr
 vR744YAKBsRa+LMwZ6LXOUc+Af9Vf1+xpN4/PN0CvzEW6b6XhkepDgZRdlqf8ykkkROo
 XM1g==
X-Gm-Message-State: AOAM530a2YnldjNGYQJPFlLLooVFQb1+ulSq3xIcThPOW3QOaSWefhGu
 Ai94zAFLEtOy3jHfeaueLoQ=
X-Google-Smtp-Source: ABdhPJzX2YCb30vgt6nY6D3X0Jq3jbsf5CKsWSkz5jW7ayObBEp64/al5OAv3d2ONzX7NCACElq0gA==
X-Received: by 2002:a05:600c:210c:: with SMTP id
 u12mr2373058wml.185.1598972745052; 
 Tue, 01 Sep 2020 08:05:45 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a794:43bf:fedf:ac6a])
 by smtp.gmail.com with ESMTPSA id 71sm2882469wrm.23.2020.09.01.08.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 08:05:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com, skeggsb@gmail.com, dri-devel@lists.freedesktop.org,
 Nouveau@lists.freedesktop.org
Subject: [PATCH 1/3] drm/ttm: make sure that we always zero init mem.bus v2
Date: Tue,  1 Sep 2020 17:05:40 +0200
Message-Id: <20200901150542.7455-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgYXJlIHRyeWluZyB0byByZW1vdmUgdGhlIGlvX2xydSBoYW5kbGluZyBhbmQgZGVwZW5kCm9u
IHplcm8gaW5pdCBiYXNlLCBvZmZzZXQgYW5kIGFkZHIgaGVyZS4KCnYyOiBpbml0IGFkZHIgYXMg
d2VsbAoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA5ICsrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IGUz
OTMxZTUxNTkwNi4uNzcyYzY0MGE2MDQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTY1MCw2ICs2
NTAsOSBAQCBzdGF0aWMgaW50IHR0bV9ib19ldmljdChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLAogCWV2aWN0X21lbS5tbV9ub2RlID0gTlVMTDsKIAlldmljdF9tZW0uYnVzLmlvX3Jlc2Vy
dmVkX3ZtID0gZmFsc2U7CiAJZXZpY3RfbWVtLmJ1cy5pb19yZXNlcnZlZF9jb3VudCA9IDA7CisJ
ZXZpY3RfbWVtLmJ1cy5iYXNlID0gMDsKKwlldmljdF9tZW0uYnVzLm9mZnNldCA9IDA7CisJZXZp
Y3RfbWVtLmJ1cy5hZGRyID0gTlVMTDsKIAogCXJldCA9IHR0bV9ib19tZW1fc3BhY2UoYm8sICZw
bGFjZW1lbnQsICZldmljdF9tZW0sIGN0eCk7CiAJaWYgKHJldCkgewpAQCAtMTA4NCw2ICsxMDg3
LDkgQEAgc3RhdGljIGludCB0dG1fYm9fbW92ZV9idWZmZXIoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKIAltZW0ucGFnZV9hbGlnbm1lbnQgPSBiby0+bWVtLnBhZ2VfYWxpZ25tZW50Owog
CW1lbS5idXMuaW9fcmVzZXJ2ZWRfdm0gPSBmYWxzZTsKIAltZW0uYnVzLmlvX3Jlc2VydmVkX2Nv
dW50ID0gMDsKKwltZW0uYnVzLmJhc2UgPSAwOworCW1lbS5idXMub2Zmc2V0ID0gMDsKKwltZW0u
YnVzLmFkZHIgPSBOVUxMOwogCW1lbS5tbV9ub2RlID0gTlVMTDsKIAogCS8qCkBAIC0xMjQzLDYg
KzEyNDksOSBAQCBpbnQgdHRtX2JvX2luaXRfcmVzZXJ2ZWQoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsCiAJYm8tPm1lbS5wYWdlX2FsaWdubWVudCA9IHBhZ2VfYWxpZ25tZW50OwogCWJvLT5t
ZW0uYnVzLmlvX3Jlc2VydmVkX3ZtID0gZmFsc2U7CiAJYm8tPm1lbS5idXMuaW9fcmVzZXJ2ZWRf
Y291bnQgPSAwOworCWJvLT5tZW0uYnVzLmJhc2UgPSAwOworCWJvLT5tZW0uYnVzLm9mZnNldCA9
IDA7CisJYm8tPm1lbS5idXMuYWRkciA9IE5VTEw7CiAJYm8tPm1vdmluZyA9IE5VTEw7CiAJYm8t
Pm1lbS5wbGFjZW1lbnQgPSAoVFRNX1BMX0ZMQUdfU1lTVEVNIHwgVFRNX1BMX0ZMQUdfQ0FDSEVE
KTsKIAliby0+YWNjX3NpemUgPSBhY2Nfc2l6ZTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
