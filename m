Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF122265C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 17:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E8D6E2BE;
	Thu, 16 Jul 2020 15:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4A16E2BE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 15:00:28 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E0E1E804D0;
 Thu, 16 Jul 2020 17:00:22 +0200 (CEST)
Date: Thu, 16 Jul 2020 17:00:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 05/20] backlight: improve backlight_device documentation
Message-ID: <20200716150021.GA1936267@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-6-sam@ravnborg.org>
 <20200716143941.GS3165313@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716143941.GS3165313@dell>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=i7-e4zb6R47tXRK1UEkA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee.

On Thu, Jul 16, 2020 at 03:39:41PM +0100, Lee Jones wrote:
> On Fri, 03 Jul 2020, Sam Ravnborg wrote:
> 
> > Improve the documentation for backlight_device and
> > adapt it to kernel-doc style.
> > 
> > The updated documentation is more strict on how locking is used.
> > With the update neither update_lock nor ops_lock may be used
> > outside the backlight core.
> > This restriction was introduced to keep the locking simple
> > by keeping it in the core.
> > It was verified that this documents the current state by renaming
> > update_lock => bl_update_lock and ops_lock => bl_ops_lock.
> > The rename did not reveal any uses outside the backlight core.
> > The rename is NOT part of this patch.
> > 
> > v3:
> >   - Update changelog to explain locking details (Daniel)
> > 
> > v2:
> >   - Add short intro to all fields (Daniel)
> >   - Updated description of update_lock (Daniel)
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > ---
> >  include/linux/backlight.h | 72 ++++++++++++++++++++++++++-------------
> >  1 file changed, 49 insertions(+), 23 deletions(-)
> 
> Some of these do not apply cleanly.
> 
> Please collect the *-bys already received, rebase and resubmit.

Will do.
The patch-set is based on drm-misc-next. Are there another
tree that I should use?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
