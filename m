Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B8A46E73
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C6910E9ED;
	Wed, 26 Feb 2025 22:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aqYqpdVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7735310E9ED
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 22:27:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 91E77612A4;
 Wed, 26 Feb 2025 22:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D179C4CED6;
 Wed, 26 Feb 2025 22:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740608820;
 bh=O5zZ7g63I+0ZeYH00JZerlvbNik71qO0CgwvkTnWcIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aqYqpdVVpkD5NJn6jpo0cdClxOspwzsi8RCKpRnA88J5OPdmx1mMru31LZxBFgp96
 SZb3oRy0Fxzg1qr18ZQYO7NtEHrnW1kSYRo35qghO1/ESXhb4R4oAXKE6PoHpaKtQk
 rw/ltpwe8XfbrUtfiq6lveoAbVX0jopaapPwU3slyk58T6gzgfoVr9fY71ajwj3kUT
 xvbk1I9lC3b2larN7+jztDKNXSrFhP0QhpXpDklrqd7y0o0NsfVUuwegc/GYneM1Nf
 LoD2swB/LWax0rd/I8YAe0yQ9kMiS9zB3fdg0qmIVaFo3k/1cDqwlB1rT1yn4zBMcR
 ST+zf0908vWAA==
Date: Wed, 26 Feb 2025 22:26:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
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
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>, Carlos Maiolino <cmaiolino@redhat.com>
Subject: Re: [PATCH v3 00/16] Converge on using secs_to_jiffies() part two
Message-ID: <594169fd-5ba6-42d5-ad35-bb8c7720904b@sirena.org.uk>
References: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
 <79b24031-5776-4eb3-960b-32b0530647fb@sirena.org.uk>
 <20250226123851.a50e727d0a1bfe639ece4a72@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ktE/+HW2BMMja6u3"
Content-Disposition: inline
In-Reply-To: <20250226123851.a50e727d0a1bfe639ece4a72@linux-foundation.org>
X-Cookie: I've been there.
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


--ktE/+HW2BMMja6u3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:38:51PM -0800, Andrew Morton wrote:
> On Wed, 26 Feb 2025 11:29:53 +0000 Mark Brown <broonie@kernel.org> wrote:

> > Please don't combine patches for multiple subsystems into a single
> > series if there's no dependencies between them, it just creates
> > confusion about how things get merged, problems for tooling and makes
> > everything more noisy.  It's best to split things up per subsystem in
> > that case.

> I asked for this.  I'll merge everything, spend a few weeks gathering
> up maintainer acks.  Anything which a subsystem maintainer merges will
> be reported by Stephen and I'll drop that particular patch.

> This way, nothing gets lost.  I take this approach often and it works.

I've only started seeing these in the past few weeks, but we do have a
bunch of people routinely doing cross tree stuff who split things up and
it seems to work OK there.

> If these were sent as a bunch of individual patches then it would be up
> to the sender to keep track of what has been merged and what hasn't.=20
> That person will be resending some stragglers many times.  Until they
> give up and some patches get permanently lost.

Surely the sender can just CC you on each individual thing just as well?
Ensuring things get picked up is great, but it's not clear to me that
copying everyone on a cross tree series is helping with that.

> Scale all that across many senders and the whole process becomes costly
> and unreliable.  Whereas centralizing it on akpm is more efficient,
> more reliable, more scalable, lower latency and less frustrating for
> senders.

Whereas copying everyone means all the maintainers see something that
looks terribly complicated in their inboxes and have to figure out if
there are actually any dependencies in the series and how it's supposed
to be handed, and then every reply goes to a huge CC list.  That's not
good for either getting people to look at things or general noise
avoidance, especially for people who are expecting to get cross tree
serieses which do have dependencies that need to be managed.

There's also some bad failure modes as soon as anyone has any sort of
comment on the series, suddenly everyone's got a coding style debate or
whatever in their inboxes they can pile into.

--ktE/+HW2BMMja6u3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme/lSYACgkQJNaLcl1U
h9DO/Qf/a9HWwKcXS5+hFxQJSm6QW0NLy2NbqHre8UKfa7aKUVgjHmVnb1gIAdSh
gY+WUz9p7S+67TovmO+FlVs/KDBaHyw8J0auw2I/uFK7bDhNHXtiUi32jBCyuQD4
w+yhOC50NrB6ZXh/FpBk8EXI4DSUoaL5z6KMVYItTTfl0lCtBbTGJSAPXswWc3u1
5ZXriY5GR9Q2MwY4Fs6QN6pbKucqtpxnhiL26E8ic/kdpVh6ZGEoFhFWweV6nD/+
ttggFNcFA98M8YYEySK/p9ls4PyRF4dXL+oQWEXWvylpGogCDAcCj7Igb8CuyJRn
G2+ftlgr6xEk4hOBnRKBY7Ts/BcKqg==
=3AEq
-----END PGP SIGNATURE-----

--ktE/+HW2BMMja6u3--
