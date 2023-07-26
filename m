Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F051C76329B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 11:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EE010E44E;
	Wed, 26 Jul 2023 09:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D867410E44E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:42:06 +0000 (UTC)
Date: Wed, 26 Jul 2023 09:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1690364524; x=1690623724;
 bh=TQQ7zGtbrAASlmHToVl46K0ErH/AmbBPWH8xTQM23zg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=FkaLC/uZUx4faZ9U2Y5fdQ9lxriHyNBVgnU7h2Kc2vsYbAHy8MW2QGzMUxs7LKKJ1
 PJDoXdVOy+ykOLA8CGiS4H3SY+V2hnJ7UNr/RO/fMVVEzMPnm9Z3s+Omu3pTYX/ZuI
 NeE+JrXGVXS5BKyecCQo+mvDXtJzWXD+N2FjSCzzyyaDcdhQ2XIBSrYTt8fzfB4bgT
 0ZK3GDcKZVMlWZmCe/os5OUSWAzeMIJ7Om3pKShbmqXMT5DtgN/PgozZHnjfgvUsDQ
 pHxaxFbqHbxGdgYtyyN/5b+DeluVqV/BqhQHz3862D3lGtE1+m6NRfDNU0jGFwrIDW
 tzV8838uaSTeQ==
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm/syncobj: add
 DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Message-ID: <TZK6kU3lyjlGSvXhPEsXscjTWtNuKjkMIYhIkAoXPK7h3wbeRPw6SgMhcskqbCTn3t7ukpH7Z-h3navHqYkqswrsun9HO9ynrK-nb8imDwA=@emersion.fr>
In-Reply-To: <5e687ad8-78ad-0350-6052-a698b278cc8c@nvidia.com>
References: <5e687ad8-78ad-0350-6052-a698b278cc8c@nvidia.com>
Feedback-ID: 1358184:user:proton
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
Cc: Austin Shafer <ashafer@nvidia.com>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Overall looks pretty good to me, a few comments below.

On Friday, July 21st, 2023 at 20:50, Erik Kurzinger <ekurzinger@nvidia.com>=
 wrote:

> diff --git a/lib/igt_syncobj.h b/lib/igt_syncobj.h
> index e6725671d..01f5f062b 100644
> --- a/lib/igt_syncobj.h
> +++ b/lib/igt_syncobj.h
> @@ -34,7 +34,9 @@ int __syncobj_handle_to_fd(int fd, struct drm_syncobj_h=
andle *args);
>  int __syncobj_fd_to_handle(int fd, struct drm_syncobj_handle *args);
>  int syncobj_handle_to_fd(int fd, uint32_t handle, uint32_t flags);
>  uint32_t syncobj_fd_to_handle(int fd, int syncobj_fd, uint32_t flags);
> +int __syncobj_import_sync_file(int fd, struct drm_syncobj_sync_file *arg=
s);
>  void syncobj_import_sync_file(int fd, uint32_t handle, int sync_file);
> +int __syncobj_export_sync_file(int fd, struct drm_syncobj_sync_file *arg=
s);

Hm, this is a bit confusing because the old transfer logic and the new IOCT=
L
both have the same name modulo the "__" prefix. Usually IGT uses a pattern
where the function without the "__" prefix just calls the one with the pref=
ix
and asserts that it succeeds. Maybe we should rename the old functions in a
separate patch? Or find a different name for the new functions?

Optional nit: maybe it would be more ergonomic if the new function took
arguments instead of a struct drm_syncobj_sync_file. Callers wouldn't have =
to
init the struct.

> +const char *test_binary_import_export_desc =3D
> +=09"Verifies importing and exporting a sync file with a binary syncobj."=
;
> +static void
> +test_binary_import_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +=09int timeline =3D sw_sync_timeline_create();
> +
> +=09args.handle =3D syncobj_create(fd, 0);
> +=09args.fd =3D sw_sync_timeline_create_fence(timeline, 1);
> +=09args.point =3D 0;
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
> +=09close(args.fd);
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
> +
> +=09igt_assert(!syncobj_wait(fd, &args.handle, 1, 0, 0, NULL));
> +=09igt_assert_eq(sync_fence_status(args.fd), 0);
> +
> +=09sw_sync_timeline_inc(timeline, 1);
> +=09igt_assert(syncobj_wait(fd, &args.handle, 1, 0, 0, NULL));
> +=09igt_assert_eq(sync_fence_status(args.fd), 1);
> +
> +=09close(args.fd);
> +=09close(timeline);
> +=09syncobj_destroy(fd, args.handle);
> +}
> +
> +const char *test_timeline_import_export_desc =3D
> +=09"Verifies importing and exporting sync files with a timeline syncobj.=
";
> +static void
> +test_timeline_import_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +=09int timeline =3D sw_sync_timeline_create();
> +=09int fence1, fence2;
> +=09uint64_t point1 =3D 1, point2 =3D 2;
> +
> +=09args.handle =3D syncobj_create(fd, 0);
> +=09args.fd =3D sw_sync_timeline_create_fence(timeline, 1);
> +=09args.point =3D 1;
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
> +=09close(args.fd);
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
> +=09fence1 =3D args.fd;
> +
> +=09args.fd =3D sw_sync_timeline_create_fence(timeline, 2);
> +=09args.point =3D 2;
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
> +=09close(args.fd);
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
> +=09fence2 =3D args.fd;
> +
> +=09igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0,=
 NULL));
> +=09igt_assert_eq(sync_fence_status(fence1), 0);
> +=09igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0,=
 NULL));
> +=09igt_assert_eq(sync_fence_status(fence2), 0);
> +
> +=09sw_sync_timeline_inc(timeline, 1);
> +=09igt_assert(syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, =
NULL));
> +=09igt_assert_eq(sync_fence_status(fence1), 1);
> +=09igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0,=
 NULL));
> +=09igt_assert_eq(sync_fence_status(fence2), 0);
> +
> +=09sw_sync_timeline_inc(timeline, 1);
> +=09igt_assert(syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, =
NULL));
> +=09igt_assert_eq(sync_fence_status(fence1), 1);
> +=09igt_assert(syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0, =
NULL));
> +=09igt_assert_eq(sync_fence_status(fence2), 1);
> +
> +=09close(fence1);
> +=09close(fence2);
> +=09close(timeline);
> +=09syncobj_destroy(fd, args.handle);
> +}
> +
> +const char *test_invalid_handle_import_desc =3D
> +=09"Verifies that importing a sync file to an invalid syncobj fails.";
> +static void
> +test_invalid_handle_import(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +=09int timeline =3D sw_sync_timeline_create();
> +
> +=09args.handle =3D 0;
> +=09args.point =3D 0;
> +=09args.fd =3D sw_sync_timeline_create_fence(timeline, 1);
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), -EINVAL);

Shouldn't this be ENOENT?

drm_syncobj_import_sync_file_fence() returns ENOENT when drm_syncobj_find()
fails.

> +
> +=09close(args.fd);
> +=09close(timeline);
> +}
> +
> +const char *test_invalid_handle_export_desc =3D
> +=09"Verifies that exporting a sync file from an invalid syncobj fails.";
> +static void
> +test_invalid_handle_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +
> +=09args.handle =3D 0;
> +=09args.point =3D 0;
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), -EINVAL);

Ditto

> +}
> +
> +const char *test_invalid_fd_import_desc =3D
> +=09"Verifies that importing an invalid sync file fails.";
> +static void
> +test_invalid_fd_import(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +
> +=09args.handle =3D syncobj_create(fd, 0);
> +=09args.point =3D 0;
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), -EINVAL);
> +
> +=09syncobj_destroy(fd, args.handle);
> +}
> +
> +const char *test_unsubmitted_export_desc =3D
> +=09"Verifies that exporting a sync file for an unsubmitted point fails."=
;
> +static void
> +test_unsubmitted_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +
> +=09args.handle =3D syncobj_create(fd, 0);
> +=09args.point =3D 0;
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), -EINVAL);
> +
> +=09syncobj_destroy(fd, args.handle);
> +}
> +
> +static bool has_syncobj_timeline(int fd)
> +{
> +=09uint64_t value;
> +=09return drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE,
> +=09=09=09 &value) =3D=3D 0 && value;
> +}
> +
> +static bool has_syncobj_sync_file_import_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +=09args.handle =3D 0xffffffff;

0 is guaranteed to always be an invalid drm_syncobj handle, while in theory
0xffffffff could be a valid one. So it's a bit safer to just leave the hand=
le
to zero here.

> +=09/* if sync file import/export is supported this will fail with ENOENT=
,
> +=09 * otherwise it will fail with EINVAL */
> +=09return __syncobj_export_sync_file(fd, &args) =3D=3D -ENOENT;
> +}
