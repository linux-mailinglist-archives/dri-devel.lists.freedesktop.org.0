Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD2E79C1A3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 03:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C06910E132;
	Tue, 12 Sep 2023 01:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8237610E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:27:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7811614C6;
 Tue, 12 Sep 2023 01:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1135AC116A1;
 Tue, 12 Sep 2023 01:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694482073;
 bh=i1OpMkK8nN3ugs7HSsHaoziL6+KbW09I3yNP+41/i54=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=coMndRYw55qf5oJQ4mYnWLWjpikXmT0btw0FXm928IRMwJjHPrV8RIjVgNnO6qoCw
 JT3hvN9kCotKz/cGKyE+wS3Ei9Zwjbvbh5paGnFIT241HNCrBV6JwSsk7sgvWZdwrx
 g6bohU08+jLacNfIRcHXNR05VIr4EviYjWIB+srXf1V5bplTmm9u/boTLm9f/LeY+/
 vFcP4Qo/XhwDVgHhlC2oOKiXiBTfmI2kb/I83qwCxA7xUwacibfht0JwFwA/cLJh99
 QVXYNV//NiaIcTvCjAhHRKRlnSyY34LnNunLnYVl07pdDJgFbAvpgncKRlFndex/0O
 MsTnACCDqW6Sw==
Date: Mon, 11 Sep 2023 18:27:50 -0700
From: Kees Cook <kees@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>, Kees Cook <keescook@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
 Christian Brauner <brauner@kernel.org>, David Disseldorp <ddiss@suse.de>, 
 Luis Chamberlain <mcgrof@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2 0/5] Introduce new wrappers to copy user-arrays
User-Agent: K-9 Mail for Android
In-Reply-To: <cover.1694202430.git.pstanner@redhat.com>
References: <cover.1694202430.git.pstanner@redhat.com>
Message-ID: <CA1AA415-FDF0-4A7A-9BB0-FFF055803F77@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: kexec@lists.infradead.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On September 8, 2023 12:59:39 PM PDT, Philipp Stanner <pstanner@redhat=2Eco=
m> wrote:
>Hi!
>
>David Airlie suggested that we could implement new wrappers around
>(v)memdup_user() for duplicating user arrays=2E
>
>This small patch series first implements the two new wrapper functions
>memdup_array_user() and vmemdup_array_user()=2E They calculate the
>array-sizes safely, i=2Ee=2E, they return an error in case of an overflow=
=2E
>
>It then implements the new wrappers in two components in kernel/ and two
>in the drm-subsystem=2E
>
>In total, there are 18 files in the kernel that use (v)memdup_user() to
>duplicate arrays=2E My plan is to provide patches for the other 14
>successively once this series has been merged=2E
>
>
>Changes since v1:
>- Insert new headers alphabetically ordered
>- Remove empty lines in functions' docstrings
>- Return -EOVERFLOW instead of -EINVAL from wrapper functions
>
>
>@Andy:
>I test-build it for UM on my x86_64=2E Builds successfully=2E
>A kernel build (localmodconfig) for my Fedora38 @ x86_64 does also boot
>fine=2E
>
>If there is more I can do to verify the early boot stages are fine,
>please let me know!
>
>P=2E
>
>Philipp Stanner (5):
>  string=2Eh: add array-wrappers for (v)memdup_user()
>  kernel: kexec: copy user-array safely
>  kernel: watch_queue: copy user-array safely
>  drm_lease=2Ec: copy user-array safely
>  drm: vmgfx_surface=2Ec: copy user-array safely
>
> drivers/gpu/drm/drm_lease=2Ec             |  4 +--
> drivers/gpu/drm/vmwgfx/vmwgfx_surface=2Ec |  4 +--
> include/linux/string=2Eh                  | 40 +++++++++++++++++++++++++
> kernel/kexec=2Ec                          |  2 +-
> kernel/watch_queue=2Ec                    |  2 +-
> 5 files changed, 46 insertions(+), 6 deletions(-)
>

Nice=2E For the series:

Reviewed-by: Kees Cook <keescook@chromium=2Eorg>



--=20
Kees Cook
