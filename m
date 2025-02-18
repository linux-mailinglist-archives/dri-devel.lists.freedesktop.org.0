Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D3A39D44
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BDD10E09E;
	Tue, 18 Feb 2025 13:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DE/N4tUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAB910E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739884881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DSnXHVdEvvsfyug8OIP2Wl81Rt6heXTzkbKQhrQ+C1Y=;
 b=DE/N4tUD/0j3vWybeBZgugeLTzAzIo4qfPaH1fO2X26Htb3anvJQ1siPJPckeOvkUzcZYc
 bQ/h8HuDhkIZBxcLp/Iva6QLzfTYuhF54E1LtlvzDhpBTE00EKTNWfvWRRTZPjIeYQyQlb
 4MO/zeZ2LfSWkGD1E1LCE8VraaV+xUY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-qWdKiEsrOx2_lsJBnQ1N1A-1; Tue, 18 Feb 2025 08:21:19 -0500
X-MC-Unique: qWdKiEsrOx2_lsJBnQ1N1A-1
X-Mimecast-MFC-AGG-ID: qWdKiEsrOx2_lsJBnQ1N1A_1739884878
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f36fcf4b3so1986415f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739884878; x=1740489678;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DSnXHVdEvvsfyug8OIP2Wl81Rt6heXTzkbKQhrQ+C1Y=;
 b=PVXi82cJCN8ZfvUrWl6Om54gGbnFIEGNrozY2MntuzxdL+e5XLVcfFz3nK9lC+Lbvg
 51cJ/5PvhTD08XmXAAbp+ZpOXo5NPo8pVClm9ngNyJN6HP+PAFpX6gIHxUtzC3Bn3ClC
 OF6QZYfFfYwdda9J0jmbExhrUIx/JqHV5reuryGfojrkklLH437fCekj0kRf4cat5OY8
 UNG8frelJMRcKs22SiAF8v+Q3qjBqELeI+ImmH4AlJJF4FEoqy0eOtjUdIPtfGr8+vuO
 ljTH0r4Fauhu+W+F5kIND8rISzICN0KobgR/afhxlN30H/tbvn5wvOujJZdHGoGcIDuN
 KsZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/f9+UZEENsOLWl0gEFMzyMbq98tKq7vdjTaMVN6iFNsVcGiouMrU4YZgMbpf3ZiOAQhqFNVxdOnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgFMtp77c8kalo5lebR/lwf58vqW+ld8lyrRtjHzzk8FKT5LWr
 u5IY+RJe0XXcpHKyq1zhx1l1kk9pQY48pSo8P/4m/lxDJawIEu4ZZzlynDNMMORKRXJIqAwirxu
 hhfMbPCBiLwQOpRjI0lOAImSlaSjY6Fz9agomK40ds0ZpVsebdJRplFtFfaUFeRW0iQ==
X-Gm-Gg: ASbGncvqQP53SnXkaLybvQM6OmhSFjfEWM4mUUXIW6er7fXjtqsL86zqljzTUkJA+EJ
 yeX2vLlNGCz71UpvEvZXLtt9m/Z4jYsK7CZC6+RFYWltixoS+/vVDb8M5q1p7tVhK8NHwCxbP5h
 RYtJiyYo+yDxXTaETm8UkESYV5eF72471Q2w+LT0ZVoR3vee6ZshyUFcHovlM6R37loTKI75Dev
 EQdkwgDEHJIe8vaMW0tB+drzYrhgsXWOiftAvrx5NOFdPfsZmuH0RBKjhEoBsJD7x+1PmofA880
 LcUNMnBx+4qb1sy/Jw2oC6p37/4EbFPQxAtXPo2jzbQ1gF4kOLzsw0XEuCWRqMk=
X-Received: by 2002:a5d:638f:0:b0:38f:2a5e:f169 with SMTP id
 ffacd0b85a97d-38f33f4e45amr8497507f8f.37.1739884877503; 
 Tue, 18 Feb 2025 05:21:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCdb//YXiSCidN9MOxkwBcoVco7O5TeiSbVrPdKZfn6mLHPk77sBotfkp09/v9hBezhruwTA==
X-Received: by 2002:a5d:638f:0:b0:38f:2a5e:f169 with SMTP id
 ffacd0b85a97d-38f33f4e45amr8497483f8f.37.1739884877159; 
 Tue, 18 Feb 2025 05:21:17 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25913eb6sm15124034f8f.51.2025.02.18.05.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 05:21:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
In-Reply-To: <CAPVz0n1MdCccD5gHK0Z-mMHJ4Erf59_pBSU3+Jenmfr92Fky9g@mail.gmail.com>
References: <20250217140910.108175-1-clamor95@gmail.com>
 <c19bd9b3-86c4-4f1a-beb9-b6aed32b3ef5@suse.de>
 <CAPVz0n0WG1Q51SONb4fmkzi4q7Q0sZ_aKSLrLnGboNNya6nO+Q@mail.gmail.com>
 <871pvvqu0i.fsf@minerva.mail-host-address-is-not-set>
 <CAPVz0n1MdCccD5gHK0Z-mMHJ4Erf59_pBSU3+Jenmfr92Fky9g@mail.gmail.com>
Date: Tue, 18 Feb 2025 14:21:15 +0100
Message-ID: <87y0y3pewk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hfBqNVHI7Le6QhFgBKEeqXTtQ4kvT3whwZcGS2ActZI_1739884878
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Svyatoslav Ryhel <clamor95@gmail.com> writes:

[...]

>> Exactly. Both chips are from the same vendor (Solomon Systech [0]) and my
>> guess is that the SSD prefix means "Solomon Systech Device" or something
>> like that.
>>
>> [0]: https://www.solomon-systech.com
>>
>
> You are correct, vendor is the same, I have not denied that, but the
> this device is not related to product drivers which already exist in
> the Linux Kernel.
>

Oh yes, I didn't mean that are related.

I was just explaining to Thomas why both devices were named "Solomon SSD*"
even when they are quite different and can't be supported by same driver.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

