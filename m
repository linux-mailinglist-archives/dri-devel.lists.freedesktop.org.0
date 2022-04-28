Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8C512F56
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 11:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B0B10FA28;
	Thu, 28 Apr 2022 09:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7C210FA28
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651137099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ev0V3dh1Yk75AssijLWz6pZJn0r8SgSUi6JEJ9qm3Yk=;
 b=E/mqXG4R9h6a2OmfzBnWu6bwHmf2tb4maFRRHxif3jOD/g39fidOUnctEtzZDjVEFcjf4V
 wCwCBSLtr8p2w8OVwAJ1ILIyKhqM3H9r8DfidHMMm9z69QM/aW8S+IM9b6RmG4p3smtA2Q
 TqMaS5zQ2pkZj/zCRnLiTfk6MGDyKak=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-CB5gkNNxPTOfI-wuUUXQ0g-1; Thu, 28 Apr 2022 05:11:38 -0400
X-MC-Unique: CB5gkNNxPTOfI-wuUUXQ0g-1
Received: by mail-wm1-f71.google.com with SMTP id
 k41-20020a05600c1ca900b0039415d40dbbso265307wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 02:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ev0V3dh1Yk75AssijLWz6pZJn0r8SgSUi6JEJ9qm3Yk=;
 b=i4A4A1xif/uS/+1qke2MUh8rSPVJ36psygbDrdraG7wV5yYHvDe5Riv5Kv/cxkJLdM
 D8r7lCeY+DSdVaHnRBFVZ6/4Utlxj8V3TLi7kd/BzvRgqqtUAXSatiUMg0ue1PTylFWm
 PdmlgI/DXLkJWTo9Rsi8Q28T+A+/qeVM4x/nYVp1dOI8Ubzt+eBS019SDwCbXHGo7FDw
 RTQA1RIYbFy0c/Ic6UWQl1wNTlARDpwkNM+YN0yzeu9OHkhXT+ZtG6PSGFXkwV1pTwXE
 ZJO2siY/MDbQVK7F6a34Q0Yk4QDFHfIdP19hL2RG04OfjaN8KJtVY/qeno4c+jk22cXj
 nffg==
X-Gm-Message-State: AOAM533Lsof1QTt/u0CrT4g27sPYMkUI6tylynVIYj8k7UBvv+g9ehh2
 TnDw+pRVGHqEJI+Yu+EyBw6PywUgbNpNv34r5aHVhoqjIBjuiJh9RzlaBbmRszf+6OZpE1zZjqI
 OmkFRPGZFID9jOjxW4BbkDbM0Whdx
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr38264529wma.75.1651137097334; 
 Thu, 28 Apr 2022 02:11:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxli1ru5EtzorJANXnGcbADNMy0+tRE2gZ3UT2MrzMXCufukyc2wlVDBGNCEj1I2BummVcvXQ==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr38264512wma.75.1651137097145; 
 Thu, 28 Apr 2022 02:11:37 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm4479447wmq.40.2022.04.28.02.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 02:11:36 -0700 (PDT)
Message-ID: <8181a700-4955-cbdb-553f-311d790c603f@redhat.com>
Date: Thu, 28 Apr 2022 11:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>
References: <20220428082244.390859-1-javierm@redhat.com>
 <c2ce3927-44ac-45cb-9ced-cfd3f9a184a6@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c2ce3927-44ac-45cb-9ced-cfd3f9a184a6@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/22 10:42, Thomas Zimmermann wrote:
> Hi
> 

[snip]

>>   drivers/gpu/drm/display/Kconfig | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
>> index f84f1b0cd23f..1b6e6af37546 100644
>> --- a/drivers/gpu/drm/display/Kconfig
>> +++ b/drivers/gpu/drm/display/Kconfig
>> @@ -31,7 +31,8 @@ config DRM_DISPLAY_HDMI_HELPER
>>   
>>   config DRM_DP_AUX_CHARDEV
>>   	bool "DRM DP AUX Interface"
>> -	depends on DRM
>> +	depends on DRM && DRM_DISPLAY_HELPER
>> +	select DRM_DISPLAY_DP_HELPER
>

My rationale was that since DRM_DISPLAY_DP_HELPER is not a user-visible
symbol but DRM_DP_{AUX_CHARDEV,CEC} are, the latter should be able to
be enabled by the user without relying on other drivers to select the
required symbols (I would argue that even should select DP_HELPER but
that can't be done or otherwise the helper couldn't be built as module).

In other words, either DRM_DP_{AUX_CHARDEV,CEC} can be user selectable
as a standalone symbol or can't and will only be visible if other driver
selects their required symbols.

In which case, why not just do this non-user visible and just make the
drivers using their helpers to select it directly? That is one of the
options I proposed before.

So I believe this is the less intrusive change that will preserve the
current behaviour as much as possible.

I don't have a strong opinion though and if you prefer I can change to
be a depends instead.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

