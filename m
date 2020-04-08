Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5876C1A1C2D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED846E968;
	Wed,  8 Apr 2020 06:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A6B6E05A;
 Wed,  8 Apr 2020 00:40:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6aa8cdd8;
 Wed, 8 Apr 2020 00:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=pVZbz2BQiRw2Mi3KrA8/Yoa+8c8=; b=3TcYGn
 Yj01O9WWE/XKUXtg4fDPrqV69tp2+JqTx4aclm3f7Q46GJY//9rcpEoQYPOrMPEs
 drxICokhgcw03fi/N93H+fnRqF60Pw9tZOfw91moZCYnS+h/DVrLMrVYwqUY5h2J
 KcHrfHEgb2+So579x6808LkgeC1SO47sPFYOmEQeWKulCmDJF3ituSwsLFs7Rz6y
 fKlTepo+50ybdmQfTqYvrVAjKYMP76uR5SX4hMVI3TccA9MfTgBM/AZpF76+XGVf
 25VyWRylR6eC/Sh8eYIOhskkPxE1Sc087qrux8s5yk+he4mJcdPtDhzhwlQq8OoZ
 M2uVtWOhuOzeeweg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2cfff373
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 8 Apr 2020 00:31:19 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id r5so5123339ilq.6;
 Tue, 07 Apr 2020 17:40:18 -0700 (PDT)
X-Gm-Message-State: AGi0Puay+MEs6AfqaRUtO3LD7LdWrNOkWs2o7GIso0TgDvx8UIOxfszs
 VGz9Cu5/39E2GpNUK+keaFs/xaFy4bn/sSnrTCo=
X-Google-Smtp-Source: APiQypKf0JHKHozVl5Ekm5/yscJCcYicF7LPFAQcfWzPigdyRdaNvh62EnA/SB13ZFPsDX4AC1SNpbWwZzYtTjPd4Ts=
X-Received: by 2002:a92:798f:: with SMTP id u137mr5578644ilc.231.1586306418050; 
 Tue, 07 Apr 2020 17:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200328000422.98978-1-Jason@zx2c4.com>
 <158538232569.25292.15795048542441478192@build.alporthouse.com>
In-Reply-To: <158538232569.25292.15795048542441478192@build.alporthouse.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Apr 2020 18:40:07 -0600
X-Gmail-Original-Message-ID: <CAHmME9rQQjMY3+CxmUO3Yp+hHaOyfyORrPbBV5jBqVEZFXwecg@mail.gmail.com>
Message-ID: <CAHmME9rQQjMY3+CxmUO3Yp+hHaOyfyORrPbBV5jBqVEZFXwecg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: check to see if the FPU is available before
 using it
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Wed, 08 Apr 2020 06:59:23 +0000
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
Cc: intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 1:59 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Jason A. Donenfeld (2020-03-28 00:04:22)
> > It's not safe to just grab the FPU willy nilly without first checking to
> > see if it's available. This patch adds the usual call to may_use_simd()
> > and falls back to boring memcpy if it's not available.
>
> These instructions do not use the fpu, nor are these registers aliased
> over the fpu stack. This description and the may_use_simd() do not
> look like they express the right granularity as to which simd state are
> included

Most of the time when discussing vector instructions in the kernel
with x86, "FPU" is used to denote the whole shebang, because of
similar XSAVE semantics and requirements with actual floating point
instructions and SIMD instructions. So when I say "grab the FPU", I'm
really referring to the act of messing with any registers that aren't
saved and restored by default during context switch and need the
explicit marking for XSAVE to come in -- the kernel_fpu_begin/end
calls that you already have.

With regards to the granularity here, you are in fact touching xmm
registers. That means you need kernel_fpu_begin/end, which you
correctly have. However, it also means that before using those, you
should check to see if that's okay by using the may_use_simd()
instruction.

Now you may claim that at the moment
may_use_simd()-->irq_fpu_usable()-->(!in_interrupt() ||
interrupted_user_mode() || interrupted_kernel_fpu_idle()) always holds
true, and you're a keen follower of the (recently changed) kernel fpu
x86 semantics in case those conditions change, and that your driver is
so strictly written that you know exactly the context this fancy
memcpy will run in, always, and you'll never deviate from it, and
therefore it's okay to depart from the rules and omit the check and
safe fallback code. But c'mon - i915 is complex, and mixed context
bugs abound, and the rules for using those registers might in fact
change without you noticing.

So why not apply this to have a safe fallback for when the numerous
assumptions no longer hold? (If you're extra worried I suppose you
could make it a `if (WARN_ON(!may_use_simd()))` instead or something,
but that seems like a bit much.)

> Look at caller, return the error and let them decide if they can avoid
> the read from WC, which quite often they can. And no, this is not done
> from interrupt context, we would be crucified if we did.

Ahh, now, reading this comment here I realize maybe I've misunderstood
you. Do you mean to say that checking for may_use_simd() is a thing
that you'd like to do after all, but you don't like it falling back to
slow memcpy. Instead, you'd like for the code to return an error
value, and then caller can just optionally skip the memcpy under some
complicated driver circumstances?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
