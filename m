Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F60992A51
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 13:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD6110E1FC;
	Mon,  7 Oct 2024 11:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="MZM5fjg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047310E1FC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1728301024; x=1728905824; i=markus.elfring@web.de;
 bh=NAdvvRci/qH4SyInWfc5eb3BE9V/ablTONBTVmrRJpI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MZM5fjg3r3b+Qfx69A56uNXYK5YgB1UvO5CZ+KxNBJF2ng/w43pcbmIhvm0cwGT4
 OsCXF63Ohax1Vt4gefZQzDSpW1mS36r1JQJGulmM8W98RZkPVNSZYNTma5wi2Yo7b
 GSJRNvIkeLVHdC2C8pPVYPwTI5ydQsJ+t+ljJwYYF3k+StDwX10ycnAHk6jClqaar
 WjIXYw4MVxloCrN0bDYraX3mRuACbgsoVKZXonZhDLARuqTh0C+3oeEIMPwpfeLmJ
 p5LHzya0AiC2Yj59IWTQB+Vi/nNyv2ppaRikFS5xG35AvvkSxafWA2SY4FVkETBcF
 aWZBIkHIEKqfAmbXbw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MDv9a-1t7hgB3sMG-00BYNo; Mon, 07
 Oct 2024 13:37:03 +0200
Message-ID: <81ce44fa-a972-44bd-ae80-6144a8ac4c2f@web.de>
Date: Mon, 7 Oct 2024 13:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Kurtz
 <djkurtz@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Mao Huang <littlecvr@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, YT Shen <yt.shen@mediatek.com>
References: <20240620-igt-v3-4-a9d62d2e2c7e@mediatek.com>
Subject: Re: [PATCH v3 04/14] drm/mediatek: Fix XRGB setting error in Mixer
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620-igt-v3-4-a9d62d2e2c7e@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NUFwNhkscOyDyELqWmI3FAG77svFnNMD9qcpFN+Jv7FYNoq4/il
 Lqkd5arsarOez0n1pZ/3F+SeTSVUjoo6y6MVY+1gBB5CdVnyRKuwDBHo4CQugSvZpaiwI7k
 VYsfKaqBau1PVZH4BWksV9WC2wMEk7JtFHGCUObnqhltQAVSWoa31uEfmkX9m6nlwQuxSV+
 3UK0k+pqVdsKGA202IYLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eoxNj23SWsQ=;o3VmP1ZFXqYQVJFwAVVnskPmFD3
 FarkdV6GJwpSGCaLmZm3vu2EJblANfNpqOD7eXB6V7XX+v6xlHXTLdHpHvFAPIn0uMESmyUcp
 FRQ8fEi69mfLJ/IXR1nw0MwoHYhX1kCtenYg4J/2zjdcetn4ptS9MEIWBuM4xJCdGt/kmv4Un
 /hmp0gMXcCA0MSM+FRxes+HmsJZVAFPPRJdGYw5Mn61Si9TurMnqNDYWowQpwq2K4qFYd9ZoQ
 aX/GSI0YwoqM2/e+klENOn96uSkzTKguV5Ob422AG5+A930Aim0R8Evuv5tRAWsjP8xuf/QqS
 ziG3JETK+v+ny1t1qVetJWw/ZySO+epUYcT1fGMHyH+msWbNHgwnAyf9K+0uIFQgwQG9V75tf
 1FjWC4MSU3rylvpCUQb1ntrpdJe4D1ZVN9BRXJ8JfCvMUlRVlewOVW370+GqNow4JF2xYR6tm
 0qK3V9V0ok/ma8PPjHfslD5Vv2qBMTt93tuR9p0u5Y88c9mwBwiFS1S06Jeb6koHIcZg2a+Hs
 3X/itD/WtHAeHcVp2I1D4ClCH5AW3yH1huFYWR+pBjZ1qFB7D7b3sE4fYK9IstdKYiVW2uLKP
 U4nnjzMFpHT0uZZq8A7C+xni5CyLKz6eTWKlB/kyIb++H5B3c4nLgxLsxlgKntcgoyNHzMNfo
 fJsEwBr5b8Y7SOlJFzK83QLS+t/FM4W59GhJPyy0bFtt4hjx/4ZVXhr3lywy487KOe3xDj3AC
 MloT8TOcpaCcvQcD/x/EIsf2ud8mcMEKRs4qqrWrB0RXgHj5ntiae8dW8/povxGcI9SXaU+Zu
 mESKha9BOBE/RPYSX9opQUsg==
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

> Although the alpha channel in XRGB formats can be ignored, ALPHA_CON
> must be configured accordingly when using XRGB formats or it will still
> affects CRC generation.

  affect?


Can such a change description become a bit nicer with an additional
imperative wording?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.12-rc2#n94

Regards,
Markus
