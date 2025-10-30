Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74636C226EB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 22:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEDB10E925;
	Thu, 30 Oct 2025 21:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="bqNpWbpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E6610E925
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 21:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761860247; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LjVHmafdRwVBe9z6FzEinXkfLu1D73LyXian3iuL/uYVISAa5T7g0OY3/ePo2gk4KBGyZ7S7rvUa3LDSVIScYjyJwc1WXt98VdS1OPso1VmRCTAfarifKOcs1pFQz6hSpJk5/BGV2om0gYbMAddMCBvmVXi+mLLDsO3D3XSX1HA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761860247;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CdZBDO6JYIfbAQNwqVTPSvf/I821Xz7xHwy5RikpbI4=; 
 b=ZxGdWKQjlX/k79E67FUHs+vcUuZvGd0Um1R5TdZAfd5ZblNDR6GcIvjJdLuFfuATCjoghqXriNtKtlrt1920x9xQbo9fujAGeStIT5hmTli7uBWxd9HI1WgZ9AUR/VdL7PQ3fbRs1ywuE/5xYo7FO80/c2cu6gnTRAYXv0XHH2k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761860247; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=CdZBDO6JYIfbAQNwqVTPSvf/I821Xz7xHwy5RikpbI4=;
 b=bqNpWbpb9tOgbXp2DFFLuUPNFso8v5zQJuTVxrEmEvYJMIgbJl9qx5TOWHhK8CId
 CoWoDhDC1cClhGu8D01bVi5nwWTkkIEj1mvOcHwV8CTZBLDaJrEM+vvg5QQjr/yCneW
 vw3nnyAyck1bVb3rP7Au0k8Fmw5+N7gGiB4jt2Jw=
Received: by mx.zohomail.com with SMTPS id 1761860244527714.2771251486547;
 Thu, 30 Oct 2025 14:37:24 -0700 (PDT)
Date: Thu, 30 Oct 2025 21:37:19 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 2/2] drm/panthor: Fix group_free_queue() for partially
 initialized queues
Message-ID: <wkbs6o36jz5xkm76zvl63dvaeyau6btn6phkvjsebvdfyv4kyb@5qttvlmry7sq>
References: <20251030083446.162990-1-boris.brezillon@collabora.com>
 <20251030083446.162990-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251030083446.162990-2-boris.brezillon@collabora.com>
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

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 30.10.2025 09:34, Boris Brezillon wrote:
> group_free_queue() can be called on a partially initialized queue
> object if something fails group_create_queue(). Make sure we don't
> call drm_sched_entity_destroy() on a entity that hasn't been
> initialized.
>
> Fixes: 7d9c3442b02a ("drm/panthor: Defer scheduler entitiy destruction to queue release")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index a0a31aa6c6bc..552542f70cab 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -886,7 +886,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
>  	if (IS_ERR_OR_NULL(queue))
>  		return;
>
> -	drm_sched_entity_destroy(&queue->entity);
> +	if (queue->entity.fence_context)
> +		drm_sched_entity_destroy(&queue->entity);
>
>  	if (queue->scheduler.ops)
>  		drm_sched_fini(&queue->scheduler);
> --
> 2.51.0

Adrian Larumbe
