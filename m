Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFB545B084
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 00:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C3F6E096;
	Tue, 23 Nov 2021 23:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FF16E096
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 23:53:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="235111508"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="235111508"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 15:53:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="509610560"
Received: from pshinde-mobl.amr.corp.intel.com ([10.213.85.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 15:53:41 -0800
Message-ID: <c5d1ee1f3b59bf18591a164c185650c77ec8aba7.camel@linux.intel.com>
Subject: Re: [PATCH v2 12/63] thermal: intel: int340x_thermal: Use
 struct_group() for memcpy() region
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Kees Cook
 <keescook@chromium.org>,  Zhang Rui <rui.zhang@intel.com>
Date: Tue, 23 Nov 2021 15:53:38 -0800
In-Reply-To: <CAJZ5v0iS3qMgdab1S-NzGfeLLXV=S6p5Qx8AaqJ50rsUngS=LA@mail.gmail.com>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-13-keescook@chromium.org>
 <CAJZ5v0iS3qMgdab1S-NzGfeLLXV=S6p5Qx8AaqJ50rsUngS=LA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-staging@lists.linux.dev,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Amit Kucheria <amitk@kernel.org>,
 "open list:NETWORKING DRIVERS \(WIRELESS\)" <linux-wireless@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-hardening@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-11-23 at 14:19 +0100, Rafael J. Wysocki wrote:
> On Wed, Aug 18, 2021 at 8:08 AM Kees Cook <keescook@chromium.org>
> wrote:
> > 
> > In preparation for FORTIFY_SOURCE performing compile-time and run-
> > time
> > field bounds checking for memcpy(), avoid intentionally writing
> > across
> > neighboring fields.
> > 
> > Use struct_group() in struct art around members weight, and ac[0-
> > 9]_max,
> > so they can be referenced together. This will allow memcpy() and
> > sizeof()
> > to more easily reason about sizes, improve readability, and avoid
> > future
> > warnings about writing beyond the end of weight.
> > 
> > "pahole" shows no size nor member offset changes to struct art.
> > "objdump -d" shows no meaningful object code changes (i.e. only
> > source
> > line number induced differences).
> > 
> > Cc: Zhang Rui <rui.zhang@intel.com>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Amit Kucheria <amitk@kernel.org>
> > Cc: linux-pm@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Rui, Srinivas, any comments here?
Looks good.
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks,
Srinivas

> 
> > ---
> >  .../intel/int340x_thermal/acpi_thermal_rel.c  |  5 +-
> >  .../intel/int340x_thermal/acpi_thermal_rel.h  | 48 ++++++++++-------
> > --
> >  2 files changed, 29 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> > b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> > index a478cff8162a..e90690a234c4 100644
> > --- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> > +++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
> > @@ -250,8 +250,9 @@ static int fill_art(char __user *ubuf)
> >                 get_single_name(arts[i].source,
> > art_user[i].source_device);
> >                 get_single_name(arts[i].target,
> > art_user[i].target_device);
> >                 /* copy the rest int data in addition to source and
> > target */
> > -               memcpy(&art_user[i].weight, &arts[i].weight,
> > -                       sizeof(u64) * (ACPI_NR_ART_ELEMENTS - 2));
> > +               BUILD_BUG_ON(sizeof(art_user[i].data) !=
> > +                            sizeof(u64) * (ACPI_NR_ART_ELEMENTS -
> > 2));
> > +               memcpy(&art_user[i].data, &arts[i].data,
> > sizeof(art_user[i].data));
> >         }
> > 
> >         if (copy_to_user(ubuf, art_user, art_len))
> > diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
> > b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
> > index 58822575fd54..78d942477035 100644
> > --- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
> > +++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
> > @@ -17,17 +17,19 @@
> >  struct art {
> >         acpi_handle source;
> >         acpi_handle target;
> > -       u64 weight;
> > -       u64 ac0_max;
> > -       u64 ac1_max;
> > -       u64 ac2_max;
> > -       u64 ac3_max;
> > -       u64 ac4_max;
> > -       u64 ac5_max;
> > -       u64 ac6_max;
> > -       u64 ac7_max;
> > -       u64 ac8_max;
> > -       u64 ac9_max;
> > +       struct_group(data,
> > +               u64 weight;
> > +               u64 ac0_max;
> > +               u64 ac1_max;
> > +               u64 ac2_max;
> > +               u64 ac3_max;
> > +               u64 ac4_max;
> > +               u64 ac5_max;
> > +               u64 ac6_max;
> > +               u64 ac7_max;
> > +               u64 ac8_max;
> > +               u64 ac9_max;
> > +       );
> >  } __packed;
> > 
> >  struct trt {
> > @@ -47,17 +49,19 @@ union art_object {
> >         struct {
> >                 char source_device[8]; /* ACPI single name */
> >                 char target_device[8]; /* ACPI single name */
> > -               u64 weight;
> > -               u64 ac0_max_level;
> > -               u64 ac1_max_level;
> > -               u64 ac2_max_level;
> > -               u64 ac3_max_level;
> > -               u64 ac4_max_level;
> > -               u64 ac5_max_level;
> > -               u64 ac6_max_level;
> > -               u64 ac7_max_level;
> > -               u64 ac8_max_level;
> > -               u64 ac9_max_level;
> > +               struct_group(data,
> > +                       u64 weight;
> > +                       u64 ac0_max_level;
> > +                       u64 ac1_max_level;
> > +                       u64 ac2_max_level;
> > +                       u64 ac3_max_level;
> > +                       u64 ac4_max_level;
> > +                       u64 ac5_max_level;
> > +                       u64 ac6_max_level;
> > +                       u64 ac7_max_level;
> > +                       u64 ac8_max_level;
> > +                       u64 ac9_max_level;
> > +               );
> >         };
> >         u64 __data[ACPI_NR_ART_ELEMENTS];
> >  };
> > --
> > 2.30.2
> > 


