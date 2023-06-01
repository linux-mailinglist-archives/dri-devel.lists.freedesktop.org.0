Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07557199DC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 12:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35DA10E21F;
	Thu,  1 Jun 2023 10:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5BE10E21F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 10:33:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 00FFD8613B;
 Thu,  1 Jun 2023 12:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685615630;
 bh=AECCp7LwHGK7d+QkptwzKqNMdTfwVKeElkPGX7DMlSQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TIoEt1F0rDdJDvQl815yusb+c12mYwBYHMqyY0sW/8WR23CgniiErjLBqUEAlDTE4
 Vdz5zAcCTQUdt/xM9lNuzPdTZRJ9k2UyAYIebLzEAOxG/Vb/WzRtHOqye68wRcQOHt
 3i+EoxAvELtFf8eU2tmTllgk+nJDPCcOnDbTdjPTWVGuBUDj6O5kCft7R6Y2+557y7
 25djIZ8sjia1w2mONf5a9mUFYvV1r47XJOaoMzpgunCdR7cJFnmdKypCzHlFO6XsAf
 LV2GcWo4U0iCcXrLWkUBMFSHy4L4oXawYIhIpfyYIQAAo5vG9KW6E5gVx3rInSh8ZT
 RyLua9N1RQ1uw==
Message-ID: <62984473-389f-1078-c914-550b8a193e5b@denx.de>
Date: Thu, 1 Jun 2023 12:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm: lcdif: force modeset when FB format changes
Content-Language: en-US
To: Ying Liu <gnuiyl@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
References: <20230531184527.1220305-1-l.stach@pengutronix.de>
 <20230531184527.1220305-2-l.stach@pengutronix.de>
 <CAOcKUNX86mqvpsT5LgertJcqdXCftTBEPRnA6dCuBrOXyv+=hQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAOcKUNX86mqvpsT5LgertJcqdXCftTBEPRnA6dCuBrOXyv+=hQ@mail.gmail.com>
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
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/23 08:24, Ying Liu wrote:
> On Thu, Jun 1, 2023 at 2:45 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>>
>> Force a modeset if the new FB has a different format than the
>> currently active one. While it might be possible to change between
>> compatible formats without a full modeset as the format control is
>> also supposed to be double buffered, the colorspace conversion is
>> not, so when the CSC changes we need a modeset.
>>
>> For now just always force a modeset when the FB format changes to
>> properly reconfigure all parts of the device for the new format.
>>
>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> ---
>>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
>>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> LGTM. If the patch shows up in dri-devel patchwork, I can get it, test
> it and provide my R-b tag if appropriate.

Aren't these two patches the ones you are looking for ?

https://patchwork.freedesktop.org/patch/540443/
https://patchwork.freedesktop.org/patch/540444/

Maybe PW didn't sync when you checked, it takes a bit of time for 
patches to show up.
