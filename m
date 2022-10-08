Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF975F8526
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 13:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECD210E21E;
	Sat,  8 Oct 2022 11:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2846610E21C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 11:55:32 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.100.34]) by smtp.orange.fr with ESMTPA
 id h8QOovA5ITyouh8QOoKFYq; Sat, 08 Oct 2022 13:55:27 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 Oct 2022 13:55:27 +0200
X-ME-IP: 86.243.100.34
Message-ID: <6a57b91b-8614-6596-ae0f-acce6a31d161@wanadoo.fr>
Date: Sat, 8 Oct 2022 13:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915/perf: remove redundant variable 'taken'
Content-Language: fr
To: Colin Ian King <colin.i.king@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221007195345.2749911-1-colin.i.king@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20221007195345.2749911-1-colin.i.king@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 07/10/2022 à 21:53, Colin Ian King a écrit :
> The assignment to variable taken is redundant and so it can be
> removed as well as the variable too.
> 
> Cleans up clang-scan build warnings:
> warning: Although the value stored to 'taken' is used in the enclosing
> expression, the value is never actually read from 'taken'
> [deadcode.DeadStores]

Hi,

#define OA_TAKEN(tail, head)	((tail - head) & (OA_BUFFER_SIZE - 1))

So if the result is not used, maybe calling OA_TAKEN() can be removed as 
well?
It looks like a no-op in such a case.

CJ

> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/gpu/drm/i915/i915_perf.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 0defbb43ceea..15816df916c7 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -656,7 +656,6 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
>   	size_t start_offset = *offset;
>   	unsigned long flags;
>   	u32 head, tail;
> -	u32 taken;
>   	int ret = 0;
>   
>   	if (drm_WARN_ON(&uncore->i915->drm, !stream->enabled))
> @@ -692,7 +691,7 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
>   
>   
>   	for (/* none */;
> -	     (taken = OA_TAKEN(tail, head));
> +	     OA_TAKEN(tail, head);
>   	     head = (head + report_size) & mask) {
>   		u8 *report = oa_buf_base + head;
>   		u32 *report32 = (void *)report;
> @@ -950,7 +949,6 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
>   	size_t start_offset = *offset;
>   	unsigned long flags;
>   	u32 head, tail;
> -	u32 taken;
>   	int ret = 0;
>   
>   	if (drm_WARN_ON(&uncore->i915->drm, !stream->enabled))
> @@ -984,7 +982,7 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
>   
>   
>   	for (/* none */;
> -	     (taken = OA_TAKEN(tail, head));
> +	     OA_TAKEN(tail, head);
>   	     head = (head + report_size) & mask) {
>   		u8 *report = oa_buf_base + head;
>   		u32 *report32 = (void *)report;

