Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782999F6000
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 09:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019E10EAED;
	Wed, 18 Dec 2024 08:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="BgPehlvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED81710E073
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:06:38 +0000 (UTC)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH8um3R028455;
 Tue, 17 Dec 2024 03:06:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 s2048-2021-q4; bh=alIN70qNgZ0Zd9BoLFdeQqVDgUwuSKhmS1zZlPvp60M=; b=
 BgPehlvzkj1m9YxXt2yDPJ8ZAOchtoyUwmsM/GaSTAWNFIq2rUya1TTsppgnzMjE
 HigbhxAiMyOMXmDr3v0kkhVSAX2vXd7Oe2oi4ryznRuys461BwHR43kr1wiMI64e
 WHl14MF9Q6cyZsQr0NGAUNSgxyJl/wISLnINbBD1sRSytgv5lq5aaiOd5YSqIa4H
 5G0oyZap4zMlXvsNiFo7lLfFNYRtiG0S4ZUW6e2aIFjF97uBly1B8Ef2l4XwO+rw
 OUQ/gI1WIYj/29YT5UsoZZn1+FFViHmwFjEIlTemDTzVNzi9PN/QPkP5fQU7qvBL
 xAuhN2r8qWyB3oUCqnAgzQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 43k67m0jup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 03:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWf52SMsH2qLlmfKVOIH+B3LadHOKMgSYWafwFAoItCAOr4N0LlDsPvKNqIwlFOlmd7baav8ls1IBeb5EQKiYGEuORp9879FuW9Lhdb2uJV5N/MsefWXbjY0RyeoN7ox6itqFsqsSH0gxDVnXcEZxtakS9C0wcsz3x0gD7b7OGIfVpM7/aFwpY9YLUwBbnU7ov6VK22KUNQ78Dwf9nNMx5G6IUouowfPeylVAzZbfUdCMvX9QHjBsbBlvXhD0YJ2P71bD3/BBhW/ThP4phI89twSSfPYE6aSc4MvdgkOW4i9wA8EAXamMpEpaedK5FXAky++5U8j66UcHCV4xvvmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QznGQSHmKSGcZI3hOHnZDcETbQ10NtBfRDeK099DKoo=;
 b=ezANVFplvsO0/xa3aJ1vAP0i9U+JW8R7WKuCqPYnVnF/91jEbofCZepZkmWfzsg7H9A3XD7z47YwnyZsmJyZr7I1kfwNXsqOeou4C0i0BClqlsOHU/cAcusbNRMfWW5w8OBItrTIoYpU++/LpPzJp5Q38ZcIsU2LTlB6xNTywgO+XNNi581UL0Q9sVzd4MBGhqhzk06Ks8fItTnBJ3XRhfVSonCsTQhekn2ITBEviKoi/R0wkDDLyS2sFaYu5n959j1JkyWvorOUgBXNAClieURoY4UMFxyQJiX4mMdmQ8AVvmtKxLROTusAEUQsqd8ktaQYJM0Lnklg4BYLXwVOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SA1PR15MB5258.namprd15.prod.outlook.com (2603:10b6:806:22a::12)
 by BY1PR15MB6175.namprd15.prod.outlook.com (2603:10b6:a03:52c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 11:06:31 +0000
Received: from SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c]) by SA1PR15MB5258.namprd15.prod.outlook.com
 ([fe80::a29e:a332:eb15:993c%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 11:06:31 +0000
From: Wei Lin Guay <wguay@meta.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
CC: Keith Busch <kbusch@kernel.org>, Wei Lin Guay <wguay@meta.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>, Dag Moxnes
 <dagmoxnes@meta.com>, Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay
 <ogabbay@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6OUDqore1ASYUiYPwdtGg/6x7LoqU6AgABttwCAARzDAIAAFFaA
Date: Tue, 17 Dec 2024 11:06:31 +0000
Message-ID: <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
In-Reply-To: <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR15MB5258:EE_|BY1PR15MB6175:EE_
x-ms-office365-filtering-correlation-id: 883493fc-1c38-4aff-3b93-08dd1e8adcc5
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VVhHUm1WQmdBcW1aMFRDQkcvZFNDdm45RkVRL3c4SVdXelpIRGRtTUpEc3lp?=
 =?utf-8?B?ZFZYeHhHR3A5cy81TDMxSXBXd1lvQWd0cGFJSFNOWDQ5TkUvb2gvN2Nxb0Nr?=
 =?utf-8?B?bG1HOC9yT0dZcXNpQ0lleXFvRGFBUFBqbmZMa3c5Mzdkd3M4K3lzWDEySThP?=
 =?utf-8?B?TVFuMWdkY3dmV0pia2pxUlBEZzZOSGFnYXN0eDZHdWhZN0tjUWhES2d6dHZJ?=
 =?utf-8?B?d081QTJLb0ZkUlhZL1FwNzNMaTQ3MXVCT3B2cDJVclJyYktyOXZOREFtSFFx?=
 =?utf-8?B?ejFyZ0Y2NzVsb3RaN3FRWGN3TEZTa1pqSEwreUw2Q3ZJcTEyWlhXVzgyaDZG?=
 =?utf-8?B?aUlGUzNrYkZRc1dFZ05JZ2twRnJFeDFFdXVlOFpxdk5NeTNTSjV2R3JUa0tX?=
 =?utf-8?B?TlFrcjQvbU9QT3RxSHRZUW1wS0sxWCtBY3J4b2xjVGlHdkdqY0ZMUGhaU0hu?=
 =?utf-8?B?SEhEM0tQQ2dqL0lHcFpINit2enJ0OXJNVFA4V1ZhWGE3MUpLWVJZYkJTdW9V?=
 =?utf-8?B?bTJqZzFZZ3A3MXR4OGJnYlgyY2hMMm83LzVzaU1FNWdtR0I2NFNuSktLM2Jq?=
 =?utf-8?B?RmZEOGdrZXR4dllJWHVhK3pGeXRsYmkxdUFyZ1RuYlZFZG5HaHNPNFRZb3k2?=
 =?utf-8?B?Q2xxMXZHd0tNcWtHUXdoMFl4RkZIUldmSWJqK2ZKS2N3Vk1RM0VGUWFOQ1Ns?=
 =?utf-8?B?anlDYXhTSTRmNXZZdk0xcHIzeXhNb09hYmNLMDROaDNLUjVqWFNPVnorcG1P?=
 =?utf-8?B?SWwrSXppMnhXTi9yL0Z3eDZsclVPL0dibGZYeEZ5RnFmZHhOZ214M0s0MmRP?=
 =?utf-8?B?ZDFuOGRlVDR1TFoxb3ZJVng5ZHN5MGg3TUgrNGNkUTU2VldNc281cjU3K083?=
 =?utf-8?B?NlJkNndBbm11SFpsTXUxU1hvbUUwL0ZEUCtYcDRQRDZ4Q09iUkRxK04zRDVr?=
 =?utf-8?B?TVpRTXc0ZU40VDlCUFVSL2RWa2s4V2R4bGhVbVZYYWpvbnhVZ1Mzb0lsTjN5?=
 =?utf-8?B?NzU5anJmRDRvbkxLZmxFOERXV1VRbDhuMWNVcnNaZW9Sbko0TnJjYnloUm1p?=
 =?utf-8?B?ZGE5d0ZCRDl1NDN6UkdpRndPTUx5eWRraU51RUVXZjZyb0dvSVBGalhUMGU2?=
 =?utf-8?B?TVZRQkxOTGFVb3NDclNNSFQyWTJBOEVheHhGbHQzSmNRV0pZQUpvZUNEOVRy?=
 =?utf-8?B?SWdHYlJQeGd1SmZFZ3hFbjNEL2ZLWjdMc09RMkRDTkhLdVhLY0MxMGlpUlha?=
 =?utf-8?B?ckpzVkJqSzcwL0dWdjJDWUZFNHNDbExKYWFaTWwvWVhVVVA2aWpSQVVMS2F0?=
 =?utf-8?B?RzZYNE5IOVFmNkdLNTlMSkExbTlRVG1xNzdydmZVUjBxei9KSENaVjlLS29v?=
 =?utf-8?B?ZFpiK0RvN0xLR3JFamg0cUNNT1pqR3NIRTMyb1A2YTgxNkdqayt4dktaNFlo?=
 =?utf-8?B?b3dRdlJ0WUdGY0F2OTd4UkFqN2ZwRG9ZTmY4SVZsUitJNGVsRVUwZlpiU1VT?=
 =?utf-8?B?TnpFNWF6UnJ5MG9BSVp4eVBhSXlUUFhKRFhkbXczblFwTVcrVndZNVV5ZGpr?=
 =?utf-8?B?anBpZFRRbUJySnJSZUVFSHRTdTZwWlFqYUM5YlRrWW9JNnlHUldid3RlOWhZ?=
 =?utf-8?B?Q1AzbGxTQ1lkRkMwRytRdjRZNnZSMDZ2WklWZkVYeUdJMHFWSnJ3U2JEQ002?=
 =?utf-8?B?d3VKYWhaaFZJTkdDRTI2cW1sWlZTT0pLVXkvdmUxR2s1cnZxNVdlZzZkM0VT?=
 =?utf-8?B?a0Q2N1k4QTVVak9oeHhNUDUrdXp2ZDBKMUVIVi80YjkzR2NsM09SbUVBNWgr?=
 =?utf-8?B?LzFUb1BteFZCaS8yTGdPYTYxbkpoaWJFUXVVQU90dkFwZjA0c0pjcTYyb0Rv?=
 =?utf-8?Q?9PGqJt3Bn+4Yd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB5258.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGtMYnRraXB6dkxxb3NYbVVhUUVlcVY5Sjc4aEVNNVFLdmw1ei94SU1yekFV?=
 =?utf-8?B?cy9SMU0wcmt3Z2pqV3dpejdVSGZDUnFPbWJuU1RrNnptcTFVcjMxaUdsRGZn?=
 =?utf-8?B?NG5zOERxK3pFaHNEK3hMdU1Ha2NNNzFXNXAwR2NrbWhwZmloQlFZQk1QVkdO?=
 =?utf-8?B?OVlVV1lYMkdVWUhYUkVwRXdFcHJKODMzc2FUQUh4YzNRNDhBMzErVWZPZlZ0?=
 =?utf-8?B?TFV6Z3BBWjNlZ0YxaG1IdjEzY2phS2FJKzFESlorbFhKZTh5N1lCNk1VZUFo?=
 =?utf-8?B?SFJTZzZ1eXd6QUlQeVlqdXVhV3J6TWRMYjBjQXpncTFCaTFIS0U0TDIwVUZr?=
 =?utf-8?B?aDFHZGdDZ1V3aXRBUit3ejVQQTJ0bXNJbXdDZDlGQWo3dWRDTFVFcTgyRzZj?=
 =?utf-8?B?NVlHRGdCV3FRZXpLNmFybTlDR0NUd2RWS24vd0kzSUtGQVRMWUg3RHh4SWlX?=
 =?utf-8?B?bTAzRUIwdGZnZnZRaVI2cFM2NVlpc0JRUU1lQlUyZ2FaZDRxaDI2ZVJ5dkRv?=
 =?utf-8?B?MTFVRTE0d0Z6L0x4Q0w2SysyZVE3dU1QVHhWVlA5c3pPaStJNERsbmtOdE00?=
 =?utf-8?B?VTZNbWE5Z3lQd2JGL1MvZXRSTmF1cHJENks2UkZoRmxHRVlXTm5NWXlrbmFE?=
 =?utf-8?B?ZzdyY1dkRk1BVXJBeW9jMlMweHpqaTdvLy9KSnlPdkYyTU1pQWppSnRqdURD?=
 =?utf-8?B?RXhpRmZicmlmUHN4SGJOM291bnBGcTBIVmdyaWE5aE5NemtvZ0VTdjd0U0kw?=
 =?utf-8?B?ZUZTNWxwdXYvRFVyLzdwd1RKbGJ0N094Y29YbWdocXBwN2tFYVNxbzV4RWVP?=
 =?utf-8?B?QlpOT0JTUDB3TXM5NGt5VVdOWVk2QnBiK3FLYW0xcmxueWlReit5TWVYWVl6?=
 =?utf-8?B?Sll2WjlROEFqZ2hnU1l6dUxGSlljdDRVODlQSUw2VkFTYWFVNnU4a3BXRnVy?=
 =?utf-8?B?Y0ZhMFluNHpFR3VlZUcyZG1hSVU4SEErdHVOa0szWDlpVitiT1lZcnZhcG9i?=
 =?utf-8?B?Q2NOWlA0emtOcy90NWVhL3Jaakp0MUVwSnRwTERROTVtZ0ZxSE1sRCtBbnRy?=
 =?utf-8?B?cyszK3BPMnFUSm5QVk14YmlCdUV2MnRoOW9jdzdDTFY0SnpGZlN1RlNPTmtS?=
 =?utf-8?B?MWFOd3lwWWFWVFIxWXQvQ2tCaDRsdkVERWc4TG1aMU1KWjc5RjZlRXRBSDcv?=
 =?utf-8?B?ak1HSHhnK05MME1DSGI4UmVSdjUyVDY2T3FLeEVwT1JWWTBRMHd5ZWtzL3pv?=
 =?utf-8?B?V0N4MDdJSzRWWVpPUjRSVWtHSURKZnpVTFVJMFVqdUpldzFEeHpsQzhLdC9E?=
 =?utf-8?B?b0dHbHVDbTNhRWZxTld3ZzUwL09BZzdzNFNEYmN5bDRoOEtHcUh0OGJGYzU0?=
 =?utf-8?B?WjNyZmViZHUwTjNKbk1DZlZNTG9mWGQ1blQ0WGJzWEFWbkwwNFJCY0dHUjg3?=
 =?utf-8?B?eFlFOEN1dUNpeDQ1M0FNRTcvc0k3bzJjU0xtdFkreWYvQXpkRjVhT25uVEFo?=
 =?utf-8?B?V0hLL2FnOE9KaE5aRTNhUGlPMW5qUzRpZUc3dDlZV3BSOW5kQWh6d1NGTmFY?=
 =?utf-8?B?cVVqa1ppK3YrSjBuS3lZWWJIZjh1dzUweVZVTlBKei9tRkdYTGJMY2hvS1pu?=
 =?utf-8?B?WUNUUmFFeFlzVm1XeWxKRVBnK3BvSkVZQkVWanVidG4yUmlkVjNrN3dYY2VO?=
 =?utf-8?B?ZU9odEl4OUV2T29uQXNKYUtSb1czeks5aU5rUGV0V2VMUEdYRGpweHVDUzJw?=
 =?utf-8?B?WTZud2dHYXhZT0ZpSE9QU3p3aHlnek9MOEJyVWN1VWNNV3J4ZE1LOGYvdTJQ?=
 =?utf-8?B?ZDBaZGd1ZUtnWXVLeWlRUUVQanRUK2VRV1IvZTJSR3NBMnJYWjJHZ0NwZHpl?=
 =?utf-8?B?WDQrbmpMdGZxcU9jY256Nmt0SnhFcU9EcktzRUU4Ly9OWlNLNEk0S3FXRUNv?=
 =?utf-8?B?eFJNSkhGT1Q0VlJmWnZGMkFyTHROUHpwU2tOeXBYMGY5bzByN0JlL3Jrdlph?=
 =?utf-8?B?TmZSZUwvYk5RVVIwY3pveFpTcUljTlJHeFJETFU0VzJjZ0UyYUVCVDU0T0ZR?=
 =?utf-8?B?aWVLM3RrN0lJcXp6Qy83NHFJSEtleGtZWTlnNGpCQnl6ZUhueFFySlE5OTV5?=
 =?utf-8?B?bXpsQ3lCbll3YlI4M0tZUldJWHNUREhHNER0bFcyUU5JRWp4eHM3Sm05blV2?=
 =?utf-8?B?bkE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB5258.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883493fc-1c38-4aff-3b93-08dd1e8adcc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 11:06:31.4147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5eKE96MdHrqk5PUFr65zwhk9R2jdtzfVc3dOF72RyS60IUpxgEow5V9EhvBvCdvD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR15MB6175
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-ID: <D4C29A712AF59E4CAC7E05C25021B918@namprd15.prod.outlook.com>
X-Proofpoint-GUID: SHHrzLuBTT36ibyRkvJ1C1uVP9APgkyU
X-Proofpoint-ORIG-GUID: SHHrzLuBTT36ibyRkvJ1C1uVP9APgkyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Mailman-Approved-At: Wed, 18 Dec 2024 08:18:11 +0000
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

Hi Christian,=20

Thanks again for your prompt response/review.

> On 17 Dec 2024, at 10:53, Christian K=C3=B6nig <christian.koenig@amd.com>=
 wrote:
>=20
> >=20
> Am 16.12.24 um 17:54 schrieb Keith Busch:
>> On Mon, Dec 16, 2024 at 11:21:39AM +0100, Christian K=C3=B6nig wrote:
>>> Am 16.12.24 um 10:54 schrieb Wei Lin Guay:
>>>> From: Wei Lin Guay <wguay@meta.com>
>>>> However, as a general mechanism, it can support many other scenarios w=
ith
>>>> VFIO. I imagine this dmabuf approach to be usable by iommufd as well f=
or
>>>> generic and safe P2P mappings.
>>>>=20
>>>> This series goes after the "Break up ioctl dispatch functions to one
>>>> function per ioctl" series.
>>> Yeah that sounds like it should work.
>>>=20
>>> But where is the rest of the series, I only see the cover letter?
>> Should be here:
>>=20
>>   https://lore.kernel.org/linux-rdma/20241216095429.210792-2-wguay@fb.co=
m/T/#u
>=20
> Please send that out once more with me on explicit CC.

I will resend the patch series. I was experiencing issues with my email cli=
ent, which inadvertently split the series into two separate emails.

>=20
> Apart from that I have to reject the adding of dma_buf_try_get(), that is=
 clearly not something we should do.


Understood. It appears that Vivek has confirmed that his v2 has resolved th=
e issue. I will follow up with him to determine if he plans to resume his p=
atch, and if so, I will apply my last patch on top of his updated patch ser=
ies=20

Thanks,
Wei Lin
>=20
> Thanks,
> Christian.


