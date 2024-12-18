Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E39F5E83
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 07:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA9810E08E;
	Wed, 18 Dec 2024 06:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnlMtVFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB3A10E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734502615; x=1766038615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7bs95dHytRsqGY6eblsso9j7+ShhKOK2f1QSISjNyXI=;
 b=QnlMtVFKPJQGxA7OgsFX/5PqvqvtlczKPN4XlbflXnrVa+7yA1sJlR5b
 uI8GxTRqkX7+8yLk04sNyh+achtLLmezc56FR1M0jI05vLbGs2RBQGk54
 T6tLUst0dLqQmgUmElw3gnjLr82f28DnG4ud81+50o7Wj9RtANVwWOSt9
 PFTTIMWogMqsWjmNwq1kdTPdO12SCPVYQupAqf2fBLVgdrVYvyaPv3oeU
 yCTiPjPZOutJ4tqV6BfaOTSPzVqwX0kfhBdDz8JUBC5w1xJWIjJ3keUOM
 JEKk4syg6UrYInJwErA+FjAvkojYmFKc9tskP7jGr7G5LYO0if2LKpMZC w==;
X-CSE-ConnectionGUID: 3CtggJ+lTUGM2Qtx6fsZIA==
X-CSE-MsgGUID: 3tw0QtS9S3SbFFBWV8LqYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46354731"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46354731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:16:55 -0800
X-CSE-ConnectionGUID: YNQUmwjgTtyrPUBVkC4f1A==
X-CSE-MsgGUID: UWUhOI3UTyiFo58QMAmbLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97989506"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 22:16:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 22:16:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 22:16:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 22:16:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InrY1aNfjSRzO3vzmAMcS1wjUYNRR8LwDNNZwr/4XvAd1rZ4kJtcG7q174mSS65VOK0DaJfitIke7Tuywzj/vW2wocFNEVVLt0zyevz7L4uiJtMpz1OyNiHryHuyCNcNqZn1T2vTEeE2ATbi5ekNXtxD6/H+takB8ioB7QuBRkZis8GxZTX3toXysEG4d6nFtyrQ+Thc2L+ccY9jVkC9txauVx5GG7gxwtmGIwVKtI8AB3/Y2JJF6E+/kDAFNFJF+gNaY9oxdDRqUWAfsGdGlBjONCXyPUuQGzZrXJhfUOsJv59jmkPPZ/M6dvWJS0vl4Ux82gMYlza0YYHm4u2pGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bs95dHytRsqGY6eblsso9j7+ShhKOK2f1QSISjNyXI=;
 b=Lwi2SCoYoSscOQaXL8VkM+qjWywZG6Hu+l1V7rfbkXVv3TigFRGvWuqceSz8m3dZvGfABSlkgQ20BnFM4nFFCcUwOx8u6mj1sOTJMYzg/o5DUTG5QeyZrJobhFNQ2QYwjZNg1RlB/vDhVk9F3Bu9adTcLPhZacWV9hV54J7AMVOdbR3Pitxw9J8JcPIAtoldW7BGJxHtsrbTcgNyiBMQK2cmN0SceJyI1MAiSWeJBdGqSAR/mpl7OVNv8OemPhOXhg6S8gl8iXlfW1oxreUKiC3zCtoaqvItsACkPgZNj4Tb9G7bD83zgG/l5AqJHBlXvpXmvjBk9E797n8ehiF4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 06:16:50 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 06:16:49 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Wei Lin
 Guay" <wguay@meta.com>
CC: Keith Busch <kbusch@kernel.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes
 <dagmoxnes@meta.com>, Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay
 <ogabbay@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky
 <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: RE: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6OfgMZQT2ym50q9Un3Rm20kj7LoqU6AgABttwCAARzDAIAAFGSAgAAcV4CAAPjeQA==
Date: Wed, 18 Dec 2024 06:16:49 +0000
Message-ID: <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
 <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
In-Reply-To: <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH8PR11MB6779:EE_
x-ms-office365-filtering-correlation-id: ca443ca7-4cac-4c1f-c787-08dd1f2b8ec1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RVVvYUtqek5NaFcrODJFY3N3S3VJeU9HZ0pDSnFSbnByWEczWXB0VkJrYkky?=
 =?utf-8?B?Qm5GWkcrU3d5T3BkQW04S3J5cmw5cGRRL1FwU2VwREhaaEV5Qnh3aHJJYUpz?=
 =?utf-8?B?ZGN6T1k1UUR3a1llN2oraS9FaDM1Nnk2Skx1NW5VNkFBazBCMjFDM016MWlo?=
 =?utf-8?B?cnN2U3lpYmwwUmc1RlVDd3pLZ1h0SHJweWR2U081aFNNN2JvSmZmeFhpcWtQ?=
 =?utf-8?B?Y3dITFhFdlhUbTQrWUV0TVJycTgvV2t3Zkh4L09GaFlhQnNYL2d5MXpVaXM0?=
 =?utf-8?B?dU9RWnpuWTdCK3JPeUJVY3l2ZjFyZkt0ZTAwMDg0UmNYUFg2dGRaSzJVYXRi?=
 =?utf-8?B?VVIvR0x6QVhpRUpBdW1DTUZ6aEtzSFV2UjZMck92Ujhnd0xPTU1GOWNzNE04?=
 =?utf-8?B?WjMrcnYwNzZxWmxyaXhCUEh6K2lJRlNRV1JGZXcxZnI3NnpKdVp6K0FsZmkr?=
 =?utf-8?B?V2xxTmNmUXk3RHZvMVlsQ2x0UVJ4S05EejNkU1c3eGxoY0NCc081M3k3OWpU?=
 =?utf-8?B?OEdsREZ6L1lVMjJQZkFMQXpRT01KdzhhNCtKYUFtYXJyZE50ZlpJYXdJM1ZE?=
 =?utf-8?B?YVlXNWd6d2FwS3ZMSlUyQ1JPMXVkUlAvaEordXg3N0ovanZFOTRGc0hpa2dl?=
 =?utf-8?B?Y1NLVUJKaUh3WCtDZjZ6T1M5THpBMGljU3QyQ2huMWh0U1JFc0xwb0NtRTRj?=
 =?utf-8?B?dDZqMTBjM09kS2d0Q1VldnlSYkxHcmJ5QmpmMCtIMVZDc0Q2UmMxa3d6SmFO?=
 =?utf-8?B?VEdGVWl3ZTE3RFpMekZxdXBua2xuZ2VuODNnSHBHTWJzMG5iY0JXWVBsQm1a?=
 =?utf-8?B?SHhUVC9oRHJYVDdlbzQvYUdlWSs4QlFhVk5jeDJRa05paE5KeFlTWVFMdnFL?=
 =?utf-8?B?MlJ5QzRuOC8zVDgxbmxGMkFiaDlYbFVnaGhicndCOGZPQm80R2dsRGV5R3hI?=
 =?utf-8?B?bWpTR3h6TndQVndEM1dTSEQ0SXlTRXMxaWpJcDc2Y1hNYzdwRXJzRWgydmg1?=
 =?utf-8?B?K1JwSnp3U3o1bkxuWjV2UG1xNExpZjk3NlJHOFpodWtoMG1UUTVnVlZoMDQ0?=
 =?utf-8?B?N2V2aG5pWklBcFRDK1M4eDFzeXNLeHpJY2FOeStkMDJLem8vejlERU5ZTnVt?=
 =?utf-8?B?dm05MjMvWTBpazlMeDZVa3dVUlA3dXIvNWRFcnpEQ2FaYWZEamgrL1FTOE5M?=
 =?utf-8?B?Z3FYL2dqeFZIcks2eUdKZWltei9ramRYM3BLUGF1QVVBTncyZTV3N09iTTda?=
 =?utf-8?B?QTR3bGFyVmd1ODgvekp4SFVKOThOQlpFZHpZMG1rd2E1UldiTCtidGV0TFZq?=
 =?utf-8?B?VU9WNzVVUzhLdm1ZSVBjcmRQSGpLd2NNNTZHSUFiZzNxOHdDU09TLzBpTklo?=
 =?utf-8?B?UllSQWQraVZRdUZsTVBGQ3ZIa1psSmt4aVlZcTU3cE94Mzh6bnNvaE5ONHNG?=
 =?utf-8?B?N0JYWnE3SXFCSmtlQ3dOQmkvYW50K1p6VjZlRHE4UlFDQUZreFZ1WURiYzlo?=
 =?utf-8?B?SDZiTVZuUnA4M2FlMHU5UG8zQmJsczVFUXpJWHNOTTFrUHZBcXdrWmFnVjZV?=
 =?utf-8?B?bXF0TjBEeS9EVTlHUU1oSGgrVTNobGlibitoSGVudmFDc2UwK1RHdzZhVmQ3?=
 =?utf-8?B?dFNSeTNwYm1oUEtvN2tFZ21zZTlTRytDbnF4Y3Z5eXFud0hFYkpzNkYyZDBZ?=
 =?utf-8?B?NVpMUlNIeEk2STlRV1pjWHJjSVNzYjF4Mi95TTMxYVFIcTQ4YU04OERad3Jk?=
 =?utf-8?B?cGZvUHkrZFJJejZEeDJyL1I5YkNKd005a0lQSTlqOTFVWXVHUjNqeFd1TVVZ?=
 =?utf-8?B?ajFiTGQvYWRFM1QxcU92THVtajA3ZGd5Q3hrNmM1R243bzNJL2FHNHR2TXVO?=
 =?utf-8?B?OHRlSjdTc0tQVTVBRDhIMWthMXBJVm10YjhpNFJMWmVTei9OSHoxWi9VN3NS?=
 =?utf-8?Q?b9pS+3MLikqwWbxWHrsjkCEKWrQ9aS/v?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0MzUndTNlczU2dYQ0FyR1BYbWpZUU5LcUUvNFR3azcxOFk0bEVCZDMybzFR?=
 =?utf-8?B?cXZJWEMvck8rZm1kZERXNEhJSk5rK0hIQ0VTZ200N0xzNENOOG9Qa28vVG1X?=
 =?utf-8?B?RmNQWnBTYWQ1RmRSNi9ORXpKclpIdWZITjVQNXNHckFsQkFWMXdmS1FqL1or?=
 =?utf-8?B?R3R1TWlXaVp1UXNFRGtCOERuMHRpR1k4ZTRkYlZWMlI3cGFZcHVQWnlGdmZU?=
 =?utf-8?B?aTc0SVBMRDlvWmxycXVDUlJxRDlsRXF0aTIwaFJRYlBIU1hEcENNeXpOaTND?=
 =?utf-8?B?L1NtUVRMUUxDaHJ3T2ZaSEdEamdrTHREN1pOdXl1M0tpRS9sQ2ZCckVZUXYv?=
 =?utf-8?B?d0hXUlk1ZDljN2Q2d3UzVExZM0U5cnJiTkFvbDUzdWVIckxjRjVyVTJXakFo?=
 =?utf-8?B?N01UT1YxdHVKY1FyVHhJM3h2Y3pxZWpBNkQ5cUpERXc1SlVYZ1ZjYmdvZU5t?=
 =?utf-8?B?dXJ2NkUxMGNFQWQ5VjF5TXN0NEtVRnFyQTRNMEQrV3lrSEtwTUVNRzF5SEtN?=
 =?utf-8?B?cUIzZHlKNVAwWHkwN0xMNTdld2NWRkh2Q0JqdC9XdVBWMkRvTk5tbFZ3NXQ3?=
 =?utf-8?B?ZmFoclRtQzI0UHpWQkFaTTBjVmVvQ3lsU0plWUVzaDR5cUZMQXhYaXRqQ2VM?=
 =?utf-8?B?TElXWWM0YmNUOWMwcmU5d0VyS1J5aHVHbW1raXZUL2daalBOYTkyL1lmalhH?=
 =?utf-8?B?cTVoNHdJa0dGM2JpQnkrb01qWjdnQ3hnWVZhQm1jaTlTczZ1SUpPWkJqMXgx?=
 =?utf-8?B?TmtYWGRZRjNQMjFOUTZwSGZqRXF3am4ydTFhek11ci9abzlMUDNZWlhpR2Nu?=
 =?utf-8?B?WmVRQjMvL2drQTFvL1p3VWI3eFNXOXlkaXMrcTlkT0Z6TjVKWEVYanZzV1BM?=
 =?utf-8?B?cXFXVE5SNHNXTTJGNkRHZnNaVDRrOGhDTkw1TXRUYWt5WDhUNGpvdnlMQ1Mx?=
 =?utf-8?B?YVREb09PTkM4b0dNK0VQOG1obkR6cGRTV2Njb243MXlmdk5oQ2dHTFFwNTht?=
 =?utf-8?B?RVhZblRyU1NMeFFyNGlydDk3RmxiUEZvRTRWaExvRmxmempFb1ZZZVRodGV1?=
 =?utf-8?B?bU8xWnZXeFR2SkxUUkZjTW5DNG5FaVZsNnFjMzIyUEJoTDRBNW1QckJqOFlK?=
 =?utf-8?B?UDFzR3RaZTZTT1BwRE1GQzNjMkhOS1I1UE5jb1lseWtzQksrZkZMTHdhZVJ1?=
 =?utf-8?B?NzZTNndwSXN5WFZJaHBuMWE4aW5ZbmgxM3NvUU1GYkZMakF1RzFXTVQ0TUFY?=
 =?utf-8?B?eEo4ZHdMRmlwbzFnRGt2cEorUGlha0t2RFlRZ1RJRnhhSHJqYUZjSGYrQW9O?=
 =?utf-8?B?cXk4ZlhhWHFqcVExNDZDcmFnRk0zck1FRGVNczlvQnVQd2dmcU50d2VNTDZE?=
 =?utf-8?B?aHM2UDVYdWQ4Z24yMXRkb1dlUTBMS01hbUdoN2xJNy91dFFxK1JlQXdMbDVy?=
 =?utf-8?B?Y0Vic2hwMnZ5bTdldzgzNFIxUUhpamNJZWZmM3dsRWY5MTJ2RGNlaWZmYUdM?=
 =?utf-8?B?bHMxZGh0c2ZHWnpnSmk5Mlg5bmpieldKSlpkdktHdWpoeWNadUJzaU1Wemlo?=
 =?utf-8?B?L3hWQVRicVR2Ymh5Q081NDhzM1RqdXlxYmFlb0JBcVlpNmMrMnRVclo4ZmZW?=
 =?utf-8?B?bEJiRFZMQ3E1SFUzM29sTDZNQ1VaOWwxUmJ6U2c5TXByOC9mdjMxUTVKWVpC?=
 =?utf-8?B?Wjl6SitzZERVMUx1MFVQR1ZzYkMxQUVoNndMMTF6cU1mdnpqMGwySXVic3h6?=
 =?utf-8?B?M3FCbzBzeVNnUGFNYXI1dUNNYTJmV3krSnZrRWJuUEFTSnpCTUtTSG9SSWpT?=
 =?utf-8?B?TTJXKzVqamNEZG0wSkl2TU5ycTczTEhsQ0JxU3dGODU2UE9iL1dLWVRaOS96?=
 =?utf-8?B?MEw0dnpRQ0lubUFoVlN3MmZTNDZFems2K0w4R05wRHpPcmVESEFONUJEQUpF?=
 =?utf-8?B?cFJUcTViR1NLWEN5eTFSQWRKVlY1N0xoaUtNam9tU05yYzh2S3dLRit6YjZz?=
 =?utf-8?B?M1ZoT25XZmlETUNxSVJZSnhJckxXdkVtRnlaenhBTkpkSStrQ3ROUVlkVHpP?=
 =?utf-8?B?S29BajlqdnRTOVZ6YnlsQi8yNWJ3YTNZYW56a0JLd1dMNWRURUtVTnVOOVBw?=
 =?utf-8?Q?83B/gNSy3O1wRjc+4Hk0IBF3S?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca443ca7-4cac-4c1f-c787-08dd1f2b8ec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 06:16:49.5190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0dUG1ds7s15KWoAySB9uRZBz9yLLlRDfSN9OdAKWL61jhoG6/tgjIC3a3hKkJpD791ocOAgIKNInz5zYMuvo1O+JpRUTMA+h8dC354CIGPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
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

SGkgQ2hyaXN0aWFuLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC80XSBjb3Zlci1sZXR0ZXI6
IEFsbG93IE1NSU8gcmVnaW9ucyB0byBiZSBleHBvcnRlZA0KPiB0aHJvdWdoIGRtYWJ1Zg0KPiAN
Cj4gDQo+PiAJSSB3aWxsIHJlc2VuZCB0aGUgcGF0Y2ggc2VyaWVzLiBJIHdhcyBleHBlcmllbmNp
bmcgaXNzdWVzIHdpdGggbXkgZW1haWwNCj4+IGNsaWVudCwgd2hpY2ggaW5hZHZlcnRlbnRseSBz
cGxpdCB0aGUgc2VyaWVzIGludG8gdHdvIHNlcGFyYXRlIGVtYWlscy4NCj4gDQo+IA0KPiBBbHRl
cm5hdGl2ZWx5IEkgY2FuIGFsc28gY29weSB0aGUgY29kZSBmcm9tIHRoZSBsaXN0IGFyY2hpdmUg
YW5kIGV4cGxhaW4gd2h5DQo+IHRoYXQgZG9lc24ndCB3b3JrOg0KPiANCj4gK3ZvaWQgdmZpb19w
Y2lfZG1hX2J1Zl9tb3ZlKHN0cnVjdCB2ZmlvX3BjaV9jb3JlX2RldmljZSAqdmRldiwgYm9vbA0K
PiArcmV2b2tlZCkgew0KPiArICAgIHN0cnVjdCB2ZmlvX3BjaV9kbWFfYnVmICpwcml2Ow0KPiAr
ICAgIHN0cnVjdCB2ZmlvX3BjaV9kbWFfYnVmICp0bXA7DQo+ICsNCj4gKyAgICBsb2NrZGVwX2Fz
c2VydF9oZWxkX3dyaXRlKCZ2ZGV2LT5tZW1vcnlfbG9jayk7DQo+IA0KPiBUaGlzIG1ha2VzIHN1
cmUgdGhhdCB0aGUgY2FsbGVyIGlzIGhvbGRpbmcgdmRldi0+bWVtb3J5X2xvY2suDQo+IA0KPiAr
DQo+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHByaXYsIHRtcCwgJnZkZXYtPmRtYWJ1
ZnMsIGRtYWJ1ZnNfZWxtKSB7DQo+ICsgICAgICAgIGlmICghZG1hX2J1Zl90cnlfZ2V0KHByaXYt
PmRtYWJ1ZikpDQo+IA0KPiBUaGlzIGhlcmUgb25seSB3b3JrcyBiZWNhdXNlIHZmaW9fcGNpX2Rt
YV9idWZfcmVsZWFzZSgpIGFsc28gZ3JhYnMgdmRldi0NCj4gPm1lbW9yeV9sb2NrIGFuZCBzbyB3
ZSBhcmUgcHJvdGVjdGVkIGFnYWluc3QgY29uY3VycmVudCByZWxlYXNlcy4NCj4gDQo+ICsgICAg
ICAgICAgICBjb250aW51ZTsNCj4gKyAgICAgICAgaWYgKHByaXYtPnJldm9rZWQgIT0gcmV2b2tl
ZCkgew0KPiArICAgICAgICAgICAgZG1hX3Jlc3ZfbG9jayhwcml2LT5kbWFidWYtPnJlc3YsIE5V
TEwpOw0KPiArICAgICAgICAgICAgcHJpdi0+cmV2b2tlZCA9IHJldm9rZWQ7DQo+ICsgICAgICAg
ICAgICBkbWFfYnVmX21vdmVfbm90aWZ5KHByaXYtPmRtYWJ1Zik7DQo+ICsgICAgICAgICAgICBk
bWFfcmVzdl91bmxvY2socHJpdi0+ZG1hYnVmLT5yZXN2KTsNCj4gKyAgICAgICAgfQ0KPiArICAg
ICAgICBkbWFfYnVmX3B1dChwcml2LT5kbWFidWYpOw0KPiANCj4gVGhlIHByb2JsZW0gaXMgbm93
IHRoYXQgdGhpcyBoZXJlIG1pZ2h0IGRyb3AgdGhlIGxhc3QgcmVmZXJlbmNlIHdoaWNoIGluIHR1
cm4NCj4gY2FsbHMgdmZpb19wY2lfZG1hX2J1Zl9yZWxlYXNlKCkgd2hpY2ggYWxzbyB0cmllcyB0
byBncmFiIHZkZXYtDQo+ID5tZW1vcnlfbG9jayBhbmQgc28gcmVzdWx0cyBpbiBhIGRlYWRsb2Nr
Lg0KQUZBSUNTLCB2ZmlvX3BjaV9kbWFfYnVmX3JlbGVhc2UoKSB3b3VsZCBub3QgYmUgY2FsbGVk
IHN5bmNocm9ub3VzbHkgYWZ0ZXIgdGhlDQpsYXN0IHJlZmVyZW5jZSBpcyBkcm9wcGVkIGJ5IGRt
YV9idWZfcHV0KCkuIFRoaXMgaXMgYmVjYXVzZSBmcHV0KCksIHdoaWNoIGlzIGNhbGxlZA0KYnkg
ZG1hX2J1Zl9wdXQoKSB0cmlnZ2VycyBmX29wLT5yZWxlYXNlKCkgYXN5bmNocm9ub3VzbHk7IHRo
ZXJlZm9yZSwgYSBkZWFkbG9jaw0KaXMgdW5saWtlbHkgdG8gb2NjdXIgaW4gdGhpcyBzY2VuYXJp
bywgdW5sZXNzIEkgYW0gb3Zlcmxvb2tpbmcgc29tZXRoaW5nLg0KDQpUaGFua3MsDQpWaXZlaw0K
DQo+IA0KPiArICAgIH0NCj4gK30NCj4gDQo+IFRoaXMgcGF0dGVybiB3YXMgc3VnZ2VzdGVkIG11
bHRpcGxlIHRpbWVzIGFuZCBJIGhhZCB0byByZWplY3RlZCBpdCBldmVyeSB0aW1lDQo+IGJlY2F1
c2UgdGhlIHdob2xlIGlkZWEgaXMganVzdCBmdW5kYW1lbnRhbGx5IGJyb2tlbi4NCj4gDQo+IEl0
J3MgcmVhbGx5IGFzdG9uaXNoaW5nIGhvdyBwZW9wbGUgYWx3YXlzIGNvbWUgdXAgd2l0aCB0aGUg
c2FtZSBicm9rZW4NCj4gcGF0dGVybi4NCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4g
DQo+IA0KPiANCj4gDQo+IA0KPiANCj4gDQo+IAkJQXBhcnQgZnJvbSB0aGF0IEkgaGF2ZSB0byBy
ZWplY3QgdGhlIGFkZGluZyBvZg0KPiBkbWFfYnVmX3RyeV9nZXQoKSwgdGhhdCBpcyBjbGVhcmx5
IG5vdCBzb21ldGhpbmcgd2Ugc2hvdWxkIGRvLg0KPiANCj4gDQo+IA0KPiAJVW5kZXJzdG9vZC4g
SXQgYXBwZWFycyB0aGF0IFZpdmVrIGhhcyBjb25maXJtZWQgdGhhdCBoaXMgdjIgaGFzDQo+IHJl
c29sdmVkIHRoZSBpc3N1ZS4gSSB3aWxsIGZvbGxvdyB1cCB3aXRoIGhpbSB0byBkZXRlcm1pbmUg
aWYgaGUgcGxhbnMgdG8NCj4gcmVzdW1lIGhpcyBwYXRjaCwgYW5kIGlmIHNvLCBJIHdpbGwgYXBw
bHkgbXkgbGFzdCBwYXRjaCBvbiB0b3Agb2YgaGlzIHVwZGF0ZWQNCj4gcGF0Y2ggc2VyaWVzDQo+
IA0KPiAJVGhhbmtzLA0KPiAJV2VpIExpbg0KPiANCj4gDQo+IAkJVGhhbmtzLA0KPiAJCUNocmlz
dGlhbi4NCj4gDQo+IA0KPiANCj4gDQoNCg==
