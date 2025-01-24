Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA7A1B2A5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 10:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5713810E92A;
	Fri, 24 Jan 2025 09:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V6beqFG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBB810E253
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 05:11:41 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-21654fdd5daso28840955ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 21:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737695501; x=1738300301; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Pm8oJeBuOFHd6ekxnejy3HEWqUKZZg6N9tys57iCgH8=;
 b=V6beqFG4sSS7YdFBIA2UcVW1clBKsLUTmyNGw9srh8/d7oIg8HOopHJBz3/6zG4tK+
 5+/V0IYrENYotDwkLZeC9s8aYGMYef/NovhBYzuM0tZPQNa1QsetS9zS54NEXBJki8gg
 K8sioYxmicg+OWr7ztMMlmse+6CETl4Z1Gd23oo10532ZCfgu+vV7+yeUAZri0hI26Tc
 AGJd9RVPIMmIGrXh/jLISndszsO4Pt9yrpxa6QsM69260PgN8wHHutLZ0y/bDoigv55F
 aRenRsjsx3AxUGKfQoQ0K3cWQfDYAA5PPuEdwkjoZQi0E5/pfONt8Zo40Dehpap3qBMT
 2M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737695501; x=1738300301;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pm8oJeBuOFHd6ekxnejy3HEWqUKZZg6N9tys57iCgH8=;
 b=h624I0CvrTU98bdbQJyQy1/ZcFsFljQw0Ci4PhwZXSZYvnDvGVqqLrfjH8zIEnFrmt
 2fWqKvewAcBfcU7R1Fs0lS8mQQM/nJCwN9EWOEHl4e5nhlu4rV7XRY2zxPiIWvfYerxJ
 StRa5YMWpyQdVe6RozxA62qYWBr6MeKL1Q8NyfPZkW9zD4habb4tH880FPBV1zecvls9
 buQpmX2RAuKEajtZF/kcbXEQEMpposTCKLKAw/Oxierzs3D/OwRIAyLo4b0wxiqhZZGU
 5ePGGULcW92lbV3zWH6sMNnMLCOgR4+njt9oG2ZXCwe9iQJMY5wxFc9FHqhqmM3K23kJ
 YEJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL8Fp+V7iwpiWw2JlQfwTlkSea1vmraj2Mwa02V0Jyutq/dhqrd3WoXv/eJTXqJg+vsUIh9i9NhW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNOSvj2txOlJb3XArx3qHahs7+udN655xtf3EvP+qOJwV6EJvY
 4/kRKcTOwn8M+v24YnlmwfKuDeqvKJAJIsf/AFAoVyXamCkWnSe0
X-Gm-Gg: ASbGncv8R5sr/VjIJI8dGE9ISS/KK9iLmNGn80zCVkEY2NgOAlYQEZCpeic8RfQ9FbY
 qpYSu1jbtXqnv2LmixHY/MrjqvVcWRV5HfILkHzDcYHc9daVjrfWUlnrK+xLtn1TovFLuU7Ba9Q
 UtbMXe0Fd9X0asS23LEgd6A6PCOgHo/IZ+GYl0Gj8pT4bp1O+vGzfWAG/sboQwvARJ3jSkL8VPm
 RLZOYZMcqCL6XjsN/PYYduElVqmnkakDjsrMclV3a0kURqE8RpHyDTYsohVjKeYPg1hBhvawVuo
 Nzg/Dghlkk/yudWQLdo7KYOXUgGiB6g6yoZ4/JKgylfQjePWgWQ=
X-Google-Smtp-Source: AGHT+IEu34cEqyV0xw9hfuRNjxOhke8sLDPtu8jUlbl+4jeWRLNMy3Ms4sWiV94JmApPoJ9ZFKf+5g==
X-Received: by 2002:a17:903:2312:b0:216:36ff:ba33 with SMTP id
 d9443c01a7336-21c355589ddmr413044785ad.26.1737695500948; 
 Thu, 23 Jan 2025 21:11:40 -0800 (PST)
Received: from ?IPv6:2804:1b3:a801:16c4:23da:a93c:e00a:1229?
 ([2804:1b3:a801:16c4:23da:a93c:e00a:1229])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414e151sm7636555ad.186.2025.01.23.21.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 21:11:40 -0800 (PST)
Message-ID: <f779c9af4133629f724e366241fab7421d13d227.camel@gmail.com>
Subject: Re: [PATCH v2 0/5] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Vignesh Raman <vignesh.raman@collabora.com>, kernelci@lists.linux.dev
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com, 
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com, 
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, 	nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, 	Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, 	torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com, 
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, 	nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, 	hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, 	Tim.Bird@sony.com,
 laurent.pinchart@ideasonboard.com, broonie@kernel.org, 	groeck@google.com,
 rdunlap@infradead.org, geert@linux-m68k.org, 	michel.daenzer@mailbox.org,
 sakari.ailus@iki.fi, jarkko@kernel.org
Date: Fri, 24 Jan 2025 02:11:26 -0300
In-Reply-To: <20250123135342.1468787-1-vignesh.raman@collabora.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Jan 2025 09:31:16 +0000
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

On Thu, 2025-01-23 at 19:23 +0530, Vignesh Raman wrote:
> This patch series introduces "kci-gitlab," a GitLab CI pipeline
> specifically designed for kernel testing. It provides kernel
> developers with an integrated, efficient, and flexible testing
> framework using GitLab's CI/CD capabilities. This patch includes
> a .gitlab-ci file in the tools/ci/gitlab-ci/ folder, along with
> additional YAML and script files, to define a basic test pipeline
> triggered by code pushes to a GitLab-CI instance.
> The initial version implements:
>    =20
> - Static checks: Includes checkpatch and smatch for code validation.
> - Build tests: Covers various architectures and configurations.
> - Boot tests: Utilizes virtme for basic boot testing.
>=20
> Additionally, it introduces a flexible "scenarios" mechanism to
> support subsystem-specific extensions.
>=20
> This series also introduces a drm scenario that adds a job to run IGT
> tests for vkms. This scenario includes helper scripts to build deqp-runne=
r
> and IGT, leveraging approaches from the drm-ci/mesa-ci project.
>=20
> We are working towards creating a generic, upstream GitLab-CI pipeline
> (kci-gitlab) that will replace DRM-CI [1]. The proposed GitLab-CI pipelin=
e
> is designed with a distributed infrastructure model, making it possible
> to run on any gitLab instance. We plan to leverage KernelCI [2] as the
> backend, utilizing its hardware, rootfs, test plans, and KCIDB [3]
> integration.
>=20
> For an example of a fully executed pipeline with drm scenario set,
> including documentation generation,
> see: https://gitlab.freedesktop.org/vigneshraman/kernel/-/pipelines/13502=
62
>=20
> Please refer to the documentation included in the patch, or check the
> rendered version, here:=20
> https://vigneshraman.pages.freedesktop.org/-/kernel/-/jobs/69787927/artif=
acts/artifacts/Documentation-output/ci/gitlab-ci/gitlab-ci.html
>=20
> Differences from v1 to v2:
> - moved to tools/ci as suggested by Linus on the previous version
> - add arm64 containers for native compilation
> - added boot tests using virtme: this is the base structure for boot test=
s,
>   next steps would be adding other tests such as kselftests/kunit tests
> - added DRM scenario testing on vkms: this should replace current vkms te=
st
>   in drm-ci. This work shows how a test scenario can be used by different
>   subsystems to add their tests.
> - update documentation
>=20
> For more details on the motivation behind this work, please refer to the
> cover letter of v1: https://patchwork.kernel.org/project/linux-kselftest/=
cover/20240228225527.1052240-1-helen.koike@collabora.com/
>=20
> [1] https://www.collabora.com/news-and-blog/blog/2024/02/08/drm-ci-a-gitl=
ab-ci-pipeline-for-linux-kernel-testing/
> [2] https://kernelci.org/
> [3] https://docs.kernelci.org/kcidb/
>=20
> Helen Koike (3):
>   kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
>   kci-gitlab: Add documentation
>   kci-gitlab: docs: Add images
>=20
> Vignesh Raman (2):
>   MAINTAINERS: Add an entry for ci automated testing
>   kci-gitlab: Add drm scenario

Hi Vignesh Raman,
I am very happy to see this project going forward :)

It's been a few years since I first thought on finding a good way of helpin=
g
kernel developers testing their patches, while making use of the free runne=
r
minutes Gitlab offers. It can greatly simplify the testing for people who a=
re
new to kernel development, or students trying to understand it better.

And this patchset allows that to happen :)

Actually, I spoke to Helen last year, and to enable it to run on the free
Gitlab-CI runners, there is a small extra patch which is needed:

https://lore.kernel.org/all/20240327013055.139494-2-leobras@redhat.com/

Could you please apply it on top of your tree?
Some stuff changed places, but I can send a v2 with that fix if you want.


While I have yet to review this v2 patchset, I applied it on my repo for
testing,=C2=A0and cherry-picked the patch on above link, triggering a Pipel=
ine:

https://gitlab.com/linux-kernel/linux/-/pipelines/1638955600

It seems to be working fine, please check it, as you may be more used to th=
e
results.

Thanks!
Leo
