Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88904B55EF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF6210E1DB;
	Mon, 14 Feb 2022 16:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F7B10E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:19:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 313FD614A8;
 Mon, 14 Feb 2022 16:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D2AC340E9;
 Mon, 14 Feb 2022 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644855560;
 bh=th0fXVELAWxtqvQc+7VEAegBNHdOQZZG+5CClQGCCpE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=bqYjuZS4Gx1PswtxTOd7iMkJKhY53kJsJKAhg3zt1mqrw54HrKBm/UFSojXyU55BV
 n2IHZqNGpVtPu4xxLMSmjecC6c/FoNBVl0rscVcnButFTqBj1y7oAym5TswVj7Q3Xx
 gwWrRRwixzJT7nQGlwsPzsRBV+0K3nIoS8O/TnqFBJZXpBQVwNTH1sBpgCoSYcatfc
 BM8JS5r3eSrB8RUvjFdB1WTU5NbI21uXLL3o5HTfdGiUYx518rPXZ7/na8IRFePVjg
 udEqaGXyBn6Rt1a4oXE3+CQaJy9y2g6zyhWeJNOe4FIEII8iy2ShWPIbwKUTdV1qFD
 /KC7vj4kNNmgg==
Date: Mon, 14 Feb 2022 10:19:18 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v8 00/10] vgaarb: Rework default VGA device selection
Message-ID: <20220214161918.GA11115@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a06a30-f479-df9f-980c-b789f0f26ce9@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 04:46:33PM +0100, Maarten Lankhorst wrote:
> Hey,
>  
> Op 31-01-2022 om 23:23 schreef Bjorn Helgaas:
> > [+to Maarten, Maxime, Thomas; beginning of thread:
> > https://lore.kernel.org/r/20220106000658.243509-1-helgaas@kernel.org]
> >
> > On Wed, Jan 05, 2022 at 06:06:48PM -0600, Bjorn Helgaas wrote:
> >> From: Bjorn Helgaas <bhelgaas@google.com>
> >>
> >> Current default VGA device selection fails in some cases because
> >> part of it is done in the vga_arb_device_init() subsys_initcall,
> >> and some arches enumerate PCI devices in pcibios_init(), which
> >> runs *after* that.
> >
> > Where are we at with this series?  Is there anything I can do to
> > move it forward?
> 
> I'm afraid that I don't understand the vga arbiter or the vga code
> well enough to review.
> 
> Could you perhaps find someone who could review?
> 
> I see Chen wrote some patches and tested, so perhaps they could?

Hi Maarten,

Huacai Chen did provide his Reviewed-by (although as he noted, the
content initially came from him anyway and my contribution was mainly
rearranging things into separate patches for each specific case).

Anything else we can to do help here?

Bjorn
