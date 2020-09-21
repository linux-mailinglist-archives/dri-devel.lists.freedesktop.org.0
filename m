Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32D2721DA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 13:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6446E258;
	Mon, 21 Sep 2020 11:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FD56E258
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:09:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08LB8pLq014499;
 Mon, 21 Sep 2020 06:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600686531;
 bh=Xx5E8XBm8ifY/Auds7gGllxPhDxRoNq4OSQoLqr6xfU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xzCS8kBDDwlK9WBNU2n8WxILG9jVasBXdoU5fnDgk59VR0ReX2CFPZYdD6aHZ1C9m
 x8h0uM2gkr5z2huoK5/CnqkwrGEZPCZtXn69NjYrXKzbdRQR/cHKuSiHCnKWvmytAR
 L9gWCaMLxpFBgcDKW3Zg5DKv/VzBV9XtY9qoHyUY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08LB8pB5108617;
 Mon, 21 Sep 2020 06:08:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 21
 Sep 2020 06:08:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 21 Sep 2020 06:08:50 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08LB8mpl093457;
 Mon, 21 Sep 2020 06:08:49 -0500
Subject: Re: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
To: Ilia Mirkin <imirkin@alum.mit.edu>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-5-tomi.valkeinen@ti.com>
 <20190903152413.GB8247@pendragon.ideasonboard.com>
 <b44372e2-1bb7-ddb8-d121-ae096b38d918@ti.com>
 <20190904111105.GA4811@pendragon.ideasonboard.com>
 <d75b942b-0256-3824-9055-1f6b68bb8c3b@ti.com>
 <CAKb7Uvhcvi5AQZq21ky8V07wjeNfdpV0y+5j=O=S1PTp=4o5Bw@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5beadfb2-86a5-a782-ff88-ce77c727ecfe@ti.com>
Date: Mon, 21 Sep 2020 14:08:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKb7Uvhcvi5AQZq21ky8V07wjeNfdpV0y+5j=O=S1PTp=4o5Bw@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 04/09/2019 23:20, Ilia Mirkin wrote:

>>>>>> Implement CTM color management property for OMAP CRTC using DSS
>>>>>> overlay manager's Color Phase Rotation matrix. The CPR matrix does not
>>>>>> exactly match the CTM property documentation. On DSS the CPR matrix is
>>>>>> applied after gamma table look up. However, it seems stupid to add a
>>>>>> custom property just for that.
>>>>>
>>>>> In that case the DRM documentation should be updated to mention that
>>>>> both options are allowed.
>>>>
>>>> Ok, if that is alright. But if we do that, then I guess all the drivers
>>>> implementing CTM should document the point where it is applied in the
>>>> pipeline.
>>>
>>> Whatever solution we end up picking, I think it should at least be
>>> discussed with a broader upstream audience and not just swept under the
>>> omapdrm carpet :-)
>>>
>>
>> I'll try to write something and send the next series to wider audience.
>> Let's see what jury says.
> 
> In case it's useful ... the pipeline normally goes degamma -> ctm ->
> gamma. If your ctm is applied after gamma, perhaps you can just rename
> "gamma" to "degamma" and be done? (There's the unfortunate case of
> legacy gamma which does end up in "GAMMA" when using atomic helpers.
> But in such a case, you won't have a CTM.)

Waking up old thread, as I started looking at these patches again. So the problem was that DRM
defines the output color transformations as:

degamma -> ctm -> gamma -> out

whereas OMAP DSS has

gamma -> ctm -> out

The omapdrm driver could declare the gamma table as degamma, as suggested by Ilia, and for the
legacy drmModeCrtcSetGamma, the omapdrm driver could implement its own version, and use the degamma
table internally (with no ctm).

For legacy, that would work fine and as expected, but I think the atomic version would be a bit odd,
with only degamma, and no gamma.

Quick grep for drm_crtc_enable_color_mgmt shows that there are other drivers that have CTM and
gamma, but no degamma. I wonder if all those have ctm -> gamma -> out, or are they similar to OMAP DSS.

Any thoughts on how to proceed with this?

Should we have a property that describes the order? Or new property name for gamma before ctm
(PREGAMMA)? Or just have it as degamma, and let the userspace deal with it (i.e. figure out there's
no gamma, but there's degamma, so use degamma)?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
