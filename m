Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F6199C291
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD9910E3BF;
	Mon, 14 Oct 2024 08:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ze+y4oRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313A010E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:08:30 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso371896e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728893308; x=1729498108; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ek0HXgVJ4lRKUDparv2Fn/Dq7h99tILCL07wJuqwxgc=;
 b=Ze+y4oRIcw+E5KgbDlNHKWlCS3WqwLjAIHmuUBIj+nN9IhajmXw8W/vlU67rperR+U
 rOaU96hxPbL4WwOzDZsMZzYxKUSmryaSAAJzBcFA9tpv4K5/2+5UKPkEuNYfS9SAdgeo
 ol2PWZCp31CBHTkR9psY/aSJPzqGj38wkcvSB7vsi6HyzshzdXhILXJeLFHFSczww+e2
 8Q5yHMgcmEIrYiTbF6/l0T5nA1rEOEoBh3xgucaJHZaR9eYpLd22F0EMtUw5e1GOZ8iR
 GptttVSGpDh7nyoCW/izRZpM+q8NjxDgL+y1iQ20JrlgBSOICPWhymtCulsGmRDZ5tKV
 smUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728893308; x=1729498108;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ek0HXgVJ4lRKUDparv2Fn/Dq7h99tILCL07wJuqwxgc=;
 b=i3hvzd9VT+ISXtQ5JqHOXUhi0a17XESoRzwrQBLW1vF6Z1DyUqN4hG4FwUOsccw25/
 AAzEFbFH1ujI275Wcw+VsYBKj1jmzH3Zt5hEzEJwFpTmMdLcbaimPSxoYpn/KP0a5wEn
 UKvDWCmx1yucGnB/IynmjRyAziZcKDREEWhPMtLVadYs451p/KLZ6q34mEb9ogueMTxh
 9jPab/xOTUThVegAzVAgbY9xL0RzGExK7G4AVizoGkaaL7cNuniX3PcVM2nAlp/Bx1d3
 eEi71kAyCv4AMg3J1EdfJHc1/9THDaxPy/WLtolDWC5cGvMtivJEhA83VPunxwMpELCa
 xmew==
X-Gm-Message-State: AOJu0YyVnneAmxT7LGsYgPlvf5oVJTnMyqpR5v6PIB2hAhEwh4f1Nf5R
 Eh+YfrJRF/tikZpB1V6qEJpUin5tchfQUQsGr66rxVZzHSXsii9/g4cg07bs1KE=
X-Google-Smtp-Source: AGHT+IFpFvXZahYY/UpYBX+J7gf2zLmfnqUfbFEK4OpIA/RZWgJpkF79yAmXBTPYrW3Wtz6MqCpslw==
X-Received: by 2002:a05:6512:3402:b0:533:4505:5b2a with SMTP id
 2adb3069b0e04-539e5515238mr3224426e87.28.1728893308189; 
 Mon, 14 Oct 2024 01:08:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539f2d2d05dsm453157e87.98.2024.10.14.01.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 01:08:26 -0700 (PDT)
Date: Mon, 14 Oct 2024 11:08:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raymond Jay Golo <rjgolo@gmail.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Chuwi Hi10x
Message-ID: <xc66pugymub6b2fjal4q7lopq3t3yaporkclaj5fslf57u3v4w@tnxsmybjujg6>
References: <20241007020258.2202786-1-rjgolo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007020258.2202786-1-rjgolo@gmail.com>
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

On Mon, Oct 07, 2024 at 10:02:23AM +0800, Raymond Jay Golo wrote:
> The Chuwi Hi10x uses a panel which has been mounted
> 90 degrees rotated. Add a quirk for this.
> 
> Signed-off-by: Raymond Jay Golo <rjgolo@gmail.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
