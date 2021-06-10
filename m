Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B13A2AC3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB556E80B;
	Thu, 10 Jun 2021 11:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3106E5D2;
 Thu, 10 Jun 2021 11:51:19 +0000 (UTC)
IronPort-SDR: O37j0ipA8ztq6fGP8MGvgPB7XCHH60hqf9yNmSY+B48qd9JlFNgBeYYPnl2vJVzxpb3yHNkU/o
 ojEya7iH5pfw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="205313831"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="205313831"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 04:51:16 -0700
IronPort-SDR: hz+VQRvrU+mzoXy2jk494Dz8evJFdG/0nJujzvONqjO8o5f4yu5rt2qrwgOMHR9Jm1Woc+ubWr
 uFWjKyiZeQJQ==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="486137535"
Received: from jwalsh5-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.28.33])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 04:51:13 -0700
From: joonas.lahtinen@linux.intel.com
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <548dd463-3942-00a1-85c3-232897dea1a3@canonical.com>
References: <548dd463-3942-00a1-85c3-232897dea1a3@canonical.com>
Subject: Re: Computation of return value being discarded in get_cpu_power() in
 drivers/platform/x86/intel_ips.c
To: Hans de Goede <hdegoede@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Mark Gross <mgross@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jesse Barnes <jsbarnes@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162332587143.15408.5683489401507477378@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 10 Jun 2021 14:51:11 +0300
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
Cc: intel-gfx@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Jesse

Quoting Colin Ian King (2021-06-09 14:50:07)
> Hi,
>=20
> I was reviewing some old unassigned variable warnings from static
> analysis by Coverity and found an issue introduced with the following
> commit:
>=20
> commit aa7ffc01d254c91a36bf854d57a14049c6134c72
> Author: Jesse Barnes <jbarnes@virtuousgeek.org>
> Date:   Fri May 14 15:41:14 2010 -0700
>=20
>     x86 platform driver: intelligent power sharing driver
>=20
> The analysis is as follows:
>=20
> drivers/platform/x86/intel_ips.c
>=20
>  871 static u32 get_cpu_power(struct ips_driver *ips, u32 *last, int peri=
od)
>  872 {
>  873        u32 val;
>  874        u32 ret;
>  875
>  876        /*
>  877         * CEC is in joules/65535.  Take difference over time to
>  878         * get watts.
>  879         */
>  880        val =3D thm_readl(THM_CEC);
>  881
>  882        /* period is in ms and we want mW */
>  883        ret =3D (((val - *last) * 1000) / period);
>=20
> Unused value (UNUSED_VALUE)
> assigned_value:  Assigning value from ret * 1000U / 65535U to ret here,
> but that stored value is not used.
>=20
>  884        ret =3D (ret * 1000) / 65535;
>  885        *last =3D val;
>  886
>  887        return 0;
>  888 }
>=20
> I'm really not sure why ret is being calculated on lines 883,884 and not
> being used. Should that be *last =3D ret on line 885? Looks suspect anyho=
w.

According to git blame code seems to have been disabled intentionally by the
following commit:

commit 96f3823f537088c13735cfdfbf284436c802352a
Author: Jesse Barnes <jbarnes@virtuousgeek.org>
Date:   Tue Oct 5 14:50:59 2010 -0400

    [PATCH 2/2] IPS driver: disable CPU turbo
   =20
    The undocumented interface we're using for reading CPU power seems to be
    overreporting power.  Until we figure out how to correct it, disable CPU
    turbo and power reporting to be safe.  This will keep the CPU within de=
fault
    limits and still allow us to increase GPU frequency as needed.

Maybe wrap the code after thm_readl() in #if 0 in case somebody ends up
wanting to fix it? Or eliminate completely.

In theory the thm_readl() may affect the system behavior so would not
remove that for extra paranoia.

Regards, Joonas
