Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F1B9FB90
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA6D10E944;
	Thu, 25 Sep 2025 13:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MtaN07ET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132CC10E944
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758808622;
 bh=eVtI5KuXcf+iFYpz0dJERf2R3K4zLl1HHo6brVgQCa0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MtaN07ET/VwbJQu4G8dyeqXYDtfqBddMTc8oEZHCls7uBSIYJbgHnx2Fzgnxe+rt7
 LSVNgv7S2WaVJQ2lBwoYVsDHyI1MR37vch0hdlS3akdvRPJ4CkKYQSnlQQVpTZCvZm
 FFQVDXEG0bBIjZQdGl49Qy3k9vWX8xjP4hok44wu3DBYYDxFaagtXtsf+yf+uC7QSO
 pGUWf8niVexakTQ9cWYwvRoefqeg3fIDf/nMccECXFBpwHSbdx/4V++OxpkSFzjKgW
 IWEUK9s/AdF1A7WYo6Ds2HHayNod/xtVSvuv/QSAe7/a0GGmJg57rG3YyMQvzdmH9R
 l7QPqppdNPacg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 059A417E0FBA;
 Thu, 25 Sep 2025 15:57:01 +0200 (CEST)
Message-ID: <719dcef6-a360-41cc-a5c5-fdbe53ec99d3@collabora.com>
Date: Thu, 25 Sep 2025 15:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver
 unregistration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com, dmitry.osipenko@collabora.com,
 granquet@baylibre.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 amergnat@baylibre.com, djkurtz@chromium.org, littlecvr@chromium.org,
 bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
 <20250924103708.19071-2-angelogioacchino.delregno@collabora.com>
 <72pgsr4birfy5wtf5umsfkahr7tplnih5wxoj4x33igapaspmg@7iafkarq4hzg>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <72pgsr4birfy5wtf5umsfkahr7tplnih5wxoj4x33igapaspmg@7iafkarq4hzg>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/09/25 03:09, Dmitry Baryshkov ha scritto:
> On Wed, Sep 24, 2025 at 12:37:06PM +0200, AngeloGioacchino Del Regno wrote:
>> During probe, this driver is registering two platform devices: one
>> for the HDMI Codec driver and one for the DisplayPort PHY driver.
>>
>> In the probe function, none of the error cases are unregistering
>> any of the two platform devices and this may cause registration
>> of multiple instances of those in case this driver returns one or
>> more probe deferral(s) in the "wrong" spots.
>>
>> In order to fix this, add devm actions to unregister those and
>> remove the manual calls to platform_device_unregister in the
>> mtk_dp_remove() function, as those would otherwise be redundant.
>>
>> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
>> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayPort aux-bus")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>>   1 file changed, 26 insertions(+), 4 deletions(-)
>>
> 
> You can save yourself from all these troubles if you store the
> registered device at  connector->hdmi_audio.codec_pdev (see
> drm_connector_cleanup()).
> 
> And of course, you might use DRM_BRIDGE_OP_DP_AUDIO in order to reduce
> code duplication.
> 

Fair point. Noted! Thanks! :-D
