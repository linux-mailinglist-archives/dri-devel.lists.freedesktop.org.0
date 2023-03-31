Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022A6D19E7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 10:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D1F10F12A;
	Fri, 31 Mar 2023 08:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8792610E31B;
 Fri, 31 Mar 2023 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680251537; x=1711787537;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Qx/8ilf/NfkTHLO6+8bPMQwvEosBPGBjQoeaUWFsQWY=;
 b=NsBZW6F+suHES7lY+wVwSyxjjbUiCHArAK/NpG1Zsk9zbxJTn4fvCtVQ
 xYkgRjAyPXPiU1HKAy74lbvCHf52i4GhIMMFslSbI1wqPWBweA40UNMNb
 QsppsGNWWJOT6utsaIv3EgMCf7G5opUKbgYTgHbi/1m5tJQ9bHNrmXg3K
 SbhfONONEJybLaa0RnEKAQxSaAt0GWU07e1gfghr+bXNxkKh8/zwqqWf0
 sCIf7sqzf0cyzV4liM9ZINuloCrUwPoYVxEM6+IxqLhh7lRjV0+MlwnPk
 cIoRblXVbYKaRMc3V+NXlNXdnkYK+5zpaxa5p7SquLhaj230QUGGEctZT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406407923"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="406407923"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="828638010"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="828638010"
Received: from slabertx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.150])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:31:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Laight
 <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 0/4] log2: make is_power_of_2() more generic
In-Reply-To: <20230330151846.fdbc8edbfbaa6eaddb056dc7@linux-foundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230330104243.2120761-1-jani.nikula@intel.com>
 <20230330125041.83b0f39fa3a4ec1a42dfd95f@linux-foundation.org>
 <549987e4967d45159573901d330c96a0@AcuMS.aculab.com>
 <20230330151846.fdbc8edbfbaa6eaddb056dc7@linux-foundation.org>
Date: Fri, 31 Mar 2023 11:31:43 +0300
Message-ID: <87edp52ufk.fsf@intel.com>
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
Cc: David Gow <davidgow@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Thu, 30 Mar 2023 21:53:03 +0000 David Laight <David.Laight@ACULAB.COM>=
 wrote:
>
>> > But wouldn't all these issues be addressed by simply doing
>> >=20
>> > #define is_power_of_2(n) (n !=3D 0 && ((n & (n - 1)) =3D=3D 0))
>> >=20
>> > ?
>> >=20
>> > (With suitable tweaks to avoid evaluating `n' more than once)
>>=20
>> I think you need to use the 'horrid tricks' from min() to get
>> a constant expression from constant inputs.
>
> This
>
> --- a/include/linux/log2.h~a
> +++ a/include/linux/log2.h
> @@ -41,11 +41,11 @@ int __ilog2_u64(u64 n)
>   * *not* considered a power of two.
>   * Return: true if @n is a power of 2, otherwise false.
>   */
> -static inline __attribute__((const))
> -bool is_power_of_2(unsigned long n)
> -{
> -	return (n !=3D 0 && ((n & (n - 1)) =3D=3D 0));
> -}
> +#define is_power_of_2(_n)				\
> +	({						\
> +		typeof(_n) n =3D (_n);			\
> +		n !=3D 0 && ((n & (n - 1)) =3D=3D 0);		\
> +	})
>=20=20
>  /**
>   * __roundup_pow_of_two() - round up to nearest power of two
> _
>
> worked for me in a simple test.
>
> --- a/fs/open.c~b
> +++ a/fs/open.c
> @@ -1564,3 +1564,10 @@ int stream_open(struct inode *inode, str
>  }
>=20=20
>  EXPORT_SYMBOL(stream_open);
> +
> +#include <linux/log2.h>
> +
> +int foo(void)
> +{
> +	return is_power_of_2(43);
> +}
> _
>
>
> foo:
> # fs/open.c:1573: }
> 	xorl	%eax, %eax	#
> 	ret=09
>
>
> Is there some more tricky situation where it breaks?

It doesn't work with BUILD_BUG_ON_ZERO().

test.c:
#define IS_POWER_OF_2(_n)				\
	({						\
		typeof(_n) n =3D (_n);			\
		n !=3D 0 && ((n & (n - 1)) =3D=3D 0);		\
	})

#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))

#define FOO(n) ((n) + BUILD_BUG_ON_ZERO(!IS_POWER_OF_2(n)))

int main(void)
{
	return FOO(2);
}

$ gcc test.c
test.c: In function =E2=80=98main=E2=80=99:
test.c:16:51: error: bit-field =E2=80=98<anonymous>=E2=80=99 width not an i=
nteger constant
   16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); }=
)))
      |                                                   ^
test.c:18:23: note: in expansion of macro =E2=80=98BUILD_BUG_ON_ZERO=E2=80=
=99
   18 | #define FOO(n) ((n) + BUILD_BUG_ON_ZERO(!IS_POWER_OF_2(n)))
      |                       ^~~~~~~~~~~~~~~~~
test.c:22:9: note: in expansion of macro =E2=80=98FOO=E2=80=99
   22 |  return FOO(2);
      |         ^~~


BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
