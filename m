Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C12433E8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 08:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E576E27A;
	Thu, 13 Aug 2020 06:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C886E24E;
 Thu, 13 Aug 2020 06:21:18 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v4so4940655ljd.0;
 Wed, 12 Aug 2020 23:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C9rQWo6syT3cF37ubQbW7IMBpmbXyJ1+Ny4Hmm3+D9g=;
 b=IdrdS+jhl4Oa2APlUEh5hsmWHLnjlvcEeLbNwd/9wCAajQpSXHE0zHJiFdgcdiK26J
 WFO1pugdzNj04qdFOagFuIp86Sv+478MpJWML1/H1kFhojn/ZOWrcGdudLoSBrsxQlzR
 EcAC59A3E3nwwwp9ENtv3ctQM7YTyIq69C2d3wIoR6R4PQMfsF7LGC2lLBut5bKO3Zu/
 4WoL1gVFon0Xdx/deulTB/UQkk/ztsecEql/JO68s3NP1mEPDzfT/LNeQz9VllyIv0PT
 9Tj8AssK9SOO8AwcvjXm8WGOQKyaIJFbORNO4CgMimKGYH01+Ebjmr55PZr3TuSs8iQd
 jupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C9rQWo6syT3cF37ubQbW7IMBpmbXyJ1+Ny4Hmm3+D9g=;
 b=JjwCWVSgCFUeIiYvYMd0Cl4mc1544GYbtlOAFbCnNN41DLjcU2Gr+OeIzHqXskMI0E
 m8sP//hsqhp1rmL7y2kzUM+gprgJY63CoVDgdzBpCM0nXk0a8HiidMJmP2BN/mzO9+Be
 JVjp0bE2TyBR5WdFdttCyc1yerncDK+98HFvHvYRvFVCSEtyfgEoiLbZY3jGG4ZwyWf0
 HVsr9jWAYENfyx79fJMXpJPyf1geCbFmpUGVBvUu7Dj+dSmA1TS42Fs35Y1ok0U32WDk
 QbJSEB1SVECivWgbo5p4v5y8twlrU/oxvTMYW3kwAgHSaCfU7RG1do0AXSQEDUxxdSW1
 EmLg==
X-Gm-Message-State: AOAM5322w+Doe3CT+uTugmD/hF1QOWtoOgkEw7xp5RUMRBtgARW0mJg8
 WnrhbrJEm4ib/WZXs2/Tewk=
X-Google-Smtp-Source: ABdhPJw/Ec8BtgwxAUxLq9z6Cta34KMASOkvjBC0EU4THFS9zVDqv01yrhycLJUzJXCaRxXFKv6jLg==
X-Received: by 2002:a2e:8098:: with SMTP id i24mr1308903ljg.50.1597299676613; 
 Wed, 12 Aug 2020 23:21:16 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:16 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 1/5] xen/gntdev: Fix dmabuf import with non-zero sgt offset
Date: Thu, 13 Aug 2020 09:21:09 +0300
Message-Id: <20200813062113.11030-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 stable@vger.kernel.org, dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

It is possible that the scatter-gather table during dmabuf import has
non-zero offset of the data, but user-space doesn't expect that.
Fix this by failing the import, so user-space doesn't access wrong data.

Fixes: bf8dc55b1358 ("xen/gntdev: Implement dma-buf import functionality")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Juergen Gross <jgross@suse.com>
Cc: <stable@vger.kernel.org>
---
 drivers/xen/gntdev-dmabuf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 75d3bb948bf3..b1b6eebafd5d 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -613,6 +613,14 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 		goto fail_detach;
 	}
 
+	/* Check that we have zero offset. */
+	if (sgt->sgl->offset) {
+		ret = ERR_PTR(-EINVAL);
+		pr_debug("DMA buffer has %d bytes offset, user-space expects 0\n",
+			 sgt->sgl->offset);
+		goto fail_unmap;
+	}
+
 	/* Check number of pages that imported buffer has. */
 	if (attach->dmabuf->size != gntdev_dmabuf->nr_pages << PAGE_SHIFT) {
 		ret = ERR_PTR(-EINVAL);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
