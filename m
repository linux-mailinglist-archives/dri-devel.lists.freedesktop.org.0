Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D2A34978
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C13510EB16;
	Thu, 13 Feb 2025 16:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GXuBvYeM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5500610EB16
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:18:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5450681b606so1111636e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739463500; x=1740068300; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=660cIh2qXJ+vc//CkK5JvvBCDsfnGT5N+OHMNTwvBmM=;
 b=GXuBvYeMfhN68HHOBEC6mhOJas6BDfsHDqWV1L5Ew1sVvQovTQD4kXD3zBpgtG1YFp
 LM3CAYxmiEF09ZpkowQGY8qaWoo0zP8yz/kFxrpTCEKZJQyEldxrJ0u2LEC/JEnDeUJs
 lcGrcLGQJZeLbOxZEHLaF1mAgal8lDIMHJDDFKgajJtERTGs/SsFqktG5TGyTP1B1IbT
 aqRvzUFn98mfgqMtaKlMSAsy7cfb0ZT4XgQLTxaKB42a+XcoC95dArWQ1QynEVE4Ib0I
 0sCEphjS+ToDYJVugk7R8jiONr2uqtk4/VB+u4aM27gKULuhienz5k7kBLDVUf1GZqZt
 QbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739463500; x=1740068300;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=660cIh2qXJ+vc//CkK5JvvBCDsfnGT5N+OHMNTwvBmM=;
 b=xRQdtNmVZ8F2VKAJRX7TNdwa4NmYw8vneNU85C8Qloi190XtWsMF55CI7qEU2KWqTE
 7CqO0wLs3vhJ4dISzkcIqvY5S4xQlJYrgwaf8KUaC1Xs5nU1jAUTkGOO6eufJPArn2Ex
 qcR+olGsqiXptpq4POqk9Qc+gA/OhD9T1TWLRCDBXc210mkLyNhVwLhv3RYWEt2vMQ1b
 eqHdLgEzrPqY1CZyRjlysTrujR5YRujE0QsuHfPyCr94CXQN7dpuB/6gy5cxzawkFM0D
 vs5/qNQGTJsEuMCDtN53RmXaWvNIIIeQl19JA5RpLwLIm13c1BF8n5dY5bgfLLMzDYh2
 KYnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSgx6/pLYTHjQTJceYUdvhqSSLOHDz9VJxJaH+L2aDQtVf41BVlPT8eXpbX7yiRbnX/K+yIDJskDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXM0j8StLuMIiOKmK2fHvreotoQ669K7c/KhZY65QmrMG3HJ5c
 DhE6yxIj71CAK8jD8GyKmicIxD00MZ/MzCIwUSikEWzkjNkGD1PwpilApYtFcjQ=
X-Gm-Gg: ASbGncu0BNiKCKg4c5Kc9KcZP6GuCN/4K7p6OK/jUlqFN+ipEszK8fA803rlEpTf8f/
 kuFvi5ksjV4BjEHVc0xkbVcrWtEVGaf2uuTlFvhXb+hnmLlERUpJ3RFw9txjNgwHcxLe47J1Yk8
 uLc9jB/U5aLLWmLMfuBXg7WyBOm0OZRyxWt0biCGgDknbiBCDz3vXcz/UWFC/RmhzanR+2+6Lzx
 jV1+JWvlriwYHnlJoh6qbrWz+pENHMSBBRVEuP54kW/RolhLM8dQ/EfgDFfei9HfWqLrqlccBtZ
 jF2yaMcOqlIF5rFjWoeOiqDz9w0dVGTibp8yI0NJxAJKWd047W7R2Vs5T0HGc17gCwVt/So=
X-Google-Smtp-Source: AGHT+IHX4xTr3i/hkeM2pq8heGQs61yR4H6uZ1XyLtjHKcBwLlumouD2n2aSpi331YhaTvIal/nVnQ==
X-Received: by 2002:a05:6512:124e:b0:545:576:cbd2 with SMTP id
 2adb3069b0e04-545180de556mr2130058e87.10.1739463499616; 
 Thu, 13 Feb 2025 08:18:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f083137sm214209e87.21.2025.02.13.08.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:18:18 -0800 (PST)
Date: Thu, 13 Feb 2025 18:18:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_planes()
Message-ID: <vwkhzuek6g4kmhazk4i4tawbxbnqhe23f2k7tatxkhrwroqjij@qmiuy3fuyxcm>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-16-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-16-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:35PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_commit_planes() updates all planes affected by a new
> commit. It takes the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
