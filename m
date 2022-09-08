Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32FE5B1B8B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 13:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60FC10EAA6;
	Thu,  8 Sep 2022 11:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3747E10EAA4;
 Thu,  8 Sep 2022 11:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYa/QVI6flq5lHnbp60VYWrYz3i2rBG7tpmdjbr7GZo=; b=GrcJ6yChNMl/rreZ16fGX+KLwn
 GFVb0Zw06qxRhOiTb+mf/0H71iJoRWlPa46/6OVe5vWf2kdgll6709VqoX+K1R8YB7/gyrYPobz3V
 JzCdNscyqgCXvumP4sFMyqb0pZqvlsNP5nYRXe5s14TPZ4tvRtavYU3jbWhEAQ6rYRdYGmQy7oGie
 HExkAsdTKp3hnJM0Ao/DTsVcygRVWsLVuBD9sBT5/Q9ggX6/Rdd8mB9lH7AiB+JgUcU6lgcT+jdiR
 I1SbdI754aUsyUV4yjCBOISLC9wcu4A1N8dVTW+n73EpmvEUNoG/HAwACaFUJgeOIrisfQO3bTsGt
 yh6BCRIw==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62929)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oWFnx-0005DR-KV; Thu, 08 Sep 2022 13:34:45 +0200
Message-ID: <c6ef022d-1714-b0dd-472c-938614aefc06@tronnes.org>
Date: Thu, 8 Sep 2022 13:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
 <199cf4b3-8ace-e047-3050-b810cf0c6b63@tronnes.org>
 <20220908112312.hlb7mzneuxnethhr@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220908112312.hlb7mzneuxnethhr@houat>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 08.09.2022 13.23, skrev Maxime Ripard:
> Hi Noralf,
> 
> On Tue, Aug 30, 2022 at 09:01:08PM +0200, Noralf Trønnes wrote:
>>> +static const struct drm_prop_enum_list tv_mode_names[] = {
>>
>> Maybe call it legacy_tv_mode_enums?
>>
>>>
>>> +	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
>>>
>>> +	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
>>>
>>> +	{ VC4_VEC_TV_MODE_PAL, "PAL", },
>>>
>>> +	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
>>
>> If you use DRM_MODE_TV_MODE_* here you don't need to translate the value
>> using the switch statement in get/set property, you can use the value
>> directly to get/set tv.mode.
> 
> I'm sorry, I'm not quite sure what you mean by that. If we expose the
> DRM_MODE_TV_MODE_* properties there, won't that change the values the
> userspace will need to use to set that property?
> 

You're right ofc, I forgot that the enum values are also UABI.

Noralf.
