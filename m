Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E76028EC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 12:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3D010E55A;
	Tue, 18 Oct 2022 10:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7094010E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 10:01:01 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3CEED84B77;
 Tue, 18 Oct 2022 12:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666087259;
 bh=ciBeSnr+XfYoSgGmJD3zcRqhzZIq/5Na+KaEJwbRepo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ub6K6zH5y0ekX3SC9CI5gaCOqgPT0ZtJtW7vu6JYSYXlNayyddk8wKBUk0ObE6Iki
 +eIGjas+foJZhN1bYUwsFLn6fCd8S2Q7mBHVSdTH4L4w8mFB4vTxzoQmIadnT78IYI
 EH6NmkiCcxi4bcwPBlTrWEMpDNU5ZTjEUKID+XDfWh5LPwr7GrUy0qqvurayx7z4UV
 gfNufg0MVwoJG5lOSjgTOJeuVeuhNJQ5lqCi9L2rGsdm7/bhFQcnIxZl9yb1U1/HWd
 lz5ndFv84p4tmKpfEhpLJTxpACjcL3F6gH3DZ3TQ7IEvSDWzDd5FkZwxmCog3An93m
 sh784D4DqIoRg==
Message-ID: <c23c24ab-b275-f7d6-3e2f-59fa27212e55@denx.de>
Date: Tue, 18 Oct 2022 12:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] drm/panel/panel-sitronix-st7701: Fix RTNI calculation
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20221012221159.88397-1-marex@denx.de>
 <CACRpkdZd_fNYv2sFRJX7nacz1dAp-dAxEzDfTMRKAy4nB6Jbvw@mail.gmail.com>
 <30a171e3-1b82-34a5-e018-349349e246c6@denx.de>
 <CACRpkdZhe4ie+X+i20q1NmvXCv3XM=4pcnU=W-93n2ik+ZcdMA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdZhe4ie+X+i20q1NmvXCv3XM=4pcnU=W-93n2ik+ZcdMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/22 11:13, Linus Walleij wrote:
> On Tue, Oct 18, 2022 at 11:03 AM Marek Vasut <marex@denx.de> wrote:
>> On 10/18/22 10:53, Linus Walleij wrote:
>>> On Thu, Oct 13, 2022 at 12:12 AM Marek Vasut <marex@denx.de> wrote:
>>>
>>>> The RTNI field is multiplied by 16 and incremented by 512 before being
>>>> used as the minimum number of pixel clock per horizontal line, hence
>>>> it is necessary to subtract those 512 bytes from htotal and then divide
>>>> the result by 16 before writing the value into the RTNI field. Fix the
>>>> calculation.
>>>>
>>>> Fixes: de2b4917843c ("drm/panel/panel-sitronix-st7701: Infer horizontal pixel count from TFT mode")
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Guido Günther <agx@sigxcpu.org>
>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>> Cc: Thierry Reding <thierry.reding@gmail.com>
>>>> ---
>>>> V2: Clamp the htotal to range 512...1008, so RTNI always fits the bitfield
>>>
>>> I tried to apply this to drm-misc-fixes but the branch has not yet
>>> been moved forward to v6.1-rc1.
>>
>> Can I maybe get RB until then ?
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you

> I've been told to go and poke the DRM git people at IRC to rebase
> the fixes branch.

That would be #dri-devel on OFTC I think ?
