Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26128D27EC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 13:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FEC6EAB2;
	Thu, 10 Oct 2019 11:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7817F6EAB2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:26:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n14so7387253wrw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 04:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y/trWjZjJb5g3dh+vO7EAbZ8m3rG/AeEZE8Ir4+f/hg=;
 b=Xus0ByPuf/u3g+a8TH5xmzOnLk7boWbLoNsMmBThctII4yUWL06zaS4WoCOepeAS5h
 gNojP9+jcsrhJjojWD6dU5o5+bKnnpVoWoB5qpw1MqgRdtmBxTu4OAZDIuzoEzrqIwUt
 M65cQtHmcW9IFTYVzE9KdpiL+ElW4SpovD4kq5HtDAMuN3wLENlyycqcuoPRv609jA3K
 c6aT5PskPwltWIGcSXyEnY04QcV6Owzx3E2jiC2LmFy+mz9AAWXMnf7Hc16Wv5JeqZx9
 on9LO8NC/nVulH17WmJTKHhHk6mKu0tg6MZN4jSwVHnI4saEWvt4kMjWKbaCU1D9tKSS
 ml2w==
X-Gm-Message-State: APjAAAV1NwYm+3Nfk0iwrcett8Y49+FTvvhCV4fzifyi1QWSprOuxhf9
 HLMRqNIUclyndfsUMXs0gk3rVJUc
X-Google-Smtp-Source: APXvYqwdMD4Cwlgu18hPJY9eZfBdI0zB++2dmbH82+/hN38W0VfwaetMWzNqhRen/8/mrEFs/QtvYw==
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr8359906wrw.286.1570706810980; 
 Thu, 10 Oct 2019 04:26:50 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:6d07:3b23:53da:25f2])
 by smtp.gmail.com with ESMTPSA id q66sm8006770wme.39.2019.10.10.04.26.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 04:26:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, Kevin1.Wang@amd.com, Hawking.Zhang@amd.com
Subject: [PATCH] drm/ttm: fix handling in ttm_bo_add_mem_to_lru
Date: Thu, 10 Oct 2019 13:26:49 +0200
Message-Id: <20191010112649.12015-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y/trWjZjJb5g3dh+vO7EAbZ8m3rG/AeEZE8Ir4+f/hg=;
 b=dQL23x8sV4+SyvghEa0hfOrUlnlJ3QWsheXDkwbOlJK/tMFVPYFwDY5e8ZAJl+QnS+
 q5beUrsar2Ab5yXophoUAfRRv/xGUUmLx7LHnXHnvSV12TZ86DASbNURUS7dNO+YDcTM
 Jzgiv4inoaz5K7BhK723ku6w+aBVYxGbTJmNgFhzKuU/o/JQiVZvCG3a4bvmtkiWbxBV
 gnXOk2brbeH1L/WwU018gpwO26ZNgO5FP277tM4L/7iiDquG8qHSIDka+IJ2ytR7lfEV
 DXH23IO3DgggL9hssj7wgwbThx2fnJrI7qEZofSfr2R1393i/1ucCJ1/yrMchDMIY0Nw
 I/pA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkIG5vdCBhZGQgdGhlIEJPIHRvIHRoZSBzd2FwIExSVSB3aGVuIHRoZSBuZXcgbWVt
IGlzIGZpeGVkIGFuZAp0aGUgVFRNIG9iamVjdCBhYm91dCB0byBiZSBkZXN0cm95ZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKaW5kZXgg
NjM5NGUwYzVjYzAyLi5jNTFiYjJjOWVkNGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpAQCAtMTg1LDgg
KzE4NSw5IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19hZGRfbWVtX3RvX2xydShzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLAogCWxpc3RfYWRkX3RhaWwoJmJvLT5scnUsICZtYW4tPmxydVtiby0+
cHJpb3JpdHldKTsKIAlrcmVmX2dldCgmYm8tPmxpc3Rfa3JlZik7CiAKLQlpZiAoYm8tPnR0bSAm
JiAhKGJvLT50dG0tPnBhZ2VfZmxhZ3MgJgotCQkJIChUVE1fUEFHRV9GTEFHX1NHIHwgVFRNX1BB
R0VfRkxBR19TV0FQUEVEKSkpIHsKKwlpZiAoIShtYW4tPmZsYWdzICYgVFRNX01FTVRZUEVfRkxB
R19GSVhFRCkgJiYgYm8tPnR0bSAmJgorCSAgICAhKGJvLT50dG0tPnBhZ2VfZmxhZ3MgJiAoVFRN
X1BBR0VfRkxBR19TRyB8CisJCQkJICAgICBUVE1fUEFHRV9GTEFHX1NXQVBQRUQpKSkgewogCQls
aXN0X2FkZF90YWlsKCZiby0+c3dhcCwgJmJkZXYtPmdsb2ItPnN3YXBfbHJ1W2JvLT5wcmlvcml0
eV0pOwogCQlrcmVmX2dldCgmYm8tPmxpc3Rfa3JlZik7CiAJfQotLSAKMi4xNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
