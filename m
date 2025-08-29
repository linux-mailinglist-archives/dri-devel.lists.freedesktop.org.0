Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D2B3C45C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 23:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50C110E2AE;
	Fri, 29 Aug 2025 21:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G38HQflG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBA010E2AE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 21:50:33 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e96e5a3b3b3so2256145276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 14:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756504233; x=1757109033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9q+jxiJZlQB5ZBqFSf18qlf9A4B0dAOQ/wntSaPJcjE=;
 b=G38HQflGJ6aQzxhmno9DJK2KMewdWPmR6ZdLNB+9cKo2epfuC3+MHMX3Hk0HasoBxs
 8v0MQSZ9wA+jaRMUdmpWoaTldQ67Kqxtjz7WlsFEUI+9lFhUsKVvCgl4UqUiPn3zCi8r
 kg2vcs1aILpT6jBVXQuQcF9pOH/VHYGmM//+3K28OyNqOZZK7bQfL99qKxkACU+MrXab
 ZBpw3OXGIFwCVv3IZb9QNd34iaJjzCpEujwMnhPVn8P0LqPjULKgW9kC3fIwnsTnCMKw
 VfZjSzzoMaG28eA3I3e0wyimGTfUAC7Lp8Dli2o5NrBAo1d5mIPGmkOr8AcfSGTEZtDR
 qRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756504233; x=1757109033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9q+jxiJZlQB5ZBqFSf18qlf9A4B0dAOQ/wntSaPJcjE=;
 b=gPkt4dD8tNwxC2JiUP4ipT8Cfxc39pXRjjVItHlt9+oAe4tqzoqyQhBLXZbBoSEsLr
 y8n/D+KbnZJaEYPRWbqwf7HxSUCzXldPbRKOtdi9n0Gfm7v4LkdruOm9dVHywbnHv/5q
 wHhZlGMtElB68iSENOymKHuTvuMqZPICYotj5/pJ+aeaFKS71C5PSL06kLv/QH/SVG6R
 cR3NIOAeuWRplQ9UruXOw5uVs+hLAX6aiHXlbTLhACm9KjOnZHJ7z2yrQPusXzBVppaY
 v1ivJkSHA0hpJqo5CTOOrunGL5iLTkeAwvcI3emvvQH6NpcrXMi7FeLeP74jLoTEvvFW
 kLDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw/zZgMPvu1bg0rk/1nrQIU4J4W7sPZCKPsg1I3NOlPcdy+A7Y2VAXkba/FJj7Wi6sXapO5OgOCEc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR56o4Do8XCrGHFI0qcDRas2yY9iZjGs9iIUYHtkP1XIE9EmAg
 CWoUmJX8I+yMue6HORkrE0eZxOSbxg0Mw/kn/MEZbKxIzeOWAManB98FiBzxgT3ifLLJbsYV+Xh
 /Rs8qjupkoq8SPid5/llh+oYMvWgoBkM=
X-Gm-Gg: ASbGnct1sVpTZif1p5qby9dKPwUkCy3G8HxnTPc2tAEEbmBoKGZirHKhb3CJirRoGbl
 tW4dUHd1GOB8K0w0LA4JJ0bIDxqdaPyU6Lykg5WiBLCGqtprGXLbyn5RLsVUgd1nnAZjGdPMFdO
 NF+XNEaGQ1Js2VNH1X1e2zKP83ncwWu0zGDrTn3uY0A6VF3YVRBHpdgwoQbgFoMwLgx7SD1gGNy
 V2HgTW8+rHCbkiowMWFaYUOSDc+yh0+fWv/GUxL
X-Google-Smtp-Source: AGHT+IGjg9C8+gDlUZd5wXGQOESzGBuvn3UbTua0+WEP1zD2LAYBsQPLu/csxwx8MuvlkFvU99dMLaFufFMuXcizmVs=
X-Received: by 2002:a05:690c:7088:b0:71f:f3bc:3b9 with SMTP id
 00721157ae682-722764aca8cmr1699697b3.29.1756504232569; Fri, 29 Aug 2025
 14:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250828201806.3541261-1-olvaffe@gmail.com>
 <ac4838eb-7613-4642-a007-577a9f665984@arm.com>
In-Reply-To: <ac4838eb-7613-4642-a007-577a9f665984@arm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 29 Aug 2025 14:50:21 -0700
X-Gm-Features: Ac12FXxWORzRnCGgs-ncJDRqcsocabemqRb0a-BtSr2XrSnm8PhUgTVO3SI4oew
Message-ID: <CAPaKu7SYptoVNfUgT8ok1mwRk9BZpU7z_XG=vE2_nkJ5hAj_8Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/panthor: add custom ASN hash support
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Aug 29, 2025 at 6:41=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> On 28/08/2025 21:18, Chia-I Wu wrote:
> > Some socs such as mt8196 require custom ASN hash.
>
> I don't know the full details of this, but I'm puzzled by the "require"
> here.
>
> AIUI the "custom ASN hash support" (or L2C_SLICE_HASH as it was renamed)
> affects the efficiency of the L2 caches in the GPU. It basically
> determines how addresses are striped over the individual caches.
>
> So (unless there is a specific errata) not setting a custom hash will
> work just fine, but the performance might be slightly reduced.
All memory access results in faults unless custom ASN hash is enabled on mt=
8196.

It sounds like this is a soc-specific quirk.  I will check with the
vendor, and likely turn this into a quirk.

>
> kbase provides both a DT option and a module parameter which can be used
> to override the defaults (although the parameter descriptions say "for
> testing" which I think is somewhat telling).
>
> How we should describe this somewhat depends on whether this is a
> specific workaround for a SoC - in which case Boris's suggestion of
> using a different compatible string and panthor_soc_data seems like a
> good choice. Or if this is exposed as a general "tuning" parameter, in
> which case this might be appropriate.
>
> I believe the tuning is related to more than just a SoC (the external
> memory system has an impact). So I guess a DT level knob makes most
> sense here.
>
> Steve
>
> > Chia-I Wu (2):
> >   dt-bindings: gpu: mali-valhall-csf: add asn-hash
> >   drm/panthor: add asn-hash support
> >
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  8 ++++++
> >  drivers/gpu/drm/panthor/panthor_device.c      | 28 +++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_device.h      |  6 ++++
> >  drivers/gpu/drm/panthor/panthor_gpu.c         | 17 +++++++++++
> >  drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
> >  5 files changed, 63 insertions(+)
> >
>
