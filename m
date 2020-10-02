Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C622D2811FF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160A96E932;
	Fri,  2 Oct 2020 12:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7FF6E932
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:06:33 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1D954291181;
 Fri,  2 Oct 2020 13:06:32 +0100 (BST)
Date: Fri, 2 Oct 2020 14:06:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>
Subject: Re: [PATCH v2] drm/panfrost: Fix job timeout handling
Message-ID: <20201002140629.79174b26@collabora.com>
In-Reply-To: <20201002071032.1225267-1-boris.brezillon@collabora.com>
References: <20201002071032.1225267-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  2 Oct 2020 09:10:32 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> @@ -392,19 +411,41 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
>  		job_read(pfdev, JS_TAIL_LO(js)),
>  		sched_job);
>  
> +	/* Scheduler is already stopped, nothing to do. */
> +	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
> +		return;
> +
>  	if (!mutex_trylock(&pfdev->reset_lock))
>  		return;
>  
> +	mutex_lock(&pfdev->sched_lock);

Oops, sched_lock shouldn't be acquired here, I switched to a per-queue
lock instead.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
