Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5813598650E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 18:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB16610E0FD;
	Wed, 25 Sep 2024 16:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A62210E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 16:43:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1stV71-0004pf-N8; Wed, 25 Sep 2024 18:43:35 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1stV71-001UVL-6C; Wed, 25 Sep 2024 18:43:35 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1stV71-000PFR-0K;
 Wed, 25 Sep 2024 18:43:35 +0200
Message-ID: <75edf945c98a68bf85b13efd1c13549288f56488.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] gpu: ipu-v3: vdic: Simplify ipu_vdi_setup()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Wed, 25 Sep 2024 18:43:34 +0200
In-Reply-To: <546c9dac-39ab-4abe-a495-ab54d6ee925d@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <95efd6b6491069d04b4bfae6616d9a43ba8467a6.camel@pengutronix.de>
 <546c9dac-39ab-4abe-a495-ab54d6ee925d@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Di, 2024-09-24 at 12:47 +0200, Marek Vasut wrote:
> On 9/4/24 11:05 AM, Philipp Zabel wrote:
> > On Mi, 2024-07-24 at 02:19 +0200, Marek Vasut wrote:
> > > The 'code' parameter only ever selects between YUV 4:2:0 and 4:2:2
> > > subsampling, turn it into boolean to select exactly that and update
> > > related code accordingly.
> > >=20
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> >=20
> > I'd prefer this to be an enum ipu_chroma_subsampling or similar,
> > instead of a boolean. Otherwise,
>=20
> I'm afraid this introduces unnecessary back and forth conversions=20
> between the boolean and either of the two enum ipu_chroma_subsampling=20
> values in the code.

Fair enough. I dislike the opaque usage in vdic_start() a bit, but with
the in422 variable in ipu_mem2mem_vdic_setup_hardware() it is clear
enough.

regards
Philipp
