Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FD5A7499B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 13:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DC810E9F7;
	Fri, 28 Mar 2025 12:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="g8GQpK1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BCE10E9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743163835;
 bh=YsEgAqwxWCjkg5XyBi0RW8U5VcBymAfTASedAi4c+W8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g8GQpK1YldVwr/ptBxWOcAiIdLv2O2JM1ZpXcDV3iGsw71MTzb9xjP5G8cWTauNLW
 3zAFefKULI3dbZRfbtxOQPKdaUNtIUYrob7N8QIAiFJ8SZaMJLSxk+ANLPg/cEI3oe
 txsNJIuagc0INGGg6TwOX3kilU0O/QtG4fXPsGdAP/FGVFUtSbAsLZBzzlmHwgy4SZ
 IgGuyoImiH5zywrfRy3po4VzrKACH7Sle59ksl7vnsmrXEMUrJJIlQphVFcXXs5pKE
 owXWiD45f/xdycsL53XwIbpsh/YrjYROllLJSvYLNl5YrxI7zhI+57MqdbqnWJCH8k
 oZ4ONsleMaXQQ==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 14FB517E0B9D;
 Fri, 28 Mar 2025 13:10:31 +0100 (CET)
Message-ID: <6da17cd3-77f2-4bf4-86b8-296c2f295960@collabora.com>
Date: Fri, 28 Mar 2025 17:40:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/ci: check-patch: unshallow repository before
 fetching
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
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rNLqMxBgKGTSHMHT39agzu=GY-Dgk6Zma1oM1ztkTch3Q@mail.gmail.com>
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

On 28/03/25 17:05, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 28 Mar 2025 at 11:03, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> Ensure the repository is not shallow before fetching branches in
>> check-patch job. This prevents issues where git merge-base fails
>> due to incomplete history. Set the timeout of check-patch job to 1h.
> 
> Ouch - an hour is pretty brutal. Is there a way to unshallow only back
> to the merge base?

I set it to 1h, but the job is completed in ~15min for
https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/18 
which has 486 commits.

I will check if we can unshallow only up to the merge base.

Regards,
Vignesh

> 
> Cheers,
> Daniel

