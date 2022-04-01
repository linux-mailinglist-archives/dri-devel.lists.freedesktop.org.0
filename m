Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEE24EEC84
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 13:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3177D10E0CD;
	Fri,  1 Apr 2022 11:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5681110E0CD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 11:46:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2C69F80A4F;
 Fri,  1 Apr 2022 13:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648813608;
 bh=nVC0eDx3iZtmden+BD24cXZDTf2VN7arEBNzT35k278=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=weHSItn5Mp8rhorUn/IIM6pKvoCLF9zC1qo+nDF99aF963QWZyyYoyoU8KMaJWjFo
 mOw4qdtpwCHTK3oz1fNBXU3xhgcjUh94JDDbyNuUQqv5OkV5fvWxTap7QN7MIzUhkY
 NAmhtAKUnfnE2QnSq6WhSkWYOZVFMnfMnv1VTpPiUiP8jP73BXQsp2gL2oRSj/05RP
 9l1PXwaL0hNFR9UCzcuhIjAucAk8sMWpNRLd4JwVqxGVUyGmWKyv4gOhtGD05cvDvm
 MyzMf+XpyUPZBvYoG/QnmbUDuIN9IeX6MltmIP93PoAgrV738zwb9FAx2lSMVxSqQ6
 UOmRTCd83xrTA==
Message-ID: <39184211-dc6d-c144-5cec-ae79e3b26391@denx.de>
Date: Fri, 1 Apr 2022 13:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Content-Language: en-US
To: Stefan Agner <stefan@agner.ch>
References: <20220322142853.125880-1-marex@denx.de>
 <20220322142853.125880-2-marex@denx.de>
 <4a87d255a7e8e0eb10e16a670f86fdf6@agner.ch>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4a87d255a7e8e0eb10e16a670f86fdf6@agner.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/22 10:22, Stefan Agner wrote:
> On 2022-03-22 15:28, Marek Vasut wrote:
>> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
>> completely different from the LCDIFv3 found in i.MX23 in that it has
>> a completely scrambled register layout compared to all previous LCDIF
>> variants. The new LCDIFv3 also supports 36bit address space.
>>
>> Add a separate driver which is really a fork of MXSFB driver with the
>> i.MX8MP LCDIF variant handling filled in.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Robby Cai <robby.cai@nxp.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Stefan Agner <stefan@agner.ch>
>> ---
>>   drivers/gpu/drm/mxsfb/Kconfig      |  16 +
>>   drivers/gpu/drm/mxsfb/Makefile     |   2 +
>>   drivers/gpu/drm/mxsfb/lcdif_drv.c  | 367 +++++++++++++++++++++
>>   drivers/gpu/drm/mxsfb/lcdif_drv.h  |  48 +++
>>   drivers/gpu/drm/mxsfb/lcdif_kms.c  | 492 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/mxsfb/lcdif_regs.h | 243 ++++++++++++++
> 
> As this is completely ortogonal to mxsfb driver, shouldn't this live in
> its own directory (drivers/gpu/drm/lcdif/)?

No, if you look closely, the MXSFB (i.e. LCDIF) and this LCDIFv3 (i.e. 
MX8MP/MXRT LCDIF) are very similar hardware-wise and they even share a 
lot of code (about 60%). They should be in the same directory to make it 
easier to share common code between the mxsfb and lcdif driver. Look at 
the discussion:
[PATCH 9/9] drm: mxsfb: Add support for i.MX8MP LCDIF variant
Originally the MX8MP LCDIF was a trivial addition to the MXSFB driver, 
but there was a demand to spin it off into separate driver entirely, 
with its own copy of everything. So, here it is. I believe there is 
potential for deduplication though.
