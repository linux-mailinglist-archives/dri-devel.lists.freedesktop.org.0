Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF58FE5B4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9799510E90D;
	Thu,  6 Jun 2024 11:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3sml7F9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FC510E90D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717674300;
 bh=cD3Jsio92s31TDYJCHOEGyn5uxqsUCgDOpPoEWrtzSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=3sml7F9UeZ6Pd1mHhkDdgob/2Ebsf9axWIcs5viD3rqI0ZrSfatluuz3WXQCDw556
 +fQ8DVou0JDE8t9ETvDXzM2hs4StwjhBQymIl7oo2ruXPJ9hDDng+k5X1kvFujKCpD
 PW//QTOwHWYsMj2DTDfF8GmRywiONkiOo7TF6RDwGG+iRqz+6Jcd1enjPZ+ziN0VkX
 XHwqwr/KKun+iL0SP7bEHCuZUdCGtcqVkC+qRwMiwZUvXQnlFqy7NfUW16bBcf4wTs
 woxrG/UfUC5ZTteeOBJQp3hMaFXk8CE/1RTOpIfuwTJKXXuTwKH0cRDlFFgehNxIr3
 trRzrQbe5B5Hw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: sebastianfricke)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 47E7A378061A;
 Thu,  6 Jun 2024 11:45:00 +0000 (UTC)
Date: Thu, 6 Jun 2024 13:44:59 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, adobriyan@gmail.com,
 jani.nikula@intel.com
Subject: Re: [PATCH v12 12/13] media: imagination: Round to closest multiple
 for cropping region
Message-ID: <20240606114459.x73yebdu7kg7re52@basti-XPS-13-9310>
References: <20240604104001.2235082-1-devarsht@ti.com>
 <20240604105335.2257629-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240604105335.2257629-1-devarsht@ti.com>
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

Hey,

On 04.06.2024 16:23, Devarsh Thakkar wrote:
>If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
>(V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
>multiple of requested value while updating the crop rectangle coordinates.
>
>Use the rounding macro which gives preference to rounding down in case two
>nearest values (high and low) are possible to raise the probability of
>cropping rectangle falling inside the bound region.
>
>This complies with the VIDIOC_G_SELECTION, VIDIOC_S_SELECTION ioctl
>description as documented in v4l uapi [1] which specifies that driver
>should choose crop rectangle as close as possible if no flags are passed by
>user-space, as quoted below :
>
>"``0`` - The driver can adjust the rectangle size freely and shall choose a
>crop/compose rectangle as close as possible to the requested
> one."
>
>Link: https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst [1]
>Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

Acked-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Can, whoever picks up the math changes, pick up this change as well?
I will send 1-6 via the media subsystem.

Regards,
Sebastian

>---
>V12: No change
>V11: No change
>V10: No change
>V9:  No change
>V8:  Update commit message with specification reference
>V1->V7 (No change, patch introduced in V7)
>---
> drivers/media/platform/imagination/e5010-jpeg-enc.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
>index e701d573a26a..d65646f0c38c 100644
>--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
>+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
>@@ -517,10 +517,10 @@ static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection
>
> 	switch (s->flags) {
> 	case 0:
>-		s->r.width = round_down(s->r.width, queue->fmt->frmsize.step_width);
>-		s->r.height = round_down(s->r.height, queue->fmt->frmsize.step_height);
>-		s->r.left = round_down(s->r.left, queue->fmt->frmsize.step_width);
>-		s->r.top = round_down(s->r.top, 2);
>+		s->r.width = round_closest_down(s->r.width, queue->fmt->frmsize.step_width);
>+		s->r.height = round_closest_down(s->r.height, queue->fmt->frmsize.step_height);
>+		s->r.left = round_closest_down(s->r.left, queue->fmt->frmsize.step_width);
>+		s->r.top = round_closest_down(s->r.top, 2);
>
> 		if (s->r.left + s->r.width > queue->width)
> 			s->r.width = round_down(s->r.width + s->r.left - queue->width,
>-- 
>2.39.1
>
