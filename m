Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34542D2631
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58716E9C9;
	Tue,  8 Dec 2020 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0206E8A8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 19:28:05 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p12so10248294qtp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 11:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v3QgAlPsbwF8UgttG1BQwndoXM5UWF7rYLhDWgqTcAo=;
 b=YrX/hht9Lmvjo/zfsC6XKDCBN4R4gbKwzoAKOilZlQhn7HDa3NQXQkL0b3oGSDsy4k
 pH++h4TpKxJPVTjCNUS/9QmRYfNnI7uCN9sFYEGwZPyCy7EMySg6GzEm0lh6h0uTxE7Q
 09i7UgLqD7gseDt8hmiUybWLpjfzlqc4CXRsblOzx4HC27ikvmDt6oAo/N8mnvlg6vLS
 TzibuoaOix1cE3FWRCoVtfaMnbQgveRZZsGjo454qEFfbgf6ujUxS92NCrl3mkxiP6Ar
 mXTT6P3aASuSwn7ShD7r9SLifwe3PIiAzb3QeLL1UX2tNH/ECVzziHkFAI0t51cFB2wl
 FiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v3QgAlPsbwF8UgttG1BQwndoXM5UWF7rYLhDWgqTcAo=;
 b=klTPKZRIUNygF/4QGUBe3jUnC8AWUaJj9XXJfNxRUNPCvqVm9AXnAmUBoSpyQJmyAy
 O4x6xErfYesllBeVbDieGnBko9OydzJXqO+M1CJia9BMFe0g0o2B+Jt82mqF9GTjfr5d
 nYfHmEi1TCdrrOZd8oMyTZV/h/l5aLPlSZtIIwkUs06P0NPdPRGFUsLxZSGLSt57U2V4
 P1MtPX8FmyY/6hCekj7YAZJXdngin6fzosHCHBWqVegJdA4HiQkJrajD2RP0whkN6LTM
 NEXu9RIWB7PooBiFQb5mESntmjwrzuyn23WFfR3ESTXF7erBBEcDEkoHeGDK27vO+4go
 6/gA==
X-Gm-Message-State: AOAM530F6l1vc+Oz+Ho5FlCrN9r+00fgb3/Ll31GoZBtDYmfq3pto4Uj
 CFAE9NJ0MI5BFny/kvYIHbIHBA==
X-Google-Smtp-Source: ABdhPJxxnyKPy9Vcras0kbGYLZWTk+L+RsBCWMBKbQ+cMI81iSEB3CFPTmj2Cp6J0/ZkbylyCKnixA==
X-Received: by 2002:ac8:6b54:: with SMTP id x20mr25374730qts.170.1607369284968; 
 Mon, 07 Dec 2020 11:28:04 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id v5sm5648146qkv.64.2020.12.07.11.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 11:28:03 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kmMB1-007OGx-1k; Mon, 07 Dec 2020 15:28:03 -0400
Date: Mon, 7 Dec 2020 15:28:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 3/4] tpm_tis: Disable interrupts if interrupt storm
 detected
Message-ID: <20201207192803.GH5487@ziepe.ca>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-4-jsnitsel@redhat.com>
 <87tusy7n3b.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tusy7n3b.fsf@nanos.tec.linutronix.de>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: intel-gfx@lists.freedesktop.org, Jerry Snitselaar <jsnitsel@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Hans de Goede <hdegoede@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 06, 2020 at 08:26:16PM +0100, Thomas Gleixner wrote:
> Just as a side note. I was looking at tpm_tis_probe_irq_single() and
> that function is leaking the interrupt request if any of the checks
> afterwards fails, except for the final interrupt probe check which does
> a cleanup. That means on fail before that the interrupt handler stays
> requested up to the point where the module is removed. If that's a
> shared interrupt and some other device is active on the same line, then
> each interrupt from that device will call into the TPM code. Something
> like the below is needed.
> 
> Also the X86 autoprobe mechanism is interesting:
> 
> 	if (IS_ENABLED(CONFIG_X86))
> 		for (i = 3; i <= 15; i++)
> 			if (!tpm_tis_probe_irq_single(chip, intmask, 0, i))
> 				return;
> 
> The third argument is 'flags' which is handed to request_irq(). So that
> won't ever be able to probe a shared interrupt. But if an interrupt
> number > 0 is handed to tpm_tis_core_init() the interrupt is requested
> with IRQF_SHARED. Same issue when the chip has an interrupt number in
> the register. It's also requested exclusive which is pretty likely
> to fail on ancient x86 machines.

It is very likely none of this works any more, it has been repeatedly
reworked over the years and just left behind out of fear someone needs
it. I've thought it should be deleted for a while now.

I suppose the original logic was to try and probe without SHARED
because a probe would need exclusive access to the interrupt to tell
if the TPM was actually the source, not some other device.

It is all very old and very out of step with current thinking, IMHO. I
skeptical that TPM interrupts were ever valuable enough to deserve
this in the first place.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
