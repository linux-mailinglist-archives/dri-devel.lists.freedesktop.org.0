Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62D6870FA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 23:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAC510E1A4;
	Wed,  1 Feb 2023 22:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EB710E1A4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 22:30:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 375F6B821C8;
 Wed,  1 Feb 2023 22:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE91C433D2;
 Wed,  1 Feb 2023 22:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675290633;
 bh=zot7qOvxCoMuk3Wa7msvKuV8ZKjBUkCftR+hKbpMvKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=G6BGYj8GNN1wSIw5qe4+JxQaJlNBaLF4nV7u7LDHOCEUorpic/7/hdux1jfRK8GLi
 A06Jui8y/0k9u7PZfSQ/4XKzZHLAtiOB1JqkI779XfcWpCG16HNN0DcPQuNrfxlFmr
 WNl3b4rzTYeL+opzUO7mcOv4QNbOPwHELFYPCLXUhAMrqrE5HS6jfe2XihaXjeJFiN
 USV4kfR1Pj3w6nETSKBrEIqrKuHhaDYnVD0zdZ4f/T8nOW5TJxh3M5iXjVRjFapoYR
 LrnpN1j+KST+snypzKs/4c7W2iD/v8aP4baRDDE6/pOtKwNLta62Bc1WdWrd8NMcpd
 TgBKkJmvxp3zA==
Date: Wed, 1 Feb 2023 16:30:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [REGRESSION] [Bug 216859] New: PCI bridge to bus boot hang at
 enumeration
Message-ID: <20230201223032.GA1904036@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126121124.GA1258686@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Antonino Daplas <adaplas@gmail.com>, linux-pci@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Zeno R.R. Davatz" <zdavatz@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+cc Geert]

On Thu, Jan 26, 2023 at 06:11:24AM -0600, Bjorn Helgaas wrote:
> On Thu, Jan 12, 2023 at 02:08:19PM -0600, Bjorn Helgaas wrote:
> > On Wed, Dec 28, 2022 at 06:02:48AM -0600, Bjorn Helgaas wrote:
> > > On Wed, Dec 28, 2022 at 08:37:52AM +0000, bugzilla-daemon@kernel.org wrote:
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=216859
> > > 
> > > >            Summary: PCI bridge to bus boot hang at enumeration
> > > >     Kernel Version: 6.1-rc1
> > > > ...
> > > 
> > > > With Kernel 6.1-rc1 the enumeration process stopped working for me,
> > > > see attachments.
> > > > 
> > > > The enumeration works fine with Kernel 6.0 and below.
> > > > 
> > > > Same problem still exists with v6.1. and v6.2.-rc1
> 
> This is a regression between v6.0 and v6.1-rc1.  Console output during
> boot freezes after nvidiafb deactivates the VGA console.
> 
> It was a lot of work for Zeno, but we finally isolated this console
> hang to 145eed48de27 ("fbdev: Remove conflicting devices on PCI bus").
> 
> The system actually does continue to boot and is accessible via ssh, 
> but the console appears hung, at least for output.  More details in
> the bugzilla starting at
> https://bugzilla.kernel.org/show_bug.cgi?id=216859#c47 .

145eed48de27 ("fbdev: Remove conflicting devices on PCI bus") doesn't
say what the benefit is, or what would break if we reverted it.

Does anybody have any clues?  It would be nice to resolve this
regression before v6.2, which will probably be released 2/12 or 2/19.

Bjorn
