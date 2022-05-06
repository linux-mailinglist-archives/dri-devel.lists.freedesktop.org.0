Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C3951E0D2
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 23:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF9910E5F4;
	Fri,  6 May 2022 21:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420A110E5F4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651871392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UC8PN3IHksXw4YLUl2DR5j2jd0ER+gWoSOxwPmBpqKg=;
 b=fVelJyW2EEUpIIyOUt1IO6YnsE/cAQTfuQd7TNdCKoCOgeGGJZih6zVfTHqeiojVTM3omX
 R+IQ28/K+hjuMlRfuXwKDDm/AN3f5JnzxN9jmDYTnnKEFF7xxSLfOmlJoQ3fpUWoV67KG8
 1dCHY4qAPIwhFG4kuCa/pdImloq7blU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-KTV8CWs3NnOUATYt0KoIkA-1; Fri, 06 May 2022 17:09:50 -0400
X-MC-Unique: KTV8CWs3NnOUATYt0KoIkA-1
Received: by mail-qt1-f200.google.com with SMTP id
 r17-20020a05622a035100b002f394e60eb0so7035108qtw.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 14:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=UC8PN3IHksXw4YLUl2DR5j2jd0ER+gWoSOxwPmBpqKg=;
 b=O28iDQs8btCT28Feg0YScXGaX/3ZZN4F37yhbpO3M2PyX1PRyewzCEndHB4QjszoR1
 AHr1nyiwuPA9zRI7SAc8l530Dfk+BymWnYRygbqtph/Bfl7AigOFDz5DZbMRo52z+X7t
 SLkQcIEFroDMGThTghaZXt+D9Dg/w7iAxnmOP/ug5FNXmN338f9tzfEvtAbNgc9+J6Yh
 XC8IulcUS8QFecEmRjIC8H2SDInKQOAAXWO47xcuhgMoFcMbPW9cL3gnzcY8rnr+2SYL
 aK+N1RObHTiYwWFuRFf5fTAFwzNn1y+u0savDRztfPCw8ydAC557mie3TgNIr4MiVSLy
 xw1w==
X-Gm-Message-State: AOAM5335q0uum123zvKKh+gA9vRyMpi/DifqqRPOMrEjCJRr5Rb6Z3y0
 7bVaDcIRO1cERgdABZupGmNLLDSdzv9L08LIWoYOdYxON3IRv2vSbQGY0FFdVjOZ5WAkFl8YxWr
 gwmBzFIEuy+T/Nh8kYj/Fo1Du0e9i
X-Received: by 2002:ac8:57d2:0:b0:2f3:b3b0:ecbe with SMTP id
 w18-20020ac857d2000000b002f3b3b0ecbemr4766064qta.29.1651871389841; 
 Fri, 06 May 2022 14:09:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXZnGn2kgpYuxbTXggVBq/gakbuX/nYQzG8wHJicm20zlfTeeC+kYw7imlv4ImNqRIYEC4Og==
X-Received: by 2002:ac8:57d2:0:b0:2f3:b3b0:ecbe with SMTP id
 w18-20020ac857d2000000b002f3b3b0ecbemr4766041qta.29.1651871389605; 
 Fri, 06 May 2022 14:09:49 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 de27-20020a05620a371b00b0069fe1fc72e7sm3030497qkb.90.2022.05.06.14.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 14:09:49 -0700 (PDT)
Message-ID: <8ec2715e36dbd1fab8a31b4b12660ae83e29303d.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/tegra: Stop using iommu_present()
From: Lyude Paul <lyude@redhat.com>
To: Robin Murphy <robin.murphy@arm.com>, bskeggs@redhat.com, kherbst@redhat.com
Date: Fri, 06 May 2022 17:09:47 -0400
In-Reply-To: <70d40ea441da3663c2824d54102b471e9a621f8a.1649168494.git.robin.murphy@arm.com>
References: <70d40ea441da3663c2824d54102b471e9a621f8a.1649168494.git.robin.murphy@arm.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whoops! Was going through my unread emails and noticed I somehow missed this
patch last month.

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push this to drm-misc-fixes in a little bit (assuming I don't find it
there already)

On Tue, 2022-04-05 at 15:21 +0100, Robin Murphy wrote:
> Even if some IOMMU has registered itself on the platform "bus", that
> doesn't necessarily mean it provides translation for the device we
> care about. Replace iommu_present() with a more appropriate check.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 992cc285f2fe..2ed528c065fa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -123,7 +123,7 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra
> *tdev)
>  
>         mutex_init(&tdev->iommu.mutex);
>  
> -       if (iommu_present(&platform_bus_type)) {
> +       if (device_iommu_mapped(dev)) {
>                 tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
>                 if (!tdev->iommu.domain)
>                         goto error;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

