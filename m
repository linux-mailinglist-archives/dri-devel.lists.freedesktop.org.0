Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6456DEC75
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 09:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210C410E285;
	Wed, 12 Apr 2023 07:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Wed, 12 Apr 2023 07:21:41 UTC
Received: from qs51p00im-qukt01071902.me.com (qs51p00im-qukt01071902.me.com
 [17.57.155.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E252210E285
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1681283703;
 bh=FuHa2VctxY8ljAUtLpIjGV5QmLAE4POaPbEVmwgcH2o=;
 h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To;
 b=qY08AyFEmbBbMRmPeik5yhhAU3lwphghNn24tlEZ05vOVrFWtZSNDXmUtGuHh8n5N
 vFBfCSUOMVpXxOSzg00fpuzPLEkUrVvbznMG5ErYZEbnDeeVkW/qbjlOxr2oX2Bomy
 v5KC7nZMd/+z/r5cZ1ilzsAebgJn1m7/DiOQebOT8F4ZVvCSXRwH8NdCfGRPrEJ3oB
 IW+Pc4wC30B0LWGprb9e4gJMCsOTJFQN0WuKuHYUD5U/L2E8ZltqoR4xXpdes5Ct1i
 WjQc3/gtJcsSykcDtr8ljRgmxlFNdy87z4EydHZshcht2f70xYrxVMuOJsMe5ICQGc
 ww/8hNCOGbCqQ==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01071902.me.com (Postfix) with ESMTPSA id
 4C7375EC011E; Wed, 12 Apr 2023 07:15:01 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Apr 2023 09:14:59 +0200
Message-Id: <CRULBWW4VCWG.3KS7HX7P1G4P6@void.crly.cz>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
From: "Roman Beranek" <romanberanek@icloud.com>
To: "Maxime Ripard" <maxime@cerno.tech>
X-Mailer: aerc 0.14.0
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev> <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <CRHKFX934UA0.1MCKCD8SJSPIE@iMac.local>
 <20230329195802.veybo3367zifw77n@penduick>
 <CROTQHUM88W0.2URPO95U5ZMS5@void.crly.cz>
 <pu3vdz4gnkwgn4thg6tndbnvfroevpnq75bqbfv7yyrh4gkv63@xxl3dsjf2ih3>
In-Reply-To: <pu3vdz4gnkwgn4thg6tndbnvfroevpnq75bqbfv7yyrh4gkv63@xxl3dsjf2ih3>
X-Proofpoint-GUID: s-iO_fMJ2HHG6apJavxJxsPYR0SgWQJt
X-Proofpoint-ORIG-GUID: s-iO_fMJ2HHG6apJavxJxsPYR0SgWQJt
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-11=5F01:2022-01-11=5F01,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=487
 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2304120065
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
Cc: Samuel Holland <samuel@sholland.org>, Frank Oltmanns <frank@oltmanns.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed Apr 5, 2023 at 5:03 PM CEST, Maxime Ripard wrote:
> On Wed, Apr 05, 2023 at 02:34:11PM +0200, Roman Beranek wrote:
> > It turns out however that the new dclk rates can't be set exactly as
> > requested without touching pll-video0*, tcon0 now therefore gets
> > reparented from pll-mipi to pll-video0-2x which, as it further turns
> > out, breaks DSI. While simply forbidding the video0-2x mux option seems
> > to me as the right way to go because there's not much use for it with
> > non-DSI interfaces either besides the opportunity to power pll-mipi
> > down, I'd like to run by you first.
>
> Sounds reasonable

Okay, I'm unsure of how to denote that in the code however. Should I
just comment the parent out of the table and put an explanation in
a comment nearby? Or just erase it? I couldn't find an applicable
precedent.

> > * As pll-mipi doesn't have CLK_SET_RATE_PARENT flag set, pll-video0
> >   retains its boot-time rate of 294 MHz set by sunxi-dw-hdmi driver
> >   in u-boot. Why 294 MHz (as opposed to the default rate of 297 MHz)?
> >   The driver actually asks for 297 MHz, clock_set_pll3 rounds it to
> >   294 MHz though because it limits itself to 6 MHz steps.
>
> We could also address that though

Should I include it in v2 of the series, or leave it for later?

Thanks,
Roman
