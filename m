Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00015D3E0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1C66F8BB;
	Fri, 14 Feb 2020 08:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB5056F8B2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 08:34:09 +0000 (UTC)
X-UUID: 100062a256fe42a9903d11c14f3fc318-20200214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o2bK0SZqMI85CjEk1N9bVcxZhc8pa2z/qRl3UsDcAX4=; 
 b=MwkIo877uq5osuuY4vE5I56SN405iwpxerDFPZQj8b7xxan1QkfejKJ77wFjLWYaL+4A23N6ENoePZGvaPu/DflRrI81NR4MkU/OYXIf9vbcaA3TfIPt0a3wlgRgryTy5RifST2UYbXHFBranzKvm/VqpgCokT3UuuyYrTDrSFw=;
X-UUID: 100062a256fe42a9903d11c14f3fc318-20200214
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 167469310; Fri, 14 Feb 2020 16:34:05 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 16:34:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 16:32:12 +0800
Message-ID: <1581669243.29925.13.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Feb 2020 16:34:03 +0800
In-Reply-To: <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581664042.20487.4.camel@mtksdaap41>
 <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E4F804774C418372C14AAF9660D005786F5B43F8F573AC6B89DAE76E13F0C79D2000:8
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

Hi, Tzung-Bi:

On Fri, 2020-02-14 at 15:35 +0800, Tzung-Bi Shih wrote:
> On Fri, Feb 14, 2020 at 3:07 PM CK Hu <ck.hu@mediatek.com> wrote:
> > I think sound driver could be removed for some reason, and fn should be
> > set to NULL before sound driver removed. In this case, codec_dev != NULL
> > and fn == NULL.
> 
> No..if you see sound/soc/codecs/hdmi-codec.c, plugged_cb is statically
> allocated.

It looks like that even though sound driver is removed, hdmi driver
would still callback to sound core. This is so weird. After sound driver
is removed, hdmi driver would callback with codec_dev which is invalid.
I think this may cause some problem.

Regards,
CK
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
