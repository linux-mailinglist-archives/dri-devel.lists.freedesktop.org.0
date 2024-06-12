Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B9905022
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 12:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0838410E1FD;
	Wed, 12 Jun 2024 10:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9310E1FD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 10:10:00 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sHKvW-000177-2m; Wed, 12 Jun 2024 12:09:58 +0200
Message-ID: <ffd85e88bd78193fe951d60717fc4fdcc110a370.camel@pengutronix.de>
Subject: Re: [PATCH v3] devres: Refactor using guards
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>, 
 gregkh@linuxfoundation.org, rafael@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: trivial@kernel.org, linux-amarula@amarulasolutions.com
Date: Wed, 12 Jun 2024 12:09:57 +0200
In-Reply-To: <a2a51ff4-f369-4ed3-b3bd-373fbb590424@amarulasolutions.com>
References: <20240611093710.1066510-1-andrea.calabrese@amarulasolutions.com>
 <81e1972e636a2d81f34de059a24ac27133da4bb0.camel@pengutronix.de>
 <a2a51ff4-f369-4ed3-b3bd-373fbb590424@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Mittwoch, dem 12.06.2024 um 12:00 +0200 schrieb Andrea Calabrese:
> Hi Lucas,
>=20
> On 12/06/2024 11:26, Lucas Stach wrote:
> > Am Dienstag, dem 11.06.2024 um 11:37 +0200 schrieb Andrea Calabrese:
> > > Code refactoring using the recent guard and scoped_guard macros
> > > for automatic cleanup of the spinlocks. This does not change the
> > > effective behaviour of the kernel, but guarantees a cleaned-up exit f=
rom
> > > each lock, automatically avoiding potential deadlocks.
> > >=20
> > > Signed-off-by: Andrea Calabrese <andrea.calabrese@amarulasolutions.co=
m>
> > >=20
> > > ---
> > > Changed commit message from V2. Also changed title, shortened the fil=
e
> > > name.
> > >=20
> > > diff --git a/drivers/base/devres.c b/drivers/base/devres.c
> > > index 3df0025d12aa..a98720e0cb2b 100644
> > > --- a/drivers/base/devres.c
> > > +++ b/drivers/base/devres.c
> > > @@ -194,14 +194,12 @@ void devres_for_each_res(struct device *dev, dr=
_release_t release,
> > >   {
> > >   	struct devres_node *node;
> > >   	struct devres_node *tmp;
> > > -	unsigned long flags;
> > >  =20
> > >   	if (!fn)
> > >   		return;
> > >  =20
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > -	list_for_each_entry_safe_reverse(node, tmp,
> > > -			&dev->devres_head, entry) {
> > > +	guard(spinlock)(&dev->devres_lock);
> > This is not equivalent to the current code. You are dropping the
> > _irqsave part of the locking scheme, totally changing the semantics
> > here. This issue is present in multiple places in this patch.
> >=20
> > Regards,
> > Lucas
> I don't see where is the issue here, as I am using both guard and=20
> scoped_guard similarly to how they are used in=20
> drivers/gpio/gpiolib-cdev.c, which I took as a reference for the usage=
=20
> of the construct. If so, probably we may=C2=A0 both be using it wrong.

Blindly copying from a another subsystem, which may have a very
different locking architecture, is never a good idea. Please educate
yourself about the difference between spin_lock, spin_lock_irq and
spin_lock_irqsave.

You need to use guard(spinlock_irqsave) here for the new code to be
equivalent to the code you are removing. Since this is supposed to be a
cleanup/simplification the new code _needs_ to keep the semantics of
the original code. You can not hide a total change in locking
architecture in a change like that.

Regards,
Lucas

> > > +	list_for_each_entry_safe_reverse(node, tmp, &dev->devres_head, entr=
y) {
> > >   		struct devres *dr =3D container_of(node, struct devres, node);
> > >  =20
> > >   		if (node->release !=3D release)
> > > @@ -210,7 +208,6 @@ void devres_for_each_res(struct device *dev, dr_r=
elease_t release,
> > >   			continue;
> > >   		fn(dev, dr->data, data);
> > >   	}
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > >   }
> > >   EXPORT_SYMBOL_GPL(devres_for_each_res);
> > >  =20
> > > @@ -243,11 +240,9 @@ EXPORT_SYMBOL_GPL(devres_free);
> > >   void devres_add(struct device *dev, void *res)
> > >   {
> > >   	struct devres *dr =3D container_of(res, struct devres, data);
> > > -	unsigned long flags;
> > >  =20
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > +	guard(spinlock)(&dev->devres_lock);
> > >   	add_dr(dev, &dr->node);
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > >   }
> > >   EXPORT_SYMBOL_GPL(devres_add);
> > >  =20
> > > @@ -287,11 +282,8 @@ void * devres_find(struct device *dev, dr_releas=
e_t release,
> > >   		   dr_match_t match, void *match_data)
> > >   {
> > >   	struct devres *dr;
> > > -	unsigned long flags;
> > > -
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > +	guard(spinlock)(&dev->devres_lock);
> > >   	dr =3D find_dr(dev, release, match, match_data);
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > >  =20
> > >   	if (dr)
> > >   		return dr->data;
> > > @@ -318,16 +310,14 @@ void * devres_get(struct device *dev, void *new=
_res,
> > >   {
> > >   	struct devres *new_dr =3D container_of(new_res, struct devres, dat=
a);
> > >   	struct devres *dr;
> > > -	unsigned long flags;
> > > -
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > -	dr =3D find_dr(dev, new_dr->node.release, match, match_data);
> > > -	if (!dr) {
> > > -		add_dr(dev, &new_dr->node);
> > > -		dr =3D new_dr;
> > > -		new_res =3D NULL;
> > > +	scoped_guard(spinlock, &dev->devres_lock) {
> > > +		dr =3D find_dr(dev, new_dr->node.release, match, match_data);
> > > +		if (!dr) {
> > > +			add_dr(dev, &new_dr->node);
> > > +			dr =3D new_dr;
> > > +			new_res =3D NULL;
> > > +		}
> > >   	}
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > >   	devres_free(new_res);
> > >  =20
> > >   	return dr->data;
> > > @@ -353,15 +343,13 @@ void * devres_remove(struct device *dev, dr_rel=
ease_t release,
> > >   		     dr_match_t match, void *match_data)
> > >   {
> > >   	struct devres *dr;
> > > -	unsigned long flags;
> > > -
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > -	dr =3D find_dr(dev, release, match, match_data);
> > > -	if (dr) {
> > > -		list_del_init(&dr->node.entry);
> > > -		devres_log(dev, &dr->node, "REM");
> > > +	scoped_guard(spinlock, &dev->devres_lock) {
> > > +		dr =3D find_dr(dev, release, match, match_data);
> > > +		if (dr) {
> > > +			list_del_init(&dr->node.entry);
> > > +			devres_log(dev, &dr->node, "REM");
> > > +		}
> > >   	}
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > >  =20
> > >   	if (dr)
> > >   		return dr->data;
> > > @@ -516,7 +504,6 @@ static void release_nodes(struct device *dev, str=
uct list_head *todo)
> > >    */
> > >   int devres_release_all(struct device *dev)
> > >   {
> > > -	unsigned long flags;
> > >   	LIST_HEAD(todo);
> > >   	int cnt;
> > >  =20
> > > @@ -528,9 +515,9 @@ int devres_release_all(struct device *dev)
> > >   	if (list_empty(&dev->devres_head))
> > >   		return 0;
> > >  =20
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > -	cnt =3D remove_nodes(dev, dev->devres_head.next, &dev->devres_head,=
 &todo);
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > > +	scoped_guard(spinlock, &dev->devres_lock) {
> > > +		cnt =3D remove_nodes(dev, dev->devres_head.next, &dev->devres_head=
, &todo);
> > > +	}
> > >  =20
> > >   	release_nodes(dev, &todo);
> > >   	return cnt;
> > > @@ -552,7 +539,6 @@ int devres_release_all(struct device *dev)
> > >   void * devres_open_group(struct device *dev, void *id, gfp_t gfp)
> > >   {
> > >   	struct devres_group *grp;
> > > -	unsigned long flags;
> > >  =20
> > >   	grp =3D kmalloc(sizeof(*grp), gfp);
> > >   	if (unlikely(!grp))
> > > @@ -568,9 +554,8 @@ void * devres_open_group(struct device *dev, void=
 *id, gfp_t gfp)
> > >   	if (id)
> > >   		grp->id =3D id;
> > >  =20
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > +	guard(spinlock)(&dev->devres_lock);
> > >   	add_dr(dev, &grp->node[0]);
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > >   	return grp->id;
> > >   }
> > >   EXPORT_SYMBOL_GPL(devres_open_group);
> > > @@ -609,17 +594,14 @@ static struct devres_group * find_group(struct =
device *dev, void *id)
> > >   void devres_close_group(struct device *dev, void *id)
> > >   {
> > >   	struct devres_group *grp;
> > > -	unsigned long flags;
> > >  =20
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > +	guard(spinlock)(&dev->devres_lock);
> > >  =20
> > >   	grp =3D find_group(dev, id);
> > >   	if (grp)
> > >   		add_dr(dev, &grp->node[1]);
> > >   	else
> > >   		WARN_ON(1);
> > > -
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > >   }
> > >   EXPORT_SYMBOL_GPL(devres_close_group);
> > >  =20
> > > @@ -635,19 +617,16 @@ EXPORT_SYMBOL_GPL(devres_close_group);
> > >   void devres_remove_group(struct device *dev, void *id)
> > >   {
> > >   	struct devres_group *grp;
> > > -	unsigned long flags;
> > > -
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > -
> > > -	grp =3D find_group(dev, id);
> > > -	if (grp) {
> > > -		list_del_init(&grp->node[0].entry);
> > > -		list_del_init(&grp->node[1].entry);
> > > -		devres_log(dev, &grp->node[0], "REM");
> > > -	} else
> > > -		WARN_ON(1);
> > >  =20
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > > +	scoped_guard(spinlock, &dev->devres_lock) {
> > > +		grp =3D find_group(dev, id);
> > > +		if (grp) {
> > > +			list_del_init(&grp->node[0].entry);
> > > +			list_del_init(&grp->node[1].entry);
> > > +			devres_log(dev, &grp->node[0], "REM");
> > > +		} else
> > > +			WARN_ON(1);
> > > +	}
> > >  =20
> > >   	kfree(grp);
> > >   }
> > > @@ -668,11 +647,10 @@ EXPORT_SYMBOL_GPL(devres_remove_group);
> > >   int devres_release_group(struct device *dev, void *id)
> > >   {
> > >   	struct devres_group *grp;
> > > -	unsigned long flags;
> > >   	LIST_HEAD(todo);
> > >   	int cnt =3D 0;
> > >  =20
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > +	guard(spinlock)(&dev->devres_lock);
> > >  =20
> > >   	grp =3D find_group(dev, id);
> > >   	if (grp) {
> > > @@ -683,12 +661,9 @@ int devres_release_group(struct device *dev, voi=
d *id)
> > >   			end =3D grp->node[1].entry.next;
> > >  =20
> > >   		cnt =3D remove_nodes(dev, first, end, &todo);
> > > -		spin_unlock_irqrestore(&dev->devres_lock, flags);
> > > -
> > >   		release_nodes(dev, &todo);
> > >   	} else {
> > >   		WARN_ON(1);
> > > -		spin_unlock_irqrestore(&dev->devres_lock, flags);
> > >   	}
> > >  =20
> > >   	return cnt;
> > > @@ -860,7 +835,6 @@ void *devm_krealloc(struct device *dev, void *ptr=
, size_t new_size, gfp_t gfp)
> > >   {
> > >   	size_t total_new_size, total_old_size;
> > >   	struct devres *old_dr, *new_dr;
> > > -	unsigned long flags;
> > >  =20
> > >   	if (unlikely(!new_size)) {
> > >   		devm_kfree(dev, ptr);
> > > @@ -906,20 +880,17 @@ void *devm_krealloc(struct device *dev, void *p=
tr, size_t new_size, gfp_t gfp)
> > >   	 * The spinlock protects the linked list against concurrent
> > >   	 * modifications but not the resource itself.
> > >   	 */
> > > -	spin_lock_irqsave(&dev->devres_lock, flags);
> > > +	scoped_guard(spinlock, &dev->devres_lock) {
> > > +		old_dr =3D find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, =
ptr);
> > > +		if (!old_dr) {
> > > +			kfree(new_dr);
> > > +			WARN(1, "Memory chunk not managed or managed by a different devic=
e.");
> > > +			return NULL;
> > > +		}
> > >  =20
> > > -	old_dr =3D find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, p=
tr);
> > > -	if (!old_dr) {
> > > -		spin_unlock_irqrestore(&dev->devres_lock, flags);
> > > -		kfree(new_dr);
> > > -		WARN(1, "Memory chunk not managed or managed by a different device=
.");
> > > -		return NULL;
> > > +		replace_dr(dev, &old_dr->node, &new_dr->node);
> > >   	}
> > >  =20
> > > -	replace_dr(dev, &old_dr->node, &new_dr->node);
> > > -
> > > -	spin_unlock_irqrestore(&dev->devres_lock, flags);
> > > -
> > >   	/*
> > >   	 * We can copy the memory contents after releasing the lock as we'=
re
> > >   	 * no longer modifying the list links.

