Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13C6D5EDA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 13:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDD010E117;
	Tue,  4 Apr 2023 11:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907D210E117
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 11:20:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 223058002D;
 Tue,  4 Apr 2023 13:20:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680607231;
 bh=DPb/NlwHLswGYb6FO8AnkADUP02CIdrAw6XyITjGUnE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l7UymuF/QOf3ZWf/f/VRW2A4+wGiqFTnVZZ6cmeeIurNOLM4xRRWnbzu9oB6m4Tkw
 y44AgJFzgYlN8phYHxy9I82dR5uqqddHOqVV08dHJM+ghc6XNxIAkpatM8MJ0XccX7
 5fZ+QlIq1BlmJTcVouiMU9ntuSuTllouHIFgPCSFiEaQfeire0PDYgEypZF1Or962R
 nxSJx13LAlpgvrhceI/lbSelOdODpFJcNh6Mu4SRQKBmnEFTF3c+lNvW3y8xLJZ/d7
 l9FQrQDOm8ZlNmWt3VbccBQQIV+AdScde1nKDKvyDSzfPK5/D3pkrdAsxSF9JRB98B
 u2HulsCa8SQpg==
Message-ID: <1c4bf5f3-0f49-93da-663f-30e85e675ce3@denx.de>
Date: Tue, 4 Apr 2023 13:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA and
 EOT packet
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230403190242.224490-1-marex@denx.de>
 <20230404031150.GF16648@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230404031150.GF16648@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Walle <michael@walle.cc>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/23 05:11, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Mon, Apr 03, 2023 at 09:02:42PM +0200, Marek Vasut wrote:
>> Do not generate the HS front and back porch gaps, the HSA gap and
>> EOT packet, as per "SN65DSI83 datasheet SLLSEC1I - SEPTEMBER 2012
>> - REVISED OCTOBER 2020", page 22, these packets are not required.
>> This makes the TI SN65DSI83 bridge work with Samsung DSIM on i.MX8MN.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> I have successfully used this driver with a Raspberry Pi CM4. The VC4
> DSI driver does not seem to support the newly added flags, so this patch
> shouldn't have any effect there.

Indeed, I noticed very few controllers support those flags . Maybe over 
time we will get more of the support on controller side.
