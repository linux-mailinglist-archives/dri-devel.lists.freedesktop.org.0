Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D446AE6B56
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 17:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDA810E5D5;
	Tue, 24 Jun 2025 15:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ddnVBLNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1B010E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:38:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3DD5860010;
 Tue, 24 Jun 2025 15:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5A4C4CEE3;
 Tue, 24 Jun 2025 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1750779507;
 bh=rXklJ00Z6I5GxsNS607Yboj1efqM7M6krOTzOTuFDY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ddnVBLNIhrnqyoeXv6nLy07w7vBFDKVZ5kNby1Cz3vXgCCgxksm6aeln4z0MXgpDs
 DPe6ugwZNo3mpCzUjhqupzKPhNVfxJZ+RSqmETeeeBBZbLIxsmQPlB69TaC/j/TXuA
 p8GIlNlSmftKwzGV5tFPsJKiyELa0lalNcsKnm3A=
Date: Tue, 24 Jun 2025 16:38:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <2025062434-reviving-grumble-1e53@gregkh>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
 <2025062424-dizziness-theft-0502@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025062424-dizziness-theft-0502@gregkh>
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

On Tue, Jun 24, 2025 at 04:36:35PM +0100, Greg KH wrote:
> On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> > > During rpmsg_probe, fastrpc device nodes are created first, then
> > > channel specific resources are initialized, followed by
> > > of_platform_populate, which triggers context bank probing. This
> > > sequence can cause issues as applications might open the device
> > > node before channel resources are initialized or the session is
> > > available, leading to problems. For example, spin_lock is initialized
> > > after the device node creation, but it is used in device_open,
> > > potentially before initialization. Move device registration after
> > > channel resource initialization in fastrpc_rpmsg_probe.
> > 
> > You've moved device init, however there is still a possibility for the
> > context devices to be created, but not bound to the driver (because all
> > the probings are async). I think instead we should drop the extra
> > platform driver layer and create and set up corresponding devices
> > manually. For example, see how it is handled in
> > host1x_memory_context_list_init(). That function uses iommu-maps, but we
> > can use OF nodes and iommus instead.
> 
> Is this a real platform device?  If so, why do you need a second
> platform driver, what makes this so unique?  If this isn't a platform
> device, then why not just use the faux bus instead?
> 
> It seems that "number of sessions" is a DT property, is that something
> that is really defined by the hardware?  Or is it just a virtual thing
> that people are abusing in the DT?
> 
> And if you really have all these sessions, why not make them real
> devices, wouldn't that make things simpler?

Oh wait, these are "fake" platform devices under the parent (i.e. real)
platform device.  That's not good, please don't do that, use the faux
bus code now instead to properly handle this.  Attempting to create a
device when open() is called is really really odd...

thanks,

greg k-h
