Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E1256FFF7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7024414AE41;
	Mon, 11 Jul 2022 11:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356EA14AE41
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657538179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdUttr5ZKebDNfRRwhSduk+8HDPwZtCqmZ3OBESQeoQ=;
 b=EMa/d5rH4uSlAPC/gwoMGQiQNx7JOqWwqlD+6lTo3KKpUU3vt8T4V+RW6cw0qebSXq3abZ
 1Dd7qO62pSkI7H4tR9V/ehDLJo6dX0GEKEH7kzAR1QoB9oCx97Qjmu1bhPfsTvvkm8g1NV
 TeFCEglXz53rp9IsSfXgHs/DuYDUMzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-XTkM-OrxOQCuuxDThGBZXA-1; Mon, 11 Jul 2022 07:16:16 -0400
X-MC-Unique: XTkM-OrxOQCuuxDThGBZXA-1
Received: by mail-wr1-f72.google.com with SMTP id
 n10-20020a5d6b8a000000b0021da91e4a64so277298wrx.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JdUttr5ZKebDNfRRwhSduk+8HDPwZtCqmZ3OBESQeoQ=;
 b=szLp5i51oPztm7JnMb8nuyWSl3CjqJpryD7QvtG1OegeEI2cLcyB+hiJl1veZTsBHH
 qvt1sk06f0Cc0uPVHVhg+VFK9AL73IifZ3WYv+Ws3nXmf0OAr1ArNvnSZVMsxExGTVJ1
 BCPhmipILD/vV/lAKhgFuNaWG0o/t3VOGF67zINHdU2EoDGvovi+cZ6HVWCzDKKDEyVv
 LJeFsjduf4Mi1IAtRUP680XBeIJcpNIryKN0T7gJ06GamfyiKbU6yF+cpe55vNXRn5gv
 nBPJ+l3cL0Jwsy8FHoZMrdhMaRfqiEqjGzu6GdSBBFLjggKW2+iqZnQ+jHPvs2eNYHMb
 hM7g==
X-Gm-Message-State: AJIora/cSPeCWpXGR+XjQ1HxL5QLv/FJ/rJtxJJslg/kGNhc2mY5PQQ2
 Xu6q8qjFnziM7tOqDAFH6QVwMCho4iEkatKSK4D+mAjyq51BbGQzhld5LcRSyQp1GpBBdbPfj2B
 Z/idT8+jJFWIKWxk7klkaxnvZ2/uP
X-Received: by 2002:a05:600c:3849:b0:3a2:e7fd:e084 with SMTP id
 s9-20020a05600c384900b003a2e7fde084mr5031460wmr.15.1657538175195; 
 Mon, 11 Jul 2022 04:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEx9XRLsglHmWCwo72ASF8BSSzK4h0vkHDnN9UU6eO0DlvvXvfi0JFZ5WgX9TcLEpuLZadOQ==
X-Received: by 2002:a05:600c:3849:b0:3a2:e7fd:e084 with SMTP id
 s9-20020a05600c384900b003a2e7fde084mr5031444wmr.15.1657538175040; 
 Mon, 11 Jul 2022 04:16:15 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b0039ee51fda45sm6673199wmq.2.2022.07.11.04.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:16:14 -0700 (PDT)
Message-ID: <7b6cf5dc-eeef-96c2-947d-a09d29bd0db8@redhat.com>
Date: Mon, 11 Jul 2022 13:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-8-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-staging@lists.linux.dev, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Call sysfb_disable() before removing conflicting devices in aperture
> helpers. Fixes sysfb state if fbdev has been disabled.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: fb84efa28a48 ("drm/aperture: Run fbdev removal before internal helpers")
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Changcheng Deng <deng.changcheng@zte.com.cn>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

