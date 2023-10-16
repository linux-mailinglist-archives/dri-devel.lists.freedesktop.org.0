Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9836A7CA10F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 09:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC4610E129;
	Mon, 16 Oct 2023 07:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49FC10E129
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 07:55:08 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F7A56607285;
 Mon, 16 Oct 2023 08:55:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697442907;
 bh=Hw/1U1YBl+D02Eq2vlklAKGEowzhCs7qY+uoAbH7NQY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mGufDXs98MhuhzR+u3zf2PtniyqEwDciCV/Nzd2JHBNs/vsRNZrcECmmpYdiUoEk0
 ml0xwaR2Y7J9Y5B90BokwGr4JxbJxZvc/cE6vkdcJ5Iuy/OsUvEUN/qzYyPpx4S9RD
 W3716ERYdtNQ6iucVEyDbS1V62+/m2GAEMtPjMfdDS82aBz9WCrSpMYWXcbVTbMX96
 PPqdS7Xz3gupbI0Tg8SoIc66Brbe6nmhrJQtDgCc3MBqtqOtPXHd53209EmTf3jJjl
 VZO3wFrAoxcP+6t7eP1PwRCmulTmLhNp89j940cHO93H56J1+307T8s/JkmsG0NoZu
 zaJzLdZQxL2QA==
Message-ID: <5b843706-8ec3-6de6-de24-ddde5349db57@collabora.com>
Date: Mon, 16 Oct 2023 09:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v11 06/16] drm/mediatek: gamma: Use bitfield macros
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
 <20231012095736.100784-7-angelogioacchino.delregno@collabora.com>
 <3399bf15a6e3d3d4ed5228c858b06c7b28b40aea.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3399bf15a6e3d3d4ed5228c858b06c7b28b40aea.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/10/23 06:00, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2023-10-12 at 11:57 +0200, AngeloGioacchino Del Regno wrote:
>> Make the code more robust and improve readability by using bitfield
>> macros instead of open coding bit operations.
>> While at it, also add a definition for LUT_BITS_DEFAULT.
> 
> When I apply, I would remove the description of LUT_BITS_DEFAULT.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Sorry for forgetting about removing that from the commit description after
removing it from the code.

Thanks for removing it while applying, that simplifies my workflow.

Cheers,
Angelo

