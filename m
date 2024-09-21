Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5597DEEB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 22:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AC710E322;
	Sat, 21 Sep 2024 20:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QroQhoty";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1521010E322
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 20:56:10 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-535dc4ec181so3119472e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 13:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726952168; x=1727556968; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qNJ//WLJC+rT6bdE83w3ztydutKipFcS5oG1bOhNX34=;
 b=QroQhotyrJxQntlkiV/Z5TbxpHN2mToSTnT21YS8R7dKDdfP8ep2ib5SundEUpPqVH
 tpUyLHGOBh3DDyNq+QL47QhgpzvoX54ybt/MbLPhhTo3BIUUfYHzEHEwlSkDzyZUoFDa
 Y+iKRTSd1CE5SBhpVLAjYPdOYvdOe4/Q1CAYPqBet75LupALCzlL/lBlztlMvhxvix4y
 yMdQeaCXjCbiWckOIPUNZw3Un3Yhzp+B7YwLwHy74s5CNmSm93cwasNbJeBEeY9g8scq
 IaxV1ANlNJQzzF3gYsTbhHUN9s/U9QLJyIpfY5F3Cu77wNndA1msMDMw/l/WFq7TvKI9
 09WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726952168; x=1727556968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNJ//WLJC+rT6bdE83w3ztydutKipFcS5oG1bOhNX34=;
 b=DPunjg7VgdCNN5NN+j1kveZbPp352cDHUebOtgr0C/924Ebr9FyXgMWnrGT90DbxCS
 GpjXNIPvwoeX+VdGt10+mDGM/pBeOnvWw5yekhQxGbVN7LKdmYXbg6VmOEYmY8KzMLxk
 QkOULI7bkg8YLBnNg0sZzMnxmE+gSxBLknKzuDhovfEgSAfALFKMqRi5o9yTV2lSKsAh
 sAo3B4pJhT5kz1LqM+mGzB0ozZ6eqHBh76xkAEypHMhLisxheAqxaIZ54M8i/CRGxJ/t
 EK3yurPAMPllzhED8pJaBV4RRhwydoff2Op4+DPLEdC5qyYTac/LfY3I3DAAQQg0gOhz
 32YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0+EEzPBAiZKz6F4bNvcSK7AdafymO5jIW2KiXWTv3D8pIQiXqNc5fUELLsf9o9gq3Kh4h4oUzkzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPTHvyjKXb5kQBd618R0EgaV5l9El68+txcih8xO2FVeE1ON24
 UAe+boTGm+raROQIaq5AUInN0a5kxTQTp36DzWYp56L2zRIPkqd1nhCOVlwtGDU=
X-Google-Smtp-Source: AGHT+IESDgIIdZzD9EVFYuqv0g8rCf9M48QrMLDI+CZ/amjCPR8cCdnPNrSLBhZFmKmw90fs3mj+HQ==
X-Received: by 2002:a05:6512:4025:b0:536:14a1:d660 with SMTP id
 2adb3069b0e04-536acf6ace8mr3791045e87.6.1726952168086; 
 Sat, 21 Sep 2024 13:56:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704683csm2702411e87.23.2024.09.21.13.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:56:06 -0700 (PDT)
Date: Sat, 21 Sep 2024 23:56:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, sean@poorly.run, konradybcio@kernel.org, 
 marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
Subject: Re: [PATCH v2] drm/msm: Fix some typos in comment
Message-ID: <uwmnsmeno3i5uzbbizq62ffsnuazhb6g7hcdkj4re4l2z54j27@jndvshalzuil>
References: <20240912070420.2891-1-shenlichuan@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912070420.2891-1-shenlichuan@vivo.com>
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

On Thu, Sep 12, 2024 at 03:04:20PM GMT, Shen Lichuan wrote:
> Fixed some spelling errors, the details are as follows:
> 
> -in the code comments:
> 	collpase->collapse
> 	firwmare->firmware
> 	everwhere->everywhere
> 
> Fixes: 2401a0084614 ("drm/msm: gpu: Add support for the GPMU")
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> ---
> v1 -> v2: 
> * Changed subject prefix to "drm/msm: ".
> * Added Fixes tag.
> v1: https://lore.kernel.org/all/pd76zf55h3kjpmgiydiu4br35bwlzsey2losublklv4o4ta7ko@z3gzy2eec5qh/
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
