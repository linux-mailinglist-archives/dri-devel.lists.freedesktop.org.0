Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E8D87FF7F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 15:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9F110E254;
	Tue, 19 Mar 2024 14:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EzzNRSuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2BA10E254
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bhEGOsWJuMl/8S2cphWvd/Ki6+bgSDJhb9ru/x72Im4=; b=EzzNRSuw4SjVSXWt/Fpe/K3NAJ
 R/Eh+UG4fixt5z1imxvFM1+6PBYK7xxw7xr8s6Pn6prWaW93MIgYGs4SC4A8ZjmYDo15A0R89IC4Z
 iFY+GSJeNhVbFLCG/flu7Bk1w0MLE81A9IPJZOVdiWeQvVrGcI79LijHLNIOiX80ciS7OtL1GVEtM
 2O/oOGUn8UHwW0BxqqJqm+GF696Ct4640eXyBEeN12uam4Zerjv+C8Msgw/+KWjgmGHvfTW3enPqY
 YZh25IeO+WTR88JCWQGC1I6g+TNKvAGdyw+DMUiRmJRr5CxJ+z4P4Y63lnFlQkLVJOX9FTFwaO+Ms
 pH5dL/uw==;
Received: from [189.6.17.125] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rmaNz-00CWH2-3W; Tue, 19 Mar 2024 15:24:15 +0100
Date: Tue, 19 Mar 2024 11:24:05 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: Fix drm_fixp2int_round() making it add 0.5
Message-ID: <vhh4unbjmesdlspmgzsqaudahxape6fgcrslxe6wma2is4qbmp@7fie4hqgwdrq>
References: <20240316-drm_fixed-v2-1-c1bc2665b5ed@riseup.net>
 <7636b3tjifajvw63ux7xfjz4hjzhgjrf37mqgulneqzb7eukph@i6nnyietvxji>
 <d296d1b2-7dcd-4dd3-a15c-678e29836063@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d296d1b2-7dcd-4dd3-a15c-678e29836063@igalia.com>
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

On 03/17, Maíra Canal wrote:
> Hi Melissa,
> 
> On 3/17/24 14:50, Melissa Wen wrote:
> > On 03/16, Arthur Grillo wrote:
> > > As well noted by Pekka[1], the rounding of drm_fixp2int_round is wrong.
> > > To round a number, you need to add 0.5 to the number and floor that,
> > > drm_fixp2int_round() is adding 0.0000076. Make it add 0.5.
> > > 
> > > [1]: https://lore.kernel.org/all/20240301135327.22efe0dd.pekka.paalanen@collabora.com/
> > > 
> > > Fixes: 8b25320887d7 ("drm: Add fixed-point helper to get rounded integer values")
> > > Suggested-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > Great, thanks!
> > 
> > Reviewed-by: Melissa Wen <mwen@igalia.com>
> > 
> > I'll apply to drm-misc-next.
> 
> Shouldn't this patch be applied in drm-misc-fixes?

After discussions on IRC, I applied to drm-misc-next-fixes, since we are
in a merge window.

Thanks,

Melissa

> 
> Best Regards,
> - Maíra
> 
> > 
> > Melissa
> > 
> > > ---
> > > Changes in v2:
> > > - Add Fixes tag (Melissa Wen)
> > > - Remove DRM_FIXED_POINT_HALF (Melissa Wen)
> > > - Link to v1: https://lore.kernel.org/all/20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net/
> > > ---
> > >   include/drm/drm_fixed.h | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> > > index 0c9f917a4d4b..81572d32db0c 100644
> > > --- a/include/drm/drm_fixed.h
> > > +++ b/include/drm/drm_fixed.h
> > > @@ -71,7 +71,6 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
> > >   }
> > >   #define DRM_FIXED_POINT		32
> > > -#define DRM_FIXED_POINT_HALF	16
> > >   #define DRM_FIXED_ONE		(1ULL << DRM_FIXED_POINT)
> > >   #define DRM_FIXED_DECIMAL_MASK	(DRM_FIXED_ONE - 1)
> > >   #define DRM_FIXED_DIGITS_MASK	(~DRM_FIXED_DECIMAL_MASK)
> > > @@ -90,7 +89,7 @@ static inline int drm_fixp2int(s64 a)
> > >   static inline int drm_fixp2int_round(s64 a)
> > >   {
> > > -	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
> > > +	return drm_fixp2int(a + DRM_FIXED_ONE / 2);
> > >   }
> > >   static inline int drm_fixp2int_ceil(s64 a)
> > > 
> > > ---
> > > base-commit: f89632a9e5fa6c4787c14458cd42a9ef42025434
> > > change-id: 20240315-drm_fixed-c680ba078ecb
> > > 
> > > Best regards,
> > > -- 
> > > Arthur Grillo <arthurgrillo@riseup.net>
> > > 
