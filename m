Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916B4EE8F8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233CE10FE6C;
	Fri,  1 Apr 2022 07:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753EE10FE6C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648797520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qV9at4Z/fho+LeSVZbNbi3zsn5vXJyaQLS1hFvXpTk=;
 b=g6LxH8//gjupl+uf3shVeQFblI1JZhVcXvmz6KNfgrEvhGnD1PYejRrNeEOBJQFvSFXmP2
 3kO4kBMR6jfV05Dj/MqMwlvdu2Wv6gT7SKdUzosIlsZY0mAyh6PB6tkWYCZ5zwFZxVZout
 jXc4F09cgRSzSPSU9maaQB32pfa/CNo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-k0C6VEIdNFaxygT-tAknCw-1; Fri, 01 Apr 2022 03:18:38 -0400
X-MC-Unique: k0C6VEIdNFaxygT-tAknCw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a1c4d0a000000b0038c6e5fcbaeso798467wmh.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 00:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3qV9at4Z/fho+LeSVZbNbi3zsn5vXJyaQLS1hFvXpTk=;
 b=i8sUx7bNgqAINnb/kP87gf+4MUlT+ihFyqYZTT7oko5y2NlcWE0nu0BcwBwaHEmp8I
 D4iqPwfgetduUQ0lyzIvCBFFFIDFDuCqf79rHv24wwycSymtTyBomkc+E9DilBh1dbCd
 69iXINOoLOQ3BOj8r1gKGhwVirKqr0+6U549bh4o1OTgpyd9uTi+KeuCoK429/Cnxk2Q
 3OLfpQ0N5KzqAD8v6iHMljnI/QLBdlHVOcVc2XCLQfXqin1K65gLSHdrpYbMU3IDn6uh
 s9THCeBmR6d9gBHc7r7w2mqh9tb+gHyNezuC5OcYkYqGhZ22OtulDYx08AUt3i99onlO
 hYMg==
X-Gm-Message-State: AOAM533Ge8f/htSMjYlVGNIrcVniUJqK56IqGYae398gAAbkZojoXehi
 ttoeyuZp/DZ5mfTbMldFS5TAE5SXC0O9lSSRGh/kaF1IEVv0RA654Sgf2gevbrarmMmSBGJ/cUF
 WcSaHr7ZoHyH7vhI8uvYfimTJry0x
X-Received: by 2002:a5d:64aa:0:b0:204:1c8a:51e9 with SMTP id
 m10-20020a5d64aa000000b002041c8a51e9mr6710488wrp.314.1648797517583; 
 Fri, 01 Apr 2022 00:18:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy+xX4gWuIMxLTo2IeJdGK+VkGay/MP/PyayLdQhzpIApEuMKJQjTi4un0ucCCkIvoVs9d4A==
X-Received: by 2002:a5d:64aa:0:b0:204:1c8a:51e9 with SMTP id
 m10-20020a5d64aa000000b002041c8a51e9mr6710467wrp.314.1648797517310; 
 Fri, 01 Apr 2022 00:18:37 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 b1-20020adfd1c1000000b002058537af75sm1376962wrd.104.2022.04.01.00.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 00:18:36 -0700 (PDT)
Message-ID: <2144ac86-cf84-88d2-3b05-117dc9470cc6@redhat.com>
Date: Fri, 1 Apr 2022 09:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/8] drm/display: Split DisplayPort header into core and
 helper
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220322192743.14414-5-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/22 20:27, Thomas Zimmermann wrote:
> Move DisplayPort protocol constants and structures into the new
> header drm_dp.h, which can be used by DRM core components. The
> existing header drm_dp_helper.h now only contains helper code for
> graphics drivers. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

