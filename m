Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JCXJSLjrmmoJgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:11:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A65123B602
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A79410E525;
	Mon,  9 Mar 2026 15:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 948D410E525
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:11:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8F861570;
 Mon,  9 Mar 2026 08:11:19 -0700 (PDT)
Received: from [10.57.57.245] (unknown [10.57.57.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E648C3F73B;
 Mon,  9 Mar 2026 08:11:24 -0700 (PDT)
Message-ID: <50afb196-9d4d-4991-9feb-b78ed75aa55a@arm.com>
Date: Mon, 9 Mar 2026 15:11:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix the "done_fence is initialized"
 detection logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260309124318.222902-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260309124318.222902-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: 2A65123B602
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.444];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[steven.price@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:mid,arm.com:email,collabora.com:email]
X-Rspamd-Action: no action

On 09/03/2026 12:43, Boris Brezillon wrote:
> After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
> dma_fence::ops == NULL can't be used to check if the fence is initialized.
> Use dma_fence_was_initialized() instead.
> 
> v2:
> - Use dma_fence_was_initialized() instead of open-coding it
> 
> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Christian König <christian.koenig@amd.com>
> Reported-by: Steven Price <steven.price@arm.com>
> Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index bd703a2904a1..c15941ebe07a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3915,7 +3915,7 @@ static void job_release(struct kref *ref)
>  	if (job->base.s_fence)
>  		drm_sched_job_cleanup(&job->base);
>  
> -	if (job->done_fence && job->done_fence->ops)
> +	if (dma_fence_was_initialized(job->done_fence))
>  		dma_fence_put(job->done_fence);
>  	else
>  		dma_fence_free(job->done_fence);

