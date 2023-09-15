Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F077A20AB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 16:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9B310E639;
	Fri, 15 Sep 2023 14:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F40810E638;
 Fri, 15 Sep 2023 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694787472; x=1726323472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cx41cKa/RBYb6E2/xEb8yE9p/WzNj4Uug7P74vjnNdg=;
 b=gLfzPe/dS5ZvC8wnY2ZolfLUD64sq1yfH+6oS9XPxkbOW/BpB/WWjvUQ
 9zhqf3CJGzxfhELCU9//6NZOlumPNONw68khwgWOWM9ULIom/ST1bXWQe
 dHBhQ1cD7FVN2HOn3u2yzUL1/WHnFEYyGDX6VQRh3Gn3RV0DomVJz9COE
 Egs7vFIlsfRa1OSG70My6Zl9BIsjPOT09s0ANU/8YbDuWVlIEs/OdPMLv
 A96qyoQuzYIm4J/koV5h/GRhadWpRPTz3J8etOMk77/ITOIZcsQ/okBTL
 lbC7l3IRFEUKW6IG2sbxCLNA3r0x0aUYYkcMln1Nza22KoJ60+A7uuKrP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445715520"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445715520"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 07:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810535659"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810535659"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.6.122])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 07:17:49 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org, Maira Canal <mairacanal@riseup.net>
Subject: Re: [PATCH] drm/tests: Fix incorrect argument in
 drm_test_mm_insert_range
Date: Fri, 15 Sep 2023 16:17:46 +0200
Message-ID: <3244709.oiGErgHkdL@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4fb393ff-3b2a-369a-5e9f-f96d802b2d87@riseup.net>
References: <20230911130323.7037-2-janusz.krzysztofik@linux.intel.com>
 <4fb393ff-3b2a-369a-5e9f-f96d802b2d87@riseup.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ma=EDra,

Thanks for review.

On Friday, 15 September 2023 16:01:31 CEST Maira Canal wrote:
> Hi,
>=20
> On 9/11/23 10:03, Janusz Krzysztofik wrote:
> > While drm_mm test was converted form igt selftest to kunit, unexpected
> > value of "end" argument equal "start" was introduced to one of calls to=
 a
> > function that executes the drm_test_mm_insert_range for specific start/=
end
> > pair of arguments.  As a consequence, DRM_MM_BUG_ON(end <=3D start) is
> > triggered.  Fix it by restoring the original value.
> >=20
> > Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>=20
> Reviewed-by: Ma=EDra Canal <mairacanal@riseup.net>
>=20
> Do you need me to push it to drm-misc-fixes?

Yes, please do if you can.

Thanks,
Janusz

>=20
> Best Regards,
> - Ma=EDra
>=20
> > Cc: "Ma=EDra Canal" <mairacanal@riseup.net>
> > Cc: Arthur Grillo <arthurgrillo@riseup.net>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: Daniel Latypov <dlatypov@google.com>
> > Cc: stable@vger.kernel.org # v6.1+
> > ---
> >   drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/test=
s/drm_mm_test.c
> > index 186b28dc70380..05d5e7af6d250 100644
> > --- a/drivers/gpu/drm/tests/drm_mm_test.c
> > +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> > @@ -939,7 +939,7 @@ static void drm_test_mm_insert_range(struct kunit *=
test)
> >   		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, si=
ze, 0, max - 1));
> >   		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, si=
ze, 0, max / 2));
> >   		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, si=
ze,
> > -								    max / 2, max / 2));
> > +								    max / 2, max));
> >   		KUNIT_ASSERT_FALSE(test, __drm_test_mm_insert_range(test, count, si=
ze,
> >   								    max / 4 + 1, 3 * max / 4 - 1));
> >  =20
>=20




