Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA046A98
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC34893A3;
	Fri, 14 Jun 2019 20:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A3D8952F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:52 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z25so5220410edq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+bK7h8pAB2XmRfGoVqd/4EaL8VhKCPAJ1OR9nXXdkdc=;
 b=Qox9Mn0TNTSMJibqjjuDtQxJFkbxQe3R4pF+/o4owNSu/e9+wv0QnX7CqIc0LMxYhX
 LKCk5qkHPMGg/HLvsqMQNTj5zOHcRg5+zicravuWomcqGBI1NHM4MA6DlJh385WtAzmY
 DQ5PiAL9TC1U1UD9oReN+76hYezbf29M0J6AiaxClMZlsR1cDw52+BVqu1J1eDprHimD
 CK2PWDkasaE583HG0I2OT8QPYAxT4gkuLXYNhctVgJtbf1CFfpYqlBIT5k2dtVfR769S
 ufFhiAKZrnnyG7Voi9nd5R1ZdM5BvyXQ/0Lvt7gdVM2DTtF/Jn/vk3gsZ0YxchT7YdNd
 8pQg==
X-Gm-Message-State: APjAAAWqMGGeUvXBrd3JJOt0Sz5l7/r/7n/mb36nNzyQDaUtVq2CiNAU
 Y3HaK3RcsMo1T/s/LZmORmZ98kRlQDU=
X-Google-Smtp-Source: APXvYqzD4wDOjmUlZWjBQarv3v+BxQMA2MOvu7Ph4akEc+ZSAYm7yzjW/rC60nmwc78MsAYc5VMhEg==
X-Received: by 2002:a50:90c6:: with SMTP id d6mr81978007eda.19.1560544610103; 
 Fri, 14 Jun 2019 13:36:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 24/59] drm/pl111: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:40 +0200
Message-Id: <20190614203615.12639-25-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+bK7h8pAB2XmRfGoVqd/4EaL8VhKCPAJ1OR9nXXdkdc=;
 b=iTRlfdjITFJkBlGIOojUNleKeDzPZaFQvrj2GL3n8HAAGVYIzmmeeK4NcQwA43y+RI
 yN2SiGoNPiahfdUDMygZZ6PV6cFgEfdtSlsibQ/eczRVKf508Omz6XpYZRM3U8T2ErEg
 rbc5gMWuyqWIIMVLCwVyvGeFmDruVH5zgeDgc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBFcmljIEFuaG9s
dCA8ZXJpY0BhbmhvbHQubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kcnYu
YyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9w
bDExMV9kcnYuYwppbmRleCBkZDRhYWEzODAyNTAuLjkwZmE5OWE3ZGZhOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
bDExMS9wbDExMV9kcnYuYwpAQCAtMjM4LDkgKzIzOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Ry
aXZlciBwbDExMV9kcm1fZHJpdmVyID0gewogCS5nZW1fdm1fb3BzID0gJmRybV9nZW1fY21hX3Zt
X29wcywKIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQs
CiAJLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAotCS5n
ZW1fcHJpbWVfaW1wb3J0ID0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCiAJLmdlbV9wcmltZV9pbXBv
cnRfc2dfdGFibGUgPSBwbDExMV9nZW1faW1wb3J0X3NnX3RhYmxlLAotCS5nZW1fcHJpbWVfZXhw
b3J0ID0gZHJtX2dlbV9wcmltZV9leHBvcnQsCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUJPSBk
cm1fZ2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV9tbWFwID0gZHJtX2dl
bV9jbWFfcHJpbWVfbW1hcCwKIAkuZ2VtX3ByaW1lX3ZtYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92
bWFwLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
