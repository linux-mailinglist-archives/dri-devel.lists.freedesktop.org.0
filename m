Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E44ADBDC8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 01:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623BA10E0CD;
	Mon, 16 Jun 2025 23:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cI3WvnD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0B610E0CD;
 Mon, 16 Jun 2025 23:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cYPali9Z06YXin6FSjGP5LRy/avPvcnSOeBxc3Dr9cc=; b=cI3WvnD2svtpE2syHl/YGJisfh
 Evo4gLYURrZjrIumweAJZh4DKexjKYxC9Ojv0IyGURXhIp/FiXN+WJDoAXkWuNiC2aIsXk6jWm1SR
 Q/E2zBIg9u7GQHd8iGT+J4qFHOCdCyueHEqNVzT/VRFveqXPWOEG7FrH8iAfmP/Fx5F32nubMEIJq
 Y9N/hYqHFg8wNXvOYTJA/EKvzywOWwx/Qwf9TQuFCzxwL5vZ9u2fXCB4ySpzik3//82/ye8uQoDvz
 DpKvnIVvWclc8/6z0JOGnhIuWvkQjRIlf0qmtdy2IbTmckKxKLKXqelA6K4VCSWcao6xggJWUdnE5
 xM8Uq4ag==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRJSS-004Kz1-Q9; Tue, 17 Jun 2025 01:41:45 +0200
Message-ID: <7f2eac8e-f4c5-497d-b9d4-b9f12a1cf7a7@igalia.com>
Date: Mon, 16 Jun 2025 20:41:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/etnaviv: Protect the scheduler's pending list with
 its lock
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <cgmeiner@igalia.com>, Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 kernel-dev@igalia.com, stable@vger.kernel.org
References: <20250602132240.93314-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250602132240.93314-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 02/06/25 10:22, Maíra Canal wrote:
> Commit 704d3d60fec4 ("drm/etnaviv: don't block scheduler when GPU is still
> active") ensured that active jobs are returned to the pending list when
> extending the timeout. However, it didn't use the pending list's lock to
> manipulate the list, which causes a race condition as the scheduler's
> workqueues are running.
> 
> Hold the lock while manipulating the scheduler's pending list to prevent
> a race.
> 
> Cc: stable@vger.kernel.org
> Fixes: 704d3d60fec4 ("drm/etnaviv: don't block scheduler when GPU is still active")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---

The patch was applied to misc/kernel.git (drm-misc-fixes) with Philipp's
suggestions.

Thanks for the review!

Best Regards,
- Maíra

>   

