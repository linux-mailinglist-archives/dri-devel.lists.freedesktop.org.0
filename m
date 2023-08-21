Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C87830B5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 21:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D2B10E099;
	Mon, 21 Aug 2023 19:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086A410E070;
 Mon, 21 Aug 2023 19:13:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7228962D24;
 Mon, 21 Aug 2023 19:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95652C433C8;
 Mon, 21 Aug 2023 19:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692645178;
 bh=OOZ4kFfEqbg85LKt+jWFAAcHUoGmUO/aZufE4dL7PEw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BHuUivl6+HAwmJnI+mMIejsRhIAqOV+IeMIteekVUPdu51rGqJOihfDqrVly55315
 Uq3knRP9sn8+UBW+5qkLefayRIJz5XJsNB6puUHe6PLtBa2vnQtgIdyVXVRs2vjxGu
 f1+F3RSV7mDp6N+faLdEhmhZeg8/WpLVhnykRg0Hb6HjIYvoZfO8NjUcKXfIrHGh3X
 y/s4W6cAaMryAXuYZqEkLZ3udYwbmufJyj4LlcU3vm0uUgm97DnFaGyDbdI2PmYIle
 mGzEYnKMR5yaFYDIF3W+S72RxuU9hHu8LvgkpoTjBGUVRovZ2wx3Rjwh4mpdclx6FT
 1qhdSUD+JoUoQ==
Date: Mon, 21 Aug 2023 14:12:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v5 06/11] drm/radeon: Use RMW accessors for changing LNKCTL
Message-ID: <20230821191256.GA365126@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5144FF7542426AB3B4C66082F71BA@BL1PR12MB5144.namprd12.prod.outlook.com>
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
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonas =?iso-8859-1?Q?Dre=DFler?= <verdre@v0yd.nl>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 04:12:57PM +0000, Deucher, Alexander wrote:
> > -----Original Message-----
> > From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Monday, July 17, 2023 8:05 AM
> > To: linux-pci@vger.kernel.org; Bjorn Helgaas <bhelgaas@google.com>; Lorenzo
> > Pieralisi <lorenzo.pieralisi@arm.com>; Rob Herring <robh@kernel.org>;
> > Krzysztof Wilczyński <kw@linux.com>; Emmanuel Grumbach
> > <emmanuel.grumbach@intel.com>; Rafael J . Wysocki <rafael@kernel.org>;
> > Heiner Kallweit <hkallweit1@gmail.com>; Lukas Wunner <lukas@wunner.de>;
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; amd-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Cc: Dean Luick <dean.luick@cornelisnetworks.com>; Jonas Dreßler
> > <verdre@v0yd.nl>; Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>;
> > stable@vger.kernel.org
> > Subject: [PATCH v5 06/11] drm/radeon: Use RMW accessors for changing
> > LNKCTL
> >
> > Don't assume that only the driver would be accessing LNKCTL. ASPM policy
> > changes can trigger write to LNKCTL outside of driver's control.
> > And in the case of upstream bridge, the driver does not even own the device
> > it's changing the registers for.
> >
> > Use RMW capability accessors which do proper locking to avoid losing
> > concurrent updates to the register value.
> >
> > Fixes: 8a7cd27679d0 ("drm/radeon/cik: add support for pcie gen1/2/3
> > switching")
> > Fixes: b9d305dfb66c ("drm/radeon: implement pcie gen2/3 support for SI")
> > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Cc: stable@vger.kernel.org
> 
> For this and the amdgpu patch:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> I'm not sure if this is stable material however.  Is there some issue today?

Added your ack, thanks!  I dropped the stable tag on the whole series.

Bjorn
