Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604CEA1742A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 22:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659C110E0FB;
	Mon, 20 Jan 2025 21:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tz5cIsFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43B710E023;
 Mon, 20 Jan 2025 21:31:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84F29594;
 Mon, 20 Jan 2025 22:30:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1737408652;
 bh=UR0Dn2aJ9/EbfFUoHjgJTmS310tTTS7kpgbvgK5/QDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tz5cIsFv7BRMKEY3D3u98tmREMFxaLPzmkvKmO6wbVQGH19/R54iyLMQQ9KewTF7w
 XG2/cC4eVkCou98Uc5c6SjKBuQToMQv6RXAwUvyyw9bv++mGApN8ZszSrV/7WmM1sj
 RjBxqj+2N5UL8AxG5M7IOKtI8e0NgxtpGCU3dr8Q=
Date: Mon, 20 Jan 2025 23:31:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>, James Jones <jajones@nvidia.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <20250120213147.GI9249@pendragon.ideasonboard.com>
References: <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
 <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
 <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
 <Z4pmnTy1NYD3rLwS@phenom.ffwll.local>
 <CAAxE2A6iDsN=YKW2F7WyyZxn4Sw4Dr5CxZminQGwf8awBivovQ@mail.gmail.com>
 <0e9aee49-aa69-4fb6-bab8-4624143f5267@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e9aee49-aa69-4fb6-bab8-4624143f5267@suse.de>
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

On Mon, Jan 20, 2025 at 08:58:20AM +0100, Thomas Zimmermann wrote:
> Am 18.01.25 um 03:37 schrieb Marek Olšák:
> [...]
> >
> > 3) Implementing DRM_FORMAT_MOD_LINEAR as having 256B pitch and offset 
> > alignment. This is what we do today. Even if Intel and some AMD chips 
> > can do 64B or 128B alignment, they overalign to 256B. With so many 
> > AMD+NV laptops out there, NV is probably next, unless they already do 
> > this in the closed source driver.
> 
> The dumb-buffer series currently being discussed on dri-devel also 
> touches handling of scanline pitches. THe actual value varies with each 
> driver.  Should dumb buffers use a default pitch alignment of 256 on al 
> hardware?

That may break sharing buffers with other devices (codecs, NPUs and/or
cameras) that would not support a configurable pitch. I don't expect
that to be the majority case, but I can't rule it out either. There's
also the issue that, even if the devices support configurable pitches,
the drivers may not implement it. That's fixable, but hardcoding the
pitch to 256 bytes without fixing that would be a regression.

-- 
Regards,

Laurent Pinchart
