Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F97B46B89
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 13:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9139610E0D6;
	Sat,  6 Sep 2025 11:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0aS3Hmnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D708510E0D6
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 11:36:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0447060319;
 Sat,  6 Sep 2025 11:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D48BC4CEE7;
 Sat,  6 Sep 2025 11:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1757158592;
 bh=uk14O7Fz7KUhWd0Sz/kWIAmHtwPD3Rvd0igyAAMEZO0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0aS3Hmnx1CryU2e8d8QkOVtY86s28a5CJwX3iD4L/zCnvZ3VRSZioBEsT1D5SGC2n
 qlGxzX7lagXQMgx99wPQaX+CwbKjWV9JJmFzHhstRlca5J9tPne/uDFASjxrfCGThb
 s7V98zzqhWdiq67ZCxiWvHf4MLO/UF2F4FkmihIA=
Date: Sat, 6 Sep 2025 13:36:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
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
 deller@gmx.de, arnd@arndb.de, sgarzare@redhat.com, horms@kernel.org
Subject: Re: [PATCH v1 2/2] Drivers: hv: Make CONFIG_HYPERV bool
Message-ID: <2025090621-rumble-cost-2c0d@gregkh>
References: <20250906010952.2145389-1-mrathor@linux.microsoft.com>
 <20250906010952.2145389-3-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906010952.2145389-3-mrathor@linux.microsoft.com>
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

On Fri, Sep 05, 2025 at 06:09:52PM -0700, Mukesh Rathor wrote:
> With CONFIG_HYPERV and CONFIG_HYPERV_VMBUS separated, change CONFIG_HYPERV
> to bool from tristate. CONFIG_HYPERV now becomes the core Hyper-V
> hypervisor support, such as hypercalls, clocks/timers, Confidential
> Computing setup, PCI passthru, etc. that doesn't involve VMBus or VMBus
> devices.

But why are you making it so that this can not be a module anymore?  You
are now forcing ALL Linux distro users to always have this code in their
system, despite not ever using the feature.  That feels like a waste to
me.

What is preventing this from staying as a module?  Why must you always
have this code loaded at all times for everyone?

thanks,

greg k-h
