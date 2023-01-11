Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1D3665D80
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 15:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC00610E749;
	Wed, 11 Jan 2023 14:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0441010E2B3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673446656; x=1704982656;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fmJ8Bb9kgdkiYyjCAW2Eyzd2POxa83xS29bXEsoljHM=;
 b=LyW6jFSSrRIvxT1rAJEySLC7MpJMk+b/ZrarVwlDfif0fzSSwzaxWfdf
 zSIYlyjcGgNj4K/7h42GPo+wqfZ2NgmgZzlpDC6mawRSzlhBF2hdgMmBO
 4tcAWx/6Ul+WkQAk7FhrR+/v7IxYz02fLX4RqaFXdjqxJ0gbcRBDoFJs1
 FnCv1mCI44d2c1qObIIOMmYKBfXCLhFcTY7SccM8xS488rtXOPvv45Zqr
 LcAi59LRs5IQyTLuRr/+KzOmbIOfKuUS/uICp6j4BvVj5jLIdEitNajxm
 h6UGcoqAZxgp1K3XFmYltlnyfSV64O0+iecWzI1d/t/u/M1Li5pySwL50 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="306937344"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="306937344"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 06:17:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="765159886"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="765159886"
Received: from mmgriffi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.11.225])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 06:17:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH 2/9] drm/vc4: hdmi: Constify container_of wrappers
In-Reply-To: <38a5f052-18d5-5297-f1c7-44ca5b8285f5@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
 <20221207-rpi-hdmi-improvements-v1-2-6b15f774c13a@cerno.tech>
 <38a5f052-18d5-5297-f1c7-44ca5b8285f5@suse.de>
Date: Wed, 11 Jan 2023 16:17:12 +0200
Message-ID: <87wn5tgnpz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Jan 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 07.12.22 um 17:07 schrieb Maxime Ripard:
>> None of our wrappers around container_of to access our objects from the
>> DRM object pointer actually modify the latter.
>> 
>> Let's make them const.
>> 
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Personally, I wouldn't take this patch as it does an implicit const cast 
> on the pointer.
>
> For const correctness, it seems better to add new helpers that keep the 
> const. Those could be use in places where the caller is not allowed to 
> modify the state (i.e., atomic_update, et al).
>
> Something like this:
>
> const struct vc4_hdmi *
> const_connector_to_vc4_hdmi(const struct drm_connector *connector)
> {
> 	return container_of(connector, const struct vc4_hdmi,
> 		connector);
> }

See container_of_const().

BR,
Jani.

>
> Best regards
> Thomas
>
>> ---
>>   drivers/gpu/drm/vc4/vc4_hdmi.h | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
>> index dc3ccd8002a0..023ea64ef006 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
>> @@ -224,13 +224,13 @@ struct vc4_hdmi {
>>   };
>>   
>>   static inline struct vc4_hdmi *
>> -connector_to_vc4_hdmi(struct drm_connector *connector)
>> +connector_to_vc4_hdmi(const struct drm_connector *connector)
>>   {
>>   	return container_of(connector, struct vc4_hdmi, connector);
>>   }
>>   
>>   static inline struct vc4_hdmi *
>> -encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>> +encoder_to_vc4_hdmi(const struct drm_encoder *encoder)
>>   {
>>   	struct vc4_encoder *_encoder = to_vc4_encoder(encoder);
>>   	return container_of(_encoder, struct vc4_hdmi, encoder);
>> @@ -244,7 +244,7 @@ struct vc4_hdmi_connector_state {
>>   };
>>   
>>   static inline struct vc4_hdmi_connector_state *
>> -conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
>> +conn_state_to_vc4_hdmi_conn_state(const struct drm_connector_state *conn_state)
>>   {
>>   	return container_of(conn_state, struct vc4_hdmi_connector_state, base);
>>   }
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
