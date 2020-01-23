Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F581462E7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 08:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEFC6FB1A;
	Thu, 23 Jan 2020 07:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from o1.b.az.sendgrid.net (o1.b.az.sendgrid.net [208.117.55.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEE06FB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
 content-transfer-encoding;
 s=001; bh=cPADCihrOp2iEwXvzCIzigYgIWVEfxQoks52hK/GuAw=;
 b=M8iYzr2wZajSMoERhcN+1Cq0YlnC8OTe2bv0Tjahox4L2siKNB7HoPTXpr4RZ0cvOmYg
 DbspjG37cNLLK5hLtGfZoGbpXyFPikL8GzDOL1NlLxNw9IPQjxga+Hw5/q24mEE1jh3z1I
 VoGD2wD3vwF6j5L1blj2ZAotuFD7pZIOU=
Received: by filterdrecv-p3iad2-57f487d66-whbch with SMTP id
 filterdrecv-p3iad2-57f487d66-whbch-18-5E2950DB-14
 2020-01-23 07:52:59.598201321 +0000 UTC m=+3222382.562160735
Received: from [192.168.1.14] (unknown [98.128.173.80])
 by ismtpd0007p1lon1.sendgrid.net (SG) with ESMTP id kejN4PUGRdmRt3MoLN_efA
 Thu, 23 Jan 2020 07:52:59.229 +0000 (UTC)
Subject: Re: [PATCH v7 06/12] drm/bridge: Add the necessary bits to support
 bus format negotiation
References: <20200122111700.1924960-1-boris.brezillon@collabora.com>
 <20200122111700.1924960-7-boris.brezillon@collabora.com>
 <5a15dda1-0791-c1b6-94aa-4fed25bbcca9@kwiboo.se>
 <20200123083933.64fc98be@collabora.com>
From: Jonas Karlman <jonas@kwiboo.se>
Message-ID: <cc8ce5e0-f502-e3ee-e677-eeb7ad532513@kwiboo.se>
Date: Thu, 23 Jan 2020 07:52:59 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200123083933.64fc98be@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h4TCeMaRXvlR+d+tH?=
 =?us-ascii?Q?o+itrL5Tkci994oX4c25qQtYI3EOV9qu3j+HXp3?=
 =?us-ascii?Q?SSfCyyWQOUZt2DcbVLohlrJdAjwRJhLepHmIXkG?=
 =?us-ascii?Q?F1ZDU3OOjxmRb+5fsBr8MRlb5smhcgY2O17Yb56?=
 =?us-ascii?Q?nyjUzMnIC7lKxWzNoTBx3UzFFycHw1tgT1fnQgw?=
 =?us-ascii?Q?JEPKtFDiQDaPYILe=2F4KIQ=3D=3D?=
To: Boris Brezillon <boris.brezillon@collabora.com>
Content-Language: sv
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-23 08:39, Boris Brezillon wrote:
> On Wed, 22 Jan 2020 23:44:28 +0000 (UTC)
> Jonas Karlman <jonas@kwiboo.se> wrote:
> 
>>> +static int
>>> +drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>>> +					struct drm_crtc_state *crtc_state,
>>> +					struct drm_connector_state *conn_state)
>>> +{
>>> +	struct drm_connector *conn = conn_state->connector;
>>> +	struct drm_encoder *encoder = bridge->encoder;
>>> +	struct drm_bridge_state *last_bridge_state;
>>> +	unsigned int i, num_out_bus_fmts;
>>> +	struct drm_bridge *last_bridge;
>>> +	u32 *out_bus_fmts;
>>> +	int ret = 0;
>>> +
>>> +	last_bridge = list_last_entry(&encoder->bridge_chain,
>>> +				      struct drm_bridge, chain_node);
>>> +	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>>> +							    last_bridge);
>>> +
>>> +	if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>>> +		const struct drm_bridge_funcs *funcs = last_bridge->funcs;
>>> +
>>> +		/*
>>> +		 * If the driver implements ->atomic_get_output_bus_fmts() it
>>> +		 * should also implement the atomic state hooks.
>>> +		 */
>>> +		if (WARN_ON(last_bridge_state))  
>>
>> This looks wrong, with this changed to WARN_ON(!last_bridge_state)
>> my RK3328 HDMI2.0/YUV444/YUV420/10-bit branch at [1] starts working.
>>
>> With WARN_ON(last_bridge_state) I get:
>>
>> [    6.606658] WARNING: CPU: 0 PID: 167 at drivers/gpu/drm/drm_bridge.c:746 drm_atomic_bridge_chain_check+0x2b8/0x308
>> [    6.606673] Hardware name: Pine64 Rock64 (DT)
>>
>> [    6.606754] Call trace:
>> [    6.606759]  drm_atomic_bridge_chain_check+0x2b8/0x308
>> [    6.606764]  drm_atomic_helper_check_modeset+0x89c/0xab8
>> [    6.606768]  drm_atomic_helper_check+0x1c/0xa0
>> [    6.606772]  drm_atomic_check_only+0x464/0x708
>> [    6.606777]  drm_atomic_commit+0x18/0x58
> 
> Add
> 
> const drm_bridge_funcs ... = {
> 	...
> 	.atomic_reset = drm_atomic_helper_bridge_reset,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	...
> };
> 
> and that should work.

That is what I added and what made that this warning is being triggered.
The comment state that atomic state is needed, but the check warns when there is a state.

I have this:

static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
	...
	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
	.atomic_check = dw_hdmi_bridge_atomic_check,
	.atomic_reset = drm_atomic_helper_bridge_reset,
	...
};

and

static const struct drm_bridge_funcs dw_hdmi_rockchip_bridge_funcs = {
	...
	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
	.atomic_get_input_bus_fmts = dw_hdmi_rockchip_get_input_bus_fmts,
	.atomic_check = dw_hdmi_rockchip_bridge_atomic_check,
	.atomic_reset = drm_atomic_helper_bridge_reset,
};

after applying the following I got a hdmi signal again

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0c28816146ba..7e7b0fac8f4f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -743,7 +743,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 		 * If the driver implements ->atomic_get_output_bus_fmts() it
 		 * should also implement the atomic state hooks.
 		 */
-		if (WARN_ON(last_bridge_state))
+		if (WARN_ON(!last_bridge_state))
 			return -EINVAL;
 
 		out_bus_fmts = funcs->atomic_get_output_bus_fmts(last_bridge,

Regards,
Jonas

> 
>>
>> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20200122-bus-format
>>
>> Regards,
>> Jonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
