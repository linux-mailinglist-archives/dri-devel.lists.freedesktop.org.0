Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E68A6A7C4B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 09:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962FB10E38D;
	Thu,  2 Mar 2023 08:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B763210E1CE;
 Wed,  1 Mar 2023 17:25:46 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f13so56908036edz.6;
 Wed, 01 Mar 2023 09:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=StPWDobta73ip1qDTST6ZbHesp2pu7tDl2nHqqljCSg=;
 b=AX6dkWbGG7HI7qWP8CQ2n0fejalpaDQtYhUXIEsv9EbPRRD47CjPsul90m5PkZAmAO
 KKduqdAX8ad+UjyKoLhYhCjC9Z53VJcJkA7RBtvbcCVVg0P+kDlYQwgrLjmtPqZ28vfo
 Lcevqt3SnDuifMdPCh6ZgEXiPNEhK8fNp6JA/MK5DloTwx6SjgUQbAsLqM0YExtZOlhE
 c035ccUmu2uAKpuLFDA4Uwh1h3+f/Mtaz0bUOh/Jd6cRGtUHi/QP2hUjuWzKtcD+XbDX
 eTKbcgoQXyUDA7qbqR+CmWDe//fPLfzbpXvA4+mKQSzKCmB6TP8fnRB0nnYhqkPyVS2K
 JZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=StPWDobta73ip1qDTST6ZbHesp2pu7tDl2nHqqljCSg=;
 b=QZyvSOyXcb0G6KHbmoW5SjmOpN6ww+hSz8cSGmtcqCRkjfy6P07a4jQnEM/GKLD9Jw
 4QBSbAnW7gC0mvA+GzHwsCa2BapmAYhd1EPLWfAwDvD5bRdCEnUc2Ed5p0ixsRz26hyH
 KaTwU3tMh0gYWey7l37u4UhNV9lyQHtbKBU4Fb6RBUEm+iZF7c3ZJE/ENvduW7ea0gE4
 nHphuV3g6Qg/IbjyQUTrlIwOG5rUWS8anT05t/VmZ6XFNPtV+Aks2p0YZBB0gKXcXSle
 fUibAywFYWJwaMQdL3vMmh1WAjw29dRmpmMJIGHjW8/7YNqNsEGTNPkhHVQoVv71cNH6
 bMxw==
X-Gm-Message-State: AO0yUKWbCBvPLUUUqAsXaiRdB8sIjPgsZY07l1CFOz47YfiYQ8UOUrCE
 fVOBNSlyScUhin9gseP0br4=
X-Google-Smtp-Source: AK7set+hg3kOeoOWYBWlvzIhtELcU/JRDHSU+x12DxpDjzNnm58yMunzJ50vgAJ2p6Dz+DqIBA6Srw==
X-Received: by 2002:a17:906:aaca:b0:878:6477:d7 with SMTP id
 kt10-20020a170906aaca00b00878647700d7mr7041024ejb.72.1677691545111; 
 Wed, 01 Mar 2023 09:25:45 -0800 (PST)
Received: from [127.0.1.1] (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.googlemail.com with ESMTPSA id
 v23-20020a170906489700b008e9ac1ad79dsm5974715ejq.194.2023.03.01.09.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 09:25:44 -0800 (PST)
From: Jakob Koschel <jkl820.git@gmail.com>
Date: Wed, 01 Mar 2023 18:25:38 +0100
Subject: [PATCH 2/2] drm/nouveau/clk: avoid usage of list iterator after loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-drm-nouveau-avoid-iter-after-loop-v1-2-0702ec23f970@gmail.com>
References: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
In-Reply-To: <20230301-drm-nouveau-avoid-iter-after-loop-v1-0-0702ec23f970@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677691543; l=1723;
 i=jkl820.git@gmail.com; s=20230112; h=from:subject:message-id;
 bh=cB1L+buYcR+Tpr+4lhFvQl5kYWyprM+RBeyV2GzjhSo=;
 b=CEGNMg2otXSMBx1WQApv1HsHMopWqKLPZgrWcoZGewVvf/Xlo1d5jWyKYFGMquZX2RVdLaQPeqUL
 neXY1hPKDE8yiBEM2brKl63q2RgIUrUzEYQgrSoMVWjniUabUl+H
X-Developer-Key: i=jkl820.git@gmail.com; a=ed25519;
 pk=rcRpP90oZXet9udPj+2yOibfz31aYv8tpf0+ZYOQhyA=
X-Mailman-Approved-At: Thu, 02 Mar 2023 08:12:47 +0000
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
adding a BUG_ON in case the code works incorrectly, exposing currently
undetectable potential bugs.

Additionally, Linus proposed to avoid any use of the list iterator
variable after the loop, in the attempt to move the list iterator
variable declaration into the marcro to avoid any potential misuse after
the loop [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index da07a2fbef06..871127dfe1d7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -269,14 +269,17 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
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
 
+	BUG_ON(!pstate);
 	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
 	clk->pstate = pstatei;
 

-- 
2.34.1

