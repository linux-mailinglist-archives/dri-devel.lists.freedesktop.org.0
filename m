Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6ED22798C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C466E4AD;
	Tue, 21 Jul 2020 07:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A096E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:32:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z15so20105665wrl.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ch2kIWgFul/v2zi1QavBA7Yr3j8xKwaOWUgt3Bt16sA=;
 b=ZcO7lxLjHhQ6DYtxTCGX36JhVBc/SdHIzRtsn+vjYqFyecuakwo5o0aTdmMCYRg3sS
 ZdTXShorrziTm+n47Tr7SbfCRZ4lZ11/mQ5S9NNModo2aVGHJqUjRdbo3AN8s+0XW5+Q
 sZsqSMCoKuDjqc9odzEZvDl2MYfmNiMmkmjzJI75ruN0xuSvGPuaITin6Vjx/QFU6x+B
 ly6Vl+I5SpkQbUYx8nxQFAAAd9xi+0Nc8ZYhgLI3HSbru7DZsoU5zJoEiLj4bikqSKip
 DkOm+HQyJdsjH+gdiRbf2pE4eoiMwkxe9wLpI4WGGYzXgZvDxZPqouEVosga+mFgsthw
 LmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ch2kIWgFul/v2zi1QavBA7Yr3j8xKwaOWUgt3Bt16sA=;
 b=Y/btDi7sAUAUtD61DYL0ZU6BP4K0krDkGpbXhXOVXyBewjiiPhyKHEfGhylQxS5Vvk
 ppXQZBqBLQ3SbQaaHX/dYq6Lrc2HW8WFMGRGfuKY/C1khNaVKT55IlBeLnWyyt/xoUmd
 RiviEpI7yVdqx6FDVj6cNtu6gKIvr6HVh0+ryWXY4HqKso8ckTM6Z0yEUChEK0LNpRhC
 JN8PWGEK/LaqMSoG5GV0gHkM8T9H3KZ+qTI5MMDYp/Lt3SShd4fbwqzNAx1yo2WEaQRg
 LfvKqRy/+h2a/3asxP/I65prl5YS5lGYcgUuY233G4PnFLvDeT0d4mX9xvCiSgjpuI7m
 n0wg==
X-Gm-Message-State: AOAM532WE/vbTX1oHjR0n5yszSCgppjhavyM2J3Z/KQ+qj6f6mO2NBHY
 GIY+C5km2dfW30dJxnhAsdVRs2pi
X-Google-Smtp-Source: ABdhPJx2IbixkXmpvIKln0wGU0mfGNeYQvv3Y9FKfula+jif34dnBb9swAJoHEb/ZGAvKEi+xr1SNA==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr2494595wru.19.1595316776400; 
 Tue, 21 Jul 2020 00:32:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5eb1:eb29:dadc:7fc5])
 by smtp.gmail.com with ESMTPSA id s4sm29740896wre.53.2020.07.21.00.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:32:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/11] drm/qxl: stop using TTM_MEMTYPE_FLAG_MAPPABLE v2
Date: Tue, 21 Jul 2020 09:32:44 +0200
Message-Id: <20200721073245.2484-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721073245.2484-1-christian.koenig@amd.com>
References: <20200721073245.2484-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUgbWVtb3J5IHJlc291cmNl
cy4KCnYyOiByZW1vdmUgdW51c2VkIG1hbiB2YXJpYWJsZSBhcyB3ZWxsCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgfCA5ICsrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCmluZGV4IGE2
ZTY3MTQ5ZWY0YS4uMWQ4ZTA3YjhiMTllIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYwpAQCAtNTQsNyAr
NTQsNyBAQCBzdGF0aWMgaW50IHF4bF9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCXN3aXRjaCAodHlwZSkgewogCWNhc2UgVFRNX1BMX1NZ
U1RFTToKIAkJLyogU3lzdGVtIG1lbW9yeSAqLwotCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVf
RkxBR19NQVBQQUJMRTsKKwkJbWFuLT5mbGFncyA9IDA7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hp
bmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwogCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9Q
TF9GTEFHX0NBQ0hFRDsKIAkJYnJlYWs7CkBAIC02Miw4ICs2Miw3IEBAIHN0YXRpYyBpbnQgcXhs
X2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUs
CiAJY2FzZSBUVE1fUExfUFJJVjoKIAkJLyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwogCQltYW4t
PmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBF
X0ZMQUdfRklYRUQgfAotCQkJICAgICBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOworCQltYW4t
PmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRDsKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGlu
ZyA9IFRUTV9QTF9NQVNLX0NBQ0hJTkc7CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BM
X0ZMQUdfQ0FDSEVEOwogCQlicmVhazsKQEAgLTk5LDcgKzk4LDYgQEAgc3RhdGljIHZvaWQgcXhs
X2V2aWN0X2ZsYWdzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiBpbnQgcXhsX3R0bV9p
b19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJCSAgIHN0cnVjdCB0
dG1fbWVtX3JlZyAqbWVtKQogewotCXN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0g
JmJkZXYtPm1hblttZW0tPm1lbV90eXBlXTsKIAlzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiA9IHF4
bF9nZXRfcWRldihiZGV2KTsKIAogCW1lbS0+YnVzLmFkZHIgPSBOVUxMOwpAQCAtMTA3LDggKzEw
NSw3IEBAIGludCBxeGxfdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LAogCW1lbS0+YnVzLnNpemUgPSBtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwogCW1l
bS0+YnVzLmJhc2UgPSAwOwogCW1lbS0+YnVzLmlzX2lvbWVtID0gZmFsc2U7Ci0JaWYgKCEobWFu
LT5mbGFncyAmIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEUpKQotCQlyZXR1cm4gLUVJTlZBTDsK
KwogCXN3aXRjaCAobWVtLT5tZW1fdHlwZSkgewogCWNhc2UgVFRNX1BMX1NZU1RFTToKIAkJLyog
c3lzdGVtIG1lbW9yeSAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
