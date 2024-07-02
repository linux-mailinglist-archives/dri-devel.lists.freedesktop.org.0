Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554E6924209
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66BA10E62C;
	Tue,  2 Jul 2024 15:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eyfKXQkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5610E627
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719933189;
 bh=H3XuUpIjH3srGCMEz1VvFMme322VBsLgb1DtziZaRqM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eyfKXQkHJNWE2YNugR8ORrMwk0guuSlGD6bgpQyz/ilzFaaW90ztILhhDJFV5O0Cl
 RWmnA+eP5Z97jUnZ3GintLPQs8tpONTmC1OD8ZfYrU0navMqrk05qUNUI5zv4p4jzw
 sd2yN0nfEwWTDP+RIoROr0sILqH3gYnxUaRL2WuIJ1dxw3DahYgt/74ILEFdKQzef1
 g0SAsRCkRBWdaCfFKBTrIE/YB+YLQ+87Nt+IKBN/dGoXKLobYfsZSTI1LrX+qcUuxh
 dXGeMh9rnrp8nndnxhM5NEpf5kuKPkRxKEqZlv5yQnDWfF8r8OquFaIWaFhxirFruW
 nLaZISL/5R6xw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06F0A37800DE;
 Tue,  2 Jul 2024 15:13:08 +0000 (UTC)
Date: Tue, 2 Jul 2024 17:13:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 2/2] drm/panthor: Fix sync-only jobs
Message-ID: <20240702171307.231fcdd8@collabora.com>
In-Reply-To: <20240628145536.778349-3-boris.brezillon@collabora.com>
References: <20240628145536.778349-1-boris.brezillon@collabora.com>
 <20240628145536.778349-3-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Fri, 28 Jun 2024 16:55:36 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> -	/* Stream size is zero, nothing to do => return a NULL fence and let
> -	 * drm_sched signal the parent.
> +	/* Stream size is zero, nothing to do except making sure all previously
> +	 * submitted jobs are done before we signal the
> +	 * drm_sched_job::s_fence::finished fence.
>  	 */
> -	if (!job->call_info.size)
> -		return NULL;
> +	if (!job->call_info.size) {
> +		job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
> +		return job->done_fence;

Should be

		return dma_fence_get(job->done_fence);

to keep the get/put balanced.

> +	}
>  
