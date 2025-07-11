Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C843B01781
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1624910E0B8;
	Fri, 11 Jul 2025 09:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MkX37sg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E73010E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752225693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S0JDyIunfR5DTlK8KTu+Yf5amiLX77lLqYYzQS582qg=;
 b=MkX37sg/eL7Rmq+vbc3JTTudFR+OxxqGRpFqnX2iFIu6VLKogUCn4A3Msgai0dYO6o8Gr5
 HaMjpmMGzZuDwF7kWEI8MLIC1LQdfn4K/2VbgwYTYt8rtvtb8e6yS2Wvt6PfwGWNZxJgiI
 5L8SJ01BDzcV2Cxhff5bZpkVz6jdoCc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-gDmHDYrOPFqaWJgYusbazA-1; Fri, 11 Jul 2025 05:21:31 -0400
X-MC-Unique: gDmHDYrOPFqaWJgYusbazA-1
X-Mimecast-MFC-AGG-ID: gDmHDYrOPFqaWJgYusbazA_1752225690
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-455eda09c57so1282585e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 02:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752225690; x=1752830490;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0JDyIunfR5DTlK8KTu+Yf5amiLX77lLqYYzQS582qg=;
 b=DN3Ypmy+oH3cRXLu5ejYz7Cr3MR+fy+c7AYowNy837KWfxtenKJiDrhtnhJKx9G9ED
 U3DczpuoOuz9X77cD2ZOnsd6AYX7hTVxA4qVVHKm1EE1uIe6k18Dm0u8aHOBGW+gLcmi
 L5+M0Y0SIpysRUHfO+4poZQ9CF09iJzD7r4PMG/2XwhHuBuAI+Uhf4XcyjbdZk1kItmb
 waYKoIZYImID3pa1oal+Hnl5NvFG2A756c9o9zybP8nU2oZCuSdytsQGovt9ZqvEagWD
 /2scGHo96UoLpzFchtjI4aKrtd8808RU12k84swv+p7KOl2Fnnqaiy9d8Q3B0lzYtXvn
 yzQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU24W/lmUr5ouwu0KMfWhYPvHV7MaIocZUEm48cB5qE5rzuBvjOZB/FRgVZgxjgK9X5GZsEPcXlWE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJVDQCDvzVgOYtmM9+SocydAQptOLzClrzH3Yfx1Al08B1GUPS
 iggrxuBdXeNePObCa/3OcDvvqn+iekKGoIL8qi28DsHHA3DKD4b8rjHUYFYbx//x/yZPzvCilPw
 zhqMqsWi5UhIU8Cm4Sh8hO5nmIcaUY8R7BTsvEOR1QJIRO2A6rwqxK/XBqpUAJbIjk7nZkw==
X-Gm-Gg: ASbGncuVgp8qBc9sCNtMjZxfL7rbRGyewczjEm+yLnLQhL5wxWoE0T1LqYkGiIofDck
 DmEmMSb7pZ7YMVRDtnHWFC62DHO7bP3TdaFBMVlxOgYssKecNwsQIxUPwjr9F4iFPFqZFtFM83M
 YBQ6LulpWV0ppMTFadSnsiQ8+UQX61mbnP6hCyE8dFNnOlbGFvOiX1fviEpZTqFbmmGZiHDnaki
 8Oy/3h+XCgGqOAOCPN5EnBH2fxP+F1+8gPBbjn9VREm7yvzoBw2byPk/dNEDjuIWuPmwWzl90vA
 lPq3X6KHDU7pydQFKrqw0AsovUwHTofu3N3Id0VwRhti3jUUG3ahei0SkUqWhxkRabTVUdqPFqK
 roJ9ws0kXmp+3AFw8U0z2Uw==
X-Received: by 2002:a05:600c:4fc7:b0:450:d568:909b with SMTP id
 5b1f17b1804b1-454ec14848amr22904675e9.14.1752225690315; 
 Fri, 11 Jul 2025 02:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHopr/bZIg6PNEafq2nN27RiUQenQ7qTkGeKlIozsRqo7Tj0VZVvTn0sX8s4NUjyeT3MpW78Q==
X-Received: by 2002:a05:600c:4fc7:b0:450:d568:909b with SMTP id
 5b1f17b1804b1-454ec14848amr22904355e9.14.1752225689892; 
 Fri, 11 Jul 2025 02:21:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd537d12sm41439605e9.24.2025.07.11.02.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 02:21:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/sysfb: simpledrm: Add support for
 interconnect paths
In-Reply-To: <DB9237QHOXRU.JRJB8SPUX8RO@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-3-f69b86cd3d7d@fairphone.com>
 <87qzz5d3le.fsf@minerva.mail-host-address-is-not-set>
 <DB9237QHOXRU.JRJB8SPUX8RO@fairphone.com>
Date: Fri, 11 Jul 2025 11:21:28 +0200
Message-ID: <874ivjf5gn.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0XYtci4foE3SHZEY4-3ZCTe1LntoeDUJkCm0lt_bZ5s_1752225690
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

"Luca Weiss" <luca.weiss@fairphone.com> writes:

Hello Luca,

> Hi Javier,
>
> On Fri Jun 27, 2025 at 9:51 AM CEST, Javier Martinez Canillas wrote:

[...]

>>> +static int simpledrm_device_attach_icc(struct simpledrm_device *sdev)
>>> +{
>>> +	struct device *dev = sdev->sysfb.dev.dev;
>>> +	int ret, count, i;
>>> +
>>> +	count = of_count_phandle_with_args(dev->of_node, "interconnects",
>>> +							 "#interconnect-cells");
>>> +	if (count < 0)
>>> +		return 0;
>>> +

You are already checking here the number of interconnects phandlers. IIUC
this should return -ENOENT if there's no "interconects" property and your
logic returns success in that case.

[...]

>>
>> You could use dev_err_probe() instead that already handles the -EPROBE_DEFER
>> case and also will get this message in the /sys/kernel/debug/devices_deferred
>> debugfs entry, as the reason why the probe deferral happened.
>
> Not quite sure how to implement dev_err_probe, but I think this should
> be quite okay?
>

And of_icc_get_by_index() should only return NULL if CONFIG_INTERCONNECT
is disabled but you have ifdef guards already for this so it should not
happen.

> 		if (IS_ERR_OR_NULL(sdev->icc_paths[i])) {

Then here you could just do a IS_ERR() check and not care about being NULL.

> 			ret = dev_err_probe(dev, PTR_ERR(sdev->icc_paths[i]),
> 				      "failed to get interconnect path %u\n", i);
> 			if (ret == -EPROBE_DEFER)
> 				goto err;

Why you only want to put the icc_paths get for the probe deferral case? I
think that you want to do it for any error?

> 			continue;

I'm not sure why you need this?

> 		}
>
> That would still keep the current behavior for defer vs permanent error
> while printing when necessary and having it for devices_deferred for the
> defer case.
>

As mentioned I still don't understand why you want the error path to only
be called for probe deferral. I would had thought that any failure to get
an interconnect would led to an error and cleanup.

> Not sure what the difference between drm_err and dev_err are, but I
> trust you on that.
>

The drm_err() adds DRM specific info but IMO the dev_err_probe() is better
to avoid printing errors in case of probe deferral and also to have it in
the devices_deferred debugfs entry.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

