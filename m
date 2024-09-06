Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B9F96EDC7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABB910E9B2;
	Fri,  6 Sep 2024 08:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RcHa/+l+";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="VTzYYLNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Fri, 06 Sep 2024 08:24:48 UTC
Received: from a7-46.smtp-out.eu-west-1.amazonses.com
 (a7-46.smtp-out.eu-west-1.amazonses.com [54.240.7.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDED10E9B2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610656;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=5Wb8fP1SEMFE6J1hco629bsm8w9ZG7Mlhn8OcjaJNVo=;
 b=RcHa/+l+DOBAVoa5TU8sKEbZ2RoOrayZl6FYJIZpncFsGRSW6hkVqo8X0X5pbg/c
 ySnV1UBHh71xdIlqyh+C1ZpotRBts8tbHFwD3Z0T+UZeAcFCMdatoJG1BBrHmOOSLnW
 UKmp1gD5Z6NdMmpZhjjKU5bnTMK17twPYiZY+HmY5gJy0Lbgng9lqFnLtrZt81J0MrH
 ZQDQsLIguCzeS7E8mJBNi7bh96LLLSa7XIQ5C3VM/sibaWjSQhAiP7ZRiWrWohwPb9k
 Imk8Adthfr/s/egcEx7iPaPN97ZCW/uoWF/TtsO+heNo7EH3A7ySj58bsd0TkZiU6SN
 dnD8pPNtmQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610656;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=5Wb8fP1SEMFE6J1hco629bsm8w9ZG7Mlhn8OcjaJNVo=;
 b=VTzYYLNuMnj343jmhvymhUF3UBDLYeg0IHWy/sjm2BenIgksQrOOtJ7rXr8A5LON
 pn0/0SDI8fGzrMP87AZ1WscwGB7B96cneacJ2giOcf6v71S9RNqeYJ/368NJHIKvVg7
 9hgxLLKYn1AKxHZd7YqGlB+IzrzG+L/FmTIW9VDw=
Message-ID: <01020191c669040b-0320e5c0-d4b2-4241-a403-09ec32f7ef35-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:17:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soc: mediatek: cmdq: Remove cmdq_pkt_finalize()
 helper function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Moudy Ho <moudy.ho@mediatek.com>, 
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-4-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240901143259.16849-4-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.46
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

I'll pick this one after the media patches will be mainlined to avoid issues.

In the meanwhile, mainly as a self-reminder:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


