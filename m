Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DpqOGHHlGn+HgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:54:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE6614FC52
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACE710E2A1;
	Tue, 17 Feb 2026 19:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HZ1qYfVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4712110E2A1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 19:54:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B83461850;
 Tue, 17 Feb 2026 19:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75501C4CEF7;
 Tue, 17 Feb 2026 19:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771358043;
 bh=+CzQjO6qTPk9ngnNPY+juCNZ6TMmFzDDdAUTAmZQ40U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HZ1qYfVkIID5T8O4wtswK8vOLnbnqnWwj1Q4Riokzte8grJTVms/U5Nzq/q4WEnx5
 1NeZUSwxhzD4AkOVw+444rPs9gza2n/FhQeRR3pSk3TjBdHphDsdx7FcKZbWzH1ifi
 XCK7Q8lWhHrDMihaCfsLDq3bMiMN8DhkkUngsdLHW9pFmen9i52bpLvrXCwcqLIKP1
 EZOGoZKoUw4q6CejUkB2wRm8qmBIprRJJevZmJleCL43IMuj1GnDgqkZKG2evgwS98
 02ek1gMaVOc/U0p0texV+iTr6iWwFYRLLRr9VriMnHMzt0BbwoZbe5EzCsih5TSY9s
 aIevxUIB5N+bg==
Message-ID: <dc7969d1-2f29-450b-98c7-0df251b22e2c@kernel.org>
Date: Tue, 17 Feb 2026 13:54:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Prevent ubuf size overflow
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260217192815.1784689-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260217192815.1784689-1-lizhi.hou@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 4EE6614FC52
X-Rspamd-Action: no action

On 2/17/26 1:28 PM, Lizhi Hou wrote:
> The ubuf size calculation may overflow, resulting in an undersized
> allocation and possible memory corruption.
> 
> Use check_add_overflow() helpers to validate the size calculation before
> allocation.
> 
> Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/amdxdna_ubuf.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
> index 9e3b3b055caa..62a478f6b45f 100644
> --- a/drivers/accel/amdxdna/amdxdna_ubuf.c
> +++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm_device.h>
>   #include <drm/drm_print.h>
>   #include <linux/dma-buf.h>
> +#include <linux/overflow.h>
>   #include <linux/pagemap.h>
>   #include <linux/vmalloc.h>
>   
> @@ -176,7 +177,10 @@ struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
>   			goto free_ent;
>   		}
>   
> -		exp_info.size += va_ent[i].len;
> +		if (check_add_overflow(exp_info.size, va_ent[i].len, &exp_info.size)) {
> +			ret = -EINVAL;
> +			goto free_ent;
> +		}
>   	}
>   
>   	ubuf->nr_pages = exp_info.size >> PAGE_SHIFT;

