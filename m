Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFNgK5wShmk1JgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:11:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5410012C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463F010E827;
	Fri,  6 Feb 2026 16:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="ou6udq04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8683010E827
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 16:11:01 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 9A43B1FAA2;
 Fri,  6 Feb 2026 17:10:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1770394259;
 bh=NWmcPAurNjwlvM/3wgdAOFlyTkvK8iV82QRVbSW0Kyk=; h=From:To:Subject;
 b=ou6udq04170rew7KaDkpcdF0rIvdQ+e1HIu9Ue9zEq75DDwlLbBh5k+78OScUOLCs
 3t2pw3vmrSXL0nMOoAzLDWMYW1lW46JOsjbRrvS6+E9AfLPUVpVU0XZD7sK2t/okpx
 oTUfzX/gVGsIrY3HLJmTxk0jPJ1bpPXM5A65nU6j2oAbjP+sjCgDgzSw7wANQeYuNd
 ThkCIxdDuAzN8x+dC2az9a4gS6ZBErejb15LxneO0SfAHJ4Ur8FAhHBiIeonMx9Wbj
 FPq+Usha/ZIQDFDaINGChO3m4Qq/cFliwdIuksjBts7qBAfZSiYIRAWaJSvF8Xb8GN
 4NBWha2C10FJw==
Date: Fri, 6 Feb 2026 17:10:54 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Doug Anderson <dianders@chromium.org>
Cc: Franz Schnyder <fra.schnyder@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Franz Schnyder <franz.schnyder@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco@dolcini.it>, stable@vger.kernel.org
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ
 is not used
Message-ID: <20260206161054.GA101724@francesco-nb>
References: <20260206123758.374555-1-fra.schnyder@gmail.com>
 <CAD=FV=UO3wHqGKep67pY04PgBJKgvOgDf8u1qxeXmWkgVMLXiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UO3wHqGKep67pY04PgBJKgvOgDf8u1qxeXmWkgVMLXiQ@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[francesco@dolcini.it,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:fra.schnyder@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:franz.schnyder@toradex.com,m:linux-kernel@vger.kernel.org,m:francesco@dolcini.it,m:stable@vger.kernel.org,m:fraschnyder@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,toradex.com,lists.freedesktop.org,vger.kernel.org,dolcini.it];
	DKIM_TRACE(0.00)[dolcini.it:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[francesco@dolcini.it,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dolcini.it:dkim,toradex.com:email]
X-Rspamd-Queue-Id: DEC5410012C
X-Rspamd-Action: no action

Hello Doug,

On Fri, Feb 06, 2026 at 07:46:10AM -0800, Doug Anderson wrote:
> On Fri, Feb 6, 2026 at 4:38 AM Franz Schnyder <fra.schnyder@gmail.com> wrote:
> >
> > From: Franz Schnyder <franz.schnyder@toradex.com>
> >
> > Fallback to polling to detect hotplug events on systems without
> > interrupts.
> >
> > On systems where the interrupt line of the bridge is not connected,
> > the bridge cannot notify hotplug events. Only add the
> > DRM_BRIDGE_OP_HPD flag if an interrupt has been registered
> > otherwise remain in polling mode.
> >
> > Fixes: 9133bc3f0564 ("drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD")
> > Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> It's weird that you have two fixes, but upon closer inspection, I see
> why you tagged it as you did.
> 
> The first commit that landed, commit 55e8ff842051 ("drm/bridge:
> ti-sn65dsi86: Add HPD for DisplayPort connector type"), was still
> using polling mode and just using the HPD line for polling. That
> commit incorrectly set the flag "DRM_BRIDGE_OP_HPD". So the proper
> backport to kernels with just that commit would be to take away that
> flag. Unfortunately, I didn't notice this problem during the review
> and I don't personally have any hardware using this bridge for DP,
> only eDP.
> 
> The second commit that landed, commit 9133bc3f0564 ("drm/bridge:
> ti-sn65dsi86: Add support for DisplayPort mode with HPD"), actually
> added support for the HPD interrupt. After this commit, your fix
> (which makes the flag "DRM_BRIDGE_OP_HPD" depend on the IRQ) is the
> correct one.
> 
> Unfortunately, I think the above will confuse the stable scripts.
> Since your patch applied cleanly atop the first commit then it will
> picked to any kernels with it, even if they don't have the second
> commit.
> 
> I think the first commit landed in v6.16 and the second commit isn't
> yet in any stable release.
> 
> Maybe the right way to look at this is to just call the 2nd patch a
> prereq? So this:
> 
> Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for
> DisplayPort connector type")
> Cc: <stable@vger.kernel.org> # 6.16: 9133bc3f0564: drm/bridge: ti-sn65dsi86: Add
> 
> That will cause the 2nd patch to get picked up for stable too, but
> that would be preferable to having just your fix without the 2nd
> patch. Alternatively, you could try to add some other note to the
> stable team to help them arrive at the right backport.

We had some internal review before sending this patch and I am the one
that suggested to put both commit as fixes in the end.

I agree that your solution is the correct one (I am not familiar with
the syntax there, but I agree on the concept), assuming
nobody disagree on this, should we send a v2, or are you going to amend
the commit message when applying it?

Thanks,
Francesco

