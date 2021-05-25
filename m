Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6B38FF66
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 12:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415E891A6;
	Tue, 25 May 2021 10:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771776E9E9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:38:48 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7025A81DC0;
 Tue, 25 May 2021 12:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621939127;
 bh=QQWMGDwZqsVIJoCurTfvJT3JyFux1/Yx/a02OtT4yrU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OrOwNioftTWjmQHFAUTBm9P7ys0ynTOjOVXxmRWJwevCju2CSDI3Agfh7zE0EkBR6
 MHZSMCwyerTblr9QEx6chOIgUIwNMyuBZqKPSGrU1TEFQPuoMGns9mJcx015D8vrmj
 GtbYruEiQwfth3Kec8u44XJ6aSfVgRPdFj1mc6j60HrpS2TGyuEjYQ6QFI4QKWBX27
 nfPHiIoYDPtFXGfrZtNLfc24PmIvtc5kyakUy8T/P8/w0Dl+cCKJyqsmwuaSpI4pGn
 idiykyDAltubgGSESiZqdWoTCuH69Hm5/qAWw+jI3NdbNeJq0lcLxultsqQYDpJzk/
 Q9q0I6iduRAAw==
Subject: Re: [PATCH 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210515204656.367442-1-marex@denx.de>
 <20210515204656.367442-2-marex@denx.de>
 <YKL2SAfonHJcoTw/@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <cd0e358b-9d8e-9005-0889-346e2b7b722c@denx.de>
Date: Tue, 25 May 2021 12:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKL2SAfonHJcoTw/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: Sam Ravnborg <sam@ravnborg.org>, ch@denx.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/21 1:03 AM, Laurent Pinchart wrote:

Hi,

[...]

>> @@ -69,10 +70,33 @@ static void lvds_codec_disable(struct drm_bridge *bridge)
>>   			"Failed to disable regulator \"vcc\": %d\n", ret);
>>   }
>>   
>> +static bool lvds_codec_mode_fixup(struct drm_bridge *bridge,
>> +				const struct drm_display_mode *mode,
>> +				struct drm_display_mode *adj)
>> +{
>> +	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
>> +	struct drm_encoder *encoder = bridge->encoder;
>> +	struct drm_device *ddev = encoder->dev;
>> +	struct drm_connector *connector;
>> +
>> +	/* If 'data-mapping' was not specified, do nothing. */
>> +	if (!lvds_codec->bus_format)
>> +		return true;
>> +
>> +	/* Patch in the LVDS format */
>> +	list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
>> +		drm_display_info_set_bus_formats(&connector->display_info,
>> +						 &lvds_codec->bus_format, 1);
>> +	}
> 
> This part bothers me, as the format at the input of the LVDS decoder
> doesn't match the format on the connector. Shouldn't you implement
> .atomic_get_output_bus_fmts() instead ?

No, I tried that option before this solution and that didn't work. The 
atomic stuff seems to be separate from what I need to pass here, i.e. 
without this, e.g. the mxsfb scanout engine still receives the wrong format.

[...]
