Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4F96EDF7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC9810E9B3;
	Fri,  6 Sep 2024 08:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eFD/OAhU";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="fX/Jydk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 830 seconds by postgrey-1.36 at gabe;
 Fri, 06 Sep 2024 08:27:55 UTC
Received: from a7-33.smtp-out.eu-west-1.amazonses.com
 (a7-33.smtp-out.eu-west-1.amazonses.com [54.240.7.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2CF10E9B3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610443;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=VX7OlLnBt7jfAMupnrzu9AoSfcrke19/MgnbQULyPN0=;
 b=eFD/OAhUGa5sw9pLaicdiqtoY6wLOPI1biF5Wxi58nit79YB+YR36Rv6jMej/GEq
 IciE4Q6NLUxLH//4vNXgmxFlvx+yJ8LnQl/IwqDvNZpPb6VJKPfDbiOkPuffaaMpZHT
 t4trHzi8nnYw3YQETnln1kIJ0NhBRZG53rrMX+vozzla1B6GL2rvIEz9D6uKpTnaaar
 DU/y8yuvLlMoKID0KJsl9CE5oTRgQ5iaQe9gfHVzJncnTUnS/1s9xEHjg58cUJ2g4lj
 WnHFOeHtmg+XcZQL6hRM1EuUK/ZhzT+zRI2LFqeHHOgD8e1RcJEuSNEmjieO36naPuE
 CTz9DvUBnA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610443;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=VX7OlLnBt7jfAMupnrzu9AoSfcrke19/MgnbQULyPN0=;
 b=fX/Jydk1y6+dVBlfSvKcrqhkAlAVAqdnPwf7EzAfbEiZtIQjuMfTKcUauJp/j99e
 vYsA8VTOqrT93Ll54NNjVHeOYlqwER/vyYQ4YWuKgMdmOZCCEvqDyAP+CS6SxPl3jsJ
 s65MA5jq66MD715cIMZDdIrJFo5oA+JWsgDSPcz8=
Message-ID: <01020191c665c261-8b839b39-d297-441f-8b83-49edd60ba752-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:14:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, shuijing.li@mediatek.com, 
 jitao.shi@mediatek.com, mac.shen@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240902133736.16461-1-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240902133736.16461-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.33
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

Il 02/09/24 15:36, Liankun Yang ha scritto:
> Update efuse data for MT8188 displayport.
> 
> The DP monitor can not display when DUT connected to USB-c to DP dongle.
> Analysis view is invalid DP efuse data.
> 
> Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp function")
> 
> Changes in V2:
> - Add Fixes tag.
> - Update the commit title.
> - Update the commit description.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/
> 20240510061716.31103-1-liankun.yang@mediatek.com/
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

