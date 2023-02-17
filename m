Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC969A8B6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C9310EF31;
	Fri, 17 Feb 2023 09:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E90710E1CA;
 Fri, 17 Feb 2023 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676627894; x=1708163894;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=p+cYQG0JeB2tj2iGZFqrQ2nipqXUkgH/8lWd3cyiDFo=;
 b=TZy4mxZQvJsHPNWJrolIZ1H99QptTVcoVyENulIegosFySoxFLIDC0Mg
 jS3fnPrR2kc61FrqlDyEzmjzCqFgc/rEjXVIifRQLhEk6za60+w6gffRZ
 UGHEmjgAn+LIHOBw0GEZeUqWUIISpGDsMq7D2gOepaNCV3Z2B6o9C03Hm
 zwPbicwLLkFky6T/kAZCOK9F23DKD/z8sVCne2geyyLPYnAuc6BAaKe56
 ZazqyJcJzRjCAxoCorlbNQMKKYK+an6Pn7dKXDFhJNNOPsNi9b+I+Lqvp
 0qayopVWrbxTHs2AwQC3qolb+ggASYzm5XLZ4XD+l1bBDUGzGKuO54z2D Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334152912"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="334152912"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 01:58:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759307458"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="759307458"
Received: from akocherg-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.53.1])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 01:58:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915: Make kobj_type structures constant
In-Reply-To: <87sff5293w.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230216-kobj_type-i915-v1-1-ca65c9b93518@weissschuh.net>
 <87sff5293w.fsf@intel.com>
Date: Fri, 17 Feb 2023 11:58:08 +0200
Message-ID: <877cwgzk9b.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 16 Feb 2023, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:
>> Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
>> the driver core allows the usage of const struct kobj_type.
>>
>> Take advantage of this to constify the structure definitions to prevent
>> modification at runtime.
>>
>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-intel-gt-next, thanks for the patch.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 2 +-
>>  drivers/gpu/drm/i915/gt/sysfs_engines.c  | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/=
i915/gt/intel_gt_sysfs.c
>> index 9486dd3bed99..df15b17caf89 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
>> @@ -71,7 +71,7 @@ static void kobj_gt_release(struct kobject *kobj)
>>  {
>>  }
>>=20=20
>> -static struct kobj_type kobj_gt_type =3D {
>> +static const struct kobj_type kobj_gt_type =3D {
>>  	.release =3D kobj_gt_release,
>>  	.sysfs_ops =3D &kobj_sysfs_ops,
>>  	.default_groups =3D id_groups,
>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i=
915/gt/sysfs_engines.c
>> index f2d9858d827c..b5e0fe5dbf6c 100644
>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> @@ -421,7 +421,7 @@ static void kobj_engine_release(struct kobject *kobj)
>>  	kfree(kobj);
>>  }
>>=20=20
>> -static struct kobj_type kobj_engine_type =3D {
>> +static const struct kobj_type kobj_engine_type =3D {
>>  	.release =3D kobj_engine_release,
>>  	.sysfs_ops =3D &kobj_sysfs_ops
>>  };
>>
>> ---
>> base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
>> change-id: 20230216-kobj_type-i915-886bebc36129
>>
>> Best regards,

--=20
Jani Nikula, Intel Open Source Graphics Center
