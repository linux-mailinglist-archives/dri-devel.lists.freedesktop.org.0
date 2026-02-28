Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKK0AF1po2mACgUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 23:17:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6E1C96D7
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 23:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07F710E10D;
	Sat, 28 Feb 2026 22:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="VrQEcZTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D0110E10D
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 22:16:55 +0000 (UTC)
Message-ID: <c4e93e78-427a-45a6-9560-399b578e9260@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1772317013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mo8hhAD0T4w5u4cZDhtfyEdn8aaXHkZHMK1H62Gbpmw=;
 b=VrQEcZTlYvv3IkuNXllFn7cX8Ffj/S6Whqymcl4G5uECvZvknPoJnTjyWRxRoANd5EMbTG
 NfNaaASUoO2EhE5q9lq5zh9Uui+6r0H1IswxdEFvJWolIbxjk23zZUQVxvN37XsvRaECfh
 BcMfr39l9XpcXZll4VNUYcZGAURwkcSOyAgEckX9s3ImA+WDgV1miMo/kyvqAiM7SIMU6X
 BogSeBCDPcrGTpeiuU2jPr8omPStiFtiCTtZ11nNWCCgQwJr5Ltfklm3wrTQHQCW9FWdJy
 mjAgwaU8n/qoaMIGIlSxL7mqo74jwsE3R2o0gqwymjTunXurXtCzK0irezHRHg==
Date: Sat, 28 Feb 2026 19:16:44 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/3] drm/msm/adreno: Trust the SSoT UBWC config
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:andersson@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: DEC6E1C96D7
X-Rspamd-Action: no action

On 1/8/26 11:21 AM, Konrad Dybcio wrote:

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Now that the highest_bank_bit value is retrieved from the running
> system and the global config has been part of the tree for a couple
> of releases, there is no reason to keep any hardcoded values inside
> the GPU driver.
[…]
> -	if (adreno_is_a610(gpu)) {
> -		cfg->highest_bank_bit = 13;
> -		cfg->ubwc_swizzle = 0x7;
> -	}


Just noticed that the SoCs with A610 (SM6115/SM6125) have 
.highest_bank_bit = 14 in drivers/soc/qcom/ubwc_config.c unlike this 13 
value here.

Could this have been the cause of the corruption I saw on SM6115 
initially? [1]

What's really strange though is that I wanted to test this now, but I 
removed the FD_MESA_DEBUG=noubwc workaround that solved it initially…

and the corruption *did not* come back so I can't even repro it to 
confirm that this would fix it o.0


[1]: 
https://cache.treehouse.systems/media_attachments/files/116/083/578/070/293/038/original/9b8e73e15bed644f.jpg 


