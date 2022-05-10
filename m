Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D2F521148
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FE110E12E;
	Tue, 10 May 2022 09:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FD410E1AE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652175895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZIkeEVePGlxbsvPHtH0nGpkFA24GFXTnSwZmVR9DJTA=;
 b=EgSpUml0Lh3joh/nPE54yo1oMwKcXhxDBQNHBjfRN2HBjjZJlMADkLlDj3TEuOWoBTrMV/
 NzwwZm3eIuAINwaWPZ9LYcvV54StbNyN1ECg7eOy9XuWjdy+WaHU/AXLnDc7S8fXBRIwEE
 BJZWiGe5jwOFAefsTM/1RbbBnuqBIp0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-O9adLfz-O7ijEOby3_in5g-1; Tue, 10 May 2022 05:44:52 -0400
X-MC-Unique: O9adLfz-O7ijEOby3_in5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso571617wmm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 02:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZIkeEVePGlxbsvPHtH0nGpkFA24GFXTnSwZmVR9DJTA=;
 b=t5QEk2GEXUqCQiOb7k62fQ0wRg57Dj5k9DGSEfqh6hY+DcrRJ04ntZ3MfO+A0Z/tzY
 yiQ+lPAQuqmyQ50Xw3s0neUxZ6rrV3K+C5Smocspv+CMSh7RnfIrFg6q90CQ9g/KkrVc
 XmpHjO2aq1zLHijtO9LyB6DQlIYBTMUiNORKWgh5vbmpBpZHuU/hSXYA2OxgdotluwhB
 aneLRT6/F7xSJkLSgMjP3CDlkhX45mEfuWecOSCVWL9KpoLRY6QJJ6hLbWQkf4QY9dlv
 5mXYv0kerlBAOVcTefDEMGPZ+96qrGiodQ/fC7wo2EsMCHSHkrlg7cZOj55ihzPKyIjS
 hYqQ==
X-Gm-Message-State: AOAM533wC5W7eQV6P43yl1wBqbM1bgGY52OoQkq2J7eYgu5SWAgRz7iD
 ysZ/oqKKn87DpME8SXodIO4+3oWB4R1Ivdw/ivSCuRzP+cTfSqN9lpk3ZIoAHheWGJ71RdekSYh
 If2B2NZIxyx+SO8Bg5hNC1+5TpobD
X-Received: by 2002:a1c:3587:0:b0:381:50ff:cbd with SMTP id
 c129-20020a1c3587000000b0038150ff0cbdmr27255203wma.140.1652175890833; 
 Tue, 10 May 2022 02:44:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqZdOByE2SRyxmDOrncLZ/RO7E0TZVermOqH+9uwM0OqnYhPpwaZ5UwYEr+j+uTXKTM8aeLw==
X-Received: by 2002:a1c:3587:0:b0:381:50ff:cbd with SMTP id
 c129-20020a1c3587000000b0038150ff0cbdmr27255188wma.140.1652175890613; 
 Tue, 10 May 2022 02:44:50 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b0039429bfebeasm6470780wmq.2.2022.05.10.02.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 02:44:50 -0700 (PDT)
Message-ID: <c148afe9-f10a-8751-d761-2480c05a137a@redhat.com>
Date: Tue, 10 May 2022 11:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <b5ab1c49-04e7-36c3-677d-2989b79e50ca@suse.de>
 <2bf27b09-0896-1849-254f-d5b19abdc892@redhat.com>
 <fc3e8a40-664f-07ae-7474-c0412a1ab1b5@intel.com>
 <1c36d431-d5c0-7278-c9e0-61867e9dc174@redhat.com>
 <79aaea41-5dab-f896-ab3d-d6bc9a5de615@suse.de>
 <2d8d8583-3a39-b826-dd83-ba5bc4c5b082@redhat.com>
 <7ffd92d7-9c07-fa9c-dc95-9e82719fd237@suse.de>
 <71ebd5f7-64d0-510a-6f1b-29921fca19fa@suse.de>
 <35ffd96d-3cbe-12dd-c1ea-878299ec173c@redhat.com>
 <23ae6eaa-c281-9fc1-2c64-dd953ad2f5f1@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <23ae6eaa-c281-9fc1-2c64-dd953ad2f5f1@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/10/22 11:39, Thomas Zimmermann wrote:

[snip]

>>
>> 3) Set .fb_destroy to drm_fbdev_fb_destroy() if isn't set by drivers when
>>     they call drm_fb_helper_initial_config() or drm_fb_helper_fill_info().
>>
>> I'm leaning towards option (3). Then the fb_info release will be automatic
>> whether drivers are using the generic setup or a custom one.
> 
> IMHO this would just be another glitch to paper over all the broken 
> code. And if you follow through drm_fbdev_fb_helper(), [1] it'll call 
> _fini at some point and probably blow up in some other way. Instances of 
> struct fb_ops are also usually const.
> 
> The only reliable way AFAICT is to do what generic fbdev does: use 
> unregister_framebuffer and do the software cleanup somewhere within 
> fb_destroy. And then fix all drivers to use that pattern.
> 

Right. We can't really abstract this away from drivers that are not
using the generic fbdev helpers. So then they will have to provide
their own .fb_destroy() callback and do the cleanup.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

