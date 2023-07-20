Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0575A999
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 10:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5DF10E0C5;
	Thu, 20 Jul 2023 08:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A415610E0C5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689843057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eABGrw0TL06vz03G7+XhqlL5JafnHauhGDPjNQEG6Nc=;
 b=PRNmVP3qoIyE5QMZgMYMw1EdU9UPp5bNkRUs4Q1cUpJ00j6nLTzt4TWKwZANlVlAVZTe0/
 6k7QoChmGL7z7m2Bi4EtPhydz2dwtAnuZghM8IsBfALKcHU+GAELt8Uwo0NJmBrIt03KzQ
 uZ+MPjQ1C2r7uO5qRhCXtC4pDszcFuA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-hMVe0qBeODGMNi6lgZPQLg-1; Thu, 20 Jul 2023 04:50:54 -0400
X-MC-Unique: hMVe0qBeODGMNi6lgZPQLg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6f51e170fso4841971fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 01:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689843053; x=1690447853;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eABGrw0TL06vz03G7+XhqlL5JafnHauhGDPjNQEG6Nc=;
 b=M2Rbnx2IH3pz27Abf2kZRmrB9RbFLkqdVaKvQQoRiiqCW8bs/lNnj/BzVoyRODsJUI
 kc8eqsj5CnXcDT06+p/9Pj762yvcXU7lwHxVg2FP7V8ROFT6rmKAWctz8QP2G/6bbY1P
 6xBC3eBGrIVvdVRfzgRCVyvmLH5T9CZUHIrbuGH6JdtiBmYhfFtMdVl1Q4k1GiaDEUJH
 waaI6jjVIR415uijR7hw9oRtu6voXozu0p0+XsqZ72wquETYRRpASq1s67lfpuHeXVQL
 6sueCRdWMjI2jcIg09vCkoTUI3jbK4j7I23/CxgZUbpOSGzCiS0Qa4+rHsuZK/PwcFMr
 Brog==
X-Gm-Message-State: ABy/qLazJF8VI8+51Mvb+tp/omahMFGbUz3i1AYmC73GyT702rChf78x
 rj2BSdOiuQldU/H+H42fTOiRXSAKv9eA/OAifmd+gRBEyXw/v1ikbQdQBZN4bUlmuibC9g6lVF1
 m8DVEXCcVPs9km0joz/aGjv9TDjaC
X-Received: by 2002:a2e:9316:0:b0:2b9:55c9:c228 with SMTP id
 e22-20020a2e9316000000b002b955c9c228mr1315397ljh.27.1689843052944; 
 Thu, 20 Jul 2023 01:50:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFqLEGV2HUA/UPmaeWdDYKPDFfMzY8GIWSGYauN6EzdveWA24IoVFoWMg48Sv5w8n4SRcevOQ==
X-Received: by 2002:a2e:9316:0:b0:2b9:55c9:c228 with SMTP id
 e22-20020a2e9316000000b002b955c9c228mr1315388ljh.27.1689843052598; 
 Thu, 20 Jul 2023 01:50:52 -0700 (PDT)
Received: from localhost ([90.167.86.194]) by smtp.gmail.com with ESMTPSA id
 u9-20020a7bc049000000b003fba6a0c881sm3325924wmc.43.2023.07.20.01.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 01:50:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Simon Ser <contact@emersion.fr>, Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
In-Reply-To: <xhJhUmlWt6a9ajOdF2Wodjm6IQBab4jqySRdBAPLaA4No87O7zfEX9v4d-ugWWAPgJBIWQeLV4RVuuRoZPK7aTYgNWp2YofiHra2GVLBfpY=@emersion.fr>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org> <20230719111541.33c05b14@eldfell>
 <41590ef35281fbc54be1ee58d9187ede8bc44698.camel@vmware.com>
 <xhJhUmlWt6a9ajOdF2Wodjm6IQBab4jqySRdBAPLaA4No87O7zfEX9v4d-ugWWAPgJBIWQeLV4RVuuRoZPK7aTYgNWp2YofiHra2GVLBfpY=@emersion.fr>
Date: Thu, 20 Jul 2023 10:50:43 +0200
Message-ID: <87sf9jhspo.fsf@minerva.mail-host-address-is-not-set>
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
Cc: aesteve@redhat.com, Michael Banack <banackm@vmware.com>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ian Forbes <iforbes@vmware.com>, Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simon Ser <contact@emersion.fr> writes:

Hello Simon,

> On Thursday, July 20th, 2023 at 07:03, Zack Rusin <zackr@vmware.com> wrote:
>
>> I'll give this series a few more hours on the list and if no one objects I'll push
>> it to drm-misc later today. Thanks!
>
> Sorry, but this doesn't seem to be enough to satisfy the DRM merge
> requirements. This introduces a new uAPI but is missing user-space
> patches and IGT. See [1] and [2].
>
> [1]: https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#requirements
> [2]: https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
>

Albert (Cc'ed) wrote IGT tests for this new uAPI and was waiting for
Zack's patches to land to post them. I believe his branch is [0] but
he can correct me if I'm wrong on that.

Zack also has mutter patches and Albert has been testing those too.

[0]: https://gitlab.freedesktop.org/aesteve/igt-gpu-tools/-/commits/modeset-cursor-hotspot-test/

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

