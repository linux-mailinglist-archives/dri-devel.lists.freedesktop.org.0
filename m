Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456F6B8CD7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A2010E71E;
	Tue, 14 Mar 2023 08:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827C610E52C;
 Mon, 13 Mar 2023 13:55:13 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id da10so49147443edb.3;
 Mon, 13 Mar 2023 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678715712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YQMWWiVCaLWuBxIvo4NBZRafIwrEjOq/YzvonHvtnhU=;
 b=Yf0R58L3Yy2Z5DOHytLD67pMKox+tlfR+N8fFQJFfVdDiVsavKYbShOCBIHGh24jas
 uvgceGV9qq7wSvvXzPkTCVDWW5wndpGNB26vpGMGl6wbArRl0+dDWjx9+Fxm70jcD8mB
 gRKguTqTvFXK/qfHfDJFxIAib43ryxD8vJ0AltSkPbDENLMCr2aKzqfQTCppGQys0QPF
 QSoA/1j8xP1nY4YaBIgpYrfJ+9GgrZbrXIz3adgWk6sTzlckwVMwmRwOcDp8Dyc6lBWm
 YThHHjz1VFw5p4RXlqrB5l2ljWmiI0rm9bI1C0s0Rlslxlq4Ke8m0/2YObWekNkOcwi/
 kPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678715712;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQMWWiVCaLWuBxIvo4NBZRafIwrEjOq/YzvonHvtnhU=;
 b=naC6xwAvMR1VU0LTFr+bZiug0ow/iUmQkKFxfmslRb+OliaNJ//bWdScPWYKHOSj1E
 EmDBlcDwwPfkTNf/lnU11qMHi3Sh5IaTDCZhDUe3vD+2yHloNJjyl0Kd2ZjFtV7Ez74E
 r7ImMMXKco3zEhk2or7wNjEvbLBK8xhLxamWHi0DoWkM+MIIeh3iTX0hYcAUCgneN4m6
 sRW6fyuEOE208mdO5+9EcjCZUuAton0yOuMpaUUet5M5GAPND3UPy/zWZj2keg2T4XZY
 ZGTfla3kqbzHQn7D8zA3rKNNOlbvuKufGaPxVGhoYQnACaVYffjavAI2sGy7kq0JxAJV
 YzNw==
X-Gm-Message-State: AO0yUKWGaCrF02d3hy1uJooIIXdpc+c51HmpNC1OVCGkmI3DfQNZKj8n
 yj0wlr3YHmXnksiPhRwDroo=
X-Google-Smtp-Source: AK7set8lCGoAX0P9HXROv/p6iMsiXt3USrbD9mK8YRTNkUxIrbZz8XA1726UaEDnrGS4sMrE1NMvGw==
X-Received: by 2002:a17:907:6e15:b0:8b1:75a0:e5c6 with SMTP id
 sd21-20020a1709076e1500b008b175a0e5c6mr47095276ejc.18.1678715712008; 
 Mon, 13 Mar 2023 06:55:12 -0700 (PDT)
Received: from [127.0.1.1] (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.googlemail.com with ESMTPSA id
 t29-20020a50d71d000000b004fb419921e2sm2100094edi.57.2023.03.13.06.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 06:55:11 -0700 (PDT)
From: Jakob Koschel <jkl820.git@gmail.com>
Date: Mon, 13 Mar 2023 14:54:49 +0100
Subject: [PATCH v2 1/2] drm/nouveau/device: avoid usage of list iterator
 after loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-drm-nouveau-avoid-iter-after-loop-v2-1-1e6428cc7fa8@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v2-0-1e6428cc7fa8@gmail.com>
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v2-0-1e6428cc7fa8@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678715710; l=2039;
 i=jkl820.git@gmail.com; s=20230112; h=from:subject:message-id;
 bh=RCUT54CX+NpzTn0yHGplIg6IrZjwVxr6QHVNRA20sLQ=;
 b=qci++s58ATu52iCe714PEq1foIrqUIYGQGQsmHIFjf3jzCx35PGOL4mU7B8vhy/T+RFJT/iwr8JA
 8wBfR15GDIsxqU5hr0ujxz0IA9OaAMuiBuMzXoIBPrtJJPdzmUuA
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
 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
index ce774579c89d..8ae14ab8f88e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
@@ -72,7 +72,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 	} *args = data;
 	struct nvkm_clk *clk = ctrl->device->clk;
 	const struct nvkm_domain *domain;
-	struct nvkm_pstate *pstate;
+	struct nvkm_pstate *pstate = NULL, *iter;
 	struct nvkm_cstate *cstate;
 	int i = 0, j = -1;
 	u32 lo, hi;
@@ -103,11 +103,16 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 		return -EINVAL;
 
 	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
-		list_for_each_entry(pstate, &clk->states, head) {
-			if (i++ == args->v0.state)
+		list_for_each_entry(iter, &clk->states, head) {
+			if (i++ == args->v0.state) {
+				pstate = iter;
 				break;
+			}
 		}
 
+		if (WARN_ON_ONCE(!pstate))
+			return -EINVAL;
+
 		lo = pstate->base.domain[domain->name];
 		hi = lo;
 		list_for_each_entry(cstate, &pstate->list, head) {

-- 
2.34.1

