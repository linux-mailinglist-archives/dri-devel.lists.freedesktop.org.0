Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANpvHy0hfGmgKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:10:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A95B6BA4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54D110E8E0;
	Fri, 30 Jan 2026 03:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMhIaGga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950010E8E0;
 Fri, 30 Jan 2026 03:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769742632; x=1801278632;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9gkomnRkMKtvIM0JFYSwqH/ML0GDqsmPAibKdoxACpE=;
 b=DMhIaGgadiCzNTz38Hn87Hl6qHDAA3SW8kIUmujDfkg0CW+XeeA2G0aA
 lPvZMVzOQvtAwIDAyjX5Kc2a+whkaNFYC7x4iSquAqgeMEgyJAznpKAFb
 Coc60/rrz/R89Vqo82o+nUYjEaKBUN1/V7RWlWOUfTBIE1SZltKWHkOCr
 k85H/gRzSIj8DxhP3MprtfUrzuacsoak3aUKbbojbR/aZf8nJT0pW35M7
 AuZbB1izVDp3TkKlmYLoZUKCqDe/CCdrMOqqaPWKEDVy8xyPRhsN5yQWi
 /b58XazX6A/OZd9l/lSxkPNklyG+Wi3zOHxakriJOcCnI+qodAJhpANKk w==;
X-CSE-ConnectionGUID: qAQG8xqtSCuHkkfgOXy1HA==
X-CSE-MsgGUID: UI40cavRTKqk7TRspKQtxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58570682"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="58570682"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 19:10:31 -0800
X-CSE-ConnectionGUID: mTbRIXqDTxOZfLxTHzI9wg==
X-CSE-MsgGUID: bdPDxo4wQ7CpTBi3sMNQ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213277228"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 19:10:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 19:10:28 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 19:10:28 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 19:10:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+qyR1qzSVdUwjUv42am4h1DHIm7GbUIgPdGxOWQ+J+d9WkBrbEmHaCxaKUJhdMvT7BqoSlh2LF1WMpDQG6SDwcEIkguva5BkJrQWV+pXMcQJsMowsXOfGMHtRs4KhN2iKprzVF6NmHHGQG4wunPmYmM0tS+s9pqE9HG/m1e+ynlVhLJkget+R3YWY2FyyfJrN6aGBHrD0IOKCTtuYakv9RZ0Ib4Vgml5TArK+UU24fcAx5NtGydIxxTBg8J+kV+4oTVIWCBz4Iqc6fWfybNAE+OIChBPToi+72bAtfPPNbjUifMNkcehB2qTRcrlAdh9O+dueFMC6jY6vFj9VpVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gkomnRkMKtvIM0JFYSwqH/ML0GDqsmPAibKdoxACpE=;
 b=m1xWbU2Ct4Vs8NtVIapDkzgA4KLNhT42pTwVrsOObWrT55A9NROmQEK11Msc5JeyP5QSAjumcd7C6Gw+6AM3oTpPyeTnRdF61uzqkgH2i/I8NyQlBfjfqik7XQLsErXcF2g7K+XgBKK9h6/ar1QWhRHFzyaZaM75mDb+WTPyyJdBDd3AF7Iv2z/my9wENx+ll6sumJlolkrNyJPjam76s7cSjbGVVxS5lr6GfHAM9lhG7ry9w6oD/quFUiotxrHlopzeudQNU6/SJcg7iq0t4KJWBb8E6VOvbsMcdN5Rnm1t0Qpz+87vC0l/aTV1LrAxidl+8w7ppTR4n+QDA7c89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB9537.namprd11.prod.outlook.com (2603:10b6:408:378::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 03:10:26 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 03:10:26 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Jason Gunthorpe <jgg@ziepe.ca>, Pranjal Shrivastava <praan@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
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
Thread-Index: AQHcjWW44cZHc/LC3Ey07jDLODM/2bVk8PuAgADKdoCAAH2KAIAChYWggAAJ1oCAAAp60IAACKQAgAE1bUA=
Date: Fri, 30 Jan 2026 03:10:26 +0000
Message-ID: <BN9PR11MB5276543D7363AE07C309008D8C9FA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com> <20260127085835.GQ13967@unreal>
 <20260127162754.GH1641016@ziepe.ca>
 <BN9PR11MB5276B99D4E8C6496B0C447888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260129073331.GB10992@unreal>
 <BN9PR11MB52766EA91FEB08876DA474888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260129084156.GC10992@unreal>
In-Reply-To: <20260129084156.GC10992@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV2PR11MB9537:EE_
x-ms-office365-filtering-correlation-id: 1cf73fa3-dd39-484a-7300-08de5fad1dc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZElzY0FwV2RTVDNOVFNXN1dJcFdPV1FUTnU3eTVQeGc3K2NIZkJvMDBWdVAx?=
 =?utf-8?B?aDFlMFlVNVg1bkdFbWx5cytnY2hhR0tGL2VDY21mNDNLYzRMMEtrTUJMNjJp?=
 =?utf-8?B?bGkrR2xjTFRHa0M4VXdocklNRGEzSFI5UTJYYll0MHlKR2VsMHVyQkNkVzNE?=
 =?utf-8?B?RWplSDQyK3lPQ25rcWxNQy8rZ1I0bktXQ3dxMy9FOVFCaXJTZjNPMEswMmo0?=
 =?utf-8?B?MXV6cVpNUDZIMW5jTUpBNzFMNXFRd3hYQVIwQ0pseEFzck1leWtVeTE4anJD?=
 =?utf-8?B?bWJaNW9hVHNBK29jRll2Wkh2OWpWYmVGZ0VLZS94ZkUxbzZTa0pEN2NDYWVK?=
 =?utf-8?B?eUhNMVRzdEV5bzUwNlJrdmtWZm00R2pWVXcvUGZIbWs5eElZVVNZWEp4L0RE?=
 =?utf-8?B?Y1BEK2NRaUIzMkkwcEdiSDQ4NFpBbHdjNWFnSGNzSGVDMExqTnQwdmhnekY5?=
 =?utf-8?B?eU1iRzVKaTRqeXpkNlpZdmtvTGttbGRhMGpxRk1PN2ViVzdvYjY2SHpnblNI?=
 =?utf-8?B?N0ZnWTJhUEppRGlKZXhtZEFxbEpEYmx6YmZ3aFFLMER2M040MTVBbktDNXph?=
 =?utf-8?B?TjNMb0xxaEVvYkJQdEdQUXRpT3pZTEREeDFvcTA2cDdhdFV3QnZaSDJwTnFB?=
 =?utf-8?B?Z0dGUnZYMXdWbjZjdzFmS1J2Tk1RWlpURFFESUFYQW1YbnZFeTNYMWVKSG10?=
 =?utf-8?B?bGU2bzZaKzcyU1BXcjErVVZ1UlhEVmliQ3JzQmJmN1Z0Q0FYelRpNVd0bHE1?=
 =?utf-8?B?ajVWNUVLa0Z6emJkQWJNMUg3Ty85eFdEaVUyV3ZGWWV6Q2VXSVN1YldXUmJZ?=
 =?utf-8?B?elhaNGZ2U1J1MGxSaU53OG1oS0t5cCtDYkRjZ3NiRDRqY2lNYVJYbVU5U0ZO?=
 =?utf-8?B?czRlb1F1bWNRTWo2anBteWVlbG9Ga3NPMDV6TEozc0Qwc1ptLzN6ZmI4YkpN?=
 =?utf-8?B?RmNpOXpvUHBZclgxbnlyc1o0cTJ6VUVZdWZRckViREdKdEtJVElFUEZ5Uy9h?=
 =?utf-8?B?bWlEcVEzNjhHVU5UTFJXdW9sOTRMUnJBdmtVdG9xNU5YeVl0cHhZSS96Rmp1?=
 =?utf-8?B?d3FCVlFZTHpLNXM3NFJBc1RUYkdydWZPS1hqOER1UDEvOElxS1d2V3Y3NFMr?=
 =?utf-8?B?WEs0RkQ5WGdxdzVUSnBlUDQydXdrdFNjSC9aWE05SCszS1A2bkJaMWdERnFU?=
 =?utf-8?B?ZDF5d3JNbHdUekxoMk5tdmxqRUVJRDZqZG1RTDI5REpnTk9mRENOcFhRUGRj?=
 =?utf-8?B?SGVza2tuc0MybXRVSmE4djlxQ01pUU1tSStoSHpiYXc0U29VV1B2UnNJSjFw?=
 =?utf-8?B?Y3J0Kzdzdk8yL3NYZDBwcHRxVjZNUmtPTXYxYTRjZnlSeHZGYmM2VnA0cGpk?=
 =?utf-8?B?TGpNb0Y5RmxpM2lQVXp0bjFMTjNkNXA3blhWRUNvRC9iNHBrbHM2K2RMZ3BL?=
 =?utf-8?B?V0FYWjkvRW4zdmxLRlZBYXpLUlNXVjJxbHlTdHhGdG9IY0c4YzVmSTN6NjI1?=
 =?utf-8?B?QUUvRnh1VE9FS1lzYjVyTEFUbXFRUFM2dnVvQnNsbjdKSlVPSTVWYVdIc1hn?=
 =?utf-8?B?OUFyUkNjeS9nNVkvNkJMMmQrMWk0cmtuU0lvRGI0YWxQdUl4c1U0N0dQV3Jw?=
 =?utf-8?B?Z0NHSk1lcWN1aFNzNHpFUzZZbE1XbjF5LzU4aFdXUGRZM1JBa0Z5YkZHNGxU?=
 =?utf-8?B?QkdlOGdJWTZQSDJHZXJTdWF0Zng1T2dZcFExY1o5dFF2VWVrYytiUHdaRWhx?=
 =?utf-8?B?MVpUYWs1bHlCeTFEVkdWYXVPZFdrNHhrbnE4cmhWS1k5cGFWRTRONEdnRE5q?=
 =?utf-8?B?Mno1a3FWVVRld1oxNWd4MlBucEw0dU1RalR2cy9jN1FrQ05HODJ2aUZKWGQ0?=
 =?utf-8?B?eG9IQkhTWE5JcUhGL2k1YmlpTkltc1BpblVWcUlveGN6M1JHTnNDL3kxd2ly?=
 =?utf-8?B?MENkYXlXZmFiZm43bTRqdk5aQ05hYm5CcVhnMktzZ2RLUXdIRHA1TTMwSm5m?=
 =?utf-8?B?VlYvQ2RPQ0EyNDVWMEFYV2VtN1BhWVF5WVQ2dTBqTXRqViszdmJBR2hXN0d2?=
 =?utf-8?B?Q09hQkxxSzh4WDZNbFJDcHlSTnd5ai82ZHp0djczN21BNFNVd3R5MU1hYkZU?=
 =?utf-8?B?K1dZWEYyS0Z3L2V6RG03cFZSdUtUK1hlSWsyVFNibmhDUDF4Y0FBSGdXUzNp?=
 =?utf-8?Q?pQhfLklS1XwAaaFUk/TC4Fk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHRhSWhyT3kvM0JHQW1oakpybGw4NUY2bG42c0tXV2x6WmJZMElCS0Y0dEc5?=
 =?utf-8?B?UlB5TCtYaWhDZnd5b1d2SVZXbGFCenJVOFdjS09JWDNORTZ5Rm1QVW9SM0Z0?=
 =?utf-8?B?eFJRd0xDcHRncS9qajBTQnB2SVllWktTdXBoVnNiVFV3TVdHOHVheDQ3dnJK?=
 =?utf-8?B?M3NUb0ZVR1QwbFdZMStZNDU1anRGeTlBWGdLb3pnbk5xd2F1MjEvdVZlRVhv?=
 =?utf-8?B?d29nM3lyTXV3Vm00cGZxdlZtWHJOcjlPOU1RK0N1dzIxYmY2Smt3cW9jSHFT?=
 =?utf-8?B?L3VFK3Bkd004b2NpRlJIaDg5c2xQNUd5MGVrY0w5dkRKR1lUUjRSd2lrL015?=
 =?utf-8?B?bkhmazJQcHNDS2RqVGFzdTA4dFE2dGRGN1VOSFUrL0w1bVVLZFc2QmdHRUt0?=
 =?utf-8?B?dXFGS0VxNHh1dEtRbkJML0VDY1F5M2tUeUJqSlVpMmJEYjVxeWJMTEY4REh1?=
 =?utf-8?B?b05YNC9PSCtpaEliWDJReGdZM2RaekQ1ZVZFRDlPaVVzeGQ5Y1pMeWs3WFYw?=
 =?utf-8?B?d1A5Q2E0WHNCMFhvWTJmaUZzRzZUbUdVMGVOS1F6ZXRRb3UxQjZEWlY4Y3di?=
 =?utf-8?B?Q01OUE5IMXQzU0ljU3NlZlFBUytpcU9DZHIzaGZ3SmVwWWRFRjhFWHEzb2ZM?=
 =?utf-8?B?YnF2Q2hOMG81Q21MSnFZQVd4RnIwNllTZ242WFU2UHpqWnRsdE9GMWxpNGZX?=
 =?utf-8?B?SUx1L1FVVk5JUFpKazBabXBBN0hSdW12WGxrTWtPeGpPTTFRdzNYTzRmZTl4?=
 =?utf-8?B?Z2VJTzJzMzlncGdyS0R3N2RxQ2MzM1dya3BqcGh5akgxbXlsQ3FoTVhtbmFC?=
 =?utf-8?B?aHZBMVk0cDkrM1RuN3FmbzM4d05FUjZMV3l2VVlvaVdtWExJRzNBVFg4SUxt?=
 =?utf-8?B?UjRSTndnbEthdEVMNEd1b25lZG1RTjlVWlNDNlJzQ3RwemhqbURMOVU1NnNz?=
 =?utf-8?B?QW54UUJRRnY3QkNHZytZYmJ4U0RhVFp4MlF6WjBNdkRzVEtpQXczc0FCRERw?=
 =?utf-8?B?djB6ZXN4TEx3Zy9kejByTFNkZ29BNWJyU3pBQm0zSFJjZEdOWFNDeHgzLys1?=
 =?utf-8?B?MlFTSnA4UUQ5U2JrYTdjcUJMVWhYTkRlVHhnaGNoaDNCclptM2ZCU2RaN2hY?=
 =?utf-8?B?dElEWTVFcFYzNmlubWVhODdza2tJWHRMUjd3bUIvVWR4MUFEMW5Md2dIV2d2?=
 =?utf-8?B?S3pBbWJoUjkzTzZ0OEJmYXFOcHZsSVJndlpFVDR6dEtHQkZWUlRGYmc1QzNU?=
 =?utf-8?B?Q1JqaGV1amNqL0hSL0tqbHBUcHBEbmN1S3pGZEVIUEVBQXBsYUx6TVpMQS9L?=
 =?utf-8?B?di9MS0ZpcGJuUFhUTW1YSzZrRjQ3YkE4UllPRDcrdmFTbjd1L29JeUIxRzh6?=
 =?utf-8?B?MnBOaFdibFhCN21ZdlRqcUt2c29RQkxRWmI4M1NMclVJOWY3QkhEZFE2Ykdq?=
 =?utf-8?B?bTFNUXczc1hIcTROeUJGR3J0Nk8vMVBsOTllSnVsVHNxUmI0UVVYYU9Pci9j?=
 =?utf-8?B?OG94MGQrUFlaZnh0aXpyRU5nMG9HdFRLTUdCQW5vUHY0YUtaV2p3ZFpLY3VK?=
 =?utf-8?B?T2RjYXZqc1czUUVvUkpjczdWZmNTajZ1RTg3Q09vYnNPWmlSaFJpSTA5MWNp?=
 =?utf-8?B?RnovNktsamRIMS9FNFF3RG01THZ6a2l2cGF6dHduMjNjMTBWUHRUWVhnd09Z?=
 =?utf-8?B?ZUFyT1FrSk1NbVhWRUZraExYVkI5c3h4cDhzMUttTk0wbkYyc0lwdHlpdkor?=
 =?utf-8?B?Q3o2bXFLNHF2QlJMa05yOEJ5dU9aWUpMaVZmZm5CRENRM0J1TXN0Sk9kMEIx?=
 =?utf-8?B?eFdHY2VqL1NWc0ZaTGRocjZDcFpSOUl1dzlVaFlKcHI2NFpFRjVzUzBXbnBh?=
 =?utf-8?B?eWN5akhHT2xzc0xGZTFjRkNDaEMySzVKOE9KVUw0Zmg4bWVBZFlLaC9xTito?=
 =?utf-8?B?UUJObFJISjlyVlU1akthQkdzZGpxSEljUVdGNHVYeFV2VmdueE1nd0FWM2do?=
 =?utf-8?B?RmJQd0doMkpiY0VIeFdqa3pHNXEvdzFIeVBLODZ1TmVuMzNHQWZOZ0c3ck50?=
 =?utf-8?B?TG1TZ3R0ODFpQWppUDRnMjJ6S1c2TUlqdWlib2xPeUprUElEdDlVZHUvWi9Y?=
 =?utf-8?B?LzY0NkFaMDR2a1F0UmtPWTZZQVN2RWtCL2JGUys2eVM3OUl3S25pN1V1cXcx?=
 =?utf-8?B?enAwUklHR3lkc1ppSGg1QzFaYjlYc3dHdFFQcUJFMnJOTG9CR1R5Vm5LaXJx?=
 =?utf-8?B?dmkxUG0zdTd4QVQ5UmJ3M0p1bVRhUlFUN1IwWUhmZXlIblY3M1BOMlVLZyt1?=
 =?utf-8?B?d3dCa3lacHVwWktuUFQ1b0N6ZlZkM1k1NFdWMTFqbHlkNk5sejltdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf73fa3-dd39-484a-7300-08de5fad1dc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 03:10:26.6325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyfcQe9xdOH1hVO/xkr3Dn/KlVYLYi9W4RxCZA+2/QecSvtkzm7NWEUOfsAK6XFAb1rZdeaUG3nKvADHuMrgTg==
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
	FREEMAIL_CC(0.00)[ziepe.ca,google.com,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,BN9PR11MB5276.namprd11.prod.outlook.com:mid];
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
X-Rspamd-Queue-Id: D1A95B6BA4
X-Rspamd-Action: no action

PiBGcm9tOiBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNk
YXksIEphbnVhcnkgMjksIDIwMjYgNDo0MiBQTQ0KPiANCj4gT24gVGh1LCBKYW4gMjksIDIwMjYg
YXQgMDg6MTM6MThBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPiBGcm9tOiBMZW9u
IFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBKYW51
YXJ5IDI5LCAyMDI2IDM6MzQgUE0NCj4gPiA+DQo+ID4gPiBPbiBUaHUsIEphbiAyOSwgMjAyNiBh
dCAwNzowNjozN0FNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPiA+ID4gPiBGcm9tOiBK
YXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4NCj4gPiA+ID4gPiBTZW50OiBXZWRuZXNkYXks
IEphbnVhcnkgMjgsIDIwMjYgMTI6MjggQU0NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIFR1ZSwg
SmFuIDI3LCAyMDI2IGF0IDEwOjU4OjM1QU0gKzAyMDAsIExlb24gUm9tYW5vdnNreSB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiBAQCAtMzMzLDcgKzM1OSwzNyBAQCB2b2lkIHZmaW9fcGNpX2RtYV9i
dWZfbW92ZShzdHJ1Y3QNCj4gPiA+ID4gPiB2ZmlvX3BjaV9jb3JlX2RldmljZSAqdmRldiwgYm9v
bCByZXZva2VkKQ0KPiA+ID4gPiA+ID4gPiA+ICAJCQlkbWFfcmVzdl9sb2NrKHByaXYtPmRtYWJ1
Zi0+cmVzdiwgTlVMTCk7DQo+ID4gPiA+ID4gPiA+ID4gIAkJCXByaXYtPnJldm9rZWQgPSByZXZv
a2VkOw0KPiA+ID4gPiA+ID4gPiA+ICAJCQlkbWFfYnVmX2ludmFsaWRhdGVfbWFwcGluZ3MocHJp
di0NCj4gPiA+ID5kbWFidWYpOw0KPiA+ID4gPiA+ID4gPiA+ICsJCQlkbWFfcmVzdl93YWl0X3Rp
bWVvdXQocHJpdi0+ZG1hYnVmLT5yZXN2LA0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+IERNQV9S
RVNWX1VTQUdFX0JPT0tLRUVQLA0KPiA+ID4gPiA+IGZhbHNlLA0KPiA+ID4gPiA+ID4gPiA+ICsN
Cj4gPiA+IE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsNCj4gPiA+ID4gPiA+ID4gPiAgCQkJZG1hX3Jl
c3ZfdW5sb2NrKHByaXYtPmRtYWJ1Zi0+cmVzdik7DQo+ID4gPiA+ID4gPiA+ID4gKwkJCWlmIChy
ZXZva2VkKSB7DQo+ID4gPiA+ID4gPiA+ID4gKwkJCQlrcmVmX3B1dCgmcHJpdi0+a3JlZiwNCj4g
PiA+ID4gPiB2ZmlvX3BjaV9kbWFfYnVmX2RvbmUpOw0KPiA+ID4gPiA+ID4gPiA+ICsJCQkJLyog
TGV0J3Mgd2FpdCB0aWxsIGFsbCBETUEgdW5tYXAgYXJlDQo+ID4gPiA+ID4gY29tcGxldGVkLiAq
Lw0KPiA+ID4gPiA+ID4gPiA+ICsJCQkJd2FpdCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91
dCgNCj4gPiA+ID4gPiA+ID4gPiArCQkJCQkmcHJpdi0+Y29tcCwNCj4gPiA+IHNlY3NfdG9famlm
ZmllcygxKSk7DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IElzIHRoZSAxLXNlY29uZCBj
b25zdGFudCBzdWZmaWNpZW50IGZvciBhbGwgaGFyZHdhcmUsIG9yIHNob3VsZCB0aGUNCj4gPiA+
ID4gPiA+ID4gaW52YWxpZGF0ZV9tYXBwaW5ncygpIGNvbnRyYWN0IHJlcXVpcmUgdGhlIGNhbGxi
YWNrIHRvIGJsb2NrIHVudGlsDQo+ID4gPiA+ID4gPiA+IHNwZWN1bGF0aXZlIHJlYWRzIGFyZSBz
dHJpY3RseSBmZW5jZWQ/IEknbSB3b25kZXJpbmcgYWJvdXQgYSBjYXNlDQo+ID4gPiB3aGVyZQ0K
PiA+ID4gPiA+ID4gPiBhIGRldmljZSdzIGZpcm13YXJlIGhhcyBhIGhpZ2ggcmVzcG9uc2UgbGF0
ZW5jeSwgcGVyaGFwcyBkdWUgdG8NCj4gPiA+IGludGVybmFsDQo+ID4gPiA+ID4gPiA+IG1hbmFn
ZW1lbnQgdGFza3MgbGlrZSBlcnJvciByZWNvdmVyeSBvciB0aGVybWFsIGFuZCBpdCBleGNlZWRz
DQo+IHRoZQ0KPiA+ID4gMXMNCj4gPiA+ID4gPiA+ID4gdGltZW91dC4NCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gSWYgdGhlIGRldmljZSBpcyBpbiB0aGUgbWlkZGxlIG9mIGEgbGFyZ2Ug
RE1BIGJ1cnN0IGFuZCB0aGUNCj4gZmlybXdhcmUgaXMNCj4gPiA+ID4gPiA+ID4gc2xvdyB0byBm
bHVzaCB0aGUgaW50ZXJuYWwgcGlwZWxpbmVzIHRvIGEgZnVsbHkgInF1aWVzY2VkIg0KPiA+ID4g
PiA+ID4gPiByZWFkLWFuZC1kaXNjYXJkIHN0YXRlLCByZWNsYWltaW5nIHRoZSBtZW1vcnkgYXQg
ZXhhY3RseSAxLjAwMQ0KPiA+ID4gc2Vjb25kcw0KPiA+ID4gPiA+ID4gPiByaXNrcyB0cmlnZ2Vy
aW5nIHBsYXRmb3JtLWxldmVsIGZhdWx0cy4uDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+
IFNpbmNlIHRoZSB3ZW4gZXhwbGljaXRseSBwZXJtaXQgdGhlc2Ugc3BlY3VsYXRpdmUgcmVhZHMg
dW50aWwNCj4gdW5tYXAgaXMNCj4gPiA+ID4gPiA+ID4gY29tcGxldGUsIHJlbHlpbmcgb24gYSBo
YXJkY29kZWQgdGltZW91dCBpbiB0aGUgZXhwb3J0ZXIgc2VlbXMNCj4gdG8NCj4gPiA+ID4gPiA+
ID4gaW50cm9kdWNlIGEgaGFyZHdhcmUtZGVwZW5kZW50IHJhY2UgY29uZGl0aW9uIHRoYXQgY291
bGQNCj4gPiA+IGNvbXByb21pc2UNCj4gPiA+ID4gPiA+ID4gc3lzdGVtIHN0YWJpbGl0eSB2aWEg
SU9NTVUgZXJyb3JzIG9yIEFFUiBmYXVsdHMuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+
IFNob3VsZCB0aGUgaW1wb3J0ZXIgaW5zdGVhZCBiZSByZXF1aXJlZCB0byBndWFyYW50ZWUgdGhh
dCBhbGwNCj4gPiA+ID4gPiA+ID4gc3BlY3VsYXRpdmUgYWNjZXNzIGhhcyBjZWFzZWQgYmVmb3Jl
IHRoZSBpbnZhbGlkYXRpb24gY2FsbCByZXR1cm5zPw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
IEl0IGlzIGd1YXJhbnRlZWQgYnkgdGhlIGRtYV9yZXN2X3dhaXRfdGltZW91dCgpIGNhbGwgYWJv
dmUuIFRoYXQNCj4gY2FsbA0KPiA+ID4gPiA+IGVuc3VyZXMNCj4gPiA+ID4gPiA+IHRoYXQgdGhl
IGhhcmR3YXJlIGhhcyBjb21wbGV0ZWQgYWxsIHBlbmRpbmcgb3BlcmF0aW9ucy4gVGhlDQo+IDHi
gJFzZWNvbmQNCj4gPiA+ID4gPiBkZWxheSBpcw0KPiA+ID4gPiA+ID4gbWVhbnQgdG8gY2F0Y2gg
Y2FzZXMgd2hlcmUgYW4gaW4ta2VybmVsIERNQSB1bm1hcCBjYWxsIGlzIG1pc3NpbmcsDQo+ID4g
PiB3aGljaA0KPiA+ID4gPiA+IHNob3VsZA0KPiA+ID4gPiA+ID4gbm90IHRyaWdnZXIgYW55IERN
QSBhY3Rpdml0eSBhdCB0aGF0IHBvaW50Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQ2hyaXN0aWFu
IG1heSBrbm93IGFjdHVhbCBleGFtcGxlcywgYnV0IG15IGdlbmVyYWwgZmVlbGluZyBpcyBoZSB3
YXMNCj4gPiA+ID4gPiB3b3JyeWluZyBhYm91dCBkcml2ZXJzIHRoYXQgaGF2ZSBwdXNoZWQgdGhl
IERNQUJVRiB0byB2aXNpYmlsaXR5IG9uDQo+ID4gPiA+ID4gdGhlIEdQVSBhbmQgdGhlIG1vdmUg
bm90aWZ5ICYgZmVuY2VzIG9ubHkgc2hvb3QgZG93biBzb21lIGFjY2Vzcy4NCj4gU28NCj4gPiA+
ID4gPiBpdCBoYXMgdG8gd2FpdCB1bnRpbCB0aGUgRE1BQlVGIGlzIGZpbmFsbHkgdW5tYXBwZWQu
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBQcmFuamFsJ3MgZXhhbXBsZSBzaG91bGQgYmUgY292ZXJl
ZCBieSB0aGUgZHJpdmVyIGFkZGluZyBhIGZlbmNlIGFuZA0KPiA+ID4gPiA+IHRoZW4gdGhlIHVu
Ym91bmRlZCBmZW5jZSB3YWl0IHdpbGwgY29tcGxldGUgaXQuDQo+ID4gPiA+ID4NCj4gPiA+ID4N
Cj4gPiA+ID4gQmVhciBtZSBpZiBpdCdzIGFuIGlnbm9yYW50IHF1ZXN0aW9uLg0KPiA+ID4gPg0K
PiA+ID4gPiBUaGUgY29tbWl0IG1zZyBvZiBwYXRjaDYgc2F5cyB0aGF0IFZGSU8gZG9lc24ndCB0
b2xlcmF0ZSB1bmJvdW5kZWQNCj4gPiA+ID4gd2FpdCwgd2hpY2ggaXMgdGhlIHJlYXNvbiBiZWhp
bmQgdGhlIDJuZCB0aW1lb3V0IHdhaXQgaGVyZS4NCj4gPiA+DQo+ID4gPiBJdCBpcyBub3QgYWNj
dXJhdGUuIEEgc2Vjb25kIHRpbWVvdXQgaXMgcHJlc2VudCBib3RoIGluIHRoZQ0KPiA+ID4gZGVz
Y3JpcHRpb24gb2YgcGF0Y2ggNiBhbmQgaW4gVkZJTyBpbXBsZW1lbnRhdGlvbi4gVGhlIGRpZmZl
cmVuY2UgaXMNCj4gPiA+IHRoYXQgdGhlIHRpbWVvdXQgaXMgZW5mb3JjZWQgd2l0aGluIFZGSU8u
DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGVuIHdoeSBpcyAidGhlIHVuYm91bmRlZCBmZW5j
ZSB3YWl0IiBub3QgYSBwcm9ibGVtIGluIHRoZSBzYW1lDQo+ID4gPiA+IGNvZGUgcGF0aD8gdGhl
IHVzZSBvZiBNQVhfU0NIRURVTEVfVElNRU9VVCBpbXBseSBhIHdvcnN0LWNhc2UNCj4gPiA+ID4g
dGltZW91dCBpbiBodW5kcmVkcyBvZiB5ZWFycy4uLg0KPiA+ID4NCj4gPiA+ICJBbiB1bmJvdW5k
ZWQgZmVuY2Ugd2FpdCIgaXMgYSBkaWZmZXJlbnQgY2xhc3Mgb2Ygd2FpdC4gSXQgaW5kaWNhdGVz
IGJyb2tlbg0KPiA+ID4gaGFyZHdhcmUgdGhhdCBjb250aW51ZXMgdG8gaXNzdWUgRE1BIHRyYW5z
YWN0aW9ucyBldmVuIGFmdGVyIGl0IGhhcyBiZWVuDQo+ID4gPiB0b2xkIHRvDQo+ID4gPiBzdG9w
Lg0KPiA+ID4NCj4gPiA+IFRoZSBzZWNvbmQgd2FpdCBleGlzdHMgdG8gY2F0Y2ggc29mdHdhcmUg
YnVncyBvciBtaXN1c2UsIHdoZXJlIHRoZSBkbWEtDQo+IGJ1Zg0KPiA+ID4gaW1wb3J0ZXIgaGFz
IG1pc3JlcHJlc2VudGVkIGl0cyBjYXBhYmlsaXRpZXMuDQo+ID4gPg0KPiA+DQo+ID4gT2theSBJ
IHNlZS4NCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiBhbmQgaXQnZCBiZSBoZWxwZnVsIHRvIHB1dCBz
b21lIHdvcmRzIGluIHRoZSBjb2RlIGJhc2VkIG9uIHdoYXQncw0KPiA+ID4gPiBkaXNjdXNzZWQg
aGVyZS4NCj4gPiA+DQo+ID4gPiBXZSd2ZSBkb2N1bWVudGVkIGFzIG11Y2ggYXMgd2UgY2FuIGlu
IGRtYV9idWZfYXR0YWNoX3Jldm9jYWJsZSgpDQo+IGFuZA0KPiA+ID4gZG1hX2J1Zl9pbnZhbGlk
YXRlX21hcHBpbmdzKCkuIERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvbiB3aGF0DQo+IGVs
c2UNCj4gPiA+IHNob3VsZCBiZSBhZGRlZCBoZXJlPw0KPiA+ID4NCj4gPg0KPiA+IHRoZSBzZWxl
Y3Rpb24gb2YgMXM/DQo+IA0KPiBJdCBpcyBpbmRpcmVjdGx5IHdyaXR0ZW4gaW4gZGVzY3JpcHRp
b24gb2YgV0FSTl9PTigpLCBidXQgbGV0J3MgYWRkDQo+IG1vcmUuIFdoYXQgYWJvdXQgdGhlIGZv
bGxvd2luZz8NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2Rt
YWJ1Zi5jDQo+IGIvZHJpdmVycy92ZmlvL3BjaS92ZmlvX3BjaV9kbWFidWYuYw0KPiBpbmRleCA5
Mzc5NWFkMmUwMjUuLjk0OGJhNzUyODhjNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92ZmlvL3Bj
aS92ZmlvX3BjaV9kbWFidWYuYw0KPiArKysgYi9kcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2Rt
YWJ1Zi5jDQo+IEBAIC0zNTcsNyArMzU3LDEzIEBAIHZvaWQgdmZpb19wY2lfZG1hX2J1Zl9tb3Zl
KHN0cnVjdA0KPiB2ZmlvX3BjaV9jb3JlX2RldmljZSAqdmRldiwgYm9vbCByZXZva2VkKQ0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBkbWFfcmVzdl91bmxvY2socHJpdi0+ZG1hYnVmLT5yZXN2
KTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldm9rZWQpIHsNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBrcmVmX3B1dCgmcHJpdi0+a3JlZiwgdmZpb19wY2lfZG1h
X2J1Zl9kb25lKTsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBMZXQncyB3
YWl0IHRpbGwgYWxsIERNQSB1bm1hcCBhcmUgY29tcGxldGVkLiAqLw0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC8qDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICogTGV0J3Mgd2FpdCBmb3IgMSBzZWNvbmQgdGlsbCBhbGwgRE1BIHVubWFwDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICogYXJlIGNvbXBsZXRlZC4gSXQgaXMgc3VwcG9zZWQg
dG8gY2F0Y2ggZG1hLWJ1Zg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGlt
cG9ydGVycyB3aGljaCBsaWVkIGFib3V0IHRoZWlyIHN1cHBvcnQNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKiBvZiBkbWFidWYgcmV2b2tlLiBTZWUgZG1hX2J1Zl9pbnZhbGlk
YXRlX21hcHBpbmdzKCkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBmb3Ig
dGhlIGV4cGVjdGVkIGJlaGF2aW91ciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKi8NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3YWl0ID0gd2FpdF9mb3Jf
Y29tcGxldGlvbl90aW1lb3V0KA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJnByaXYtPmNvbXAsIHNlY3NfdG9famlmZmllcygxKSk7DQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLyoNCj4gDQoNCmxvb2tzIGdvb2QuIEp1c3QgcmVwbGFjZSB0aGUg
dHJhaWxpbmcgIiwiIHdpdGggIi4iIA0K
