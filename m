Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFE227983
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF54D6E49B;
	Tue, 21 Jul 2020 07:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D79C6E499
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:32:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s10so20075929wrw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nh9YF4R80f+foSmXySs44UxAVbWDN7uFO3+6X5LLzuA=;
 b=YLtIOaFS2sriJIM48hSHciSOk9O83wz6wMPAYBAHbRlYT8qtj+qV6GQNwkV28U1DlE
 OLMX4rIjuCaY19ltCFj5LUZ5kl8GDi1oIYlsqCJp9dfhFnX+RdEvvQ5Q1CvVLJUl7OHE
 wm85hpHMUasm3n3MDLGY9gNljBDJe0OBL2WZ6r6IC9RkV/c9U2eBj5QSw129+Xjaahc/
 p7yI4rGtSMgG8WlUMg1+vXGIGW+Zq4yvDuwbSdjyrGDLk7XyBVTjOgCYE3OqRYPXbEgH
 jllT3DL4bSnGJzpqPwB6yfunsjlZZLoS7BBrkVx6xK8x5kh5w2M8TpmJ0rsI4LuYRsGO
 rvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nh9YF4R80f+foSmXySs44UxAVbWDN7uFO3+6X5LLzuA=;
 b=NgFLMBPKnf6VhcPNzqhyPNeSAiI6yTNzgReaPU0e4kC7X1rhK7uNHIFC2IsdNoJq3j
 i8brlpIvwQmxiV45+dbOPVy4Ql9XRA6bQFu3NObmqevgYMF7W6Ne5I4ZFCUQJn5kSDA8
 Zqt0pKN+zO6/dpnaKEaQ735Bq7QETT7yk9iLjaWjxoBicVyVFi+jANSQtiUy/BTL56EB
 /M6v1bCsLoLvuEJh/AVjvhL3YuUvO748kY8PYHqc1TU9kEVMT/Aq4AntuHgnNv7LP4u/
 j2PZdpYq83NebQOxM8cvyLFu1qnEFmq3nTuzctiooF6pYIKNPbHBM/LIzddx5/+8GDfw
 LaYQ==
X-Gm-Message-State: AOAM531IZ7T4jboFN70A7pub1GYlBLLJt9iz8KssyuAe0bDscRjOXP7v
 xAqFr9EON1rD7bK/4fCJyAn4/+Ls
X-Google-Smtp-Source: ABdhPJwzt/n+AnMdtoGzM378X2ahUwblu1h/+5wnkbp6o2Q0oXc1BNChPR9e8Zl4jU3E4ZeEhuTEVg==
X-Received: by 2002:adf:eecb:: with SMTP id a11mr345910wrp.339.1595316772377; 
 Tue, 21 Jul 2020 00:32:52 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5eb1:eb29:dadc:7fc5])
 by smtp.gmail.com with ESMTPSA id s4sm29740896wre.53.2020.07.21.00.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:32:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Tue, 21 Jul 2020 09:32:40 +0200
Message-Id: <20200721073245.2484-6-christian.koenig@amd.com>
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
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8IDEzICsrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCA1NGFmMDZkZjg2NWIuLmI0NzQ3
ODFhMDkyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAgLTc2LDcgKzc2LDcg
QEAgc3RhdGljIGludCByYWRlb25faW5pdF9tZW1fdHlwZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAq
YmRldiwgdWludDMyX3QgdHlwZSwKIAlzd2l0Y2ggKHR5cGUpIHsKIAljYXNlIFRUTV9QTF9TWVNU
RU06CiAJCS8qIFN5c3RlbSBtZW1vcnkgKi8KLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZM
QUdfTUFQUEFCTEU7CisJCW1hbi0+ZmxhZ3MgPSAwOwogCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5n
ID0gVFRNX1BMX01BU0tfQ0FDSElORzsKIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExf
RkxBR19DQUNIRUQ7CiAJCWJyZWFrOwpAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgaW50IHJhZGVv
bl9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBl
LAogCQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKIAkJbWFuLT5hdmFpbGFibGVf
Y2FjaGluZyA9IFRUTV9QTF9NQVNLX0NBQ0hJTkc7CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0g
VFRNX1BMX0ZMQUdfQ0FDSEVEOwotCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQ
QUJMRTsKKwkJbWFuLT5mbGFncyA9IDA7CiAjaWYgSVNfRU5BQkxFRChDT05GSUdfQUdQKQogCQlp
ZiAocmRldi0+ZmxhZ3MgJiBSQURFT05fSVNfQUdQKSB7CiAJCQlpZiAoIXJkZXYtPmRkZXYtPmFn
cCkgewpAQCAtOTIsOCArOTIsNiBAQCBzdGF0aWMgaW50IHJhZGVvbl9pbml0X21lbV90eXBlKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogCQkJCQkgICh1bnNpZ25l
ZCl0eXBlKTsKIAkJCQlyZXR1cm4gLUVJTlZBTDsKIAkJCX0KLQkJCWlmICghcmRldi0+ZGRldi0+
YWdwLT5jYW50X3VzZV9hcGVydHVyZSkKLQkJCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxB
R19NQVBQQUJMRTsKIAkJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19VTkNB
Q0hFRCB8CiAJCQkJCQkgVFRNX1BMX0ZMQUdfV0M7CiAJCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9
IFRUTV9QTF9GTEFHX1dDOwpAQCAtMTAzLDggKzEwMSw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2lu
aXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJ
Y2FzZSBUVE1fUExfVlJBTToKIAkJLyogIk9uLWNhcmQiIHZpZGVvIHJhbSAqLwogCQltYW4tPmZ1
bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZM
QUdfRklYRUQgfAotCQkJICAgICBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFOworCQltYW4tPmZs
YWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRDsKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9
IFRUTV9QTF9GTEFHX1VOQ0FDSEVEIHwgVFRNX1BMX0ZMQUdfV0M7CiAJCW1hbi0+ZGVmYXVsdF9j
YWNoaW5nID0gVFRNX1BMX0ZMQUdfV0M7CiAJCWJyZWFrOwpAQCAtMzk0LDcgKzM5MSw2IEBAIHN0
YXRpYyBpbnQgcmFkZW9uX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9v
bCBldmljdCwKIAogc3RhdGljIGludCByYWRlb25fdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkKIHsKLQlzdHJ1Y3Qg
dHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bbWVtLT5tZW1fdHlwZV07CiAJ
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYgPSByYWRlb25fZ2V0X3JkZXYoYmRldik7CiAKIAlt
ZW0tPmJ1cy5hZGRyID0gTlVMTDsKQEAgLTQwMiw4ICszOTgsNyBAQCBzdGF0aWMgaW50IHJhZGVv
bl90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0
dG1fbWVtXwogCW1lbS0+YnVzLnNpemUgPSBtZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwog
CW1lbS0+YnVzLmJhc2UgPSAwOwogCW1lbS0+YnVzLmlzX2lvbWVtID0gZmFsc2U7Ci0JaWYgKCEo
bWFuLT5mbGFncyAmIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEUpKQotCQlyZXR1cm4gLUVJTlZB
TDsKKwogCXN3aXRjaCAobWVtLT5tZW1fdHlwZSkgewogCWNhc2UgVFRNX1BMX1NZU1RFTToKIAkJ
Lyogc3lzdGVtIG1lbW9yeSAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
