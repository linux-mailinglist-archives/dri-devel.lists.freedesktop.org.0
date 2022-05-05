Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908FF51BEE5
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466B910FD88;
	Thu,  5 May 2022 12:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF83610FD77
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:11:33 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gh6so8376726ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=N08Sho3YmOzZV4Xmv5ubYbgs6HE2xL/dzKMzdTYL8gA=;
 b=iWDokVh+M+PJFJ4WXspIWRIr4xZBwoG5kib0tP8dS8ZnRJkbDIW9+ZVzIN8uQ6TuBY
 PkUxBRJ9j/Ko3VCKffcIo1diKYGul7Av4a273Hf7+ApnJcM872uaXA50YZoUmfwhuo0U
 /WjIA5wjPYH/gD0rGarI+Mm1TBf+hDrr/JtHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=N08Sho3YmOzZV4Xmv5ubYbgs6HE2xL/dzKMzdTYL8gA=;
 b=rXRvmJlc4Cpr/M4peeATYbQ0U9l0ZMuZ/h5pFIgcC09YVmw35iqB3Hpw0KeN1H4FQA
 BSxcoJpnCUYCeEv+7BMdYeANZZVfBznxUrOPKOlrXlhGyZ1kBp9W6svwrRy5eSR4E0ZR
 z7RXNjPb9+j3c8SHuN1iQcaEOjX53/kVOKHpZhe26ownh09kb9v20SBf3pzZ69gRIIev
 fTUtzRedeKc6sO7q7PSceygGxm0Dpptq9OZTu9X/lb3VQha89qB70SiiBnD6ghIhpnlv
 2CLe0ISQjqGbPzRYTVgwU9JEwkAAdE2ZmMZhdEe+zw/vmkR5A41/kVPQeu11lCjB1dlT
 nRqg==
X-Gm-Message-State: AOAM533yaFAeWU2ZjVmqOswO/p3FyYE/pF2uThCJ1OTYW5nqO9c7DSKS
 sAPR6QjJyb12+OXOPKDel9+LPA==
X-Google-Smtp-Source: ABdhPJwq3J4tX4uCUfKvT72QVZzU32c80ZumjeVZ0kKs7MA8Ur8AGGK7TytwyRYTa7mQmaP6Et++tA==
X-Received: by 2002:a17:906:c156:b0:6f3:9e3c:5cc8 with SMTP id
 dp22-20020a170906c15600b006f39e3c5cc8mr25652607ejc.17.1651752692375; 
 Thu, 05 May 2022 05:11:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a13-20020aa7c80d000000b0042617ba63d6sm715903edt.96.2022.05.05.05.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:11:31 -0700 (PDT)
Date: Thu, 5 May 2022 14:11:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Message-ID: <YnO+8hZ0ozPaZUEj@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220503071540.471667-1-javierm@redhat.com>
 <20220503071540.471667-4-javierm@redhat.com>
 <YnJcaaDcIsJKhSwQ@phenom.ffwll.local>
 <bfb03d40-a023-12a9-9554-1b6e6c474134@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfb03d40-a023-12a9-9554-1b6e6c474134@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 01:32:37PM +0200, Javier Martinez Canillas wrote:
> On 5/4/22 12:58, Daniel Vetter wrote:
> > On Tue, May 03, 2022 at 09:15:40AM +0200, Javier Martinez Canillas wrote:
> >> Indicate to fbdev subsystem that the registered framebuffer is provided by
> >> the system firmware, so that it can handle accordingly. For example, would
> >> unregister the FB devices if asked to remove the conflicting framebuffers.
> >>
> >> Add a new DRM_FB_FW field to drm_fbdev_generic_setup() options parameter.
> >> Drivers can use this to indicate the FB helper initialization that the FB
> >> registered is provided by the firmware, so it can be configured as such.
> >>
> >> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> ---
> >>
> >> Changes in v3:
> >> - Drop the firmware local variable (Laurent Pinchart).
> >> - Use DRM_FB_OPTION() since DRM_FB_SET_OPTION() got renamed (kernel test robot).
> > 
> > Just for the record what I brought up on irc already:
> > 
> > FBINFO_MISC_FIRMWARE is purely an internal flag with no uapi impact, and
> > it's only to control whether we nuke this from
> > remove_conflicting_framebuffer or not. Since simpledrm only ever binds
> > against sysfb I think it'd be cleaner to only rely on that, and relegate
> 
> That's not actually true. The OF subsystem also registers "simple-framebuffer"
> devices when there are Device Tree nodes that contain a "simple-framebuffer"
> compatible string. In that case these pdev will also bind against simpledrm.

TIL.

> > that entire FBINFO_MISC_FIRMWARE misc hack to the fbdev dungeons and let
> > it quietly wither away there.
> >
> > Also I'm not a huge fan of these midlayer flags in general :-)
> 
> And while I agree with you that these midlayer flags are horrible, that is
> what any other fbdev that makes use of a firmware-provided framebuffer set,
> so simpledrm emulated fbdev shouldn't be the exception IMO.

So we discussed this a pile more on irc, and at least my take is that
people who run simpledrm but want to combine that with fbdev drivers and
expect it to all work nicely we can probably ignore. At least until all
this sysfb stuff is nicely unified, and at that point we shouldn't need
special flags anymore.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
