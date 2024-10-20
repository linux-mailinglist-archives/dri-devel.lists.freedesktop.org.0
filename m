Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680DF9A5470
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 15:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C315B10E14E;
	Sun, 20 Oct 2024 13:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MTbj+IAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098A10E14E
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 13:54:32 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539e1543ab8so5966785e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729432470; x=1730037270; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t2ud3Xhjl5fnEqrQN0vvlzXUx4fvt14whOgTup2v4IU=;
 b=MTbj+IAs6mGQXx1foRBpzFB1vpC3AbhuYQMfdcyO5+SvaWS08Eg+xLCey6nEvMjzZM
 Rj9p1GqevVuFkpd8DiVts4u3hPYgHd5LA00aHrLUFPW6IwkyvebDcq7UaYZWuxXDr1Z0
 +EPdfAeBQpSdiYitLuHH9dXko4K9UnRsMkJ0af9NTXghauE7pOk92n0tuiDb+umkuCdD
 2Mcj6VrSN6P4pZH6sJPPRUHw7E6qc2ZzqRDyMkzH0xG9cdjl2IWWxzesDBjtPL5hfayl
 qzBy83dVeHgqYE16nol1mvFI0DW4DjZLZtfq4+s7As4Fdb6OwBdwogfpVjbrtKhxPZEl
 br3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729432470; x=1730037270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2ud3Xhjl5fnEqrQN0vvlzXUx4fvt14whOgTup2v4IU=;
 b=H5ZQcKYdlkWk9vN9Kul/2QExu0CnyT92k4jgx8DEx8bGrLWLkyGEOXlv8iCfno3Mfy
 8aIalOsyj92krNqYjylgRznuxZNScekzkkVcINWiUGYoKqPSDj5mtaxqGsdBNeFgJ++U
 gnao+oYRFWNeDLDudzyuUqcKhxYGfPP+/6c+j0zyetbQ4RNmGAYPt3Ktfm7I8x0cfg1h
 0ylanEJ4SzmxKW3ADR7iFnemEbwfD88G/HkxIdIQMFq3EVIUj5E+qSbrFHzbGESgN96S
 AI3U2HfB5sS9+epswLbhRUv4mrmormNKE7P3Ev8K9rZFgpcZPyhBuKfVtcyu1Cnn2PD/
 9dtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaefByMSYfghpevtwpqq3s+NtoUXgbDIU5/ByBmShFbmISXr48ugEZzGd+eVEeqvh+jrM4F4o8iqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFZ1cWKQUaDsor8Xr18S2Dt2pE1J25YCj+h3t1kWu5OYCp5Se2
 Or6K161o2nqDGOvhEq/ryFH/pozMdiREuGjTPUnC75lmDfw3hIpSPLoH6Zlas/8=
X-Google-Smtp-Source: AGHT+IEMOmDVyMAzEoNKb9e2GjY6AM6Q5pTGCmHde/YADctLUIXVQq8EXUAxv2quI9Z4hskp29KnjQ==
X-Received: by 2002:a05:6512:3d8f:b0:52c:deb9:904b with SMTP id
 2adb3069b0e04-53a154ca09dmr6502669e87.38.1729432470290; 
 Sun, 20 Oct 2024 06:54:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a223e590esm234750e87.42.2024.10.20.06.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 06:54:29 -0700 (PDT)
Date: Sun, 20 Oct 2024 16:54:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>
Subject: Re: [PATCH v6 07/10] drm/bridge: it6505: fix HDCP CTS KSV list read
 with UNIGRAF DPR-100.
Message-ID: <rjkks6fqcjxf66rfokz4cawptviotxdcixhqkzalasfph2dno6@iqz2577gkrtb>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <20241016-upstream-v6-v6-7-4d93a0c46de1@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-upstream-v6-v6-7-4d93a0c46de1@ite.com.tw>
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

On Wed, Oct 16, 2024 at 03:54:19PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When running the HDCP CTS test with UNIGRAF DPR-100.
> KSV list must be read from DP_AUX_HDCP_KSV_FIFO in an AUX request,
> and can not separate with multiple read requests.
> 
> The AUX operation command "CMD_AUX_GET_KSV_LIST" reads the KSV list
> with AUX FIFO and is able to read DP_AUX_HDCP_KSV_FIFO in an AUX request.
> 
> Add it6505_get_ksvlist() which uses CMD_AUX_GET_KSV_LIST operation
> to read the KSV list.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 48 +++++++++++++++++++++++++++----------
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
