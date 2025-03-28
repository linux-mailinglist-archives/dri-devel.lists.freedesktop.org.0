Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1AA74992
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB85810E9F4;
	Fri, 28 Mar 2025 11:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Z2dNgciH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D080110E9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743163163;
 bh=vZJn55+ZfOVZmFgcx7qwYLpNHR0tMjnfEKG/5AjOixE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z2dNgciHpMCanKupwiKz6DEYXVioWAJH9bA0Q6PyHNA2ed5dYqJJTCyGQg5aumT/E
 E6lZI0FevCuRvrYnIsEphlYCG2eq1yXQlKpmo4j5VN6YGYHDQKRi2BMDEUsQ/x7Tp/
 E6eABZAnk9zptc+aK6GJEyjkhRQiZWgTC0PRsUdT/ZaHtwcWk0wn3uYBLDzZs5DhVN
 6u2dnauTuqXLWMeYTu3yBJjpQssKTiGaJfHQsXwsm9uAnoe1jUWeSb/PaH32Ef0tPs
 kh6G3EIfJF4tD7wgkxzBR8Uqhxc1R8zCLMRew/k4cvl8RaF/m6vbwTpjCEYCO/+Kre
 JmD6EdW6Ykyrg==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BCFA517E0C8C;
 Fri, 28 Mar 2025 12:59:20 +0100 (CET)
Message-ID: <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
Date: Fri, 28 Mar 2025 17:29:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
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
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
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

On 28/03/25 17:06, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> The current s3cp implementation does not work anymore after the
>> migration, and instead of fixing it and propagating the fix down to us,
>> it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
>> changes. Also replace broken s3cp command with a curl wrapper call in
>> drm-ci.
> 
> Thanks a lot for fixing this. Sorry the fallout has been so bad.
> 
> You can also upgrade ci-templates to get an s3cp which works again.

Thanks for fixing this. Will use the latest ci-templates and test it.

Regards,
Vignesh

> 
> Cheers,
> Daniel

