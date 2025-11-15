Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E760C5FBD3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9A210E284;
	Sat, 15 Nov 2025 00:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F6P/x9aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE6710E284
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 00:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763166468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
 b=F6P/x9aCvDfl6GcuUO7XUBHxvBrAibq0xTTIi3MlvdauPMmV5/mNMdGsgv8YuQ/e/qLajD
 J4mU349AewLwzU8iTgREZBE5gZ1Vf5MyW6nAHYTMBL2sp9UpkMW9EMpLy3AM9qyJeTQNH5
 rzFl4+kY5DyXb4qUf6/Q7QMRXfUCd60=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-fF78kBVuMmij0T5QJnNyEA-1; Fri, 14 Nov 2025 19:27:46 -0500
X-MC-Unique: fF78kBVuMmij0T5QJnNyEA-1
X-Mimecast-MFC-AGG-ID: fF78kBVuMmij0T5QJnNyEA_1763166466
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8804b991976so71296726d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 16:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763166466; x=1763771266;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MY79eneNfrMG9dz4hIdkivq1gZvCTrtfj5tzDev1p4M=;
 b=pNSL5dqi2XJAYMVwGpXsrgkOyGl+1j+kV6PhdBUHagaxP+wdgUK8pM5VaLSKiHbG8k
 GnE8ssSTDNKLJzolCgIj/MAdaOahT6Gor+tH63xEV3gPumHyY9DM8j+MZFGJRcXUpSOD
 kN4Xjq81PBB69OKve6Kua4hEPb8oXvN0t17ONDe8JxAB8qhx459+jM8ykQ+emriDr31r
 anVk4P95YMr0P/RVFwVgfs26L/cb/FMIHt0VDgH5RTXNy8edHctGBR7OhwtezR/r6rgW
 Yzavj93U1rG2ptjH48rnDGmTRVEZq1RzvXMko3K0KiV0ZM0WltOJamQTdLz/BH1H0knI
 Ho7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Z78hdSpKv7h61q858LS6+fgY3vrxfJiH9fyG273URLzDeQX8xuHv0hBma/8i1oFS5rQdFhV0o5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBlulilXAg89zq/QkyRbBKDnqx8/8xX3Vs7Q4mDXBA5CPyD/58
 69d/+dh54DD+iPYG86DgdRoVBhoO8I1YiAu2gAKQSpNzeDmrAMIcLIUllDAWLnrXdG1NHsgYgwm
 ctg15S5vuB0sX8bkWRSg23+xMxT5hmIVSa2rZXj1g8+DaX51MfLjpNNZ159K6S7JHzGCQ1Q==
X-Gm-Gg: ASbGncsegwM4OEpb+COYWnXE3ncmgJwgzioJqOdykJPchmTMVFwhBsm3Uj1+Abz/wsM
 hOl/gURw9+uUN6dZ+CSK0kaSq5Stpxd9IezuPquJ2553DpRglk90uxKJfAxViLBL9ke+w+u/gp7
 /C/759A1ik1BZ/yQr9wmMXyF/TLWDMebaTyEmHDd1Wi5EgMoA3KphzPbYTlFG3OIJ05QQ56kzt7
 dfO7LUPlWVkShFXYIgNDFQ6ACqd118/UMPB5Hiqs/Lt8TzWuCxGLqb6ve4uw4DzVmDWZTVdbqo+
 bLc1FG4jQK1o8NfGXCDVUQhFXl0yxa6J3PXGbAQl9UCw/KJEwggDf3Ubf2dl6e2+eOtbpQiQ8T+
 b4zo/rcm7+1IQgbzJalnQq2DbfXc23e6zih4gLtDt/xRd
X-Received: by 2002:a05:6214:5014:b0:882:4be6:9ab9 with SMTP id
 6a1803df08f44-88292705010mr65042366d6.54.1763166466367; 
 Fri, 14 Nov 2025 16:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGraWChEBaQ8Kt2DRqLdXdplufLvs8tWzEMELdXUg1GXFx2RN4xE4J+31DR8rAVpI9IzMPVUw==
X-Received: by 2002:a05:6214:5014:b0:882:4be6:9ab9 with SMTP id
 6a1803df08f44-88292705010mr65042096d6.54.1763166466020; 
 Fri, 14 Nov 2025 16:27:46 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8828659e0fcsm41781696d6.53.2025.11.14.16.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 16:27:45 -0800 (PST)
Date: Fri, 14 Nov 2025 19:27:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH RESEND v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <aRfI_xT680E7Cf-o@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i6yr-N8ZuomDi0otyv18sVGbxD4iAj8nKJBVcGICJxA_1763166466
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

On Thu, Nov 06, 2025 at 06:25:46PM -0500, Brian Masney wrote:
> This is a resend of my previous v2 series since I haven't receieved any
> feedback.
> 
> https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/
> 
> I'm hoping to get this merged for v6.19 so that I can remove the
> round_rate() clk op from the clk core for v6.20. The clk maintainer
> (Stephen) mentioned this work in his last pull to Linus:
> 
> https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Can you please take a look at this series since rc6 is this weekend? I
have almost 200 patches merged in other subsystems across the kernel
for this work since the Summer, and this series to drivers/phy is the
last one remaining that's blocking me from posting what I have to
remove the round_rate member from the clk core.

Thanks,

Brian

