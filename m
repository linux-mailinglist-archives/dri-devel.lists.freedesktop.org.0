Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9796EDB1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EE810E9AD;
	Fri,  6 Sep 2024 08:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kUFFKTHH";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="H4SOWUe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 395 seconds by postgrey-1.36 at gabe;
 Fri, 06 Sep 2024 08:22:23 UTC
Received: from a7-43.smtp-out.eu-west-1.amazonses.com
 (a7-43.smtp-out.eu-west-1.amazonses.com [54.240.7.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFC710E9AD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610546;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=c6Ae/CSZxtzebGJwopcs50GFm8MBKWaLfuixS2uzqMg=;
 b=kUFFKTHHBd/JqEo+8xtUNUiXSTdiKf1TVC21fUrLGXz912Wp7bTIpwt3o4aMlXN7
 eI3CaYLsoOg0sn7ECQkYLryyqyiJ0F9BcBkYN9pY+h6XjciEqvZyH0rZOQT0Pa9xNFS
 rQZr1+to56I7wILAZJVVJX6XoMuWG7BGi+PHigEaEiRgrDL2+8fy/vKhnILqcqVL+2w
 GtYhzrQx/PBCEeo1FD0egxIPrwO0HzCGidQ7wZX9cCtrpj8BO/30HOdwWCnD/f7hTye
 DPktdonfuIBZMxKbFA4FVradAcr4E5HntroxWs4MyQMW9U5idKwodeFciA6NgU6+lkQ
 BnQcE/7qBQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610546;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=c6Ae/CSZxtzebGJwopcs50GFm8MBKWaLfuixS2uzqMg=;
 b=H4SOWUe8qRqlOzVrsykccb12OFxX8XUYslSv0/QIq/FiNVwLK30PLKhfdFgt3dvK
 +urQXrGjVP06HCGzU6GfFJdzx9fq00WBGMXlDBw3SkeDpjwfp4ZIeYy/CHU8P8rTSw4
 UtVp/4Ay+RHL0tncUd+2RL8kzP4rR+8EVhf59Vjk=
Message-ID: <01020191c667530a-66e8f4db-1b0e-46d3-a69b-3362e84e0f02-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:15:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: platform: mtk-mdp3: Get fine-grain control
 of cmdq_pkt_finalize()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Moudy Ho <moudy.ho@mediatek.com>, 
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-2-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-2-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.43
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

Il 01/09/24 16:32, Chun-Kuang Hu ha scritto:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


