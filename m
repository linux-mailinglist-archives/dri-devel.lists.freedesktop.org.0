Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PKvAIFtfGkSMgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:36:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895AB8788
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A8210E961;
	Fri, 30 Jan 2026 08:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KZ4uZZe7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E8210E961;
 Fri, 30 Jan 2026 08:36:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ9ZvZDzu5gTrJjVZTgVvoeplo0Ed6romHPMO83Wyg2wS31OGyb+y2cJGR4B/97GQRV0xrk54GUKKbgItKZ8D9mjyVWL7gWuJKgB4rABrmQf4fP+1L/QmhiBHlb3pO9IBTIfcErjWCtQRRILPVwVyY3gSooYnXU2oSHu0i2vZqtn0mAufOTptjbSWvzY+n4nv0+NYrdUyTGPb3/tItN3LU+2mpS++gosEmm9734hYAa/kNNbM+dNOoFhsTkWWB3c128+zFVbd+dhEPFsL/U531FEN+V7bMWIZEtbZZ60743EPBfyyRF2sUynFxES4eGq0gqaV0xcevXRsu2IO1KXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bL6qMUmKlSpzFDY01RRUeBe+aH23kOhTBbtZVLKQ4oU=;
 b=kLZ/7Cla6qSv0itPoTNukn+SmUwt98RIH8VSuWbwgZg0jS2q2lMJtULa+XXoNalkEbc0lTlU7/51NW8WtEoZWmqFYdzvENTyYKeb1uLXk+lL4BQqCtdSY6KomgDruB7Yu3DCTi5Z18aUkBkXjJJfLDHNWZaQfgV0w/sGp7geswkF8uh+nvauhvRNhMMjlLL2jHkFwbevcW/1OrjalClrBJ6REZ82r/JnvW7B3FE4VJTFMKtsqNIH1onZdMYXf/11pNJFZuzAUDO9AIms+7SrM28zVMpNpFPGVl15UcUpgdHCSMDlqWMTwiZrNx741ZmUraoTORF+vrd9KvTg9P7wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bL6qMUmKlSpzFDY01RRUeBe+aH23kOhTBbtZVLKQ4oU=;
 b=KZ4uZZe7qpikmpPhe0M+w1xmT2riddwgmM/wd0J19yekFogbTwKE7OgZ0YDiMspcIK2908WI21nkuRr+OpmzqouL5P7Vj/JzT9rkQEPWzhyF7V9XtwbP7BgERyfSbPW4F4EHzoy3YRZKDJokcdYwCgkbM+QBn5DU6TQ5cNe13q0EYIjS0Ko9nxMqnQf5o4QS+lydoY1DH5RQ9iQCYOz7P+kShAxpI1zaZCX0Vkh0MdYF21z9qf1Kmf8wXlvFK5iPNXgCdrGdyIcYKj6Y+2o2VSYjIDfHWrDwASxywrwC6qs3628O4WQJMP4Ms2ccx+pC4dH50ybVnLfSD09H2Rkgag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 08:35:55 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 08:35:55 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 30 Jan 2026 17:34:11 +0900
Subject: [PATCH 8/9] rust: dma: add CoherentObject for single element
 allocations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-coherent-array-v1-8-bcd672dacc70@nvidia.com>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:405:378::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5b11e6-dfbc-4070-17f2-08de5fda95dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VC9ZRUxnWkFqRCt1a2lhdnVQWkhLK3orRE1MZU1NdmJlTWxBdi9zTDlwZkdF?=
 =?utf-8?B?RXhKTGg3TStybnA0UnIrNDAweVlOY0dpUCtkMEdwTE5PZTRPWUl6TmlPLzhj?=
 =?utf-8?B?cE1XM2JmVnBNeGpBbEhrUVBTbWFic1g0Rk1nTGRFa01teEY4bDVTWUc3VWs1?=
 =?utf-8?B?UDRoam1OdDNaNUtFYk55Wm9RK1RRZGZzczkzdWFBMzNuaVprMHBNSCswSEF2?=
 =?utf-8?B?K2x4ZHk3dTcxaGpLanQ4VUtkY3N4RUFPSTMzajhpWi9SSXhsejVpNElpR1Q5?=
 =?utf-8?B?cGk5RjRqbjAwZ0tJaFhJbTVSQ2NjQURuSXpIdW5rejRNb2JmYURCeXl1MnVJ?=
 =?utf-8?B?ck1rckI3NjNyTmdMQjdFWHZWSWRnWEx2QlZScGpTbmVteFFPcWwrUUwyVC9Z?=
 =?utf-8?B?QVM0OGY0LzU3NEhxRG9YNnFxVms5aUJVT1doMEJqSE96MnlPL3JnYlFtS0V1?=
 =?utf-8?B?cjZybUMzUm5KMU95NkpnUVpIRUJQL3JtT2pkN1JSV3ViMHlxOXE2TUNsOUVG?=
 =?utf-8?B?RlByNVJmenZqM1daWlorOE9hK29PWXhiZjhkRURYVmJRa3B6SUZLcGk4UE1r?=
 =?utf-8?B?ZE1pam9vOTRvVFRZOFl4L1pWNnFGcmRnRWxydnN3L3BaK2hjSFdoaDZERTRM?=
 =?utf-8?B?T3RpbVM5Z2VxdFBLVitRTzZyaldEcVpYdlF6ajVIR0srNy9TN3hBeWljQTJO?=
 =?utf-8?B?YWVrdEgrSnNISGNkbXgyTCtRMmk2bHl0NFlQcGQxMzh2SzdBRkNhNzVRWTQ0?=
 =?utf-8?B?NGMzV2JoV0hnUldTZkFXTmdlRWdRVGZiWUp2c1JHbFQxc295VW50NTl5SWd6?=
 =?utf-8?B?UlZBNFNLbldsV1ZKWC9BTEU0d2ZScjBNOWEvQ0hnVEtGSVc5Rm9mNUZ5akh3?=
 =?utf-8?B?MWNFb3lmQWE1ajQwbTZvRVZkbzFLaHFzY1QvcjNjQWs5VStjZnMyK0d4Ri8y?=
 =?utf-8?B?KytNT24wWUgzWHg2SlpyalZQOWFzaTY5RngwT0libTJ0cmk1Ymp6N0ZJWFRY?=
 =?utf-8?B?eFh1ditSUHQ3Ums2VXBDeEpEdGRHQkphUUpLbG5oZGtybldhTlNwNDZucXFL?=
 =?utf-8?B?UTYwRjZQVzNhMTIxTURHS0VlamNxZlJOc3BoUFpYbjJZUzVIdmd6dW1xem1i?=
 =?utf-8?B?L1JJcnlONGtySVdkME0xR3dObks1R2c0VmZxQUowTjFXRG16d25Ua0lTb0F5?=
 =?utf-8?B?QjZrYnlOdFF5R0JCb3dZdFc3RWxpWDZpL2NLQ1VSN1hwUUJ1dGlQd2ZMZENJ?=
 =?utf-8?B?MldGQzhjYkxsb1I0dGdlKzhNcU1Uc3ZZbi82M2NtRHhBSE8yMTViS0NSdEpl?=
 =?utf-8?B?aTNFYXFKZG16THdrNlBzY2czTmROeWpOdForWGF6ZjdMSWpJcFg0RlcycXdE?=
 =?utf-8?B?YnRkdElJUEJjOGVnS3FaTW1saTB6WkhINlowTG9zS3NEQmdjWElKNWZjbEhz?=
 =?utf-8?B?aTJkUU84YWZiZVJsd3B5NURGNFVoTlQ0Z0kyNEI2V2xQcUs5eEwvcmJORVJO?=
 =?utf-8?B?SmlFRmwvWVlJS0tGWllXbkZQUTNGR0dGbGRJaVpDd2J1L21SQjdtTVpwbG5u?=
 =?utf-8?B?dWlBOUFwVTJYQjJjK3lIS2x2Z2NBR0xackNPUmtoVlptemd3RmJjdkEzWXBV?=
 =?utf-8?B?Sjh2cU14WEpqRzJzVEZoUU5US0J1aDd0NDNXZlJDMHh6aW1iUllDdEZodWNq?=
 =?utf-8?B?S3FzdmYrK0NJVnhuMGdNc25YMzZUYVdFRmxpemo2QWQzU3Z1REM2dUl0eExC?=
 =?utf-8?B?VTBQbGlYY1BEOTJzaVRpVmJyYWtHTGtiVGIwVkF1a1o3VmlrZlpJWjJxWVEx?=
 =?utf-8?B?alRNZzlJTS94RzRES0pIY3B0QjFoVUFUWlJOYzl3YU9ZWDZGSUZab2k2MlFM?=
 =?utf-8?B?cEUzVUlyakU3Tkk4cktsYUJBTFE3RFc5YitzYUhZaXIwdm5nOTA1cVhoM0tW?=
 =?utf-8?B?b2dvR2lQZUh1K2FUVjMwWXVwNFFHeXZDeGxRb3ZMNGFwR3JiRnJ2Qks3WlJB?=
 =?utf-8?B?cCtJd3RnS2xMc2ZiMUtRVlNsTzVRdEkybzBVSjhqOWFCRngwRnlwUFRmT3JE?=
 =?utf-8?B?UGJlWXVhMTZ0cWdDWGxMa0ZPeHhRN2dnMWVCUnN1ekhjUE5xdXlzaDBRVE9m?=
 =?utf-8?B?eGQ2UnBJMHpDOC9peFROMkdyTzc3dlJPUWx0RE1EMWp3N3h1bHRBU2FURGhI?=
 =?utf-8?B?VGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWdLTVJiZEFwT2xLVURUeWZmNVhZc3NUR2Jic3VCTWI2T29TVHhLTUc5TXdW?=
 =?utf-8?B?OXdBN2h5aUplZmpUR2ZGdkVDOVBmSVhwazI5WUh0UTdJYzhsVEU2QUViZWUw?=
 =?utf-8?B?b0xwS2RrRzRTdXVVdk1MQ2RuZnVEYkhPQm5EWllHSCtuanVwR3hSTUlXY2NJ?=
 =?utf-8?B?cGVjUFg3K0dVcHIzS2FvZjgrcGZTbHptNjl0bHNuNjdPSm5xM25YWUhEaUVN?=
 =?utf-8?B?Z2xaVlhBeDE3Y0hRKzk5T3pDWnFMZEtBQzBiRVREb081aVFWME1pd3dvRjBw?=
 =?utf-8?B?bHBWOUR4NXhrN0FJNW5EaFU4QW5oelFhWXBuWXcwR3ZXekFUTXMvZVR1ZkFG?=
 =?utf-8?B?NzEzeXI2Zi8yV0RsRzdBbzRoRDc0MmYyQlc4Q2NBMUhRK2daTk5PSURiZnd1?=
 =?utf-8?B?ZWhGeXpsN1lqR3kzODFWRi9hcjBZYkhtSXpCTTJ0K1YrZEV6dkJHUTdFYzN2?=
 =?utf-8?B?NFA2bU1Md0hQcXRJUmhoZFhURG10bEorVzQ1T2RFN3hIMHNxc2dFdVFwK1lk?=
 =?utf-8?B?bGtsbDhPM3FsTGJnbVRDU3h4b1FYMjU5R0d6U3cycGZOTEE2NkhzZVNnZmN2?=
 =?utf-8?B?THJNS01Kb29WMkRTVlh0RE9JcExPcmN0ejF5ZE40c29hV2c0L25vSkhvQjZn?=
 =?utf-8?B?NGQwajRyRk9YOWdSQjNEcHF4TForR2JPU1JaNVR5WGFhSUl2TVE3M2h4Mk9l?=
 =?utf-8?B?ODRLMDc0Yy9VVFFKaS9XelhCU3NNVDJWemN1T2s0a3AzeFJJMUE0OTcwcmlD?=
 =?utf-8?B?S2hCMUVaRklENlVuVUVLTUZxWFB0eUtMMXpBQjUxVFNpbEJBMEZBWDBpZWNJ?=
 =?utf-8?B?YWV4eUxVL3c0N3kzcHIvK1E4L0xJWmI0UnQrcGIvWDJmWitnNCtHOFh0SFN5?=
 =?utf-8?B?RkxTcm5iL0RDNTc2czl1SUpOVkV3aUkzOFEvRThVMmh1YWV6c09oM3E0QlZO?=
 =?utf-8?B?NlB0cFF5ZDdQSDJrbCtxY2M5MmZsMXFTZ0dqUi9BRk0vdytsc2RsUzZzcXcz?=
 =?utf-8?B?Qy9WU0pGakNkQVVQM2NhT2M3ZmQxNXo1YVp1ZFF2ekRhTWxla3E3TmtBQi9W?=
 =?utf-8?B?YjhQaWJORFVUN3VhVk5NTXpIamlLUFoyZVVkVGxRYUVGaGxZdGRBVzBGOUw5?=
 =?utf-8?B?SnNTMTMvbURWMXlvdzhjc3pQdUh4SG95S3hQNmJGcWtwUUI0WFAwcXcreG5r?=
 =?utf-8?B?eGlDR1BVb1gydU5qREwzRUlhY3ZFL0R2RzB5RDBXTmZSYmN0akErS1JaUUQx?=
 =?utf-8?B?RHFxVndzNm5Zc2lQdjcvT3VEczVpVW9XeXUxZEFkblU4WUJSdWVIT2dFM1Nw?=
 =?utf-8?B?ZGJMSlJIRXk2em4wdjkxTFNKOEVyVmFyVWlHaUc2OVJmQmFsTXk4emh1aHk2?=
 =?utf-8?B?eThjQjBmWVBiVFR3SS9jUFhtNnBjVjAxYTlKMEd4d05DY1B6VWZQTjgwY0Fv?=
 =?utf-8?B?RHJZUm1XbUVQSzBYb29uMmNsWjRqb1JOUzE2NGlScW5jcGo2eitSdUpqd2pz?=
 =?utf-8?B?Nm0vRHVnbXk0TERUdEZoSEI5Nyt1N2s5cUh1L2xFeTdpRU5MS2FQRVB5S01Q?=
 =?utf-8?B?Q25kbkloemhZc0pTbEN6YWNkcUJXemQxelNNek1Pd2tXcWNySDJCbVgvU1ZU?=
 =?utf-8?B?V2dmb2YrcXpud2R4Q3hXTkphUjRWdGRpWE1wdk1aZUViNFNIMmNaV1Y0Q3Fx?=
 =?utf-8?B?aEFlWjZ6cHBJcjFRSm51RlNFNUFFOVFWNTlyOU1IbGloMHFVK3dMRDdKL01W?=
 =?utf-8?B?OEY0bEhJVWN4cFd2b3prRHNqcXBhSmdRTU80dm9hTDQwK1BkMkV2Y09pRGFB?=
 =?utf-8?B?Ty9Ba0dZSkh0cXhkRzJIS3J6WFpXUEhkbFg2eitmTmVWQ0EzdkRnRHUwcUFq?=
 =?utf-8?B?cmRCRUluajlSMEw1V2RDSVJXOC9DY0NOWGpialExMXBLRGhqRmdISXNvU0Fu?=
 =?utf-8?B?UkV6dGV1MHJMSkFNSlhQWkZPc0Fhb3JCb2p1TFFBUWhWMDVINkJ3Zzg3OGtE?=
 =?utf-8?B?U3drUXRxTGFqdjJ5ZVBveG1XK1pZOTl3OUNteTNhV3g0ME1UdGJIa0pUNmpa?=
 =?utf-8?B?R0QvclVQeVAzVDhCSnd1TGhyZDlab2ZDdzBXWkE2R3FUeVNSU0R0aEowZXlv?=
 =?utf-8?B?akNxWDV2d2JSS2RBTlRxSVdKR251QldLRWhNbTJVRElSWjdUM2x1STZGQzdr?=
 =?utf-8?B?QmJCZG5ta1YydFcvSnorYkJWRC96bkxnMU9ha1Rwb3duMHdJSHJLUUt0YS9G?=
 =?utf-8?B?ZWJabGFPR1NHVkdFV1lBSnVEa0NKUTdiL1p3Um9RL2t0YjRLNENlc0RqVHBI?=
 =?utf-8?B?TTNmRzRucUg0bjVJMy9OengzZ3lSdE1DdC95ejBtV1BaRk5mTTdLNXNzdVFY?=
 =?utf-8?Q?qaTTfg4edt8e3GN4oth6nW71jD2Uog9HFDZBE90chvwn0?=
X-MS-Exchange-AntiSpam-MessageData-1: k/sfzKP5Q1my2A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5b11e6-dfbc-4070-17f2-08de5fda95dd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:35:55.6526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFaUMqRbJTLPC34Gg10aOCjdsaadxkXotCzwZqyJ7EhnooM7/dt0uZUVQ3AD1Pp1CAQso2jlgW5TWUvIM15IPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 7895AB8788
X-Rspamd-Action: no action

Add a type alias for convenience and readability for single element
allocations.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/dma.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 25da678c863b..120fc01e57a3 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -423,6 +423,9 @@ pub struct CoherentAllocation<T: AsBytes + FromBytes, Size: AllocationSize = Run
 /// A coherent DMA allocation for an array of `N` elements.
 pub type CoherentArray<T, const N: usize> = CoherentAllocation<T, StaticSize<N>>;
 
+/// A coherent DMA allocation for a single object.
+pub type CoherentObject<T> = CoherentAllocation<T, StaticSize<1>>;
+
 impl<T: AsBytes + FromBytes, Size: AllocationSize> CoherentAllocation<T, Size> {
     /// Returns the number of elements `T` in this allocation.
     ///

-- 
2.52.0

