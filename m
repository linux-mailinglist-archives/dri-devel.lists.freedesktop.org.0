Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36010A39CF9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38A10E6C0;
	Tue, 18 Feb 2025 13:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PAfMV49M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA95310E6BF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739884180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0j4Vm144VHYx11zlR4uyhxpBXBQoMAr0tKnHXqln9Q=;
 b=PAfMV49MWxk1w/eSMW4QBHyLJ5CAnfFZZhRdIcqZXj+v8Oqad1OPUrK4W1chc47rn5qpAI
 JWYRU53xmx+mJr1BIjLqWlX6/8cQc5Mcvlcounj6mSV61dXbxx73+uOZda/AGQhZo1952q
 XO/RArQi6iazVgKvollop6qbYo99x48=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-gQ3Vn_0XOQyGM46RUsuyGQ-1; Tue, 18 Feb 2025 08:09:37 -0500
X-MC-Unique: gQ3Vn_0XOQyGM46RUsuyGQ-1
X-Mimecast-MFC-AGG-ID: gQ3Vn_0XOQyGM46RUsuyGQ_1739884176
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-439870ceef3so9901805e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 05:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739884176; x=1740488976;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0j4Vm144VHYx11zlR4uyhxpBXBQoMAr0tKnHXqln9Q=;
 b=So64ShXc+KJA2JKrHVGFsCpjZIheFJ8T49Mqnu0vYhj9iyIwzKaWDohaFpepS0NlCp
 d483eK0ccCM10WT7woMJnIoAqTdABi7KwUQV6kAV+iirjt3MGgQRzJkijW85T72tHxbU
 zCFzI4CbJs/Cq8TPbgnA9QAHFZsOJ6VJpe74iFn3uDcCrcZP+IQ5PnRSh616OH/zPwqB
 jys+S1JrJhdNuBIBmkC1XrhHWPUIJ4JNhxPwptoNxLxDjZTjVthy+K0qEbB16JM2VTwz
 PrZwFk7egV+CTpBaedPpIALUit6WDNzs9h/9A/X7ETwnbeNDZiPsCfuaxeFXEsCe1qoG
 F5vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDsEMSZOIkzx6q03CDx6+fkfTaiN76mQ8SJ6+WUO6F/eVd7PvTJoNAlqJd+0FGSj6ojCA8fFJtf6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmvc1YYqimxToP6g8SZzDQU14HCCh3gw3p/3LFwxASyPMl+ExZ
 DaaXxoFDDNtFEhKHLJ5KnekJbvz4tWk8HK7SFtqo9A4AhQHeKY+XFrgo2TziM7mb5zHig8g9vbC
 IX7lQ9f2lDacUXrOLFwsplIAVu2IoBQCB3oHDfungnP+MeQSjXI4W3ZYdbcpZadZ85Q==
X-Gm-Gg: ASbGncsTAh9E1+IW0hos7TDQ+hii2mGNhu88eOkFPJz1Atn2/+sCdKgmku0R9inXNdW
 boVqhNNF3ficX55OGy6wJajtAJDt4QZ6A8z1WLgSygA9pUjNU4m87OagyCPtsZ+7nY11+ahXJ7x
 V5F5d4wx5GLtt8y/uqLatb4p4IP/ogRzNJoSiWUoVmrNQELt4GWf/9i2W9JCE3QloEYsqS3pb2D
 Z3B9i82yBfeiL91qBOoYnqA8BpaK3GsPoScAm3NApzx7RzvgTTlJh00Vthrcy4knK3JymxepiAg
 rZKFJphQLK5OQ3F6fsWje6xACU/DHcs6BhaQLhoV0lR5HJ2L0u2VXL+rlWEAvPE=
X-Received: by 2002:a05:600c:4511:b0:439:88bb:d006 with SMTP id
 5b1f17b1804b1-43988bbd499mr60329695e9.6.1739884175795; 
 Tue, 18 Feb 2025 05:09:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0DOpj43RZFNp+JX/ZShx8BlmwPqpc6v5z2QLXz9M5znTKLEaWABk7Mv2M22qyQ8wS4NqHSA==
X-Received: by 2002:a05:600c:4511:b0:439:88bb:d006 with SMTP id
 5b1f17b1804b1-43988bbd499mr60329315e9.6.1739884175398; 
 Tue, 18 Feb 2025 05:09:35 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8443sm182296005e9.35.2025.02.18.05.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 05:09:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
In-Reply-To: <CAPVz0n0WG1Q51SONb4fmkzi4q7Q0sZ_aKSLrLnGboNNya6nO+Q@mail.gmail.com>
References: <20250217140910.108175-1-clamor95@gmail.com>
 <c19bd9b3-86c4-4f1a-beb9-b6aed32b3ef5@suse.de>
 <CAPVz0n0WG1Q51SONb4fmkzi4q7Q0sZ_aKSLrLnGboNNya6nO+Q@mail.gmail.com>
Date: Tue, 18 Feb 2025 14:09:33 +0100
Message-ID: <871pvvqu0i.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4yh_btr3Y7ppKFsY8OA__058mQqxUhZUTLTahviDODQ_1739884176
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

> =D0=B2=D1=82, 18 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 14:36 Th=
omas Zimmermann <tzimmermann@suse.de> =D0=BF=D0=B8=D1=88=D0=B5:
>>
>> (cc'ing Javier)
>>
>> Hi
>>
>> Am 17.02.25 um 15:09 schrieb Svyatoslav Ryhel:
>> > Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
>> > and LG Optimus Vu P895
>>
>> There's a driver for Solomon 13xx displays in drm/solomon. Did you check
>> that this new driver isn't just an extension of the existing code?
>>
>
> Definitely no, ssd2825 is a RGB to DSI bridge in a pure form. While
> 13xx as you have said are display controllers family.
>

Exactly. Both chips are from the same vendor (Solomon Systech [0]) and my
guess is that the SSD prefix means "Solomon Systech Device" or something
like that.

[0]: https://www.solomon-systech.com

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

