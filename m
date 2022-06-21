Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C283D553907
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 19:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A31310F398;
	Tue, 21 Jun 2022 17:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C0C10F046
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655833179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3XXyHVNk+g2pEDCoGvIH+Q32oqCJYy6oXPFeCSyeyA=;
 b=VEB2azVam1k7T8I1D3xqos3TXfcEVJ97fGCMvh/2EQiEzpRfv3Mshhz3FwCQDAC0Y72EcV
 izPm/ZQHzfjcy7Hc0fKBV0sGnRvVWtO0bghjEG+6xaHkmBFL7byzgXeI+DrDhj75SFOjeG
 iRLGOBdCC7WwbTlEFoCgpn2V3oNCR8c=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-pTQk8ia8Nze3j0GQCqDaxw-1; Tue, 21 Jun 2022 13:39:38 -0400
X-MC-Unique: pTQk8ia8Nze3j0GQCqDaxw-1
Received: by mail-io1-f69.google.com with SMTP id
 14-20020a6b140e000000b0067098279f18so4098041iou.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=L3XXyHVNk+g2pEDCoGvIH+Q32oqCJYy6oXPFeCSyeyA=;
 b=zFreeaW6Wa7tXF12DjGk423tRWQqvyqJ2VlBAVSg/zXN8sWjLYdRB3qte/+7nXGWCc
 16ypV8mpI18DPw29vkaK8UPrOtpCjsAleRScAOPpN9iQpYWwcxzSWVppQnTr0a9uEHY1
 OPartqiCNQ9c18rYdl899vgNw7uAz6xJ8uNF/pSXc9BmK1d8m9d5lMuZumrsDBl5f3SE
 oGOl/sOV6Jqdmd9IHsG1fpmwP7FWnV9yZMNhasw5ArUIZSQo9K61n5y54ptOr23Wav/0
 T+iA0ydz81swPlYgLB8JcyVLqesQs70HoYP9zIs4/ZQkkOoW8fs3aQVT4Wv0e/f6ViM4
 3utQ==
X-Gm-Message-State: AJIora9VDyjp5JHEL6k3p38JHw2DF44wwv5XhANB87AqoTJ6dOGR34Dc
 TmxL7cKaK2UxFltQhCvIbDx6BRiSOiPRpRwtu8ubhihxBDqImvNPu0ENW75XohIH/nYYc2mVUpR
 0PJ7sJ1d8s4fSnXbEnofJeMz+K3c/
X-Received: by 2002:a05:6e02:18c6:b0:2d9:324:231c with SMTP id
 s6-20020a056e0218c600b002d90324231cmr8292283ilu.48.1655833177856; 
 Tue, 21 Jun 2022 10:39:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smUAEIC8nLzyE3YFaCXLbmO5DEm6ColXjmK/zk/DgvOTXiPp8scqcV+6iu/VevbaNBNFE5wg==
X-Received: by 2002:a05:6e02:18c6:b0:2d9:324:231c with SMTP id
 s6-20020a056e0218c600b002d90324231cmr8292267ilu.48.1655833177630; 
 Tue, 21 Jun 2022 10:39:37 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b11-20020a92dccb000000b002d3edd935e5sm7757397ilr.53.2022.06.21.10.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:39:37 -0700 (PDT)
Date: Tue, 21 Jun 2022 11:39:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/aperture: Run fbdev removal before internal helpers
Message-ID: <20220621113935.2b4a1ab8.alex.williamson@redhat.com>
In-Reply-To: <e8b082ab-c3d5-b0cb-0d63-b4100b116b21@suse.de>
References: <20220617121027.30273-1-tzimmermann@suse.de>
 <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
 <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
 <20220617081259.594c1320.alex.williamson@redhat.com>
 <e8b082ab-c3d5-b0cb-0d63-b4100b116b21@suse.de>
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

On Tue, 21 Jun 2022 13:01:08 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 17.06.22 um 16:12 schrieb Alex Williamson:
> > On Fri, 17 Jun 2022 14:41:01 +0200
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >   
> >> Hi
> >>
> >> Am 17.06.22 um 14:29 schrieb Javier Martinez Canillas:  
> >>> [adding Zack and Alex to Cc list]
> >>>
> >>> Hello Thomas,
> >>>
> >>> Thanks a lot for tracking this down and figuring out the root cause!
> >>>
> >>> On 6/17/22 14:10, Thomas Zimmermann wrote:  
> >>>> Always run fbdev removal first to remove simpledrm via
> >>>> sysfb_disable(). This clears the internal state. The later call
> >>>> to drm_aperture_detach_drivers() then does nothing. Otherwise,
> >>>> with drm_aperture_detach_drivers() running first, the call to
> >>>> sysfb_disable() uses inconsistent state.
> >>>>
> >>>> Example backtrace show below:
> >>>>
> >>>> [   11.663422] ==================================================================
> >>>> [   11.663426] BUG: KASAN: use-after-free in device_del+0x79/0x5f0
> >>>> [   11.663435] Read of size 8 at addr ffff888108185050 by task systemd-udevd/311
> >>>> [   11.663440] CPU: 0 PID: 311 Comm: systemd-udevd Tainted: G            E     5
> >>>> 	.19.0-rc2-1-default+ #1689
> >>>> [   11.663445] Hardware name: HP ProLiant DL120 G7, BIOS J01 04/21/2011
> >>>> [   11.663447] Call Trace:
> >>>> [   11.663449]  <TASK>
> >>>> [   11.663451]  ? device_del+0x79/0x5f0
> >>>> [   11.663456]  dump_stack_lvl+0x5b/0x73
> >>>> [   11.663462]  print_address_description.constprop.0+0x1f/0x1b0
> >>>> [   11.663468]  ? device_del+0x79/0x5f0
> >>>> [   11.663471]  ? device_del+0x79/0x5f0
> >>>> [   11.663475]  print_report.cold+0x3c/0x21c
> >>>> [   11.663481]  ? lock_acquired+0x87/0x1e0
> >>>> [   11.663484]  ? lock_acquired+0x87/0x1e0
> >>>> [   11.663489]  ? device_del+0x79/0x5f0
> >>>> [   11.663492]  kasan_report+0xbf/0xf0
> >>>> [   11.663498]  ? device_del+0x79/0x5f0
> >>>> [   11.663503]  device_del+0x79/0x5f0
> >>>> [   11.663509]  ? device_remove_attrs+0x170/0x170
> >>>> [   11.663514]  ? lock_is_held_type+0xe8/0x140
> >>>> [   11.663523]  platform_device_del.part.0+0x19/0xe0
> >>>> [   11.663530]  platform_device_unregister+0x1c/0x30
> >>>> [   11.663535]  sysfb_disable+0x2d/0x70
> >>>> [   11.663540]  remove_conflicting_framebuffers+0x1c/0xf0
> >>>> [   11.663546]  remove_conflicting_pci_framebuffers+0x130/0x1a0
> >>>> [   11.663554]  drm_aperture_remove_conflicting_pci_framebuffers+0x86/0xb0
> >>>> [   11.663561]  ? mgag200_pci_remove+0x30/0x30 [mgag200]
> >>>> [   11.663578]  mgag200_pci_probe+0x2d/0x140 [mgag200]
> >>>>     
> >>>
> >>> Maybe include a Reported-by: Zack Rusin <zackr@vmware.com> ? since
> >>> this seems to be the exact same issue that he reported yesterday.  
> >>
> >> I'll do.
> >>  
> >>>
> >>> Patch looks good to me and this seems to be the correct fix IMO.
> >>> That way we won't re-introduce the issue that was fixed by the
> >>> sysfb_unregister() function, that is to remove a pdev even if wasn't
> >>> bound to a driver to prevent a late simpledrm registration to match.
> >>>
> >>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>  
> >>
> >> Thanks!
> >>  
> >>>
> >>> I wonder what's the best way to coordinate with Alex to merge this
> >>> fix and your patch that moves the aperture code out of DRM, since
> >>> as far as I can tell both should target the v5.20 release.  
> >>
> >> If nothing else comes in, I'll merge this patch on Monday and send Alex
> >> an updated version of the vfio patch.  
> > 
> > Please also publish a topic branch for the base of that patch if you're
> > still looking for the non-drm aperture + vfio series to go in through my
> > vfio tree.  Thanks,  
> 
> I have merge the aperture fix, but the vfio thing is getting 
> complicated. Can we merge your vfio patches through drm-misc-next? As 
> the vfio-side of the change already got an r-b from Javier, it should 
> show up in v5.20 then.

Sure, if you'd like to take
165541193265.1955826.8778757616438743090.stgit@omen via the drm tree,
feel free, it's obviously the more trivial change of the series.
Thanks,

Alex

