Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1ABA42250
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C8110E405;
	Mon, 24 Feb 2025 14:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="AhCtSb4G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Sun, 23 Feb 2025 18:32:08 UTC
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CEB10E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 18:32:08 +0000 (UTC)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 51NIAENf029494;
 Sun, 23 Feb 2025 10:26:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=s2048-2021-q4; bh=63hrzc7EkquZjHzYJ/Ly
 ex8d29/8p0ccutz3uhzsRb4=; b=AhCtSb4G5R+PCLP97nMhi5SDtS7jZQ1o+Bpb
 HgUhYdtY7kcwJ9sorNBQE1bRgcHKOCMWBVH/kEXR1cWR+tZpkNpXZc5b8Em7jSXg
 D9PVXOqwLglZFrShP9ItSzeT7EYmq5v5pdYqpht37fHxZ4muGtzlj2FxfKrp/YSu
 lOLHMQegjHTBHhhCMHp+ZLuKKcEllO6x2zNiFci/eDBmjs3h12aGf6OoXDI5jFYg
 ChYv68yzJQtxc5P/zMs291xZ9ElYXbz+4DStSRuiKgCDXu7VqPlZJepXTCs0PHB4
 mSxbNuXqKzxizQqMJkgPGF6dgfQo5Flc+tqJlXukGWwqiaR/rg==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by m0001303.ppops.net (PPS) with ESMTPS id 4508q882u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Feb 2025 10:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLw8vV66Pfc2Kt1HlzLt28INDynuhShAsDHdbe/HAjoTqtw7JJiOkm1ND/q0Vvs/yWlHegVjh/cHhHQfaqm6rdPuRb2PPcWmLU941RbHYSD1Yr1j4zjJxm1+5jZu6d3GZ+vK0skEqa+xp2jSTwYvx28veGnGODHyMOB+zsSRXq3X1IAG8VYsdJxm7Ms/+xPpt9Rzzazn9EWCozBpVK/ovK4FaraF/Tuvx5MDHNHS3eQs+3t6N68YNR7IT/JuWC4eEu4215aOYL6aGvMfRyCES1UiQS+HvYiorvzeBH2rFh2VxBtktjWpguRKDF87HgE2QnMpS6yBcwoER6Kq4mFlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5FURdj4jN4bUTWa1tXmY0Uu4x+R2fGs41+AOgrcVUg=;
 b=VFqUMtSBJ7yXWBwWsziy7Xn+q/RviSm9hKWJe61dECfKXKshBs126NGFJliyqHiUPMQNFs+4fzJkWL1hmg1njUGAzYTfMjGgSWHZZEzN0rBO6Nu6903fbJ99F4BD3eKM2Tlret5MjSgC94ixAunuYRV5ng8RZjneocKgOT83Z8sVC7ZjgHijubaXNuDTYl/5LDQzwmu9lD2tVZRL0W1S8lGHvdoHegFjpyBRmNwAf26bx0bYmAlRaU/mdCynY0mknyOGpTHvmfXS+VJStikxh3h4AQU+EcPB3rcKIKXhumO387xVewi+bsoAun8iRS3dKwJ+hEjSzAD9Bm3lQW1diw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5258.namprd15.prod.outlook.com (2603:10b6:806:22a::12)
 by PH3PPF62EA23344.namprd15.prod.outlook.com (2603:10b6:518:1::4a9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Sun, 23 Feb
 2025 18:26:35 +0000
Received: from SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c]) by SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c%5]) with mapi id 15.20.8466.015; Sun, 23 Feb 2025
 18:26:35 +0000
From: Wei Lin Guay <wguay@meta.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
CC: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes
 <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>, Nicolaas
 Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>, Maor
 Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6O5Loc/d/3VGEWjEKeLiKCgu7LpIlYAgAE6MQCAATnSgIBqC0IA
Date: Sun, 23 Feb 2025 18:26:35 +0000
Message-ID: <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5258:EE_|PH3PPF62EA23344:EE_
x-ms-office365-filtering-correlation-id: 71d73278-a5db-4a90-591d-08dd54379ac9
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|8096899003|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZGpQSTdLUzJyd2V3SjlRSFVabHFRTEdZZCtkNG1hVGxGY2NqMkwyenN1bVB6?=
 =?utf-8?B?dDJxcEk1MUljUmM2K044VjR1OW5qeThJOWRJdjNKQi9WdzRta1ZMSExoQnpR?=
 =?utf-8?B?QWZzaTFsWjNJMzNIcEJMVloxR0ZHb0dkYmJEbHdML25TTjlvZ1VDQWwzNktR?=
 =?utf-8?B?bnBDRmFBYjd1aGpzenkyTHZNR2UwQjFoT3M3ektMNmxwdVlXdTlXYkxmcG5h?=
 =?utf-8?B?L2VhR2hOcmc5bDgvRXlmUWpHMUh0cnpCcGtKMHZhQTlUQXg1b3VDOHNoelhR?=
 =?utf-8?B?VHlPWWwzVm9lSnVZRkRKVHNrUzlydDlBQWtzcHIyNnV2d3FVRXovKzF3Nldw?=
 =?utf-8?B?M2RsUkFxMHU2WU5UL0x6MFNhVE5BcXRSZWprMG5aWXNpUXk5WWp0djJJM04x?=
 =?utf-8?B?ZU5CZEpVaE83emdmejc1TUlkOWhoQVFqWHdyaWJKeFI4enBsaDh6Z2p1Zkl0?=
 =?utf-8?B?WEtXZFpRT21NQTRGLzYvMVJtR1dVcDkwelVmWG5wc2hSODA0VWQzNmh4T25r?=
 =?utf-8?B?bTRxRk5mNXl6WXRYL0xWQ1VOWmRVOTdsMEgxMWZvT1dPSGk1bjZ5V2RsY0hW?=
 =?utf-8?B?SmlwdURtTEhjZWQvcEx5SEZNWEtSK1BUY3duak0wU3VtSldCbWlCTWpnVjkr?=
 =?utf-8?B?VFF0NytxNTJIWFBCQUdYVTJqczdzbEluL1l5RE9JN1loY3VvSXVBckNYM1Y5?=
 =?utf-8?B?NWZKdWhkZ3ZQZExJTjc1eVZTTHJoUEJZQWl2VVlvUUJnQzYvZXI5Y1ZYRGFw?=
 =?utf-8?B?TjJsSm5OODJsc2ptT3J1cUl0Y3pNd2lHV2JRK3JpaXNrNWt6MGMwOURaR0ZM?=
 =?utf-8?B?MG9qTDZtMzl6MitqYS9EY1pzUlZremZzV3F5NFNjeHp3czNlbC9XUnpnVGsz?=
 =?utf-8?B?ZFJSUTVqU2IyVm82cHUzSHIyL29YYnQyUTNzQjVPZ2dkSHVQeUFjaHh1ZkYy?=
 =?utf-8?B?WVpiOTd5ekxySWpjL1ppeVFHSDNFVzVsK1ZBZmRDNGlNSmpxMDA5eDA3a1N3?=
 =?utf-8?B?WURYcWdicG13dkV2cVoydTR0QnBYcHMxK3lkbkpZTURaakxIcXU2aTBSRmFI?=
 =?utf-8?B?eW53Q1pWTWh5UHFpL0lMWXpMb1haVnM2UzhuRVVLcElsb0hvZ1lVa0g1YlUv?=
 =?utf-8?B?SCtDRnhZUXVJaWMzRmtOSnplOTNnNy82Z3RFRHU0SXVtUis1UjRNeC9FV2Vy?=
 =?utf-8?B?VHNiRG02T3FGa0Mvamo4ZW9NR21Tcm5UMWtoeHM4cmkvanhsbDFwMUVxeE9Q?=
 =?utf-8?B?SGxpelpnMnRRelgweGkwQ0dDTVcxRkNBM1FNNDlZRnRCVnNBTGxXMFNKOGJi?=
 =?utf-8?B?NHZ1eU1TVml6OUdSYnVWVThiV2hHZ3VhNG1POUZMQWJLZGdhTVRCRGVxSWp5?=
 =?utf-8?B?VitjdFJyNkphWHdXMjNhdnlMNmcvdWg5WDZSYk1lZHpFSEJVR1JMRDAvbVQ3?=
 =?utf-8?B?SERrYmhxZXhEbmpVeUt4cGoyb3lGTkpsUHJJUXczOTUrWTE1TWpuKzJKRDd5?=
 =?utf-8?B?WktSYjJ4dkh2RDBTUEpON0RwUjNtZmwzVGlhd1kveVkrUkhsZW94anQwdldo?=
 =?utf-8?B?WVFoRUxucnBlMG1mVkRITE5GWHlZWkc1SnZLY0lsbTJJNmFmTVVLQTFsaG1u?=
 =?utf-8?B?QU4wc1lrMjc1d09aWVhVSmtiK1VGSUErekkxNzJPVXJ0Z1FzeGJGUS9XYjh4?=
 =?utf-8?B?ZTNEb25IeTZyUmhWMVlWdXVEOHBtNVAwd0x0RTFoaFkrWW9DelpUNEJRcStP?=
 =?utf-8?B?TEFUMjBOdm9nMzIvWGUrVjhpOFZNMnV6amZiNmszOEVWeEt3Sld6Z3Z2K0RN?=
 =?utf-8?B?alNqWHVVOU1EVDQ3UnhWd0RLdjUwblI5eVBHeGZKUXlmZks3aFVNYy9rTXcz?=
 =?utf-8?Q?WJsMZVO5r8MvB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5258.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(8096899003)(7053199007)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVgzWTk2ZnNIdVFKTkxURGVkek5zSkNxNW85bmdOcnR1MGUra3hpZmg1dGEv?=
 =?utf-8?B?VFFJUE9adEZnOEE4U1p5UDRtUytCdzlTTXRSSjVNZ2VQVGVVNU9vVjVFSmpD?=
 =?utf-8?B?anF3T3dIckJWVUYvTHBUTjcwNmlCaEFtUXZjWHV1SHppOFJHNlR3QUxLVmVv?=
 =?utf-8?B?MXZDVlh2ZzZHU1ZGY2hVQnBCby9xamlYS3NnYmdlTU5hZ09uWmdqY0cxeGxo?=
 =?utf-8?B?b3hqNU9uV1ZuWmtBalIrVE9XR3VMUUgyRnppUjMvOFgvVHBxemM5UjAvYnlt?=
 =?utf-8?B?cGwwOW85U1RnVlFzcmFRN1hWTENXZ2dUT0k0b2tGYStyeTdFYjlDQjFPTXR6?=
 =?utf-8?B?eGltYlNzM1JpUTUvZzZkUmZlR1RQb0VGOVBRWlk5ZFFkdkhyWGFOTXB1V3Qr?=
 =?utf-8?B?d0NaMFd3L0NWMHVMOW5yYnM0SXAxKyt1amw0c0U3ekRpdHlFT3AvMVRYdkZN?=
 =?utf-8?B?azJ5OUdUTE95cy8rdmg1WVVxZFpSNjBzelU5ai9pS2pROXJpME9MdUtSeE5B?=
 =?utf-8?B?ZnZ5dm51V0I4K3IvdWhxTC9rL0xSRXZLTXVxSEdNVkhodTRpcE9RYlNxZEVG?=
 =?utf-8?B?YVZ5Z29oMDZiTUtDTVFLYXgwdnNuSGpXcjVIWk5XZWJtelRtSlBEVFFvTnJR?=
 =?utf-8?B?UzJhanUrMUxna2xOY2pjSlh4ajNidGhtSDdlZ1F0VSs4ZUlreUYzd2NiNWt0?=
 =?utf-8?B?RnBacnNpa05scC9CL3ovb0Y3cTBxM3FWZ2ZpRnc2NU1FTlJscjVNM0FQbW5x?=
 =?utf-8?B?Qm9uTU8xdjc0WjNrUTJrRmxhaHEyQkVweFoxM25jMExYU1EyQU1EMitFRUNW?=
 =?utf-8?B?V0tFRGRVc3FJTTJnYVV3THBEMDVEZFpjMmNxV2FBMnR0NHNCdFZVNHUxQTU0?=
 =?utf-8?B?eUlMU3lUWlpWaENHaFBQRk5ac3Y4ZUpmZnlBZm1LU0RiTzR3WFpqNlUvQ1Jw?=
 =?utf-8?B?U1oyMjNVNXIzdWRYTkkyQ3RKU25mVlVYMG83OHJ3THpkVWRyMzlwWFluYjVX?=
 =?utf-8?B?RlR5amEwSE9MR0hNYUpsS3l0SnBEOXlTRjFKVlo2THFFY3NEZkttKzB1bGhS?=
 =?utf-8?B?ekorS3BqVkVJZ3JUcEt4WnQySmZxMGVRejRFNmtYOEE4dGpkbktRek0rSVpZ?=
 =?utf-8?B?MUZ3U1E5OUFDOTU0VVV0TCt3V3JtajkrQnphZlkzMHlhWlpMM29aY2M2S0x0?=
 =?utf-8?B?SkpoV1ZObW5GUkNFNTBFTURWWXFnRCs2MitUcXdtcFR3a0V4SkVwUTBpVnJO?=
 =?utf-8?B?YVRsbThyVUJxRnRibHp6eU5VY1RTcmsyVWhzOW8wZUVjRzBsTklHSWdhVktu?=
 =?utf-8?B?d3lhb3RIWnZnUnRKdmF4TTFSRW1hZUdqbVFvUWh0UHVKc213QWdGME9EU2Zo?=
 =?utf-8?B?YnFEOVNRT0U1bnViWGplazBHL0s5dFR3VHp5bVBDL0NZeEdOa0tZMkd4bnhE?=
 =?utf-8?B?SXpPUDNsUmVFVTBLeEUvSzQ1SHFIRmI2Z1VQdkQzWlhCQlBxWkc4T09EY21o?=
 =?utf-8?B?dHBpb2JKMlJLYndlT2NUcGxHZkFIN2Q3RkMwY0hTNk9pcld6ZnZMcXNiOVgw?=
 =?utf-8?B?ZlRkbCtvbmtUS2E1UlB5QkRkcjBLZXVzditPMmFMK1g2SndmdG9LSlV3MDBq?=
 =?utf-8?B?YUpSZXExL3hmaWVDNlh0Z3NJRWN2WUJ3VUk4Y0wwckxWcjZ5ZzZ4TkJzQVVM?=
 =?utf-8?B?MVo5RzlhYVk1MlNjN3g1cksvdzk5RTZFSk9qNnBJeXVUYVlqSXdTSi9LU2hI?=
 =?utf-8?B?eWI5b1p0M0NlekFyeVg2OVR2empWekdHam1oQjRUYU5TUVEwQlBzWTl2cjA4?=
 =?utf-8?B?YjZWMVRrSTU2M2tjREVLL1RRVGVDSHhMZTdaRlp4bkY2cko3RDgzMENObHhO?=
 =?utf-8?B?WkkzZnBpYVNORjd6ZnJYZ1hLUHg1SkJzLzRHNTVsRnYvQ0xkK2E5ODRmdnBC?=
 =?utf-8?B?a2JzcVdHWTlONWVGeUUraWtFS3Zhdnp6S0xIVlA1d1FIMkswclZlSzFYQkhR?=
 =?utf-8?B?SkVnUkRYa0h2V09CQWY4VVhyMnFFQWtudzdwVkFXNjdrVG9TRDd0c3NXWXdS?=
 =?utf-8?B?REdIVVBpNU55cnk1cVdiL1RyTFRGRkZoclptZEhDQStkOFFINjFOalFpZWc4?=
 =?utf-8?Q?gbiFe/fNhOHXuPsWuyNuZ7FoU?=
Content-Type: multipart/alternative;
 boundary="_000_61DF4F0ED947436B9160A40079DB9085metacom_"
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5258.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d73278-a5db-4a90-591d-08dd54379ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2025 18:26:35.2862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DGtsebKbcDvhk008XOBhUoJgM6Tl+Y38ZfMTbGGpB2xOJOhqtyL4BGZvKbDcLP0u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF62EA23344
X-Proofpoint-ORIG-GUID: gZ8I_LvC5tcRi1XR4HJG_LhWI-th-VDb
X-Proofpoint-GUID: gZ8I_LvC5tcRi1XR4HJG_LhWI-th-VDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-23_08,2025-02-20_02,2024-11-22_01
X-Mailman-Approved-At: Mon, 24 Feb 2025 14:05:04 +0000
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

--_000_61DF4F0ED947436B9160A40079DB9085metacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Vivek,

On 18 Dec 2024, at 08:02, Kasireddy, Vivek <vivek.kasireddy@intel.com> wrot=
e:

Hi Wei Lin,

Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
through dmabuf

From: Wei Lin Guay <wguay@meta.com>

This is another attempt to revive the patches posted by Jason
Gunthorpe and Vivek Kasireddy, at
https://patchwork.kernel.org/project/linux-media/cover/0-v2-
472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/

https://urldefense.com/v3/__https://lwn.net/Articles/970751/__;!!Bt8RZUm
9aw!5uPrlSI9DhXVIeRMntADbkdWcu4YYhAzGN0OwyQ2NHxrN7bYE9f1eQBX
UD8xHHPxiJorSkYhNjIRwdG4PsD2$
v2: https://lore.kernel.org/dri-devel/20240624065552.1572580-1-
vivek.kasireddy@intel.com/
addresses review comments from Alex and Jason and also includes the
ability
to create the dmabuf from multiple ranges. This is really needed to future-
proof
the feature.

The good thing is that your patch series addressed Christian=E2=80=99s conc=
erns of
adding dma_buf_try_get().
No, it did not address his concern. In v2, instead of adding a new function=
, we
are now calling get_file_rcu() directly, which was suggested by Christian i=
n the
old original review.


However, several questions regarding your v2 patch:
- The dma-buf still support redundant mmap handler? (One of review
comments from v1?)
Yeah, the mmap handler is really needed as a debugging tool given that the
importer would not be able to provide access to the dmabuf's underlying
memory via the CPU in any other way.

- Rather than handle different regions within a single dma-buf, would vfio-
user open multiple distinct file descriptors work?
For our specific use case, we don't require multiple regions and prefer
Jason=E2=80=99s original patch.
Restricting the dmabuf to a single region (or having to create multiple dma=
bufs
to represent multiple regions/ranges associated with a single scattered buf=
fer)
would not be feasible or ideal in all cases. For instance, in my use-case, =
I am
sharing a large framebuffer (FB) located in GPU's VRAM. And, allocating a l=
arge
FB contiguously (nr_ranges =3D 1) in VRAM is not possible when there is mem=
ory
pressure.

Furthermore, since we are adding a new UAPI with this patch/feature, we can=
not
go back and tweak it (to add support for nr_ranges > 1) should there be a n=
eed in
the future, but you can always use nr_ranges =3D 1 anytime. That is why it =
makes
sense to be flexible in terms of the number of ranges/regions.



Also, my understanding is that this patchset cannot proceed until Leon's
series is merged:
https://lore.kernel.org/kvm/cover.1733398913.git.leon@kernel.org/

Thanks for the pointer.
I will rebase my local patch series on top of that.
AFAIK, Leon's work includes new mechanism/APIs to do P2P DMA, which we
should be using in this patchset. And, I think he is also planning to use t=
he
new APIs to augment dmabuf usage and not be forced to use the scatter-gather
list particularly in cases where the underlying memory is not backed by str=
uct page.

I was just waiting for all of this to happen, before posting a v3.

Is there any update or ETA for the v3? Are there any ways we can help?

Additionally, do you have any repo that we can access to begin validating o=
ur user API changes. This would greatly aid us in our software development.

Thanks,
Wei Lin

Thanks,
Vivek


Thanks,
Wei Lin



Thanks,
Vivek


In addition to the initial proposal by Jason, another promising
application is exposing memory from an AI accelerator (bound to VFIO)
to an RDMA device. This would allow the RDMA device to directly access
the accelerator's memory, thereby facilitating direct data
transactions between the RDMA device and the accelerator.

Below is from the text/motivation from the orginal cover letter.

dma-buf has become a way to safely acquire a handle to non-struct page
memory that can still have lifetime controlled by the exporter. Notably
RDMA can now import dma-buf FDs and build them into MRs which
allows
for
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
from PCI device BARs.

This series supports a use case for SPDK where a NVMe device will be
owned
by SPDK through VFIO but interacting with a RDMA device. The RDMA
device
may directly access the NVMe CMB or directly manipulate the NVMe
device's
doorbell using PCI P2P.

However, as a general mechanism, it can support many other scenarios
with
VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
generic and safe P2P mappings.

This series goes after the "Break up ioctl dispatch functions to one
function per ioctl" series.

v2:
- Name the new file dma_buf.c
- Restore orig_nents before freeing
- Fix reversed logic around priv->revoked
- Set priv->index
- Rebased on v2 "Break up ioctl dispatch functions"
v1: https://lore.kernel.org/r/0-v1-9e6e1739ed95+5fa-
vfio_dma_buf_jgg@nvidia.com
Cc: linux-rdma@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Maor Gottlieb <maorg@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Jason Gunthorpe (3):
vfio: Add vfio_device_get()
dma-buf: Add dma_buf_try_get()
vfio/pci: Allow MMIO regions to be exported through dma-buf

Wei Lin Guay (1):
vfio/pci: Allow export dmabuf without move_notify from importer

drivers/vfio/pci/Makefile          |   1 +
drivers/vfio/pci/dma_buf.c         | 291 +++++++++++++++++++++++++++++
drivers/vfio/pci/vfio_pci_config.c |   8 +-
drivers/vfio/pci/vfio_pci_core.c   |  44 ++++-
drivers/vfio/pci/vfio_pci_priv.h   |  30 +++
drivers/vfio/vfio_main.c           |   1 +
include/linux/dma-buf.h            |  13 ++
include/linux/vfio.h               |   6 +
include/linux/vfio_pci_core.h      |   1 +
include/uapi/linux/vfio.h          |  18 ++
10 files changed, 405 insertions(+), 8 deletions(-)
create mode 100644 drivers/vfio/pci/dma_buf.c

--
2.43.5


--_000_61DF4F0ED947436B9160A40079DB9085metacom_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-ID: <EA079115F35C29498AEFCC4598884BEE@namprd15.prod.outlook.com>

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
Hi Vivek,<br id=3D"lineBreakAtBeginningOfMessage">
<div><br>
<blockquote type=3D"cite">
<div>On 18 Dec 2024, at 08:02, Kasireddy, Vivek &lt;vivek.kasireddy@intel.c=
om&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; text-decoration: none; float: none; display: inline !important;"></=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Hi
 Wei Lin,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;">
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported<br>
through dmabuf<br>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><br>
From: Wei Lin Guay &lt;wguay@meta.com&gt;<br>
<br>
This is another attempt to revive the patches posted by Jason<br>
Gunthorpe and Vivek Kasireddy, at<br>
https://patchwork.kernel.org/project/linux-media/cover/0-v2-<br>
472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/<br>
<br>
</blockquote>
</blockquote>
https://urldefense.com/v3/__https://lwn.net/Articles/970751/__;!!Bt8RZUm<br>
9aw!5uPrlSI9DhXVIeRMntADbkdWcu4YYhAzGN0OwyQ2NHxrN7bYE9f1eQBX<br>
UD8xHHPxiJorSkYhNjIRwdG4PsD2$<br>
<blockquote type=3D"cite">v2: https://lore.kernel.org/dri-devel/20240624065=
552.1572580-1-<br>
</blockquote>
vivek.kasireddy@intel.com/<br>
<blockquote type=3D"cite">addresses review comments from Alex and Jason and=
 also includes the<br>
</blockquote>
ability<br>
<blockquote type=3D"cite">to create the dmabuf from multiple ranges. This i=
s really needed to future-<br>
</blockquote>
proof<br>
<blockquote type=3D"cite">the feature.<br>
</blockquote>
<br>
The good thing is that your patch series addressed Christian=E2=80=99s conc=
erns of<br>
adding dma_buf_try_get().<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">No,
 it did not address his concern. In v2, instead of adding a new function, w=
e</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">are
 now calling get_file_rcu() directly, which was suggested by Christian in t=
he</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">old
 original review.<span class=3D"Apple-converted-space">&nbsp;</span></span>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;">
<br>
However, several questions regarding your v2 patch:<br>
- The dma-buf still support redundant mmap handler? (One of review<br>
comments from v1?)<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Yeah,
 the mmap handler is really needed as a debugging tool given that the</span=
><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">importer
 would not be able to provide access to the dmabuf's underlying</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">memory
 via the CPU in any other way.</span><br style=3D"caret-color: rgb(0, 0, 0)=
; font-family: Helvetica; font-size: 12px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;">
- Rather than handle different regions within a single dma-buf, would vfio-=
<br>
user open multiple distinct file descriptors work?<br>
For our specific use case, we don't require multiple regions and prefer<br>
Jason=E2=80=99s original patch.<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Restric=
ting
 the dmabuf to a single region (or having to create multiple dmabufs</span>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">to
 represent multiple regions/ranges associated with a single scattered buffe=
r)</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">would
 not be feasible or ideal in all cases. For instance, in my use-case, I am<=
/span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-=
size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">sharing
 a large framebuffer (FB) located in GPU's VRAM. And, allocating a large</s=
pan><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-si=
ze: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">FB
 contiguously (nr_ranges =3D 1) in VRAM is not possible when there is memor=
y</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">pressur=
e.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Further=
more,
 since we are adding a new UAPI with this patch/feature, we cannot</span><b=
r style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12=
px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">go
 back and tweak it (to add support for nr_ranges &gt; 1) should there be a =
need in</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 12px; font-style: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">the
 future, but you can always use nr_ranges =3D 1 anytime. That is why it mak=
es</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">sense
 to be flexible in terms of the number of ranges/regions.</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;">
<br>
<blockquote type=3D"cite"><br>
Also, my understanding is that this patchset cannot proceed until Leon's<br>
</blockquote>
series is merged:<br>
<blockquote type=3D"cite"><a href=3D"https://lore.kernel.org/kvm/cover.1733=
398913.git.leon@kernel.org/">https://lore.kernel.org/kvm/cover.1733398913.g=
it.leon@kernel.org/</a><br>
</blockquote>
<br>
Thanks for the pointer.<br>
I will rebase my local patch series on top of that.<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">AFAIK,
 Leon's work includes new mechanism/APIs to do P2P DMA, which we</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; tex=
t-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">should
 be using in this patchset. And, I think he is also planning to use the</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">new
 APIs to augment dmabuf usage and not be forced to use the scatter-gather</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">list
 particularly in cases where the underlying memory is not backed by struct =
page.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica;=
 font-size: 12px; font-style: normal; font-variant-caps: normal; font-weigh=
t: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">I
 was just waiting for all of this to happen, before posting a v3.</span><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12p=
x; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;">
</div>
</blockquote>
<div><br>
</div>
<div>Is there any update or ETA for the v3? Are there any ways we can help?=
&nbsp;</div>
</div>
<div><br>
</div>
<div>Additionally, do you have any repo that we can access to begin validat=
ing our user API changes. This would greatly aid us in our software develop=
ment.&nbsp;</div>
<div><br>
</div>
<div>Thanks,</div>
<div>Wei Lin</div>
<div>
<blockquote type=3D"cite">
<div><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Thanks,=
</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Vivek</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;">
<br>
Thanks,<br>
Wei Lin<br>
<br>
<blockquote type=3D"cite"><br>
<br>
Thanks,<br>
Vivek<br>
<br>
<blockquote type=3D"cite"><br>
In addition to the initial proposal by Jason, another promising<br>
application is exposing memory from an AI accelerator (bound to VFIO)<br>
to an RDMA device. This would allow the RDMA device to directly access<br>
the accelerator's memory, thereby facilitating direct data<br>
transactions between the RDMA device and the accelerator.<br>
<br>
Below is from the text/motivation from the orginal cover letter.<br>
<br>
dma-buf has become a way to safely acquire a handle to non-struct page<br>
memory that can still have lifetime controlled by the exporter. Notably<br>
RDMA can now import dma-buf FDs and build them into MRs which<br>
</blockquote>
</blockquote>
allows<br>
<blockquote type=3D"cite">
<blockquote type=3D"cite">for<br>
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory<br>
from PCI device BARs.<br>
<br>
This series supports a use case for SPDK where a NVMe device will be<br>
</blockquote>
</blockquote>
owned<br>
<blockquote type=3D"cite">
<blockquote type=3D"cite">by SPDK through VFIO but interacting with a RDMA =
device. The RDMA<br>
</blockquote>
</blockquote>
device<br>
<blockquote type=3D"cite">
<blockquote type=3D"cite">may directly access the NVMe CMB or directly mani=
pulate the NVMe<br>
</blockquote>
</blockquote>
device's<br>
<blockquote type=3D"cite">
<blockquote type=3D"cite">doorbell using PCI P2P.<br>
<br>
However, as a general mechanism, it can support many other scenarios<br>
</blockquote>
</blockquote>
with<br>
<blockquote type=3D"cite">
<blockquote type=3D"cite">VFIO. I imagine this dmabuf approach to be usable=
 by iommufd as well for<br>
generic and safe P2P mappings.<br>
<br>
This series goes after the &quot;Break up ioctl dispatch functions to one<b=
r>
function per ioctl&quot; series.<br>
<br>
v2:<br>
- Name the new file dma_buf.c<br>
- Restore orig_nents before freeing<br>
- Fix reversed logic around priv-&gt;revoked<br>
- Set priv-&gt;index<br>
- Rebased on v2 &quot;Break up ioctl dispatch functions&quot;<br>
v1: https://lore.kernel.org/r/0-v1-9e6e1739ed95+5fa-<br>
vfio_dma_buf_jgg@nvidia.com<br>
Cc: linux-rdma@vger.kernel.org<br>
Cc: Oded Gabbay &lt;ogabbay@kernel.org&gt;<br>
Cc: Christian K=C3=B6nig &lt;christian.koenig@amd.com&gt;<br>
Cc: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;<br>
Cc: Leon Romanovsky &lt;leon@kernel.org&gt;<br>
Cc: Maor Gottlieb &lt;maorg@nvidia.com&gt;<br>
Cc: dri-devel@lists.freedesktop.org<br>
Signed-off-by: Jason Gunthorpe &lt;jgg@nvidia.com&gt;<br>
<br>
Jason Gunthorpe (3):<br>
vfio: Add vfio_device_get()<br>
dma-buf: Add dma_buf_try_get()<br>
vfio/pci: Allow MMIO regions to be exported through dma-buf<br>
<br>
Wei Lin Guay (1):<br>
vfio/pci: Allow export dmabuf without move_notify from importer<br>
<br>
drivers/vfio/pci/Makefile &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;| &nbsp;&nbsp;1 +<br>
drivers/vfio/pci/dma_buf.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
| 291 +++++++++++++++++++++++++++++<br>
drivers/vfio/pci/vfio_pci_config.c | &nbsp;&nbsp;8 +-<br>
drivers/vfio/pci/vfio_pci_core.c &nbsp;&nbsp;| &nbsp;44 ++++-<br>
drivers/vfio/pci/vfio_pci_priv.h &nbsp;&nbsp;| &nbsp;30 +++<br>
drivers/vfio/vfio_main.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| &nbsp;&nbsp;1 +<br>
include/linux/dma-buf.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;| &nbsp;13 ++<br>
include/linux/vfio.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;6 +<br>
include/linux/vfio_pci_core.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;1=
 +<br>
include/uapi/linux/vfio.h &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;| &nbsp;18 ++<br>
10 files changed, 405 insertions(+), 8 deletions(-)<br>
create mode 100644 drivers/vfio/pci/dma_buf.c<br>
<br>
--<br>
2.43.5</blockquote>
</blockquote>
</blockquote>
</div>
</blockquote>
</div>
<br>
</body>
</html>

--_000_61DF4F0ED947436B9160A40079DB9085metacom_--
