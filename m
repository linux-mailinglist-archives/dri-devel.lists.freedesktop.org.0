Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30DBA79BB1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 08:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8896510E90B;
	Thu,  3 Apr 2025 06:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KWoFBuzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FFF10E203
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743660153;
 bh=icMjSlKatgQx/TbsI4RIJckayqYv3CovYnZn2GdTQDQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=KWoFBuzKhUO2rIVo/tQbcH+RflY2dP9IgW9yhlHe3qg7S9OPrnU6c1fv5LE5HT1Pn
 SWN8aPuycGyRZA+S2P+f4ohIx8nwVqTFFFHjm0HwbRmSiDrrr9xymiZk0dUzYMcv3u
 knb7SGHinimZJoHcRwoVGwDE/59GGnA/jXGtrp/OowmflEUy6rsJRTxlPpJ0TsvLtJ
 1r6OGIOzRcxY+5SN9OQaDJ+EkS6Vh6LJ9N54f+BkAtLjeW9G+OT03AZWGjzEugZIIh
 cJr1BH5cYpvloYjT6Qt6RRQQyDnkuCWn9Sxt45KK7QA6sY5ZgL+K74dqqrA2W1vFU7
 faGDcQipGjLkQ==
Received: from [192.168.50.250] (unknown [171.76.83.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E84117E0B0B;
 Thu,  3 Apr 2025 08:02:30 +0200 (CEST)
Message-ID: <544e78ca-4288-4d3f-97ce-0f8bda68bb19@collabora.com>
Date: Thu, 3 Apr 2025 11:32:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/ci: check-patch: unshallow repository before
 fetching
From: Vignesh Raman <vignesh.raman@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
 <20250328110239.993685-3-vignesh.raman@collabora.com>
 <CAPj87rNLqMxBgKGTSHMHT39agzu=GY-Dgk6Zma1oM1ztkTch3Q@mail.gmail.com>
 <6da17cd3-77f2-4bf4-86b8-296c2f295960@collabora.com>
Content-Language: en-US
In-Reply-To: <6da17cd3-77f2-4bf4-86b8-296c2f295960@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Daniel,

On 28/03/25 17:40, Vignesh Raman wrote:
> Hi Daniel,
> 
> On 28/03/25 17:05, Daniel Stone wrote:
>> Hi Vignesh,
>>
>> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman 
>> <vignesh.raman@collabora.com> wrote:
>>> Ensure the repository is not shallow before fetching branches in
>>> check-patch job. This prevents issues where git merge-base fails
>>> due to incomplete history. Set the timeout of check-patch job to 1h.
>>
>> Ouch - an hour is pretty brutal. Is there a way to unshallow only back
>> to the merge base?
> 
> I set it to 1h, but the job is completed in ~15min for
> https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/18 
> which has 486 commits.
> 
> I will check if we can unshallow only up to the merge base.

I tried this and still checkpatch failed. Below is the sequence.

- GitLab starts with a shallow fetch (depth=10).
- Script fetches full commit history (--unshallow --filter=blob:none). 
We need this to calculate the merge-base commit.
- Calculates how much history to fetch using the merge-base commit.
- Refetch with depth (--depth=N) until the merge-base commit
- checkpatch.pl fails because the earlier blobless fetch (--unshallow 
--filter=blob:none) skipped file contents.

Please see the commit and pipeline,
https://gitlab.freedesktop.org/vigneshraman/linux/-/commit/40a3fc31c2405f90f3fc3177a575a66a10b33324
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/73884148

Looks like the reliable solution is to fully unshallow the repository 
(without any --filter) and set a 30m timeout? Would this be acceptable?

Regards,
Vignesh

> 
> Regards,
> Vignesh
> 
>>
>> Cheers,
>> Daniel
> 

