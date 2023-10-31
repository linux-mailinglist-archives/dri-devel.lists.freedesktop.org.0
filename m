Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3947DCCD4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8149E10E4A2;
	Tue, 31 Oct 2023 12:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C50E10E498
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:20:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C1870CE09B1;
 Tue, 31 Oct 2023 12:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B11C433C7;
 Tue, 31 Oct 2023 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1698754828;
 bh=yI9cIfjDH0p+ULOykOKr6PiIJjrMLZUkCkzDvV4S17A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F/PbD1qChBUcGOzVjCdP50zTg+0CzyiNe7xs7hlIkMO8lEikHuPOO3vEdSXX5Kj8h
 u1hUAEb5Ja5KG815zFuBi7QzNpoz/Uccm1sO74Qa9n65tz0ehnGHfGGXJysa7vXLYr
 atPnpm9IqDu3+G0BD0q+48ya4E73jCDl8I36kOBc=
Date: Tue, 31 Oct 2023 13:20:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
Message-ID: <2023103141-clear-scale-897a@gregkh>
References: <20231030171748.35482-1-jose.pekkarinen@foxhound.fi>
 <2023103115-obstruct-smudgy-6cc6@gregkh>
 <3ab58c1e48447798d7525e7d2f42f1a2@foxhound.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ab58c1e48447798d7525e7d2f42f1a2@foxhound.fi>
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
Cc: dillon.varone@amd.com, george.shen@amd.com, sunpeng.li@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 aurabindo.pillai@amd.com, samson.tam@amd.com, skhan@linuxfoundation.org,
 SyedSaaem.Rizvi@amd.com, stable@vger.kernel.org, Jun.Lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 31, 2023 at 01:42:17PM +0200, José Pekkarinen wrote:
> On 2023-10-31 07:48, Greg KH wrote:
> > On Mon, Oct 30, 2023 at 07:17:48PM +0200, José Pekkarinen wrote:
> > > This patch addresses the following warning spotted by
> > > using coccinelle where the case checked does the same
> > > than the else case.
> > > 
> > > drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c:4664:8-10:
> > > WARNING: possible condition with no effect (if == else)
> > > 
> > > Fixes: 974ce181 ("drm/amd/display: Add check for PState change in
> > > DCN32")
> > > 
> > > Cc: stable@vger.kernel.org
> > 
> > Why is this relevant for stable?
> 
>     Hi,
> 
>     I was asked to send it for stable because this code
> looks different in amd-staging-drm-next, see here.
> 
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c#L4661

I don't know what I am looking at, sorry.

>     Feel free to let me know if this is wrong, or if I
> need to review some other guidelines I may have missed.

Please see the list of rules for stable patches:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Does "remove code that does nothing" fit here?

thanks,

greg k-h
