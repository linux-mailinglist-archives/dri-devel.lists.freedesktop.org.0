Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9036F96E747
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 03:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0F210E3F6;
	Fri,  6 Sep 2024 01:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="I0z8MhFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEB310E3F6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 01:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725585949;
 bh=twD2+guI6vGmeVSCxuwshV4bdnrlz1eKgsdVK6G0nz8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I0z8MhFot0zBmV2E1zZE4VX6eHdN1ywxA7go0CGWS0kueNouEbeZyAX5hE4S4RRwy
 VHnrMk8pkVCJBWWcqh4HHkmujEfYaLP60JVpF4pBCTBl4w42FpMRpdVxlcWwmkeC1E
 sS0Klb/CKczuQqsfnlFk2KI+87zMeCCk97kAUzU0dROm+UjmZhMM5TOLgE8fy5+Nwx
 RlIIHyxnnS+jszl+f0krWB9vCk1ys3/RR8FGDEkb+bIZOKQSn3G1TFEhfpRt/Rym8g
 aNCmk5lGJQIVL4KwAlvNNMqmC1khf4uDATgN3bqDOxkZN1PRjBkvvGelHKzgu6sS6f
 xjYnqt815ISjQ==
Received: from [192.168.1.90] (unknown [188.27.55.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9289417E0E95;
 Fri,  6 Sep 2024 03:25:48 +0200 (CEST)
Message-ID: <fa265088-5bf4-420f-9456-44051f913164@collabora.com>
Date: Fri, 6 Sep 2024 04:25:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/bridge: synopsys: Add DW HDMI QP TX Controller
 support library
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <20240819-b4-rk3588-bridge-upstream-v4-2-6417c72a2749@collabora.com>
 <20240827-armored-magnificent-badger-ffb025@houat>
 <34422b7a-ce70-445d-a574-60ac36322119@collabora.com>
 <20240902-turtle-of-major-glory-efb4e8@houat>
 <6e20410a-a24d-4454-8577-2cff65319a2a@collabora.com>
 <20240903-archetypal-soft-wildebeest-b5ea68@houat>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20240903-archetypal-soft-wildebeest-b5ea68@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/3/24 11:09 AM, Maxime Ripard wrote:
> On Tue, Sep 03, 2024 at 12:12:02AM GMT, Cristian Ciocaltea wrote:
>> On 9/2/24 10:36 AM, Maxime Ripard wrote:
>>> On Sat, Aug 31, 2024 at 01:21:48AM GMT, Cristian Ciocaltea wrote:
>>>> On 8/27/24 11:58 AM, Maxime Ripard wrote:
>>>>> On Mon, Aug 19, 2024 at 01:29:29AM GMT, Cristian Ciocaltea wrote:
>>>>>> +static irqreturn_t dw_hdmi_qp_main_hardirq(int irq, void *dev_id)
>>>>>> +{
>>>>>> +	struct dw_hdmi_qp *hdmi = dev_id;
>>>>>> +	struct dw_hdmi_qp_i2c *i2c = hdmi->i2c;
>>>>>> +	u32 stat;
>>>>>> +
>>>>>> +	stat = dw_hdmi_qp_read(hdmi, MAINUNIT_1_INT_STATUS);
>>>>>> +
>>>>>> +	i2c->stat = stat & (I2CM_OP_DONE_IRQ | I2CM_READ_REQUEST_IRQ |
>>>>>> +			    I2CM_NACK_RCVD_IRQ);
>>>>>> +
>>>>>> +	if (i2c->stat) {
>>>>>> +		dw_hdmi_qp_write(hdmi, i2c->stat, MAINUNIT_1_INT_CLEAR);
>>>>>> +		complete(&i2c->cmp);
>>>>>> +	}
>>>>>> +
>>>>>> +	if (stat)
>>>>>> +		return IRQ_HANDLED;
>>>>>> +
>>>>>> +	return IRQ_NONE;
>>>>>> +}
>>>>>
>>>>> If the scrambler is enabled, you need to deal with hotplug. On hotplug,
>>>>> the monitor will drop its TMDS ratio and scrambling status, but the
>>>>> driver will keep assuming it's been programmed.
>>>>>
>>>>> If you don't have a way to deal with hotplug yet, then I'd suggest to
>>>>> just drop the scrambler setup for now.
>>>>
>>>> Thanks for the heads up!
>>>>
>>>> HPD is partially handled by the RK platform driver, which makes use of
>>>> drm_helper_hpd_irq_event(). Since the bridge sets DRM_BRIDGE_OP_DETECT
>>>> flag, the dw_hdmi_qp_bridge_detect() callback gets executed, which in turn
>>>> verifies the PHY status via ->read_hpd() implemented as
>>>> dw_hdmi_qp_rk3588_read_hpd() in the platform driver.
>>>
>>> It's not only about hotplug detection, it's also about what happens
>>> after you've detected a disconnection / reconnection.
>>>
>>> The framework expects to keep the current mode as is, despite the
>>> monitor not being setup to use the scrambler anymore, and the display
>>> remains black.
>>
>> AFAICS, the ->atomic_enable() callback is always invoked upon
>> reconnection, hence the scrambler gets properly (re)enabled via
>> dw_hdmi_qp_setup().
> 
> No, it's not.
> 
>>>> During my testing so far it worked reliably when switching displays with
>>>> different capabilities.  I don't have a 4K@60Hz display at the moment, but
>>>> used the HDMI RX port on the Rock 5B board in a loopback connection to
>>>> verify this mode, which triggered the high TMDS clock ratio and scrambling
>>>> setup as well.
>>>
>>> How did you test exactly?
>>
>> I initially tested with Sway/wlroots having an app running
>> (eglgears_wayland) while unplugging/replugging the HDMI connectors in
>> every possible sequence I could think of (e.g. several times per
>> display, switching to a different one, repeating, switching again, etc).
>>
>> I've just retested the whole stuff with Weston and confirm it works as
>> expected, i.e. no black screen (or bad capture stream for the 4K@60Hz
>> case) after any of the reconnections.
> 
> Then I guess both sway and weston handle uevent and will change the
> connector mode on reconnection.
> 
> It's not mandatory, and others will just not bother and still expect the
> output to work.
> 
> I guess the easier you can test this with is modetest.

Indeed, modetest doesn't trigger a mode change on reconnection.
This is handled now in v6:

https://lore.kernel.org/all/20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com/

Thanks,
Cristian
