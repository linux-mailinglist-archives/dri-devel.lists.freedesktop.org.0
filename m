Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2018498EAEF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6494A10E16A;
	Thu,  3 Oct 2024 07:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W6mdUDXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4F410E16A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 07:59:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C02875C47FB;
 Thu,  3 Oct 2024 07:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC58C4CEC7;
 Thu,  3 Oct 2024 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727942372;
 bh=u3bNdgpJwaXpOuU+BR68/X+PxfKFgX2pTYi7L9TKK/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W6mdUDXT9e8IqbzYfELf5HN2/SVc0ysG1Q9mV0aeT/+gi0V05qrYZ2vgG3XGlWUlN
 RGQsCzBFGyZiZjO1fhbeFPJkhPobwQIFf1nzCipamc/8T5qh26IssOyNMk1uGvFfw3
 oRKqpPzrBOXg28AAASckTrGv4Dpckxon0BApSzrqGMQzd2Ort8iFg00NuUQCvfGnWe
 c8opI30xybgTK60diIdFMknz6BLI/YQV2mGDF29QUumHKufS2lCSzsnvOFv92ks0u6
 PAkeZFMLVHjyxrA8C1cpbtoceBJX6ttaAEGbfHwZD9C5Yq05yC8N/7RwtVgP1+6NRD
 hCiwev3Org7kw==
Date: Thu, 3 Oct 2024 08:59:27 +0100
From: Lee Jones <lee@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, jelle@vdwaa.nl, jikos@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz, cs@tuxedo.de
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
Message-ID: <20241003075927.GI7504@google.com>
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
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

On Wed, 02 Oct 2024, Werner Sembach wrote:

> Hi,
> 
> Am 02.10.24 um 14:52 schrieb Lee Jones:
> > On Fri, 27 Sep 2024, Werner Sembach wrote:
> > 
> > > Hi,
> > > first revision integrating Armins feedback.
> > > 
> > > Stuff I did not yet change and did not comment on previously:
> > > - Still have to ask Christoffer why the mutex is required
> > > - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
> > > - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
> > > 
> > > Let me know if my reasoning is flawed
> > Use `git format-patch`'s --annotate and --compose next time please.
> > 
> I did but --compose does not automatically insert the subject line, that's
> why i copied it but forgot to change it to 0/1
> 
> Sorry for the flawed subject line

And the missing diff-stat?

-- 
Lee Jones [李琼斯]
