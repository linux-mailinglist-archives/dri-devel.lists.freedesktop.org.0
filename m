Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7894BDB5FA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 23:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EB689496;
	Tue, 14 Oct 2025 21:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="MLYI2/PH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD88A89496
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 21:12:01 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmRjp4WXwz9v66;
 Tue, 14 Oct 2025 23:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760476318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWenJQKHGvTj+n/qgZQIpg+9Ejswl9uucWP6T0h0hpI=;
 b=MLYI2/PHUQ4pCbm9fiLSTZAnUEOdKGjp6Au1B9J53t8M+wbCqm1xlFnvXkFREipJSNM4zV
 Xbbqek71cshVEyb/L9n1iv9eFIQMvPe4oYr4xtI1JeMHWefwaejwgfBp+fT9lAscZxwBn1
 F8Lv3JB9KqBqKSnzBiyx1RkceBK1RjarniMYy72tUZhbRDT0cspNP3imfmUcH5TklObIU0
 KhffzrGnLAbEnb3bhBbN0GzWCpxNljk3ZyMX2T/1EUzgz3xKqfGYe1IQiu5mRPJdfBKFK+
 DDFK9UGzdyTo+omE3G2FEdAAgmdbgwoG64vUo/5q/mZOZkiVX7vYRx3mHek/Cg==
Message-ID: <43e3e005-5d30-4450-8dbc-8c6b5a0fa951@mailbox.org>
Date: Tue, 14 Oct 2025 23:11:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
To: Frank Li <Frank.li@nxp.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
 <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
 <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8ejmrw47in7jc7eotepxsc5w834h4ob9
X-MBO-RS-ID: 68e0347f68ce8adfa13
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

On 10/14/25 5:11 PM, Frank Li wrote:
> On Tue, Oct 14, 2025 at 04:03:37PM +0200, Marek Vasut wrote:
>> On 10/13/25 6:56 PM, Frank Li wrote:
>>> On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
>>>> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
>>>> entry in each ID look up array instead. This allows passing of those arrays
>>>> around as OF match data, which will be useful when using this pipeline on
>>>> i.MX95, which has different address-to-ID mapping.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>
>>> This change is okay. but my questions is why need map register to id.
>>
>> This seems to be a recurring pattern in the driver, where some components
>> need to find other components to link with them. The mapping is fixed, and
>> since the DT does not encode link IDs, the resolution of the mapping has to
>> happen by mapping the component base addresses to the IDs first.
> 
> In graphic link, port@<n>, n should be id? why not use it?
I suspect you could model the relationships between the DC blocks using 
OF graph, yes. I also suspect that description would be very complex in 
DT, considering the amount of blocks and links this device contains. I 
suspect this is why there is no such DT description using OF graph.

I think it might also be good to talk to Liu directly about the original 
design decision and why this id mapping was done the way it was done, 
they should know better than me.
