Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5025D96EDB3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9600910E9AE;
	Fri,  6 Sep 2024 08:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aSU5dIMI";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="ceBrJR0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Fri, 06 Sep 2024 08:23:01 UTC
Received: from a7-44.smtp-out.eu-west-1.amazonses.com
 (a7-44.smtp-out.eu-west-1.amazonses.com [54.240.7.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C772810E9AE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610545;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=yM3jGEYrmpmAPT0rz7opuwruNthFWSkw9+TDL4YVBDA=;
 b=aSU5dIMIVZa+cVJ8YC9WRBz0bUv9ZRkWK5nvrqULiski3hj0PrU0tO8GE0DE5tDo
 tJYkolI1oPcFUfhre3qb8194/JecXFEhraqDF6BGAvjeLDCEN5BkjskujGkw787lkOT
 JhRTqG+8JEPJbuXqi8WS0M4KPo3oeYmR2FNm7ITIAyt6v/4rjAtGbEMhA3nF/r/aSvi
 cvJF3ozvVIhef+8lnEZd7mQykkA6R5favg/l1EJL46lVMIoLa/YccaPcYzHbhSY3ncG
 Si6+iKezpPy5tKLOBX5ZsfXB8Y29Xx+BGuNwtu2ZKwyN4h72SZWyU5Lu12NHxsRBeNj
 qmH0hFNeMQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610545;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=yM3jGEYrmpmAPT0rz7opuwruNthFWSkw9+TDL4YVBDA=;
 b=ceBrJR0YS4QJudMIU1bumx8QW4TjyLwKO/B5IlDefuyExI/7A3gSeecXmcnWI0xG
 IIa1I1+32mFPri3a5FyfqIv201Os4uSGsCSfe0+dXcZR3SV4XhjNg8yiKis28mT1GrA
 LNjnn7XFJjm6ktDTZhX3qWys+vrNabuz4qn9mLEc=
Message-ID: <01020191c6674f69-5391f772-bfad-44bd-884e-c3ce732c19b5-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:15:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Moudy Ho <moudy.ho@mediatek.com>, 
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-3-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-3-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.44
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
> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
> instead of implementing mdp3 version.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

