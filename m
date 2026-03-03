Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F1pHy7rpmnjZgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:07:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0131F10E7
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B345E10E822;
	Tue,  3 Mar 2026 14:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QW61qsVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79A010E822
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JK04DfYDUn29INZwXkb5rXnTNjANnquguAbMKUw0crg=; b=QW61qsVixbdKRVTtd3Rdjth0e2
 QNsfH+rOJhyozXadkRqaw9Ndh11iuNLAU6bj4N6Bxq4fIJuD0sDFLyh2GYBnvJcuTH7p6MHIEBuH1
 nVz4qrLjm+RKta+sVI/EIOnbkH6HR8GKptGZX7nxGG424LywDLlyl/KFGmQQKWskPyuVpFlnYXWK1
 Effz6PJFwqwzYui+X8f9lQdi3FvlIXSvLSMrKj5VDX2t3YPWAIaSLZNtFWcyPMGjqv3zpnOs8QKuA
 iPWoXkEDQTNoggjAEXsZneqXJpB8luTPJdpFQWKkQr23TGZAGBy72G1O6f+hSBuOVjuwZVrCHPEeM
 UKSP1YuQ==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.24.62.248])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vxQP4-008Txp-1x; Tue, 03 Mar 2026 15:07:14 +0100
Message-ID: <467f5b16-05b2-47ce-b68b-6009a247be45@igalia.com>
Date: Tue, 3 Mar 2026 11:07:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] pmdomain: bcm: bcm2835-power: Increase ASB control
 timeout
To: Stefan Wahren <wahrenst@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-3-40683fd39865@igalia.com>
 <1028109e-3b74-49fc-becb-4eca2f6bdda3@gmx.net>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <1028109e-3b74-49fc-becb-4eca2f6bdda3@gmx.net>
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
X-Rspamd-Queue-Id: BA0131F10E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wahrenst@gmx.net,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:mripard@kernel.org,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmx.net,baylibre.com,kernel.org,broadcom.com,igalia.com,raspberrypi.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[igalia.com:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.847];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action

Hi Stefan,

On 02/03/26 19:43, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 18.02.26 um 21:45 schrieb Maíra Canal:
>> The bcm2835_asb_control() function uses a tight polling loop to wait
>> for the ASB bridge to acknowledge a request. During intensive workloads,
>> this handshake intermittently fails for V3D's master ASB on BCM2711,
>> resulting in "Failed to disable ASB master for v3d" errors during
>> runtime PM suspend. As a consequence, the failed power-off leaves V3D in
>> a broken state, leading to bus faults or system hangs on later accesses.
>>
>> As the timeout is insufficient in some scenarios, increase the polling
>> timeout from 1us to 5us, which is still negligible in the context of a
>> power domain transition. Also, move the start timestamp to after the
>> MMIO write, as the write latency is counted against the timeout,
>> reducing the effective wait time for the hardware to respond.
> so this bug has been discovered by this series and doesn't need to 
> backported?

I only found out about this bug when I was testing this series, but it's
quite possible that this issue also happened in other scenarios.

> I remember complete system freezes during suspend to idle causes by V3D 
> on Raspberry CM4 [1]. But I never had the time to investigate further.
> 
> Regardless, this patch is
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Thanks for the review! Ulf, considering Stefan's comment, I'd appreciate
if you could pick this patch and add the stable tag. Thanks.

Best regards,
- Maíra

> 
> Thanks
> 
> [1] - https://github.com/lategoodbye/linux-dev/ 
> commit/6af3f79da5b5a41b37aefa6abe3d368c9ef09805
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/pmdomain/bcm/bcm2835-power.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/ 
>> bcm/bcm2835-power.c
>> index 
>> 1d29addfe036348e82293693b4059e504bb25575..7b9eea10a24e26835deeca84c60ccb616b99a508 100644
>> --- a/drivers/pmdomain/bcm/bcm2835-power.c
>> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
>> @@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct 
>> bcm2835_power *power, u32 reg, bool enable
>>           break;
>>       }
>> -    start = ktime_get_ns();
>> -
>>       /* Enable the module's async AXI bridges. */
>>       if (enable) {
>>           val = readl(base + reg) & ~ASB_REQ_STOP;
>> @@ -176,9 +174,10 @@ static int bcm2835_asb_control(struct 
>> bcm2835_power *power, u32 reg, bool enable
>>       }
>>       writel(PM_PASSWORD | val, base + reg);
>> +    start = ktime_get_ns();
>>       while (!!(readl(base + reg) & ASB_ACK) == enable) {
>>           cpu_relax();
>> -        if (ktime_get_ns() - start >= 1000)
>> +        if (ktime_get_ns() - start >= 5000)
>>               return -ETIMEDOUT;
>>       }
>>
> 

