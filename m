Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2818FBAED65
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 02:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD8F10E2F5;
	Wed,  1 Oct 2025 00:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ksftohVl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DF510E2F5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 00:01:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 62D4544E3F;
 Wed,  1 Oct 2025 00:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD063C113D0;
 Wed,  1 Oct 2025 00:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759276919;
 bh=3y68Tqy6cDtlcmDOr/T5Y/n7dmVkzFZcMAywC6/1zAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ksftohVl2Qo0dLrp1wRNv9/74o1Fs7lEIRefjQh7LKdfvCLUMg9xMh1ELfqzluFRi
 qsENQ2370Fzn0agVtBXxyPDE3Zb0sknD/K0DnzraIyszsT6PwomnKkQVAFjZB4RAbG
 f0WWr3hw8EZlihgHXFMr0EcrJSfUQrxCKSLiFBM50iwiryha4eDBX7cC0c0u4Smb+M
 g2mg5N2i+VED0wcsKCG+/wkoMwOSkZQjyWXNVov94eNZKaWnpLYE8vrXVaoWH1SYZW
 HqweboEtW61q7LNtIDeEt4mfkkga0AiDYtNv35UcHtsD6HOfCp7xR5t4D4klBB4W7W
 2DaB5l93yFmFw==
Date: Wed, 1 Oct 2025 00:01:57 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Mukesh Rathor <mrathor@linux.microsoft.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jikos@kernel.org, bentiss@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 dmitry.torokhov@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, bhelgaas@google.com,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 gregkh@linuxfoundation.org, deller@gmx.de, arnd@arndb.de,
 sgarzare@redhat.com, horms@kernel.org
Subject: Re: [PATCH v2 0/2] Fix CONFIG_HYPERV and vmbus related anamoly
Message-ID: <aNxvde1KTtLeZEKy@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250915234604.3256611-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915234604.3256611-1-mrathor@linux.microsoft.com>
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

On Mon, Sep 15, 2025 at 04:46:02PM -0700, Mukesh Rathor wrote:
> At present, drivers/Makefile will subst =m to =y for CONFIG_HYPERV
> for hv subdir. Also, drivers/hv/Makefile replaces =m to =y to build in
> hv_common.c that is needed for the drivers. Moreover, vmbus driver is
> built if CONFIG_HYPER is set, either loadable or builtin.
> 
> This is not a good approach. CONFIG_HYPERV is really an umbrella
> config that encompasses builtin code and various other things and not
> a dedicated config option for VMBus. VMBus should really have a config
> option just like CONFIG_HYPERV_BALLOON etc. This small series introduces
> CONFIG_HYPERV_VMBUS to build VMBus driver and make that distinction
> explicit. With that CONFIG_HYPERV could be changed to bool.
> 
> For now, hv_common.c is left as is to reduce conflicts for upcoming
> patches, but once merges are mostly done, that and some others should
> be moved to virt/hyperv directory.
> 
> V2:
>  o rebased on hyper-next: commit 553d825fb2f0 
>         ("x86/hyperv: Switch to msi_create_parent_irq_domain()")
> 
> V1:
>  o Change subject from hyper-v to "Drivers: hv:"
>  o Rewrite commit messages paying attention to VMBus and not vmbus
>  o Change some wordings in Kconfig
>  o Make new VMBUS config option default to HYPERV option for a smoother
>    transition
> 
> Mukesh Rathor (2):
>   Driver: hv: Add CONFIG_HYPERV_VMBUS option

I changed Driver to Drivers and applied both patches. Thanks.
