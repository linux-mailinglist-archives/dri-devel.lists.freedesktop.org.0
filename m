Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BDF78FEC0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F4A10E7E2;
	Fri,  1 Sep 2023 14:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05F010E7E2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 14:10:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 381EAT2Z128966;
 Fri, 1 Sep 2023 09:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1693577429;
 bh=+7sXq+fxD8RqvTOAkh8ERHd7yZVuwnyB/g/S8mpk35M=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=F9h9GYkf028zt9HeaWho2UYeO5SIEXcmaLAVG4rzWsSPT2wi45yD2D88bcPBQbQp+
 8ubGcHFy7bYic2qbWtmJ1ArhG3gdlMOTfnIqddbqsgseWwG0qgy08tDoTPvvi+rw4p
 CYLCfYs9WPDDptQe5PrO3PalVvnbJS56jDyNYqFo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 381EAT5X035592
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Sep 2023 09:10:29 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Sep 2023 09:10:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Sep 2023 09:10:29 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 381EAT5J014096;
 Fri, 1 Sep 2023 09:10:29 -0500
Date: Fri, 1 Sep 2023 09:10:29 -0500
From: Nishanth Menon <nm@ti.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH v2] drm: bridge: it66121: Fix invalid connector dereference
Message-ID: <20230901141029.4vk2hfm2ckxgh4yp@ecard>
References: <20230901-it66121_edid-v2-1-aa59605336b9@ti.com>
 <fe786b37-a442-7230-305c-c8bca7cffa2a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fe786b37-a442-7230-305c-c8bca7cffa2a@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Jai Luthra <j-luthra@ti.com>,
 devarsht@ti.com, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Helen Koike <helen.koike@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Nicolas Belin <nbelin@baylibre.com>, "Andy.Hsieh" <Andy.Hsieh@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17:01-20230901, Aradhya Bhatia wrote:
> On 01-Sep-23 15:01, Jai Luthra wrote:
> > Fix the NULL pointer dereference when no monitor is connected, and the
> > sound card is opened from userspace.
> > 
> > Instead return an empty buffer (of zeroes) as the EDID information to
> > the sound framework if there is no connector attached.
> > 
> > Fixes: e0fd83dbe924 ("drm: bridge: it66121: Add audio support")
> > Reported-by: Nishanth Menon <nm@ti.com>
> > Closes: https://lore.kernel.org/all/20230825105849.crhon42qndxqif4i@gondola/
> > Reviewed-by: Helen Koike <helen.koike@collabora.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> 
> Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>
> 

Tested-by: Nishanth Menon <nm@ti.com>

Log (beagleplay): https://gist.github.com/nmenon/17fea9316cbcc5ee47597a39fa5e2d6f

Tested on 99d99825fc07 (origin/master, origin/HEAD) Merge tag 'nfs-for-6.6-1' of git://git.linux-nfs.org/projects/anna/linux-nfs

Could we get this merged for rc1 cycle?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
