Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157EC7A19DA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 11:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF1D10E5FD;
	Fri, 15 Sep 2023 09:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3658910E5FD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 09:02:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8301E66072BB;
 Fri, 15 Sep 2023 10:02:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694768546;
 bh=SETywAy77nay+2dj9q5+6oCiUOOHaWMn0eTNWs9LtXw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L9gnLm0qbJiGA9oC9AGXDP1uhEorCm8fVLop7GIWlAHmBPZzB0TS07CvAkdJS1YEA
 QjBTqSAnmfYRfweLfY8g8dveRtX5VuHl7c3MLhwBDX5cofBS+uJLJG5b02ftcLVNio
 322MfICu9U/deVTlVdJJEIfGFOAA3iQsxo9xkLpmiQrzAls2rq2cz7NmmeSpJ0fHTb
 0Vv9Pzm9RmW6Wj6dk9LOOC5CluO3xOY5YfNmRGx7A9g0OmO+lWpKNxSf6ASBl4w8WV
 VvxfdWS+bgaCipcUUxqdua2YgEsmUKRFU5IaopqmecFya7JF1/O5t+k65hg4Cd9Quf
 uRzdbQjcb4IHQ==
Message-ID: <9b0dde15-12e3-713e-a2f9-9b2534691476@collabora.com>
Date: Fri, 15 Sep 2023 11:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/mediatek: dsi: Fix EOTp generation
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
References: <20230915075756.263591-1-mwalle@kernel.org>
 <0a184b35-133b-483c-d475-01120fbdc2ca@collabora.com>
 <eb1f4f78be9b2da3ae2d54ec9417f2f7@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <eb1f4f78be9b2da3ae2d54ec9417f2f7@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/09/23 11:01, Michael Walle ha scritto:
> Hi,
> 
> Am 2023-09-15 10:58, schrieb AngeloGioacchino Del Regno:
>> Il 15/09/23 09:57, Michael Walle ha scritto:
>>> The commit c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register
>>> definition") inverted the logic of the control bit. Maybe it was because
>>> of the bad naming which was fixed in commit 0f3b68b66a6d ("drm/dsi: Add
>>> _NO_ to MIPI_DSI_* flags disabling features"). In any case, the logic
>>> wrong and there will be no EOTp on the DSI link by default. Fix it.
>>>
>>> Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register definition")
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>
>> Hello Michael,
>> your commit is missing a small piece! :-)
>>
>> Besides, I've already sent a fix for what you're trying to do here:
>> https://lore.kernel.org/linux-arm-kernel/07c93d61-c5fd-f074-abb2-73fdaa81fd65@collabora.com/T/
> 
> Ahh thanks, didn't noticed this. If not already applied, I'll send
> a Tested-by: later.
> 

No worries, it happens.

Cheers,
Angelo

> Please disregard this patch then.
> 
> -michael

