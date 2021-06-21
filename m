Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9233AEBA3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAFC6E185;
	Mon, 21 Jun 2021 14:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5C06E185
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:44:15 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1BCE71F425E2;
 Mon, 21 Jun 2021 15:44:14 +0100 (BST)
Date: Mon, 21 Jun 2021 16:44:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 01/12] drm/panfrost: Make sure MMU context lifetime
 is not bound to panfrost_priv
Message-ID: <20210621164411.20eeacd4@collabora.com>
In-Reply-To: <828f1e50-323e-7f67-009f-e465720e303c@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-2-boris.brezillon@collabora.com>
 <YNCa46vEbjzWvrLn@maud>
 <828f1e50-323e-7f67-009f-e465720e303c@arm.com>
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
Cc: Icecream95 <ixn@keemail.me>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, stable@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021 15:29:55 +0100
Steven Price <steven.price@arm.com> wrote:

> On 21/06/2021 14:57, Alyssa Rosenzweig wrote:
> >> Jobs can be in-flight when the file descriptor is closed (either because
> >> the process did not terminate properly, or because it didn't wait for
> >> all GPU jobs to be finished), and apparently panfrost_job_close() does
> >> not cancel already running jobs. Let's refcount the MMU context object
> >> so it's lifetime is no longer bound to the FD lifetime and running jobs
> >> can finish properly without generating spurious page faults.  
> > 
> > Remind me - why can't we hard stop in-flight jobs when the fd is closed?
> > I've seen cases where kill -9'ing a badly behaved process doesn't end
> > the fault storm, or unfreeze the desktop.
> >   
> 
> Hard-stopping the in-flight jobs would also make sense. But unless we
> want to actually hang the close() then there will be a period between
> issuing the hard-stop and actually having completed all jobs in the context.

Patch 10 is doing that, I just didn't want to backport all the
dependencies, so I kept it split in 2 halves: one patch fixing the
use-after-free bug, and the other part killing in-flight jobs.

> 
> But equally to be fair I've been cherry-picking this patch myself for
> quite some time, so we should just merge it and improve from there. So
> you can have my:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

