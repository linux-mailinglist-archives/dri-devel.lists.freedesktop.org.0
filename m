Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43EA60FC14
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE2A10E684;
	Thu, 27 Oct 2022 15:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410A010E684
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666884886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNuZpz25sGqUOiSfMhruQ4sHmsSDmxs/2zBoNqjMViU=;
 b=aMSbWbjSAqczF249A7/FNe/dpdzGH3ozWuUzJqC0skmSPp7xBzanoIs95t92EwAWj4iD/4
 XP02v0zctEnqWQOPaHB569BCIGAZ7b9cxZXQejidyCaysCCNR+QOMAMd9AMUYaOPvU/Uiz
 k+g1DnE3GEDtnbiBu5W9T5mO9t4qBoQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-qMSY5nvaM4uRfWE3FGNpxw-1; Thu, 27 Oct 2022 11:34:45 -0400
X-MC-Unique: qMSY5nvaM4uRfWE3FGNpxw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r22-20020adfa156000000b0023660e969ddso542283wrr.19
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eNuZpz25sGqUOiSfMhruQ4sHmsSDmxs/2zBoNqjMViU=;
 b=AXn3j3V5Hph9vA42iUNNuNFRvhcJ5KlKxNLX32MpwBpGLQ4DP3nm/0W8CJkAXvaFrh
 SXTvrF+1O72Vh/wP1DO0r+lqsLcCM82Fqb3d4yyXSJaSBE3Zw/cFUpZmCiocr68rQOF7
 f82uJnfNcSerJu/nSreLV1w3Qufr2uP9Nh8sKZF14B4wn03jNebLj7yBABmG4fTMiAlX
 qZCFAnx0y2GAwRmY740tm33g0SLNyyjkmW+2EJ0PH9hxahmgOIah4tbR1uplVr57I5ci
 ecGMfIXl7X1reWmR8cpXAR83B6H52DgJNIJpBXgkhN9zKUD76mW51vBFZmztCX+z2BTV
 Rs2g==
X-Gm-Message-State: ACrzQf1EweRDM2fDE+dtTNS65LhwltIyRs4agTUOK0uKFDE9CLBmZ0B7
 HPubOtLI2tlcHcISrthYXCWuchZ1eIjUMJ+ugjbotG0wj06WWQ00mDgJcrNvUCK2doU8XsGXaB7
 3Uo5S0HgZSFH2S7lcCpnXicnkJfjL
X-Received: by 2002:a05:6000:1863:b0:22e:6946:be33 with SMTP id
 d3-20020a056000186300b0022e6946be33mr31295345wri.630.1666884883817; 
 Thu, 27 Oct 2022 08:34:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5G1Wam7Ma1smUpDj58zySd7alpiCBdOz7pP2jvZo1vb3lVOgMLF4Ui1/5vsnthzbUmUwS1Mw==
X-Received: by 2002:a05:6000:1863:b0:22e:6946:be33 with SMTP id
 d3-20020a056000186300b0022e6946be33mr31295331wri.630.1666884883621; 
 Thu, 27 Oct 2022 08:34:43 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003b4c979e6bcsm5503821wmq.10.2022.10.27.08.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 08:34:43 -0700 (PDT)
Message-ID: <c3e7b1cd-46e0-4b77-d5c7-5a44cc3506fc@redhat.com>
Date: Thu, 27 Oct 2022 17:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Fix outdated function name in comment
To: maxime@cerno.tech, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221024093634.118190-1-maxime@cerno.tech>
 <20221024093634.118190-2-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024093634.118190-2-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/24/22 11:36, maxime@cerno.tech wrote:
> A comment introduced by commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link
> on hotplug") mentions a drm_atomic_helper_connector_hdmi_reset_link()
> function that was part of the earlier versions but got moved internally
> and is now named vc4_hdmi_reset_link(). Let's fix the function name.
> 
> Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

