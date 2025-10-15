Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D0BDFF44
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 19:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C27410E8A8;
	Wed, 15 Oct 2025 17:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="Acknfc7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402BF10E8BE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 17:54:06 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-72e565bf2feso72366497b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1760550845;
 x=1761155645; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20TjVxuYLuxrPBc8Usx9S2ZXr8G1tQbSoOkIE3uAZcs=;
 b=Acknfc7giE3N36u9CSfZoPF4B4mw2/GQH/EtVag55Yz/QgjaC7CqlujziByF8ktXVs
 q57MFMwuZmrAyrgDtAlSFGuy7281R9DC9q5dAMwhGSu/+7lB8MEru05WCJKy2GvrO3e9
 v6JPcKqO7vVI2O3Vk4hzhBDp2xxbDYR8J8Edg0d13OFUoDE98eto0l7O/ALQLVCgxxG5
 VIJZrQp8uwWn106SZyelxou8S48JjxYrskpwrGI52VK1AZzopTC2Nu9q0pbn7NuvKoT5
 Q0vlW7yg9JCFgYc3PR+KbRENJuWanqVs+ochFczf6Y35fUuuE5aSw3/01Yc6WZP9Pbtu
 R2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760550845; x=1761155645;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20TjVxuYLuxrPBc8Usx9S2ZXr8G1tQbSoOkIE3uAZcs=;
 b=LJdo8GYwT3iCXZA4f4OiNOb0xZRQm2yz7gtSkZUCs/uVu36BIvbKYX09Z1nz8BrN9r
 x6qWCHLbvOu/4ncdUC6Irqyz2wniC7gq4LZ8D/5tLtUbG1tUM2TldYbAakQn3/e5yPYp
 24dbZ/quMu9V8PkTSTpPMU7iprBC37d5649kH0ce9B++NsSHr0zT03rRYK4IbP/cz7U7
 AL6xHNsrR9s4iXnZGOel/FeOsnShjkulyjsD8d72OXZYPOfHaijPT/IJiqSzk886ndxv
 UaFjJrDb7EIFMXPyvs3rgCkfnvlPLzNf/CCuXyG/DuJrb4XRvZR1H3n+Zg5J4k7GysoV
 3wew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtHLNptvBFVUGck5+U8ch8VSso7GoWzQP93mHk8OIh/t93ktUitM77T5OodZ2hVOB2A1oB4GJF1wo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzusnihWVCFHBvGkgPdYWJIHlGpbfF3+Ib+2w5KEA830xIE7ktx
 7OeNwTVBGwbpFclMkYH47iNGemPjQmfjak900WSyWFvtr+LG5pui582Xabqi+Bozyjn1hDpk8yf
 ZvGj9X+c=
X-Gm-Gg: ASbGnct4eapnOdAORn6V4rPOrqj77piGKN4fHDBwrh6qUsSwMckYnpAjwzIuPmYJhfp
 YY/BCHgadi9AZU5Deva5ucEpzqh2kXoNKQfGzgw7GSRsFp2Njwu0PnfSydDg23ghxsPeN1sBibF
 1ldLpaZ/N05uhcwr1uNWp4XbjtlmbYd1BGO8qPzj1AbqQeP88jxnMUGduYNicdQKdnpfGfMbwCD
 V9xp3b9g8PVoe7so3mkwCqnd1tcNv9kKyDIPfOMs6zPlF4XTfEXK2gYmu8YCjcavpKoyZp+ZAgU
 Xjn6nUH9HoCFk734pycLsEqF5IsHHVwjk89gIUSw0Dgi82GSW5wdCFWiMuRH+aOVdTkLB5fzUhM
 UXRkhfefS1nKuuGwooGF0YOVC+6alueXJXFYFk5AeIsCUQ9mDAYPa7cLdqo4/d3ha0M7vL4pSIq
 oZKmdz7ydMsnHY++ChVXw=
X-Google-Smtp-Source: AGHT+IHpUcgZFZlZBkBwK3IleDaKQ7OWPJOHG2PQeVqIUf11dwRYMaBXdn2DLRrXaKHu+61NSiVcww==
X-Received: by 2002:a53:dcc1:0:b0:5f3:319c:ff0a with SMTP id
 956f58d0204a3-63ccb8e194emr10098582d50.28.1760550844549; 
 Wed, 15 Oct 2025 10:54:04 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-63e09779a0asm158816d50.12.2025.10.15.10.54.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 10:54:04 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-71d60157747so70071647b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXIhC6+5+XmpTKS6wTsdvsqKtyDrQoeD0ig4n0dzSvrr22Q6OvV8WRJplNhsUHWU48algas8vXvR4I=@lists.freedesktop.org
X-Received: by 2002:a53:d4d1:0:b0:636:1ebd:5692 with SMTP id
 956f58d0204a3-63ccb8e1736mr19417699d50.32.1760550843677; Wed, 15 Oct 2025
 10:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org>
In-Reply-To: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 15 Oct 2025 19:53:51 +0200
X-Gmail-Original-Message-ID: <CAAObsKCcKsejFju6dxTn6AQ6MdidsxXbfxTxcUXGo_8KabD4GA@mail.gmail.com>
X-Gm-Features: AS18NWATPatMxMDqAM9YqlMk9ayn38myAnVms0LmmVnqJLfravwxby5QSFqTV7A
Message-ID: <CAAObsKCcKsejFju6dxTn6AQ6MdidsxXbfxTxcUXGo_8KabD4GA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] accel: Add Arm Ethos-U NPU
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Frank Li <Frank.li@nxp.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Wed, Oct 15, 2025 at 7:47=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> The Arm Ethos-U65/85 NPUs are designed for edge AI inference
> applications[0].
>
> The driver works with Mesa Teflon. A merge request for Ethos support is
> here[1]. The UAPI should also be compatible with the downstream (open
> source) driver stack[2] and Vela compiler though that has not been
> implemented.
>
> Testing so far has been on i.MX93 boards with Ethos-U65 and a FVP model
> with Ethos-U85. More work is needed in mesa for handling U85 command
> stream differences, but that doesn't affect the UABI.
>
> A git tree is here[3].
>
> Rob
>
> [0] https://www.arm.com/products/silicon-ip-cpu?families=3Dethos%20npus
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36699/
> [2] https://gitlab.arm.com/artificial-intelligence/ethos-u/
> [3] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v4
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For the series:

Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Regards,

Tomeu


> ---
> Changes in v4:
> - Use bulk clk API
> - Various whitespace fixes mostly due to ethos->ethosu rename
> - Drop error check on dma_set_mask_and_coherent()
> - Drop unnecessary pm_runtime_mark_last_busy() call
> - Move variable declarations out of switch (a riscv/clang build failure)
> - Use lowercase hex in all defines
> - Drop unused ethosu_device.coherent member
> - Add comments on all locks
> - Link to v3: https://lore.kernel.org/r/20250926-ethos-v3-0-6bd24373e4f5@=
kernel.org
>
> Changes in v3:
> - Rework and improve job submit validation
> - Rename ethos to ethosu. There was an Ethos-Nxx that's unrelated.
> - Add missing init for sched_lock mutex
> - Drop some prints to debug level
> - Fix i.MX93 SRAM accesses (AXI config)
> - Add U85 AXI configuration and test on FVP with U85
> - Print the current cmd value on timeout
> - Link to v2: https://lore.kernel.org/r/20250811-ethos-v2-0-a219fc52a95b@=
kernel.org
>
> Changes in v2:
> - Rebase on v6.17-rc1 adapting to scheduler changes
> - scheduler: Drop the reset workqueue. According to the scheduler docs,
>   we don't need it since we have a single h/w queue.
> - scheduler: Rework the timeout handling to continue running if we are
>   making progress. Fixes timeouts on larger jobs.
> - Reset the NPU on resume so it's in a known state
> - Add error handling on clk_get() calls
> - Fix drm_mm splat on module unload. We were missing a put on the
>   cmdstream BO in the scheduler clean-up.
> - Fix 0-day report needing explicit bitfield.h include
> - Link to v1: https://lore.kernel.org/r/20250722-ethos-v1-0-cc1c5a0cbbfb@=
kernel.org
>
> ---
> Rob Herring (Arm) (2):
>       dt-bindings: npu: Add Arm Ethos-U65/U85
>       accel: Add Arm Ethos-U NPU driver
>
>  .../devicetree/bindings/npu/arm,ethos.yaml         |  79 +++
>  MAINTAINERS                                        |   9 +
>  drivers/accel/Kconfig                              |   1 +
>  drivers/accel/Makefile                             |   1 +
>  drivers/accel/ethosu/Kconfig                       |  10 +
>  drivers/accel/ethosu/Makefile                      |   4 +
>  drivers/accel/ethosu/ethosu_device.h               | 190 ++++++
>  drivers/accel/ethosu/ethosu_drv.c                  | 418 ++++++++++++
>  drivers/accel/ethosu/ethosu_drv.h                  |  15 +
>  drivers/accel/ethosu/ethosu_gem.c                  | 710 +++++++++++++++=
++++++
>  drivers/accel/ethosu/ethosu_gem.h                  |  46 ++
>  drivers/accel/ethosu/ethosu_job.c                  | 539 +++++++++++++++=
+
>  drivers/accel/ethosu/ethosu_job.h                  |  41 ++
>  include/uapi/drm/ethosu_accel.h                    | 261 ++++++++
>  14 files changed, 2324 insertions(+)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20250715-ethos-3fdd39ef6f19
>
> Best regards,
> --
> Rob Herring (Arm) <robh@kernel.org>
>
