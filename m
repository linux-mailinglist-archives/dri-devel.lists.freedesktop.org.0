Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4172A2657
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D62A6E42A;
	Mon,  2 Nov 2020 08:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8E86E42A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:45:24 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F08051F44A7F;
 Mon,  2 Nov 2020 08:45:22 +0000 (GMT)
Date: Mon, 2 Nov 2020 09:45:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] drm/panfrost: Move the GPU reset bits outside the
 timeout handler
Message-ID: <20201102094520.66f62b2a@collabora.com>
In-Reply-To: <7c840f9f-a6cb-af80-0c21-da5608e00fbb@arm.com>
References: <20201030105336.764009-1-boris.brezillon@collabora.com>
 <7c840f9f-a6cb-af80-0c21-da5608e00fbb@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: stable@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 30 Oct 2020 14:29:32 +0000
Robin Murphy <robin.murphy@arm.com> wrote:

> On 2020-10-30 10:53, Boris Brezillon wrote:
> [...]
> > +	/* Schedule a reset if there's no reset in progress. */
> > +	if (!atomic_cmpxchg(&pfdev->reset.pending, 0, 1))  
> 
> Nit: this could just be a simple xchg with 1 - you don't need the 
> compare aspect, since setting it to true when it was already true is 
> still harmless ;)

Yep, I'll post a new version using atomic_xchg() here.

Thanks,

Boris

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
