Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1397278B4B3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0EE10E2FC;
	Mon, 28 Aug 2023 15:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17CF10E2FC;
 Mon, 28 Aug 2023 15:43:51 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 9BB28660716E;
 Mon, 28 Aug 2023 16:43:49 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Mon, 28 Aug 2023 16:43:49 +0100
To: "Arvind Yadav" <Arvind.Yadav@amd.com>
MIME-Version: 1.0
Message-ID: <7d09-64ecc080-1-3ebc5780@85497443>
Subject: =?utf-8?q?Re=3A?= [PATCH v3 0/7] GPU workload hints for better
 performance
User-Agent: SOGoMail 5.8.4
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
Cc: shashank.sharma@amd.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, August 28, 2023 09:26 -03, Arvind Yadav <Arvind.Yadav@amd.co=
m> wrote:

> AMDGPU SOCs supports dynamic workload based power profiles, which can
> provide fine-tuned performance for a particular type of workload.
> This patch series adds an interface to set/reset these power profiles
> based on the submitted job. The driver can dynamically switch
> the power profiles based on submitted job. This can optimize the powe=
r
> performance when the particular workload is on.=20

Hi Arvind,

Would you mind to test your patchset with drm-ci ? There is a amdgpu
test there and I would love to get your feedback of the ci.

You basically just need to apply the ci patch which is available on
https://cgit.freedesktop.org/drm/drm/log/?h=3Dtopic/drm-ci

There are instruction on the docs, but in short: to configure it, you p=
ush
your branch to gitlab.freedesktop.org, go to the settings and change th=
e
CI/CD configuration file from .gitlab-ci.yml to drivers/gpu/drm/ci/gitl=
ab-ci.yml,
and you can trigger a pipeline on your branch to get tests running.

(by the time of this writing, gitlab.fdo is under maintenance but shoul=
d
be up soonish).

Thank you!
Helen

>=20
> v2:
> - Splitting workload=5Fprofile=5Fset and workload=5Fprofile=5Fput
>   into two separate patches.
> - Addressed review comment.
> - Added new suspend function.
> - Added patch to switches the GPU workload mode for KFD.=20
>=20
> v3:
> - Addressed all review comment.
> - Changed the function name from *=5Fset() to *=5Fget().
> - Now clearing all the profile in work handler.
> - Added *=5Fclear=5Fall function to clear all the power profile.
>=20
>=20
> Arvind Yadav (7):
>   drm/amdgpu: Added init/fini functions for workload
>   drm/amdgpu: Add new function to set GPU power profile
>   drm/amdgpu: Add new function to put GPU power profile
>   drm/amdgpu: Add suspend function to clear the GPU power profile.
>   drm/amdgpu: Set/Reset GPU workload profile
>   drm/amdgpu: switch workload context to/from compute
>   Revert "drm/amd/amdgpu: switch on/off vcn power profile mode"
>=20
>  drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu=5Famdkfd.c    |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu=5Fdevice.c    |   6 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu=5Fjob.c       |   5 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu=5Fvcn.c       |  14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu=5Fworkload.c  | 226 ++++++++++++++=
++++
>  drivers/gpu/drm/amd/include/amdgpu=5Fworkload.h |  61 +++++
>  8 files changed, 309 insertions(+), 16 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu=5Fworkload.c
>  create mode 100644 drivers/gpu/drm/amd/include/amdgpu=5Fworkload.h
>=20
> --=20
> 2.34.1
>

