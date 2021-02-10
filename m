Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A58316AAC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 17:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F8D6E321;
	Wed, 10 Feb 2021 16:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E636E321
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 16:05:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id q2so3649176edi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 08:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/LJSMSnOUZXdAr1zayBL9FVpjNwWh6HQVcuhizDP7E=;
 b=j/iJlzE6SNUtbDlh2NOFxPsJxjtbqNa8V4eevPE6IW0WrIbCnxSH8GPBdEoYSWP3gn
 Pcc4qse/0n96/Mrct/TDGPTzQEDpeer0gBMVDsqHVQwzkTrjmKUWsyMxnqc2/tOvYevV
 FS9ayaAXscQnadw2+vwYBB9iwz96gJ/UHDKvTlg2UY3NBwB48b/jHPu/0RqZXH9CP5ku
 dL/R3yF1BAA5KjzF+p/iDrU4+G7UGNvSz8AY0KBIXf87T+3BUCF4c+hMQLnV/Mk2NJdE
 VsRu3EgyFzdjq42jdphDaiNy3GZpngAZrY49WigiOp4DTaiWWkKdg8x5U8nHR4VueZog
 l6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/LJSMSnOUZXdAr1zayBL9FVpjNwWh6HQVcuhizDP7E=;
 b=O49rhe6yC5Zcxm1doMg3NPFkaWA4ovjmasowXT8hwSqLKGi1uYjDPOH68eRGZBg5Ax
 qLBAGFTdnwkCXPOhG7/6p+eLzXb6nKIgOTs021U6MaTbAg6vFmZVsOPo5KAKg8+FD+yi
 BJc3MVRDeGW3xz+PdieqEv0x0mbkb2T0ymimWiwV2CWEHRyt61c2NdUsDEPQXqarcUCl
 bhnD9YMev6dzJyYNgVbtbKs7Iml0TGJzc/agQA8bf6sOZSi5q52Qa+rNvphm3mX+Ab5h
 7R5HYeL+zaPwcIsEDA5b/9vSaAddIHETpVEzpWisAAE82whf0IS1RpVcsn6gHpWchpAx
 iI2w==
X-Gm-Message-State: AOAM533KCSaWb0DVbyCqZtbhNQ0bebLuAQotUe1NzXSnio99hDEf47Ve
 MHv2+UeWBLTR9E7jRs9DM9CUJDWVk45YJg==
X-Google-Smtp-Source: ABdhPJyVS9rWi0i5yBAnXcuoxcw3nIgg1XugXMng7l1b3uFTijhmddhQCMtE8WjcCb9BFFEmjlpyjg==
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr3762361edp.319.1612973151327; 
 Wed, 10 Feb 2021 08:05:51 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f16b:8c3:1c30:3103])
 by smtp.gmail.com with ESMTPSA id w18sm1410164edt.8.2021.02.10.08.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:05:50 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	ray.huang@amd.com
Subject: [PATCH] drm/ttm: make sure pool pages are cleared
Date: Wed, 10 Feb 2021 17:05:49 +0100
Message-Id: <20210210160549.1462-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: efault@gmx.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG9sZCBpbXBsZW1lbnRhdGlvbiB3YXNuJ3QgY29uc2lzdGVuZCBvbiB0aGlzLgoKQnV0IGl0
IGxvb2tzIGxpa2Ugd2UgZGVwZW5kIG9uIHRoaXMgc28gYmV0dGVyIGJyaW5nIGl0IGJhY2suCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
ClJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6IE1pa2UgR2FsYnJhaXRoIDxlZmF1bHRAZ214LmRlPgpG
aXhlczogZDA5OWZjOGY1NDBhICgiZHJtL3R0bTogbmV3IFRUIGJhY2tlbmQgYWxsb2NhdGlvbiBw
b29sIHYzIikKLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCAxMCArKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wu
YwppbmRleCA3NGJmMWM4NGI2MzcuLjZlMjdjYjFiZjQ4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fcG9vbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wu
YwpAQCAtMzMsNiArMzMsNyBAQAogCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVk
ZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KKyNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+CiAKICNp
ZmRlZiBDT05GSUdfWDg2CiAjaW5jbHVkZSA8YXNtL3NldF9tZW1vcnkuaD4KQEAgLTIxOCw2ICsy
MTksMTUgQEAgc3RhdGljIHZvaWQgdHRtX3Bvb2xfdW5tYXAoc3RydWN0IHR0bV9wb29sICpwb29s
LCBkbWFfYWRkcl90IGRtYV9hZGRyLAogLyogR2l2ZSBwYWdlcyBpbnRvIGEgc3BlY2lmaWMgcG9v
bF90eXBlICovCiBzdGF0aWMgdm9pZCB0dG1fcG9vbF90eXBlX2dpdmUoc3RydWN0IHR0bV9wb29s
X3R5cGUgKnB0LCBzdHJ1Y3QgcGFnZSAqcCkKIHsKKwl1bnNpZ25lZCBpbnQgaSwgbnVtX3BhZ2Vz
ID0gMSA8PCBwdC0+b3JkZXI7CisKKwlmb3IgKGkgPSAwOyBpIDwgbnVtX3BhZ2VzOyArK2kpIHsK
KwkJaWYgKFBhZ2VIaWdoTWVtKHApKQorCQkJY2xlYXJfaGlnaHBhZ2UocCArIGkpOworCQllbHNl
CisJCQljbGVhcl9wYWdlKHBhZ2VfYWRkcmVzcyhwICsgaSkpOworCX0KKwogCXNwaW5fbG9jaygm
cHQtPmxvY2spOwogCWxpc3RfYWRkKCZwLT5scnUsICZwdC0+cGFnZXMpOwogCXNwaW5fdW5sb2Nr
KCZwdC0+bG9jayk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
