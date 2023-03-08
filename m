Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62D6B0E7E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8217010E64A;
	Wed,  8 Mar 2023 16:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F3510E64A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678292511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EaA41pwr6Ce6DxEWLNg9TqHaP57RU2dh04eggDkEhJA=;
 b=a1W81YrASSgY5C1oLuQ3Sa576F46UiE7qagXKpq4Ot75fs+nNFQr20SNXbZQEjSW+q3rAx
 KSpqW+XUtcbTN4oh+Sf2VJbZf1UX9dvABYmBzbqUU/KfBfhc+8YH9X9CzTTBlpTv7kV8Wb
 Yru8+hUY9f3pnqn3oisGgoNxgSFSAEk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-DtOrPR2ONAm1tsoaTDBb_g-1; Wed, 08 Mar 2023 11:21:48 -0500
X-MC-Unique: DtOrPR2ONAm1tsoaTDBb_g-1
Received: by mail-wr1-f70.google.com with SMTP id
 n6-20020a5d51c6000000b002ca3c48ba46so2995388wrv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678292507;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EaA41pwr6Ce6DxEWLNg9TqHaP57RU2dh04eggDkEhJA=;
 b=qw0WaseR8Qww/XSyPvRzU7TCYWZpGruqwTeco+W/Zd/qzrjeJy2185SgKEP1btCyW6
 rgBMJ4cGusUMhK0KOriVUbbWbuefICc32V9H0osCyOqBuFyfy0B+gSaCnoddyh9+kHsZ
 //VLyWZg+l508tvwjRQ6Vch/Mfo/Zvpe45z//uNOnDdV+1YUCPwJFxx524e3P6Pk+wES
 RZebO09EAQ1Fl78E0aBxhL/LCL8v5qxTWX4nVbcjwRspfCT8q9ea3E8yugr2jCs1r9f1
 fq2PZEP/CLdoXpbYEH1WictXE60HrrdptCZ5BFwhuRywE5xc01VTuwpkf8P4CDzaH2UB
 30ww==
X-Gm-Message-State: AO0yUKVKpvk3eD/Fl+izPni7dTyj0Ei+iQ/rBHV83p6TqpPmC4vaO09W
 Fc0lXf9C7KdpEjc4n0OzdAQSM2PrcnM4/yVe+LI4rKCcZ3KFdD+i5gWMX6EPDAOnO9s/7vfbDp9
 mQ4Ijzi5FabeKSHU/9NKYUOLsbHXb
X-Received: by 2002:a05:600c:358a:b0:3ea:c101:72b with SMTP id
 p10-20020a05600c358a00b003eac101072bmr15756833wmq.17.1678292506919; 
 Wed, 08 Mar 2023 08:21:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9GK6A1i4nIq35W3oRPQUpLeYiYcz7lckrn857nPieviyVMg8I4rhRqvS/dOLJAT1SJM6bG7g==
X-Received: by 2002:a05:600c:358a:b0:3ea:c101:72b with SMTP id
 p10-20020a05600c358a00b003eac101072bmr15756815wmq.17.1678292506643; 
 Wed, 08 Mar 2023 08:21:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f5-20020a7bc8c5000000b003e896d953a8sm20384179wml.17.2023.03.08.08.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:21:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/format_helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
In-Reply-To: <782e6705-9799-b87e-60fd-ad88031ff909@riseup.net>
References: <20230302200131.754154-1-arthurgrillo@riseup.net>
 <87lek81hdq.fsf@minerva.mail-host-address-is-not-set>
 <87mt4ow7ji.fsf@minerva.mail-host-address-is-not-set>
 <782e6705-9799-b87e-60fd-ad88031ff909@riseup.net>
Date: Wed, 08 Mar 2023 17:21:45 +0100
Message-ID: <87ilfbw6w6.fsf@minerva.mail-host-address-is-not-set>
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, mairacanal@riseup.net,
 tzimmermann@suse.de, jose.exposito89@gmail.com, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net> writes:

> On 07/03/23 18:55, Javier Martinez Canillas wrote:

[...]

>
> Hi Javier. Thank you for your review :)
>

You are welcome!

> Thank you for your patch! I too think that a new helper is not needed.
> I will send the v2 when your patch is applied.
>

Great.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

