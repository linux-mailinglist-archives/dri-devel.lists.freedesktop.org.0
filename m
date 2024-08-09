Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCBE94D5EB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE3210E9CD;
	Fri,  9 Aug 2024 17:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Wqjv+a84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEBA10E9CD
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 17:59:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D85420003;
 Fri,  9 Aug 2024 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723226392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xAub0mkPJ87xzsTXaBjAQ8FSWOArTO6I288vqwLrdYQ=;
 b=Wqjv+a84Ko1Fp2vlL/me5E8Q6bdXY+NpnPLT86U22+ahV6L2JllKhqWejwTpJeYjnMQliT
 RaxRcjyyTNwbFA6FYv0Mlc/01cmPslLEfQ3PtjzToVtyMR8I//KonRmam76Teqkh+wxMx9
 rdoVeEJvFXtIZryjwEk91Sa+kM8axhxr27qbIEogOOe/mJwzgR1QjZYJef+6HFO968tzBW
 55n0OOwFH/YDe0/+ElGJGVk3kw+5mGxlFPNYBW3/wNddw48eA1fNwF13BM6RcoOkb6E8Vz
 nYwvrkYPqz0hf2hLqmhh8+j4o/T1zth2/h1WXgGWOlOrl7IV5lx0UYIDxpUCIg==
Date: Fri, 9 Aug 2024 19:59:49 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: Marius Vlad <marius.vlad@collabora.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, mduggan@chromium.org, melissa.srw@gmail.com,
 mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com
Subject: [RFC] Adds support for ConfigFS to VKMS!
Message-ID: <ZrZZFQW5RiG12ApN@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 Marius Vlad <marius.vlad@collabora.com>,
 Jim Shargo <jshargo@google.com>, daniel@ffwll.ch,
 brpol@chromium.org, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, hirono@chromium.org, jshargo@chromium.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, mduggan@chromium.org, melissa.srw@gmail.com,
 mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

I'm excited to share some good news! I've recently completed the addition 
of a ConfigFS interface to VKMS, which allows to configure VKMS from 
user-space, at runtime. You should be able to:
- Create new devices
- Create planes/crtc/encoders
- Configure rotation, color range, color encoding
- Link planes, crtc and encoders.

The entire series can be found on my GitHub repository:
https://github.com/Fomys/linux/tree/b4/new-configfs

This series is big, consisting of over 40 commits. Although it's not 
completely cleaned up, all commits compile successfully and (almost) pass 
checkpatch.

I plan to split this series into several smaller ones:

 - Adding support for additional color formats
	4a4f75873cca..d74006d7f9c4
 - Reintroducing the writeback algorithm
	9e74d259e1be..f839dcf6a7d8
 - Clarifying documentation
	b3bfd0ba2283..93945f0fbfc7
 - Properly splitting headers
	c70018038572..67258bd8a180
 - Switching to drmm_ helpers
	844e701e1d6d..f3050d125f64
 - Using a proper platform device driver
	4658f99dfe3e..a3258e4d7550
 - Introducing a vkms_config structure
	95ad6da46638..5b2d080b4626
 - Adding ConfigFS support
	866ad75102ae..f900ad18ab8c

What's currently missing:

 - A deep cleanup to ensure checkpatch compliance and proper
   functionality for every commit
 - Updating documentation
 - Reviews 

The primary area where I need assistance is reviews and testers. I'm aware 
that Maìra is very busy and can't review quickly, but any other 
individuals who can test and/or review this series would be greatly 
appreciated.

My next step is to add connector support, but as I will use this work and 
my previous series [1], I would like to see it merged first.

If any of the original authors would like to be credited for 
their contributions, please let me know. I rewrote most of the code, but 
the general idea was originally from them.

José, I am sorry, I think I missed your mail where you told me you already 
reviewed some commits: 

> I reviewed the first 9 patches and added a few comments on your
> GitHub fork.

I am not able to find any comments, can you send me the link to the page 
with them? I would like to read/apply them before submitting the first 
part of the series.

Thanks for your time,
Louis Chauvet

[1]: https://lore.kernel.org/all/20240809-yuv-v10-0-1a7c764166f7@bootlin.com/

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
