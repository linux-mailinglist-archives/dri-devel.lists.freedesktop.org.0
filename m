Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71C6687F3E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 14:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5483210E53B;
	Thu,  2 Feb 2023 13:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C9B10E547;
 Thu,  2 Feb 2023 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXpzmruPJuxuKfJIUxtaxEro6zDhEhQMkNFpKZiY9Ns=; b=c6HnW+TP4Au7gG15/qw2uiW+bq
 WfnXpGBOW8xHbTftTf51ui6M28XlUjkbNCRvK2PJS37t2kF/K/AY54grne0LveCSf9GvmwraQfBTw
 1tEGCaHG9rJmqG5MmCINU50oYQpt/q5n4F6MAUX8vw6CLS3YtTOTXiZLc8TqU2/1Tmmcj2ydr03+N
 WfALDBAW0W9hPcfEU3/CUFMTQSH3W8jH1FTqlms54BFeYpfTxBdigNvuAUucXuaWLtp2VU3QjSgWE
 SWe9VlK1PO31cOCdcP218GvmRPBI+3M/N0ZLodZrY2si7LA7AS1FFo/w/2oWBSTHD/K6Uua/4lEKP
 rEBBbAVg==;
Received: from [187.10.60.187] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pNa0X-007Ngy-3L; Thu, 02 Feb 2023 14:52:09 +0100
Message-ID: <9f35c852-18c4-2f3f-d03b-ff76def8516a@igalia.com>
Date: Thu, 2 Feb 2023 10:52:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/amdgpu/fence: Fix oops due to non-matching
 drm_sched init/fini
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Luben Tuikov <luben.tuikov@amd.com>
References: <20230201164814.1353383-1-gpiccoli@igalia.com>
 <cd0e2994-f85f-d837-609f-7056d5fb7231@amd.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <cd0e2994-f85f-d837-609f-7056d5fb7231@amd.com>
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
Cc: kernel@gpiccoli.net, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/02/2023 08:58, Christian König wrote:
> [...]
>> +		if (!ring->no_scheduler && ring->sched.ops)
>>   			drm_sched_fini(&ring->sched);
> 
> I think we should drop the check for no_scheduler here and just call 
> drm_sched_fini() when the scheduler instance was initialized before.
> 
> Background is that I've found a couple of places where we potentially 
> set no_scheduler to false after the scheduler was already initialized.
> 
> This is then probably leading to a memory leak or worth.
> 
> Regards,
> Christian.

Thanks Christian, nice finding! And thanks for the reviews Guchun / Luben =)

I just submitted a V3 [0], but didn't add the review tags from Guchun /
Luben, since the patch changed.

Cheers,


Guilherme


[0]
https://lore.kernel.org/dri-devel/20230202134856.1382169-1-gpiccoli@igalia.com/
