Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF786B8CD8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5709A10E721;
	Tue, 14 Mar 2023 08:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2567910E52C;
 Mon, 13 Mar 2023 13:55:14 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h8so5278527ede.8;
 Mon, 13 Mar 2023 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678715712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RY44wE5Zf3Qg2T9mU72PQt2uHP5JYVZeIe8fJ7oNxPM=;
 b=pcGnzneuaKGE4blA3zuuNOqNY9NMtQDjpckvbe1I+lLf07kBZICQT7L3As0gtmwhgv
 6cIAL6PMjQ4ZVTEfHSlj74klXNN4DyrhbM3ujzSLnZBV9dxligmZNkiBZHWRSV+1S9o2
 151UDKg9FElIjqL5jwz/4KrJ51KUhNFfUK+LHPH/dyakaw+VjGcQEPyKraUl4I+ptMLX
 SltvBrXCXF3plq+lBWmLe1hGUg15EJwbeHSBgAQyh2srJkWnrKdgqYJuD+SjGobqI+Mt
 5/2U9KgROelHxnSvalJp9VhtZT4wOanaogjQKXKTALBkhYkYsuVLbNLxYjeawtGfJ5nR
 IYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678715712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RY44wE5Zf3Qg2T9mU72PQt2uHP5JYVZeIe8fJ7oNxPM=;
 b=ea6ZbNCr7pkcFjA7Nh8wIYEKcVroVQsw49TtR/ABcNMvyMnlqbYykZdTPscF5+ezui
 BEvv7dImLrbPrQrtL7JjdyFQDXH8+yEH3GkpPyQJZEAuzx1vaGwbnYFbj5WnTad3DlZ0
 yKV/FfonSK0nrglu8r3CEAmB8hgi8cdlU9MmrBPbYCO6q0/LKn9/Avj73tN0oB9jQzfm
 0TlQsXbLCgUwzDkWgZlQcTcANkI2NUaxs1WtSfHo/5hGqDb8qTGBTLaF5OZuqwGKOJpv
 L5K22wWAx/vxw1eYWmsLkeGpqUSLW6Kl4SnMYKknCYSdC7LGRgKlWyK+RIMOcutX8Z1j
 K2hA==
X-Gm-Message-State: AO0yUKUPzjvEQam0Mg4CiJQvQQCuBBqv9TzwJkyskLbD8UZFKxMXTgEO
 UVo+R82VamkI3FdK1c6juuDomCNpeHeYeQ==
X-Google-Smtp-Source: AK7set/oUpv9sBq1JPG9coxkkekJhneZsLg56G1jZS+XVI5QRGYu30go1o76ONx7s2BXms9DRo/hTw==
X-Received: by 2002:aa7:dad2:0:b0:4fb:fd9f:7372 with SMTP id
 x18-20020aa7dad2000000b004fbfd9f7372mr4275567eds.8.1678715712509; 
 Mon, 13 Mar 2023 06:55:12 -0700 (PDT)
Received: from [127.0.1.1] (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.googlemail.com with ESMTPSA id
 t29-20020a50d71d000000b004fb419921e2sm2100094edi.57.2023.03.13.06.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 06:55:12 -0700 (PDT)
From: Jakob Koschel <jkl820.git@gmail.com>
Date: Mon, 13 Mar 2023 14:54:50 +0100
Subject: [PATCH v2 2/2] drm/nouveau/clk: avoid usage of list iterator after
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-drm-nouveau-avoid-iter-after-loop-v2-2-1e6428cc7fa8@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v2-0-1e6428cc7fa8@gmail.com>
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v2-0-1e6428cc7fa8@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678715710; l=1752;
 i=jkl820.git@gmail.com; s=20230112; h=from:subject:message-id;
 bh=+zVBUXeTd83iixQiNFVbeFsaMnjJfrzAURHoSipLKdE=;
 b=+Ppw0na6R2sFWbyq4/6Xs6V1INOYzd/bKFad33nQ+IyQdKHYoeWHWQPP5Vy45XD7U8t4YJZ2Kd84
 xukkecmDBAbu5sAbRfBxiBNJg8Hj8Ty1jNCO8Cg/hDBEqRXkD2qT
X-Developer-Key: i=jkl820.git@gmail.com; a=ed25519;
 pk=rcRpP90oZXet9udPj+2yOibfz31aYv8tpf0+ZYOQhyA=
X-Mailman-Approved-At: Tue, 14 Mar 2023 08:16:08 +0000
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
Cc: nouveau@lists.freedesktop.org, Pietro Borrello <borrello@diag.uniroma1.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Jakob Koschel <jkl820.git@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If potentially no valid element is found, 'pstate' would contain an
invalid pointer past the iterator loop. To ensure 'pstate' is always
valid, we only set it if the correct element was found. That allows
adding a WARN_ON() in case the code works incorrectly, exposing
currently undetectable potential bugs.

Additionally, Linus proposed to avoid any use of the list iterator
variable after the loop, in the attempt to move the list iterator
variable declaration into the macro to avoid any potential misuse after
the loop [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index da07a2fbef06..d914cce6d0b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -269,14 +269,18 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 	struct nvkm_subdev *subdev = &clk->subdev;
 	struct nvkm_fb *fb = subdev->device->fb;
 	struct nvkm_pci *pci = subdev->device->pci;
-	struct nvkm_pstate *pstate;
+	struct nvkm_pstate *pstate = NULL, *iter;
 	int ret, idx = 0;
 
-	list_for_each_entry(pstate, &clk->states, head) {
-		if (idx++ == pstatei)
+	list_for_each_entry(iter, &clk->states, head) {
+		if (idx++ == pstatei) {
+			pstate = iter;
 			break;
+		}
 	}
 
+	if (WARN_ON(!pstate))
+		return -EINVAL;
 	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
 	clk->pstate = pstatei;
 

-- 
2.34.1

