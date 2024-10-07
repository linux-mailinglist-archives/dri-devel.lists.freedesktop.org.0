Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE97992C6F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 14:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1992110E1FF;
	Mon,  7 Oct 2024 12:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jt1ITEVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509C210E1FF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 12:58:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9A72DA400CF;
 Mon,  7 Oct 2024 12:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A63C4CECC;
 Mon,  7 Oct 2024 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728305898;
 bh=C4OqaWbGRVkYzQR9RiFB6m8LHGSEyaH+eYqc7Bqmvf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jt1ITEVsdzygkMINmqbs4taMR9u8c4H7zDVLUDAVcpw5SxwsnHVCWi5aKakLXviTx
 vZnPq/JXHRF4a4pFYLT2NKX4qndCGfRT0oe4DQV1tNZ+Prjea/HBhQH4mL77VfXjSA
 QKYFc2ckfk5jPS47V8Z3R+jafvvdlykbABpgt3itsEEeubBmDiVvjCuxWPJozysGdI
 twktMqiGDL7RB4QNlnouAuxbtDHPC+MXz6YmlTLKVuKHpi1JnoRoQOs53l8dKu1dEA
 zKec6CMpSKKTfh/P3bYVxldkGZTWN8+oQhcxZwbFfgPeL64d8xZLgKKLjuCrVRFkzh
 lReJZ+dryZAcQ==
Date: Mon, 7 Oct 2024 13:58:13 +0100
From: Lee Jones <lee@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, jelle@vdwaa.nl, jikos@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <20241007125813.GA17897@google.com>
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
 <20241003075927.GI7504@google.com>
 <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
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

On Fri, 04 Oct 2024, Werner Sembach wrote:

> 
> Am 03.10.24 um 09:59 schrieb Lee Jones:
> > On Wed, 02 Oct 2024, Werner Sembach wrote:
> > 
> > > Hi,
> > > 
> > > Am 02.10.24 um 14:52 schrieb Lee Jones:
> > > > On Fri, 27 Sep 2024, Werner Sembach wrote:
> > > > 
> > > > > Hi,
> > > > > first revision integrating Armins feedback.
> > > > > 
> > > > > Stuff I did not yet change and did not comment on previously:
> > > > > - Still have to ask Christoffer why the mutex is required
> > > > > - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
> > > > > - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
> > > > > 
> > > > > Let me know if my reasoning is flawed
> > > > Use `git format-patch`'s --annotate and --compose next time please.
> > > > 
> > > I did but --compose does not automatically insert the subject line, that's
> > > why i copied it but forgot to change it to 0/1
> > > 
> > > Sorry for the flawed subject line
> > And the missing diff-stat?
> > 
> Also not automatically created by git send-email --compose. is there a flag
> I'm not aware of?

As above.  I use "--annotate --compose".  See if that works.

-- 
Lee Jones [李琼斯]
