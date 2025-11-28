Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC3C918BA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11EB10E8C5;
	Fri, 28 Nov 2025 09:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oxOtPzNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8D410E8D4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323895;
 bh=1zM3SCuINYRGOt7LJKgt6Miofu1D6I9LW/+uEdWjLWI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oxOtPzNyF9kFhG2PY3GVFNWrneJbFqjKsIwELWNP4C4pq/Ktt/M+ZMYbexxkcnXtb
 ayv1EAhfLx51q1cUxMnQZiGYCUuRWsc7b4adqZYe3rYg40u6PrZNEl7+OZspZNjlhb
 6oc6r4GXkzwCm5RjOdO0UMN2+8XiHrq5bkI2GJjEFb6oRvsLO8SYhqDE2wuiPuYus5
 x6Wat5enKMXSdqBXrImT8Mfzhp60gvJzyC9qmRMUMHzzkzr5x8Hq6t1ySGpqj+iM6B
 40XOPt1CRGDmyVuhNR43+L6azG71+h0es57UdCO8JiL9HEl/I4LlVAzlnB7xygcLrX
 2RMAwb3ft66Aw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F3ABC17E10E7;
 Fri, 28 Nov 2025 10:58:14 +0100 (CET)
Date: Fri, 28 Nov 2025 10:58:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin
 <florent.tomasin@arm.com>, Heinrich Fink <hfink@snap.com>, Chia-I Wu
 <olvaffe@gmail.com>, kernel@collabora.com
Subject: Re: [PATCH v3 0/8] drm/panthor: Misc scheduler fixes
Message-ID: <20251128105804.1905728e@fedora>
In-Reply-To: <20251128094839.3856402-1-boris.brezillon@collabora.com>
References: <20251128094839.3856402-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Fri, 28 Nov 2025 10:48:31 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
> This series is a collection of fixes that seem to address the problem
> reported here [1]. In order to validate those changes, I added a few
> IGT tests [2], but I'd like to extend the test coverage before claiming
> this is working properly. Until I get to it, I thought I'd post what
> I have for preliminary review/testing.
> 
> No major changes in this version, for more details, check the changelog
> in each patch.
> 
> Regards,
> 
> Boris
> 
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/issues/48
> [2]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/tree/panthor-sched?ref_type=heads
> 
> Boris Brezillon (8):
>   drm/panthor: Simplify group idleness tracking
>   drm/panthor: Don't try to enable extract events
>   drm/panthor: Fix the full_tick check
>   drm/panthor: Fix the group priority rotation logic
>   drm/panthor: Fix immediate ticking on a disabled tick
>   drm/panthor: Fix the logic that decides when to stop ticking
>   drm/panthor: Make sure we resume the tick when new jobs are submitted
>   drm/panthor: Kill panthor_sched_immediate_tick()

Queued to drm-misc-next

> 
>  drivers/gpu/drm/panthor/panthor_sched.c | 203 ++++++++++++------------
>  1 file changed, 100 insertions(+), 103 deletions(-)
> 

