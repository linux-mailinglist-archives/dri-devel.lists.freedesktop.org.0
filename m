Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF3C04E72
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 10:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F7610E9FA;
	Fri, 24 Oct 2025 07:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="QaYS+xGW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m4921.qiye.163.com (mail-m4921.qiye.163.com [45.254.49.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7010E9FA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:59:56 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 270e97439;
 Fri, 24 Oct 2025 15:59:51 +0800 (GMT+08:00)
Message-ID: <4fddba9a-b073-4bca-bd13-64a415f4bc47@rock-chips.com>
Date: Fri, 24 Oct 2025 15:59:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com> <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com> <aPn4-S7upPOOtenr@kuha.fi.intel.com>
 <3a24bd7f-c247-4541-8cf5-c1e66e2af5a0@rock-chips.com>
 <aPsuLREPS_FEV3DS@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aPsuLREPS_FEV3DS@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a153b2e3e03abkunm42a5cff32ee4f7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQksYGlZCGUJPHU1DSEpNThhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=QaYS+xGWbmlxS3kZEJm0a+NYYxT+z5Us5JjdoYYrwKfwWRwLPdNdoBqojU08LMSVNkW2NIt3ivjahLd1DVJdesdRGPkSC4FCyheMfrC+mvLZrgdXQB4BixWM4KY9vnwKKHrM7/OMtoXWLyQqUwV1fQRklY7nO+ZKaFuWNKD3re8=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=A1oUD+BICHOTQ/+ohzJOid/WRrQzOP6u0erXNB3l774=;
 h=date:mime-version:subject:message-id:from;
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

Hi Heikki,

On 10/24/2025 3:43 PM, Heikki Krogerus wrote:
>> I noticed the following statement in typec_register_altmode():
>>
>> ```
>>
>>      /* The partners are bind to drivers */
>>      if (is_typec_partner(parent))
>>          alt->adev.dev.bus = &typec_bus;
>>
>> ```
>>
>> If the condition is not met, the bus will not be set, which means bus_notify()
>> won't be able to take effect. Did I miss something?
> Right, that would be the condition that I was talking about. Only
> partner altmodes are used in the bus.
>
> Hold on! Do you need the port altmode instead of the partner altmode?
> If that's the case, then we can't use the bus notifier. So we'll need
> the separate notifier chain after all.

Yes, we need port altmode.  The partner altmode device appears too late for DRM device, as it only shows up after the corresponding DP device is inserted.


>
> Let me take a closer look at patch 2/9. Sorry about the hassle.
>
-- 
Best,
Chaoyi

