Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F893BA1FB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 16:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCD089F6D;
	Fri,  2 Jul 2021 14:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5254B89F6D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 14:09:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B42861F44C5D;
 Fri,  2 Jul 2021 15:09:24 +0100 (BST)
Date: Fri, 2 Jul 2021 16:09:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add the ability to create submit
 queues
Message-ID: <20210702160921.31fbe935@collabora.com>
In-Reply-To: <YN8bbhHA74joPggh@maud>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-5-boris.brezillon@collabora.com>
 <b277ce22-f2d2-35e5-30cd-c851a7896b44@arm.com>
 <20210702124320.1bd0f228@collabora.com> <YN8bbhHA74joPggh@maud>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Jul 2021 09:58:06 -0400
Alyssa Rosenzweig <alyssa@collabora.com> wrote:

> > > My Vulkan knowledge is limited so I'm not sure whether this is the right
> > > approach or not. In particular is it correct that an application can
> > > create a high priority queue which could affect other (normal priority)
> > > applications?  
> > 
> > That's what msm does (with no extra CAPS check AFAICT), and the
> > freedreno driver can already create high priority queues if
> > PIPE_CONTEXT_HIGH_PRIORITY is passed. Not saying that's okay to allow
> > userspace to tweak the priority, but if that's a problem, other drivers
> > are in trouble too ;-).  
> 
> Speaking of, how will PIPE_CONTEXT_HIGH_PRIORITY be implemented with the
> new ioctl()? I envisioned something much simpler (for the old ioctl),
> just adding a "high priority?" flag to the submit and internally
> creating the two queues of normal/high priority for drm_sched to work
> out. Is this juggling now moved to userspace?

That's what freedreno does. I guess we could create 2 default queues
(one normal and one high prio) and extend the old submit ioctl() to do
what you suggest if you see a good reason to not switch to the new
ioctl() directly. I mean, we'll have to keep support for both anyway,
but switching to the new ioctl()) shouldn't be that hard (I can prepare
a MR transitioning the gallium driver to BATCH_SUBMIT if you want).
