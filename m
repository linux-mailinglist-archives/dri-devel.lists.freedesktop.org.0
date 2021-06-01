Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E003978D8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 19:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603F06EABD;
	Tue,  1 Jun 2021 17:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF376EABD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 17:12:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A324613AE;
 Tue,  1 Jun 2021 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622567549;
 bh=KX4h2s+GpBEPaONxtUBAeF7ApM3lm3gJ37zgQbJoER4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U13gRsJrqMYTd3n8+PgWIMmM5FGFEYcPoELZKPW8GOEhYZpQo8ajneIkQV2I10LSP
 Bdw1OsDCshQpxBRiUAy8yBX+TOAYv3Im1Q/mDqqU6U8y9LFkaLkK/6yMq3rU4OjFXV
 So0779IgwcouAy0D+DmBemDxtDAxb6xuVk2a/YHQ=
Date: Tue, 1 Jun 2021 19:12:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
Message-ID: <YLZqe14Lf2+5Lbf3@kroah.com>
References: <20210528082607.2015145-1-chenhuacai@loongson.cn>
 <YLZYuM6SepbeLcI7@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLZYuM6SepbeLcI7@phenom.ffwll.local>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@linux.ie>,
 Xuefeng Li <lixuefeng@loongson.cn>, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 05:56:40PM +0200, Daniel Vetter wrote:
> On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > may fail to select the default VGA device. Since vga_arb_device_init()
> > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > both wrapped by subsys_initcall(), their sequence is not assured. So, we
> > use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> > device_init().

Trying to juggle levels like this always fails if you build the code as
a module.

Why not fix it properly and handle the out-of-order loading by returning
a "deferred" error if you do not have your resources yet?

thanks,

greg k-h
