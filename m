Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE747651F6A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 12:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC05610E3A4;
	Tue, 20 Dec 2022 11:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC8910E3A7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671534388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzsJL2jqIkAt3tLUqQaOEAS3wk4pLNDrw+mFNpp86A8=;
 b=araQbmZAAa6vapLi9Md3whNmsdS2ZOu6wU2ZY2OSUDg+AvRfMuejRDQnh9TKOozorYxhSW
 rY3cIG1VEiiXRWVpjvNGlvYVYzcfZZOfG2cEz90eRS23c1C7A6/z7V65Pc3CauDtPkbuwN
 KyTscQypAEzbI/n89xfID0eWdNXfd0g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-hmZx4hn7NHGX1DISK_9biA-1; Tue, 20 Dec 2022 06:06:23 -0500
X-MC-Unique: hmZx4hn7NHGX1DISK_9biA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so289536wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 03:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nzsJL2jqIkAt3tLUqQaOEAS3wk4pLNDrw+mFNpp86A8=;
 b=8Fyl/Oc60ufQoxgXgASaBqLOEoQCCEVYXKP8lor/xKrcZtuo/XqByfKnbqsBOpkgyt
 FC490JzoHaajLZn9OUklY6enKKdT1zJWEqfQ5pnOL6eb0hBTM18pI0qn7wvRpUKCgAIn
 cnu4Of0R3Aq+oAZZ5noATSSrWdCcK1J6tex7ujeN4iQxjReICH00ED8Vkj2Xnv/xUKtZ
 GXsfIZkVOn4pPuYTY90Xmv30p3k2x/l3E+X0bpzzFhskGoWq5zSDkHYRgCeQlX3vOSDh
 JVW8VFVY5vbrK/Pg2xad4Qqsqmm7F/A24WVIP/ag5g+EZcGDmqkZMB4v21BU1r/EfJz0
 XvmQ==
X-Gm-Message-State: ANoB5pkaNdfLoIVgflJGbuYHIm4WBs3IgVipuJZPK//3KBpkxoL173R7
 fiyONGZzb7MyQe3h8Qn6dZxZTZl5oZ8asFr6+ZmeQ0rsxyYY5aii0BzFL8bC4CoBxmUXJytQ0od
 16U7s4RNISaYiI9sDG9Z/oeH2aUq0
X-Received: by 2002:a05:600c:4f85:b0:3cf:7925:7a3 with SMTP id
 n5-20020a05600c4f8500b003cf792507a3mr34971490wmq.24.1671534382906; 
 Tue, 20 Dec 2022 03:06:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77O/ce2pkQBIvIT/lHI1tqYjJNToE7phj1aeqw0VaUb7CbPRJXp3TyUv+LRAobyt/JOGMTbg==
X-Received: by 2002:a05:600c:4f85:b0:3cf:7925:7a3 with SMTP id
 n5-20020a05600c4f8500b003cf792507a3mr34971475wmq.24.1671534382745; 
 Tue, 20 Dec 2022 03:06:22 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b003b49bd61b19sm21007629wmg.15.2022.12.20.03.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:06:22 -0800 (PST)
Message-ID: <d9f26625-c675-4e9c-ca10-0aa80bcb1b95@redhat.com>
Date: Tue, 20 Dec 2022 12:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 9/9] drm/format-helper: Remove unnecessary conversion
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-10-tzimmermann@suse.de>
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
> Drivers only emulate XRGB8888 framebuffers. Remove all conversion
> helpers that do not use XRGB8888 as their source format. Also remove
> some special cases for alpha formats in the blit helper.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

