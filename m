Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FF2D0C2C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D9C89F1B;
	Mon,  7 Dec 2020 08:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B951889FF6;
 Sun,  6 Dec 2020 17:54:46 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607277285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07War4FnpacwFh1YaF/5joszhDH3pMW7WlC56is9w4I=;
 b=q1LwrbiDzWFlcihybyILl6urNUUlW3xoBHDW2gCbvkfnkEPMrsJZsZxh/u3wITbzLbrzsP
 muFiLKraQSlM6tmzlPpbkAra17ztgm20WOUD8w3h4bcn5gRFbnzKyPIjnEPubhplt2u4fx
 9Q+sEZJLg4KDNIj8Dwm+rrY7hUHRnJEu8dHN0lJLxPoLarEd6FJ3y0rzv7EllFhJCToaJU
 te848un/yV8u6K3ZeXL94SlrBnMb4v53QoV3v0yVtOJ2XNMOIo17w+IjymH+AeTP7kjaWJ
 9lO2rzwwoGDJAkNSoSmcP98uT/dNDppnGFTEHkThFMH5lzXPtOdoIT5Asm8Cjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607277285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=07War4FnpacwFh1YaF/5joszhDH3pMW7WlC56is9w4I=;
 b=yKxLEMiFuaSYO1WtTlFlvn2N71he2D9R3O/UuYqLb68HVEC9MGqjskvFkXhbXCAC/YUhO3
 Ya9c1fGGjdMVKDCA==
To: Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] irq: export kstat_irqs
In-Reply-To: <20201205014340.148235-2-jsnitsel@redhat.com>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-2-jsnitsel@redhat.com>
Date: Sun, 06 Dec 2020 18:54:44 +0100
Message-ID: <87y2ia7rbv.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: kernel test robot <lkp@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jerry,

On Fri, Dec 04 2020 at 18:43, Jerry Snitselaar wrote:

The proper prefix is 'genirq:' git log kernel/irq/irqdesc.c would have
told you. 

> To try and detect potential interrupt storms that
> have been occurring with tpm_tis devices it was suggested
> to use kstat_irqs() to get the number of interrupts.
> Since tpm_tis can be built as a module it needs kstat_irqs
> exported.

I'm not really enthused about exporting this without making it at least
safe. Using it from an interrupt handler is obviously safe vs. concurrent
removal, but the next driver writer who thinks this is cool is going to
get it wrong for sure.

Though I still have to figure out what the advantage of invoking a
function which needs to do a radix tree lookup over a device local
counter is just to keep track of this.

I'll reply on the TPM part of this as well.

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
