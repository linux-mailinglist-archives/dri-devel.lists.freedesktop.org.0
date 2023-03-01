Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082EE6A6A4F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 10:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D5A10E21E;
	Wed,  1 Mar 2023 09:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C1A10E21E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 09:58:23 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 78F7D66020E0;
 Wed,  1 Mar 2023 09:58:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677664702;
 bh=8ndsZkKsreebHEGikuSigtJ8zQTHmJC5HspQV2Bo/rk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AiD+koqnGnT97mYujB5jOi3lxWhakT7ezL9D2aICxDP0RsZl4mEHO0XoDERpBphoj
 7EtdnxQ6NcGtV8SZvsb/AX9KV3vbqD9+ldPLz4OH+zhepu2xvbxHag0z37m70P1sdN
 pOXw5d9NWhVreFRPGlROANDOIH5iVfN83cyBpWJbxVrMZ3AoUPSkoh4JyAUP2SzbMT
 Iy2thheD2P++lWPzCUtDxMtqbdxID036gN/PCNmjLLZb2T7Hskf+j0lO05ECe/a4qX
 JmkqKToNgUHCQxfRkLdMi6Pafafmcah0djwT1tGg8m6od2Mz1NNoQnR2Pk32ojUuLd
 +FCALBYCHFgpg==
Message-ID: <3bcf01ef-e9af-3216-6cd3-7cc08a5bfedd@collabora.com>
Date: Wed, 1 Mar 2023 10:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, Julien STEPHAN <jstephan@baylibre.com>
References: <Y/yBC4yxTs+Po0TG@kili>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y/yBC4yxTs+Po0TG@kili>
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
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/02/23 11:08, Dan Carpenter ha scritto:
> There is a type bug because the return statement:
> 
> 	return ret < 0 ? ret : recv_cnt;
> 
> will not return negatives on 64bit systems.  The problem is that the
> function returns ssize_t types, while "ret" is int and "recv_cnt" is a
> u32.  The negative values are type promoted to u32 and returned as
> positive values instead of negative error codes.
> 
> Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


