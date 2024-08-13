Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFC950650
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2AC10E346;
	Tue, 13 Aug 2024 13:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G/ozgO89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906A810E346
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723555225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gr8Ystl0guCbQ0ZycZENRXt5cBSbBqUkagaYp64fXFo=;
 b=G/ozgO89tLjH5A+WQiVTe7oXxE/Ru6ex8lV83jUTO67sHw0zQajPdOAqJBEotBT0axhxBN
 uoD8a+TYTDgbm0es9sBy9HeSXHgkFRMZmTbdWxkUB9ZVHY7W49rcb7chanI4JawcKSSldI
 WhXT0c8NCrcxLUnxU7GtjCHgMDKwpBE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-rmO0bPBIMqGqgpphATkldQ-1; Tue, 13 Aug 2024 09:20:22 -0400
X-MC-Unique: rmO0bPBIMqGqgpphATkldQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42808685ef0so39234045e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723555221; x=1724160021;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gr8Ystl0guCbQ0ZycZENRXt5cBSbBqUkagaYp64fXFo=;
 b=peS4xp2iAPGxehVi/Ul9X4wvpTF07FzBhnds00Ej84FQGISZZZyLFeI0jp0HxNhxny
 8F0A3+UHz/agC75de/aLEplbadrUVPt8GJjDpj/ZSJMlpRRLLoHES1wwjXqt9Z2EJ3Jc
 OubJnNnSzp+xp7du5Gq1i3ksVVfaT62j/pb9ehE8Q2yjrMgxxQvrLO79FFJVWpY97RNb
 iVdfndcg9WC04xAQBuNqjlNHzk2tOsYs9Txi9YIAsP1IeIEHkTbhoHqCDA5ZXGg55oMu
 ESvi6QMPAs3S9JQV3tY6s/foaxlU47S+zyOS7E/K9CuHVjmuzFySGzmFqpNOrDcPvdkE
 gjeQ==
X-Gm-Message-State: AOJu0YxmDe90fcdMzhBNO84lOhPFlQekkLic/5V/pMIIbM8YVBPbH7rV
 ApxK2Omq8zv4oquWgm/Zlf0P5RmpuFbkyn5oNWD4Qiy0BFYaWhXXLrOjuzGwtfTc3+b+pVfusWy
 oju1AQ/kWHqMU5CDoY1GRozxjFmSJQJfRwt1v6CIl8R8TTbODbefTVlLQyJTBLI1IGg==
X-Received: by 2002:a05:600c:138c:b0:426:62c5:4742 with SMTP id
 5b1f17b1804b1-429d47f2ee6mr28901375e9.7.1723555221043; 
 Tue, 13 Aug 2024 06:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVMHjDWqrktQCtX8XX3bA5TVxmz2bXmPWiOaV9ZCR/OtH8cKc0LZCfaD40Ejj+Cz1BXoaywQ==
X-Received: by 2002:a05:600c:138c:b0:426:62c5:4742 with SMTP id
 5b1f17b1804b1-429d47f2ee6mr28901225e9.7.1723555220694; 
 Tue, 13 Aug 2024 06:20:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290c738d21sm223038765e9.12.2024.08.13.06.20.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 06:20:20 -0700 (PDT)
Message-ID: <4db2b914-ee05-4b52-862e-37addea1e720@redhat.com>
Date: Tue, 13 Aug 2024 15:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/ast: sil164: Transparently handle BMC support
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240812093211.382263-1-tzimmermann@suse.de>
 <20240812093211.382263-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240812093211.382263-8-tzimmermann@suse.de>
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
>   drivers/gpu/drm/ast/ast_sil164.c | 40 ++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
> index 6e17d84f994e..940118544fae 100644
> --- a/drivers/gpu/drm/ast/ast_sil164.c
> +++ b/drivers/gpu/drm/ast/ast_sil164.c
> @@ -21,9 +21,45 @@ static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
>    * Connector
>    */
>   
> +static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
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
> +static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connector,
> +						  struct drm_modeset_acquire_ctx *ctx,
> +						  bool force)
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
>   static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
> -	.get_modes = drm_connector_helper_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +	.get_modes = ast_sil164_connector_helper_get_modes,
> +	.detect_ctx = ast_sil164_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs ast_sil164_connector_funcs = {

