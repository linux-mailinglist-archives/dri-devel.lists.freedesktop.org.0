Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A71BA646F7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 10:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9F010E3D2;
	Mon, 17 Mar 2025 09:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KRUQRBKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EC210E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742203251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQAYtZ2CgxPyvA949q/2IqdYnbjoNl4FrlqvLUk18K8=;
 b=KRUQRBKstGnFXqyZZYGqM97ciqH6ATSmCqxe54b5oNNLs0E5THfL7tXAPJ2hNAQoNVortM
 iwfEFSkwhHsyO+YOo5g4zx8M0dES0awacIAj6gj9J9eR/3qNKPDd04onsZ4ZDovGUR2LJI
 B/uIuligR6wqC3UO4iFm7UMRbxzQrhk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-r67Gjp6IN7OduuAVp3N24A-1; Mon, 17 Mar 2025 05:20:50 -0400
X-MC-Unique: r67Gjp6IN7OduuAVp3N24A-1
X-Mimecast-MFC-AGG-ID: r67Gjp6IN7OduuAVp3N24A_1742203249
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab68fbe53a4so491729866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742203249; x=1742808049;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wQAYtZ2CgxPyvA949q/2IqdYnbjoNl4FrlqvLUk18K8=;
 b=ASIkhbm+0lzlxgyxj3QS62FO84q6KboS8lMx2vOpZjUszzA5dmbhPE9m7zpuVrk7LU
 heTCkTkz96gUTr4hIdtz9sID3jibWNGrLLaOVfiXsMT0Ev0d1tEgfQWgLBzsW1Tbh3jS
 YWAli3x18AgZAETU95eJgJM7NURZT55JFBRopCudBKP+JS6qCsO73CeSYv1+EOJSJZTO
 rFvGJUaxfvwaG2lNOiIe+9yYnIxSHFKjTbpEUN13imjtVLbCPTY42p4PnxkTN0Ej0bxN
 3sv5XVYA13kHDEfV7JIJ0u+zJu6HiUDKuOtSZBbdIW9vewJ5Q5I6PPe8ZNoScVL4XIQo
 zVKQ==
X-Gm-Message-State: AOJu0YwQtleCw+CD6SiL8RUwvMgyMtqIeSS5ZifnjD76eyp7o6Akh3oz
 hvbZ854rHQJuH+LzwqzG6inmpsTDjGv769e86RVeSh9umw1gpTB9MM+pawwGSazCxZv9TuejNrS
 nwMeunyVavLczAJOkjsL3xhSQkttj9WJusJe56oXdjXGvKonXVTZIN/AVz+JSFqwjVA==
X-Gm-Gg: ASbGncuRZVb5L4iWq4ZdVg+XzVm9gh3U9o3GbkOLe13sw5yXwPLP9dmru+w5g7zM6VN
 c+nPCt8dyXbgcM3WfYI/ldMC5iA57lRX5qElbEuqEyiwdNdhA2xTXNZPNXlF2ctfK8n5ShhU4HJ
 D8rIUyI35XCqjvCv6iDh3vpdd7OgoDubIFdnISbYeiTS/gQh68BHbpWwY62THe+nifsktPwd1Yi
 HzgA84nqiNct6rqk07VNnu8GgJxmqgD9ul7xjwCHkHAzUoOaypIokd+8e/mSSZMCnw9STTBhFBd
 D38MdEwuv8HrOPGoY20=
X-Received: by 2002:a17:907:7d87:b0:ac1:f5a4:6da5 with SMTP id
 a640c23a62f3a-ac330398078mr1211677766b.37.1742203249015; 
 Mon, 17 Mar 2025 02:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB1+oHBvs7PLecMQRxLRVqXxUJqML6+iLCfi91FLVRX4dLs4qw1VqVUoq/BmyEZsMcQH+KkA==
X-Received: by 2002:a17:907:7d87:b0:ac1:f5a4:6da5 with SMTP id
 a640c23a62f3a-ac330398078mr1211676066b.37.1742203248622; 
 Mon, 17 Mar 2025 02:20:48 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a3e0e4sm635730966b.136.2025.03.17.02.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:20:48 -0700 (PDT)
Message-ID: <65813e62-aa0f-4167-83c1-49200fc4ca20@redhat.com>
Date: Mon, 17 Mar 2025 10:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm: panel-orientation-quirks: Add Zotac Gaming Zone
 quirk
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-6-lkml@antheas.dev>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250222164321.181340-6-lkml@antheas.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J9c8jaB9NYdE3i6ObYwfb89xIbQXH5XEA7WmhdLvAMw_1742203249
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> The Zotac Gaming Zone handheld features a 1080p portrait OLED screen.
> Add the rotation to the panel orientation quirks.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index f08cdc81dd9a..bbbe707f541d 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -479,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
>  		},
>  		.driver_data = (void *)&lcd1080x1920_leftside_up,
> +	}, {	/* Zotac Gaming Zone (OLED) */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ZOTAC GAMING ZONE"),
> +		},
> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>  	}, {	/* OrangePi Neo */

The entries in this list are alphabetically sorted. Please post
a v2 (of just this patch) with this entry moved to the end, just
above the special "One Mix 2S" entry which is at the very end
because its DMI matches are all "Default string".

Note another entry for another Zotac device, with a board name of
"G0A1W" has been added in drm-misc/next, so please base your v2
on top of drm-misc/next.

Also the freedesktop.org infra is currently being migrated to
another data center, so the drm-misc tree currently is not
available I think.

Regards,

Hans




>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),

