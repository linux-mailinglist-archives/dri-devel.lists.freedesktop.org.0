Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB2B4837A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 06:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3090A10E45D;
	Mon,  8 Sep 2025 04:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ho+Ppzfx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CBE10E45D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 04:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVjRV9r91cPNLnyhTwLSbpfVpc+9VyJQRGXkxaEXC8fmXRluj9rKbTrDKwB4A4UwYUF42tPzq4jeHmt0Oc3tAaTHn1if4/z9mmXhNQvcw6fvy61WBymE4OW1sL0HoWvXUSoP5n6IG+LZXbzawDFHQdHCC8COC+JyHSY/9342AIvTQuw5I/dHWycWev5dM25dcMbwRZYaBM7gAt3ML3kykqp2SzHF3V7QxnsGRtvxFuvm2uXdr16NS0uX6d0n53BdvQgYFV0bVXEEZjltv3oCCBOzfS6CyQJ3SdGlTLT7DlFCyNGaHsO39K8DEYs5EurS3AqAfcJwQRNWsgBOOVBWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tDho38I7oXCYTWrfpC7Y/l9vooyYWyDbU72kq2JsVM=;
 b=wMlSwP7Yo+Xd9FRZbnhwzHIhMQECHS2xdVfBMZCLwInZGjIeieWFabQdmpZj2+Y/kjfl60YnEHIZZJaluGUI3YYZctl2SZkdrFKxwQq36WHYa49y+cxlAlDTP4Yp31JWu6YMH+svFrsGRMNVtK8TFTRnjErcWR1RPoSaucdNBT2hSbwpS3mAeZo4IoGmKUm0jaFA0IsyYIqd+fLjCYbsHRZLqgsfN1BfcsVO/kwz9WBxutQQz9iRqHnkXrGCh5CGvJvq+bojRiy6EojLMw8L+7paENwSzwJV06vcgdV/80PzsORwoOefr/+9P0fHCJjzeHiJR4qWLfD3O58RbA5wRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tDho38I7oXCYTWrfpC7Y/l9vooyYWyDbU72kq2JsVM=;
 b=ho+Ppzfxi+5Hc8ToLef60Okr2cRVCKB4KbDMacQ4lkZ9J71g9ejvtZ24MdSKtriPTMeaFMEwkEDR+P/4q+F9jGokhvEWzqPl+3vwIcw7h0O1kLe7H/EmXGtpGxau9mqE8XBYHuO6iu2l4OJR1pDd1XDkftJYPNuBrXprHD3ywyUPTiMrSM4Fea+qC77AXhGRymW+y+bU/3MibYIGNcXvHpgaN8+ogIg4Fvbw33qu8xOuy3ATx/7wPaYR0XEQ7hQXINfbiI04QdNZtj6TcRoe/Rhe9TBQqKZvmlnP62ZtvUtUwD4FzvR9GYID1aha2dDFJfZ5g6E8hUAfyv1ih0tFYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 04:57:32 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 04:57:32 +0000
Message-ID: <8e1ef390-ab28-4294-8528-c57453e3acc1@nvidia.com>
Date: Mon, 8 Sep 2025 14:57:23 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 05/15] mm/migrate_device: handle partially mapped folios
 during collection
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
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
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-6-balbirs@nvidia.com>
 <e6b795de-f522-4952-9ec3-00a2359c43a9@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <e6b795de-f522-4952-9ec3-00a2359c43a9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:a03:331::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DM6PR12MB4074:EE_
X-MS-Office365-Filtering-Correlation-Id: a21d6301-e497-4951-e31d-08ddee943803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWlMSjl3dy9iUXJ4MXEzVDh2ZGtGRWh1eG5BdXB0YVJHWVowU1Q0c3RxTmxY?=
 =?utf-8?B?aGlPRkVaUFBtckdpOWlwODU5aUtqMEdCU1V1VTZUUlZNYWs2aDd1cGh3TjEz?=
 =?utf-8?B?blNVZkNDMVdiREtuZWNTTzFMODJWNVpGTFFkZDMwMTU4U0xSZ1lkZndiMldS?=
 =?utf-8?B?L1FYS0dTcGNNeEd3d0FRTjh3VnhmVHlQQ3Z5UE9xRXMzMDR4NVpqUGY4dWJS?=
 =?utf-8?B?R0hTK3IwNUNSeU1na1ZObnA2NDBRbmV3WFlBUHdiU1Jva0NQWlM2NCsyOVlp?=
 =?utf-8?B?WVhndlEyR1pjKy9FeWI2THJWSExWdFptY3llaGJtZTljb2NKTE45QUxXSCsw?=
 =?utf-8?B?K2lYVDhYVzFvNk1URDFSakhYWWtkeFF4RVlkWTZCV3BtUm9vbjRzOHo5c1Vp?=
 =?utf-8?B?MUJGczA5TVdYaEVBbjUwL1pHbVNVN3VTeDZvdmVEb2dYVFhEQXJxdVlwUUpO?=
 =?utf-8?B?bkkrZjRnT0VmWnNreHdVQzN3ekJxamlTU3NRMFJzMks0S0ZVNDE5MlBjTTB5?=
 =?utf-8?B?K3F0SWlpd05URnEwT1VSNmp1UitNL3dleTRHL3I0NWJGb0pmZTlNeE1vYk5X?=
 =?utf-8?B?bktzZlczY1J6VTgwQ085ZG81R0xCNzYrSmFXbEZQYmRtd1lNMDF5bVMxRVVv?=
 =?utf-8?B?Z1BMZE5jeXp4eFR4SndPQTJmMnV4QVlmTHFxRWptVmVzZ1JFNExhV2QzbmJX?=
 =?utf-8?B?S2c5YU5BWXUyUCs0cnlnREtuNkN6eHZGbWZ4b2U0cEYvR2x5SnV1RDFjZ1VK?=
 =?utf-8?B?UDB1ZzhENUl4Q2M0QUg0SlBjcUxhZ2QyZzBSSlpkRmI2ai9pcm9uN3BGUHE4?=
 =?utf-8?B?RG5XUXZVZVB5RnRqUVdaYmZxMmRqVVFmVEtKcWw5aTZPU0V1MnpEWkpSenor?=
 =?utf-8?B?eS8ya2k3VVFZTE1JWDQ5UTBQQmVRb21tNUw4TXlCenJhS29xaXpjQzRUaGxu?=
 =?utf-8?B?WHJ4R3ZXZ3BsZnlxb280ZytadWZxUUd6blZRRUhnT1YvKzJkSXYvaXdzalJB?=
 =?utf-8?B?M2pKeWVaejVMYTdRMlBHUnZGdnl6WXZBd0lxaHRFU3R2b0NNTEIxWURHL0JT?=
 =?utf-8?B?WGVNNUtrOFJ3VVdyaEVBWmdiODFaQUZMa25oQ3pzL2JPL1F3dVhCeFZLYmVT?=
 =?utf-8?B?dUZBRVVqS0o5Q2MvR1pKS0NFamFCbXRIZVdoVjZTOU5ONmpVK0tLTWYrOEVR?=
 =?utf-8?B?R0NYNXZJL0RabDVXVGg2M2Z5NmZPVWxqQ3FsS3F1V0ZQaWR1cm5jeXQzQ2w3?=
 =?utf-8?B?NkF2Z2d4NmdoZnFGNFNic1E3NU9PZjBBNmYrZ0dRa1Y5WUgzcVpJSmtJSUNi?=
 =?utf-8?B?VDBNK01LbGVHMjA1enN0emM0dDg0WHNvcDdlUWkvYVlLQk1xZ2FxVmp4cWc0?=
 =?utf-8?B?MDk2WmZUcGNueWtOZXVuLzJtTHBpM3g2YnRiR2Q4eGZLK0ZFVlloQ3NwWFZP?=
 =?utf-8?B?NVF0dnQ5dHExekRKaHZxalRVK01halV3aXVBNDR6RXEzZTY2UXE1dnU3RHpF?=
 =?utf-8?B?ZE8wZGZxb2JnR1E3SHd2YkFGRHV5R21rR2cyWGVJekJnZ1dQeWR5RXBBWDdR?=
 =?utf-8?B?QkIyV2IycEZxa3ZwMHRmT2RtdzQrRWE4b3FJNjdvbHlTSDNBcTJOZDg1SXR4?=
 =?utf-8?B?UjdKd2pEM1B4cWNvT0s3U0RCYUZjSU1Md2tCRGVqN3UwUGMzdG9odGJpVm9j?=
 =?utf-8?B?dFBoSFJvTHhuMWxrbGN5a1pMbzZQbHNXM0dlRGpSTVZzWWNwdGYzbE4vZmk4?=
 =?utf-8?B?T210aU13TmZ0TXh3REdPU3Z5TkFYNi9JL0k1UEQyVVAwd3U3M0JXSTVOdjJk?=
 =?utf-8?B?a08rOGRMUXVVOWdSaWZOWjFwZWt5STdDY1BjcjR5ejhYMGJJbk13OTg2RG0z?=
 =?utf-8?B?ZWpaRmd1WDV2WHhlSER1NzJhSE1uTGNEZmtyTFJnUUNTL09mcmFZV3RKV1dP?=
 =?utf-8?Q?OH0jSRlafkE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0VIWUJ2bXc1KzRRM0JDUkg5cHFtSHAvUmtBd0cwLzFZbi9WRlhoZi9jdGpw?=
 =?utf-8?B?ZkNHWE5TaFBRMkw2YlRCTjV3S2VXTWFxbVhOOGFibzhPUnZuWVNEeExYb015?=
 =?utf-8?B?NUNRQWNzVXF6VzNDOEpLK2ZhUFpxOEVIR1c0YlRERGh0TGtGaDhXeGdsbXBp?=
 =?utf-8?B?ZElYOG90SlRGZml3QnlrZFNtQ0ZYc2IrRlZvSUkyMzBaZ09hcDRYc2o1S1pi?=
 =?utf-8?B?cUtRNzhxTmdGR2RGUThQbTE5Um5kZ1dEelIvS2ltTWNOaDhrS3F0K0MxSFNp?=
 =?utf-8?B?dm1MZWsxcnNEemtkMzQ1KzJqV242R0tOb09DU1VvYnhRcTNmQ05STlRZL0Ni?=
 =?utf-8?B?Vi85YkFJV0YyMGtqWDc3T0dRUUJHNE5UNHJIZDgxRnRFeTM0MlFwdmI1MWxk?=
 =?utf-8?B?QVQ4T3NrU2dxRXJTMjlGR1VzR3d4b2hEdzZDVUpoVlF1WXVYYjlhaGRlOGIy?=
 =?utf-8?B?Nys5MjRkelIvQjBHQXRFeGdjTS8wd3MwT1Z3aWRkeEYyMXFKSmhKZFN3MTg1?=
 =?utf-8?B?Rk0zd3FwQk5jMEVES2V4eG1DQjFvUTF4SWExTElsUUlpbmpNckw2U2RxSzBW?=
 =?utf-8?B?KzRIUDVlOHN2Z0pvaHE2RlBPWDZmclJ1aklCaERDUzdoak5HSlF1Zmh3UVZP?=
 =?utf-8?B?SXNhOGF3eVZFWU9hdStyL1ZncGhzTjBiWTdReFVrcDBNSE0yQ0hSeWJaSEdl?=
 =?utf-8?B?eksvK0s3bG15ZjJFdGhka0o2MUFHa1hibDhsQnlBaW14MGxRRFVOc1E1ZFJM?=
 =?utf-8?B?NjFjT0QwbEhFTm9QRGF0TmNjL0NFTnd0aTNFWE9YSUFoTTJGOVN5REVIb2hH?=
 =?utf-8?B?T3IvdFlqaFR3dkFxVC9NSy93NGEybkdlTzQweTRjSUxyd3BKc3Y2T1NGRFNp?=
 =?utf-8?B?SmZNQ0JUckdoTE1XSFhyZTJBR1BtNnlGQVdFL0FFMjZEaGg4bjRkcWpzeTBj?=
 =?utf-8?B?QmorV25STHR4cm45WWdvbHZCSFA0dUdXSUVPN0pNY3plZEZQVzlsWXoyMG91?=
 =?utf-8?B?RXB4ZUphSEdrTElYeFA3ZUxmNlYrTlZhclJMeVFHVldLT09ScDZ3OEdtbWc3?=
 =?utf-8?B?RGdYQzVFOEcrRDErQ1FHa3d1bHlyUkcvdDNFaVFKUXZmQ0ZWcDZtWHp0VnQz?=
 =?utf-8?B?dStYYmJvbjQ5NExwQ2JnQmVuK3F0VVFKODdpblkzZ3o3M0FNVlZ2LzJ5VHRD?=
 =?utf-8?B?M3BEM0tETDNuRzNhcElkYVhmTk9reEwyZVAvZjR4UzJDSEhZazVxZWEzWnov?=
 =?utf-8?B?OWRIeVR3cWk5ODJ0WXZkVlBmZzF4czdlVkkvMXVnaE1XeGRYTU9iK2R6WW1Y?=
 =?utf-8?B?eitzdmJzR1VXaHQxMVJ4a2NtOHJ2c1dXcWpVRmlNQkJkalJmdS9wSkJ2Uzdn?=
 =?utf-8?B?ZU5EM0VaZEZoOU5XSWJtK1JCbEtxK3ZQdFlzL1ZvSlRzYlBVbTNVckkrdmh1?=
 =?utf-8?B?RDhWS2t4M0Ztdmd2Wm5pWUE1MDRnd1F4ZHRZdGovMmJscWU4WHBPN0xyQVpO?=
 =?utf-8?B?NXF6TjZjVWgwRy8zcU5rMktrQ1ora2VwVXhMdTlzYVhqWW9UV2h3VkJabGVU?=
 =?utf-8?B?cGx6ODRqdmZiamhaeVpSQy9sMWlPdzVHNzlRbFBtRGk5T2Iwa1k4UVM1SFNx?=
 =?utf-8?B?VWhsY0g2VGRac0xEVy9DdkNsY0JuYUJlOTk3Y1h6dnRLOUp5OHo4aVQ5WDNP?=
 =?utf-8?B?a1I3M2hmd2hSdjRoYzFiek5kSUdCZjBlVC8wd1lRQ05ta2VYNWdjaVB0Q3JH?=
 =?utf-8?B?TG5VMXNWRUlBQXBSOE9kTlhNVFJtNjE0OTJnTGo5dEdRY2c0aVA1RFRSWlVD?=
 =?utf-8?B?Y2xWV0ZyUU5mRko0V2Rjdk5WZnJ3TU1ZVi9NMzZyR2tnWElTTVNGMnkxY3Fm?=
 =?utf-8?B?TzNHTFFKeTF4ZmIyelZoVGpWdm5TWVNXVDZIMzBsV2FWNmQwV0QrME11Y291?=
 =?utf-8?B?aWtxWUlsTnBDb25xc3czZUVqUCtrM3hNN2RJOVhiVGx0Yk5RdjdDK3B2QjNy?=
 =?utf-8?B?QWEzTGNaeUQ3ajdZbi9YTGwybEdJMEVocVhNSzFFYnFlNXNhTDR2bEtzMEhI?=
 =?utf-8?B?ZFltOGJPazl6ODZNdFN5YnppZFBYUlZaTThqWG83T1ZVNlY5SHAyeHdBeFZW?=
 =?utf-8?Q?Q2RVebTBbhghC4iGpdpHAFqeD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21d6301-e497-4951-e31d-08ddee943803
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 04:57:32.1178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZftkY7aB2ND6A4/G/vIQRpPBhG6v9iThLqhnfvcHGZqswnAKSI2vJmCHfVMWkNDZ3+KJOdy0yTdQXGe7I0e7RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4074
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

On 9/8/25 14:14, Mika Penttilä wrote:
> Hi,
> 
> On 9/8/25 03:04, Balbir Singh wrote:
> 
>> Extend migrate_vma_collect_pmd() to handle partially mapped large
>> folios that require splitting before migration can proceed.
>>
>> During PTE walk in the collection phase, if a large folio is only
>> partially mapped in the migration range, it must be split to ensure
>> the folio is correctly migrated.
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
>>  mm/migrate_device.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 94 insertions(+)
>>
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index abd9f6850db6..f45ef182287d 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
>>  	return 0;
>>  }
>>  
>> +/**
>> + * migrate_vma_split_folio() - Helper function to split a THP folio
>> + * @folio: the folio to split
>> + * @fault_page: struct page associated with the fault if any
>> + *
>> + * Returns 0 on success
>> + */
>> +static int migrate_vma_split_folio(struct folio *folio,
>> +				   struct page *fault_page)
>> +{
>> +	int ret;
>> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
>> +	struct folio *new_fault_folio = NULL;
>> +
>> +	if (folio != fault_folio) {
>> +		folio_get(folio);
>> +		folio_lock(folio);
>> +	}
>> +
>> +	ret = split_folio(folio);
>> +	if (ret) {
>> +		if (folio != fault_folio) {
>> +			folio_unlock(folio);
>> +			folio_put(folio);
>> +		}
>> +		return ret;
>> +	}
>> +
>> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
>> +
>> +	/*
>> +	 * Ensure the lock is held on the correct
>> +	 * folio after the split
>> +	 */
>> +	if (!new_fault_folio) {
>> +		folio_unlock(folio);
>> +		folio_put(folio);
>> +	} else if (folio != new_fault_folio) {
>> +		folio_get(new_fault_folio);
>> +		folio_lock(new_fault_folio);
>> +		folio_unlock(folio);
>> +		folio_put(folio);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  				   unsigned long start,
>>  				   unsigned long end,
>> @@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  			 * page table entry. Other special swap entries are not
>>  			 * migratable, and we ignore regular swapped page.
>>  			 */
>> +			struct folio *folio;
>> +
>>  			entry = pte_to_swp_entry(pte);
>>  			if (!is_device_private_entry(entry))
>>  				goto next;
>> @@ -147,6 +196,29 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  			    pgmap->owner != migrate->pgmap_owner)
>>  				goto next;
>>  
>> +			folio = page_folio(page);
>> +			if (folio_test_large(folio)) {
>> +				int ret;
>> +
>> +				/*
>> +				 * The reason for finding pmd present with a
>> +				 * large folio for the pte is partial unmaps.
>> +				 * Split the folio now for the migration to be
>> +				 * handled correctly
>> +				 */
>> +				pte_unmap_unlock(ptep, ptl);
>> +				ret = migrate_vma_split_folio(folio,
>> +							  migrate->fault_page);
>> +
>> +				if (ret) {
>> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>> +					goto next;
>> +				}
>> +
>> +				addr = start;
>> +				goto again;
>> +			}
>> +
>>  			mpfn = migrate_pfn(page_to_pfn(page)) |
>>  					MIGRATE_PFN_MIGRATE;
>>  			if (is_writable_device_private_entry(entry))
>> @@ -171,6 +243,28 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  					pgmap->owner != migrate->pgmap_owner)
>>  					goto next;
>>  			}
>> +			folio = page_folio(page);
>> +			if (folio_test_large(folio)) {
>> +				int ret;
>> +
>> +				/*
>> +				 * The reason for finding pmd present with a
>> +				 * large folio for the pte is partial unmaps.
>> +				 * Split the folio now for the migration to be
>> +				 * handled correctly
>> +				 */
> 
> This comment is still not changed, there are other reasons for pte mapped large pages. 
> Also now all the mTHPs are splitted, which is change of behavior (currently ignored)
> for order < PMD_ORDER.

Oh! sorry I missed it. I am attaching the version with the comments removed.
On the behaviour change, I agree, but it is required for migration to occur.
Updated patch below:

mm/migrate_device: handle partially mapped folios during collection

Extend migrate_vma_collect_pmd() to handle partially mapped large
folios that require splitting before migration can proceed.

During PTE walk in the collection phase, if a large folio is only
partially mapped in the migration range, it must be split to ensure
the folio is correctly migrated.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/migrate_device.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index abd9f6850db6..0afdc8b67c60 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
+/**
+ * migrate_vma_split_folio() - Helper function to split a THP folio
+ * @folio: the folio to split
+ * @fault_page: struct page associated with the fault if any
+ *
+ * Returns 0 on success
+ */
+static int migrate_vma_split_folio(struct folio *folio,
+				   struct page *fault_page)
+{
+	int ret;
+	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
+	struct folio *new_fault_folio = NULL;
+
+	if (folio != fault_folio) {
+		folio_get(folio);
+		folio_lock(folio);
+	}
+
+	ret = split_folio(folio);
+	if (ret) {
+		if (folio != fault_folio) {
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+		return ret;
+	}
+
+	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
+
+	/*
+	 * Ensure the lock is held on the correct
+	 * folio after the split
+	 */
+	if (!new_fault_folio) {
+		folio_unlock(folio);
+		folio_put(folio);
+	} else if (folio != new_fault_folio) {
+		folio_get(new_fault_folio);
+		folio_lock(new_fault_folio);
+		folio_unlock(folio);
+		folio_put(folio);
+	}
+
+	return 0;
+}
+
 static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				   unsigned long start,
 				   unsigned long end,
@@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			 * page table entry. Other special swap entries are not
 			 * migratable, and we ignore regular swapped page.
 			 */
+			struct folio *folio;
+
 			entry = pte_to_swp_entry(pte);
 			if (!is_device_private_entry(entry))
 				goto next;
@@ -147,6 +196,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			    pgmap->owner != migrate->pgmap_owner)
 				goto next;
 
+			folio = page_folio(page);
+			if (folio_test_large(folio)) {
+				int ret;
+
+				pte_unmap_unlock(ptep, ptl);
+				ret = migrate_vma_split_folio(folio,
+							  migrate->fault_page);
+
+				if (ret) {
+					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+					goto next;
+				}
+
+				addr = start;
+				goto again;
+			}
+
 			mpfn = migrate_pfn(page_to_pfn(page)) |
 					MIGRATE_PFN_MIGRATE;
 			if (is_writable_device_private_entry(entry))
@@ -171,6 +237,22 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 					pgmap->owner != migrate->pgmap_owner)
 					goto next;
 			}
+			folio = page_folio(page);
+			if (folio_test_large(folio)) {
+				int ret;
+
+				pte_unmap_unlock(ptep, ptl);
+				ret = migrate_vma_split_folio(folio,
+							  migrate->fault_page);
+
+				if (ret) {
+					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
+					goto next;
+				}
+
+				addr = start;
+				goto again;
+			}
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.50.1


Balbir Singh

