Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLCqH7ECpmmfIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:35:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7A1E3669
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFC910E013;
	Mon,  2 Mar 2026 21:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Dfz5DyTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0226210E013
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 21:35:41 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fPsfy5NNCz9smr;
 Mon,  2 Mar 2026 22:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772487339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NIL6uWapbdqpgG2p/sw1LyDcO+MB0fwXIJZ+3kK7fM=;
 b=Dfz5DyTB1FJq7VJSjg7agABbEOTueivJOUnVhKT9L3mn1zdf1G7UeV+uZlfH0YDVTpkzht
 4QNaZRCZp8Ia0CWWtIzE/AJt4zLSmPdLYDrfcQazk6RuUJdckEASwDRr6tvZAOpO7zoq4T
 80JYUhSZzoyw7RM9RINEHI9bqNvp2L2vnBOvqDyc/H0zz0PRG/QMQdSGsDtP7QqWduJCry
 EggVpojN17RR5eu1w7gebHGJJsmSj5BLSjf7H165qevABqb0+pdtcRH9UiriHZ6waTPPtT
 J7vN+zOLvri/dcVcHcDk0PUJDQo7N/a4WkpqXwuAvlFfltd5xg09OLRtvH+ylA==
Message-ID: <fe436c72-deae-41af-87ea-726fe4801e7b@mailbox.org>
Date: Mon, 2 Mar 2026 22:35:31 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
From: Marek Vasut <marek.vasut@mailbox.org>
To: dri-devel@lists.freedesktop.org
Cc: Joseph Guo <qijian.guo@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
 <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
 <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
Content-Language: en-US
In-Reply-To: <3af09657-78ce-4bc6-b8d5-b346a3b86c5b@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: dkqf49gjzjuakfhs31ap9sy1mc6uzb4y
X-MBO-RS-ID: 06d59b41ff50c3666a5
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
X-Rspamd-Queue-Id: 0BC7A1E3669
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
	FREEMAIL_CC(0.00)[nxp.com,intel.com,kernel.org,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Action: no action

On 2/6/26 12:48 PM, Marek Vasut wrote:
> On 1/15/26 3:39 AM, Marek Vasut wrote:
>> Parse the data lane count out of DT. Limit the supported data lanes
>> to 1..4 which is the maximum available DSI pairs on the connector of
>> any known panels which may use this bridge. Internally, this bridge
>> is an ChipOne ICN6211 which loads its register configuration from a
>> dedicated storage and its I2C does not seem to be accessible. The
>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>
>> To avoid any breakage on old DTs where the parsing of data lanes from
>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>> warn user.
>>
>> The lane configuration is preconfigured in the bridge for each of the
>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>> others seem to use 2-lane configuration. This is a hardware property,
>> so the actual count should come from DT.
>>
>> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Is it OK to apply these two patches now ?

Can this be applied now ?
