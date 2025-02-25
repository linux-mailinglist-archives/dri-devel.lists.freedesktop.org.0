Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95DA43A9E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D28B10E5EC;
	Tue, 25 Feb 2025 10:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xNnN3GVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCA310E5EA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:04:52 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54622940ef7so6110616e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 02:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740477891; x=1741082691; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sUfGZOLBpPXz98roGZug6GzOuxZ57fwrWBTaMGnGD5k=;
 b=xNnN3GVZtp+hDbBr6Zitdm/o/iZ4Z2I1YfttUczAypEStm0LqU/YG+d5vReNhSy/AD
 OPaGd3KTFbTDvemaybHEnEGyPFQoZC+P53OfkM0mB6OpMpcNhmzsP4wo9ko0pG0CK4Re
 FLi21l/pQ0TuwPfiDOrYrBq/m60D0vE3ac/hcAlaZkNoQxbOTKMvf3XNru5Sa7J4vht/
 P7UzplnQ9o0wiThi+xqR2b2aj1cHkbClPuoFsEeqkHbA23zoqJCSBps1uGca3f32qvzR
 hCijrjSuQE6DwrGr5kIMOXLGhFN3HBE1GAyq7OyH/l1E3cq3/WvZSb9d1OdB98N+hw2U
 /gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740477891; x=1741082691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUfGZOLBpPXz98roGZug6GzOuxZ57fwrWBTaMGnGD5k=;
 b=Kc4ZZQLn/Qc3X87rm8JnsLXZIZHEa/6zEfTXlwDF20wMKbKRLmMYT/Iz5IBJ1lYqXa
 ohV/OUmfPSq7mWyp8ikfy9K69w6HxXnv67VKs/4iJsCokf/KDcJ4oSxiZW9+V9rOXTfN
 4AOpWEfmYJAN8ek4HzIToL1FXk10jCZGeYuxZygGkJ6oa6LUVys4n54p8YIPg3UlyOvP
 W38FzHQpW3EBb7k1xKqk6/5uiJ1rFlt96Yue+v3xIMN76RPSB9Hohuue/vnbyuCOvpoL
 AFse6OcYFCvi75bR/kscOFisgPavEcGYE5s5DgkFC9AVnJve8RKa9dlryDZPYC+9gsRT
 Fc7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7iOh8oQ4x9btqF/TDXlKFH4cQP2N8Sb80H1fwhM9KvWQuUeV7bbDRna5hNJ/OabGJI7XfuJAWE2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHTWa5tQI+AntBtMFDlSY+36K5MyQyi1+VvoxHKbDnL6iDzMH1
 iiSBE9Xs7x/KNd8sZuG7BmcYL97uLGB5L0Qx2KFAxC85K8gokV0BwZ0TAZeOI5Y=
X-Gm-Gg: ASbGnctPhm95Vc6Vn5LVXyd/4IGRsKwTxb5uu3Q3PwUckXNOe920C6WlxlY1hHO6WTy
 cwayyEMmlcO+D+6yvm3A6ElhKSbtSUwALTstn3ddpmbOue5MYdrfPhC2dOQnqmx/w+NqrTfmB8t
 oIpwJ9xeLP9c9K5mDvXRRadbF+x4exvoTBbDU06G50oeC7vDb/FCICR8O5D9dCSrNQXgiVUOPz+
 FpT9P2KAfTzIO2lUiISvBSZmk9eU3cUZE3bu7CZlVJ0KOPDWNvKGwytaGQcdFbifBl5Jd2a3yVU
 +tWmPG1mmQliNkdOzhZmi0GvGKhMS+NMksyY9YEBKZVKp3jBE5NzC6+RNo21Ake2MQ2XrEXrQza
 PmwOIpA==
X-Google-Smtp-Source: AGHT+IFe8roSMzt3VVv7TZk036TpcSGcoxSHvfVATn8ZrfpARrpjkEuvUDMxx89xTrZ/KzUJppvbMQ==
X-Received: by 2002:a05:6512:104e:b0:546:2ea9:6666 with SMTP id
 2adb3069b0e04-54838f4e48emr8396425e87.34.1740477890594; 
 Tue, 25 Feb 2025 02:04:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b9e11sm136744e87.92.2025.02.25.02.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 02:04:49 -0800 (PST)
Date: Tue, 25 Feb 2025 12:04:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Message-ID: <uzrw5szojucylvminnxghqld34jez7lfzljtdxtkmkxtm5xodt@ruihfzdhkx7p>
References: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
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

On Tue, Feb 25, 2025 at 10:30:26AM +0300, Dan Carpenter wrote:
> If msm_gem_address_space_create() fails, then return right away.
> Otherwise it leads to a Oops when we dereference "aspace" on the next
> line.
> 
> Fixes: 2d215d440faa ("drm/msm: register a fault handler for display mmu faults")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
