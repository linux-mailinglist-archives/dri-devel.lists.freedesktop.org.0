Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAD12C2CF
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2019 15:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C2E89E9B;
	Sun, 29 Dec 2019 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF2B89948
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 20:28:52 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id n59so6459286pjb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2019 12:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KOo3X0X88vmmzo/eTEi6Meu4cmZqVttPr6kyKScWgTk=;
 b=Av9foxReTwVBkrERfdI7jObfw7XU7uwXaEfaCXIqfLHdVEXqrCSYJ39gOZKjlp2kes
 0xFAmV9nUD99y/X+MHgPFTebv83wZASZYC7z1eBXvo4wftRBJPOECX12nkf2h0LN/jQc
 QNd7ypLlyARjjLmKnVPpnzk9FUDoq6IRH5r5Pu/+DV35NkLCfa35cq6oEtkARtRKH1pI
 UmMV7yiR6GAqqAnteEQLEErxIMlqV7ysoaokTvMUMgm9/vg1IrI6PKjq/OjkztjUHf8E
 C5ej8G1xJ/lzDUgd63jscyelh8JhuB9rPoHnZGODxNPlZRIo0pSfVW8Iq2QQZ9UJZEEW
 W10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KOo3X0X88vmmzo/eTEi6Meu4cmZqVttPr6kyKScWgTk=;
 b=bamIP1IBVOKeQs1C4EubfpwfOA9xTmbNa+kr0nNSvdlMJ6BxSMJa0IAF8s1DDHqDIQ
 yqrBwPJb+xqdr2WJ6IUaQb9SniDeNrrIxaEL2t4urbONfvCE4AbN9IT57wl21SRHBP0a
 HwDM1RRpNsYZTwFl5pidx6kS1F6GOO4T4FCx92sC+t948Lb8vcHhU01zmD0PCr4udVRf
 pKx9XTA6zKvPk50zxtXO1ThPzq3OmXL/D+k4cyjsse6DOGjVh9Tucm4z1lwXgOu0vE+A
 Sl05PmyP7j5NzZIxOq/8UknwVfDA/4U2Q+CGWilp4lyQCIysoYeIvgqUuvVXNEhTNYrr
 Uv9A==
X-Gm-Message-State: APjAAAVUMUs5qxLMerZ0unlcF1hJotbjjwSnA1TexyOYs3HNrXbrGAyU
 WfDreOYBK4CEGciofKFvw7Y0/Q==
X-Google-Smtp-Source: APXvYqy26/nSwCXwDQ5FV/Q/JeyaQxDibPHagpFbTwkrpyLRDOjoMJfa0xhhgtqgIqdL3EaJKpEQIQ==
X-Received: by 2002:a17:90a:b392:: with SMTP id
 e18mr35842386pjr.118.1577564931719; 
 Sat, 28 Dec 2019 12:28:51 -0800 (PST)
Received: from virtualhost-PowerEdge-R810.synapse.com ([195.238.92.107])
 by smtp.gmail.com with ESMTPSA id i68sm46771169pfe.173.2019.12.28.12.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2019 12:28:51 -0800 (PST)
From: roman.stratiienko@globallogic.com
To: mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@siol.net
Subject: [RFC 4/4] drm/sun4i: Update mixer's internal registers after
 initialization
Date: Sat, 28 Dec 2019 22:28:18 +0200
Message-Id: <20191228202818.69908-5-roman.stratiienko@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228202818.69908-1-roman.stratiienko@globallogic.com>
References: <20191228202818.69908-1-roman.stratiienko@globallogic.com>
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:43:42 +0000
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
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roman Stratiienko <roman.stratiienko@globallogic.com>

At system start blink of u-boot ghost framebuffer can be observed.
Fix it.

Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index da84fccf7784..b906b8cc464e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -588,6 +588,9 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_DBUFF,
+		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+
 	return 0;
 
 err_disable_bus_clk:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
