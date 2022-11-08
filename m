Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17D1621D56
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 20:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D6410E505;
	Tue,  8 Nov 2022 19:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE1A10E508
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 19:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667937480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RSR7RoU0b/+7lmv0VUCTRtwwQJe3lGysckB67kXlM2I=;
 b=Ffq3IbKcssKvt8XW2XFczX+7V/pZfn0nU53zA+o9vg+8D5mcz/BEjORUfjQhO6ivsm8gZM
 HUoZoM3QtwAHMc9EUrEK4KgMMpD0lGfkUHaoBEcaYTB/lbwO3aVdVr1gnIO4jAIvEr9KDr
 g1qBQe0IUQa6DhJkprEcD3oIJ+o3C08=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-xvq0f7bgO-S2iPQcJLXugA-1; Tue, 08 Nov 2022 14:57:58 -0500
X-MC-Unique: xvq0f7bgO-S2iPQcJLXugA-1
Received: by mail-ej1-f71.google.com with SMTP id
 hp16-20020a1709073e1000b007adf5a83df7so9004613ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 11:57:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RSR7RoU0b/+7lmv0VUCTRtwwQJe3lGysckB67kXlM2I=;
 b=WxsW8cUTduTH/XOchDvcQJNT/XTTzoZdW0ooBneH9C/REALSSFPZKayYnK7lM3ie7P
 KqaPKrTsOCvhAa3c4Q60YmgOY+Y5NKo8pSVM9IV/3YLw8pRUQBcfOPD/YT01VhiLEDU9
 5JUMeU2KNYvsSDE75OyQGOXTe2kaGhwXRpzN9nAenqleCrndqXW6HaBN9eIl7B4dldAq
 fls1olye9rSNA+peKcVBl/AP0a8byyyCa+cG28Wey7WQV+u7tVCcJpK0lLWbTgQI7HWN
 k9bEsAeNvpNKarsQhXyTK+9bRmFkopVLQlDRtKTYbptNQEYBj7LYV+W1OrwPBCwrUR23
 AKyw==
X-Gm-Message-State: ACrzQf1k5/ya7paKSwozEYzjtZb1b8k5BJ8kQ5dINAybkO5gjMJbMEGy
 KskrX8T+nvgFtW6QJQBI4q0a/47sMoJF6zG17+jQZ73TgS7yFVqoaFIkQcRdcEsD454QwKdIIii
 5ZvgT5qOpiouaiyyv3baD7cvO/8GH
X-Received: by 2002:a05:6402:1c0a:b0:463:3cda:3750 with SMTP id
 ck10-20020a0564021c0a00b004633cda3750mr52173984edb.341.1667937477539; 
 Tue, 08 Nov 2022 11:57:57 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7/EXvztwjki8HXi9IfBYEFKcACDK2gkCo4rHMM5Z3uzzi1ZtEy1aQvOJ4cn08gfEXrUdw6Yw==
X-Received: by 2002:a05:6402:1c0a:b0:463:3cda:3750 with SMTP id
 ck10-20020a0564021c0a00b004633cda3750mr52173969edb.341.1667937477321; 
 Tue, 08 Nov 2022 11:57:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906210a00b0078d21574986sm4912530ejt.203.2022.11.08.11.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 11:57:56 -0800 (PST)
Message-ID: <c05f7e24-ab3e-f1e8-f553-381755cd5c40@redhat.com>
Date: Tue, 8 Nov 2022 20:57:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH drm-misc-next v4 0/4] drm/arm/hdlcd: use drm managed
 resources
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20221026153431.72033-1-dakr@redhat.com>
 <Y2VX9Egvh91/u9es@e110455-lin.cambridge.arm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y2VX9Egvh91/u9es@e110455-lin.cambridge.arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liviu,

> The only issue that I'm seeing that is not critical is that at reboot/shutdown time
> I'm getting an "Unexpected global fault, this could be serious" from the smmu:
> 
> [ 6893.467910] arm-smmu 7fb30000.iommu: disabling translation
> [ 6893.473550] ohci-platform 7ffb0000.usb: Removing from iommu group 1
> [ 6893.479909] ehci-platform 7ffc0000.usb: Removing from iommu group 1
> [ 6893.486931] arm-smmu 7fb10000.iommu: disabling translation
> [ 6893.492521] hdlcd 7ff50000.hdlcd: Removing from iommu group 3
> [ 6893.492650] arm-smmu 7fb10000.iommu: Unexpected global fault, this could be serious
> [ 6893.505959] arm-smmu 7fb10000.iommu:         GFSR 0x80000001, GFSYNR0 0x00000000, GFSYNR1 0x00000000, GFSYNR2 0x00000000
> [ 6893.516511] arm-smmu 7fb00000.iommu: disabling translation
> [ 6893.522195] dma-pl330 7ff00000.dma-controller: Removing from iommu group 2
> [ 6893.529607] arm-smmu 2b500000.iommu: disabling translation
> [ 6893.535221] pcieport 0000:00:00.0: Removing from iommu group 0
> [ 6893.541135] pci 0000:01:00.0: Removing from iommu group 0
> [ 6893.546604] pcieport 0000:02:01.0: Removing from iommu group 0
> [ 6893.552511] pcieport 0000:02:02.0: Removing from iommu group 0
> [ 6893.558418] pcieport 0000:02:03.0: Removing from iommu group 0
> [ 6893.564329] pcieport 0000:02:0c.0: Removing from iommu group 0
> [ 6893.570393] pcieport 0000:02:10.0: Removing from iommu group 0
> [ 6893.576314] pcieport 0000:02:1f.0: Removing from iommu group 0
> [ 6893.582214] sata_sil24 0000:03:00.0: Removing from iommu group 0
> [ 6893.588270] sky2 0000:08:00.0: Removing from iommu group 0
> [ 6893.594616] reboot: Power down
> 
> 
> The reboot/shutdown succeeds, so I'm not too worried about it for now, but hope that
> this is something you'll keep in mind in the later series when you do drm_dev_unplug().

Yes, I'd expect this to be related to the missing protection of platform 
device bound resources.

> 
> With that, for the whole series:
> 
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Thanks for the patience and going through the series iterations with me.
> 
> I can pull this series into drm-misc-next on Monday if you don't have any other plans.
Thanks, I saw you already applied the series.

Have you had a look on the same series for malidp?

- Danilo

> 
> Best regards,
> Liviu

