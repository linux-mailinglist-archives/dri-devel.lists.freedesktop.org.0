Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D063BE4EA8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6219210E0D6;
	Thu, 16 Oct 2025 17:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XnikXQYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A80F10E243
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:48:49 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-88fa5974432so129938285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760636928; x=1761241728; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fbAxek/XudSJdm/bilTDa/VZekS8oo3F9bSouHLDLDo=;
 b=XnikXQYzitZWQF1yKU56a6O3+agrOAmk5iVk50r+7wWa4ROYaRxCTrlM4aaAAH9aKs
 ZONTxV6sLrzb6m539euWdtrPBG0sYLHtWUFLzYrrLjsI/1L1U5PAbkUfFrDNBHM+9WEt
 xiJ5moMErdlBapCd4bQrE5wiVUEfc9tfigGv56LNXUuzbDBQdEdfYn8b6fZgv4wMbOCI
 ZOfGw7NrYx+3NVYxUZr5MQMVdHTWvVJ1HYKr/Ua7syAXTHyarPep0ypqfR9bEFfnCGuJ
 He3A94wGMHv2MZ/1nZKSsRuzCoUbooWdrjegxK5sBpDQrtZwO60vCmA4ZZbTTWUiQM84
 RZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760636928; x=1761241728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbAxek/XudSJdm/bilTDa/VZekS8oo3F9bSouHLDLDo=;
 b=tzCowrSwYW8hf/tc0H/V+ZkaW7Rj16tHpptfWnql+CzFQ7b3y3AWHzXyIE1tZkkW/v
 b/+z34MpqY2lDrLncy4HgH6xruYkl/NZpJKdeIsk2dPam+GY8udKfdanEb3V9VcDr+qP
 rhpJMp+3fllzFM/z7n+u5QMWUi3Qx/sSQko1EZhE1bIsryjdsAzIQ+qfIhGjek6CKPBF
 4pYD9BicqJAXNb6LF+ayuZ0xTYxgXU/xsK4UikZ0OMwwNnl7rxvSxxq4EofoV3xT8cJn
 ppolYpvAGB71YnIXb6IJAULV5t6i4DVqyDBpz7trXWZEaaPuMkspiPPAdml5tvbTHDwH
 xrFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBTceeZXI6IDKujl9ZdXmvDnHTDVBUjq7ktCMlWPhp4tKLJYPYQX0ZaaJv6xo1bDOkfGrsjVk/Nvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz12AxtlMvoJU9JVfJ41H3OfJcg28dLo2z2PYdJWlPD2cF8+woz
 +wngT4Ih7e8sWbRirqkC7DEoRv9Mow38u/afKYD3Wkcd6oBANpXbBs+E
X-Gm-Gg: ASbGncvCLV6BuckortsszeI9gKKPIVkmP1kyK+9szPyE7d7ADPtlxtoQbA8Kcnh/MDY
 97wAyvRpQ+Y65gTa/944Pa/WM3c8V1j3BAYPB8NfGvtaFwVlHEe2zHfwvTgtF8PQ6SJug+Q44Fo
 Mg2/L5JOadcbmsR8kJKtPeSm46Gmgv9yRcvbTaFJhzcuPTdX+rZcnFxOXqvaBw6jiYtvUieaDR2
 9LjcghY6ntyZSU0M6yupyEz/reg6m9y3ESmMfN4X6FAsIRW2eo1LPDdcWen5wqNCxrg5hQdGwrN
 zGRV8RoxUIXMbuWrtkPXu4bbOVJ7ke3YnTgzvjb3pOI2M9Pc2vpn0G8tagdDdOYZteMUNqxRZ7F
 mgoY5qeHivHSi5KRQ3dl3au/O+lTCVLmZgJWTBr81GYqKz+vXURs5ZKEsO2BehGX6mBJyY7R5
X-Google-Smtp-Source: AGHT+IH3+Fae4k22gY3NVjEqt4enc7pxuqkgdu3bjhkqSWDqAE7JM060ERq759Poo6uBtl8GK/pyKA==
X-Received: by 2002:a05:620a:25cf:b0:883:9b33:f6b6 with SMTP id
 af79cd13be357-890709ee994mr113167585a.84.1760636928217; 
 Thu, 16 Oct 2025 10:48:48 -0700 (PDT)
Received: from localhost ([12.22.141.131]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-88f38bf32cdsm239783585a.57.2025.10.16.10.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:48:47 -0700 (PDT)
Date: Thu, 16 Oct 2025 13:48:45 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Edwin Peer <epeer@nvidia.com>
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move
 bitfield-specific code from register! into new macro
Message-ID: <aPEv_UO4vViOcOvN@yury>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016151323.1201196-3-joelagnelf@nvidia.com>
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

On Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrote:
> Move the bitfield-specific code from the register macro into a new macro
> called bitfield. This will be used to define structs with bitfields,
> similar to C language.

Can you please fix line length issues before v8?

$ awk '{print length}' drivers/gpu/nova-core/bitfield.rs | sort -rn | uniq -c
      1 118
      1 116
      1 113
      1 109
      1 105
      1 103
      ...
 
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Edwin Peer <epeer@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitfield.rs    | 319 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>  drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
>  3 files changed, 332 insertions(+), 249 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/bitfield.rs
 
...

> +///
> +/// bitfield! {
> +///     struct ControlReg {
> +///         3:0 mode as u8 ?=> Mode;
> +///         7:7 state as bool => State;
> +///     }
> +/// }

This notation is really unwelcome this days. It may be OK for a random
macro in some local driver, but doesn't really work for a global basic
data type:

https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/

I've already shared this link with you, and shared my concern.

I realize that rust/bitfield derives the GENMASK(hi, lo) notation here,
and GENMASK() derives verilog or hardware specs popular notations. But
software people prefer lo:hi. I'm probably OK if you choose C-style
start:nbits, if you prefer. But let's stop this hi:lo early, please.

Let me quote Linus from the link above:

  It does "high, low", which is often very unintuitive, and in fact the
  very commit that introduced this thing from hell had to convert the
  sane "low,high" cases to the other way around.
  
  See commit 10ef6b0dffe4 ("bitops: Introduce a more generic BITMASK
  macro"), and notice how ALMOST ALL use cases were switched around to
  the illogical "high,low" format by that introductory phase.
  
  And yes, I understand why that person did it: many datasheets show
  bits in a register graphically, and then you see that "high .. low"
  thing in a rectangle that describes the register, and that ordering
  them makes 100% sense IN THAT CONTEXT.
  
  But it damn well does not make sense in most other contexts.

  In fact, even in the context of generating mask #defines, it actually
  reads oddly, because you end up having things like

    /* Status register (SR) */
    #define I2C_SR_OP               GENMASK(1, 0)   /* Operation */
    #define I2C_SR_STATUS           GENMASK(3, 2)   /* controller status */
    #define I2C_SR_CAUSE            GENMASK(6, 4)   /* Abort cause */
    #define I2C_SR_TYPE             GENMASK(8, 7)   /* Receive type */
    #define I2C_SR_LENGTH           GENMASK(19, 9)  /* Transfer length */

  ...

Now compare it to what we've got in nova right now:

  register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
      3:0     minor_revision as u8, "Minor revision of the chip";
      7:4     major_revision as u8, "Major revision of the chip";
      8:8     architecture_1 as u8, "MSB of the architecture";
      23:20   implementation as u8, "Implementation version of the architecture";
      28:24   architecture_0 as u8, "Lower bits of the architecture";
  });

There's so far 36 thousands of GENMASK()s in the kernel, and only 67
register!()s. It's a separate topic what to do with the GENMASK()
codebase. But now that you do this massive refactoring for the
register!() macro, let's convert those 67 users to the lo:hi notation.

As a side note, for GENMASKs, I tried this trick:

        #define GENMASK(a, b) UNSAFE_GENMASK(MIN(a, b), MAX(a, b))

It works, but bloats defconfig kernel for another 1K. I don't think it
would add to readability on both C and rust sides.

Thanks,
Yury
