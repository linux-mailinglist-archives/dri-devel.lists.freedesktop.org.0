Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E16424D8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 09:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CD210E122;
	Mon,  5 Dec 2022 08:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BA910E118;
 Mon,  5 Dec 2022 08:40:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bs21so17455825wrb.4;
 Mon, 05 Dec 2022 00:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7sDErz481UBaoPgkLvcD3eW5dfuo2lmP7dTKUT9LSxo=;
 b=CDIaq58SaoHZjMxz72d7q7O2qPXm3X5yQhKvffSTBy6HbLLR9WZsqWeU6LtseQtI68
 o6IV03Moh3V4oiwZMBB/yQeeqcYi1/x+Uh3XAOsGS1gJAva+Uba46W61i0BYIsVCC1QS
 iHsyy2W5+3qokLKTdR+TQ+Xz1hdyL+V2Z7rXFtWy6A9p2Z0u/Qle5ctT3/TYrtquf0ps
 V+BMqOoBT8DUVuc2Qe7LzZQ2p2uyP7f5QkeH8HmGFY37xvxI4WhNHsW+rGB7KSvOQbOW
 jO8krwIhzAX+dHjzKkFkj7Y3VT236pu97vDXS3Mi6HnIgdsqYNOGyVtb8/jJ1ALzZZSv
 BTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7sDErz481UBaoPgkLvcD3eW5dfuo2lmP7dTKUT9LSxo=;
 b=4oNmIkbKo1itiFouRnSC8nSKIzvnZoSL0A8QxpIa9ykrxzZ//vHKnN8t8J81mUoa5Z
 2yA72qqB4m/6hXqsx1I6gZNnUs4MeZ5IsaoQfMKtHBIpTAYkQbJD2t4sxkhoDWfFa5Hp
 ZUyXZcnnbx88Zi5y8lZhdvJrTkRAB2GuhmslFcYySQf1KaqPP+8z4T5sVHUrks4Lzs9B
 CETqI+AUvyUSR6uTN3zMlubVWuauI3+6WiwfqUoqRu6ju4xwxGCOS7wMMj2iH8TyEsL5
 xQlIq02H0Io4v0q+4JFUZnq8sJ8IGmVxdniJeQJsC7VHdEQiDnVkfJjuguBKxHzpoaq+
 u4gA==
X-Gm-Message-State: ANoB5pnMd0LX1gGBEea0iB4Q8Bt0xVfGLAU/qQwEtzRGwoS4I8DgaFuu
 0SzsRrmdR7KNnyDkD1fmJgg=
X-Google-Smtp-Source: AA0mqf5MP9EIAj7+h6OgOC3ocdnmonuHI3yeFv7QjjRItw/MJU/pvg58z8YhycF7wThpojAmspf4fg==
X-Received: by 2002:a5d:6d4b:0:b0:242:4e26:51be with SMTP id
 k11-20020a5d6d4b000000b002424e2651bemr5621729wri.253.1670229621269; 
 Mon, 05 Dec 2022 00:40:21 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c1d0900b003cf878c4468sm23288030wms.5.2022.12.05.00.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 00:40:20 -0800 (PST)
Date: Mon, 5 Dec 2022 11:40:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 1/4] drm/msm/adreno: Fix null ptr access in
 adreno_gpu_cleanup()
Message-ID: <Y42ucX8GwYEFVUcr@kadam>
References: <20221204040946.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221204040946.1.Ib978de92c4bd000b515486aad72e96c2481f84d0@changeid>
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 04, 2022 at 04:11:41AM +0530, Akhil P Oommen wrote:
> Fix the below kernel panic due to null pointer access:
> [   18.504431] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000048
> [   18.513464] Mem abort info:
> [   18.516346]   ESR = 0x0000000096000005
> [   18.520204]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   18.525706]   SET = 0, FnV = 0
> [   18.528878]   EA = 0, S1PTW = 0
> [   18.532117]   FSC = 0x05: level 1 translation fault
> [   18.537138] Data abort info:
> [   18.540110]   ISV = 0, ISS = 0x00000005
> [   18.544060]   CM = 0, WnR = 0
> [   18.547109] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000112826000
> [   18.553738] [0000000000000048] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> [   18.562690] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> **Snip**
> [   18.696758] Call trace:
> [   18.699278]  adreno_gpu_cleanup+0x30/0x88
> [   18.703396]  a6xx_destroy+0xc0/0x130
> [   18.707066]  a6xx_gpu_init+0x308/0x424

Fixes: 17e822f7591f ("drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init, cleanup}")

Let's add Jonathan to the CC list so he can Ack your patch.

Although the real issue is that a6xx_gpu_init has bad error handling.

The a6xx_destroy() function supposed to free *everything* so then the
question becomes how do we avoid freeing something which was not
allocated?  With normal kernel style we just free things one by one
in the reverse order from how they were allocated.  See my blog for more
details:
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

However this code is written in One Function Frees Everything Style
which is difficult to review and prone to bugs.  The common mistakes are
the kind of NULL dereference that you've seen, double frees, and missing
frees.

The only way to read this code is to open a new text editor window and
line up the allocations with the frees.

  1725  static void a6xx_destroy(struct msm_gpu *gpu)
  1726  {
  1727          struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
  1728          struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
  1729  
  1730          if (a6xx_gpu->sqe_bo) {
  1731                  msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
  1732                  drm_gem_object_put(a6xx_gpu->sqe_bo);

These unpin/put must be done together and should be in their own
function.  The ->sqe_bo pointer is allocated in a6xx_ucode_init().  It's
assigned to an error pointer, but then set to NULL on error or after a
free.  So this is okay.

  1733          }
  1734  
  1735          if (a6xx_gpu->shadow_bo) {

->shadow_bo is allocated in hw_init().  Should there be a call to
msm_gem_put_vaddr(a6xx_gpu->shadow)?  It's unclear.  [QUESTION #1]

  1736                  msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->aspace);
  1737                  drm_gem_object_put(a6xx_gpu->shadow_bo);
  1738          }
  1739  
  1740          a6xx_llc_slices_destroy(a6xx_gpu);

This has IS_ERR_OR_NULL() checks so it's okay.

  1741  
  1742          a6xx_gmu_remove(a6xx_gpu);

This uses a gmu->initialized flag which allows it to safely clean up
everything.  Fine.

  1743  
  1744          adreno_gpu_cleanup(adreno_gpu);

This function has the bug that you identified.  Let's dig into it.
(With normal kernel error handling you can read the error handling by
looking at the label name but with this style we need to jump around and
compare code from different files).

  1745  
  1746          kfree(a6xx_gpu);
  1747  }

drivers/gpu/drm/msm/adreno/adreno_gpu.c
  1079  void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
  1080  {
  1081          struct msm_gpu *gpu = &adreno_gpu->base;
  1082          struct msm_drm_private *priv = gpu->dev->dev_private;
  1083          unsigned int i;
  1084  
  1085          for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
  1086                  release_firmware(adreno_gpu->fw[i]);

This is okay.  ->fw[i] is either valid or NULL and releasing a NULL is
fine.

  1087  
  1088          if (pm_runtime_enabled(&priv->gpu_pdev->dev))

This is the bug you found.

  1089                  pm_runtime_disable(&priv->gpu_pdev->dev);
  1090  
  1091          msm_gpu_cleanup(&adreno_gpu->base);

Let's dig into msm_gpu_cleanup().

  1092  }

drivers/gpu/drm/msm/msm_gpu.c
  1006  void msm_gpu_cleanup(struct msm_gpu *gpu)
  1007  {
  1008          int i;
  1009  
  1010          DBG("%s", gpu->name);
  1011  
  1012          for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
  1013                  msm_ringbuffer_destroy(gpu->rb[i]);

Destroying an error pointer is fine so this is okay.

  1014                  gpu->rb[i] = NULL;
  1015          }
  1016  
  1017          msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace);
                                                    ^^^^^^^^^^^
[QUESTION #2] Passing an error pointer here will trigger a stack trace
so this is bug.  The drivers->aspace pointer is allocted in
msm_gpu_create_private_address_space()

drivers/gpu/drm/msm/msm_gpu.c
   824  struct msm_gem_address_space *
   825  msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
   826  {
   827          struct msm_gem_address_space *aspace = NULL;
   828          if (!gpu)
   829                  return NULL;
   830  
   831          /*
   832           * If the target doesn't support private address spaces then return
   833           * the global one
   834           */
   835          if (gpu->funcs->create_private_address_space) {
   836                  aspace = gpu->funcs->create_private_address_space(gpu);
   837                  if (!IS_ERR(aspace))
   838                          aspace->pid = get_pid(task_pid(task));
   839          }
   840  
   841          if (IS_ERR_OR_NULL(aspace))
                    ^^^^^^^^^^^^^^^^^^^^^^
[QUESTION #3] This check seems reversed.  It should be if *NOT* is error
or null.

   842                  aspace = msm_gem_address_space_get(gpu->aspace);
   843  
   844          return aspace;
   845  }

regards,
dan carpenter


