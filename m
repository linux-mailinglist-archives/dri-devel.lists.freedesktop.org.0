Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E82C5506
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791666E8BD;
	Thu, 26 Nov 2020 13:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C346E8BD;
 Thu, 26 Nov 2020 13:11:46 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id oq3so2850747ejb.7;
 Thu, 26 Nov 2020 05:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ayVFJXZeXClTN8F1XCZLR+XMeYkY1uGuEPT29OAqMsI=;
 b=tuNFTGInNQHWSgwNbroX9P6JCuNmNsPAU/EDDWxInoKw2+wL41qehgBg+i9AbL0Zj2
 mhWF10qsNQVyEpVngBBY17eU64Rr0PLZPrwMmsota8Z2tnZeQ+ZZ0pTm/mX9Vt5O/SEd
 CONMrjG/Isq2RSHl8cQJkLSQf+094Gw4r/AwkYpQDdhaqIwCkSPDP4l62bUTnALtpRjQ
 j582vMO2O6Xdzpqxant4ZMyvIbswP4wOUFWqrx30rPJBZ5levsShUvkA/5dS+pwehUGH
 fpgnEwChSJmreS1APcCWXbs5TiUi+1FBlCq+CCGVRKibw+DwhlGFktP9RALWYzWRFvlA
 PrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ayVFJXZeXClTN8F1XCZLR+XMeYkY1uGuEPT29OAqMsI=;
 b=YF5z8hapOU36vG41qDSJeXWK6ONj/XbTQZRFLvqnm0hAmYPQpdZwX/gJ8vY35R2tAo
 ZBM03UNa4qj5SpTCtuXg+XMKIPCfavvQBDHqn6306o8GGMZowcoOTyVbUAAPLphCFDIy
 YqtFpTV//kiuCewW9QWwpRDz8VjD5WGUICbd4ZaoKenwTI7nwuidwnmYrbuizoNGuqo9
 yKHI9ywf4LRn6QpY4cDJ7XtsLsd6U1A/qianHkryHJHb2YeNmctaXQj8wT8b8PRXRP1S
 V/ylYKc5TSKa/LcMYYUSUDRXXK+xYKKqA5Sl2JJjFPd2CuyHSBHmPecBwguiNxVOYRs/
 o5vw==
X-Gm-Message-State: AOAM532taHQmlMYkmArCNDUfFGyeZuaVVXPRVqxiiLlZqoM/x0naEt5w
 Kb1W1IDOXdCAimS41Gy8QcwDiucEMnM=
X-Google-Smtp-Source: ABdhPJwu6aTzxgw6HzgySrB/xCV69nqEV4lQf5pmiPNFSeV7eClZYwIJI4n6pRg9PZVDwln3/8yRdQ==
X-Received: by 2002:a17:906:95c5:: with SMTP id
 n5mr2493327ejy.263.1606396305109; 
 Thu, 26 Nov 2020 05:11:45 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4f62:4fbf:4efb:d41b])
 by smtp.gmail.com with ESMTPSA id 65sm3278833edj.83.2020.11.26.05.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:11:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: make sure ret is initialized in
 nouveau_ttm_io_mem_reserve
Date: Thu, 26 Nov 2020 14:11:41 +0100
Message-Id: <20201126131141.15060-1-christian.koenig@amd.com>
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
Cc: airlied@linux.ie, dmarkh@cfl.rr.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3YXNuJ3QgaW5pdGlhbGl6ZWQgZm9yIHByZSBOVjUwIGhhcmR3YXJlLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpSZXBvcnRl
ZC1hbmQtVGVzdGVkLWJ5OiBNYXJrIEhvdW5zY2hlbGwgPGRtYXJraEBjZmwucnIuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfYm8uYwppbmRleCA3YWE0Mjg2Nzg0YWUuLjQyMjkyYjNhNmViOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTEzNSw4ICsxMTM1LDggQEAgbm91dmVhdV90dG1f
aW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fcmVz
b3VyY2UgKnJlZykKIAkJCX0KIAogCQkJcmVnLT5idXMub2Zmc2V0ID0gaGFuZGxlOwotCQkJcmV0
ID0gMDsKIAkJfQorCQlyZXQgPSAwOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXQgPSAtRUlO
VkFMOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
