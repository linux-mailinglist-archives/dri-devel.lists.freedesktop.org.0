Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09708C30B44
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 12:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1026810E25B;
	Tue,  4 Nov 2025 11:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KkcbnEER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAC710E25B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 11:21:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A8C141B34;
 Tue,  4 Nov 2025 11:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227C2C4CEF7;
 Tue,  4 Nov 2025 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762255284;
 bh=LiZJY/3wCT03/9ZLDXQDP1aBdRc5YScmWSbm14KOsPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KkcbnEER5owyw8/sqVExh1KJpmqHnUwWMApK/ti/BnI0pXk4aMwuM8DhLAax35FmO
 rzGK+PmtqpC5ZHd8n1BQZ6KXsv48K0FBpiETLoB9QYcr7wVBFDJYXNMzroFXd8h+6f
 VK4Q+I4KQhdRfr9OMouXlAgS6Og/gKCg6EyTc8yxE4dvNbzZh8lMS0ZIYiTGqOJtvo
 LbN+GAw5ptKl9bbpzSqoOhfbgwbrcA+pK4sSgBpNpeYpkfmzlLzz23xIFVgbKMBQah
 +632D6PJf0to/Qn+MztvmBizvmyI4jIJF9tjtqecJ0JR0AaEUCywX+ENJgdv7zgShs
 SJ+Njqy00S4aw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vGF6M-000000007OP-1nwh;
 Tue, 04 Nov 2025 12:21:27 +0100
Date: Tue, 4 Nov 2025 12:21:26 +0100
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?Q?Rapha=C3=ABl?= Gallais-Pou <rgallaispou@gmail.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
Message-ID: <aQnhtkIG9-A7yH-H@hovoldconsulting.com>
References: <20250922122012.27407-1-johan@kernel.org>
 <aQTtlvoe96Odq96A@thinkstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQTtlvoe96Odq96A@thinkstation>
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

On Fri, Oct 31, 2025 at 06:10:46PM +0100, Raphaël Gallais-Pou wrote:

> Le Mon, Sep 22, 2025 at 02:20:12PM +0200, Johan Hovold a écrit :
> > Make sure to drop the references taken to the vtg devices by
> > of_find_device_by_node() when looking up their driver data during
> > component probe.
> 
> Markus suggested “Prevent device leak in of_vtg_find()” as commit
> summary.

Markus has gotten himself banned from the mailing lists some years ago
and even if he is now back with a new mail address most of us still
ignore him.

I prefer the Subject as it stands since it captures when the leaks
happens, but I don't mind mentioning of_vtg_find() instead if you
insist.

> > Note that holding a reference to a platform device does not prevent its
> > driver data from going away so there is no point in keeping the
> > reference after the lookup helper returns.
> > 
> > Fixes: cc6b741c6f63 ("drm: sti: remove useless fields from vtg structure")
> > Cc: stable@vger.kernel.org	# 4.16
> > Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/gpu/drm/sti/sti_vtg.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
> > index ee81691b3203..ce6bc7e7b135 100644
> > --- a/drivers/gpu/drm/sti/sti_vtg.c
> > +++ b/drivers/gpu/drm/sti/sti_vtg.c
> > @@ -143,12 +143,17 @@ struct sti_vtg {
> >  struct sti_vtg *of_vtg_find(struct device_node *np)
> >  {
> >  	struct platform_device *pdev;
> > +	struct sti_vtg *vtg;
> >  
> >  	pdev = of_find_device_by_node(np);
> >  	if (!pdev)
> >  		return NULL;
> >  
> > -	return (struct sti_vtg *)platform_get_drvdata(pdev);
> > +	vtg = platform_get_drvdata(pdev);
> > +
> > +	put_device(&pdev->dev);
> 
> I would prefer of_node_put() instead, which does the same basically, but
> at least it is more obviously linked to of_find_device_by_node().

of_node_put() operates on OF nodes, but here it is the platform device
that is leaking.

> > +
> > +	return vtg;
> >  }

Johan
