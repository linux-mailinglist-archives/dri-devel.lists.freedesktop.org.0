Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115D94C4052
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 09:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B79910E547;
	Fri, 25 Feb 2022 08:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489BA10EA0B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:36:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 22EA41F44EFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645713392;
 bh=a5HETx9RdGbA+U2GzdkhgfEme4Mq6cVTNkqDGzsr6CQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AmfM8svSLgBD0m64Hmxuea3hI/8v+A+wcJ/0920+h5sCWJuax6L7rG2cym4TEbQFj
 +A4fHQmsSxWYBKrZRCJyv4Ahl8isE2+KeSE9wAKfBp5JFCJnGPxbR5vQNwt/2I4mxA
 aL+7fwJKkCL9XLJwNitTHsT8vWirjEDHg4kdAX7SM2HN1OEisEJJJyG8KZRzHa1Nlm
 MHqc37p3gGq5lNNPPNTjtJc02fkPpA9B/ZrI9G3snn6m/1WZV4IyCy5tNR6a0VZQYS
 F5qg5nOgfvtJGMeO/DPdRTN7jwu/sgsj7j7iU0gxfIKa5E2jUaWrhUeK4MFp5oiUZV
 ISNcUqkRGtNcg==
Message-ID: <a6f2b4a8-b9f0-dd2b-2361-8ede766b8394@collabora.com>
Date: Thu, 24 Feb 2022 17:36:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 21/23] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-22-s.hauer@pengutronix.de>
 <b9b59c1d-5808-f348-62fb-257746df134d@collabora.com>
 <20220224074750.GR9136@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220224074750.GR9136@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 08:42:23 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/24/22 10:47, Sascha Hauer wrote:
> On Thu, Feb 17, 2022 at 04:24:29PM +0300, Dmitry Osipenko wrote:
>> 17.02.2022 11:29, Sascha Hauer пишет:
>>> @@ -28,6 +28,12 @@ config ROCKCHIP_VOP
>>>  	  This selects support for the VOP driver. You should enable it
>>>  	  on all older SoCs up to RK3399.
>>>  
>>> +config ROCKCHIP_VOP2
>>> +	bool "Rockchip VOP2 driver"
>>> +	help
>>> +	  This selects support for the VOP2 driver. You should enable it
>>> +	  on all newer SoCs beginning form RK3568.
>>
>> s/form/from/
>>
>> The ROCKCHIP_VOP option is "default y". Do you really want "default n"
>> for the VOP2?
> 
> ROCKCHIP_VOP is only default y to keep the VOP driver enabled for
> existing defconfig that were generated before the introduction of
> that symbol.
> We don't have this problem for VOP2, so no need to make it default y.

To me it will be more consistent of you'll have both defaulting to y,
since both options are behind DRM_ROCKCHIP.
