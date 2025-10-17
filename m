Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78350BEB39B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 20:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F1410ECD2;
	Fri, 17 Oct 2025 18:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i3naJv87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86AC10ECCF;
 Fri, 17 Oct 2025 18:29:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A564E4186B;
 Fri, 17 Oct 2025 18:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F28C4CEE7;
 Fri, 17 Oct 2025 18:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760725769;
 bh=R22cE40QGrXnmRARyFiuKiJD1jh8qI6eDnspPf8uC4Y=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=i3naJv87wXwVGZofd8TWaof7oD3yKRQsy66d1XT5kstuVgGKKYFTODlLYkSvctGHo
 nRmthlPkaGokYECROcAWd4JbvkytA3dBDKjAZPPHG1W7ke8BeCC2axEzqTnEX/lIT7
 9SggPHsKbVtIe+nWSYM5NGJuhrI4jAHT6/pV2vpmvAJ++dfSWBNWY+SzQRH5RbeIz9
 C5JBwrlK1bKzldw+DGqadJUqpCAlv1B4004ki/I/+7PbOSkBPMM0qCos1RxUS0Yd3x
 lp7uKorUZtc6W3bCEL/Za+M2y3afxxCF0/V7mO92eLSz6W4952nFcLmjv+Cz3kYuC2
 tbAfQ1i7WLqaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 20:29:22 +0200
Message-Id: <DDKT6WXI1S4I.30CBHFLJ9Q6CY@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <acourbot@nvidia.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <daniel.almeida@collabora.com>, <bhelgaas@google.com>,
 <kwilczynski@kernel.org>, <abdiel.janulgue@gmail.com>,
 <robin.murphy@arm.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20251016125544.15559-1-dakr@kernel.org>
 <aPI-9GoI7ZsNCpQr@google.com>
In-Reply-To: <aPI-9GoI7ZsNCpQr@google.com>
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

On Fri Oct 17, 2025 at 3:04 PM CEST, Alice Ryhl wrote:
> On Thu, Oct 16, 2025 at 02:55:28PM +0200, Danilo Krummrich wrote:
>> The driver model defines the lifetime of the private data stored in (and
>> owned by) a bus device to be valid from when the driver is bound to a
>> device (i.e. from successful probe()) until the driver is unbound from
>> the device.
>>=20
>> This is already taken care of by the Rust implementation of the driver
>> model. However, we still ask drivers to return a Result<Pin<KBox<Self>>>
>> from probe().
>>=20
>> Unlike in C, where we do not have the concept of initializers, but
>> rather deal with uninitialized memory, drivers can just return an
>> impl PinInit<Self, Error> instead.
>>=20
>> This contributed to more clarity to the fact that a driver returns it's
>> device private data in probe() and the Rust driver model owns the data,
>> manages the lifetime and - considering the lifetime - provides (safe)
>> accessors for the driver.
>>=20
>> Hence, let probe() functions return an impl PinInit<Self, Error> instead
>> of Result<Pin<KBox<Self>>>.
>>=20
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>> Depends on a minor pin-init patch [1] (Benno will send it to the list
>> soon). A branch with this patch and the pin-init dependency is available
>> in [2].
>>=20
>> [1] https://github.com/Rust-for-Linux/pin-init/pull/86/commits
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?=
h=3Dprobe_return
>
> Overall LGTM.
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks!

>>  impl Device<CoreInternal> {
>>      /// Store a pointer to the bound driver's private data.
>> -    pub fn set_drvdata(&self, data: impl ForeignOwnable) {
>> +    pub fn set_drvdata<T: 'static>(&self, data: impl PinInit<T, Error>)=
 -> Result {
>> +        let data =3D KBox::pin_init(data, GFP_KERNEL)?;
>
> Perhaps the gfp flags should be an argument set_drvdata?

There shouldn't be a need, so I'd rather do that should we find a valid cas=
e.
