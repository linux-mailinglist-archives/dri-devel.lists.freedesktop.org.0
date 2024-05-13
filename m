Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47388C3CE4
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 10:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F65810E3A4;
	Mon, 13 May 2024 08:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c9jWjZZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CB810E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:08:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34f0e55787aso3216859f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715587721; x=1716192521; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TYCqLLcC+r5dGNKTuLB1ayvdzDR51lh0R2uUNOwd6XA=;
 b=c9jWjZZitflV4Q/aHA9x1kpc9FpK3mBDkcRImyPYaeckn68opMHMWCjbrO2gc+ToIZ
 xCOz6xqNICS2C8A0F4BrwFcUCLSP67OHOYyDZzL3gtqcFpQwpu0+76SjAS/Srl2nz4rZ
 5qxYpPM0ISZBLYdUju3raFv24vGi7Fvt+kRlFpuWXWKXAu7vGb2gWUOoChSX+wPSYDSY
 EzkHCjgsbWo7DlhdUzPI/R75Y/gtFC7rHURS/4ofJp0fYYwTb22zo1/qR1bEVQL1f2mK
 5k0niEyde9pjJ2Ku3emA3P/UyvXLR7Lh58rX/5/+yZIrPMS/QSFNZDzbP+duWKPz3xxO
 2Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715587721; x=1716192521;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYCqLLcC+r5dGNKTuLB1ayvdzDR51lh0R2uUNOwd6XA=;
 b=MTZaTRkkk0T7iTUgbEcBzK8gWxi5nK+Z6yoy9AtgAbb06kgfADONUgb6vL8j4XeJ7X
 bihgvMBH/3okF4PqFQK3RQH3wDy+2FLYyCtsn78uNINbFjONKEpl6oIZXpimPNIAtiJe
 tuaugTgVKhgVMXfuGcIQEJ/xfD5Mg7ER9P0jqdeO7211pTy1xz1haeCLnjvLnq9qEih5
 XJHw3mNok++HE7PX+hp89RkNK74Ym2+hINcbEKVs1aA2TXujlpqj27iUS2X3vYN0PXsK
 LUEf8UMfgW8bb/GMo50HV4aKOoMPZgYIIOx4ef2haEKONSScq8RmlpPoxBQps7vhmkbs
 cbVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZe5junf7qB/SaNs/3r6WGHETwz8AhWkxt/7ZIa7AEXfDSzK0JRfg3p+HRJIlR4CBPUeuALLxJDV+ORwq0gvjgsTAddT3PD3BF00tX2p0t
X-Gm-Message-State: AOJu0YwogOntcdO7pIrnZLj1w7Xs+mifojTkW6wdz8roP3JZlWgAyKAX
 JxiRnSAdAk/xYifrzrjkm3ftbE/Z51jGRYHQZW1GzYdDsgec8coU
X-Google-Smtp-Source: AGHT+IEe9VUuVGU/HsjfLLb0XpK11DKQTSBN2cfjD0XUZz+WBxZjwSjj5+vzLMvgsNfHz+JGeZoNSw==
X-Received: by 2002:a5d:53c8:0:b0:34d:354:b9c1 with SMTP id
 ffacd0b85a97d-3504aa62bb7mr6086423f8f.57.1715587720508; 
 Mon, 13 May 2024 01:08:40 -0700 (PDT)
Received: from fedora ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b895731sm10565071f8f.42.2024.05.13.01.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 01:08:40 -0700 (PDT)
Date: Mon, 13 May 2024 10:08:38 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Jim Shargo <jshargo@google.com>, daniel@ffwll.ch, brpol@chromium.org,
 corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, marius.vlad@collabora.com,
 mduggan@chromium.org, melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <ZkHKhtBmyS12i3fH@fedora>
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
 <20240508181744.7030-1-jose.exposito89@gmail.com>
 <CACmi3jF6Dp3PE8X=T5kTO2+eYJQi7jWACFdmp9jzKxUtcQphnQ@mail.gmail.com>
 <Zj5JIah0jWnIn2Ix@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zj5JIah0jWnIn2Ix@localhost.localdomain>
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

On Fri, May 10, 2024 at 06:19:45PM +0200, Louis Chauvet wrote:
> Le 09/05/24 - 18:18, Jim Shargo a écrit :
> > Sima--thanks SO MUCH for going through with everything leaving a
> > detailed review. I am excited to go through your feedback.
> > 
> > It makes me extremely happy to see these patches get people excited.
> > 
> > They've bounced between a few people, and I recently asked to take
> > them over again from the folks who were most recently looking at them
> > but haven't since had capacity to revisit them. I'd love to contribute
> > more but I am currently pretty swamped and I probably couldn't
> > realistically make too much headway before the middle of June.
> > 
> > José--if you've got capacity and interest, I'd love to see this work
> > get in! Thanks!! Please let me know your timeline and if you want to
> > split anything up or have any questions, I'd love to help if possible.
> > But most important to me is seeing the community benefit from the
> > feature.
> > 
> > And (in case it got lost in the shuffle of all these patches) the IGT
> > tests really make it much easier to develop this thing. Marius has
> > posted the most recent patches:
> > https://lore.kernel.org/igt-dev/?q=configfs
> > 
> > Thanks!
> > -- Jim
> > 
> > 
> > 
> > On Wed, May 8, 2024 at 2:17 PM José Expósito <jose.exposito89@gmail.com> wrote:
> > >
> > > Hi everyone,
> > >
> > > I wasn't aware of these patches, but I'm really glad they are getting
> > > some attention, thanks a lot for your review Sima.
> > >
> > > Given that it's been a while since the patches were emailed, I'm not
> > > sure if the original authors of the patches could implement your
> > > comments. If not, I can work on it. Please let me know.
> > >
> > > I'm working on a Mutter feature that'd greatly benefit from this uapi
> > > and I'm sure other compositors would find it useful.
> > >
> > > I'll start working on a new version in a few days if nobody else is
> > > already working on it.
> > >
> > > Best wishes,
> > > José Expósito
> 
> Hi all!
> 
> Very nice to see other people working on this subject. As the series 
> seemed inactive, I started two weeks ago to rebase it on top of [1]. I 
> also started some work to use drmm_* helpers instead of using lists in 
> vkms. I currently struggle with a deadlock during rmmod.
> 
> I need to clean my commits, but I can share a WIP version.

Hi Louis,

If you could share a RFC/WIP series it would be awesome!

Since you are already working on the kernel patches (and I guess IGT?),
I'll start working on a libdrm high level API to interact with VKMS from
user-space on top of your patches. I'll share a link as soon as I have a
draft PR.

> Maybe we can discuss a bit the comment from Daniel (split init between 
> default/configfs, use or not a real platform device...)
> 
> For the split, I think the first solution (struct vkms_config) can be 
> easier to understand and to implement, for two reasons:
> - No need to distinguish between the "default" and the "configfs" devices 
>   in the VKMS "core". All is managed with only one struct vkms_config.
> - Most of the lifetime issue should be gone. The only thing to 
>   synchronize is passing this vkms_config from ConfigFS to VKMS.

I agree, this seems like the easiest solution.

> The drawback of this is that it can become difficult to do the "runtime" 
> configuration (today only hotplug, but I plan to add more complex stuff 
> like DP emulation, EDID selection, MST support...). Those configuration 
> must be done "at runtime" and will require a strong synchronization with 
> the vkms "core".
> 
> Maybe we can distinguish between the "creation" and the "runtime 
> configuration", in two different configFS directory? Once a device is 
> created, it is moved to the "enabled" directory and will have a different 
> set of attribute (connection status, current EDID...)

Once the device is enabled (i.e, `echo 1 > /config/vkms/my-device/enabled`),
would it make sense to use sysfs instead of another configfs directory?
The advantage is that with sysfs the kernel controls the lifetime of the
objects and I think it *might* simplify the code, but I'll need to write a
proof of concept to see if this works.

> For the platform driver part, it seems logic to me to use a "real" 
> platform driver and a platform device for each pipeline, but I don't have 
> the experience to tell if this is a good idea or not.

I'm afraid I don't know which approach could work better. Trusting Sima and
Maíra on this one.

Jose

> [1]: https://lore.kernel.org/dri-devel/20240409-yuv-v6-0-de1c5728fd70@bootlin.com/
> 
> Thanks,
> Louis Chauvet
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
