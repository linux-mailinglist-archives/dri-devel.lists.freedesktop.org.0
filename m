Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C489BCA65
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E49C10E2D4;
	Tue,  5 Nov 2024 10:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="jlwJqGnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 563 seconds by postgrey-1.36 at gabe;
 Tue, 05 Nov 2024 10:24:35 UTC
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2910E2D4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:24:35 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; s=key1;
 t=1730801710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCK/jIu4+/eQ9rMKru1nGfLzJOuNt5rtQEg1bUXqW+I=;
 b=jlwJqGnI65jXo/ALzYwviSqMluhCblUHuyPkpfbw7J0MlzDjKKO4MU/HeOmMIqagmtxBOT
 Q3lT8Hl856211zWflv7K1PPflNkvKxouZk9aeNixjF9dcUoWXrK7wYE08aJbVnQdp2rNEB
 Sz5qHx5CMgh0cG/QYwaw/cfUIdoSmWHkohsG0OqX+vGFqUxUTWzc80NIWNRCY3Z21d1yYj
 BX2Oa7GahknL++kNPIagwYbQgCIxAfqRn1Z43pkwt25hZVrh62/YpQ5p2hCJch4V26T2k9
 Z+gUit/4PShCYcGcr8B3aH0wZPmm5jD2qu09XgnEF/0tBHDda0rCVMty3h90EQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Nov 2024 02:15:03 -0800
Message-Id: <D5E5ZXW1K0A7.1VT1XCR1HIEST@kode54.net>
Cc: <kernel-dev@igalia.com>, "Simon Ser" <contact@emersion.fr>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, <joshua@froggi.es>,
 <ville.syrjala@linux.intel.com>, "Daniel Stone" <daniel@fooishbar.org>,
 "Xaver Hugl" <xaver.hugl@gmail.com>, "Harry Wentland"
 <harry.wentland@amd.com>, "Simona Vetter" <simona@ffwll.ch>, "Alex Deucher"
 <alexander.deucher@amd.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, "Leo Li" <sunpeng.li@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "David Airlie"
 <airlied@gmail.com>, "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, "Xinhui
 Pan" <Xinhui.Pan@amd.com>, <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND v9 1/2] drm/atomic: Let drivers decide which
 planes to async flip
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Christopher Snowhill" <chris@kode54.net>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
References: <20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com>
 <20241101-tonyk-async_flip-v9-1-681814efbfbe@igalia.com>
 <D5CC3U00B7CG.IGKCIES8PC2J@kode54.net>
 <00a99b3e-3fad-42fb-8dc8-4f45d158c4c1@igalia.com>
In-Reply-To: <00a99b3e-3fad-42fb-8dc8-4f45d158c4c1@igalia.com>
X-Migadu-Flow: FLOW_OUT
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

On Mon Nov 4, 2024 at 12:52 PM PST, Andr=C3=A9 Almeida wrote:
> Hi Christopher,
>
> Em 03/11/2024 03:36, Christopher Snowhill escreveu:
> > On Fri Nov 1, 2024 at 11:23 AM PDT, Andr=C3=A9 Almeida wrote:
> >> Currently, DRM atomic uAPI allows only primary planes to be flipped
> >> asynchronously. However, each driver might be able to perform async
> >> flips in other different plane types. To enable drivers to set their o=
wn
> >> restrictions on which type of plane they can or cannot flip, use the
> >> existing atomic_async_check() from struct drm_plane_helper_funcs to
> >> enhance this flexibility, thus allowing different plane types to be ab=
le
> >> to do async flips as well.
> >>
> >> In order to prevent regressions and such, we keep the current policy: =
we
> >> skip the driver check for the primary plane, because it is always
> >> allowed to do async flips on it.
> >>
> >> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> >=20
> > Should I do a R-b too?=20
>
> If you can review the code, it's always really appreciated.

I mean, I did review your changes, they looked good to me. I just didn't
know the protocol for reporting review in addition to testing.

>
> > The changes looked sound enough for me to feel
> > like testing it as well. Tested Borderlands Game of the Year Enhanced o=
n
> > my RX 7700 XT at maximum settings at 1080p165, and the tearing support =
in
> > labwc allowed it to reach over 700fps. No problems from the hardware
> > cursor.
>
> Thanks for testing and reporting!
>
> >=20
> > Tested-by: Christopher Snowhill <chris@kode54.net>
> >=20

