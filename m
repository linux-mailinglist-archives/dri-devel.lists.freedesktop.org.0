Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9698307EB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 15:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EE910E6D0;
	Wed, 17 Jan 2024 14:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E510E6D0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 14:23:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F08D07EC;
 Wed, 17 Jan 2024 15:22:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1705501350;
 bh=dXOeYu9ggWmzyIC3akHRQqTJ5XlpJZMzEgPrXY4d6mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VMn4qsHi7ppcVV7CoFFLGYd3xK0BxH1krOxGyszjba1Yx6FK/Q7ezXi30c0Xj9/iq
 LjwFAQ0S4mgRKeMx8cTtdAF4DcXqrUFyD0XuQVE+uDqtrzfQR/GUIiYztLReCQU9pD
 VDNKDVQIEd5Dv7kuNn5paKz9VebqmbHJGGQMVa14=
Date: Wed, 17 Jan 2024 16:23:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
Message-ID: <20240117142343.GD17920@pendragon.ideasonboard.com>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
 <6jhwss2wego6yoo5mwmphwawhsj5bbj62gwrzcpapoixwkrkli@g4fbxdooopby>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6jhwss2wego6yoo5mwmphwawhsj5bbj62gwrzcpapoixwkrkli@g4fbxdooopby>
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
Cc: tzimmermann@suse.de, airlied@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 daniel@ffwll.ch, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 09:28:39AM +0100, Maxime Ripard wrote:
> On Fri, Jan 12, 2024 at 03:42:18PM -0800, Anatoliy Klymenko wrote:
> > Patches 1/4,2/4,3/4 are minor fixes.
> > 
> > DPSUB requires input live video format to be configured.
> > Patch 4/4: The DP Subsystem requires the input live video format to be
> > configured. In this patch we are assuming that the CRTC's bus format is fixed
> > and comes from the device tree. This is a proposed solution, as there are no api
> > to query CRTC output bus format.
> > 
> > Is this a good approach to go with?
> 
> I guess you would need to expand a bit on what "live video input" is? Is
> it some kind of mechanism to bypass memory and take your pixels straight
> from a FIFO from another device, or something else?

Yes and no.

The DPSUB integrates DMA engines, a blending engine (two planes), and a
DP encoder. The dpsub driver supports all of this, and creates a DRM
device. The DP encoder hardware always takes its input data from the
output of the blending engine.

The blending engine can optionally take input data from a bus connected
to the FPGA fabric, instead of taking it from the DPSUB internal DMA
engines. When operating in that mode, the dpsub driver exposes the DP
encoder as a bridge, and internally programs the blending engine to
disable blending. Typically, the FPGA fabric will then contain a CRTC of
some sort, with a driver that will acquire the DP encoder bridge as
usually done.

In this mode of operation, it is typical for the IP cores in FPGA fabric
to be synthesized with a fixed format (as that saves resources), while
the DPSUB supports multiple input formats. Bridge drivers in the
upstream kernel work the other way around, with the bridge hardware
supporting a limited set of formats, and the CRTC then being programmed
with whatever the bridges chain needs. Here, the negotiation needs to go
the other way around, as the CRTC is the limiting factor, not the
bridge.

Is this explanation clear ?

-- 
Regards,

Laurent Pinchart
