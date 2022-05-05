Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6963C51BA86
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B097610E4E0;
	Thu,  5 May 2022 08:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07E310E4E0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S96mA4Ie3bRtv9R+1bbKD4AnGf5O4BhFOs7D+b38OJQ=;
 b=hnF43BiEfWHNS1cMMG7PjPOca6omxzVweoZ7nLwhi1uisbov+1v/qJeQ2pvx6zh5XIHo1r
 BOQactqNE9jk1pl1fcE/l0U2A00BJFPiuPs6HOXtEKZ7dN0qnVMl854Nqv6dwU8J/HyNEC
 X1hqU6NduSOlcqli4uQ04PKWqJhmdqs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-Wj-yKFWxMzSOoBnIFxY8UA-1; Thu, 05 May 2022 04:32:16 -0400
X-MC-Unique: Wj-yKFWxMzSOoBnIFxY8UA-1
Received: by mail-wm1-f72.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so1430746wma.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 01:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S96mA4Ie3bRtv9R+1bbKD4AnGf5O4BhFOs7D+b38OJQ=;
 b=beYkYe9LWp/zZHLeEdjSJQT0nt7RZzLs+f/DJKDlDqmnFv+1aAa+QzCrdEgVW9lonv
 Vw2sDaBjmsPQcINDfxp7nAuERRkhiEkfPUZ7c6uNlhesWqJn7bgbygHLoIZ6VlV7HEmf
 ilfqkhlPTUfKSqkkJEdG45Fxf6/EA/yKpxW8czKxVuWlHwW3byXJIidXWfa8ou4oDDo9
 nKQ/Rso/OOWs2vaPKDilv+mvbNby0QgFq+0H6F+yN0OHAzYRbzlE5xgJ5ZDWeUiJyRN0
 DIO82bttsooF8RXH03oztyOxXtYMdZ75Zqjj+LKT+PhO7usKuShERAIWg2ZQHpgqahuB
 5WFw==
X-Gm-Message-State: AOAM532FCcMBYG1wPEwbIH9jrsXgVvd+Vr0gQGHE2+G3yPzPzMGIcpSV
 3YCsxA+q4Vcoh/piITItVbSSj0WAxj75M7MEAQ/ZXsGrPu4ZJIn3MwrP9qfCSHO/4HORr5Ml+c0
 LqvyYDUYy0ocicgzrNdLB00edZyTT
X-Received: by 2002:adf:dc42:0:b0:20a:cf97:f1b7 with SMTP id
 m2-20020adfdc42000000b0020acf97f1b7mr19626855wrj.200.1651739535721; 
 Thu, 05 May 2022 01:32:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3Wtm4DgnIJxwRdiMAj0etcbY/FRx4Rofh1acsbZWYdXjyJBptet2S8gRODazb7sgMUh1mFA==
X-Received: by 2002:adf:dc42:0:b0:20a:cf97:f1b7 with SMTP id
 m2-20020adfdc42000000b0020acf97f1b7mr19626837wrj.200.1651739535431; 
 Thu, 05 May 2022 01:32:15 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k9-20020adfe3c9000000b0020c5253d8eesm678310wrm.58.2022.05.05.01.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 01:32:14 -0700 (PDT)
Message-ID: <d3e60b09-caf1-d62a-c764-eb7976450ef2@redhat.com>
Date: Thu, 5 May 2022 10:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/todo: Add entry for using kunit in the subsystem
To: linux-kernel@vger.kernel.org
References: <20220504080212.713275-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220504080212.713275-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/22 10:02, Javier Martinez Canillas wrote:
> The Kernel Unit Testing (KUnit) framework provides a common framework for
> unit tests within the Linux kernel. Having a test suite would allow to
> identify regressions earlier.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks all!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

