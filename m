Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EEF674F28
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD5210EA83;
	Fri, 20 Jan 2023 08:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257AC10E8E1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 08:37:01 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7D967EC;
 Thu, 19 Jan 2023 09:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674117419;
 bh=uiyVKhcyDI6wrIBa+FrRFZD2CVtEYdTskePUNjF2owI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CcLEw/WqreGOPMvjXKoZ6nU3KkVasafHkMum0oOcEI6jUluDr8gA3grs7T+tGk160
 WGZTjXstZs1G45ahAaN6QUDUj5EFtdvuAlFigR4Zm03BPTExj6jv1xc8M71yV7Mo/h
 WlfSEI+F8aLQ2J57SkjAO9xTTZZ9f/vyhKKbsquk=
Message-ID: <a34ace0f-cd75-006c-a264-2307b1909c92@ideasonboard.com>
Date: Thu, 19 Jan 2023 10:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/6] drm: rcar-du: lvds: Add reset control
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdUuUV38tVsZ5qoJEq5OF-0RZ6gnCAFvyt=FHTXUy_PybQ@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <CAMuHMdUuUV38tVsZ5qoJEq5OF-0RZ6gnCAFvyt=FHTXUy_PybQ@mail.gmail.com>
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
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2023 18:04, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Tue, Jan 17, 2023 at 2:54 PM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>>
>> Reset LVDS using the reset control as CPG reset/release is required in
>> H/W manual sequence.
>>
>> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
>> [tomi.valkeinen: Rewrite the patch description]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> 
>> @@ -844,6 +853,12 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>>          if (ret < 0)
>>                  return ret;
>>
>> +       lvds->rstc = devm_reset_control_get(&pdev->dev, NULL);
> 
> devm_reset_control_get_exclusive()

Ok.

>> +       if (IS_ERR(lvds->rstc)) {
>> +               dev_err(&pdev->dev, "failed to get cpg reset\n");
>> +               return PTR_ERR(lvds->rstc);
> 
> return dev_err_probe(...);

Right.

Thanks!

  Tomi

