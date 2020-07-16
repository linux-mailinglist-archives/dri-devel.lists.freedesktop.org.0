Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CA2222DA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709B76E222;
	Thu, 16 Jul 2020 12:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181AF6E222
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:50:43 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so11525289wmf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jOa2WyobN/6mvqZxpF7+Iz+WO1Tz3EGHp3pswI1bT8U=;
 b=KINGhUCVspXXcZfWavrGJVA5M5qUFFCj17A8Z62NlXyko3WmJdYAJ9QW0ZpGO/fOMg
 /2t3G9aJGcKJNFe3lqVVM0e4i0Sk/SLpw65+XSpBMfC2hwYXj7UXPNih/y9BQW88R24T
 uXvGYmouxpInukL3gk2mlmXH/KWi+/l3XhH4qaOQ9J1fOVml798YxOMHSb7bneNAI+ND
 95I7vzEg4if9V8V+mUaU0TzVyj192iBYVshgMKn0iPQa3CJtbU3k3AiYUWNVhTpWXiRo
 QWPslVgES3tDtvIqBi89Vl78DhMkfNyZeonc18Y+JNpb76387Gow+ka2sm4m0HMjX/Dp
 /yEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOa2WyobN/6mvqZxpF7+Iz+WO1Tz3EGHp3pswI1bT8U=;
 b=kGdCqIZNBTwopPdD20AxM9gwZ5EpeMXFReTcE8kfWftHy9tESRuJCQCulWQ/seZL62
 4FT1Wrv6l/HGxMWapmhJHPU/qeBxWRwx60hXTXRTsB3bmaMC0CsbXoRTBoS/QazXOJLb
 umDXmj2Ap6BJmNut36QwRUfi6fkZeb5TSpUFWy5AKtF97+Qn2PQkpHIL88MstsYKKqhs
 hnz/9NfGFhRGof7hPAW+qLstfir1uzK0KO4Kki7+1W1yxO7TXqSnXJeh6juWyt6EUylh
 3mLClMn0D/weU+Jw839uc7JHCynDA3KeYm79HU0HITTggLFso55tIKVcdQ9V29ZNm6cl
 iyLw==
X-Gm-Message-State: AOAM532gKyWdUA9Td0FLhAuCGOuLwyy2K+6/IVj9RX/ZsRPhhUeq7K/2
 mZndUV9BGd43RuK2hlIGN+z5JIXW
X-Google-Smtp-Source: ABdhPJwICcVc1zu1qxx1HXFFANJmIMFHaqnTGg4Uegdi+ozrWDJKhffpnwziHHdUZxZZxof3D34gBA==
X-Received: by 2002:a1c:7916:: with SMTP id l22mr4050177wme.115.1594903841449; 
 Thu, 16 Jul 2020 05:50:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:efc1:eb01:18eb:bff2])
 by smtp.gmail.com with ESMTPSA id z25sm7669872wmk.28.2020.07.16.05.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:50:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/vmwgfx: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Thu, 16 Jul 2020 14:50:32 +0200
Message-Id: <20200716125037.67437-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>
References: <20200716125037.67437-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUgbWVtb3J5IHJlc291cmNl
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgfCA5
ICsrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKaW5kZXggNmJl
YTc1NDhhZWUwLi4xZDc4MTg3ZWFiYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X3R0bV9idWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF90dG1fYnVmZmVyLmMKQEAgLTc0MiwxNSArNzQyLDEzIEBAIHN0YXRpYyBpbnQgdm13X2luaXRf
bWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJc3dp
dGNoICh0eXBlKSB7CiAJY2FzZSBUVE1fUExfU1lTVEVNOgogCQkvKiBTeXN0ZW0gbWVtb3J5ICov
Ci0KLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CiAJCW1hbi0+YXZh
aWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCW1hbi0+ZGVmYXVsdF9jYWNo
aW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwogCQlicmVhazsKIAljYXNlIFRUTV9QTF9WUkFNOgog
CQkvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCiAJCW1hbi0+ZnVuYyA9ICZ2bXdfdGhwX2Z1bmM7
Ci0JCW1hbi0+ZmxhZ3MgPSBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEIHwgVFRNX01FTVRZUEVfRkxB
R19NQVBQQUJMRTsKKwkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQ7CiAJCW1h
bi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7CiAJCW1hbi0+ZGVmYXVs
dF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOwogCQlicmVhazsKQEAgLTc2Miw3ICs3NjAs
NiBAQCBzdGF0aWMgaW50IHZtd19pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LCB1aW50MzJfdCB0eXBlLAogCQkgKiAgc2xvdHMgYXMgd2VsbCBhcyB0aGUgYm8gc2l6ZS4K
IAkJICovCiAJCW1hbi0+ZnVuYyA9ICZ2bXdfZ21yaWRfbWFuYWdlcl9mdW5jOwotCQltYW4tPmZs
YWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKIAkJbWFuLT5hdmFpbGFibGVfY2FjaGlu
ZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExf
RkxBR19DQUNIRUQ7CiAJCWJyZWFrOwpAQCAtNzg5LDcgKzc4Niw2IEBAIHN0YXRpYyBpbnQgdm13
X3ZlcmlmeV9hY2Nlc3Moc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0IGZpbGUg
KmZpbHApCiAKIHN0YXRpYyBpbnQgdm13X3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCiB7Ci0Jc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+bWVtX3R5cGVdOwogCXN0cnVj
dCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYgPSBjb250YWluZXJfb2YoYmRldiwgc3RydWN0IHZtd19w
cml2YXRlLCBiZGV2KTsKIAogCW1lbS0+YnVzLmFkZHIgPSBOVUxMOwpAQCAtNzk3LDggKzc5Myw3
IEBAIHN0YXRpYyBpbnQgdm13X3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwgc3RydWN0IHR0bV9tZW1fcmVnCiAJbWVtLT5idXMub2Zmc2V0ID0gMDsKIAltZW0t
PmJ1cy5zaXplID0gbWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsKIAltZW0tPmJ1cy5iYXNl
ID0gMDsKLQlpZiAoIShtYW4tPmZsYWdzICYgVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRSkpCi0J
CXJldHVybiAtRUlOVkFMOworCiAJc3dpdGNoIChtZW0tPm1lbV90eXBlKSB7CiAJY2FzZSBUVE1f
UExfU1lTVEVNOgogCWNhc2UgVk1XX1BMX0dNUjoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
