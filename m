Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01701669F03
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 18:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40D410EA69;
	Fri, 13 Jan 2023 17:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0274A10EA69
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 17:04:35 +0000 (UTC)
Date: Fri, 13 Jan 2023 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1673629473; x=1673888673;
 bh=GlMnc6b85yOLmMsfeJFbICvTjDOfdld9Ix3sB9kuuBI=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=YqYOlvg6gMoZ84y6e79wdt2eCIQSBXffGp2bwQmAapgZptN26qFyuZoTtQyzxouDu
 FZQ5P5zg8S50wFHj3qAOcs8g9XkIr19M91wd5xBUIbHWXuDhAUANibcq56VGkEodmL
 X0jKCNQWGDw8Ui8OYhIJVWnKJWJPWFH6zMPtxesIbKmKYR94CtF1I1PQKCfkT/QBtL
 13AHl6wcXYoAVnaZ/tvJaEj52XOEFOzYpMLHTTdHKIYPcVnu5AqhYdYsnk7gmyzZzg
 POqCkoMp3XVAbTPHtn3I7EmudwVk7mxA6h9uhXA0hj8lHuRWYKQdQRNm5CCKJqQHdy
 WMSITgLx3YHtA==
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 1/3] drm/framebuffer: Check for valid formats
Message-ID: <sNwSknyHR3KzB2oXH3UlZArQlVEB44QmwImCcV5ng2Wpc1du4pPRgoT-mp4oJoU5N-rxxSUDWjoLVAC7FtAylP3vTR42ov-SU2qlAb23a-w=@emersion.fr>
In-Reply-To: <20230113165919.580210-2-mcanal@igalia.com>
References: <20230113165919.580210-1-mcanal@igalia.com>
 <20230113165919.580210-2-mcanal@igalia.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: amd-gfx@lists.freedesktop.org,
 =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, January 13th, 2023 at 17:59, Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:

> +=09/* Verify that the modifier is supported. */
> +=09if (r->modifier[0] && drm_drv_uses_atomic_modeset(dev) &&
> +=09    !drm_any_plane_has_format(dev, r->pixel_format, r->modifier[0])) =
{
> +=09=09drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx=
\n",
> +=09=09=09    &r->pixel_format, r->modifier[0]);
> +=09=09return -EINVAL;
> +=09}

User-space indicates whether there is a modifier in the IOCTL data by suppl=
ying
the DRM_MODE_FB_MODIFIERS flag. I believe we need to check that flag instea=
d of
r->modifier[0]: the zero modifier is a valid modifier (LINEAR).
