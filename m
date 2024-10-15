Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4999E1CB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 10:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AD510E54D;
	Tue, 15 Oct 2024 08:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BzVJbOYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C712110E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728982662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRMMJSL6kFXs5LDgVbbG2fK/PPTFGjQ0lTDfZnD66D8=;
 b=BzVJbOYd9nQdlHLKCeXcM1xOzt/Kf/vSa17bhhAAOdoVgyn8iJyPbhepQEvm241F5kkgvS
 zhchXfGg20d8o/TR2tl5cin/fODRgcLHHQUQNn8va7oZ3K8WGa+Kp6ha1SK9LRhCj1tH+9
 VNb7QCSi2mRQFP99bhlRa5iZCsEi7js=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-QXAldT2aMsSt23PoR2aOmw-1; Tue, 15 Oct 2024 04:57:41 -0400
X-MC-Unique: QXAldT2aMsSt23PoR2aOmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43056c979c9so31373215e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 01:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728982660; x=1729587460;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRMMJSL6kFXs5LDgVbbG2fK/PPTFGjQ0lTDfZnD66D8=;
 b=QqR1BI+DnnB8Po6ZnbYh3tn41/Y5rWW06WmY/CJNsW13ORaH8SnwNwSoILkxwUb8NT
 J5WSvrcGDhZLg3cz/JV8BKHep0G4F1ZZZeAzgA6P4YI4vumhFwNIDCxQQ6DQjnYWCLoH
 wk5jPL5XWV1ZISJ/okzJvpjO/Jr4Krrlp2FDTHZ/tuEc1+rDevjW92UaVeui7c1kPoPc
 XEDVDETS2gdIrfOn/DgFFpS2ALd8YJjDU/mc2B+SirGhX9pL4w2r5tZGm4chNZpSmDA8
 VQX7GZ734b032/bQ9l3CJnhrcwlMSJV2c3I/chvs9pDuWiiOvD263QcOeMK4+nlBo22Y
 /TKg==
X-Gm-Message-State: AOJu0YxPjw/YQBpOJBmg86/Ttw5RKJBxSqS6C73Fng54KEPn6sKxI19k
 iN1XjaEzR0ZGCcV6QqAcmVy+t+3z5nmN3VnD0LAWxElpZYmRoRqVouLJVQqCvrlKONjxmLLIQxY
 ZlMj4DLm18VZcElt63vapy9YRPfEWNeZBPLKMkfSVhPRndLQ+y1A73/pVPtQbghkFkw==
X-Received: by 2002:a05:600c:470e:b0:430:5356:ac8e with SMTP id
 5b1f17b1804b1-4311dea3938mr141668845e9.5.1728982659900; 
 Tue, 15 Oct 2024 01:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjTvM0NxSgWxhq8wXe+yzo4wjN1blQOXijQUFk3XX69xEXV7inQMpz4iS6vS6V9OSgVaSdgQ==
X-Received: by 2002:a05:600c:470e:b0:430:5356:ac8e with SMTP id
 5b1f17b1804b1-4311dea3938mr141668615e9.5.1728982659535; 
 Tue, 15 Oct 2024 01:57:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f6b1eb2sm11090725e9.29.2024.10.15.01.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 01:57:39 -0700 (PDT)
Message-ID: <e20fed57-a03f-408b-8d19-86ed86006a85@redhat.com>
Date: Tue, 15 Oct 2024 10:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/ast: vga: Clear EDID if no display is connected
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20241015065113.11790-1-tzimmermann@suse.de>
 <20241015065113.11790-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241015065113.11790-3-tzimmermann@suse.de>
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

On 15/10/2024 08:49, Thomas Zimmermann wrote:
> Do not keep the obsolete EDID around after unplugging the display
> from the connector.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 2a2391f857cd ("drm/ast: vga: Transparently handle BMC support")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/ast/ast_vga.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
> index 5c79b773af57..abe0fff8485c 100644
> --- a/drivers/gpu/drm/ast/ast_vga.c
> +++ b/drivers/gpu/drm/ast/ast_vga.c
> @@ -29,6 +29,8 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
>   	if (ast_connector->physical_status == connector_status_connected) {
>   		count = drm_connector_helper_get_modes(connector);
>   	} else {
> +		drm_edid_connector_update(connector, NULL);
> +
>   		/*
>   		 * There's no EDID data without a connected monitor. Set BMC-
>   		 * compatible modes in this case. The XGA default resolution

