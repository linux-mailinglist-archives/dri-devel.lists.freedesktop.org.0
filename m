Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD37998468C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 15:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D242010E6BC;
	Tue, 24 Sep 2024 13:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="vmjSPgmG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9F010E6BC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 13:12:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2A5D488363;
 Tue, 24 Sep 2024 15:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727183534;
 bh=DRU/cZ7ys2vNvnn5GxJewD+OdUTeyoFQ0VsBt7f/Egk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vmjSPgmGRaFAnOrry+S9EpbnEpf7b+ZOCIPwTv/RFwc8cIt1rTFbuPlgtu7KAdx05
 eQXRI+Ln85yYO2bJULn2PIxKSpNDJr1QFK1yqFVVtpVCuBNrJHCu+7TOUtaSQuTokm
 zu1XdW9oy+iI5bYVKZZu4rpuChn9MIU/gQvaympYvjoz2JCcOESEEx34O1B8kzGhHk
 IH4Otwz12Jk6dhGtMLAWLSNHTWrkB0VbXEcYlLCewTur9TlRkfyZET2N+SP7ikIMy1
 ROoliO29kbKLl4naoBX7YHf+NtA2fdqB28lVNQ2t6isLe4cQRH5Wdpklg8FJytwf1y
 yhizP3oGT17zQ==
Message-ID: <546c9dac-39ab-4abe-a495-ab54d6ee925d@denx.de>
Date: Tue, 24 Sep 2024 12:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpu: ipu-v3: vdic: Simplify ipu_vdi_setup()
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <95efd6b6491069d04b4bfae6616d9a43ba8467a6.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <95efd6b6491069d04b4bfae6616d9a43ba8467a6.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/4/24 11:05 AM, Philipp Zabel wrote:
> On Mi, 2024-07-24 at 02:19 +0200, Marek Vasut wrote:
>> The 'code' parameter only ever selects between YUV 4:2:0 and 4:2:2
>> subsampling, turn it into boolean to select exactly that and update
>> related code accordingly.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> I'd prefer this to be an enum ipu_chroma_subsampling or similar,
> instead of a boolean. Otherwise,

I'm afraid this introduces unnecessary back and forth conversions 
between the boolean and either of the two enum ipu_chroma_subsampling 
values in the code.
