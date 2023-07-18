Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E577576D9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0D10E2FF;
	Tue, 18 Jul 2023 08:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2682410E004
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689669697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXo1PBuzT+dNb4ugtQZrTRjYI2adrTAH49R4WAbJ7+8=;
 b=L8O2n6LzmA+CU+jXT55TFzfuGt8wgGDKDvvj0rSiTjg/8n4z/eNzN9WPuCx31ncQM4OleD
 alDzIoPMw3k2+b46vNwmsmalt+G11cC47IwGBGs6zlRsAcveRJlDEGaigc2e/YNXnuTNGx
 vh+CHi+M3KHtqrhhkmSnO/JSyspZpvY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-U169gVwdNv-7dW9_ZwWewA-1; Tue, 18 Jul 2023 04:41:35 -0400
X-MC-Unique: U169gVwdNv-7dW9_ZwWewA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fbcdca8fb6so4490700e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689669693; x=1692261693;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JXo1PBuzT+dNb4ugtQZrTRjYI2adrTAH49R4WAbJ7+8=;
 b=gMqAg0fUOaY/XC9inXNQfoITiLdQJCpq9NunykQR7nQz+i+vFXT1Atkz0pizcOYbW5
 NzvVcXH/IGroKBVrwEfqpTZJTwQBEZKFwG0WL8dh19Lhzf7sP5lLHjJFCnQXAhGKcnHM
 bqZGcBl308dWxKfDOBFYlnQuJa0XnKkwdV4frH2Wy7liJ9mqe+4ziwJordvKXWOhw1sW
 Bl25IwPmAWg0O4Sq2I4pp42OvGi+NhKLOEMnKC2GiLzN3Pm39udCZJhWt9PImSSwRnWt
 IEWJxhaXiLVMa3X9yW3VTfBuZud2kc6cf2+uC9Ix07GTJm/Yb9sBbCT9BX17jBsGbzry
 xuNA==
X-Gm-Message-State: ABy/qLYtL57CQSD+F/OOWImeJYeeDne+BEi1Dr4QAwsvH+5LXVi8KxDC
 0WqkkYWH57s9LwO+st3jzNjVULpGfHTAIjK7lunQt0q4Ju7Bhr4ZbjZufVLf3PIWt72CAlVo6V8
 2xwaZkMkDw15x7/UetQPT0nATAle1
X-Received: by 2002:ac2:4a62:0:b0:4f9:5519:78b8 with SMTP id
 q2-20020ac24a62000000b004f9551978b8mr9211997lfp.63.1689669693660; 
 Tue, 18 Jul 2023 01:41:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEC0BvK24zrWl5+2wJseWT+oae1QqEbrqyuNehHNadpFhZWtiZZQDoUX1/4l7PmtJmRPTChew==
X-Received: by 2002:ac2:4a62:0:b0:4f9:5519:78b8 with SMTP id
 q2-20020ac24a62000000b004f9551978b8mr9211988lfp.63.1689669693291; 
 Tue, 18 Jul 2023 01:41:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m13-20020a7bce0d000000b003fbaa2903f4sm1570853wmc.19.2023.07.18.01.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 01:41:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Michael Banack <banackm@vmware.com>
Subject: Re: [PATCH v4 2/8] drm/atomic: Add support for mouse hotspots
In-Reply-To: <20230711101442.72530df5@eldfell>
References: <20230628052133.553154-1-zack@kde.org>
 <20230628052133.553154-3-zack@kde.org> <20230628104106.30360b55@eldfell>
 <20230628105424.11eb45ec@eldfell>
 <2fb2f3985df4d6710e5ad33f6e618a52004714df.camel@vmware.com>
 <20230629110348.3530f427@eldfell>
 <6c5449cf-b7a6-1125-9493-0fe968166915@vmware.com>
 <20230704110845.490344f5@eldfell>
 <ce7754be-8085-ffd1-93f3-a774f7fcdb87@vmware.com>
 <20230706110146.0abeda0a@eldfell>
 <247b630c-8b16-7c33-987e-8b3451be3c70@vmware.com>
 <20230707113837.1a9d31e9@eldfell>
 <6be74496-f14e-302c-329e-d865f5ee3c36@vmware.com>
 <20230710111706.209cfd55@eldfell>
 <9768c00d-536b-dd7b-c8e2-e9d920cd6959@vmware.com>
 <20230711101442.72530df5@eldfell>
Date: Tue, 18 Jul 2023 10:41:32 +0200
Message-ID: <87wmyxipc3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>, "zack@kde.org" <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pekka Paalanen <ppaalanen@gmail.com> writes:

Hello folks,

> On Mon, 10 Jul 2023 10:46:56 -0700
> Michael Banack <banackm@vmware.com> wrote:
>
>> On 7/10/23 01:17, Pekka Paalanen wrote:
>> > On Fri, 7 Jul 2023 13:54:21 -0700
>> > Michael Banack <banackm@vmware.com> wrote:
>
> ...
>
>> >> So I guess I would vote for trying to include something to that effect
>> >> as context or explanation, but not try to strictly define how that works?  
>> > Yes, exactly.  
>> 
>> Okay, if we can keep the mouse/input stuff on the fuzzy side then I 
>> think we're on the same page.
>
> Very much of the fuzzy side, yes! All I am saying is that one cannot
> explain the hotspot property without saying anything about it being
> connected with input devices in some way. The very key I want to see
> documented is that all cursor-needing pointing input devices and all
> KMS cursor planes exposed to the guest OS are meant to be associated
> with the same single conceptual pointer. That is all.
>

So if I understand correctly Pekka doesn't have any issues with the actual
implementation and is just asking for better documentation ?

How can we move this series forward? Maybe we can land this set and add an
explanation / more verbose uAPI documentation as a follow-up patches ?

Or do you think that the everything must be merged together and another
revision be posted ? The sooner we could land this, the sooner that should
be able to drop virtio-gpu from the mutter atomic deny list, and be able
to use the damage handling work that has been done across the virt stack.

>
> Thanks,
> pq

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

