Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2F93FEF76
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC736E56D;
	Thu,  2 Sep 2021 14:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711946E56D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:31:07 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b10so3332732wru.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9hkBk7sDsjjBAe7AUgCdS1m+mzXVFS6kHPRELfYsC1c=;
 b=Y8s+NJiGqgx8TszOhrhN5R6tvbQ7OHnBDyaDgw6+AHEg2rkX66x3Eo/nHE/GhXLryx
 FbQUh7PMIldTWufZmHktHyoYa9nBOPtA/s+X3D8V/zBTco6SXapOdpzOu19bHY1XLrza
 rNkak6BgIt+mGk19F7UnVzexpNRxSt+wWtTLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9hkBk7sDsjjBAe7AUgCdS1m+mzXVFS6kHPRELfYsC1c=;
 b=dQF9bb+sOpwiYxDigZxT4z4PJLZfAwTihmspU/G8DhVZbsp0Jx1dfqCwKwg9XZVgL8
 aYfkweisBXWYkHpwG0VkLc8NLqPm0BMP+RpyXI43rFuJOW5fdw/7C1CRc+y1ICobkwAK
 RJ4SH1MKxKdBIBTogvCORC5DBNQf6PH40flEAcROwu09hvY+xtC+vXIj/H2NZiqUd9cR
 blmQMIj+gZ/JxNn3ATWIjCvdkbwStQRV7KRyDRD5RzGTFc9sqde3kdXwV37UNqOdDTrP
 mrmFNf1UbLNoeFlBFsBJiVEFGBWguwaE7aImKpD8p6iz9TVIX13OtXrIFBTGBK+GBiIZ
 7yAg==
X-Gm-Message-State: AOAM532xmD7TQdpv3nnMIgDtaYlAgyKUWEdLYzuvqzdJ5C/Eh73HSWsE
 Y6cuK/4lvprgpkrjiRfZv4+07RlDhPcZAw==
X-Google-Smtp-Source: ABdhPJxDISoWhPmKGT3+Q/iYvIAPQ+5R6ghnjptaueBqR4FsG1+SlZZK1g+D/kr9jqMd27RZBQKuPA==
X-Received: by 2002:a05:6000:1623:: with SMTP id
 v3mr4235895wrb.288.1630593065981; 
 Thu, 02 Sep 2021 07:31:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m4sm1874978wml.28.2021.09.02.07.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:31:05 -0700 (PDT)
Date: Thu, 2 Sep 2021 16:31:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 David Airlie <airlied@linux.ie>
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
Message-ID: <YTDgJzhOHEQ5ov3x@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 David Airlie <airlied@linux.ie>
References: <20210827100027.1577561-1-javierm@redhat.com>
 <bb5d045c-c9de-b6df-cf45-32b1a866264a@suse.de>
 <YSlI+ryYqoRxM7aB@phenom.ffwll.local>
 <a7395626-f022-5c89-07cd-c30d0d52d3dd@redhat.com>
 <YS4iIR689bAZ4QT9@phenom.ffwll.local>
 <b6ba8f6b-4f0c-53cc-e384-ecea3af78410@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6ba8f6b-4f0c-53cc-e384-ecea3af78410@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 01, 2021 at 11:08:10AM +0200, Javier Martinez Canillas wrote:
> On 8/31/21 2:35 PM, Daniel Vetter wrote:
> > On Sat, Aug 28, 2021 at 12:02:21AM +0200, Javier Martinez Canillas wrote:
> 
> [snip]
> 
> >>
> >> We talked about a drmcon with Peter Robinson as well but then decided that a
> >> way to disable CONFIG_FB but still having the DRM fbdev emulation could be a
> >> intermediary step, hence these RFC patches.
> >>
> >> But yes, I agree that a drmcon would be the proper approach for this, to not
> >> need any fbdev support at all. We will just keep the explicit disable for the
> >> fbdev drivers then in the meantime.
> > 
> > I think the only intermediate step would be to disable the fbdev uapi
> > (char node and anything in sysfs), while still registering against the
> > fbcon layer so you have a console.
> >
> 
> Right, $subject disabled the sysfs interface but left the fbdev chardev. I can
> try to do a v2 that also disables that interface but just keep the fbcon part.
>  
> > But looking at the things syzbot finds the really problematic code is all
> > in the fbcon and console layer in general, and /dev/fb0 seems pretty
> > solid.
> >
> 
> Yes, but still would be an improvement in the sense that no legacy fbdev uAPI
> will be exposed and so user-space would only depend on the DRM/KMS interface.
> 
> > I think for a substantial improvement here in robustness what you really
> > want is
> > - kmscon in userspace
> > - disable FB layer
> > - ideally also disable console/vt layer in the kernel
> 
> Earlier in the thread it was mentioned that an in-kernel drmcon could be used
> instead. My worry with kmscon is that moving something as critical as console
> output to user-space might make harder to troubleshoot early booting issues.
> 
> And also that will require user-space changes. An in-kernel drmcon could be a
> drop-in replacement though.

The drmcon wouldn't be a full console, but just an emergency log renderer.
See Sam's reply, he found the series again.

The real attack surface reduction is in getting rid of the console/vt uapi
implementation from the kernel.
-Daniel

> > - have a minimal emergency/boot-up log thing in drm, patches for that
> >   floated around a few times
> >
> 
> Interesting. Do you have any pointers for this? My search-fu failed me when
> trying to find these patches.
> 
> Best regards,
> -- 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
