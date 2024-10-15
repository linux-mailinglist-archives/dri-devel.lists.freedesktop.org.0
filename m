Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A4C99E1C9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 10:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE14910E2C5;
	Tue, 15 Oct 2024 08:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="arGXEI5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942DC10E2C5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728982651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lN1w+oTyoh68Pt0AyAXIrg28wrwkyFK6MwJ1KcYrvaA=;
 b=arGXEI5iFv1nHPvAMXWXC7DtalB581MmsHPm0PeUslVzV24mRPVOFLLpbksTh5umtud438
 LCJmrQXuoCyFvXTsW1PVo3KG4mW2YT8itdc00eU8//kAj7aJNSFSLoqd7BY3k9BAbu6HL1
 MR7Knr+UgaWuqBLd+5NFhIhcAiEVoa4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-l2gKBzTmOtSwKZetLuMGYQ-1; Tue, 15 Oct 2024 04:57:30 -0400
X-MC-Unique: l2gKBzTmOtSwKZetLuMGYQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2fb50150039so9788091fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 01:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728982649; x=1729587449;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lN1w+oTyoh68Pt0AyAXIrg28wrwkyFK6MwJ1KcYrvaA=;
 b=gtgb6bODN5a9ova5DcIxcGyXYcvh82ZdYNlczrCXomagsoTJJk02RLqIPqJ+7XtalW
 nO3h+TJfJVHYsdcZzYgDMvtIGiTVYqiNlOaBEP+2gY92PlFPy9Fz5hvHgw9RIWCzD5Mq
 TVnZ5Dpiyv6LBA7Jf1qYscSwl2Ax2flwM4yeiw74+ZRZIkVjmkhGL9vBd4jdnHGzbM3Z
 7cEfiHBwG7wMb4xA5WwS/gV1VC6ETD54ZZvUlg8+2JEXQk3EYfpDx+KVBvbwknslgmOD
 QdpugxFVnTirUPkQn6G91DPSp/gtZlHYSzzEUYnfuA1v4RNwn+Q/keebWOinFLa1panQ
 WdwQ==
X-Gm-Message-State: AOJu0Yy/M0aizX4fEvITY3mbozp8U6czK5FJIXIDZEJxOGstEpKexPTr
 KxZPS8Ehzo/9l654dxv+NBh5XrEtYgP9XYVTsDJKUV9XT4Mk5IMrTK/cP51LziTvOsOypX5Eu1m
 exQiXxhW2QySixuZ2FSf3cjjei9LlfhOGJbCUww+buYyLgRxT8MZz2zULdaKtTPqerw==
X-Received: by 2002:a2e:130a:0:b0:2fa:d31a:1b8c with SMTP id
 38308e7fff4ca-2fb3f16f935mr42952271fa.2.1728982648729; 
 Tue, 15 Oct 2024 01:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWexGH9n1i0TzrjW3+vpth2/ALQLh5ize2Vn2REujJnaHhkd9k0f5I/TckTVLjrXhVRdqf3g==
X-Received: by 2002:a2e:130a:0:b0:2fa:d31a:1b8c with SMTP id
 38308e7fff4ca-2fb3f16f935mr42952151fa.2.1728982648263; 
 Tue, 15 Oct 2024 01:57:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43143c952d5sm5464025e9.0.2024.10.15.01.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 01:57:27 -0700 (PDT)
Message-ID: <94ae5d9f-e665-49a9-8b50-8c9052df83d3@redhat.com>
Date: Tue, 15 Oct 2024 10:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ast: sil164: Clear EDID if no display is connected
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20241015065113.11790-1-tzimmermann@suse.de>
 <20241015065113.11790-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241015065113.11790-2-tzimmermann@suse.de>
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
> Fixes: d20c2f846428 ("drm/ast: sil164: Transparently handle BMC support")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/ast/ast_sil164.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
> index 6a72268d2314..be01254dd48a 100644
> --- a/drivers/gpu/drm/ast/ast_sil164.c
> +++ b/drivers/gpu/drm/ast/ast_sil164.c
> @@ -29,6 +29,8 @@ static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector
>   	if (ast_connector->physical_status == connector_status_connected) {
>   		count = drm_connector_helper_get_modes(connector);
>   	} else {
> +		drm_edid_connector_update(connector, NULL);
> +
>   		/*
>   		 * There's no EDID data without a connected monitor. Set BMC-
>   		 * compatible modes in this case. The XGA default resolution

