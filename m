Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3F19D781E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 21:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A7110E023;
	Sun, 24 Nov 2024 20:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=zillerbaer@gmx.de header.b="UA139x6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C08210E023
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1732480764; x=1733085564; i=zillerbaer@gmx.de;
 bh=ywMSe1q/965v+eVkcNyBvT1Ac5yKe2OMwFLssD4KmtM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UA139x6LtD0mAH7hsre7jh4hbLsV6B8Znrsa401xiAzPdGkO0Mi9rvVfSGsBvc6Z
 AgoSpIdHp7hKKrz4cVPfOJfTZ8H5SEipWIsyxBKLIUG5onbQvVJ9hlTECvWjhI6wH
 IIGGXT6k+hRK9OrXbgQTalCNJFKyrPYz+FMak1P5fKDPqHwmJFytO9zWg93CHhWNA
 +nKgYEnEurQjukAudlWBR4U+EoTFg1GEFWYwMNJNs16V4kSamp5GvZVROjl83BnTQ
 I36oucGiZ54Eain4YJlr6il9akOY4/jxH90Pdl+ZwFoiPOJeXgUEzUzDy1HXKC45y
 PoIchL3VQWNcQyIKcg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from book ([91.14.228.167]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqaxU-1u1cce0YwS-00hooB; Sun, 24
 Nov 2024 21:39:24 +0100
Date: Sun, 24 Nov 2024 21:38:53 +0100
From: Jens Ziller <zillerbaer@gmx.de>
To: "CK Hu (=?UTF-8?B?6IOh5L+K5YWJ?=)" <ck.hu@mediatek.com>
Cc: "Shuijing Li (=?UTF-8?B?5p2O5rC06Z2Z?=)" <Shuijing.Li@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "Jitao Shi (
 =?UTF-8?B?55+z6K6w5rab?=)" <jitao.shi@mediatek.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] mediatek: dsi: Correct calculation formula of PHY
 Timing
Message-ID: <20241124213853.06c1bd33@book>
In-Reply-To: <4b9e27b50417d60eb32cd0ec782778f652656909.camel@mediatek.com>
References: <20240412031208.30688-1-shuijing.li@mediatek.com>
 <20241027143219.56e7b4d0@schleppi.lan>
 <4b9e27b50417d60eb32cd0ec782778f652656909.camel@mediatek.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HkxXrXpOsattdDkhnrvYIdDinULQaFyrzUNAc2LDZpldEAhh+QJ
 bcuyHSa9BctP5nW+CrrhqtpstoObhJC2BKZlM99618KZgz0Pdu4YB9h38uM12SDex9IanhP
 nmRL2B8Y4XX8HXWrotB3/24rdxEqY2vlNASTAY82INLUWEUEVj6zTC2JrsvAWYOlc0dkVvr
 m2PdAfPWnwsjvyhtmONHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n9Y+PD3R9fI=;eQeqCGU5HdIPEZHFNsrJg8AN+ZU
 e2coRFOYFkdl+aawOf/hSbyCuA2KiPAWJLnMTbusXyJhbgN633JGIoxbRqlpM7SppyioJzrOc
 zRPglEpPwedoY2jQ/fMGHQqhKOwFb9cBm0YEGhPEMmfpGis2hlBL8daveaZg2mwQpdBmbwBbG
 OrE3pnb4gtnkFIuJ0eljVzijD76tkQhSL7S67AID1twSAIuUYnaiUtFimXXn1iyi9AITIeODq
 Hep9f0xvQKAZb2zXgG2FJgeYDospSq/ul4GewqRbVQV68xSVigu2ftxEVRPBfHBlGodwMcskB
 JVLDwPekaSR6q6O6EQ3luqzOna8OX4XbqxFS5iNe+4vypv+CQxvz90iRIxuTkfpcIk9EMyalz
 yc+d9di7GZrBrgrDS/Fb2cscN0au0bqeFIlhaEGLO2Y2pYBOsi05y7oWNd6slMFdBGaiUYp+I
 gw5tydx08xnlysd5Iv6DuPXpjzk9PmSdFTFqz5OTPDuKqXmfkQY4oFf1epDEZWf9rKP2lnjXo
 7PG0knnQiU96VtmVSqt3IZ6BOe3VmQMA7fCSC/cxMgOlV8DZ5yQR27wYO/ir50xrQckV05jax
 Rq+IQtsvGpMEJ+LyXt8wf8naPkMP//RVJtehxHIoi4vqssF/ytm20MzYjPuAUfcmsOCdi+4AQ
 Kg897K0eHX9TovfyE2fJgNZNAkdHkiXNAbCRmq8wE32TTV4w0LZBRqT0cyiN2VCq2k5+L+I8g
 Mq1dJyKkR+rfBby42dzog0rdfuSSABqag1MwpJKvovzUPwMyw0SGM+Y1SWRuWSZihGDCPSnSd
 GSGarkalNWIrYA0tw58WCXGcXfwla2wn2gnyNJCZFYT8wXy1x1fvF9FySCJjpXo4nUM2DvoN0
 pJdvGhoCa1PyJymk2nJVomhgQuMxWyOxe36bPZ4I1D//BIUv0XgpeQ3sT
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Thu, 21 Nov 2024 03:50:02 +0000
schrieb CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.hu@mediatek.com>:

> Hi, Shuijing:
>=20
> On Sun, 2024-10-27 at 14:32 +0100, Jens Ziller wrote:
> > External email : Please do not click links or open attachments
> > until you have verified the sender or the content.
> >=20
> >=20
> > Am Fri, 12 Apr 2024 11:11:39 +0800
> > schrieb Shuijing Li <shuijing.li@mediatek.com>:
> >=20
> > > This patch correct calculation formula of PHY timing.
> > > The spec define HS-PREPARE should be from 40ns+4*UI(44ns) to
> > > 85ns+6*UI(91ns). But current duration is 88ns and is near the
> > > boundary. So this patch make the duration to 64ns so it is near
> > > the safe range.
> >=20
> > Hi Shuijing,
> >=20
> > with this patch the panel in the Tentacruel ASUS Chromebook CM14
> > (CM1402F) flickers. There are 1 or 2 times per second a black panel.
> > Stable Kernel 6.11.5 and mainline 6.12-rc4 works only when I reverse
> > this patch. There's a bug inside. Can you please check that?
>=20
> Please help Jens to fix this bug.
> Otherwise, I've to revert this patch.
>
> Regards,
> CK

I'am not be able to fix that. This patch must be reverted that the
actual kernel runs on my Chromebook. Please revert this patch.

Regards
Jens

>=20
> >=20
> > Best regards
> > Jens
> >=20
> > >=20
> > > Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> > > ---
> > > Changes in v2:
> > > Add a commit to describe the improvements to this patch in detail,
> > > per suggestion frome previous thread:
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linu=
x-mediatek/patch/20240315072945.19502-1-shuijing.li@mediatek.com/__;!!CTRNK=
A9wMg0ARbw!nA3Auuq2W3qyf3a8OtzDvLICN_xfq5zUozp_-Wo7Q4jR9l6qKlxiWNC4TZPXQa8W=
08veWhokHyRrvCodcpg$
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 33
> > > +++++++++++++++--------------- 1 file changed, 17 insertions(+),
> > > 16 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > b/drivers/gpu/drm/mediatek/mtk_dsi.c index
> > > a2fdfc8ddb15..d1bd7d671880 100644 ---
> > > a/drivers/gpu/drm/mediatek/mtk_dsi.c +++
> > > b/drivers/gpu/drm/mediatek/mtk_dsi.c @@ -235,22 +235,23 @@ static
> > > void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi) u32 data_rate_mhz
> > > =3D DIV_ROUND_UP(dsi->data_rate, 1000000); struct mtk_phy_timing
> > > *timing =3D &dsi->phy_timing;
> > >=20
> > > -     timing->lpx =3D (60 * data_rate_mhz / (8 * 1000)) + 1;
> > > -     timing->da_hs_prepare =3D (80 * data_rate_mhz + 4 * 1000) /
> > > 8000;
> > > -     timing->da_hs_zero =3D (170 * data_rate_mhz + 10 * 1000) /
> > > 8000 + 1 -
> > > -                          timing->da_hs_prepare;
> > > -     timing->da_hs_trail =3D timing->da_hs_prepare + 1;
> > > -
> > > -     timing->ta_go =3D 4 * timing->lpx - 2;
> > > -     timing->ta_sure =3D timing->lpx + 2;
> > > -     timing->ta_get =3D 4 * timing->lpx;
> > > -     timing->da_hs_exit =3D 2 * timing->lpx + 1;
> > > -
> > > -     timing->clk_hs_prepare =3D 70 * data_rate_mhz / (8 * 1000);
> > > -     timing->clk_hs_post =3D timing->clk_hs_prepare + 8;
> > > -     timing->clk_hs_trail =3D timing->clk_hs_prepare;
> > > -     timing->clk_hs_zero =3D timing->clk_hs_trail * 4;
> > > -     timing->clk_hs_exit =3D 2 * timing->clk_hs_trail;
> > > +     timing->lpx =3D (80 * data_rate_mhz / (8 * 1000)) + 1;
> > > +     timing->da_hs_prepare =3D (59 * data_rate_mhz + 4 * 1000) /
> > > 8000 + 1;
> > > +     timing->da_hs_zero =3D (163 * data_rate_mhz + 11 * 1000) /
> > > 8000 + 1 -
> > > +             timing->da_hs_prepare;
> > > +     timing->da_hs_trail =3D (78 * data_rate_mhz + 7 * 1000) / 8000
> > > + 1; +
> > > +     timing->ta_go =3D 4 * timing->lpx;
> > > +     timing->ta_sure =3D 3 * timing->lpx / 2;
> > > +     timing->ta_get =3D 5 * timing->lpx;
> > > +     timing->da_hs_exit =3D (118 * data_rate_mhz / (8 * 1000)) + 1;
> > > +
> > > +     timing->clk_hs_prepare =3D (57 * data_rate_mhz / (8 * 1000)) +
> > > 1;
> > > +     timing->clk_hs_post =3D (65 * data_rate_mhz + 53 * 1000) /
> > > 8000 + 1;
> > > +     timing->clk_hs_trail =3D (78 * data_rate_mhz + 7 * 1000) /
> > > 8000 + 1;
> > > +     timing->clk_hs_zero =3D (330 * data_rate_mhz / (8 * 1000)) + 1
> > > -
> > > +             timing->clk_hs_prepare;
> > > +     timing->clk_hs_exit =3D (118 * data_rate_mhz / (8 * 1000)) +
> > > 1;
> > >=20
> > >       timcon0 =3D timing->lpx | timing->da_hs_prepare << 8 |
> > >                 timing->da_hs_zero << 16 | timing->da_hs_trail <<
> > > 24;
> >=20
> >=20

