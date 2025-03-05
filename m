Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BE3A4FD97
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 12:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A619910E05C;
	Wed,  5 Mar 2025 11:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="QPYmHm4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369C910E0B6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 11:27:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741174020; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CGgNB9ioCrBhZoIu/54P4IE8VnMh233mFWObUx4IRiSRYQN0kgpLfN/b1j6tf5xb9Qvawe5SYEsGSK1SKsCH+dJbVCYse5EBI+9PFV7Rmc0b36jSY3crmcWENqDPN/6t7PReK6l5xQ+TsIlEZAEIJAYGp006r/VmxtROQH9FOZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741174020;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NzN883oKEAj7l0UzhDNc+FFNuxWeXDfWS3FNs5UvJiU=; 
 b=KkVW8eJlC1hVbD11lN1H56RQJHKk6lUI912ctlOYikwCfPSGLEc07HcNeJxn7AAdEZmZ5nhmYrx9qqHxOhBwSmmnQ4ECRwwSgoxZsLadBzP+9iQJ5cj6h719LPU4dPnnY7ua33GJYX/yGb/i/OF/92tiedgKjG3ea7e7CkQy86E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741174019; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NzN883oKEAj7l0UzhDNc+FFNuxWeXDfWS3FNs5UvJiU=;
 b=QPYmHm4szIi7SlH9hSsNQbOfL5iaoAIjlaI4j/ShskiVl0RYg2oj2q+fLX7EyQBx
 djPTZWjB0QSPFT6ygEduHEVCS65V1dZkkAL0ipOv2v+S+NaDvJ4lQD+8EXil1bG9flW
 Z2CPVo0wGKJvUVQ5aKbtzC5q4r+fms/tl/5Nchk4=
Received: by mx.zohomail.com with SMTPS id 1741174017652344.167196887577;
 Wed, 5 Mar 2025 03:26:57 -0800 (PST)
Message-ID: <f164cb3a-5285-46e9-9ba1-062cfcb2f920@collabora.com>
Date: Wed, 5 Mar 2025 14:26:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
 <d1f856c7-47dd-4f1d-a124-973064dcd1f0@suse.de>
 <6b7d95b7-a9dd-43c9-b1db-8a636b85ad51@collabora.com>
 <d777ab50-51cf-4eed-bfec-a44eca7ba3c5@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <d777ab50-51cf-4eed-bfec-a44eca7ba3c5@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 3/4/25 14:43, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.03.25 um 11:59 schrieb Dmitry Osipenko:
>> On 3/4/25 13:29, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 05.01.24 um 19:46 schrieb Dmitry Osipenko:
>>>> Introduce common drm-shmem shrinker for DRM drivers.
>>> What's the status of this patch?
>> It was de-prioritized on my list a year ago as I had to move to a higher
>> priority problems. Rebasing and re-testing these patches takes much
>> time, it either has to be split up in a smaller parts or applied in
>> one go.
> 
> The first 11 patches seem uncontroversial to me; maybe except for patch
> 9. Could they be merged any time soon?
> 
> The next batch could then be patches up to #20, which seem to be
> reviewed as well.
> 
>>
>> The current status is that I started to work on v20 rather long time ago
>> and the patches need to be rebased and re-tested again. Heard that
>> Panthor driver may want shmem shrinker more than others today.
> 
> I've been receiving reports about low performance of ast plus gem-shmem
> recently. I suspect that the vmap/vunmap overhead could be related and
> this series would likely lessen the problem.

Alright, will refresh the patches. See if the first ones sill can be
merged right away and then split the remainder into batches.

-- 
Best regards,
Dmitry
