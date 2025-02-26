Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5713A46323
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 15:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7686010E921;
	Wed, 26 Feb 2025 14:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UpbP2YnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E896310E921
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740580737;
 bh=cxrFdW4W85TSfqEHazRjLD5P2RVkDFfnhP3bByA5Yco=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UpbP2YnN4u9ZxxJ4JNUzmdfSdhWRQUneuZsTj67QMAO9aHYf0izJerK/SL9RksNVq
 7hK4s0u3YSbdQt3XJjTmAgX7gfJ3cqSn/dApX11W0LNLblHQfZAXJGUpopBExdPfNj
 +sFM55Zr7ygAvKZ8tjPi9mZE8zXLBzzsgaZiwweXUOhO9FFheOm/vVZyzUcegZfKZb
 1gj7A5yVx4kcUzYSk43V4LordayaHQvJlLuYId/4Wu1vYrzDbLjdvgwzCvM2lXraOU
 gK9isRHiztJzH3N4bxVSjfO1VMoxMc2Pydy7ZroCqcCrUhNguT7OxlIvnO0SXOFQVC
 UCsj3469WG51Q==
Received: from [192.168.50.250] (unknown [171.76.83.32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 62FD917E065A;
 Wed, 26 Feb 2025 15:38:53 +0100 (CET)
Message-ID: <84bd530c-4fb9-4913-8ee1-78a6a4f46625@collabora.com>
Date: Wed, 26 Feb 2025 20:08:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/ci: fix merge request rules
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
References: <20250226135415.363605-1-vignesh.raman@collabora.com>
 <CAPj87rNAaPUEmk1edcuHX1+bMWysF=aOMceUsCxnk2SMJUjqKg@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rNAaPUEmk1edcuHX1+bMWysF=aOMceUsCxnk2SMJUjqKg@mail.gmail.com>
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

On 26/02/25 19:29, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Wed, 26 Feb 2025 at 13:55, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> Merge request pipelines were only created when changes
>> were made to drivers/gpu/drm/ci/, causing MRs that didn't
>> touch this path to break. Fix MR pipeline rules to trigger
>> jobs for all changes.
> 
> Thanks a lot for fixing this up!
> 
>>       # Build everything after someone bypassed the CI
>>       - if: *is-direct-push
>>         when: on_success
> 
> Should these be when: manual? I think it would be good to align with
> the rules we have for Mesa: run automatically for marge-bot and also
> for scheduled pipelines, but in all other cases (MR context but not
> scheduled for merge, direct push to ref, etc) be manual, so we don't
> overwhelm the CI by testing everything everyone pushed.

mesa has on_success for is-direct-push. Should we change it to manual 
here and update the same in mesa ?

If a user creates a MR, should the jobs run automatically, since we do 
not use marge-bot to merge MRs in drm?

I also noticed we need to remove reference to mesa 
(CI_PROJECT_NAMESPACE). I will send v2 with this change.

Regards,
Vignesh

> 
> Cheers,
> Daniel

