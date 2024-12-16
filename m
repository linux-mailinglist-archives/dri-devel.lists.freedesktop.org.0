Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715F69F3E40
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E790410E636;
	Mon, 16 Dec 2024 23:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kmQx/pS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA1610E636
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 23:32:22 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso41606581fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 15:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734391940; x=1734996740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1Cfk/7g+t1GRw1goaFtL/LZY8tayLYomKg/dpZTcZpQ=;
 b=kmQx/pS+jZds4kb2olX1FB9rij0iIdWVQH5ddcH/w9VxL29oRhOC1UqDSpSN9yyvgs
 c0aT6CMZLimFqnuTjTjXSOPGU35KTj7pjVf61Bl4ym7W3+1xoDuBlu5zrRl0OE7v66cu
 CSPg4aV7CEIWgR65Zom0ij8K89WomcPUaxX3L/tnviAyLKVcLw65kseBGpn4a8r1YQ2U
 cuBWaaUstwsQHHclybtZSZOjF4o11ry7u4sbsSwQgWMtqQPXDbwm7EYyWLj9EbobSTiW
 Hxobfuup8qMTF7yMIvg/ySXmI5I30PqYhW7TbvVESk/WSWebnOKigGUw+0GW+fyFDbrk
 +lXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734391940; x=1734996740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Cfk/7g+t1GRw1goaFtL/LZY8tayLYomKg/dpZTcZpQ=;
 b=XsPnCyzNMbZMsxsu6W+OJzlxGYqEbMi/MKbCPGPJU/GcTZNPM9Omm60WQxyU3xiICp
 owj3nZuHPJ4vwrue/sTn+SdA3u3dEFLowgnWOyZ2+DDhZq1dCiIzt//FUaLWkwJ7Q7MV
 dnR4GbJrMwBE9Eb9S+c6E8kpWeKQhlxWmRL3rWjPMl52qAIxRt1ZQ+XWctTDAZrrP5Zd
 2ZbFDFgzrJ9/9jRsMAxrKz5r1iRLhBJTP5x5AZD670l9Fs/uuCqjml4apa8+XklqvX7k
 eQmsDzxxdoEsskmMHZyuR893ho0JZGlguWwR6z2XwVPSDs/JfBP7mA1GtYXkZVj9VPwV
 9G+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW7N2k7TgngJwsmre8dMlcorJH9ZC8TN8VYGqzml/tcTfJhA3Cb9qnHaJkKq82p0Fcw7nAYZYljKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTADLqYe/sWizVFm/oRRYwKC+qQW1rSWuNS6GyZJX9N/fs0B1G
 UTbcOoqqHy3uKiijYJFFRRWSuWhLzgA8pDM2hois3+CSdnQ2tDu5agqV9opVl+A=
X-Gm-Gg: ASbGncvZJlj4+/Nf3qc9voMrv3fm0ADkdYcnJA9Pvz6ZVKk70GzKfZoZx+lr+aD2mG+
 Af4YYfehtTw+ne2W62/tLfKvDGyK4HvSyfqIRkZWv582wNFu+DUXpv2KMs3RIV8A0+TTKIkBPwx
 dbQH1qtp0OWLbCTufryHI9PKMXfHjvU8XFFHWP9ZBKuurVRqjg+yyF1P6djxQAoLzbEmu9pXVc9
 V7IYnolOGGKrF1f7c2H5MOmF1SL4GO4DBmSC7SJYbe2qlmODYvLTvAk3BydKGNmYTqZoozK5BMK
 fkles4gdLogr+B016VhEGy9Tqlv1UGqppz9d
X-Google-Smtp-Source: AGHT+IExbDP4ZD+38wPFlh6U/Y0lAF16Pi2yC5D/nYasWPaCFGvjIV4X6v/981M69tb+UUwL3mWvhg==
X-Received: by 2002:a05:651c:995:b0:300:1947:a28c with SMTP id
 38308e7fff4ca-302544b12a7mr59678521fa.26.1734391940315; 
 Mon, 16 Dec 2024 15:32:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344046c9asm10636321fa.50.2024.12.16.15.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 15:32:19 -0800 (PST)
Date: Tue, 17 Dec 2024 01:32:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge-connector: Prioritize supported_formats
 over ycbcr_420_allowed
Message-ID: <dn625hkcujqlre74wu3hezlcbkxza5urydgcl3kvs3exbr4tl7@rpznp2zefpoe>
References: <20241206-bridge-conn-fmt-prio-v2-1-85c817529b88@collabora.com>
 <uw7uqw6zsmoe2cyxe3mqm3ok43afut47jms37nny6ecl44b5xe@byagwnayplse>
 <d1fe66a7-c495-429d-9908-6f4076a994da@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1fe66a7-c495-429d-9908-6f4076a994da@collabora.com>
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

On Tue, Dec 17, 2024 at 01:17:48AM +0200, Cristian Ciocaltea wrote:
> Hi Dmitry,
> 
> On 12/10/24 3:12 AM, Dmitry Baryshkov wrote:
> > On Fri, Dec 06, 2024 at 10:00:46PM +0200, Cristian Ciocaltea wrote:
> >> Bridges having the DRM_BRIDGE_OP_HDMI flag set in drm_bridge->ops are
> >> supposed to rely on drm_bridge->supported_formats bitmask to advertise
> >> the supported colorspaces, including HDMI_COLORSPACE_YUV420.  Therefore,
> >> the newly introduced drm_bridge->ycbcr_420_allowed flag becomes
> >> redundant in this particular context.
> >>
> >> Moreover, when drm_bridge_connector gets initialised, only
> >> drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
> >> the equivalent property of the base drm_connector, which effectively
> >> discards the formats advertised by the HDMI bridge.
> > 
> > I think this should be handled in a different way: during HDMI connector
> > init verify that HDMI_COLORSPACE_YUV420 matches the
> > drm_connector->ycbcr_420_allowed value and rejects incompatible
> > connectors.
> 
> I added a 2nd patch in v3 [1] to perform this verification on HDMI
> connector init, but I think we still need a proper handling of the
> inconsistency at bridge[-connector] level. I simplified a bit the initial
> approach, hopefully that would bring us closer to an acceptable solution.

I'm sorry, I first commented on the new patchseries. I think that the
second patch is enough.

> 
> Thanks,
> Cristian
> 
> [1] https://lore.kernel.org/lkml/20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com/

-- 
With best wishes
Dmitry
