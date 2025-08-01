Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A5FB17E29
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 10:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A077610E2F0;
	Fri,  1 Aug 2025 08:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aJ1g6Ukl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C9810E2F0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 08:21:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2BEAC5C5EA7;
 Fri,  1 Aug 2025 08:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D855FC4CEE7;
 Fri,  1 Aug 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754036514;
 bh=EG1IipNgpyo8fGH1RjMBEme5aivIHxhO25P/hri0Swc=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=aJ1g6Ukl/rIfiZE32tISmRV3Y01llKNJXC3iF62e8/nZCWT3EnYligf3hqKlehipG
 YgKQK5InWKVZhyZJmCBcCEI6OOGMd9WscJXNsVBwU6GsVDBwhk8R2PHbDYhcQelgUZ
 mbLuXwmNBjLBYADzUnP9mmFWz18Wb2J5kq2XRjjuSyUfL5APGozxCpci9VffueSItO
 r7iO3cJe8OAdMl5AREqpCpGBfrvjYjrT2DABwX830dRD/TD2+IFTHI3igqML64+Rpj
 pYbTpyV2f/ae7BQBiQ5hbLCk5oU9Zr5JwuEA8HD5wjRVVzhL/TgdZnVu57XHRU+TrK
 z0Pw7CK8/CqGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 10:21:49 +0200
Message-Id: <DBQY1S7V8IIS.3NCGOZ8ALU7QG@kernel.org>
Subject: Re: [PATCH 3/4] rust: drm: remove pin annotations from drm::Device
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-4-dakr@kernel.org>
 <DBQGW0NIQJRX.MU0QD5GMFJYM@kernel.org>
In-Reply-To: <DBQGW0NIQJRX.MU0QD5GMFJYM@kernel.org>
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

On Thu Jul 31, 2025 at 8:54 PM CEST, Benno Lossin wrote:
> On Thu Jul 31, 2025 at 5:48 PM CEST, Danilo Krummrich wrote:
>> The #[pin_data] and #[pin] annotations are not necessary for
>> drm::Device, since we don't use any pin-init macros, but only
>> __pinned_init() on the impl PinInit<T::Data, Error> argument of
>> drm::Device::new().
>
> But you're still pinning `Device`, right?

A drm::Device instance never exists other than as ARef<drm::Device>.

>> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>  rust/kernel/drm/device.rs | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
>> index d19410deaf6c..d0a9528121f1 100644
>> --- a/rust/kernel/drm/device.rs
>> +++ b/rust/kernel/drm/device.rs
>> @@ -54,10 +54,8 @@ macro_rules! drm_legacy_fields {
>>  ///
>>  /// `self.dev` is a valid instance of a `struct device`.
>>  #[repr(C)]
>> -#[pin_data]
>>  pub struct Device<T: drm::Driver> {
>>      dev: Opaque<bindings::drm_device>,
>> -    #[pin]
>>      data: T::Data,
>
> Looking at this code again, I also noticed that it was wrong before this
> patch: `Device<T>` implemented `Unpin` if `T::Data` did which is most
> likely wrong (or is `drm_device` not address sensitive?).

It is, but as mentioned above a drm::Device only ever exists as
ARef<drm::Device>.

So, in drm::Device::new() we allocate the drm::Device with __drm_dev_alloc(=
),
initialize data in-place within this allocated memory and create an
ARef<drm::Device> directly from the raw pointer returned by __drm_dev_alloc=
().

> So good to see that fixed, thanks!
>
> ---
> Cheers,
> Benno
>
>>  }
>> =20

