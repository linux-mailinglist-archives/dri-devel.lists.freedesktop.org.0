Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB518BB151
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 19:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2140411316F;
	Fri,  3 May 2024 17:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u89AUOKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC4A11316F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 17:00:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso96093771fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714755614; x=1715360414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wXU7vMhXEeTp/KYmjwZZbLXJksXGPbDoFW68+DTiGVw=;
 b=u89AUOKz/MU8G9bro28G4JbTEJ8ALW0lUOiZ8iaICct7BKEjrwHLeojBhr9KlABTtT
 4Za+4Gw0Kza31B/6Q1xnGNY6cklGtKpU9HCRg9pbmmW6Vd26JLK/DKWa4WM4e1tlI55K
 7PvrEQ3h8+tQtsj7RGP7Cw7CTkPhnqu+221qRwbH3EBCy/SfOly7hxfVl0XkXDBxMc/g
 JApXurZvgGx0kUMNNODA1tkAr88MgUIL4vmJFUhENsjZEUky3GKmYT8oN0ooXQYqtv5E
 A+fmRrhGe35UPw2fHr+DfgWYGqmbDWdJDiwyXpohX3Qgln7Bs+se/rLjD1sHllmDMrkQ
 mgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714755614; x=1715360414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXU7vMhXEeTp/KYmjwZZbLXJksXGPbDoFW68+DTiGVw=;
 b=wx/wjPccyu1M98SxVRvEMUurtsbOxkjLqHntxmbgSnfm1uIeVHt67B+87YXFwwUYD6
 ecwZjL8D0XRjiHyO8gVDmH/+4L/3frkvSyZR24JxUYqvLhdWn+ha7M9fLGYAx0opRZsg
 WWCVDtn44tQPQ/RamERAUNew8SxFVj8L8mIqYHODd4Uq5SecrZMXEI+cK0dIufItmq/3
 77Y6zJe03+JZanplQh1PyL4aN3zPqmlJfv8B50AsJ6JLFgmuRwWCwwiHzk59kGPAKY2I
 Ld9mIrohwjzEQPnQ083BGfIFMgsm+/TwY8CPsddNWvU7ufkI0mAdVTsbvIqE+xti1srA
 Xxdw==
X-Gm-Message-State: AOJu0YwCAvLHy5Zy9qZVQRqhO8rthPFZRkRreXiuqFOgnznXb6kE3h0E
 kvS2rBSg/5jyr19wIMAMdX8fOhM0tg53aKUbC5Da+EPc4iMP4Jwx0JAAx8LxL/M=
X-Google-Smtp-Source: AGHT+IGxOFWEPpbf7YtFt1BYzO/KPqeJOSWt0ZqWNoXVGcsm+jYpRiRT6WvmUbLNEVSLvRZogbhbDA==
X-Received: by 2002:a2e:a98c:0:b0:2dd:d3a0:e096 with SMTP id
 x12-20020a2ea98c000000b002ddd3a0e096mr2969464ljq.31.1714755613392; 
 Fri, 03 May 2024 10:00:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a2e96d4000000b002df6de7283asm585841ljj.126.2024.05.03.10.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 10:00:12 -0700 (PDT)
Date: Fri, 3 May 2024 20:00:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/connector: Add \n to message about demoting
 connector force-probes
Message-ID: <irv5f3w7aqfae3jlxfk65hf6vnxpgw2li6kvj2jtfu6bih7w7e@dculxnqll6w5>
References: <20240502153234.1.I2052f01c8d209d9ae9c300b87c6e4f60bd3cc99e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502153234.1.I2052f01c8d209d9ae9c300b87c6e4f60bd3cc99e@changeid>
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

On Thu, May 02, 2024 at 03:32:35PM -0700, Douglas Anderson wrote:
> The debug print clearly lacks a \n at the end. Add it.
> 
> Fixes: 8f86c82aba8b ("drm/connector: demote connector force-probes for non-master clients")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/drm_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
