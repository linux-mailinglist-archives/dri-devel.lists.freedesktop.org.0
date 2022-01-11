Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F748AC20
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 12:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD1D10F14B;
	Tue, 11 Jan 2022 11:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A23510F14B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:06:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 776741F43F66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641899160;
 bh=HrxQbDIhsm2WebOMeG8xU6zQC8Wui+ntZtYG/xinG4Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mcIZ0zhem1thW68bzJExY3avXN7EdpgHkyph9+8oWf9bj/33fOSbjg4qd3H/M6fRs
 nc8RFw18/KAN9dPVSFtGuaJBwxgLe9IyXJTi9o5fbyf4XTN4qXo80wNOMfGac9dOMD
 KOKw9B/JPZ+F6cQfey1fAOpAruW51SbNuRQL03Tzi4U9hyOCkc4tGW7Y3GQ1rCe534
 U6MUszzl6/7RFG5bG3EItCHKc/EWd7yHe9TQt2UkzM1/xbIms7aAGD9tfCCEYQrXOn
 5UM64bnOr5t69Jtci7NR+W+3GACpnbVfuF9BvxwZ8B30bNMpZjvuPDxTIKzTd284l2
 ynLAwX/H23wKw==
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org
References: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
 <c0279078032bae61e6c1d70be74d1fb8c528083f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8a87c97e-fd58-bc73-44a6-0055b86cd7ea@collabora.com>
Date: Tue, 11 Jan 2022 12:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c0279078032bae61e6c1d70be74d1fb8c528083f.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/01/22 06:22, CK Hu ha scritto:
> Hi, Angelo:
> 
> On Tue, 2022-01-04 at 10:59 +0100, AngeloGioacchino Del Regno wrote:
>> DRM bridge drivers are now attaching their DSI device at probe time,
>> which requires us to register our DSI host in order to let the bridge
>> to probe: this recently started producing an endless -EPROBE_DEFER
>> loop on some machines that are using external bridges, like the
>> parade-ps8640, found on the ACER Chromebook R13.
>>
>> Now that the DSI hosts/devices probe sequence is documented, we can
>> do adjustments to the mtk_dsi driver as to both fix now and make sure
>> to avoid this situation in the future: for this, following what is
>> documented in drm_bridge.c, move the mtk_dsi component_add() to the
>> mtk_dsi_ops.attach callback and delete it in the detach callback;
>> keeping in mind that we are registering a drm_bridge for our DSI,
>> which is only used/attached if the DSI Host is bound, it wouldn't
>> make sense to keep adding our bridge at probe time (as it would
>> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
>> that one to the dsi host attach function (and remove it in detach).
> 
> This patch looks good to me, but please add 'Fixes' tag to note to
> which patch this patch want to fix.
> 
> Regards,
> CK
> 

Hello,
unfortunately I couldn't find a valid commit for a Fixes tag. This
started being an issue at some point, when the DRM API was changed to
adhere to the documented probe sequence: the MediaTek DSI driver was
not the only one that got broken/affected by these changes.

If you have any advice on which commit should be tagged, I'm open for
any kind of suggestion.

Thanks,
- Angelo
