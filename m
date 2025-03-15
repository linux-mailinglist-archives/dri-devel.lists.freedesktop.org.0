Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D1A62C0E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 12:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F68010E2B5;
	Sat, 15 Mar 2025 11:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ln6Jno3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8C310E2B5;
 Sat, 15 Mar 2025 11:15:56 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5fcd61e9bcdso1325976eaf.0; 
 Sat, 15 Mar 2025 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742037355; x=1742642155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fsE4ot+F7yV8gTFDUQj/QcGbskBzPPy0s/mWjVIBgJ4=;
 b=Ln6Jno3m7C87FLymjU9cgvR9DpiQ8azBBUPvb/KaBsC8Q1El5lzpHgyPLCjNsoP/xt
 BcUxflcVFbZZtFXy+lFhRSVJXW3W/RMjuj9PtAkvtYh6pW6QUNmhHK4Z5bkqcUFc6BBi
 HwzETQpAYahhjvL8bJ4AHguCOqFmP+WKdxkh5zEp3i+OhcajtuDmhJpzp5YPTG/3dny3
 +X6y9np6tzh1eu0n6aKPwN4P73wZ4GFvMOSkGmRP2DY6IQNK5VM9Z2SAIHEgJAJyFLne
 6mJPsazopgFZF00tjLuZPpB4i4ypCLoi4DeytdnKQ6KiHd40Q3Cd4DRsF8k1R0MTSlB1
 3ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742037355; x=1742642155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fsE4ot+F7yV8gTFDUQj/QcGbskBzPPy0s/mWjVIBgJ4=;
 b=rAToWXBonbpPcccfHZQf7h7xQoWcgLsiEpZnNl5fIhhVNsnyzYrDcMjQKL8F6kMmMf
 EgwudDoC5G++7YYBzFSm5EFz5qcowkfhopvH23g3g1RH4jNMcwJy/tzPU5p5Xm2vou/4
 dFw+xDV96IyWyIpeAJBElt3Ii0hORmHAnTO+YdT+YqVEbFp0HDD0tmpu49hGrqkLrCZ2
 /MTJ0TcFjaH6Pp8qneH1W+ipCVO88zF9C0mQm+7htTRNAnZXA2gk8/89SCtch5LG5OpM
 bP3wVKxabLInrADH+oqUs6Kmk/z2NrwDTLSae/tqBRBeRiLpk4pORLaJh1fxf4aGH12F
 y3XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWajeKQY0nA5fcRQxqXJEDsMVnaFZsruVIOU6AkTrGyrDtO3IsvbGVo1fUKqoJumGZfR8BN331KLwE=@lists.freedesktop.org,
 AJvYcCXu5M3cEv/3rkOC7u0H4lUs5YCooz7Mc2LCfy2nlTbL3uCL44T9VNxAU9RBJrdUU5oLAnp+LAlC7g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW/wb7pt6pTUrkkIh/gBks4qa+ofemqpcRjsBdXEYaCnr0UmsN
 EUZUeiVmh9Fl0z5J5cq6IhtI7YZWHFbV2uSqrPlmF3Hj98AIL8wX
X-Gm-Gg: ASbGncvLo6O0w50wUHw6OfrkigBi6IEv39gdfbTtKvMaq4WhQOb7rFAgqMr/R+GkkMc
 wRdbPW/IC8+RzHpmRS4KIrc3kknTOU/w2hVWMKI/gW/7HGYbr3PCPCoXv49TuPE9Y5G9MH7ZwXF
 OvdlILpEnrRG0KnrL5Sm36kWPZRRweEpNOp+OuR6J14s0DghyZbvdIOjqOpVEmUFOgGcBcvUHQs
 L2EsCLe9h7eaI5KjOtqmLLUL1v++wugGPzfRvNDcpeiNKZgw4RJXhPurvqgcmCOMwRFOMSQg067
 h4v6rm5gotgjiI3OGUqIc7+UxoiaGlspziKRwKk/nW6efmuh+uqaGYl9YhQrFtKgEqNu1ElHDQC
 uw3BR2AF67nBNXGUN
X-Google-Smtp-Source: AGHT+IEtJfw/w3NFqPpk/9J3e/w+rGmcMb9d2v6gwwk8XdHXokvYktoc9+s3uuIp+BGxQ9A7JuIynw==
X-Received: by 2002:a4a:ee85:0:b0:600:2ff9:acb9 with SMTP id
 006d021491bc7-601e45a7a78mr3037153eaf.1.1742037355049; 
 Sat, 15 Mar 2025 04:15:55 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-601db65a010sm913826eaf.1.2025.03.15.04.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 04:15:54 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: benno.lossin@proton.me
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, airlied@gmail.com,
 alex.gaynor@gmail.com, aliceryhl@google.com, andrewjballance@gmail.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, corbet@lwn.net,
 dakr@kernel.org, dri-devel@lists.freedesktop.org, gary@garyguo.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu,
 tzimmermann@suse.de
Subject: Re: [PATCH 1/3] rust: alloc: add Vec::truncate method
Date: Sat, 15 Mar 2025 06:15:11 -0500
Message-ID: <20250315111511.107047-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D8GRAC8YQIVC.2LS1EIIIRZU3I@proton.me>
References: <D8GRAC8YQIVC.2LS1EIIIRZU3I@proton.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 15 Mar 2025 11:49:29 +0000
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

On Sat, Mar 15, 2025 at 10:09:26AM +0000, Benno Lossin wrote:
> On Sat Mar 15, 2025 at 3:42 AM CET, Andrew Ballance wrote:
> > implements the equivalent to the std's Vec::truncate
> > on the kernel's Vec type.
> >
> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> > ---
> >  rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index ae9d072741ce..75e9feebb81f 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -452,6 +452,42 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
> >  
> >          Ok(())
> >      }
> > +
> > +    /// Shortens the vector, setting the length to `len` and drops the removed values.
> > +    /// If `len` is greater than or equal to the current length, this does nothing.
> > +    ///
> > +    /// This has no effect on the capacity and will not allocate.
> > +    /// # Examples
> > +    /// ```
> > +    /// let mut v = kernel::kvec![1, 2, 3]?;
> > +    /// v.truncate(1);
> > +    /// assert_eq!(v.len(), 1);
> > +    /// assert_eq!(&v, &[1]);
> > +    ///
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn truncate(&mut self, len: usize) {
> > +        if len >= self.len() {
> > +            return;
> > +        }
> > +
> > +        // [new_len, len) is guaranteed to be valid because [0, len) is guaranteed to be valid
> > +        let drop_range = len..self.len();
> > +
> > +        // SAFETY:
> > +        // we can safely ignore the bounds check because we already did our own check
> > +        let ptr: *mut [T] = unsafe { self.get_unchecked_mut(drop_range) };
> 
> What's this `get_unchecked_mut` method, I don't see it in `rust-next` or
> `alloc-next`.

Vec derefs into a slice which implements get_uncheked_mut
https://rust.docs.kernel.org/next/kernel/alloc/kvec/struct.Vec.html#method.get_unchecked_mut

> > +
> > +        // SAFETY:
> > +        // it is safe to shrink the length because the new length is
> > +        // guaranteed to be less than the old length
> 
> Please take a look at the documentation of `set_len`, in the safety
> section you'll find what you need to justify here.
> 
> > +        unsafe { self.set_len(len) };
> > +
> > +        // SAFETY:
> 
> A couple points missing:
> - why is the pointer valid?
> 
> > +        // - the dropped values are valid `T`s
> > +        // - we are allowed to invalidate [new_len, old_len) because we just changed the len
> 
> This should justify why the value will never be accessed again.
> 

I will fixup the safety comments for the v2. Thanks.

> ---
> Cheers,
> Benno
> 
> > +        unsafe { ptr::drop_in_place(ptr) };
> > +    }
> >  }
> >  
> >  impl<T: Clone, A: Allocator> Vec<T, A> {
> 
> 
