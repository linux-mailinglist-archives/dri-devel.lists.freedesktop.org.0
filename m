Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E54CBBE7D
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 19:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEE410E033;
	Sun, 14 Dec 2025 18:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TrmXUkKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CB610E033
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 18:04:39 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-6446c2bbfe3so2472165d50.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 10:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765735478; x=1766340278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puG/zUrwN9pOLbndn3I4P9pnyiBZM/rq86YReFVAOto=;
 b=TrmXUkKv9vSWxoxWJ+i6/fT0E8Qp0bkLZOxHGZUogJAtk+sk4pu80WqrQwz2AI+fwK
 Ccgf9RWShtu/K0XJbabZuRKysjpR6FSzx+uzMTBHKcDfwH5dKRiN4oJz30avNdcDGdXt
 3Vg6kOeuBbsVIlIR7NpMZpFSi3xq+ICzyoYiTHaUxpIGZYraA3DSCmV6X+D9Sm38oQLY
 eO20gE/PtDjEdGBBLrcz5zsey182PfPVsWP+E9RBWCDD5A4ydPZWqgDAPb3rWnamAX84
 Tgkak0ii5ng29630Qof8UB2pBPbvBK978ktp3B+cSnApdBDqV4tdhhv1maFZSe0pwaAT
 01AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765735478; x=1766340278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=puG/zUrwN9pOLbndn3I4P9pnyiBZM/rq86YReFVAOto=;
 b=gASQHHtHUO65CocKp7AGEDHtC22Hap623fIMEAbY8Ty49vMK5hfIcPI7PZKwFngghA
 5NohXpNdzgKtSNfcoWSoTffH3MsEtZnUXvcliTpVpFZNIeJjHIEnol5lrrkRBlVQwl2N
 FpjwWO6/3T69wLCMVfldGZjv9XM5YAeXD5HQATlekib4zKOiYaJDEV0Nm7L4L9H/Wf3k
 XxqCdh5Ji0shgeSehcoCbN68T3+va2iwekAv+QNIU+i+4UWntEB1svQ/SN68KzYZDW4P
 HYX4n2Pxu6aTIrdVqZGb3e8wVc7Ys2zkTvjiYnYg6XV7guVr7DCUvpYb2q9IvC6XTyML
 N5Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA73ulhXeijQEe3Ja5mP5PmPmBc3GoLXU1IJ+3V8dsB869SHYW20BtknqrWo2SFW5quaBFZG+dSPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOFhtzDO+zhmHNgFnt+gyQ6oQRV6GXOUNjX3R7t5K2xbsRlU69
 0yMwaSZPE3ocaoLim/urMdOK2GsZL27g8PU0lH8AZ+sap47FulxrgS/eRY0UE0tXfpIdD+fivFA
 GaI9XfdxrfpM4dmv2vucmVnr6+SmyTH0=
X-Gm-Gg: AY/fxX5KgKjPPavnZcvIzKqXJ8JKQfsV1XyWqcBKZEZi+BHWaXO1hhWc/gED3YakZYP
 ILpYCOLwHtBPi+Ukrw3QYULZykPP++DK2LQR5Lbo8N7LoLG/2NwE4ty9s9tdhfLZRaz1jPUKJnZ
 JtiPDtOdifhFL9NOU0/vOOK0WlgZX431KYlmp0dM9YcjvCwBCmIBCBaMiCq2GQurXf1CiMSJf5C
 /PPO++jfKh6bIUD+Gfm+PEYjfCy/ZQ0Q9MyGHCTDgAmOujVNbp0DSctLkUHLHYnQK8AEwc=
X-Google-Smtp-Source: AGHT+IHt5bPpGheag9xUvnESpgoGPlihbC4V3XSWtT6F0PXTxFbJaqGTJ1QzaM32um1NOFSmXEoriYhggf0jHUFZafM=
X-Received: by 2002:a05:690e:1589:20b0:644:60d9:7514 with SMTP id
 956f58d0204a3-645556806a0mr4850305d50.88.1765735477909; Sun, 14 Dec 2025
 10:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-30-jim.cromie@gmail.com>
 <ec20defe-8559-482e-8643-b69a4279cec1@akamai.com>
In-Reply-To: <ec20defe-8559-482e-8643-b69a4279cec1@akamai.com>
From: jim.cromie@gmail.com
Date: Mon, 15 Dec 2025 07:04:11 +1300
X-Gm-Features: AQt7F2on3VIzanxyWm-iUIL1Ljoz3_TdqkbVLQN3C-gs59mYF0g081nY3HAsV1A
Message-ID: <CAJfuBxwPBG2yOEWjf_giWGPmfNPr2nHxncah=oyF7ChXzbRdZg@mail.gmail.com>
Subject: Re: [PATCH v6 29/31] dyndbg: resolve "protection" of class'd pr_debug
To: Jason Baron <jbaron@akamai.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
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

On Fri, Dec 12, 2025 at 10:26=E2=80=AFAM Jason Baron <jbaron@akamai.com> wr=
ote:
>
>
>
> On 11/18/25 3:18 PM, Jim Cromie wrote:
> > !-------------------------------------------------------------------|
> >    This Message Is From an External Sender
> >    This message came from outside your organization.
> > |-------------------------------------------------------------------!
> >
> > classmap-v1 code protected class'd pr_debugs from unintended
> > changes by unclassed/_DFLT queries:
> >
> >    # - to declutter examples:
> >    alias ddcmd=3D'echo $* > /proc/dynamic_debug/control'
> >
> >    # IOW, this should NOT alter drm.debug settings
> >    ddcmd -p
> >
> >    # Instead, you must name the class to change it.
> >    # Protective but tedious
> >    ddcmd class DRM_UT_CORE +p
> >
> >    # Or do it the (old school) subsystem way
> >    # This is ABI !!
> >    echo 1 > /sys/module/drm/parameters/debug
> >
> > Since the debug sysfs-node is ABI, if dyndbg is going to implement it,
> > it must also honor its settings; it must at least protect against
> > accidental changes to its classes from legacy queries.
> >
> > The protection allows all previously conceived queries to work the way
> > they always have; ie select the same set of pr_debugs, despite the
> > inclusion of whole new classes of pr_debugs.
> >
> > But that choice has 2 downsides:
> >
> > 1. "name the class to change it" makes a tedious long-winded
> > interface, needing many commands to set DRM_UT_* one at a time.
> >
> > 2. It makes the class keyword special in some sense; the other
> > keywords skip only on query mismatch, otherwise the code falls thru to
> > adjust the pr-debug site.
> >
> >   Jason Baron didn't like v1 on point 2.
> >   Louis Chauvet       didn't like recent rev on point 1 tedium.
> >
> > But that said: /sys/ is ABI, so this must be reliable:
> >
> >    #> echo 0x1f > /sys/module/drm/parameters/debug
> >
> > It 'just works' without dyndbg underneath; we must deliver that same
> > stability.  Convenience is secondary.
> >
> > The new resolution:
> >
> > If ABI is the blocking issue, then no ABI means no blocking issue.
> > IOW, if the classmap has no presence under /sys/*, ie no PARAM, there
> > is no ABI to guard, and no reason to enforce a tedious interface.
> >
> > In the future, if DRM wants to alter this protection, that is
> > practical, but I think default-on is the correct mode.
> >
> > So atm classes without a PARAM are unprotected at >control, allowing
> > admins their shortcuts.  I think this could satisfy all viewpoints.
> >
> > That said, theres also a possibility of wildcard classes:
> >
> >     #> ddcmd class '*' +p
> >
> > Currently, the query-class is exact-matched against each module's
> > classmaps.names.  This gives precise behavior, a good basis.
> >
> > But class wildcards are possible, they just did'nt appear useful for
> > DRM, whose classmap names are a flat DRM_UT_* namespace.
> >
> > IOW, theres no useful selectivity there:
> >
> >     #> ddcmd class "DRM_*" +p         # these enable every DRM_* class
> >     #> ddcmd class "DRM_UT_*" +p
> >
> >     #> ddcmd class "DRM_UT_V*" +p     # finally select just 1: DRM_UT_V=
BL
> >     #> ddcmd class "DRM_UT_D*" +p     # but this gets 3
> >
> >     #> ddcmd class "D*V*" +p          # here be dragons
> >
> > But there is debatable utility in the feature.
> >
> >     #> ddcmd class __DEFAULT__ -p     # what about this ?
> >     #> ddcmd -p                               # thats what this does. a=
utomatically
> >
> > Anyway, this patch does:
> >
> > 1. adds link field from _ddebug_class_map to the .controlling_param
> >
> > 2. sets it in ddebug_match_apply_kparam(), during modprobe/init,
> >     when options like drm.debug=3DVAL are handled.
> >
> > 3. ddebug_class_has_param() now checks .controlling_param
> >
> > 4. ddebug_class_wants_protection() macro renames 3.
> >     this frames it as a separable policy decision
> >
> > 5. ddebug_match_desc() gets the most attention:
> >
> > a. move classmap consideration to the bottom
> >     this insures all other constraints act 1st.
> >     allows simpler 'final' decisions.
> >
> > b. split class choices cleanly on query:
> >     class FOO vs none, and class'd vs _DPRINTK_CLASS_DFLT site.
> >
> > c. calls 4 when applying a class-less query to a class'd pr_debug
> >     here we need a new fn to find the classmap with this .class_id
> >
> > d. calls new ddebug_find_classmap_by_class_id().
> >     when class-less query looks at a class'd pr_debug.
> >     finds classmap, which can then decide, currently by PARAM existence=
.
> >
> > NOTES:
> >
> > protection is only against class-less queries, explicit "class FOO"
> > adjustments are allowed (that is the mechanism).
> >
> > The drm.debug sysfs-node heavily under-specifies the class'd pr_debugs
> > it controls; none of the +mfls prefixing flags have any effect, and
> > each callsite remains individually controllable. drm.debug just
> > toggles the +p flag for all the modules' class'd pr_debugs.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > history
> > -v0 - original, before classmaps: no special case keywords
> > -v1 - "class DEFAULT" is assumed if not mentioned.
> >        this protects classes from class-less queries
> >
> > -v2.pre-this-patch - protection macro'd to false
> > -v2.with-this-patch - sysfs knob decides
> > -v2.speculative - module decides wrt classmap protection
> >                 seems unneeded now, TBD
> >
> > v3 - new patch
> > v4
> > - drop fn-scope map var, with 2 local vars, renamed to purpose
> > - fix for NULL ptr case.
> > - Add loop-var to reduce many "&dt->info." exprs to "di->"
> > - add 1-liner postcondition comments
> >
> > fixus
> > ---
> >   include/linux/dynamic_debug.h |  14 ++--
> >   lib/dynamic_debug.c           | 127 +++++++++++++++++++++++++++------=
-
> >   2 files changed, 110 insertions(+), 31 deletions(-)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index b1d11d946780..b22da40e2583 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -75,6 +75,7 @@ enum ddebug_class_map_type {
> >    * map @class_names 0..N to consecutive constants starting at @base.
> >    */
> >   struct _ddebug_class_map {
> > +     struct _ddebug_class_param *controlling_param;
> >       const struct module *mod;       /* NULL for builtins */
> >       const char *mod_name;
> >       const char **class_names;
> > @@ -259,7 +260,12 @@ struct _ddebug_class_param {
> >    *
> >    * Creates a sysfs-param to control the classes defined by the
> >    * exported classmap, with bits 0..N-1 mapped to the classes named.
> > - * This version keeps class-state in a private long int.
> > + *
> > + * Since sysfs-params are ABI, this also protects the classmap'd
> > + * pr_debugs from un-class'd `echo -p > /proc/dynamic_debug/control`
> > + * changes.
> > + *
> > + * This keeps class-state in a private long int.
> >    */
> >   #define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)           \
> >       static unsigned long _name##_bvec;                              \
> > @@ -272,10 +278,8 @@ struct _ddebug_class_param {
> >    * @_var:   name of the (exported) classmap var defining the classes/=
bits
> >    * @_flags: flags to be toggled, typically just 'p'
> >    *
> > - * Creates a sysfs-param to control the classes defined by the
> > - * exported clasmap, with bits 0..N-1 mapped to the classes named.
> > - * This version keeps class-state in user @_bits.  This lets drm check
> > - * __drm_debug elsewhere too.
> > + * Like DYNAMIC_DEBUG_CLASSMAP_PARAM, but maintains param-state in
> > + * extern @_bits.  This lets DRM check __drm_debug elsewhere too.
> >    */
> >   #define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags) =
       \
> >       __DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 636a6b5741f7..1082e0273f0e 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -206,6 +206,50 @@ ddebug_find_valid_class(struct _ddebug_info const =
*di, const char *query_class,
> >       return NULL;
> >   }
> >
> > +static bool ddebug_class_in_range(const int class_id, const struct _dd=
ebug_class_map *map)
> > +{
> > +     return (class_id >=3D map->base &&
> > +             class_id < map->base + map->length);
> > +}
> > +
> > +static struct _ddebug_class_map *
> > +ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
> > +{
> > +     struct _ddebug_class_map *map;
> > +     struct _ddebug_class_user *cli;
> > +     int i;
> > +
> > +     for_subvec(i, map, di, maps)
> > +             if (ddebug_class_in_range(class_id, map))
> > +                     return map;
> > +
> > +     for_subvec(i, cli, di, users)
> > +             if (ddebug_class_in_range(class_id, cli->map))
> > +                     return cli->map;
> > +
> > +     return NULL;
> > +}
> > +
> > +/*
> > + * classmaps-V1 protected classes from changes by legacy commands
> > + * (those selecting _DPRINTK_CLASS_DFLT by omission).  This had the
> > + * downside that saying "class FOO" for every change can get tedious.
> > + *
> > + * V2 is smarter, it protects class-maps if the defining module also
> > + * calls DYNAMIC_DEBUG_CLASSMAP_PARAM to create a sysfs parameter.
> > + * Since the author wants the knob, we should assume they intend to
> > + * use it (in preference to "class FOO +p" >control), and want to
> > + * trust its settings.  This gives protection when its useful, and not
> > + * when its just tedious.
> > + */
> > +static inline bool ddebug_class_has_param(const struct _ddebug_class_m=
ap *map)
> > +{
> > +     return !!(map->controlling_param);
> > +}
> > +
> > +/* re-framed as a policy choice */
> > +#define ddebug_class_wants_protection(map) (ddebug_class_has_param(map=
))
> > +
> >   /*
> >    * Search the tables for _ddebug's which match the given `query' and
> >    * apply the `flags' and `mask' to them.  Returns number of matching
> > @@ -214,11 +258,10 @@ ddebug_find_valid_class(struct _ddebug_info const=
 *di, const char *query_class,
> >    */
> >   static bool ddebug_match_desc(const struct ddebug_query *query,
> >                             struct _ddebug *dp,
> > -                           int valid_class)
> > +                           struct _ddebug_info *di,
> > +                           int selected_class)
> >   {
> > -     /* match site against query-class */
> > -     if (dp->class_id !=3D valid_class)
> > -             return false;
> > +     struct _ddebug_class_map *site_map;
> >
> >       /* match against the source filename */
> >       if (query->filename &&
> > @@ -255,7 +298,28 @@ static bool ddebug_match_desc(const struct ddebug_=
query *query,
> >           dp->lineno > query->last_lineno)
> >               return false;
> >
> > -     return true;
> > +     /*
> > +      * above are all satisfied, so we can make final decisions:
> > +      * 1- class FOO or implied class __DEFAULT__
> > +      * 2- site.is_classed or not
> > +      */
> > +     if (query->class_string) {
> > +             /* class FOO given, exact match required */
> > +             return (dp->class_id =3D=3D selected_class);
> > +     }
> > +     /* query class __DEFAULT__ by omission. */
> > +     if (dp->class_id =3D=3D _DPRINTK_CLASS_DFLT) {
> > +             /* un-classed site */
> > +             return true;
> > +     }
> > +     /* site is class'd */
> > +     site_map =3D ddebug_find_map_by_class_id(di, dp->class_id);
> > +     if (!site_map) {
> > +             /* _UNKNOWN_ class_id. XXX: Allow changes here ? */
> > +             return false;
> > +     }
>
> Do we want a WARN_ON_ONCE() here? I think this is the case where we have
> class_id for the call site but it's not default, so shouldn't it always
> have a map or be a user of the map?
>

Yes, I think so.
I will add it.


> Thanks,
>
> -Jason
>
