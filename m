Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EEC604160
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 12:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0145810E088;
	Wed, 19 Oct 2022 10:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F73B10E262;
 Wed, 19 Oct 2022 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DadoXiqteYpnLJ29i7DeTRmR70Jdg+khLdbmGW+Xm0A=; b=eqGdTjr9Okxo1LuL0OBpnuWT3+
 gswk4qO1MpzOsSl6Q5tK5MSZ/Z/EdiBzxQt9FQ/wxMqG9fgH3dZRqaqyaofErZC1occiE6A0eT9bF
 +cgAEOI31xUQIRTSYuoGi20bLNWgXKOYHZS6VB6YkAH5z1K8oS3hWitIGLDuSl/2M3ulT4BUuB423
 9VtMxYnT4ibV5DI47JR82Uk8FWIzCNdhfAtB3dF4sOREpDgFRPfGKZyclSmiQh+tb5Xrp7OzQtj7N
 NxO6opDh/Sse/qWjJq1ExuRKm9NBp/QhuxXZL0S+GDTDtFzw97F6Q00OwoLtb81+8L5Ij3TBBkhfq
 KPbfXByw==;
Received: from [2a01:799:95a:cb00:cca0:57ac:c55d:a485] (port=55269)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ol6Xm-0007CC-Pr; Wed, 19 Oct 2022 12:43:26 +0200
Message-ID: <694facef-00bc-6b59-7c44-d68c7ca0c40f@tronnes.org>
Date: Wed, 19 Oct 2022 12:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 12/22] drm/connector: Add a function to lookup a TV
 mode by its name
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-12-d841cc64fe4b@cerno.tech>
 <7dcf479c-8ac7-ed47-8587-30268684373c@tronnes.org>
 <20221018093353.pt4vset6o2ldxrbs@houat>
 <e3b98674-5a9e-16f3-4741-ffea43e05cc8@tronnes.org>
 <20221019084828.muy46td63bkyewxk@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221019084828.muy46td63bkyewxk@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 19.10.2022 10.48, skrev Maxime Ripard:
> On Tue, Oct 18, 2022 at 02:29:00PM +0200, Noralf Trønnes wrote:
>>
>>
>> Den 18.10.2022 11.33, skrev Maxime Ripard:
>>> On Mon, Oct 17, 2022 at 12:44:45PM +0200, Noralf Trønnes wrote:
>>>> Den 13.10.2022 15.18, skrev Maxime Ripard:
>>>>> As part of the command line parsing rework coming in the next patches,
>>>>> we'll need to lookup drm_connector_tv_mode values by their name, already
>>>>> defined in drm_tv_mode_enum_list.
>>>>>
>>>>> In order to avoid any code duplication, let's do a function that will
>>>>> perform a lookup of a TV mode name and return its value.
>>>>>
>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>> ---
>>>>>  drivers/gpu/drm/drm_connector.c | 24 ++++++++++++++++++++++++
>>>>>  include/drm/drm_connector.h     |  2 ++
>>>>>  2 files changed, 26 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>>>> index 820f4c730b38..30611c616435 100644
>>>>> --- a/drivers/gpu/drm/drm_connector.c
>>>>> +++ b/drivers/gpu/drm/drm_connector.c
>>>>> @@ -991,6 +991,30 @@ static const struct drm_prop_enum_list drm_tv_mode_enum_list[] = {
>>>>>  };
>>>>>  DRM_ENUM_NAME_FN(drm_get_tv_mode_name, drm_tv_mode_enum_list)
>>>>>  
>>>>> +/**
>>>>> + * drm_get_tv_mode_from_name - Translates a TV mode name into its enum value
>>>>> + * @name: TV Mode name we want to convert
>>>>> + * @len: Length of @name
>>>>> + *
>>>>> + * Translates @name into an enum drm_connector_tv_mode.
>>>>> + *
>>>>> + * Returns: the enum value on success, a negative errno otherwise.
>>>>> + */
>>>>> +int drm_get_tv_mode_from_name(const char *name, size_t len)
>>>>
>>>> Do we really need to pass in length here? item->name has to always be
>>>> NUL terminated otherwise things would break elsewhere, so it shouldn't
>>>> be necessary AFAICS.
>>>
>>> The only user so far is the command-line parsing code, and we might very
>>> well have an option after the tv_mode, something like
>>> 720x480i,tv_mode=NTSC,rotate=180
>>>
>>> In this case, we won't get a NULL-terminated name.
>>
>> My point is that item->name will always be NUL terminated so strcmp()
>> will never look past that.
> 
> Right, but we don't have the guarantee that strlen(item->name) <
> strlen(name), and we could thus just access after the end of our name
> 

Ok, using the length limiting str funtions is the safe thing to do, so
len needs to stay. But I don't get the 'strlen(item->name) == len'
check. strncmp() will stop when it reaches a NUL in either string so no
need for the length check?

Anyways:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
