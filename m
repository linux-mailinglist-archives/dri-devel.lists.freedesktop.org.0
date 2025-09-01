Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16C0B3F08A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 23:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B387710E52B;
	Mon,  1 Sep 2025 21:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="M8druNtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DD210E52B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756762360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3swOk4OyatWaOATPp01ulPoGz+0e4u+jNu0dl8fcEFQ=;
 b=M8druNtkSM8/POYROfvIT+3p+uNHhSajgovH+7cwAlZ6R2v14f4go0gMdY+v+Vrh4Yi4IU
 A3Ir6blAXJ5yvUc/ZLHUFlsR/cB2nzceGUoLehsbI0KOPMzdnOTtpP3WbgG5zOhUiHavJq
 ywcGVRkGJoQbLkmXqVME7O2oMbZGKTI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-U37zQ2H9McyKP6BtHfEEgw-1; Mon, 01 Sep 2025 17:32:39 -0400
X-MC-Unique: U37zQ2H9McyKP6BtHfEEgw-1
X-Mimecast-MFC-AGG-ID: U37zQ2H9McyKP6BtHfEEgw_1756762358
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b8a2b9fcaso12638385e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 14:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756762358; x=1757367158;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3swOk4OyatWaOATPp01ulPoGz+0e4u+jNu0dl8fcEFQ=;
 b=g6otKbm0vJA0WhBbUiCjiuUYBmRLhMwvWohW3lFAcP0IiPZEyq3V8Qrjahg1oBkVzW
 xOfH0O9yz78lvYWptQb9hvBTJXCWQLnR6s1RvjCYLv30umDY0HogZ33UYbfQh8Ky8E6t
 AlkWr9bff/h9guj3sN2o1SoQ6XR7qkwrCIMJEAiIPZLHqoNM48hcqoPnaXmv1Banz5Hk
 Ux8LgHTqewJLLWn+p992Ef+m05lbGkHviFqOSN6SyYwyyxXfavX94oDvhNIHwEqX+cED
 VzFRHsjRyrjBDrevIn1E4deI0WDyHFr3kHovfkWEIAn2KVPgNp08uzid9bYlctnchanM
 LHuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYhRthkhb5UFjpeg0hOSjJdr6pmh/1KAwhSfZCLUC0e+/vU6cvyoJ8Nc8DeqBd/nmb6FJQkzN/mOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX03iq/Mgs2V0WhG83NvOe7lcYGO5PgiYw6cUgyw7DqdPHTViY
 iqlMQlY0h/YR1UIYVL3I11vYCWwr6VHyWo5iAXGu1WkbXyxdyZ725pDF78zFLyx4y/oXS18SdAt
 oCAHwe8tMSQG+pg+yvOLe2EsKL09QnbjiT+LaOWtfd3NxpHIkrg7MJaPWhsRCqR+l4F57dg==
X-Gm-Gg: ASbGnctYl7jXqCGDKU3EgRW1zPTkPWbZjCqXIxij6Tr8iRoJg5h5GuBPjZ7eNH29pKS
 mL5xCXvgFDQOvpCw9W9DboXUXU+wU9EkiS7zEQWCPXujtbSpJjs87ic37lcaF16qdQA3au5n2KA
 LvzVbeju4R4PH2I75zXQwqU2OaihgMt1m4I91fSI6JiAxxxt92SgpWU+XS8KBxzBYMqP7Rvc9pv
 9TNeypOWUD0ZgvNZ2kvgKt4mPiQoraj1cd14G1aaevTh0Mu/NUya9bCl6VLHEZ07xLJ/sExV/eY
 F4T7VnRqA3OiURb7V7iaAl59oy4iSlnrBrO/lBca1mjy8Z7M
X-Received: by 2002:a05:600c:4fcd:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-45b85533712mr83405085e9.10.1756762358395; 
 Mon, 01 Sep 2025 14:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAstBMuiwfLE/uHKbIRqh9Y2XLhzDYwDj5rG0gLssaFpudxwux5Z4jYtSxqSlORgb3kp/vVg==
X-Received: by 2002:a05:600c:4fcd:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-45b85533712mr83404845e9.10.1756762357904; 
 Mon, 01 Sep 2025 14:32:37 -0700 (PDT)
Received: from localhost ([2001:9e8:8986:4700:668d:1f88:b725:6051])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d729a96912sm4912911f8f.8.2025.09.01.14.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 14:32:37 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 01 Sep 2025 23:32:35 +0200
Message-Id: <DCHSA4THF61K.1EPEN0GWLP4Q9@redhat.com>
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
From: "Sebastian Wick" <sebastian.wick@redhat.com>
To: "Sebastian Wick" <sebastian.wick@redhat.com>, "Daniel Stone"
 <daniel@fooishbar.org>, "Maxime Ripard" <mripard@kernel.org>
Cc: "Shengyu Qu" <wiagn233@outlook.com>, "Marius Vlad"
 <marius.vlad@collabora.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <siqueira@igalia.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <contact@rafaelrc.com>, <lijo.lazar@amd.com>, <jesse.zhang@amd.com>,
 <tim.huang@amd.com>, <dark_sylinc@yahoo.com.ar>,
 <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <aurabindo.pillai@amd.com>, <sunil.khatri@amd.com>,
 <chiahsuan.chung@amd.com>, <mwen@igalia.com>, <Roman.Li@amd.com>,
 <Wayne.Lin@amd.com>, <dominik.kaszewski@amd.com>, <alvin.lee2@amd.com>,
 <Aric.Cyr@amd.com>, <Austin.Zheng@amd.com>, <Sung.Lee@amd.com>,
 <PeiChen.Huang@amd.com>, <dillon.varone@amd.com>, <Richard.Chiang@amd.com>,
 <ryanseto@amd.com>, <linux@treblig.org>, <haoping.liu@amd.com>,
 <Relja.Vojvodic@amd.com>, <Yihan.Zhu@amd.com>, <Samson.Tam@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <wayland-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aK1hPoCmLziaPPOd@xpredator>
 <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <20250827-imperial-mongrel-of-dignity-712fab@houat>
 <CAPj87rPhK+E2FP62fnNxFySDOkqqKxo_oa94i7DR3_6a1j1o1A@mail.gmail.com>
 <DCD5VIFRKFB9.1KHIZI3ASID2I@redhat.com>
In-Reply-To: <DCD5VIFRKFB9.1KHIZI3ASID2I@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pcgIAmxx38lBvHBUeiI1LMWBJH0y51soS6QuviekmLI_1756762358
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
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

On Wed Aug 27, 2025 at 1:08 PM CEST, Sebastian Wick wrote:
> On Wed Aug 27, 2025 at 12:39 PM CEST, Daniel Stone wrote:
>> Hey,
>>
>> On Wed, 27 Aug 2025 at 10:41, Maxime Ripard <mripard@kernel.org> wrote:
>>> On Wed, Aug 27, 2025 at 12:26:56AM +0800, Shengyu Qu wrote:
>>> > 1.Can you send patch with only i915/amdgpu first? It's a long-needed =
feature
>>> > to deal with some monitors/TVs with broken EDID.
>>>
>>> If it's to workaround broken monitors, then it's really not something w=
e
>>> should be doing using a property.
>>>
>>> Most likely, those monitors don't support YUV* output and will just nee=
d
>>> to be forced to RGB, so it's not something that the user (or the
>>> compositor, really) has to care about.
>>>
>>> And it would be broken with every driver, not just i915 and amdgpu.
>>>
>>> We already have some quirks infrastructure in place, the only thing we
>>> need to do is create an EDID_QUIRK_NO_$FORMAT, clear
>>> drm_display_info->color_formats based on it, and you're done. No uapi t=
o
>>> agree upon, support, test, and it works with every driver.
>>
>> There are other reasons to have uAPI though ...
>>
>> One is because you really care about the colour properties, and you'd
>> rather have better fidelity than anything else, even if it means some
>> modes are unusable.
>>
>> Another is for situations which static quirks can't handle. If you
>> want to keep headroom on the link (either to free up bandwidth for
>> other uses), or you accidentally bought a super-long cable so have a
>> flaky link, you might well want to force it to use lower fidelity so
>> you can negotiate a lower link rate.
>>
>> I'm all for just dtrt automatically, but there are definitely reasons
>> to expose it to userspace regardless.
>
> Yes!
>
> Broadcast RGB is a property that only works as a workaround for broken
> monitors. If user space sets it to a value other than auto, even after
> first checking the EDID if the sink supports it, we don't know if the
> kernel just changes the values, or also sends the InfoFrame (or the DP
> equivalent).
>
> So even if the new property was just for broken sinks, we already have a
> similar case, and it makes sense: If the EDID fails to read properly, or
> the display has no EDID, the kernel can't really identify the thing, so
> you need something in user space anyway.
>
> Even for quirks where you can identify something, user space is a better
> fit because we can update things faster. This is one of the goals of
> libdisplay-info anyway.
>
> Either way, like Daniel said, this *is* useful for other reasons. We
> want to be able to switch between quality and bandwidth.

Daniel suggested in the other thread that the last part of the transform
should be done via a connector property. I'll take that at face value
beause I really don't really know what hardware does. What's important
then is however to make it absolutely clear what the transform looks
like exactly to user space, to make it possible to program the CRTC
color pipeline to produce the correct values.

>
>> Cheers,
>> Daniel

