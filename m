Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E3BEEADF
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 19:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9810E21F;
	Sun, 19 Oct 2025 17:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EbjDaLrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF9510E1F0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 11:57:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so26167145e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 04:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760875051; x=1761479851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CFyJz4TGbBiB8xKgL30elmXo6maKrPja2K5Egv8H5yA=;
 b=EbjDaLrt3MxyCEsZhNcftxXorWLKIhEuF3RhPlP2qFYrbQps9YvUflv8lANHOmF+oV
 NoeSw9peUOz5cX4U6dBPiAnoQwRS0HF76spwMkTIh5IHIiAF+ZssaHDuCxLHzkVxpbge
 MgBb7wmtDQWojH8dnPEl8Voq/AZ+ySbjFtAgoE2EBotyPvWQJzs3Bgb5bEJ1N/BYgrkB
 YPvkO3rWgWJRvLXgfTZXxJ3M6Z2SgvZ/gQROywFim788CqU8K2n3WrrUq1linRPvY/0k
 sdghJ5qMtPSmzBiKITnE1peN9owPfB1oVVAhH4CraKjqvxxVGbbc02DdEydy5/My8zT3
 L6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760875051; x=1761479851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CFyJz4TGbBiB8xKgL30elmXo6maKrPja2K5Egv8H5yA=;
 b=men2y/DaPdJPkdwKuGPqrIcjrezHYpM47kAL8iMEsYUN2wKsry/0+UD5mQvs5UPhyp
 lMW1AxAesuBg1d88sKbHIFbUndb697yxq8smdaba11SqFQ9BX4KfskBrR2UdpwSoSGhc
 trwxPXESM2+nQvlms2W9aUoAzRgBaSyYDe6Sp4o1YS3YYn/wozCcug97slewzJLr6N2Z
 hM4QKxUmBvsJKF9y7ddYeyF2znUNQtEDbeBU+Ot0bHCx2f5+v7mhQ50uDpsFm48kjzum
 9bmfXGjRCeI2WXiCCrZDPwcB8Jxhf3QZ67lvVwtRzSNYZ3AtZaHICCgCjmudWuDqqDoZ
 j8Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFWqA6EHrsKAj9QYCnQz54StrO/m3XGBIhlNtBcS9FvA6B0FvCv+X7HUD2EeLEwSylXfZl6HB5Wr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJhrD0RVHZ54sOOyGqfUyUptbP1s+jn9GtnM/pkaW6yQyN2w8F
 TCTzAJDGcYFlt5t3v03Mb8plYYsh5k8wRIZSiuO01f+PhgWOtdIKB8u+
X-Gm-Gg: ASbGncs7e49Ck6C9qA0H1BM4OjD52YLJXz+2kRXAZQ3iEZy56ZpMIxhugCIsDHGWBHi
 h4O6t15FGO0ZyLkgtBrR8tbv6rOw0XxFv5p26+hrBNa9mvc46r78E1I1e3ifDUCXEz3muPnHage
 S/n9iWcilh8Zg5mcJwRa28zmu7txBTB2iw5F9dXXhs0wz900o2G1MFeU23dt2NiNxDzS5CI2MVb
 shLjyw+NT2IA34XYHORAzGU5R87kgBIWU1MQquVopZXia1RFNl0dXCjP6z4dtbXAI8uFvNrILoO
 l+J/6B+LqZfLMX47mIDi1WG4kWzZdU/YtF6/3XR9yMEZ3x6bKWNnU6W+AzuxpiJEkZwpIV4u4co
 7B7WRbxOf1RMLbfCUM77ZP4bYdYDJzSnkWt7u8KEOk0mgEukWa3tTBB+Kp8MY0QHv4v07jX1NjL
 SkRi9NFW34aQwTDn/zGRPg/6amhgHYgitz3FW/gUv4NXraMnAlh8xEGXCGunS3gpFm/1A=
X-Google-Smtp-Source: AGHT+IHvDD+ifAg+17oqux4wEgOfVHaOlLPFxtbGdrBBFjTGnfI9PU8wWphxIaLJLYGzyWFboM6Djg==
X-Received: by 2002:a05:600c:548a:b0:471:669:e95d with SMTP id
 5b1f17b1804b1-4711787dcc8mr62020415e9.12.1760875051305; 
 Sun, 19 Oct 2025 04:57:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471529598c9sm91035475e9.5.2025.10.19.04.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 04:57:30 -0700 (PDT)
Message-ID: <72cfbe83-e587-441e-abfb-b50155a326ab@gmail.com>
Date: Sun, 19 Oct 2025 13:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
 <DDK7N52VX059.202D7SPGFV8A9@nvidia.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <DDK7N52VX059.202D7SPGFV8A9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 19 Oct 2025 17:30:18 +0000
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

Hi Alexandre,

Thanks for your comments!



On 10/17/25 03:36, Alexandre Courbot wrote:
> On Thu Oct 16, 2025 at 4:49 AM JST, Daniel del Castillo wrote:
>> This patch solves the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> I confirmed by talking to Alexandre Courbot, that the reading/writing
>> methods in `CoherentAllocation` can never be safe, so
>> this patch doesn't actually change `CoherentAllocation`, but rather
>> tries to solve the existing references to [COHA].
> 
> This mention of background discussions should be in the comment part of
> your commit (below the `---`).

Noted, will do for the next version of the patch.

>>
>> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
>> ---
>>  drivers/gpu/nova-core/dma.rs            |  20 ++---
>>  drivers/gpu/nova-core/firmware/fwsec.rs | 104 ++++++++++--------------
>>  2 files changed, 50 insertions(+), 74 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
>> index 94f44bcfd748..639a99cf72c4 100644
>> --- a/drivers/gpu/nova-core/dma.rs
>> +++ b/drivers/gpu/nova-core/dma.rs
>> @@ -25,21 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
>>      }
>>  
>>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
>> -        Self::new(dev, data.len()).map(|mut dma_obj| {
>> -            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
>> -            // SAFETY:
>> -            // - `dma_obj`'s size is at least `data.len()`.
>> -            // - We have just created this object and there is no other user at this stage.
>> -            unsafe {
>> -                core::ptr::copy_nonoverlapping(
>> -                    data.as_ptr(),
>> -                    dma_obj.dma.start_ptr_mut(),
>> -                    data.len(),
>> -                );
>> -            }
>> -
>> -            dma_obj
>> -        })
>> +        let mut dma_obj = Self::new(dev, data.len())?;
>> +        // SAFETY: We have just created this object and there is no other user at this stage.
>> +        unsafe { dma_obj.write(data, 0)? };
>> +
>> +        Ok(dma_obj)
> 
> Can you preserve the use of `map`? This removes the need for the
> temporary variable.
> 

Sure.> <snip>
>>  /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
>> @@ -260,32 +245,38 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>>  
>>          // Find the DMEM mapper section in the firmware.
>>          for i in 0..hdr.entry_count as usize {
>> -            let app: &FalconAppifV1 =
>>              // SAFETY: we have exclusive access to `dma_object`.
>> -            unsafe {
>> +            let app: &FalconAppifV1 = unsafe {
>>                  transmute(
>>                      &dma_object,
>> -                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
>> +                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize,
>>                  )
>>              }?;
>>  
>>              if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
>>                  continue;
>>              }
>> +            let dmem_base = app.dmem_base;
>>  
>>              // SAFETY: we have exclusive access to `dma_object`.
>>              let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
>> -                transmute_mut(
>> -                    &mut dma_object,
>> -                    (desc.imem_load_size + app.dmem_base) as usize,
>> -                )
>> +                transmute_mut(&mut dma_object, (desc.imem_load_size + dmem_base) as usize)
>>              }?;
>>  
>> +            dmem_mapper.init_cmd = match cmd {
>> +                FwsecCommand::Frts {
>> +                    frts_addr: _,
>> +                    frts_size: _,
> 
> Can the `{ .. }` syntax be used here?
> 
Yes! I didn't remember that syntax.


>> +                } => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
>> +                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
>> +            };
>> +            let cmd_in_buffer_offset = dmem_mapper.cmd_in_buffer_offset;
>> +
>>              // SAFETY: we have exclusive access to `dma_object`.
>>              let frts_cmd: &mut FrtsCmd = unsafe {
>>                  transmute_mut(
>>                      &mut dma_object,
>> -                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
>> +                    (desc.imem_load_size + cmd_in_buffer_offset) as usize,
>>                  )
>>              }?;
>>  
>> @@ -296,24 +287,19 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>>                  size: 0,
>>                  flags: 2,
>>              };
>> -
>> -            dmem_mapper.init_cmd = match cmd {
>> -                FwsecCommand::Frts {
>> -                    frts_addr,
>> -                    frts_size,
>> -                } => {
>> -                    frts_cmd.frts_region = FrtsRegion {
>> -                        ver: 1,
>> -                        hdr: size_of::<FrtsRegion>() as u32,
>> -                        addr: (frts_addr >> 12) as u32,
>> -                        size: (frts_size >> 12) as u32,
>> -                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
>> -                    };
>> -
>> -                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
>> -                }
>> -                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
>> -            };
>> +            if let FwsecCommand::Frts {
>> +                frts_addr,
>> +                frts_size,
>> +            } = cmd
>> +            {
>> +                frts_cmd.frts_region = FrtsRegion {
>> +                    ver: 1,
>> +                    hdr: size_of::<FrtsRegion>() as u32,
>> +                    addr: (frts_addr >> 12) as u32,
>> +                    size: (frts_size >> 12) as u32,
>> +                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
>> +                };
>> +            }
> 
> I liked that the original code updated both `init_cmd` and `frts_region`
> in the same match block. I understand it might be difficult to preserve
> due to the borrowing rules, but can you try to preserve it if that's
> possible at all?

I agree it was nicer. I tried to preserve it, but I don't see a way to
do it cleanly, as I can't keep both mutable references at the same time.
What I could do is only check `cmd` once, set `init_cmd` and store an
`Option<FrtsRegion>` that I will later use to set `frts_region` if it's
not `None`. Let me know if you prefer that.

Cheers,
Daniel

