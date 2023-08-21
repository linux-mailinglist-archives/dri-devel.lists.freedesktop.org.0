Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0649E7826AC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B4510E221;
	Mon, 21 Aug 2023 09:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A099710E221;
 Mon, 21 Aug 2023 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692611877; x=1724147877;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=RPCj/Hzk+FNFieDTs98XdiamY2Vzer2lf8C6QZtmz6c=;
 b=NDUO3xuIwl647TsgdS3aacYnUuWm19ACY2YIXYYatv1GV6osTo2uiNTV
 m8LsbPryurqK8IDQDtz0JjlXouCznOGudxHaxkSzg2bktgEhhitPyGjZa
 /rJ2ezTn1+99/CV/m1kx79StgoJyMbutvp95Jq8Q9zqbfdQGGYJw1M40H
 ouwQQL1lyMjhY9xqdubbtbzi+eB4VDvOT8VQclK2T0RtkMDWKP221Mevq
 cNVKDBsGM+ra92g6z9Rfx3uO27ct88L32aWIEv+RvERqxyPd3aRGxLHVK
 hyOsFDByyja0cLfad7ozmAkYD8Hh3+MgqkQC+m/xCjmeJGnYCDxWSSwnc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="437470465"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="437470465"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 02:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="765304744"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="765304744"
Received: from nsnaveen-mobl.gar.corp.intel.com ([10.252.54.252])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 02:57:46 -0700
Date: Mon, 21 Aug 2023 12:57:39 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v5 06/11] drm/radeon: Use RMW accessors for changing LNKCTL
In-Reply-To: <BL1PR12MB5144FF7542426AB3B4C66082F71BA@BL1PR12MB5144.namprd12.prod.outlook.com>
Message-ID: <674c5c35-9ce7-a144-719d-206ff2c16e8f@linux.intel.com>
References: <20230717120503.15276-1-ilpo.jarvinen@linux.intel.com>
 <20230717120503.15276-7-ilpo.jarvinen@linux.intel.com>
 <BL1PR12MB5144FF7542426AB3B4C66082F71BA@BL1PR12MB5144.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-229501122-1692611873=:1744"
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
 =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 =?ISO-8859-15?Q?Jonas_Dre=DFler?= <verdre@v0yd.nl>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-229501122-1692611873=:1744
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 18 Aug 2023, Deucher, Alexander wrote:

> [Public]
> 
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

These were added without Cc stable into pci.git/pcie-rmw.

-- 
 i.

--8323329-229501122-1692611873=:1744--
