Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90FA8341E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 00:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A6810E058;
	Wed,  9 Apr 2025 22:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="gJ3Lo78d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1706 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 22:35:18 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C31210E058
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=MXaJb6rqjO6k6hC8GGRd9Nz5/YI2plyuUrbJ5reUjDs=; 
 t=1744238117; x=1745447717; b=gJ3Lo78dYwF2XrgMXf+2iUq6AYn8Ym8laLaV3UCW7LkIETo
 sWi7xtga4uwR4AZpKfMUe7EynCghvSlEk366RTaAojfBsAD2XrNZr3/mAsRgBpiXPcIVe4KWqRdey
 oMZ0tkY9jacCNXjLk1NR5S6iYz8r/Rp4RbohlwI5moGXDPwq/7mTogYoo0UnFUcrdG01sATVSuHGn
 8tUXAZjgbvYiTWLVP+dCKdUHLIVz4QjmcTwYv/QV02oCJE1ayj2hsDPRo+drLPPK6UyFNeQFqdHJP
 awNnGIpNYTlC4wF0CLgjrO9Gj0bLfEZCexn+pjOFMyT1jTxt/nv3zNNypnCFcitA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.1) (envelope-from <johannes@sipsolutions.net>)
 id 1u2dYb-00000005Jap-0lrk; Thu, 10 Apr 2025 00:06:05 +0200
Message-ID: <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
From: Johannes Berg <johannes@sipsolutions.net>
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Kuan-Wei Chiu	
 <visitorckw@gmail.com>, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, 	eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 	rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, 	mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, 	miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, 	louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, 	edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, 	gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, 	akpm@linux-foundation.org,
 jdelvare@suse.com, linux@roeck-us.net, 	alexandre.belloni@bootlin.com,
 pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 	kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, 	dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, 	oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, 
 Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, 	david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Yu-Chun Lin	 <eleanor15x@gmail.com>
Date: Thu, 10 Apr 2025 00:06:03 +0200
In-Reply-To: <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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

On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
>=20
> This is orthogonal to the change to parity_odd() though. More specific=
=20
> to the new parity_odd() you can now do following as parity_odd()=20
> argument is u64:
>=20
> 		err =3D !parity_odd(*(u16 *)p);
>=20

Can it though? Need to be careful with alignment with that, I'd think.

johannes
