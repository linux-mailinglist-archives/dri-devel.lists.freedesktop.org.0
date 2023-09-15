Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F87A19D4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 11:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29A110E21B;
	Fri, 15 Sep 2023 09:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7277910E5FF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 09:01:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8E78FCE2A7E;
 Fri, 15 Sep 2023 09:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBCFC433C8;
 Fri, 15 Sep 2023 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694768488;
 bh=C6/KXGgH6tHW8U29QI5yRNYeBy8iAPkFYoHh2nhVIeE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WPvuu1ayMIwkplILF+8RvITgsrg7/Wvs1Iwc3LHh1mIXGDDRUhm/tfbWc+4lyGnKN
 CNQYy9b842a0bcuKVnkc21PyOp6bxS+PFZYOiC+o/DB5aHsHYUQFP6J19cnMx/Vlrj
 X5l34f0piINXbj9eckckZWtIHDucJDC7kkQDMjrI2Nde6wzpLUZb3S3vs2YE4wozMq
 /QPNt5DTjMrDqSanhH7n2ADwUcjLMQxBeY3HqGKf6aL3ShkHaWx3ScPToYTMdRw6WQ
 MqVON4LDNJXTpFK8EgCGq+IIOcJ7oLsMB6foNFveqhgxArQ/IBiu5IEHwK8xNOh9uG
 mAlfV32+fAeyg==
MIME-Version: 1.0
Date: Fri, 15 Sep 2023 11:01:24 +0200
From: Michael Walle <mwalle@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Fix EOTp generation
In-Reply-To: <0a184b35-133b-483c-d475-01120fbdc2ca@collabora.com>
References: <20230915075756.263591-1-mwalle@kernel.org>
 <0a184b35-133b-483c-d475-01120fbdc2ca@collabora.com>
Message-ID: <eb1f4f78be9b2da3ae2d54ec9417f2f7@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

Hi,

Am 2023-09-15 10:58, schrieb AngeloGioacchino Del Regno:
> Il 15/09/23 09:57, Michael Walle ha scritto:
>> The commit c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register
>> definition") inverted the logic of the control bit. Maybe it was 
>> because
>> of the bad naming which was fixed in commit 0f3b68b66a6d ("drm/dsi: 
>> Add
>> _NO_ to MIPI_DSI_* flags disabling features"). In any case, the logic
>> wrong and there will be no EOTp on the DSI link by default. Fix it.
>> 
>> Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register 
>> definition")
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
> 
> Hello Michael,
> your commit is missing a small piece! :-)
> 
> Besides, I've already sent a fix for what you're trying to do here:
> https://lore.kernel.org/linux-arm-kernel/07c93d61-c5fd-f074-abb2-73fdaa81fd65@collabora.com/T/

Ahh thanks, didn't noticed this. If not already applied, I'll send
a Tested-by: later.

Please disregard this patch then.

-michael
