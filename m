Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D37CA47BE4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 12:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6876E10EAAA;
	Thu, 27 Feb 2025 11:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Dze0FuYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D8510EAAA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:21:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C58915C4A38;
 Thu, 27 Feb 2025 11:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D8AC4CEDD;
 Thu, 27 Feb 2025 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1740655284;
 bh=bF3bvoCvsJ6ElRLIsgG+zyDMBrm+a5kCvyQlSQ6eyZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dze0FuYMlh2Qw4IBL6eaaSz99/fEsu8+R2Dh5+adaYZ1fzvLz93L0RVRVFpxjwAYi
 qBsQlWRl3br84j5sOMTUT0GKX0720eIB8lP+AWI5rUbqGrv9OwaRrSYJZmmNoOZTVr
 WEYVo650sBdfFOwpkJX9vvW/wMAhS2zOm4RYQP7o=
Date: Thu, 27 Feb 2025 03:20:15 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 1/2] drivers: base: component: add function to query the
 bound status
Message-ID: <2025022705-boat-overhaul-0ed3@gregkh>
References: <20250220234141.2788785-1-heiko@sntech.de>
 <20250220234141.2788785-2-heiko@sntech.de>
 <2025022153-outdoors-snugly-3967@gregkh>
 <12995210.iMDcRRXYNz@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12995210.iMDcRRXYNz@diego>
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

On Thu, Feb 27, 2025 at 09:44:23AM +0100, Heiko Stübner wrote:
> Hi Greg,
> 
> Am Freitag, 21. Februar 2025, 07:14:07 MEZ schrieb Greg KH:
> > On Fri, Feb 21, 2025 at 12:41:40AM +0100, Heiko Stuebner wrote:
> > > The component helpers already expose the bound status in debugfs, but at
> > > times it might be necessary to also check that state in the kernel and
> > > act differently depending on the result.
> > > 
> > > For example the shutdown handler of a drm-driver might need to stop
> > > a whole output pipeline if the drm device is up and running, but may
> > > run into problems if that drm-device has never been set up before,
> > > for example because the binding deferred.
> > > 
> > > So add a little helper that returns the bound status for a componet
> > > device.
> > > 
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >  drivers/base/component.c  | 14 ++++++++++++++
> > >  include/linux/component.h |  4 +++-
> > >  2 files changed, 17 insertions(+), 1 deletion(-)
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> just for safety and not stepping on people's toes, does the Acked-by mean
> that this patch can go together with its user through the drm-misc tree?

Yup, merge away!
