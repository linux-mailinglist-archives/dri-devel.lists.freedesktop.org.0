Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7A19BC83
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190EB6E9F2;
	Thu,  2 Apr 2020 07:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42FB6E983
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 18:38:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h15so1264751wrx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lTLML4qHVOZd27zNow6npQ5Y380GiSw3REsv0q0S9OI=;
 b=guEAQIjGyE1c1MIer5DCdAny6uB4kMqf48dNU4g6Ue4DdL8pbXHxBF+9wdYXwL4M/+
 LZNcqXtVH219MEBxzM6oAPqIsDAMAx/u8pu7zNwL4VgPR3zdTTsOrtW31Rqh4eCzLm3u
 R9lRlPr0uxAfnY9wShaaJLka0kD8Jx1iN3G/V0R4rlGHAAPk+VM60K/UVPSMZ3NeHr0l
 cIJGf3oVQo4BDccs71nWg8zrQDmH8W/7RroO72+1slWxfXVt61PRfINJA7XIYUYus0C4
 SF8HPGpwGJCnnDV5NxxgLrQ+Fr6yA76AOIkKlxl8KXd/CB6I4pwSSq5u2Cb2hnn0vIJR
 p6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lTLML4qHVOZd27zNow6npQ5Y380GiSw3REsv0q0S9OI=;
 b=j2uspsZezKlhPWwrjEcJwI1kelQjuHRSgzAPoLXHDb6N2xY3Q6/g6JwF3qGSBQxx6x
 3tvweZPpQCk8zwA+EJdSEtCkAjLfxn369Dm+eQzBK7458ZRwX20VAcniTZ20gFY8Fi6F
 GTQkUvsYcWedSqrhup/KVF524Mjnr+h/NkkbTGDH3tApGglWcvlB464OhBcVex4hxows
 xG/Jmquqe1yzaZ3S/4HiY+XwCkQH6k7cl+GXL4tzq7sf5AI1vlm5Cw0xI16DtKwU2pVl
 LX0WTVqcLCE5cXgGyRmCFm9TIwxnh1k0u4xR3qRNkt/eNODhejO6NCAcR8OSezYqJs1/
 6PRg==
X-Gm-Message-State: ANhLgQ1Lxf6H0ZrO+VQqIqYPyhmpHmSBuo1UfueBHMcCEwEfnkS+vBvx
 TP5aQBx0BWLR0wYXRiZm165zM+GYCb8=
X-Google-Smtp-Source: ADFU+vu8iJ7bqfXdOD995DXcQitIoNLS7W4YqozRkkL03JLs4+OE1ogSZox0TmGtfmgRvHUr12rOdg==
X-Received: by 2002:adf:f7cb:: with SMTP id a11mr26859348wrq.79.1585766320963; 
 Wed, 01 Apr 2020 11:38:40 -0700 (PDT)
Received: from brihaspati.fritz.box (p5DE52E4E.dip0.t-ipconnect.de.
 [93.229.46.78])
 by smtp.gmail.com with ESMTPSA id b11sm3976973wrq.26.2020.04.01.11.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 11:38:40 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/vmwgfx: don't use ttm bo->offset
Date: Wed,  1 Apr 2020 20:42:42 +0200
Message-Id: <20200401184247.16643-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401184247.16643-1-nirmoy.das@amd.com>
References: <20200401184247.16643-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2FsY3VsYXRlIEdQVSBvZmZzZXQgd2l0aGluIHZtd2dmeCBkcml2ZXIgaXRzZWxmIHdpdGhvdXQg
ZGVwZW5kaW5nIG9uCmJvLT5vZmZzZXQuCgpTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJt
b3kuZGFzQGFtZC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+CkFja2VkLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2Fy
ZS5jb20+ClRlc3RlZC1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMgICAgICAgICB8IDQgKyst
LQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jICAgIHwgMiArLQogZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZmlmby5jICAgICAgIHwgMiArLQogZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgMiAtLQogNCBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2JvLmMKaW5kZXggOGI3MWJmNmI1OGVmLi4xZTU5YzAxOWFmZmEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfYm8uYwpAQCAtMjU4LDcgKzI1OCw3IEBAIGludCB2bXdfYm9fcGluX2luX3N0YXJ0
X29mX3ZyYW0oc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKIAkJcmV0ID0gdHRtX2JvX3Zh
bGlkYXRlKGJvLCAmcGxhY2VtZW50LCAmY3R4KTsKIAogCS8qIEZvciBzb21lIHJlYXNvbiB3ZSBk
aWRuJ3QgZW5kIHVwIGF0IHRoZSBzdGFydCBvZiB2cmFtICovCi0JV0FSTl9PTihyZXQgPT0gMCAm
JiBiby0+b2Zmc2V0ICE9IDApOworCVdBUk5fT04ocmV0ID09IDAgJiYgYm8tPm1lbS5zdGFydCAh
PSAwKTsKIAlpZiAoIXJldCkKIAkJdm13X2JvX3Bpbl9yZXNlcnZlZChidWYsIHRydWUpOwogCkBA
IC0zMTcsNyArMzE3LDcgQEAgdm9pZCB2bXdfYm9fZ2V0X2d1ZXN0X3B0cihjb25zdCBzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogewogCWlmIChiby0+bWVtLm1lbV90eXBlID09IFRUTV9Q
TF9WUkFNKSB7CiAJCXB0ci0+Z21ySWQgPSBTVkdBX0dNUl9GUkFNRUJVRkZFUjsKLQkJcHRyLT5v
ZmZzZXQgPSBiby0+b2Zmc2V0OworCQlwdHItPm9mZnNldCA9IGJvLT5tZW0uc3RhcnQgPDwgUEFH
RV9TSElGVDsKIAl9IGVsc2UgewogCQlwdHItPmdtcklkID0gYm8tPm1lbS5zdGFydDsKIAkJcHRy
LT5vZmZzZXQgPSAwOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
ZXhlY2J1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jCmluZGV4
IDM2N2Q1Yjg3ZWU2YS4uNDI4NGM0YmQ0NDRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9leGVjYnVmLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfZXhlY2J1Zi5jCkBAIC0zNjk2LDcgKzM2OTYsNyBAQCBzdGF0aWMgdm9pZCB2bXdfYXBwbHlf
cmVsb2NhdGlvbnMoc3RydWN0IHZtd19zd19jb250ZXh0ICpzd19jb250ZXh0KQogCQlibyA9ICZy
ZWxvYy0+dmJvLT5iYXNlOwogCQlzd2l0Y2ggKGJvLT5tZW0ubWVtX3R5cGUpIHsKIAkJY2FzZSBU
VE1fUExfVlJBTToKLQkJCXJlbG9jLT5sb2NhdGlvbi0+b2Zmc2V0ICs9IGJvLT5vZmZzZXQ7CisJ
CQlyZWxvYy0+bG9jYXRpb24tPm9mZnNldCArPSBiby0+bWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7
CiAJCQlyZWxvYy0+bG9jYXRpb24tPmdtcklkID0gU1ZHQV9HTVJfRlJBTUVCVUZGRVI7CiAJCQli
cmVhazsKIAkJY2FzZSBWTVdfUExfR01SOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZmlmby5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZmlmby5j
CmluZGV4IDY5NDE2ODkwODVlZC4uYTk1MTU2ZmM1ZGI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZmlmby5jCkBAIC02MTAsNyArNjEwLDcgQEAgc3RhdGljIGludCB2bXdfZmlmb19lbWl0
X2R1bW15X2xlZ2FjeV9xdWVyeShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2LAogCiAJaWYg
KGJvLT5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0pIHsKIAkJY21kLT5ib2R5Lmd1ZXN0UmVz
dWx0LmdtcklkID0gU1ZHQV9HTVJfRlJBTUVCVUZGRVI7Ci0JCWNtZC0+Ym9keS5ndWVzdFJlc3Vs
dC5vZmZzZXQgPSBiby0+b2Zmc2V0OworCQljbWQtPmJvZHkuZ3Vlc3RSZXN1bHQub2Zmc2V0ID0g
Ym8tPm1lbS5zdGFydCA8PCBQQUdFX1NISUZUOwogCX0gZWxzZSB7CiAJCWNtZC0+Ym9keS5ndWVz
dFJlc3VsdC5nbXJJZCA9IGJvLT5tZW0uc3RhcnQ7CiAJCWNtZC0+Ym9keS5ndWVzdFJlc3VsdC5v
ZmZzZXQgPSAwOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRt
X2J1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jCmlu
ZGV4IDNmM2IyYzdhMjA4YS4uZTcxMzRhZWJlYjgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfdHRtX2J1ZmZlci5jCkBAIC03NTAsNyArNzUwLDYgQEAgc3RhdGljIGludCB2bXdf
aW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwK
IAljYXNlIFRUTV9QTF9WUkFNOgogCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCiAJCW1hbi0+
ZnVuYyA9ICZ0dG1fYm9fbWFuYWdlcl9mdW5jOwotCQltYW4tPmdwdV9vZmZzZXQgPSAwOwogCQlt
YW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8IFRUTV9NRU1UWVBFX0ZMQUdfTUFQ
UEFCTEU7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJ
CW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwpAQCAtNzYzLDcgKzc2
Miw2IEBAIHN0YXRpYyBpbnQgdm13X2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2Ug
KmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJCSAqICBzbG90cyBhcyB3ZWxsIGFzIHRoZSBibyBzaXpl
LgogCQkgKi8KIAkJbWFuLT5mdW5jID0gJnZtd19nbXJpZF9tYW5hZ2VyX2Z1bmM7Ci0JCW1hbi0+
Z3B1X29mZnNldCA9IDA7CiAJCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0NNQSB8IFRU
TV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1f
UExfRkxBR19DQUNIRUQ7CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FD
SEVEOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
