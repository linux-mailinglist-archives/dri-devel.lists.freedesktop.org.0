Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F759FAD91
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 12:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D04110E506;
	Mon, 23 Dec 2024 11:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="L5ozqVaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082EA10E503
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oDGmSgizuPKwI7yZkDWsyWUMRj5lWKPdpTKBmVxaK2w=; b=L5ozqVaSBWOOXpRpDl7pqC+inA
 1FCQ6vDWP49uUjJDLAnE+Vr1e6p67AcXC7qLGgSVUGyvCkBBgiKdaW9BG19NLqo8LR+I5Z6pjUIM4
 pIgxKMfW4ICMadJwejYQWvKUrRCf2HhWhkq8+gX2n0/pBataM73s3Q9RMVv8jsNv9BuWrzvh58Jnp
 y96tUXRYwboYOnD5sSM1Dvc0s4lBiZDzM3C9gUV85YM1o6Lkg/0Rbqli+/jqcfMrNEAEiUkWJHwbv
 u6GIvR4GqdxsdPj5InzwcPKtreJ8uHCLs47sozXXcWKcMiZjC6sqCePKIm0GpZ1phQPGUiISSU/08
 R/jIYciQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tPgOq-006oh1-IF; Mon, 23 Dec 2024 12:15:00 +0100
Message-ID: <6558d88f-a26d-4dd0-82fa-a8846541dec7@igalia.com>
Date: Mon, 23 Dec 2024 11:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fixes etc for fence merging
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20241115102153.1980-1-tursulin@igalia.com>
 <f4991abc-3840-44ad-a65c-cd9120613fa8@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f4991abc-3840-44ad-a65c-cd9120613fa8@amd.com>
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


On 18/11/2024 09:47, Christian König wrote:
> Am 15.11.24 um 11:21 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Consolidated series as an simpler alternative to
>> https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/.
>>
>> Hopefully fixes https://gitlab.freedesktop.org/drm/amd/-/issues/3617.
>>
>> First two patches are fixes followed by one optimisation and then 
>> Christian's
>> and my selftest additions.
>>
>> Cover letter now because it grew to five patches.
>>
>> Please test and/or suggest more test cases to look at.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Friedrich Vock <friedrich.vock@gmx.de
> 
> Reviewed-by: Christian König <christian.koenig@amd.com> for the entire 
> series.
> 
> I've already pushed the first two patch to drm-misc-fixes on Friday, 
> going to request a backmerge as soon as those land upstream so that we 
> can push drm-misc-next as well.

Looks like drm-misc-next is ready to take this.

Regards,

Tvrtko

