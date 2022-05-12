Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFEE5255E4
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 21:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90CD10EEEB;
	Thu, 12 May 2022 19:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE5910EEEB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 19:39:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9771C1F45802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652384366;
 bh=l7sEGPwFChsQe883K+Tm9Z1Antz2QzvNm5fjecKjZro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MiRat4ZX8kCJFkC9cOzTnSv5u0RYAj5LmdftjvZ1b1Pv9LYRgjAST3ZsIo14/Lq4U
 8xjLPDuf16rEYbWZ25pXgAcaLIyyeGdtuKjf8bdi0+QLHfeZ2ohyGerWTSeHNHdDvn
 Ib43klOczH6uRZgywp9LsyfFRvRH5pfDlwqHlIFO9rPjL1/d8B+vK5eaeAYN3qQWRG
 KmTKJRc/r1PjnE4gZJAQXS4FtikcBXIcjODVsKltLiZMdBActDruHRZc1VVFXM/ONE
 +prPluUCKcrIuhvfPHz0j9YwwJRP7A5AFJQEal2Gv8u66T2XYwLMr9+TzLghEU447M
 nNJXeXWcALSOA==
Date: Thu, 12 May 2022 15:39:17 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v12, 00/17] media: mtk-vcodec: support for M8192 decoder
Message-ID: <20220512193917.tu6waopwagm3oyaz@notapiano>
References: <20220512021950.29087-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220512021950.29087-1-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 12, 2022 at 10:19:33AM +0800, Yunfei Dong wrote:
> This series adds support for mt8192 h264/vp8/vp9 decoder drivers. Firstly, refactor
> power/clock/interrupt interfaces for mt8192 is lat and core architecture.
> 
> Secondly, add new functions to get frame buffer size and resolution according
> to decoder capability from scp side. Then add callback function to get/put
> capture buffer in order to enable lat and core decoder in parallel, need to
> adjust GStreamer at the same time. 
> 
> Then add to support MT21C compressed mode and fix v4l2-compliance fail.
> 
> Next, extract H264 request api driver to let mt8183 and mt8192 use the same
> code, and adds mt8192 frame based h264 driver for stateless decoder.
> 
> Lastly, add vp8 and vp9 stateless decoder drivers.
> 
> Patches 1 refactor power/clock/interrupt interface.
> Patches 2~4 get frame buffer size and resolution according to decoder capability.
> Patches 5 set capture queue bytesused.
> Patches 6 adjust GStreamer.
> Patch 7~11 add to support MT21C compressed mode and fix v4l2-compliance fail.
> patch 12 record capture queue format type.
> Patch 13~14 extract h264 driver and add mt8192 frame based driver for h264 decoder.
> Patch 15~16 add vp8 and vp9 stateless decoder drivers.
> Patch 17 prevent kernel crash when rmmod mtk-vcodec-dec.ko

Hi Yunfei,

With this series, and the new scp.img for mt8192 [1] (still waiting to get
merged), I was able to get the following fluster scores on
mt8192-asurada-spherion:

VP8: 59/61
VP9: 249/303
H.264: 92/135

So for the whole series:

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

[1] https://lore.kernel.org/all/2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com/
