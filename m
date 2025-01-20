Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19757A16829
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 09:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FE210E368;
	Mon, 20 Jan 2025 08:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NQEEjBOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563E210E368
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 08:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737361461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsD3q2BMQM74rSPuE+Iz24R7Q3SbLt1RdXEisxf56yk=;
 b=NQEEjBObR+CPKrtz+r3uCwJ0SE8SNjqtNaj8lbDJ0o+1g0ZXNy+i3dAS1MVehvLxU+NOo2
 +ySl8KesHwkDAr9JCcNmlTrnlRTLtHmztL6wUHZyH9Axp4Rm6fW4nfP0jjQ2kdZOxrPEiu
 km923VNueUm6lHkjRsL/iraKWsRlxDg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-nrEvKCxVN3-YEdr38g_IgA-1; Mon, 20 Jan 2025 03:24:19 -0500
X-MC-Unique: nrEvKCxVN3-YEdr38g_IgA-1
X-Mimecast-MFC-AGG-ID: nrEvKCxVN3-YEdr38g_IgA
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-21661949f23so128138155ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 00:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737361458; x=1737966258;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rsD3q2BMQM74rSPuE+Iz24R7Q3SbLt1RdXEisxf56yk=;
 b=Yz4e5RJNmjopYiENySNgcyFbgvnaHrXDlp/NvNkbzL+M33yblIDeT55R0iFve/EUxk
 s0yzEfGq+qx8LvgLqQKo8JXMqowqm5Al5PcKG8mGAwIGfjfWFbCACEf34HOLZZQxhWWx
 JxYxi9R0iFqIVWXX/RHmD9/nOJMLNWSFOC0YJTuRL9U6ujaGdow32xEqUYm4VBq2FL4g
 MXcKNvXIwr6d256/YnqF1u9EXKnUNNlcE2YLs0Yxu48+wY2ke2viCyhI67u5jh0a3N0a
 0Lav8qg5N2EaE/0XyxEMOBxvPuur2d+9sR6gphh5ImEkyOglmxJhWzlQJVd6uOCwh+tU
 X9bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe4x+sFligBiTmqeLGkAOIXnrbli75qwnZ36lTjxBQU8Zs5iKvZpWHFlhBXid1wk5KHkuD7xcnD5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/rKrFvfbNCzDJcXqUr5GvuB1f4FVrYIzXXO8fGJ9ucCkOlR1T
 QUQUpXB8kZfgbAZ8FEDE4AyZULeCPzluuF9tRIKGPtwebza+heoyQA/ihf3Cs50yw9XKTcwJCLM
 gxkhaexT1iODWiAXNF2YwH58Cuqs4Q/TK1Pv88hrkPlHsExVsqfQ+e6YbacADru1nbUEAYFhlqw
 ==
X-Gm-Gg: ASbGncve52R09m48UmiXdGejmBWgeFh7l4zS9MxRvBuzOL+vEISZ4v9z8EFj90gqEhg
 TdDETg4uz+k8QMJd7RWIvd5qUKgw1vw8Pm+zmBdxIt9NVRi0m3HVlbmO3//80cbiXsO4lWgzpDa
 pB9JYbuXeAyPEzckIDuKWhJP0a6IifSw3UxF7V7f6nAlBlC/fAV1bV+uZR4AviJnL6s3a+S/3WV
 wWTT2eFPXfaEaNkHzwC5vmg0iD4SFrxIbNWKZhHFSwkOMr7YYt8UVjt0XFegcxlNowIJfr/4Ta3
 3WdT/Kx5NFQSQ5vcbvA4
X-Received: by 2002:a17:903:2344:b0:216:32c4:f807 with SMTP id
 d9443c01a7336-21c3564e7b4mr140347685ad.45.1737361457796; 
 Mon, 20 Jan 2025 00:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJBKiymVtdOmUvfAXf7MqoJIBAvNbBeYaNpvAZeelBbltUfOPTt+vM9w+aIy9XiZIiR/aK4A==
X-Received: by 2002:a17:903:2344:b0:216:32c4:f807 with SMTP id
 d9443c01a7336-21c3564e7b4mr140347315ad.45.1737361457405; 
 Mon, 20 Jan 2025 00:24:17 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3ac6fdsm56125195ad.113.2025.01.20.00.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 00:24:17 -0800 (PST)
Message-ID: <cf6c6c0d6bb38a0928f3f2d1f81ee646c19a7b0e.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/imagination: Use the
 drm_sched_job_has_dependency helper
From: Philipp Stanner <pstanner@redhat.com>
To: Matt Coster <Matt.Coster@imgtec.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Frank Binns
 <Frank.Binns@imgtec.com>
Date: Mon, 20 Jan 2025 09:24:08 +0100
In-Reply-To: <435038aa-4745-44bd-9912-b422b2b513f2@imgtec.com>
References: <20250113103341.43914-1-tvrtko.ursulin@igalia.com>
 <20250113103341.43914-2-tvrtko.ursulin@igalia.com>
 <3bd987218d4248cc837c37361d0f8f29fc6933ec.camel@redhat.com>
 <435038aa-4745-44bd-9912-b422b2b513f2@imgtec.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nfslOSogaT9Ok_kIQyTWS7_KckLfIZ8ES5cyG0lbJxQ_1737361458
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 2025-01-16 at 12:58 +0000, Matt Coster wrote:
> On 16/01/2025 10:02, Philipp Stanner wrote:
> > On Mon, 2025-01-13 at 10:33 +0000, Tvrtko Ursulin wrote:
> > > Instead of manually peeking into the DRM scheduler implementation
> > > details
> > > lets use the previously added helper.
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > Cc: Frank Binns <frank.binns@imgtec.com>
> > > Cc: Matt Coster <matt.coster@imgtec.com>
> > > Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Applied to drm-misc-next

Thx
P.

> >=20
> > Matt, just to be sure, you're OK with me pulling those two into
> > drm-
> > misc-next, aren't you?
>=20
> Yup, all good! Thanks for checking :)
>=20

