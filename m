Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B29FEBBD
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 01:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DCD10E484;
	Tue, 31 Dec 2024 00:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mQLv1oLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC3B10E427
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 00:00:06 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so10380473e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735603145; x=1736207945; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=esYDpsWPuEO88zvObUesCzqAb0/9+MI3c8A4Qm20q9k=;
 b=mQLv1oLApG8DWpvruS6TbrrIMZWXxTYvJv9/pD2yEZkG52yVbICGpkGjkMNTyh79MC
 1CrLTs0SoPSd5b5qow8gDGYCe5v9RswsPSpArBJGg+mcBpvJ2KbO2K1Z+x5BQ5mocS91
 5AoE7TUKAbIaX/PEbn8xyCJ3LcNrFGk3aaWs6W4LlEjEdFYvTE9lNZrnC4M5uu7TKxWf
 YowIuZnoTl3HdghPGMvA1KVc3cZIah1WpHbKlzZuaIjq7etDKavtGyGC5jwM+iiL0KKk
 LKmboIm8hV6jP6wlOrKiMlus5MgUYp+Ql3fRr9mDJ3lSWeBlSmFI61qTUO451cNZfOjb
 EtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735603145; x=1736207945;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=esYDpsWPuEO88zvObUesCzqAb0/9+MI3c8A4Qm20q9k=;
 b=boAANjkOADFzLcB3ObmKHV1l+iEwmUs1R0eAFzOBkgsu8fgBSwL6dIX6Oljje6x/L+
 3iq5CVxGD/xJe6TxAAEJeJ/vUjA5Ph0MazD+AR6byGAqzOXX3hktoQsfB5dH7nbHM4xE
 RePuxblyqZ2pIVGuFPdhgIhLOWD+7nfzw8Ol+lQhSSNi+Swz8b7H40xY5wFm/+kHcdAK
 NIdsBJ2oU3WDN9RxwEsYiYct4bu3bmDCOwX0Xxtp9R8PbMJT8+qVLL8dtHSJY69WduIH
 a24fAN0DtZOA4l7O9KtKh94tLuhD8kcuk2MQv4RnXJNQEzG7oMg/qDDwXfnaSVlbMcfm
 1+pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBH0LWNA8+zAPQjHcuDfUDg2i5XVoPHaWbVl1zPcdK+XEPQdh1Wd9PLfIXoJsKnU165cZxXpKM6V8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEHMI4ENGfs8WqNEjBQBI/hiRX9uRf36UWzbt4h5TlYWdq5Dde
 LVl0V7NOUbZjVqeYDJrZgSRcZRcUSy+MsZB+KCNo2cadSO9DBOh8lb2Si/3nJJ0=
X-Gm-Gg: ASbGncuDuXVXtKRm3x6d1kjXkDj5S07BCuZwFwfzgSzpVy/EP6gz0dNvzAzUmpt4LkN
 pYXU43jfuGgGGj9N05+exdlmQ1hJpLh1y+8NPWZt8crfRK8ndYYjeHh7F+SZ9lhpe8rf1qtXg41
 4c7+gfNDkXiaYno+zOcXnG2p0l8EpYXKsZeEh4LFP/Af7PuBfO9XVpDv3U8W2pjGLTedPgdhGip
 c6sgJcaHBnFaj5qN8N/g+E1TIz1x3eS9p2DeH4I39UgycZUoAa/o9Y9pb9kKQ2a6bLNiZLH1O7a
 PNjVwFOlXpV4egwiNnOmmswdAuMux3cqcTat
X-Google-Smtp-Source: AGHT+IF+rLSsY4tbtNxgTE8NrlTlXuaIB94Yc2ChSyIRKdgpG/cckY+ZwMmKpOESxNjsZ97FlkawOg==
X-Received: by 2002:a05:6512:1296:b0:53e:368c:ac48 with SMTP id
 2adb3069b0e04-542295229femr10026548e87.11.1735603144992; 
 Mon, 30 Dec 2024 15:59:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422382109dsm3217871e87.170.2024.12.30.15.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 15:59:03 -0800 (PST)
Date: Tue, 31 Dec 2024 01:59:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 17/25] drm/msm/dpu: Fail atomic_check if CWB and CDM
 are enabled
Message-ID: <klngsvbaqycfye6bobeq3krvkttno6n6y4qnidoobdobgxfeln@fkzpellmdjlk>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>
 <qpy3yjnrq7ljsj7a2b2avbnd6cptyfr6vzxhm733dyaiso5lwg@txhr5zwjqtt7>
 <ac1cbdd1-ffea-4643-83ed-c5a321e000e8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac1cbdd1-ffea-4643-83ed-c5a321e000e8@quicinc.com>
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

On Thu, Dec 26, 2024 at 02:51:12PM -0800, Jessica Zhang wrote:
> 
> 
> On 12/19/2024 9:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 16, 2024 at 04:43:28PM -0800, Jessica Zhang wrote:
> > > We cannot support both CWB and CDM simultaneously as this would require
> > > 2 CDM blocks and currently our hardware only supports 1 CDM block at
> > > most.
> > 
> > Why would CWB require a second CDM block? I think that YUV output over
> > DP (needs_cdm = true) and RGB output over WB (cwb_enabled = true) should
> > work. Am I wrong?
> 
> Hey Dmitry,
> 
> No, I think your usecase should work. In that case, I can change this so
> that it only fails if both DP and WB are requesting CDM simultaneously.

Sounds good to me, thank you!.


-- 
With best wishes
Dmitry
