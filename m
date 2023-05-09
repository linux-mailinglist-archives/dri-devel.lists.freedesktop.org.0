Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8C6FBCF2
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 04:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20710E1CE;
	Tue,  9 May 2023 02:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B54110E193
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 02:14:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8BA0784788;
 Tue,  9 May 2023 04:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1683598448;
 bh=SIC05a1h6bRWGMz9RDdtOyxBzwCAwNUqEJPqWKbzSxc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aMeANNK+KgPlA8gSVw6iwHDK5qOPrrNoMCyGrDKeLXHJjGXMB01w2l0TPVRok5pxu
 CYFZQQzBwg6m0cLdqDuI+y1kdmedWI/SEFyf4zKZunINZ0uJPFeoGMayZtDstQGbD/
 lzfIW0ACxfKWsmCvGW4a5i/u+y+cr8Ob2dHEGtk6DI0sQGe3Eu9oJNOnF+GwqLJqkM
 ru8JpSQ8h/n4CMeLldiRcTPwPGeoFRPaUBkwAKXjRzRgb37qQQuNQjhNIQmvS9Cizu
 7bT9f8vg9cmB5qzX7KYeF6tHAmoP/63KDhHotbDjDG9jEqENNdpz69Wrh0OFS3vyyh
 s5WCFZf/otDJA==
Message-ID: <211f0b07-568e-509d-464a-2f8821d300d7@denx.de>
Date: Tue, 9 May 2023 02:11:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230508055740.635256-1-victor.liu@nxp.com>
 <20230508055740.635256-4-victor.liu@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230508055740.635256-4-victor.liu@nxp.com>
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
Cc: conor+dt@kernel.org, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/8/23 07:57, Liu Ying wrote:
> Instead of determining LCDIF output bus format and bus flags in
> ->atomic_enable(), do that in ->atomic_check().  This is a
> preparation for the upcoming patch to check consistent bus format
> and bus flags across all first downstream bridges in ->atomic_check().
> New lcdif_crtc_state structure is introduced to cache bus format
> and bus flags states in ->atomic_check() so that they can be read
> in ->atomic_enable().
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Marek Vasut <marex@denx.de>
