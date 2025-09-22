Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4956B9193F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 16:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DC410E4B3;
	Mon, 22 Sep 2025 14:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="1mN8uBTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4F10E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 14:07:49 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-62ec5f750f7so7487739a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1758550068; x=1759154868; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gKCZnS8Y0kw7LI52aPWPye+cd/qPIjBzxQKuWEn6pk=;
 b=1mN8uBTTUJD8A5oQ99k/NdGG8kWnw1uBxolFoqLGOHFHQhS1yKdxcXEfQVNk42ZZPX
 IIjo9DCFx+Rpb/qMqQtfMrPbXcl5Q2yB3eMz7zR+w0dRD7e175Vk8pSFwHZw/fHEz8fe
 5erVpEkIvSUHjkllgxjLc6CBfyoDz1fjn8HHyv3f67xD8kck/8zfVCBGMXLnjjnaNXs7
 0U7Sl686w0HsNHgWnOkDcz4d2UzVcLRbtxyKAeFjqS9DIkvkApe/owW/gc7vL559iaag
 el6WdNXHm71oKVZz1MUMvOeMoB03p5LvDQG4bHNi19HSAIkNRYoWpiuJ5zA+99gXBeWk
 wn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758550068; x=1759154868;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2gKCZnS8Y0kw7LI52aPWPye+cd/qPIjBzxQKuWEn6pk=;
 b=dM/Cd1Td9ne4q2l3eB9gavG/vftv0Q5gHyqX3KLOmxkk5jLLiHNDbSstsx3dkA21J5
 Fy5EoFmViUOxd/62DAvL6VF69Blfsz4FU23NPqKp99j3TJq+tKQ49QQk26loZej0m1b/
 W3zSYubA5gIQ5QCaD6scVQJ25UpmnC7WptHk35igmDR7dihBIk3ClJQQyEx4Pocv0y1r
 T9jdCPT+dW008kS4Vt2I83tKVZMgTe5AvHINVgFXvVB/xPknpzoBq2jUPhQWbGSLenAV
 /jtAyhDd2/8BKFgr8GY3BMwxh9km36dvPY+W/z70iyIepOEuBvAnUPT34Eh/BshPY257
 QU0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2UV15VH26O6SbKsn0sSbJR6wJuJMxHpupJI0CFsfI8IZZmi0nEW72qorHwHK3TZ/MYLN8sCJr7So=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqcuWzTcjO4gNFQgcZoGd2Mlo9tziomdDvg/47f2SLMObvUBii
 GP8iJ8I1eqWzK0860C6rvWFUXqq4jWmz+3VSHr15UlIGDcjOEEnmYyGfiO2a545TnGw=
X-Gm-Gg: ASbGncvDSdOvbvZQdHDkSUL3NE9+23D8YsBygErvfanm+QeYReZkNtAPONip1Ua+77W
 W+lnOPJDqGnX0hhoJga98Yk+Pz50AjQNkPaFekwPeP+dd0yCZukgdsczHu2sEWyhNU4Y3deS9MG
 HkFQQtbhGcAtQyibuammnkPikURMx5JzBtDimsIP96xI4EnO83ETwV3DRfFMAYMVGqvtSCAdK39
 rU8Y4i5zQgjdDbgKrSWFm4ktL+PSt1RWGzeclNT0KbCuYB7nQowVmkREzDfuUIXMEHKw7vxYjAr
 j1w8qAlAI3r3cdR7sw/dBipPJy0CKXdznLBubDMV2CWh8zuz97sMYVG5UMABg74D5mlP1eaJbpm
 ZNImjLSye540ZlGPOVSeOv3F3aHgFRBwfJjAWqLcSC675x2gwUTuHE75BsHQ+9e4/OZTw
X-Google-Smtp-Source: AGHT+IG2LQi+1Jve61dJzJPf3p6C4wK2oRc2C6Ic3zD7ZHI0AKL2Y3hhz823ekZ6+r+8VVvfemU3qw==
X-Received: by 2002:a17:907:972a:b0:b04:4046:db6b with SMTP id
 a640c23a62f3a-b24f567c816mr1300784166b.45.1758550067866; 
 Mon, 22 Sep 2025 07:07:47 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl.
 [144.178.202.139]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b29b80eaec6sm484442766b.87.2025.09.22.07.07.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 07:07:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Sep 2025 16:07:47 +0200
Message-Id: <DCZDZ037P56C.3MS3HI55IN41J@fairphone.com>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] fbdev/simplefb: Sort headers correctly
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Javier Martinez Canillas" <javierm@redhat.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Hans de Goede" <hdegoede@redhat.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Helge Deller" <deller@gmx.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-4-f69b86cd3d7d@fairphone.com>
 <87o6u9d3kg.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87o6u9d3kg.fsf@minerva.mail-host-address-is-not-set>
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

Hi all,

On Fri Jun 27, 2025 at 9:52 AM CEST, Javier Martinez Canillas wrote:
> Luca Weiss <luca.weiss@fairphone.com> writes:
>
>> Make sure the headers are sorted alphabetically to ensure consistent
>> code.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

While there's still some open questions surrounding dt-bindings and how
exactly to do that, I think it would be good to pick up the two
"Sort headers correctly" patches so that they already get in. They're
good to have in any case in my opinion.

Regards
Luca
