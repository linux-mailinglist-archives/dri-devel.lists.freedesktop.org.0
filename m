Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3184DD488
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 06:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023D189EB7;
	Fri, 18 Mar 2022 05:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A28389EB7;
 Fri, 18 Mar 2022 05:58:28 +0000 (UTC)
Received: from [192.168.0.3] (ip5f5aef49.dynamic.kabel-deutschland.de
 [95.90.239.73])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5C8F161E6478B;
 Fri, 18 Mar 2022 06:58:26 +0100 (CET)
Message-ID: <f1ff7e95-c177-09dd-9393-d0156ce81387@molgen.mpg.de>
Date: Fri, 18 Mar 2022 06:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amd/display: Fixed the unused-but-set-variable warning
Content-Language: en-US
To: Aashish Sharma <shraash@google.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 David Airlie <airlied@linux.ie>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Jake Wang <haonan.wang2@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 Guenter Roeck <groeck@chromium.org>
References: <20220317140115.541007-1-shraash@google.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220317140115.541007-1-shraash@google.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Aashish,


Am 17.03.22 um 15:01 schrieb Aashish Sharma:

Thank you for your patch. If you are going to send a v2, please use 
imperative mood. Maybe:

drm/amd/display: Fix unused-but-set-variable warning


> Fixed this kernel test robot warning:

Maybe:

Fix the kernel test robot warning below:

> drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:2893:12:
> warning: variable 'temp' set but not used [-Wunused-but-set-variable]
> 
> Replaced the assignment to the unused temp variable with READ_ONCE()
> macro to flush the writes.

Replace …

Excuse my ignorance regarding `READ_ONCE()`, but is that the reason you 
remove the volatile qualifier?

Some robots ask in their report to add a Found-by tag. If so, please add 
one.

> Signed-off-by: Aashish Sharma <shraash@google.com>
> ---
>   drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> index 873ecd04e01d..b7981a781701 100644
> --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> @@ -2913,13 +2913,12 @@ static inline void dmub_rb_flush_pending(const struct dmub_rb *rb)
>   	uint32_t wptr = rb->wrpt;
>   
>   	while (rptr != wptr) {
> -		uint64_t volatile *data = (uint64_t volatile *)((uint8_t *)(rb->base_address) + rptr);
> +		uint64_t *data = (uint64_t volatile *)((uint8_t *)(rb->base_address) + rptr);
>   		//uint64_t volatile *p = (uint64_t volatile *)data;
> -		uint64_t temp;
>   		uint8_t i;
>   
>   		for (i = 0; i < DMUB_RB_CMD_SIZE / sizeof(uint64_t); i++)
> -			temp = *data++;
> +			(void)READ_ONCE(*data++);

Did you verify, that the generated code is the same now, or what the 
differences are. If it’s different from before, you should document in 
the commit message, that it’s wanted, as otherwise, it’s an invasive 
change just to fix a warning.

>   		rptr += DMUB_RB_CMD_SIZE;
>   		if (rptr >= rb->capacity)


Kind regards,

Paul
