Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3956E6CBA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 21:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D7910E31A;
	Tue, 18 Apr 2023 19:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356A510E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 19:13:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ACCE885F71;
 Tue, 18 Apr 2023 21:13:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681845182;
 bh=GtQ5dPeQJ86K58quO2g9ivgJdihrxvFqEqqS7acyLfY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iMgS2dzbBoicIO81zWtxevlFxvnyiMPhrJIIjKjrSdUeo45E+tI+T99Oiyw0DtCsi
 0psty/kBggnTDVZStH/Q3QMqkLgYiYh++wtKSeqHRtlrEkA3e42OqcFXRwngNEbTMI
 NZpMZl+TPGLzQbdLJK6/SvLy1zkw1+Nkp7pRokJd5iC31c+0gUTgEH+LoX7sDAO6Gd
 uiFhnkYIIxC0calbetiTvoh0+12xt6V7bQKvCfAruc7EQsTcFog2C/m22/AIAuLpcI
 ZmVYTVVasd5jxMLOA1FRMDvTq3s8Q+tQQ5+XwYkftJGvTs3SDorbydKeeyHM70zKpv
 DLNoMWjdaZZVg==
Message-ID: <3cce6dc0-bb37-9118-9fee-c2f202826963@denx.de>
Date: Tue, 18 Apr 2023 21:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] drm: bridge: icn6211: Only warn on invalid chip IDs
To: Jagan Teki <jagan@amarulasolutions.com>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
References: <20230418122205.16632-1-fusibrandon13@gmail.com>
 <CAMty3ZDNv3u+Ye_V6m+zLNnNQM5_2=CfFOuOzmO9bHti8VCuJA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZDNv3u+Ye_V6m+zLNnNQM5_2=CfFOuOzmO9bHti8VCuJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: tzimmermann@suse.de, sam@ravnborg.org, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/23 15:42, Jagan Teki wrote:
> On Tue, Apr 18, 2023 at 5:52 PM Brandon Cheo Fusi
> <fusibrandon13@gmail.com> wrote:
>>
>> Avoid aborting chip configuration after reading invalid IDs and
>> instead issue a warning. I have a bunch of these chips and they all
>> report "Vendor=0x00 Device=0x00:0x00 Version=0x00" but are successfully
>> configured and go on to work just fine.
>>
>> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
>> ---
>>   drivers/gpu/drm/bridge/chipone-icn6211.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> index 0e37840cd..39de9a7c7 100644
>> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
>> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> @@ -361,8 +361,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
>>                  id[0], id[1], id[2], id[3]);
>>
>>          if (id[0] != 0xc1 || id[1] != 0x62 || id[2] != 0x11) {
>> -               dev_dbg(icn->dev, "Invalid Chip IDs, aborting configuration\n");
>> -               return;
>> +               dev_warn(icn->dev, "Invalid Chip IDs, configuration may fail\n");
> 
> Did you test I2C-Configured ICN6211 or non-I2C-Configured? if it's
> later then better to fix a valid ID for it or if it doesn't support ID
> then a handle via quirk would be a proper solution.

The ICN6211 should always be accessible via either option. If the ID 
readout does not work, the bug is likely in broken DSI command mode on 
whatever DSI host is used, or, the ICN6211 clock are misconfigured.
