Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A666B0A67B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 16:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0381810E9ED;
	Fri, 18 Jul 2025 14:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="j8vnW06/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE1710E9E1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 14:42:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1ECB442BC;
 Fri, 18 Jul 2025 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752849720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsYtbmooxUDXjhCY1Mg9PgyeqMVLQZ0GuWfwZm2GWIQ=;
 b=j8vnW06/rdawag7U0o4mbPPbEE4AUppKn2nCViLzLzLmQ3XhNDcNdNSvDOwYOWsFAO0pC9
 ZISoblQyImn3weKLV2mC7j2kXT0t/vDY9vR38jvEklJ2k7GvVxa8oDCzRlOlKP8uqMunto
 CPgVFACo+9KuCos34jwz2Xmct21DCyUu3zU5FzwZYnC2WKy6krk8V8RX2YgnFCEhnSBR0r
 LBUERi7CmQpx/dAutGjSS57kQFU3WxjdysJH9vfUGSmWO0fHEYDbbSPuSp3motdlheFpuQ
 4DLPHk7Ga9h0Lx/iMvGtDuSAQAenrZ+4yjIwNKALRuXMP5UeNVuCDi1Zs4HQRQ==
Date: Fri, 18 Jul 2025 16:41:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 08/10] drm/display: bridge-connector: hook in CEC
 notifier support
Message-ID: <20250718164156.194702d9@booty>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-8-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <20250517-drm-hdmi-connector-cec-v6-8-35651db6f19b@oss.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejtefftdelheeghfffffdukefhudejuedvfefhteelfeetgfffkeejteejtddvveenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhin
 hhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepuggrvhgvrdhsthgvvhgvnhhsohhnsehrrghsphgsvghrrhihphhirdgtohhmpdhrtghpthhtohepmhgtrghnrghlsehighgrlhhirgdrtghomh
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

Hi Dmitry,

On Sat, 17 May 2025 04:59:44 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> Allow HDMI DRM bridges to create CEC notifier. Physical address is
> handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
> being called from .detect() path.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

While working on drm_bridge_connector_init() for unrelated changes I
stumbled upon something in this patch (now committed) which at a
cursory look appears wrong to me.  Even though I still haven't analyzed
in depth I'm reporting it ASAP so you are aware and can either correct
me or confirm there is a bug.

> @@ -662,6 +670,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			bridge_connector->bridge_dp_audio = bridge;
>  		}
>  
> +		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> +			if (bridge_connector->bridge_hdmi_cec)
> +				return ERR_PTR(-EBUSY);
> +
> +			bridge_connector->bridge_hdmi_cec = bridge;
> +		}
> +
>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type = bridge->type;
>  
> @@ -724,6 +739,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			return ERR_PTR(ret);
>  	}
>  
> +	if (bridge_connector->bridge_hdmi_cec &&
> +	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> +		ret = drmm_connector_hdmi_cec_notifier_register(connector,
> +								NULL,
> +								bridge->hdmi_cec_dev);

Here you are using the 'bridge' pointer, which is the variable used by
the long drm_for_each_bridge_in_chain() loop at the function top. The
same happens in the following patch. I am not sure this is what was
intended, but I don't understand all the details of your series.

In an older patch [0] you had added a similar change, dereferencing the
same 'bridge' variable after the drm_for_each_bridge_in_chain() loop.
That was a bug fixed by a later patch [1].

Superficially this change (as well as patch 9) appears equally wrong.

Basically the value of 'bridge' here could be NULL or
bridge_connector->bridge_hdmi, depending on the
bridge_connector->bridge_hdmi value.

Is this the what you'd expect?

And if it is, what is the correct fix? Maybe:

	ret = drmm_connector_hdmi_cec_notifier_register(connector,
						NULL,
-						bridge->hdmi_cec_dev);
+						bridge_connector->bridge_hdmi_cec->hdmi_cec_dev);

?

Removing unrelated lines, and adding a few comments, the code flow of
the function is:

struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
						struct drm_encoder *encoder)
{
	struct drm_bridge *bridge, *panel_bridge = NULL;

	drm_for_each_bridge_in_chain(encoder, bridge) {
		/* ...lots of stuff... */

		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
			bridge_connector->bridge_hdmi_cec = bridge;
		}
	}

/* now bridge == NULL */

	if (bridge_connector->bridge_hdmi) {
		bridge = bridge_connector->bridge_hdmi;
	} else {
	}

/* now bridge can be NULL or bridge_connector->bridge_hdmi */

	if (bridge_connector->bridge_hdmi_audio ||
	    bridge_connector->bridge_dp_audio) {
		/* this is the code that got changed by [0] ad fixed by [1] */
		if (bridge_connector->bridge_hdmi_audio)
			bridge = bridge_connector->bridge_hdmi_audio;
		else
			bridge = bridge_connector->bridge_dp_audio;

		dev = bridge->hdmi_audio_dev;

		ret = drm_connector_hdmi_audio_init(connector, dev,
						    &drm_bridge_connector_hdmi_audio_funcs,
						    bridge->hdmi_audio_max_i2s_playback_channels,
						    bridge->hdmi_audio_i2s_formats,
						    bridge->hdmi_audio_spdif_playback,
						    bridge->hdmi_audio_dai_port);
	}

/* This is the code added by this patch */
	if (bridge_connector->bridge_hdmi_cec &&
	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
		ret = drmm_connector_hdmi_cec_notifier_register(connector,
								NULL,
								bridge->hdmi_cec_dev);
		if (ret)
			return ERR_PTR(ret);
	}

/* This is the code added by patch 09/10 */
	if (bridge_connector->bridge_hdmi_cec &&
	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
		ret = drmm_connector_hdmi_cec_register(connector,
						       &drm_bridge_connector_hdmi_cec_funcs,
						       bridge->hdmi_cec_adapter_name,
						       bridge->hdmi_cec_available_las,
						       bridge->hdmi_cec_dev);
		if (ret)
			return ERR_PTR(ret);
	}
}

[0] https://cgit.freedesktop.org/drm-misc/commit/?id=231adeda9f67
    -> hunk @@ -641,11 +705,16 @@
[1] https://cgit.freedesktop.org/drm-misc/commit/?id=10357824151262636fda879845f8b64553541106

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
