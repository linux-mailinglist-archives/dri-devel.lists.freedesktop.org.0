Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFDA5B957
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 07:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B1D10E0C5;
	Tue, 11 Mar 2025 06:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="alMQCAXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C2910E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741675322;
 bh=LMpwWjErgNSrltM818IfpyXUndu5mDihR9dssRKnOU0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=alMQCAXr85OXh/piMTCKAETgxh1II08hPYLZQSQyFd15wv575ruFteU7vXq9OEFG/
 qixNy2jvaxhBrOvU3yVUFVf5jts+4UVFvnueWw17FDzR42oP/12EXDMQQhypE/s6qi
 XDahUvxmgcTP9cRVDSvMi6n38fqj6ez/7U1VAxW9AmuPnZ966svBPD5RPwG4PdpP6e
 gHo3wz+7ezNPoqBjsoEHe8L923PVbLYn6k2TL5/Wa5+KLtKnY6K16rd1Outx0ceyCQ
 CbNQFCzVFm7YAqQWIEueaRbgrvaTDqNsXGIKNtgj6dZJkzUYE8o4oPIgtHgqHexyax
 JwvtySpmfbJ1w==
Received: from [10.20.66.114] (unknown [103.163.65.90])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A4B1C17E05A6;
 Tue, 11 Mar 2025 07:41:59 +0100 (CET)
Message-ID: <ad38518b-e335-4006-a04c-e15a6ef21694@collabora.com>
Date: Tue, 11 Mar 2025 12:11:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ci: use shallow clone to avoid timeouts
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
References: <20250228151217.563807-1-vignesh.raman@collabora.com>
 <CAPj87rOT36e3TwZwk8uGUNpSz0kGB_XUY2gbCvGYYy2Xguqv5A@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rOT36e3TwZwk8uGUNpSz0kGB_XUY2gbCvGYYy2Xguqv5A@mail.gmail.com>
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

On 10/03/25 13:55, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 28 Feb 2025 at 15:12, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> The python-artifacts job has a timeout of 10 minutes, which causes
>> build failures as it was unable to clone the repository within the
>> specified limits. Set GIT_DEPTH to 50 to speed up cloning and avoid
>> build failures due to timeouts when fetching the full repository.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Set GIT_DEPTH to 50 to allow the check-patch job to pass
> 
> This sounds a bit fragile to me. Perhaps we need to make the
> check-patch job instead specifically detect that it is missing history
> and unshallow the history a bit more?

Yes, we could do that. The check-patch job timeout is 1h (from gitlab 
project settings) and we can unshallow git history. I will send a
v3 after testing.

Regards,
Vignesh

> 
> Cheers,
> Daniel

