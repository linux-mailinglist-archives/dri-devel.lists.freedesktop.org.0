Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D668980703A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 13:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACB710E71E;
	Wed,  6 Dec 2023 12:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5710E71E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 12:51:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33350fcb2c7so553477f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 04:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701867063; x=1702471863; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vShWvwbKGu3wPEzH2d3YHxBc3lA47Ytd3pI/2OLguiQ=;
 b=IgQ8CFFeK/TtTsRKZ3IBhKDB14CXcZN49OzUvIyg48/K9zjvfD9//7TIati244kqda
 zxyeMmSGujSD6OLhhATPHq6YD9dsMfaBoJeAA8b27jK92zddsNT6cHGCDMEu2VPm0Tx4
 MfQdD2JgqPcFl9Sfzp1WTq93aABA9WWRMPOJmjGW9VbtYa6e1eaFiJngwri3ch+0UULm
 LQ1qVoGPPSF7OXk+17Aku0CQqpzMlTPjunF8BeM4N6e1TIluRwpnQkRO3tFds82cfgEq
 RN/BlbOtepR52QmSIHD9KqV7mYmHcjt04YkBCJ4ZibnoXPKhUGlBxzHhUOulhGaVod+P
 9DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701867063; x=1702471863;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vShWvwbKGu3wPEzH2d3YHxBc3lA47Ytd3pI/2OLguiQ=;
 b=jOrDOkBVb4Ga6YkLId/Dxocz6genWPUlyk9oQtN6KqGHqs8jWHPRHxb9RSBPNda3q/
 zWwvWdYaSpoz3mLGa4g8vGbhYjNboN0ylE4CzlOsxMCNEdJYFjeuNQihHpuSfFVzMoKu
 hV66UbGXsiUGl6pZ3bHwMEzUiX6jCM0fs+Q1DR8R5bsDIUhFILfTOKy/eaeqo/aKgFnL
 CtYeiUg+eb5XroaZeFB2eLJ5XDaSZyh+Z5VbJN9cyrMruzFjc39rdsDHiueg4nY8XLal
 xx3ft+GWEcUKCBjehJKYJ69cVK11R9erPr4Kf5qO6/xPfhpC19tS7ZBUJRQGptyQmJcq
 2Dkw==
X-Gm-Message-State: AOJu0Yz7flkEj7jsY+U9vTi44r8vcqAR5ZpajhIHP5725iYbHjuds0uw
 w+qwLFVsSybXU9vv28bplZffLw==
X-Google-Smtp-Source: AGHT+IE8e7Wky2a00mT8q1EeJCpCr9j/ztRZ/knsHV/BcPw/t8tPCfN6FCFtzSt/CmIwn142BAbegg==
X-Received: by 2002:adf:ea02:0:b0:333:2fd2:8154 with SMTP id
 q2-20020adfea02000000b003332fd28154mr470928wrm.113.1701867062722; 
 Wed, 06 Dec 2023 04:51:02 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 x16-20020adfec10000000b003333beb564asm11255309wrn.5.2023.12.06.04.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 04:51:02 -0800 (PST)
Date: Wed, 6 Dec 2023 15:50:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sarah.walker@imgtec.com
Subject: [bug report] drm/imagination: Implement firmware infrastructure and
 META FW support
Message-ID: <356d0cd0-e2d8-4a78-96ca-4d9d26031c44@moroto.mountain>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sarah Walker,

The patch cc1aeedb98ad: "drm/imagination: Implement firmware
infrastructure and META FW support" from Nov 22, 2023 (linux-next),
leads to the following Smatch static checker warning:

	drivers/gpu/drm/imagination/pvr_vm.c:631 pvr_vm_create_context()
	error: 'vm_ctx->mmu_ctx' dereferencing possible ERR_PTR()

drivers/gpu/drm/imagination/pvr_vm.c
    597         vm_ctx = kzalloc(sizeof(*vm_ctx), GFP_KERNEL);
    598         if (!vm_ctx)
    599                 return ERR_PTR(-ENOMEM);
    600 
    601         drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0);
    602 
    603         vm_ctx->pvr_dev = pvr_dev;
    604         kref_init(&vm_ctx->ref_count);
    605         mutex_init(&vm_ctx->lock);
    606 
    607         drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
    608                        is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
    609                        0, &pvr_dev->base, &vm_ctx->dummy_gem,
    610                        0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_ops);
    611 
    612         vm_ctx->mmu_ctx = pvr_mmu_context_create(pvr_dev);
    613         err = PTR_ERR_OR_ZERO(&vm_ctx->mmu_ctx);
                                      ^
s/&//.

The address is never an error pointer so this will always return 0.
Fixing this will silence the static checker but there are some other
issues as well.

    614         if (err) {
    615                 vm_ctx->mmu_ctx = NULL;

Setting vm_ctx->mmu_ctx is not sufficient.

    616                 goto err_put_ctx;
    617         }
    618 
    619         if (is_userspace_context) {
    620                 err = pvr_fw_object_create(pvr_dev, sizeof(struct rogue_fwif_fwmemcontext),
    621                                            PVR_BO_FW_FLAGS_DEVICE_UNCACHED,
    622                                            fw_mem_context_init, vm_ctx, &vm_ctx->fw_mem_ctx_obj);
    623 
    624                 if (err)
    625                         goto err_page_table_destroy;
    626         }
    627 
    628         return vm_ctx;
    629 
    630 err_page_table_destroy:
--> 631         pvr_mmu_context_destroy(vm_ctx->mmu_ctx);

This will lead to a double free.  Delete.

    632 
    633 err_put_ctx:
    634         pvr_vm_context_put(vm_ctx);

The pvr_vm_context_put() function does:

	kref_put(&vm_ctx->ref_count, pvr_vm_context_release);

I really think that with kref free functions the way to do it is to
wait until the last possible momement when everything has been allocated
before we set up the kref release code.  Here the pvr_vm_context_release()
will call:

	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);

We already did that on line 631 as mentioned so it's a double free.  But
also imagine if vm_ctx->mmu_ctx is NULL, then it will lead to a NULL
dereference.

The pvr_vm_context_release() function has several WARN() functions that
trigger if not everything is set up.  It's complicated to review.  So I
kind of always think that people should manually kfree() things in their
allocation functions and then do a kref_init() at the end.

    635 
    636         return ERR_PTR(err);
    637 }

regards,
dan carpenter
