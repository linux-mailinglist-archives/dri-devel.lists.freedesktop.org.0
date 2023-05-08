Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1D56FA2B2
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0BC10E198;
	Mon,  8 May 2023 08:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DBD10E198
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 08:57:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB716620B3;
 Mon,  8 May 2023 08:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E10C433EF;
 Mon,  8 May 2023 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683536267;
 bh=G5v7NSAKXe2kLiZkicPjPQ/vKtmbjwfgIRwrsi4rT4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pl0UQZj54buaQ35xQcBdmpJB5ccWsOHmiWJ7iamjj1B4SoCPRo1KbNe+Aukzlc5n0
 uZMuGpJNslVEQWFdp6SVSfIhl/01niiqlSnP43z5Z5MyWpV91e66gqMkOJI237gRtj
 ar6LG2CQu7g7xRL4EVmpPL6H0s6z659skAJLJikwHvbbxMh5NnoDKthlZjFvuauR+7
 UHGLwXIF475Aupcf11AcKtW9W9LVMZcZPTlUgJmb7cx5K+Z1MqjMjPoxtdohoSGWUu
 ZnDq6Q2bic907kFa2sq5IqN5KB4gpocS4VZx3rcrWCAuBmKvVpfnAgAuP+NM0k8+Ce
 lE1EgjLr+fVPg==
Date: Mon, 8 May 2023 14:27:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Message-ID: <ZFi5hqhsTKqV96hF@matsya>
References: <20230414122253.3171524-1-trix@redhat.com>
 <ZFTMPWp8LhwA9uHz@matsya>
 <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>
 <ZFipVfhLVyye/eud@matsya>
 <f5cf30b2-c29c-03ac-e7fc-4c7da2cd0c5b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5cf30b2-c29c-03ac-e7fc-4c7da2cd0c5b@gmail.com>
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
Cc: kishon@kernel.org, chunkuang.hu@kernel.org, granquet@baylibre.com,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, linux-phy@lists.infradead.org,
 linux-mediatek@lists.infradead.org, chunfeng.yun@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08-05-23, 10:24, Matthias Brugger wrote:
> 
> 
> On 08/05/2023 09:48, Vinod Koul wrote:
> > On 05-05-23, 17:37, Matthias Brugger wrote:
> > > 
> > > 
> > > On 05/05/2023 11:28, Vinod Koul wrote:
> > > > On 14-04-23, 08:22, Tom Rix wrote:
> > > > > clang reports
> > > > > drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
> > > > >     'ret' is uninitialized when used here [-Werror,-Wuninitialized]
> > > > >           if (ret)
> > > > >               ^~~
> > > > > ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> > > > 
> > > > I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
> > > > usage in pll_calc"
> > > 
> > > Thanks Vinod, that was on my list for today as well. I was a bit puzzled
> > > because you took the patch that added it, but I wasn't sure if you would
> > > take the fix. How do you want to handle things like this in the future?
> > 
> > Fixes should be sent as Fixes patch
> > 
> 
> I'm not sure what do you mean. Patch subject includes the word fix and the
> patch has a fixes tag. What was missing here?
> 
> Does this mean you will take fixes for this driver in the future or do you
> want me to take care of them?

Yes I would take the fixes as well for the drivers

-- 
~Vinod
