Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD597A66D7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 16:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53AC10E26C;
	Tue, 19 Sep 2023 14:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9944F10E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 14:37:45 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93F996BE;
 Tue, 19 Sep 2023 16:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1695134168;
 bh=Zc434qsEsOoFPleCU63FtQBjVVkLzw/WFLkeX3loSGg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TgR89Fw/vqMQMRY2+kvK+eYS/duvriso6dDZhJ8vElHnwgqH4R3TlhHMoPSaDWAt6
 Sx3SXuOm7XMhJLZb9RSs5Z+FAP7P0Qh4lD4FzpVN13ccn9bgWpA2x3Y/hqEpKXxZlz
 UIu3iv4YDKbRpp3PPGRVNEOTihELtUTatujAWKqY=
Message-ID: <1446fc0e-980d-945f-9642-acbb5dca8a1d@ideasonboard.com>
Date: Tue, 19 Sep 2023 17:37:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH -next] drm: xlnx: zynqmp_dpsub: Use devm_clk_get_enabled()
 helper function
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>
References: <20230825072324.2809260-1-ruanjinjie@huawei.com>
 <20230829075529.GB4698@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230829075529.GB4698@pendragon.ideasonboard.com>
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
Cc: Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 10:55, Laurent Pinchart wrote:
> Hi Jinjie,
> 
> (CC'ing Tomi)
> 
> Thank you for the patch.
> 
> On Fri, Aug 25, 2023 at 03:23:24PM +0800, Jinjie Ruan wrote:
>> The devm_clk_get_enabled() helper:
>>      - calls devm_clk_get()
>>      - calls clk_prepare_enable() and registers what is needed in order to
>>        call clk_disable_unprepare() when needed, as a managed resource.
>>
>> This simplifies the code.
> 
> While this indeed simplifies the code, I think we should instead control
> the clock dynamically at runtime.
> 
> I don't have access to the hardware at the moment. Tomi, would you be
> able to give this a go ? I can also write a patch and let you test it if
> desired.

I have a small patch that adds runtime resume & suspend callbacks, and 
enables & disables the clock there. But the driver doesn't seem to do a 
proper job of power management:

- It accesses registers without pm_runtime_get
- It initializes registers at probe time, apparently presuming that the 
IP is never turned off, which might cause registers getting reset.
- It uses pm_runtime_get in a couple of places where it's starting the 
video stream, but it seems to forget that there's also the DP AUX and HPD.

Then again, as the HPD is, I think, supposed to be always enabled, the 
device is also always enabled, making the PM management a bit pointless.

I'll look at this a bit more to see if I can sort this out.

  Tomi

