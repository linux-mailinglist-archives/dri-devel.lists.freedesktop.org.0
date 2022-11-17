Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B12262DF56
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3EC10E626;
	Thu, 17 Nov 2022 15:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0890810E627;
 Thu, 17 Nov 2022 15:11:49 +0000 (UTC)
Received: from [192.168.2.32] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 649B96602AA5;
 Thu, 17 Nov 2022 15:11:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668697907;
 bh=wn7Cy/ZPgoMUXLEJ3MBjrTC/FWisYchJvN8Zlkkx/q8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=UrHRMvoLGMClM5GSD8MdmpFQScwEEstNHrK0qA5NTLWvhhP05AheU9H8pzInFs6V+
 Pu7/oasHF1j7xTEJz3KUkcMp93WHfn1N4bLDKgkHvvD9zlnfjEVfBTx8et1MVhCSjN
 6OznL7KDQHTBpDo1NOTH+/3pkJ9ousPrLkTmaqfuKtyfJ0HC9DW2Z1piBm+MQ6swa8
 Eblr7elzXlr4kPxoKKeEq4gXL1/V6KuhQcdo/HQXHM7XvVJvTUzgUGoX8lsXh1Js++
 Q0iwnIVlP17Zml15bpVLfuEpT4P3+n+XgmhPAS0idIncq56z/QLcn65BdRakG2xLXc
 +AVQRAU7wFp2Q==
Message-ID: <647e876a-9710-c6bd-9cf3-a513d879c36a@collabora.com>
Date: Thu, 17 Nov 2022 18:11:44 +0300
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
 <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
 <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
 <74d74689-9c8e-1691-a232-c18271974f37@collabora.com>
 <126a8c1e-69ec-5068-1aad-30f5e7c3ef21@collabora.com>
 <4f5766ab-d31f-d0c8-6b1e-0c7e0fbabfed@amd.com>
 <50308598-324f-f628-a4f1-55da3935a2f5@collabora.com>
 <067ffcf2-5d46-fd37-3df8-0de1714573e4@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <067ffcf2-5d46-fd37-3df8-0de1714573e4@amd.com>
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

On 11/17/22 18:09, Christian König wrote:
> Am 17.11.22 um 15:41 schrieb Dmitry Osipenko:
>> [SNIP]
>>> drm_sched_entity_flush() should be called from the flush callback from
>>> the file_operations structure of panfrost. See amdgpu_flush() and
>>> amdgpu_ctx_mgr_entity_flush(). This makes sure that we wait for all
>>> entities of the process/file descriptor to be flushed out.
>>>
>>> drm_sched_entity_fini() must be called before you free the memory the
>>> entity structure or otherwise we would run into an use after free.
>> Right, drm_sched_entity_destroy() invokes these two functions and
>> Panfrost uses drm_sched_entity_destroy().
> 
> Than I have no idea what's going wrong here.
> 
> The scheduler should trivially finish with the entity and call
> complete(&entity->entity_idle) in it's main loop. No idea why this
> doesn't happen. Can you investigate?

I'll take a closer look. Hoped you may have a quick idea of what's wrong :)

-- 
Best regards,
Dmitry

