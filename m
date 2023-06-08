Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472DD7278D2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403EB10E592;
	Thu,  8 Jun 2023 07:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B3610E594
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:29:21 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C623C4C;
 Thu,  8 Jun 2023 09:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686209333;
 bh=vlIinTewP+cDKlpKQXd2OIGqSCvgjHtEAu4OH/s26NE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PJYnkTDUXtPrki2J7u75rGyX5k/ctQpCgAREtF2QBGDS4igS0CYdsfvAgzIvWiiQi
 0VoIGOss7jCZUG+PaTALc2Lq5jNR9dhoEkyJV1V/3lRlcKkRfRdP8N5FG0EiO+QBzP
 IAHWODcqsOF/rTkVi3o+YiuyfbRaFNu0x6qBgskc=
Message-ID: <be2c4c02-43bc-5b16-2162-b8ace8d34996@ideasonboard.com>
Date: Thu, 8 Jun 2023 10:29:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 0/8] drm/tidss: Use new connector model for tidss
Content-Language: en-US
To: neil.armstrong@linaro.org, Aradhya Bhatia <a-bhatia1@ti.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
 <1f284e9d-5a1e-9fca-ceb0-478a413ae4ef@linaro.org>
 <1b31f36c-b1ba-43b5-9285-0f50384a78cf@ti.com>
 <42151d11-12d9-c165-0d4b-a0af80b683c3@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <42151d11-12d9-c165-0d4b-a0af80b683c3@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 12:48, neil.armstrong@linaro.org wrote:
> On 06/06/2023 11:46, Aradhya Bhatia wrote:
>> Hi Neil,
>>
>> Thank you for reviewing the previous patches!
>>
>> On 06-Jun-23 14:37, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 06/06/2023 10:21, Aradhya Bhatia wrote:
>>>> Hi all,
>>>>
>>>> I have picked up this long standing series from Nikhil Devshatwar[1].
>>>>
>>>> This series moves the tidss to using new connectoe model, where the SoC
>>>> driver (tidss) creates the connector and all the bridges are attached
>>>> with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR. It also now creates 
>>>> bridge
>>>> to support format negotiation and and 'simple' encoder to expose it to
>>>> the userspace.
>>>>
>>>> Since the bridges do not create the connector, the bus_format and
>>>> bus_flag is set via atomic hooks.
>>>>
>>>> Support format negotiations in the tfp410, sii902x and mhdp-8546 bridge
>>>> drivers as a first step before moving the connector model.
>>>>
>>>> These patches were tested on AM625-SK EVM, AM625 SoC based BeaglePlay,
>>>> and J721E-SK. Display support for AM625 SoC has not been added upstream
>>>> and is a WIP. To test this series on AM625 based platforms, basic
>>>> display support patches, (for driver + devicetree), can be found in
>>>> the "next_AttachNoConn-v2" branch on my github fork[2].
>>>
>>> I can apply all bridge patches right now so only the tidss change 
>>> remain,
>>> is that ok for you ?
>>>
>>
>> While the bridge patches and the tidss patch can be separately built
>> without any issue, the tidss functionality will break if only the bridge
>> patches get picked up, and not the tidss.
>>
>> Would it be possible for you to pick all the patches together once Tomi
>> acks the tidss patch?
> 
> Sure

I think this looks fine. For the series:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

