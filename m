Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14154EA6A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9019010E54E;
	Thu, 16 Jun 2022 19:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CB710E54E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655409333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ys2keuyjGOnYxAsZaMh0khOvW2SYs1SLvLOIoAesU54=;
 b=RkVJxmGVAq1yoXlwgOqHamptK18+EDByLY9P2QG+OMGrB8p/IOugDNkQkHcOdZO/c8jsoS
 13Dtimp6xcYtAjWLXNA3tJdsyupIqOgubS00ROIu4oomxx3Vc20Lc2r8H6rGOD/hJZuM06
 AnC/W0OmiUL8toskffmtkaHlfA/wlu0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-l0un8BbPPBWYDFLdp0LC5Q-1; Thu, 16 Jun 2022 15:55:30 -0400
X-MC-Unique: l0un8BbPPBWYDFLdp0LC5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 k34-20020a05600c1ca200b0039c7db490c8so1330771wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 12:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ys2keuyjGOnYxAsZaMh0khOvW2SYs1SLvLOIoAesU54=;
 b=8FS5TfNKixaNKGIUPvYtgkHVM5Ijek15ZG/njXFNAQibn7X1BOQCdpod/MCZEMFMDB
 jTahfv4zTBIqh27QilFUCXl1tmrUM4oLm9yql1gQUsWH/axgHQxyYoQ3gkWC24wWOkC7
 Cp/T5PjDSEgLdGtouxSPeSVz6TBpTa9xYQ2GYONGO7OjFxFrPGwUyxvV8F2cKAS1bp/p
 JYta8u3nhm1jTJ30zDoLdVdQEwcCpgZQPUS9fvmUvhPJJXVMaxPt7AWaT+HI2NesVn6q
 5NF6dOM9XH5UPkD/Ca69yPTOjDwYoMTYO5p70nLgqxbNKi67xR8l2L17TZ1n5JWM4LFS
 cFJw==
X-Gm-Message-State: AOAM533Moh0ice5hQ7XJsgDf/KaxOFvJ6stmdSkJJgFrlr222cWHhCJz
 Kgs5zQ7GWU6jOyk42SZWyETJoTtF0OdjEZqRUYXokbUYSr9ojMcaT4PnbNURxvbYDwV6VtCt7Pd
 zWYZDYp/Qyr6kUBEzcTM89oEZxSxE
X-Received: by 2002:a05:600c:294a:b0:39c:4df5:f825 with SMTP id
 n10-20020a05600c294a00b0039c4df5f825mr17322080wmd.55.1655409326636; 
 Thu, 16 Jun 2022 12:55:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR8ZU9QDRz515iHBXgPuPCog+HviQMDV3yKwqceawwks+wUtwyLzvQ0pWFkTp40mYRTIYHHg==
X-Received: by 2002:a05:600c:294a:b0:39c:4df5:f825 with SMTP id
 n10-20020a05600c294a00b0039c4df5f825mr17322057wmd.55.1655409326396; 
 Thu, 16 Jun 2022 12:55:26 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b17-20020a5d6351000000b0020fee88d0f2sm3262351wrw.0.2022.06.16.12.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 12:55:25 -0700 (PDT)
Message-ID: <38473dcd-0666-67b9-28bd-afa2d0ce434a@redhat.com>
Date: Thu, 16 Jun 2022 21:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
To: Zack Rusin <zackr@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-4-javierm@redhat.com>
 <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Zack,

On 6/16/22 21:29, Zack Rusin wrote:
> On Tue, 2022-06-07 at 20:23 +0200, Javier Martinez Canillas wrote:
>> The platform devices registered by sysfb match with firmware-based DRM or
>> fbdev drivers, that are used to have early graphics using a framebuffer
>> provided by the system firmware.
>>

[snip]

> 
> Hi, Javier.
> 
> This change broke arm64 with vmwgfx. We get a kernel oops at boot (let me know if
> you'd like .config or just have us test something directly for you):
>

Yes please share your .config and I'll try to reproduce on an arm64 machine.

> 
>  Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000008
>  Mem abort info:
>    ESR = 0x96000004
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x04: level 0 translation fault
>  Data abort info:
>    ISV = 0, ISS = 0x00000004
>    CM = 0, WnR = 0
>  user pgtable: 4k pages, 48-bit VAs, pgdp=00000001787ee000
>  [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
>  Internal error: Oops: 96000004 [#1] SMP
>  Modules linked in: vmwgfx(+) e1000e(+) nvme ahci(+) xhci_pci drm_ttm_helper ttm
> sha256_arm64 sha1_ce nvme_core xhci_pci_renesas aes_neon_bs aes_neon_blk aes>
>  CPU: 3 PID: 215 Comm: systemd-udevd Tainted: G     U            5.18.0-rc5-vmwgfx
> #12

I'm confused, your kernel version seems to be 5.18.0-rc5 but this patch
is only in drm-misc-next now and will land in 5.20...

Did you backport it? Can you please try to reproduce with latest drm-tip ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

