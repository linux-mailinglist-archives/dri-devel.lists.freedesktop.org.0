Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3833993F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 22:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ACD6E048;
	Fri, 12 Mar 2021 21:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7F16E048
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 21:48:34 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c06:c400::10eb])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 918F21F47BAD;
 Fri, 12 Mar 2021 21:48:30 +0000 (GMT)
Date: Fri, 12 Mar 2021 21:48:23 +0000
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
Message-ID: <YEvhp7GLAsImL4pD@maud>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
 <20210311140023.2735aaa5@collabora.com>
 <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
 <20210311182458.0e0140a1@collabora.com>
 <CAOFGe95d-LQ_rNwncup-G5oj14uCnNrnHr=r1b5jLYnXfMSTiA@mail.gmail.com>
 <20210312083125.76063c77@collabora.com>
 <CAOFGe967tzx56OQv+z8L2ZB-d=1GST3LtuCQJ_LPHpjO2Km3oQ@mail.gmail.com>
 <20210312192513.469462ef@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312192513.469462ef@collabora.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> >  3. Each VkCommandBuffer is two command buffers: one for compute and
> > one for binning, and you use some sort of HW synchronization mechanism
> > to handle the dependencies as you ping-pong between them.
> 
> I didn't consider that option. We have a DOORBELL instruction on Bifrost
> to wake up the CPU when the GPU wants to report something (not even
> sure we have something equivalent on Midgard), but there's no
> inter-queue sync mechanism AFAICT.

I was about to say that we don't have hardware support. Even considering
DOORBELL (which AFAIK isn't piped through to anything on kbase at
least), I'm inclined to say we don't have hardware support. Option 2
(what kbase does? dunno how DDK vulkan works though) is probably our
best bet, tbh.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
