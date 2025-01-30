Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A79AA22E29
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 14:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6F610E987;
	Thu, 30 Jan 2025 13:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Kcyf3DXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1137B10E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 13:48:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70B7F441B3;
 Thu, 30 Jan 2025 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738244917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85kJCHv6mcyuCfmx7l4s0FYyTZf+9J9uLLR+dRb0d/A=;
 b=Kcyf3DXSrLfcfJcX7+OatitxPkf3mLxsWYjTso7LMROsoQA0FnOuFb3ygkITKozS87k5Di
 /WQIwEv2yg1M2LoFUaTF7GZE2/Ypv1FN0zsFyfxsE/HO7fIwP59ZP3MrVzqoDuaOhvrJe4
 VMaDog0VYVz2oSUj33Msb9A3GViJf97mZOTROY4ZsRS0c8wOjZTs4TF2CJxMgJ62poqM5q
 i6pVGJWNWZr/HxazHNv7zPRuBbg3ZcjPccdZd/S9uT3mufE7YZ/c+d2asjbZm/uOIKtz6R
 5baVQz1SrJMiMxtaTTGbE+WrYRZgGKP3lxtUV6tzpIk/5WVrzV9aRz3rlf9AGQ==
Date: Thu, 30 Jan 2025 14:48:35 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] drm/vkms: Allow to attach connectors and encoders
Message-ID: <Z5uDM-AGkxoGcKPg@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-14-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129110059.12199-14-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 29/01/25 - 12:00, José Expósito wrote:
> Add a list of possible encoders to the connector configuration and
> helpers to attach and detach them.
> 
> Now that the default configuration has its connector and encoder
> correctly, configure the output following the configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 62 +++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.c            | 69 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h            | 33 +++++++++
>  drivers/gpu/drm/vkms/vkms_output.c            | 57 +++++++++++----
>  4 files changed, 209 insertions(+), 12 deletions(-)

[...]

> +int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connector *connector_cfg,
> +						      struct vkms_config_encoder *encoder_cfg)
> +{
> +	struct vkms_config_encoder *possible_encoder;
> +	unsigned long idx = 0;
> +	u32 encoder_idx = 0;
> +
> +	xa_for_each(&connector_cfg->possible_encoders, idx, possible_encoder) {
> +		if (possible_encoder == encoder_cfg)
> +			return -EINVAL;

Is this really an error? For me this should be valid: we want to attach 
the connector and the encoder, it is already the case, so it is good.

> +	}
> +
> +	return xa_alloc(&connector_cfg->possible_encoders, &encoder_idx,
> +			encoder_cfg, xa_limit_32b, GFP_KERNEL);
> +}
> +

[...]
