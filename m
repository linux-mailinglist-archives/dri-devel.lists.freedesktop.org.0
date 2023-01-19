Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B330674F03
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911B510EA65;
	Fri, 20 Jan 2023 08:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9A910E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:57:04 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D21227EC;
 Thu, 19 Jan 2023 09:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674118623;
 bh=NM7iPf9UH7O9Eiz/GzwWeoEfK+hdmMFOuALZnO6qqFI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=t25WFNtabD+A9InP1fAajCIwT0oHDz4UxIJ1+DLkm9hWvsqLJ1CUoUVopO/8ZnHv0
 qJWi/AXzKtKY0BTVeQyZ9Kg8lI8m3tGfAycXow3vt2R5tZkqxwYyFsbbxqhdR4/5B8
 2OU7TDynEHNufjet8eGhWPd1CT8MnNBlRSVFa8ck=
Message-ID: <63591b08-44fd-abc8-5012-b77301fe6881@ideasonboard.com>
Date: Thu, 19 Jan 2023 10:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/6] drm: rcar-du: Add quirk for H3 ES1 pclk WA
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-5-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdU+Zh3cDm4h8m7xYOee+6O7RLTdUSmR+gnL_ugGzsmTiQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CAMuHMdU+Zh3cDm4h8m7xYOee+6O7RLTdUSmR+gnL_ugGzsmTiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2023 18:11, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Tue, Jan 17, 2023 at 2:54 PM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> rcar_du_crtc.c does a soc_device_match() in
>> rcar_du_crtc_set_display_timing() to find out if the SoC is H3 ES1, and
>> if so, apply a WA.
>>
>> We will need another H3 ES1 check in the following patch, so rather than
>> adding more soc_device_match() calls, let's add a rcar_du_device_info
>> entry for the ES1, and a quirk flag,
>> RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY, for the WA.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> 
>> @@ -681,7 +724,13 @@ static int rcar_du_probe(struct platform_device *pdev)
>>                  return PTR_ERR(rcdu);
>>
>>          rcdu->dev = &pdev->dev;
>> -       rcdu->info = of_device_get_match_data(rcdu->dev);
> 
> No need to remove this line...
> 
>> +
>> +       soc_attr = soc_device_match(rcar_du_soc_table);
>> +       if (soc_attr)
>> +               rcdu->info = soc_attr->data;
>> +
>> +       if (!rcdu->info)
>> +               rcdu->info = of_device_get_match_data(rcdu->dev);
> 
> ... and no need to add these two lines.
> The idiom is to set rcdu->info based on of_device_get_match_data()
> first, and override based on of_device_get_match_data() when needed.

Ok.

  Tomi

