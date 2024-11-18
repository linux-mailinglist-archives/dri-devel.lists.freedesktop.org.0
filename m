Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FEA9D1868
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 19:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F7510E25E;
	Mon, 18 Nov 2024 18:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mEh5cXJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A035310E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 18:49:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5473360003;
 Mon, 18 Nov 2024 18:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731955763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Md1XUrZaQM8/jX11ObZtCSxOQxVCCrmEMdjs84Baes4=;
 b=mEh5cXJnrg96erKoIGcKlzeyn8C0TWy83D5ONLqkm9aUJrtN10zIfBLpvGXxGJmkgzrBR/
 dnTiNZkxql2OMHArGUcv5qSZ9Rhtc+jZS324nd/y5cJHdVQE+0Easl9GWFJPV6FP9KEGOW
 1dGweJARRLwVPao13GcIDib2aCBSd5VceEX8H6pSU6sdCKn+Wku9xRpa7LGveS7DbnQWXW
 Kj4pv++b4v2h7zHc9qxT8mo0BY1PO4a6WtZXnuQVD8XRB49A7U0Qtmjvmp77ixixt0NMs2
 iBkgdhqCDZVR1eHh/iae9MQl0ZmjgFYZngxMX8gHdgGqkeJBoi2sHnyVMN+y9w==
Date: Mon, 18 Nov 2024 19:49:19 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v13 0/7] drm/vkms: Add support for YUV and DRM_FORMAT_R*
Message-ID: <ZzuML6-OZZjBrTfb@louis-chauvet-laptop>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20241118-yuv-v13-0-ac0dd4129552@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-yuv-v13-0-ac0dd4129552@bootlin.com>
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

On 18/11/24 - 19:43, Louis Chauvet wrote:
> This series depends on [1].
> 
> This patchset is extracted from [1]. The goal is to introduce the YUV
> support, thanks to Arthur's work.
> 
> - PATCH 1: Add the support of YUV formats
> - PATCH 2: Add some drm properties to expose more YUV features
> - PATCH 3: Cleanup the todo
> - PATCH 4..6: Add some kunit tests
> - PATCH 7: Add the support of DRM_FORMAT_R1/2/4/8
> 
> [1]: https://lore.kernel.org/r/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
> 
> Changes since previous series:
>  - Fix build test as modules issue: https://lore.kernel.org/all/202410110407.EHvadSaF-lkp@intel.com/
>  - Export required symbols in DRM core to use them in kunit
>  - Update the kunit comments according to Maxime's feedback
>  - Link to original series: https://lore.kernel.org/r/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com

Sorry for the mistake, it is not a v13, but a v1, I think I did something 
wrong with b4.

Do I need to resend a v1 or just continue the numbering with v14, v15...

Sorry,
Louis Chauvet
