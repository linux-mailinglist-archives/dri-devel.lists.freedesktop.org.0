Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6552B91275
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A6110E0DC;
	Mon, 22 Sep 2025 12:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ozGcCAjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A90A10E0DC;
 Mon, 22 Sep 2025 12:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6964B44352;
 Mon, 22 Sep 2025 12:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133B5C4CEF0;
 Mon, 22 Sep 2025 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758544855;
 bh=9EnrkUTRC3WbuAFf4lnbSzwEyBeWACdeCsxOYAwx2mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ozGcCAjUuLnf1RgOGckV6AH965oAp/K1TY2eSbmKl/C4fNB3qo4dlWtmlSINDjjOP
 knEuUlp18RwYdjWTm6QWnSR+v+UHtYkNhp60v4aYebb3MOmMXSuvvJNHmE5LFQXLaU
 0/BlWu+1DnvN/JJh+naIMq1n1GDWeuu66LQM7q98=
Date: Mon, 22 Sep 2025 14:40:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David.Laight@aculab.com, Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com,
 agk@redhat.com, airlied@gmail.com, akpm@linux-foundation.org,
 alexander.deucher@amd.com, alexandre.torgue@foss.st.com,
 amd-gfx@lists.freedesktop.org, andriy.shevchenko@linux.intel.com,
 anton.ivanov@cambridgegreys.com, arnd@kernel.org,
 artur.paszkiewicz@intel.com, bp@alien8.de, christian.koenig@amd.com,
 clm@fb.com, daniel@ffwll.ch, dave.hansen@linux.intel.com,
 davem@davemloft.net, dm-devel@lists.linux.dev,
 dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org,
 dsahern@kernel.org, dsterba@suse.com, edumazet@google.com,
 evan.quan@amd.com, farbere@amazon.com, harry.wentland@amd.com,
 hdegoede@redhat.com, hpa@zytor.com, ilpo.jarvinen@linux.intel.com,
 james.morse@arm.com, jdelvare@suse.com, jejb@linux.ibm.com,
 jernej.skrabec@gmail.com, joabreu@synopsys.com,
 johannes@sipsolutions.net, josef@toxicpanda.com,
 keescook@chromium.org, krzysztof.kozlowski@linaro.org,
 kuba@kernel.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-um@lists.infradead.org,
 linux@rasmusvillemoes.dk, linux@roeck-us.net,
 lorenzo.stoakes@oracle.com, luc.vanoostenryck@gmail.com,
 luto@kernel.org, maarten.lankhorst@linux.intel.com,
 mailhol.vincent@wanadoo.fr, malattia@linux.it, markgross@kernel.org,
 martin.petersen@oracle.com, mchehab@kernel.org,
 mcoquelin.stm32@gmail.com, mhiramat@kernel.org, minchan@kernel.org,
 mingo@redhat.com, mkl@pengutronix.de, mripard@kernel.org,
 pabeni@redhat.com, peterz@infradead.org, pmladek@suse.com,
 qiuxu.zhuo@intel.com, richard@nod.at, rostedt@goodmis.org,
 rric@kernel.org, sakari.ailus@linux.intel.com, samuel@sholland.org,
 senozhatsky@chromium.org, shuah@kernel.org, snitzer@kernel.org,
 sunpeng.li@amd.com, tglx@linutronix.de, tony.luck@intel.com,
 torvalds@linux-foundation.org, tzimmermann@suse.de,
 wad@chromium.org, wens@csie.org, wg@grandegger.com, x86@kernel.org
Cc: stable-commits@vger.kernel.org
Subject: Re: Patch "minmax: make generic MIN() and MAX() macros available
 everywhere" has been added to the 6.6-stable tree
Message-ID: <2025092209-owl-whisking-03e3@gregkh>
References: <20250922103241.16213-5-farbere@amazon.com>
 <2025092200-reverb-stumble-8578@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2025092200-reverb-stumble-8578@gregkh>
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

On Mon, Sep 22, 2025 at 02:27:00PM +0200, gregkh@linuxfoundation.org wrote:
>=20
> This is a note to let you know that I've just added the patch titled
>=20
>     minmax: make generic MIN() and MAX() macros available everywhere
>=20
> to the 6.6-stable tree which can be found at:
>     http://www.kernel.org/git/?p=3Dlinux/kernel/git/stable/stable-queue.g=
it;a=3Dsummary
>=20
> The filename of the patch is:
>      minmax-make-generic-min-and-max-macros-available-everywhere.patch
> and it can be found in the queue-6.6 subdirectory.
>=20
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
>=20
>=20
> >From prvs=3D353d6d59a=3Dfarbere@amazon.com Mon Sep 22 12:35:15 2025
> From: Eliav Farber <farbere@amazon.com>
> Date: Mon, 22 Sep 2025 10:32:30 +0000
> Subject: minmax: make generic MIN() and MAX() macros available everywhere
> To: <richard@nod.at>, <anton.ivanov@cambridgegreys.com>, <johannes@sipsol=
utions.net>, <dave.hansen@linux.intel.com>, <luto@kernel.org>, <peterz@infr=
adead.org>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <x86@=
kernel.org>, <hpa@zytor.com>, <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>=
, <james.morse@arm.com>, <mchehab@kernel.org>, <rric@kernel.org>, <harry.we=
ntland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>, <alexand=
er.deucher@amd.com>, <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <air=
lied@gmail.com>, <daniel@ffwll.ch>, <evan.quan@amd.com>, <maarten.lankhorst=
@linux.intel.com>, <mripard@kernel.org>, <tzimmermann@suse.de>, <jdelvare@s=
use.com>, <linux@roeck-us.net>, <linus.walleij@linaro.org>, <dmitry.torokho=
v@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland=
=2Eorg>, <agk@redhat.com>, <snitzer@kernel.org>, <dm-devel@lists.linux.dev>=
, <mailhol.vincent@wanadoo.fr>, <wg@grandegger.com>, <mkl@pengutronix.de>, =
<davem@davemloft.net>, <edu
>  mazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>, <alexandre.to=
rgue@foss.st.com>, <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <kr=
zysztof.kozlowski@linaro.org>, <malattia@linux.it>, <hdegoede@redhat.com>, =
<ilpo.jarvinen@linux.intel.com>, <markgross@kernel.org>, <artur.paszkiewicz=
@intel.com>, <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <sakari.ai=
lus@linux.intel.com>, <gregkh@linuxfoundation.org>, <clm@fb.com>, <josef@to=
xicpanda.com>, <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <rostedt@=
goodmis.org>, <mhiramat@kernel.org>, <pmladek@suse.com>, <andriy.shevchenko=
@linux.intel.com>, <linux@rasmusvillemoes.dk>, <senozhatsky@chromium.org>, =
<minchan@kernel.org>, <akpm@linux-foundation.org>, <dsahern@kernel.org>, <s=
huah@kernel.org>, <keescook@chromium.org>, <wad@chromium.org>, <farbere@ama=
zon.com>, <David.Laight@ACULAB.COM>, <arnd@kernel.org>, <linux-um@lists.inf=
radead.org>, <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>, =
<amd-gfx@lists.freedeskto
>  p.org>, <dri-devel@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>=
, <linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <l=
inux-sunxi@lists.linux.dev>, <linux-media@vger.kernel.org>, <linux-can@vger=
=2Ekernel.org>, <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormr=
eply.com>, <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.o=
rg>, <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>, <linux=
-sparse@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, <linux-mm@k=
vack.org>, <linux-kselftest@vger.kernel.org>, <bpf@vger.kernel.org>, <stabl=
e@vger.kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Laight <David.L=
aight@aculab.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Message-ID: <20250922103241.16213-5-farbere@amazon.com>
>=20
> From: Linus Torvalds <torvalds@linux-foundation.org>
>=20
> [ Upstream commit 1a251f52cfdc417c84411a056bc142cbd77baef4 ]
>=20
> This just standardizes the use of MIN() and MAX() macros, with the very
> traditional semantics.  The goal is to use these for C constant
> expressions and for top-level / static initializers, and so be able to
> simplify the min()/max() macros.
>=20
> These macro names were used by various kernel code - they are very
> traditional, after all - and all such users have been fixed up, with a
> few different approaches:
>=20
>  - trivial duplicated macro definitions have been removed
>=20
>    Note that 'trivial' here means that it's obviously kernel code that
>    already included all the major kernel headers, and thus gets the new
>    generic MIN/MAX macros automatically.
>=20
>  - non-trivial duplicated macro definitions are guarded with #ifndef
>=20
>    This is the "yes, they define their own versions, but no, the include
>    situation is not entirely obvious, and maybe they don't get the
>    generic version automatically" case.
>=20
>  - strange use case #1
>=20
>    A couple of drivers decided that the way they want to describe their
>    versioning is with
>=20
> 	#define MAJ 1
> 	#define MIN 2
> 	#define DRV_VERSION __stringify(MAJ) "." __stringify(MIN)
>=20
>    which adds zero value and I just did my Alexander the Great
>    impersonation, and rewrote that pointless Gordian knot as
>=20
> 	#define DRV_VERSION "1.2"
>=20
>    instead.
>=20
>  - strange use case #2
>=20
>    A couple of drivers thought that it's a good idea to have a random
>    'MIN' or 'MAX' define for a value or index into a table, rather than
>    the traditional macro that takes arguments.
>=20
>    These values were re-written as C enum's instead. The new
>    function-line macros only expand when followed by an open
>    parenthesis, and thus don't clash with enum use.
>=20
> Happily, there weren't really all that many of these cases, and a lot of
> users already had the pattern of using '#ifndef' guarding (or in one
> case just using '#undef MIN') before defining their own private version
> that does the same thing. I left such cases alone.
>=20
> Cc: David Laight <David.Laight@aculab.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  arch/um/drivers/mconsole_user.c                                       | =
   2=20
>  drivers/edac/skx_common.h                                             | =
   1=20
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c                   | =
   2=20
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h                    | =
  14 ++++-

Oops, nope, this patch breaks the amd driver's build :(

I'll drop this patch and stop here on this patch series.  Please fix
this up and resend the remaining ones after it builds properly.

thanks,

greg k-h
