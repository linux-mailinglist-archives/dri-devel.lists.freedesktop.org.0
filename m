Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE592E907
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 15:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1E210E2A1;
	Thu, 11 Jul 2024 13:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TaS3IUsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666610E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R8KocFR1uQXnwkG0GgPGn0lbEUmnk9Qf8EsQepY4p2E=; b=TaS3IUsJBu+zcADTITOCWvIGwC
 x1f+qY3qfI6bOZ7BPKV/uVt7aOZEOGwPgFPBfIzWuSBC1l0ARUbunXdzf2TCGC2H+v7B1MKk6iSB6
 95vwKhk2L9uw3SmRQl94UMQolfzazfaAoZqYIWgu8bcU8aj3ZQ1WCQcT/OG7e6K+mvnDIc8p+Nt1n
 0O5gDZxgdlxlPNgh4MmMAQhQ6PTMtcGQDR3FFnHvWb9o2UCVQdZ6a88v5eeFQdjd1FHqZX7u0Rzf7
 udcwXlVsbJKnJLE5fDUD4QUwTKU5uExqLiPr9kgF3M5mD8U2qIlIrc5VmoHEh42nJbfnW5SupX7Sp
 2dQfDv7g==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRtdo-00DhqU-Kp; Thu, 11 Jul 2024 15:15:20 +0200
Message-ID: <b466ea7f-eabf-470c-8e13-03fff3094d62@igalia.com>
Date: Thu, 11 Jul 2024 10:15:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] drm/v3d: Do not use intermediate storage when
 copying performance query results
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240711091542.82083-1-tursulin@igalia.com>
 <20240711091542.82083-9-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240711091542.82083-9-tursulin@igalia.com>
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

On 7/11/24 06:15, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Removing the intermediate buffer removes the last use of the
> V3D_MAX_COUNTERS define, which will enable further driver cleanup.
> 
> While at it pull the 32 vs 64 bit copying decision outside the loop in
> order to reduce the number of conditional instructions.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

After addressing Iago's comment, you can add my

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 60 ++++++++++++++++++++-------------
>   1 file changed, 37 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 7b2195ba4248..2564467735fc 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -421,18 +421,23 @@ v3d_reset_timestamp_queries(struct v3d_cpu_job *job)
>   	v3d_put_bo_vaddr(bo);
>   }
>   
> +static void write_to_buffer_32(u32 *dst, unsigned int idx, u32 value)
> +{
> +	dst[idx] = value;
> +}
> +
> +static void write_to_buffer_64(u64 *dst, unsigned int idx, u64 value)
> +{
> +	dst[idx] = value;
> +}
> +
>   static void
> -write_to_buffer(void *dst, u32 idx, bool do_64bit, u64 value)
> +write_to_buffer(void *dst, unsigned int idx, bool do_64bit, u64 value)
>   {
> -	if (do_64bit) {
> -		u64 *dst64 = (u64 *)dst;
> -
> -		dst64[idx] = value;
> -	} else {
> -		u32 *dst32 = (u32 *)dst;
> -
> -		dst32[idx] = (u32)value;
> -	}
> +	if (do_64bit)
> +		write_to_buffer_64(dst, idx, value);
> +	else
> +		write_to_buffer_32(dst, idx, value);
>   }
>   
>   static void
> @@ -505,18 +510,23 @@ v3d_reset_performance_queries(struct v3d_cpu_job *job)
>   }
>   
>   static void
> -v3d_write_performance_query_result(struct v3d_cpu_job *job, void *data, u32 query)
> +v3d_write_performance_query_result(struct v3d_cpu_job *job, void *data,
> +				   unsigned int query)
>   {
> -	struct v3d_performance_query_info *performance_query = &job->performance_query;
> -	struct v3d_copy_query_results_info *copy = &job->copy;
> +	struct v3d_performance_query_info *performance_query =
> +						&job->performance_query;
>   	struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
>   	struct v3d_dev *v3d = job->base.v3d;
> -	struct v3d_perfmon *perfmon;
> -	u64 counter_values[V3D_MAX_COUNTERS];
> +	unsigned int i, j, offset;
>   
> -	for (int i = 0; i < performance_query->nperfmons; i++) {
> -		perfmon = v3d_perfmon_find(v3d_priv,
> -					   performance_query->queries[query].kperfmon_ids[i]);
> +	for (i = 0, offset = 0;
> +	     i < performance_query->nperfmons;
> +	     i++, offset += DRM_V3D_MAX_PERF_COUNTERS) {
> +		struct v3d_performance_query *q =
> +				&performance_query->queries[query];
> +		struct v3d_perfmon *perfmon;
> +
> +		perfmon = v3d_perfmon_find(v3d_priv, q->kperfmon_ids[i]);
>   		if (!perfmon) {
>   			DRM_DEBUG("Failed to find perfmon.");
>   			continue;
> @@ -524,14 +534,18 @@ v3d_write_performance_query_result(struct v3d_cpu_job *job, void *data, u32 quer
>   
>   		v3d_perfmon_stop(v3d, perfmon, true);
>   
> -		memcpy(&counter_values[i * DRM_V3D_MAX_PERF_COUNTERS], perfmon->values,
> -		       perfmon->ncounters * sizeof(u64));
> +		if (job->copy.do_64bit) {
> +			for (j = 0; j < perfmon->ncounters; j++)
> +				write_to_buffer_64(data, offset + j,
> +						   perfmon->values[j]);
> +		} else {
> +			for (j = 0; j < perfmon->ncounters; j++)
> +				write_to_buffer_32(data, offset + j,
> +						   perfmon->values[j]);
> +		}
>   
>   		v3d_perfmon_put(perfmon);
>   	}
> -
> -	for (int i = 0; i < performance_query->ncounters; i++)
> -		write_to_buffer(data, i, copy->do_64bit, counter_values[i]);
>   }
>   
>   static void
