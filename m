Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116B7950651
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841C910E2A9;
	Tue, 13 Aug 2024 13:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dTR01li5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2FA10E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723555233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMYXCsitZlxtME7273EmifkxFctIo/402/2kwn3p9gE=;
 b=dTR01li5Xq7zw3GJ1CiuOVGmhuTb+Y+YiQ2B2nZgc17xtKoIcpFO5MU/SA1dj81DJU+pqg
 GNyRA9xiqCtXnblSZAskCh4clMdmvjFODVHsCUpxDzj1niGrd0nakXFZHFVCwPpMllRCHu
 12WgOjF3dBbvE4OcVOaYF085ODq2rGg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-nOGZwxybOiG9ukwYyi4CZQ-1; Tue, 13 Aug 2024 09:20:31 -0400
X-MC-Unique: nOGZwxybOiG9ukwYyi4CZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4280d8e685eso42617035e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723555230; x=1724160030;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tMYXCsitZlxtME7273EmifkxFctIo/402/2kwn3p9gE=;
 b=ImBF9bISVYTumzUupTiRPzfGMaiGbv/xDIFGePBrhpCUSytknRxlAxOYuSAC8OC1pQ
 bw7uuzwBIVf4VHq7UnglqAEJkJs0LCParkX15LlSMNauRlJj/6uS2D08fCyQJLj1VRH+
 vmZDjHSvsStlueXy/z2aeFma3jGLjp+NMtDMuk8xwivtdRnbpP/Wc+Z3jyV+LBz00Aes
 ULZ9SWH13p6fbdJ0Yu0mXh7qKm/zJZgEFeXA9Ldabsv8tK0pwS6FwHiHouveVvtMcOJX
 e+Jl7SOH01k9lwEN3P2c032lS0sLtY4IdTyA7SomHZlnI9VTiVy8REdr2KumA/L+1bmd
 iT1w==
X-Gm-Message-State: AOJu0Yz1N6pA8ird1GoUCyUvKocOM9SNj8aEZ9w8GvXaXQeDtmWEYQwM
 62wiNk96Ee8LmFsnnqPsdiduq2ZlnU+Cfz9lIUS4KoSbSvUomp8Koe1kEdGW9rFruWpWyMXG/hr
 rs9Y6kX6FA6rTUdsBTym/s4nI6GD0U42Ms4R9N+uRieVdv76+P9kQotK/m5kDSaxhRVKIKKJGaw
 ==
X-Received: by 2002:a05:600c:358a:b0:426:647b:1bf7 with SMTP id
 5b1f17b1804b1-429d48e6bd4mr30037075e9.32.1723555230298; 
 Tue, 13 Aug 2024 06:20:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+gS6sE6HPnf9WLEW1EumGEMXrO7IuDP4d2+Qui+tHdbxBnuNL2KnrbqUsB8BF90yV/Vej0Q==
X-Received: by 2002:a05:600c:358a:b0:426:647b:1bf7 with SMTP id
 5b1f17b1804b1-429d48e6bd4mr30036885e9.32.1723555229839; 
 Tue, 13 Aug 2024 06:20:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4cfef131sm10287796f8f.54.2024.08.13.06.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 06:20:29 -0700 (PDT)
Message-ID: <da6eeac0-689e-45cc-b23b-6016947f19af@redhat.com>
Date: Tue, 13 Aug 2024 15:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] drm/ast: vga: Transparently handle BMC support
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240812093211.382263-1-tzimmermann@suse.de>
 <20240812093211.382263-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240812093211.382263-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 12/08/2024 11:30, Thomas Zimmermann wrote:
> Permanently set the connector status to 'connected'. Return BMC modes
> for connector if no display is attached to the physical DP connector.
> Otherwise use EDID modes as before.
> 
> If the status of the physical connector changes, the driver still
> generates a hotplug event. DRM clients will then reconfigure their
> output to a mode appropriate for either physical display or BMC.
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_vga.c | 40 +++++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
> index 2ea0763844f3..8f080af0b61b 100644
> --- a/drivers/gpu/drm/ast/ast_vga.c
> +++ b/drivers/gpu/drm/ast/ast_vga.c
> @@ -21,9 +21,45 @@ static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
>    * Connector
>    */
>   
> +static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	int count = drm_connector_helper_get_modes(connector);
> +
> +	if (!count) {
> +		/*
> +		 * There's no EDID data without a connected monitor. Set BMC-
> +		 * compatible modes in this case. The XGA default resolution
> +		 * should work well for all BMCs.
> +		 */
> +		count = drm_add_modes_noedid(connector, 4096, 4096);
> +		if (count)
> +			drm_set_preferred_mode(connector, 1024, 768);
> +	}
> +
> +	return count;
> +}
> +
> +static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
> +					       struct drm_modeset_acquire_ctx *ctx,
> +					       bool force)
> +{
> +	enum drm_connector_status old_status, status;
> +
> +	if (connector->edid_blob_ptr)
> +		old_status = connector_status_connected;
> +	else
> +		old_status = connector_status_disconnected;
> +
> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +
> +	if (status != old_status)
> +		++connector->epoch_counter;
> +	return connector_status_connected;
> +}
> +
>   static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
> -	.get_modes = drm_connector_helper_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +	.get_modes = ast_vga_connector_helper_get_modes,
> +	.detect_ctx = ast_vga_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs ast_vga_connector_funcs = {

