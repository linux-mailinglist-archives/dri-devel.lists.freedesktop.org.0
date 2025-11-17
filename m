Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5B3C66709
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 23:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E10C10E076;
	Mon, 17 Nov 2025 22:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X1B9M947";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011030.outbound.protection.outlook.com
 [40.93.194.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D0310E076
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 22:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHObJDq+j68dofg+acqf83qC31t6Zqnn4YYV2Pj2nO6g5gAt+WPGH6diyc5AnlRNfKkY3MNXrNqZG+lNmEjfDjZNhxLElKZT1SczQ1xot3Q6g7RL023DQGd1Iwh7Nh/ciEwDc0qH+t/Rlbf6DjBz+TBkRVHZkkLLPsvQLgfu597oAFNSaQvVFQy97L995OgiPshbYW6JoJ3wf9/hVGQLiBdiqtj8OvrBC0zmsgwOlrvV6WygA4M8idzSk3doprgJC8HBXrJg8ILgQ2EuKWOh2lS//sz3yUNdnO8oa0kQdlRLJ2/MeJTxgs4X/dhmVJ925+d/klrMwQA5RGzCvOcAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyN1K/yRMBJE94wEURVQJRyi14HHoS3W/AczYdl9g8I=;
 b=TUO1kkGAkfLrC0es39QNLCQUmptY7z9N7rEjtG4iMOKo/l6p0OuI3UrOPC7sLiKo2E/mE1WCB24ubVvTdyCVwSKhkbgXvK64cvf/NMEYrbRm5U0ZPlAl1SvcEGol+fV/7Xb0ca6s/6ApoQF8o+5megnOHQLzZl34iy+wptIDz9iIDKBy8DsYLytQZinr0FVj29M6Kmuz3GcNoJflrxsIwDn00/brSumsw+yLR89RN2u8W9ON2Uf5y78BtssedraKrhkK+zOvTPiyOniMog2TvfKalcQhlYOk1tcopXnAwJiFqWf0xnNBeScLYvxVX+dsrCM9dB+uXcfjhnRv+F2AEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyN1K/yRMBJE94wEURVQJRyi14HHoS3W/AczYdl9g8I=;
 b=X1B9M947gsFHHqjnvjF6Ub2i4xMrgWX0YahiBSt+lUB1WvSHFe1zbOz/AGyaGLV63D23OsRQ0I4dB/hBM92QdiiwgRRmnGaF6eFrck0mTotkj4M67RNEkrFaujL9kroKig3bpqtGTLqE3mj/RsdAalelyHdMDV3GkDecwVmf+wON2VTkxHxRANNNNVv2Yide6PhHHn/kZXpbhQC3WUiuA5V07XpK7Lj6BxrpWzGHnQ1XwAyHd/dRIoGtirKA+hJu1WQ6m80rtKlgHJ9uuDlrmEt1x/SoqiYH5ybhd1a2TmVUAwlK3Bn1PeJyB00OGv/UgU1doOlIE0Vn81LTBTfHlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CYYPR12MB9014.namprd12.prod.outlook.com (2603:10b6:930:bf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 22:39:33 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 22:39:33 +0000
Message-ID: <5b6bd015-538e-471e-b2bb-4a070bdc4c64@nvidia.com>
Date: Tue, 18 Nov 2025 09:39:16 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup: mm/rmap: extend rmap and migration support
 device-private entries
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251115002835.3515194-1-balbirs@nvidia.com>
 <6020005e-8b62-415f-993e-b1d99e0c5158@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <6020005e-8b62-415f-993e-b1d99e0c5158@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY0PR01CA0009.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::10) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CYYPR12MB9014:EE_
X-MS-Office365-Filtering-Correlation-Id: babef420-ec45-4030-7f06-08de262a2dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3hTK0plc3hGNkZHZVF3QTh6WlB2bGx6VER1aGQrRDZ6NUwva0R1Q1hQcHhr?=
 =?utf-8?B?dk9WWktoZFJFSE05bHFUSDBoQ0VreXg2MG5OaEU3c1VBVERPSTd1Y1VGdEpT?=
 =?utf-8?B?Z1A2dU1KZzZxeUZIeWlERDRqanJDUlhJdENpNWowKzdlUHV0emRJSEVCcWI2?=
 =?utf-8?B?QVRNV1ZlNUlOL25UeTVlT2RjQWNLa1JjdmVyRmVrbDRVeTF2eUNKdm1PY1Q0?=
 =?utf-8?B?QXVCL01Yb0lwNTNyZERkWnV2UWVQS0cyZTgwZmVvMEt0dG16WHVxbDZTZEVB?=
 =?utf-8?B?Y2J4UitMVlU1d01mL3ZvRkw0OEFpZVBDZTBYeWNqTHJ0MjhxVnBYeElGdGk1?=
 =?utf-8?B?d2pZbUlrVXFwUm1iUFFrR2JZdkNnQ2lPZTMwdWhURk1nNnN3enBBbm9yU3JM?=
 =?utf-8?B?L05RdG9MVVpTdmdnb2piWjhmSTJhSmtjdHZrY2I0VFVYV01pZmZZMnp1U3R0?=
 =?utf-8?B?RHd2S29QQjAzV2hrSXNsem01dDZuMHJYZmlLTkpBekNSTWtyNEZJSC9Cd1Zn?=
 =?utf-8?B?amN4UlhwVDZCQkppb1dHc1RhWG1OejlzekVrTWFxNFBaeHcyZkNUbzI2bnNF?=
 =?utf-8?B?WG81ek9CQ1loU3A1Nk9XSzZWOFpQOHdyRlJ1bkU5VnRBcURuTUZGSERpcUFR?=
 =?utf-8?B?a3pCWG1INklaL0lDODdPVVRzNmJsS3FhOGt1WmdCVm55L21VZ2tGdFM5VUtE?=
 =?utf-8?B?VTlEWVVpdy9neTVCVHJ6UTNWRm5PMnFuUXE4UG5oYnlNTGJTSUY1WFhraFhs?=
 =?utf-8?B?NzBLUkdRY0lNbDd5cG1IcmxVdDVBL3pwZ3lPMEowSm1HaWhFTURDUGRmUjJv?=
 =?utf-8?B?amhlRS9BWUdhbHBZVElxUzJrNk85bzdvMnJNR2hWclVXTTRwOE1pbzFFVm12?=
 =?utf-8?B?bXBpV2tKTjZ5V29ybWRqVDdUTUZQc0JtM2xDaEl0VEk0QVBvUy91YkoxQjlT?=
 =?utf-8?B?azdHRTMyZ3dSa2NNdGxWSEljM1Y3S2Y0c20zemVIcnVpbjZVNTNPRm8wVkJO?=
 =?utf-8?B?TFFGdkxuZjBFUXI4RGNVaFE3OFlkTXAxS215eS9XMi84N25NM2R2SFpwTmxx?=
 =?utf-8?B?Y3g5ZStBNmNhbjRIWHJ0YzRVdkdVczVDWGhLQ2l5cG8xdlJiVGxQak9HcmVi?=
 =?utf-8?B?MGNldVpZUDdYUjRVenZTd3E3Vmdud1dlVFh5S3hrcVpqd2h2cmlodUkwVzNk?=
 =?utf-8?B?WS85K1E0RWFsTlhoRlFXNXJlcTFydFF1VGhpU3JEcEtObDRGM0taNG8rRG41?=
 =?utf-8?B?VmJmNk9aMjkyWmZBRGVydUFIYnNoRmdiUWZCc1RrTkd5YlFhYnJWeE1ucU1D?=
 =?utf-8?B?UTJ1MzlxWk0yMndwTkVYUjZHZWgzVStTRGFMQTNGU29JcFVWbnlvY3hFSk40?=
 =?utf-8?B?S0pNbng3bytHdk9ScjVlUEwrNEcvRDFGWUxMWE1qbTg0ZjVxTmJtaWJyMTRj?=
 =?utf-8?B?VE5YekcvM1BBS25VWWljbDhOTlFVTHJpZWl6QW9BMG1YT3BTOFd4bHZSbldH?=
 =?utf-8?B?MEtHVzhHNnhDdjA2WkRhMUZwdWo1cHBsOCtiVTVwb0JDbkhrUElrOVN2cGhz?=
 =?utf-8?B?dEVBL2VVMklvUGRsRk0zVUdKRmZ0emUzTTNNSTd1aUloZmhBd3VKSFpiRlho?=
 =?utf-8?B?UXYrRmRTU0djL0dDSjFPZTNQMzJPckJGQzhJR1krVXVvYkRhaG1QNWJzaS9r?=
 =?utf-8?B?NWdoa1dudCsyNUY5TnJ1LytpMWJzSzI4MkUwVVFQcnZTdXgzak9aeHZoTWdE?=
 =?utf-8?B?UjNHeSt2SlFDeXhHNWdncTUvbWcvZnI2cUYvbDZMbThXckFTaEFPUVJjVDU3?=
 =?utf-8?B?azF1UmwrMlhBUGR1MjBDTEV4VFU4YndVU2UwZ040TzhJa09VSkJiQ1JnbDc5?=
 =?utf-8?B?d1NmSWxhTE83Q1dMUTFwTyt0NXptRlJjSGJrZXVxTjMwOFViY01JZ3JSUks5?=
 =?utf-8?Q?wVQso+L6+vD0QfnbPohk3GCfUPupdzo7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZmMGs4eG9pOUlOdnBSelV1OGJOYU5URG9aMGE4Sm1sb1ByeHZjUFNOMWM1?=
 =?utf-8?B?RDJXazJxcXhOZklIZUluNytoR0VjRFdnS1BoVE5nVXRiKytwbmFFMEVHeDVt?=
 =?utf-8?B?Qk8vL3hnalZaakh3bUUrMG53cHZsZ0ZaemVINDU0RjV4VEJKVU9WVWdUYVk2?=
 =?utf-8?B?U2ZZc2w5TzJaYkJvRE1HNllYbUkrTFhVMnAvSFN3b1Bucjc5TzdncXBibTRs?=
 =?utf-8?B?cERWZ2xpVDErS1R2SndJMDJvQmRMSUFuTHlCV1hhWmh4RTdKTTZ0eFNFZ01l?=
 =?utf-8?B?WDZUekZ4NUs0VWNNS2hac1FaRk52bEJZMkR6bHhaOXlaMzVzS1Y5RlZITG9h?=
 =?utf-8?B?U1BjV0s2bjJjUUozVnJWWFZPK0h1dTlibW5SVnRHNU8ycjV5Z2JvZHZHMDhq?=
 =?utf-8?B?VzhsRmlpZWJDcEt5VGQ4RFNJeVdNTnZsRm4rdmJSR1hjaVMwb3Jqcm1WTTRo?=
 =?utf-8?B?MFJ3YlQrcnZzWWMzQkprU2c2U3R3U21VNVBvQkI3MUpmbTdVSlhFQUl1ZFRx?=
 =?utf-8?B?TXlkVGw1NnFSNS9DNnVLaDhzSEV2MUZrUnpKMVdlNXpwbGdVcmtDWkZBOGFl?=
 =?utf-8?B?bEJUSUEzMS9IQ3VwWlRHbmpzNmVSMlpTUFMyMHVCUnRQSXU3SmdpZmNBUzli?=
 =?utf-8?B?WlR3emZ4NTI1WHZvZ0RTZE0wc1hnY29FODdSVkJqdEVFazQxSURCS1U2MGxz?=
 =?utf-8?B?UnIzZ25HNWVSNUNsRjJLZXlEODlTZjhMOFBuYVVMRTlBMUk2YjhCWDY2Y0JN?=
 =?utf-8?B?Vi9udjBzcUFSTHJVUEIza0FFaWRlV0hoS2JJcXNNdDYwZkdIQmlNaGNyendR?=
 =?utf-8?B?S2VEOVRXS1JhWGx0RjJURGxJV0s3R1FPM2oxZGlRTWlvZEtpUE83WlF1WHNk?=
 =?utf-8?B?VUVPT05JdGZ6cXhVMkphcGt0a1I3eWlWa1p1NU9LK1NDUDZ1K2o2bWszODd3?=
 =?utf-8?B?ek83LzdSR09ENFVKZVBNVFhGTDIwS0I0c2RKbi9aSURUTVJQZnB1cjRwNHBv?=
 =?utf-8?B?VlBIaWpUQS9zNnJiVnpKRGQ5T1FrVFgxbFcwbW83UU5IU3RML0pHc005WlNy?=
 =?utf-8?B?SVVtVUV0S3NrQkhGSlp5cjR4ZVZCS0ZlbmZydUdHbmdHZGZVVlNnV01NVUxQ?=
 =?utf-8?B?bGlqc0hiMUR2cXNESk11TGpXUm5nM1d6U050ZGN5MVNQaWp1NElxcncxK2ti?=
 =?utf-8?B?dTRjQUFmdzMyNFlRQ1pYYTBldkdSbnV0YWFsdFNCdGIvcVBtYVBZc2V5ditw?=
 =?utf-8?B?emI4SWNUR2psR0pOZ0ZtK2lEdkJBZkpIZnNaQW5UNVZpdWhDRjBYUVdpaXdD?=
 =?utf-8?B?VlFTeUlEaUxpT3p1cXM1d0NWNkN3cFc2OUozZkNZYjJKMzg3VktYNjdEb21z?=
 =?utf-8?B?TGFpZmFDOEthYWJJa2JrZ1VIQUY3S1hHUDRYTHBNN1gyRzhsL256VHFRVllv?=
 =?utf-8?B?WHYyL3BrZVAyT2FodU5QWmhxSEMzMndOVVZlelRpRzhpVXZuaityWVkwS2Nv?=
 =?utf-8?B?UmtyU2JmdEt2Z2xrUVd2a3Q2dVBLTmZtR0xZc09vOXROY3dkcDNkRm41Nlhk?=
 =?utf-8?B?ZTY1L2NnSzdpcU4vOEZvY1MvM2FhMG5RR3U4cmUvT3o1ZWV0TElyNHBQUUR0?=
 =?utf-8?B?SThWdG1QdE10WXZzdW9DUy8xa2g4cXZJN0UzK1Fpd1o0WkVZaFBUK1VZd0l2?=
 =?utf-8?B?V0JiUHFPaXN0Q0k1NVNNNE1MYlRseUM4d3Mvd25GMEcvMVovVHN1ODQ5UHNw?=
 =?utf-8?B?YncrVmp5N1Y5N09XNUZKVEVQdFcxZ0xVMTZDMEFuQnBzTFpEMHg0ak1ibVVG?=
 =?utf-8?B?RVdBNmQ3MCt5b0R0bXFDQ0FjMXRVRmZvdzNZVitsTXFnOGNTdXQ4MG44N0lL?=
 =?utf-8?B?b2F3SXVRdXZjaFhHMWFqSmI5OGV4Tm5ZTWpUZHozNDcycEs1dUN2YUhoYTkr?=
 =?utf-8?B?R2hRUWhONk5BMldzSWIyd0hlSG1NU0pISmU4OHU0K2pBeGphUmRXSDYzb2cy?=
 =?utf-8?B?c2hqRGJMTXNneVduaEo3U3MxT05meERxcEFXYk9kU3QrN2dFVkZCU2VLUVZZ?=
 =?utf-8?B?Sm5sUjFwR2FQSWU4eFdPbmhLaktpb3ZZMm10VW5SLytTcGtnNVhsaCtoMHhO?=
 =?utf-8?B?UGJSMTlnbitUaE9DUTR0RkFscGNuclM0UHltT29TeW5laEc2eTMvb3VBdzQr?=
 =?utf-8?Q?TjMxFF7sWZ3TrLyAKivBo7xYvwZdYopNes1hXY6cS0sw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babef420-ec45-4030-7f06-08de262a2dd1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:39:33.4103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rkvf5khGMI6ZNlh/FEh7PocjpvDqzLLuX+5xy8OrU74+kEmhf6KoBmeM+TH2qalyMjMCkVk/aMH039vLRLIFCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9014
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

On 11/17/25 23:58, David Hildenbrand (Red Hat) wrote:
> On 15.11.25 01:28, Balbir Singh wrote:
>> Follow the pattern used in remove_migration_pte() in
>> remove_migration_pmd(). Process the migration entries and if the entry
>> type is device private, override the pmde with a device private entry
>> and set the soft dirty and uffd_wp bits with the pmd_swp_mksoft_dirty
>> and pmd_swp_mkuffd_wp
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>> This fixup should be squashed into the patch "mm/rmap: extend rmap and
>> migration support" of mm/mm-unstable
>>
>>   mm/huge_memory.c | 27 +++++++++++++++++----------
>>   1 file changed, 17 insertions(+), 10 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 9dda8c48daca..50ba458efcab 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -4698,16 +4698,6 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>>       folio_get(folio);
>>       pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
>>   -    if (folio_is_device_private(folio)) {
>> -        if (pmd_write(pmde))
>> -            entry = make_writable_device_private_entry(
>> -                            page_to_pfn(new));
>> -        else
>> -            entry = make_readable_device_private_entry(
>> -                            page_to_pfn(new));
>> -        pmde = swp_entry_to_pmd(entry);
>> -    }
>> -
>>       if (pmd_swp_soft_dirty(*pvmw->pmd))
>>           pmde = pmd_mksoft_dirty(pmde);
>>       if (is_writable_migration_entry(entry))
>> @@ -4720,6 +4710,23 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>>       if (folio_test_dirty(folio) && is_migration_entry_dirty(entry))
>>           pmde = pmd_mkdirty(pmde);
>>   +    if (folio_is_device_private(folio)) {
>> +        swp_entry_t entry;
> 
> It's a bit nasty to have the same variable shadowed here.
> 
> We could reuse the existing entry by handling the code more similar to remove_migration_pte(): determine RMAP_EXCLUSIVE earlier.
> 
>> +
>> +        if (pmd_write(pmde))
>> +            entry = make_writable_device_private_entry(
>> +                            page_to_pfn(new));
>> +        else
>> +            entry = make_readable_device_private_entry(
>> +                            page_to_pfn(new));
>> +        pmde = swp_entry_to_pmd(entry);
>> +
>> +        if (pmd_swp_soft_dirty(*pvmw->pmd))
>> +            pmde = pmd_swp_mksoft_dirty(pmde);
>> +        if (pmd_swp_uffd_wp(*pvmw->pmd))
>> +            pmde = pmd_swp_mkuffd_wp(pmde);
>> +    }
>> +
>>       if (folio_test_anon(folio)) {
>>           rmap_t rmap_flags = RMAP_NONE;
>>   
> 
> I guess at some point we could separate both parts completely (no need to do all this work on pmdb before the folio_is_device_private(folio) check, so this could be
> 
> if (folio_is_device_private(folio)) {
>     ...
> } else {
>     entry = pmd_to_swp_entry(*pvmw->pmd);
>     folio_get(folio);
>     ...
> }
> 
> That is something for another day though, and remove_migration_pte() should be cleaned up then as well.
> 

Agreed and Thanks for the review!

Balbir
