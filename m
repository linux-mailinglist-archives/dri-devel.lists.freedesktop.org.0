Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED54F7DB5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4007D10E61F;
	Thu,  7 Apr 2022 11:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAB510E512
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649330153;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=c1j57OzkC5NhGusvepHfUpBDwheH8518tflcTdvtQXI=;
 b=Ne/byUbqDQ8NO3Y+LUdT7kFrvAV8rZPg4xQAgkYqHhgSNssycLc7GSsRbtOpIv34mm
 kos8DK6qvFMbxPVyqlso1fzT+29puPH4Tx8EzUQs+ueHy5IC+iDkooe/cJPCq/LKLVKR
 DG7N8xchPvGSRHvJnw31g3ki/4fVjbVRRUOTAdRawaI+twGwj96RoVl19VX5kFclCIHZ
 NWEDt8UoZYIABZfmR7LznpxsC9gulnyqv3wonnpZ7eFdNoDGKGJYhMEDFvmse2aIyHyO
 rbFq8Pk/cJ55o3089CDVhqYuasPYCf3Js/YPw4l+v1aAI+Bq1tUwxRxO4Wl+GQ2tUven
 uHzQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8MRqg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy37BFrjx4
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 7 Apr 2022 13:15:53 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v17 5/6] drm/bridge: dw-hdmi: add YCBCR formats only if
 CSC is available
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9d3f8bfb-74f7-cbd9-a6f5-1e8acae4c13b@baylibre.com>
Date: Thu, 7 Apr 2022 13:15:52 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8A7AD7C-8FE0-4183-9B84-2F569EC9DA40@goldelico.com>
References: <cover.1649262368.git.hns@goldelico.com>
 <d5801eb7733a616df30fef1d192e88ad147afc1c.1649262368.git.hns@goldelico.com>
 <9d3f8bfb-74f7-cbd9-a6f5-1e8acae4c13b@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Paul Boddie <paul@boddie.org.uk>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 letux-kernel@openphoenux.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Am 07.04.2022 um 10:29 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>=20
> On 06/04/2022 18:26, H. Nikolaus Schaller wrote:
>> otherwise they will produce a black HDMI screen.
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index b5a665c5e406e..ec40dd8865065 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2628,10 +2628,12 @@ static u32 =
*dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>>  		output_fmts[i++] =3D MEDIA_BUS_FMT_RGB101010_1X30;
>>  	}
>>  -	if (hdmi->sink_is_hdmi && info->color_formats & =
DRM_COLOR_FORMAT_YCBCR422)
>> +	if (hdmi->csc_available && hdmi->sink_is_hdmi &&
>> +	    (info->color_formats & DRM_COLOR_FORMAT_YCBCR422))
>>  		output_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
>>  -	if (hdmi->sink_is_hdmi && info->color_formats & =
DRM_COLOR_FORMAT_YCBCR444)
>> +	if (hdmi->csc_available && hdmi->sink_is_hdmi &&
>> +	    (info->color_formats & DRM_COLOR_FORMAT_YCBCR444))
>>  		output_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>>    	/* Default 8bit RGB fallback */
>=20
> This patch shouldn't be needed anymore with proper filtering in patch =
1.

It can indeed be removed as well.

BR and thanks,
Nikolaus

