Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC046A93
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A52895C4;
	Fri, 14 Jun 2019 20:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D693894FF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d4so5185830edr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUyS4oh7ne5G6guKuPCoJTFw8Ikiy+4dtCVWiWa5zOM=;
 b=qw54aHggTpgeXw2PK5dTiEmUf1qeWTwXL3lqQ4roJMVmDnXvQYsoEvQSglk8AyPV/l
 Ek9HRQg6kawc2DIT+yH/LWMide4FPmgXD+tWD1RDcAMxtWqunqAC9lhwBGxThm/p2iYR
 OFQTVfFxysVLvXnYvNqEkMW1Xu90mx4LOTkWLOf6XAcDU5Rkd4+fw0kdvJpGRFFbPhCi
 zzM5aZkK/njr27pYy+b0+rmgRz0ZgTuGRIUwWkIbx12rr2waK1oTmL0e7EiQba6uRH1a
 FQFb2k6FCnI+OtYWbZAxqf2J4bPj1xvUaufwoOr93EHAoagKDaDEE71b+1RK4WvguUdG
 v9xg==
X-Gm-Message-State: APjAAAVRjGHUVqofzzTFc3Z69bhLRXYyowdhJrfPMAjQ1zgM0NdFvaae
 ltAR//Ah/4mYLQRVXbmJKU+L9yhl/Hs=
X-Google-Smtp-Source: APXvYqzfaPfBwhE/kF9nG/z+DPo2wrV/gVYsQLX/wbCHGWEoZ9Jv+BOD9Ia3qbcMAD9P5neyGwORFQ==
X-Received: by 2002:aa7:d297:: with SMTP id w23mr30363401edq.128.1560544606834; 
 Fri, 14 Jun 2019 13:36:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 21/59] drm/msm: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:37 +0200
Message-Id: <20190614203615.12639-22-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUyS4oh7ne5G6guKuPCoJTFw8Ikiy+4dtCVWiWa5zOM=;
 b=HfaBpbziLn3BuwY5H6ZWUTIasJ+xUD/GK/Ox0TYfaYrMCqeTDXP8yaG0PKq3zPdTct
 t0BWDfruvSoOMjUI4DpjIyMDqAsJTD1v2VNzAuUjStwtL7kfJaWV1vRamk1ffA4Nsasj
 3GyqnJcO1iDWWvmxcBa6fuyxOQ2fEPdSB+myg=
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6
IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkNjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgfCAyIC0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCmluZGV4IDg3Zjky
ZDM5MDZhYi4uZGE1YTg4NDEzOTY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwpAQCAtMTAzNCw4ICsx
MDM0LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIG1zbV9kcml2ZXIgPSB7CiAJLmR1bWJf
bWFwX29mZnNldCAgICA9IG1zbV9nZW1fZHVtYl9tYXBfb2Zmc2V0LAogCS5wcmltZV9oYW5kbGVf
dG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJpbWVfZmRfdG9faGFuZGxl
ID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmltZV9leHBvcnQgICA9IGRy
bV9nZW1fcHJpbWVfZXhwb3J0LAotCS5nZW1fcHJpbWVfaW1wb3J0ICAgPSBkcm1fZ2VtX3ByaW1l
X2ltcG9ydCwKIAkuZ2VtX3ByaW1lX3BpbiAgICAgID0gbXNtX2dlbV9wcmltZV9waW4sCiAJLmdl
bV9wcmltZV91bnBpbiAgICA9IG1zbV9nZW1fcHJpbWVfdW5waW4sCiAJLmdlbV9wcmltZV9nZXRf
c2dfdGFibGUgPSBtc21fZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
