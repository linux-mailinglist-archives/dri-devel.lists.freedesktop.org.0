Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5014792EBC9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 17:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9F110E0FC;
	Thu, 11 Jul 2024 15:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Gs4JUUak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956C110E0FC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 15:38:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0259B880D8;
 Thu, 11 Jul 2024 17:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720712300;
 bh=hGe3LZgvc9hdhnvuWA7Bo/rdpk/1uQiENLB7LM3CLYM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Gs4JUUakkdSij0Gb/RcGf+XAbld6Q5Lf+V0B6Kb5rmx0M94uFTUVOr7OycYY3E3yU
 BswyLlN6vgu1o9q460KYBQxJWXYAQwxtCw6zI82kf0T/w433RxBDQ0Y1YOokMW7pdE
 e551eBtrU/YBAT5w+ml5DhnADKTpV+KGHLGReBZEgzYZa/v4C2dJ/whKduGJ4/2beY
 dLO7ozzShcTpusnFARU/+J02dXZLyc2mkihA72eGHxMcYnv4klKZ269yQ6ayTqyFzq
 76I8/d0S+AShjMLSQiFhQ6/XbzXq26MWjAZlOnlTWacACTs7KIqT1IuOJp0T46GYAK
 FPoAdMQmvx0Xg==
Message-ID: <1867bfd6-ad00-46a7-8bad-4a4441d9854c@denx.de>
Date: Thu, 11 Jul 2024 17:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
To: Michael Walle <mwalle@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240625122824.148163-1-marex@denx.de>
 <4603431.cEBGB3zze1@steina-w> <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
 <D29SIGP58O7E.3AJ5VRGQ4I1VN@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <D29SIGP58O7E.3AJ5VRGQ4I1VN@kernel.org>
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

On 6/26/24 10:02 AM, Michael Walle wrote:
> On Wed Jun 26, 2024 at 5:21 AM CEST, Marek Vasut wrote:
>> Thank you for testing and keeping up with this. I will wait for more
>> feedback if there is any (Frieder? Lucas? Michael?). If there are no
>> objections, then I can merge it in a week or two ?
> 
> I'll try to use your approach on the tc358775. Hopefully, I'll find
> some time this week.

So ... I wonder ... shall I apply these patches or not ?

I'll wait about a week or two before applying them, to get some input.
