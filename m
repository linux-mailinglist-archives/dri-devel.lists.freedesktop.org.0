Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E4AA4ED1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FF910E7B6;
	Wed, 30 Apr 2025 14:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eBrSEImG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C94710E7B6;
 Wed, 30 Apr 2025 14:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrOdUgORFD/OWXVw2y6FLexN/OZ7a3Jr+tIqBlkRAIBYzSfyR5mCR2AGN0x6AEN0uHLCfntm7ZaeCH7re2FbKgHrx+nVQ54vaCEmqEhhK/EG4c6i4dnCRfO+NLIKyIfDycUr2mZUeV8QBhHF9eeaQz1haTOspMx/c7KhbgolwLT611mnYkoJOiwhfK0xMEswCLHY01hrV+6wOE0IF9x97BL5MOtHZPYNgzAT7jvzL9GQ/O9GexbSMohOewom0Xna/aY8K/sU0wlTESrZM+Cag5dLqSLuI5Ti5WJJv3vLUfgr3CfpZEbxVOJo2PE+srYiDU0kJA/gcHuMkWidRYmeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MDfyf477uxFIA7tIOCNclBzOQ+78TIs/UF7jBFsUAc=;
 b=FTt4U2XcGahLs5BdnPhBS5ttW2NY5HMNfajJRSVuMxupYBma97h7YWkzaHsKtXg22ivg89BrAFV3jeNxZIlkfPfHRVJBs9JN1Sdp3tWojXOQjBAobksL1vjJCVbhBH0EXwKk8riWTVR7NTC3Mwri0AxqIhY5mUl70gunMUflARLhhFBfa9YpSitDpdXm0L+xmit+EfcECcwLLOr4nhDQNRUDBJx78KjljKdNxV1T/HCUdBk9eZINeKRfC01XsQb9h1WrT5V0d/d8bBItnj1pWoB9JlBdOz8zH548iSe87HGdOGnKZf9v3UFr08Bd7LlqFyohzByP2/7AynMBykgekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MDfyf477uxFIA7tIOCNclBzOQ+78TIs/UF7jBFsUAc=;
 b=eBrSEImGd3c9WOMkGjmnVFjWJt7yywI98XE2cIfOXY8Ng6gOtkBNMyTqjjaRnT4MdmwosMtSkA6pgxJEClSrYsNgZF+PV4qx1fAmbx6Zr+JKzZva6t1xvYyQ7lFpHPEUA1+DBRcd8FIbtreALlfsE2dxwbvFYlYLF0RpEfnepcT8ML7x1cyfqn+BFACl+qU5zZsxWJpH6ott1d29ihUylBZZ1RxZW/ch48BlKzcAoHIJAduszQ6sqiUAejk+h3xR8QlCtZKzVrf4JhNwVkVrRmv1xLGqSTeJ+1ve906I5fZEIbWpSHZZEkgfui9T/dacmsXy5/qPFigLnXZA4Stm0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by DM4PR12MB7527.namprd12.prod.outlook.com (2603:10b6:8:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 14:38:16 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 14:38:15 +0000
Message-ID: <9977ad2e-ce2d-48b5-a222-f74a821abfeb@nvidia.com>
Date: Wed, 30 Apr 2025 10:38:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions and
 base code
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae> <D9K09AU4KTQJ.3TVVZPMDB0H7I@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9K09AU4KTQJ.3TVVZPMDB0H7I@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN6PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:405:75::35) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|DM4PR12MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 57aae9b3-c01c-4461-7850-08dd87f4a426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ang4RW9leGhsbEpORlBWZTNMWG8xQ2tCVjl6N09pK1JJMTg2Q3BYcWU4SC9V?=
 =?utf-8?B?SjVHcC9GRXpEbFR1aDVXcU8vYVBQbmh6cVBJWHNPa2tFMkkrVmJjOUoxRXhX?=
 =?utf-8?B?OGwzSVZnSzVpMXAveHpJYndLN000OVI2WGUxanhXOXNQYzVwdk5uVUsxR2Q3?=
 =?utf-8?B?b0hoV2dlT0dDUjlUN1BIZnh2bHBvN3dFcndLV3ZBQm9UbVVPRjVqdVhlYm5X?=
 =?utf-8?B?WGphazZNNko5MVFOa01iQkI3ZE9hTUg0SGtBaTQ0NDBWZTVuOXhOSkh0Mk5F?=
 =?utf-8?B?b1NuNzVBdmNSWlJPa0JKbzhEL1lEcy9HQm9DK1dMTDR1MkZOTlNXQ0xFZkNl?=
 =?utf-8?B?VTVzeGQrWExFSzkyS2tTRDNERC8wVmYxVW5QQnhLdm1XbHNEblRucWh5dDd2?=
 =?utf-8?B?VGJEakcwY2lmaUxlUFpKOSt3V050NEFGOHRCR0x6UkZubTdKd1dJaG9SUnJO?=
 =?utf-8?B?aFkvZHc3aEJwcTBCV1VBa1JDeThBR0Z3eEJGN3ZDL1NvVUp4MVhSeEEybWhH?=
 =?utf-8?B?WHFXS3dMVU4yWDhBenliKzhGUHhOK3ZGM21aM295V1VDUUQ1bFZua3VRdFdB?=
 =?utf-8?B?cW52Ri9rSGdZVnQ0TlJNUXNvSWs3YWdvYmxpeXp0Tm95U1hxVFdQczNxRU16?=
 =?utf-8?B?SGZNRGYxS1BVOE9wVDlvOWg2eHZmbi9YUGY4SFk4aHhLcmlPOFVIYlUvVU1C?=
 =?utf-8?B?bmhyaGhmN3ZxMlI0L0xWejZkdWx6czBHbSt1dk0wTTE0cWx6amthSmd5bEJW?=
 =?utf-8?B?dVpBbUtGL1pYNE1kNzBYU1pZQ2ZkMkRkajZnVjc1Skpsb08rajVqTlNJZzNq?=
 =?utf-8?B?QWR2THJmTGg2YTVmSSt0VmQ2a3BqSmR1M0RnaUZDSkQ5ejUxZkwzK0c5RGY4?=
 =?utf-8?B?YWJOMk8wd1hRY0ltdjgwL3Jzb2NLMU9QdVhVVnJjcEJ0dXB1R2lDZThraVE1?=
 =?utf-8?B?THRVYTVJc2ZnM005U1NHa0lBOXpEdFJKWUVSMHNZd2RoQzU0b0xSU3JvSGF4?=
 =?utf-8?B?VkQyUlA5cHJiTGVFZ3lSek04dlQ0bXovL3kyZDRLNFhCbjNSM3NPQXd5ZjVD?=
 =?utf-8?B?MnFuQkJiSzV4NUJLbnFaelRnTGJXSGNtbS83RmNzVU9SdFBCVXBPaHFSZlpB?=
 =?utf-8?B?R1g4VVYrQTVBZm1vRlk2bmNBdWpMcFJBKzVLWWVOOVRmRk55UCtBbTdRVnRW?=
 =?utf-8?B?S0hxQTlwbXpwUDg5Yk5pbnMzaGR3WlYyR0pGcXptbllUK0Z2SEk3UzhEcXk3?=
 =?utf-8?B?a25QOGJZQ3o3eWFmL2kvbUh5bG5MdllrVjJFSGpncU5BNjdrRzhqeTBFQkh4?=
 =?utf-8?B?dGRFQ0hwaGorSHR2REhvT0M1M3o0MGN4NjlaRnNwYUZBcmhxamV1U016M0ox?=
 =?utf-8?B?WkFUbU1SRStiWWMwWHpaRjdSQkxiNzB6L2VyY24yNVAySnhlUnl3dUhhWFFW?=
 =?utf-8?B?SUF0OVgyZlJGWXFtTWlWSkdsNFhNZmRKOFNJWG9UY0hTQ0xWdlJCODIwR0tK?=
 =?utf-8?B?WjAzb05JSnBDKytha2dvOFliTWhJYUNkUkpWTVloY2JVRnJIcjhLUHZndjBY?=
 =?utf-8?B?SUl4bkxsTkhGeVN5TC9xaExEbzFXSFdOL0t4bmxzRXJ5eGpzSXUzZzlLWkJO?=
 =?utf-8?B?b2J0c1RvRUxyT2FOZkZJTDV6UGxjRmZzUFYzdkRzNjA1QzJvRkFpcGpDS0Jj?=
 =?utf-8?B?bERmYzRGWXNkUzhIRzlKUTJBcEpUdFF6cUR1eGp1TnV0TVVJZnJmU0grMksv?=
 =?utf-8?B?Ukxua0crRU9HaXUyVHN3WXdVM1hhTy9RbHhMbVVNQmgrNGYrSHVDNmFBZmhk?=
 =?utf-8?B?YnZ5Q2ptRkpScW5aNEkyaXc5YXlFMTN4WmtuU25JUEh6NFlyWmFkVktCRnJS?=
 =?utf-8?B?ZjEyK0pSZzJqeC94MWxraDQvb09vVWw1endnRUJXUmlzRFNJUDdicjF1RTRF?=
 =?utf-8?Q?4eYQ9iAUJYo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWdQanlsUlRxbDlCVHVXREEvNndxelFhcnh4MDI4d2Zxa1Rxc2Vkd1pxUU1V?=
 =?utf-8?B?ZWtNd3ZaV2hxclIzemo5c1FCL2VneFdmR1dpdmxscHRHSWRHYisyQitjdmpi?=
 =?utf-8?B?MEZMV1QxTmtCaVVUTTRPQktFQUdSdXY5a1N6MHpGZXJsR0tIWVA1QXBUR1c4?=
 =?utf-8?B?dlN1TytPOXBGRkM4RlRUTWc4QVBCeHFKRmRqZVUvZlRNS3B5V2ZDcUlkVGFQ?=
 =?utf-8?B?VXV1OWlBK3FaTHdQeXpFNVI5MStnN3RoMTZET0VxOU1Cb2ZZQmlRT0FGNGE2?=
 =?utf-8?B?aUNFWjJwWWk1anpYYm1Ed0ZnTmZITHl3Z2Q2YkJWYkhsU2Q3NFJjcTBuWHpz?=
 =?utf-8?B?Zk1JWUxxZjM1Q3hNS3R3NnVNWTUrQVJVSzBnamU3cmhiMDBoSklOeGNaeGVL?=
 =?utf-8?B?R0U0cDFBZUZERWxHWE5YdFRYY1Q4YnZIZWsyQm15ODRlc29zREFtSzJFNHp5?=
 =?utf-8?B?a2tERGI5ZC81QWNXbDlPUXo5UWtLQ0lMWmUxN09JekNNUVJ0ZkRweUZUcE1F?=
 =?utf-8?B?RERFSkNvUWdueG1sd3ZoVjhmOFJDUlN5TUJ5VWZhWms0U3p6MkJXL0R1dVVR?=
 =?utf-8?B?VkVOTlR0M2ZsYUV4Z3VoeEh5cUg1SnJTOG9UTE4vdTdEUUcyZUN4NkVoa21j?=
 =?utf-8?B?YzBiNkZVL0FLRWY2dkhWQ1RJbUhpSEhwbm02YXBaSE1WcGpqNUlkMjNGbjFP?=
 =?utf-8?B?cE5zUlkxbEQxNUc4b2l6MVhEeWpXM3MzSU81WkcrSnBVSG5WUjQwdUFQb1BX?=
 =?utf-8?B?TlYwYkFNSjlJTERadWdmQ3ZvWnpLaUpOclFEcWlhZGVBOTJvaElyVmhFSXdX?=
 =?utf-8?B?ZEoycUIzREpYUFc3REdNNzlYVWRWQlJUbEc4aTY3UlVMWEJSZGFKY1lkYmdn?=
 =?utf-8?B?UXd0a1NPUWFXaUdmN3FmK3F1OE5BUHRsSXR3SEtWMHVMd2NLY3BreHRTN0lQ?=
 =?utf-8?B?UXN5SXU4L1Y1cjVMTkRnMGMvRG11TmFtM2FsVzUySDNMeGJDRGtnZzczQm5a?=
 =?utf-8?B?RHdROERsYmgyOXJQdlBzUFVDcGY1bnZmWTRERGFtSkN5MzlCb2YzR0REK2dR?=
 =?utf-8?B?bG03RWRNd1lCYmRjRU5BVkU0U2FHcmdkaEZZNkhYTzYrUThSTnVaNmFCeUlH?=
 =?utf-8?B?UDRPWnMyOWFMMkt0Z0IxUllOaTJmZi9RRWVnUjVHaHZLTVBIVGtHSkxPN0R4?=
 =?utf-8?B?T2N6RFdTeWRLL0REeW1pSDZMQ05UekJ4bUpYY3dGbWhyY3VUTjNMUW8wNGQx?=
 =?utf-8?B?Tm51bkU3REk3SzRsaUFjaTE4U2pJNHBuZ1lRRUs1aTFxVkJORUZRVkNVMDJV?=
 =?utf-8?B?amV4aFppbkxrUjhWeEh6V1VSd0RLenJTN0Zhckg1VkZuOTh5SUp2dFZXK0RB?=
 =?utf-8?B?VFpWMTEwdnk0bXVGeXdHNzl3K0w5eXArTVBUVEM3S0NUU2NBalhMZFdsdk5K?=
 =?utf-8?B?RTg4dDhlN1E2Y2ljQUtJOEc4Y2hmbzZGbDhCYWRmOTEvZ1Bxbm01dlNWM1pv?=
 =?utf-8?B?NEhlaHdjcVIwMWxmRkpEU2tDd1ppNUhhN3FmSDRSMEFmcUp5Q1hwajhwSlpy?=
 =?utf-8?B?VmVGN2xadlAvdVM2SFdjaXB2V0cvNk1BeG5qaUhqWllDV3NkbmNMTDFxSFp6?=
 =?utf-8?B?VklzV3Q4YmRWa1ZkeFAyL2tubGpjQ0RieEc0VHg0bTBKWkh2cGtrNWFwZHFi?=
 =?utf-8?B?NWtEQVFGZHRQdGpEc2p5dHQzdjlPck4vU2hUZUlXd295dGhhODNXekJzNVNY?=
 =?utf-8?B?NTQreU51NnN3UURMVUI2VGdmUVpsRjUwaGZOWFNKUkg0dXlDZ3o2aDkxVW0w?=
 =?utf-8?B?UHNzK21rNkhZVmxsR1d3bGlmbDFNSjhSd3I5RlZPVXV5dkhmaTU1dzhSSkxR?=
 =?utf-8?B?TmJpeFl2M1Z5a0t6Vk02ZDJqbTVmdXhUKzhwWkkyUjlCTU02bk0zWVdCbGQ2?=
 =?utf-8?B?SlFidjJFSERZdU9tSDFlbHA1cDcycWdIamVJTGNicUZQYk5oZlZUZ0Q1RCsw?=
 =?utf-8?B?emg5cGJoS1JlTlRYM3FwUDJCWnltOFR3Mm1UQjBOK1VSTW10U2lSbHpoZkdu?=
 =?utf-8?B?MFEvT3ozRUcrbG0wZjZKVCtsWkYrcXBZQTluNzl4MkRHc0dnR3NmSm4yc1R3?=
 =?utf-8?Q?g76ZawPf/M3N0l3nqrEoZVaYf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57aae9b3-c01c-4461-7850-08dd87f4a426
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:38:15.4878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqoO/WfMwIdIt3heex2MLOh75FHwsHjt/TvWS/IwyUmQ/MBTKuMisH0tCwPh0BKarZACgnMM6xfDCfFCeWq+sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7527
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



On 4/30/2025 9:25 AM, Alexandre Courbot wrote:
> Hi Danilo,
> 
> On Tue Apr 22, 2025 at 11:44 PM JST, Danilo Krummrich wrote:
>> This patch could probably split up a bit, to make it more pleasant to review. :)
> 
> Probably yes. I thought since it is mostly new files, splitting up
> wouldn't change much. Let me see what I can do.
> 
>>
>> On Sun, Apr 20, 2025 at 09:19:43PM +0900, Alexandre Courbot wrote:
>>>
>>> +#[repr(u8)]
>>> +#[derive(Debug, Default, Copy, Clone)]
>>> +pub(crate) enum FalconSecurityModel {
>>> +    #[default]
>>> +    None = 0,
>>> +    Light = 2,
>>> +    Heavy = 3,
>>> +}
>>
>> Please add an explanation for the different security modules. Where are the
>> differences?
>>
>> I think most of the structures, registers, abbreviations, etc. introduced in
>> this patch need some documentation.
> 
> I've documented things a bit better for the next revision.
> 
>>
>> Please see https://docs.kernel.org/gpu/nova/guidelines.html#documentation.
>>
>>> +
>>> +impl TryFrom<u32> for FalconSecurityModel {
>>> +    type Error = Error;
>>> +
>>> +    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
>>> +        use FalconSecurityModel::*;
>>> +
>>> +        let sec_model = match value {
>>> +            0 => None,
>>> +            2 => Light,
>>> +            3 => Heavy,
>>> +            _ => return Err(EINVAL),
>>> +        };
>>> +
>>> +        Ok(sec_model)
>>> +    }
>>> +}
>>> +
>>> +#[repr(u8)]
>>> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
>>> +pub(crate) enum FalconCoreRevSubversion {
>>> +    #[default]
>>> +    Subversion0 = 0,
>>> +    Subversion1 = 1,
>>> +    Subversion2 = 2,
>>> +    Subversion3 = 3,
>>> +}
>>> +
>>> +impl From<u32> for FalconCoreRevSubversion {
>>> +    fn from(value: u32) -> Self {
>>> +        use FalconCoreRevSubversion::*;
>>> +
>>> +        match value & 0b11 {
>>> +            0 => Subversion0,
>>> +            1 => Subversion1,
>>> +            2 => Subversion2,
>>> +            3 => Subversion3,
>>> +            // SAFETY: the `0b11` mask limits the possible values to `0..=3`.
>>> +            4..=u32::MAX => unsafe { unreachable_unchecked() },
>>> +        }
>>
>> FalconCoreRev uses TryFrom to avoid unsafe code, I think FalconCoreRevSubversion
>> should do the same thing.
> 
> Since the field from which `FalconCoreRevSubversion` is built is only 2
> bits, I thought we could avoid using `TryFrom` since we are effectively
> covering all possible values (I wish Rust has n-bit integer types :)).
> But yeah I have probably overthought that, and that unsafe block is
> unsightly. Converted to `TryFrom`.
> 
>>
>>> +/// Trait defining the parameters of a given Falcon instance.
>>> +pub(crate) trait FalconEngine: Sync {
>>> +    /// Base I/O address for the falcon, relative from which its registers are accessed.
>>> +    const BASE: usize;
>>> +}
>>> +
>>> +/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
>>> +#[derive(Debug)]
>>> +pub(crate) struct FalconLoadTarget {
>>> +    /// Offset from the start of the source object to copy from.
>>> +    pub(crate) src_start: u32,
>>> +    /// Offset from the start of the destination memory to copy into.
>>> +    pub(crate) dst_start: u32,
>>> +    /// Number of bytes to copy.
>>> +    pub(crate) len: u32,
>>> +}
>>> +
>>> +#[derive(Debug)]
>>> +pub(crate) struct FalconBromParams {
>>> +    pub(crate) pkc_data_offset: u32,
>>> +    pub(crate) engine_id_mask: u16,
>>> +    pub(crate) ucode_id: u8,
>>> +}
>>> +
>>> +pub(crate) trait FalconFirmware {
>>> +    type Target: FalconEngine;
>>> +
>>> +    /// Returns the DMA handle of the object containing the firmware.
>>> +    fn dma_handle(&self) -> bindings::dma_addr_t;
>>> +
>>> +    /// Returns the load parameters for `IMEM`.
>>> +    fn imem_load(&self) -> FalconLoadTarget;
>>> +
>>> +    /// Returns the load parameters for `DMEM`.
>>> +    fn dmem_load(&self) -> FalconLoadTarget;
>>> +
>>> +    /// Returns the parameters to write into the BROM registers.
>>> +    fn brom_params(&self) -> FalconBromParams;
>>> +
>>> +    /// Returns the start address of the firmware.
>>> +    fn boot_addr(&self) -> u32;
>>> +}
>>> +
>>> +/// Contains the base parameters common to all Falcon instances.
>>> +pub(crate) struct Falcon<E: FalconEngine> {
>>> +    pub hal: Arc<dyn FalconHal<E>>,
>>
>> This should probably be private and instead should be exposed via Deref.
> 
> Agreed - actually not all the HAL is supposed to be exposed, so I've
> added a proxy method for the only method that needs to be called from
> outside this module.
> 
>>
>> Also, please see my comment at create_falcon_hal() regarding the dynamic
>> dispatch.
>>
>>> +}
>>> +
>>> +impl<E: FalconEngine + 'static> Falcon<E> {
>>> +    pub(crate) fn new(
>>> +        pdev: &pci::Device,
>>> +        chipset: Chipset,
>>> +        bar: &Devres<Bar0>,
>>> +        need_riscv: bool,
>>> +    ) -> Result<Self> {
>>> +        let hwcfg1 = with_bar!(bar, |b| regs::FalconHwcfg1::read(b, E::BASE))?;
>>> +        // Ensure that the revision and security model contain valid values.
>>> +        let _rev = hwcfg1.core_rev()?;
>>> +        let _sec_model = hwcfg1.security_model()?;
>>> +
>>> +        if need_riscv {
>>> +            let hwcfg2 = with_bar!(bar, |b| regs::FalconHwcfg2::read(b, E::BASE))?;
>>> +            if !hwcfg2.riscv() {
>>> +                dev_err!(
>>> +                    pdev.as_ref(),
>>> +                    "riscv support requested on falcon that does not support it\n"
>>> +                );
>>> +                return Err(EINVAL);
>>> +            }
>>> +        }
>>> +
>>> +        Ok(Self {
>>> +            hal: hal::create_falcon_hal(chipset)?,
>>
>> I'd prefer to move the contents of create_falcon_hal() into this constructor.
> 
> I think it is actually beneficial to have this in a dedicated method:
> that way the individual HAL constructors do not need to be visible to
> the `falcon` module and can be contained in the `hal` sub-module, which
> I think helps keeping things at their place. Is there a good reason to
> prefer doing it here?
> 
> Ah, maybe you are thinking that we are returning a Boxed HAL because we
> are going through this function? It's actually on purpose - see below.
> 
>>> +pub(crate) struct Gsp;
>>> +impl FalconEngine for Gsp {
>>> +    const BASE: usize = 0x00110000;
>>> +}
>>> +
>>> +pub(crate) type GspFalcon = Falcon<Gsp>;
>>
>> Please drop this type alias, Falcon<Gsp> seems simple enough and is much more
>> obvious IMHO.
> 
> Yeah, I wanted to avoid having to import two symbols into the gpu
> module, but I've probably been overthinking it again.
> 
>>
>>> +
>>> +impl Falcon<Gsp> {
>>> +    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
>>> +    /// allow GSP to signal CPU for processing new messages in message queue.
>>> +    pub(crate) fn clear_swgen0_intr(&self, bar: &Devres<Bar0>) -> Result<()> {
>>> +        with_bar!(bar, |b| regs::FalconIrqsclr::default()
>>> +            .set_swgen0(true)
>>> +            .write(b, Gsp::BASE))
>>> +    }
>>> +}
>>> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..5ebf4e88f1f25a13cf47859a53507be53e795d34
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/falcon/hal.rs
>>> @@ -0,0 +1,54 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +use kernel::devres::Devres;
>>> +use kernel::prelude::*;
>>> +use kernel::sync::Arc;
>>> +
>>> +use crate::driver::Bar0;
>>> +use crate::falcon::{FalconBromParams, FalconEngine};
>>> +use crate::gpu::Chipset;
>>> +use crate::timer::Timer;
>>> +
>>> +mod ga102;
>>> +
>>> +/// Hardware Abstraction Layer for Falcon cores.
>>> +///
>>> +/// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
>>> +/// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
>>> +/// registers.
>>> +pub(crate) trait FalconHal<E: FalconEngine>: Sync {
>>> +    // Activates the Falcon core if the engine is a risvc/falcon dual engine.
>>> +    fn select_core(&self, _bar: &Devres<Bar0>, _timer: &Timer) -> Result<()> {
>>> +        Ok(())
>>> +    }
>>> +
>>> +    fn get_signature_reg_fuse_version(
>>> +        &self,
>>> +        bar: &Devres<Bar0>,
>>> +        engine_id_mask: u16,
>>> +        ucode_id: u8,
>>> +    ) -> Result<u32>;
>>> +
>>> +    // Program the BROM registers prior to starting a secure firmware.
>>> +    fn program_brom(&self, bar: &Devres<Bar0>, params: &FalconBromParams) -> Result<()>;
>>> +}
>>> +
>>> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
>>> +///
>>> +/// We use this function and a heap-allocated trait object instead of statically defined trait
>>> +/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
>>> +/// requested HAL.
>>
>> Do we really need the dynamic dispatch? AFAICS, there's only E::BASE that is
>> relevant to FalconHal impls?
>>
>> Can't we do something like I do in the following example [1]?
>>
>> ```
>> use std::marker::PhantomData;
>> use std::ops::Deref;
>>
>> trait Engine {
>>     const BASE: u32;
>> }
>>
>> trait Hal<E: Engine> {
>>     fn access(&self);
>> }
>>
>> struct Gsp;
>>
>> impl Engine for Gsp {
>>     const BASE: u32 = 0x1;
>> }
>>
>> struct Sec2;
>>
>> impl Engine for Sec2 {
>>     const BASE: u32 = 0x2;
>> }
>>
>> struct GA100<E: Engine>(PhantomData<E>);
>>
>> impl<E: Engine> Hal<E> for GA100<E> {
>>     fn access(&self) {
>>         println!("Base: {}", E::BASE);
>>     }
>> }
>>
>> impl<E: Engine> GA100<E> {
>>     fn new() -> Self {
>>         Self(PhantomData)
>>     }
>> }
>>
>> //struct Falcon<E: Engine>(GA100<E>);
>>
>> struct Falcon<H: Hal<E>, E: Engine>(H, PhantomData<E>);
>>
>> impl<H: Hal<E>, E: Engine> Falcon<H, E> {
>>     fn new(hal: H) -> Self {
>>         Self(hal, PhantomData)
>>     }
>> }
>>
>> impl<H: Hal<E>, E: Engine> Deref for Falcon<H, E> {
>>     type Target = H;
>>
>>     fn deref(&self) -> &Self::Target {
>>         &self.0
>>     }
>> }
>>
>> fn main() {
>>     let gsp = Falcon::new(GA100::<Gsp>::new());
>>     let sec2 = Falcon::new(GA100::<Sec2>::new());
>>
>>     gsp.access();
>>     sec2.access();
>> }
>> ```
>>
>> [1] https://play.rust-lang.org/?version=stable&mode=debug&edition=2024&gist=bf7035a07e79a4047fb6834eac03a9f2
> 
> So are you have noticed there are two dimensions from which the falcons
> can be instantiated:
> 
> - The engine, which determines its register BASE,
> - The HAL, which is determined by the chipset.
> 
> For the engine, I want to keep things static for the main reason that if
> BASE was dynamic, we would have to do all our IO using
> try_read()/try_write() and check for an out-of-bounds error at each
> register access. The cost of monomorphization is limited as there are
> only a handful of engines.
> 
> But the HAL introduces a second dimension to this, and if we support N
> engines then the amount of monomorphized code would then increase by N
> for each new HAL we add. Chipsets are released at a good cadence, so
> this is the dimension that risks growing the most.
> 
> It is also the one that makes use of methods to abstract things (vs.
> fixed parameters), so it is a natural candidate for using virtual
> methods. I am not a fan of having ever-growing boilerplate match
> statements for each method that needs to be abstracted, especially since
> this is that virtual methods do without requiring extra code, and for a
> runtime penalty that is completely negligible in our context and IMHO
> completely balanced by the smaller binary size that results from their
> use.
Adding to what Alex said, note that the runtime cost is still there even without
using dyn. Because at runtime, the match conditionals need to route function
calls to the right place. I am just not seeing the benefits of not using dyn for
this use case and only drawbacks. IMHO, we should try to not be doing the
compiler's job.

Maybe the only benefit is you don't need an Arc or Kbox wrapper?

 - Joel

