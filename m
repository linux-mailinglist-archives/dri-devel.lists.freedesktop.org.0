Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D01CA8A905
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 22:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB2E10E177;
	Tue, 15 Apr 2025 20:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XooLRO5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15CB10E177;
 Tue, 15 Apr 2025 20:15:51 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6febf391132so56867907b3.1; 
 Tue, 15 Apr 2025 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744748150; x=1745352950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RuI60MEO0RHxwbmndWEztZeXe9SV7ztYqn+5hRpJvc8=;
 b=XooLRO5TSdGWleAfTsL+N4W6mPkgUxYcVYo7FHgcdwyjvJNef/nP1d1saF49olQx4U
 jBxA5ImvgOHoT9RxYH7DIifd0sl040dPmbfvB3kOwmmfEk35oNJu3htrtLayXbH4SqB2
 2my3nyXmDL9jEwQZwcUbNxNenHJVWKi0XUNRGfjLKNXLp09yfcdgy6VchQe6vpWHQDLi
 Zt65z+A+hJQZ001bJ+DTGuSkOfNJshz64C3VAq4DpcrP/IKtz2yQMhDKlBcnVlUM5Fzg
 veoi++6BBAsA5bWrjPzKnkCWjV6shpkjVvBN3QVLAAAWEnWq8IIUehPi2MdFJbUX/8dk
 yAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744748150; x=1745352950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RuI60MEO0RHxwbmndWEztZeXe9SV7ztYqn+5hRpJvc8=;
 b=VjrDMbqB0ixmde2l5EXBgKyQp0L2pKAuX5bjmgp5mM+GJWTdu2Wsn+BiChI3TF6wqc
 DRr0CcWRdClQLQfGFYqIOTAqPcZdYiLzA1m/4k8EUTfd4hBtFCCUXLLtPWZhTvs6EgaX
 Y8ko4gGH+opQ67qH0DY8rmngc8CYvtPZcsCHFjMmCuGtf/mcqXk4fBOnU9PgUOuvb+L9
 jPvAivSqNVK1QsCGb5MdVkWIhF5GRYKN2xRzcZRHsIvzPOkIrwptqXuTP14isrBwwGgu
 qvvM9sV6h+Yo0mteebMPF2ebWsPniAzsY88TF1ey7cWvWIzcNgUzesyNgP4Aio1/JjJq
 Ktpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpP438knCflDxCcsg//aW0UPsRRCnqUIRUcG5iJQlRL1OoR7hr3eZ5kqMFSOmti7C6pHU+7vPpTy752p+n6w==@lists.freedesktop.org,
 AJvYcCXGZALz0ziqu755XBK9DyJz9vAbTfRT/aHQ6Ag1uR26TjenZPUXFquJrztbIOxQwQYCKs8OuNPr/1d5@lists.freedesktop.org,
 AJvYcCXHze5h5e4BVrImFgAwOmupGABV6pLeqglr0+KyQnBOS0nobaZJugVOt02TCqNXTHcmoKZgNf+IwHW6@lists.freedesktop.org,
 AJvYcCXb/WLuqiQg8u4KkfzslUMR1WdMnRZ7mM2qRF4thUC6MKBXRnXUgfUrVklCcfOEHSh6OJjuzjCy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWRojtJEfvF22/oDmWmrCLpkTPB+lTSUuec5Dscu58x5Ah8Uma
 jgXCrAw2s7gYq7Z4cfgNmk16j/oLR21GcO8gUG3A1jX2cg7qP2qTGAdnXt3ZKBeG7A/fUIIYBPF
 OGB5yipxdkRpJ5+1Ms/mB+uTMVwM=
X-Gm-Gg: ASbGncvpHrV9iZD6hoUwsznvk+qxqRXuzsz2RmYCr9cdW+TeTsIt9FmdYXm4KZk2wpg
 FOdlQL38VZRWrIciQ/eR//nBes7AHvSthTKIo+CqFxadb5po/GzhqlPEXj7ebGzHyqtPp50UgK/
 gu2hS0wg4pTgwJ263MhbvT
X-Google-Smtp-Source: AGHT+IE76oJwMupqx5P+4+nsCpN0Rf38R9V2tja8XN9qhSobyPEx1h6yavJRqYltdgAXIrNpHLFenkcJYLNoUsf7KMQ=
X-Received: by 2002:a05:690c:6e09:b0:703:b278:db2d with SMTP id
 00721157ae682-706aceb9c37mr12720987b3.12.1744748150648; Tue, 15 Apr 2025
 13:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-22-jim.cromie@gmail.com>
 <948a48a8-10c4-4440-b905-a1db669a31ba@bootlin.com>
In-Reply-To: <948a48a8-10c4-4440-b905-a1db669a31ba@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 14:15:24 -0600
X-Gm-Features: ATxdqUFuT29QvT9OQ8Dzq1ooQJWL8v5JATc8uBnNix4CnQIMzi9vLxbfc1eDONM
Message-ID: <CAJfuBxx4kNb6ikVSAOX8bgnaALq8M1qp5UUdfXXey4yqvaU3Gw@mail.gmail.com>
Subject: Re: [PATCH v3 21/54] dyndbg-test: change do_prints testpoint to
 accept a loopct
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 15, 2025 at 4:04=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints
> >
> > This allows its use as a scriptable load generator, to generate
> > dynamic-prefix-emits for flag combinations vs undecorated messages.
> > This will make it easy to assess the cost of the prefixing.
> >
> > Reading the ./do_prints node also prints messages (once) to the-log.
> >
> > NB: the count is clamped to 10000, chosen to be notice able, but not
> > annoying, and not enough to accidentally flood the logs.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>
> I think this could be in a separate series / merged independently to
> reduce the size of this series.

I have no strong opinions here.
I included it to acknowledge that this patchset is mainly for performance,
ie to replace LOTS of bit-tests, (some of which are tested at framerate).
So it follows that I should be able to demonstrate the savings somehow.

I havent done so yet, I was hoping that the benefits are obvious
enough not require proof.




>
> > ---
> >   lib/test_dynamic_debug.c | 37 ++++++++++++++++++++++++++-----------
> >   1 file changed, 26 insertions(+), 11 deletions(-)
> >
> > diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
> > index 9f9e3fddd7e6..4a3d2612ef60 100644
> > --- a/lib/test_dynamic_debug.c
> > +++ b/lib/test_dynamic_debug.c
> > @@ -29,18 +29,30 @@
> >
> >   #include <linux/module.h>
> >
> > -/* re-gen output by reading or writing sysfs node: do_prints */
> > -
> > -static void do_prints(void); /* device under test */
> > +/* re-trigger debug output by reading or writing sysfs node: do_prints=
 */
> > +#define PRINT_CLAMP 10000
> > +static void do_prints(unsigned int); /* device under test */
> >   static int param_set_do_prints(const char *instr, const struct kernel=
_param *kp)
> >   {
> > -     do_prints();
> > +     int rc;
> > +     unsigned int ct;
> > +
> > +     rc =3D kstrtouint(instr, 0, &ct);
> > +     if (rc) {
> > +             pr_err("expecting numeric input, using 1 instead\n");
> > +             ct =3D 1;
> > +     }
> > +     if (ct > PRINT_CLAMP) {
> > +             ct =3D PRINT_CLAMP;
> > +             pr_info("clamping print-count to %d\n", ct);
> > +     }
> > +     do_prints(ct);
> >       return 0;
> >   }
> >   static int param_get_do_prints(char *buffer, const struct kernel_para=
m *kp)
> >   {
> > -     do_prints();
> > -     return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
> > +     do_prints(1);
> > +     return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
> >   }
> >   static const struct kernel_param_ops param_ops_do_prints =3D {
> >       .set =3D param_set_do_prints,
> > @@ -191,17 +203,20 @@ static void do_levels(void)
> >       prdbg(V7);
> >   }
> >
> > -static void do_prints(void)
> > +static void do_prints(unsigned int ct)
> >   {
> > -     pr_debug("do_prints:\n");
> > -     do_cats();
> > -     do_levels();
> > +     /* maybe clamp this */
> > +     pr_debug("do-prints %d times:\n", ct);
> > +     for (; ct; ct--) {
> > +             do_cats();
> > +             do_levels();
> > +     }
> >   }
> >
> >   static int __init test_dynamic_debug_init(void)
> >   {
> >       pr_debug("init start\n");
> > -     do_prints();
> > +     do_prints(1);
> >       pr_debug("init done\n");
> >       return 0;
> >   }
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
