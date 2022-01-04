Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EBC483F33
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 10:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1705210E549;
	Tue,  4 Jan 2022 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA6B10E549
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 09:31:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E825C1F42D84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641288670;
 bh=9/T8aEfuY7T8xMS1IhnS76wUW+9atSI7kjJyu/iRtDU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dFXEJQPWjXn1LKtamRetcBoBxRdVPu8oc4kUftd9Jg8pxfB1z5Nlxqgo0iB57ZeMn
 uSB2UZEVCQCVlX1C5Ck3Q5lXMr+l9gt15TPjuli6afS/0Zik95yU670XU4vxwASCiF
 LJ7A9681XBMjtLi47dhYvVE/VNDZCOvWT83HBJAczqYntBcGrOfSYmFVXz0fTgUPag
 sXprSVYS6AzsPbL7K/owK40/PXH5Yn3Oxxed1pJDh60jhacnYjNrKVnq5TVJ2i5+FO
 AZA4ePF4eovMo7dq30wXdzWDrHmhWHONLUl6fN7ihMqmTE6agiMgSLvykrIvQymVui
 roAHPRuB4e5lg==
Subject: Re: [PATCH v3, 02/13] media: mtk-vcodec: Using firmware type to
 separate different firmware architecture
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220104080138.7472-1-yunfei.dong@mediatek.com>
 <20220104080138.7472-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <94e51db2-c44a-b2fe-36af-d58c9e5ca29c@collabora.com>
Date: Tue, 4 Jan 2022 10:31:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220104080138.7472-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/01/22 09:01, Yunfei Dong ha scritto:
> MT8173 platform use vpu firmware, mt8183/mt8192 will use scp
> firmware instead, using chip name is not reasonable to separate
> different firmware architecture. Using firmware type is much better.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>

Hello Yunfei,

I agree with this change, it looks better as it separates behaviors in
a more generic way.

Anyway, it looks like you're removing all users of `enum mtk_chip` but, in
this case, you forgot to also remove the declaration of this enumeration
from mtk_vcodec_drv.h! :)

Can you please send a v4 with the requested removal?

so, for v4...
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


