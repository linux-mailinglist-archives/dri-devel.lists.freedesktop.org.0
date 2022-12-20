Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B6B651F42
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AF110E388;
	Tue, 20 Dec 2022 10:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203BC10E388
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671533545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxE/g8D90YG3CSnPlZzOgTlS8jPfXjPJK/f2ANsH2jY=;
 b=ix+k32CWgVegL1ipEuMClE4u/k24g6gg8AcLb9+4kfyYjHBRbM1L625zfjyKPPRGzvbs18
 GExJxcRS9QNj0UApsbFmllTa6lcfIWkavoGdCafoa5CAozUzrkb66v2ZlL62fLLm5HfCPn
 L0Joi6AExEIITRWx2inPLuQM22Ijiq4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-irPBFmK7Oey25woyJl5YAg-1; Tue, 20 Dec 2022 05:52:24 -0500
X-MC-Unique: irPBFmK7Oey25woyJl5YAg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so2124329wra.17
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 02:52:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uxE/g8D90YG3CSnPlZzOgTlS8jPfXjPJK/f2ANsH2jY=;
 b=aCS+elQyvxXRyDVpyZ4Oh8AdFhRqaeNJJZIeRlby2bT2Yz0BV+ApGaA3jhxGSb7RUd
 s+fxftflVBvCZeT27V0ERDklpI+G+7XnSiYffQDVOlGjrFgZsu4lc50x8YN3y5Y3ErWY
 5O7zR7/srDvl8s7tRw7i3pu49wF6nCUKmzNF9AHJpiUwD73yIgyJAC8oAGmqhU1jE7BO
 dfgLLxidvDKlYCGjRNEOdXNn99/iOGXFYbTZNa3vSq28jJhes0pj8MmaYO5Q3/4bFNv8
 /UART7jkD2PZh0wtBRj7HLrrG6XO7lGWwycnjd4XdbfbG8M2Kd7xcLf1T/rMh7glTeK4
 RRZA==
X-Gm-Message-State: AFqh2kpiXaE/tq1XKCiFQ39zQ9SqN0o2WAR9/X+lw6n98wXPHY3HyQmS
 aUzJuq9wVfe/B7Mj5/Js2jUeRO48i94RF/b5IvMOJ6odVvk7Xp3Q3SQtqjNdgGXgD4KUIyAB7l/
 Yc/wDY+FdJiZ/KU0hik+y9Ke/Lh6F
X-Received: by 2002:a5d:568a:0:b0:241:f85e:75ca with SMTP id
 f10-20020a5d568a000000b00241f85e75camr1240063wrv.9.1671533543082; 
 Tue, 20 Dec 2022 02:52:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsDHxBF+gpHbGUArjOzf7hxWDrXXtNxfxPOQUv4VOvMT98lsPQ7mrfxnmRaM+r8/ydNqKnJFw==
X-Received: by 2002:a5d:568a:0:b0:241:f85e:75ca with SMTP id
 f10-20020a5d568a000000b00241f85e75camr1240046wrv.9.1671533542867; 
 Tue, 20 Dec 2022 02:52:22 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d66c6000000b00242271fd2besm12396417wrw.89.2022.12.20.02.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:52:22 -0800 (PST)
Message-ID: <fc138337-d4cc-2f7d-3687-33e0b45e22cd@redhat.com>
Date: Tue, 20 Dec 2022 11:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 6/9] drm/fh-helper: Split fbdev single-probe helper
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-7-tzimmermann@suse.de>
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
> Split the single-probe helper's implementation into multiple
> functions and get locking and overallocation out of the way of
> the surface setup. Simplifies later changes to the setup code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

