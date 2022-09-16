Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B45BB43C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 00:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D83A10E143;
	Fri, 16 Sep 2022 22:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F65710E143
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663365715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBWgzFgU3Z8HMeI1bJlxwd6aqGe+i6sH93eJSlpAwmI=;
 b=EY/godSYcGBhMdBdk6fR0l7+3m5LXboAC9AA6wE1bI0cscaWWxQrcTmuHh/D+4KLmsJTpA
 l1jFhH+MIog780L+lwmy8oYUodqe3R1G1XQwDh7Gh2NuTS6UGRev39Oe4KtTAs45rcg0KA
 XWQfYu9u6PWpIvczSLLbioqFU4kehus=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-PfPZC0UzO5ydKrjX_awGsw-1; Fri, 16 Sep 2022 18:01:54 -0400
X-MC-Unique: PfPZC0UzO5ydKrjX_awGsw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f14-20020a1c6a0e000000b003b46dafde71so326942wmc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 15:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gBWgzFgU3Z8HMeI1bJlxwd6aqGe+i6sH93eJSlpAwmI=;
 b=Q2YBiG1uCTiS75EKtwn3NsMZmPJPuGwTE8og3Nu8m+F/uM0Jd1jQ0/b8N5sbDjoc/d
 lFrV5Qftx5jO+Dn7L5Jpz8TRUxZWSBaFhWpfswKC2a8pSS4C5QpKQkkfEIhRpuE7U9Ae
 fXpwUhQX+4iuRFylRUn+mBPGt9Qd3nVarLk4awCzXC/UaSzW06v6dEANExvNvcwTFbwv
 HDdPRgAEbhL0VvLKWPW85mdvUjcrkqdvzpqLPrXAR03ORVJMKmPo5JAuyNMoUZus/+1x
 rlJyiURZTePNJhxK3Rrv5Jse47u9w8esh0UnbSofSfPJC7agiJbsu1tb+aSS0Lig0qbi
 E3+A==
X-Gm-Message-State: ACrzQf0i/Gjh6QMqdvSoj472gIh9TqffhxMihJF9milHQLH0iQ+PY7wA
 c1Lm7u2a+HEL5n+D+//8ebSJzpdv3ibY4efDf1jXXX/ftgJlJAmvc0pzbwen97dEqiGWi95+R2F
 bC7qv1PuCcZtAVknpMq9aqZco0TKJ
X-Received: by 2002:adf:e310:0:b0:226:d19c:de22 with SMTP id
 b16-20020adfe310000000b00226d19cde22mr4033770wrj.314.1663365713506; 
 Fri, 16 Sep 2022 15:01:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42y1GJjQtjCDbyt3WCVfBYmMlZITlOgwAhJrFqaFC/v09i3hSqlFai21WZKqDUZm5Cz816WA==
X-Received: by 2002:adf:e310:0:b0:226:d19c:de22 with SMTP id
 b16-20020adfe310000000b00226d19cde22mr4033758wrj.314.1663365713293; 
 Fri, 16 Sep 2022 15:01:53 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f17-20020a7bcd11000000b003a4efb794d7sm3495213wmj.36.2022.09.16.15.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 15:01:52 -0700 (PDT)
Message-ID: <d29dd847-f5c8-d744-2d18-64f20abc09a1@redhat.com>
Date: Sat, 17 Sep 2022 00:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] drm/plane-helper: Add a
 drm_plane_helper_atomic_check() helper
To: linux-kernel@vger.kernel.org
References: <20220913162307.121503-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220913162307.121503-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/22 18:23, Javier Martinez Canillas wrote:
> Provides a default plane state check handler for primary planes that are a
> fullscreen scanout buffer and whose state scale and position can't change.
> 
> There are some drivers that duplicate this logic in their helpers, such as
> simpledrm and ssd130x. Factor out this common code into a plane helper and
> make drivers use it.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> 

Pushed this to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

