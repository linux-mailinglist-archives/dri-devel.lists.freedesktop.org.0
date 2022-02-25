Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF04C4310
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 12:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151E710E316;
	Fri, 25 Feb 2022 11:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A08C10E316
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 11:07:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6ED9160ECB;
 Fri, 25 Feb 2022 11:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584D7C340E7;
 Fri, 25 Feb 2022 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1645787260;
 bh=oLPnU/B1EfAHSSx2pwR9mNAhPWw9h8esfJmG0nixOJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=youXPU4HsasCohDyHjU+UExa7esUpBXqe83BkpO4oys3ggTwaVwU0EqcoU9p7OJFz
 zGObCtr4r04McxUGh6hTF96Id21c4DxsOjZZkFLvs23Le5pH7mzB/BiPhsmwE1eJtj
 oCn2NhOtflKcUj11rzp9mZivMS6eMmmPjaovNUjk=
Date: Fri, 25 Feb 2022 12:07:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 22/23] video: omapfb: dss: Make use of the helper
 component_compare_dev
Message-ID: <Yhi4errwyhNi6pFw@kroah.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-23-yong.wu@mediatek.com>
 <7e60cd01-8afc-ddb5-a1bb-6e9f53ccfba5@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e60cd01-8afc-ddb5-a1bb-6e9f53ccfba5@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, James Wang <james.qian.wang@arm.com>,
 Yong Wu <yong.wu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 09:46:24PM +0100, Helge Deller wrote:
> On 2/14/22 07:08, Yong Wu wrote:
> > Use the common compare helper from component.
> >
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-omap@vger.kernel.org
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> 
> Applied to the fbdev for-next branch.

That will break the build, it needs patch 1/23 to build properly :(

