Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B141B9F3E27
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013A510E631;
	Mon, 16 Dec 2024 23:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Sk4qoKLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1386 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2024 23:17:51 UTC
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024FB10E631
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 23:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734391069;
 bh=qC96iOLN7rxJmKjjpoNnge9pQiudNq68CtZcIHY8dmg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Sk4qoKLkMfoOBfKGsoYhdUNGh2vT6iMk+73a5KvjSsovzZAT3IPxnMb2wNVT2G+8j
 lZN6xN646y16jegP1+asXZbma1hev/XA5pNBSmwkBSEkmbKqIaqrEIkX8GJ3CheEAB
 cmqS4rj6f4MSCwC1Ow/4/ewNxmPcvxWYODvYxnKTPPamoZHp9EGAD+PsK9sQvSrZwQ
 vkKRaPNrGwT0Idg9oDtNVswpqIHR9GYH2ldRb71OpvZ0lKtjjvL/4heSvTl/sbwzLS
 9hcM9I/qtvOsAPJcPc8Nw20Q6cjQfE1YDP/en+X79PlLra4z6BMT3mg3lvAX7yaXpM
 Xt/XoNAfkoyYA==
Received: from [192.168.1.90] (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2773C17E0D72;
 Tue, 17 Dec 2024 00:17:49 +0100 (CET)
Message-ID: <d1fe66a7-c495-429d-9908-6f4076a994da@collabora.com>
Date: Tue, 17 Dec 2024 01:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge-connector: Prioritize supported_formats
 over ycbcr_420_allowed
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241206-bridge-conn-fmt-prio-v2-1-85c817529b88@collabora.com>
 <uw7uqw6zsmoe2cyxe3mqm3ok43afut47jms37nny6ecl44b5xe@byagwnayplse>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <uw7uqw6zsmoe2cyxe3mqm3ok43afut47jms37nny6ecl44b5xe@byagwnayplse>
Content-Type: text/plain; charset=UTF-8
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

Hi Dmitry,

On 12/10/24 3:12 AM, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 10:00:46PM +0200, Cristian Ciocaltea wrote:
>> Bridges having the DRM_BRIDGE_OP_HDMI flag set in drm_bridge->ops are
>> supposed to rely on drm_bridge->supported_formats bitmask to advertise
>> the supported colorspaces, including HDMI_COLORSPACE_YUV420.  Therefore,
>> the newly introduced drm_bridge->ycbcr_420_allowed flag becomes
>> redundant in this particular context.
>>
>> Moreover, when drm_bridge_connector gets initialised, only
>> drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
>> the equivalent property of the base drm_connector, which effectively
>> discards the formats advertised by the HDMI bridge.
> 
> I think this should be handled in a different way: during HDMI connector
> init verify that HDMI_COLORSPACE_YUV420 matches the
> drm_connector->ycbcr_420_allowed value and rejects incompatible
> connectors.

I added a 2nd patch in v3 [1] to perform this verification on HDMI
connector init, but I think we still need a proper handling of the
inconsistency at bridge[-connector] level. I simplified a bit the initial
approach, hopefully that would bring us closer to an acceptable solution.

Thanks,
Cristian

[1] https://lore.kernel.org/lkml/20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com/
