Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E858799C390
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDCE10E004;
	Mon, 14 Oct 2024 08:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ineZg90O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665B110E004
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:39:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D401A40005;
 Mon, 14 Oct 2024 08:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728895149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=xwwJA2Ql/p3nTNZMaPBavk6qkt9+5ofr39jFUmX7VhI=;
 b=ineZg90OqmePX7mn3689VWQggegHmILcoG+eV2jVywRM+7g+p6UNSiRSJyfBWUJ+1GCCfd
 N8TWq03ukFGTAa172JFIlVMqkcq1QihyPs/3m0Uz02NYvcO4NR+YgDWs+WcwW6XzXG+Jfb
 9m18RWEXQSm11lM86z9eHmkbUTFQx2bpbqQUKJ8qx4Hd5wwuXQYqHoUIkGU/d7yBbSIl7T
 WDTiM5eAAEQSrX9WPlQsCFysoD4leiJU14/CJSHLyZBKjlIHa0gy+5iI9+6LaXItSW1K3T
 48hQd5kerhAjSvuzslYODURuuS1EeGE+AMDvWxYDMlKK2VYRANGS/YoLXahROg==
Date: Mon, 14 Oct 2024 10:39:06 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maira Canal <mairacanal@riseup.net>
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
Message-ID: <ZwzYqihbReaLFn-c@louis-chauvet-laptop>
Mail-Followup-To: Maira Canal <mairacanal@riseup.net>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <608074ed-567c-4e6d-b1c2-9e0ecf1d102b@riseup.net>
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

On 11/10/24 - 10:53, Maira Canal wrote:
> Hi Louis,
> 
> On 10/11/24 06:36, Louis Chauvet wrote:
> > 
> > Hi all,
> > 
> > Until this point, this series has not received any major comments since
> > v9. I will commit patches 1-9 next week if there are no further comments.
> > 
> 
> Although we are maintainers of VKMS, it isn't recommended that we push
> our own changes without even the Ack of another person. Please, read the
> "drm-misc Committer Guidelines" [1].

Hi Maíra, Maxime,

I apologize for this rushed commit request. I sent the initial email with 
a delay before the commit action because I was not sure about the 
procedure and wanted to give others a chance to raise any concerns. 
Unfortunately, I overlooked the need to collect an Ack/Review for each 
patch, even when there hadn't been any responses for several months. I'm 
sorry for this oversight.

> I can ack patches 05/15, 07/15, and 09/15, but it would be more
> beneficial for the community if you ask for an ack (from me or from the
> DRM maintainers, which are always around), instead of saying that you
> are going to commit the patches without any review.

I will be happy to ask for acknowledgments if needed, but as you mentioned 
multiple times: nobody is paid to maintain VKMS. Since you did not comment 
these series since July, when you told me you would review my patches, I 
assumed it was either okay or you no longer had the time to maintain 
(which I completely understand).

So, I hereby formally request reviews/ACKs for the following series:

[this series]:https://lore.kernel.org/all/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com/
[2]:https://lore.kernel.org/all/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com/
[3]:https://lore.kernel.org/all/20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com/

(I have to send a v2 for [3] because of rebase conflict, but nothing else 
changed)

Thanks a lot,
Louis Chauvet
 
> [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html
> 
> Best Regards,
> - Maíra
> 
> > For patches 10-15, I am currently waiting for feedback from Maxime to
> > send the next iteration with a fix for kunit tests.
> > 
> > Thanks,
> > Louis Chauvet
> > 
> > On 07/10/24 - 18:10, Louis Chauvet wrote:
> > > As all the rotation are now supported by VKMS, this simplification does
> > > not make sense anymore, so remove it.
> > > 
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >   drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
> > >   1 file changed, 1 insertion(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > > index 8875bed76410..5a028ee96c91 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > @@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> > >   	frame_info->fb = fb;
> > >   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
> > >   	drm_framebuffer_get(frame_info->fb);
> > > -	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
> > > -									  DRM_MODE_ROTATE_90 |
> > > -									  DRM_MODE_ROTATE_270 |
> > > -									  DRM_MODE_REFLECT_X |
> > > -									  DRM_MODE_REFLECT_Y);
> > > -
> > > +	frame_info->rotation = new_state->rotation;
> > >   	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
> > >   }
> > > 
> > > -- 
> > > 2.46.2
> > > 
