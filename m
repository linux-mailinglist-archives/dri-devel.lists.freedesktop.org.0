Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA6A2FEA5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6E810E21B;
	Mon, 10 Feb 2025 23:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GSes+v/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E4910E21B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739231794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00zVrDfVjXaItDva0W2RZwy2B+2RKPwCMMc/ltLdmxE=;
 b=GSes+v/YT356e+IAlfyP4DwM67JSTNYsyk7mys6zkQQUVqlB6nSPPjnmuLsAM9sAkCq7Tm
 mKYzhqqprfKJ1NBJhphG3v0bBACUiPTUDq9N4KU1VPhuPirpuftAVEWHv1i8jhej6FNCqS
 gr0JAjP/YiZd/c0CfAPb00Lj0ZEpa3I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-WKcGjO6sNOGCdmZUvEZlUA-1; Mon, 10 Feb 2025 18:56:32 -0500
X-MC-Unique: WKcGjO6sNOGCdmZUvEZlUA-1
X-Mimecast-MFC-AGG-ID: WKcGjO6sNOGCdmZUvEZlUA
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e44150a32dso121345246d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739231792; x=1739836592;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00zVrDfVjXaItDva0W2RZwy2B+2RKPwCMMc/ltLdmxE=;
 b=wqOi8XYROufy+Ro6yh40rC2xD0/s3EHEghaLhy647xgXAZvzTvDq8T2nSoANtrQ9I0
 NarUe+E1NHyuNzmDzArzX7KGMW8SHswAY9o0T3OlajeNCcXSR+masH2O3ZUOYjDKc9gz
 g8kTP65ik919m8KEudr7IIjRMotBQ/04xsCm8UvYtTA5UxzIGQ8VKOLCxABVrhu23LE3
 kBKPbZ64pL+xwxqlSe1p77jeNedawDzr0hsPAGj/dMEAiq9e6f2lpWW0KtOKLZAOuSyF
 YXdXw3/DSB0u6YxVdG5KV9W9a3X6RyOd0BGQgiDpxb6tDR3rEMM/j2SaYV+KMdrBseMj
 8GSQ==
X-Gm-Message-State: AOJu0Yxg6SldhB8Yew0eY1jl31fYfkfcvfrLlUjMode7S4ApOjGI/wbl
 etzg5zRcWizIZ1txq1BOhZ3gvu/QjZ3IBA9ayY+M6TJohlKyQWqgrwHRIjB3CnlnBcplC8tZRKH
 2jTRgl1jnVIxBC1cSX5tV4RDL1IQxjJBKkTMpzrXbiurJyrnnlXVNE0+/IJvEI7m57g==
X-Gm-Gg: ASbGncuthOEvaH8cDKZlrmZKlonJBBHU6b2ORJNeUVViHrqXBa60bfEj6v9nJlVlvtS
 ibF7vJPcTRIgf+mYLMGhNDMj52HXw7lVvAHhy1Z0f4DHYCJvr2JqsKH/Mt0OBB9ss/msd/uI2MA
 DLOWSTcuJcXfsLM2P0Cn8E4D5Jx03/UgR7CY2jyjRratI4QJ3Hqgm+b4SvZBplBatY1Ozse8Jh5
 4gWzLWC7GmEBZJRlzujuH/9lpP1UMQgeuOpd7AUYAxS/NfGc/XJ8voQXKdAhc7fUaHmakz7kwLZ
 nEue
X-Received: by 2002:a05:6214:4108:b0:6e4:2f4c:f2d2 with SMTP id
 6a1803df08f44-6e4456d9da8mr232522076d6.31.1739231792047; 
 Mon, 10 Feb 2025 15:56:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmUoRcB8F2i3rLS9u2hkgfZbI19/TiD5QZMRyg7oxpwPHi67YZY6q7qMfmv5QJMuG4tXI+/g==
X-Received: by 2002:a05:6214:4108:b0:6e4:2f4c:f2d2 with SMTP id
 6a1803df08f44-6e4456d9da8mr232521766d6.31.1739231791656; 
 Mon, 10 Feb 2025 15:56:31 -0800 (PST)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e43ba36d5csm53280906d6.26.2025.02.10.15.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 15:56:31 -0800 (PST)
Message-ID: <3c06cc1bb206f1ff9925dc4c7cf5a23f3f6c3505.camel@redhat.com>
Subject: Re: hyper_bf soft lockup on Azure Gen2 VM when taking kdump or
 executing kexec
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>, "thomas.tai@oracle.com"
 <thomas.tai@oracle.com>, "mhkelley58@gmail.com" <mhkelley58@gmail.com>, 
 "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>, 
 "decui@microsoft.com"
 <decui@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>, 
 "javierm@redhat.com"
 <javierm@redhat.com>, Helge Deller <deller@gmx.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Date: Mon, 10 Feb 2025 18:56:30 -0500
In-Reply-To: <SN6PR02MB41574DC1576DC20772D9CB05D4F22@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <BLAPR10MB521780F7C93DC013E2E031BDFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415732CABA59155898531226D4E92@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BLAPR10MB521743AC3C146116D8F6BCACFDE92@BLAPR10MB5217.namprd10.prod.outlook.com>
 <SN6PR02MB415777C53A930259A54E213ED4F52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41578AC54B7C0B7386B8ED00D4F62@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41572155B6D139C499814EB7D4F12@SN6PR02MB4157.namprd02.prod.outlook.com>
 <edf0e21a-db9f-42a8-ae0f-76a9d93713fb@oracle.com>
 <SN6PR02MB41574DC1576DC20772D9CB05D4F22@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 57_ORztFTubbNgyjVeMFZR502B6CluBwD8ZfRObObtk_1739231792
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-02-10 at 21:35 +0000, Michael Kelley wrote:
> From: thomas.tai@oracle.com <thomas.tai@oracle.com> Sent: Monday, February 10, 2025 7:08 AM
> > <snip>
> > 
> > > > Then the question is why the efifb driver doesn't work in the kdump
> > > > kernel. Actually, it *does* work in many cases. I built the 6.13.0 kernel
> > > > on the Oracle Linux 9.4 system, and transferred the kernel image binary
> > > > and module binaries to an Ubuntu 20.04 VM in Azure. In that VM, the
> > > > efifb driver is loaded as part of the kdump kernel, and it doesn't cause
> > > > any problems. But there's an interesting difference. In the Oracle Linux
> > > > 9.4 VM, the efifb driver finds the framebuffer at 0x40000000, while on
> > > > the Ubuntu 20.04 VM, it finds the framebuffer at 0x40900000. This
> > > > difference is due to differences in how the screen_info variable gets
> > > > setup in the two VMs.
> > > > 
> > > > When the normal kernel starts in a freshly booted VM, Hyper-V provides
> > > > the EFI framebuffer at 0x40000000, and it works. But after the Hyper-V
> > > > FB driver or Hyper-V DRM driver has initialized, Linux has picked a
> > > > different MMIO address range and told Hyper-V to use the new
> > > > address range (which often starts at 0x40900000). A kexec does *not*
> > > > reset Hyper-V's transition to the new range, so when the efifb driver
> > > > tries to use the framebuffer at 0x40000000, the accesses trap to
> > > > Hyper-V and probably fail or timeout (I'm not sure of the details). After
> > > > the guest does some number of these bad references, Hyper-V considers
> > > > itself to be under attack from an ill-behaving guest, and throttles the
> > > > guest so that it doesn't run for a few seconds. The throttling repeats,
> > > > and results in extremely slow running in the kdump kernel.
> > > > 
> > > > Somehow in the Ubuntu 20.04 VM, the location of the frame buffer
> > > > as stored in screen_info.lfb_base gets updated to be 0x40900000. I
> > > > haven't fully debugged how that happens. But with that update, the
> > > > efifb driver is using the updated framebuffer address and it works. On
> > > > the Oracle Linux 9.4 system, that update doesn't appear to happen,
> > > > and the problem occurs.
> > > > 
> > > > This in an interim update on the problem. I'm still investigating how
> > > > screen_info.lfb_base is set in the kdump kernel, and why it is different
> > > > in the Ubuntu 20.04 VM vs. in the Oracle Linux 9.4 VM. Once that is
> > > > well understood, we can contemplate how to fix the problem. Undoing
> > > > the revert that is commit 2bebc3cd4870 doesn't seem like the solution
> > > > since the original code there was reported to cause many other issues.
> > > > The solution focus will likely be on how to ensure the kdump kernel gets
> > > > the correct framebuffer address so the efifb driver works, since the
> > > > framebuffer address changing is a quirk of Hyper-V behavior.
> > > > 
> > > > If anyone else has insight into what's going on here, please chime in.
> > > > What I've learned so far is still somewhat tentative.
> > > > 
> > > Here's what is happening. On Ubuntu 20.04, the kdump image is
> > > loaded into crash memory using the kexec command. Ubuntu 20.04
> > > has kexec from the kexec-tools package version 2.0.18-1ubuntu1.1,
> > > and per the kexec man page, it defaults to using the older kexec_load()
> > > system call. When using kexec_load(), the contents to be loaded into
> > > crash memory is constructed in user space by the kexec command.
> > > The kexec command gets the "screen_info" settings, including the
> > > physical address of the frame buffer, via the FBIOGET_FSCREENINFO
> > > ioctl against /dev/fb0. The Hyper-V FB or DRM driver registers itself
> > > with the fbdev subsystem so that it is /dev/fb0, and the ioctl returns
> > > the updated framebuffer address. So the efifb driver loads and runs
> > > correctly.
> > > 
> > > On Oracle Linux 9.4, the kdump image is also loaded with the
> > > kexec command, but from kexec-tools package version
> > > kexec-tools-2.0.28-1.0.10.el9_5.x86_64, which is slightly later than
> > > the version on Ubuntu 20.04. This newer kexec defaults to using the
> > > newer kexec_file_load() system call. This system call gets the
> > > framebuffer address from the screen_info variable in the kernel, which
> > > has not been updated to reflect the new framebuffer address. Hence
> > > in the kdump kernel, the efifb driver uses the old framebuffer address,
> > > and hence the problem.
> > > 
> > > To further complicate matters, the kexec on Oracle Linux 9.4 seems to
> > > have a bug when the -c option forces the use of kexec_load() instead
> > > of kexec_file_load(). As an experiment, I modified the kdumpctl shell
> > > script to add the "-c" option to kexec, but in that case the value "0x0"
> > > is passed as the framebuffer address, which is wrong. Furthermore,
> > > the " screen_info.orig_video_isVGA" value (which I mentioned earlier
> > > in connection with commit 2bebc3cd4870) is also set to 0, so the
> > > kdump kernel no longer thinks it has an EFI framebuffer. Hence the
> > > efifb driver isn't loaded, and the kdump works, though for the wrong
> > > reasons. If kexec 2.0.18 from Ubuntu is copied onto the Oracle Linux 9.4
> > > VM, then kdump works as expected, with the efifb driver being loaded
> > > and using the correct framebuffer address. So something is going wrong
> > > with kexec 2.0.28 in how it sets up the screen_info when the -c option
> > > is used. I'll leave the debugging of the kexec bug to someone else.
> > 
> > Hi Michael,
> > 
> > Do you think we need to handle Azure Gen2 VM differently in the kexec?
> > 
> > Or should we change the kexec_file_load() system call to retrieve the correct
> > framebuffer address?
> 
> I'm thinking there may be a fix in the Hyper-V FB and Hyper-V DRM drivers.
> Commit c25a19afb81c may also be a cause of the problem -- see precursor
> commit 3cb73bc3fa2a, which describes exactly the problem. I still need to
> do some testing, but without that commit, kdump won't detect that it has
> an EFI framebuffer, won't load the efifb driver, and so won't encounter the
> problem. But we probably need to get Thomas Zimmerman to weigh in on
> the implications of reverting c25a19afb81c.
> 
> There's one additional variation of the problem. Assume the Hyper-V FB
> driver is loaded (for example) during boot and moves the framebuffer. Then
> system runs kexec as part of arming kdump during the boot sequence.
> The most recent location of the framebuffer (and whether it is an EFI framebuffer)
> gets picked at the time kexec runs, and is stored in the crash kernel memory area.
> But what if the framebuffer later moves, perhaps because the Hyper-V FB driver
> is unbound? The crash kernel memory area doesn’t get updated and kdump
> could still have the wrong framebuffer address. This anomaly argues for the
> commit 3cb73bc3fa2a approach of just ensuring that the efifb driver doesn't
> load. Of course that approach means that the kdump kernel *must* contain
> either the Hyper-V FB or Hyper-V DRM driver in order to work on a system
> with only a framebuffer for text output. The efifb driver won't work. But
> perhaps that's OK.
> 
> Changing kexec (or the invoking script) to special case Hyper-V Gen 2 VMs and
> always use kexec_load() instead of kexec_file_load() sounds like a big hack
> to me.  And with that approach, you give up the ability to enforce loading only
> properly signed kdump images. This is something kexec_file_load() provides
> that kexec_load() doesn't, and is one of the main reasons that kexec_file_load()
> was added.
> 
> Whether the kexec_file_load() system call could be enhanced to get the
> frame buffer information from the /dev/fb0 device, I'm not sure. That might
> be a reasonable approach, though it still has the problem that the framebuffer
> address could change *after* kexec_file_load() runs.
> 
> Anyway, that's a dump of my current thoughts. I haven't reached a final
> conclusion or recommendation yet. Comments from others on the
> thread are welcome.

Hi!

Asking because I also had to do some digging in this area:

Do you think that the kernel can *ask* the hypervisor where the framebuffer is instead
of relying on bios, the bootloader and/or kexec to somehow provide this information?

If hyperv doesn't provide this API, how hard it would be in your opinion to provide it?

I am asking because, I also had to debug a RHEL downstream issue where a slightly botched backport
ensured that the first stage of the compressed uefi boot image, stopped passing the 'screen_info'
to the second stage (the kernel itself), and as a result of this, the second stage stopped
loading simplefb, and as a result of *this*, the PCI driver started to try to use the framebuffer
range for its own use which failed and resulted in a cryptic error.

If the kernel was to just issue some form of a hypercall to ask the hypervisor where the framebuffer currently is,
we could avoid a whole class of bugs similar to this.
What do you think?

Best regards,
	Maxim Levitsky


> 
> Michael
> 
> > Thank you,
> > Thomas
> > 
> > > I'm still thinking about alternatives to fix this mess. Please chime
> > > in if you have suggestions.
> > > 
> > > Michael


