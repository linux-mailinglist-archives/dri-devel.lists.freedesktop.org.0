Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79D91E73F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 20:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE94B10E4CF;
	Mon,  1 Jul 2024 18:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="ViFKjOnO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C605C10E4CF
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 18:15:15 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4WCZ2p6TY9zDql0;
 Mon,  1 Jul 2024 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1719857715; bh=QseJPPx4W8bBEr4BuyPO9KS4jwHMWSvIQx0Jjb5czes=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ViFKjOnO1J7b4+dF7tTtyUkBPGc4Tk973LbW2yQExKo+DpzjGs+4QcpDRsOg06F3p
 o9Lan3T4ShOXKGZCEvMRxqnlY3ZaaPjqVPcunhPdbhS0/XncmV05Y85BlZrxPqgre8
 XXD8u/qTXDyTwCZX9HaVFUM4zn2xY3/MfqpeCGUg=
X-Riseup-User-ID: B88A74BDAAC8086B44F20CFA023858B79A3E2131DF8C1106D6E7EEC07A09B213
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4WCZ2f6YYFzFtKB;
 Mon,  1 Jul 2024 18:15:06 +0000 (UTC)
Message-ID: <2969cd21-5915-46fb-b4f0-c584100c15b1@riseup.net>
Date: Mon, 1 Jul 2024 15:15:04 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v8 00/17] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
 <ZoKpwWaX4LGqLC04@louis-chauvet-laptop>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <ZoKpwWaX4LGqLC04@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Louis,

On 7/1/24 10:06, Louis Chauvet wrote:
> Hi everyone,
> 
> I sent this iteration over a month ago, and I haven't received any
> feedback since then. The same goes for the two other series [1] and [2],
> which I sent after discussing with Melissa.

As you may know, Melissa is stepping down on her maintainership duties
for VKMS [1].

> 
> I'm a bit surprised that nothing has been reviewed or merged, as Maíra
> mentioned in [3] that she wanted to merge at least the first 11 patches. I
> just checked, and this series applies to drm-misc-next. However, if you
> encounter any issues, I can send a rebased version.

I want to get the series merged, but, as me and Melissa pointed out last
XDC, we are volunteers. AFAIK VKMS has been maintained by volunteers
since its beginning. We are doing our best to maintain VKMS, but we do
it in our free time.

I need to take some time to review and test this series properly. Then,
I can push it to drm-misc-next.

> 
> As you can see, I have more series ready ([2], [3]), and I am working on
> additional features (configfs [4], variable refresh rate, mst...).
> However, I am currently waiting for feedback on this series before
> proceeding further with the next topics.
> 
> What should I do to move those series forward?

I appreciate the work you are doing for VKMS. But, apart from adding new
features, we first need to ensure that VKMS is stable. Also, when
reviewing new features, I need to make even more tests to make sure that 
everything is still stable. Therefore, it is a slow process, but I hope
we can start to move forward.

[1] 
https://lore.kernel.org/dri-devel/20240525142637.82586-1-melissa.srw@gmail.com/

Best Regards,
- Maíra

> 
> Best regards,
> Louis Chauvet
> 
> [1]: https://lore.kernel.org/all/20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com/
> [2]: https://lore.kernel.org/all/20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com/
> [3]: https://lore.kernel.org/all/c83255f4-745e-43e6-98e0-2e89c31d569a@igalia.com/
> [4]: https://github.com/Fomys/linux/tree/b4/new-configfs
> 
