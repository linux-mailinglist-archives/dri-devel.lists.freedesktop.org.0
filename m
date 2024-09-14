Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FB97932E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 21:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908F110E047;
	Sat, 14 Sep 2024 19:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZsfJFGSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC5010E047
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 19:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726341150;
 bh=PHZHrVw10h99rYEQdEFbDtMypLDFs11UWr5JxLxSJxc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZsfJFGSYVsRNIwiMZkbPX4u3316vZoyqdoN5oaoIHurdx8PORAWYwKCaI2Ya8Eq7j
 ZjUPDFuoAbXYO5f0MqVNQv9EbaBriNnVCJGKtLRoTSnqokcQtdczHiTVDdYaON+JBn
 xXTjY/+IzgYlZ4Au5t9dzm/XMV5E1YiowMkGvd0eNkOR3RksqGoTPmIB3ArhvC6qSN
 ml4C7jyy2TVNCU8VQ6+Ab45XU8dGK+JRHbl1K9NB0djtMIe6YxB+zg532IXMId9oyL
 KtEVWAMO8FHw1ahJg2fILKtgdSFo/Gx63i4FEjrKaqA6FNmDAtTFjPVBSWpcdoBJFv
 CBvYulvUh0Ycw==
Received: from [192.168.1.90] (unknown [188.27.55.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1122E17E3612;
 Sat, 14 Sep 2024 21:12:30 +0200 (CEST)
Message-ID: <f8b17995-ce53-45ab-8e68-c7087dbc9786@collabora.com>
Date: Sat, 14 Sep 2024 22:12:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/bridge: synopsys: Add DW HDMI QP TX Controller
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
References: <20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com>
 <20240906-b4-rk3588-bridge-upstream-v6-1-a3128fb103eb@collabora.com>
 <20240909-horned-congenial-curassow-ebc5fa@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20240909-horned-congenial-curassow-ebc5fa@houat>
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

Hi Maxime,

On 9/9/24 6:13 PM, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Sep 06, 2024 at 04:17:40AM GMT, Cristian Ciocaltea wrote:
>> +static enum drm_connector_status
>> +dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge)
>> +{
>> +	struct dw_hdmi_qp *hdmi = bridge->driver_private;
>> +	enum drm_connector_status status;
>> +
>> +	status = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
>> +
>> +	dev_dbg(hdmi->dev, "%s conn=%d scramb=%d\n", __func__,
>> +		status == connector_status_connected, hdmi->scramb_enabled);
>> +
>> +	if (hdmi->scramb_enabled) {
>> +		cancel_delayed_work_sync(&hdmi->scramb_work);
>> +
>> +		if (status == connector_status_connected)
>> +			dw_hdmi_qp_check_and_set_scramb(hdmi);
>> +	}
>> +
>> +	return status;
>> +}
> 
> Unfortunately, that won't work. The HDMI Spec has (HDMI 2.0, Section
> 6.1.3.1 - Scrambling Control):
> 
> The minimum time period between the write to the Scrambling_Enable bit,
> and the transmission of a scrambled video signal is not specified;
> however the Source shall not begin transmission of a scrambled video
> signal before writing a 1 to the Scrambling_Enable bit. The maximum time
> period between the write to the Scrambling_Enable bit and the
> transmission of a scrambled video signal shall be 100 ms.
> 
> So you need to disable the output and enable it again.
> 
> vc4 does just that, you can have a look here:
> https://elixir.bootlin.com/linux/v6.10.9/source/drivers/gpu/drm/vc4/vc4_hdmi.c#L410

Thanks for all the details and references!

Unfortunately I had to drop the scrambling setup for now [1], as I
encountered some issues while attempting to get this implemented as
suggested.  Will get back to this and submit it separately when done.

Regards,
Cristian

[1] https://lore.kernel.org/lkml/20240914-b4-rk3588-bridge-upstream-v7-0-2b1348137123@collabora.com/

