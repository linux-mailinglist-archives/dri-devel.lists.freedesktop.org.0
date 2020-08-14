Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74632446BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 11:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9104A6E3CB;
	Fri, 14 Aug 2020 09:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2C56E3B5;
 Fri, 14 Aug 2020 09:05:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so7301318wme.4;
 Fri, 14 Aug 2020 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FRiW1Elr/x8IcnH5oDivRHtQDqhp3psZM/q1XqqJd+8=;
 b=IaeMj5YrQjmeSYlQymZF5ltHBecSzZN1LBxijJpTup6E+ri1rV9KZciVcKE9+xX9Zr
 zqqex1do9T8NRAOAnsvEe9SCUVdbZ5vgkeWNFiAiG5oOe7yf1WJSWeE/+TTjig4g0CGO
 C8iby88ZvVnUaBImRH7Eh7NIiWZJMua5dZnMS9NazDHKFwWL86qsQKyazcNcWOy/4Qte
 /Il56dDTM3YH21sIZOKzgi73ULtlzvxHnV0XL0oaFdfgxA8uY33eT/OkMXFaWg1NaKvE
 NSZx1QF5gZhixel8bKXip8GrL6yzBW82e7yt+3uRV4UR8YcS2SrRRYfiemMrm7SnUYS+
 CywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FRiW1Elr/x8IcnH5oDivRHtQDqhp3psZM/q1XqqJd+8=;
 b=my4gi1ldzastk25H9gdy74j/JxLzW+t9xB6FO/NOKfF7ARhoqYbO6xvx4U36mTbrkU
 C5WYxLPS8w7+DdmC7cItmXLCZmLfvCMUM+iPRwHLBgiOFWm3iWjoHnzPjlnd1SWpz8pk
 ceay/hVbpd5CaSbXeT1IE5lpdZeyLz96OBwkzo6UAgv5XVUKfq0Croaj/4WSGeUfC2Zz
 9Y328DDEX+bVQiUBfP3x78E5isnn3doCu9Q7pmWB1rpVrXpaY1nBHW1sDg+m1QuNlLiC
 xssAfr6C4nyN74ReXlmQDMnGgtcRhmS8oC2Vo9mD1XoyJ+5AcJwUP9Hp2WTGKxqdbo1n
 aAaQ==
X-Gm-Message-State: AOAM530Ykf8FbPkZ8g91QgMZKT35Ac1AFADgmpQ9IkZjn/ZH5LIVlhTl
 LhhdaTQLS8+uEDe/b5cbREk=
X-Google-Smtp-Source: ABdhPJxcA0z3DyBBeEfPBHlnZCHhDaVgwVd4ie4kjFb6CqHsvDp8ta/YN5s9RU5snoxuowNrYSXomw==
X-Received: by 2002:a05:600c:4112:: with SMTP id
 j18mr1573533wmi.187.1597395929922; 
 Fri, 14 Aug 2020 02:05:29 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id m14sm14046745wrx.76.2020.08.14.02.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 02:05:29 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/etnaviv: call perf_reg_read(..)
Date: Fri, 14 Aug 2020 11:05:02 +0200
Message-Id: <20200814090512.151416-3-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814090512.151416-1-christian.gmeiner@gmail.com>
References: <20200814090512.151416-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the open coded access pattern with a function call.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index 1f0402f7a7de..782732e6ce72 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -58,8 +58,7 @@ static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
 		clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
 		clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(i);
 		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
-		gpu_write(gpu, domain->profile_config, signal->data);
-		value += gpu_read(gpu, domain->profile_read);
+		value += perf_reg_read(gpu, domain, signal);
 	}
 
 	/* switch back to pixel pipe 0 to prevent GPU hang */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
