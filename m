Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A4499536E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 17:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18CF10E585;
	Tue,  8 Oct 2024 15:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FDPxO4xK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258DE10E588
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 15:33:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E7A05C5CFE;
 Tue,  8 Oct 2024 15:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46229C4CEC7;
 Tue,  8 Oct 2024 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728401586;
 bh=ouKxO2/IjmSZBjM+1Fc7/vlcAqQ4Vq4MlFM+ug7u5Ls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FDPxO4xKf5YTLi8ThQ5IZbwJ0MIuwcFrt1RTRpClUWqh3vmZaEuRd7txTc4759o9Y
 w1aIsLD0U6dwsSG3ZtFIw0+BfkdWsnhsN8keW436leHeHRL2UAWOdN1IsxMSzbYHJk
 /QE9RukogSs8D39YaxIrEssFYKJBmOQCcDXGRuPQn+S5p8ApWd3HlOuczSnjJ9hPBi
 pGxKZsOKoMtvhyBzg5D/tivcnnuBtMTqTUvlOjR9d8Vwvqzbo540Qvjvf+YoxdDAQk
 rZ+qz4acRRW8zGVEXbSwdsCyh7thp9luSLkkVwDcEW/GMu2SYIVNvuLE+c0V3bJFiR
 DnieADb2SODyQ==
Date: Tue, 8 Oct 2024 16:33:00 +0100
From: Lee Jones <lee@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, jelle@vdwaa.nl, jikos@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <20241008153300.GA11264@google.com>
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
 <20241003075927.GI7504@google.com>
 <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
 <20241007125813.GA17897@google.com>
 <86936252-f3b6-46c2-9244-ce0cfebf3c42@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86936252-f3b6-46c2-9244-ce0cfebf3c42@tuxedocomputers.com>
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

On Mon, 07 Oct 2024, Werner Sembach wrote:

> 
> Am 07.10.24 um 14:58 schrieb Lee Jones:
> > On Fri, 04 Oct 2024, Werner Sembach wrote:
> > 
> > > Am 03.10.24 um 09:59 schrieb Lee Jones:
> > > > On Wed, 02 Oct 2024, Werner Sembach wrote:
> > > > 
> > > > > Hi,
> > > > > 
> > > > > Am 02.10.24 um 14:52 schrieb Lee Jones:
> > > > > > On Fri, 27 Sep 2024, Werner Sembach wrote:
> > > > > > 
> > > > > > > Hi,
> > > > > > > first revision integrating Armins feedback.
> > > > > > > 
> > > > > > > Stuff I did not yet change and did not comment on previously:
> > > > > > > - Still have to ask Christoffer why the mutex is required
> > > > > > > - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
> > > > > > > - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
> > > > > > > 
> > > > > > > Let me know if my reasoning is flawed
> > > > > > Use `git format-patch`'s --annotate and --compose next time please.
> > > > > > 
> > > > > I did but --compose does not automatically insert the subject line, that's
> > > > > why i copied it but forgot to change it to 0/1
> > > > > 
> > > > > Sorry for the flawed subject line
> > > > And the missing diff-stat?
> > > > 
> > > Also not automatically created by git send-email --compose. is there a flag
> > > I'm not aware of?
> > As above.  I use "--annotate --compose".  See if that works.
> > 
> nope, the cover letter has no change summary with these options

Oh, my mistake.  I'm getting confused with `git send-email`.

You want this:

  `mkdir patches && git format-patch --cover-letter -M -o patches`

-- 
Lee Jones [李琼斯]
