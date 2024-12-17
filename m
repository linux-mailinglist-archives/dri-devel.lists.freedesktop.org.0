Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6019F3ED9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5FE10E053;
	Tue, 17 Dec 2024 00:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZLRPrlzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F97210E053
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 00:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734395936;
 bh=cCT7yCvueY9SltdJob3Us/rABE/fV3u5HIoVCezbvm4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZLRPrlzfCzLfY/oZBMRGtmvFCtexxef32YgFBs5nnJBmYBqWAlEJkMW0+ICU/6LxJ
 PbAWZfEPLa1vl6cqa/IsHtyH0jpUDm7OzpZBrXMIqHAhPWnBh7w6OwtyfQhouxnA5h
 VB/e1NBqjBnAvsimHIAbvsSGYbSVZ72hHi9xgW8uhFkhDOoVqRgboEXfpH6Ux9sUIz
 WXavXJZ8VALJNScVjFDobY+LVUYWRwzKyORKrj+8EWz6VISqGWPOjbZm9O30s1qJ+c
 IexJ3e7MPSfXCdEdSWvGKCbDZX+67hOTjPg9rbCFaXGcv0HznQ0bGPfamAlyJU0YMK
 aeCWiefQrb2ZA==
Received: from [192.168.1.90] (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D70317E0E6E;
 Tue, 17 Dec 2024 01:38:56 +0100 (CET)
Message-ID: <b7e1c0e9-f8bc-4f93-a280-49cce1658baa@collabora.com>
Date: Tue, 17 Dec 2024 02:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/bridge-connector: Prioritize supported_formats
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
References: <20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com>
 <20241217-bridge-conn-fmt-prio-v3-1-3ecb3c8fc06f@collabora.com>
 <c36o6ro5qqfkqipltlecb3r22d5k3xiqdt46rtl2gdyha7xtmm@l2ovdfono7np>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <c36o6ro5qqfkqipltlecb3r22d5k3xiqdt46rtl2gdyha7xtmm@l2ovdfono7np>
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

On 12/17/24 1:27 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 12:54:07AM +0200, Cristian Ciocaltea wrote:
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
>>
>> Handle the inconsistency by overwriting drm_bridge->ycbcr_420_allowed
>> for HDMI bridges according to drm_bridge->supported_formats, before
>> adding them to the global bridge list.
>>
>> Additionally, ensure the YUV420 related bit is removed from the bitmask
>> passed to drmm_connector_hdmi_init() when the final ycbcr_420_allowed
>> flag for the connector ends up not being set (i.e. the case of having at
>> least one non-HDMI bridge in the pipeline that didn't enable it).
>>
>> Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/display/drm_bridge_connector.c | 8 ++++++--
>>  drivers/gpu/drm/drm_bridge.c                   | 4 ++++
>>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> I think the second patch in the series is enough, it ensures that
> connector's state is consistent, no matter if the drm_bridge_connector
> is being used or a normal drm_connector.
> 
> Nevertheless, I'd leave the final decision to DRM maintainers.

This patch has 2 parts, maybe I should have put them into separate patches
as they kind of relate to distinct problems.

The 1st part makes sure that drm_bridge->ycbcr_420_allowed is automatically
set when HDMI_COLORSPACE_YUV420 is provided in drm_bridge->supported_formats, 
to avoid the need of requiring redundant information on HDMI bridges 
initialization.  This implicitly ensures the consistency needed to further 
allow relying on ->ycbcr_420_allowed internally.

While the 1st part could be dropped (assuming redundancy & consistency is
not really something we want/need to handle), the 2nd part I think is
mandatory, i.e. we must adjust supported_formats before calling
drmm_connector_hdmi_init() to ensure the presence of HDMI_COLORSPACE_YUV420
reflects the status of the computed connector->ycbcr_420_allowed, which
might end up being different than what the HDMI bridge advertised, i.e. the
case of having an HDMI bridge in the pipeline advertising YUV420 via 
supported_formats and a non-HDMI one that didn't enable ycbcr_420_allowed.

Thanks,
Cristian
