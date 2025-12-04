Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C15BCA4C90
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 18:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EE110E999;
	Thu,  4 Dec 2025 17:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B+KNT8iP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E67510E999
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 17:35:44 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so124460866b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 09:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1764869742; x=1765474542;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p1EniviQbHUsaR0Vz1Ux5hYZecF8A3cITFKTYdHMX5o=;
 b=B+KNT8iPJABPqcx/4u4QBpK+S1QtG138jrz4o9h8KeIptmrBjNDlyFI6E3RfgqLsGT
 Azta4CAuAYHyMNlCVb0zvFnOq5UBXiFb8v5apBstBgUAI/dmg+4Z73HFxnqzdi4dw3pi
 JOlVDybHjrVZZN3lJwObXAoEAqRK10dqZUFK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764869742; x=1765474542;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1EniviQbHUsaR0Vz1Ux5hYZecF8A3cITFKTYdHMX5o=;
 b=gacHCfUQLQIgZN5NYRdI0yM6gkhpjeYi85SLmsXxQe9So8Khe5Hk74IAZFU3S2gn1R
 iOnCvXkAFdoBGs62gFdmIqBaBPBr3X2PIOq16Ef2Gb5QvmsdIf3DpOV/rf0eJZFHtPXM
 WbaVpqvuvb9KcmB9INpCDCHfAs884wCYMHOSselYITAs4ktEVrX9IvfsSv72qVsHHkzJ
 6MLCEoyD+y2vpJJKtImH8azu+3sBHqVM8QqK26TcvnR7cYIYxnCl/r7IGmljNrxM9XdZ
 Z7nRVI4KXEA4Ee1QuB4MajQPAS2hOlg6EhdbCxXAFPc5neg8hgHMDQoTvhHvPcUd+X8Z
 GUMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbtp/3Nz3RQXecszyTZlhOaQvOpotcsa7hALHqJcgGGYmL9isUcCd+KAp60ulAIRsg28YMy7HxEoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKHfvAq4ZP+Pm34+iKrNDI8BNr4promWUEuvAxstAhZ/qCpoBX
 GXIa8FesxpE2fQ99bRqmea7Zekr4J8l6MZM/FrUYugMGbyV9aQdKyqc6SM8MHmRELcvHYkXxSCm
 6mqkYKSw=
X-Gm-Gg: ASbGncsH+smkyCO2NdxklkiSpI1Chfj3iO73/EEfCG11FnUcVzzJp7eFMKM6EXXq8Ub
 8z/MnRDEOeDZsW+S9WKQMRfgoA4sTMAjOg3d2BbV6+SK5QH3HIPmZATEIplvISIart8OvBfFfnG
 2xnkTWRgeVMnlZqQ8RoH1eMiOkl3g0C42g0qm6PXIEbJEdl38rWD4re1LtnnRclgzfUbR/mv7vH
 HIU0kV91my0r6NTO1u0xfx/vyoenR4+5TRK7azGZ0QgpyJQd2YJJpt768FTCMaDeHrxupHWEpYG
 LL7W8WFWbnMWlV7eX9dGl8KXY3CM8/7NiIcDrMzU+C7BPpYod6mXjAm/6/6HbXRxZh7nX+2XFAr
 vXvBoU2C0rXElrfwyXiHJDApGzFTHv4+rMZvQc+8RRGDMLqmoJo97CImoQ2ZaQTsz5dLuR9PYvG
 1iq1Oolu/LOZKs7UfK/wAq0+fa8KQcX/w0uIw95nAFjppyqUDXUvPwGQ+5k7Uz
X-Google-Smtp-Source: AGHT+IFUqB/7tr+4LYxHZHPaGHwH58ZaT8lAKw5Zjr6XxvQemuGoD8wmiTr9SxEgzcVXT60KjK4sUg==
X-Received: by 2002:a17:907:c18:b0:b76:ece0:368e with SMTP id
 a640c23a62f3a-b79ec6ba736mr403921466b.47.1764869742334; 
 Thu, 04 Dec 2025 09:35:42 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49e3fb1sm177075166b.60.2025.12.04.09.35.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 09:35:41 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so2077165a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 09:35:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUC+rwZgYxmLlAkCAJnbBpdeKLyrzQS3alLPhZe9XRJ36mK5+Lw60bEZtaeE7ZAlOHHB3ImTzsyD10=@lists.freedesktop.org
X-Received: by 2002:a05:6402:2750:b0:640:a50b:609 with SMTP id
 4fb4d7f45d1cf-647abdd5edbmr3789043a12.16.1764869740930; Thu, 04 Dec 2025
 09:35:40 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tySHmq2KLAvW95MeKcb-37gZBhHTY5hf4dCTgUFLd+RKg@mail.gmail.com>
In-Reply-To: <CAPM=9tySHmq2KLAvW95MeKcb-37gZBhHTY5hf4dCTgUFLd+RKg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Dec 2025 09:35:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=whaiMayMx=LrL7P119MLBX6exM_mEu4S2uBRT+xWQ-mbA@mail.gmail.com>
X-Gm-Features: AWmQ_bkjrI7TE0yZ2Q7MlYedB3NVDWfJJ3rh2uYiTjny2m19pQQ2e2w_rtCZQCg
Message-ID: <CAHk-=whaiMayMx=LrL7P119MLBX6exM_mEu4S2uBRT+xWQ-mbA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.19-rc1
To: Dave Airlie <airlied@gmail.com>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 2 Dec 2025 at 23:23, Dave Airlie <airlied@gmail.com> wrote:
>
> This is the main drm pull request for 6.19.

I have pulled this and pushed out the result. It "works" for me on my
Xe setup, but I do get a new refcount warning, which looks like
something might be seriously wrong.

(Side note: I'm also running with

  https://lore.kernel.org/all/20251119153321.2640969-1-jani.nikula@intel.com/

fixed up for the merge and applied to make my dual 6k monitor setup happy).

I get this:

  refcount_t: underflow; use-after-free.
  WARNING: lib/refcount.c:28 at 0x0, CPU#43: gst-plugin-scan/2770
  Modules linked in: rfcomm sunrpc nf_conntrack_netbios_ns ...
  CPU: 43 UID: 60578 PID: 2770 Comm: gst-plugin-scan Not tainted
6.18.0-06709-gab59a11f1240 #25 PREEMPTLAZY
  Hardware name: Gigabyte Technology Co., Ltd. TRX40 AORUS
MASTER/TRX40 AORUS MASTER, BIOS F7 09/07/2022
  RIP: 0010:refcount_warn_saturate+0x42/0x70
  ...
  Call Trace:
   xe_exec_queue_destroy+0x1be/0x1d0 [xe]
   xe_vm_close_and_put+0x3b8/0x770 [xe]
   xe_vm_destroy_ioctl+0x107/0x180 [xe]
   drm_ioctl_kernel+0xa3/0xd0 [drm]
   drm_ioctl+0x30f/0x470 [drm]
   xe_drm_ioctl+0x48/0x70 [xe]
   __se_sys_ioctl+0x6d/0xb0
   do_syscall_64+0x6a/0x260
   entry_SYSCALL_64_after_hwframe+0x4b/0x53

which hopefully gives somebody an idea.

Added Xe people involved with recent commits to the participants.

Anybody?

             Linus
