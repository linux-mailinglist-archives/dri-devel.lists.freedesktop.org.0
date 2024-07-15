Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BF593178E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 17:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87910E417;
	Mon, 15 Jul 2024 15:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e15Uh8G9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA9110E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 15:27:54 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so59572841fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721057272; x=1721662072; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/pUmvJtOvJT1+h6Zd6ybwkW7CguoUMaPj5VZN3w6pQ=;
 b=e15Uh8G9z04agjba13Ek+45D0pEM+ppIajNC2P7bLXm7RPD0jrPvk18+9Jhq+NYyRo
 Df0qzzYHpOp/JIVYXOzB08SuPGEktzbxKmwI7KnjYaA7p4WE6f0TEM9MmpAf6A/+crul
 /sEnuioL0mC+rIJNhYCEBFH2x/m4azlpcr6bkYWh6M2BBdTKJ4NI+aIQkL+ZtOrNxSh9
 4zopd08WF/DnlJDrNuO5LNm+64YGA43Sfnawoj8m3WtA2zYYNg9an1o30dG6nu9nsV0i
 t59VbcLQA5VKuGez549hzGdPnLHpdEEBlDc7pnfnYoISrBalaQd9nF+Q+5HDbbJU/yoU
 L3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721057272; x=1721662072;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V/pUmvJtOvJT1+h6Zd6ybwkW7CguoUMaPj5VZN3w6pQ=;
 b=GK4zNK8GDuFjwP9khzOnl6DQMQhlMBf1tzNhR24Nz1xPf31iMRnoJbVFrjb3RBgQx8
 m44ua1+0TAt9mlYM4v/tISG6eRzgLHMYK9+MfEc1iYB2xT/TIEfMNOzI3OJiah1pWDNx
 cFHdOQENUt3Qyaqm/wTcoso7i5uXWooR6oKaWZULQhE5sRoM6/mdlifXo/RsJBsS2ePr
 R0BX6MLGjM6bTCImw5gM3LZbLn6HqglRCZ/RBB7jtuzzw0R3TWj/X367ALXVC7WlPJ+3
 9T7vu26o6xb1Aq70D8vjpHLB52mbStOkM5TconsUcJu6nQKUV0/rCnhMhsUzXq6EV7hi
 HErA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCAUkWAHsFODJ1wCFh+1OHZKWE4A3w0YNk7Siaqx6VrpZCzAc/bxe9YOwiIDlaH3RnloxaAEZx72zhCwsD12tdQ4Ndj+ZM5O8ANrbwWqYd
X-Gm-Message-State: AOJu0YytaM+Qw+YnUp3k1G0/dojTa8SsgFFqASKJhxprbGkrA4Y68bSe
 PpirepnU+RfBffv9dMVYjr20Csi/MrgLARTMtYLvaVj8B5/l/iya
X-Google-Smtp-Source: AGHT+IHTUFkcLvT7zfoIubiQt6y5xEmasMztX/4RmLkdeCIQZWx2Y+/wGoIdOJOOVPc3lgif44e7PA==
X-Received: by 2002:a2e:8949:0:b0:2ee:8698:10ed with SMTP id
 38308e7fff4ca-2eef2da56f0mr1459491fa.49.1721057271886; 
 Mon, 15 Jul 2024 08:27:51 -0700 (PDT)
Received: from fedora ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef57aesm89145505e9.45.2024.07.15.08.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 08:27:51 -0700 (PDT)
Date: Mon, 15 Jul 2024 17:27:49 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Marius Vlad <marius.vlad@collabora.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, mduggan@chromium.org, melissa.srw@gmail.com,
 mripard@kernel.org, rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <ZpU_9WnG_6xfTaTL@fedora>
References: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
 <20240508181744.7030-1-jose.exposito89@gmail.com>
 <CACmi3jF6Dp3PE8X=T5kTO2+eYJQi7jWACFdmp9jzKxUtcQphnQ@mail.gmail.com>
 <Zj5JIah0jWnIn2Ix@localhost.localdomain> <ZkHKhtBmyS12i3fH@fedora>
 <ZkHXS6iBLgRoApNl@xpredator> <ZkI-ZjAYCJaMvmQD@fedora>
 <Zkd_C77S-ERpMiqu@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zkd_C77S-ERpMiqu@localhost.localdomain>
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

On Fri, May 17, 2024 at 06:00:11PM +0200, Louis Chauvet wrote:
> > > > Hi Louis,
> > > > 
> > > > If you could share a RFC/WIP series it would be awesome!
> 
> Hi all!
> 
> I just uploaded my WIP series to github here [1]. Most of the work is 
> extracted from the current ConfigFS series, I just splitted and completed 
> what was done. I also tried to take in account the comments from Sima.
> 
> All commits should compile and `modprobe/rmmod/kms_plane` should not 
> crashing. The commits are not totaly clean, but it should be only cosmetic 
> stuff (formatting in the wrong commit for example). The commit messages 
> are not written yet, but the title should be sufficient to understand the 
> content of each commit.
> 
> This is how I plan to split this work in series: (hash may change over 
> time, I will force push to clean commits)
> 
> Some preparation stuff (no functionnal change):
> 	256d7045ec70 drm/vkms: Formatting and typo fix
> 	cc2de5004c42 drm/vkms: Rename index to possible_crtc
> 	a74cefc87b9c drm/vkms: Add documentation
> 
> More preparation to split everything properly (no functionnal change):
> 	ad2d0b07558f drm/vkms: Properly extract vkms_formats header
> 	f9639cca2d43 drm/vkms: Extract vkms_writeback header
> 	7edda8012b44 drm/vkms: Extract vkms_plane header
> 	ced09ed9d0f7 drm/vkms: Rename macro to avoid confusion
> 	9f00e4823529 drm/vkms: Extract vkms_crtc header
> 	b510e480ed92 drm/vkms: Extract vkms_composer header

Thanks for all your work Louis!!

I reviewed the first 9 patches and added a few comments on your
GitHub fork.

I think that this first batch of patches is independent of the
VKMS ConfigFS work and, if you want, you could send it as it is.

To try to make your work a bit easier, I applied the suggested
fixes and rebased on top of "upstream-drm-misc-next" your patches.

You can find them here:
https://github.com/JoseExposito/linux/commits/patch-vkms-header-refactor/

> Switch all the vkms object to managed (this part need a careful review, 
> I am new with DRM, so I probably did some error):
> 	ddef3c09ead6 drm/vkms: Switch to managed for connector
> 	8859cad0e192 drm/vkms: Switch to managed for encoder
> 	d2b8d93fb684 drm/vkms: Switch to managed for crtc
> 	d1ad316b0f0d drm/vkms: Rename all vkms_crtc instance to be consistent
> 
> Temporaly remove debugfs entry, I plan to remove this commit:
> 	079d875c015e drm/vkms: remove debugfs entry about the current vkms configuration
> 
> Clean up vkms_device and unlink vkms_config from vkms_device.
> 	c782dbe9edc3 drm/vkms: Remove vkms_config from vkms_device
> 	8a27c13634a3 drm/vkms: Remove (useles?) group
> 	8fb24e1cdf88 drm/vkms: Introduce directly the default device as global/Remove default vkms config
> 
> More cleanup:
> 	2572d90723ac drm/vkms: Remove possible crtc from parameters
> 
> Switching to platform driver (same thing, it is my first time, I probably 
> messed up things):
> 	63be09e05760 drm/vkms: Use a real platform driver
> 	5f4cf18b07d3 drm/vkms: Extract device driver in its own file
> 
> The configFS implementation itself. It only allows to create/enable/delete 
> a device:
> 	b34651685f2e drm/vkms: Introduce configfs
> 
> Those commits were a POC to confirm that it works. They need to be 
> replaced by the "real" configuration (creation&link of crtc/connector/planes...)
> 	dd55451ccef2 drm/vkms: Make overlay configurable with configfs
> 	9dca357f1ee3 drm/vkms: Make cursor configurable with configfs
> 	bd721f41fad9 drm/vkms: Make writeback configurable with configfs

I'm still testing/understanding these patches.
I'll keep adding review comments :)

Best wishes,
José Expósito
 
> Kind regards,
> Louis Chauvet
> 
> 
> [1]: https://github.com/Fomys/linux/tree/b4/new-configfs
> 
> > > > Since you are already working on the kernel patches (and I guess IGT?),
> > > > I'll start working on a libdrm high level API to interact with VKMS from
> > > > user-space on top of your patches. I'll share a link as soon as I have a
> > > > draft PR.
> > > 
> > > Just out of curiosity what API would that be? These should fairly
> > > simple that they can be configured from a shell script 
> > > (mount/mkdir/rm/echo/umount). Believe should be easy enough to test stuff with 
> > > bunch scripts like that.
> > 
> > My plan is to add a very thin C API around mkdir/rmdir/etc.
> > 
> > It is true that VKMS can be configure easily using a bash script; however,
> > compositors with test suites written in C (or with bindings to libdrm) would
> > have to write similar wrappers around the mkdir/rmdir/etc calls.
> > I think that it could be beneficial for them to have a shared wrapper available
> > in libdrm.
> >  
> > > Perphas landing the I-G-T tests first (assuming we're settled 
> > > on how exactly this would work) might be of greated help to get a green lit 
> > > the kernel driver side? Skip if vkms/configfs/something else that tells
> > > us VKMS doesn't have ConfigFS eneabled, and run it when that is on.
> > > 
> > > The lastest iteration was shared by Jim at 
> > > https://lore.kernel.org/igt-dev/20230901092819.16924-1-marius.vlad@collabora.com/
> > > 
> > > That way sub-sequent BAT CI would pick up issues, and can also used
> > > independently by Louis. Should also divide the work-load evenly with
> > > Louis focusing on the just the driver. Happy to review and test it.
> > > 
> > > > 
> > > > > Maybe we can discuss a bit the comment from Daniel (split init between 
> > > > > default/configfs, use or not a real platform device...)
> > > > > 
> > > > > For the split, I think the first solution (struct vkms_config) can be 
> > > > > easier to understand and to implement, for two reasons:
> > > > > - No need to distinguish between the "default" and the "configfs" devices 
> > > > >   in the VKMS "core". All is managed with only one struct vkms_config.
> > > > > - Most of the lifetime issue should be gone. The only thing to 
> > > > >   synchronize is passing this vkms_config from ConfigFS to VKMS.
> > > > 
> > > > I agree, this seems like the easiest solution.
> > > > 
> > > > > The drawback of this is that it can become difficult to do the "runtime" 
> > > > > configuration (today only hotplug, but I plan to add more complex stuff 
> > > > > like DP emulation, EDID selection, MST support...). Those configuration 
> > > > > must be done "at runtime" and will require a strong synchronization with 
> > > > > the vkms "core".
> > > > > 
> > > > > Maybe we can distinguish between the "creation" and the "runtime 
> > > > > configuration", in two different configFS directory? Once a device is 
> > > > > created, it is moved to the "enabled" directory and will have a different 
> > > > > set of attribute (connection status, current EDID...)
> > > > 
> > > > Once the device is enabled (i.e, `echo 1 > /config/vkms/my-device/enabled`),
> > > > would it make sense to use sysfs instead of another configfs directory?
> > > > The advantage is that with sysfs the kernel controls the lifetime of the
> > > > objects and I think it *might* simplify the code, but I'll need to write a
> > > > proof of concept to see if this works.
> > > Can indeed sysfs be used similar to ConfigFS? To me it sounds like sysfs is a
> > > view into a kernel objects, mostly for viewing and slight modifications
> > > but not manipulating, adding/removing, on the fly, various things. Sort
> > > of see it the other way around, device enabled with sysfs but
> > > configuration happens through ConfigFS. At least from a user-space pov.
> > > > 
> > > > > For the platform driver part, it seems logic to me to use a "real" 
> > > > > platform driver and a platform device for each pipeline, but I don't have 
> > > > > the experience to tell if this is a good idea or not.
> > > > 
> > > > I'm afraid I don't know which approach could work better. Trusting Sima and
> > > > Maíra on this one.
> > > > 
> > > > Jose
> > > > 
> > > > > [1]: https://lore.kernel.org/dri-devel/20240409-yuv-v6-0-de1c5728fd70@bootlin.com/
> > > > > 
> > > > > Thanks,
> > > > > Louis Chauvet
> > > > > 
> > > > > -- 
> > > > > Louis Chauvet, Bootlin
> > > > > Embedded Linux and Kernel engineering
> > > > > https://bootlin.com
> > 
> > 
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
