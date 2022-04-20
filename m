Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAEF508818
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27FB10E614;
	Wed, 20 Apr 2022 12:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10DA10E614
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650457567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kDR2uxr0iTgG8fLTqAnDZYdU3CRWWnnBPjFez58Pbz0=;
 b=awqjYoQVw7iWRq61Hkh0GyEBS4A4oYUmtdPhF8K1UQYZQRZCdvQKUhzPqABhPduuvxk/kD
 5eCRMc9sPdJIVUjTaY0VSIxpbq2xo8fTa1xSz3szhUt2bisEv08PC+sIbhsVLIy01BeRWH
 bqTq4ZJWygnk9bQZrnOECFICyM/eibU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604--CogwD1_M0C5wNqXEKzY-w-1; Wed, 20 Apr 2022 08:26:06 -0400
X-MC-Unique: -CogwD1_M0C5wNqXEKzY-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 p21-20020a1c5455000000b0038ff4f1014fso846621wmi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 05:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kDR2uxr0iTgG8fLTqAnDZYdU3CRWWnnBPjFez58Pbz0=;
 b=T1B3IH0JHkH8Lwd9uFpA8MLAlAiXLYz/7D+CVTM4tWeTh/orBkP5sqNvi5liZBYHhh
 zb8BYgXxM3VSSc036TkEWK0b7MNkPlSMOG0+5u+46GY4ycnTZGhtul/CJr1e8AK5tnwT
 hLICYFz+vIbcmmj0G/x1wHkFQgye8dDyBbADNpS4nKitapRCzrlZHFdIA9+LLPcVVcgY
 bkLvpFSlzzTTML5tKsUmhLLIfU4/SA8w+Ywoa3gFaTScD6s4qLwu6riIkiqPuit4Ttym
 KGfmX8N/QWEGjigv3UfisEipRQ5o2SIKr0RbSzJaLP3KfTYi6CQ36jpo+qcJKxKPPU4m
 paEw==
X-Gm-Message-State: AOAM532zwREZ7ONgXHTtZNn7mQWyOHqHn9o/gjhL7haaBVAIKO7DiIls
 jkCNbK1fpxUI3o6+OsDNhonwrhVmuJVFBziRXleIdnSQf+DiUimfFLUarlsMmc6vR2rZK2R+1+k
 AP2nhkvpZNMGcD2ImIOC3UF0v3+8y
X-Received: by 2002:a05:600c:1d9d:b0:38e:c8e0:209f with SMTP id
 p29-20020a05600c1d9d00b0038ec8e0209fmr3566552wms.43.1650457565252; 
 Wed, 20 Apr 2022 05:26:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBq5j721vvQtiFfFZ3kYxI/kB7RcO2YJdF0yvmmx0sxKiz4JMSKbao6UyWgApB76gYaGHiMA==
X-Received: by 2002:a05:600c:1d9d:b0:38e:c8e0:209f with SMTP id
 p29-20020a05600c1d9d00b0038ec8e0209fmr3566529wms.43.1650457565005; 
 Wed, 20 Apr 2022 05:26:05 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b0020a8f950471sm10539264wry.115.2022.04.20.05.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 05:26:04 -0700 (PDT)
Message-ID: <958ddd41-06eb-40b4-a88b-1ac712345fbf@redhat.com>
Date: Wed, 20 Apr 2022 14:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 7/8] drm/display: Move HDMI helpers into display-helper
 module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220420110900.8707-1-tzimmermann@suse.de>
 <20220420110900.8707-8-tzimmermann@suse.de>
 <6f4c5894-a154-b0f8-084a-4ba8f66cd4ea@redhat.com>
 <3e380d00-f3b3-8c24-e0d8-cb1935278aa4@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <3e380d00-f3b3-8c24-e0d8-cb1935278aa4@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/20/22 14:21, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.04.22 um 14:02 schrieb Javier Martinez Canillas:
>> Hello Thomas,
>>
>> On 4/20/22 13:08, Thomas Zimmermann wrote:
>>
>> [snip]
>>
>>> --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
>>> +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
>>> @@ -1,6 +1,8 @@
>>>   # SPDX-License-Identifier: GPL-2.0-only
>>>   config DRM_DW_HDMI
>>>   	tristate
>>> +	select DRM_DISPLAY_HDMI_HELPER
>>> +	select DRM_DISPLAY_HELPER
>>>   	select DRM_KMS_HELPER
>>>   	select REGMAP_MMIO
>>>   	select CEC_CORE if CEC_NOTIFIER
>>
>> [snip]
>>
>>> +config DRM_DISPLAY_HDMI_HELPER
>>> +	bool
>>> +	select DRM_DISPLAY_HELPER
>>> +	help
>>> +	  DRM display helpers for HDMI.
>>> +
>>
>> Maybe you mentioned already when we discussed it in v1, but could
>> you please remember me why we need to select both symbols for the
>> drivers, even when DRM_DISPLAY_HELPER is already selected here ?
>>
>> Or are select operations not transitive ?
> 
> DRM_DISPLAY_HELPER enables the module itself. It's tristate. 
> DRM_DISPLAY_HDMI_HELPER, DRM_DISPLAY_DP_HELPER, etc are the individual 
> features of the helper module. Each is a boolean.  Drivers can enable 
> them according to their needs.  This split allows linking correctly in 
> all cases, even if some drivers are built-in and others are modules. 
> This didn't always work with the original patches.
>
Right, but that wasn't my question. I wondered why for example DRM_DW_HDMI
Kconfig needs to select both DRM_DISPLAY_HDMI_HELPER and DRM_DISPLAY_HELPER
since DRM_DISPLAY_HDMI_HELPER already selects DRM_DISPLAY_HELPER.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

