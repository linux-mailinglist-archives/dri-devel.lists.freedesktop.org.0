Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C356F0806
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 17:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17A010E2B9;
	Thu, 27 Apr 2023 15:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5630E10E2B9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 15:15:23 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EDD7B66032B5;
 Thu, 27 Apr 2023 16:15:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1682608522;
 bh=wx4QwWQd9NsnskAEPQUncauUhMSHJCUjAMBurj5VCPw=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Jm/XTqkVdeGNCtWpZpEhTDlndoLNfCkYlhVE0tRHH+AnSHsVTPcFlQUYWKu5Q7O2Y
 hpQn5J88h7AS7Aj6hrxV1wJH0yVIBH81FJKTkx/4JEgSD9br9/nP2VIs/Jouzq4+GZ
 +XhVlV4yCgAdpn+yWv6IoqMBabKshxpvQcen9A/Lv0BicMihifmbxjDiUQqL7CQqPx
 q5gu7ZjrTVBE+6HLa/d7p4V+n6cQnigJR3HzoyjvPAMCjihPRFukIkbQzciS8/3Rnv
 OttUxoMFyh7orzPjG2FgdrOVgjsqJHBE88TBNtK25tiRtZZyaTAdt/Dvn8gdxmP4vu
 92WRXZjLmQjBg==
Message-ID: <17525028-80bb-cd03-fbc9-b8ff65378517@collabora.com>
Date: Thu, 27 Apr 2023 17:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 0/9] Add gamma lut support for mt8195
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <c6a12ebc-99f1-855d-e366-e5a4833dc562@collabora.com>
Content-Language: en-US
In-Reply-To: <c6a12ebc-99f1-855d-e366-e5a4833dc562@collabora.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/04/23 13:43, AngeloGioacchino Del Regno ha scritto:
> Il 12/09/22 03:29, Jason-JH.Lin ha scritto:
>> Since the gamma_set_common() function for previous SoC,
>> such as  mt8173 and mt8183, is designed for 9bit-to-10bit
>> conversion.
>> mt8195 is using 10bit-to-12bit conversion, which is
>> not compatible with the previous function.
>>
>> Thus, need to update the function to fit the need of mt8195.
> 
> Hello,
> can you please respin and fix this series on the latest linux-next?
> 
> Besides, please test it carefully: as far as I can see, GNOME Night Light
> (or others) are not working on MT8195 (color temperature/ccorr).
> As for gamma itself, that's not working either; you can test it with a tool
> that will create a color profile by applying a new VCGT table, please look
> at [1] if you need tools.
> 
> We can confirm that color correction works on at least MT8192 (colord), so
> it's MT8195 at fault.
> 
> [1]: https://github.com/zb3/gnome-gamma-tool
> 

Nevermind. I've actually fixed this code and refactored it a bit as well.

I'll push my own version soon. No action required.

Regards,
Angelo

