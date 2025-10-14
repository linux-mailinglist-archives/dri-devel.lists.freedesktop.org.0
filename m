Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C002BD81DD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD80410E171;
	Tue, 14 Oct 2025 08:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jMtRdwIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613510E171
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:13:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso30079355e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760429599; x=1761034399; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=77ONa64qN0g6cheWy5Vrvof/4mmnbDRUL6LLOyJY7B4=;
 b=jMtRdwIbFY8tNsn6Fy0DnJCiWPWlRk7Tlw6CwCxHNq91MWxqmF5t9s/hpZmmyz59dw
 D6cn8soEMqnltM/AhkuOn8H47yTi9nbH8Zkb4Nr/AGpgOy3AkzzBpV4oAxI3t/ySOcru
 3SYlq567DFH3qtZJawfZbNG2+NkEIAnt4nC8gLuutyj3k4gwqg1dht+2ldukuBeMjZ6L
 wsFmizX0qBgQmvTZCUfcK9DgFZkGFDKW2e8+6RUOzVHhR7uhqW+R1fUKMd27iGXuw+NE
 WAMlXIshZci/LekOnU/V5uPm8KGrC/yQpNBOPEO0m5UnGS1qJ0rPlUjij1sF68rWSm6v
 gZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760429599; x=1761034399;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77ONa64qN0g6cheWy5Vrvof/4mmnbDRUL6LLOyJY7B4=;
 b=ebos8xE6+P6epd0vs+BRJkB58waEeP43hdSEzj/DFvftBxFjszxp2BVH7T26Z4JESB
 Zd6xeIeqT3xOUHkqRoRtwPEAJm7eKZx1SGsnXCvOCsZSbqVyh2J/6THCnbfoCjlsyMsb
 9970WcXNfWNElUFNleSP8nR1yxeO/5EZcoL+2GPVUGpt8eCaJxuabyRrMtWrEsdEbXI0
 STIcJeyC48jBYWjAY7yjoT0AC+/5HBN1g8IdLDOHi7hkQjL6Kf/IrEOF2SmDzdAHIp1m
 yte6QS8SOeyO9uz9kx8idsCI7tgv5P6fmTG/MGUdQni1sV5/4H+3wW2dU92gtPjY5zOx
 x+og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyzQtNkyWFw6Pm2mJZzb/YP6fcKu1Q5AIWtVBYt8bTe5EsjfrOi3Be21I/Oi3MbaX+8aUZj/6xDLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywSBsPMoMsJkilppgb8zjCPT67gpBQyq1s3cYS0hLAMmzP/jzl
 U581c/WhbMlOXu+4SAdFdVQNZjUoUl9It85CoAej8bYWRKpxptHVurGu0Mp5njyVag0=
X-Gm-Gg: ASbGncvrzL2I1LhWOGiCI00TwqRjmQZ5mkC8bSN7b/+ql2YwHvSDdLNJuGELjFT/Yhk
 W1LMpFJOMpF80U9w722yRXWM0JyPh7Ad3QG4PtmWbX2qlo63c/KcmMpHgyVvx6mzcxmm1VdvfpG
 it2PwmeY96BU/tsJGZLynTOZo4iHwkd1pnlot3tnQKHUjq7XlGmz4KlaxSnjcyJAo1xBmwRfoCC
 BH2G8BjQaLyVrfZv8sJVf4ug9MhWyZgReQhBZAF2wz6GFIpGULKFvihXqaIsQ+vNyx8dTeuuV4B
 ajV5KkNFCDfYOhwKjAsJhkFYogjFWBipOou0G/HqdCIqpC10XRwFOle5gxehPpcXHaqp/zTnRIn
 22a1Tau+3WR24URncixHDueBRoSF/j9yiZjKn7oCDQJFB6mRa9wr6hOhbDjlJ7Q==
X-Google-Smtp-Source: AGHT+IFbab0I6IbunJxw9DMnNGmlNTMAcT5O1ylJxmLdoG5nQ5JswxZUKVkCCcAgGghuYeWd5vIj3w==
X-Received: by 2002:a05:600c:46d1:b0:46e:45fd:946e with SMTP id
 5b1f17b1804b1-46fa9b078e2mr170662745e9.31.1760429599330; 
 Tue, 14 Oct 2025 01:13:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46fb49c3eeasm225967545e9.14.2025.10.14.01.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 01:13:18 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:13:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Andy Yan <andy.yan@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/bridge: synopsys: Fix an error return in
 dw_dp_video_need_vsc_sdp()
Message-ID: <aO4GGyJLCZEwFYL4@stanley.mountain>
References: <aLaPyJrFsSFuqC1R@stanley.mountain>
 <5f9e8942.7fec.1990997b4de.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f9e8942.7fec.1990997b4de.Coremail.andyshrk@163.com>
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

On Tue, Sep 02, 2025 at 04:42:41PM +0800, Andy Yan wrote:
> 
> Hello Dan,
> 
> At 2025-09-02 14:33:44, "Dan Carpenter" <dan.carpenter@linaro.org> wrote:
> >This dw_dp_video_need_vsc_sdp() function is type bool so returning
> >-EINVAL means returning true.  Return false instead.
> >
> >Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
> >Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> 
> Reviewed-by: Andy Yan <andyshrk@163.com>
> 

Ping?

regards,
dan carpenter

> 
> >---
> > drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> >index 9bbfe8da3de0..33be4eae2b20 100644
> >--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> >+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> >@@ -1149,7 +1149,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
> > 
> > 	state = dw_dp_get_bridge_state(dp);
> > 	if (!state)
> >-		return -EINVAL;
> >+		return false;
> > 
> > 	if (!link->vsc_sdp_supported)
> > 		return false;
> >-- 
> >2.47.2
