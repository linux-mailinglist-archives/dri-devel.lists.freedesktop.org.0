Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D930E2C83E7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15596E489;
	Mon, 30 Nov 2020 12:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289BA6E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:12:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUCChtw063410;
 Mon, 30 Nov 2020 06:12:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606738363;
 bh=/9+7KCNxM3dpg5aq8iKBnXwWFvLlOfZWSx2WFVQc1eA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uRAxRwvravGYFYZ3/rt79I2km7vZ6KwFmcXRROPMgt5t8sHBPZYs8jCoccuOB4dgq
 1StgZR5J9bd2DlgJ2bZa/ezJvdmjG5W5HTu1qK0ZEs69nmvhtZ2pBDQhpWshYYNlV9
 SVCjwUGlbsQxrskqZVzQ1+83ePWiWVV0xuwwI3+s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUCChlF092873
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 06:12:43 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 06:12:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 06:12:42 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUCCeq9057759;
 Mon, 30 Nov 2020 06:12:40 -0600
Subject: Re: [PATCH v2 1/5] drm: add legacy support for using degamma for gamma
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-2-tomi.valkeinen@ti.com>
 <20201130103840.GR4141@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f744a803-6d8c-5188-7bfa-93cc05cc26bf@ti.com>
Date: Mon, 30 Nov 2020 14:12:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130103840.GR4141@pendragon.ideasonboard.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sekhar Nori <nsekhar@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2020 12:38, Laurent Pinchart wrote:

>> + * can be used when the driver exposes either only GAMMA_LUT or both GAMMA_LUT
>> + * and DEGAMMA_LUT.
>> + */
>> +int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>> +				       u16 *red, u16 *green, u16 *blue,
>> +				       uint32_t size,
>> +				       struct drm_modeset_acquire_ctx *ctx)
>> +{
>> +	return legacy_gamma_degamma_set(crtc, red, green, blue, size, ctx, false);
>> +}
> 
> I wonder, would it make sense to make this automatic by setting the
> degamma LUT when only the DEGAMMA_LUT property exists, and the gamma LUT
> otherwise ? Are there use cases for drm_atomic_helper_legacy_degamma_set
> for drivers that support both gamma and degamma ?

Yes, I think drm_atomic_helper_legacy_gamma_set() could do that.

But if you look at the second patch, the driver deals with crtc_state->degamma_lut. Having
.gamma_set = drm_atomic_helper_legacy_degamma_set makes it bit more explicit and clear what the
driver is doing.

That said, documenting what drm_atomic_helper_legacy_gamma_set does if there's only degamma should
also be clear enough, so... I don't have strong feelings either way =).

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
