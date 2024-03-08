Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FA7876BF0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 21:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B6710E259;
	Fri,  8 Mar 2024 20:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="P+psoRYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DCD10E259
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/47zSNS8X3eOPzjZdvlkdHcgjIKBxlrq4BUs8maJTKI=; b=P+psoRYM5z3lfXYWFwEz/bAINB
 OPOxutLt5xDfXAWdDKQpYEoteejZVcbRTgwcL5gWxB6YQBIlcM928wCP3ORY0SB6AtDgpXfRmfJ6W
 O6WiGduHj8ETWuoDJElwDFkf7KtsF01vYBDlglzNb5jy9s3fp/XVi7qNDiYiAKJXJxduI9SBwA5AG
 FGFY6sBpwcAXQ+UjRfQ0IDlv5ENI+LPo1yeB6ObG0g9KgE3rMTNIrIsW0V9zYbLRlSnZ42GKeKc6p
 gmO20XmEZYn5mFQEt6pd/HVxnHy2yiQes02adum0ST3BaFnT7KbtZJHN9jpiiivU1aBZ0YPBbpQMY
 5YSHJUKg==;
Received: from [186.230.26.74] (helo=[10.39.29.45])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rigyw-007xOC-Fz; Fri, 08 Mar 2024 21:38:18 +0100
Message-ID: <4b01ba61-9184-4a17-9fe6-59eb88a21214@igalia.com>
Date: Fri, 8 Mar 2024 17:38:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Additions to "Reimplement line-per-line pixel
 conversion for plane reading" series
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
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

Hi Arthur,

Would it be possible for you to coordinate with Louis and create a
single series with all the modification?

I don't see a reason to submit fixes to a series that it is still
on review.

Best Regards,
- Maíra

On 3/6/24 17:03, Arthur Grillo wrote:
> These are some patches that add some fixes/features to the series by
> Louis Chauvet[1], it was based on top of the patches from v4.
> 
> Patches #2 and #3 should be amended to "[PATCH v4 11/14] drm/vkms: Add
> YUV support". To make patch #3 work, we need patch #1. So, please, add
> it before the patch that #2 and #3 amend to.
> 
> Patches #4 to #6 should be amended to "[PATCH v4 14/14] drm/vkms: Create
> KUnit tests for YUV conversions". While doing the additions, I found
> some compilation issues, so I fixed them (patch #4). That's when I
> thought that it would be good to add some documentation on how to run
> them (patch #7), this patch should be added to the series as new patch.
> 
> [1]: https://lore.kernel.org/r/20240304-yuv-v4-0-76beac8e9793@bootlin.com
> 
> To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> To: Melissa Wen <melissa.srw@gmail.com>
> To: Maíra Canal <mairacanal@riseup.net>
> To: Haneen Mohammed <hamohammed.sa@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: arthurgrillo@riseup.net
> To: Jonathan Corbet <corbet@lwn.net>
> To: pekka.paalanen@haloniitty.fi
> To: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: jeremie.dautheribes@bootlin.com
> Cc: miquel.raynal@bootlin.com
> Cc: thomas.petazzoni@bootlin.com
> Cc: seanpaul@google.com
> Cc: marcheu@google.com
> Cc: nicolejadeyee@google.com
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> Arthur Grillo (7):
>        drm: Fix drm_fixp2int_round() making it add 0.5
>        drm/vkms: Add comments
>        drm/vkmm: Use drm_fixed api
>        drm/vkms: Fix compilation issues
>        drm/vkms: Add comments to format tests
>        drm/vkms: Change the gray RGB representation
>        drm/vkms: Add how to run the Kunit tests
> 
>   Documentation/gpu/vkms.rst                    |  11 +++
>   drivers/gpu/drm/vkms/tests/vkms_format_test.c |  81 +++++++++++++++++++--
>   drivers/gpu/drm/vkms/vkms_drv.h               |   4 +
>   drivers/gpu/drm/vkms/vkms_formats.c           | 101 +++++++++++++++++++-------
>   include/drm/drm_fixed.h                       |   2 +-
>   5 files changed, 165 insertions(+), 34 deletions(-)
> ---
> base-commit: 9658aba38ae9f3f3068506c9c8e93e85b500fcb4
> change-id: 20240306-louis-vkms-conv-61362ff12ab8
> 
> Best regards,
