Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5945AEF0BA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1EA10E51F;
	Tue,  1 Jul 2025 08:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rXQjAePU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE1B10E51F;
 Tue,  1 Jul 2025 08:17:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E39D25C614F;
 Tue,  1 Jul 2025 08:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F1CC4CEEB;
 Tue,  1 Jul 2025 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751357859;
 bh=RjR9flCJ4czURwcEr5ZovtQZRhNst2rQWm4ARl2i/ZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXQjAePUTZjZJWcj2thQXkev/3yslkppvrqE+WD9hhWzWSHHWoYyW1kPbl1naC8gi
 T7T084yw4lGBUtPjLcF7kgF+PUVFKQg0UqJMQqcrklzNtqXjYTGbnw8MpUHfimo+Ie
 wVwXeFlTdRtHaAhIlPoxLL4zqRy1ahk+MYJdIokk=
Date: Tue, 1 Jul 2025 10:17:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Message-ID: <2025070131-snaking-trolling-87dc@gregkh>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062808-grant-award-ee22@gregkh>
 <a0e54703-721e-4e87-9962-7007771f947b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0e54703-721e-4e87-9962-7007771f947b@intel.com>
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

On Tue, Jul 01, 2025 at 01:37:36PM +0530, Nilawar, Badal wrote:
> 
> On 28-06-2025 17:49, Greg KH wrote:
> > On Wed, Jun 25, 2025 at 10:30:07PM +0530, Badal Nilawar wrote:
> > > +/**
> > > + * struct late_bind_component_ops - ops for Late Binding services.
> > > + * @owner: Module providing the ops
> > > + * @push_config: Sends a config to FW.
> > > + */
> > > +struct late_bind_component_ops {
> > > +	struct module *owner;
> > I don't think you ever set this field, so why is it here?
> > 
> > Or did I miss it somewhere?
> 
> It is set in drivers/misc/mei/late_bind/mei_late_bind.c
> 
> static const struct late_bind_component_ops mei_late_bind_ops = {
>         .owner = THIS_MODULE,
>         .push_config = mei_late_bind_push_config,
> };

Ah.  But then who uses it?  And why?  Normally forcing callers to set
.owner is frowned apon, use a #define correctly to have it automatically
set for you in the registration function please.

And are you _sure_ you need it?

thanks,

greg k-h
