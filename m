Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864ECA3CA3E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 21:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0627E10E038;
	Wed, 19 Feb 2025 20:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VVtW/q4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2315F10E038
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 20:42:05 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so264127e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739997724; x=1740602524; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oWfn2QE048JAogGjdO/HN/1zhXyyFXLbFj0VStJXPXI=;
 b=VVtW/q4S1IvwG/iEAatRptWoSWUjlTX2Us9oeOdj2SDJuCx8OWmcPFEbGJffkyQMM9
 S6XHhi1cmpzPEVvPIdUukVZ9bdRiN/AcVF+ZjJeyjSkzmtD3dd9fa1JfGjhZBiMrPkXQ
 vmBkTCYxbq0coa7QUA3dtxOyKv2BhPVDT7AssIRVYkW4eGZ17DY1M0WWjF3GDyt9wLVN
 uX323yp7qSstpObvdOpyXpbiy7mtpiX5YJ3Lfn4EBU5cLLu3NiQf995eORufJjx92dPg
 fbictAaG+eRATRUmw/o9gOxlnAynygcj5xSu6oouDxcOlpQOSa60QG2BSIQuF4s/vFR+
 Czkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739997724; x=1740602524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWfn2QE048JAogGjdO/HN/1zhXyyFXLbFj0VStJXPXI=;
 b=Z4RXCsvolWpXdZdf4hR1/ARjDVbVEv+N4WrKvy8TZM4eIkfmkr0lOSp+WjAnOfOOZ3
 eugkdIX26MFZcikazVeL5IgJH2XJvrsKY0M3mFwBsu9FGd85svq2kqQeozZM34HOlTVC
 B9Kpu9V5bi6wQ1dzJktMx06k5I8Fu26uVUzDU63W7fKT/KKYaP0BL6Lo69w4QH8ihhtf
 FpLRXh8D0AMOsdmpWlzmrkeFC3cuMc4kMsuC0jOEaNP9ixMfasNCXtPAT7Jy/sd3A7gp
 /BbYw7ZCnEDnBkIA19SCwG9ZfelmKbN/VzkNBsUrv0vEedgP8LxikzbLqCIv3X/PsYNu
 kC/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOz+YR8udN69WVg92VIac8KZQnw1wBCaljnJhtJ6ZDDddM9DSGroe15Ps/UWYKbu6Go0w33sEo5Gs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjKfzRaXL9Wr88NoTxoig0DoIZdwvE/Zml63oVlSroZMmckoNe
 4dg8IWGG4f9yTNNF1+ZCq7JxMuHBfV3KbAllRAL8DTPV9nj4kHdFwA+MLVYeMkM=
X-Gm-Gg: ASbGncsRaJ7KG4whsPGrmS1jhLcDgi24b1BvbPkT2c2Kq8p3HHazGytc1H/ednZTHHE
 ZCtnpzoYBRh2KAatxtrePqbSe8d04dTxqgowjHnw4XCFqUNuNPMsnlZw9ML43HSLInUnaJ8gPLR
 F+psnPyLwXQoasg8R0niTFIW6xp93lp7MhCRzyP+uR8LOtqKCQ/0GlU8khCf4HJmTfF6UfqRFRN
 lMQKdg1pG3475ZxMBz5pDNJ7+hZIPHY/LyusZSMXfX6MzAWmqBNk9DTeeaB44o7Bby1RLgeeG/s
 CUGS4/nZaMe2q7EGqo6BrR8nbcnYLOoheWqLorzXTnwpRXzcbs1vWAugbLTcJFEfuXVwSzg=
X-Google-Smtp-Source: AGHT+IGXMalRxphojh9Kz/mE/PFLZuuLeouSpCzsm5nqbBL2KU5Od7qqkelGjB8u41IdiGOmFC8W3A==
X-Received: by 2002:a05:6512:e94:b0:545:d54:2ec6 with SMTP id
 2adb3069b0e04-5462eedb519mr1875009e87.2.1739997723749; 
 Wed, 19 Feb 2025 12:42:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452871ead0sm1907991e87.193.2025.02.19.12.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 12:42:02 -0800 (PST)
Date: Wed, 19 Feb 2025 22:41:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Message-ID: <h5i5wegkurgmujrkx35qpyjmkbjv3z4re53dx5i4ly4ghzpek6@hgsdbmfmgxe3>
References: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
 <20250219-abhinavk-smmu-fault-handler-v3-5-aa3f0bf4434a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-abhinavk-smmu-fault-handler-v3-5-aa3f0bf4434a@quicinc.com>
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

On Wed, Feb 19, 2025 at 11:49:21AM -0800, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> There is no recovery mechanism in place yet to recover from mmu
> faults for DPU. We can only prevent the faults by making sure there
> is no misconfiguration.
> 
> Rate-limit the snapshot capture for mmu faults to once per
> msm_atomic_commit_tail() as that should be sufficient to capture
> the snapshot for debugging otherwise there will be a lot of DPU
> snapshots getting captured for the same fault which is redundant
> and also might affect capturing even one snapshot accurately.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v3:
> - Clear fault_snapshot_capture before calling prepare_commit() (Dmitry)
> - Make fault_snapshot_capture an atomic variable (Dmitry, Abhinav)
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>  drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
>  drivers/gpu/drm/msm/msm_kms.h    | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
