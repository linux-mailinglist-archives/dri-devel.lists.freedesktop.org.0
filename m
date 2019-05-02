Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA0122CD
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 21:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555C989725;
	Thu,  2 May 2019 19:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32FF897C3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 19:50:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c1so2281957qkk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 12:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFVSuZJraJRY8lf7zLGr4Icu987vmHl/cFcB0vPbwTo=;
 b=TH6bN4UNDNtAbR2JIwlu02sW9uUZbBxuwsZQvhEVE5bfT/JTigcPMPPv6sJ1KoR+Pk
 BNf79PGmNyChvzFm9C4C6gWN1Ghr1aTB2Z2IMQVKWQnGHmtb9nm7kjjdJzQaCLhm+5ko
 wE3jbqqtvE/8zo7UwNPj3oh6zMbdlMS9Qo2Mc4Y16vVSVHTBuPSLqgifidi+6KkPPEfD
 rQJFVmwnK4WMkaPouFXhqW/ASGyks7UPwoa0M3yH2sLvGdMsG2BYqDTsYVup5DXlqE7b
 udRhHi6HpcdTR5FGRk2ivCYu0vaYNZZZoVPghxjDXe7rpSxPqG7/fhnD6TsOU/gj/A9/
 Jwuw==
X-Gm-Message-State: APjAAAVTxBNhp8BgVLrnqgCvfwCriqmsvej8Vl63tMPvERdccIlhiFnc
 gNuTF0yYtRze4w8Dt5RdrjB7UtJr8RY=
X-Google-Smtp-Source: APXvYqxxFG9zgR3WVcDfPdsGy4UEJe7Y+styDVNNm4qQfqbwO4kMeleh9vCf98fyvnm6StgEl1J4Hw==
X-Received: by 2002:a37:4948:: with SMTP id w69mr4703738qka.122.1556826628609; 
 Thu, 02 May 2019 12:50:28 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k36sm34366qtc.52.2019.05.02.12.50.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 12:50:28 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/10] drm/rockchip: Use dirtyfb helper
Date: Thu,  2 May 2019 15:49:48 -0400
Message-Id: <20190502194956.218441-7-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190502194956.218441-1-sean@poorly.run>
References: <20190502194956.218441-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFVSuZJraJRY8lf7zLGr4Icu987vmHl/cFcB0vPbwTo=;
 b=T4x6TwEZL9VIqTV12O2BFwvKSIPNN7BS9WFC88TrYAEmDjgKlJUnAIv9A8+/WllSG+
 UEKM5WL87d4xq6HgqE3QULfTmN3wFg+WXSaGzcEjqq6uQdn6pexuw5YUxuP5q3MRdpP0
 k3Yla/PYmhA6I8boHirx6ETAqZNcMr0GFIBYTthqChrZ6WnGBeKxuLWO9gDaXat+vsyU
 Js1Q05cJ8VnDT9G7OdqrMODWsVG0DnZXZHIwQlVCV8LvYPk4rP4n+NCw/Sde4IGdPeGU
 uPj25y1BH/NZO8Tv8SuVdgaYxeLGgs9MTgqCN5oTiQBBzshAYGSd2uIJNLvR5KNez/+j
 a3sg==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJbnN0ZWFkIG9mIGZsdXNo
aW5nIGFsbCB2b3BzIGV2ZXJ5IHRpbWUgd2UgZ2V0IGEgZGlydHlmYiBjYWxsLCB1c2UgdGhlCmRh
bWFnZSBoZWxwZXIgdG8ga2ljayBvZmYgYW4gYXRvbWljIGNvbW1pdC4gRXZlbiB0aG91Z2ggd2Ug
ZG9uJ3QgdXNlCmRhbWFnZSBjbGlwcywgdGhlIGhlbHBlciBjb21taXQgd2lsbCBmb3JjZSB1cyB0
aHJvdWdoIHRoZSBub3JtYWwKcHNyX2luaGliaXRfZ2V0L3B1dCBzZXF1ZW5jZS4KCkNoYW5nZXMg
aW4gdjM6Ci0gQWRkZWQgdG8gdGhlIHNldAoKU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21p
dW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyB8
IDEzICsrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwpp
bmRleCA5NzQzOGJiYmUzODkuLjAyZTgxY2EyZDkzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fZmIuYwpAQCAtMTYsNiArMTYsNyBAQAogI2luY2x1ZGUgPGRybS9k
cm0uaD4KICNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+
CisjaW5jbHVkZSA8ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9m
Yl9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgpAQCAtMjUsMjAgKzI2LDEwIEBACiAj
aW5jbHVkZSAicm9ja2NoaXBfZHJtX2dlbS5oIgogI2luY2x1ZGUgInJvY2tjaGlwX2RybV9wc3Iu
aCIKIAotc3RhdGljIGludCByb2NrY2hpcF9kcm1fZmJfZGlydHkoc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAqZmIsCi0JCQkJIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKLQkJCQkgdW5zaWduZWQgaW50
IGZsYWdzLCB1bnNpZ25lZCBpbnQgY29sb3IsCi0JCQkJIHN0cnVjdCBkcm1fY2xpcF9yZWN0ICpj
bGlwcywKLQkJCQkgdW5zaWduZWQgaW50IG51bV9jbGlwcykKLXsKLQlyb2NrY2hpcF9kcm1fcHNy
X2ZsdXNoX2FsbChmYi0+ZGV2KTsKLQlyZXR1cm4gMDsKLX0KLQogc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fZnJhbWVidWZmZXJfZnVuY3Mgcm9ja2NoaXBfZHJtX2ZiX2Z1bmNzID0gewogCS5kZXN0
cm95ICAgICAgID0gZHJtX2dlbV9mYl9kZXN0cm95LAogCS5jcmVhdGVfaGFuZGxlID0gZHJtX2dl
bV9mYl9jcmVhdGVfaGFuZGxlLAotCS5kaXJ0eQkgICAgICAgPSByb2NrY2hpcF9kcm1fZmJfZGly
dHksCisJLmRpcnR5CSAgICAgICA9IGRybV9hdG9taWNfaGVscGVyX2RpcnR5ZmIsCiB9OwogCiBz
dGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqCi0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVu
Z2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
