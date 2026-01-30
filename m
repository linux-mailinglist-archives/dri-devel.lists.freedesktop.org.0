Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMvPEpwhfGmgKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:12:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91508B6BD7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C64F10E8E2;
	Fri, 30 Jan 2026 03:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBYEPU8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C87B10E8E1;
 Fri, 30 Jan 2026 03:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769742744; x=1801278744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JBqJly10XaHNVl40Hfus1NlrAtzO5IdKTnQOpFMXAQU=;
 b=HBYEPU8NVPMbBu5cGLpDz9h77a/H8B2ushAB6to6ZeDi41/NUDZoqJM/
 3CjGkdCfQbCIMnJnQQ+HDZrJZHIGsKMDE1H5mLiFgV0TnzcB0bSDntQs8
 bfKf7OFKdTb46iOJI4t8zNG4q5DLM5/+togPs+oiY3zWuiTudQVRRCTxK
 xDbJ+unc30aeNgXD/z+3qrxponUdYL0QCQqh3YLTVzHfEVSNznCkJ+yQM
 5imlPOpSJuFwAVX7/oLP8azF/ggUYaH11PdlmGqVYVGIMXbxLQ8v5TVYc
 cKe3eefZMITvH6DCqYM+IRWU8hMh44YxRYdnmadVSbUg8+5l46HAMCR8v A==;
X-CSE-ConnectionGUID: Ys74WzwxTca4lyyEUlEV0A==
X-CSE-MsgGUID: +N9doUPdTpu+nkz4jvLNSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81307995"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81307995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 19:12:20 -0800
X-CSE-ConnectionGUID: WpaLwd/NTQmEARMz0DIV/A==
X-CSE-MsgGUID: /UdNa0yGT+OdYPh7yOyXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="212825576"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 19:12:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 19:12:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 19:12:10 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 19:12:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnQUQL1lsoSbdUG//2PzV4kMRDseUDz2g6daCkUasfKGe/KoOKe8CjBuyym92Y6OCONjf+UGfxgLpDuSB+fQZ0OOI+NR0wRlmPUh0VV9sEJgwPfTguXGJP6ZZClSi4Mz0S1LweQvGgAuT85UgguOHcMt9zcnxwl+hq+jR+Lupn7GUFMMNg7A5jXY2ieXIFmZWrxMqzG6BrU3hhSK3s5URH3DDqqJNEtu37tEuCCEd6Wqd485JToSoqDVU/b66meq7JLsIXePaVHjqewEY0x3FXiDKUSPvKwxJ6aTerdo++PuWorpvu5blLfNNfUMmDyFeFQjW7nohM5t0/JNAt1qKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBqJly10XaHNVl40Hfus1NlrAtzO5IdKTnQOpFMXAQU=;
 b=xF4peH4dihrKT2+hsffdPbNmWcCDLgBuXEzhPnwv4RkwVkC/t2lyQVCRwAOZOOuknP2R8Jo157m3uDoK566C6p+IR2H/y3XOoYM2jCzMywedKwnwAgFvASP+gYFg9HsCrBwi+uhyPjL6qUtE3zHqofcZAkg+9y6gMNcoDHCpObix6IH+gmG/Ov5jWp9vfjlJqTFgzU7BclZdmgZTewWKovFsMepvneMO1k3a6zqDi0496z8lQUY5g8SBJOIHCl0JB8XW5tvCjUrhcuHQKZSPVbORail0y0PG8ur6Hgc0qyICMR93X1cP1NfNPaqGcyoM23LPb58srScGYZy3S4crqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB9537.namprd11.prod.outlook.com (2603:10b6:408:378::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 03:12:03 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 03:12:03 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Leon Romanovsky <leon@kernel.org>, Pranjal Shrivastava <praan@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann
 <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Williamson" <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Thread-Topic: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Thread-Index: AQHcjWW44cZHc/LC3Ey07jDLODM/2bVk8PuAgADKdoCAAH2KAIAChYWggACGQ4CAAMxq4A==
Date: Fri, 30 Jan 2026 03:12:02 +0000
Message-ID: <BN9PR11MB5276907FC927424043C636E68C9FA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com> <20260127085835.GQ13967@unreal>
 <20260127162754.GH1641016@ziepe.ca>
 <BN9PR11MB5276B99D4E8C6496B0C447888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260129145851.GE2307128@ziepe.ca>
In-Reply-To: <20260129145851.GE2307128@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV2PR11MB9537:EE_
x-ms-office365-filtering-correlation-id: be884d30-1167-48f6-1273-08de5fad5734
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bUJydWN4UEdBN1QrMEI0dDBqcUZ0Um1qTEhPZDBuQ2xFNFZ3QkNBL2VCY1NI?=
 =?utf-8?B?clVMWUxlL203TFhUN3VHV1pvVG5DTkpQY3R1c0pzQ0VsWlN5RVY5UU1mSmow?=
 =?utf-8?B?ZEZRb0FIeW9ZYytCQkhOY1F5d2tkVmpLMVRrSUZqTnNEZEY5WS9oUTJFTDNt?=
 =?utf-8?B?RGlBQ05FaDRHS0g0b2NJQ0d2cEdYT3RTM3M3cFhsM1I1d2pLTUxJbmhyY3Mv?=
 =?utf-8?B?NGd0MG03MjRFNnFHMEZZUjNJVGw3K3YxOUVtMzk0ellGTG0wYnh5TTR2ajVF?=
 =?utf-8?B?OTZYcjZ1M3VhRlpXZjRoaTMyRTRSZjRybXBSZ2RybzF0cldHNFRhb29INFBx?=
 =?utf-8?B?WjFZMnJEQUhiQ1dzL3ZLeS9NeTZ0ek54dk4ycENNWDV4S1JZZ054aFlJdGtP?=
 =?utf-8?B?eTM5ZTNVWTNKaENkN2tMSm81aWxTTWhYZEJmRmF0UUREZDBROGRXNHVyazRY?=
 =?utf-8?B?eFdNdUNpd0lhR3ZUT29hZnVMRHFhUkhMWDB2VmQvcGdVbzdsMFpVTkRtQXJH?=
 =?utf-8?B?MHAxcGNtL3BRbVByV1NhWmVRLzdzQlZzVHVTMG5GNVpPNjhabU8rSzQ0Qm00?=
 =?utf-8?B?bmRJekJhMndNdi9tVXg4OEc2SUpOQndBMVZqVmwxZlJFK1VjRnJCckVTQ1JJ?=
 =?utf-8?B?SHBjZTJZOFFRS3RWOVZ4QlNQMmptaVptQlFWdGZkSlRETUZmcVYvT1RqTXdV?=
 =?utf-8?B?NWkwL3ZjRnpaNkhaYzkyNkZFREJpYXZiWSs5Q1BlMnhzOU1objdOOFhMSXU0?=
 =?utf-8?B?UHRVRWI1b1F5dWkrdUxxYTAxRDJvY2xEZUhvTkx2ZkpJN1U5SjJHcm9WVVJF?=
 =?utf-8?B?WTdFZFBIVDhHa0FVNjZHTlM3YmhVa1ZpSTUwYVlXSnU0d0RiT2FYdU00bkFG?=
 =?utf-8?B?T3ViVENjSGlKcWdGL2xKTmpEOWk2Q0l4c1ArRWt2REhyR21SSHJCNEFlWjRR?=
 =?utf-8?B?blNMQ3J4ZTN5bGJkb2JRMU5SSFpBazZJa3B2bzQvUVY0eXBOdjVMcVZGSGZU?=
 =?utf-8?B?c1ZUaEtuckZIODZmVExSd0hiZ2hVWlNQNGpFdE5WSjB5dEIvaGZESzJXYjhG?=
 =?utf-8?B?NnlyY05hVkJVYXZabTlwWHc2WjhlakQrSERqa2pKd0R0UkovV1ZJRkpDaW9S?=
 =?utf-8?B?WkwyWUxaVjBFRjdaSi9UQ3VlVGRSKzRGUkdndGpwVmVHWXF4ejJ1MVQvamZ6?=
 =?utf-8?B?TER4M0FxcE9sWTlSaUtSUEFJc2ZiM3dCZ21SY0x5V2d3ZU84VHlGWkE3R0FJ?=
 =?utf-8?B?cnJFdlFjYXN0czFVbDg0V2F1YXBhZWR3ajJzdGNiS2JvVHJHQnhycEtIMHBu?=
 =?utf-8?B?OE5qQXplK2ZaQzltTSszaUVNSkgwV2U5QnU3TEp5akxwR2huNTYrV2N1OXZQ?=
 =?utf-8?B?dldXMUVtSXA2cW5pbjNhZDF2cE44SUJlOGRPREI1bWJRQU9xdVZHQzNUOXFI?=
 =?utf-8?B?SVovVW9iWmRRUVF2T3o3RS9qT0FYdmFVWit5ZDBKT3dWY3Q2OExaUWRjZDJM?=
 =?utf-8?B?U2d0Y01iTnordnpiRHNGVUNGN1pvbkwrSmlqcHFwWTRXRGFWNTNUa2dUTUUr?=
 =?utf-8?B?UnZEc0hPalQrem1LMHFmNHVlWFVVaFpyM1Ayd3MyaWJaaDJ6ZHpHanFrSUNm?=
 =?utf-8?B?ZDNhTWxOS01DMlNBNm0yWTJRNXBHL1IxZ1daTzNYNW1QWE01aUp2VTVEQlBL?=
 =?utf-8?B?Umg0WTR5M1U4ZHdzZFBXUWgyTGE5YVUrWVYyTjJKNmNaaVY2M2FmMkNFZjFP?=
 =?utf-8?B?YTROWUQrazUxK0MvZ242aHhkSVJsUWt4MGd3aHloamlkaitQTk9CbzFwbTZa?=
 =?utf-8?B?TVJzWktlbTVmVjM5bzdzWEZ4RHhRTmp0NUJsUlhMUlZabVNQaTNYZVFWQlpV?=
 =?utf-8?B?MisraysybS8xNExWQWtRUlQvTHVabDZYNjdlQkoybVBnaU1sSzkxRHcraUty?=
 =?utf-8?B?dDdKOVR3TEF0aG5qZit0Y3k3Q3JValNsN2xnWnBZTW1ISXpLV1FtUkV4M1Iv?=
 =?utf-8?B?eUgwMHJRUFVGZ2wwZnB5MFZwL0RvRHBKdXJBTmpXMXhBN2VQOFB3dHVFUDhi?=
 =?utf-8?B?b0NKQTBFdVFqMFdSdGR3TGcxUlZ4bkM4L0ZOSU5aN0dJd2l3OFgwSFhTemxH?=
 =?utf-8?B?MGRzNzZGUVRuRXZkZUtYOHdSSUIvdHRUZHE1QUd1blA2S2RDd0pWOU1LSnEv?=
 =?utf-8?Q?YNvIoesUoxvrINfBxyM3Zgg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjBET202TlpCUnM0MkdpRGNDSFZTWEVDVkdyVzJBNnhxTUJ6T0Q3SEp2aUx1?=
 =?utf-8?B?U0hqYlRCN09CQzgxYk8wdFVwNWVMb0oxTi80RmRWTEhRbDFKMlBWU0loTUZR?=
 =?utf-8?B?VXZFWlRPRWtNdlFPc3M5OWdRUTJDZDdnVGRjZHdOVXNvK0wzNUVWQ2xIL1Iy?=
 =?utf-8?B?elg3RFc0a0RnUXZtNEZWcWdlU3Bia253VzVsQlAzVUQ1cElLL0RWTHRlQnoz?=
 =?utf-8?B?MHhJbUhEdkdZUnEzMFFmNjNkSmsrbmRmZnJXaUIwMlhyRXd6RVRXSEtiYTVq?=
 =?utf-8?B?YitIbTRKMDVBY050emRaTS8reTByY2cyQXpqZnh5cGN5c3d5amkrWmdoYVlE?=
 =?utf-8?B?dTRBREtIUlN4WlM0VkV3cTFDQTJPdE1BRStNL01MREJJMUw2dTZxSXB0VXRm?=
 =?utf-8?B?ZHdNRk4xN2lzdE9Pb29sZWlwbGlucWpJN0FvbUpFVUg0T05rUTlpS0kwa2l6?=
 =?utf-8?B?OWloMDJEOGkvWW80L1RUdnBURzZDMWpGVEE1dGdMZzJYNk8vOHQrNzBUTWZm?=
 =?utf-8?B?NjJkdHpIalNBcTlRenJhd1YwR29iR3VBaUVxcCsyYk8wT0Q0eVFScThMaVRn?=
 =?utf-8?B?eWt6QWtKSS9sQytIWlFNaGJ3bTBPelpnY1NSaThGSmNCNVFuYTZMalZQZmw5?=
 =?utf-8?B?ZE9ZRVlJUm5zdzF0bW1wVys2UWl0WTVSSE5EMmNuaTcxUkRFUWdLVjNXQitk?=
 =?utf-8?B?dFZhbVZGNGJxRm9jaFVjTVEwOURrUWwyeUs3dzlUNFFEVG5lS1BQWDIvUUlO?=
 =?utf-8?B?Z3NNeWQxNy9jK2NMMHJYQ1c5T2R5RkttQlltSHIvM0VsbkRJWWlBU2ZiMTRt?=
 =?utf-8?B?S0NPMnQ4T3lrUDJ0azNudFVaUTNvb2tET0JMZHdjM3FJSzJuVVBtMlRJWWQx?=
 =?utf-8?B?ZWo0RlBWcGFmMVVNeUdlaGhoTkMzQW1oUzNPaE1zVUpXaGRYdUduT1cydWhL?=
 =?utf-8?B?dkdlREU5T0p3a09YSnh3eXM5R1JOUDBtUXdvb2doSldDUkhmT0Z1aDErUzhr?=
 =?utf-8?B?ZDlrelFSRVZQR3dtWXRlSFJJUzVFWm94Z1MyeEJqS05veWl2L25LUFRLSGlH?=
 =?utf-8?B?UStJcEk0UHd2cnlxWkgwM2RwQWV6RWNFT0k5akVPRStJY0VKeDZDL3JHTHNU?=
 =?utf-8?B?aWhPbktuSFNCT2ltRnBZNkZDOU16N1NYamN1Sm1aKzV5WjFiY0J4T1JkRHpI?=
 =?utf-8?B?VTBPVG1wRFBrQWhUMXUxTUFYQzl5RVlLZ0YwT2ZqcU5uNEdpVHpramVuZFVv?=
 =?utf-8?B?Vi9JNDF3Z1JkQWJkWUZRUEQwbTlicS9Tc0pCM2pJZUpRQWtQUVpQVWRxTzFw?=
 =?utf-8?B?TFd1bDJjNXFxTGxPbEpENSsxcmttOGRvMVY2VkVVVCsrQjg3c1NZVkNTdmVM?=
 =?utf-8?B?OVdKNS91OHFTek0ybGtONVEwSzVBTUI2U3Frcy9MRjNlOEZhZjZJbGQ2alVz?=
 =?utf-8?B?a0syNnlpak9oY2lLMEZWRzhlaXhkWXlIQm1nOU93SXV6V1N6TXlZM0NYQ0lo?=
 =?utf-8?B?YjlhaUJ1QTAxMXdKVFlSK08vY2FtMmladlNKR3lmbXRWR2MzWVNrME1VbWQ4?=
 =?utf-8?B?bzNuaU8xRm1lR2ZwZjhwUzBPcytPMFZYQVRPeVA0UEJoZ0JMS2hGaEpYVlpZ?=
 =?utf-8?B?WmVDdFJvSTNtenVOUTRWbnVrbU1mQ21kcHJBbUE1MG94TFZwVEdBdUk2MlZz?=
 =?utf-8?B?RWZ6RnAwQ25SZEl2OEtwQnFhVEowUHZjdENmakE5eG9TMXdkaFhPTUZVb0do?=
 =?utf-8?B?dFB6eElCOXZSbGNCQ1VUNCtpM2dnalRDdngrc29JMWFiZXJnS1UrSitrNjU2?=
 =?utf-8?B?T0pseGRuQmFhSDVkbnEzVEdLVU9PSldYQU1ZcUl1RUhMU2E5RThSRC9wYmlC?=
 =?utf-8?B?ZSthQnR2SnVYTzl3dy81OWhDaVdZNWUvUmk3azNyYk5rWjJsaG9KM2xUVU5L?=
 =?utf-8?B?YXAxV2JoN2RwcFZSNTJ1bjIxMFptUlpyVlZMZ3lPOEpvbTRkL3RJY3BaRWxM?=
 =?utf-8?B?OU5FZGI3OUJlL0NUQmZvUjhoQjU4VFJ2bUxzanZGWU0xaU1wdWpvZmdCeUdm?=
 =?utf-8?B?VjltQ3hLWWJNN0FzQ3NuaDVJTHhvcDVOTkMrVUZjS1UrMUsxZ1JOZFgzS2E0?=
 =?utf-8?B?Njh4VEtCK085QVlMY1kxLzF0RGxZdWxTRFpmUTR1T0pLVk44Y1phU24xNjJG?=
 =?utf-8?B?bWVVenRRbkhIbW1xWEI5eW9HUXBSalRKR2ZzeW1TN1pQcUJQblEzWGUvOHBT?=
 =?utf-8?B?Q1BuaUEvL3J0WGpMMDVKMFhQdEpKVk5pSnErM1NNcitHaUlNeTVlZ3dTQjI5?=
 =?utf-8?B?WHdwZ2wyc1ZZL1VvaDdBb20rUjhnaU1sQWUzQnNaMXpwU2VKaUlvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be884d30-1167-48f6-1273-08de5fad5734
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 03:12:02.9184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLjfiY9w5/mR9siFG8ZOkGA4Ejl2vNYEY58Y3zpt5P2iieA7qPHnwRhqbmYwBFe2aQSa1ZENHUK7KsaOrPAAxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9537
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[BN9PR11MB5276.namprd11.prod.outlook.com:mid,ziepe.ca:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 91508B6BD7
X-Rspamd-Action: no action

PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4NCj4gU2VudDogVGh1cnNkYXks
IEphbnVhcnkgMjksIDIwMjYgMTA6NTkgUE0NCj4gDQo+IE9uIFRodSwgSmFuIDI5LCAyMDI2IGF0
IDA3OjA2OjM3QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+IEJlYXIgbWUgaWYgaXQn
cyBhbiBpZ25vcmFudCBxdWVzdGlvbi4NCj4gPg0KPiA+IFRoZSBjb21taXQgbXNnIG9mIHBhdGNo
NiBzYXlzIHRoYXQgVkZJTyBkb2Vzbid0IHRvbGVyYXRlIHVuYm91bmRlZA0KPiA+IHdhaXQsIHdo
aWNoIGlzIHRoZSByZWFzb24gYmVoaW5kIHRoZSAybmQgdGltZW91dCB3YWl0IGhlcmUuDQo+IA0K
PiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIGRtYWJ1ZiBkZXNpZ24gYSBmZW5jZSB3YWl0IHNob3Vs
ZCBjb21wbGV0ZQ0KPiBldmVudHVhbGx5IHVuZGVyIGtlcm5lbCBjb250cm9sLCBiZWNhdXNlIHRo
ZXNlIHNsZWVwcyBhcmUNCj4gc3ByaW5rbGVkIGFsbCBhcm91bmQgdGhlIGtlcm5lbCB0b2RheS4N
Cj4gDQo+IEkgc3VzcGVjdCB0aGF0IGlzIG5vdCBhY3R1YWxseSB0cnVlIGZvciBldmVyeSBIVywg
cHJvYmFibHkgc29tZXRoaW5nDQo+IGxpa2UgInNoYWRlciBwcm9ncmFtcyBjYW4gcnVuIGZvcmV2
ZXIgdGVjaG5pY2FsbHkiLg0KPiANCj4gV2UgY2FuIGFyZ3VlIGlmIHRob3NlIGNhc2VzIHNob3Vs
ZCBub3QgcmVwb3J0IHJldm9jYWJsZSBlaXRoZXIsIGJ1dCBhdA0KPiBsZWFzdCB0aGlzIHdpbGwg
d29yayAiY29ycmVjdGx5IiBldmVuIGlmIGl0IHRha2VzIGEgaHVnZSBhbW91bnQgb2YNCj4gdGlt
ZS4NCg0KZ29vZCB0byBrbm93IHRob3NlIGJhY2tncm91bmQuDQoNCj4gDQo+IEkgd291bGRuJ3Qg
bWluZCBzZWVpbmcgYSBzaG9ydGVyIHRpbWVvdXQgYW5kIHByaW50IG9uIHRoZSBmZW5jZSB0b28N
Cj4ganVzdCBpbiBjYXNlLg0KPiANCg0KZWl0aGVyIHdheSBpcyBPSy4gSXQncyBub3QgZGlmZmlj
dWx0IHRvIGZpZ3VyZSBvdXQgYSBsb25nIHdhaXQgYW55d2F5LiDwn5iKDQo=
