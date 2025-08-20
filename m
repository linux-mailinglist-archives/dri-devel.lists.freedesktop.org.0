Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33549B2D328
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 06:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A0710E054;
	Wed, 20 Aug 2025 04:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="ghhsMMsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 171755 seconds by postgrey-1.36 at gabe;
 Wed, 20 Aug 2025 04:47:02 UTC
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3274910E054
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1755665220; x=1755924420;
 bh=H+hmRhOUdJIQOWA7MoeeChMlCXqd6iW6mSUpm6KLTgQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ghhsMMsEHXcAb3uyp42Pbxl9JVZroFgWo41jFN7GDwntqO8xABhbef2KB9cnPGcUy
 DvXBCpGo58s1PN3Ikh8q7Dd37DyrIrL4S/7Gtw7JTA7bJoGO3aAvlhe4w6eh0s4xmJ
 Vab7iertxyz2giusvQ1+JECSy4/+GEf8LRY+deyNY2oDLLBhTmzi8qP2HiDcBN9yFV
 nE+zbz+495Ct9jdt5IHuHtcv1LqZOJqNU2qcvpwKsWUENpEgjxPv3EQvZe/jdFNr8x
 Nf2UcMTdUzdKLYRbjVry7ju6wyOSHvYOeJq7ofNcM+UydMG3lAVFAVtJi3E+9SasLp
 I0PW7ipkINngw==
Date: Wed, 20 Aug 2025 04:46:52 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
Message-ID: <87ect61txs.fsf@protonmail.com>
In-Reply-To: <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
 <g5n4vx5hkreacrtjrbzsefnctvki6d7oh7qyjrb6wtqvzp7adl@rzmxiyblpnsz>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: c998b452f60dab47f9847f3197f5c57c7e8ddba8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Aug, 2025 11:06:40 +0200 "Maxime Ripard" <mripard@kernel.org> wr=
ote:
> Hi Rahul,
>
> On Mon, Aug 18, 2025 at 05:04:15AM +0000, Rahul Rameshbabu wrote:
>> I am working on a drm_connector scoped backlight API in Rust. I have bee=
n
>> looking through Hans de Goede's previous efforts on this topic to help
>> guide my design. My hope is to enable backlight control over external
>> displays through DDC or USB Monitor Control Class while also supporting
>> internal panels. In parallel, I would like to improve the driver
>> probing/selection mechanism when there are different candidates for driv=
ing
>> a backlight device. This initial RFC is mainly intended to sanity check
>> that the plumbing I have chosen for extending the DRM connector
>> functionality in Rust seems reasonable.
>
> It's a great goal, and I had that same discussion with Hans recently
> too, but I can't find the link between backling/DDC CI, and Rust. Can
> you elaborate?

Hi Maxime,

Sure, let me elaborate on this. You are right that plumbing DDC
CI/backlight support at the DRM connector level does not need to be
implemented in Rust.

If we look at Hans's proposal, the suggested phase 2 was to add a
drm_connector helper function for plumbing a pointer to the backlight
device implementation. I had some model differences with regards to how
the API would look like, mostly stemming from concerns about providing
better runtime overriding of the acpi_video_get_backlight_type based
backlight selection. However, I am aligned with the direction of scoping
at the drm_connector level. I basically was interested in implementing
this helper functionality in Rust instead of C, which is where Rust came
into play.

I was also interested in declaring and attaching a drm_property in Rust
for controlling properties such as backlight rather than updating the
drm_connector declaration in C as an experiment.

Let me know if you feel like this work would be better off as a C
implementation. I can also send out a detailed architecture proposal to
the mailing list if that would help.

Link: https://lore.freedesktop.org/wayland-devel/0d188965-d809-81b5-74ce-7d=
30c49fee2d@redhat.com/

Thanks,
Rahul Rameshbabu

>
> Maxime

