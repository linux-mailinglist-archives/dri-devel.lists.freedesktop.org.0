Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFA863ECE4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1377410E59A;
	Thu,  1 Dec 2022 09:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE7910E59A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669888161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tjYb+QjhYO0Jf+UCcwSKrQ6b4DpV+1uYKldtLZLA1E=;
 b=Rb4cKAG6wRqUFFUQRdcRguBiO6xsioxgHr0smZTQuq8XEvjnligg2rvrkp2AyATpLZEFXA
 IA5Yu6X5yUuAO+T1dU37djlITXNEvVlYATHd4IcX0wo6a/Yl8ymgCgZRYtRgBKq1E3AjeH
 dKCVMXV12xu1Ge0Yg2VAG0Jv5agCKM8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-gGp8AYuNMwKdky7fim6qqA-1; Thu, 01 Dec 2022 04:49:19 -0500
X-MC-Unique: gGp8AYuNMwKdky7fim6qqA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j29-20020adfb31d000000b0024237066261so246190wrd.14
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0tjYb+QjhYO0Jf+UCcwSKrQ6b4DpV+1uYKldtLZLA1E=;
 b=fuswfEc5Er9Xla2A6Bb+yLdA2CiZ3gxhQsljTnt79CK+nc7wxT4Z+Q2wVcJPp+x/Gi
 T3KhU/vk+sJHDPaX2/iXyEtpnLFHKRthDcVkAyCnxRKIPW7V+YCD22O3R/KUW2nC/yaM
 m3FvKMcvozSobExm6YoJvGkamTPI6wE3kheqqFpDthJhGVuUp6bXbZSsqUK3+n5uXuVN
 kZMbpbfScGFDUB3GDT/UC2OvZyZW6bCpGGzqmCgnB8/6PIJm7J8bO1yFQc7QvVEADAbJ
 eBclTtF3E/NkMeMtZFfzWsUnlpBSfVngEBbG9wHiYPAWiilJfTge/N7BT+qlGv9g8XXX
 M3/w==
X-Gm-Message-State: ANoB5pmh4juhb50IcZdKVmX1sCzlsdbhyg6zhaHaL5LDAtQ+pOhBR+De
 ycRAKvUsj9CVtR1vzO803XaTTM/hu0sVFt8KyqZFQ94u4ZLR0JJ5r/LRQrWfm796k4NG8NitKIv
 aSwOthjNSu3pxPt1UEL+GD+39UWru
X-Received: by 2002:adf:db4f:0:b0:242:1bbc:9f03 with SMTP id
 f15-20020adfdb4f000000b002421bbc9f03mr10844256wrj.377.1669888158931; 
 Thu, 01 Dec 2022 01:49:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4rhZ7DIZm4LHtXDGAOMrpRGhtPMuCN6cbbJgEBFAMkvaCv7H/7p6oFWDNhx3Lf97ZhiEVIdA==
X-Received: by 2002:adf:db4f:0:b0:242:1bbc:9f03 with SMTP id
 f15-20020adfdb4f000000b002421bbc9f03mr10844243wrj.377.1669888158692; 
 Thu, 01 Dec 2022 01:49:18 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b00241bc4880fesm3896103wrt.111.2022.12.01.01.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 01:49:18 -0800 (PST)
Message-ID: <df84bd2e-5522-a08e-b1c1-70d5b65559c5@redhat.com>
Date: Thu, 1 Dec 2022 10:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/3] drm/doc: Fix title underline length
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221128081938.742410-1-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221128081938.742410-1-maxime@cerno.tech>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 09:19, Maxime Ripard wrote:
> The underline length for the new Analog TV properties section doesn't
> match the title length, resulting in a warning.
> 
> Fixes: 7d63cd8526f1 ("drm/connector: Add TV standard property")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Ah, I wasn't aware that this would lead to a kernel-doc warning.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

