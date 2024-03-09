Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CFC8770EF
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 13:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE6210FF7D;
	Sat,  9 Mar 2024 12:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="i0E6pVN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B2310FF7E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 12:03:27 +0000 (UTC)
Message-ID: <28492cfb-5327-46d5-8c08-233f1786ff44@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1709985804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axQl+5LrcSwPQ7Y79L1XQ/DDezVoFDIXlwRR++4w7oE=;
 b=i0E6pVN2RsKFRkkKlIL4UD3RFZkn0fPIwWzAu9aj89oddtgk9EwIl36OgqpuVwhcHs996e
 kcfXE839mR/cszn9zYEcFBz6g9CT0p5c4iKVsaD2nTiOhcmv/pRza/V7QrlFr7gduwZhuu
 JC2wELPl4O9bjqYGSEAYemZpwc0xPF8=
Date: Sat, 9 Mar 2024 20:03:14 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] drm/bridge: Add fwnode based helpers to get the
 next bridge
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-2-sui.jingfeng@linux.dev>
 <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
 <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
 <CAA8EJpqq1-cEke6wEFZFDnpz4tFBcL6HF3=Qtf-8Q3WbogLS8A@mail.gmail.com>
 <c84fcdba-af50-4212-a8e3-f492c2b02ce4@linux.dev>
 <CAA8EJppTcPO3j7GpGcGbKPUjQ=3rTMMOrU1SYR3mtkWLztf2qQ@mail.gmail.com>
 <7535b3ba-6bbb-411c-82a4-cd4ac45de1a6@linux.dev>
 <CAA8EJpp3yd33pYweL_exrXMJ3g-m7-yjJrjiVMVMevOadBtt8g@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJpp3yd33pYweL_exrXMJ3g-m7-yjJrjiVMVMevOadBtt8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/3/9 18:39, Dmitry Baryshkov wrote:
>> The code path of "creating a connector" plus the code path of "not creating a connector"
>> forms a 'side-by-side' implementation imo.
>>
>> Besides, I have repeated many times: the DT already speak everything.
>> Device drivers can completely know if there is a display connector OF device created and how many
>> display bridges in the whole chain. If there are connector device node in the DT, then it should
>> has a device driver bound to it(instead of create it manually) for a perfect implementation. As
>> you told me we should not*over play*  the device-driver model, right?
> Please, don't mix the connector node in DT and the drm_connector. If
> you check the code, you will see that the driver for hdmi-connector,
> dp-connector and other such devices creates a drm_bridge.


OK, I'm not mixed them, I'm very clear from the very beginning. I have checked
the code years ago. Let's make it clear by iterating one more time:

If DT contains one or more HDMI connector node, then there will be one or
more display connector platform devices created by OF core, Then, according to
your "don't overplay device-driver model" criterion or modern drm bridge standard,
we shouldn't create a display connector instance in the drm birdge driver, right?

As otherwise we will have two display connector driver (or code) for a single entity,
right?

Another side effect is that
when you create a hdmi display connector instance manually without reference to the
DT, then *you made an assumption!*. But there are users who have don't a different
need(or  different typology), for example, they need to read edid directly from the
KMS driver side. This may because the i2c bus is directly connected to the connector
part, but the display bridge's I2C slave interface. sii9022, it66121 and tfp410 support
this kind of usage.

So the real problem is that it is a policy level code  when you creating a hdmi
display connector instance manually without reference to the DT in a common drm bridge
driver, not a mechanism.

