Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13B403BF9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 16:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6EA6E201;
	Wed,  8 Sep 2021 14:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957B76E1F8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 14:55:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A37991F43738;
 Wed,  8 Sep 2021 15:55:18 +0100 (BST)
Date: Wed, 8 Sep 2021 16:55:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Emma Anholt
 <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>, Rob
 Herring <robh+dt@kernel.org>, Alyssa Rosenzweig
 <alyssa.rosenzweig@collabora.com>, Alex Deucher
 <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue
 for the timeout/fault tdr
Message-ID: <20210908165515.37fef0fc@collabora.com>
In-Reply-To: <f53270a6-bb98-3010-49db-edd10d12902c@amd.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
 <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
 <20210629131858.1a598182@collabora.com>
 <532d1f9d-1092-18c3-c87d-463cfda60ed7@amd.com>
 <eaaad39f-832b-0c43-5043-061dc717a756@amd.com>
 <20210908085038.0feeda7c@collabora.com>
 <f53270a6-bb98-3010-49db-edd10d12902c@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Sep 2021 10:53:21 -0400
Andrey Grodzovsky <andrey.grodzovsky@amd.com> wrote:

> > Note that we need to be careful to not call the sync
> > variant in helpers that are called from the interrupt handler itself
> > to avoid deadlocks (i.e. drm_sched_stop()).  
> 
> 
> I am not clear here - which interrupt handler is drm_sched_stop
> called from ? It's called from TDR work as far as I see in the code.

My bad, I meant the timeout handler, not the interrupt handler.

