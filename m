Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C71CD228
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 08:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0D06E1C0;
	Mon, 11 May 2020 06:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0B389D53;
 Mon, 11 May 2020 06:57:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so9419271wrt.9;
 Sun, 10 May 2020 23:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Sxaf/AT4CNGrgfrOpT8cy4p/turnvsGIsHJJvf1+o2k=;
 b=Os3+O3n6OC420FGF0llg7klC7kxgbPgui/grsjkzpTFbcrblDzUz6k44rVP3OUmz9m
 vQDtOeb/1wu3PbcJuZH0p5PEHve9AxEwcfkc7Bc+ADtf2Aqy6jRgmh2lLjLcKUYvOgHp
 j1hUb85Lqr8DGP0wvRjPHizcllRaadyedLuYZ7BNHYypuyqcMoe5Xj3TMO8cfYxhWhHr
 MGyb1fwJSwxYLTJyaE2HTb0eNIfrtHXS3Gj+McXlNtwiJMnw3LnWySGIBqs9z3YdiLMh
 EslsLvvkR8CnLobZmZRXxV5o/mb4zDi0yeC0ZysD4Adi1FReK7dNb1vogpaZHty4LCEQ
 9gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Sxaf/AT4CNGrgfrOpT8cy4p/turnvsGIsHJJvf1+o2k=;
 b=GG5s0oZu8gwTyw27s8Rr5EaQCuuDoYu9xS08nQmfDPquTcqiicOOjo7rFHP/iG/DBH
 nZtcAinjB8sX+DkA5DUea1HKUdR6leScUIeH6DQsmdmifeJmXcTeHmqWViXtT03Ncguf
 Je4qaj00qlFwwNDYFBMcNfUtYYVH6jPq5y6F4daXFTF40ZXskEZiZ/AWfIuXVqnjQHYf
 GfCwRO088pJxhsfuDXjJELx5uHvqDFyseyRyV/9gYBsfWAUak2U2Mdzb8NmS7cY/eDmT
 8HsOy/ViW5h6ePz6bycHfaBmmOcahHJq7c6wxqXsTzArCLVEaozPnTBh5nnr45I/HJOn
 3dtA==
X-Gm-Message-State: AGi0PubzJ6iJwhMOVIaxRB3XDZtCNXy73QgsmiisRF30Dpi68O6Z/FXF
 3efnXOAEUQTwB5s2eQ/82CU=
X-Google-Smtp-Source: APiQypKdo4C0sRBuJzrkAURscPfndS39AmR7Fsc+lzd0DtjdJT62b4MAL7HBEAyfV1ckEbVJnNedFQ==
X-Received: by 2002:a5d:438e:: with SMTP id i14mr17310443wrq.413.1589180262587; 
 Sun, 10 May 2020 23:57:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f123sm12073020wmf.44.2020.05.10.23.57.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 May 2020 23:57:42 -0700 (PDT)
Subject: Re: [PATCH 3/6] drm/amdgpu: Wait for all user clients
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-4-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cb166673-d165-cb48-40a3-7f669c883a4b@gmail.com>
Date: Mon, 11 May 2020 08:57:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1589050310-19666-4-git-send-email-andrey.grodzovsky@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A commit message would be nice, apart from that the patch looks clean to me.

But question for Daniel and others: Is that in general the right approach?

It can happen that device removal is delayed indefinitely if userspace 
doesn't close the file descriptors.

Regards,
Christian.

Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 4 ++++
>   4 files changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index bc1e0fd..79274d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -990,6 +990,8 @@ struct amdgpu_device {
>   	char				product_number[16];
>   	char				product_name[32];
>   	char				serial[16];
> +
> +	wait_queue_head_t		user_clients_done;
>   };
>   
>   static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device *bdev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 4da52b7..3bd67cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3271,6 +3271,9 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	if (r)
>   		dev_err(adev->dev, "amdgpu_pmu_init failed\n");
>   
> +
> +	init_waitqueue_head(&adev->user_clients_done);
> +
>   	return 0;
>   
>   failed:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index ea2b47e..0531727 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1141,10 +1141,12 @@ static void
>   amdgpu_pci_remove(struct pci_dev *pdev)
>   {
>   	struct drm_device *dev = pci_get_drvdata(pdev);
> +	struct amdgpu_device *adev = dev->dev_private;
>   
>   	drm_dev_unplug(dev);
>   
>   	amdgpu_force_unmap_user_space_mappings(dev);
> +	wait_event(adev->user_clients_done, (dev->open_count == 0));
>   
>   	amdgpu_driver_unload_kms(dev);
>   	pci_disable_device(pdev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 61fb2ef..d8fc775 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -957,8 +957,12 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
>    */
>   void amdgpu_driver_lastclose_kms(struct drm_device *dev)
>   {
> +	struct amdgpu_device *adev = dev->dev_private;
> +
>   	drm_fb_helper_lastclose(dev);
>   	vga_switcheroo_process_delayed_switch();
> +
> +	wake_up(&adev->user_clients_done);
>   }
>   
>   /**

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
