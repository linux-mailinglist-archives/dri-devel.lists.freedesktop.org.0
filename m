Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB78734099
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 13:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018310E03F;
	Sat, 17 Jun 2023 11:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C117510E00B;
 Sat, 17 Jun 2023 11:54:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B8D26606F5E;
 Sat, 17 Jun 2023 12:54:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687002878;
 bh=cghzvjQODxb4UE3Z3hEhHYqMIBb7x8MGsNoGxfMzgd4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eFgqQCZAEDrTYx+Rb4HVM0A7ExeEOlU+EjlyLyPzSZG+5bVtNy6GvC+xyS0u4k7ks
 c3FM+Ksgv1lmZ5/lAuDqNTEx/OjqpC4GGzgr1m+VvGCBQXMyfK+2NZTp9Yso30GmKD
 RVMFjkLbyM9hWOgabKmCf+FiLicjkoq+JI5ECUAM6sSLBh6al58/pON2TNiPhuHGCc
 9Vv4be6qWwr/dwgvM+bUEQ/2o4ymWfGxkZmZsBFKoGUV9DMZ8HYgDzNfnZonkuJTPb
 OD/XtfqJSaab9EawnIMDoOBNsNn9htFhss0K8wIjH6zd3pOoJfyDqX5+Eyo5/e25N5
 CI9FpYFYckKRw==
Date: Sat, 17 Jun 2023 13:54:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Message-ID: <20230617135434.7dd3a25d@collabora.com>
In-Reply-To: <20230614150252.6ceb42fd@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 felix.kuehling@amd.com, francois.dugast@intel.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, thomas_os@shipmail.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Matthew who's been using drm_exec in Xe if I'm correct.

Hello Christian,

On Wed, 14 Jun 2023 15:02:52 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Wed, 14 Jun 2023 14:30:53 +0200
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > Am 14.06.23 um 14:23 schrieb Boris Brezillon: =20
> > > Hi Christian,
> > >
> > > On Thu,  4 May 2023 13:51:47 +0200
> > > "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:
> > >   =20
> > >> This adds the infrastructure for an execution context for GEM buffers
> > >> which is similar to the existing TTMs execbuf util and intended to r=
eplace
> > >> it in the long term.
> > >>
> > >> The basic functionality is that we abstracts the necessary loop to l=
ock
> > >> many different GEM buffers with automated deadlock and duplicate han=
dling.   =20
> > > As many other drivers do already, we are considering using drm_exec()
> > > for our resv locking in the PowerVR driver, so we might have more
> > > questions/comments in the coming days/weeks, but I already have a
> > > couple right now (see below).
> > >   =20
> > >> v3: drop duplicate tracking, radeon is really the only one needing t=
hat   =20
> > > I think we'd actually be interested in duplicate tracking. Is there a=
ny
> > > way we can make it an optional feature through some extra helpers/fla=
gs?
> > > Doesn't have to be done in this patch series, I'm just wondering if t=
his
> > > is something we can share as well.   =20
> >=20
> > You can still capture the -EALREADY error and act appropriately in your=
=20
> > driver.
> >=20
> > For radeon it just means ignoring the error code and going ahead, but=20
> > that behavior doesn't seem to be desired in most cases.
> >=20
> > Initially I though we need to separately track how many and how often=20
> > BOs are duplicated, but there is simply no use for this.
> >  =20
> > >
> > > [...]
> > >   =20
> > >> +/**
> > >> + * DOC: Overview
> > >> + *
> > >> + * This component mainly abstracts the retry loop necessary for loc=
king
> > >> + * multiple GEM objects while preparing hardware operations (e.g. c=
ommand
> > >> + * submissions, page table updates etc..).
> > >> + *
> > >> + * If a contention is detected while locking a GEM object the clean=
up procedure
> > >> + * unlocks all previously locked GEM objects and locks the contende=
d one first
> > >> + * before locking any further objects.
> > >> + *
> > >> + * After an object is locked fences slots can optionally be reserve=
d on the
> > >> + * dma_resv object inside the GEM object.
> > >> + *
> > >> + * A typical usage pattern should look like this::
> > >> + *
> > >> + *	struct drm_gem_object *obj;
> > >> + *	struct drm_exec exec;
> > >> + *	unsigned long index;
> > >> + *	int ret;
> > >> + *
> > >> + *	drm_exec_init(&exec, true);
> > >> + *	drm_exec_while_not_all_locked(&exec) {
> > >> + *		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
> > >> + *		drm_exec_continue_on_contention(&exec);
> > >> + *		if (ret)
> > >> + *			goto error;
> > >> + *   =20
> > > Have you considered defining a drm_exec_try_prepare_obj_or_retry()
> > > combining drm_exec_prepare_obj() and drm_exec_continue_on_contention(=
)?
> > >
> > > #define drm_exec_try_prepare_obj_or_retry(exec, obj, num_fences) \
> > >          ({ \
> > >                  int __ret =3D drm_exec_prepare_obj(exec, bo, num_fen=
ces); \
> > >                  if (unlikely(drm_exec_is_contended(exec))) \
> > >                          continue; \
> > >                  __ret; \
> > >          })
> > >
> > > This way the following pattern
> > >
> > > 		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
> > > 		drm_exec_continue_on_contention(&exec);
> > > 		if (ret)
> > > 			goto error;
> > >
> > > can be turned into something more conventional:
> > >
> > > 		ret =3D drm_exec_try_prepare_obj_or_retry(&exec, boA, 1);
> > > 		if (ret)
> > > 			goto error;   =20
> >=20
> > Yeah, I was considering that as well. But then abandoned it as to=20
> > complicated.
> >=20
> > I really need to find some time to work on that anyway.

I've been playing with drm_exec for a couple weeks now, and I wanted
to share something I hacked to try and make the API simpler and
more robust against misuse (see the below diff, which is a slightly
adjusted version of your work).

In this version, the user is no longer in control of the retry
loop. Instead, it provides an expression (a call to a
sub-function) to be re-evaluated each time a contention is
detected. IMHO, this makes the 'prepare-objs' functions easier to
apprehend, and avoids any mistake like calling
drm_exec_continue_on_contention() in an inner loop, or breaking
out of the drm_exec_while_all_locked() loop unintentionally.

It also makes the internal management a bit simpler, since we
no longer call drm_exec_cleanup() on the first attempt, and can
thus get rid of the DRM_EXEC_DUMMY trick.

In the below diff, I also re-introduced native support for
duplicates as an opt-in, so we don't have to do things like:

	ret =3D drm_exec_prepare_obj(exec, obj, num_fences);
	if (ret =3D=3D -EALREADY)
		ret =3D dma_resv_reserve_fences(obj->resv, num_fences);
	if (ret)
		return ret;

and can just do:

	ret =3D drm_exec_prepare_obj(exec, obj, num_fences);
	if (ret)
		return;

Of course drivers can open-code a wrapper doing the same thing, but
given at least pvr and radeon need this, it'd be nice if the core
could support it natively.

That's mostly it. Just wanted to share what I had in case you're
interested. If not, that's fine too.

Regards,

Boris
---
 Documentation/gpu/drm-mm.rst |  12 ++
 drivers/gpu/drm/Kconfig      |   6 +
 drivers/gpu/drm/Makefile     |   2 +
 drivers/gpu/drm/drm_exec.c   | 274 +++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h       | 130 +++++++++++++++++
 5 files changed, 424 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index fe40ee686f6e..c9f120cfe730 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -524,6 +524,18 @@ DRM Sync Objects
 .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
    :export:
=20
+DRM Execution context
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :doc: Overview
+
+.. kernel-doc:: include/drm/drm_exec.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :export:
+
 GPU Scheduler
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 76991720637c..01a38fcdb1c4 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -194,6 +194,12 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
=20
+config DRM_EXEC
+	tristate
+	depends on DRM
+	help
+	  Execution context for command submissions
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1873f64db171..18a02eaf2d49 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -79,6 +79,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) +=3D drm_panel=
_orientation_quirks.o
 #
 # Memory-management helpers
 #
+#
+obj-$(CONFIG_DRM_EXEC) +=3D drm_exec.o
=20
 obj-$(CONFIG_DRM_BUDDY) +=3D drm_buddy.o
=20
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
new file mode 100644
index 000000000000..e0ad1a3e1610
--- /dev/null
+++ b/drivers/gpu/drm/drm_exec.c
@@ -0,0 +1,274 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-resv.h>
+
+/**
+ * DOC: Overview
+ *
+ * This component mainly abstracts the retry loop necessary for locking
+ * multiple GEM objects while preparing hardware operations (e.g. command
+ * submissions, page table updates etc..).
+ *
+ * If a contention is detected while locking a GEM object the cleanup proc=
edure
+ * unlocks all previously locked GEM objects and locks the contended one f=
irst
+ * before locking any further objects.
+ *
+ * After an object is locked fences slots can optionally be reserved on the
+ * dma_resv object inside the GEM object.
+ *
+ * A typical usage pattern should look like this::
+ *
+ * int prepare_objs_func(struct drm_exec *exec, ...)
+ * {
+ *	struct drm_gem_object *boA, *boB;
+ * 	int ret;
+ *
+ *	<retrieve boA and boB here>
+ *
+ *	ret =3D drm_exec_prepare_obj(&exec, boA, 1);
+ *	if (ret)
+ *		return ret;
+ *
+ *	ret =3D drm_exec_prepare_obj(&exec, boB, 1);
+ *	if (ret)
+ *		return ret;
+ *
+ * 	return 0;
+ * }
+ *
+ * int some_func()
+ * {
+ *	struct drm_exec exec;
+ *	unsigned long index;
+ *	int ret;
+ *
+ *	drm_exec_init(&exec, true);
+ *	ret =3D drm_exec_until_all_locked(&exec, prepare_objs_func(&exec, ...));
+ *	if (ret)
+ *		goto error;
+ *
+ *	drm_exec_for_each_locked_object(&exec, index, obj) {
+ *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
+ *		...
+ *	}
+ *	drm_exec_fini(&exec);
+ *
+ * See struct dma_exec for more details.
+ */
+
+/* Unlock all objects and drop references */
+static void drm_exec_unlock_all(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+	}
+
+	drm_gem_object_put(exec->prelocked);
+	exec->prelocked =3D NULL;
+}
+
+/**
+ * drm_exec_init - initialize a drm_exec object
+ * @exec: the drm_exec object to initialize
+ * @interruptible: if locks should be acquired interruptible
+ *
+ * Initialize the object and make sure that we can track locked objects.
+ */
+void drm_exec_init(struct drm_exec *exec, u32 flags)
+{
+	exec->flags =3D flags;
+	exec->objects =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+	/* If allocation here fails, just delay that till the first use */
+	exec->max_objects =3D exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
+	exec->num_objects =3D 0;
+	exec->contended =3D NULL;
+	exec->prelocked =3D NULL;
+	ww_acquire_init(&exec->ticket, &reservation_ww_class);
+}
+EXPORT_SYMBOL(drm_exec_init);
+
+/**
+ * drm_exec_fini - finalize a drm_exec object
+ * @exec: the drm_exec object to finalize
+ *
+ * Unlock all locked objects, drop the references to objects and free all =
memory
+ * used for tracking the state.
+ */
+void drm_exec_fini(struct drm_exec *exec)
+{
+	drm_exec_unlock_all(exec);
+	kvfree(exec->objects);
+	if (exec->contended)
+		drm_gem_object_put(exec->contended);
+	ww_acquire_fini(&exec->ticket);
+}
+EXPORT_SYMBOL(drm_exec_fini);
+
+/**
+ * drm_exec_reset - reset a drm_exec object after a contention
+ * @exec: the drm_exec object to reset
+ *
+ * Unlock all locked objects and resets the number of objects locked.
+ */
+void drm_exec_reset(struct drm_exec *exec)
+{
+	WARN_ON(!exec->contended);
+	drm_exec_unlock_all(exec);
+	exec->num_objects =3D 0;
+}
+EXPORT_SYMBOL(drm_exec_reset);
+
+/* Track the locked object in the array */
+static int drm_exec_obj_locked(struct drm_exec *exec,
+			       struct drm_gem_object *obj)
+{
+	if (unlikely(exec->num_objects =3D=3D exec->max_objects)) {
+		size_t size =3D exec->max_objects * sizeof(void *);
+		void *tmp;
+
+		tmp =3D kvrealloc(exec->objects, size, size + PAGE_SIZE,
+				GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		exec->objects =3D tmp;
+		exec->max_objects +=3D PAGE_SIZE / sizeof(void *);
+	}
+	drm_gem_object_get(obj);
+	exec->objects[exec->num_objects++] =3D obj;
+
+	return 0;
+}
+
+/* Make sure the contended object is locked first */
+static int drm_exec_lock_contended(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj =3D exec->contended;
+	int ret;
+
+	if (likely(!obj))
+		return 0;
+
+	if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE) {
+		ret =3D dma_resv_lock_slow_interruptible(obj->resv,
+						       &exec->ticket);
+		if (unlikely(ret))
+			goto error_dropref;
+	} else {
+		dma_resv_lock_slow(obj->resv, &exec->ticket);
+	}
+
+	ret =3D drm_exec_obj_locked(exec, obj);
+	if (unlikely(ret)) {
+		dma_resv_unlock(obj->resv);
+		goto error_dropref;
+	}
+
+	swap(exec->prelocked, obj);
+
+error_dropref:
+	/* Always cleanup the contention so that error handling can kick in */
+	drm_gem_object_put(obj);
+	exec->contended =3D NULL;
+	return ret;
+}
+
+/**
+ * drm_exec_prepare_obj - prepare a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to prepare
+ * @num_fences: how many fences to reserve
+ *
+ * Prepare a GEM object for use by locking it and reserving fence slots. A=
ll
+ * successfully locked objects are put into the locked container.
+ *
+ * Returns: -EDEADLK if a contention is detected, -EALREADY when object is
+ * already locked, -ENOMEM when memory allocation failed and zero for succ=
ess.
+ */
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences)
+{
+	int ret;
+
+	ret =3D drm_exec_lock_contended(exec);
+	if (unlikely(ret))
+		return ret;
+
+	if (exec->prelocked =3D=3D obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked =3D NULL;
+
+		return dma_resv_reserve_fences(obj->resv, num_fences);
+	}
+
+	if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE)
+		ret =3D dma_resv_lock_interruptible(obj->resv, &exec->ticket);
+	else
+		ret =3D dma_resv_lock(obj->resv, &exec->ticket);
+
+	if (unlikely(ret =3D=3D -EDEADLK)) {
+		drm_gem_object_get(obj);
+		exec->contended =3D obj;
+		return -EDEADLK;
+	}
+
+	if (unlikely(ret =3D=3D -EALREADY &&
+	    (exec->flags & DRM_EXEC_FLAG_ALLOW_DUPLICATES)))
+		goto reserve_fences;
+
+	if (unlikely(ret))
+		return ret;
+
+	ret =3D drm_exec_obj_locked(exec, obj);
+	if (ret)
+		goto error_unlock;
+
+reserve_fences:
+	/* Keep locked when reserving fences fails */
+	return dma_resv_reserve_fences(obj->resv, num_fences);
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_prepare_obj);
+
+/**
+ * drm_exec_prepare_array - helper to prepare an array of objects
+ * @exec: the drm_exec object with the state
+ * @objects: array of GEM object to prepare
+ * @num_objects: number of GEM objects in the array
+ * @num_fences: number of fences to reserve on each GEM object
+ *
+ * Prepares all GEM objects in an array, handles contention but aports on =
first
+ * error otherwise. Reserves @num_fences on each GEM object after locking =
it.
+ *
+ * Returns: -EALREADY when object is already locked, -ENOMEM when memory
+ * allocation failed and zero for success.
+ */
+int drm_exec_prepare_array(struct drm_exec *exec,
+			   struct drm_gem_object **objects,
+			   unsigned int num_objects,
+			   unsigned int num_fences)
+{
+	int ret;
+
+	for (unsigned int i =3D 0; i < num_objects; ++i) {
+		ret =3D drm_exec_prepare_obj(exec, objects[i], num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_exec_prepare_array);
+
+MODULE_DESCRIPTION("DRM execution context");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
new file mode 100644
index 000000000000..b1a5da0509c1
--- /dev/null
+++ b/include/drm/drm_exec.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EXEC_H__
+#define __DRM_EXEC_H__
+
+#include <linux/ww_mutex.h>
+
+struct drm_gem_object;
+
+/**
+ * enum drm_exec_flags - Execution context flags
+ */
+enum drm_exec_flags {
+	/**
+	 * DRM_EXEC_FLAG_INTERRUPTIBLE: Set to true to use interruptible locking
+	 * functions.
+	 */
+	DRM_EXEC_FLAG_INTERRUPTIBLE =3D BIT(0),
+
+	/**
+	 * DRM_EXEC_FLAG_ALLOW_DUPLICATES: Set to true to allow EALREADY errors.
+	 */
+	DRM_EXEC_FLAG_ALLOW_DUPLICATES =3D BIT(1),
+};
+
+/**
+ * struct drm_exec - Execution context
+ */
+struct drm_exec {
+	/**
+	 * @flags: Combinations of DRM_EXEC_FLAG_* flags.
+	 */
+	u32 flags;
+
+	/**
+	 * @ticket: WW ticket used for acquiring locks
+	 */
+	struct ww_acquire_ctx	ticket;
+
+	/**
+	 * @num_objects: number of objects locked
+	 */
+	unsigned int		num_objects;
+
+	/**
+	 * @max_objects: maximum objects in array
+	 */
+	unsigned int		max_objects;
+
+	/**
+	 * @objects: array of the locked objects
+	 */
+	struct drm_gem_object	**objects;
+
+	/**
+	 * @contended: contended GEM object we backed off for
+	 */
+	struct drm_gem_object	*contended;
+
+	/**
+	 * @prelocked: already locked GEM object due to contention
+	 */
+	struct drm_gem_object *prelocked;
+};
+
+/**
+ * drm_exec_for_each_locked_object - iterate over all the locked objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the locked GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index =3D 0, obj =3D (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj =3D (exec)->objects[index])
+
+/**
+ * drm_exec_until_all_locked - retry objects preparation until all objects
+ * are locked
+ * @exec: drm_exec object
+ * @expr: expression to be evaluated on each attempt
+ *
+ * This helper tries to prepare objects and if a deadlock is detected,
+ * rollbacks and retries.
+ *
+ * @expr is typically a function that tries to prepare objects using
+ * drm_exec_prepare_obj().
+ *
+ * If we take drm_exec_prepare_array() as an example, you should do:
+ *
+ *	ret =3D drm_exec_until_all_locked(exec,
+ *					drm_exec_prepare_array(exec,
+ *							       objs,
+ *							       num_objs,
+ *							       num_fences));
+ *	if (ret)
+ *		goto error_path;
+ *
+ *	...
+ *
+ * Returns: 0 on success, a negative error code on failure.
+ */
+#define drm_exec_until_all_locked(exec, expr)		\
+	({						\
+		__label__ retry;			\
+		int __ret;				\
+retry:							\
+		__ret =3D expr;				\
+		if ((exec)->contended) {		\
+			WARN_ON(__ret !=3D -EDEADLK);	\
+			drm_exec_reset(exec);		\
+			goto retry;			\
+		}					\
+		ww_acquire_done(&(exec)->ticket);	\
+		__ret;					\
+	})
+
+void drm_exec_init(struct drm_exec *exec, u32 flags);
+void drm_exec_fini(struct drm_exec *exec);
+void drm_exec_reset(struct drm_exec *exec);
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences);
+int drm_exec_prepare_array(struct drm_exec *exec,
+			   struct drm_gem_object **objects,
+			   unsigned int num_objects,
+			   unsigned int num_fences);
+
+#endif
