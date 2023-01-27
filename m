Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CFA67DEA3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 08:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C15E10E3FB;
	Fri, 27 Jan 2023 07:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB3210E3FB;
 Fri, 27 Jan 2023 07:39:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A08ABB81FB3;
 Fri, 27 Jan 2023 07:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E00C433D2;
 Fri, 27 Jan 2023 07:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674805189;
 bh=+qdWafxmod46goExlLJhaalSioPgDvg8ATeDCNIiPLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2FMiMVNBambXa8qn5z3mdgQ+6xFwnVhjCxouKvX5Oa9sy0HH4vi42LaZp45JpkKpC
 Mao1eTrVg2HE6EiRQDNw+PY87GGaXFO/jqKCfEGJqcxtgkLumBaAnFgc+ITShoeu6Z
 QZ+EPPWoikgjOTZhJRpLUVYk4GypUDVSKXi4Arxg=
Date: Fri, 27 Jan 2023 08:39:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
 the atomic state"
Message-ID: <Y9N/wiIL758c3ozv@kroah.com>
References: <20230112085044.1706379-1-Wayne.Lin@amd.com>
 <20230120174634.GA889896@roeck-us.net>
 <a9deecb3-5955-ee4e-c76f-2654ee9f1a92@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9deecb3-5955-ee4e-c76f-2654ee9f1a92@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 stanislav.lisovskiy@intel.com, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 amd-gfx@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 11:51:04AM -0600, Limonciello, Mario wrote:
> On 1/20/2023 11:46, Guenter Roeck wrote:
> > On Thu, Jan 12, 2023 at 04:50:44PM +0800, Wayne Lin wrote:
> > > This reverts commit 4d07b0bc403403438d9cf88450506240c5faf92f.
> > > 
> > > [Why]
> > > Changes cause regression on amdgpu mst.
> > > E.g.
> > > In fill_dc_mst_payload_table_from_drm(), amdgpu expects to add/remove payload
> > > one by one and call fill_dc_mst_payload_table_from_drm() to update the HW
> > > maintained payload table. But previous change tries to go through all the
> > > payloads in mst_state and update amdpug hw maintained table in once everytime
> > > driver only tries to add/remove a specific payload stream only. The newly
> > > design idea conflicts with the implementation in amdgpu nowadays.
> > > 
> > > [How]
> > > Revert this patch first. After addressing all regression problems caused by
> > > this previous patch, will add it back and adjust it.
> > 
> > Has there been any progress on this revert, or on fixing the underlying
> > problem ?
> > 
> > Thanks,
> > Guenter
> 
> Hi Guenter,
> 
> Wayne is OOO for CNY, but let me update you.
> 
> Harry has sent out this series which is a collection of proper fixes.
> https://patchwork.freedesktop.org/series/113125/
> 
> Once that's reviewed and accepted, 4 of them are applicable for 6.1.

Any hint on when those will be reviewed and accepted?  patchwork doesn't
show any activity on them, or at least I can't figure it out...

thanks,

greg k-h
