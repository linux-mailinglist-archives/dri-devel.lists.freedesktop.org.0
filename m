Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E2A5BFD5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 12:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E2E10E57A;
	Tue, 11 Mar 2025 11:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RZErmzD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483710E581
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741694202;
 bh=oJdU3+ooCjDHVuYhhwqBKzx0i6eCKL9c3ARobA2BNDA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RZErmzD5hR6eBaNCp3Ra952zZqHpfdYpxB/QT515Jm1n74Cay6gDxrhgE9emAwaz/
 6FdGJ0YWE9p6DkYmdCEvgCj286rMwe3kGuOLX89U7nx5H6+8VuEyu+UT394erUfgVu
 DZxDk03R2UYg44KbWMsa7vmHMecYtOXtkos9XzuJXAEpEVJqWWpE3WbjEUucwZvqHn
 llWloNx5Pt/RZfTgSKcusiTV4n5y/gu0MHVqiNDVIBMjIkf2UmJmA2cmVPuUfdYlrM
 4LEIrWnEfRhuD1vjaoVmmIO8mZYVW/0vHFatGw3tVFHP/ZjiQo2tVv2hP6r8aIUyHJ
 yp0STOd+W5xAA==
Received: from [10.20.66.114] (unknown [103.163.65.90])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2368717E0B25;
 Tue, 11 Mar 2025 12:56:39 +0100 (CET)
Message-ID: <daa0733c-14e3-44df-8374-33aba6662813@collabora.com>
Date: Tue, 11 Mar 2025 17:26:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: defconfig: mediatek: enable PHY drivers
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, nfraprado@collabora.com, 
 angelogioacchino.delregno@collabora.com, daniels@collabora.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250311061703.16850-1-vignesh.raman@collabora.com>
 <dc659e19-c1ae-42d8-84c9-0d2aafa81fe2@kernel.org>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <dc659e19-c1ae-42d8-84c9-0d2aafa81fe2@kernel.org>
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

Hi Krzysztof,

On 11/03/25 12:54, Krzysztof Kozlowski wrote:
> On 11/03/2025 07:16, Vignesh Raman wrote:
>> The mediatek display driver fails to probe on mt8173 and mt8183 in
>> v6.14-rc4, with the following errors:
> 
> Which boards?

These are the boards,
https://lava.pages.collabora.com/docs/boards/chromebooks/boards/hana/
https://lava.pages.collabora.com/docs/boards/chromebooks/boards/jacuzzi/

> 
>>
>> mt8173:
>> platform 1401b000.dsi: deferred probe pending: mtk-dsi: Failed to get hs clock
>> platform 14025000.hdmi: deferred probe pending: (reason unknown)
>> i2c 1-0008: deferred probe pending: (reason unknown)
>>
>> mt8183:
>> platform 14014000.dsi: deferred probe pending: mtk-dsi: Failed to get hs clock
>> i2c 4-0058: deferred probe pending: anx7625: fail to find dsi host.
>>
>> Enabling CONFIG_PHY_MTK_MIPI_DSI=y in drm-ci resolves this error,
>> but mt8173 still fails with,
>>
>> [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
>> panel-simple-dp-aux aux-1-0008: DP AUX done_probing() can't defer
>> panel-simple-dp-aux aux-1-0008: probe with driver panel-simple-dp-aux failed with error -22
>>
>> Enabling CONFIG_PHY_MTK_XSPHY=y and CONFIG_PHY_MTK_HDMI=y in drm-ci
>> resolves this issue for mt8173.
>>
>> So enable these PHY configs for mediatek platforms.
> 
> Just say which boards need it for which functionality/features. Three
> sentences are enough.

Sure, will update the commit message. Thanks.

Regards,
Vignesh

> 
> Best regards,
> Krzysztof

