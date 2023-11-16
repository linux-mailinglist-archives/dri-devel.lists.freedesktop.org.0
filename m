Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E415E7EE085
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD0F10E263;
	Thu, 16 Nov 2023 12:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908910E263
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1700136899; x=1700396099;
 bh=peIdrePwT8uOuhEHgYRJoTaPJUFwzal6w1Hv2WtpNCo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=KVYvMq7aUUgkkM4hhRzz9XhWI+nkkhDGTbCDwnU/ctZr0Nm2+qG84sztDrDTvJjdf
 /UMyuWgoWQDW2LWkaGN+J+qP0Et3l9XrhZgRWnHs8IuH/NLkk0hasslujZzRtfg1Ve
 Q0QAQSx7oCxchKdAR4cZ2T5u7sY5sAdD7gSAD+V4Ixtp769LL1gzBRF4foscxG92Dx
 lCci/swQew4QXOcGq/5VeXHwsffnGQj271Fne2Wj7/bRIBdktfeY+XxDhwjrYUGF6e
 zCZLKPGWE/Z4pvFKOuW/WjBuuNw539vlcMexnBAJG1B3kgVS1KvXT/rrZWXJiCsoLL
 jGa19YgrPfBgQ==
Date: Thu, 16 Nov 2023 12:14:51 +0000
To: Thomas Zimmermann <tzimmermann@suse.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
Message-ID: <vhshocGSkXgVLycHIcJIVPsN9OQokPA2NCgIBqOvIzpKRZXQjN1uEiFKVudwa-S4hpBnFPaxxYh8hCFxd-u_ahYKBamQxFzIhBkYGkND9Kc=@emersion.fr>
In-Reply-To: <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
References: <20231115131549.2191589-1-javierm@redhat.com>
 <20231115131549.2191589-5-javierm@redhat.com>
 <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 16th, 2023 at 13:06, Thomas Zimmermann <tzimmermann@s=
use.de> wrote:

> > + * Note that there are two types of damage handling: frame damage and =
buffer
> > + * damage. The type of damage handling implemented depends on a driver=
's upload
> > + * target. Drivers implementing a per-plane or per-CRTC upload target =
need to
> > + * handle frame damage while drivers implementing a per-buffer upload =
target
> > + * need to handle buffer damage.
> > + *
> > + * The existing damage helpers only support the frame damage type, the=
re is no
> > + * buffer age support or similar damage accumulation algorithm impleme=
nted yet.
> > + *
> > + * Only drivers handling frame damage can use the mentiored damage hel=
pers to

Typo: mentioned

> > + * iterate over the damaged regions. Drivers that handle buffer damage=
, need to
> > + * set &struct drm_plane_state.ignore_damage_clips as an indication to
> > + * drm_atomic_helper_damage_iter_init() that the damage clips should b=
e ignored.
> > + * In that case, the returned damage rectangle is the &drm_plane_state=
.src since
> > + * a full plane update should happen.
> > + *
> > + * For more information about the two type of damage, see:
> > + * https://registry.khronos.org/EGL/extensions/KHR/EGL_KHR_swap_buffer=
s_with_damage.txt
> > + * https://emersion.fr/blog/2019/intro-to-damage-tracking/
>=20
> One thought you might want to consider.
>=20
> These URLs are helpful. The only issue I have is that frame damage and
> buffer damage are user-space concepts. The kernel bug is that damage
> handling expects the backing storage/upload buffer not to change for a
> given plane. If the upload buffer changes between page flips, the new
> upload buffer has to be updated as a whole. Hence no damage handling then=
.

Why would these concepts be specific to user-space? The kernel could
better handle buffer damage instead of forcing full damage, by doing
something similar to what user-space does.

Anyways:

Reviewed-by: Simon Ser <contact@emersion.fr>
