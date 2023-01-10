Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D28B6640DF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 13:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038BA10E108;
	Tue, 10 Jan 2023 12:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F421E10E108
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673354993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7tgKM20DsrNx637VF4CpQec8L0nTnjIQhsUYzDVSoo=;
 b=Gu7hskLHH2Xo6w+T5DKO0MVWRuiiDKRJ8BcX5+SpHdZ4Lz5ubdxbx3JqHIcAWeOya7se8l
 T+YWD/RoDPlZaGdXPdzwUhfmrvLY5jC18fpfLTDZ+IxWB6ZxYvvWySrt8qYs0TvfcTVBfh
 1Sr/f6cJ8QLpJRyixGRwV1OGKUvoXhE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-B-PZJ81bPNqzQkWXY3mIEg-1; Tue, 10 Jan 2023 07:49:50 -0500
X-MC-Unique: B-PZJ81bPNqzQkWXY3mIEg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n8-20020a05600c294800b003d1cc68889dso2500337wmd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 04:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a7tgKM20DsrNx637VF4CpQec8L0nTnjIQhsUYzDVSoo=;
 b=7e5vHq70gDVGBtk4VkKhfJEmkLEZJwHwTrbKpp8OeUp15OWc9nDXWvKE5GIlPv0ghn
 vmf/ie/GerU0gYp9GyyE21syU5csXG9X00KctoBTVVIvfVuSxlcbhjS21g9MbFNA/d1z
 exyH+ULRo02M0Kew49AJSJERcWkB6VYrmba3xcC/ivzrcAdJWVDP5WXFEVhLDxAAcPC+
 ROshEn7tZCu0FW2wy8eXaJ0b0/WvJb2jofHckMf1Lg/bsWVXjO7xb+b92iC5URSl0x7K
 GSGudCxgG3wVhgNFT701ArxWAfekbVVqX5/7/Ey7i0jJnR69Ak8Di8JngWIUIZQSmc0e
 mYzQ==
X-Gm-Message-State: AFqh2krXJNSJ7gYDsbHvpKvltSceHyp/rynbw/xgx2N8/MmT0GR60O0T
 jLXiYu0iLvKocv4g5xe/rVhF+9SXvboBwh7nxA8mqmGGOQ4Z6z3VEQcBzsRWNcDQkqxk63uBjq0
 TO1K2Foi11rJ1vQ1bPjkpILlyFqt5
X-Received: by 2002:a1c:ed19:0:b0:3d3:52bb:3984 with SMTP id
 l25-20020a1ced19000000b003d352bb3984mr50092089wmh.17.1673354989022; 
 Tue, 10 Jan 2023 04:49:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvtCf5TAPAxZ3JxoE3rUo+OdTsS8gxdWrF9oAxkZz+a5XUyyGeKMFqiYs8eTs+Zw2Iyx2zWpg==
X-Received: by 2002:a1c:ed19:0:b0:3d3:52bb:3984 with SMTP id
 l25-20020a1ced19000000b003d352bb3984mr50092069wmh.17.1673354988798; 
 Tue, 10 Jan 2023 04:49:48 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c22d000b003b4a699ce8esm18214893wmg.6.2023.01.10.04.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 04:49:48 -0800 (PST)
Message-ID: <da2e0a51-9f75-cf74-9244-fd7b82dda7c5@redhat.com>
Date: Tue, 10 Jan 2023 13:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm/nouveau: Remove file nouveau_fbcon.c
To: Thomas Zimmermann <tzimmermann@suse.de>, bskeggs@redhat.com,
 kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230110123526.28770-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230110123526.28770-1-tzimmermann@suse.de>
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
Cc: Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 1/10/23 13:35, Thomas Zimmermann wrote:
> Commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> converted nouveau to generic fbdev emulation. The driver's internal
> implementation later got accidentally restored during a merge commit.
> Remove the file from the driver. No functional changes.
> 
> v2:
> 	* point Fixes tag to merge commit (Alex)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Fixes: 4e291f2f5853 ("Merge tag 'drm-misc-next-2022-11-10-1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next")

I believe the fixes tag should be before the S-o-B ? At least that is
the case in most commits and Documentation/process/maintainer-tip.rst
example. But you could fix it just before applying.

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

