Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2CB976547
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 11:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B8410EB27;
	Thu, 12 Sep 2024 09:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aCUFUUto";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="XNjiDcpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 447 seconds by postgrey-1.36 at gabe;
 Thu, 12 Sep 2024 09:12:38 UTC
Received: from a7-47.smtp-out.eu-west-1.amazonses.com
 (a7-47.smtp-out.eu-west-1.amazonses.com [54.240.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBBF10EB27
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 09:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726131909;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=cU5d1gV2+5V9tfSQ7PLewaaCXoMfhGGhE2QKuS1Cbb4=;
 b=aCUFUUtoA6CaviWyQUW8BFB5LSp7jxDQJASTzRZyljZ2NGVHgwHPy+yFMvrrZkli
 sigAY1NBIXlivAa+SiEDhWg3TOmEtvdqiww7YuI/A9aa3aLihWSbQAxVeYeQ5LxOyQ/
 HqV2DtubHM8UH4WEuxClMOmZ6dofFu53NQdNCjoFHxGpPXe2kNBctzJauPskY0vWEnr
 MR9A9d5JxsN8ynf6nnv/1bU1DBALmQRvc/ovzd9DDNtzaxz59fXmQbEXPEcq2wzhWmD
 WWseEc+rRCqekmVGCbVHIV7xfCSnB/LEFNdbEll/G8HawdAe8az+PfZ6TkZMmyLUofC
 XRULCmMBnw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726131909;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=cU5d1gV2+5V9tfSQ7PLewaaCXoMfhGGhE2QKuS1Cbb4=;
 b=XNjiDcpCvS80r6n8buYYjtUVfC+b8ki7uKSY1vF2aSJnotG1AYmi/hnkmG1WjRat
 KLNSgdZr3+133CzYSs/PJYGlm+bC86tKUKjBbtnz93qszw4TzDKgqwrIv/Oicdyjntt
 25hZtya2gSfxhvKHG9k5M12xVfY6bBA1VG4eILgQ=
Message-ID: <01020191e57ab41a-424e6c2f-08fb-43db-b45a-af4aaa22ef0b-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 09:05:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix potential NULL dereference in
 mtk_crtc_destroy()
To: Dan Carpenter <dan.carpenter@linaro.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-janitors@vger.kernel.org, 
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
References: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.47
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

Il 12/09/24 10:44, Dan Carpenter ha scritto:
> In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
> set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
> we do not call cmdq_pkt_create().
> 
> During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
> is NULL first before calling cmdq_pkt_destroy().  Calling
> cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
> it will result in a NULL pointer dereference.
> 
> Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


