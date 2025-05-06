Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8066FAAC20F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 13:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A69F10E16F;
	Tue,  6 May 2025 11:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5cbAQ8Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D8E10E045;
 Tue,  6 May 2025 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746529648; x=1778065648;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9M8XXWVf8yMcKOMQavHFsZ4TdjZwIbRweCIOhYOXcRg=;
 b=Z5cbAQ8ZKakV8NxR08jKps+6Vqc6FPfUtSySAARY17iPIPsfRHy/3byw
 EKQl3NaVp8p6xDcsZ4o93sGgjZq5DTzB9YQBhieQJwhW8DS/RDTFQ0SvW
 9bRExmc8d9UpsVjJO9bmb/ih22eI2L/Xf+9+L1EYi/jKQhQFwV7N1ZyD+
 kRywUip4AvFtB22Ze+be5PjBXHtBk04CbBDbuySiaaemz64KjrFGX/7IQ
 SHJFSv2bXHjxjXlZRRKyhysgokY8hio9p7tl98wHnDSKogaAlDMMWlStc
 P/lXCbqNJGHVks4I3htclTaNC8/HBdEfOhkTtKX6chw6ci3bh9yMioAwH g==;
X-CSE-ConnectionGUID: sw49RSq5TJqU2Bz3ANtdrg==
X-CSE-MsgGUID: DApgtopTT1qFGPxFF7kxUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48339993"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="48339993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 04:07:28 -0700
X-CSE-ConnectionGUID: MVeu91jiQYmZjjJp+YNPDw==
X-CSE-MsgGUID: /2+nHhMzSJaEZoAVaBiYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="166513293"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 04:07:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 04:07:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 04:07:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 04:07:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0WSJdpdDNeTNNmhRNkAiHH8e19aTSVW8fzML6xhVbmL/JjKSRB1hIUo6C6qzyglsTJVPasKpMakFyG+tkPhISW+KjqtEDzZFDDSBOr2GBO6FgiRB3rMZKy4EZuUKJQGlleHkhcV5X9rfoBI0mvLmGT4LyeuqWtXuwbaI5lzoF+7dvf8VsqUivbapEhbIVXaFeV/1D0n657BwPIqvV1KxL4hK6Qcg+Erq1khB6V6qT08dG1w0HoESl1L0BmkXby3yeegsFRSN0F5hSXo19A/XgM6jrpk1jVE6eMA8pHlNiGMXwtBW7TtTHy7/BgnJWzqcxjundFmNxjA37gzEe/clQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9M8XXWVf8yMcKOMQavHFsZ4TdjZwIbRweCIOhYOXcRg=;
 b=Eb+pjm70JSyGNvOojk1n9lcTYEYuIJR30aBzn5AwoJ18UMMgaOHd4zdGHjrNUTGN3EYGxi7QxMNO/BtYgA24eiUaEAhrJU733WxX0R7A6PYyix8i6irHASkYIImZ903pQG5PlnnCQxk+Efly52OROmb7MR2cmzVqDV/3XTsQd5oki3ymzaqUwhf2Z4J5h8ZoJisJl2D2EVPmQurYubtVcTWZctVF3V/g86qZcHd1CH1IHQboQRVxkZtGb7YEW+5j3pTS+ocFxU9j8+p+BGkNQVz+MfI9bU3UG1kIrLR5MAtKIM7CPWx026ckPj5YvLrQbJ7KaGGaWbvdw9h51Yl4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:07:21 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8678.028; Tue, 6 May 2025
 11:07:21 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 01/12] mtd: core: always create master device
Thread-Topic: [PATCH v7 01/12] mtd: core: always create master device
Thread-Index: AQHbnmT6czHkKmL9wkq39BK9P9qwmbO6k/CqgAnBeeA=
Date: Tue, 6 May 2025 11:07:21 +0000
Message-ID: <CY5PR11MB6366C40CC20B3519476DD8E2ED892@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
 <20250326152623.3897204-2-alexander.usyskin@intel.com>
 <87ldrjtj7n.fsf@bootlin.com>
In-Reply-To: <87ldrjtj7n.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA0PR11MB4653:EE_
x-ms-office365-filtering-correlation-id: bf1eac48-3ce1-4100-5009-08dd8c8e2c39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dHNvQnZEYnJVc0g4cll4YSszeDRacUJkNnoxQzMwOWp0aXZjMlhUWTNOOEph?=
 =?utf-8?B?Q2RKcUFhVmdpVGlybzZ1WldLN2ZDUnFkQy9kM3JyREtSZHJnMXBlODlrNHFE?=
 =?utf-8?B?N0FEWjJlZXZFem1FaXNlOUxFMlA2TmhidjVraGxOaGw3dlNoNUV4anIydjRq?=
 =?utf-8?B?aUdtN1E4eElCWkpxM1ZZYVRreksvcFJPUzFESlJGQ0hZVmkrZkcvSmVHUUlm?=
 =?utf-8?B?Z1VleEhYaFozRTN0RTJuZm95c2ZYVVBHNnE0ektraUVjZHNPUHVwWFlLK29H?=
 =?utf-8?B?M1UzNXVEd1VBQzNjN2YvNEpTaWNWUnlRanB1dmE3R1MzODdUK2QvTkFZWGdT?=
 =?utf-8?B?NnkwZkFnR0FQMUpDQ1dkZ2FzYUpLek13dk02MWpNcmZkUDJpbkRSdUpneUJG?=
 =?utf-8?B?L2U5c2JMNjZwUWVWZ0dsY2ZsdTlzc28zajJjOFdDV3hEMUVZUjdZYnoxS0pi?=
 =?utf-8?B?cXZyR1F3aHVmcTBsdWRCLzd0dW9xVmVtVmNuUHNVZWg0b0swQUNrTDFjdEs4?=
 =?utf-8?B?Y3dob2JLN0Z1UUEvWEQzM1UzSW5jUktSNm9iSzkwSUFkTUNNYTVlQm5XaEdG?=
 =?utf-8?B?WWhLMnZhcmlVeUhJRjFhaHVYZHQ0ZkN3NmZLZ0Jlekg4TmFvUU04K0lCZ042?=
 =?utf-8?B?Wjc2bUdRekRpZTRmR0JVbnVFNmdtaGdxZG9qdUNRdDE3YzUrMDJPWVptSDlW?=
 =?utf-8?B?TEEyYjdtdE5pZ3lZa3l1VkVmTVhKSXdSUkJBbDgyVk1mZk4yODNrK09Hby9J?=
 =?utf-8?B?R1dEYlZnRXZpeTFER3kwTHArK2pOQjdlV3F2cUVzV1hoZWVKL0VJTUdBZTVU?=
 =?utf-8?B?NHlTSThCSWRiVitJNEMrWG5PdHF3V3pCUU1nUW9ueWprdUQ4MC9KYi9uSk5I?=
 =?utf-8?B?eUZFbzZWM0lHclIydXlxMFVGcEt2a00xVzh5NzluQmhWYVZzdGJmdEhNT0Y5?=
 =?utf-8?B?WWRKWmg5UEVFYmQ1NE9zK2FHcFhRei9YNmkyR2tJOEtwVm5RM1I2dDdMN0tG?=
 =?utf-8?B?bjcyMmZiMEF2dkowWUljUlQ0MWxPSW5UblkyQlBxMHFyTDg1OE9hMzZ2ekxX?=
 =?utf-8?B?WHFUbXlFZGZOTmVJUkVwY1A2aDZYTXhiR0NKVU1uNmFvTmdhd1Vpc3BzK00r?=
 =?utf-8?B?QVNWaG9BN011bExXdHJ1Z2VQUVZGbDl3Ung5ZGRoNFZuOXc5M24xaENydEhj?=
 =?utf-8?B?K3YxNTdRVHRMc2pWdWRWYXNsSnl1ZUU2bTVFU3ZSVVppMDRUdTJBNmFXZjNn?=
 =?utf-8?B?TmxEb3ZXZXNmL3JvdWM3QWhMdFFML0wvUUhyd3R1bitSY1cxRy9kM1NLemZQ?=
 =?utf-8?B?NkgrYWMxSk5qUU1LdXFtb0Q0QXBqL2EwWEh5QWJ2dDNtdUVGMW9MREdmZ2pF?=
 =?utf-8?B?THNZRVRMd1p1TXRFbE8wd1F1ZktxVFFnL25mV21kbGhQNDdLbyszam1pKzNs?=
 =?utf-8?B?ZHVsL1M4REt4RGxhRlhHSUJZbnVVbGRMV1NUQ0dSYnBsbk5jTzROVERDY1NE?=
 =?utf-8?B?SVcrM2NqcTlXTDZaZDA5MmNmRElEalNXTzdHeW5FNWtlUTlTcURhU0hCSE5o?=
 =?utf-8?B?cUxaQy9zR2RZYkVaZ2V6V1B2SUlZQ2NDdzNFRGVuOU1CMDVyRTNFQW1iM1E1?=
 =?utf-8?B?QVRWSWRpWERyKys4bXJjdWxZVnA5Uk1YNnFCUFhnQnc1VWVicFRKeGFPbysv?=
 =?utf-8?B?S0RkejU0dzJaTlY2UnYraU55alFseUc5VE1acmY1WC9BWnUzUHdkRm5ndm4x?=
 =?utf-8?B?R2g2YnRsQlRUZGZSOHJMaXZCOTIyUktqTHhodDNBa0EvNFhmRDR3angrR29T?=
 =?utf-8?B?eWdwRzBpNTFlN3dSZVBQM1BFMmU5TVlvbjc5MUx3SHZqci9GZ2Fyd3FyVVFV?=
 =?utf-8?B?M2Nnb094UmgyemVQb28rRktmZ2JKMjJtQ1ZPeHdLbkhTaFBxbXFxM2pzejl5?=
 =?utf-8?B?aVhqWlRvVm43S1BUSm9WUWNKcUovU0FZaktYS1NsajQ3TmlEa202VDZkR1Fp?=
 =?utf-8?Q?v4jCZ+Vd/5zCW6MyHXi2/Zhfa1vJyQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlBNL1d5bEdsTWhXVFRZOHdmTTdPMkNQVENJSkxJM282aHFHK0tjQ3ZjRk83?=
 =?utf-8?B?M1kxWEN3cSsxaHM4MkZmRHZTZ2VnY2hkMjZpM2QwQ3lRYm1DbTFlNUsydUV6?=
 =?utf-8?B?ZlhLTTUyVkd2TzN6RG9qMlk3MmxDZG5nZmdnaW5ZajhZL3ZYYWdqSEd2bkU2?=
 =?utf-8?B?VWtmMFM4OEI2ajVKOGlLTFY4OGluN3FSa3NaQmNXc3hkZTFiSGQ2R3ZRWll3?=
 =?utf-8?B?dGFSK0twU0VLa0p5U29WMWVvZGdOT1R2bWcweXlHQzNyUlUybnV2VWxpYWNp?=
 =?utf-8?B?b2NxUFdLWEZ2ZkpvdjVpdGswYmwxanU1VVJ5a1BMNE0rd3ZMZmV2c2lRcjk4?=
 =?utf-8?B?a1FRa3FLZ3gxck5qU2l6QjhBU095WHNvU3BlZy9DTkViWkFTT2RzS2w2Z2dP?=
 =?utf-8?B?azZYQjNvVEVqazlWeWZzZEh4enRvNVNXM1dCQkNPQ1hPeXhCdlQ5c01LSzFD?=
 =?utf-8?B?aUF2SlNQQlNxTHpkUGRTMDRhZXhnclNRRHpTMlBrNDlqYmJ2b3FLaDl4ajhj?=
 =?utf-8?B?K0JCRmd2ckdMMzVrUTYzMnJOTzJyM2FBaGRabjBRMEtmZXgyaVF6eXU1bnQr?=
 =?utf-8?B?WjR5a0ZtS0labjRWZFIrVU5Da1pCZW93UW0yd1RRSFZBbVliVnlMY25JS2tO?=
 =?utf-8?B?L3dQenphOXF2b2h3bEZwMCtUNWw1aytTbUZjWnVjTmRva1ptTmozYm1qY1Jx?=
 =?utf-8?B?Vk5HblZrbE0yNlQwSHlWN1pGZGVDbkpDWUhraHJZRDR2amI5OGc3VW9jWCt5?=
 =?utf-8?B?ekE0Y2EvVkJPVGxsb25xWUp2VkNycG1iUmtZcVF4QTJYVlJOV2UyVG9UeUNP?=
 =?utf-8?B?ZHhBRmo0R0hzRDNNWmZkNlRIQklxRjdPbWpjd01hWVFZaGJ1V2NXbHFwV3c1?=
 =?utf-8?B?WUNtQ2g0T29uaE93dXEyakppWDYzRkMxalNVazFEVllramVDSm10SHRUZlVK?=
 =?utf-8?B?VGxITHFhNlIvTGY1ZFVJQ01qNmh1YUhoZ0VOcFl2YVNXeGY2MnRYWVVkUWs0?=
 =?utf-8?B?b3pQZVJqMDFNY1ZPQm9udjFlcldObGc3c1JtR3o4dTM5b200SlM3ZDBIajRG?=
 =?utf-8?B?bjNINlJta3gwUGwvYzc0dUpDOU1Icy82VTB3QnBxWjNUNVpUOExiYlg1ZnJT?=
 =?utf-8?B?cE9qMXJ5STl1T0d0N2R2eklsdGxRNllCMGhzbHRBY2FUa3dzSFpBbXJyeS9p?=
 =?utf-8?B?TkVjMjRDMGJkVUlCbUNFTkl2NHE1TU5vT0tyRjBuMnZTS2E5OXp6UmZRRUVW?=
 =?utf-8?B?VmdWMkFpVit4cG9id0NNSnZqeGFlcGpMcnZXSTBNN2VSR2Z2U2wvS29ScHNL?=
 =?utf-8?B?T0pYaWlLM0ZiR1VQc0VJNW9Gb2JERkp3V0E1cW5CRmZER0ZFUGQzWURIbngy?=
 =?utf-8?B?Umk2b2tzMEo2Y3g1eGVKMmhvd1U1aDVBWk1KdFZXWUZ1WnEzNFl2bXQwWTZ4?=
 =?utf-8?B?K3VHQmlvM2NpdFBFSVVhb1BUV3pidElwT1hnMVY5aEJWcC9ORHQ1WnRIK1VS?=
 =?utf-8?B?aUxrOGpjejVXbWNrcTk3NWVCTmtjanNCZUVDakcwYjZjdnc4VUhTL2p2YmVK?=
 =?utf-8?B?NTZrNER0VkdscTYrbWVBNUtsbmJrUTBGRjZZdGpONDFmRm0xVlpHUVNMTGlS?=
 =?utf-8?B?dGljWWNZczFjQXVBUldObmNWWW96Z3ZKQlV1TUs2bDlnbmhuT2JCQVBLa0Fk?=
 =?utf-8?B?eW8xNGI3N0hWVkRuYzlQcnlpUkxwUDg0MHlKb2MvMVZURlRnYVQrcllwVUN6?=
 =?utf-8?B?V29xYkczdlNSb3J4MERBeUprTmczL0F0WXNsbDdnU2NYdUY4K2ZVaEFVZWZ1?=
 =?utf-8?B?ZDRhaFVKaG9YSjNHTlZuSExEOFBKdHMrU2YyWXNaekVXNnJDZXZ5bHhHblF1?=
 =?utf-8?B?SmVRZ2RpSWNxU0xGUlVRenErdmE5RURSUlJhbDVmOFRYS0t2ZzRZODBlazI5?=
 =?utf-8?B?Mk9GS1NQSGErUmFoRTFFaU9wWHpTTEI5MnJTQTk1QUxkUWIxZzRJNGdYV0tv?=
 =?utf-8?B?VGQySnFIOFQ5QXRmeVNyaml2allDdVM5aWtKd1hiMkljOEFPNFp2Z1plSkVP?=
 =?utf-8?B?a05xY1JZRjQxVFM1RDhFazBtQXN0VUhhQlUxOGxEZ3c0Z1FQdHlvZ2hWRGM3?=
 =?utf-8?B?RTBtR2ZRZjBSb3ZHV0lkY2R0QnlRQ1JXYmpvS0k2Wi9IZWJ0dkZCclNTZXpj?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1eac48-3ce1-4100-5009-08dd8c8e2c39
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 11:07:21.1089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XD9/5lGCSbVHbs1oTAYHvR10ehVzS5aWToAIEli9crB6//igea4Ao7gGjz5XzuWD4WK+dduWSgMavz/zuezcrLnnqb9Eo7qPxtbP/uMlkK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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

PiANCj4gT24gMjYvMDMvMjAyNSBhdCAxNzoyNjoxMiArMDIsIEFsZXhhbmRlciBVc3lza2luDQo+
IDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gPiBDcmVhdGUgbWFz
dGVyIGRldmljZSB3aXRob3V0IHBhcnRpdGlvbiB3aGVuDQo+ID4gQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVIgZmxhZyBpcyB1bnNldC4NCj4gPg0KPiA+IFRoaXMgc3RyZWFtbGluZXMgZGV2
aWNlIHRyZWUgYW5kIGFsbG93cyB0byBhbmNob3INCj4gPiBydW50aW1lIHBvd2VyIG1hbmFnZW1l
bnQgb24gbWFzdGVyIGRldmljZSBpbiBhbGwgY2FzZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KPiANCj4g
QXBwbGllZCB0byBtdGQvbmV4dC4gVGhhbmtzIQ0KPiANCj4gTWlxdcOobA0KDQpUaGFua3MgYSBs
b3QhDQoNCk1pcXVlbCwgd291bGQgeW91IHBpY2sgcGF0Y2hlcyBmcm9tIHRoaXMgc2VyaWVzIGZv
ciBmaWxlcyB0aGF0IGFyZQ0KaW4gdGhlIG10ZCB0cmVlPw0KSSBjYW4gc2VuZCBzZXBhcmF0ZSBw
YXRjaCBzZXJpZXMgZm9yIHRoaXMuDQpJbiB0aGlzIGNhc2UgdGhlIGk5MTUvWGUgcGF0Y2hlcyBj
YW4gYmUgbWVyZ2VkIGluIHBhcmFsbGVsIHZpYSBYZSB0cmVlLg0KDQotIC0gDQpUaGFua3MsDQpT
YXNoYQ0KDQoNCg==
