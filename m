Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F5DB53242
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C729610EB07;
	Thu, 11 Sep 2025 12:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c06Sp8Q/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF16410EB09;
 Thu, 11 Sep 2025 12:31:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AB1116023D;
 Thu, 11 Sep 2025 12:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB09DC4CEF0;
 Thu, 11 Sep 2025 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757593881;
 bh=K6b51fWzAg1h8jw+QOy5A/3DHSmlmOFYyUDsQ8bcEy0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c06Sp8Q/kv38/w351LhzH0bADeXIM27LzqOFWz+Nh46SiZueL60fgJC4Rsgoz1KYU
 lRoLc+FftCVZ+0Pz3zvuX7rtHL2L7LB2aWIBKuRpEQew3EqwhUasBxx20uyhfLyvif
 RmYeAS76hFZCosqOuSdEAwzU85otiOLypPQaEbSO+liL8POvXQRC+b4I0QvPVVvwHX
 qxdnjMyvYqOZCq6uCLI9TGGYS4rg0qIVoGYx69kCIgV8JEqQf1AlGPS3C6j6CwnDvB
 XQf5DeXP5Ykz3KAfTGuZ88nC2rjugKax/rip1CWx/eJ9ju7qdnNhsEcexIACZjx/6s
 uu7QwZIZ7oTWg==
Message-ID: <ef1023cc-0dea-49d2-8d04-6666510b53e6@kernel.org>
Date: Thu, 11 Sep 2025 14:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] gpu: nova-core: firmware: process and prepare
 the GSP firmware
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-8-5a8a33bddca1@nvidia.com>
 <9c1a7902-4e14-4b25-ba32-57a475a0bccc@kernel.org>
 <DCPYZSLUJGZ1.2D835NAHYEM5U@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DCPYZSLUJGZ1.2D835NAHYEM5U@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/11/25 2:29 PM, Alexandre Courbot wrote:
> On Thu Sep 11, 2025 at 8:27 PM JST, Danilo Krummrich wrote:
>> On 9/11/25 1:04 PM, Alexandre Courbot wrote:
>>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>>> index 06a7ee8f4195759fb55ad483852724bb1ab46793..8505ee81c43e7628d1f099aff285244f8908c633 100644
>>> --- a/drivers/gpu/nova-core/gpu.rs
>>> +++ b/drivers/gpu/nova-core/gpu.rs
>>> @@ -8,6 +8,7 @@
>>>  use crate::fb::SysmemFlush;
>>>  use crate::firmware::booter::{BooterFirmware, BooterKind};
>>>  use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
>>> +use crate::firmware::gsp::GspFirmware;
>>>  use crate::firmware::{Firmware, FIRMWARE_VERSION};
>>>  use crate::gfw;
>>>  use crate::regs;
>>> @@ -285,6 +286,11 @@ pub(crate) fn start_gsp(
>>>  
>>>          let bios = Vbios::new(dev, bar)?;
>>>  
>>> +        let _gsp_fw = KBox::pin_init(
>>> +            GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
>>> +            GFP_KERNEL,
>>> +        )?;
>>
>> Since we now have the infrastructure in place and the change is trival, I'd
>> prefer to make this a member of struct Gsp and make it part of the Gpu structure
>> directly (without separate allocation).
>>
>> Should we need dynamic dispatch in the future, it's also trivial to make it its
>> own allocation again, but maybe we also get around the dyn dispatch. :)
> 
> Ah, my previous talk about dynamic dispatch is a bit obsolete now that
> the `Firmware` struct is gone. :) Sorry if that created confusion.
> 
> Truth is, this object is not supposed to survive `start_gsp`, and we can
> dispose of it after the GSP is started as the bootloader will have
> validated and copied it into the WPR region. So we don't want to store
> it into `Gpu`, now or ever.

Ah, makes sense, so that's fine then.
