Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE0A91E036
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 15:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C1710E402;
	Mon,  1 Jul 2024 13:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K0UZTwOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B1910E402
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 13:06:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8624060003;
 Mon,  1 Jul 2024 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1719839172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOigm+lmrrAayqgxGapMPlIg5+QAdA30qXZZ1VJ9MgE=;
 b=K0UZTwOZRzVe/+8QVUPUZnI5ZqLpGOmEoiR6fE/1Rx9/9UTuImMOwsL+NqmPdV+5bEtId5
 Xe4xlnXP/lWu4m7Yg6hOT//UyYZXc+BOwZGJRjJWgIKc4H8u9Xo7M8SRZnf33I1Z/Cq5HY
 NVSJQ6rfOuneCzN75ViNv8l7ejHfAobZcxJxgqESVkUlLDVIrWSwxsf9M0CDUujUSGQjn+
 s9wJ+dDY3nG0sMhiRxTSjo0vU8joRjIvU2QLPJlPk9ZwAfSay06ZhmQOO/Ef0Ss1lYWPpR
 yKUsK3YJOPmEl5HAotX+HZZMFV9o8QzD/2P3BTz9fzSmnf0zcdMVIBMiI7krPg==
Date: Mon, 1 Jul 2024 15:06:09 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v8 00/17] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Message-ID: <ZoKpwWaX4LGqLC04@louis-chauvet-laptop>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
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

Hi everyone,

I sent this iteration over a month ago, and I haven't received any 
feedback since then. The same goes for the two other series [1] and [2], 
which I sent after discussing with Melissa.

I'm a bit surprised that nothing has been reviewed or merged, as Maíra 
mentioned in [3] that she wanted to merge at least the first 11 patches. I 
just checked, and this series applies to drm-misc-next. However, if you 
encounter any issues, I can send a rebased version.

As you can see, I have more series ready ([2], [3]), and I am working on 
additional features (configfs [4], variable refresh rate, mst...). 
However, I am currently waiting for feedback on this series before 
proceeding further with the next topics.

What should I do to move those series forward?

Best regards,
Louis Chauvet

[1]: https://lore.kernel.org/all/20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com/
[2]: https://lore.kernel.org/all/20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com/
[3]: https://lore.kernel.org/all/c83255f4-745e-43e6-98e0-2e89c31d569a@igalia.com/
[4]: https://github.com/Fomys/linux/tree/b4/new-configfs

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
