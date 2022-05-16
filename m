Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBDC5283D4
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 14:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C079110E4E8;
	Mon, 16 May 2022 12:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D602C10E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 12:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652702755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vG/ZLIgl/6sRfeOy7UnubeHdfQCIjGvrLP2A/YOFXi0=;
 b=Fom5uD0x5rLilCSwlX9xDVvwSI4cMiVaQ068SP0oc3CWLf4jkWJzqPqnOBoIGsopmcaL/g
 EVCOMsZB+6fljlpwFoVK59f52B+qT7VpmzEsu07qPI9upNPm5vDoDTrydpKrf94YKwuBKM
 X77CB2G8f8nbQoM7pazU5/DHdsQaO9c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-HmQMIqyTPem9ffthjDBhAg-1; Mon, 16 May 2022 08:05:52 -0400
X-MC-Unique: HmQMIqyTPem9ffthjDBhAg-1
Received: by mail-ed1-f70.google.com with SMTP id
 p13-20020aa7c4cd000000b0042ab847aba8so982741edr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 05:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vG/ZLIgl/6sRfeOy7UnubeHdfQCIjGvrLP2A/YOFXi0=;
 b=pzR9MSiAvPFbWZXDu8yJ6Jd9XOHjVzEgu+s9zk95bYG3Uzj48Rc1H5gxVLPNUPtoFJ
 Ke8y/Wbf90YWbWo7pTqfcO4rQn5TDd9fD4YajcUEca4okBdbzKtsDLmD7/1zBxS3SZbA
 TJGsW0Wap95V0zmUyMl3cOYN0Z9aKS2FzmpWeo/4/cPpv3A5NIqS2ue828UoBd8LZ4v+
 4SFKH2C4NCiIQbEoZC1f8Q3CaloszFusckLwqYAALYOLxGuqYKKH6Hn5EHMTIi3trhRY
 qSock9+5ebVllP3KJT6B0v1E8yCadHEyJ1pHrKCxyRP1Jz6dWZ40XbyIO5+bHxQPIGwD
 /i8w==
X-Gm-Message-State: AOAM533WlNCVtqA+jVRtm97/gTrCRK86PmsiYjYAlwGSlbvRRAoGVcEX
 fRQ4heoL9XJXfR5VjrbiGlgS0EagdLmUNiCIlPSpDlu7AwkM1zM1ApU+PIULF9R9LmhJyIoTTeN
 VQOdh4za6HacWeyQWHOyCl8RMy5dc
X-Received: by 2002:a05:6402:b8f:b0:42a:be5d:7a94 with SMTP id
 cf15-20020a0564020b8f00b0042abe5d7a94mr769283edb.150.1652702750683; 
 Mon, 16 May 2022 05:05:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAN7T+5N/B7gyP+ujGejIQ5hVeT1KxXFDW1cynVLgUOmc51xLNbcUysPS1+TQF7PAajXo6tA==
X-Received: by 2002:a05:6402:b8f:b0:42a:be5d:7a94 with SMTP id
 cf15-20020a0564020b8f00b0042abe5d7a94mr769267edb.150.1652702750470; 
 Mon, 16 May 2022 05:05:50 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 jl6-20020a17090775c600b006fd6f7b3c84sm3646784ejc.46.2022.05.16.05.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 05:05:49 -0700 (PDT)
Message-ID: <63a9c130-a302-3fec-fcbc-e18c3918ae75@redhat.com>
Date: Mon, 16 May 2022 14:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 2/5] drm: Add HPD state to
 drm_connector_oob_hotplug_event()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
 <20220502165316.4167199-3-bjorn.andersson@linaro.org>
 <YoI0wx/LPK4ZrUFf@kuha.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YoI0wx/LPK4ZrUFf@kuha.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/16/22 13:25, Heikki Krogerus wrote:
> +Hans
> 
> Hans, do you have any comments?

Thanks for the ping, this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> On Mon, May 02, 2022 at 09:53:13AM -0700, Bjorn Andersson wrote:
>> In some implementations, such as the Qualcomm platforms, the display
>> driver has no way to query the current HPD state and as such it's
>> impossible to distinguish between disconnect and attention events.
>>
>> Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
>> state.
>>
>> Also push the test for unchanged state in the displayport altmode driver
>> into the i915 driver, to allow other drivers to act upon each update.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>
>> Changes since v3:
>> - Transition to drm_connector_status instead of custom hpd_state 
>>
>>  drivers/gpu/drm/drm_connector.c          |  6 ++++--
>>  drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++++++++++++---
>>  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>>  drivers/usb/typec/altmodes/displayport.c | 10 +++-------
>>  include/drm/drm_connector.h              |  6 ++++--
>>  5 files changed, 28 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 1c48d162c77e..e86c69f0640f 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -2794,6 +2794,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>  /**
>>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>>   * @connector_fwnode: fwnode_handle to report the event on
>> + * @status: hot plug detect logical state
>>   *
>>   * On some hardware a hotplug event notification may come from outside the display
>>   * driver / device. An example of this is some USB Type-C setups where the hardware
>> @@ -2803,7 +2804,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>>   * This function can be used to report these out-of-band events after obtaining
>>   * a drm_connector reference through calling drm_connector_find_by_fwnode().
>>   */
>> -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
>> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>> +				     enum drm_connector_status status)
>>  {
>>  	struct drm_connector *connector;
>>  
>> @@ -2812,7 +2814,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
>>  		return;
>>  
>>  	if (connector->funcs->oob_hotplug_event)
>> -		connector->funcs->oob_hotplug_event(connector);
>> +		connector->funcs->oob_hotplug_event(connector, status);
>>  
>>  	drm_connector_put(connector);
>>  }
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index e4a79c11fd25..56cc023f7bbd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -4951,15 +4951,26 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
>>  	return intel_modeset_synced_crtcs(state, conn);
>>  }
>>  
>> -static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
>> +static void intel_dp_oob_hotplug_event(struct drm_connector *connector,
>> +				       enum drm_connector_status hpd_state)
>>  {
>>  	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
>>  	struct drm_i915_private *i915 = to_i915(connector->dev);
>> +	bool hpd_high = hpd_state == connector_status_connected;
>> +	unsigned int hpd_pin = encoder->hpd_pin;
>> +	bool need_work = false;
>>  
>>  	spin_lock_irq(&i915->irq_lock);
>> -	i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
>> +	if (hpd_high != test_bit(hpd_pin, &i915->hotplug.oob_hotplug_last_state)) {
>> +		i915->hotplug.event_bits |= BIT(hpd_pin);
>> +
>> +		__assign_bit(hpd_pin, &i915->hotplug.oob_hotplug_last_state, hpd_high);
>> +		need_work = true;
>> +	}
>>  	spin_unlock_irq(&i915->irq_lock);
>> -	queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
>> +
>> +	if (need_work)
>> +		queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
>>  }
>>  
>>  static const struct drm_connector_funcs intel_dp_connector_funcs = {
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 24111bf42ce0..96c088bb5522 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -135,6 +135,9 @@ struct i915_hotplug {
>>  	/* Whether or not to count short HPD IRQs in HPD storms */
>>  	u8 hpd_short_storm_enabled;
>>  
>> +	/* Last state reported by oob_hotplug_event for each encoder */
>> +	unsigned long oob_hotplug_last_state;
>> +
>>  	/*
>>  	 * if we get a HPD irq from DP and a HPD irq from non-DP
>>  	 * the non-DP HPD could block the workqueue on a mode config
>> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>> index c1d8c23baa39..9360ca177c7d 100644
>> --- a/drivers/usb/typec/altmodes/displayport.c
>> +++ b/drivers/usb/typec/altmodes/displayport.c
>> @@ -59,7 +59,6 @@ struct dp_altmode {
>>  	struct typec_displayport_data data;
>>  
>>  	enum dp_state state;
>> -	bool hpd;
>>  
>>  	struct mutex lock; /* device lock */
>>  	struct work_struct work;
>> @@ -143,10 +142,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>>  		if (!ret)
>>  			dp->state = DP_STATE_CONFIGURE;
>>  	} else {
>> -		if (dp->hpd != hpd) {
>> -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
>> -			dp->hpd = hpd;
>> -		}
>> +		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>> +						hpd ? connector_status_connected : connector_status_disconnected);
>>  	}
>>  
>>  	return ret;
>> @@ -573,8 +570,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
>>  	cancel_work_sync(&dp->work);
>>  
>>  	if (dp->connector_fwnode) {
>> -		if (dp->hpd)
>> -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
>> +		drm_connector_oob_hotplug_event(dp->connector_fwnode, connector_status_disconnected);
>>  
>>  		fwnode_handle_put(dp->connector_fwnode);
>>  	}
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 3ac4bf87f257..886aa1861ed9 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1141,7 +1141,8 @@ struct drm_connector_funcs {
>>  	 * This will get called when a hotplug-event for a drm-connector
>>  	 * has been received from a source outside the display driver / device.
>>  	 */
>> -	void (*oob_hotplug_event)(struct drm_connector *connector);
>> +	void (*oob_hotplug_event)(struct drm_connector *connector,
>> +				  enum drm_connector_status status);
>>  
>>  	/**
>>  	 * @debugfs_init:
>> @@ -1749,7 +1750,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
>>  		DRM_CONNECTOR_UNREGISTERED;
>>  }
>>  
>> -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
>> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>> +				     enum drm_connector_status status);
>>  const char *drm_get_connector_type_name(unsigned int connector_type);
>>  const char *drm_get_connector_status_name(enum drm_connector_status status);
>>  const char *drm_get_subpixel_order_name(enum subpixel_order order);
>> -- 
>> 2.35.1
> 

