Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3449B3039
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 13:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1C510E48F;
	Mon, 28 Oct 2024 12:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="orzRqYij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2915810E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 12:28:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0A47B87CF8;
 Mon, 28 Oct 2024 13:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1730118509;
 bh=lbIBJtNPtwzKp6VYJYAkIeGvwBMCtVZsgtDqZb/GSJo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=orzRqYij4JYCILKsboGT3VaiovSla6EKxN5eRq5zBc03tH3V+ShkUUdC/fNTvonLN
 EnHsTwk4S7nPSh/guflDdIKiPHYilE/OudfMrGKzlt2SKQr2mYz/WImtan3HVkkJQp
 faW5mQoZeTUOeESygsaxojQYThdbi+k69mKkSFNijuU9CMGGlaHLEWiIg+dBcerSU+
 wlBP6z0NcJmlMC01DfGEmnkcXGrNa5bVQmy1tylU79YXp26Oup9B3lReJ4TZcWwPda
 yXSUUnxKXB6QeDSe1TNAxjHabTTT66RQR/gkoai2xRLZY0XMF/YdLOMqwHovAgAo3M
 SgQ6k5sKEsYsw==
Message-ID: <16edb769-a608-4b6a-9391-a63a69df8c8d@denx.de>
Date: Mon, 28 Oct 2024 12:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <78a09625-6bad-4fda-8ee5-92b8dd0de381@denx.de>
 <20241028090220.1fd803ff@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241028090220.1fd803ff@bootlin.com>
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

On 10/28/24 9:02 AM, Herve Codina wrote:
> Hi Marek,

Hi,

> On Sat, 26 Oct 2024 00:53:51 +0200
> Marek Vasut <marex@denx.de> wrote:
> 
>> On 10/24/24 11:55 AM, Herve Codina wrote:
>>> In some cases observed during ESD tests, the TI SN65DSI83 cannot recover
>>> from errors by itself. A full restart of the bridge is needed in those
>>> cases to have the bridge output LVDS signals again.
>>
>> I have seen the bridge being flaky sometimes, do you have any more
>> details of what is going on when this irrecoverable error occurs ?
> 
> The panel attached to the bridge goes and stays black. That's the behavior.
> A full reset brings the panel back displaying frames.
Is there some noticeable change in 0xe0/0xe1/0xe5 registers, esp. 0xe5, 
do they indicate the error occurred somehow ?
