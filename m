Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6A37A027
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 08:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E081B6E9D7;
	Tue, 11 May 2021 06:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461626E9D8;
 Tue, 11 May 2021 06:56:03 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id w3so28172351ejc.4;
 Mon, 10 May 2021 23:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1toSUP/AaDQn+kpmlAa3khwelYYn5sPMI8SmjGTagCQ=;
 b=N/J54ruGrwq8pFl23R0IhoJx5i5wz54wTHbAhpylgexUUJ7nBAq4f942QlHcIssvJG
 X+If8eJtXAJ4mCMZ+LuRjODG8BmDmVsINFFfgUHGqHPUKDRjAOi4sXcSbvzk/K9M+Zcg
 7f0j8T0fSMu2k83PwnQ7PTR08uSCRRNR7T37VCojHcqcyhbD5iseJgf5gSt9aT0+oQjH
 7B1fSfggVhA035Co+rwxVP/fAOpzv8oNzsLRLXdqQEOIYKOT2bVVHULwv2fiAF1mRb0H
 vay8+a3E4NEIjMCstMTt9hNAUMq4o+d2K5Tn+/aOJJ1QinOGaD6Ktr/DvmBNGPh/GcTo
 apsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1toSUP/AaDQn+kpmlAa3khwelYYn5sPMI8SmjGTagCQ=;
 b=OAI40NLKkVPU+81Q1wmuy+YIqCVBx7LMzkLPJOVhS5dQwxKCq2/KhPdOP9MOzIG0Xh
 AL6e9rOcp/AFx7yir1XHjQx7+6TvzLb1wuO0RY9KYPWMxeprVf4CJI4y3EA/xt4MIEpM
 h5z5IJv1SJ5Qylj8EbmNyBoryr0Ba7+8CfFDEpC//bafayBj7KC4vobnSBmTrKJ06LWY
 jCDhAc2wqqzmIKDz4lFiNZgzkIbHv2vXr/NnlXvN4XwVcNQSKJzi8ut5yl3MriKFIWMe
 FvbjitopT70m2GSApZfhivLX1QeZuffThwV67XWXrrXnVvQM7SjWl/jR+yImPOSQbucy
 ZU1Q==
X-Gm-Message-State: AOAM5327f4wpa9l1EOEfI0cr3HdfNgOS2g8vLqMfFzPSy5Bk0g7H9bZJ
 zqjB7fXc8Os6Nhy9VcOnIbg=
X-Google-Smtp-Source: ABdhPJz2Xs+emszyd7P6ez0qEzKjruy/WoTOQ1rs7N8d7ThB9eLy0tSAfXUL8Y8cv7KFVTtVFChCbg==
X-Received: by 2002:a17:906:8307:: with SMTP id
 j7mr28982463ejx.420.1620716161994; 
 Mon, 10 May 2021 23:56:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c3ab:ee01:d547:2c4e?
 ([2a02:908:1252:fb60:c3ab:ee01:d547:2c4e])
 by smtp.gmail.com with ESMTPSA id w6sm8003653edc.25.2021.05.10.23.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 23:56:01 -0700 (PDT)
Subject: Re: [PATCH v6 16/16] drm/amdgpu: Verify DMA opearations from device
 are done
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-17-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2660cf0e-d312-787d-3100-8e1006d8cc35@gmail.com>
Date: Tue, 11 May 2021 08:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510163625.407105-17-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.05.21 um 18:36 schrieb Andrey Grodzovsky:
> In case device remove is just simualted by sysfs then verify
> device doesn't keep doing DMA to the released memory after
> pci_remove is done.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 83006f45b10b..5e6af9e0b7bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1314,7 +1314,13 @@ amdgpu_pci_remove(struct pci_dev *pdev)
>   	drm_dev_unplug(dev);
>   	amdgpu_driver_unload_kms(dev);
>   
> +	/*
> +	 * Flush any in flight DMA operations from device.
> +	 * Clear the Bus Master Enable bit and then wait on the PCIe Device
> +	 * StatusTransactions Pending bit.
> +	 */
>   	pci_disable_device(pdev);
> +	pci_wait_for_pending_transaction(pdev);
>   }
>   
>   static void

