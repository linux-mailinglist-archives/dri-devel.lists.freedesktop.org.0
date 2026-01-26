Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD5cA5pKd2msdwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:06:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7D877A8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 12:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BDA10E082;
	Mon, 26 Jan 2026 11:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DSJXpNiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A6810E082
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZuODv4byBDoO7r5ORDZZKB4tCzJ8s4CMikv3WI8hr/Y=; b=DSJXpNivAlcWV1w9ugI0E425/J
 kXYNh+EOtBME+oBjgHiDyVQ8WB+b7+X3Vbl91kXX6p4aY8QSY5ax2S2V8JTT2v4Fid9/suotJvhI3
 sb3/WgcwAW3bzibDOyQrncYSBkXVPJiU8TjNKc2Q2XBky730iUAQ7G4i+kK12aPMLsY0J/b1JNaoD
 vhCcWvfBz3TFKMskx23Y4s2Bl4NDGcQDfZngO59bOpIWhxd9B9IbNyryFYl2bxWC+mH4ZVPYnY4sq
 zdfr0I89VW3ohxuB/nzTCPtw3YqniJK/VDLVMFY9QVH66fVpKTdS97MDtJxmIcVHwRRLtYFIxyzrf
 5byoU4gg==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vkKPZ-00A0Ol-V5; Mon, 26 Jan 2026 12:05:38 +0100
Message-ID: <9ee3b7f0-9262-4f6f-bec6-6fd9978e3754@igalia.com>
Date: Mon, 26 Jan 2026 08:05:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/v3d: Allocate all resources before enabling
 the clock
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-3-4e1874e81dd6@igalia.com>
 <b652e476-af2f-4af7-aa95-3b987f6e1bde@igalia.com>
 <dbd3c9e7-c60f-4223-8ca6-c55d2398cc3c@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <dbd3c9e7-c60f-4223-8ca6-c55d2398cc3c@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mripard@kernel.org,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:popcornmix@gmail.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,baylibre.com,kernel.org,broadcom.com,gmx.net,gmail.com,raspberrypi.com,pengutronix.de];
	FORGED_SENDER(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5CB7D877A8
X-Rspamd-Action: no action



On 24/01/2026 14:48, Maíra Canal wrote:
> Hi Melissa,
>
> On 23/01/26 12:53, Melissa Wen wrote:
>>
>>
>> On 16/01/2026 17:19, Maíra Canal wrote:
>>> Move all resource allocation operations before actually enabling the
>>> clock, as those operations don't require the GPU to be powered on.
>> What are the benefits of doing it?
>
> This is mostly a preparation for the next patch. In the next patch, I'll
> move all code related to powering on and preparing the GPU into the
> resume() hook. Since resource allocation must occur before resume(),
> this patch prepares the necessary groundwork for that.

Can you include this explanation to the commit message?

>
>>>
>>> While here, use devm_reset_control_get_optional_exclusive() instead of
>>> open-code it.
>> Overall LGTM. But I think this patch could be split into smaller units.
>> Maybe something like:
>> 1. remove open-coded part
>> 2. split gem resource allocation from initialization
>> 3. move all resource allocation
>
> I can certainly do that. My initial thinking was to keep these changes
> together, since they are closely related and all serve the same
> preparatory goal for the upcoming resume() refactoring. From my
> perspective, keeping them together helps preserve that context.

As a reviewer, splitting these changes into separate patches would make 
review simpler.
I think the open-coded improvement isn't super attached to the resource 
allocation, right?
And you can preserve context in the commit message.

Melissa

>
> Best regards,
> - Maíra
>
>>
>> Melissa
>>

