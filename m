Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB89B5AE1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 05:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203F510E74C;
	Wed, 30 Oct 2024 04:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lmd0XHfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7F010E74C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 04:51:59 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2e56df894d4so4964829a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 21:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730263919; x=1730868719;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebK5FEqo1uQJrGG2XPzgss6DJVNI4exo5BqUHuwCN0U=;
 b=lmd0XHfzcQjS2piycgsav/fERgQyOraXbjSoSAoOorSwESPOSt7MFFFeDT+WaMOTg3
 4T7De+JpBpnleYF44I3jT/aaP/yFq/0RJRLLdD3+RGEnYpBaLBGyEZ0wVEi6W5NcY2Le
 Qgk6qFC9AGmf4FP1JXv1I9pFmoENQ3BpfPxNrrRCUDFtg1w+mYxQcEv0Z+Ma9tPhRbdy
 xhoRtM7hBcYAv3UxVBDivo1db+5sPmYAhmYpfzaJWea6fEpvXco7IJXRz2Sj4dw8H24x
 VA3CpVrGDLvINWtKC5Ho0WCuqVsJn9mQ5TRi/yRuKTt1kIn2+qWdFsak+MeFbnb55EAQ
 GWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730263919; x=1730868719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ebK5FEqo1uQJrGG2XPzgss6DJVNI4exo5BqUHuwCN0U=;
 b=HPtzfytEAv3vFcyeS9p7BAKE/a5P5AtRM4UR4Z1hw6IDK1pOaKTATlQST9WksMzzVJ
 S4Qb2E8QmgPPh8d32vFkrOO1Ojsmpr3dnMI0aaYJolmPifzkdbTu8pag4cO/Hq7OiaTq
 PCrL9VANFEWZD84Nd4Sd9HeWTtcYdQ6HPTQjZBbW80Jxcvn/VeDtfH+56ra2FiVYS2qc
 6/pp2aygN7FAu/mIKvLsWOCgaB/uyxDiX2F1GgE0xtvEOQN7CeRWJu6RexGLnKQ1TRAQ
 ZrZraZSvQOpF688C7ObccbJaugSVYXn7sJbS2VfxiL+dfGFMxsyD0TJ2xzgFByTSxDS7
 asPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlUDNggzh9d5TqWbTQxAMlJrJ3OlB4MN4bB4PCDBPoNlCZDSsMp0Du+iPoBTmntOOzLmL3sL5a5DU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywaucm9VL7RohLzvcpqmExz0EZN/0344bW33d1l/49jxgWYR28K
 GTxgTsZpSkPv9ndkuG1zSpb+JERAjuDb2faSrkpPxe0c6VyUeEG7xY+Qr9d48q5odvTy0Njmyp6
 q+O+ojJlqbMNxQh1FbDlqeNTEsc+wHPrrSgQd
X-Google-Smtp-Source: AGHT+IEQFx5Vol9XZhdV8siS1D10S0uW4JnzXjjG2nxUm0689UTM6b9J3FgMu5InPp+KGAT5fvuNb3m3n0qAQjll56w=
X-Received: by 2002:a17:90a:4b08:b0:2e2:bad3:e393 with SMTP id
 98e67ed59e1d1-2e8f104f1d4mr16084160a91.3.1730263918341; Tue, 29 Oct 2024
 21:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20241026045243.452957-1-saravanak@google.com>
 <76eb4a60-e192-4018-9770-4b973075a3cb@ideasonboard.com>
 <CAGETcx99+EA=t6KaWCWbHk=Xjj32UAKepktZkmLuap=K5G9h3w@mail.gmail.com>
 <10e892a8-2b07-480e-93c1-3083ce31e7e2@ideasonboard.com>
In-Reply-To: <10e892a8-2b07-480e-93c1-3083ce31e7e2@ideasonboard.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 29 Oct 2024 21:51:18 -0700
Message-ID: <CAGETcx8KUrZbf-FnQM3cD1n9gFDkSt0UEY_KeLtT+6fYENB40g@mail.gmail.com>
Subject: Re: [PATCH v2] driver core: fw_devlink: Stop trying to optimize cycle
 detection logic
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org
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

On Tue, Oct 29, 2024 at 4:21=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 28/10/2024 22:39, Saravana Kannan wrote:
> > On Mon, Oct 28, 2024 at 1:06=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> Hi,
> >>
> >> On 26/10/2024 07:52, Saravana Kannan wrote:
> >>> In attempting to optimize fw_devlink runtime, I introduced numerous c=
ycle
> >>> detection bugs by foregoing cycle detection logic under specific
> >>> conditions. Each fix has further narrowed the conditions for optimiza=
tion.
> >>>
> >>> It's time to give up on these optimization attempts and just run the =
cycle
> >>> detection logic every time fw_devlink tries to create a device link.
> >>>
> >>> The specific bug report that triggered this fix involved a supplier f=
wnode
> >>> that never gets a device created for it. Instead, the supplier fwnode=
 is
> >>> represented by the device that corresponds to an ancestor fwnode.
> >>>
> >>> In this case, fw_devlink didn't do any cycle detection because the cy=
cle
> >>> detection logic is only run when a device link is created between the
> >>> devices that correspond to the actual consumer and supplier fwnodes.
> >>>
> >>> With this change, fw_devlink will run cycle detection logic even when
> >>> creating SYNC_STATE_ONLY proxy device links from a device that is an
> >>> ancestor of a consumer fwnode.
> >>>
> >>> Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >>> Closes: https://lore.kernel.org/all/1a1ab663-d068-40fb-8c94-f0715403d=
276@ideasonboard.com/
> >>> Fixes: 6442d79d880c ("driver core: fw_devlink: Improve detection of o=
verlapping cycles")
> >>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>> ---
> >>> Greg,
> >>>
> >>> I've tested this on my end and it looks ok and nothing fishy is going
> >>> on. You can pick this up once Tomi gives a Tested-by.
> >>
> >> I tested this on TI AM62 SK board. It has an LVDS (OLDI) display and a
> >> HDMI output, and both displays are connected to the same display
> >> subsystem. I tested with OLDI single and dual link cases, with and
> >> without HDMI, and in all cases probing works fine.
> >>
> >> Looks good on that front, so:
> >>
> >> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >
> > Great! Thanks!
> >
> >> You also asked for a diff of the devlinks. That part doesn't look so
> >> good to me, but probably you can tell if it's normal or not.
> >
> > TL;DR: All device links in a cycle get marked as
> > DL_FLAG_SYNC_STATE_ONLY and DL_FLAG_CYCLE (in addition to other
> > flags). All DL_FLAG_SYNC_STATE_ONLY (not all of them are cycles) will
> > get deleted after the consumer probes (since they are no longer needed
> > after that). My guess on what's going on is that with the patch,
> > fw_devlink found and marked more device links as cycles. Ones that in
> > the past weren't detected as being part of a cycle but coincidentally
> > the "post-init" dependency was the one that was getting ignored/not
> > enforced. So the actual links in a cycle getting deleted after all the
> > devices have probed is not a problem.
>
> Ok. Yep, it might all be fine. I still don't understand all that's going
> on here, so maybe look at one more case below.
>
> > You can enable the "cycle" logs in drivers/base/core.c so it's easier
> > to follow the cycles fw_devlink detected. But the logs are a bit
> > cryptic because it tries to print all the multiple cycles that were
> > detected using a recursive search.
> >
> > The non-cycle use for DL_FLAG_SYNC_STATE_ONLY is for parent devices to
> > put a "proxy-vote" (Hey supplier, you still have a consumer that
> > hasn't bound to a driver yet) for descendant (children, grand
> > children) devices that haven't been created yet. So, without the fix
> > it's possible some descendant child never got to probe and the
> > DL_FLAG_SYNC_STATE_ONLY device link stuck around.
> >
> > If you can confirm all the deleted device links fall into one of these
> > two categories, then there's no issue here. If you find cases that
> > aren't clear, then let me know which one and point to specific nodes
> > in an upstream DTS file and I can take a look.
> >
> > Every device link folder has a "sync_state_only" file that says if it
> > has the DL_FLAG_SYNC_STATE_ONLY set. But to check for the cycle flag,
> > you'll have to extend the debug log in device_link_add() that goes:
> > "Linked as a sync state only consumer to......" and print the "flags" p=
aram.
>
> I added this print.
>
> I thought I'll test without any non-upstream patches, so this is booting
> with the upstream k3-am625-sk.dtb, no overlays. I've attached boot log
> (with this patch applied), and devlink lists, without and with this patch=
.
>
> As the OLDI stuff is not upstream, I did expect to see less diff, and
> that is the case. It's still somewhat interesting diff:
>
> $ diff devlink-broken.txt devlink-fixed.txt
> 1d0
> < i2c:1-0022--i2c:1-003b
>
> So that's the gpio expander (exp1: gpio@22 in k3-am625-sk.dts) and the
> hdmi bridge (sii9022: bridge-hdmi@3b in k3-am62x-sk-common.dtsi). And,
> indeed, in the log I can see:
>
> i2c 1-003b: Linked as a sync state only consumer to 1-0022 (flags 0x3c0)
> /bus@f0000/i2c@20010000/bridge-hdmi@3b Dropping the fwnode link to
> /bus@f0000/i2c@20010000/gpio@22
>
> If I'm not mistaken, the above means that the framework has decided
> there's a (possible) probe time cyclic dependency between the gpio
> expander and the hdmi bridge, right?
>
> I don't think that makes sense, and I was trying to understand why the
> framework has arrived to such a conclusion, but it's not clear to me.
>
> Also, I can see, e.g.:
>
> /bus@f0000/i2c@20010000: cycle: depends on /bus@f0000/dss@30200000
>
> So somehow the i2c bus has a dependency on the DSS? The DSS does not
> depend on the i2c, but the HDMI does, so I can understand that the DSS
> would have a dependency to i2c. But the other way around?

Thanks for being persistent! :) I think you found a real issue in this patc=
h.
I'm squeezing these fixes late at night and between my regular work.
So, apologies in advance for untested patches and me going with
hunches.

This part probably won't make sense, but I'm "explaining" it here just
to record it somewhere if I or someone else comes back and looks at
this after a few months.

What's happening is that when 30200000.dss was added, 20010000.i2c was
creating a sync state only proxy link for bridge-hdmi@3b (child of
i2c). But when creating the proxy link, fw_devlink detected the cycle
between bridge-hdmi@3b and 30200000.dss. That cycle is valid, but this
patch also results in marking the "proxy" link as part of a cycle
(when it wasn't). So it incorrectly marked i2c as being in a consumer
of with dss and part of a cycle.

Later on when running cycle detection logic between bridge-hdmi@3b and
gpio@22, the cycle detection logic follows the i2c to dss link because
it thinks the i2c really depends on dss but is part of a cycle.

Try this fix on top of this patch and it should allow probing for all
the previous broken scenarios AND should avoid dropping some links
incorrectly.

--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2115,11 +2115,6 @@ static int fw_devlink_create_devlink(struct device *=
con,
        if (link->flags & FWLINK_FLAG_IGNORE)
                return 0;

-       if (con->fwnode =3D=3D link->consumer)
-               flags =3D fw_devlink_get_flags(link->flags);
-       else
-               flags =3D FW_DEVLINK_FLAGS_PERMISSIVE;
-
        /*
         * In some cases, a device P might also be a supplier to its child =
node
         * C. However, this would defer the probe of C until the probe of P
@@ -2147,13 +2142,17 @@ static int fw_devlink_create_devlink(struct device =
*con,
        device_links_write_lock();
        if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
                __fwnode_link_cycle(link);
-               flags =3D fw_devlink_get_flags(link->flags);
                pr_debug("----- cycle: end -----\n");
                pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
                        link->consumer, sup_handle);
        }
        device_links_write_unlock();

+       if (con->fwnode =3D=3D link->consumer)
+               flags =3D fw_devlink_get_flags(link->flags);
+       else
+               flags =3D FW_DEVLINK_FLAGS_PERMISSIVE;
+
        if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
                sup_dev =3D fwnode_get_next_parent_dev(sup_handle);
        else

Thanks,
Saravana

>
>   Tomi
>
> >>
> >> $ diff devlink-single-broken.txt devlink-single-fixed.txt
> >
> > I was hoping you'd give me some line count diff too to get a sense of
> > if it's wreaking havoc or not. But based on my local testing on
> > different hardware, I'm expecting a very small number of device links
> > are getting affected.
> >
> >> 2d1
> >> < i2c:1-0022--i2c:1-003b
> >> 11d9
> >> <
> >> platform:44043000.system-controller:clock-controller--platform:2001000=
0.i2c
> >> 27d24
> >> < platform:44043000.system-controller:clock-controller--platform:60100=
0.gpio
> >> 42d38
> >> <
> >> platform:44043000.system-controller:power-controller--platform:2001000=
0.i2c
> >> 58d53
> >> < platform:44043000.system-controller:power-controller--platform:60100=
0.gpio
> >> 74d68
> >> < platform:4d000000.mailbox--platform:44043000.system-controller
> >
> > I took a quick look at this one in
> > arch/arm64/boot/dts/ti/k3-am62-main.dtsi which I assume is part of the
> > device you are testing on and I couldn't find a cycle. But with dtsi
> > and dts files, it's hard to find these manually. Let me know if
> > fw_devlink is thinking there's a cycle where there is none.
> >
> >> 76d69
> >> < platform:601000.gpio--i2c:1-0022
> >> 80d72
> >> < platform:bus@f0000:interrupt-controller@a00000--platform:601000.gpio
> >> 82d73
> >> < platform:f4000.pinctrl--i2c:1-0022
> >> 84d74
> >> < platform:f4000.pinctrl--platform:20010000.i2c
> >>
> >> "i2c:1-003b" is the hdmi bridge, "i2c:1-0022" is a gpio expander. So,
> >> for example, we lose the devlink between the gpio expander and the hdm=
i
> >> bridge. The expander is used for interrupts. There's an interrupt line
> >> from the HDMI bridge to the expander, and from there there's an
> >> interrupt line going to the SoC.
> >>
> >> Also, I noticed the devlinks change if I load the display drivers. The
> >> above is before loading. Comparing the loaded/not-loaded:
> >
> > Yeah, DL_FLAG_SYNC_STATE_ONLY device links vanishing as more devices
> > probe is not a problem. That's working as intended.
> >
> > Thanks,
> > Saravana
> >
> >>
> >> $ diff devlink-dual-fixed.txt devlink-dual-fixed-loaded.txt
> >> 3d2
> >> < i2c:1-003b--platform:30200000.dss
> >> 23d21
> >> <
> >> platform:44043000.system-controller:clock-controller--platform:3020000=
0.dss
> >> 52d49
> >> <
> >> platform:44043000.system-controller:power-controller--platform:3020000=
0.dss
> >> 73d69
> >> < platform:display--platform:30200000.dss
> >> 78d73
> >> < platform:f4000.pinctrl--platform:30200000.dss
> >> 97a93
> >>   > regulator:regulator.0--platform:display
> >>
> >>    Tomi
> >>
> >>
> >>> Thanks,
> >>> Saravana
> >>>
> >>> v1 -> v2:
> >>> - Removed the RFC tag
> >>> - Remaned the subject. v1 is https://lore.kernel.org/all/202410252237=
21.184998-1-saravanak@google.com/T/#u
> >>> - Added a NULL check to avoid NULL pointer deref
> >>>
> >>>    drivers/base/core.c | 46 ++++++++++++++++++++---------------------=
----
> >>>    1 file changed, 20 insertions(+), 26 deletions(-)
> >>>
> >>> diff --git a/drivers/base/core.c b/drivers/base/core.c
> >>> index 3b13fed1c3e3..f96f2e4c76b4 100644
> >>> --- a/drivers/base/core.c
> >>> +++ b/drivers/base/core.c
> >>> @@ -1990,10 +1990,10 @@ static struct device *fwnode_get_next_parent_=
dev(const struct fwnode_handle *fwn
> >>>     *
> >>>     * Return true if one or more cycles were found. Otherwise, return=
 false.
> >>>     */
> >>> -static bool __fw_devlink_relax_cycles(struct device *con,
> >>> +static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_hand=
le,
> >>>                                 struct fwnode_handle *sup_handle)
> >>>    {
> >>> -     struct device *sup_dev =3D NULL, *par_dev =3D NULL;
> >>> +     struct device *sup_dev =3D NULL, *par_dev =3D NULL, *con_dev =
=3D NULL;
> >>>        struct fwnode_link *link;
> >>>        struct device_link *dev_link;
> >>>        bool ret =3D false;
> >>> @@ -2010,22 +2010,22 @@ static bool __fw_devlink_relax_cycles(struct =
device *con,
> >>>
> >>>        sup_handle->flags |=3D FWNODE_FLAG_VISITED;
> >>>
> >>> -     sup_dev =3D get_dev_from_fwnode(sup_handle);
> >>> -
> >>>        /* Termination condition. */
> >>> -     if (sup_dev =3D=3D con) {
> >>> +     if (sup_handle =3D=3D con_handle) {
> >>>                pr_debug("----- cycle: start -----\n");
> >>>                ret =3D true;
> >>>                goto out;
> >>>        }
> >>>
> >>> +     sup_dev =3D get_dev_from_fwnode(sup_handle);
> >>> +     con_dev =3D get_dev_from_fwnode(con_handle);
> >>>        /*
> >>>         * If sup_dev is bound to a driver and @con hasn't started bin=
ding to a
> >>>         * driver, sup_dev can't be a consumer of @con. So, no need to=
 check
> >>>         * further.
> >>>         */
> >>>        if (sup_dev && sup_dev->links.status =3D=3D  DL_DEV_DRIVER_BOU=
ND &&
> >>> -         con->links.status =3D=3D DL_DEV_NO_DRIVER) {
> >>> +         con_dev && con_dev->links.status =3D=3D DL_DEV_NO_DRIVER) {
> >>>                ret =3D false;
> >>>                goto out;
> >>>        }
> >>> @@ -2034,7 +2034,7 @@ static bool __fw_devlink_relax_cycles(struct de=
vice *con,
> >>>                if (link->flags & FWLINK_FLAG_IGNORE)
> >>>                        continue;
> >>>
> >>> -             if (__fw_devlink_relax_cycles(con, link->supplier)) {
> >>> +             if (__fw_devlink_relax_cycles(con_handle, link->supplie=
r)) {
> >>>                        __fwnode_link_cycle(link);
> >>>                        ret =3D true;
> >>>                }
> >>> @@ -2049,7 +2049,7 @@ static bool __fw_devlink_relax_cycles(struct de=
vice *con,
> >>>        else
> >>>                par_dev =3D fwnode_get_next_parent_dev(sup_handle);
> >>>
> >>> -     if (par_dev && __fw_devlink_relax_cycles(con, par_dev->fwnode))=
 {
> >>> +     if (par_dev && __fw_devlink_relax_cycles(con_handle, par_dev->f=
wnode)) {
> >>>                pr_debug("%pfwf: cycle: child of %pfwf\n", sup_handle,
> >>>                         par_dev->fwnode);
> >>>                ret =3D true;
> >>> @@ -2067,7 +2067,7 @@ static bool __fw_devlink_relax_cycles(struct de=
vice *con,
> >>>                    !(dev_link->flags & DL_FLAG_CYCLE))
> >>>                        continue;
> >>>
> >>> -             if (__fw_devlink_relax_cycles(con,
> >>> +             if (__fw_devlink_relax_cycles(con_handle,
> >>>                                              dev_link->supplier->fwno=
de)) {
> >>>                        pr_debug("%pfwf: cycle: depends on %pfwf\n", s=
up_handle,
> >>>                                 dev_link->supplier->fwnode);
> >>> @@ -2140,25 +2140,19 @@ static int fw_devlink_create_devlink(struct d=
evice *con,
> >>>                return -EINVAL;
> >>>
> >>>        /*
> >>> -      * SYNC_STATE_ONLY device links don't block probing and support=
s cycles.
> >>> -      * So, one might expect that cycle detection isn't necessary fo=
r them.
> >>> -      * However, if the device link was marked as SYNC_STATE_ONLY be=
cause
> >>> -      * it's part of a cycle, then we still need to do cycle detecti=
on. This
> >>> -      * is because the consumer and supplier might be part of multip=
le cycles
> >>> -      * and we need to detect all those cycles.
> >>> +      * Don't try to optimize by not calling the cycle detection log=
ic under
> >>> +      * certain conditions. There's always some corner case that won=
't get
> >>> +      * detected.
> >>>         */
> >>> -     if (!device_link_flag_is_sync_state_only(flags) ||
> >>> -         flags & DL_FLAG_CYCLE) {
> >>> -             device_links_write_lock();
> >>> -             if (__fw_devlink_relax_cycles(con, sup_handle)) {
> >>> -                     __fwnode_link_cycle(link);
> >>> -                     flags =3D fw_devlink_get_flags(link->flags);
> >>> -                     pr_debug("----- cycle: end -----\n");
> >>> -                     dev_info(con, "Fixed dependency cycle(s) with %=
pfwf\n",
> >>> -                              sup_handle);
> >>> -             }
> >>> -             device_links_write_unlock();
> >>> +     device_links_write_lock();
> >>> +     if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
> >>> +             __fwnode_link_cycle(link);
> >>> +             flags =3D fw_devlink_get_flags(link->flags);
> >>> +             pr_debug("----- cycle: end -----\n");
> >>> +             pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n"=
,
> >>> +                     link->consumer, sup_handle);
> >>>        }
> >>> +     device_links_write_unlock();
> >>>
> >>>        if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
> >>>                sup_dev =3D fwnode_get_next_parent_dev(sup_handle);
> >>
