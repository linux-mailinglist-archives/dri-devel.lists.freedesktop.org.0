Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7624A80BF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BF010E876;
	Thu,  3 Feb 2022 08:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E1810E876
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:58:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5205881F7E;
 Thu,  3 Feb 2022 09:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643878710;
 bh=mYLlDTbpMu4ZV09yoOKfFSWE1aeIDjak9o1eBtEgN08=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=IW22qVMabewi3/BMrGTuErCqxrR+SZREG3x16PtDd1hkeHaB+oog/UZA5dM8f6R9R
 FKbNh99yuRVvIKxipdi6TTSvcgvPeyIzf2bCVcYvfSk+IYWkbPO8XfR+EnK5c1t5A9
 L+YiokDBrVS1YXxdwXDx8qNV5zLkxcaC4XVOYzfYBoaJLxr8fOE20vZTWfqIRwYi9B
 gqumurCgqdK1ENJZlhLIzslZEM+gDD5kdF7hth803N7oIgcUOW5VQoRl4580o4VZX1
 qoMSz+3A2fmdZ/Et3mFkYfF2ilMeHrnuDqnbQWsG2Me8fs5/2vYw+Jc4NIqB85MuCH
 xkENZE0Igyekw==
Message-ID: <4391555e-b6f0-a5ee-1b66-1366d9d0f717@denx.de>
Date: Thu, 3 Feb 2022 09:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: (EXT) Re: [PATCH v2 1/2] drm: mxsfb: Use dev_err_probe() helper
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
 <20220202081755.145716-2-alexander.stein@ew.tq-group.com>
 <af6895d0-8514-f151-2675-2454cd15deeb@denx.de> <2756789.mvXUDI8C0e@steina-w>
 <fe130a61-a93d-ab30-f7e8-dab69a289d46@denx.de>
In-Reply-To: <fe130a61-a93d-ab30-f7e8-dab69a289d46@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 10:03, Marek Vasut wrote:
> On 2/2/22 09:58, Alexander Stein wrote:
>> Am Mittwoch, 2. Februar 2022, 09:29:20 CET schrieb Marek Vasut:
>>> On 2/2/22 09:17, Alexander Stein wrote:
>>>> Use the dev_err_probe() helper, instead of open-coding the same
>>>> operation. This also adds a nice hint in
>>>> /sys/kernel/debug/devices_deferred.
>>>>
>>>> Reviewed-by: Marek Vasut <marex@denx.de>
>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>> ---
>>>>
>>>>    drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> V2: ... what changed ... ?
>>>
>>> (probably nothing, since the patch still looks fine)
>>
>> I put the changelog into cover letter (0/2). Content hasn't changed, I 
>> just
>> added your Reviewed-by.
> 
> I missed it in the cover letter, got it.


Applied to drm-misc/drm-misc-next , thanks.
