Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FC2A000F7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 23:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2372A10E32F;
	Thu,  2 Jan 2025 22:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="BWjEUSI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC8310E32F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 22:00:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3863494591bso6202411f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 14:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1735855188; x=1736459988;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QI0rsiVIVNC3X6LP1G5i9CgFjiv5pDr5qolFlOVRm7A=;
 b=BWjEUSI62Vn9bbMNTKniheaQyXHwrq3GNliFH0d5JP2JSknDhHEuj1HYaRIz++wXTB
 H01/AgGSQML1aL7tyBaQyqVLFPdd9LjYF4EIkD/Pb8QW5765PGIpLEHV/eTKD1INfOW6
 7iJ2fOFcluhQha6Jyr9yL5pY4ui7u8goO6JuwqKEI5lc8xzmr0BumCBV5DeEG8hvfguX
 R9/IdF1QNTjoBNevsG6uzyEgLFfbiOBZ3KMRHhluvEE+QtN9LqTBMtiecwC8oU6Qv+zV
 WkZXg3Y/U6N9qUVilYTWMHt2WVAnqq9iqRRfOwgV48HVD1Z3loAglyyuSZcuZZiGH87t
 5plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735855188; x=1736459988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QI0rsiVIVNC3X6LP1G5i9CgFjiv5pDr5qolFlOVRm7A=;
 b=N/jroTi1eyE5TPivJZ8pHL507UgyRS4n3aE2Zy7eGNhZAnFLXS9qN/y8K1+1qDgZRt
 +l87myNYPIQRrUqClFSUuhoeLmQotGj/vzbT+YfFwMBUbERxN7lLPvS04gjj93JzQxwe
 b38yI5LwCWwf0KaA6p5Wb4jabHulEEn/LWWMMo+J/ovK31IRt4fTgBK1HZwxmaWMYUl1
 cDHj0EuJDr46Ep1GUwON1FvSfzZCt5tVf08Uy2rEU0hG16dZugNgYZValGK88M1Veyqq
 TDxL80K+qYFGUfLH7LoJi8MqORZPFf2NMzlnTtROIV0tgJ1y2CaLo2fb6ruJ30/nh6VA
 1TLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhLYjvS65K0Z9LiFat6HUxH1wA0uYCKpnohxUHhU5T1ERzPz483PU2iE4efFyhVpEBNHtQSpu/5Aw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yza3U3uq8r16D+FFOQIuP2y4XG82aS0x1IB4q10RrHaLBgadEx0
 TiQ3fAr/Qmso9VqPLCqwDB+tyqRNHdaRDk+EPpu1fjK21lK++xgnxoDPMvxXMCE=
X-Gm-Gg: ASbGncv9WBCkTw7rKCaYRNTXOFEyTdmgVOTBNTwHdNJxsHCMxk91JvjgrndHtXvfnb6
 uQBIry0HHnzI20z0l8cnxD2uE8Ebcf+Ov06UFhLH0RmMChhBgQrZRRVFz4WQQ68MQpX2hqz/6H8
 c7Uiud/wuGTuM52JvUC2qLjmn2j3TBMsAKOMHINcJI/T7ofx+XZgx043nJ5RaN0SMWNgzhV7A+u
 RwlUcapTNE59aqrYRNlignlNKvC3zMfyPzg7WkttZp31LH6sH23SGeebu/4l03V2EyGZdRW
X-Google-Smtp-Source: AGHT+IHI+VWiQc3LIBTfZtIZkqRJi5K+ChWSLg0X8bgtas0QRLYkfOuqmXVhHJEVxATrmc0Zib46vQ==
X-Received: by 2002:a05:6000:4010:b0:382:51ae:7569 with SMTP id
 ffacd0b85a97d-38a221fae45mr38328694f8f.18.1735855188381; 
 Thu, 02 Jan 2025 13:59:48 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832e1bsm38869782f8f.31.2025.01.02.13.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 13:59:47 -0800 (PST)
Message-ID: <1ef1d07b-bfa9-4e52-bfa0-20f569752701@ursulin.net>
Date: Thu, 2 Jan 2025 21:59:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] Documentation/gpu: Add fdinfo meanings of
 drm-*-internal memory tags
To: =?UTF-8?Q?Adri=C3=A1n_Mart=C3=ADnez_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>
References: <20241218181844.886043-1-adrian.larumbe@collabora.com>
 <20241218181844.886043-3-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241218181844.886043-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 18/12/2024 18:18, Adrián Martínez Larumbe wrote:
> From: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> A previous commit enabled display of driver-internal kernel BO sizes
> through the device file's fdinfo interface.
> 
> Expand the description of the relevant driver-specific key:value pairs
> with the definitions of the new drm-*-internal ones.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
> ---
>   Documentation/gpu/panthor.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> index 3f8979fa2b86..23aa3d67c9d2 100644
> --- a/Documentation/gpu/panthor.rst
> +++ b/Documentation/gpu/panthor.rst
> @@ -26,6 +26,10 @@ the currently possible format options:
>        drm-cycles-panthor:     94439687187
>        drm-maxfreq-panthor:    1000000000 Hz
>        drm-curfreq-panthor:    1000000000 Hz
> +     drm-total-internal:     10396 KiB
> +     drm-shared-internal:    0
> +     drm-active-internal:    10396 KiB
> +     drm-resident-internal:  10396 KiB
>        drm-total-memory:       16480 KiB
>        drm-shared-memory:      0
>        drm-active-memory:      16200 KiB
> @@ -44,3 +48,13 @@ driver by writing into the appropriate sysfs node::
>   
>   Where `N` is a bit mask where cycle and timestamp sampling are respectively
>   enabled by the first and second bits.
> +
> +Possible `drm-*-internal` keys are: `total`, `active`, `resident` and `shared`.
> +These values convey the sizes of the internal driver-owned shmem BO's that
> +aren't exposed to user-space through a DRM handle, like queue ring buffers,
> +sync object arrays and heap chunks. Because they are all allocated and pinned
> +at creation time, `drm-resident-internal` and `drm-total-internal` should always
> +be equal. `drm-active-internal` shows the size of kernel BO's associated with
> +VM's and groups currently being scheduled for execution by the GPU.
> +`drm-shared-internal` is unused at present, but in the future it might stand for
> +the size of executable FW regions, since they do not belong to an open file context.

The description is way too specific, too tied to some of the 
implementations.

I also don't remember that you ever explained why totting up the 
internal objects into existing regions isn't good enough. I keep asking, 
you keep not explaining. Or I missed your emails somehow.

And you keep not copying me on the thread. Copying people who expressed 
interest, gave past feedback, etc should be the norm.

Until we can clarify the above points I don't think this can go in.

Regards,

Tvrtko
