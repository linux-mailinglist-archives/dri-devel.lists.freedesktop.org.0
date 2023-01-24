Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE206794D2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6004D10E649;
	Tue, 24 Jan 2023 10:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1310410E649
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674555004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFDK+kFH8HIC/TzW1KCoOg355Vt7UsVPru6vlXZw2AA=;
 b=RKYI5nJ54GYnhQr8K+8GVdM3m9W03/94vqw/V2YdN/sAqGpLmaAHsmER0G9LXMGUQzZ3qz
 CaoATN2WkXqeomOxj+Fk2hd0AywoijUs3skh8Jlvllnl4pZ4uh7UD4n1WSJrp0uecMH0UB
 URNiclil1qznMk+IjfS2kndwqfBDBDI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-lbE1dz7hPNeQoqzwc0uXeQ-1; Tue, 24 Jan 2023 05:10:02 -0500
X-MC-Unique: lbE1dz7hPNeQoqzwc0uXeQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l18-20020adfa392000000b002bbd5c680a3so2512964wrb.14
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 02:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bFDK+kFH8HIC/TzW1KCoOg355Vt7UsVPru6vlXZw2AA=;
 b=atG1fRbGvjYN3i9JafJkTKcOcqoZL7aV7p0flskHggVDdyslAGeTTWgxHyce4OqG9H
 MlfrPD1Ti8l2LSi77MraMmImT1XFXmotejQKxhptraMa/5/iZK8DHMmAwe7jJrCF9wum
 C7ii7lIpsJMr9e+RJ9ADTZBeSF9GbfmBcEyTyYb+mxg8aFQVWLTDNKzi41LDsmctXiLa
 ndJwgG9TkPK8X3uqNxZ57VeLJv/C7Vk8vTlyegKoHtMp+rCq4O9evVBOH5M5ls98ScWr
 9PC6OOUjs7XN45cpEVjDm7AoPO/AHBf5gzgH8TryvSil8tMlMPC5251pQBUqiP91/vv1
 y0oA==
X-Gm-Message-State: AO0yUKXmIXzWJ0yJNcPdUKvUp/pEXQSQlsEIY6Fo7bYAs7vJjlDoAFqm
 55zxnJGBGHUdggc6BXot0aCJpmwCqGTteF7pKal3QavsI91XQP/2UuscndZUaR565Vv7Y2JHfur
 8SnqgL+xOuB1Jfa8fhfmQQP6PB0Sk
X-Received: by 2002:adf:ce04:0:b0:2bf:ae15:5950 with SMTP id
 p4-20020adfce04000000b002bfae155950mr2064111wrn.20.1674555001389; 
 Tue, 24 Jan 2023 02:10:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8JCDaZ6+VVJYdKA3bFSsDgu6eawmj4lpdDSlBDI/rz3pyQULfDuvWJ7TNd2EQjXNI5XGujFw==
X-Received: by 2002:adf:ce04:0:b0:2bf:ae15:5950 with SMTP id
 p4-20020adfce04000000b002bfae155950mr2064099wrn.20.1674555001179; 
 Tue, 24 Jan 2023 02:10:01 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j13-20020a5d604d000000b002bddd75a83fsm1538673wrt.8.2023.01.24.02.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 02:10:00 -0800 (PST)
Message-ID: <03881b6b-baeb-0e23-5e5d-e625b52366bd@redhat.com>
Date: Tue, 24 Jan 2023 11:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/3] fbdev: Remove unused struct fb_deferred_io
 .first_io field
To: linux-kernel@vger.kernel.org
References: <20230121192418.2814955-1-javierm@redhat.com>
 <20230121192418.2814955-2-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230121192418.2814955-2-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/21/23 20:24, Javier Martinez Canillas wrote:
> This optional callback was added in the commit 1f45f9dbb392 ("fb_defio:
> add first_io callback") but it was never used by a driver. Let's remove
> it since it's unlikely that will be used after a decade that was added.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Pushed this to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

