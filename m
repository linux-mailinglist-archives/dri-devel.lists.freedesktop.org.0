Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4A78D3174
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C117110E1D1;
	Wed, 29 May 2024 08:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fLm64ol5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D1E10E1D1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:33:48 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e724bc46bfso19388571fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716971627; x=1717576427; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x5EEaYGJ1D8byJ8SJtJTmXoqVH/YjaxmFU54Kpu6AHk=;
 b=fLm64ol5NCBSMYdoGxJvU6hu6c1I8tfjglxp1wHXzodUjiwCL4c0skVWmlgm1OGByE
 f1lZBL3/ZPYedvxjVu/pK22GQCOAZ1H8cGxB7wg9H/U7CoL2kQ4xMpSTZfDkJl4mG6e1
 sWDklJSwkVTXDphBXsYLoeT4MN2AcU8XwDeKVzvWE43u4aCujnEqHdFINYEVdsXSCZYA
 qEKFTHCVAWhkm/U2+8nHyCPUTXHkBlLOzLFHqfSlB6KRpAkdM3e6BIlmH3JLw+HExJ0W
 LszuCUh0lPfiqH+EfIJCvpXRKLJ497dMP0ghqZXtvPiXy8CmELM5KrV4ItYpRJoehFAi
 aVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716971627; x=1717576427;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5EEaYGJ1D8byJ8SJtJTmXoqVH/YjaxmFU54Kpu6AHk=;
 b=sw85dfuv6Ls1Cgp7GPEGCmK9ThhJdCr5rUDVZgRfhzZ3XH8kQMH0ulhp/nLxfs5zPU
 M15T8N0qzEgq5deF0QV9xVJfoFYKKcNIcyaDbYrkLTFce8o4K4RebAbAJXVnE71fAv+m
 FKkE9p/SoYirx27htYPj6kNkDesdd40aQCJgHy+8Zy0P4FJ/VKb4GX8AoFmXOwRcEK4u
 Vg2zT0Y6iquks0zq/GDLNfkV7GJHCyNmIQqf5HVGR8RB5y5tQPZa3dFUZeVFAqLEk79g
 hi5RCU6DGhegE+XKzCn/T7Z42xIAZGEIz5EuYyxlFrTPzkqfNXOz5ViA91JuCtlNmYij
 tzRA==
X-Gm-Message-State: AOJu0YyXLitlAmbPADo1jtxMFHKmlDvq6ZIPsetonSZdxbG+5bpA6wBX
 d/idLg71MhPXVahVOyAzNXN4kaW6dqupsYObs60YKUvZXICE6nCIsOv9agfuQ50mx8h0SB/9YX+
 7
X-Google-Smtp-Source: AGHT+IGXd/mOmVvjcZBERVulKftudCI3L16kztf3VlESzDwzxnSCEt1H6iGXEZq9p+pnqIwuRko7Xg==
X-Received: by 2002:a05:651c:1992:b0:2da:a3ff:524e with SMTP id
 38308e7fff4ca-2e95b03e9d1mr100322571fa.9.1716971626954; 
 Wed, 29 May 2024 01:33:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e9866d87c5sm4769911fa.95.2024.05.29.01.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 01:33:45 -0700 (PDT)
Date: Wed, 29 May 2024 11:33:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/sun4i: Fix compilation error
Message-ID: <dcfkn4bgsdzxbgzdlpycnyuj76ycydwavn2tqd2k6kuw5puuge@wkun3c6i5qqt>
References: <20240528151056.2104153-1-mripard@kernel.org>
 <171697049522.2533828.193549550194715590.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171697049522.2533828.193549550194715590.b4-ty@kernel.org>
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

On Wed, May 29, 2024 at 10:14:55AM +0200, Maxime Ripard wrote:
> On Tue, 28 May 2024 17:10:56 +0200, Maxime Ripard wrote:
> > Commit ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
> > introduced a dependency that got renamed in a previous version, but
> > wasn't properly updated in that driver. Fix the name of the function.
> > 
> > 
> 
> Applied to misc/kernel.git (drm-misc-next).

Just to note, I don't see this commit in drm-misc-next.

> 
> Thanks!
> Maxime
> 

-- 
With best wishes
Dmitry
