Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207AC1609AD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 05:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D586E49C;
	Mon, 17 Feb 2020 04:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D83E6E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 04:49:17 +0000 (UTC)
X-UUID: 8a14c4fe7f9444b1b755bdb56451a0a8-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ib3CGDT48ndknLXCzeQvFl+o88PHBbAK1vPnBCCEPIU=; 
 b=LzeR3AZZNezNMC2uS+TX/bIxwUBA7Z2udE90OAaUxZoSgQ4Rtf81incW3AxkF97NnBP22yYcrMxjCIJzl9Hl7RWaea+CUXmXvoc1YB0YWVxqR68DcJtRkrtWE4nSEpl89hM/bI2YZurhxk+x8S/ji+FLNqyNWiQzPngxksfdIoE=;
X-UUID: 8a14c4fe7f9444b1b755bdb56451a0a8-20200217
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1619337215; Mon, 17 Feb 2020 12:49:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 12:48:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 12:49:00 +0800
Message-ID: <1581914953.20102.3.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/2] drm/mediatek: fix race condition for HDMI jack
 status reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 12:49:13 +0800
In-Reply-To: <CA+Px+wWRn1-t2fd+bD-PGRVjyLaAHqm1wF3W3T_GMUh0GXkA_A@mail.gmail.com>
References: <20200217031653.52345-1-tzungbi@google.com>
 <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581911058.12629.1.camel@mtksdaap41>
 <CA+Px+wWRn1-t2fd+bD-PGRVjyLaAHqm1wF3W3T_GMUh0GXkA_A@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: ALSA development <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Dylan Reid <dgreid@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-02-17 at 11:55 +0800, Tzung-Bi Shih wrote:
> On Mon, Feb 17, 2020 at 11:44 AM CK Hu <ck.hu@mediatek.com> wrote:
> > On Mon, 2020-02-17 at 11:16 +0800, Tzung-Bi Shih wrote:
> > > Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
> >
> > This patch looks good to me, but please merge this patch with the patch
> > it fix.
> 
> 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting") has
> applied to ASoC for-next branch.  This is a fixup patch.

I thought a patch need an ack by the maintainer. OK, so I could do is,
for this patch,

Acked-by: CK Hu <ck.hu@mediatek.com> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
