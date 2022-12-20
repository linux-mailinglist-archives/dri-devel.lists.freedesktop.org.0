Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E150651EEA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5926010E0A0;
	Tue, 20 Dec 2022 10:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994C710E0A0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671532558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzHta/i9q+4BjZVq/u6sLhek6ia2AoGoezCXJm4Rc6Q=;
 b=aZdXQRJP1xzUrJo3xVKgdCGOrvgkuF8JvAtI8wvId4Df+5OnnsMsX26VurF3LnTVA1vGzC
 dDlUS9alNqtFqNuiogKX8NoNgMu4gUdxJPlx/3JJCwzFSd29TuFSruIEb14oyA9hnW3HAK
 nRR4m01Shl3XYdPmdzLui0/5bebpM1w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-j8bo3MI4ND6b1ar7FI-s0Q-1; Tue, 20 Dec 2022 05:35:57 -0500
X-MC-Unique: j8bo3MI4ND6b1ar7FI-s0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 q6-20020a05600c2e4600b003d211775a99so299480wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 02:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zzHta/i9q+4BjZVq/u6sLhek6ia2AoGoezCXJm4Rc6Q=;
 b=gQ3pVVkTUxIXB9cyF7TRCsshEjhaM172YwyfG/JgzYg0ZbvQ+g/KT6DYj0tBuBafEK
 7Dh0mOQA+uWm49vnfwj2saxFUBLC2QUZav4Km0vhvq/j64zP/TXsLWJzs2uhHDIiwM+D
 66/d9Ln/Iqyox/rHVMlxQgc0B6l98FNo+5B2mTxCPehIyvWdZ05I+LzhMPKA0M0UkFSu
 YB3DkeT3aonqZxtDiIyr/VuZcguIOL59aIbfaAQYG4lZh1Ej/pzThVljp087U/Y8S5vO
 N6ieEU3KcpO+6BWhJmiiW5xippU/yD/ELzEs9aZf0hJrddxBEf9Fh8BxG2HTU3rvV+Qo
 If1g==
X-Gm-Message-State: ANoB5pl7Rf7KDn06K338ZCiNj2Ghxz84PyhHzZuT5bL54909Kwv8PJuJ
 T19zyuCJw+c4B2Y/D7E+PazBSS9I8aWwT44UXv/fWXlVfPipQ0ATdUdhYaBNSmR4y1M8F7xRtBU
 IpazdLL3X9loQiz1YncQ2YHqWQxOd
X-Received: by 2002:a05:600c:a11:b0:3d2:2a74:3a90 with SMTP id
 z17-20020a05600c0a1100b003d22a743a90mr24153273wmp.22.1671532556577; 
 Tue, 20 Dec 2022 02:35:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4R8aNA4bWza+guOfC99htX+8sBWGDa2fx94Zu/1/NW8maxcUJV4vsyC5vQMQFC1ESgtGvgOg==
X-Received: by 2002:a05:600c:a11:b0:3d2:2a74:3a90 with SMTP id
 z17-20020a05600c0a1100b003d22a743a90mr24153260wmp.22.1671532556395; 
 Tue, 20 Dec 2022 02:35:56 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003a3442f1229sm24884464wmq.29.2022.12.20.02.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:35:55 -0800 (PST)
Message-ID: <e5d527fc-37dc-1343-5a80-3b76690a19b4@redhat.com>
Date: Tue, 20 Dec 2022 11:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/9] drm/format-helper: Add conversion from XRGB8888 to
 ARGB2101010
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/13/22 21:12, Thomas Zimmermann wrote:
> Add dedicated helper to convert from XRGB8888 to ARGB2101010. Sets
> all alpha bits to make pixels fully opaque.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_argb2101010_result *result = &params->argb2101010_result;
> +	size_t dst_size;
> +	__u32 *buf = NULL;
> +	__u32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_ARGB8888),

Shouldn't this be DRM_FORMAT_XRGB8888 instead?

Other than that, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

