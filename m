Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653532D1A18
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 20:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798C16E8B0;
	Mon,  7 Dec 2020 19:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [IPv6:2607:fcd0:100:8a00::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0106E8AC;
 Mon,  7 Dec 2020 19:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9E3691280221;
 Mon,  7 Dec 2020 11:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1607371125;
 bh=k/Dd2cYrK28lrZ2qpukQjOHheuWRRxKEAwCopHSG05E=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=oWAhxkXjg6qRXeEQo0LSHh69muuIN//JVI5b76pfiGzTOFOSiSeerHyhJYkd13aLz
 vV+mTEvXUo0Xm5JPQSxmzIg7QGeHJurbI1samrBMs2MT85XklMBErr+1vtwRlr9RbH
 Mr1O+RF9DmddGa9u2oJf1yAmPZX/oNkCTcDqY9fQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id S1wle3Jxpi4d; Mon,  7 Dec 2020 11:58:45 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id E939C128021B;
 Mon,  7 Dec 2020 11:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1607371125;
 bh=k/Dd2cYrK28lrZ2qpukQjOHheuWRRxKEAwCopHSG05E=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=oWAhxkXjg6qRXeEQo0LSHh69muuIN//JVI5b76pfiGzTOFOSiSeerHyhJYkd13aLz
 vV+mTEvXUo0Xm5JPQSxmzIg7QGeHJurbI1samrBMs2MT85XklMBErr+1vtwRlr9RbH
 Mr1O+RF9DmddGa9u2oJf1yAmPZX/oNkCTcDqY9fQ=
Message-ID: <db6ccb14819c4c7a32e886eade144884fafc55fe.camel@HansenPartnership.com>
Subject: Re: [PATCH v3 3/4] tpm_tis: Disable interrupts if interrupt storm
 detected
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 07 Dec 2020 11:58:44 -0800
In-Reply-To: <20201207192803.GH5487@ziepe.ca>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-4-jsnitsel@redhat.com>
 <87tusy7n3b.fsf@nanos.tec.linutronix.de> <20201207192803.GH5487@ziepe.ca>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
 Hans de Goede <hdegoede@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-12-07 at 15:28 -0400, Jason Gunthorpe wrote:
> On Sun, Dec 06, 2020 at 08:26:16PM +0100, Thomas Gleixner wrote:
> > Just as a side note. I was looking at tpm_tis_probe_irq_single()
> > and that function is leaking the interrupt request if any of the
> > checks afterwards fails, except for the final interrupt probe check
> > which does a cleanup. That means on fail before that the interrupt
> > handler stays requested up to the point where the module is
> > removed. If that's a shared interrupt and some other device is
> > active on the same line, then each interrupt from that device will
> > call into the TPM code. Something like the below is needed.
> > 
> > Also the X86 autoprobe mechanism is interesting:
> > 
> > 	if (IS_ENABLED(CONFIG_X86))
> > 		for (i = 3; i <= 15; i++)
> > 			if (!tpm_tis_probe_irq_single(chip, intmask, 0,
> > i))
> > 				return;
> > 
> > The third argument is 'flags' which is handed to request_irq(). So
> > that won't ever be able to probe a shared interrupt. But if an
> > interrupt number > 0 is handed to tpm_tis_core_init() the interrupt
> > is requested with IRQF_SHARED. Same issue when the chip has an
> > interrupt number in the register. It's also requested exclusive
> > which is pretty likely to fail on ancient x86 machines.
> 
> It is very likely none of this works any more, it has been repeatedly
> reworked over the years and just left behind out of fear someone
> needs it. I've thought it should be deleted for a while now.
> 
> I suppose the original logic was to try and probe without SHARED
> because a probe would need exclusive access to the interrupt to tell
> if the TPM was actually the source, not some other device.
> 
> It is all very old and very out of step with current thinking, IMHO.
> I skeptical that TPM interrupts were ever valuable enough to deserve
> this in the first place.

For what it's worth, I agree.  Trying to probe all 15 ISA interrupts is
last millennium thinking we should completely avoid.  If it's not
described in ACPI then you don't get an interrupt full stop.

James


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
