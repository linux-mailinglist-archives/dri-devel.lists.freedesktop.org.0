Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A457771A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7AA10E64B;
	Sun, 17 Jul 2022 15:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F8510E64B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658072139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5i55TZY0CmgDTXBV9KNmN7u8mQLJXUwmyfQn2he/AjY=;
 b=WEasaiXR96ghBckGT7cMVS6WgfJtSFeOiAR2YwqbB6E/fM5fJNanDiunQDyZJ/ImOdgRIx
 D+d7FBChw78aHbL2eMFRFc+CLry8jJ6GHLQVrLH02dIRnvj6adZky8DQwz5qmj/xba93Ix
 u71yAsH8jxaAltp6aJXXmkaneznp8pE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-w-tkUZLcOH6ueYITwkeFeA-1; Sun, 17 Jul 2022 11:35:32 -0400
X-MC-Unique: w-tkUZLcOH6ueYITwkeFeA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r82-20020a1c4455000000b003a300020352so3842292wma.5
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5i55TZY0CmgDTXBV9KNmN7u8mQLJXUwmyfQn2he/AjY=;
 b=yYABd8DasvWmXbfMarAtAcw3mgou4694ej77gTvRnQrmXmMYvKdAfMwq5Dqpgj1zhZ
 c7VgVLaHAKDyABnv4FHH1wjWQ4onmT/ReQboOiRatPzh+E9Gqj8RRa6vdCIA+Yvk7/bs
 YXBmmSqnJmdiE5aKIlVx92Uy+H9OggOv3lYv/1YoxnoE3RERsfBUs7HvZT8/e0gHGPuN
 Eq9M6k5UBmohbsj8/tP5yXk8KaI8z/HqLzo87YDmhbBQqXP7bhHbHdkxDzvKygmgYmzn
 +DSpxOLqVACYD3GTqsC3PUXuA3rBw8F0aP2fNU0moCCQNcAzRBUi4gRgzFBKxiWlYcjw
 9HIQ==
X-Gm-Message-State: AJIora/xrY+XfvYU3Tu4X/AFo18Oj6gKzvQxeDHW0QEoWb03G7hhPngK
 fZj15ocQJwC7SivEC8NqnmdoIYd1QGlDxROFyppBOPLCRbywuqBHQWgwCOB50+S0GFx+wU4ASPN
 LJF1Lp9Q1+GVZNMzH/AgKmW31p7HV
X-Received: by 2002:a05:600c:2196:b0:3a2:feff:4c42 with SMTP id
 e22-20020a05600c219600b003a2feff4c42mr18764180wme.163.1658072131436; 
 Sun, 17 Jul 2022 08:35:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vDTDJ5raJDHGjOEEWXOY6dzm7Ab9NiWTRG/y3Fx8BqM1KO9H1X0ScLpilWZoHdofa9tR+G+w==
X-Received: by 2002:a05:600c:2196:b0:3a2:feff:4c42 with SMTP id
 e22-20020a05600c219600b003a2feff4c42mr18764167wme.163.1658072131217; 
 Sun, 17 Jul 2022 08:35:31 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d16-20020a05600c34d000b0039c5642e430sm7759927wmq.20.2022.07.17.08.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:35:30 -0700 (PDT)
Message-ID: <408f13ec-2703-a4bd-54cc-30497fee57ee@redhat.com>
Date: Sun, 17 Jul 2022 17:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 11/11] drm: Move dri1 core files to drm/dri1
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-12-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-12-sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/22 20:17, Sam Ravnborg wrote:
> To have more of the dri1 specific support in one place move the dri1
> core files to the dri1 folder.
> The files continue to be part of the drm module, we just refer to the files
> with a folder name.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---

This patch shows how having them into a separate sub-directory pays
it forward since you won't even see any of these drm_ core files if
not interested about DRI1 drivers.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

