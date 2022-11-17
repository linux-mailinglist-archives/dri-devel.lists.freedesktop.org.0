Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34462D127
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 03:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4D210E51F;
	Thu, 17 Nov 2022 02:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCBC10E51F;
 Thu, 17 Nov 2022 02:36:15 +0000 (UTC)
Received: from [192.168.2.32] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A7A186602A8D;
 Thu, 17 Nov 2022 02:36:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668652574;
 bh=xlxWMY9Ow7FWVTi6P2iIGQIUHX3xYSurhdme3Nnjp5E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fiU28g5lp40tyoZxyZnpBQQI1pm3/vjBekqkTSqogEWqgOjO6soylncErBnh95R8X
 eZPq1xF1S1d3+B7ReEV5DAX/IAi7zE8qzJ8oGP62TXUr6y1OgTcVB46jqXnL95cKfJ
 +gWKMA9KjMYk3krhFH0geoL9M1+PNYmLez+d8Oqaqyv6vWAB5KnSw0x+erWoLI9WKB
 DrAY6hc9P72NrPFz8OnPW7pLl7+oFeyL66w2REaILNQjLILajW5YJEibVZZG66P+Jw
 /trpIfRWPpxShplkNtmylA3hi2IXgARaTq5b04hBmw/lTEYKSlxasITFQNC8SPvtMm
 2u7tN4DSYNA0w==
Message-ID: <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
Date: Thu, 17 Nov 2022 05:36:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20221014084641.128280-13-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/14/22 11:46, Christian König wrote:
> +/* Remove the entity from the scheduler and kill all pending jobs */
> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_job *job;
> +	struct dma_fence *prev;
> +
> +	if (!entity->rq)
> +		return;
> +
> +	spin_lock(&entity->rq_lock);
> +	entity->stopped = true;
> +	drm_sched_rq_remove_entity(entity->rq, entity);
> +	spin_unlock(&entity->rq_lock);
> +
> +	/* Make sure this entity is not used by the scheduler at the moment */
> +	wait_for_completion(&entity->entity_idle);

I'm always hitting lockup here using Panfrost driver on terminating
Xorg. Revering this patch helps. Any ideas how to fix it?

-- 
Best regards,
Dmitry

