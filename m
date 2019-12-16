Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5669120919
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 15:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021126E5BE;
	Mon, 16 Dec 2019 14:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD5D6E5BE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576508363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgxIae4uHF0MmTIXvAv4l9vfuK6CFRl82IuYqE7HjYY=;
 b=QXB6HY08/hvrLbaCAws3An9JT+oPLquJiKtvMs7SAsVEnS1Nqg7uBMhzOJz6DiuB3N9Lo0
 Ug9/V4uY3h2DYvXIVeEV4q2+x+WVh17+9zQ/4Rcrzi6iK0Jjl0xm5FPo93YJFfvgjl85qs
 xoFAO7G3iTKYYAocdYs4zoLFE5N6kR0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-PZv_NPEHOXW3QtCA7PUQEA-1; Mon, 16 Dec 2019 09:59:22 -0500
Received: by mail-wm1-f71.google.com with SMTP id 7so1130340wmf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 06:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uJOt3/otHQDZlenhUklrLoPIwdlpgH1LgHZIHE3PiAw=;
 b=HrFlXGUVGZ+Gr/ZiNimBLsfrsN/Yf741CK3SajqpuJDOIRCpXXpThaCQaYkQtadFKl
 Bcgwfww9AoUSZ6dRwifdZZzmZLYmJq4zbsAqJ67NOkYjJV1PN8fBuK5El13OmbS07E40
 DMfgamU7+E+PmD+aJP/x8Q9OJwsUZRk5XYoF2vnRxaEk3lveuuGuHJ5/XdU8j7TsxxJs
 VmYeJGHHPqwRDvcEc6vsmqgi3qCzSfBbE/m3yxq55eopRqQfeHrMJ4plGMOFONW8G8Uy
 zG6vD7sByo3Sp8bGJyOf8UlkVaUh0ZuSDwyclAXepTtU6aZhGOUwzFrtqx/G4HTs6J4q
 xPVQ==
X-Gm-Message-State: APjAAAWKfzly8FFTed+OSImhbgLwQ7KVUbLNyjZjJT7K1f5t6qyDGkwc
 molYJnnII6GXN9QzP3clROPIzJk8zKHAEetzKiqzyARw8ga/p0iCNh/U45G40IttZMvIVdGl8/X
 JroKLE15FTDQuFXs+O/iXbq9XbyFe
X-Received: by 2002:a5d:610a:: with SMTP id v10mr27484183wrt.267.1576508360246; 
 Mon, 16 Dec 2019 06:59:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqywGl8Dz3HRQB6nfkN44c07NNAivBGuMSN91rqy5SqGN+A6SlKsV91NWVHxZorRzf4H2zUCSw==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr27484159wrt.267.1576508360016; 
 Mon, 16 Dec 2019 06:59:20 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id s8sm21521486wrt.57.2019.12.16.06.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 06:59:19 -0800 (PST)
Subject: Re: [PATCH 3/5] drm/i915/dsi: Init panel-enable GPIO to low when the
 LCD is initially off
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-4-hdegoede@redhat.com>
 <20191216134551.GQ1208@intel.com>
 <c7fe3911-be20-33dd-96c1-58eccd0f323f@redhat.com>
 <20191216141450.GU1208@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <55e2ddf4-cd20-2663-d625-3836fac5f0c7@redhat.com>
Date: Mon, 16 Dec 2019 15:59:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216141450.GU1208@intel.com>
Content-Language: en-US
X-MC-Unique: PZv_NPEHOXW3QtCA7PUQEA-1
X-Mimecast-Spam-Score: 0
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
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Jones <lee.jones@linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16-12-2019 15:14, Ville Syrj=E4l=E4 wrote:
> On Mon, Dec 16, 2019 at 02:51:54PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> Thank you for the reviews.
>>
>> On 16-12-2019 14:45, Ville Syrj=E4l=E4 wrote:
>>> On Sun, Dec 15, 2019 at 05:38:08PM +0100, Hans de Goede wrote:
>>>> When the LCD has not been turned on by the firmware/GOP, because e.g. =
the
>>>> device was booted with an external monitor connected over HDMI, we sho=
uld
>>>> not turn on the panel-enable GPIO when we request it.
>>>>
>>>> Turning on the panel-enable GPIO when we request it, means we turn it =
on
>>>> too early in the init-sequence, which causes some panels to not correc=
tly
>>>> light up.
>>>>
>>>> This commits adds a panel_is_on parameter to intel_dsi_vbt_gpio_init()
>>>> and makes intel_dsi_vbt_gpio_init() set the initial GPIO value accordi=
ngly.
>>>>
>>>> This fixes the panel not lighting up on a Thundersoft TST168 tablet wh=
en
>>>> booted with an external monitor connected over HDMI.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
>>>>    drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 7 +++----
>>>>    drivers/gpu/drm/i915/display/vlv_dsi.c       | 2 +-
>>>>    3 files changed, 5 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/dr=
m/i915/display/intel_dsi.h
>>>> index de7e51cd3460..675771ea91aa 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
>>>> @@ -203,7 +203,7 @@ void bxt_dsi_reset_clocks(struct intel_encoder *en=
coder, enum port port);
>>>>    =

>>>>    /* intel_dsi_vbt.c */
>>>>    bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
>>>> -void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
>>>> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_=
is_on);
>>>>    void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
>>>>    void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
>>>>    				 enum mipi_seq seq_id);
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gp=
u/drm/i915/display/intel_dsi_vbt.c
>>>> index 5352e8c9eca5..027970348b22 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>>>> @@ -688,17 +688,16 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_=
dsi, u16 panel_id)
>>>>     * On some BYT/CHT devs some sequences are incomplete and we need t=
o manually
>>>>     * control some GPIOs.
>>>>     */
>>>> -void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
>>>> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_=
is_on)
>>>>    {
>>>>    	struct drm_device *dev =3D intel_dsi->base.base.dev;
>>>>    	struct drm_i915_private *dev_priv =3D to_i915(dev);
>>>>    	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
>>>> +	enum gpiod_flags flags =3D panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_=
LOW;
>>>
>>> Can't we just tell it not to change the current setting?
>>
>> We could use GPIOD_ASIS for that, but with the SoC pins (when the PMIC is
>> not used for backlight control) things get a bit muddy, I've seen several
>> instances of this message from drivers/pinctrl/intel/pinctrl-baytrail.c
>> trigger when the GOP did not init the panel:
>>
>> dev_warn(vg->dev, FW_BUG "pin %u forcibly re-configured as GPIO\n", offs=
et);
>>
>> And in that case with GPIOD_ASIS I have no idea which we initially get,
>> so this approach, where we clearly define which initial value we want,
>> seems better.
> =

> I suppose. Probably better to not abuse the current_mode pointer for
> that though and just explicitly call encoder->get_hw_state() instead.

Ok, I'll fix this for v2 of the patch-set.

Regards,

Hans





>> p.s.
>>
>> The intel-gfx CI seems to seriously dislike my patches lately, almost
>> always failing them; and usually on what at least seem to be unrelated
>> test-cases. Any advice on how to deal with this?
> =

> Yeah, CI is snafu. I keep smashing retest until it gets through BAT
> and then just double check the shard results to make sure nothing
> relevant has tripped. If things look OK I recommend replying to the
> result mail and provide a few short log snippets/other details on
> what failed so that it's clear that it's irrelevant.
> =

>>
>>
>>
>>
>>>
>>>>    =

>>>>    	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>>>>    	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
>>>> -		intel_dsi->gpio_panel =3D
>>>> -			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
>>>> -
>>>> +		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
>>>>    		if (IS_ERR(intel_dsi->gpio_panel)) {
>>>>    			DRM_ERROR("Failed to own gpio for panel control\n");
>>>>    			intel_dsi->gpio_panel =3D NULL;
>>>> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/=
i915/display/vlv_dsi.c
>>>> index 178d0fffba5b..e86e4a11e199 100644
>>>> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
>>>> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
>>>> @@ -1910,7 +1910,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_p=
riv)
>>>>    =

>>>>    	vlv_dphy_param_init(intel_dsi);
>>>>    =

>>>> -	intel_dsi_vbt_gpio_init(intel_dsi);
>>>> +	intel_dsi_vbt_gpio_init(intel_dsi, current_mode !=3D NULL);
>>>>    =

>>>>    	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
>>>>    			   DRM_MODE_CONNECTOR_DSI);
>>>> -- =

>>>> 2.23.0
>>>
> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
