Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2B968F1B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 23:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381F210E3BC;
	Mon,  2 Sep 2024 21:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="kDv/6r5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF1210E3BC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 21:12:21 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725311533; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JwAKCfgdatJkOj+LpW6Ekfn324S4piCedRCyzcE3OihQ52UM3hR04c6dURjvhz0mvqCHAh2q7TFiOsMvsps8jPK8C9AeC5SO0jyrrluM/ELIrj/j2ajamuoBCXYikopmWUeIh9LyrKiXCGiAKcqV8pos47rR/CDYIchX5pIs6iU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725311533;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gcEMGv0FHpr9nNpZ/Gd7YBKiaJiXZ1zN6+bJa53L2CY=; 
 b=ei+qCc4NjAw/WmxNzbGYXPc53dO+llpzmDkXRd3tOUSvprAOSkIMx0CdEBKrymrFMKhhbhHeJNdHMDHZmWBcxQC7cQYO1oz9qt25H/lXcrqzNmXI8vBLfFKLEmdTuHEJD2+O7cCxEBCjE7Do+9+q21jP+iuR4evwxO60Bht5mcc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725311533; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=gcEMGv0FHpr9nNpZ/Gd7YBKiaJiXZ1zN6+bJa53L2CY=;
 b=kDv/6r5gyxkyU9MDc6BAPTO89AvtwgPqAhRwO7Hnk9p3rAulIJEVMA+Av0DHG4MI
 6vkXDc+5X9MyQoBzbFP9+IVSaLbfKYulR29gc/KWMvQkU6kxXlurxK091YcXWH6s9rB
 3zAMs5y9MOLWK8tZOwikhRKyQ7Pf8pdUDD04vk4w=
Received: by mx.zohomail.com with SMTPS id 1725311530551764.3736823391141;
 Mon, 2 Sep 2024 14:12:10 -0700 (PDT)
Message-ID: <6e20410a-a24d-4454-8577-2cff65319a2a@collabora.com>
Date: Tue, 3 Sep 2024 00:12:02 +0300
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
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20240902-turtle-of-major-glory-efb4e8@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 9/2/24 10:36 AM, Maxime Ripard wrote:
> On Sat, Aug 31, 2024 at 01:21:48AM GMT, Cristian Ciocaltea wrote:
>> On 8/27/24 11:58 AM, Maxime Ripard wrote:
>>> On Mon, Aug 19, 2024 at 01:29:29AM GMT, Cristian Ciocaltea wrote:
>>>> +static irqreturn_t dw_hdmi_qp_main_hardirq(int irq, void *dev_id)
>>>> +{
>>>> +	struct dw_hdmi_qp *hdmi = dev_id;
>>>> +	struct dw_hdmi_qp_i2c *i2c = hdmi->i2c;
>>>> +	u32 stat;
>>>> +
>>>> +	stat = dw_hdmi_qp_read(hdmi, MAINUNIT_1_INT_STATUS);
>>>> +
>>>> +	i2c->stat = stat & (I2CM_OP_DONE_IRQ | I2CM_READ_REQUEST_IRQ |
>>>> +			    I2CM_NACK_RCVD_IRQ);
>>>> +
>>>> +	if (i2c->stat) {
>>>> +		dw_hdmi_qp_write(hdmi, i2c->stat, MAINUNIT_1_INT_CLEAR);
>>>> +		complete(&i2c->cmp);
>>>> +	}
>>>> +
>>>> +	if (stat)
>>>> +		return IRQ_HANDLED;
>>>> +
>>>> +	return IRQ_NONE;
>>>> +}
>>>
>>> If the scrambler is enabled, you need to deal with hotplug. On hotplug,
>>> the monitor will drop its TMDS ratio and scrambling status, but the
>>> driver will keep assuming it's been programmed.
>>>
>>> If you don't have a way to deal with hotplug yet, then I'd suggest to
>>> just drop the scrambler setup for now.
>>
>> Thanks for the heads up!
>>
>> HPD is partially handled by the RK platform driver, which makes use of
>> drm_helper_hpd_irq_event(). Since the bridge sets DRM_BRIDGE_OP_DETECT
>> flag, the dw_hdmi_qp_bridge_detect() callback gets executed, which in turn
>> verifies the PHY status via ->read_hpd() implemented as
>> dw_hdmi_qp_rk3588_read_hpd() in the platform driver.
> 
> It's not only about hotplug detection, it's also about what happens
> after you've detected a disconnection / reconnection.
> 
> The framework expects to keep the current mode as is, despite the
> monitor not being setup to use the scrambler anymore, and the display
> remains black.

AFAICS, the ->atomic_enable() callback is always invoked upon
reconnection, hence the scrambler gets properly (re)enabled via
dw_hdmi_qp_setup().

>> During my testing so far it worked reliably when switching displays with
>> different capabilities.  I don't have a 4K@60Hz display at the moment, but
>> used the HDMI RX port on the Rock 5B board in a loopback connection to
>> verify this mode, which triggered the high TMDS clock ratio and scrambling
>> setup as well.
> 
> How did you test exactly?

I initially tested with Sway/wlroots having an app running
(eglgears_wayland) while unplugging/replugging the HDMI connectors in
every possible sequence I could think of (e.g. several times per
display, switching to a different one, repeating, switching again, etc).

I've just retested the whole stuff with Weston and confirm it works as
expected, i.e. no black screen (or bad capture stream for the 4K@60Hz
case) after any of the reconnections.

Regards,
Cristian
