Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915AB5F17EE
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 03:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F0810E4AB;
	Sat,  1 Oct 2022 01:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4281F10E4A8
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 01:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664586212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ww9k5DSHfMADxnlvlFG73SjuMJXJ8KxsGvkZNKI4TIM=;
 b=jHDMDmY0KIbiKgckA4T4zq/Y0XxE6NfXIgzx6ZSVUZrhBOmqOdCPbWREl4+Mpud1eHKthl
 nj3wRRJqpW71LIqp8u/GStl1AmUuRatr0+3Pz2Z71zuleD++PuEqK/1xSRinHjY+9ueabN
 7Wm6XbN9zknw2Emkt1eyrTbDJ+5oj8M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-IEdsqyGxPkyTz8oiA2VdWg-1; Fri, 30 Sep 2022 21:03:30 -0400
X-MC-Unique: IEdsqyGxPkyTz8oiA2VdWg-1
Received: by mail-ej1-f69.google.com with SMTP id
 oz10-20020a1709077d8a00b00783c1ad301fso2377676ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=Ww9k5DSHfMADxnlvlFG73SjuMJXJ8KxsGvkZNKI4TIM=;
 b=5AvJp9KDOpuoK43fok8bZ8NOS5g6Tt1Z5YU/lUiSXFo2sZuBZQ9aY+rUgYrbq5xxIt
 CA4zYHeklVnVO31GdQELSRWpPxylg/pOHAR6RF1pg4E5TiszhUdHJGVzIVPMjodNZ+nC
 NQXW+EROu1am0kageBUtd9b1MWT6g8pt6/GTjP20jzc4Fkt9uNaNahlh2T/enyk+btCl
 maDOdeALlr76eqAq3jgTjK3PkIwK+AUxnmLI1D5YeA20wmQh8RnyRPE9W3+ReUV+Mlkc
 5hAmi1OFREbHgs5ugtXEApbOG30OlaHM3WpLHfVwocdFUi2rq3K5XoARcQvWrcJCGRvG
 IGXQ==
X-Gm-Message-State: ACrzQf0Wn7aQO71c+BFkQOcYOm99rh0K/gC6C97TQpf7dSrYJ1V+4G5e
 G0MrpUfEfP8YxVKfRxLWwWMqXc6gGUEatYQZ/cXt8bZHgrcjuSs1PNF28Knx912G7fc1FIoeXSd
 z5ALBhcqIXMsQHulVZznph+X/P8/T
X-Received: by 2002:aa7:cd0b:0:b0:458:32dd:d9bf with SMTP id
 b11-20020aa7cd0b000000b0045832ddd9bfmr8940507edw.95.1664586209466; 
 Fri, 30 Sep 2022 18:03:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7u3iQdVUzBYhh5k3jMMPOo2wgmR5PGjcEcI6WEN8BDZC7sTkD2/C8316QnzLe2F9EY4ybG7w==
X-Received: by 2002:aa7:cd0b:0:b0:458:32dd:d9bf with SMTP id
 b11-20020aa7cd0b000000b0045832ddd9bfmr8940493edw.95.1664586209253; 
 Fri, 30 Sep 2022 18:03:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 kb20-20020a1709070f9400b0073cdeedf56fsm1924200ejc.57.2022.09.30.18.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 18:03:28 -0700 (PDT)
Message-ID: <9a766b69-f30b-6beb-20a7-d31b6abc345e@redhat.com>
Date: Sat, 1 Oct 2022 03:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH RESEND drm-misc-next 4/7] drm/arm/hdlcd: plane: use drm
 managed resources
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20220905152719.128539-1-dakr@redhat.com>
 <20220905152719.128539-5-dakr@redhat.com>
 <Yx9uAe//u/Z9zfmM@e110455-lin.cambridge.arm.com>
 <dc472070-34a8-93e1-2ca3-4847c49f12eb@redhat.com>
 <YyBGRMAcV2Mrliis@e110455-lin.cambridge.arm.com>
 <a10cf8af-1f62-ddd2-3975-066dd9494c9f@redhat.com>
 <Yzcf1bGciMoQExIh@e110455-lin.cambridge.arm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Yzcf1bGciMoQExIh@e110455-lin.cambridge.arm.com>
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

On 9/30/22 18:56, Liviu Dudau wrote:
> On Wed, Sep 14, 2022 at 12:03:58AM +0200, Danilo Krummrich wrote:
>> Do you mind trying again with my v2 (although v2 shouldn't make a difference
>> for this issue) and provide the back-trace when it hangs?
> 
> Hi Danilo,
> 
> 
> I've finally got a replacement Juno board that it is stable enough.

That's great!

> 
> I've tried your v2 on top of 7860d720a84c ("drm/msm: Fix build break with recent mm tree") which
> is the head of drm-next today and rmmod hangs. /proc/<pid_of_rmmod>/stack shows:

Thanks for taking the time to test the patches and providing this 
stacktrace.

> 
> [<0>] __synchronize_srcu.part.0+0x78/0xec
> [<0>] synchronize_srcu+0xe0/0x134
> [<0>] drm_dev_unplug+0x2c/0x60 [drm]
> [<0>] hdlcd_drm_unbind+0x20/0xc0 [hdlcd]
> [<0>] component_master_del+0xa4/0xc0
> [<0>] hdlcd_remove+0x1c/0x2c [hdlcd]
> [<0>] platform_remove+0x28/0x60
> [<0>] device_remove+0x4c/0x80
> [<0>] device_release_driver_internal+0x1e4/0x250
> [<0>] driver_detach+0x50/0xe0
> [<0>] bus_remove_driver+0x5c/0xbc
> [<0>] driver_unregister+0x30/0x60
> [<0>] platform_driver_unregister+0x14/0x20
> [<0>] hdlcd_platform_driver_exit+0x1c/0xe40 [hdlcd]
> [<0>] __arm64_sys_delete_module+0x18c/0x240
> [<0>] invoke_syscall+0x48/0x114
> [<0>] el0_svc_common.constprop.0+0xcc/0xec
> [<0>] do_el0_svc+0x2c/0xc0
> [<0>] el0_svc+0x2c/0x84
> [<0>] el0t_64_sync_handler+0x11c/0x150
> [<0>] el0t_64_sync+0x18c/0x190
> 

I think I figured it out. I messed up two of the srcu read-side critical 
sections by overlooking alternate return paths within those sections - 
yikes!

I also found a potential use-after-free I accidentally introduced while 
removing the patch in v2.

Finally, I added a patch to remove unnecessary calls to 
drm_mode_config_cleanup() and replaced drm_mode_config_init() with 
drmm_mode_config_init().

I will send you a v3 containing those fixes.

> My quick guess would be that the mixing of managed and unmanaged APIs manages to
> confuse the sleepable RCUs and we get the hang.

I guess you're referring to drm_crtc_init_with_planes() and providing a 
.destroy callback in hdlcd_crtc_funcs. Actually, this .destroy callback 
is handled in the same way as when initializing the crtc with 
drmm_crtc_init_with_planes(), hence I don't think we have a mix of 
managed and unmanaged APIs here.

drmm_crtc_init_with_planes() just calls __drm_crtc_init_with_planes() 
and adds the cleanup via drmm_add_action_or_reset().

Having a .destroy callback registered via drm_crtc_init_with_planes() 
ends up the same way, since drm_mode_config_init() simply calls 
drmm_mode_config_init(), which also registers drm_mode_config_cleanup() 
(ultimately calling the crtc->destroy callback) via 
drmm_add_action_or_reset().

- Danilo

> Will chat with Daniel Vetter next
> week at XDC on what would be the best approach here.
> 
> Best regards,
> Liviu

