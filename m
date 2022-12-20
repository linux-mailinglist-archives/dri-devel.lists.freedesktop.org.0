Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD6651D35
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF1E10E353;
	Tue, 20 Dec 2022 09:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E9510E355
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671528147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kA4MxY/xt1b965fBBWiuXbuP8HCDa5veURhTEDS4ghc=;
 b=KNZuGWxKHtTSxNGs9V+tXJKgM5HgtGAZ3GwHkqLtI9j41EojzClak9qUSz7cyeRRicT9SB
 EsgvFOGqc9A8G8VQXnFZcgqJ96au0YZy8HoD+TAUe2eGvOYA8hboaaAbBU7cn8E5aYm2Tn
 BVdZCwFclKiV8hWIqmMls5nukAGBYfU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-BQSounECNOGy7acNm_NeMw-1; Tue, 20 Dec 2022 04:22:26 -0500
X-MC-Unique: BQSounECNOGy7acNm_NeMw-1
Received: by mail-wr1-f69.google.com with SMTP id
 a7-20020adfbc47000000b002421f817287so2069462wrh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kA4MxY/xt1b965fBBWiuXbuP8HCDa5veURhTEDS4ghc=;
 b=dkEl9Xs538ghTk40a0PvfyuYNr8mTU0oQ918BcMwV/jTVAors4kQfJU0EoC/GkEOlw
 4S0Hwn0f6VmFah3mgntM0VrMTv/yi1csecUq3J87bZ7vLCZ1tfCzb++t+oqcJibFT39R
 kGTd5T37ZB2DvMqPbo/TCBmOVf6Cl6RGgELqompQf90eGdARhM5VRgdmOM3yIZcLp1f/
 jCtzHoWTAIwiThrUQdNsfUlVeI24WIprfuE1k2uBimyi0WpfzPMbbcZWu+Wf5u8kNPEP
 L72kwg+JMq60Sq8NMbDnc8DDtRBW+Pp0n2HW2OjKKZ5NeNK5HVqS/J/DzYuj1TaEJZ59
 4GZg==
X-Gm-Message-State: ANoB5pnYfhYXlnlbh74cotGAVnlZLtpazd2hCKulMe/JEpExfy20DBfy
 abuRSBi1SAKtKW2tNIBBL6XgkUe8YxIzMk1F6kCnjoEDyWTjaoqQ6MlZiSkfT9v9JsCKuPtWcdY
 XlYhbb3fcfdSwPjZRm+Cr7JX2sP6r
X-Received: by 2002:a05:600c:4e14:b0:3d2:4234:e8fe with SMTP id
 b20-20020a05600c4e1400b003d24234e8femr16310096wmq.19.1671528145672; 
 Tue, 20 Dec 2022 01:22:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7D1EDbJcc4QdZIvJK/Fm89Zwd1JGt/mFkIkcyx0LysVtTks8a6AInaJGEHTgImFr5Ff5SiAA==
X-Received: by 2002:a05:600c:4e14:b0:3d2:4234:e8fe with SMTP id
 b20-20020a05600c4e1400b003d24234e8femr16310078wmq.19.1671528145416; 
 Tue, 20 Dec 2022 01:22:25 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m1-20020a1c2601000000b003d1d5a83b2esm22817348wmm.35.2022.12.20.01.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:22:25 -0800 (PST)
Message-ID: <d3370b05-cf1f-c3b2-678b-30708c549acb@redhat.com>
Date: Tue, 20 Dec 2022 10:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 06/18] drm/fb-helper: Do not allocate unused apertures
 structure
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-7-tzimmermann@suse.de>
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
> The apertures field in struct fb_info is not used by DRM drivers. Do
> not allocate it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

