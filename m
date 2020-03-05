Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E917B7EA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD896EC79;
	Fri,  6 Mar 2020 08:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CC76EBC8;
 Thu,  5 Mar 2020 13:25:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u9so5731074wml.3;
 Thu, 05 Mar 2020 05:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vScGlTm3RMoTnCUXVQs7PdhOxyTxBaaaUaVLYZM2rfI=;
 b=NdlYPR+pcRCgzaI7AE0S/cmPQfhPNqP5CdwlHZhl1ApKohm11/4XEi2sbOz77jczaT
 zIF2wcJ07JWmG/YOZP2Nws3CvmOzgk0x/SuaOLPBqb029Mc4szYpYKU98SKDCegPzNFK
 Yd6T0bIbF4Op6iX1uF6r0YHN5mnR/eAiM7r8jF8FATFVFDXto7UyWHYp6z5R4EponHP2
 N7Ni+cI5uhxAqe6C25EfVXbadLBSTWxj1g6TkXkeYMNrIx/xMdSHZBD+yDD9ELu5+KXs
 jfXWh/yGwbMX4sVeHIZkfFULyN0+XQTCLuP17CNWsuaXBKOG699QYkl+NoaOet4jxS/D
 Q21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vScGlTm3RMoTnCUXVQs7PdhOxyTxBaaaUaVLYZM2rfI=;
 b=Ba5PyKKMJuG2H53+Z6yGrS6c5HRt7ntoYs0iGRz0EEBUn5tGHRwSTIe2vul7yDlXVp
 GA7+qI01zD1PH1fdLYabiTwDvNItfz1Irwn4jgUmF5OW2UOV1ZpFd9+kofkh5l1RrHME
 hzCY6q2RlxNOc/C4DC6MJFW4j/l2UC1+NxMm1DGRx9+jaEUlIg6BVDiUqgCJIkcDjsx+
 KuaHUpwAos4qYKgWiZL2hHrSltjuA40LcZwnSn+QauRpbvwgeBlD1IqMuCDS7m/ieQvo
 nAj71Rbc8aKMoLuMSJh49ha0KcGnCLNJWXjAwQJhOpL+b0nGqV2AwyD7MPqNXl4naxo9
 YKpw==
X-Gm-Message-State: ANhLgQ0CZxN0BWGiyZEZFzQ+5smmth9OFmJVUADlXz8sxCpMFJCW78oq
 TjMnyY2hfFfWlSlXQEGMfEXJ9eQ6Sg+wzQ==
X-Google-Smtp-Source: ADFU+vs85lXCppGUIFQEDworhZZb2QxgYkmDm6MBTiAP14hct5wwvzC97x+VFr+17eiuoe3L+yFu3A==
X-Received: by 2002:a05:600c:280b:: with SMTP id
 m11mr9754971wmb.93.1583414752813; 
 Thu, 05 Mar 2020 05:25:52 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2EA5001F22CF19908511A1.dip0.t-ipconnect.de.
 [2003:c5:8f2e:a500:1f22:cf19:9085:11a1])
 by smtp.gmail.com with ESMTPSA id g14sm45424819wrv.58.2020.03.05.05.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:25:51 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/vmwgfx: don't use ttm bo->offset
Date: Thu,  5 Mar 2020 14:29:05 +0100
Message-Id: <20200305132910.17515-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200305132910.17515-1-nirmoy.das@amd.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
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
bGlkYXRlKGJvLCAmcGxhY2VtZW50LCAmY3R4KTsKCiAJLyogRm9yIHNvbWUgcmVhc29uIHdlIGRp
ZG4ndCBlbmQgdXAgYXQgdGhlIHN0YXJ0IG9mIHZyYW0gKi8KLQlXQVJOX09OKHJldCA9PSAwICYm
IGJvLT5vZmZzZXQgIT0gMCk7CisJV0FSTl9PTihyZXQgPT0gMCAmJiBiby0+bWVtLnN0YXJ0ICE9
IDApOwogCWlmICghcmV0KQogCQl2bXdfYm9fcGluX3Jlc2VydmVkKGJ1ZiwgdHJ1ZSk7CgpAQCAt
MzE3LDcgKzMxNyw3IEBAIHZvaWQgdm13X2JvX2dldF9ndWVzdF9wdHIoY29uc3Qgc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIHsKIAlpZiAoYm8tPm1lbS5tZW1fdHlwZSA9PSBUVE1fUExf
VlJBTSkgewogCQlwdHItPmdtcklkID0gU1ZHQV9HTVJfRlJBTUVCVUZGRVI7Ci0JCXB0ci0+b2Zm
c2V0ID0gYm8tPm9mZnNldDsKKwkJcHRyLT5vZmZzZXQgPSBiby0+bWVtLnN0YXJ0IDw8IFBBR0Vf
U0hJRlQ7CiAJfSBlbHNlIHsKIAkJcHRyLT5nbXJJZCA9IGJvLT5tZW0uc3RhcnQ7CiAJCXB0ci0+
b2Zmc2V0ID0gMDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2V4
ZWNidWYuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYwppbmRleCA3
MzQ4OWE0NWRlY2IuLjcyYzJjZjQwNTNkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZXhlY2J1Zi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2V4ZWNidWYuYwpAQCAtMzMxMyw3ICszMzEzLDcgQEAgc3RhdGljIHZvaWQgdm13X2FwcGx5X3Jl
bG9jYXRpb25zKHN0cnVjdCB2bXdfc3dfY29udGV4dCAqc3dfY29udGV4dCkKIAkJYm8gPSAmcmVs
b2MtPnZiby0+YmFzZTsKIAkJc3dpdGNoIChiby0+bWVtLm1lbV90eXBlKSB7CiAJCWNhc2UgVFRN
X1BMX1ZSQU06Ci0JCQlyZWxvYy0+bG9jYXRpb24tPm9mZnNldCArPSBiby0+b2Zmc2V0OworCQkJ
cmVsb2MtPmxvY2F0aW9uLT5vZmZzZXQgKz0gYm8tPm1lbS5zdGFydCA8PCBQQUdFX1NISUZUOwog
CQkJcmVsb2MtPmxvY2F0aW9uLT5nbXJJZCA9IFNWR0FfR01SX0ZSQU1FQlVGRkVSOwogCQkJYnJl
YWs7CiAJCWNhc2UgVk1XX1BMX0dNUjoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2ZpZm8uYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ZpZm8uYwpp
bmRleCBlNTI1MmVmMzgxMmYuLjFjZGM0NDViMjRjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfZmlmby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2ZpZm8uYwpAQCAtNjEyLDcgKzYxMiw3IEBAIHN0YXRpYyBpbnQgdm13X2ZpZm9fZW1pdF9k
dW1teV9sZWdhY3lfcXVlcnkoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKCiAJaWYgKGJv
LT5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0pIHsKIAkJY21kLT5ib2R5Lmd1ZXN0UmVzdWx0
LmdtcklkID0gU1ZHQV9HTVJfRlJBTUVCVUZGRVI7Ci0JCWNtZC0+Ym9keS5ndWVzdFJlc3VsdC5v
ZmZzZXQgPSBiby0+b2Zmc2V0OworCQljbWQtPmJvZHkuZ3Vlc3RSZXN1bHQub2Zmc2V0ID0gYm8t
Pm1lbS5zdGFydCA8PCBQQUdFX1NISUZUOwogCX0gZWxzZSB7CiAJCWNtZC0+Ym9keS5ndWVzdFJl
c3VsdC5nbXJJZCA9IGJvLT5tZW0uc3RhcnQ7CiAJCWNtZC0+Ym9keS5ndWVzdFJlc3VsdC5vZmZz
ZXQgPSAwOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1
ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jCmluZGV4
IDNmM2IyYzdhMjA4YS4uZTcxMzRhZWJlYjgxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfdHRtX2J1ZmZlci5jCkBAIC03NTAsNyArNzUwLDYgQEAgc3RhdGljIGludCB2bXdfaW5p
dF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKIAlj
YXNlIFRUTV9QTF9WUkFNOgogCQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCiAJCW1hbi0+ZnVu
YyA9ICZ0dG1fYm9fbWFuYWdlcl9mdW5jOwotCQltYW4tPmdwdV9vZmZzZXQgPSAwOwogCQltYW4t
PmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFC
TEU7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCW1h
bi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwpAQCAtNzYzLDcgKzc2Miw2
IEBAIHN0YXRpYyBpbnQgdm13X2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYsIHVpbnQzMl90IHR5cGUsCiAJCSAqICBzbG90cyBhcyB3ZWxsIGFzIHRoZSBibyBzaXplLgog
CQkgKi8KIAkJbWFuLT5mdW5jID0gJnZtd19nbXJpZF9tYW5hZ2VyX2Z1bmM7Ci0JCW1hbi0+Z3B1
X29mZnNldCA9IDA7CiAJCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0NNQSB8IFRUTV9N
RU1UWVBFX0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExf
RkxBR19DQUNIRUQ7CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVE
OwotLQoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
