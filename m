Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF495064F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 15:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C620410E345;
	Tue, 13 Aug 2024 13:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N7afxMRG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CC010E345
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723555216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvvNQgRLMyg9p+6EqEoUlDmkGCszASPD1SqsQxfR04Q=;
 b=N7afxMRGuZF8HUCMxoOb7H6ISwEkOJDqMPSH0ypbpIn5bOV3Lbifg82rBhpPjT0Iawfvui
 H770AxNNk1JapA+fBSbrVacpudaNJ6KpFqAcI8GCBruw6GzFGgkTIJYkjR0fBhX9Bb/yV1
 BDYt3D8xNrY+toHKMHrsRaFDemkJNjQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-5lx4JUVCMwG1y0FzmKkUBQ-1; Tue, 13 Aug 2024 09:20:13 -0400
X-MC-Unique: 5lx4JUVCMwG1y0FzmKkUBQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-36871eb0a8eso2826759f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 06:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723555213; x=1724160013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kvvNQgRLMyg9p+6EqEoUlDmkGCszASPD1SqsQxfR04Q=;
 b=jbOkdsqPc+zcdt07SdKvrSTiuU1/RVGUTPPJRgM45nPcZI5lqI38d2e9gYjlrj4LGF
 TzV/sLEZiya/tXz+vh9hxAPy1Fg7MeKnuS1AJ5M8fFf8OcTcCqR5fj1+HtrZZ0rt7xS/
 brvs3f98wEkjz4/rqrVEcywf9UAcw4YZcysByT8eago8Z82O/siyDxYrKhcMYJVNMMC2
 kK17kQbyZsG5smK14Y5X6A7VIOXJ2dYMfCUpVWBhbckJKu2M9oIIjCjWJyDoEQZk+Vs0
 mVD6DgZ7h86T7KHEwh1BQgvME2eC9kMXybcsY6wrDLp0zHUHEoDnm5BeEO0TcBNeqXYY
 A7/Q==
X-Gm-Message-State: AOJu0YzCBNPhLwVebODgEyIdlZwrygws93AJj7ReCr2YGAV69vbboRqC
 zRTxXb7YUp7SxpXqz/1NAPLy/VJAdsy5VSuzCRwN1SCU+h9MXHcccrdLLl03snjhBcmBy906VUn
 njNFIMRJAeeBcOcOZ+Vr10pTH/snnRGTXNDTEmdC9vvWQZCfYvicE8Mh5LkLKsYhpkA==
X-Received: by 2002:a05:6000:50d:b0:362:8201:fa3 with SMTP id
 ffacd0b85a97d-3716cd0d820mr2113600f8f.34.1723555212701; 
 Tue, 13 Aug 2024 06:20:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG8Ul4CE757wP4Zvv6oyPiHMZXQ2i3FOA+Rov675YwCKJwXVU+pmSsmeBYUwGjGo29MMVl3w==
X-Received: by 2002:a05:6000:50d:b0:362:8201:fa3 with SMTP id
 ffacd0b85a97d-3716cd0d820mr2113582f8f.34.1723555212238; 
 Tue, 13 Aug 2024 06:20:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c74ffd55sm138377315e9.4.2024.08.13.06.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 06:20:11 -0700 (PDT)
Message-ID: <2b6ab1d0-ca84-447a-8721-84cdae4d9860@redhat.com>
Date: Tue, 13 Aug 2024 15:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/ast: dp501: Transparently handle BMC support
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240812093211.382263-1-tzimmermann@suse.de>
 <20240812093211.382263-7-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240812093211.382263-7-tzimmermann@suse.de>
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

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp501.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
> index 0dc37b65e1d7..755cbf931b38 100644
> --- a/drivers/gpu/drm/ast/ast_dp501.c
> +++ b/drivers/gpu/drm/ast/ast_dp501.c
> @@ -518,6 +518,17 @@ static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
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
> @@ -526,10 +537,18 @@ static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector
>   						 bool force)
>   {
>   	struct ast_device *ast = to_ast_device(connector->dev);
> +	enum drm_connector_status status = connector_status_disconnected;
> +	enum drm_connector_status old_status = connector_status_disconnected;
> +
> +	if (connector->edid_blob_ptr)
> +		old_status = connector_status_connected;
>   
>   	if (ast_dp501_is_connected(ast))
> -		return connector_status_connected;
> -	return connector_status_disconnected;
> +		status = connector_status_connected;
> +
> +	if (status != old_status)
> +		++connector->epoch_counter;
> +	return connector_status_connected;
>   }
>   
>   static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {

