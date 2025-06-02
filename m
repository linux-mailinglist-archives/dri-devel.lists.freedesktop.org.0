Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF9ACB996
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 18:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24D310E564;
	Mon,  2 Jun 2025 16:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="TBUkPCrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E8F10E566
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 16:22:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so1241756f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 09:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1748881334; x=1749486134; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oqfFn1Mp9nAjcQeZ04D2BespZSz7Bz0Bfj7To4SwEHM=;
 b=TBUkPCrYbP5Ir/Hc9o/c46wjFpuIFyjNIPxykm3Ci/b2/OHeDw2pMd88dkvkrKt1jT
 Dvs6UxGBNRYnljMMcxoqaf6zvhzRrya0122847ZLiq5CyEp4Fshn8vz39ohzRIJ021+W
 Vf8bX+bxLd2BsjtP299Mf5duTYYJ6tfnZeRw/C3yxhWkBNIm6qBanXl1yq3jAYspYT3Y
 fpRhgqNkK1RSh71eO9rBiYtUWf23QibWlaDlDDT0zEE53lZeQsECNe14XdjmSzqa2HsW
 Bn5nZG0SKZk9ctRDfjeJK5mEPUMjniBA12Qb417S/aKeeUREHNCwq1wmsQ2+kAmT6tFw
 sRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748881334; x=1749486134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oqfFn1Mp9nAjcQeZ04D2BespZSz7Bz0Bfj7To4SwEHM=;
 b=O57x83826ydclAgkXPaqY2uN7XbIVRK4PKeJJYS9PKVsprdIKgLuY51JGcgFqZC5oX
 b8PubpCc7FzellfAWKqYfOZN634Y59pCY2KFo6EqmWuhOsQShJQ8thUdEsGsq3ZUsnKV
 FA6Vb+/OAd+OOk9zYSl7PVeKBnVNeCcHaP3MH8iZl9wNtnNnve9U4NW7earYRf9+LCIO
 3/I2yuf94dyC6FHcya/429yvzr3NL6j4cPSSwbPYQlI2hXs8LfCSeEzvmeR4wF5xPDLD
 fGiS8WjLgZAj/zq2dpmsHpFBUNJJnhPkG6b1WsVJKLG9jqRV2s9tKU8qfJmqymb6bo+v
 T+Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+R32snIc9pKecMRUENLJAcLI9cwdg2F61CBC4gYkjG6BTbejTHA8qEbRztp/4s6xunDcTMY/tFqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOiiDumK5ejh3OLaKBmsJ6iHFWocHt6bhBUbJm5DzQe98MX7b8
 7ulE0ynQwXcnTXcLikYrQ1D7VDwG654U11cmLvE6l/medryl0iiwDnsFWr7e25bqr1o=
X-Gm-Gg: ASbGncsvMyytJu+eVA7xcOKq9HEb5JBmgGmqCcZEace6NsaA7y6Axr0SE7Z+PdtkU9f
 nbANHr016/Ea/uHaFkaUwgTa1q9xpqAmvpD6JhgPR+/0XLP2zeOI7xiA8ULLmC6mHdzryrWC8/V
 W+WpozqiMLWC3cmC166QGj2hIMhYLGr+CH6Z4BCqrhoi1hl3Uq1d3/Pupg4cnoqIyMntjCxRZ1A
 A00WKM0NIeULc+Sk80rbCdYuqlld/MOx2JatuoFbg8qOcvAGtezV+9dv0/RO+QOnZKdbmd3nxu4
 UVMQJBEcu6M0DyYc5pLZVs9N/1tEVKwKsL6aH19KGn8X6rU7IuMuKA==
X-Google-Smtp-Source: AGHT+IGQVG+9kkgM+Gw/QYtVE3BGrFi5tE9uRyvIoBigGuatn/IymWmr23s7esoleYgMrHZm28xf9g==
X-Received: by 2002:a05:6000:3106:b0:3a4:f70d:a65e with SMTP id
 ffacd0b85a97d-3a4fe393558mr6030409f8f.37.1748881333706; 
 Mon, 02 Jun 2025 09:22:13 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d8006613sm132908715e9.28.2025.06.02.09.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 09:22:13 -0700 (PDT)
Date: Mon, 2 Jun 2025 18:22:11 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, 
 Tejun Heo <tj@kernel.org>
Subject: Re: [RFC 20/23] cgroup/drm: Introduce weight based scheduling control
Message-ID: <jlswx5kabjkszrkdmoflcqi7ycbxbfjfflbni3knromz6ucx63@kjwypivu3jpq>
References: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
 <20250502123256.50540-21-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uwbgl3tifamqbhkd"
Content-Disposition: inline
In-Reply-To: <20250502123256.50540-21-tvrtko.ursulin@igalia.com>
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


--uwbgl3tifamqbhkd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC 20/23] cgroup/drm: Introduce weight based scheduling control
MIME-Version: 1.0

Hello.

On Fri, May 02, 2025 at 01:32:53PM +0100, Tvrtko Ursulin <tvrtko.ursulin@ig=
alia.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> Similar to CPU and IO scheduling, implement a concept of weight in the DRM
> cgroup controller.
>=20
> Individual drivers are now able to register with the controller which will
> notify them of the relative scheduling weight for each open DRM client.
>=20
> The notifications are triggered on cgroup weight changes and DRM clients
> appearing and disappearing in/from cgroups. Latter is done because it is
> handy to ignore the groups with no DRM clients in relative weight
> calculations.
>=20
> The notifications are also consolidated by using a delayed worker.
>=20
> On the userspace API level we use the same range and defaults as the CPU
> controller - CGROUP_WEIGHT_MIN, CGROUP_WEIGHT_DFL and CGROUP_WEIGHT_MAX.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Michal Koutn=FD <mkoutny@suse.com>
> Cc: Tejun Heo <tj@kernel.org>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |  22 ++
>  include/linux/cgroup_drm.h              |   2 +
>  kernel/cgroup/drm.c                     | 313 +++++++++++++++++++++++-
>  3 files changed, 331 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index 1a16ce68a4d7..095b7dee0151 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2729,6 +2729,28 @@ HugeTLB Interface Files
>          hugetlb pages of <hugepagesize> in this cgroup.  Only active in
>          use hugetlb pages are included.  The per-node values are in byte=
s.
> =20
> +DRM
> +---
> +
> +The controller allows for configuring of scheduling weights of cgroups r=
elative
> +to their siblings.
> +
> +NOTE: This is an optional feature into which individual DRM drivers need=
 to
> +      opt-in if they want to support it.
> +
> +NOTE: Only single GPU systems will work as expected in the current
> +      implementation.
> +
> +DRM Interface Files
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +  drm.weight
> +        A read-write single value file which exists on non-root cgroups.=
 The
> +        default is "100".

Should this be akin to IO controller and have subkey granularity for
individual devices? (With special 'default' entry.)

(Can those devices come and go (hotplug)?)

> +
> +        The weights are in the range [1, 10000] and specify the relative
> +        scheduling weights for cgroups in relation to their siblings.
> +
>  Misc
>  ----
> =20
> diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
> index d6a9a2fbdbf5..9961003958b4 100644
> --- a/include/linux/cgroup_drm.h
> +++ b/include/linux/cgroup_drm.h
> @@ -6,6 +6,8 @@
> =20
>  #include <drm/drm_file.h>
> =20
> +#define DRM_CGROUP_WEIGHT_SHIFT 10
> +
>  #if IS_ENABLED(CONFIG_CGROUP_DRM)
>  void drmcgroup_client_open(struct drm_file *file_priv);
>  void drmcgroup_client_close(struct drm_file *file_priv);
> diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
> index ea7655edf86a..532702604786 100644
> --- a/kernel/cgroup/drm.c
> +++ b/kernel/cgroup/drm.c
> @@ -13,10 +13,18 @@ struct drm_cgroup_state {
>  	struct cgroup_subsys_state css;
> =20
>  	struct list_head clients;
> +	unsigned int num_clients; /* Whole branch */
> +
> +	unsigned int sum_children_weights;
> +
> +	unsigned int weight;
> +	unsigned int effective_weight;

IIUC, this is weight normalized across siblings (and not scaled by
ancestors)?

It should be then sufficient to only notify the siblings of modified
cgroup after the recalculation, shouldn't it?

>  };
> =20
>  struct drm_root_cgroup_state {
>  	struct drm_cgroup_state drmcs;
> +
> +	struct delayed_work notify_work;
>  };
> =20
>  static struct drm_root_cgroup_state root_drmcs =3D {
> @@ -31,7 +39,7 @@ css_to_drmcs(struct cgroup_subsys_state *css)
>  	return container_of(css, struct drm_cgroup_state, css);
>  }
> =20
> -static void __maybe_unused
> +static void
>  drmcs_notify_weight(struct drm_cgroup_state *drmcs)
>  {
>  	struct drm_file *fpriv;
> @@ -43,16 +51,152 @@ drmcs_notify_weight(struct drm_cgroup_state *drmcs)
>  			fpriv->minor->dev->driver->cg_ops;
> =20
>  		if (cg_ops && cg_ops->notify_weight)
> -			cg_ops->notify_weight(fpriv, 0);
> +			cg_ops->notify_weight(fpriv, drmcs->effective_weight);
>  	}
>  }
> =20
> +static void drmcg_update_weights_locked(void)
> +{
> +	lockdep_assert_held(&drmcg_mutex);
> +
> +	mod_delayed_work(system_wq,
> +			 &root_drmcs.notify_work,
> +			 usecs_to_jiffies(1000));

This value is little bit magic.
What is this consolidatiot good for?
(I guess it's rather because of clients joining/leaving rather than
cgroup attribute modifications.)

> +}
> +
> +static void drmcg_update_weights(void)
> +{
> +	mutex_lock(&drmcg_mutex);
> +	drmcg_update_weights_locked();
> +	mutex_unlock(&drmcg_mutex);
> +}
> +
> +static u64
> +drmcs_read_weight(struct cgroup_subsys_state *css, struct cftype *cft)
> +{
> +	struct drm_cgroup_state *drmcs =3D css_to_drmcs(css);
> +
> +	return drmcs->weight;
> +}
> +
> +static int
> +drmcs_write_weight(struct cgroup_subsys_state *css, struct cftype *cftyp=
e,
> +		   u64 weight)
> +{
> +	struct drm_cgroup_state *drmcs =3D css_to_drmcs(css);
> +	int ret;
> +
> +	if (weight < CGROUP_WEIGHT_MIN || weight > CGROUP_WEIGHT_MAX)
> +		return -ERANGE;
> +
> +	ret =3D mutex_lock_interruptible(&drmcg_mutex);
> +	if (ret)
> +		return ret;
> +	drmcs->weight =3D weight;
> +	drmcg_update_weights_locked();
> +	mutex_unlock(&drmcg_mutex);
> +
> +	return 0;
> +}
> +
> +static void notify_worker(struct work_struct *work)
> +{
> +	struct drm_cgroup_state *root =3D &root_drmcs.drmcs;
> +	struct cgroup_subsys_state *node;
> +	bool updated;
> +
> +	mutex_lock(&drmcg_mutex);
> +	rcu_read_lock();
> +
> +	/*
> +	 * Always come back later if we race with core cgroup management.
> +	 */
> +	updated =3D false;
> +	if (WARN_ON_ONCE(!css_tryget_online(&root->css)))
> +		goto out_unlock;
> +
> +	css_for_each_descendant_post(node, &root->css) {
> +		struct drm_cgroup_state *drmcs =3D css_to_drmcs(node);
> +
> +		if (!css_tryget_online(node))
> +			goto out_put;
> +
> +		drmcs->sum_children_weights =3D 0;
> +		css_put(node);
> +	}
> +
> +	css_for_each_descendant_post(node, &root->css) {
> +		struct drm_cgroup_state *drmcs =3D css_to_drmcs(node);
> +		struct drm_cgroup_state *parent;
> +
> +		if (!css_tryget_online(node))
> +			goto out_put;
> +		if (!node->parent || !drmcs->num_clients) {
> +			css_put(node);
> +			continue;
> +		}
> +		if (!css_tryget_online(node->parent)) {
> +			css_put(node);
> +			goto out_put;
> +		}
> +
> +		parent =3D css_to_drmcs(node->parent);
> +		parent->sum_children_weights +=3D drmcs->weight;
> +		css_put(node);
> +		css_put(&parent->css);
> +	}
> +
> +	css_for_each_descendant_pre(node, &root->css) {
> +		struct drm_cgroup_state *drmcs =3D css_to_drmcs(node);
> +		struct cgroup_subsys_state *css;
> +
> +		if (!css_tryget_online(node))
> +			goto out_put;
> +		if (!drmcs->num_clients) {
> +			css_put(node);
> +			continue;
> +		}
> +
> +		css_for_each_child(css, &drmcs->css) {
> +			struct drm_cgroup_state *sibling =3D css_to_drmcs(css);
> +
> +			if (!css_tryget_online(css)) {
> +				css_put(node);
> +				goto out_put;
> +			}
> +			if (!sibling->num_clients) {
> +				css_put(css);
> +				continue;
> +			}
> +
> +			sibling->effective_weight =3D
> +				DIV_ROUND_CLOSEST(sibling->weight <<
> +						  DRM_CGROUP_WEIGHT_SHIFT,
> +						  drmcs->sum_children_weights);
> +			drmcs_notify_weight(sibling);
> +			css_put(css);
> +		}
> +
> +		css_put(node);
> +	}
> +
> +	updated =3D true;
> +
> +out_put:
> +	css_put(&root->css);
> +out_unlock:
> +	rcu_read_unlock();
> +
> +	if (!updated)
> +		drmcg_update_weights_locked();
> +
> +	mutex_unlock(&drmcg_mutex);
> +}
> +
>  static void drmcs_free(struct cgroup_subsys_state *css)
>  {
> -	struct drm_cgroup_state *drmcs =3D css_to_drmcs(css);
> -
> -	if (drmcs !=3D &root_drmcs.drmcs)
> -		kfree(drmcs);
> +	if (css !=3D &root_drmcs.drmcs.css)
> +		kfree(css_to_drmcs(css));
>  }
> =20
>  static struct cgroup_subsys_state *
> @@ -62,6 +206,7 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
> =20
>  	if (!parent_css) {
>  		drmcs =3D &root_drmcs.drmcs;
> +		INIT_DELAYED_WORK(&root_drmcs.notify_work, notify_worker);
>  	} else {
>  		drmcs =3D kzalloc(sizeof(*drmcs), GFP_KERNEL);
>  		if (!drmcs)
> @@ -70,9 +215,147 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
>  		INIT_LIST_HEAD(&drmcs->clients);
>  	}
> =20
> +	drmcs->weight =3D CGROUP_WEIGHT_DFL;
> +	drmcs->effective_weight =3D (1 << DRM_CGROUP_WEIGHT_SHIFT) / 2;
> +
>  	return &drmcs->css;
>  }
> =20
> +static int drmcs_online(struct cgroup_subsys_state *css)
> +{
> +	drmcg_update_weights();
> +
> +	return 0;
> +}
> +
> +static void drmcs_offline(struct cgroup_subsys_state *css)
> +{
> +	drmcg_update_weights();
> +}
> +
> +static struct drm_cgroup_state *old_drmcs;
> +
> +static int drmcs_can_attach(struct cgroup_taskset *tset)
> +{
> +	struct cgroup_subsys_state *css;
> +	struct task_struct *task;
> +
> +	task =3D cgroup_taskset_first(tset, &css);
> +	old_drmcs =3D css_to_drmcs(task_css(task, drm_cgrp_id));

This is similar to cpuset's cpuset_attach_old_cs.
Beware that when controller is disabled, the migration happens from
multiple (chilren) csses.

> +
> +	return 0;
> +}
> +
> +static void __inc_clients(struct drm_cgroup_state *drmcs)
> +{
> +	struct cgroup_subsys_state *parent =3D NULL;
> +
> +	rcu_read_lock();
> +	do {
> +		drmcs->num_clients++;
> +		WARN_ON_ONCE(!drmcs->num_clients);
> +
> +		if (parent)
> +			css_put(parent);
> +
> +		parent =3D drmcs->css.parent;
> +		if (parent) {
> +			if (WARN_ON_ONCE(!css_tryget(parent)))

This should be ensured implicitly thanks to css::online_cnt.

> +				break;
> +
> +			drmcs =3D css_to_drmcs(parent);
> +		}
> +	} while (parent);
> +	rcu_read_unlock();
> +}
> +
> +static void __dec_clients(struct drm_cgroup_state *drmcs)
> +{
> +	struct cgroup_subsys_state *parent =3D NULL;
> +
> +	rcu_read_lock();
> +	do {
> +		WARN_ON_ONCE(!drmcs->num_clients);
> +		drmcs->num_clients--;
> +
> +		if (parent)
> +			css_put(parent);
> +
> +		parent =3D drmcs->css.parent;
> +		if (parent) {
> +			if (WARN_ON_ONCE(!css_tryget(parent)))
> +				break;
> +
> +			drmcs =3D css_to_drmcs(parent);
> +		}
> +	} while (parent);
> +	rcu_read_unlock();
> +}
> +
> +static void drmcs_attach(struct cgroup_taskset *tset)
> +{
> +	struct drm_cgroup_state *old =3D old_drmcs;
> +	struct cgroup_subsys_state *css;
> +	struct drm_file *fpriv, *next;
> +	struct drm_cgroup_state *new;
> +	struct task_struct *task;
> +	bool migrated =3D false;
> +
> +	if (!old)
> +		return;
> +
> +	task =3D cgroup_taskset_first(tset, &css);
> +	new =3D css_to_drmcs(task_css(task, drm_cgrp_id));
> +	if (new =3D=3D old)
> +		return;

Beware here too, it'd be better to use css from
cgroup_taskset_for_each(task, css, tset) below as the new css.

> +
> +	mutex_lock(&drmcg_mutex);
> +
> +	list_for_each_entry_safe(fpriv, next, &old->clients, clink) {
> +		cgroup_taskset_for_each(task, css, tset) {
> +			struct cgroup_subsys_state *old_css;
> +			struct drm_cgroup_state *old_;
> +
> +			if (task->flags & PF_KTHREAD)
> +				continue;
> +			if (!thread_group_leader(task))
> +				continue;

Maybe cgroup_taskset_for_each_leader()

> +
> +			new =3D css_to_drmcs(task_css(task, drm_cgrp_id));
> +			if (WARN_ON_ONCE(new =3D=3D old))
> +				continue;
> +
> +			if (rcu_access_pointer(fpriv->pid) !=3D task_tgid(task))
> +				continue;
> +
> +			if (WARN_ON_ONCE(fpriv->__css !=3D &old->css))
> +				continue;
> +
> +			old_css =3D fpriv->__css;
> +			old_ =3D css_to_drmcs(old_css);
> +			fpriv->__css =3D &new->css;
> +			css_get(fpriv->__css);
> +			list_move_tail(&fpriv->clink, &new->clients);
> +			__dec_clients(old);
> +			__inc_clients(new);
> +			css_put(old_css);
> +			migrated =3D true;
> +		}
> +	}
> +
> +	if (migrated)
> +		drmcg_update_weights_locked();
> +
> +	mutex_unlock(&drmcg_mutex);
> +
> +	old_drmcs =3D NULL;
> +}
> +
> +static void drmcs_cancel_attach(struct cgroup_taskset *tset)
> +{
> +	old_drmcs =3D NULL;
> +}
> +
>  void drmcgroup_client_open(struct drm_file *file_priv)
>  {
>  	struct drm_cgroup_state *drmcs;
> @@ -85,6 +368,8 @@ void drmcgroup_client_open(struct drm_file *file_priv)
>  	mutex_lock(&drmcg_mutex);
>  	file_priv->__css =3D &drmcs->css; /* Keeps the reference. */
>  	list_add_tail(&file_priv->clink, &drmcs->clients);
> +	__inc_clients(drmcs);
> +	drmcg_update_weights_locked();
>  	mutex_unlock(&drmcg_mutex);
>  }
>  EXPORT_SYMBOL_GPL(drmcgroup_client_open);
> @@ -100,7 +385,9 @@ void drmcgroup_client_close(struct drm_file *file_pri=
v)
> =20
>  	mutex_lock(&drmcg_mutex);
>  	list_del(&file_priv->clink);
> +	__dec_clients(drmcs);
>  	file_priv->__css =3D NULL;
> +	drmcg_update_weights_locked();
>  	mutex_unlock(&drmcg_mutex);
> =20
>  	css_put(&drmcs->css);
> @@ -124,6 +411,9 @@ void drmcgroup_client_migrate(struct drm_file *file_p=
riv)
>  	if (src !=3D dst) {
>  		file_priv->__css =3D &dst->css; /* Keeps the reference. */
>  		list_move_tail(&file_priv->clink, &dst->clients);
> +		__dec_clients(src);
> +		__inc_clients(dst);
> +		drmcg_update_weights_locked();
>  	}
> =20
>  	mutex_unlock(&drmcg_mutex);
> @@ -133,12 +423,23 @@ void drmcgroup_client_migrate(struct drm_file *file=
_priv)
>  EXPORT_SYMBOL_GPL(drmcgroup_client_migrate);
> =20
>  struct cftype files[] =3D {
> +	{
> +		.name =3D "weight",
> +		.flags =3D CFTYPE_NOT_ON_ROOT,
> +		.read_u64 =3D drmcs_read_weight,
> +		.write_u64 =3D drmcs_write_weight,
> +	},
>  	{ } /* Zero entry terminates. */
>  };
> =20
>  struct cgroup_subsys drm_cgrp_subsys =3D {
>  	.css_alloc	=3D drmcs_alloc,
>  	.css_free	=3D drmcs_free,
> +	.css_online	=3D drmcs_online,
> +	.css_offline	=3D drmcs_offline,
> +	.can_attach     =3D drmcs_can_attach,
> +	.attach		=3D drmcs_attach,
> +	.cancel_attach  =3D drmcs_cancel_attach,
>  	.early_init	=3D false,
>  	.legacy_cftypes	=3D files,
>  	.dfl_cftypes	=3D files,
> --=20
> 2.48.0
>=20


Regards,
Michal

--uwbgl3tifamqbhkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaD3PsQAKCRAt3Wney77B
SSZdAP97iGN5AQSIIeoxFDYFLrnaUussI2rGjqzM5YCfvzSffgD9GGAwStMZXNaI
XVOMnNE3aJieaR/h/MpexQlC663uIgk=
=6twu
-----END PGP SIGNATURE-----

--uwbgl3tifamqbhkd--
