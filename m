Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798046A75
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AD0895B5;
	Fri, 14 Jun 2019 20:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C1F89590
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:58 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z25so5220699edq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Jp/ZBCBpozIIjrEuGAM1NXn7Z/waQy3T58mrHRDl08=;
 b=iMpRyLqY2OmVAg2TJHV6KVEglTSeGFAUVqgdCaDwK9jfJPBFoW+w7aZ0DyyBxhX8f2
 1SQSwz2cy4ZX9n/hU+ugBtajuaMGWNjvl7SW/X0/UmfIasg4fEXiZ3bVKYFjQrXe89Fp
 JTiE1oBEs8VN+YJHzot6T9l2uCQlzMWt0LpwP6p1EQVt6uJjWQziXyUS/4ddPIjm/Iq4
 9ZXb1z8yl3e6PJ52UVmlWkUEqag9k+qnxYXpiQvUN7kJba60mwZGBprVWfakWvsdlXUg
 Tbn2UIQQDCtTnIXBr0Ni1h+YFWz64jt6a81tnp3/dl97j1R8m8AQSb9AiqBP67T3XMVD
 fZvA==
X-Gm-Message-State: APjAAAVSBLzYq2v/Ud4CwhSj7GkhEu8q+sHrDNzm0Li6NYhWF/XZnvvl
 75n6FnxZD6+vnMIZsgXjxmIZNrhUXlc=
X-Google-Smtp-Source: APXvYqye1d4rc6QOOp4amFPh/vCQoKOsT2Hw1sgADMdzbBIM5PXda8LQjNagp1bMKWB8l8N1qoiNAA==
X-Received: by 2002:a50:92c4:: with SMTP id l4mr135306eda.34.1560544615417;
 Fri, 14 Jun 2019 13:36:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/59] drm/sti: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:45 +0200
Message-Id: <20190614203615.12639-30-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Jp/ZBCBpozIIjrEuGAM1NXn7Z/waQy3T58mrHRDl08=;
 b=d3ipd5e8teSJYRVGO9sANncGlDO3b/L1uM+EEJURXKsSmosoRw8WWYuwe8RkJamhYN
 tlsbdGjnoyTr0/Kapb/qhhwE5Qj1VDIZHfe1Pdq1/6X+2pmuYofhKDFjm9MXJI0Sgytk
 Yr4FRkcgDqUOGirXKTNPqILJJpNwmdcnCN7lo=
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
 Vincent Abriou <vincent.abriou@st.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBCZW5qYW1pbiBH
YWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KQ2M6IFZpbmNlbnQgQWJyaW91
IDx2aW5jZW50LmFicmlvdUBzdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2
LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Ry
di5jCmluZGV4IGQ5ZjYzYzlmMjg3Yi4uZmFlYTRkY2IyMWIxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc3RpL3N0aV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYu
YwpAQCAtMTUyLDggKzE1Miw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBzdGlfZHJpdmVy
ID0gewogCiAJLnByaW1lX2hhbmRsZV90b19mZCA9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2Zk
LAogCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKLQku
Z2VtX3ByaW1lX2V4cG9ydCA9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAotCS5nZW1fcHJpbWVfaW1w
b3J0ID0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUgPSBk
cm1fZ2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFi
bGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV92bWFw
ID0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
