Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0944772FF60
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 15:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C69910E454;
	Wed, 14 Jun 2023 13:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3F410E454;
 Wed, 14 Jun 2023 13:02:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 39E9C6606F48;
 Wed, 14 Jun 2023 14:02:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686747775;
 bh=T2IBPPZ12ZOXVRzMlto02oo6Piu9HeqGMeqUyLhTLj8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eSAXwfCgaVZ7kBAQUXUu5vRLe6wuxmHehPO6oiwi7ngptWppDVIpzugoEkOxTjNL3
 iKu9NWOZGz7FMaNIWCAUZYi9f3f+kO8kjeWTs/1CHLHdpFH+yAMfgu2ysN1jIpK62+
 oXFkho7g8ChIBGL7u5Vq+XnIEExjKydMHseGi5y35n19b8F8IErztX1nK2elsECit1
 OdHxUCKE8jaWUwy9v4jTviEcrFYc38pRDdxDADxvh9Qd5+/aATiPs0GZYsiahpVgv/
 64p9zmImOJzu2uvE4ktYD5coPCYUbljbkLv72YfFtF7Npw4lAMcINp574IElBLCgBk
 DzdvswLYQs1xA==
Date: Wed, 14 Jun 2023 15:02:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Message-ID: <20230614150252.6ceb42fd@collabora.com>
In-Reply-To: <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
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
Cc: arunpravin.paneerselvam@amd.com, felix.kuehling@amd.com,
 francois.dugast@intel.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, thomas_os@shipmail.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Jun 2023 14:30:53 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 14.06.23 um 14:23 schrieb Boris Brezillon:
> > Hi Christian,
> >
> > On Thu,  4 May 2023 13:51:47 +0200
> > "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:
> > =20
> >> This adds the infrastructure for an execution context for GEM buffers
> >> which is similar to the existing TTMs execbuf util and intended to rep=
lace
> >> it in the long term.
> >>
> >> The basic functionality is that we abstracts the necessary loop to lock
> >> many different GEM buffers with automated deadlock and duplicate handl=
ing. =20
> > As many other drivers do already, we are considering using drm_exec()
> > for our resv locking in the PowerVR driver, so we might have more
> > questions/comments in the coming days/weeks, but I already have a
> > couple right now (see below).
> > =20
> >> v3: drop duplicate tracking, radeon is really the only one needing tha=
t =20
> > I think we'd actually be interested in duplicate tracking. Is there any
> > way we can make it an optional feature through some extra helpers/flags?
> > Doesn't have to be done in this patch series, I'm just wondering if this
> > is something we can share as well. =20
>=20
> You can still capture the -EALREADY error and act appropriately in your=20
> driver.
>=20
> For radeon it just means ignoring the error code and going ahead, but=20
> that behavior doesn't seem to be desired in most cases.
>=20
> Initially I though we need to separately track how many and how often=20
> BOs are duplicated, but there is simply no use for this.
>=20
> >
> > [...]
> > =20
> >> +/**
> >> + * DOC: Overview
> >> + *
> >> + * This component mainly abstracts the retry loop necessary for locki=
ng
> >> + * multiple GEM objects while preparing hardware operations (e.g. com=
mand
> >> + * submissions, page table updates etc..).
> >> + *
> >> + * If a contention is detected while locking a GEM object the cleanup=
 procedure
> >> + * unlocks all previously locked GEM objects and locks the contended =
one first
> >> + * before locking any further objects.
> >> + *
> >> + * After an object is locked fences slots can optionally be reserved =
on the
> >> + * dma_resv object inside the GEM object.
> >> + *
> >> + * A typical usage pattern should look like this::
> >> + *
> >> + *	struct drm_gem_object *obj;
> >> + *	struct drm_exec exec;
> >> + *	unsigned long index;
> >> + *	int ret;
> >> + *
> >> + *	drm_exec_init(&exec, true);
> >> + *	drm_exec_while_not_all_locked(&exec) {
> >> + *		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
> >> + *		drm_exec_continue_on_contention(&exec);
> >> + *		if (ret)
> >> + *			goto error;
> >> + * =20
> > Have you considered defining a drm_exec_try_prepare_obj_or_retry()
> > combining drm_exec_prepare_obj() and drm_exec_continue_on_contention()?
> >
> > #define drm_exec_try_prepare_obj_or_retry(exec, obj, num_fences) \
> >          ({ \
> >                  int __ret =3D drm_exec_prepare_obj(exec, bo, num_fence=
s); \
> >                  if (unlikely(drm_exec_is_contended(exec))) \
> >                          continue; \
> >                  __ret; \
> >          })
> >
> > This way the following pattern
> >
> > 		ret =3D drm_exec_prepare_obj(&exec, boA, 1);
> > 		drm_exec_continue_on_contention(&exec);
> > 		if (ret)
> > 			goto error;
> >
> > can be turned into something more conventional:
> >
> > 		ret =3D drm_exec_try_prepare_obj_or_retry(&exec, boA, 1);
> > 		if (ret)
> > 			goto error; =20
>=20
> Yeah, I was considering that as well. But then abandoned it as to=20
> complicated.
>=20
> I really need to find some time to work on that anyway.
>=20
> >
> > I guess we could even add static checks to make sure
> > drm_exec_try_prepare_obj() is called inside a
> > drm_exec_while_not_all_locked() loop. =20
>=20
> Interesting idea, but how would somebody do that?

There are probably better/cleaner ways, but the below diff
seems to catch cases where drm_exec_try_prepare_obj() is
called in a context where break/continue are allowed, but
that's not inside a drm_exec_while_not_all_locked() section.

What's missing though is a way to detect when it's called
from an inner loop.

---
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 7c7481ed088a..1f4e0e1a7783 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -69,8 +69,10 @@ struct drm_exec {
  *
  * At the beginning of the loop it is guaranteed that no GEM object is loc=
ked.
  */
+#define __in_drm_exec_while_not_all_locked false
 #define drm_exec_while_not_all_locked(exec)    \
-       while (drm_exec_cleanup(exec))
+       for (const bool __in_drm_exec_while_not_all_locked =3D true; \
+            drm_exec_cleanup(exec); )
=20
 /**
  * drm_exec_continue_on_contention - continue the loop when we need to cle=
anup
@@ -83,6 +85,25 @@ struct drm_exec {
        if (unlikely(drm_exec_is_contended(exec)))      \
                continue
=20
+/**
+ * drm_exec_try_prepare_obj - Try prepare an object and retry on contention
+ * @exec: drm_exec object
+ * @obj: GEM object to prepare
+ * @num_fence: number of fence slots to reserve
+ *
+ * Wrapper around drm_exec_prepare_obj() that automatically retries on
+ * contention by going back to the head of the drm_exec_while_not_all_lock=
ed()
+ * loop.
+ */
+#define drm_exec_try_prepare_obj(exec, obj, num_fences) \
+       ({ \
+               int __ret =3D drm_exec_prepare_obj(exec, obj, num_fences); \
+               static_assert(__in_drm_exec_while_not_all_locked =3D=3D tru=
e); \
+               if (unlikely(drm_exec_is_contended(exec))) \
+                       continue; \
+               __ret; \
+       })
+
 /**
  * drm_exec_break_on_contention - break a subordinal loop on contention
  * @exec: drm_exec object
