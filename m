Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECDD523324
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 14:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAE010E580;
	Wed, 11 May 2022 12:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A0910E2C9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652272186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FcY+Zd5XlbADrOvbXaU3QNiZrTO7S7HXtWKbPkPLOyo=;
 b=eL0ZA7ppauucDhal33SvDyapExjHpP+HavL5S5FKdiaH8B0Q7cqRI3TCb0suhJ1DgItGhq
 kuD10qSpZcbwQQj2c5HVF1sN0xHzKNrkPyeC3WehkxQWdzTMPETHiMOxT6Dgg00QLVZ8dt
 nbie/W2cvX0xvZb0bJJBgyzVJF+oSzY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-ICaytj6HNXWr6F7yYA2oRw-1; Wed, 11 May 2022 08:29:45 -0400
X-MC-Unique: ICaytj6HNXWr6F7yYA2oRw-1
Received: by mail-wr1-f70.google.com with SMTP id
 m8-20020adfc588000000b0020c4edd8a57so788700wrg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FcY+Zd5XlbADrOvbXaU3QNiZrTO7S7HXtWKbPkPLOyo=;
 b=Fu9Ucs0vdW0Cy+UsUPpqyEU86+P1vonGXX1YWByuLG9j+t8yuXZNJpO/ulLo7oYieL
 u+OjO5EPQrxbl3c6zztapokAbG4TVFXp8bucPVGnQGTxyUsZ7U3dpEyeHLIuWxgjZoKW
 TeZzZjKxSAyGSzmTBsb+foUrmWNcDlm26BHALQUVk1xfy6MZZmhgPDbRgB7e89OOtFu0
 mOhWkzy05Bj4zEktzX4DmSKM8885jfq6oZNpYCtlA4IFpr31APEY2BB2gZ+gH3PkQOAJ
 PV4ueImErFBg4gGT8PmsySTcN5Acz54eUjv9QSLRq7bU2beq2lBt7/4VQU10chmKTMQy
 XDcg==
X-Gm-Message-State: AOAM533USYmYF+BGoWwG0VObqXjfUj3BWZHAJ8fY4ucUj3OejqvmXSb2
 LKFDR7rfaxFyd/VkRFKRQHbmWUd2Tm5xlbOmHCI09Q3iZffHPVxQoyIXMdxBQWs+I1s6FYX+sM4
 NrlGud6U9cBQCS20tqXxBykx+Ncvo
X-Received: by 2002:a05:600c:1e23:b0:394:6133:a746 with SMTP id
 ay35-20020a05600c1e2300b003946133a746mr4578091wmb.17.1652272183901; 
 Wed, 11 May 2022 05:29:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy2ou+Mk/PkR/G/eo5g55eQmz0xGQXbimhYd6JFu/Xn+JJE2bLkuI6rzG6fUa4G4ybIfW0sg==
X-Received: by 2002:a05:600c:1e23:b0:394:6133:a746 with SMTP id
 ay35-20020a05600c1e2300b003946133a746mr4578064wmb.17.1652272183647; 
 Wed, 11 May 2022 05:29:43 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c464500b0039482d95ab7sm1880616wmo.24.2022.05.11.05.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 05:29:43 -0700 (PDT)
Message-ID: <fa10ffa4-d43f-1270-acab-3d3d228e0b88@redhat.com>
Date: Wed, 11 May 2022 14:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
 <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
 <7d9f44e6-ae45-1747-366a-15cf2941dc2f@redhat.com>
 <8ec8d896-599e-b1ff-2b4f-077d73944705@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8ec8d896-599e-b1ff-2b4f-077d73944705@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/11/22 14:05, Thomas Zimmermann wrote:

[snip]

>>
>> Other subsystems ask you to do the opposite, to split the definition and
>> usage in separate patches. But I'm fine with merging those if you prefer.
> 
> Usually, I have no strong opinion on this. But in the case of this 
> specific patchset, I have the feeling that I'm missing some important 
> point because call and implementation are separate.  See my other 
> replies for that.  Putting them next to each other will hopefully help. 
> Sorry for the inconvenience.
>

No worries at all. Happy to do that change if the patches are easy to
understand. It took me some time as well to wrap my head around all
the race conditions and needed locking.

Same for patch 3/7, but I'm convinced that dropping the lock is the
correct thing to do than calling to drivers' .remove callbacks with
a lock held.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

