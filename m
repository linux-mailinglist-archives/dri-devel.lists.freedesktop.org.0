Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48529838B9E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888C010E71F;
	Tue, 23 Jan 2024 10:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F7C10E71F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 10:22:56 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40e76109cdeso46560175e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 02:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706005314; x=1706610114; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3bDSA+gom3TfDGXLMwfnL3bJvIiO/S9Tm1WQBwfCGz8=;
 b=EKQMh7PtLCI5lyWTITeMBDQN2pJX2cjvt2HJ8Vp2nrmAGVmadsJeyklfAzktkmqjfw
 032BN+8UUwkWGXzST1E1QVSp18NJW1soIvOBaapjVLjAUsaZllObNYsOZzyeJ99KyEKZ
 mAJCiv5qcGG9kZoK8AvPkZRJpLFNirYRiP1bUl03YIsnow/sSBsvmfyfuv/ZAkydR3z3
 P8EGEOnxg6ekMnotBb+Awzy5DqZMnesUG3DFLmp/95UikD1MLOvqEBvw950Q/xjIbegG
 VBCDmi8kxIFF8/EymM+Gudp90Y6MTje04AykCglqdlPIVgjxRDYPEr2y20AbgQLo2UEt
 1rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706005314; x=1706610114;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3bDSA+gom3TfDGXLMwfnL3bJvIiO/S9Tm1WQBwfCGz8=;
 b=CDnaD6n6erL4AwsLDT2HYc+LOf4QAW1KvaiQVAjQXuoxUJTcGBNFkEjRh/oCgeHWcM
 hcS/GP6iIfyiiAXj2wxobFG5/6HCO+X20SRiO4zHhwloryw9KSeXfjRidKt8jng8CGE5
 RsQKpvooXD/MFrTZI5P5PlCaxiHL3xUpiIsa5RveXqmN7tqGnSyK3uRgrlkse8qzXEpX
 u5lYCwKMcNbLfTl78KUxX7YS6N8x0gua2+ZvxWVDFgB4X4d+6uwlrtjCur4QJogE7bDk
 VZYomu0iaxYG1AGLclQXVbBUFyuRxPNGiCCb4ltLqgnSrecfmLjkBcDowkRPVN8KU0kK
 71BA==
X-Gm-Message-State: AOJu0Yyx36cBJOHbGOJizwVyBD0zTJnyrFxaaaLw/Gg5tjrkvpinl0IV
 yiTACy043dCJXhZUpsL/SoKkRdV6MbdDnuQMI9rxaB5n77kSVWciwBDUZ7b1hAOF6+vOysgQLZG
 VlKg=
X-Google-Smtp-Source: AGHT+IFflZU0sW34uw5CNR200M1CKhRQ13yQZ773aFzh/ZbKD1pPVy/BbM9NJkJdysmTiGxtjegWDg==
X-Received: by 2002:a7b:cd97:0:b0:40e:b4e1:894d with SMTP id
 y23-20020a7bcd97000000b0040eb4e1894dmr387906wmj.45.1706005314225; 
 Tue, 23 Jan 2024 02:21:54 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 t8-20020adff048000000b003366c058509sm7937864wro.23.2024.01.23.02.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 02:21:53 -0800 (PST)
Date: Tue, 23 Jan 2024 13:21:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix.Kuehling@amd.com
Subject: [bug report] drm/amdkfd: Export DMABufs from KFD using GEM handles
Message-ID: <5e939c58-dddd-4af7-a650-66cce38c4beb@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linaro-mm-sig@lists.linaro.org, Mathias Krause <minipli@grsecurity.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Felix Kuehling,

The patch 1819200166ce: "drm/amdkfd: Export DMABufs from KFD using
GEM handles" from Aug 24, 2023 (linux-next), leads to the following
Smatch static checker warning:

	drivers/dma-buf/dma-buf.c:729 dma_buf_get()
	warn: fd used after fd_install() 'fd'

drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
   809  static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
   810  {
   811          if (!mem->dmabuf) {
   812                  struct amdgpu_device *bo_adev;
   813                  struct dma_buf *dmabuf;
   814                  int r, fd;
   815  
   816                  bo_adev = amdgpu_ttm_adev(mem->bo->tbo.bdev);
   817                  r = drm_gem_prime_handle_to_fd(&bo_adev->ddev, bo_adev->kfd.client.file,
   818                                                 mem->gem_handle,
   819                          mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
   820                                                 DRM_RDWR : 0, &fd);
                                                                     ^^^
The drm_gem_prime_handle_to_fd() function does an fd_install() and
returns the result as "fd".

   821                  if (r)
   822                          return r;
   823                  dmabuf = dma_buf_get(fd);
                                             ^^
Then we do another fget() inside dma_buf_get().  I'm not an expert,
but this looks wrong.  We can't assume that the dmabuf here is the
same one from drm_gem_prime_handle_to_fd() because the user could
change it after the fd_install().  I suspect drm_gem_prime_handle_to_fd()
should pass the dmabuf back instead.

We had several CVEs similar to this such as CVE-2022-1998.

   824                  close_fd(fd);
   825                  if (WARN_ON_ONCE(IS_ERR(dmabuf)))
   826                          return PTR_ERR(dmabuf);
   827                  mem->dmabuf = dmabuf;
   828          }
   829  
   830          return 0;
   831  }

regards,
dan carpenter
