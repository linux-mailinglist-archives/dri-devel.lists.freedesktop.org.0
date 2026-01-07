Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061ACFCB7C
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B69E10E0CB;
	Wed,  7 Jan 2026 09:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="gB4IpXDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED40110E2CC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 09:04:42 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-59b7073f61dso527962e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767776681; x=1768381481; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P860dl5dFiwItmzc2F929R5q02m2T4u2vNqmbkSFah8=;
 b=gB4IpXDvP2YVdrNWPfdzGwgfbHrfbwuUu+joMVmLRSrNHuH2/bXXOmyJI/lRpBQNdw
 FO0RgjoOhS4+ll2lLzds/gFJEGSfjya2xZ7oUKyytJzJTp7NXg3aIbTy5SBmpMkXGHaO
 3mv4mcC8CBWkAvfHepRKqTMrj717susenTtjjnLYCgCBJnyy82BES/3sl1Ffsjtx7JXU
 89W9kti6YDdefS8qsfPqsR9A2W+2mQ7qNK5FTYeaCOZ0JO33o7P47nLvnGDVuNKtfaSY
 2CAlBI3K27lq91piBpRRQ1gpnFB3ae2SRUnbsP4zmqdEEby/4EUmFXurqW14qshmY8T4
 oTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767776681; x=1768381481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P860dl5dFiwItmzc2F929R5q02m2T4u2vNqmbkSFah8=;
 b=NYFNMNowNg21V3zDeGsPTkXC2UkhZcC1UK8HnLvvuF00MH4BK5PJTr7QXM6tUS1B3G
 xUX0N6kaUMJjlE0X2isZDOJ2DX4d20Ei5vAH8PXfsTRjfv4/Sg+OQhzUiSapt9wLknBM
 4EYwIMSy0kHi7xoYDxEHhTAxjpuaq8IbhtMTEfIYgIecWHUqhw/qKFst2sGOLEf9/6zQ
 4szeVQDIgBOcg0yHRY8MGgArzsZWX4a48UoEEvV6RVpWa28qw1t22rzKNAbYpGHHHXUs
 Lf+pjFICj+2MgY+vJXtPq644zTPZpA9iwEe0YzD3M5cg1zITRxIRQr/KIOdq65Pum6I3
 dbKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6EFj9PQxJ6JshJDGMXJ99HwXSOHqJuu1z/ulPpwhzM4p0QRQon+c1OvcQiW4UX3t5yPNEwL96v6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSxcVMMc/2Merk51J2dsC+FsKvqwmmseSLysqQ1nefWmwqUs/c
 EUEXKaI/5exFsqewH/DCHU+vAjP6sk862w9K5fK/nvNoUcuB+XAtydRF8qSZRpFQ6KmixWciqOm
 58yOKpmmaBn9nOcXMkjHXc45Sogxcj8HhGQ9y40AEgg==
X-Gm-Gg: AY/fxX6Y0/u/LLxhb/iPlR+Be6ZzX8q3tfpa8fDZ1B8cExSOuNdcNeN4BQyaCoq5lzW
 hlavm0Df6Daj1TrKxRNwufAkEsv2shVr5IP+jpKhLe99BBoDKU1h+kvOwVE3Dem6eiRanPbaPAL
 slgb0Rbq2WHPIGoLRhQxbnpxgvIqMDKq/s+SYTo3HYrlNM/bTokyE8O3pU5O8/cesH0Nn6VibnL
 zyAk+BmQaTpB+0jDOUkhAJFLDltNLYZTrpC5UwLos2As/bgDnQulQ28W+LJ5/u6r2U+HSo07pFZ
 SBpEy451Syk8CJ6TlWhsncMb5yKY
X-Google-Smtp-Source: AGHT+IE/vVecxeQw9FSdKoRzdY2ykfcbzK336JLNVyBk3q8P1Ey2AD1rcvt5snh6RIf6Ep1oXLzwgOjH/NEwmoZccIA=
X-Received: by 2002:a05:6512:a83:b0:598:8f92:c33f with SMTP id
 2adb3069b0e04-59b6f05536cmr556291e87.51.1767776681287; Wed, 07 Jan 2026
 01:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20251224160026.124106-1-marco.crivellari@suse.com>
 <aUwwunqiFw3YdKUo@lstrano-desk.jf.intel.com>
 <CAAofZF7H_sPKh=oG7C=fN-mtevZjZ038DjOL0rwDVuOib9p4Dw@mail.gmail.com>
 <aVSJfKkE0SiKrPDz@lstrano-desk.jf.intel.com>
In-Reply-To: <aVSJfKkE0SiKrPDz@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 7 Jan 2026 10:04:29 +0100
X-Gm-Features: AQt7F2psGne0sVuLZTs4ThfrIzUXtoUeyTVShJ2kOg1cjCA3s33KOhPlcD4P7Uo
Message-ID: <CAAofZF5eVkddt0AH1pZJgPmXywOwUitjJ4r7Ftztf3Qm4QbxDg@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Replace use of system_wq with system_percpu_wq
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Wed, Dec 31, 2025 at 3:25=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
> What I'd probably do here is store a WQ pointer in 'struct
> xe_tlb_inval' and update all calls in xe_tlb_inval to use that work
> queue.
>
> Since these are tied to a GT currently - see xe_gt_tlb_inval_init_early,
> I'd set the WQ pointer in 'struct xe_tlb_inval' to 'gt->ordered_wq'.
> 'gt->ordered_wq' is the per-GT WQ for resets, jobs timeouts, VF
> migrations (all operations in reclaim path), so this seems to fit here
> as well.

Hi Matthew,

Thanks for your hint, I will send a new version with this change or
if I don't have something properly clear I will get back to you here!

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
