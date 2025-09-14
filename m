Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD45B56855
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 14:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB4D10E237;
	Sun, 14 Sep 2025 12:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="imz9D0ZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6032D10E22F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757851722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
 b=imz9D0ZWulrhNzDA9ecq5NsgrmHxFAE22jVC/qw8KJNN3prtT1ImYL6dKQcMGnMcfjN3kg
 7pNJnJJPgdc0tTAKSAcvFfU3XnvL9LT/4du4A/9qLEu6VFkP3vCO4nCQ6T4QEks20jA3g8
 81W68oipXGK5MKoYBJ5XpezqP5DZzuQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-4PyHVYKOMEOJu-tfmcrP3g-1; Sun, 14 Sep 2025 08:08:39 -0400
X-MC-Unique: 4PyHVYKOMEOJu-tfmcrP3g-1
X-Mimecast-MFC-AGG-ID: 4PyHVYKOMEOJu-tfmcrP3g_1757851718
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-81312a26ea3so906251185a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 05:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757851718; x=1758456518;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
 b=dFi7kRvSJ86aDk5hgqQGPF2I8pnm9Yv4EAKXo/JyvrX+oYiGWp/t8o78C93dSepoBv
 noDv5jj0FVckI4qi1n2kiA4uB8QLsGbX5Ta/VG/B9ZsAVQBYJpzRtggz9/KffPWoK7FS
 sP7Y5fafRBDv+3MvBeOciOAwFU/YJXfd4b8XcCZAGucB7wTbix+/8QriKhEn6D+MY2ug
 NmJZ1KFE686AB7nFxT3+mq9TP7nxZE1mkXCrJ5Oqxlt2LvhXO2TV8vjQo2iAhvMS0j5T
 5Lijxyjds58qHMnWRqgQ1fP6Jg/dWBgDZ/Q/5GVqwT8W9SJmPqpSCO3SL3/J++Hw2Xni
 gi1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZTXMuwoOLGoGqy8VphAAMlegWQq7WE6wjJEDhrzVUpfXbykRfZqGSroByAar2GVx0T6WqsfCW4Xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo5aGcPGuHxQ3GjUdFoje1OrlLCOOfMg0qCYXNCEfDj7kDL7P5
 CA9TtQ3HIJACGNgoyx3QsUmcWClWlsfsYpONbO41uXNY3+CyGDdmvKmtJmp/ZCnyaEIu4xWHVmS
 rS8xcDWC2OvDdwkhTcSk1jLA6sG/TZ2C+D9IQ7WLiODCyvFyF7U7wrOXwNLL8Qv8YTrVwBQ==
X-Gm-Gg: ASbGncvupm08kC/Ck4W0dGYeZNgEsVxfQzwzjXmmWbsRpqGmc36/odMn+ZdN7yiw8Ym
 +XK2uvfW0Sd01LCq8XvVwyLCSJDtwU1GeTsZFZALOv1tgpmbC2j3JBPWXOZXKlYwqHPdfvaR2yR
 FfelelWUjFW+4K5u0dFDTHOg3g9Zqot6pImU7n3FoDyc81+gapmrbk9NRIgs1ps06in29fMEQml
 WPo2Koba1VWjfvj13Fy3vxsjxfm9Tg4DstnjKFts2P2W+BEqnk9+TPpkRb0fcAdRUdEEnf0Q8yk
 YeYiqphZmATWj2+gtYez3qSmzyElfIbRuU4J7mpx1mNtP7/Vr+15QAQO/La4+Ap3Z1HA0/+Q9k0
 HOhz6f+dkRJ3scFin4i8ldUYp3yIzavs=
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id
 af79cd13be357-82401a95c9bmr1036169785a.69.1757851718251; 
 Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdCKGXPgtbhvJpUCdDwCaaC2B0DLna/CzbBAvfkLzYJU98qL9IvUSFcqawGBto49lPMPxgQ==
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id
 af79cd13be357-82401a95c9bmr1036164085a.69.1757851717778; 
 Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-820cfcaca15sm580413985a.71.2025.09.14.05.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:08:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMawQYUIjPw9m4IO@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LLNrvIAK34iCHbfZX2RfSOYeG8vO4m5Ouk_pDF2juFc_1757851718
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

Hi all,

On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v1:
> - Drop space after the cast (Maxime)
> - Added various Acked-by and Reviewed-by tags

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

I'm not sure which tree(s) this should go through. All of the patches
except patch 1 have at least one Acked-by or Reviewed-by.

Thanks,

Brian

