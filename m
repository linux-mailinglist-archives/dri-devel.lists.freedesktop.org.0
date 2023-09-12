Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C46879C2F9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FFD10E202;
	Tue, 12 Sep 2023 02:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974DF10E202
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 02:32:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E9BFA611D4;
 Tue, 12 Sep 2023 02:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2110DC433C9;
 Tue, 12 Sep 2023 02:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694485956;
 bh=f+UYYP/8zjflI4dU+udJaul1f6H1xPDyfB4LDPI/7MA=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=NbcHqrPQk2Edwh4cpbNMe1+ElS2UAqqUNCfRMnFZEtbq0q1g+wV/fktJCSB4Hw1Nf
 4GIqfC3JMO4RGCaQPhOExOd9cp+HIjh+qGEmK6WR3j1x4favGbL+6142W5uXRp0uGj
 Rs4TwxlLuMU2qTN318UTNbPoKeguHD2TIWS5EbroO/OLw51xoaSP6o7wP+tBEtzDF2
 JtLp40b0rsghjXkzJtP0P2m+DumKzRh3duOLzrU8YEs73t515+cIcT/jNRpo6HqGm3
 UmMaWBCIdQQH7RAUYhkCVksYqnOnZTXn1YKv/IBhfgPFulm1TKQ0iLSE2WyPuvog3N
 vgpoUsTlL6+3w==
Date: Mon, 11 Sep 2023 19:32:34 -0700
From: Kees Cook <kees@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 0/5] Introduce new wrappers to copy user-arrays
User-Agent: K-9 Mail for Android
In-Reply-To: <CAPM=9txUQ64PMmN-KSXC6PG5ozhSB4eLQN8iAUMrv1R9F6Sm6Q@mail.gmail.com>
References: <cover.1694202430.git.pstanner@redhat.com>
 <CA1AA415-FDF0-4A7A-9BB0-FFF055803F77@kernel.org>
 <CAPM=9txUQ64PMmN-KSXC6PG5ozhSB4eLQN8iAUMrv1R9F6Sm6Q@mail.gmail.com>
Message-ID: <ACD75DAA-AF42-486C-B44B-9272EF302E3D@kernel.org>
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Disseldorp <ddiss@suse.de>,
 linux-hardening@vger.kernel.org, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On September 11, 2023 6:55:32 PM PDT, Dave Airlie <airlied@gmail=2Ecom> wro=
te:
>On Tue, 12 Sept 2023 at 11:27, Kees Cook <kees@kernel=2Eorg> wrote:
>>
>> On September 8, 2023 12:59:39 PM PDT, Philipp Stanner <pstanner@redhat=
=2Ecom> wrote:
>> >Hi!
>> >
>> >David Airlie suggested that we could implement new wrappers around
>> >(v)memdup_user() for duplicating user arrays=2E
>> >
>> >This small patch series first implements the two new wrapper functions
>> >memdup_array_user() and vmemdup_array_user()=2E They calculate the
>> >array-sizes safely, i=2Ee=2E, they return an error in case of an overf=
low=2E
>> >
>> >It then implements the new wrappers in two components in kernel/ and t=
wo
>> >in the drm-subsystem=2E
>> >
>> >In total, there are 18 files in the kernel that use (v)memdup_user() t=
o
>> >duplicate arrays=2E My plan is to provide patches for the other 14
>> >successively once this series has been merged=2E
>> >
>> >
>> >Changes since v1:
>> >- Insert new headers alphabetically ordered
>> >- Remove empty lines in functions' docstrings
>> >- Return -EOVERFLOW instead of -EINVAL from wrapper functions
>> >
>> >
>> >@Andy:
>> >I test-build it for UM on my x86_64=2E Builds successfully=2E
>> >A kernel build (localmodconfig) for my Fedora38 @ x86_64 does also boo=
t
>> >fine=2E
>> >
>> >If there is more I can do to verify the early boot stages are fine,
>> >please let me know!
>> >
>> >P=2E
>> >
>> >Philipp Stanner (5):
>> >  string=2Eh: add array-wrappers for (v)memdup_user()
>> >  kernel: kexec: copy user-array safely
>> >  kernel: watch_queue: copy user-array safely
>> >  drm_lease=2Ec: copy user-array safely
>> >  drm: vmgfx_surface=2Ec: copy user-array safely
>> >
>> > drivers/gpu/drm/drm_lease=2Ec             |  4 +--
>> > drivers/gpu/drm/vmwgfx/vmwgfx_surface=2Ec |  4 +--
>> > include/linux/string=2Eh                  | 40 ++++++++++++++++++++++=
+++
>> > kernel/kexec=2Ec                          |  2 +-
>> > kernel/watch_queue=2Ec                    |  2 +-
>> > 5 files changed, 46 insertions(+), 6 deletions(-)
>> >
>>
>> Nice=2E For the series:
>>
>> Reviewed-by: Kees Cook <keescook@chromium=2Eorg>
>
>Hey Kees,
>
>what tree do you think it would best to land this through? I'm happy
>to send the initial set from a drm branch, but also happy to have it
>land via someone with a better process=2E

Feel free to take it via drm=2E Usually string=2Eh doesn't get a lot of ch=
anges (and even then it's normally additive) so conflicts are rare/easy=2E =
:)

-Kees


--=20
Kees Cook
