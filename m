Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7792D40D5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 12:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C656E9EE;
	Wed,  9 Dec 2020 11:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D6A6E9EE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:17:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9BHEcC036635;
 Wed, 9 Dec 2020 05:17:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607512634;
 bh=Tuvu3paU0VvZsuA3rEcjmaK36Abnrid3kFvWyTRevjc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yK8V+ePkKOtXxBmpIDO8uovg/gOQXtA7Wyc16Bv+HjNbZyjBE+orNwpRfCzoTi/Ij
 qi/6kbCejEjWeBAfAt/TwWOMF7sSHsVuzTaQv/N1uauCg8E5fEmJj8rBXo1AFQU+A4
 vr89TYvZOknxOrFySO153tis411pcQaaG6C8fpD8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9BHEsM004015
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Dec 2020 05:17:14 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 05:17:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 05:17:14 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9BHANa006787;
 Wed, 9 Dec 2020 05:17:10 -0600
Subject: Re: [PATCH v2 1/2] drm: add legacy support for using degamma for gamma
To: Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20201208135759.451772-1-tomi.valkeinen@ti.com>
 <20201208135759.451772-2-tomi.valkeinen@ti.com>
 <X8+h37/GM6K7q1mk@pendragon.ideasonboard.com>
 <20201209005134.GO401619@phenom.ffwll.local>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <6a36125f-1852-1e92-2373-cc9684f54334@ti.com>
Date: Wed, 9 Dec 2020 13:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201209005134.GO401619@phenom.ffwll.local>
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 09/12/2020 02:51, Daniel Vetter wrote:

>>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>>> index ba839e5e357d..4d9e217e5040 100644
>>> --- a/include/drm/drm_crtc.h
>>> +++ b/include/drm/drm_crtc.h
>>> @@ -1084,6 +1084,9 @@ struct drm_crtc {
>>>  	 */
>>>  	uint16_t *gamma_store;
>>>  
>>> +	bool has_gamma_prop : 1;
>>> +	bool has_degamma_prop : 1;
> 
> I'm a bit behind on patches, but in case this got missed please remove
> this and replace with the (obj, prop) lookup function thing or something
> like that. Makes sure everything stays in sync, plus like I said atomic
> uses this a ton. So not a problem here.

The drm_mode_obj_find_prop_id() is in core drm.ko, and not exported, but I need it also from
drm_kms_helper.ko.

drm_mode_obj_find_prop_id() is declared in drm_crtc_internal.h. Are those functions supposed to be
not exported from drm.ko?

So, is it fine to just export drm_mode_obj_find_prop_id? If I export, should I move it to
drm_mode_object.h?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
