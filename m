Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E77A58964
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 00:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83B810E009;
	Sun,  9 Mar 2025 23:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FYIouOAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E6810E009
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 23:55:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 926E4A45D80;
 Sun,  9 Mar 2025 23:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C090C4CEE3;
 Sun,  9 Mar 2025 23:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741564500;
 bh=nsBH/xv/bf+vR33VyvDASVttWOn8x8HdXn/bnG5ryyg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FYIouOAC9aIesShyEt3ia6/nz7UkK5mqzmMmxtLcmlcFmCbIGJrNP2tqsw649jH6l
 +FGCI+hv9qIcON9meY9mouLgT+f5eyi4rq9460NznS1KL4VP8Ne4yIaAiY8QGa3Yp/
 H9aa7yR673YQQmlgGelI0jb8twQTD6FOHF1dXV0bRhVlzAdf7M7tYqrLtDeVSifi8b
 3zQ4GIStjUMQduu3R6xSjBxzlTk1x+BBoJrzi3B87FwGqeC7BnuasFGLdViU+GMs/n
 nZ8ttkEjGeli5fCIlFUzRqU/Pd4F9aZYYK6tznoG7Asac3SUxw2EVDGDB4HRQzMljz
 yWTaY/CX6dqKQ==
Date: Sun, 9 Mar 2025 23:54:59 +0000
From: Wei Liu <wei.liu@kernel.org>
To: mhklinux@outlook.com
Cc: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 deller@gmx.de, javierm@redhat.com, thomas.tai@oracle.com,
 tzimmermann@suse.de, kasong@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH 1/1] fbdev: hyperv_fb: Fix hang in kdump kernel when on
 Hyper-V Gen 2 VMs
Message-ID: <Z84qU0vJYD72GxcP@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250218230130.3207-1-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218230130.3207-1-mhklinux@outlook.com>
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

On Tue, Feb 18, 2025 at 03:01:30PM -0800, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> Gen 2 Hyper-V VMs boot via EFI and have a standard EFI framebuffer
> device. When the kdump kernel runs in such a VM, loading the efifb
> driver may hang because of accessing the framebuffer at the wrong
> memory address.
> 
> The scenario occurs when the hyperv_fb driver in the original kernel
> moves the framebuffer to a different MMIO address because of conflicts
> with an already-running efifb or simplefb driver. The hyperv_fb driver
> then informs Hyper-V of the change, which is allowed by the Hyper-V FB
> VMBus device protocol. However, when the kexec command loads the kdump
> kernel into crash memory via the kexec_file_load() system call, the
> system call doesn't know the framebuffer has moved, and it sets up the
> kdump screen_info using the original framebuffer address. The transition
> to the kdump kernel does not go through the Hyper-V host, so Hyper-V
> does not reset the framebuffer address like it would do on a reboot.
> When efifb tries to run, it accesses a non-existent framebuffer
> address, which traps to the Hyper-V host. After many such accesses,
> the Hyper-V host thinks the guest is being malicious, and throttles
> the guest to the point that it runs very slowly or appears to have hung.
> 
> When the kdump kernel is loaded into crash memory via the kexec_load()
> system call, the problem does not occur. In this case, the kexec command
> builds the screen_info table itself in user space from data returned
> by the FBIOGET_FSCREENINFO ioctl against /dev/fb0, which gives it the
> new framebuffer location.
> 
> This problem was originally reported in 2020 [1], resulting in commit
> 3cb73bc3fa2a ("hyperv_fb: Update screen_info after removing old
> framebuffer"). This commit solved the problem by setting orig_video_isVGA
> to 0, so the kdump kernel was unaware of the EFI framebuffer. The efifb
> driver did not try to load, and no hang occurred. But in 2024, commit
> c25a19afb81c ("fbdev/hyperv_fb: Do not clear global screen_info")
> effectively reverted 3cb73bc3fa2a. Commit c25a19afb81c has no reference
> to 3cb73bc3fa2a, so perhaps it was done without knowing the implications
> that were reported with 3cb73bc3fa2a. In any case, as of commit
> c25a19afb81c, the original problem came back again.
> 
> Interestingly, the hyperv_drm driver does not have this problem because
> it never moves the framebuffer. The difference is that the hyperv_drm
> driver removes any conflicting framebuffers *before* allocating an MMIO
> address, while the hyperv_fb drivers removes conflicting framebuffers
> *after* allocating an MMIO address. With the "after" ordering, hyperv_fb
> may encounter a conflict and move the framebuffer to a different MMIO
> address. But the conflict is essentially bogus because it is removed
> a few lines of code later.
> 
> Rather than fix the problem with the approach from 2020 in commit
> 3cb73bc3fa2a, instead slightly reorder the steps in hyperv_fb so
> conflicting framebuffers are removed before allocating an MMIO address.
> Then the default framebuffer MMIO address should always be available, and
> there's never any confusion about which framebuffer address the kdump
> kernel should use -- it's always the original address provided by
> the Hyper-V host. This approach is already used by the hyperv_drm
> driver, and is consistent with the usage guidelines at the head of
> the module with the function aperture_remove_conflicting_devices().
> 
> This approach also solves a related minor problem when kexec_load()
> is used to load the kdump kernel. With current code, unbinding and
> rebinding the hyperv_fb driver could result in the framebuffer moving
> back to the default framebuffer address, because on the rebind there
> are no conflicts. If such a move is done after the kdump kernel is
> loaded with the new framebuffer address, at kdump time it could again
> have the wrong address.
> 
> This problem and fix are described in terms of the kdump kernel, but
> it can also occur with any kernel started via kexec.
> 
> See extensive discussion of the problem and solution at [2].
> 
> [1] https://lore.kernel.org/linux-hyperv/20201014092429.1415040-1-kasong@redhat.com/
> [2] https://lore.kernel.org/linux-hyperv/BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com/
> 
> Reported-by: Thomas Tai <thomas.tai@oracle.com>
> Fixes: c25a19afb81c ("fbdev/hyperv_fb: Do not clear global screen_info")
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>

Applied to hyperv-fixes, thanks!
