Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC06660E1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DCA10E79C;
	Wed, 11 Jan 2023 16:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4083310E79A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673455430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxRYFvZ1+BeTGMrTtJZgEBUI9joLdvIfL1k/Gm7E0+s=;
 b=ivNrNUAD6fn98oDUTBJP8nZNTKVWVwPcO+u0mYKEQTiJOYCn+Ao9kE+hAzflNSkTpJZcJX
 KzccP0RkNyfVJZtlJuIjp/+Ecys1+4h0T25OuKw4nUyvEEghTk3sF5lHlyMjua3FnvDbij
 FKo+SfG0HT65EFMdtRn4+viq3Yz4tLY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-fdQzvz1SNGqMAYBUmMAT3A-1; Wed, 11 Jan 2023 11:43:48 -0500
X-MC-Unique: fdQzvz1SNGqMAYBUmMAT3A-1
Received: by mail-wm1-f72.google.com with SMTP id
 v23-20020a05600c215700b003d9e9974a05so5744494wml.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 08:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HxRYFvZ1+BeTGMrTtJZgEBUI9joLdvIfL1k/Gm7E0+s=;
 b=C53WpaBqN0n4OeNMgszw1C1AcoXDKqYWUQBzdOpQc2WlOEDAgwFQQ4zwXk2el7f32M
 KNzGeGQXyz0jD/DuWWZtd6pyk2DdE0LNMHSLnLFmfBQ4u7WfmRSetoMkwvzehic3M0+r
 pRXhA7RhMq8W1tMOnvhBibhVFU/eE//NsUl2MDdycYh46vi939Inc81zIRlL+YtZCTdn
 Cl2Z4hAKq6LBgo0xJp2Eac/Sq8H9XgylzZfzGYQDHAaEJJKCCyQYLotChn/nQt3WTHJA
 817w5B+c73Y/4rWF/0NFiFnDRONVqhe88lI2AKCV7jp6YodbUCeK3YLppAYtfY8abytA
 5Q/Q==
X-Gm-Message-State: AFqh2kqCoXs0Q6GYgsoSp4lE2H0h4W2HqXSLtaJOI5GWHHsRYttPkFRo
 2QwSJtMiVMvjyvk5OMPKa40MD8peUYOKa+MmMwURcxrfIK9WUgHg/9wdnZev3soadtdKsRpxJZh
 KQfFEyfQIIEsqNtO7WzItsaV+O6qV
X-Received: by 2002:a05:600c:a51:b0:3d2:3376:6f38 with SMTP id
 c17-20020a05600c0a5100b003d233766f38mr51935578wmq.20.1673455427719; 
 Wed, 11 Jan 2023 08:43:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt8bs5GVHKAAyzPrAmLCp/tLubFFeFPYbGqzxKyfH2/luqZIN7to1nvrwQTAx8OXJqYX3VBcw==
X-Received: by 2002:a05:600c:a51:b0:3d2:3376:6f38 with SMTP id
 c17-20020a05600c0a5100b003d233766f38mr51935564wmq.20.1673455427564; 
 Wed, 11 Jan 2023 08:43:47 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003d9aa76dc6asm27673760wmc.0.2023.01.11.08.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 08:43:47 -0800 (PST)
Message-ID: <dc578554-570d-9496-6661-4c9bcd3e2496@redhat.com>
Date: Wed, 11 Jan 2023 17:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 11/11] video/aperture: Only remove sysfb on the default
 vga pci device
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-11-daniel.vetter@ffwll.ch>
 <2102a618-2d5e-c286-311f-30e4baa4f85b@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <2102a618-2d5e-c286-311f-30e4baa4f85b@suse.de>
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
Cc: Aaron Plattner <aplattner@nvidia.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/11/23 17:20, Thomas Zimmermann wrote:

[...]

>>
>> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
>> index ba565515480d..a1821d369bb1 100644
>> --- a/drivers/video/aperture.c
>> +++ b/drivers/video/aperture.c
>> @@ -321,15 +321,16 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
>>   
>>   	primary = pdev == vga_default_device();
>>   
>> +	if (primary)
>> +		sysfb_disable();
>> +
> 
> There's another sysfb_disable() in aperture_remove_conflicting_devices() 
> without the branch but with a long comment.  I find this slightly confusing.
> 
> I'd rather add a branched sysfb_disable() plus the comment  to 
> aperture_detach_devices(). And then add a 'primary' parameter to 
> aperture_detach_devices(). In aperture_remove_conflicting_devices() the 
> parameter would be unconditionally true.
>

Or just remove that long comment since there's already kernel-doc for the
sysfb_disable() function definition.

This feels to me that any approach to parameterize this will lead to code
that is harder to read.

Since is just a single function call, I would just duplicate like $subject
does to be honest.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

