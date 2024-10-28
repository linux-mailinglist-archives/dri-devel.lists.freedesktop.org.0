Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D219B2DC9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F379A10E01F;
	Mon, 28 Oct 2024 11:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PiizDYKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4BB10E01F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:01:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9730E000B;
 Mon, 28 Oct 2024 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730113281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BuA4RhxbdOAfhp//bXjXBCAMD3OmfZYY5iEB+CcgAM=;
 b=PiizDYKb2ls1gY1QuV98ayKgjKNvIRSJGlxvXWEYoHmYMCKvRNjhucLXYl1Y8VGduzXE4t
 9Ji1HdYk7YeqIyaSczxTAne/qcMc/uWLmipuUlxtWUefHHOvaSSm0jJ2yrGq3Mo9B8Uj+A
 Umu18l4KvzCdhRx9+vU+kaxFpZIF2tCh7KrcONyQ965jrFr3WFXd6R/NGtdsTyt6ZhiNKq
 ayLCDOXpMcHaGGGmcffaUXyx9plcSijHEnGsqVnIFKqNZaEI7Lm+oOylApc3xRtF6Yk7G4
 hSEvGg8KSHr6hvOrMShFD55k3H5x4uwv/J18W0XUH9GX0+SyPLNmDWFw8QKF7Q==
Date: Mon, 28 Oct 2024 12:01:08 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v12 09/15] drm/vkms: Remove useless drm_rotation_simplify
Message-ID: <Zx9u9K129dWhfzPQ@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <ZwzYqihbReaLFn-c@louis-chauvet-laptop>
 <d3e8bb5a-6053-4a2b-a445-0cf4e610f112@riseup.net>
 <Zx9eazDt3f2meyht@fedora>
 <6278651d-b61d-49d2-8151-7ab4ca03971c@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6278651d-b61d-49d2-8151-7ab4ca03971c@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 28/10/24 - 07:17, Maíra Canal wrote:
> Hi Louis,
> 
> On 28/10/24 06:50, Louis Chauvet wrote:
> > On 26/10/24 - 09:10, Maíra Canal wrote:
> > > Hi Louis,
> > > 
> > > On 14/10/24 05:39, Louis Chauvet wrote:
> > > > On 11/10/24 - 10:53, Maira Canal wrote:
> > > > > Hi Louis,
> > > > > 
> > > > > On 10/11/24 06:36, Louis Chauvet wrote:
> > > > > > 
> > > > > > Hi all,
> > > > > > 
> > > > > > Until this point, this series has not received any major comments since
> > > > > > v9. I will commit patches 1-9 next week if there are no further comments.
> > > > > > 
> > > > > 
> > > > > Although we are maintainers of VKMS, it isn't recommended that we push
> > > > > our own changes without even the Ack of another person. Please, read the
> > > > > "drm-misc Committer Guidelines" [1].
> > > > 
> > > > Hi Maíra, Maxime,
> > > > 
> > > > I apologize for this rushed commit request. I sent the initial email with
> > > > a delay before the commit action because I was not sure about the
> > > > procedure and wanted to give others a chance to raise any concerns.
> > > > Unfortunately, I overlooked the need to collect an Ack/Review for each
> > > > patch, even when there hadn't been any responses for several months. I'm
> > > > sorry for this oversight.
> > > > 
> > > > > I can ack patches 05/15, 07/15, and 09/15, but it would be more
> > > > > beneficial for the community if you ask for an ack (from me or from the
> > > > > DRM maintainers, which are always around), instead of saying that you
> > > > > are going to commit the patches without any review.
> > > > 
> > > > I will be happy to ask for acknowledgments if needed, but as you mentioned
> > > > multiple times: nobody is paid to maintain VKMS. Since you did not comment
> > > > these series since July, when you told me you would review my patches, I
> > > > assumed it was either okay or you no longer had the time to maintain
> > > > (which I completely understand).
> > > 
> > > Yeah, I'm a volunteer and no longer have time to maintain VKMS. A couple
> > > of weeks ago I sent a patch removing myself as VKMS maintainer. This
> > > doesn't imply that patches can be pushed without review.
> > 
> > I will acked-by and push your patch, it will be an easy "first commit". If
> > I do something wrong during the process, please tell me.
> > 
> > Thanks for this precision, I understood this, and I will not push without
> > reviews, don't worry!
> > 
> > Thanks a lot for all your reviews!
> > > We are a community with several active developers. Although I don't have
> > > time to properly review your patches, you can try to gather other
> > > developers to review your patches. You can try to use #dri-devel to get
> > > reviewers.
> > 
> > Thanks for the tip, I will do this!
> > 
> > > That said, you can add my ACK to patches 05/15, 07/15, and 09/15 and
> > > push the patches. I won't ack the YUV patches as I don't feel
> > > comfortable reviewing/acking those.
> > 
> > Perfect for the patches 1..9, it will be a very nice step forward and will
> > reduce my conflicts a lot with the rest of my work!
> > >> Acked-by: Maíra Canal <mairacanal@riseup.net>
> > > 
> > > BTW if the patches are fixing IGT tests, please update the list of fails
> > > and skips on DRM CI.
> > 
> > For this, how should I do? Commit the series and wait for the bot results?
> > Run tests on my computer (I only have a x86 VM)? Is there some doc
> > somewhere?
> 
> Check [1] for instructions on how to run the CI on GitLab.
> 
> [1] https://docs.kernel.org/gpu/automated_testing.html

Thanks for the link!

I am stuck at the first step, do I need to ask some right to create a repo 
on git.freedesktop.org? I don't see any button to create a repo, and I 
can't fork any existing kernel repo.

I also asked the access to CI-OK.

Thanks,
Louis Chauvet
 
> Best Regards,
> - Maíra
> 
> > 
> > Thanks a lot,
> > Louis Chauvet
> > 
> > > Best Regards,
> > > - Maíra
> > > 
> > > > 
> > > > So, I hereby formally request reviews/ACKs for the following series:
> > > > 
> > > > [this series]:https://lore.kernel.org/all/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com/
> > > > [2]:https://lore.kernel.org/all/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com/
> > > > [3]:https://lore.kernel.org/all/20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com/
> > > > 
> > > > (I have to send a v2 for [3] because of rebase conflict, but nothing else
> > > > changed)
> > > > 
> > > > Thanks a lot,
> > > > Louis Chauvet
> > > > > [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html
> > > > > 
> > > > > Best Regards,
> > > > > - Maíra
> > > > > 
> > > > > > For patches 10-15, I am currently waiting for feedback from Maxime to
> > > > > > send the next iteration with a fix for kunit tests.
> > > > > > 
> > > > > > Thanks,
> > > > > > Louis Chauvet
> > > > > > 
> > > > > > On 07/10/24 - 18:10, Louis Chauvet wrote:
> > > > > > > As all the rotation are now supported by VKMS, this simplification does
> > > > > > > not make sense anymore, so remove it.
> > > > > > > 
> > > > > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
> > > > > > >     1 file changed, 1 insertion(+), 6 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > > > > index 8875bed76410..5a028ee96c91 100644
> > > > > > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > > > > @@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> > > > > > >     	frame_info->fb = fb;
> > > > > > >     	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
> > > > > > >     	drm_framebuffer_get(frame_info->fb);
> > > > > > > -	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
> > > > > > > -									  DRM_MODE_ROTATE_90 |
> > > > > > > -									  DRM_MODE_ROTATE_270 |
> > > > > > > -									  DRM_MODE_REFLECT_X |
> > > > > > > -									  DRM_MODE_REFLECT_Y);
> > > > > > > -
> > > > > > > +	frame_info->rotation = new_state->rotation;
> > > > > > >     	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
> > > > > > >     }
> > > > > > > 
> > > > > > > -- 
> > > > > > > 2.46.2
> > > > > > > 
> 
