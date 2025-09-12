Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D53B54315
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 08:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F4E10EBAB;
	Fri, 12 Sep 2025 06:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9xUqHXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B0310EBAB;
 Fri, 12 Sep 2025 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757659327; x=1789195327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XARN275NSX7547scBYEyJ8UtV2onKi9DOJyaZQNGPoE=;
 b=D9xUqHXiV9LZg2vPLn0T3ugGbB8VJhSdOdvibOFSuL3DTDfxjYeJwUyk
 8GOYD0yux9t3aEh7qtKn9wHUJsocTkgCtobiOia3DSC/3J1g84s+i2Qrs
 OaidDKK8ufw0KiyOkCExq6VGK5l4mG9C2j5O6hih4vi+v8gCFniMItFZ0
 Hqa6Cem6bKZio++QWPYmCR2dkWBfp8oW/0YWWIMsHtM1zTrs6L6xJb1Kb
 5SSMfe2SYYwuOQkS1E1vl+vHmM8MLyIL0RtJjUDhe8gxV4oI7mxtS6J0c
 +RO+rXb5qf6I2sjskGty0Z1AIZcC8nHydONKX97guIskh5fffrAnALwRI Q==;
X-CSE-ConnectionGUID: dcALZROTTseNyP29tRoBIg==
X-CSE-MsgGUID: rCWBvmnNTZupI2s76VVoTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="63825755"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="63825755"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 23:42:07 -0700
X-CSE-ConnectionGUID: Oxn9V5DzSJCdg0k03flx9Q==
X-CSE-MsgGUID: r2bIIqZXTWCxU6X5CjMrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="177927638"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
 by orviesa003.jf.intel.com with ESMTP; 11 Sep 2025 23:42:00 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uwxTp-0000t2-2p;
 Fri, 12 Sep 2025 06:41:57 +0000
Date: Fri, 12 Sep 2025 14:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, dakr@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH] rust: pci: add PCI interrupt allocation and management
 support
Message-ID: <202509121404.668X5Vy6-lkp@intel.com>
References: <20250910035415.381753-1-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910035415.381753-1-joelagnelf@nvidia.com>
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

Hi Joel,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.17-rc5]
[cannot apply to next-20250911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-pci-add-PCI-interrupt-allocation-and-management-support/20250910-115528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250910035415.381753-1-joelagnelf%40nvidia.com
patch subject: [PATCH] rust: pci: add PCI interrupt allocation and management support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250912/202509121404.668X5Vy6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509121404.668X5Vy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509121404.668X5Vy6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `dev` in this scope
   --> rust/doctests_kernel_generated.rs:6968:13
   |
   6968 | let nvecs = dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
   |             ^^^ not found in this scope
--
>> error[E0433]: failed to resolve: use of undeclared type `IrqTypes`
   --> rust/doctests_kernel_generated.rs:6968:42
   |
   6968 | let nvecs = dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
   |                                          ^^^^^^^^ use of undeclared type `IrqTypes`
   |
   help: consider importing this struct
   |
   3    + use kernel::pci::IrqTypes;
   |
--
>> error[E0433]: failed to resolve: use of undeclared type `IrqTypes`
   --> rust/doctests_kernel_generated.rs:6971:16
   |
   6971 | let msi_only = IrqTypes::default()
   |                ^^^^^^^^ use of undeclared type `IrqTypes`
   |
   help: consider importing this struct
   |
   3    + use kernel::pci::IrqTypes;
   |
--
>> error[E0433]: failed to resolve: use of undeclared type `IrqType`
   --> rust/doctests_kernel_generated.rs:6972:11
   |
   6972 |     .with(IrqType::Msi)
   |           ^^^^^^^ use of undeclared type `IrqType`
   |
   help: consider importing this enum
   |
   3    + use kernel::pci::IrqType;
   |
--
>> error[E0433]: failed to resolve: use of undeclared type `IrqType`
   --> rust/doctests_kernel_generated.rs:6973:11
   |
   6973 |     .with(IrqType::MsiX);
   |           ^^^^^^^ use of undeclared type `IrqType`
   |
   help: consider importing this enum
   |
   3    + use kernel::pci::IrqType;
   |
--
>> error[E0425]: cannot find value `dev` in this scope
   --> rust/doctests_kernel_generated.rs:6974:13
   |
   6974 | let nvecs = dev.alloc_irq_vectors(4, 16, msi_only)?;
   |             ^^^ not found in this scope
--
>> error[E0433]: failed to resolve: use of undeclared type `IrqTypes`
   --> rust/doctests_kernel_generated.rs:7025:16
   |
   7025 | let msi_only = IrqTypes::default()
   |                ^^^^^^^^ use of undeclared type `IrqTypes`
   |
   help: consider importing this struct
   |
   3    + use kernel::pci::IrqTypes;
   |
--
>> error[E0433]: failed to resolve: use of undeclared type `IrqType`
   --> rust/doctests_kernel_generated.rs:7026:11
   |
   7026 |     .with(IrqType::Msi)
   |           ^^^^^^^ use of undeclared type `IrqType`
   |
   help: consider importing this enum
   |
   3    + use kernel::pci::IrqType;
   |
--
>> error[E0433]: failed to resolve: use of undeclared type `IrqType`
   --> rust/doctests_kernel_generated.rs:7027:11
   |
   7027 |     .with(IrqType::MsiX);
   |           ^^^^^^^ use of undeclared type `IrqType`
   |
   help: consider importing this enum
   |
   3    + use kernel::pci::IrqType;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
