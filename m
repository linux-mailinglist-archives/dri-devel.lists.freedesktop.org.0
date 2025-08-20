Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0CFB30823
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 23:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4625B10E9F6;
	Thu, 21 Aug 2025 21:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EOK4N1d4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3750010E35D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755718845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNhhKj8XIxu4y9Bto5lKVR6sjGIFrxndrATAmTOdffs=;
 b=EOK4N1d45KkxVb83i6VXZD0LIpJ5/RBh/48E8pK/iO1/NRhhzBuaF8BQdbdBCYrXx3CMIV
 jmSN3fW9SSZCtonntFW4+CxOISqBifTk0PaBHIVR1NRwpuczLIIJz3K3rZWNYgIR3Lw9wC
 notl8AdG0ac3KQ7sgkEhBGbcsPCUgsc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-BUalsMeuN4KSp5JHmIa6wA-1; Wed, 20 Aug 2025 15:40:43 -0400
X-MC-Unique: BUalsMeuN4KSp5JHmIa6wA-1
X-Mimecast-MFC-AGG-ID: BUalsMeuN4KSp5JHmIa6wA_1755718843
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b9e4146aa2so96123f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 12:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755718843; x=1756323643;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SldETWHwn7m3fzEtOzKMZjITNOf1gcsK+qNewxq3ttA=;
 b=ZdkN5lPNAmF6piisEwtlQ8oN69hz8NSWvjUg2YOl80v64Gt0Iz+ybm3Km21bMKO9LF
 PVwPWXQzqjB/O+t5jEnEeqd5e2IQneL4OEDoBvUkxDOskcJcl3tjQimEawe/l7+qB5Vs
 gsYJBeAj89MKwFSO9fvljOTeZJENjOySrmAzjLu86XGo+B6BjDtazCJ30kG1BKgiYgG9
 gmlqRf2U94br0uf1COYzdDSoJoWyImgIZTIY6MYAfZFzQd9z/AIH/5YKf+cnUjvRMNA4
 /y12pE1yiw299Sz+dl/pW8FWCQlEut4U+E68VbzV7E4IRLy22DTrYYjFwcM9l1igBVUV
 wOcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeBHG9UTLkHs5ehoXFylrY0kes84hzuxdZAwHXsEaCpcBVeVxIux3RmV8mAj/1XEQI3PZKHoMmvgo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrWa6NVOuqTiYVC3P7I+4rcJ8kUqJZW4fBtf2DPEJwyF7FqY92
 XpD4ZC92kKzoi/qRbzPqu2kv/KeO+y4bbmFO2EuWsgz/JwKhhS2TCDgPu93z/vCioelIR/XFdVX
 F2q4yrxqFin81htStF9+mL34Yh68B+WVY8QAsry93xPQBeOHW0Dt0sQPLER/PA71F14+8lA==
X-Gm-Gg: ASbGncv5Cg3QQRTh0rDtpaZ7DqkWxvnCb+2TkQ1uEuu1kqS2EWUXJbadpsQHbo7CJs0
 MA4ZmWiTKrAYe/QyigkG6yB2LVdMbXmphkAE0ATmp1rYQvHufighaEGWtcgbA0BvFfSwD9wgkVO
 XLw3rhbsSmdoUr9AJoqdx5jLHETPOTuP17k6/eT7vSWr6zzzu6tmQjR64NA9y9lXzCj/SmK3Owl
 MkU8kUm4jGAgSqunYZ1FHU6MrqmisDz5n1N+jFZec27oBmQsQrYgP1vvgmwPb7w4f3HFROvf8wN
 mQHDxpdFu2++g3vMYofKa07c7BViwnCTbNSBkP4C3dzyZw==
X-Received: by 2002:a05:6000:228a:b0:3c4:3d9b:d5a9 with SMTP id
 ffacd0b85a97d-3c497741e82mr18545f8f.61.1755718842608; 
 Wed, 20 Aug 2025 12:40:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZCKQP/KQ1XqUipshI512eP4eaXPmwe8S1JNsPShIAfnDbMBAM1qN5Hq0PQtSLeWP9szgKEQ==
X-Received: by 2002:a05:6000:228a:b0:3c4:3d9b:d5a9 with SMTP id
 ffacd0b85a97d-3c497741e82mr18526f8f.61.1755718842156; 
 Wed, 20 Aug 2025 12:40:42 -0700 (PDT)
Received: from localhost ([2001:9e8:899d:e200:81f1:3d49:5938:f438])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b47c9e1a3sm48555645e9.18.2025.08.20.12.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 12:40:41 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 20 Aug 2025 21:40:40 +0200
Message-Id: <DC7IDWLAGEOW.HQVRVJNBTLXI@redhat.com>
To: "Alex Hung" <alex.hung@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Cc: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <shashank.sharma@amd.com>, <agoins@nvidia.com>,
 <joshua@froggi.es>, <mdaenzer@redhat.com>, <aleixpol@kde.org>,
 <xaver.hugl@gmail.com>, <victoria@system76.com>, <daniel@ffwll.ch>,
 <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, "Daniel Stone"
 <daniels@collabora.com>
Subject: Re: [PATCH V11 35/47] drm/colorop: Add 1D Curve Custom LUT type
From: "Sebastian Wick" <sebastian.wick@redhat.com>
X-Mailer: aerc 0.20.1
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-36-alex.hung@amd.com>
 <DC6IG8LQAIF4.6KM7AM5JD3J3@redhat.com>
 <f3061c6f-5a73-4890-92b0-90f153e8dcc0@amd.com>
In-Reply-To: <f3061c6f-5a73-4890-92b0-90f153e8dcc0@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _9Y47oPAoj-knTUIjvu0zLxzGeUfFXPtBY4ZGMbxa5A_1755718843
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Thu, 21 Aug 2025 21:16:31 +0000
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

On Wed Aug 20, 2025 at 8:16 PM CEST, Alex Hung wrote:
>
>
> On 8/19/25 09:31, Sebastian Wick wrote:
>>> +/**
>>> + * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_L=
UT
>>> + *
>>> + * @dev: DRM device
>>> + * @colorop: The drm_colorop object to initialize
>>> + * @plane: The associated drm_plane
>>> + * @lut_size: LUT size supported by driver
>>> + * @return zero on success, -E value on failure
>>> + */
>>> +int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct=
 drm_colorop *colorop,
>>> +=09=09=09=09=09struct drm_plane *plane, uint32_t lut_size)
>>> +{
>>> +=09struct drm_property *prop;
>>> +=09int ret;
>>> +
>>> +=09ret =3D drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_=
LUT);
>>> +=09if (ret)
>>> +=09=09return ret;
>>> +
>>> +=09/* initialize 1D LUT only attribute */
>>> +=09/* LUT size */
>>> +=09prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | D=
RM_MODE_PROP_ATOMIC,
>>> +=09=09=09=09=09 "SIZE", 0, UINT_MAX);
>>> +=09if (!prop)
>>> +=09=09return -ENOMEM;
>>> +
>>> +=09colorop->lut_size_property =3D prop;
>> I'm a bit confused here. The property itself is just called "SIZE" which
>> looks very similar to the generic "DATA" property. However, it is
>> assigned to `lut_size_property`.
>>=20
>> Is this meant to be to be a generic property where the exact usage
>> depends on the type of the color op (like "DATA"), or is this meant to
>> be specific to LUTs (in which case the generic name is misleading)?
>>=20
>> I also tried to find the user space documentation for all the properties
>> but could not find them. The only thing I could find was the kernel
>> documentation of
>>=20
>>      struct drm_property *lut_size_property;
>>=20
>> Which says "Size property for custom LUT from userspace."
>
> In earlier version, this lut_size was specific to 1D LUT and 3D LUT has=
=20
> a dedicate lut size field in another struct, and lut_size_property is=20
> now used for both 1D and 3D LUTs.
>
> Do you mean we clarify by making either changes?
> 1) "SIZE" to "LUT_SIZE"
>      -> specific to LUTs
> 2) "lut_size" and "lut_size_property" "size" and "size_property",=20
> respectively
>     -> Can be reused in the future, if any.

Yes! I would prefer "SIZE" as I can see other color op types which use
the "DATA" prop to require this as well.

The documentation should also be adjusted to say that the meaning of the
"SIZE" property depends on the color op type (same as with "DATA").

