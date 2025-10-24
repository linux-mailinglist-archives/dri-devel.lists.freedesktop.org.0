Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F90C069E9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 16:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22B10EA96;
	Fri, 24 Oct 2025 14:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=valentine.burley@collabora.com header.b="G4QLpWXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371B510EA9B;
 Fri, 24 Oct 2025 14:09:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761314970; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GSl5/dtjmw74PanlT8ifzXTlvcbVz/l4llLwJH2v4eSkpgMIzwFcXuH2UFiYQTKdTFWnxZ88v+tV1WaEXg76+gozlsLCNKKc7SXy2UvJv4xoByfRn5CJNG5W5luzFHShHTRC8fNoPJifpq16P3MANWEzNxH6YzSbrUQ5pH5g6KM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761314970;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VQHIgDhZhrUUNwFFz2m4paNGoP7NOa3EjygSQo1CRMs=; 
 b=ONyBj7gvYKh3SSCoKYO8XLIoPpSOePXvILcpCUteORCScvcxvqktAC3Yl6Z7CcfskdXTjJYpd15ApXrd8HMc8nxdlmBtn65VQTBdTdCOuffAFpjF41K4iLuyrLDoUnJ+oYWQWz/33jOZRwtk6ts/13gJMxpz+6aWjmt2iVRqOz8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=valentine.burley@collabora.com;
 dmarc=pass header.from=<valentine.burley@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761314970; 
 s=zohomail; d=collabora.com; i=valentine.burley@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=VQHIgDhZhrUUNwFFz2m4paNGoP7NOa3EjygSQo1CRMs=;
 b=G4QLpWXCga0i+oVqp8hInaNs3P45NFTDTg8tZEQA8QIUuBxtZp/2yxWaZPPwV/Ua
 FI42JKa1TddFB1ZJd+qbqz208hd43QQnkyEAwEX5QcSB0hWuLROv4R0X6ckbsAOMTCg
 jzVd81ArMorT/RD+v3uwg8NqlzhHWoJEnZRUbzPs=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1761314969231532.1756914526859;
 Fri, 24 Oct 2025 07:09:29 -0700 (PDT)
Date: Fri, 24 Oct 2025 16:09:29 +0200
From: Valentine Burley <valentine.burley@collabora.com>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "freedreno" <freedreno@lists.freedesktop.org>,
 "linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
 "Sean Paul" <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "open list" <linux-kernel@vger.kernel.org>
Message-ID: <19a168d95e8.7a90f7d35482131.1689650792018355758@collabora.com>
In-Reply-To: <20251022222051.10030-1-robin.clark@oss.qualcomm.com>
References: <20251022222051.10030-1-robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm: Reject MAP_NULL op if no PRR
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

Hi,

This fixes the GPU faults and hangs I was seeing on sc7180.

Tested-by: Valentine Burley <valentine.burley@collabora.com>

Thanks!
Valentine

 ---- On Thu, 23 Oct 2025 00:20:51 +0200  Rob Clark <robin.clark@oss.qualcomm.com> wrote --- 
 > We need PRR support in order to implement MAP_NULL.  Userspace shouldn't
 > be trying to use this if it is unsupported.
 > 
 > Reported-by: Valentine Burley <valentine.burley@collabora.com>
 > Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37935#note_3153730
 > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
 > ---
 >  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  7 -------
 >  drivers/gpu/drm/msm/msm_gem_vma.c       |  6 ++++++
 >  drivers/gpu/drm/msm/msm_gpu.h           | 11 +++++++++++
 >  3 files changed, 17 insertions(+), 7 deletions(-)
 > 
 > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
 > index 19181b6fddfd..f93eee67240d 100644
 > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
 > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
 > @@ -365,13 +365,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 >      return 0;
 >  }
 >  
 > -static bool
 > -adreno_smmu_has_prr(struct msm_gpu *gpu)
 > -{
 > -    struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
 > -    return adreno_smmu && adreno_smmu->set_prr_addr;
 > -}
 > -
 >  int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 >               uint32_t param, uint64_t *value, uint32_t *len)
 >  {
 > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
 > index 90712586faac..96925a0f3965 100644
 > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
 > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
 > @@ -964,6 +964,7 @@ static int
 >  lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 >  {
 >      struct drm_device *dev = job->vm->drm;
 > +    struct msm_drm_private *priv = dev->dev_private;
 >      int i = job->nr_ops++;
 >      int ret = 0;
 >  
 > @@ -1010,6 +1011,11 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 >          break;
 >      }
 >  
 > +    if ((op->op == MSM_VM_BIND_OP_MAP_NULL) &&
 > +        !adreno_smmu_has_prr(priv->gpu)) {
 > +        ret = UERR(EINVAL, dev, "PRR not supported\n");
 > +    }
 > +
 >      return ret;
 >  }
 >  
 > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
 > index a597f2bee30b..2894fc118485 100644
 > --- a/drivers/gpu/drm/msm/msm_gpu.h
 > +++ b/drivers/gpu/drm/msm/msm_gpu.h
 > @@ -299,6 +299,17 @@ static inline struct msm_gpu *dev_to_gpu(struct device *dev)
 >      return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
 >  }
 >  
 > +static inline bool
 > +adreno_smmu_has_prr(struct msm_gpu *gpu)
 > +{
 > +    struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
 > +
 > +    if (!adreno_smmu)
 > +        return false;
 > +
 > +    return adreno_smmu && adreno_smmu->set_prr_addr;
 > +}
 > +
 >  /* It turns out that all targets use the same ringbuffer size */
 >  #define MSM_GPU_RINGBUFFER_SZ SZ_32K
 >  #define MSM_GPU_RINGBUFFER_BLKSIZE 32
 > -- 
 > 2.51.0
 > 
 > 

