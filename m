Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D38D1880
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 12:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C924510E28A;
	Tue, 28 May 2024 10:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="uXmoZx45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A4010E21B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716891887;
 bh=eCwSK1GHrFnFt48tdaVfJXIdF4FWIhLcfBXFC1OraC4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uXmoZx45jNRaFuP8GluwtX/dBcGxZBoC2sG3ztrO7Vw/mLyOgR6UHs5a39tVBZlII
 tjM15S11SxO8H3TJvsD6+Ut+EF5A3BM2RLN/3GySr33UwEqLb0DH+bSm9OtW2bwZHA
 ONOPOhmtKh8DTktxE/FsTqxmPJeVm6MBHGDwkenM9P9FvspUPB3kSMpokA5kqdtS7A
 xHSc80R/5YVbiW+DOYJ+5HEccTEXY+0rLu1ow14Qst+fqaeNEGn7iA4LEOg+joW6Re
 U2fA/SCgJqgv4hEz+heCV0YecgNueNj8a5r46HzdaJXIHE90lX7QeJNURxq0oM2/zN
 zarGK7OsgFw6g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 962773782113;
 Tue, 28 May 2024 10:24:46 +0000 (UTC)
Message-ID: <26c862ec-1613-46fc-ba37-5649fd55e159@collabora.com>
Date: Tue, 28 May 2024 12:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] mailbox: mtk-cmdq: Support GCE loop packets in
 interrupt handler
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
 <20240525230810.24623-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240525230810.24623-5-jason-jh.lin@mediatek.com>
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

Il 26/05/24 01:08, Jason-JH.Lin ha scritto:
> 1. Add a loop flag for CMDQ packet struct.
> CMDQ helper will use a loop flag to mark CMDQ packet as lopping command
> and make current command buffer jumps to the beginning when GCE executes
> to the end of command buffer.
> 
> 2. Add a looping task handle flow in irq handler.
> GCE irq occurs when GCE executes to the end of command(EOC) instruction.
> If the CMDQ packet is a loopping command, GCE irq handler can not
> delete the CMDQ task and disable the GCE thread.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


