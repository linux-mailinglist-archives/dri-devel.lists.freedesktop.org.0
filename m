Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8BC3EFE8
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 09:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92ABA10E00A;
	Fri,  7 Nov 2025 08:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="ciTKKmVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70A110E00A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 08:42:39 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-592f7e50da2so648083e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 00:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762504958; x=1763109758; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqamqyto+rWtCBanEW+Zo89Cyr5s5tTDlPQfXTLevFc=;
 b=ciTKKmVs13nNCHebcGgFnH4QM5RSPUcoMtHn3G+8T2Zs06d6ZZXYjCNLET/yx+tnk0
 u5LVpVLpQ1e1RHSmc9cZMiVhiXYV2zfSFCgXIDeZmwRT3487+Z7Kl+ajv4VDS6JrEHFj
 rDjYwa/Fm7HzVKsP0R7D1NKf5p0q7e7uvLAHcyPW9K065FqfRsVwiFdWgd7gdAcdT3dj
 15ajsa5olUFv/FuQclO0dElvq+HMTOvFSkl+OcgJ0PSpHP8Tq+RYqm6kyfIzKlE7+Ofe
 UelXlZeqeBSiULPnGSfWuVTjrtCcoAfYgX3qxtn/SF3GRjSc9hsADuNCZr25BR9s2LqH
 tWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762504958; x=1763109758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kqamqyto+rWtCBanEW+Zo89Cyr5s5tTDlPQfXTLevFc=;
 b=PSD32r/v+0obE7l2kZizaPkB0+d2xZmH+Bq08w7M4nQgiJo677lq9ZifizPwJXSk60
 iBJ5X34eWJoMkE4PooiIPiAYrZ2+8D7fCFoH0yGlzqspuuZDA1BulBTOu/eeS8a0k0HF
 KxiiPvoWYOw8yY0w3e8GZHi6FLEzGt4c5KFe3UKpWiVh1dCRh7qfu8wwFe/Bv6Ke4fK3
 2a0zEObtZ2kvRSaQ0VrmaPkSjp3JmcepRISAaB4lcx6LWRI77/V4IYLqnSFPcKg7hvED
 pSvpYe/COHfv/cXzVq7EwlLIIBLr7hLuNMug4mL5vh5vhC8y2oC/SfBswQBKMHL5BNmZ
 iocw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd05cHq+cTndKSvULJ7her+OM6drJrt1EU//9YKBqMSsBAf385QN30HKp8NHGHLbxIkpbGRAf+kAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLmD9cO/nUU3gYkW96YWw5bStfQCPehzC/DT1SlCXbnuW4EdfB
 tzaOfAhms3eEk12iihbz0B6znGoXsME2x6GhWAoLcyCdZiicSZU3mDlvf7sHyiBF9J37F7vceQn
 QlQil12+aVopm1RhXmw6gEBKY3jey+KCnRBd2EkJR+Q==
X-Gm-Gg: ASbGncsVP6SS7cPTT9vAA9HHknYhDT8Bxf3Hem7aWO3deojewFn0dHF1oMQqGr0XjWK
 EdvyfLvLbPhDn2FvvXBHvDbr1AgoHChQgT47oIw7n40pqrpVDZyl60vpj2K4mg5ZZoNKQN/B6/G
 Z6cOMdADeTPWDgDNFK9C6jhssxcGCUgyN9T0OuHqrfxRlFmViyrsIsIFkZu87Jcn4EdzlDWbPbE
 EovAnqd0iWeFUXrwOQtInjizPylCkOgMUByLkPsopUfLEF7M8biLDJk31ijZndeb2htKIhwaWm8
 127BX9JlEECz71oeJg==
X-Google-Smtp-Source: AGHT+IGgc2i8bQ7u19MvigP/q3gPcpuBFTeTqC+K0vl9YiMYmp+zGdwDP/FiKsJi3vVr4c9RAg/8EQXISlZlRyZjvcA=
X-Received: by 2002:a05:6512:6ce:b0:594:2c42:aba9 with SMTP id
 2adb3069b0e04-594599e3ec8mr353498e87.25.1762504958185; Fri, 07 Nov 2025
 00:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20251106150121.256367-1-marco.crivellari@suse.com>
 <3b6c211d4da50273ac5441bc939dfadb537c655d.camel@mailbox.org>
In-Reply-To: <3b6c211d4da50273ac5441bc939dfadb537c655d.camel@mailbox.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 7 Nov 2025 09:42:27 +0100
X-Gm-Features: AWmQ_bkFmB0zBJan-HPavmLwsc276unrA6EXfHMDRSvl0M5pxqhYnaw7YFUfYnE
Message-ID: <CAAofZF5ohD6=izoUrzOCab0euOT5hkx9faJSgwZF_zn+EsRAhg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sched: Replace use of system_wq with
 system_percpu_wq
To: phasta@kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Christian Konig <ckoenig.leichtzumerken@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Fri, Nov 7, 2025 at 9:28=E2=80=AFAM Philipp Stanner <phasta@mailbox.org>=
 wrote:
>[...]
> Applied to drm-misc-next.
>
> Thanks a lot
> P.

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
