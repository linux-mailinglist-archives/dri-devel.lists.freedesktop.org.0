Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D79B3178
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E781A10E090;
	Mon, 28 Oct 2024 13:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IUqNwJGb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8364910E090
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:16:51 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so5660787e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 06:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730121409; x=1730726209; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gtobrLJI21CIw0CQaIBjUtswNFQMA8ivfTR8OvOha2E=;
 b=IUqNwJGbG2TInIMedFWxsCfmP5LeTAr4wMsoMz+NmlGGUegXNWkeMR5jDgeLrSOqKj
 +NuWwpV53Axl3dSP7Zbx8tFQHtPJ9h7seNOvE9/fEqpXTYH7/BUWmE0vY/4AiZ0Gw2XO
 yj70XbkGxGFdGNq6YUcJLPi44i3DJ4Diwl6x5PPZJI/zBmMxOqDmrc84BwulbiDPBsmM
 e1qird981WsX43kzZdhVfhfs1EDqKw8lr5bHtJgMkOqqvZ05Xh5X0PC9BD0Oa+peguMp
 PQuTRyqdPdVFDJCnoaTqpav3/emwvKDMax8Ij5fj24iFk1Va50TIhjkxDtHSpBUAOSA9
 MXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730121410; x=1730726210;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gtobrLJI21CIw0CQaIBjUtswNFQMA8ivfTR8OvOha2E=;
 b=EsyaHs4U1di43IIs/3Q4vc4DWLjIqaPCVmNWdg/pHy3gZysje4t+9knW9nPw44VYTW
 h3wGydoSsYvlALFwURTIO1dNJBnRWD25MDVA0Exx1hg428RmP329IRhV9xWEP7xATgoG
 VBOCESVqk4JOY/bkcR7XzH9idVfAWEe4qYUoloVy2XBm+OCbMh8oCdlBIIR2IMRdCtaq
 g0sRjz9DbGq9+tg9gdFrw2XLdHcehRSgVUDLmh5p6X3/DosYt7hG7rre8ECFFyDqL3Vw
 lRaJohutXpWZkxzI57phffOvM2bum6zkK6mtgij+6CudHhaA75iZExY26Z7UHfHjGLHk
 kf/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtqT2DpSY4tulW1gFVyVPI03QADNRi0MdfjapN22/pACZwHHRKuMtFfEwWCZFIsIVag6VdSTXXQDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVxtcAeDmegA+OBXmZSK3ElL4xV1LSWwDAyaUGPcmznazpt1Pu
 8AiZabSrFWXBTqE/DDPlzxsNoLBJU/ToWaHsiSJoZNUSP1tENqQplAnz9wXrs1g=
X-Google-Smtp-Source: AGHT+IHUNBHxjqIdM2evfdxWlB6K7EhIuKApdX43cL7f8/EvgbXJUln26Is5MhMAv5uHt75hRoTpwg==
X-Received: by 2002:a05:6512:1304:b0:53b:1f77:e95e with SMTP id
 2adb3069b0e04-53b34c5f595mr3085572e87.44.1730121408720; 
 Mon, 28 Oct 2024 06:16:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1fc7cesm1082258e87.309.2024.10.28.06.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 06:16:47 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:16:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/sysfs: Remove unused drm_class_device_(un)register
Message-ID: <7monlmdi5ftqudna6kxjgejdejo22ttnontexv6ijpuqecemcr@3t7pbhxcyzrx>
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-3-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022232934.238124-3-linux@treblig.org>
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

On Wed, Oct 23, 2024 at 12:29:31AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> drm_class_device_register() and drm_class_device_unregister() have been
> unused since
> commit ed89fff97382 ("drm/ttm: drop sysfs directory")
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 32 --------------------------------
>  include/drm/drm_sysfs.h     |  4 ----
>  2 files changed, 36 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
