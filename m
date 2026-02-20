Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BmuOAGUmGlaJwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:04:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F37E1698DC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0240F10E3AE;
	Fri, 20 Feb 2026 17:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AxfyOZOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C321D10E3AE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:03:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A29760134;
 Fri, 20 Feb 2026 17:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36FDC116C6;
 Fri, 20 Feb 2026 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771607035;
 bh=OHklII8zTpoG2XHH9fGuY8RkeBt+qRrOQPZSnlCZhcI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AxfyOZOAD2RA9evnqqNazDZk9xWS+6M4Cg+y3zd7iEdV16wnCrNLCtnXfOjGUz7gl
 5bADXf4OrFdY1GbLyL2kWRU6cETXHnz/6yxRc/4XcdeNh/YvJsMUhc2zl2HZp/jUbw
 x8JMfLOWI0kOHYjm+JUDJKLEJrnTFBAyOMj7OrEZ9KYZhL11NmB8ZqC8PTnBhRrrNi
 WCYr2CSZGwHDhfEp6c7KdlwNm7Je5Gq6DeoCRfEFHmhA0letLbfYiJXAv4sHKzMoJ5
 gICzcrKV+P9LCcFx4/yiAlnOkUMMc/oh4xu8xgJzLOWmygtYj/k/Bpp0DuGfEIyJbE
 9G6NUMCSQC3iQ==
Message-ID: <5171999a-12f0-4f8f-ab47-042bf1230ae9@kernel.org>
Date: Fri, 20 Feb 2026 11:03:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Validate command buffer payload count
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260219211946.1920485-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260219211946.1920485-1-lizhi.hou@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6F37E1698DC
X-Rspamd-Action: no action



On 2/19/2026 3:19 PM, Lizhi Hou wrote:
> The count field in the command header is used to determine the valid
> payload size. Verify that the valid payload does not exceed the remaining
> buffer space.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/amdxdna_ctx.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index d17aef89a0ad..cf4d3af67bf7 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -104,7 +104,10 @@ void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size)
>   
>   	if (size) {
>   		count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
> -		if (unlikely(count <= num_masks)) {
> +		if (unlikely(count <= num_masks ||
> +			     count * sizeof(u32) +
> +			     offsetof(struct amdxdna_cmd, data[0]) >
> +			     abo->mem.size)) {
>   			*size = 0;
>   			return NULL;
>   		}

