Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F272159C12F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ABB8F55B;
	Mon, 22 Aug 2022 14:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9F28F48D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:00:57 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BD8D2B3;
 Mon, 22 Aug 2022 16:00:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661176855;
 bh=ehB6oBArJIRiJIaT5OcSBdW2vAMSzSW4+YbDnLUC2hw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ogwhTS/7kYqjV3wSzqgTzLmYbIjoZjk0fDcjoJ6IvcPnzpjML7pKoSNRV/CjvF53M
 UhyttQ4E3Em61bfjErG/iLDp+A4+z2LK1z2mv618daoMfzMbWAhiJsmL3BsZBjQLhU
 u2KUYOYEEUh/wpQh+NWqPNTd2jMkTpiPDzwSwupM=
Message-ID: <058337c0-ff8b-0cb4-b6eb-192e78cbeda3@ideasonboard.com>
Date: Mon, 22 Aug 2022 17:00:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-2-tomi.valkeinen@ideasonboard.com>
 <OS0PR01MB5922058F5712CA3367AFEAE186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <OS0PR01MB5922058F5712CA3367AFEAE186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 22/08/2022 16:25, Biju Das wrote:
> Hi Tomi,
> 
> Thanks for the patch.
> 
>> Subject: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
>>
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> The driver does not explicitly stop the video mode transmission when
>> disabling the output. While this doesn't seem to be causing any issues,
>> lets follow the steps described in the documentation and add a
>> rcar_mipi_dsi_stop_video() which stop the video mode transmission. This
>> function will also be used in later patches to stop the video
>> transmission even if the DSI IP is not shut down.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 29 +++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> index 62f7eb84ab01..7f2be490fcf8 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>> @@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct
>> rcar_mipi_dsi *dsi)
>>   	return 0;
>>   }
>>
>> +static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi) {
>> +	u32 status;
>> +	int ret;
>> +
>> +	/* Disable transmission in video mode. */
>> +	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
>> +
>> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +				!(status & TXVMSR_ACT),
>> +				2000, 100000, false, dsi, TXVMSR);
>> +	if (ret < 0) {
>> +		dev_err(dsi->dev, "Failed to disable video transmission\n");
>> +		return;
>> +	}
>> +
>> +	/* Assert video FIFO clear. */
>> +	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
>> +
>> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +				!(status & TXVMSR_VFRDY),
>> +				2000, 100000, false, dsi, TXVMSR);
>> +	if (ret < 0) {
>> +		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
>> +		return;
> 
> This return is not required.

That is true, but I'd personally rather keep it there. If the return is 
removed, I can imagine how easily one could add a new piece of code in 
the end of the function, not realizing that one also needs to add a 
return (the one above) so that the code works correctly.

It just feels a bit safer this way.

  Tomi
