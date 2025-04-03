Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A47A79BA4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 08:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E47910E1E6;
	Thu,  3 Apr 2025 06:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H2FrmBML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115110E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743660005;
 bh=N4qJ8F58Pmv26ISrZ+OWnRoYbvHDgb6+p53DZug+Pdo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=H2FrmBMLrGb1XRd/bA0m1i7q5ilHh4zipP3wNfi0Cx13CRqaL8XzeoU6de81rJinB
 N+BSZf/ajXaWcNwsPgkH1T7NHY3RayBUjlmaI6QOiKBKgdBVBtrugN4YqY4qxXsO1E
 mJEIOYRM+sGVG4NBOQKUfb2xvFdTzH6CsGoTopjipepRqdm4EOApTFVxSwVdrkiZ5Z
 ak8JlVRqA4Q4rOrwUHyPwwFv/l3x7aIbNwwESJtndRsZug3dWUcdmcgg6IHmEL4VHe
 s4NAzPycXLTj7Zx63GyTULHdZAdKfIXJINP79jBgvhIKkKEbDEy0z+gqLC6icycG5l
 7cX419TVeTsTw==
Received: from [192.168.50.250] (unknown [171.76.83.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EAD3417E0F47;
 Thu,  3 Apr 2025 08:00:02 +0200 (CEST)
Message-ID: <4cac94b9-2445-458c-a39f-5eb72537d6f6@collabora.com>
Date: Thu, 3 Apr 2025 11:29:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
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
 <20250328110239.993685-4-vignesh.raman@collabora.com>
 <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
 <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
Content-Language: en-US
In-Reply-To: <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
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

On 28/03/25 17:29, Vignesh Raman wrote:
> Hi Daniel,
> 
> On 28/03/25 17:06, Daniel Stone wrote:
>> Hi Vignesh,
>>
>> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman 
>> <vignesh.raman@collabora.com> wrote:
>>> The current s3cp implementation does not work anymore after the
>>> migration, and instead of fixing it and propagating the fix down to us,
>>> it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
>>> changes. Also replace broken s3cp command with a curl wrapper call in
>>> drm-ci.
>>
>> Thanks a lot for fixing this. Sorry the fallout has been so bad.
>>
>> You can also upgrade ci-templates to get an s3cp which works again.
> 
> Thanks for fixing this. Will use the latest ci-templates and test it.

We need to update mesa to use the latest ci-templates and then uprev 
mesa in drm-ci. I will send this in a separate series after fixing it in 
mesa.

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

