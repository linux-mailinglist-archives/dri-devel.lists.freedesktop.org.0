Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F100A651EF7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C6B10E0B9;
	Tue, 20 Dec 2022 10:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46A510E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671532730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QV3KVPPq3DruR3gSWE0bChiB07DFVKKFPIMok1rAETo=;
 b=bjFzXlOSiXcKYXNAdJJuku+kPD035m/wTWskt0tTDSesMSSS0pVBlduzqkuJ8o3OxX8bMV
 uyX6W5ofRtS1nbI3uKFuBO/Dx9Mr+piCHvdec+6Os3XzRZlDzKhn66F288hFzrJhzMUjYc
 QXTEV9/lhovMEhuAmOnb7CGCAjzKBzU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-QkSjPxzIO029D2W4yR8W6A-1; Tue, 20 Dec 2022 05:38:49 -0500
X-MC-Unique: QkSjPxzIO029D2W4yR8W6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 9-20020a1c0209000000b003d1c0a147f6so7864532wmc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 02:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QV3KVPPq3DruR3gSWE0bChiB07DFVKKFPIMok1rAETo=;
 b=KJAivRXEAKahg2PXE74BHG+qtsXrUySQTvFCnk7ZVKMo7m8E6OrYA+qRCnyHlc8JUf
 Sd6uvDcyOhfLjHCKYRFTeVnkacOhWDmhGYE0RvQo9+KQbcEH1Uu3IgGicPCgtUDvdxXj
 6uxv/fOCSyusEZgBrBxogIRuulcTPjfVzknczCXfS8mRFJsjRdDjxTok5naIN2mf9QRg
 xbQAqM9qH5PPu7hSBaqEAOhtAvM8DDibmBBtDkI9TZgiNKSm6dFNnTMQjZ0NODtmFGlj
 tCJhXv0HbARcIBmVWyzygq+pbbv0CAZhOJ9zHO9LubRkSgTJIgspiA5ftYoXDm3iJeXO
 +aZA==
X-Gm-Message-State: ANoB5pmdSftL/pkHRYyMUkpaoXXiasHnWHpbIzPUZ9MIIvGwzdN3tdiN
 ZxOC8qvfoYg2JV7twBMS5cKZBerH4/jEondDXZ3m4vx914wFSoOzfC5QWIHF6V1UD7sLXo0m7cD
 7E6de2lFkmYIKv+OY5LBFLzqMwBaF
X-Received: by 2002:a05:600c:c8:b0:3d2:cb3:2e2a with SMTP id
 u8-20020a05600c00c800b003d20cb32e2amr43326078wmm.10.1671532728776; 
 Tue, 20 Dec 2022 02:38:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7zp9IRhDmxTRkAPbr7j5qI0UBAuzN42xsB4v/jJQGL2tTlnuVoeb6gDDOPkzX0Tf7yA6LMXQ==
X-Received: by 2002:a05:600c:c8:b0:3d2:cb3:2e2a with SMTP id
 u8-20020a05600c00c800b003d20cb32e2amr43326061wmm.10.1671532728608; 
 Tue, 20 Dec 2022 02:38:48 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b003cfaae07f68sm24623627wmq.17.2022.12.20.02.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:38:48 -0800 (PST)
Message-ID: <88bb896a-024c-c137-acc3-1eb43dd52921@redhat.com>
Date: Tue, 20 Dec 2022 11:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/9] drm/format-helper: Add conversion from XRGB8888 to
 15-bit RGB555 formats
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> Add conversion from XRGB8888 to XRGB1555, ARGB1555 and RGBA5551, which
> are the formats currently supported by the simplefb infrastructure. The
> new helpers allow the output of XRGB8888 framebuffers to firmware
> scanout buffers in one of the 15-bit formats.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

After addressing what was discussed with José,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

