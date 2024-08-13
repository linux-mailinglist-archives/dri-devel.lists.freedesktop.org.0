Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41456950648
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F1610E344;
	Tue, 13 Aug 2024 13:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pt+V+Wr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3861010E344
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723555172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HcbP9+4rhNNkNXCWM+ebFO0h/LcCFMVU3VgI8ZRQsM=;
 b=Pt+V+Wr3Uw9hWDnZFEqTIUwkJ2pGmvSpnUb7xznuNPZfE1y6eqFqWvnso7x4Cn9jxft8LZ
 bjExt1kHfIlXZC3jBjfqWggj5YiS80X5BsuJJUTKCIida2moeEB47HkRVo/TI2RS6HKmL2
 waWNCwJbLdeGYC7UyEG2VAiZ78BOi3g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-Aoczj8MZML6GlGUz56Y3Zg-1; Tue, 13 Aug 2024 09:19:28 -0400
X-MC-Unique: Aoczj8MZML6GlGUz56Y3Zg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a7ab81eea72so444275466b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723555167; x=1724159967;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1HcbP9+4rhNNkNXCWM+ebFO0h/LcCFMVU3VgI8ZRQsM=;
 b=skfJZIe9DhHZmhR8lgX6UmvwIUVX+vdOPPlXakNj+fY6OXOdCviIdJan4XfhHlki00
 FCrLhyJZFMHipR8bh3VhLPWlRaD85tohkiwYogkPwTmDlJuyhcJsK7skZRUG5z6Iw2/E
 EUsrEeWQd2JLCXtzXSBNN+TNgZi/5LUnrBkD4SKd2kfQHGYInWpbfKXANx6mkw621Smh
 H4ETliNz2VOQQ2z1A0YhTXhS1KD5NAkNWhM36ej4PnB0fcKDCBN9lXaJrvt4A/nl1Bls
 ZFeScx3tv3+ozRROxk3MOoPXJzy8Fp15otkx1cUALMCNhFJSfXjM7/uSHK+8o0B/VaLu
 TH7w==
X-Gm-Message-State: AOJu0YwULDHV0lm2ugtjH3dbGl7KbiD9Ni53Owzn91DrtkSR/2P95pYz
 wMK1ciGlVE/uvSYbpjSPTX7vvn5Gr8X8mYXByXN0J9/ye9xOG4+k0BRjGVUGA2xmLlX8U9ScGnt
 iQF/dLXSNdpvFrJNXxBPrzHfGgzSQsz4lqFT6NT7LtAhtOYm2t5h7Vx0t4lGY9i+MJw==
X-Received: by 2002:a17:907:3d8d:b0:a7a:a7b8:ada6 with SMTP id
 a640c23a62f3a-a80ed258a30mr243354166b.39.1723555167414; 
 Tue, 13 Aug 2024 06:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJbrVeP2o2f6zHtP76A0BMxM74uiYZKmauDghddgrvfEiFerRjwckWx+C7XxdxiZPJ7C9vSQ==
X-Received: by 2002:a17:907:3d8d:b0:a7a:a7b8:ada6 with SMTP id
 a640c23a62f3a-a80ed258a30mr243352166b.39.1723555166857; 
 Tue, 13 Aug 2024 06:19:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414eb77sm70004666b.176.2024.08.13.06.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 06:19:26 -0700 (PDT)
Message-ID: <ce952ab9-c5b2-4d74-b542-8d5cb63c31cb@redhat.com>
Date: Tue, 13 Aug 2024 15:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/ast: astdp: Transparently handle BMC support
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240812093211.382263-1-tzimmermann@suse.de>
 <20240812093211.382263-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240812093211.382263-5-tzimmermann@suse.de>
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
>   drivers/gpu/drm/ast/ast_dp.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 22c4f2a126e9..121a76a85554 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -355,6 +355,17 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>   	count = drm_edid_connector_add_modes(connector);
>   	drm_edid_free(drm_edid);
>   
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
>   	return count;
>   }
>   
> @@ -364,10 +375,14 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   {
>   	struct drm_device *dev = connector->dev;
>   	struct ast_device *ast = to_ast_device(connector->dev);
> +	enum drm_connector_status old_status = connector_status_disconnected;
>   	enum drm_connector_status status = connector_status_disconnected;
>   	struct drm_connector_state *connector_state = connector->state;
>   	bool is_active = false;
>   
> +	if (connector->edid_blob_ptr)
> +		old_status = connector_status_connected;
> +
>   	mutex_lock(&ast->modeset_lock);
>   
>   	if (connector_state && connector_state->crtc) {
> @@ -390,7 +405,9 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   
>   	mutex_unlock(&ast->modeset_lock);
>   
> -	return status;
> +	if (status != old_status)
> +		++connector->epoch_counter;
> +	return connector_status_connected;
>   }
>   
>   static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {

