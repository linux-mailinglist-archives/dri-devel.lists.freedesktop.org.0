Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E5BAB7129
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 18:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A9210E63F;
	Wed, 14 May 2025 16:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ApFPw8ES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F1A10E63F;
 Wed, 14 May 2025 16:23:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 438E543AF8;
 Wed, 14 May 2025 16:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522AEC4CEE3;
 Wed, 14 May 2025 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747239835;
 bh=y/Gwr1iuLNTEtohQ9qMnFDngBSZXs0TWtln2nglYeRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ApFPw8ESUEeLvkU3THXmvMJ24t31cJUjFVSBLz67D8lDzfJrkjoTcVEfDWyAkuskz
 LvB5kjjl2nKaqQTvXm3nTUWfHlIe78IqnmiNb2JzEXMzUMYJyXNydnneAFDbQzDW5s
 ive8gxHVt60uXAxovWVNvppZU7X+5526Ig+++zAbmySQs2bu7cydKfm5prB77ADaR+
 ENFr+ql2t1iNJZd7UMsRSFags3rEOrR3o2AeE2aS9v1Pi059UUmi5glH2ca8EqMzpm
 nYa3CHSVSEun1+LHqsvX+oJjVLaKxc/aEKHNJX6SIhWLAcKCrJqg4R2E/FW98WEh9F
 kDOLDqhdkSecg==
Date: Wed, 14 May 2025 18:23:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
Message-ID: <aCTDk9UKRWHWYexR@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:43PM +0900, Alexandre Courbot wrote:
> +/// PCI Data Structure as defined in PCI Firmware Specification
> +#[derive(Debug, Clone)]
> +#[repr(C)]
> +struct PcirStruct {
> +    /// PCI Data Structure signature ("PCIR" or "NPDS")
> +    pub signature: [u8; 4],
> +    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
> +    pub vendor_id: u16,
> +    /// PCI Device ID
> +    pub device_id: u16,
> +    /// Device List Pointer
> +    pub device_list_ptr: u16,
> +    /// PCI Data Structure Length
> +    pub pci_data_struct_len: u16,
> +    /// PCI Data Structure Revision
> +    pub pci_data_struct_rev: u8,
> +    /// Class code (3 bytes, 0x03 for display controller)
> +    pub class_code: [u8; 3],
> +    /// Size of this image in 512-byte blocks
> +    pub image_len: u16,
> +    /// Revision Level of the Vendor's ROM
> +    pub vendor_rom_rev: u16,
> +    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
> +    pub code_type: u8,
> +    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
> +    pub last_image: u8,
> +    /// Maximum Run-time Image Length (units of 512 bytes)
> +    pub max_runtime_image_len: u16,
> +}

Here and in a couple more cases below, please don't use pub for fields of
private structures.

> +
> +impl PcirStruct {
> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +        if data.len() < core::mem::size_of::<PcirStruct>() {
> +            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[0..4]);
> +
> +        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
> +        if &signature != b"PCIR" && &signature != b"NPDS" {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "Invalid signature for PcirStruct: {:?}\n",
> +                signature
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        let mut class_code = [0u8; 3];
> +        class_code.copy_from_slice(&data[13..16]);
> +
> +        Ok(PcirStruct {
> +            signature,
> +            vendor_id: u16::from_le_bytes([data[4], data[5]]),
> +            device_id: u16::from_le_bytes([data[6], data[7]]),
> +            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
> +            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
> +            pci_data_struct_rev: data[12],
> +            class_code,
> +            image_len: u16::from_le_bytes([data[16], data[17]]),
> +            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
> +            code_type: data[20],
> +            last_image: data[21],
> +            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
> +        })

Quite some of those fields seem unused, do we still want to have them? Same for
other structures below.

> +    }
> +
> +    /// Check if this is the last image in the ROM
> +    fn is_last(&self) -> bool {
> +        self.last_image & LAST_IMAGE_BIT_MASK != 0
> +    }
> +
> +    /// Calculate image size in bytes
> +    fn image_size_bytes(&self) -> Result<usize> {
> +        if self.image_len > 0 {
> +            // Image size is in 512-byte blocks
> +            Ok(self.image_len as usize * 512)
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +}
> +
> +/// BIOS Information Table (BIT) Header
> +/// This is the head of the BIT table, that is used to locate the Falcon data.
> +/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
> +/// it is pointing to is in the FwSecBiosImage.
> +#[derive(Debug, Clone, Copy)]
> +#[expect(dead_code)]
> +struct BitHeader {
> +    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
> +    pub id: u16,
> +    /// 2h: BIT Header Signature ("BIT\0")
> +    pub signature: [u8; 4],
> +    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
> +    pub bcd_version: u16,
> +    /// 8h: Size of BIT Header (in bytes)
> +    pub header_size: u8,
> +    /// 9h: Size of BIT Tokens (in bytes)
> +    pub token_size: u8,
> +    /// 10h: Number of token entries that follow
> +    pub token_entries: u8,
> +    /// 11h: BIT Header Checksum
> +    pub checksum: u8,
> +}
> +
> +impl BitHeader {
> +    fn new(data: &[u8]) -> Result<Self> {
> +        if data.len() < 12 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[2..6]);
> +
> +        // Check header ID and signature
> +        let id = u16::from_le_bytes([data[0], data[1]]);
> +        if id != 0xB8FF || &signature != b"BIT\0" {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(BitHeader {
> +            id,
> +            signature,
> +            bcd_version: u16::from_le_bytes([data[6], data[7]]),
> +            header_size: data[8],
> +            token_size: data[9],
> +            token_entries: data[10],
> +            checksum: data[11],
> +        })
> +    }
> +}
> +
> +/// BIT Token Entry: Records in the BIT table followed by the BIT header
> +#[derive(Debug, Clone, Copy)]
> +#[expect(dead_code)]
> +struct BitToken {
> +    /// 00h: Token identifier
> +    pub id: u8,
> +    /// 01h: Version of the token data
> +    pub data_version: u8,
> +    /// 02h: Size of token data in bytes
> +    pub data_size: u16,
> +    /// 04h: Offset to the token data
> +    pub data_offset: u16,
> +}
> +
> +// Define the token ID for the Falcon data
> +pub(in crate::vbios) const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;

This can just be private.

> +
> +impl BitToken {
> +    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
> +    pub(in crate::vbios) fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {

Same here.

<snip>

> +struct PciAtBiosImage {
> +    base: BiosImageBase,
> +    bit_header: Option<BitHeader>,
> +    bit_offset: Option<usize>,

Why are those Options? AFAICS, this structure is only ever created from

	impl TryFrom<BiosImageBase> for PciAtBiosImage

and there you fail if you can't find the bit header anyways.

Also BitToken::from_id fails if bit_header == None, and it doesn't seem to be
used anywhere else.

I think we should remove the Option wrapper for both.

<snip>

> +/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
> +/// for a given application ID. The table of entries is pointed to by the falcon
> +/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
> +#[expect(dead_code)]
> +struct PmuLookupTable {
> +    version: u8,
> +    header_len: u8,
> +    entry_len: u8,
> +    entry_count: u8,
> +    table_data: KVec<u8>,
> +}
> +
> +impl PmuLookupTable {
> +    fn new(data: &[u8]) -> Result<Self> {
> +        if data.len() < 4 {
> +            return Err(EINVAL);
> +        }
> +
> +        let header_len = data[1] as usize;
> +        let entry_len = data[2] as usize;
> +        let entry_count = data[3] as usize;
> +
> +        let required_bytes = header_len + (entry_count * entry_len);
> +
> +        if data.len() < required_bytes {
> +            return Err(EINVAL);
> +        }
> +
> +        // Create a copy of only the table data
> +        let mut table_data = KVec::new();
> +
> +        // "last_entry_bytes" is a debugging aid.
> +        let mut last_entry_bytes: Option<KVec<u8>> = if cfg!(debug_assertions) {
> +            Some(KVec::new())
> +        } else {
> +            None
> +        };
> +
> +        for &byte in &data[header_len..required_bytes] {
> +            table_data.push(byte, GFP_KERNEL)?;

This should just be

	table_data.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;

so you don't need the loop and potentially lots of re-allocations.

Subsequently you can implement the debugging stuff as

	if cfg!(debug_assertions) {
	    let mut last_entry_bytes = KVec::new();
	
	    for &byte in &data[header_len..required_bytes] {
	        // Debugging (dumps the table data to dmesg):
	        last_entry_bytes.push(byte, GFP_KERNEL)?;
	
	        let last_entry_bytes_len = last_entry_bytes.len();
	        if last_entry_bytes_len == entry_len {
	            pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes[..]);
	            last_entry_bytes = KVec::new();
	        }
	    }
	}

In general, I feel like this patch utilizes the Option type way too much and
often without actual need. Can you please also double check?

> +
> +            if cfg!(debug_assertions) {
> +                // Debugging (dumps the table data to dmesg):
> +                if let Some(ref mut last_entry_bytes) = last_entry_bytes {
> +                    last_entry_bytes.push(byte, GFP_KERNEL)?;
> +
> +                    let last_entry_bytes_len = last_entry_bytes.len();
> +                    if last_entry_bytes_len == entry_len {
> +                        pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes[..]);

Please use dev_dbg!().

> +                        *last_entry_bytes = KVec::new();
> +                    }
> +                }
> +            }
> +        }
> +
> +        Ok(PmuLookupTable {
> +            version: data[0],
> +            header_len: header_len as u8,
> +            entry_len: entry_len as u8,
> +            entry_count: entry_count as u8,
> +            table_data,
> +        })
> +    }
> +
> +    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
> +        if idx >= self.entry_count {
> +            return Err(EINVAL);
> +        }
> +
> +        let index = (idx as usize) * self.entry_len as usize;
> +        PmuLookupTableEntry::new(&self.table_data[index..])
> +    }
> +
> +    // find entry by type value
> +    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
> +        for i in 0..self.entry_count {
> +            let entry = self.lookup_index(i)?;
> +            if entry.application_id == entry_type {
> +                return Ok(entry);
> +            }
> +        }
> +
> +        Err(EINVAL)
> +    }
> +}
> +
> +/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
> +/// The PMU table contains voltage/frequency tables as well as a pointer to the
> +/// Falcon Ucode.
> +impl FwSecBiosImage {
> +    fn setup_falcon_data(
> +        &mut self,
> +        pdev: &pci::Device,
> +        pci_at_image: &PciAtBiosImage,
> +        first_fwsec_image: &FwSecBiosImage,
> +    ) -> Result<()> {

Just Result will do.

> +        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
> +
> +        // The falcon data pointer assumes that the PciAt and FWSEC images
> +        // are contiguous in memory. However, testing shows the EFI image sits in
> +        // between them. So calculate the offset from the end of the PciAt image
> +        // rather than the start of it. Compensate.
> +        offset -= pci_at_image.base.data.len();
> +
> +        // The offset is now from the start of the first Fwsec image, however
> +        // the offset points to a location in the second Fwsec image. Since
> +        // the fwsec images are contiguous, subtract the length of the first Fwsec
> +        // image from the offset to get the offset to the start of the second
> +        // Fwsec image.
> +        offset -= first_fwsec_image.base.data.len();
> +
> +        self.falcon_data_offset = Some(offset);
> +
> +        // The PmuLookupTable starts at the offset of the falcon data pointer
> +        self.pmu_lookup_table = Some(PmuLookupTable::new(&self.base.data[offset..])?);
> +
> +        match self
> +            .pmu_lookup_table
> +            .as_ref()
> +            .ok_or(EINVAL)?
> +            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
> +        {
> +            Ok(entry) => {
> +                let mut ucode_offset = entry.data as usize;
> +                ucode_offset -= pci_at_image.base.data.len();
> +                ucode_offset -= first_fwsec_image.base.data.len();
> +                self.falcon_ucode_offset = Some(ucode_offset);
> +                if cfg!(debug_assertions) {
> +                    // Print the v3_desc header for debugging
> +                    let v3_desc = self.fwsec_header(pdev.as_ref())?;
> +                    pr_info!("PmuLookupTableEntry v3_desc: {:#?}\n", v3_desc);
> +                }
> +            }
> +            Err(e) => {
> +                dev_err!(
> +                    pdev.as_ref(),
> +                    "PmuLookupTableEntry not found, error: {:?}\n",
> +                    e
> +                );
> +            }
> +        }
> +        Ok(())
> +    }
> +
> +    /// TODO: These were borrowed from the old code for integrating this module
> +    /// with the outside world. They should be cleaned up and integrated properly.

Okay, won't review for now then. :)
