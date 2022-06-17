Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5C54F8F4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 16:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1DC11A54D;
	Fri, 17 Jun 2022 14:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F7B11A52A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 14:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655475184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aDMqPY+ioTCrDxKVX1xXKuzThWoqWE6ZRM86G1CbXoY=;
 b=N5n2yVkBqkzMl27pvX5ABJuyvWrco/G5Rr+rMxglb9Y99EpSKApRQ3XEGZUvDNHuBjV6lP
 71yy9F1hBV1Iu8tZ7sTpTOTRjKp7tkK45N54CgDb5uL+Vs1+u1KYQBFT09FNS7mI2nN5g7
 KJ32xvN4SVQsJ/4tN87OoisqcBSDy+g=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-WmQklyFpNDmjS_R5q9BdnQ-1; Fri, 17 Jun 2022 10:13:03 -0400
X-MC-Unique: WmQklyFpNDmjS_R5q9BdnQ-1
Received: by mail-io1-f72.google.com with SMTP id
 n20-20020a6b7214000000b00669cae33d00so2572263ioc.17
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=aDMqPY+ioTCrDxKVX1xXKuzThWoqWE6ZRM86G1CbXoY=;
 b=edcCwv1NCxIbI3TJoXsxhavBOyQiRusbNgFCdfln3/ish2lB2nFP2lDFKyy868YTvY
 mcnOVq/t4TvC0+4VhMAugd3Gyxj6BAEYgbFqZs06HEWZBt8nn4PshUCHw85CCPnNIzHt
 3x8jVHMLWZIdYOqw5ckSZiuniPDM7pvyRIv/+kvFjaVnx0se/Js8wJz97pms/Ww1CpGx
 q/xK9rAzIqDl87zRmhLR6SNrURqsPkSfqm5PGgtVvI7uTJuDiCzhXZo+uK+lFTUBkhae
 exbgJkpsv7j1dOTZ9yqdH1mumSUWzBz0Uv7UHhxwm7pZH+HyQl9L2BDpbUjS3p7YNnIc
 HYIw==
X-Gm-Message-State: AJIora8Ky1ZBweGFVikdguiGX/6AwMNIMLMPRn21PIgOQXrI591WaCJB
 grhWRpYX89uyv64RFLByJKaY2Mg1kDjJSZog4H1E3kdJT80SeHwqB9yWalz4I7YGKSygrv3pH6Y
 9Hl54y0modWFADMFTGwznR7YTLbke
X-Received: by 2002:a05:6638:24c7:b0:331:f0ae:3a17 with SMTP id
 y7-20020a05663824c700b00331f0ae3a17mr5528080jat.238.1655475181808; 
 Fri, 17 Jun 2022 07:13:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1VUoQaEh733+m3oZW63B1RreK4qSdMuYsAJYOfO0ynS+w4Ak7VDuN+tK9tlrlailBNj+jkA==
X-Received: by 2002:a05:6638:24c7:b0:331:f0ae:3a17 with SMTP id
 y7-20020a05663824c700b00331f0ae3a17mr5528066jat.238.1655475181576; 
 Fri, 17 Jun 2022 07:13:01 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056e020c0800b002d149ec2606sm2352992ile.65.2022.06.17.07.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 07:13:01 -0700 (PDT)
Date: Fri, 17 Jun 2022 08:12:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/aperture: Run fbdev removal before internal helpers
Message-ID: <20220617081259.594c1320.alex.williamson@redhat.com>
In-Reply-To: <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
References: <20220617121027.30273-1-tzimmermann@suse.de>
 <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
 <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: airlied@linux.ie, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Jun 2022 14:41:01 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 17.06.22 um 14:29 schrieb Javier Martinez Canillas:
> > [adding Zack and Alex to Cc list]
> > 
> > Hello Thomas,
> > 
> > Thanks a lot for tracking this down and figuring out the root cause!
> > 
> > On 6/17/22 14:10, Thomas Zimmermann wrote:  
> >> Always run fbdev removal first to remove simpledrm via
> >> sysfb_disable(). This clears the internal state. The later call
> >> to drm_aperture_detach_drivers() then does nothing. Otherwise,
> >> with drm_aperture_detach_drivers() running first, the call to
> >> sysfb_disable() uses inconsistent state.
> >>
> >> Example backtrace show below:
> >>
> >> [   11.663422] ==================================================================
> >> [   11.663426] BUG: KASAN: use-after-free in device_del+0x79/0x5f0
> >> [   11.663435] Read of size 8 at addr ffff888108185050 by task systemd-udevd/311
> >> [   11.663440] CPU: 0 PID: 311 Comm: systemd-udevd Tainted: G            E     5
> >> 	.19.0-rc2-1-default+ #1689
> >> [   11.663445] Hardware name: HP ProLiant DL120 G7, BIOS J01 04/21/2011
> >> [   11.663447] Call Trace:
> >> [   11.663449]  <TASK>
> >> [   11.663451]  ? device_del+0x79/0x5f0
> >> [   11.663456]  dump_stack_lvl+0x5b/0x73
> >> [   11.663462]  print_address_description.constprop.0+0x1f/0x1b0
> >> [   11.663468]  ? device_del+0x79/0x5f0
> >> [   11.663471]  ? device_del+0x79/0x5f0
> >> [   11.663475]  print_report.cold+0x3c/0x21c
> >> [   11.663481]  ? lock_acquired+0x87/0x1e0
> >> [   11.663484]  ? lock_acquired+0x87/0x1e0
> >> [   11.663489]  ? device_del+0x79/0x5f0
> >> [   11.663492]  kasan_report+0xbf/0xf0
> >> [   11.663498]  ? device_del+0x79/0x5f0
> >> [   11.663503]  device_del+0x79/0x5f0
> >> [   11.663509]  ? device_remove_attrs+0x170/0x170
> >> [   11.663514]  ? lock_is_held_type+0xe8/0x140
> >> [   11.663523]  platform_device_del.part.0+0x19/0xe0
> >> [   11.663530]  platform_device_unregister+0x1c/0x30
> >> [   11.663535]  sysfb_disable+0x2d/0x70
> >> [   11.663540]  remove_conflicting_framebuffers+0x1c/0xf0
> >> [   11.663546]  remove_conflicting_pci_framebuffers+0x130/0x1a0
> >> [   11.663554]  drm_aperture_remove_conflicting_pci_framebuffers+0x86/0xb0
> >> [   11.663561]  ? mgag200_pci_remove+0x30/0x30 [mgag200]
> >> [   11.663578]  mgag200_pci_probe+0x2d/0x140 [mgag200]
> >>  
> > 
> > Maybe include a Reported-by: Zack Rusin <zackr@vmware.com> ? since
> > this seems to be the exact same issue that he reported yesterday.  
> 
> I'll do.
> 
> > 
> > Patch looks good to me and this seems to be the correct fix IMO.
> > That way we won't re-introduce the issue that was fixed by the
> > sysfb_unregister() function, that is to remove a pdev even if wasn't
> > bound to a driver to prevent a late simpledrm registration to match.
> > 
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>  
> 
> Thanks!
> 
> > 
> > I wonder what's the best way to coordinate with Alex to merge this
> > fix and your patch that moves the aperture code out of DRM, since
> > as far as I can tell both should target the v5.20 release.  
> 
> If nothing else comes in, I'll merge this patch on Monday and send Alex 
> an updated version of the vfio patch.

Please also publish a topic branch for the base of that patch if you're
still looking for the non-drm aperture + vfio series to go in through my
vfio tree.  Thanks,

Alex

