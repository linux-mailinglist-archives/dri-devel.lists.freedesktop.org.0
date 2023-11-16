Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA37EDC30
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 08:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C3310E24E;
	Thu, 16 Nov 2023 07:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431C10E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700120779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LD5mFa7Ljzodyl4DGNnE3tN04HrOGXS/NNuwBDagln8=;
 b=Zid15TOMC+cBvGr10gBGkotPix/ciruvxBNqe05kXbMxbaHeT2LH15QRsVik+x9LUFJt6P
 nK/Mv41CsBd53PLu429+Aiuu8Cgu7kBaBatOMfvzU0D2Y2w6rautRJB1O2rIqVnC0cAQvk
 cb2M9TZJESOD74zvqeSotjrZnPpajTs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-x7zmSxQvPvGetniVk8ZQEg-1; Thu, 16 Nov 2023 02:46:17 -0500
X-MC-Unique: x7zmSxQvPvGetniVk8ZQEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-407da05ee50so2878195e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 23:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700120776; x=1700725576;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LD5mFa7Ljzodyl4DGNnE3tN04HrOGXS/NNuwBDagln8=;
 b=iI9djCZD2amPMkPsdZedDICRHUIuN2DPxse7Rs2rL1AdOBLBWoNp0NMN/F+n0hQogS
 CGdNPWf02G486wCva8926PQfF7tI/r4qhsXgm6WBYzAuHtko6Xu47i+N4Tl59/ZFfamD
 yvHSDg0IhsL9QlQEMygk9GPD3b3MLYdmFsM+Ef5iBTvyfCFoUlDTgk8uTluyG+nMjLZ+
 RVtB6JSrWzMaKraqWUdAvFgPESdzvOOTydqLTEPQ7DPZXJxlmnrPViOk4jvyn2kIm/ZQ
 MEJWfslvzUw4CTh5vyDz4r9kg1Y0HPw2+xg2WO7ctRjrOMGigJpL3kQb920zXAE0HXG/
 ha1A==
X-Gm-Message-State: AOJu0YyRhVAXtV+n2bTpt6wp2+sONBGHAFVoPlvN5lKiW3VNedg/FU8P
 PCulyCDSbxFCVNaDkN3/wiEeG/HCehXXTfEZSneDEJVItboubN5MZYlrZFmbhEePQXrT1JgNDMP
 8rwtCb77ZA3vmHPOE/o/zgXDCovFZ
X-Received: by 2002:a05:600c:1d93:b0:406:3977:eccd with SMTP id
 p19-20020a05600c1d9300b004063977eccdmr11516327wms.33.1700120776413; 
 Wed, 15 Nov 2023 23:46:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNCg5qd5AbZ0tYK0uFvI/J3tJ++zfJ/l5opv0/UGjSHKkjb6Zp4IdC4i38tjSPgJYq49xhdQ==
X-Received: by 2002:a05:600c:1d93:b0:406:3977:eccd with SMTP id
 p19-20020a05600c1d9300b004063977eccdmr11516314wms.33.1700120776005; 
 Wed, 15 Nov 2023 23:46:16 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c4f4700b0040772138bb7sm2455636wmq.2.2023.11.15.23.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 23:46:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] drm: Allow the damage helpers to handle buffer
 damage
In-Reply-To: <a16a61582f90a5b490fb7681b44864a4801c830a.camel@vmware.com>
References: <20231115131549.2191589-1-javierm@redhat.com>
 <a16a61582f90a5b490fb7681b44864a4801c830a.camel@vmware.com>
Date: Thu, 16 Nov 2023 08:46:14 +0100
Message-ID: <87o7fu5eex.fsf@minerva.mail-host-address-is-not-set>
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "belmouss@redhat.com" <belmouss@redhat.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "nunes.erico@gmail.com" <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zackr@vmware.com> writes:

Hello Zack,

> On Wed, 2023-11-15 at 14:15 +0100, Javier Martinez Canillas wrote:

[...]

>>
>> Changes in v2:
>> - Add a struct drm_plane_state .ignore_damage_clips to set in the plane's
>>   .atomic_check, instead of having different helpers (Thomas Zimmermann).
>> - Set struct drm_plane_state .ignore_damage_clips in virtio-gpu plane's
>>   .atomic_check instead of using a different helpers (Thomas Zimmermann).
>> - Set struct drm_plane_state .ignore_damage_clips in vmwgfx plane's
>>   .atomic_check instead of using a different helpers (Thomas Zimmermann).
>
> The series looks good to me, thanks for tackling this. I'm surprised that we don't

Thanks. Can I get your r-b or a-b ?

> have any IGT tests for this. Seems like it shouldn't be too hard to test it in a
> generic way with just a couple of dumb buffers.
>

Yes, I haven't looked at it but also think that shouldn't be that hard.

> z

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

