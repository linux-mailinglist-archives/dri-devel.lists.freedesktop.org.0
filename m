Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09DC67F7E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 08:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE26610E2B8;
	Tue, 18 Nov 2025 07:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRzJUB9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D5110E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763451207; x=1794987207;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0WS1BTDZ3Hfusfq2hdC/CLWdTPFZSwQ+E+UU1AQOeJI=;
 b=NRzJUB9NTiqsE9Nq4hIqJ5oMp78htqhFr4z8r1hvjj0qc7wmExpi5vD1
 EJ+0t2+zKVDl+m7HpVS9/FhvHmlra7+uLH3+Qx+++Isn1E+ozbNzCUcQg
 MZDdIL/5CPrjZ3KCz7FRZCwcxHun+nlPY5CNOxInzNUddTSeNvX1OwpUl
 2a/r4dKQzbLJzV/Q+xDAc4mq8mVN9ovmg0GLFcTKRrsN9bTW1HkGyoGKv
 e8hSLLvgRcaqvJES0EKQFs80K9D8xroHMQbDeuHPp+4Rhi0Ak0f93NH1i
 JUYi7KG6UNSPImbfu3bpPG4cZ9Oy977C/zl88pO/0VY+rPHPhChk39dZv A==;
X-CSE-ConnectionGUID: uwpV+27/SliHI4UaGftEpg==
X-CSE-MsgGUID: 6lb1VpkNRQ+TZ55Nx1r4RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65495805"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65495805"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 23:33:27 -0800
X-CSE-ConnectionGUID: x14wzt89SgGwn7O7HTAVzA==
X-CSE-MsgGUID: yKm8Zj2eSrGiRyS5K2AJFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195817021"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 23:33:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 23:33:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 23:33:26 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 23:33:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbIvfyDePQ6Oe1yWkwEZXGXKWmHvE4IXDeqG+opfSieu+EahDsBi0aZpGiFiTIMM8fRofZLUZXpEdtvRE5gevp+HxdKQVxjYaKDt7Xji386XxPsA+Q76DrXdoAzE9w9NuA8tY6K0271tyS+f9M3Ym4EIu2tWllh1rKkcqmtth+qFaWMf+ZYtw1Q3WVSI7RjXRJVTAZvhEH5UlPyS7TSxUXo8f7bP5A5eY2kbmqYgd2M4s/9mD23vn/tABxcil7sB9VbaKbDUC6s1wpsPgguXZF+GjA3VRtsj0k/Zibxd/pm2GVxfkuaQGkGVBkGlPDy4p9K7o8JoqcsWw7bmjk3MDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WS1BTDZ3Hfusfq2hdC/CLWdTPFZSwQ+E+UU1AQOeJI=;
 b=lr4S8qMiF+Kz0BXAFFUXj3Nwt16Nc57NVhicaZ8lc+HyqFx++c3fzeQSMNU7ZKf72K179io/lYq8cSbKH1v5mieAnF3tjfqYnHU+n6u1L5jocMzlxioU9oYA4ORjn/nzp2sDX3p6aPmiZl0ApnZuBCwgejwKO0SSkhzh3jGFfC1FMT4DO3dZLbjhGYK5liWCkphGL05e4ae7/vP8EB/ilrdBCMTJXmS0xww8fYSkApqXcvqlw0G2p4Hs1c8frRR2yYrLJ3J+S0zXL7SjOuBC1pVASWwX72f5VABzo2PAw/cot+4Nsir+HrWfhy+DQwxeNdS11g/P6suxM+zuDHi2Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 07:33:23 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 07:33:23 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Ankit
 Agrawal" <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, "Shameer
 Kolothum" <skolothumtho@nvidia.com>, Alex Williamson <alex@shazbot.org>
CC: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>
Subject: RE: [PATCH v8 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Thread-Topic: [PATCH v8 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Thread-Index: AQHcUvHJUsSz328bbEaizAQHYSZo87T4ET6g
Date: Tue, 18 Nov 2025 07:33:23 +0000
Message-ID: <BN9PR11MB527610F3240E677BE9720C2B8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-10-fd9aa5df478f@nvidia.com>
In-Reply-To: <20251111-dmabuf-vfio-v8-10-fd9aa5df478f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV8PR11MB8770:EE_
x-ms-office365-filtering-correlation-id: 50071881-33e7-4885-54ad-08de2674c12d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?a2U5SXl3ZHNTL1F3RW5NS1lMQ3ZqZFNzUUlPak1OZnNKck0xYjkzdUpBTU02?=
 =?utf-8?B?TlF4SDc0ZHl5c054aEtRbWFra28zYmZjWnVwUGF6ZnRiUktZTlRQU01HamZx?=
 =?utf-8?B?cmkvVDVldnlLamszYWY5Mkw2bTczSnZZTnprdURXd0VHcnJMcmR2Z0RQd1VI?=
 =?utf-8?B?REJzejh6YnlYU2dBUSt1S2lQVGFqeWZKVDlaYTg5RG8xckFuWkw1VlYyV1Vl?=
 =?utf-8?B?T0FSdGU4amtNOWIxek1WLzQwcktuVGk3cDV0ZVhSVXRJK1FPNkRETmZuMGdI?=
 =?utf-8?B?cUY0aWVQQ0h3eWIvWXYxV3AxazRHdjZDRmdZTUYwWEppenQwdERRTk1PSnhz?=
 =?utf-8?B?QWt1dHJ3bjZlTVdhaE5GOWJ3eTE3S2J1QU9hMmZZTTVRK3VFWDFQNUxDZEFK?=
 =?utf-8?B?c0t6M2JLYlBsbnk3enNrSVVLb0VEZFlaaUt4bURWd3VZMDdBWldmMnBHd0lT?=
 =?utf-8?B?U0hJVW1oQWhNN3Fvb3gxVE85Q1lJOFBaN1pVWTdDK0JzamRxMlY5eDVvS0pl?=
 =?utf-8?B?MTIxNnNUeEw3NjlwT3RjekU2dFBDVWxoSXk1MGpiU0t5SUVrdGk4cjNVQTZh?=
 =?utf-8?B?MUhibUJkUFNEamYvVEREbFlDbFIyVzlQZlVHZmZjWlpNeTRpRzNxNGR1UWNm?=
 =?utf-8?B?cmlKYmloZHp3dWZjb3oyNkRrNzViWWg4SFE5YUZEWmRrd1BkYjJKZ2l2a25U?=
 =?utf-8?B?ODU5d0lVU3RKR0k0SlgrQThxQmE3OUo5OGUzaklTMEErS3NEK3B6Z3grOGNZ?=
 =?utf-8?B?Vi85Ym9OUFlvM1hYSUNIUFBkVmY4YXVLbU8veEt0MG5BZnRTcEprNmRVMHZ5?=
 =?utf-8?B?ZkkwVnJMK29QdnJxQ2NiZEJtb0FhaGJjZVpoSktwUjJsNjFsQzNuanl0dnFW?=
 =?utf-8?B?SDVsejF3VHRNZlA5emU1YWJjTzlyUS9KMzZYK1ozcTBPMFBMRlh6UFYzdXl3?=
 =?utf-8?B?cXlpTGRUdkVpNE1QT21NZmJCcWhVd0Z6ZWRSeGFidFM4dXlXTjVzTVh0a2pH?=
 =?utf-8?B?RmJneTZEdS82djMvOXNOckY4dW45aTJZSEpNL1VVZE9oU0ZoNkF1ejA2SERP?=
 =?utf-8?B?V2E2VGdKTGcvZDZXbzJSTHFUYWg2TlNkSW54TFlhdytva3dOWlVxTWtxSE9O?=
 =?utf-8?B?ZGRQOVpSNk9lNG9xTmxTczhEL1FEV0pyTXpzUGlWKzgycUh5c3dpbnlHalNK?=
 =?utf-8?B?bEo4Q3RIRlZVbjNzWkZ4Ny82Z1JGR09DZ0cyNnNxeEZIcFYrSEZ2dTE5K3Bp?=
 =?utf-8?B?dzE3RTZJcDRBWHdjS09XMzc0bGhsdm1WblplSDRwV3VhQ003TzU1TVZnWlJq?=
 =?utf-8?B?TUI4Y0U3M3lHdmZ1R3c0ZXdUUGxvcEREcUxtZWxISVZuazRnVmNDc3BFUS9l?=
 =?utf-8?B?ajl3N21VVmR0dGhLVktqVVljRHlISE9waUFPcG4xN1lONnI4OXkvcGFURGtL?=
 =?utf-8?B?aFNRQlRHR3A5dlNBVDZtVVJDQ0xaSHc2cVR3VWlDM0p5YjFsOVNRdGFkUWN2?=
 =?utf-8?B?UTRiU3E2LzRrcWZpcVdrcjgxb2NXTUJmNVl3U1JLdnpCemVGZTFNZG1sN1ly?=
 =?utf-8?B?RVd4VFRhV3hJUXg2ZjVuNFVTWlA0TUdROEJwMlU4SWlCRDZWMGlNaXZ4UnVS?=
 =?utf-8?B?bSszVGZoZ0VibUdOd1VrM0hpeDBFMGZjaUlYd0h1MGpXQVdEbmw5aWZkZ1B3?=
 =?utf-8?B?VVRVMHU2c3poRUIvajVBZzFPWnE0dENiNmEvUHFFVWgvdjBBOGJvSlZFeTVI?=
 =?utf-8?B?MThtYlpoR2cxcmkwT2plVGJwbkdZYWIyZ3paU3BDUFVINDV6M3ZWUTFvQzN5?=
 =?utf-8?B?WE9udGJpaHIyc0ZjMjlrYzV4Q2tyT0F2NDhKcWo3TjBRcVMwNjQ5QjlxYkJl?=
 =?utf-8?B?T3QwV2VxTVlBNWJlZE9LMU9wc1lXd1NpaU02SU91TG1NSlI1M3Q2QUtlOExK?=
 =?utf-8?B?Z1dVOUw3TUdJTWEvVndUekxLb2ZTNGtqL0k3UkVjZVZOelFVVVJTTWVsQVdI?=
 =?utf-8?B?NnNTb2M1bjZKbGxqUFJRM3REQnZNMGZtN0VZUXFpUzJvVjJpb3RGY1p2S25V?=
 =?utf-8?B?VGRJS3huc2ZLRE1sb3J2Q3hzVjhSS2RTZkUzUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGZmRW84UHFHSDM4K1BsNGNzTjNad1c1Y05IOWx6TERxclVMc09BVDRYellV?=
 =?utf-8?B?dU9QcFIrQ2VLNU1vWGlqajc5TjRGSkJFVzZlOThkRnFYdGVnMFdlZXBJSjd2?=
 =?utf-8?B?a01HMTFobmpITi83SzAxZmxxNng5cGppYjA3dWE3WDJIdkRtYkliWlA2VGFX?=
 =?utf-8?B?MmpKcVhYZUZlV3pWSDRuR1JMZGNBYmZzOThwQUpvL2J2M0xSbmY2cG13dmVt?=
 =?utf-8?B?VnJCQUZJRHlUa1J5dnRLcVowOVU5UHRDOUVKWWh2WDl5T0ppUDAvNTU2alBX?=
 =?utf-8?B?Y1FEWjF3SldLdTBNb3JKOUV4cDBoSGpXS3VwcGpZMUVzaTFsYXNNUm11RzNo?=
 =?utf-8?B?Rk1jaVozcXZzMzl1cDNqQ0xXTGN1QUs2ZnNPNlBqRFJuN3pGTlJxWnBCcnA4?=
 =?utf-8?B?cHdBMFBJODUxTDFNOXBBekJrcnNzNlZzNkd1c3ZKWWhqM2tzSGFBZjRwcnBF?=
 =?utf-8?B?WnY5WG5RMyt3TXk5Z2xRUTJYMmE3L3J4SVYyV2grdXNpL3RpMnNaYUlWRzMx?=
 =?utf-8?B?WlUxMFdxSlIxbGkzVEwwdEs2NUVxMFhqSEVtUTR4TEE2S2JnQzZTVm9mVE10?=
 =?utf-8?B?SnFqVHd1WE5uMWsveWRyd2dlZ203V3NLMEUwR3R2Q1NhcTB5cks5dzJRdmFI?=
 =?utf-8?B?WGZrQ0dOUEFLZ1J0dG84QUZScFc4UERTS1dmM2JDSWRZVzE1d3d2L2dHcWhI?=
 =?utf-8?B?QlU5Y3grVG50aTdEV3QxMGxHV1NXWmloYTZPTmRJS2wxbkg1SjV0UEJ0L1h1?=
 =?utf-8?B?NzJFQjNGNjQrNDVEdGVodlQyNE9CUEpCa3VwenBUZll0QjRoYjc3TTc2bXpX?=
 =?utf-8?B?MWlsdW5SZXh6cWxNQkVUTVBjck91UWdzR0c2Wmc3ZHdyNlcvOTB6S3Y4WWlG?=
 =?utf-8?B?RFpnUG02K3UzdnZNclhuK1ZZZktkUlF1SS9ITk1FZFJhSXVoQUcvc3ZSUnRp?=
 =?utf-8?B?cXgrTm5sS0dCNDhJSXZxMVplRkxLOW43T0RLNVdyTFhnRkRleWhJem55TFFE?=
 =?utf-8?B?bWVPNE5tR2hLenJHUTByOTZEMGtBdVY5cm5EaWd5WWsxUEFuS0R1QnpoVVNs?=
 =?utf-8?B?QW0reVRDdktzb1BJeTlNRUFQdEdkbnVHYXQwR3c4cCszdHpPWGN4bmJ0b29i?=
 =?utf-8?B?OXdUTHZXZFNCVFIyUGJDVEhkelVZV3FzRmZoejU1WXRWUUVNcHcxYnB4K2JH?=
 =?utf-8?B?QXR0eCs0MWlzUjN0MW5PZzZWaUd2dVFrYWhFRU5TRE9jWVJMMmwxWHNBMlBw?=
 =?utf-8?B?Y1RlOE1rQW1QMVpDdm9Mb3llRXpmN0Nvem9wdndLTDBPYmlXYUlEWjhkZXVu?=
 =?utf-8?B?TWFOcDlPUkc5eHZtajk1SlBCUVVJdG95ekJaTEUxUXNrckJ4YkhBWXVvZmdN?=
 =?utf-8?B?U1NsSFlCd0djUU5xampmZzhXVWFzSXZJY2FJbmh0L1Bndm05SExDeGJPT1V2?=
 =?utf-8?B?YUp3TXdrcnVTUTBxbnlWVHpsazNmSFBNTlJ3bVpjcFJMSk5idFY1ak5NcUUw?=
 =?utf-8?B?dEZ3VzFubkRxa3QzM0d4aDBmZnJHa2RUQnVmQW5nMFRWUkRwcXNyK1ZuNExt?=
 =?utf-8?B?dDZ4YWIvNW02WnJReUlXL09xMWtRdG5oT0Q5VmRHekszRm5KVG9qU1ZqVytu?=
 =?utf-8?B?WmdKZmhzbUdtb3VnZGQ3a3hGcDNSejZYbnlra3pGa0tPcnN0R1A0MjZXNzEx?=
 =?utf-8?B?Q0JuQWhBcFRrbjJ4dnhlNWlObW1qRzFQVDVZNTZLVmdoZE8zQzBiSU9VTkpH?=
 =?utf-8?B?SHBUM0VqOTc3dU05U0k2MWNpbUJ6Tm4xZmpCQ3ZsYkNIRlQySldMNVNIWTR2?=
 =?utf-8?B?QWFUcDN5SCt5RnJlOFp1RjJuRzhWNXEyNWI1NWZ1MDBna3dzUjdWNTVCcC90?=
 =?utf-8?B?N1E3cXdhM1k2MytlS25pSzFpQTRkSjBoOU9xUyt5RUZUbmVQSE4rYmppSmVT?=
 =?utf-8?B?TDFYNTgzUW92aWhJcUFZWi9aaTk3aXZhbk9BYTl5ck5BcWhCcHFlZWpMakt4?=
 =?utf-8?B?dlFsSjlTSFRpZ0hZT0J6TlM2S2cyMCtQSUhUeEZOb1FPYTA5a0h1WktndzBX?=
 =?utf-8?B?RWlEUnAxdVdRN2pvV1hJWER5Q08xNGsvQ08xUkJJVzJxVit3c1IzQUFEQlVK?=
 =?utf-8?Q?Cb1W24uXosGRCqbc/iPCDY6R+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50071881-33e7-4885-54ad-08de2674c12d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 07:33:23.1810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9X3ljzRVdG7uFhK62RH4z08THvlkHKqkG18cCN14v6nWylvs52OpKveDmJf8KgHxG/t3HUGQAYoIVRJvJUWRFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
X-OriginatorOrg: intel.com
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

PiBGcm9tOiBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2Rh
eSwgTm92ZW1iZXIgMTEsIDIwMjUgNTo1OCBQTQ0KPiANCj4gLQkJaWYgKCFuZXdfbWVtKQ0KPiAr
CQlpZiAoIW5ld19tZW0pIHsNCj4gIAkJCXZmaW9fcGNpX3phcF9hbmRfZG93bl93cml0ZV9tZW1v
cnlfbG9jayh2ZGV2KTsNCj4gLQkJZWxzZQ0KPiArCQkJdmZpb19wY2lfZG1hX2J1Zl9tb3ZlKHZk
ZXYsIHRydWUpOw0KPiArCQl9IGVsc2Ugew0KPiAgCQkJZG93bl93cml0ZSgmdmRldi0+bWVtb3J5
X2xvY2spOw0KPiArCQl9DQoNCnNob3VsZG4ndCB3ZSBub3RpZnkgbW92ZSBiZWZvcmUgemFwcGlu
ZyB0aGUgYmFycz8gb3RoZXJ3aXNlIHRoZXJlIGlzDQpzdGlsbCBhIHNtYWxsIHdpbmRvdyBpbiBi
ZXR3ZWVuIHdoZXJlIHRoZSBleHBvcnRlciBhbHJlYWR5IGhhcyB0aGUNCm1hcHBpbmcgY2xlYXJl
ZCB3aGlsZSB0aGUgaW1wb3J0ZXIgc3RpbGwga2VlcHMgaXQuLi4NCg0KPiArc3RhdGljIHZvaWQg
dmZpb19wY2lfZG1hX2J1Zl9yZWxlYXNlKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpDQo+ICt7DQo+
ICsJc3RydWN0IHZmaW9fcGNpX2RtYV9idWYgKnByaXYgPSBkbWFidWYtPnByaXY7DQo+ICsNCj4g
KwkvKg0KPiArCSAqIEVpdGhlciB0aGlzIG9yIHZmaW9fcGNpX2RtYV9idWZfY2xlYW51cCgpIHdp
bGwgcmVtb3ZlIGZyb20gdGhlIGxpc3QuDQo+ICsJICogVGhlIHJlZmNvdW50IHByZXZlbnRzIGJv
dGguDQoNCndoaWNoIHJlZmNvdW50PyBJIHRob3VnaHQgaXQncyB2ZGV2LT5tZW1vcnlfbG9jayBw
cmV2ZW50aW5nIHRoZSByYWNlLi4uDQoNCj4gKwkgKi8NCj4gKwlpZiAocHJpdi0+dmRldikgew0K
PiArCQlkb3duX3dyaXRlKCZwcml2LT52ZGV2LT5tZW1vcnlfbG9jayk7DQo+ICsJCWxpc3RfZGVs
X2luaXQoJnByaXYtPmRtYWJ1ZnNfZWxtKTsNCj4gKwkJdXBfd3JpdGUoJnByaXYtPnZkZXYtPm1l
bW9yeV9sb2NrKTsNCj4gKwkJdmZpb19kZXZpY2VfcHV0X3JlZ2lzdHJhdGlvbigmcHJpdi0+dmRl
di0+dmRldik7DQo+ICsJfQ0KPiArCWtmcmVlKHByaXYtPnBoeXNfdmVjKTsNCj4gKwlrZnJlZShw
cml2KTsNCj4gK30NCg0KWy4uLl0NCg0KPiAraW50IHZmaW9fcGNpX2NvcmVfZmlsbF9waHlzX3Zl
YyhzdHJ1Y3QgZG1hX2J1Zl9waHlzX3ZlYyAqcGh5c192ZWMsDQo+ICsJCQkJc3RydWN0IHZmaW9f
cmVnaW9uX2RtYV9yYW5nZSAqZG1hX3JhbmdlcywNCj4gKwkJCQlzaXplX3QgbnJfcmFuZ2VzLCBw
aHlzX2FkZHJfdCBzdGFydCwNCj4gKwkJCQlwaHlzX2FkZHJfdCBsZW4pDQo+ICt7DQo+ICsJcGh5
c19hZGRyX3QgbWF4X2FkZHI7DQo+ICsJdW5zaWduZWQgaW50IGk7DQo+ICsNCj4gKwltYXhfYWRk
ciA9IHN0YXJ0ICsgbGVuOw0KPiArCWZvciAoaSA9IDA7IGkgPCBucl9yYW5nZXM7IGkrKykgew0K
PiArCQlwaHlzX2FkZHJfdCBlbmQ7DQo+ICsNCj4gKwkJaWYgKCFkbWFfcmFuZ2VzW2ldLmxlbmd0
aCkNCj4gKwkJCXJldHVybiAtRUlOVkFMOw0KDQpMb29rcyByZWR1bmRhbnQgYXMgdGhlcmUgaXMg
YWxyZWFkeSBhIGNoZWNrIGluIHZhbGlkYXRlX2RtYWJ1Zl9pbnB1dCgpLg0KDQo+ICsNCj4gK2lu
dCB2ZmlvX3BjaV9jb3JlX2ZlYXR1cmVfZG1hX2J1ZihzdHJ1Y3QgdmZpb19wY2lfY29yZV9kZXZp
Y2UgKnZkZXYsIHUzMg0KPiBmbGFncywNCj4gKwkJCQkgIHN0cnVjdCB2ZmlvX2RldmljZV9mZWF0
dXJlX2RtYV9idWYgX191c2VyDQo+ICphcmcsDQo+ICsJCQkJICBzaXplX3QgYXJnc3opDQo+ICt7
DQo+ICsJc3RydWN0IHZmaW9fZGV2aWNlX2ZlYXR1cmVfZG1hX2J1ZiBnZXRfZG1hX2J1ZiA9IHt9
Ow0KPiArCXN0cnVjdCB2ZmlvX3JlZ2lvbl9kbWFfcmFuZ2UgKmRtYV9yYW5nZXM7DQo+ICsJREVG
SU5FX0RNQV9CVUZfRVhQT1JUX0lORk8oZXhwX2luZm8pOw0KPiArCXN0cnVjdCB2ZmlvX3BjaV9k
bWFfYnVmICpwcml2Ow0KPiArCXNpemVfdCBsZW5ndGg7DQo+ICsJaW50IHJldDsNCj4gKw0KPiAr
CWlmICghdmRldi0+cGNpX29wcyB8fCAhdmRldi0+cGNpX29wcy0+Z2V0X2RtYWJ1Zl9waHlzKQ0K
PiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ICsNCj4gKwlyZXQgPSB2ZmlvX2NoZWNrX2ZlYXR1
cmUoZmxhZ3MsIGFyZ3N6LCBWRklPX0RFVklDRV9GRUFUVVJFX0dFVCwNCj4gKwkJCQkgc2l6ZW9m
KGdldF9kbWFfYnVmKSk7DQo+ICsJaWYgKHJldCAhPSAxKQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiAr
DQo+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZnZXRfZG1hX2J1ZiwgYXJnLCBzaXplb2YoZ2V0X2Rt
YV9idWYpKSkNCj4gKwkJcmV0dXJuIC1FRkFVTFQ7DQo+ICsNCj4gKwlpZiAoIWdldF9kbWFfYnVm
Lm5yX3JhbmdlcyB8fCBnZXRfZG1hX2J1Zi5mbGFncykNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQoN
CnVua25vd24gZmxhZyBiaXRzIGdldCAtRU9QTk9UU1VQUC4NCg0KPiArDQo+ICt2b2lkIHZmaW9f
cGNpX2RtYV9idWZfY2xlYW51cChzdHJ1Y3QgdmZpb19wY2lfY29yZV9kZXZpY2UgKnZkZXYpDQo+
ICt7DQo+ICsJc3RydWN0IHZmaW9fcGNpX2RtYV9idWYgKnByaXY7DQo+ICsJc3RydWN0IHZmaW9f
cGNpX2RtYV9idWYgKnRtcDsNCj4gKw0KPiArCWRvd25fd3JpdGUoJnZkZXYtPm1lbW9yeV9sb2Nr
KTsNCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocHJpdiwgdG1wLCAmdmRldi0+ZG1hYnVm
cywgZG1hYnVmc19lbG0pDQo+IHsNCj4gKwkJaWYgKCFnZXRfZmlsZV9hY3RpdmUoJnByaXYtPmRt
YWJ1Zi0+ZmlsZSkpDQo+ICsJCQljb250aW51ZTsNCj4gKw0KPiArCQlkbWFfcmVzdl9sb2NrKHBy
aXYtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7DQo+ICsJCWxpc3RfZGVsX2luaXQoJnByaXYtPmRtYWJ1
ZnNfZWxtKTsNCj4gKwkJcHJpdi0+dmRldiA9IE5VTEw7DQo+ICsJCXByaXYtPnJldm9rZWQgPSB0
cnVlOw0KPiArCQlkbWFfYnVmX21vdmVfbm90aWZ5KHByaXYtPmRtYWJ1Zik7DQo+ICsJCWRtYV9y
ZXN2X3VubG9jayhwcml2LT5kbWFidWYtPnJlc3YpOw0KPiArCQl2ZmlvX2RldmljZV9wdXRfcmVn
aXN0cmF0aW9uKCZ2ZGV2LT52ZGV2KTsNCj4gKwkJZnB1dChwcml2LT5kbWFidWYtPmZpbGUpOw0K
DQpkbWFfYnVmX3B1dChwcml2LT5kbWFidWYpLCBjb25zaXN0ZW50IHdpdGggb3RoZXIgcGxhY2Vz
Lg0KDQo+ICsvKioNCj4gKyAqIFVwb24gVkZJT19ERVZJQ0VfRkVBVFVSRV9HRVQgY3JlYXRlIGEg
ZG1hX2J1ZiBmZCBmb3IgdGhlDQo+ICsgKiByZWdpb25zIHNlbGVjdGVkLg0KDQpzL3JlZ2lvbnMv
cmVnaW9uLw0KDQo+ICsgKg0KPiArICogb3Blbl9mbGFncyBhcmUgdGhlIHR5cGljYWwgZmxhZ3Mg
cGFzc2VkIHRvIG9wZW4oMiksIGVnIE9fUkRXUiwNCj4gT19DTE9FWEVDLA0KPiArICogZXRjLiBv
ZmZzZXQvbGVuZ3RoIHNwZWNpZnkgYSBzbGljZSBvZiB0aGUgcmVnaW9uIHRvIGNyZWF0ZSB0aGUg
ZG1hYnVmIGZyb20uDQo+ICsgKiBucl9yYW5nZXMgaXMgdGhlIHRvdGFsIG51bWJlciBvZiAoUDJQ
IERNQSkgcmFuZ2VzIHRoYXQgY29tcHJpc2UgdGhlDQo+IGRtYWJ1Zi4NCj4gKyAqDQo+ICsgKiBm
bGFncyBzaG91bGQgYmUgMC4NCj4gKyAqDQo+ICsgKiBSZXR1cm46IFRoZSBmZCBudW1iZXIgb24g
c3VjY2VzcywgLTEgYW5kIGVycm5vIGlzIHNldCBvbiBmYWlsdXJlLg0KPiArICovDQo+ICsjZGVm
aW5lIFZGSU9fREVWSUNFX0ZFQVRVUkVfRE1BX0JVRiAxMQ0KPiArDQo+ICtzdHJ1Y3QgdmZpb19y
ZWdpb25fZG1hX3JhbmdlIHsNCj4gKwlfX3U2NCBvZmZzZXQ7DQo+ICsJX191NjQgbGVuZ3RoOw0K
PiArfTsNCj4gKw0KPiArc3RydWN0IHZmaW9fZGV2aWNlX2ZlYXR1cmVfZG1hX2J1ZiB7DQo+ICsJ
X191MzIJcmVnaW9uX2luZGV4Ow0KPiArCV9fdTMyCW9wZW5fZmxhZ3M7DQo+ICsJX191MzIgICBm
bGFnczsNCg0KVXN1YWxseSB0aGUgJ2ZsYWdzJyBmaWVsZCBpcyBwdXQgaW4gdGhlIHN0YXJ0IChm
b2xsb3dpbmcgYXJnc3ogaWYgZXhpc3RpbmcpLg0KDQpObyBiaWcgaXNzdWVzLCBzbzoNCg0KUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K
