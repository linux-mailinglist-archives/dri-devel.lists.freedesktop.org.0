Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83AD379FD2
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 08:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F066E9C8;
	Tue, 11 May 2021 06:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F5B6E9C7;
 Tue, 11 May 2021 06:40:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id b25so28055435eju.5;
 Mon, 10 May 2021 23:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Y4Rj8EnwtMz41SpIGL/os5eQNolfOJDLLlLCmRKOuDs=;
 b=YgUlJoP2FIif2tAMX6eKiKWcm5EApFrjeiDMmCjznmozQ0DnO5AdXDaQWbujyvo+MH
 PeZOg1D4EoNQNwlt2ySkgMJxmXODOox2KBe7/6F31DLiQOBSkIYt94NGriro+qEr/HiV
 8QtJHFvN0OfOYC7atckqbI4MzHHphANYLC2OtlrPh1/YxhT6kL2oVjnrYArXwMQUYZOe
 BvAAPtwP65f9Y4F7EVdA+L06X1Hxj7/TmH6YSlONfOy4uSLN1nlN0Ry06zShnoTHcSXp
 NfufIhmfk8mRgmHUe/n4D3ApGBqD+cKkuy8E9WJmRDJcGLAdvT6/AYa6xIcv0C7229BF
 iUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Y4Rj8EnwtMz41SpIGL/os5eQNolfOJDLLlLCmRKOuDs=;
 b=B2O0Bt3Duswyl4DOaDiD87uFUUq+PmNfNWe71FaYeqUGiROPb4s8M1JnCpHsUSmnWv
 C0pU3v3yyy83Q6GZeiSPhK+CPeCYnzwsh4MbqZ9IJjQ+8fKP3oX8p9qE1an7XXyC83i3
 sf2Qv+Ro8nsbHq2e61J9s+ooBVmOSu79iulgbv+82tQAQiV6MARxb5JOG6c0+r5V/htS
 jJ7f2Zohg6gX98AO03xlYHBLxV44zKj4KLuKL4bEVyE6KuCmsRWpY1vFnh8c9OkHHTiv
 OlFGnxEGOvql8Q+ZxtxIy2Wx/uLA7b1cHH9atB7JUVf5VMRUBH7qZJZuP+9kPYMmL8Bz
 TGrQ==
X-Gm-Message-State: AOAM533hOZk9gvYPYfir7479/NgvqMvqUeJNz5cmpOwq3tfkW/EMFwqy
 ZMzW/vjeOiOnPFhUt+HityM=
X-Google-Smtp-Source: ABdhPJyIho3bbGTE3v2mbjmVs6euMTooVrultOhj4Y38ONC9T2e5FHKSsjqEId3QlWeO9ks7DS+xLw==
X-Received: by 2002:a17:906:5052:: with SMTP id
 e18mr29979645ejk.112.1620715218066; 
 Mon, 10 May 2021 23:40:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:c3ab:ee01:d547:2c4e?
 ([2a02:908:1252:fb60:c3ab:ee01:d547:2c4e])
 by smtp.gmail.com with ESMTPSA id w19sm13618954edd.52.2021.05.10.23.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 23:40:17 -0700 (PDT)
Subject: Re: [PATCH v6 04/16] drm/amdkfd: Split kfd suspend from devie exit
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-5-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8805dbc5-a607-a36a-d069-6c7c8b72a6b3@gmail.com>
Date: Tue, 11 May 2021 08:40:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510163625.407105-5-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> Helps to expdite HW related stuff to amdgpu_pci_remove
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 3 ++-
>   3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 5f6696a3c778..2b06dee9a0ce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
>   	}
>   }
>   
> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
>   {
>   	if (adev->kfd.dev) {
>   		kgd2kfd_device_exit(adev->kfd.dev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 14f68c028126..f8e10af99c28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
>   			const void *ih_ring_entry);
>   void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
>   void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
>   int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
>   				uint32_t vmid, uint64_t gpu_addr,
>   				uint32_t *ib_cmd, uint32_t ib_len);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 357b9bf62a1c..ab6d2a43c9a3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>   	return kfd->init_complete;
>   }
>   
> +
> +

Looks like unnecessary white space change to me.

>   void kgd2kfd_device_exit(struct kfd_dev *kfd)
>   {
>   	if (kfd->init_complete) {
> -		kgd2kfd_suspend(kfd, false);

Where is the call to this function now?

Christian.

>   		device_queue_manager_uninit(kfd->dqm);
>   		kfd_interrupt_exit(kfd);
>   		kfd_topology_remove_device(kfd);

