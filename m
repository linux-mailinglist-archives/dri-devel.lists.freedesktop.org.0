Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A888EE59
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 19:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8735710FF33;
	Wed, 27 Mar 2024 18:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YKSKVdXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FB610FF33
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711564579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2bWCFj1GfAC/Cxgd7TgQ+aEXofAsAoNiK6GdlWrPsA=;
 b=YKSKVdXwcRson37P8kSQVE7I97D5AbB3plwp3K1OAkKxYIsEqOF9KCpKmWxEewRPMCxWn7
 anHTB1x/m1kJLTY3O7aoxLSwG0ZYLVNopnP1nkg8CNlWswslnKxFfyGVfR7vgLk5JFwfra
 RlSlQ44QIKd/EtSIbnu3qB+2jOmhDyQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-vkc8raERPn-60bGHYfyq5Q-1; Wed, 27 Mar 2024 14:36:17 -0400
X-MC-Unique: vkc8raERPn-60bGHYfyq5Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-41463be093aso540355e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 11:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711564574; x=1712169374;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I2bWCFj1GfAC/Cxgd7TgQ+aEXofAsAoNiK6GdlWrPsA=;
 b=XiajyBmTr4m/sAJm8KDPt6sZ+suwp2v4Gytft6s3tQPEAb3y2V+d2aQAmXnsJRfvdY
 rYWqZyeE8PEWmKz/gHoi2Otw2uqSY866hf5b5oHxLk7ZvEfxqjZw6W18IT6mE1o1qnZ3
 S3+zoolsuiVt8/2le8sAKuoRlH80zSsS3LkcDvRKmIHL5J9j5h+KghhxqhRMKVR0XlU7
 lxNgSyctaVjl1ucGE2Q4XjWdH1eJzt+xf2xqq42nHZZyuO42Gk4sdaoDHidQfbgeHMvX
 JSfTAveT0m31+19xrzlmAkxU+Q3UgSARDhA4lbCgqeEnSTETtBNL5yrjNx0U9oaMBzNf
 JGjg==
X-Gm-Message-State: AOJu0YxfNjs5vgORaCNx4np8ny9pHET5TQvElO08Inaka9EHseTALq7W
 9pP/77TBbqaodMq9MbXf2beP1K70KY2dMXN0BFs1lVepdti0CVMGhZkoyfHT6Ehkal4Ks/WiSsb
 Lxuaj/l/9mUx2QMF9xU11XAxpO/T8nUiHcH3RmZLkXcyDT32dqURWXzdZrNVrfAThvQ==
X-Received: by 2002:a05:600c:4748:b0:414:90f6:c1 with SMTP id
 w8-20020a05600c474800b0041490f600c1mr687590wmo.8.1711564574821; 
 Wed, 27 Mar 2024 11:36:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWcy9rj2bdTKILB+xfS8iDvvjLilRgDDG3BuxZpWUQR8XykYQYuWLOJgSMt+IQnmoDqECnZQ==
X-Received: by 2002:a05:600c:4748:b0:414:90f6:c1 with SMTP id
 w8-20020a05600c474800b0041490f600c1mr687575wmo.8.1711564574390; 
 Wed, 27 Mar 2024 11:36:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c468600b0041477f3f99fsm2883688wmo.30.2024.03.27.11.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 11:36:13 -0700 (PDT)
Message-ID: <662d7dbd-4614-4621-bc68-a85ba644cf51@redhat.com>
Date: Wed, 27 Mar 2024 19:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmwgfx: Create debugfs ttm_resource_manager entry only if
 needed
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, stable@vger.kernel.org
References: <20240312093551.196609-1-jfalempe@redhat.com>
 <CABQX2QN729DjtdOzAS9jeEP_xHXT4zNaOcP59pa-KyXnME=xaw@mail.gmail.com>
 <0e1ed380-a25a-4a57-9395-56a13bf298c8@redhat.com>
In-Reply-To: <0e1ed380-a25a-4a57-9395-56a13bf298c8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I just pushed it to drm-misc-fixes.

Thanks for your reviews,

-- 

Jocelyn

On 14/03/2024 09:14, Jocelyn Falempe wrote:
> 
> 
> On 13/03/2024 18:57, Zack Rusin wrote:
>> On Tue, Mar 12, 2024 at 5:36 AM Jocelyn Falempe <jfalempe@redhat.com> 
>> wrote:
> [...]
>>
>> Thanks! That looks great. I can push it through drm-misc-fixes.
> 
> Thanks,
> 
> I think I only forget the "drm/" in the commit title, but yes you can 
> push it with this small correction.
> 
>>
>> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
>>
>> z
>>
> 
> Best regards,
> 

