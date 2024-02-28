Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0C86B6E0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 19:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A73810E2F1;
	Wed, 28 Feb 2024 18:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SzgPIBsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D140310E2F1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709143903;
 bh=PCtotY/AbwUHD8aHTvpBNCweMWFJ8vBoB9uGexZK8Ls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SzgPIBsIWjgykKIuysW4k3ideVY1NRcAjMr9lXe5VrqrXJsDZx9uYEZd/Qxmz3Byg
 0LOcCK66I4ZKCXR9NshE2I/iSIIyCPhpFQCMWSFuM29qY26vjXvAFCXmBCAeJMJCAr
 Kp+9RPU0brPSW4qASG9CyYm1+JhTSRaoTxwjeHC0iOX18kcMouwyexxzdzIiAhnurO
 dMeXDqUw1eDIGMtxSrx4fJDaD0lcTZvMKPFd4bnfThfoXdSEGcrs07wdTpkOFJAnt8
 vRBKu+AvY0Nq0pTqPjg7JwnuwvV5P1B9Gty2pKDJ9QOA1e+OPJEOMQ0eVM0Oav3BYQ
 6drV4FnTW+ljg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 07FD33781FE3;
 Wed, 28 Feb 2024 18:11:41 +0000 (UTC)
Date: Wed, 28 Feb 2024 19:11:40 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, "Marty E . Plummer"
 <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>, =?UTF-8?B?Q2w=?=
 =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi
 <ishitatsuyuki@gmail.com>, Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v5 10/14] drm/panthor: Add the scheduler logical block
Message-ID: <20240228191140.6e3d8ce8@collabora.com>
In-Reply-To: <20240218214131.3035480-11-boris.brezillon@collabora.com>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
 <20240218214131.3035480-11-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Sun, 18 Feb 2024 22:41:24 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +static void panthor_sched_immediate_tick(struct panthor_device *ptdev)
> +{
> +	struct panthor_scheduler *sched = ptdev->scheduler;
> +
> +	sched_queue_delayed_work(sched, tick, 0);
> +}
> +
> +/**
> + * panthor_sched_report_mmu_fault() - Report MMU faults to the scheduler.
> + */
> +void panthor_sched_report_mmu_fault(struct panthor_device *ptdev)
> +{
> +	/* Force a tick to immediately kill faulty groups. */
> +	panthor_sched_immediate_tick(ptdev);

We need

	if (ptdev->scheduler)
		panthor_sched_immediate_tick(ptdev);

to prevent a NULL deref in panthor_sched_immediate_tick() if the MMU
fault handler is called before the scheduler block is initialized (FW
boot might trigger MMU faults on AS0).

> +}
