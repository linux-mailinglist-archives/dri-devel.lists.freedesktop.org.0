Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7D3A21C28
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5010E7A6;
	Wed, 29 Jan 2025 11:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="keXqYgpB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC89A10E7A6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:28:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 93864A4182F;
 Wed, 29 Jan 2025 11:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4990C4CED3;
 Wed, 29 Jan 2025 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738150112;
 bh=0afCP9tpAob285d2+c3DFTpCZwuw1x7xRMd+0cAY7dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=keXqYgpBqSxQiFVgp6ssrhizY4Du1eWNsvvQf4/NWW+oCjoyMXSVpfZ5Bn1PdB/ED
 9wv1wBuRchQxQ0CuW4u8FMVzwJ8rB0L5vRFiLUUNtPD9wj9Bn+/Va+Q9Z6mxgIymwQ
 JLqQeOEbqULVQhG02Pj+7zzB2MlkL8R3oKJEeNxyMF67Vwg78zTFJsO4OZ7KbIbgaP
 YP9spZdl67qiwH0u1r8P2FYAPgdnGwinuVWEYrFRtCSPzqRNfIEkTTNBeG18dRI+F6
 TAaVqoYmML/+XRYt7G2+YbCO7gYobpmwRSUYyDEsvRA3IA3F3pdig8YUD/h8psjWYU
 PeniPeunBQVTw==
Date: Wed, 29 Jan 2025 11:28:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Jens Axboe <axboe@kernel.dk>, Xiubo Li <xiubli@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Frank Li <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 cocci@inria.fr, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org
Subject: Re: [PATCH 12/16] spi: spi-fsl-lpspi: convert timeouts to
 secs_to_jiffies()
Message-ID: <61d507a3-ca37-4eb9-b2cd-100298ffeeb6@sirena.org.uk>
References: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
 <20250128-converge-secs-to-jiffies-part-two-v1-12-9a6ecf0b2308@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wxS6hvAU6Vp1PxGO"
Content-Disposition: inline
In-Reply-To: <20250128-converge-secs-to-jiffies-part-two-v1-12-9a6ecf0b2308@linux.microsoft.com>
X-Cookie: The world is not octal despite DEC.
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


--wxS6hvAU6Vp1PxGO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2025 at 06:21:57PM +0000, Easwar Hariharan wrote:
> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies().  As the value here is a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.

Acked-by: Mark Brown <broonie@kernel.org>

--wxS6hvAU6Vp1PxGO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeaENIACgkQJNaLcl1U
h9Dwlwf/b75reI0uh7UpxNuw1Dgg2fl7hJn3m8DCJwfdhTb1pyNP6o2VB7PJ1FPR
zu8lccVGi/iZRranIOtvGjKtg5SrDhrF9CChAbwxk2f26lvF27Srdn7mHycwzkEm
h579H3K/1ri3X0oWXziH3KBnzKNBR3TB6h7Rp5na27mnWR9gKqZncog+7Qvr1aP1
3ufuZYWQ3RTFLp/IcPgBRYYjA/Ev1i7qKuqRS8qugS1d1vtZ7Js396WlV3r1KtgJ
qKDie5bMyU16q7C+SJERETYIrFvtYKXn3bERyeN2wpSjyOtEYM2awuQ3XRDFvz05
lMz/vFonoSs3p3TPlosZHyaOSE/Vdg==
=JJPM
-----END PGP SIGNATURE-----

--wxS6hvAU6Vp1PxGO--
