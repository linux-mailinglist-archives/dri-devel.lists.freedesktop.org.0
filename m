Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE63JCTtpmmQaAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:16:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E81F13D9
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7D310E00B;
	Tue,  3 Mar 2026 14:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bX7R4Mos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC8110E00B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:15:56 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fQHs25dxRz9vCJ;
 Tue,  3 Mar 2026 15:15:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772547350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vkxg76Zvr5nEIh4+DPVppUp2uw6hT8c9cXZv6TYN+wg=;
 b=bX7R4MosXKdYmrqTRLni21XP9YeHU4+puTDdwo5DE1ey5ibk3lwt1H7ZlBSo936dgmW8Sc
 WhaJvZgZP5JvrFb25A9EgTbzJdEPOEmpjcGDZfHA1jFj8onefDPmXSQihGuIkLsmzKTTrD
 up3ty7Bs9dIdCbyDOHj80JnhfuHR1t3+/U/xPq0uvROodBWBoTI3gWvhA4JOVbWKeYASpX
 XKjwgrd8voOmcyWdNT5Noq/hHHzhqLo6YVM9hfku00nnwc/uSOWjnWXt4tWPWVOPqDBJ4s
 FiFoKzCYbmHaSNZQpEX3AgMgQu2bMf1oTlPedkzbKPDtFl2SF+J3CKGr4ozWZQ==
Message-ID: <eab056af-cc63-4ccf-a089-03d8ccdf89d1@mailbox.org>
Date: Tue, 3 Mar 2026 15:15:27 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Joseph Guo <qijian.guo@nxp.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
 <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
 <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
 <20260303-free-kudu-from-vega-20fb3e@houat>
 <13afd1fc-7201-4210-a697-8977d47857e7@mailbox.org>
 <DGT6NVXAVDOH.1RAMJDTU22I4O@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DGT6NVXAVDOH.1RAMJDTU22I4O@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: mj734nhz7wpm6zqbqdizwigeorrak6mj
X-MBO-RS-ID: afe2d02ea44f4e40261
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
X-Rspamd-Queue-Id: BD6E81F13D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:mripard@kernel.org,m:qijian.guo@nxp.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:krzk+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,nxp.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/3/26 2:32 PM, Luca Ceresoli wrote:
> Hi Marek,
> 
> On Tue Mar 3, 2026 at 1:59 PM CET, Marek Vasut wrote:
>> On 3/3/26 8:56 AM, Maxime Ripard wrote:
>>> On Mon, Mar 02, 2026 at 10:35:31PM +0100, Marek Vasut wrote:
>>>> On 2/6/26 12:48 PM, Marek Vasut wrote:
>>>>> On 1/15/26 3:39 AM, Marek Vasut wrote:
>>>>>> Parse the data lane count out of DT. Limit the supported data lanes
>>>>>> to 1..4 which is the maximum available DSI pairs on the connector of
>>>>>> any known panels which may use this bridge. Internally, this bridge
>>>>>> is an ChipOne ICN6211 which loads its register configuration from a
>>>>>> dedicated storage and its I2C does not seem to be accessible. The
>>>>>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>>>>>
>>>>>> To avoid any breakage on old DTs where the parsing of data lanes from
>>>>>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>>>>>> warn user.
>>>>>>
>>>>>> The lane configuration is preconfigured in the bridge for each of the
>>>>>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>>>>>> others seem to use 2-lane configuration. This is a hardware property,
>>>>>> so the actual count should come from DT.
>>>>>>
>>>>>> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>>
>>>>> Is it OK to apply these two patches now ?
>>>>
>>>> Can this be applied now ?
>>>
>>> It looks like you have a reviewed-by already, what's stoping you from
>>> applying it yourself?
>> I generally try to avoid applying my own patches, but if that is OK
>> here, I will apply them ?
> 
> I fid it a bit weird as well, but it's the common practice in drm-misc, so
> I do it when there are enough R-by / A-by.
> 
> One thing I'm never sure about is the definition of "enough R-by / A-by"
> though. I used to kind of assume at least a maintainer listed in
> MAINTAINERS should approve the patch. But that also seems not a rule for
> drm-misc, at least for patches that impact only a specific driver and not
> core or otherwise shared code, and/or which look "obviously correct".
> 
> Based on the above, I'm applying this series right now.
Thank you
