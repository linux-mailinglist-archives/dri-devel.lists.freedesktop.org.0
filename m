Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5392C433BA
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 20:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0AA10E1AB;
	Sat,  8 Nov 2025 19:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="MlqUYMJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBFF10E1F8
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 19:30:21 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-786943affbaso13514757b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 11:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1762630220; x=1763235020; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyRJZiWrQiGWx3CFD7wgOdd2jyZ0NCxb1AABBCZa0vs=;
 b=MlqUYMJsRW3e5jAGnvyAAk2ElqnqFdd/7HI9zWE3MzScZLew2Qxw+XYhOxdsn6Qrvp
 qa73AkvPT9J04konvL537ReuObFu6g71NGwIsO7hjMgrAevY1ESuT1sIZIQURJ0eDjNU
 O+ucI4cz/HQMUQVz/u7Gp0ljQ2GAVpWGJm0Ccy5LSp73JZBVMXaEH5kE0o/OJk4g8K35
 A/jHFe9onbo0NEwMCko0pwqPHROWIijn40cu725EajuCNTmikSrX60/36n4LT/qgKMe7
 6QRTHiINpeNuZKAxvbrhmkpbuHtjSFY2fllh+yHBQpAlnp+eADg/OamM/Y/7q7msIXpQ
 YGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762630220; x=1763235020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KyRJZiWrQiGWx3CFD7wgOdd2jyZ0NCxb1AABBCZa0vs=;
 b=qsXzYKmAdBjDswZXhY75nIvkZs65mzh6ZkAcnS+E2HZhlXx6mlsSIO8Fn/vTDFa2dv
 vu4gBP4tlbNduiP6p4GeTSU9EDl6CHxsytZMfQW1aNg2LTCJ9MFpFw16dUO9PEuTXbq+
 ehQ+OvKBC0eL2weelft9KpCJAbyxAxPWwKEgopcEP0/s0QxgDECRLci1bXm+NS3xbBID
 3Y+1t7hRNCl2aDT3jD/4bVeZ+/05sirgjEZbNTdG5G2+4KmppBtoGdB/Tw6SwdD0em3k
 UhGKHxpBJOTsTl5kqTyUpfz3+Ih/MwaqvvdK1xQrUMMIWjU+jtyUIfvLwlQQoLENJ9N+
 iLAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt57Uzb/2H/rRiQuFM68OFhr2oDbC+G0p5qIai/JOUHjI65YM+pAPXbp7Q2xqzGCfixukRA8Y8WnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw08f0yfV2I3a5p1GTzAOL1BPb6dFCbCyDgJk1FAFwTyeCMB7Ca
 4YVwr8KpaOCc2YWnfslR2lYdvct3N9opL7EwRlK1qWIk+yH4e/WE3EshUA1/OBoCOdsiAZYInY8
 tx9zYS2dM8P0mfYnNHHYX/Evij5rsDTvmWKQt4fuM0A==
X-Gm-Gg: ASbGncviuERxh798DuMRbnKzB/rx84RpqHY/xjemzKD1mjdMcn8LTbMm7P9opnGsJu7
 lzRpeyDzWYF70K1nvfY5XpTadmtW/An48YiDFwQKDPO1ODoJdioBMbrrS9YzcM0cV+BYGtIZLHn
 ZAgtM0NXtj19Bf1D2BJMMj9rSKNBzJGg1pEYTVfootnVR9r0ITsgL39g5uuPl9RIcMueWIit+js
 POvHWcP4G3eCs7DCr+EtsKFxw62QdOjivLe7DDbvvc5D3LgX0IWqRdzPVMKnPdLuPUB4snE/wiD
 rqGyfq3GlLBlnmrqSOSdILUbPdI=
X-Google-Smtp-Source: AGHT+IGIYT+SUHEWS8jwXTJD4hh40k1duU3pvKoIO6/tM9I7kWkKHb17WkBAF0kaIdPn4lajaFC8l3EQAoBHjvEIEk4=
X-Received: by 2002:a05:690c:a4c1:10b0:785:fd34:a355 with SMTP id
 00721157ae682-787d53fccf1mr27702217b3.40.1762630219745; Sat, 08 Nov 2025
 11:30:19 -0800 (PST)
MIME-Version: 1.0
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
 <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
 <0bffd718-3659-4add-90fc-fb0e098f2897@nvidia.com>
 <CAA+WOBtmbPHigscFQCFgDo=9WSM6V-JMXGCO7orP=01XOqTPHQ@mail.gmail.com>
 <4d07932e-8b53-4ee3-8d08-6f49d433f005@kernel.org>
In-Reply-To: <4d07932e-8b53-4ee3-8d08-6f49d433f005@kernel.org>
From: Mary Guillemard <mary@mary.zone>
Date: Sat, 8 Nov 2025 20:30:09 +0100
X-Gm-Features: AWmQ_bmUShDzVgDbCjXaRk8KzGqVzibLvo1soC_Ryl9pqm71yycsphufLLwaE8g
Message-ID: <CAPv6GL3+Fs-7DCHGgk-rBpJjNHBLYvubbcBK-0U_Ew93_ka3Og@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/nouveau/uvmm: Allow larger pages
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 James Jones <jajones@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
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

Hi,

On Wed, Nov 5, 2025 at 11:50=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On 11/4/25 12:53 AM, Mohamed Ahmed wrote:
> > Thanks a lot for the shout out! Looking more at things, the logic here
> > is actually redundant. It was originally copied over directly from the
> > bo allocation code to stay on the safer side (basically the idea back
> > then was to make both the bo and vmm sides match exactly). We aren't
> > at risk of having an aligned address that is in the wrong memory type
> > because the bo allocation code (nouveau_bo.c:321) forces anything that
> > has the GART flag to have a page size of 4K. Anything getting a page
> > size higher than that is exclusively VRAM only. Additionally,
> > currently things marked VRAM only don't get evicted to host memory
> > except under high memory pressure and in that case, the context is
> > paused until the objects in question are paged back in, so we also
> > don't have to worry about memory placement there.
> >
> > The memory placement check in the vmm code could be removed but I am
> > leaning more towards leaving it as is just to stay on the safer side.
>
> If it is not necessary, please remove it. We should not carry dead code.
>

For correctness, this code path needs to refuse incompatible domains
to decide the appropriate page size.
As such those checks should remain.

Regards,
Mary
