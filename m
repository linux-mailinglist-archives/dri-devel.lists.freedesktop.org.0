Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9962DBE6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB7310E5EF;
	Thu, 17 Nov 2022 12:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C46B10E5EF;
 Thu, 17 Nov 2022 12:47:23 +0000 (UTC)
Received: from [192.168.2.32] (unknown [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BE376602A9E;
 Thu, 17 Nov 2022 12:47:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668689241;
 bh=3wyXzRlRy1/3TNhJkqZfppwj3JrRv/LtqUfTrgrbCzY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=PsMiVoSBonS/xaLNYxayI9sePwV8+1eiqlOScbaaE8g525M9PAg0oPMvxhXMqJ1uZ
 EFOpxvZriz1ojske4J/ljkryK10QNpp8VHki7s0tSIzUyCbf+f5rFs81Alr9c3AHT0
 SKmW+4MlbnlIKe/5IEIvY61x+Npaf6gZeD1QRakh/Ufmv8gjAtYsIEcdKbpK0BsTbH
 viy2Qi3BhwHtzYHw9KkhtJswWotFgWxCkDmIg0Cv9k/0XLhlA7I3PHiaJ0ywBU8aow
 ldsQy9cM+zHuXh+D8fLCi3nJq2/xkQEQ211ScXbMR5iUutToPFioQKCgl7K2nzJxhh
 Sybaqix36h+bA==
Message-ID: <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
Date: Thu, 17 Nov 2022 15:47:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
 <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/17/22 12:53, Christian König wrote:
> Am 17.11.22 um 03:36 schrieb Dmitry Osipenko:
>> Hi,
>>
>> On 10/14/22 11:46, Christian König wrote:
>>> +/* Remove the entity from the scheduler and kill all pending jobs */
>>> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>> +{
>>> +    struct drm_sched_job *job;
>>> +    struct dma_fence *prev;
>>> +
>>> +    if (!entity->rq)
>>> +        return;
>>> +
>>> +    spin_lock(&entity->rq_lock);
>>> +    entity->stopped = true;
>>> +    drm_sched_rq_remove_entity(entity->rq, entity);
>>> +    spin_unlock(&entity->rq_lock);
>>> +
>>> +    /* Make sure this entity is not used by the scheduler at the
>>> moment */
>>> +    wait_for_completion(&entity->entity_idle);
>> I'm always hitting lockup here using Panfrost driver on terminating
>> Xorg. Revering this patch helps. Any ideas how to fix it?
>>
> 
> Well is the entity idle or are there some unsubmitted jobs left?

Do you mean unsubmitted to h/w? IIUC, there are unsubmitted jobs left.

I see that there are 5-6 incomplete (in-flight) jobs when
panfrost_job_close() is invoked.

There are 1-2 jobs that are constantly scheduled and finished once in a
few seconds after the lockup happens.

-- 
Best regards,
Dmitry

