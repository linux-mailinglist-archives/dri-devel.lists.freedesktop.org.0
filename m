Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1570B50C1E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 05:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DA510E353;
	Wed, 10 Sep 2025 03:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYeDG5W1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365EE10E353;
 Wed, 10 Sep 2025 03:05:02 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-76e4fc419a9so5210286b3a.0; 
 Tue, 09 Sep 2025 20:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757473502; x=1758078302; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mYFdb1USTj2+x7+zfuFkVYygMNjKD7vPuSqf1KlNu2A=;
 b=cYeDG5W1nBe6leEXEy6ANOltYzLG58mSOR8bzm/PTITn8V9Chc4vPaqalO6Y2Z2o0H
 mWw0ePlCumvDlT7ScpPYqUPhU0Ck7own5js9eHBJxG2Vzxyi79cXIyaCRv1ohWrdygdA
 eT9uuhHrCASW+LDh+86YAbD556wPfvE0Mtd9rN/QSJb6hGDa78Pd+94lMhqbyAq1KHw8
 nsuJRbxLSTxbi/jeNToFqfZnNwb3VlsCx0stR6QD0H/JrBQxvQiDspoxIEAEp6a92WGC
 SSdwefO7qFyGHOBl+qJQJ7UJIfm7kfWikvNT+sMV3yUbjxdQhszfhtIswJezmDhyLCP/
 q9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757473502; x=1758078302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYFdb1USTj2+x7+zfuFkVYygMNjKD7vPuSqf1KlNu2A=;
 b=D21F/uD/3MP3FOUxduY/SmTrUEEoisX/l35BIjDevYMeWupsXd9yqnoMEeqcyMwwwk
 SKDXNMWlCc9KAfJqur4gvy2JpQeeHhiHkULjD/g9MUuocHZpewqPpIB3PNtQw7YNPRXs
 FnWIvvq+2Fd7c5x5aleSfS7uIepVVAVs7AFbFBKLJzdOujFHS4W0LP0gCK+zaFLS+QrI
 9kHTGs4mMo57nCR+h7L0JtUmItfDJes6zaRCwZXwvAtNmckE/4TX0KsxkTk32l2kzsmc
 ROT4lMqojJYl9/PKRxebIT/kuZ05Ex86RwM9JCPKGrOb7soeaArm9QEy1sNa40oF8/yX
 1b2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVMA1asPMb+pGv1B/l2+Nv4H9t3YUJOuVSgoBRGTQI+I+e5z+eyVH5MWTE4BJWkzU2p2c4Zx/pQDA=@lists.freedesktop.org,
 AJvYcCX4Depb2mZkz9Dy9T2Jdeyo011MO7S41URaMa5ReheON1zbPfmx37vwpQkhWocTmvyHg+wDcy5+/w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygzMKvYDP6pICikgY/y8zKoorRNEBpwAfqouwW1M9fvWgsBX3v
 61uY491fcFtouuwGs9LUcuU4VGW1kCfIggK+1dWvIWp4BEIElCGK3WSG
X-Gm-Gg: ASbGncs/09MD/DEEzf1apiaWhX7uZQ8h2+rFEAVBeckXkSPu/KvRETyzCIwAu+n9Vq3
 khE0w0RKQAaUUgfTpftLE8v0heiCa48ISrX7SaBRUcpBqWA/vCejQkRrPxG229TPJBLZt9pCwHc
 hbozENCixBoCtrRnElpq08HmKJSOYx7jypoe2kUvz9+EdipVahPAWpwPT8bau2wiYXHywU8yuOe
 4boexpvef6QKv/gjt5dyTBrsN64NJGcHuH3wk/GAxoPuWodqSk1nVwyYzZtPfGZZOBeWC6EaqJ5
 NwM4/FwXKApMNzP05NFc8hz9cXKyvrKTA2BNVwKexw9oNKk5Mw3XyLEI6m0gVnNrLIQHVSqlDSC
 Fj7GpZB/WrbmZvJdy+FLEKg==
X-Google-Smtp-Source: AGHT+IHW2m2fqzk8i2yGK4Ymv4hpZSFeeA6yKeeeK7VlEmLTHn98w7HBgHzoDgHwROapuWo4Ze1nRg==
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id
 d2e1a72fcca58-7742ddf13cfmr14536234b3a.20.1757473501384; 
 Tue, 09 Sep 2025 20:05:01 -0700 (PDT)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7746628fca0sm3506455b3a.56.2025.09.09.20.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 20:05:00 -0700 (PDT)
Date: Tue, 9 Sep 2025 23:04:58 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Message-ID: <aMDq2ln1ivFol_Db@yury>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909212039.227221-6-joelagnelf@nvidia.com>
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

On Tue, Sep 09, 2025 at 05:20:39PM -0400, Joel Fernandes wrote:
> Add KUNIT tests to make sure the macro is working correctly.
> 
> [Added range overlap tests suggested by Yury].

Please no brackets and personal references in commit messages.
If you believe it's worth mentioning my suggestion, then:

Suggested-by: Yury Norov (NVIDIA) <yury.norov@gmail.com> # For overlapped tests
 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Some comments inline.

Thanks,
Yury

> ---
>  rust/kernel/bits/bitfield.rs | 320 +++++++++++++++++++++++++++++++++++
>  1 file changed, 320 insertions(+)
> 
> diff --git a/rust/kernel/bits/bitfield.rs b/rust/kernel/bits/bitfield.rs
> index 0837fefc270f..f3134f2ffd08 100644
> --- a/rust/kernel/bits/bitfield.rs
> +++ b/rust/kernel/bits/bitfield.rs
> @@ -339,3 +339,323 @@ fn default() -> Self {
>          }
>      };
>  }
> +
> +#[::kernel::macros::kunit_tests(kernel_bitfield)]
> +mod tests {
> +    use core::convert::TryFrom;
> +
> +    // Enum types for testing => and ?=> conversions
> +    #[derive(Debug, Clone, Copy, PartialEq)]
> +    enum MemoryType {
> +        Unmapped = 0,
> +        Normal = 1,
> +        Device = 2,
> +        Reserved = 3,
> +    }
> +
> +    impl Default for MemoryType {
> +        fn default() -> Self {
> +            MemoryType::Unmapped
> +        }
> +    }
> +
> +    impl TryFrom<u8> for MemoryType {
> +        type Error = u8;
> +        fn try_from(value: u8) -> Result<Self, Self::Error> {
> +            match value {
> +                0 => Ok(MemoryType::Unmapped),
> +                1 => Ok(MemoryType::Normal),
> +                2 => Ok(MemoryType::Device),
> +                3 => Ok(MemoryType::Reserved),
> +                _ => Err(value),
> +            }
> +        }
> +    }
> +
> +    impl From<MemoryType> for u64 {
> +        fn from(mt: MemoryType) -> u64 {
> +            mt as u64
> +        }
> +    }
> +
> +    #[derive(Debug, Clone, Copy, PartialEq)]
> +    enum Priority {
> +        Low = 0,
> +        Medium = 1,
> +        High = 2,
> +        Critical = 3,
> +    }
> +
> +    impl Default for Priority {
> +        fn default() -> Self {
> +            Priority::Low
> +        }
> +    }
> +
> +    impl From<u8> for Priority {
> +        fn from(value: u8) -> Self {
> +            match value & 0x3 {
> +                0 => Priority::Low,
> +                1 => Priority::Medium,
> +                2 => Priority::High,
> +                _ => Priority::Critical,
> +            }
> +        }
> +    }
> +
> +    impl From<Priority> for u16 {
> +        fn from(p: Priority) -> u16 {
> +            p as u16
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestPageTableEntry: u64 {
> +            0:0       present     as bool;
> +            1:1       writable    as bool;
> +            11:9      available   as u8;
> +            13:12     mem_type    as u8 ?=> MemoryType;
> +            17:14     extended_type as u8 ?=> MemoryType;  // 4-bit field for testing failures
> +            51:12     pfn         as u64;
> +            51:12     pfn_overlap as u64;  // Overlapping field
> +            61:52     available2  as u16;
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestControlRegister: u16 {
> +            0:0       enable      as bool;
> +            3:1       mode        as u8;
> +            5:4       priority    as u8 => Priority;
> +            7:4       priority_nibble as u8;  // Overlapping field
> +            15:8      channel     as u8;
> +        }
> +    }
> +
> +    bitfield! {
> +        struct TestStatusRegister: u8 {
> +            0:0       ready       as bool;
> +            1:1       error       as bool;
> +            3:2       state       as u8;
> +            7:4       reserved    as u8;
> +            7:0       full_byte   as u8;  // Overlapping field for entire register
> +        }
> +    }
> +
> +    #[test]
> +    fn test_single_bits() {
> +        let mut pte = TestPageTableEntry::default();
> +
> +        // Test bool field
> +        assert!(!pte.present());
> +        assert!(!pte.writable());
> +
> +        pte = pte.set_present(true);
> +        assert!(pte.present());
> +
> +        pte = pte.set_writable(true);
> +        assert!(pte.writable());
> +
> +        pte = pte.set_writable(false);
> +        assert!(!pte.writable());
> +
> +        assert_eq!(pte.available(), 0);
> +        pte = pte.set_available(0x5);
> +        assert_eq!(pte.available(), 0x5);
> +    }
> +
> +    #[test]
> +    fn test_range_fields() {
> +        let mut pte = TestPageTableEntry::default();
> +
> +        pte = pte.set_pfn(0x123456);
> +        assert_eq!(pte.pfn(), 0x123456);
> +        // Test overlapping field reads same value
> +        assert_eq!(pte.pfn_overlap(), 0x123456);
> +
> +        pte = pte.set_available(0x7);
> +        assert_eq!(pte.available(), 0x7);
> +
> +        pte = pte.set_available2(0x3FF);
> +        assert_eq!(pte.available2(), 0x3FF);
> +
> +        // Test TryFrom with ?=> for MemoryType
> +        pte = pte.set_mem_type(MemoryType::Device);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
> +
> +        pte = pte.set_mem_type(MemoryType::Normal);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
> +
> +        // Test all valid values for mem_type
> +        pte = pte.set_mem_type(MemoryType::Reserved); // Valid value: 3
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
> +
> +        // Test failure case using extended_type field which has 4 bits (0-15)
> +        // MemoryType only handles 0-3, so values 4-15 should return Err
> +        let mut raw = pte.raw();
> +        raw = (raw & !(0xF << 14)) | (0x7 << 14); // Set bits 17:14 to 7 (invalid for MemoryType)
> +        let invalid_pte = TestPageTableEntry::from(raw);
> +        assert_eq!(invalid_pte.extended_type(), Err(0x7)); // Should return Err with the invalid value

Please make sure your lines don't exceed 100 chars, preferably less
than 80.

> +
> +        // Test a valid value after testing invalid to ensure both cases work
> +        raw = (raw & !(0xF << 14)) | (0x2 << 14); // Set bits 17:14 to 2 (valid: Device)

Can you use genmask!() here and everywhere else?

> +        let valid_pte = TestPageTableEntry::from(raw);
> +        assert_eq!(valid_pte.extended_type(), Ok(MemoryType::Device)); // Should return Ok with Device
> +
> +        let max_pfn = (1u64 << 40) - 1;
> +        pte = pte.set_pfn(max_pfn);
> +        assert_eq!(pte.pfn(), max_pfn);
> +        assert_eq!(pte.pfn_overlap(), max_pfn);
> +    }
> +
> +    #[test]
> +    fn test_builder_pattern() {
> +        let pte = TestPageTableEntry::default()
> +            .set_present(true)
> +            .set_writable(true)
> +            .set_available(0x7)
> +            .set_pfn(0xABCDEF)
> +            .set_mem_type(MemoryType::Reserved)
> +            .set_available2(0x3FF);
> +
> +        assert!(pte.present());
> +        assert!(pte.writable());
> +        assert_eq!(pte.available(), 0x7);
> +        assert_eq!(pte.pfn(), 0xABCDEF);
> +        assert_eq!(pte.pfn_overlap(), 0xABCDEF);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
> +        assert_eq!(pte.available2(), 0x3FF);
> +    }
> +
> +    #[test]
> +    fn test_raw_operations() {
> +        let raw_value = 0x3FF0000003123E03u64;
> +
> +        // Test using ::from() syntax
> +        let pte = TestPageTableEntry::from(raw_value);
> +        assert_eq!(pte.raw(), raw_value);
> +
> +        assert!(pte.present());
> +        assert!(pte.writable());
> +        assert_eq!(pte.available(), 0x7);
> +        assert_eq!(pte.pfn(), 0x3123);
> +        assert_eq!(pte.pfn_overlap(), 0x3123);
> +        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
> +        assert_eq!(pte.available2(), 0x3FF);
> +
> +        // Test using direct constructor syntax TestStruct(value)
> +        let pte2 = TestPageTableEntry(raw_value);
> +        assert_eq!(pte2.raw(), raw_value);
> +    }
> +
> +    #[test]
> +    fn test_u16_bitfield() {
> +        let mut ctrl = TestControlRegister::default();
> +
> +        assert!(!ctrl.enable());
> +        assert_eq!(ctrl.mode(), 0);
> +        assert_eq!(ctrl.priority(), Priority::Low);
> +        assert_eq!(ctrl.priority_nibble(), 0);
> +        assert_eq!(ctrl.channel(), 0);
> +
> +        ctrl = ctrl.set_enable(true);
> +        assert!(ctrl.enable());
> +
> +        ctrl = ctrl.set_mode(0x5);
> +        assert_eq!(ctrl.mode(), 0x5);
> +
> +        // Test From conversion with =>
> +        ctrl = ctrl.set_priority(Priority::High);
> +        assert_eq!(ctrl.priority(), Priority::High);
> +        assert_eq!(ctrl.priority_nibble(), 0x2); // High = 2 in bits 5:4
> +
> +        ctrl = ctrl.set_channel(0xAB);
> +        assert_eq!(ctrl.channel(), 0xAB);
> +
> +        // Test overlapping fields
> +        ctrl = ctrl.set_priority_nibble(0xF);
> +        assert_eq!(ctrl.priority_nibble(), 0xF);
> +        assert_eq!(ctrl.priority(), Priority::Critical); // bits 5:4 = 0x3
> +
> +        let ctrl2 = TestControlRegister::default()
> +            .set_enable(true)
> +            .set_mode(0x3)
> +            .set_priority(Priority::Medium)
> +            .set_channel(0x42);
> +
> +        assert!(ctrl2.enable());
> +        assert_eq!(ctrl2.mode(), 0x3);
> +        assert_eq!(ctrl2.priority(), Priority::Medium);
> +        assert_eq!(ctrl2.channel(), 0x42);
> +
> +        let raw_value: u16 = 0x4217;
> +        let ctrl3 = TestControlRegister::from(raw_value);
> +        assert_eq!(ctrl3.raw(), raw_value);
> +        assert!(ctrl3.enable());
> +        assert_eq!(ctrl3.priority(), Priority::Medium);
> +        assert_eq!(ctrl3.priority_nibble(), 0x1);
> +        assert_eq!(ctrl3.channel(), 0x42);
> +    }
> +
> +    #[test]
> +    fn test_u8_bitfield() {
> +        let mut status = TestStatusRegister::default();
> +
> +        assert!(!status.ready());
> +        assert!(!status.error());
> +        assert_eq!(status.state(), 0);
> +        assert_eq!(status.reserved(), 0);
> +        assert_eq!(status.full_byte(), 0);
> +
> +        status = status.set_ready(true);
> +        assert!(status.ready());
> +        assert_eq!(status.full_byte(), 0x01);
> +
> +        status = status.set_error(true);
> +        assert!(status.error());
> +        assert_eq!(status.full_byte(), 0x03);
> +
> +        status = status.set_state(0x3);
> +        assert_eq!(status.state(), 0x3);
> +        assert_eq!(status.full_byte(), 0x0F);
> +
> +        status = status.set_reserved(0xA);
> +        assert_eq!(status.reserved(), 0xA);
> +        assert_eq!(status.full_byte(), 0xAF);
> +
> +        // Test overlapping field
> +        status = status.set_full_byte(0x55);
> +        assert_eq!(status.full_byte(), 0x55);
> +        assert!(status.ready());
> +        assert!(!status.error());
> +        assert_eq!(status.state(), 0x1);
> +        assert_eq!(status.reserved(), 0x5);
> +
> +        let status2 = TestStatusRegister::default()
> +            .set_ready(true)
> +            .set_state(0x2)
> +            .set_reserved(0x5);
> +
> +        assert!(status2.ready());
> +        assert!(!status2.error());
> +        assert_eq!(status2.state(), 0x2);
> +        assert_eq!(status2.reserved(), 0x5);
> +        assert_eq!(status2.full_byte(), 0x59);
> +
> +        let raw_value: u8 = 0x59;
> +        let status3 = TestStatusRegister::from(raw_value);
> +        assert_eq!(status3.raw(), raw_value);
> +        assert!(status3.ready());
> +        assert!(!status3.error());
> +        assert_eq!(status3.state(), 0x2);
> +        assert_eq!(status3.reserved(), 0x5);
> +        assert_eq!(status3.full_byte(), 0x59);

You've got only one negative test that covers the .from() method.
Can you add more?

What if I create a bitfield from a runtime value that exceeds
the capacity?

    bitfield! {
        struct bf: u8 {
            0:0       ready       as bool;
            1:1       error       as bool;
            3:2       state       as u32;
       }
    }

    let raw_value: u8 = 0xff;
    let bf = bf::from(raw_value);

I guess you'd return None or similar. Can you add such a test?
The same question for the setters. What would happen for this:

    let bf = bf::default()
             .set_state(0xf)
             .set_ready(true);

I think that after the first out-of-boundary in set_state(), you
should abort the call chain, make sure you're not touching memory
in set_ready() and returning some type of error.

And for this:

    let ret: u32 = -EINVAL;
    bf = bf::default();
    bf = bf.set_state(ret);

For compile-time initializes, it should be a compile-time error, right?
Can you drop a comment on that?

(In C we've got FIELD_{GET,MODIFY,PREP}. They cover all the static
cases.)

> +        let status4 = TestStatusRegister::from(0xFF);
> +        assert!(status4.ready());
> +        assert!(status4.error());
> +        assert_eq!(status4.state(), 0x3);
> +        assert_eq!(status4.reserved(), 0xF);
> +        assert_eq!(status4.full_byte(), 0xFF);
> +    }
> +}
> -- 
> 2.34.1

I tried to apply your series on top of master, but it failed. So
my apologies for not finding the answers to some questions above
by myself.

For the next version, can you make sure your series is applicable
on top of master or -next?
