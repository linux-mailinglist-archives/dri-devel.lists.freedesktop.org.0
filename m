Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF5C4AEBC6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCA710E4CA;
	Wed,  9 Feb 2022 08:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23C310E4B3;
 Wed,  9 Feb 2022 08:04:18 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id co28so3484310edb.1;
 Wed, 09 Feb 2022 00:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2IHtaZQ4VHCdDXTJiEjogwGky3SALl6bw6TJtxch3jU=;
 b=PRuvfJALJofQgjfgs1p274Fnf+swvycQw50iY+IF+qPPgkYrUbFC7KNGlgj87kkkgc
 JtdXTaB2RAGhx5smF4KNdj2D30nDMO5Et6KIbVeCrNfjmy9fr9Xu2iHtmEXWKWtZDCR4
 DYSPw2aN5II94LMM0oDksaFu30sUI7LwXDKmykx7OccB5YQUWURdj0kz9SQrphB40qKd
 jVkFRDJAAOohYxeYnPCyVGBILNSiQw9gl78SaiWsT6ifyOrk7YwNYQGBahN1Iu/oLpgq
 YY92moYgEvDxgEPWM5U9O4DybEYHp5+dQEOPi5NUPWOGvkB/2RMFBNjKSwyOOGj7Nuug
 2LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2IHtaZQ4VHCdDXTJiEjogwGky3SALl6bw6TJtxch3jU=;
 b=8KDFi4AkhtAn/W6Vand0XfPsb69TGVOKfCHn1Hq8DB7b38/nSbUwzmrT277BuakTko
 BWX+a3i9sjQzIdcRFZbaGxRpmvgB/5mh71m2+Q8b4/GiJsC4Y/G2CTaVUyzGaUX4jfAj
 1kmqvLY7/MvOGO43rhNzT8dcQyHPQfLO4fv1+j5ntoKPzw2SkgvLQ/WZZJ0gMKYXJZzo
 Ppx09nXgrPFOr/dkiUEhC+LVWZhPp1kTHNX/tJo6CczDburc6Raga+ROfvQ+VRDHM0Oo
 uq2Za7CWiYHdyPaf9aAjCYBr05lM4qKKrY2Nk78J2c3pLzW9CGWpgo2jk2bzfQnT7RXC
 69bQ==
X-Gm-Message-State: AOAM531jD+HfPnlrsw8cNKR9i3PewKab5syR4B8cCXTFrO4tVK+voQxT
 aeyosn5nUwqOlJklvMa7IP4=
X-Google-Smtp-Source: ABdhPJxljjsqalEpyJV8tgb7S1vLSTBVAMpkB0geQgnAqgCiAocKyBNZh03nXiYG5Tv5IO0LOb4I2w==
X-Received: by 2002:a05:6402:51d2:: with SMTP id
 r18mr1200707edd.98.1644393857458; 
 Wed, 09 Feb 2022 00:04:17 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa?
 ([2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa])
 by smtp.gmail.com with ESMTPSA id w23sm6282190edt.88.2022.02.09.00.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 00:04:17 -0800 (PST)
Message-ID: <efa1a3c2-110f-7995-a4fd-d470e5bd8138@gmail.com>
Date: Wed, 9 Feb 2022 09:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 10/11] drm/amdgpu: Rework amdgpu_device_lock_adev
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-11-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220209002320.6077-11-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
> This functions needs to be split into 2 parts where
> one is called only once for locking single instance of
> reset_domain's sem and reset flag and the other part
> which handles MP1 states should still be called for
> each device in XGMI hive.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 48 ++++++++++++++++------
>   1 file changed, 35 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e05d7cbefd2c..aaecf0797484 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4825,16 +4825,20 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   	return r;
>   }
>   
> -static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
> -				struct amdgpu_hive_info *hive)
> +static void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain,
> +					    struct amdgpu_hive_info *hive)
>   {
> -	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
> +	atomic_set(&reset_domain->in_gpu_reset, 1);
>   
>   	if (hive) {
> -		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
> +		down_write_nest_lock(&reset_domain->sem, &hive->hive_lock);
>   	} else {
> -		down_write(&adev->reset_domain->sem);
> +		down_write(&reset_domain->sem);
>   	}
> +}
> +
> +static void amdgpu_device_set_mp1_state(struct amdgpu_device *adev)
> +{
>   
>   	switch (amdgpu_asic_reset_method(adev)) {
>   	case AMD_RESET_METHOD_MODE1:
> @@ -4849,14 +4853,19 @@ static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
>   	}
>   }
>   
> -static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
> +static void amdgpu_device_unset_mp1_state(struct amdgpu_device *adev)
>   {
>   	amdgpu_vf_error_trans_all(adev);
>   	adev->mp1_state = PP_MP1_STATE_NONE;
> -	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
> -	up_write(&adev->reset_domain->sem);
>   }
>   
> +static void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain)
> +{
> +	atomic_set(&reset_domain->in_gpu_reset, 0);
> +	up_write(&reset_domain->sem);
> +}

I would move this into amdgpu_reset.c and call it 
amdgpu_reset_domain_unlock().

Same of course for amdgpu_reset_domain_lock()...

Apart from that looks good to me,
Christian.

> +
> +
>   static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
>   {
>   	struct pci_dev *p = NULL;
> @@ -5060,10 +5069,15 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>   		device_list_handle = &device_list;
>   	}
>   
> +	/* We need to lock reset domain only once both for XGMI and single device */
> +	tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
> +				    reset_list);
> +	amdgpu_device_lock_reset_domain(tmp_adev->reset_domain, hive);
> +
>   	/* block all schedulers and reset given job's ring */
>   	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
>   
> -		amdgpu_device_lock_adev(tmp_adev, hive);
> +		amdgpu_device_set_mp1_state(tmp_adev);
>   
>   		/*
>   		 * Try to put the audio codec into suspend state
> @@ -5213,9 +5227,14 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>   
>   		if (audio_suspended)
>   			amdgpu_device_resume_display_audio(tmp_adev);
> -		amdgpu_device_unlock_adev(tmp_adev);
> +
> +		amdgpu_device_unset_mp1_state(tmp_adev);
>   	}
>   
> +	tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
> +					    reset_list);
> +	amdgpu_device_unlock_reset_domain(tmp_adev->reset_domain);
> +
>   	if (hive) {
>   		mutex_unlock(&hive->hive_lock);
>   		amdgpu_put_xgmi_hive(hive);
> @@ -5477,7 +5496,8 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>   		 * Locking adev->reset_domain->sem will prevent any external access
>   		 * to GPU during PCI error recovery
>   		 */
> -		amdgpu_device_lock_adev(adev, NULL);
> +		amdgpu_device_lock_reset_domain(adev->reset_domain, NULL);
> +		amdgpu_device_set_mp1_state(adev);
>   
>   		/*
>   		 * Block any work scheduling as we do for regular GPU reset
> @@ -5584,7 +5604,8 @@ pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
>   		DRM_INFO("PCIe error recovery succeeded\n");
>   	} else {
>   		DRM_ERROR("PCIe error recovery failed, err:%d", r);
> -		amdgpu_device_unlock_adev(adev);
> +		amdgpu_device_unset_mp1_state(adev);
> +		amdgpu_device_unlock_reset_domain(adev->reset_domain);
>   	}
>   
>   	return r ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
> @@ -5621,7 +5642,8 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>   		drm_sched_start(&ring->sched, true);
>   	}
>   
> -	amdgpu_device_unlock_adev(adev);
> +	amdgpu_device_unset_mp1_state(adev);
> +	amdgpu_device_unlock_reset_domain(adev->reset_domain);
>   }
>   
>   bool amdgpu_device_cache_pci_state(struct pci_dev *pdev)

