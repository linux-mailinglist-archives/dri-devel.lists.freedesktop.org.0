Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE9B51D8BE
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 15:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11AE10EA88;
	Fri,  6 May 2022 13:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC9310E801
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651843129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6eR4SrDmEoANuYmWC0BJSoz/4Iidosis2CSmMHpx9dc=;
 b=S6j5+NxN/+u0P6GR4xrzjLuQwD0p6yD73LLc4KDFxwokYxneNPk5upAPHMLCnXgtvF0/hX
 lGYgke8ATe6h1xxl2Lr2rTL3VoopxBmQk+ldvBlfvsrs2Z4cFUi5N7JVa+IAhIyPIc03e1
 tjUQMWKdyFwn4SSJNAMQdjPGCAL3PAI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-KtaJrjYONYCHxHNyOt4NeQ-1; Fri, 06 May 2022 09:18:47 -0400
X-MC-Unique: KtaJrjYONYCHxHNyOt4NeQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so2569366wrh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 06:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6eR4SrDmEoANuYmWC0BJSoz/4Iidosis2CSmMHpx9dc=;
 b=7B5AJbyWFX2ZorsjXrp298beBrYTUeVh0ViPnmcQcZUDpDsXOjtrOfjSXLjhuow0q5
 UXDqYFyHf5wGX96GAWV924V8N/XW5Rq0MGNIpI8lk5pFXpcEGe3XZNf9UiAESPWSbkVl
 v+fXbGDLB2Txu41cSZETeFEHO+M1NH40E6UGTZeA3GDBYZtB26DrI3W7RtZVFgKP3wc4
 4x0tWiASHlILzSk0up3cbchFE6BrceOfv3iGO3/j5df8W0ldAv/kAnRAIKJzHcjhXQyk
 HezPjbR+2HKei2QAeb4mpr1HuicTb8mxY1odf77x/5w6RmtUvaHi/oz7JtO374vyun+G
 K8Gg==
X-Gm-Message-State: AOAM530by6TnEndoO2ptWug29/LZR5WllhTLVmTkKXxjgV0vk/mfSpVC
 ucL0oVZlFFTulrRlNE4wAOYZU3meVc29EmRRckMG4dCXvBBL8xZWZyT0KLBdFAEHHoZteal3GWm
 XDaTaE53Rn9D7X2xKFBuKXb0e97xZ
X-Received: by 2002:a5d:6d83:0:b0:20c:7329:7c36 with SMTP id
 l3-20020a5d6d83000000b0020c73297c36mr2784655wrs.518.1651843125832; 
 Fri, 06 May 2022 06:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFmPqHpFl7IQ0p8a3cDOwPVFVGGBUGfQCaOkK4J9z39w72XOntceMZPP2+b4IAbt9zNBVruA==
X-Received: by 2002:a5d:6d83:0:b0:20c:7329:7c36 with SMTP id
 l3-20020a5d6d83000000b0020c73297c36mr2784632wrs.518.1651843125512; 
 Fri, 06 May 2022 06:18:45 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s6-20020adfea86000000b0020c5253d907sm3671710wrm.83.2022.05.06.06.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 06:18:45 -0700 (PDT)
Message-ID: <00117d58-2a47-4e2b-225b-952e0e98df2f@redhat.com>
Date: Fri, 6 May 2022 15:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/4] fbdev: efifb: Cleanup fb_info in .fb_destroy
 rather than .remove
To: Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220540.366218-1-javierm@redhat.com>
 <ed57ca49-f80e-9bf5-4dc3-59fb62ca4315@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <ed57ca49-f80e-9bf5-4dc3-59fb62ca4315@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andrzej,

On 5/6/22 15:07, Andrzej Hajda wrote:
> On 06.05.2022 00:05, Javier Martinez Canillas wrote:

[snip]

>> +
>> +	framebuffer_release(info);
>> +
>>   	if (request_mem_succeeded)
>>   		release_mem_region(info->apertures->ranges[0].base,
>>   				   info->apertures->ranges[0].size);
> 
> You are releasing info, then you are using it.
> 
> I suspect it is responsible for multiple failures of Intel CI [1].
>

Yes, it is :( sorry about the mess. Ville already reported this to me.
I'll post a patch in a minute.
 
I wonder how this didn't happen before since .remove() happens before
.fb_destroy() AFAIU...

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

