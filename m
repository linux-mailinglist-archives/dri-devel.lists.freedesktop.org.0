Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE607DD30E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FA210E59B;
	Tue, 31 Oct 2023 16:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9FC10E591;
 Tue, 31 Oct 2023 16:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698771048; x=1730307048;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V93zJ/7bFgDUz2hS0FSBlAz1jK8utvg5e/zgGR4Xx38=;
 b=B7vL6y90TeSawZaDSN4AExLTd79iAQdKYTU/GlHnZb4dJO1Wme4mKxxt
 ZFmLJ2mkJq8+1Qm0Yk3UPpVJ5dVpJI2K3NKj55OOqw9KtkVba5VN2FRhg
 X2KUpjStTeeomBIP1nXomh0s8o6TIyUwGnKMAYiFrfl/nu77VmnVvhw6S
 oU6mNNTqOUVwLCzgsSAs1UyAdZEfXfI4HHFbE6vcu4OGrM5ZkPGamycxj
 biSq9koBtdWRtFnslIMo9RAub/SN8JKZkjj0D31PX1KUsb9cPJS18Ml1K
 v06UCf6Yj9EWCCVcZnOPRIyqM6zuftBQKHLoz8INYQ7IUWoAQ6UsvHX03 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1176844"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1176844"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 09:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="760682191"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="760682191"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 09:50:43 -0700
Message-ID: <6cf7459aa0332d6fc3c4764f66a83c6a3825348f.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an abstraction for
 a VM / BO combination
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Tue, 31 Oct 2023 17:50:41 +0100
In-Reply-To: <1e2acafb-fbc3-4256-b1e1-3fe6c47b1ef2@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <f00a4975cf32c3ae28124343a2c994acda083829.camel@linux.intel.com>
 <87zfzz3thp.fsf@intel.com>
 <1e2acafb-fbc3-4256-b1e1-3fe6c47b1ef2@redhat.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-10-31 at 17:30 +0100, Danilo Krummrich wrote:
> On 10/31/23 12:45, Jani Nikula wrote:
> > On Tue, 31 Oct 2023, Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> > > On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
> > > > + * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on
> > >=20
> > > Still needs s/Returns:/Return:/g
> >=20
> > FWIW, both work to accommodate the variance across the kernel,
> > although
> > I think only the latter is documented and recommended. It's also
> > the
> > most popular:
> >=20
> > =C2=A0=C2=A0 10577 Return
> > =C2=A0=C2=A0=C2=A0 3596 Returns
>=20
> I'd like to keep "Returns", since that's what GPUVM uses already
> everywhere else.

Ok. It looks like the Returns: are converted to Return in the rendered
output so I guess that's why it's the form that is documented.

I pointed this out since in the last review you replied you were going
to change it, and also when the code starts seeing updates from other,
it might become inconsistent if those patches follow the documented
way.

But I'm OK either way.

/Thomas


>=20
> > =C2=A0=C2=A0=C2=A0 1104 RETURN
> > =C2=A0=C2=A0=C2=A0=C2=A0 568 return
> > =C2=A0=C2=A0=C2=A0=C2=A0 367 returns
> > =C2=A0=C2=A0=C2=A0=C2=A0 352 RETURNS
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 RETURNs
> >=20
> > BR,
> > Jani.
> >=20
> >=20
>=20

