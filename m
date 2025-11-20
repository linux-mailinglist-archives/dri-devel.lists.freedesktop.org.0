Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C9C737AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 11:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58C110E0F0;
	Thu, 20 Nov 2025 10:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ey2M6+Wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010018.outbound.protection.outlook.com
 [40.93.198.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700DF10E0F0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 10:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9snU9x4u8lHDEgfWM4KhrXNmUic/TRySaFMgzNxP8DhmaMTwt5XrWwBCqkX+IZlQBQ6+/MY0YrkyFrW6ATLqxE1YO8TFLwS5MJBzKGoT5VYMUfbpPlnxupUGQugY1qp14Xu426CYYfgoqxIZwohGtrzoOFayR4Td5gyZj7q/r1J2f/SaQOWNunlLY665vLY7bCA6qlEooO9jk4hCXFhZmLhz/0TW+1BBx0qhMRBAMIZOX1Avj65+iYGfJNvPoBsiOC8Di55Ywnnnug9E4nCcWyEK+qx9snO89YJazYQzk4B2sVY+wYVOg9FEd5FFNGZvenLeTIaE24yjCE9dcI4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5MN1d6o9Lwd2q7wdkQLFNDX/vDIiefcF8X1TIGgbOE=;
 b=GTuEnzRZF168wWTRmbpCoJ0WNIhZgLf8lganwuVkYFoW6h34rkictMLo4C3r4/z0HvrCRMK0vqypcgqJi0094ypHOLtnQkAVTuJyXMg8Pcu7ULQAcdHsXVrTbt9FwRylGr4jiqvqgwdLkQgPFm6Aq6VFcLN862XMnfA378XSkKiCTkmtTGtCuCgOb56ZF//FUts7x3Z1DPIFWWtzqRCEFQ2JAq2Dd/XGSl/5P1Ti1eu/5/ZqkQ8kgmhhoJMDeE/affGuPpaGEHh3LI4AYg1Cc0d3L7WpC8v56y/9Hv7naUGE+7UcBgQy3a+XXQsXyIFi55KhN4NQvh2HpLopzrWmqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5MN1d6o9Lwd2q7wdkQLFNDX/vDIiefcF8X1TIGgbOE=;
 b=Ey2M6+Wx1MHNKLN9819SyuyJpq+x5Vnh092T+OrrV3+BmpiXn338CIbVTI7OgK01FwPA48cl/FcnpzwknevzjJye/5G4eH8BTO9NsunYSowMgobe2W0agGOkRvj1gdaBYc/V2B9ZDvqR+3jpCgMXZNHm9kWGIVn+qExOX8o0ajdwWhDbayW2bhOZlErXDLqDr5H32XAJdX9RMKtthMDiHxym2D/H1dIu4Q4V2iHuZ45DoCgJwEg/QCi0uSiM5lIVaIq+9BrLo6UoWFh/XsuM6aK7og2l1VBnr0gIqYZxEzhEDiQOlB8YnYynA8XfOZu9ZiTSCM02L8h8571bOvMszA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB7343.namprd12.prod.outlook.com (2603:10b6:806:2b5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 10:35:35 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 10:35:35 +0000
Message-ID: <a81d10bb-cf63-4095-b8ef-1631f8ef5712@nvidia.com>
Date: Thu, 20 Nov 2025 21:35:27 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup: mm/huge_memory.c: introduce folio_split_unmapped
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
References: <20251120030709.2933665-1-balbirs@nvidia.com>
 <4b87bd52-5582-4599-8a97-38843e27d0a7@kernel.org>
 <875a9449-fcdd-4aef-9d77-1703dd02edf0@nvidia.com>
 <3c332dea-ea60-4939-9843-ac7d3068c7c8@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <3c332dea-ea60-4939-9843-ac7d3068c7c8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e79e1b-7b7a-42d6-8b9e-08de282089b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGNLWk9NVTJ0WjdjTSt5NG9Pc21EdzVla2dRY3FBUnZGYnpmT1poTlB5QTFl?=
 =?utf-8?B?ZWl0Yi9TVTdwRkppa3ppdHFSTFI4TFhKR0FuTGIvVGVnb0hjRVorQnZPWVJj?=
 =?utf-8?B?eEUyc0VnZFRSWUp4UWFIUTRGb0xWTVZFZzc4VkhKb0VoekVvRURNK2pwQU1t?=
 =?utf-8?B?VFRvS2w4cStHTUc0OGErckFPek1TT0ZsQmUzZXozS2l0dGNlNFNpSUNjNmFH?=
 =?utf-8?B?NGVpZ2llR2wyamNOS21jZ1Z5RmxSZEN5WFNrU25HOVg5dGhpYjROSkk1cHl4?=
 =?utf-8?B?aHpXS09kRzB3bWJEa2YxSU5ZSkh2NjZFenZ6eUJEZi83ZC9TS0Q2OGVTWk1Z?=
 =?utf-8?B?aGR3SnFCWnV4S3VZQnY5WjZDaDN1NlJtTEJOV3dlS3lFZ2dOU0lBQVVQSXJq?=
 =?utf-8?B?QTYxeDZlMUlhTllrMUV4VFRYMmRjbHgzOGtjT24wZFFRODZMeXJuMkkyazlu?=
 =?utf-8?B?NzhhaXM3WElQL1J3RDN1U0hmZWJIeWo5QkJPRlJjTDI3Y2tWaFBnSmVtY0k4?=
 =?utf-8?B?RGJWbUVNd0cwYWw4LzFpb05TT3RlaXVVaWZINWNLcHRibHhNWnJDcThpbjVQ?=
 =?utf-8?B?OUdpSmxBcXV5eE5uL3poL2ZEWWtJdmtKZ3JJZWUwV1diUVJ5c0ZleWR1Sk9M?=
 =?utf-8?B?QnVFaHkyRjhkMThLTFp5aFIrWi80SnNrc2VtbUhLUmx3QkVvb1lCL3UxSnox?=
 =?utf-8?B?bnFabjB1NlhrUzU4OGNFd20vYStRdk5rNkFtZ3FCMURUQlFqbDVaZG9ZeDE2?=
 =?utf-8?B?dXVuVVFKZEljUWMyWU1qWkVwN3VLL0VzVjVXWXh5aWJVazdBd1lxMDFqRG9p?=
 =?utf-8?B?UFliMjhVMlBFV051WDhTTVNBUS9DU1h1cHUzaTVtL3ZzUTljblNaVGd0UTFG?=
 =?utf-8?B?RGNBcEZyUVRvb2JLcUx1L2RKN3dWS05sWTN4ZHJFRnlhNEE0SnBRRzBGYjV4?=
 =?utf-8?B?RFdwNzMvanlvMVlpVVlrcEw2TGprOWNadGFMVG9HLzBsYWtpYXBpdUYrYlRN?=
 =?utf-8?B?R1V0aHUrbzZmeEYxQjlOZWVSd25iRk1YbWI0VDB0VkNkOGFnb01sM00wb0xo?=
 =?utf-8?B?aU1hNkw1NHlHTFR2TFlEaUIxMlFJTmt4WFQyRUtQUTRYSnhmVEQ1YUJ0SE0w?=
 =?utf-8?B?elFhMmNGM2xGZmF2VjBqSER1RzJtSFlySG9LQ2NzTWc5b1BvM29MeFl0dXho?=
 =?utf-8?B?dDNuVTN4U3hKaGVuSTVnUm4wSG84YjA4a29oelpoSTluVDZlM2Nld0RBNzVh?=
 =?utf-8?B?UU05ZE5rZUpsNHZMN3E5MTVFdk1Gc01kRGQ3Q2Fmb2JSN0tPeFBuUDZ2QlNC?=
 =?utf-8?B?SUNWWUI2RmJvRlFXOFdUaUZuYTZoc21xV0ZMTEpsV2J5YXAyRWlFYWZrNVZR?=
 =?utf-8?B?OWZhWUlTWGp1VXdEa3ROclQ4V2Q5ZHo4SWp1SDYxK1dKa09MbjRkVXIwNHNC?=
 =?utf-8?B?L0JCUEZMT2RQV3ZyUTI5dWEzdEZNSTNqWHV0M3EwMHJCd09PNk5IRnZyNFZQ?=
 =?utf-8?B?SFZXclNpMEsrd1E0cWQrN3lSUTRHcWRyd3F0d2hRQVpnL0NtdEZSeHQzdWJN?=
 =?utf-8?B?TDFvV1hFbUZoSEtmVXpMaEZCc0wwWjZRUFFrcTI0QjhPdXEva2N5VXdtSVZz?=
 =?utf-8?B?emQ1T0trRFlOTEZ0d2JEY1IwQStLY1FpR0lVSmpKZTZtUmRVRHFVTEhId2dI?=
 =?utf-8?B?NnQrSUFYS2pGdDYwck5GVWpNUU56UW5OSzdXMzk5b1crTlZGN096R3kycDlH?=
 =?utf-8?B?RloyemFFcHdPT0N6UENldEtuY01kbDlwRkhVL1FaNVg3MmlzTUxFNGVsQWpO?=
 =?utf-8?B?bmNkazlVckRENnozcXl4Tlp4RDQwaFlIc0U3bnFEeWFOVjJsZUlwS0FON2di?=
 =?utf-8?B?L3A0K1M4eS83Zm1HVlgrbW0zelRJdjcxaDVzSlUwTHBNUVpvWWlDS25mRGlL?=
 =?utf-8?Q?KczABmwq0bLxZdpeDlasvo+QmlMC/ODv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDU4bzZpbXYwdFJ2OUNOaGZQanQyNFdFWXgwZmNQY2FtZW1icUZqS1FDRFBH?=
 =?utf-8?B?YWU2TDF0bVR4ckFPYzEvMDhVQlRxd2l0R3V4WnIvM0tTK01PTDFWRkNWOUdo?=
 =?utf-8?B?MFZuMFl5bG4vVkcvc2RrS2E1U2N0d1JBQW45ek13YktydjdlSWEra2l1OGFv?=
 =?utf-8?B?RlpsRWlzNjA1NUU2S1czeHJ5YmF1ZHl1MmRENTBBNzBhOVBSVUhvVHN4TmE1?=
 =?utf-8?B?OVZxQUJLZzkrSHQySjRadHIvcXByYndGOUNxcVk1VGFxMjh1TGJtbTFaQU53?=
 =?utf-8?B?VEF6clFubUxnVlJGenBFYnFOYmYva2g1TWphcEltWlpONUZRRXJCcnVBUlVp?=
 =?utf-8?B?YnVzQmp4MWhTS2xRclZvZFZ1TkF1TUt2TlRuSFlvVW1yalR5WkUzMWhPZkNl?=
 =?utf-8?B?M3RkMEk5SkViZ2hLRzlyeFF4S00ybDdrZ1BTUmQ0Y1pyTTNqZDV5MXpQMGk4?=
 =?utf-8?B?VW5MSlZzY3RqcUcxSDZoMnRScGhEYjFJdTB1MDJPbE1vZFI3S2I2SURYdjlZ?=
 =?utf-8?B?UGR3U3Y2SjhwQTN2eHpWcWdyZUFxMEMzM0RRcHVNUkNYemRCNEtUb2luTTdv?=
 =?utf-8?B?bllYaFNBQ1lqLy9IR2ZRckZ5bjVBL2hRcWdpK2xUZ2JDa0NlYnZ0Qk80YWF2?=
 =?utf-8?B?VytrampaU3RUS3pyMUZRVE9McEV5bk9MT3NrKzVpKzZWUURXRDZTSEk2SzRX?=
 =?utf-8?B?TklwTFQzRGUvajE0WTUzNW9qMWFTL0piRFVxY2gyNndoSFlMOXdmYWhXclY0?=
 =?utf-8?B?bjZJV2NLallpK2U4NURXL0R4SlVSSDluTkRDeTNkMlQzcjNwcERuYnpuVGhM?=
 =?utf-8?B?MnhmUnRnQWZWbmR5YXg3SEFTZU0zZGs3TUQ3RUxTVTM5QzMzdEc5ZHV4aGZ5?=
 =?utf-8?B?aGl5eEZsYndDQytKZkhvUzg3YlB4ZU5NbzJuL0luTUJGK1hleVN2dHYrbGE0?=
 =?utf-8?B?OWk0WkpVNVpGVHQwVHJSRGtjWVplWjRYeVFMRDcrRFR3RUhjYUxqR0c0R3pS?=
 =?utf-8?B?RWpPK3Y4aFVzWXJ4VExNd3hpbW5LRkZEZlNsV0orU0RKY3E2QitwTnlTNTVU?=
 =?utf-8?B?YWZaQjRld211d0hnUE5ud3BPWm5lSWNucmZTRW94dGpSYTJ3U29UMHRYaEMw?=
 =?utf-8?B?TGsxN0xiZDhLd1V2WHlpTG5kNGtCTTNHZnUyQ0oxRm1hdXNSbTJsYm94eHh4?=
 =?utf-8?B?OVcwUjN1VHY4Zk85TXp5NE95aGJaNmI0d1pBQVJtTWFrdVRQYnJFdlBCR0dl?=
 =?utf-8?B?K3o4VFkzRDVLd0dxcHFGTlkwaVQ2MVVWVHlaMG5uVDIzZDkwcU5LVjE0aWlN?=
 =?utf-8?B?K0duY1hSQTZZRzNzcHF2R0hLNFUyT0h0cldqQ0ZIcnRRWnJDYkdod2pwZ3hm?=
 =?utf-8?B?VzJ0Y1FQWW1aTGdpRDVEZEF1TWJiZXowLzRNZGdPSUJnVktGa0xsdUt6SXFa?=
 =?utf-8?B?Sm1yODlDSDB6Y09oSXZpSVJwK2t0VUUxTExvWkZTU3hzSlZ3TnpldFdZRzUx?=
 =?utf-8?B?RXViVmJvcTI5aVZBZmJVMDY5cmxDcXpTc1p2eVhzYVBDeWdGelZwQUhOQUZZ?=
 =?utf-8?B?YVFpdGFNUE9jZ1dsYzR2c3RYWExtOWs5eVU0dXlpSXJmaS94aU1maU9HdkVT?=
 =?utf-8?B?YkJYalYzdFcwazgrdFNONnZZb3JCek9reEY3aEpDZjRkcXo1RUlTUE96K0s0?=
 =?utf-8?B?WWp3L1l1WjRFb2NDTStycFAxY0VWU1hNeGR0dmpiMDNINk5EN2hXT3Y2dC93?=
 =?utf-8?B?dURJTnUycWdCL21LY0FRWGpJYVVURlVEbkFFcWNHMFgvbUoxUmpUT0hqdEdx?=
 =?utf-8?B?Mkh4bzNJcHpaOWpwTzNHR0hIb2JidUxKY3U5bUQ4dHJaM1Z1SUVVdG5YOENS?=
 =?utf-8?B?RzdJa1VFWHc3SjE5NE5YTGtmUlJPN09rOWxFVy9BT3NvV1NLekxTL1V5d3FS?=
 =?utf-8?B?aENvZEhvamQ1bThSK0hseVBrUFc1Y2czQUpKUUIvaTlnQnB0WVNaTVhmMFcx?=
 =?utf-8?B?TFNEdTlsVTVRUmdYelQ1OXl6RmZwZlVYcHZuOHd2Y1AzellGRkF4bDlROWFl?=
 =?utf-8?B?bTdjcGdYc3NvTWJyTk1OUm9UcndlQTMxM3FxWFVoTTJyRSsxSGVrU1dQVU16?=
 =?utf-8?B?N2h6TFZhVVY0YXhHUlN0cGpOR2dDM1VCams0dUdJZ2REUDBVSHA1cjQvemFY?=
 =?utf-8?Q?I7zCt3Wl08+7dtNfYOWBVUFs5YjzHCwx+3MNx9I+keTR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e79e1b-7b7a-42d6-8b9e-08de282089b2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:35:34.9543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40LVr5tSyMHkID7XjfEoU2Reyz2yxUba5hTuYEKsxKYT0rO5da301cvj58lhrWwo/AgYBd+ItAjtDbvlqGw/tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7343
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

On 11/20/25 20:32, David Hildenbrand (Red Hat) wrote:
> On 11/20/25 10:25, Balbir Singh wrote:
>> On 11/20/25 20:09, David Hildenbrand (Red Hat) wrote:
>>> On 11/20/25 04:07, Balbir Singh wrote:
>>>> Code refactoring of __folio_split() via helper
>>>> __folio_freeze_and_split_unmapped() caused a regression with clang-20
>>>> with CONFIG_SHMEM=n, the compiler was not able to optimize away the
>>>> call to shmem_uncharge() due to changes in nr_shmem_dropped.
>>>> Fix this by checking for shmem_mapping() prior to calling
>>>> shmem_uncharge(), shmem_mapping() returns false when CONFIG_SHMEM=n.
>>>>
>>>> smatch also complained about parameter end being used without
>>>> initialization, which is a false positive, but keep the tool happy
>>>> by sending in initialized parameters. end is initialized to 0.
>>>>
>>>> Add detailed documentation comments for folio_split_unmapped()
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>> Cc: Gregory Price <gourry@gourry.net>
>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Nico Pache <npache@redhat.com>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>> Cc: Barry Song <baohua@kernel.org>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>> ---
>>>>    mm/huge_memory.c | 32 ++++++++++++++++++++++----------
>>>>    1 file changed, 22 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 78a31a476ad3..c4267a0f74df 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -3751,6 +3751,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
>>>>        int ret = 0;
>>>>        struct deferred_split *ds_queue;
>>>>    +    VM_WARN_ON_ONCE(!mapping && end != 0);
>>>
>>> You could drop the "!= 0"
>>
>> Ack
>>
>> VM_WARN_ONE(!mapping && end);
>>
>>>
>>>>        /* Prevent deferred_split_scan() touching ->_refcount */
>>>>        ds_queue = folio_split_queue_lock(folio);
>>>>        if (folio_ref_freeze(folio, 1 + extra_pins)) {
>>>> @@ -3919,7 +3920,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>        int nr_shmem_dropped = 0;
>>>>        int remap_flags = 0;
>>>>        int extra_pins, ret;
>>>> -    pgoff_t end;
>>>> +    pgoff_t end = 0;
>>>>        bool is_hzp;
>>>>          VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>>>> @@ -4049,7 +4050,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>          local_irq_enable();
>>>>    -    if (nr_shmem_dropped)
>>>> +    if (mapping && shmem_mapping(mapping) && nr_shmem_dropped)
>>>>            shmem_uncharge(mapping->host, nr_shmem_dropped);
>>>
>>> That looks questionable. We shouldn't add runtime check to handle buildtime things.
>>>
>>> Likely what you want is instead
>>>
>>> if (IS_ENABLED(CONFIG_SHMEM) && nr_shmem_dropped)
>>>      shmem_uncharge()
>>>
>>
>> shmem_mapping() returns false for CONFIG_SHMEM=n and shmem_mapping() checks that the mapping
>> is indeed for shmem ops before uncharging. Happy to change it if you like,
>> your version is more readable
> Good point, but the questionable thing is that it looks like nr_shmem_dropped
> could be set for non-shmem mappings, when it's really just a compiler thing.
> 
> What about handling it through a proper stub so we can keep this calling code simple?
> 
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index 5b368f9549d67..e38cb01031200 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -136,11 +136,15 @@ static inline bool shmem_hpage_pmd_enabled(void)
>  
>  #ifdef CONFIG_SHMEM
>  extern unsigned long shmem_swap_usage(struct vm_area_struct *vma);
> +extern void shmem_uncharge(struct inode *inode, long pages);
>  #else
>  static inline unsigned long shmem_swap_usage(struct vm_area_struct *vma)
>  {
>         return 0;
>  }
> +static inline void shmem_uncharge(struct inode *inode, long pages)
> +{
> +}
>  #endif
>  extern unsigned long shmem_partial_swap_usage(struct address_space *mapping,
>                                                 pgoff_t start, pgoff_t end);
> @@ -194,7 +198,6 @@ static inline pgoff_t shmem_fallocend(struct inode *inode, pgoff_t eof)
>  }
>  
>  extern bool shmem_charge(struct inode *inode, long pages);
> -extern void shmem_uncharge(struct inode *inode, long pages);
>  
>  #ifdef CONFIG_USERFAULTFD
>  #ifdef CONFIG_SHMEM
> 
> 

Agreed, I would like to let this patch proceed and then immediately follow up patch
along the lines of CONFIG_SHMEM as separate independent patch (independent of this
series). What do you think?

Balbir
changes. 
