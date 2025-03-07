Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD45A55F1C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0190A10EA8B;
	Fri,  7 Mar 2025 04:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MLIEU11n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C33910EA8B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 04:03:55 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5497e7bf2e0so1561769e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 20:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741320233; x=1741925033; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q559lQVO0eqbcaMdE1cepZ7h+gw822oPb1VcWyT+D3k=;
 b=MLIEU11nm5nI3TEFAQISTqIMgYVNgfypWA3vzqnwxfSGYxd+Bjrmw8Jr7ixq9wYRvw
 7pgCmLaLOtemCdN+sMnlp3U4xxD1cW3FaCGD2SXCozBMFdgf6mPdU3yrxP0mbocfDlO/
 ledzbqlvGQAz5bpK6jawcOMIro212XxKIqfOOnbA2vsrIHAbeQLLNPY+rhOKaOMQZPab
 6Y/PLrcjTWlc8chibAw0VenZ+9MBBtS3QemZdtx0wmbhR+PH0M1Er3szB99a62sI6jC0
 Oy49R6gkXBbtqQnzEHbKyz3NTihEo9tnLUYGs66u7Fe/Z3lhiU4bvn5p5Uear95AqBJ/
 xlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741320233; x=1741925033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q559lQVO0eqbcaMdE1cepZ7h+gw822oPb1VcWyT+D3k=;
 b=mCWYTnK0MnuYEHN5yy2a5/5xfnPI8eniKf840RwladznxWl8Hg1d2Ci/Fa1NVZJM1f
 lHggmvEZGIeb/qOeOVYL8LLDnzhzKjZyacujQio4x5y8uUO9NCi0xFkxthGh96wMoQMK
 0+9CklSxX8mq3vypMNAFngUh3OzfkglUr141Q3PKRuzOwO7TKx86Tl82hpaaXL7BkYAM
 PWoBRP1f8dZhlgHIxrMBeB96lbagnUGzspL50FsP33Hsl51aEDpkG7muRqK887A45UOB
 9CzLnMjP/DWbSKZoXkfZTX94TluBOCFyjt8QQQvgdGQ4zL2t41EF8O7thI5vdLkYywPT
 mg2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDLJqFHlyZHTbIilh4Pqw0nvslIURiy+I3/EIubWcaoumw6Rh4/agfQG2S7L45GRRJQ2nl/H0WTrM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTWWfTwsr6Du1TrW8O5j1pqvl3z69Uy2QLkR/alOTYJ7A9zmPg
 T4jijsHTDt834wPWYmLplG7DrHWfVjQeH80OX3UpQw4LKJ+s+JKiTlDZxQ6Au94=
X-Gm-Gg: ASbGncuYs4CTqfdHNlGonjaQShX18VsNKU2BCe2OTUn3YgUMpnhBI4vuIkmVCXLPb3C
 9+eJdOXd/CsaiurnU5VmHmkfPuLGD3dM7UOkq/HbmQFhs/v1xUPCDBHOqEHO95mVzhJlT0vKD2W
 9q0OB+Topo0jiEjvz1V6occz/bBuHngTAvCw6sZcykapbR49GE7ovPlQ/li+Jc1UY1CBqtpGhn+
 vWiSL5nPJSaYaQ9ulE1Wf5s64vRgdcyWbxrlWFLJMUctmLKUvn96VtygRkYGWB3RlLOo8vqwh/a
 +77hO7iKShGAAQaCcSgsav/FmL937K9T6SYO9PPryaiLec4V4OfQ4aPBZTDdZfsM9kI+C5zr06+
 dCEs0wSj8TnpKXiuUNQGbqoKT
X-Google-Smtp-Source: AGHT+IFkU/H2JgQ+KzgwwZXcDnVmGrvz6WNb4Dvni6Bmcn4jgovRKWXORNDJCk42rS/+awsQtmG+NA==
X-Received: by 2002:a05:6512:3b14:b0:545:2c2c:5802 with SMTP id
 2adb3069b0e04-54990ec1da0mr569205e87.48.1741320233311; 
 Thu, 06 Mar 2025 20:03:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae461edsm362946e87.38.2025.03.06.20.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 20:03:52 -0800 (PST)
Date: Fri, 7 Mar 2025 06:03:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Message-ID: <gs6zemh276kxuphyedsv445ujroazok6jq66mdljkrkd2f5fzf@zjumlvcebaix>
References: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
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

On Fri, Mar 07, 2025 at 09:50:30AM +0800, Jiapeng Chong wrote:
> ./drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19239
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Also

Fixes: dd331404ac7c ("drm/msm/dpu: Configure CWB in writeback encoder")


-- 
With best wishes
Dmitry
