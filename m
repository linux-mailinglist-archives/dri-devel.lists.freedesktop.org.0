Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984ECBB28CE
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ED710E776;
	Thu,  2 Oct 2025 05:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="dEiCNUlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-out1.startmail.com (mx-out1.startmail.com [145.131.90.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F8010E765;
 Thu,  2 Oct 2025 02:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
 s=startmail1; t=1759371385;
 bh=cg5vUyT7oDKdkucLj/bIi19jBd516XoDYIn8kEEdYI8=;
 h=Message-ID:Date:Mime-Version:Subject:To:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:From:Subject:To:
 Date:Sender:Content-Type:Content-Transfer-Encoding:
 Content-Disposition:Mime-Version:Reply-To:In-Reply-To:References:
 Message-Id:List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
 b=dEiCNUlNXjY+9iO0E55l3UVhW2vWmsGPSVzF69DIQSDfnZZMEtbcH7KgTACiceju7
 r/eiG4JkYY6i7Puje4zLsqNplpaz4hnD3133o6PwA+tePFXUL5kDjxF/R/8z28NtDh
 y8Wtxuh9zhrUw0LgEBMbXDgjv+m6e/jBQGVkmsBI5phccCCIs80NLi/+zq6+GFzgXA
 CbR62/tD+6HQkR8rMNhjCjP8dMXTRLs0fDYNaSg2l5/Vg3nLdS1BqMM7dm78oHR/+G
 qiCbFBXFvUcb6dFFyROnik43TLpUM6YZ+8NgYPHzJfkIUntIlFGEq3iMTxouyYIn9w
 fHIHhDze6Psyw==
Message-ID: <d238d9b7-8ec5-4063-8217-885d951d2f0c@weathered-steel.dev>
Date: Thu, 2 Oct 2025 02:16:16 +0000
Mime-Version: 1.0
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com>
 <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
Content-Language: en-US
From: Elle Rhumsaa <elle@weathered-steel.dev>
In-Reply-To: <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:06 +0000
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

On 10/2/25 1:41 AM, Alexandre Courbot wrote:

> On Tue Sep 30, 2025 at 11:45 PM JST, Joel Fernandes wrote:
>> Add KUNIT tests to make sure the macro is working correctly.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>   rust/kernel/bitfield.rs | 321 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 321 insertions(+)
>>
>> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
>> index fed19918c3b9..9a20bcd2eb60 100644
>> --- a/rust/kernel/bitfield.rs
>> +++ b/rust/kernel/bitfield.rs
>> @@ -402,3 +402,324 @@ fn default() -> Self {
>>           }
>>       };
>>   }
>> +
>> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
>> +mod tests {
>> +    use core::convert::TryFrom;
>> +
>> +    // Enum types for testing => and ?=> conversions
>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>> +    enum MemoryType {
>> +        Unmapped = 0,
>> +        Normal = 1,
>> +        Device = 2,
>> +        Reserved = 3,
>> +    }
>> +
>> +    impl Default for MemoryType {
>> +        fn default() -> Self {
>> +            MemoryType::Unmapped
>> +        }
>> +    }
> Tip: you can add `Default` to the `#[derive]` marker of `MemoryType` and
> mark the variant you want as default with `#[default]` instead of
> providing a full impl block:
>
>      #[derive(Debug, Default, Clone, Copy, PartialEq)]
>      enum MemoryType {
>          #[default]
>          Unmapped = 0,
>          Normal = 1,
>          Device = 2,
>          Reserved = 3,
>      }

I would alternatively recommend to provide a `MemoryType::new` impl with 
a `const` definition:

```rust
impl MemoryType {
     pub const fn new() -> Self {

         Self::Unmapped

     }
}

impl Default for MemoryType {
     fn default() -> Self {
         Self::new()
     }
}
```

This pattern allows using `MemoryType::new()` in `const` contexts, while 
also providing the `Default` impl using the same default. It's somewhat 
of a workaround until we get `const` traits.

>> +
>> +    impl TryFrom<u8> for MemoryType {
>> +        type Error = u8;
>> +        fn try_from(value: u8) -> Result<Self, Self::Error> {
>> +            match value {
>> +                0 => Ok(MemoryType::Unmapped),
>> +                1 => Ok(MemoryType::Normal),
>> +                2 => Ok(MemoryType::Device),
>> +                3 => Ok(MemoryType::Reserved),
>> +                _ => Err(value),
>> +            }
>> +        }
>> +    }
>> +
>> +    impl From<MemoryType> for u64 {
>> +        fn from(mt: MemoryType) -> u64 {
>> +            mt as u64
>> +        }
>> +    }
>> +
>> +    #[derive(Debug, Clone, Copy, PartialEq)]
>> +    enum Priority {
>> +        Low = 0,
>> +        Medium = 1,
>> +        High = 2,
>> +        Critical = 3,
>> +    }
>> +
>> +    impl Default for Priority {
>> +        fn default() -> Self {
>> +            Priority::Low
>> +        }
>> +    }
>> +
>> +    impl From<u8> for Priority {
>> +        fn from(value: u8) -> Self {
>> +            match value & 0x3 {
>> +                0 => Priority::Low,
>> +                1 => Priority::Medium,
>> +                2 => Priority::High,
>> +                _ => Priority::Critical,
>> +            }
>> +        }
>> +    }
>> +
>> +    impl From<Priority> for u16 {
>> +        fn from(p: Priority) -> u16 {
>> +            p as u16
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestPageTableEntry(u64) {
>> +            0:0       present     as bool;
>> +            1:1       writable    as bool;
>> +            11:9      available   as u8;
>> +            13:12     mem_type    as u8 ?=> MemoryType;
>> +            17:14     extended_type as u8 ?=> MemoryType;  // For testing failures
>> +            51:12     pfn         as u64;
>> +            51:12     pfn_overlap as u64;
>> +            61:52     available2  as u16;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestControlRegister(u16) {
>> +            0:0       enable      as bool;
>> +            3:1       mode        as u8;
>> +            5:4       priority    as u8 => Priority;
>> +            7:4       priority_nibble as u8;
>> +            15:8      channel     as u8;
>> +        }
>> +    }
>> +
>> +    bitfield! {
>> +        struct TestStatusRegister(u8) {
>> +            0:0       ready       as bool;
>> +            1:1       error       as bool;
>> +            3:2       state       as u8;
>> +            7:4       reserved    as u8;
>> +            7:0       full_byte   as u8;  // For entire register
>> +        }
>> +    }
>> +
>> +    #[test]
>> +    fn test_single_bits() {
>> +        let mut pte = TestPageTableEntry::default();
>> +
>> +        assert!(!pte.present());
>> +        assert!(!pte.writable());
>> +
>> +        pte = pte.set_present(true);
>> +        assert!(pte.present());
>> +
>> +        pte = pte.set_writable(true);
>> +        assert!(pte.writable());
>> +
>> +        pte = pte.set_writable(false);
>> +        assert!(!pte.writable());
>> +
>> +        assert_eq!(pte.available(), 0);
>> +        pte = pte.set_available(0x5);
>> +        assert_eq!(pte.available(), 0x5);
> I'd suggest testing the actual raw value of the register on top of
> invoking the getter. That way you also test that:
>
> - The right field is actually written (i.e. if the offset is off by one,
>    the getter will return the expected result even though the bitfield
>    has the wrong value),
> - No other field has been affected.
>
> So something like:
>
>      pte = pte.set_present(true);
>      assert!(pte.present());
>      assert(pte.into(), 0x1u64);
>
>      pte = pte.set_writable(true);
>      assert!(pte.writable());
>      assert(pte.into(), 0x3u64);
>
> It might look a bit gross, but it is ok since these are not doctests
> that users are going to take as a reference, so we case improve test
> coverage at the detriment of readability.
>
