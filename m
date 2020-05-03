Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B31C3388
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 09:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3226E334;
	Mon,  4 May 2020 07:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FF7898A4;
 Sun,  3 May 2020 20:35:16 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18562c7a;
 Sun, 3 May 2020 20:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=z5Do7NyDKuHfMJ/mAldD8G6RJ60=; b=e/VPTE
 L65O0OQ1o9jg74xixPwpiZoUamL3h2sC5/EZ3eitxMEVhQ72lh4vZw82PPFwwIQn
 3Ft31VWYR1iszDXqTIVyksn3ccsxfWJSY4CKtAMu0ASxTaJPkDeQ8Z3SXGV/ZUdr
 7acbxP5Upx9fzjHZqlWrrWDLufLJWOlYdRZy/FjCR+1w0EyNI3RLST7C9U8Se01L
 12Luica0tiD3Cpvy0xD3DxX/NIBBX1ny1Jj5ymBjl4HTzVr+G2YkzBCv0qMEegzu
 7aFEViPQ26u858asbgXP8YKOcidXe2teSnLC6Q5wddff/R3mH8tsm7nkGmxsGM4s
 Frhisbmv1xPsyHaw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9a819733
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 3 May 2020 20:22:56 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id f82so9395418ilh.8;
 Sun, 03 May 2020 13:35:15 -0700 (PDT)
X-Gm-Message-State: AGi0PubwKeuSfA+SFCDwjNr0rYbhRioShr9OcABjh4GSV3kHkKi24p5B
 UyPulfHyjr2llVUuO5yp5C5/5+Xe5Zsau/ON7CY=
X-Google-Smtp-Source: APiQypIUEcNyFcnsHFVMbKCh4WfUv2KcwZdBYHy02yKWsXCGZThmATTnJ/z6CY+STZVhkP88X18Q9XG3mHkF5ndh8mY=
X-Received: by 2002:a92:5c82:: with SMTP id d2mr13749187ilg.231.1588538114849; 
 Sun, 03 May 2020 13:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200430221016.3866-1-Jason@zx2c4.com>
 <158853782127.10831.11598587258154009671@build.alporthouse.com>
In-Reply-To: <158853782127.10831.11598587258154009671@build.alporthouse.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 3 May 2020 14:35:03 -0600
X-Gmail-Original-Message-ID: <CAHmME9o51exzeeV6C95-9b=608-qFWag2X_jPTYEmuBUtUU3WQ@mail.gmail.com>
Message-ID: <CAHmME9o51exzeeV6C95-9b=608-qFWag2X_jPTYEmuBUtUU3WQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: check to see if SIMD registers are available
 before using SIMD
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Mon, 04 May 2020 07:17:19 +0000
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
Cc: Sebastian Siewior <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 3, 2020 at 2:30 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Jason A. Donenfeld (2020-04-30 23:10:16)
> > Sometimes it's not okay to use SIMD registers, the conditions for which
> > have changed subtly from kernel release to kernel release. Usually the
> > pattern is to check for may_use_simd() and then fallback to using
> > something slower in the unlikely case SIMD registers aren't available.
> > So, this patch fixes up i915's accelerated memcpy routines to fallback
> > to boring memcpy if may_use_simd() is false.
> >
> > Cc: stable@vger.kernel.org
>
> The same argument as on the previous submission is that we return to the
> caller if we can't use movntqda as their fallback path should be faster
> than uncached memcpy.

Oh, THAT's what you meant before. Okay, will follow up.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
