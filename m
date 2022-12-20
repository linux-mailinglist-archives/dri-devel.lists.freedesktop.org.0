Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD931651D98
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B71910E366;
	Tue, 20 Dec 2022 09:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C89310E368
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671529127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1J4eLv+5To8BjnLItTbs6pq8g5LjZHk9PMjLEQIi8Lo=;
 b=Ib6Q8VoT8WxT3qwYus5iweZRKoFB+NY3ErkFXs636JFMVczDr2ZyRjdVtOX3vVTv7CvoL1
 okTNh/0sR/XNIx957+Yw/y83IiBg/m0QLzhJb32Q23TJ7IN8qVe+fwTlZ7huXiET+8RI5y
 NMOiNOldKCA0TuEKBhXZU3NQ5URN/6E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-J6ovEqiBMEW4ckocqMa_Wg-1; Tue, 20 Dec 2022 04:38:46 -0500
X-MC-Unique: J6ovEqiBMEW4ckocqMa_Wg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso6307034wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1J4eLv+5To8BjnLItTbs6pq8g5LjZHk9PMjLEQIi8Lo=;
 b=JonJie19BcSylb1opzHsoqqsKfIdct8wjMR6PpxZHi+yQFzlT+2KzmPDb2XxkYIKJe
 BTg7RBFyJlNNk2BuEDG+HNWkKD3uKPbrOUBgp2aR+5eaOkPSgXMi3I9IJP2OJHKKuH22
 1/NrW8bBVBkKK5kEBJy4sMvWPLfJsi7NHUTnh2tA4jbsht4qoJZrlmafuU+Bgdjhh44b
 qCEMcRvs8+cmwbVNZHy3685EBvYm8XDgTpO8a0Dz3uNN233p3dp0NadoKvhASbKuycUq
 B0ATKjV39odHvQNSXMAFns1V6gs19d7kG5bKFmqnL9po/YRgdMRfLXCiZA1MKNrPrB8r
 6lLg==
X-Gm-Message-State: AFqh2krfZ0THQQOlLHv1Zo8ezFt6yteydxC8SpzoWXL7vaRQw7Z0AMgY
 mUNiroddB1olzkNYId343wqieNwgX4SyI8weN+yiQEL+V7ldYQGN2Ds0sKrx0BUpo+0hb8UQoVV
 m1ZsE4TYogON57y6IGbS/q2vtjH+S
X-Received: by 2002:a05:600c:1d89:b0:3d5:64bf:ccc2 with SMTP id
 p9-20020a05600c1d8900b003d564bfccc2mr972463wms.32.1671529125272; 
 Tue, 20 Dec 2022 01:38:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXslpFNWgJA7+1mAYcupIJ/r6e/d06O54fNaPmM/ERkGUAWuMMiWYBSHcxiARgbY+lIJOxnk0g==
X-Received: by 2002:a05:600c:1d89:b0:3d5:64bf:ccc2 with SMTP id
 p9-20020a05600c1d8900b003d564bfccc2mr972452wms.32.1671529125099; 
 Tue, 20 Dec 2022 01:38:45 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i27-20020a05600c4b1b00b003d220ef3232sm14481191wmp.34.2022.12.20.01.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:38:44 -0800 (PST)
Message-ID: <bc75ba60-9fb4-dec9-c7fd-23e50942f7f0@redhat.com>
Date: Tue, 20 Dec 2022 10:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 13/18] fbdev/offb: Do not use struct fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-14-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-14-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> Acquire ownership of the firmware scanout buffer by calling Linux'
> aperture helpers. Remove the use of struct fb_info.apertures and do
> not set FBINFO_MISC_FIRMWARE; both of which previously configured
> buffer ownership.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

