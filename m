Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832B15B6EC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 02:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF2E6EB1A;
	Thu, 13 Feb 2020 01:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3018B6EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 01:57:19 +0000 (UTC)
X-UUID: dc98b481c0ca478ba22111a988250ed4-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SS2WJ9TnlTdWxgp0Ian/hWdeQ6K5JRe2gnRD2HiUUuo=; 
 b=hne3FsPDQO9jeuZ9Tnc+sCBIQjIKoA+2MLp1XYmlv2S9RNIOUMa9d/wgECzF/Aq9pE7mQo7seqIPGY+ZET3B3W3TQm4nQkv93k2TkB6sDKUcFx3BpoN7MKiGX7bdzCDK7aSH0SR6KCRt2M57suGHRfmxkEnuOppdWwgt4l32BR4=;
X-UUID: dc98b481c0ca478ba22111a988250ed4-20200213
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2053184014; Thu, 13 Feb 2020 09:57:15 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 09:55:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 09:57:18 +0800
Message-ID: <1581559033.14792.9.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 09:57:13 +0800
In-Reply-To: <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
 <1581495554.22603.2.camel@mtksdaap41>
 <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 242DD775477EA9B69ECE3E92EE470D936050FE8CEE227D1CA21D57919E72DCD62000:8
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
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Tzung-Bi:

On Wed, 2020-02-12 at 19:31 +0800, Tzung-Bi Shih wrote:
> On Wed, Feb 12, 2020 at 4:19 PM CK Hu <ck.hu@mediatek.com> wrote:
> > I think hdmi_conn_detect() and mtk_hdmi_audio_hook_plugged_cb() would be
> > called in different thread. So it's necessary to use a mutex to protect
> > this.
> 
> Thanks for the reminder.  I feel using mutex here is overkill.  Please
> see https://patchwork.kernel.org/patch/11378413/ for my proposed
> solution.
> 

I'm not only consider the race condition of plugged_cb and codec_dev. I
also care about the atomic of mtk_cec_hpd_high() and hdmi->plugged_cb().
If these two function is not an atomic operation, below is an example of
problem:

<Status disconnected>
1. Thread A call mtk_hdmi_audio_hook_plugged_cb()
2. Thread A call mtk_cec_hpd_high() and get disconnected.
<Status connected>
3. Thread B call hdmi_conn_detect()
4. Thread B call mtk_cec_hpd_high() and get connected
5. Thread B callback plugged_cb() with connected
6. Thread A callback plugged_cb() with disconnected (Bug here)

Regards,
CK

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
