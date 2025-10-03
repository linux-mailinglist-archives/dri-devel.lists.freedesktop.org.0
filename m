Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113BBBB6859
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 13:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0074110E0F2;
	Fri,  3 Oct 2025 11:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7gbZbRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B7710E0F2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759489883; x=1791025883;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TJ/zTARjd6zDQqIFw2UEQM3Af58gXd0HfmyZ/pNfT+I=;
 b=c7gbZbRgtVlZPsXijBqXi+sjSQTQRzwnDaRGlt6NmJyC9gZU2lAsE3Ys
 OGbEbZaXh0ScOjyKMyrubRUQ6ES24ymYaTcWRGrCFOqxYHIpvYzQ03AGV
 9pIKJkQvS+5n4X0V/Aqar/gaYu5FyBHtZKvEP1AUS232X25lXayKZFpZZ
 /PU/sy/Ky4sMppvNkU0pBHqOYvcuaUJeuqxRRQzouou68Qru1nlrHoRAV
 5MDVn9Pe81u4HIu6YiL7oKcbWZhoEN+ZVaMcH489RpWwyThME0UhtIV6r
 tXrBYP9sNaUTWnnsQyfb6sTZAOddV+sfQcjKEJixtIsyClvafqEvKvrZo g==;
X-CSE-ConnectionGUID: EhGW5BHUS0CD3YdSzm//YQ==
X-CSE-MsgGUID: gRG/eQK6Q8y+W0en4hjbjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72448906"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="72448906"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:11:22 -0700
X-CSE-ConnectionGUID: ovhbu1PYSiKLcRvdCvHezg==
X-CSE-MsgGUID: hVMv4WNBSzKNCrGoQPRhCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="178870975"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.94])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:11:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chintan Patel <chintanlike@gmail.com>,
 maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com, Chintan Patel
 <chintanlike@gmail.com>
Subject: Re: [PATCH v3] drm/vblank: downgrade vblank wait timeout from WARN
 to error
In-Reply-To: <20251003032303.16518-1-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251003032303.16518-1-chintanlike@gmail.com>
Date: Fri, 03 Oct 2025 14:11:15 +0300
Message-ID: <5871956eef6c89f8361faae84c515c0e8356fc71@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Oct 2025, Chintan Patel <chintanlike@gmail.com> wrote:
> When wait_event_timeout() in drm_wait_one_vblank() times out, the
> current WARN can cause unnecessary kernel panics in environments
> with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
> under heavy scheduling pressure or in rare cases of delayed vblank
> handling, and are not always a kernel bug.
>
> Replace the WARN with drm_err() messages that report the timeout
> without crashing the system. Developers can still enable drm.debug
> to diagnose genuine problems.

No need to resend for this, can be fixed while applying, but the last
sentence is no longer meaningful with drm_err().

BR,
Jani.

>
> Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D147ba789658184f0ce04
> Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>
> v2:
>  - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
>  - Remove else branch, only log timeout case
>
> v3:
>  - Use drm_err() instead of drm_dbg_kms() (suggested by Ville Syrj=C3=A4l=
=C3=A4)
>  - Remove unnecessary curr =3D drm_vblank_count() (suggested by Thomas Zi=
mmermann)
>  - Fix commit message wording (=E2=80=9Cinvalid userspace calls=E2=80=9D =
=E2=86=92 =E2=80=9Cdelayed vblank handling=E2=80=9D)
> ---
>  drivers/gpu/drm/drm_vblank.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 46f59883183d..0664aea1b924 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1305,7 +1305,8 @@ void drm_wait_one_vblank(struct drm_device *dev, un=
signed int pipe)
>  				 last !=3D drm_vblank_count(dev, pipe),
>  				 msecs_to_jiffies(100));
>=20=20
> -	drm_WARN(dev, ret =3D=3D 0, "vblank wait timed out on crtc %i\n", pipe);
> +	if (!ret)
> +		drm_err(dev, "vblank wait timed out on crtc %i\n", pipe);
>=20=20
>  	drm_vblank_put(dev, pipe);
>  }

--=20
Jani Nikula, Intel
