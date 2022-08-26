Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58865A288E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 15:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D85B10E83F;
	Fri, 26 Aug 2022 13:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC4510E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 13:29:49 +0000 (UTC)
Received: from notapiano (unknown [70.107.189.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 224F16601B24;
 Fri, 26 Aug 2022 14:29:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661520587;
 bh=+m7sis5b7W8J1KdNle4N0fSBG5qi9iWA0tl/U2ExgXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kbcQ27OiXN4L4WS3AG+PvOv7ae/3Eg8kbk7YBuBUC451fN1xBzRc0WTGIhVkh8HRA
 TjnnsPne5t5aFubjmIdbgMCnPSfBYMq8B8N/2i44+DEE6HFX0XI3/J/PLASYLlqRan
 ib9M6x+PUgv0jJrNhDpSem+wsnOeqLeBE2sJ9VpHNavFzGqM2JPtCYIkVj1pcaeDu4
 0Hac8gIJTwbgOy1YeeL0/8fYXgSET8355QagOgJ5ViauNhJ7lMU0DgJeGQ5OiH/g5n
 YPZpygzbV8XhLtZmaV05NRDhq41G9pTlFIIBEeRjmHgfcmjQP2jhjQ4yw/g0B9WM7z
 mt2K9gggrZFrA==
Date: Fri, 26 Aug 2022 09:29:42 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Message-ID: <20220826132942.k2rnlz5wwi62tity@notapiano>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
 <20220823201758.ffbgb5t5odoicgir@notapiano>
 <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
 <30f536c754829011e78239a9a400945faa4580e4.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30f536c754829011e78239a9a400945faa4580e4.camel@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 02:12:00PM +0800, xinlei.lee wrote:
> On Thu, 2022-08-25 at 17:04 +0200, Matthias Brugger wrote:
> > 
> > On 23/08/2022 22:17, Nícolas F. R. A. Prado wrote:
> > > On Tue, Aug 23, 2022 at 02:38:22PM +0800, xinlei.lee@mediatek.com
> > > wrote:
> > > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > 
> > > > Add mmsys function to manipulate dpi output format configuration
> > > > for MT8186.
> > > > 
> > > > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > 
> > 
> > Patch looks fine, I'll wait for v4 as there is still some discussion
> > on the DRM 
> > part. Please try to fix the threading problem you had in sending this
> > series.
> > 
> > Thanks,
> > Matthias
> 
> Hi Matthias:
> 
> Thanks for your review.
> 
> Before I send the next version, do you mean the treading problem you
> are talking about is the problem I'm discussing in another patch in
> this series, or something else?

Hi Xinlei,

no, the threading problem Matthias is referring to is the fact that this version
of your series had two cover letters (patch 0) and a patch 2 [1], while patch 1
was sent in a different email thread [2]. The whole series (cover letter,
patches 1 and 2), should have been in the same email thread. Also, I noticed
that your cover letter lists the patches with incorrect prefixes "FROMLIST".

So something weird happened when you sent this version of the series. It was ok
in the previous version. So just make sure this is fixed when you send the next
version of the series (after we finish the discussion on patch 2).

[1] https://lore.kernel.org/linux-mediatek/1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com/

Thanks,
Nícolas
