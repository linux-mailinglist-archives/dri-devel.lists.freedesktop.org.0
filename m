Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0610EB411D0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338B910E858;
	Wed,  3 Sep 2025 01:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NoTQzUJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF58510E858
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:20:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REURckRI1NmsPXdDonthOo5/kU39kZh0IkKOwA5syQk2WWHd9ao4GqWXto+oxOvoOFbtYl02q7MvJodHBcxyGosmyc47MlwPX1TNL7dFAHo1CoZ+O4Ip0DVz6NqjUkqa5UovGZ2/vGgwK6AxmXYGGoZWoGa9MuoI//DqTplDDFExI8qK4G334sO6Hfe/H6dT6/XCfflsljbbc0RPCOsaIFnkhAPzwRFCI7sNRGEFRSIhtqZ3Fi8an5sBSDRKb01+ooXh7AfkJPsY7O4g2Q3x2Ad4yS9b48cVnofbtEDn+2lNRAVq2hzzqQSR8QaWcYcxD3+68mkFizk+QaCX2AdHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kpj0DgtzxR5aJn4cHUzjRxXQ+GZQuw6pBgp0jLjQikM=;
 b=HQUKGzd5YIlNhSPL4nRwaYamv6TogiFy/TFuXq2Gcyk/I9YnUZG0zfmGprvqiTjJvquSEamxxPSQFktllkatMdFejw6/mh25dOh7Mzp9/ncYD1BHsUA09YR0v0JpL61dLxwcQjj0kzld0IE6kz8LdW+3q57v6dUOMAwXA0pZmZJvsEfRpDKNJ118BhYjFCxSi8IQwfk3MAFhESFZ1fYvnYX0j8z8+JAID4XqFXKTtd3a680SUHDYFlA3ozYAsEAcf0ap28w3Agma8vxT5bLu6QPaCxSbXzcy8e55R3cDWsDJtm57gLadD/TY7db0/o7MOyXDJoykH7FrxokIcVj3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpj0DgtzxR5aJn4cHUzjRxXQ+GZQuw6pBgp0jLjQikM=;
 b=NoTQzUJjXyZMjvlbrjtYmc+oN1flJdlihO46riAlQMyinC3SAQODY+oqzztDrTfCLAqTAa3Yms23JiJuG5gzl0revtb90N6/72iJGaQUz98Kpz/EH5LvmTPdJcJZHRlXui3TTPW4DIqqxKtjDQJVG+1RCod1nhAoBaUEFUG9oX4ycsc65IWkpEy1SP8/64gF8ujKcJGSs7HEpgcSer3B0je4ZSsMps76BAGrvYA1zpPs6PRKXq1j36Gs5psGpNXWQaewRReWK+pK68bY0Lhcmn27DoVfv/vg4AcY70CWpESapzmxM3hIpNfrGIj4ZyPw+tefBokFwFqmtYyg0Zr1/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.34; Wed, 3 Sep
 2025 01:20:16 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:20:16 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v4 12/15] selftests/mm/hmm-tests: new tests for zone device THP
 migration
Date: Wed,  3 Sep 2025 11:18:57 +1000
Message-ID: <20250903011900.3657435-13-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P300CA0014.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::19) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a99ac3d-6cc6-459b-3b23-08ddea880a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUJISHdEbjlSeHhVdHl6cnNONFgxeGt6RFBtS2xwUWUrbHRxbkZxYlI0NzhZ?=
 =?utf-8?B?UXQ1djRqYXljVmJHdGFaV3d2Q1RmeGxiNEg3b3JEV3lDNC9SUDd4d1dXL01L?=
 =?utf-8?B?UndpMGpLMWlHMWM3TXR5bjhnOVNnYzhiOWlyL2psaFlCRDN4K0cwd2hTSEds?=
 =?utf-8?B?RlNoUnppSS9DUjRwT0ZEZVN0L0xzNCtXTEg0b010SkZhUkpuL1c0VTBKWTZN?=
 =?utf-8?B?aVJqakc0QzI2VzhPcWNkVm4xMS83dWozMFJVQVBmY0dncXpMeEpqMFR2TjNI?=
 =?utf-8?B?RVc4Um5abDlqTUdWN3dOSG9lUXErUDNidzI1akNvZHM3ZFV5Mmtsc2pFcXdT?=
 =?utf-8?B?SWk0cEl1TkJ0YTFrb0FTTTV4VTU0QzZ2VWtVWjM0NTJkTUN3TFhIa1E5R0cz?=
 =?utf-8?B?SU5WTHZIMnRMTWx4M1E5bHJyQUg3MFhGVnY2akE2RGxtdDRHd3ZDWEg3S20v?=
 =?utf-8?B?L0hwMDh2QlN3cnMzRmZNdFpTaUtrUEdYbFplYWluQmR2OEEvZE5HMGR2Z3RS?=
 =?utf-8?B?aC95NXR3bzgzbDZvTThjNmRob1Nha2JiemUyYzgyYTB2bnFRVVRtbXJONEl0?=
 =?utf-8?B?K3cvTkcxcVp6VHZ4ZXVJbU5yMkRGK0JjSStZWm01WXhsQTdZRFhkMThUSVIx?=
 =?utf-8?B?SVFsQjJmNHBtTVJYa1FRR0Y2TGhFMlQwOFlSREZMOGt3OUNwakl1RkNKZUFl?=
 =?utf-8?B?MkRjLzR3c05GczQ0WUxGTERjOTVCSm04VGNFbVhUSW44ZHFRa0hUVnYxYzZO?=
 =?utf-8?B?YWVUT1dVUzdVVUx3UXh2ZVFqOWxjeHJJaG9WNEtnWjBYZVRxWmFXU1BkdXdn?=
 =?utf-8?B?N1JrTmRoNEFDazBCOHl6NWtWNlNNRTlSVHh3UVhUZFJVME0wWEhpelErTitF?=
 =?utf-8?B?emk0MThkNDBSWW5hNytSWUJMdExORVo3QXR0cGtZMkM1S08ycE4zdmtDWk01?=
 =?utf-8?B?dENNejIrYVdIUjZ6ZURNdmUwTHBaTkhGREFOM3l1MVZOalpjYk1JRlhwR3VD?=
 =?utf-8?B?MW9lNTFiblh2SHZ4ZkFhSmQyU0xYb0VZSHIybjFLdkFKaEVubzVtWnpZdkxw?=
 =?utf-8?B?MFZsckdLMWxVMkJBQXhrbnQvMVQwTWhEU3dGNHFrRU5qclpHZ1FBcVJReEFr?=
 =?utf-8?B?N0pwdHJzZ2ZMZkVhdyt0VC9uYzBrUmg4aTFGc2c2VlU0S3M2b2IxUWxKNjF6?=
 =?utf-8?B?T1g5dHZDMUwyZnljTDgvUXJVQ1JNQkk5Z1hWUGg4WnB2dFZiN1dzZndILzNY?=
 =?utf-8?B?b1lUU2xGWEc2OU9Fa2tBTVdXS3VOdXpFczQrbUhWTWpIUXpWdWxxejhPZDRK?=
 =?utf-8?B?TVRFMUVSU2NSMHlLeUVwaHdQMlBQOWtYMjlrREFUSmpGZ3JLUzVVL0NHYUNK?=
 =?utf-8?B?UktJNGl5VlV0Z2ttQklUOXVlaUdoSWhZcCtjOVlzTWZLcmt2QWJqbTVwZlVS?=
 =?utf-8?B?QlJ2ODJDekVOaE9wQWd1WUt1WFdiSm9GekI4TGtOT1pCbFd4YkZJTnBMcXov?=
 =?utf-8?B?dHJvMmtSczNuZksxdDZUOHp3UENoQWFvNDJSY00xR1dxSWo4Mkd3NE1OdWtG?=
 =?utf-8?B?bDVFTTFkYWIxcGNwWmkyUkpYcTdZMEtwZ3ZVYlMyeGdoTEV4Ritaa01oV01S?=
 =?utf-8?B?U0ptSTRNRFNEbFg0YnQyei8wTE90SXlHVS8xQTUzUUFQT0dBdU1IdUwrQVBQ?=
 =?utf-8?B?S0dYNno5cCtZcHByRkJuWDNuMDdXUFp0L0ZsUGFPanNIYkFlS2IzUnBXZWJ1?=
 =?utf-8?B?WDRVOWhFRkQ5d0lyeFhZVCtBc0FTQWtKcU9WTVpzN0xJUmJiUWpGQkY1VFk2?=
 =?utf-8?B?QzdsZ3lRRkcyakRyODlJNjV6cnlDeEN1ZUkwUEM0N2RnWXY2VXVKNzEwVTQ1?=
 =?utf-8?B?dHFjdmNGQXhCQWxmUjRHVUdySXZ3MUwxM0xzVDRMTXo1YUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1c0Rm9LVnYyaFowd2lsSE5BelZFWHFLVlYvcmhyVTU3eXBweFF4cFBwQTBU?=
 =?utf-8?B?a3dTZDBUSFBGU1NieXZ0enFteHd2UHI4MEg1aE1kRTB1ejQ3NnhBSlNUT016?=
 =?utf-8?B?eWdWL1k2S2V4UWFPL1FNQUpRdUkrQ0F3YVhBem9UQkdXL2lpbWdSV2JLOXY2?=
 =?utf-8?B?dWs5NHhhQnNVMHFZSlV2UVJuSzlxeU9DR2Y2WXZDcCsyODRQN2NWbEN6QUha?=
 =?utf-8?B?SzBwY3RGamsvUTV3Zmt3UVVyc01ScjhKYkJZVWs2QTZLQ2pISlQzb1lyNm9K?=
 =?utf-8?B?YSs4VE44ekR5cVZSNmN4MnpSSkZGY1grNldNMGpmVTI0R01FQnlkWStwRTFB?=
 =?utf-8?B?eTBOOENsVFRJYTJpbmh2UzJQa21DR0pDQlNoSk9kSlBtL0doSU42Q21JV3p5?=
 =?utf-8?B?ZzM4aURaOXBwRnJnTm1NTUQraGZ6eEI4Tlc3NG5QaVAvMHE3VkRwUUJ6ek1w?=
 =?utf-8?B?RERkVkFsRHFhd21WTFNaWTBGL3RzTlRnamJIVDRaYzY3THhsTVJMRlB2dUlB?=
 =?utf-8?B?WFJ5bzBTVTNvWXVqcTZOb2txNTNKaytpN2RXUDdtSlFFenRPK0U3MnMxSVoz?=
 =?utf-8?B?bUVzYm1CQ1lvbmNmc1pxNCtFdE9MRzR5UTZ6eGYrUm5TZUNSMHU5UmRCbW5i?=
 =?utf-8?B?aXlFVy9CcnlYZlpBR0RtTFQyb0hqSEEyeUNBTXlwOXhTbDQ0OEpqWmxVaXlS?=
 =?utf-8?B?SklLWnBkTExJOUtuZ2gwL081aEdnaEM5UnJiZzIxMDZieHJjYUlFcFFuNWdh?=
 =?utf-8?B?Nkd6S0U0NFA2RkF1bmNnc3AvRm1kUzlxVFpJOFM3S0QxZkw1NXZJbk92dE8v?=
 =?utf-8?B?UnRDWXppSklMQyt3OTRTa2lXMkpyM0I2SlhOL05nMTBjdlUxNzNkdFlJT0Yz?=
 =?utf-8?B?U2pGczlmME5ueSt1bTlMWFRjL1NuQ0NMc0ZIUFR2aHBYYk9TeU55clRWVGc5?=
 =?utf-8?B?V3hMNmI1MVdyUnN5eEYwbTAxbDEzVnZEYmJPTEo3QUZuUjdvbW9MUGlqUTRP?=
 =?utf-8?B?NXhVbVRLVHE5K2V2T3dKM3BSZVdLL2lKZHViYmlNOTJ0am9FU2svMFI3UjNU?=
 =?utf-8?B?bEhhYXV2RjExYkxBeEFDS3ZoUVdyTHlHNU42L0tMS1pXcW9BTllDUXB1azgv?=
 =?utf-8?B?SXB4V0hrMjRmNEFEWDUyTit2K0pMMzFxcHk2SWh5dmRCd2IyalRUSnZGeVlR?=
 =?utf-8?B?Um4wTmdOd1ZtK0xVTFJGMHQzeEVJWmdWRVRrcTJiWHh1dlFXWnhiOUtpMmly?=
 =?utf-8?B?cFZLUHFza3RUc2dyWGQ2NWZieEl1Mkp4KzVjWXZRSHZYMkN5UGNmYllMNUVE?=
 =?utf-8?B?R1hiYUZjMGJBZXZqUmhDWFEyV2VScUU5a29qekkwUU1DU0N1Z3lBQkFKdGdI?=
 =?utf-8?B?cHFUL3FZdXh5S0duWktYdGc4UmFWV3BDalJwbys2T0c2WEFKVTdWZ20rZWlm?=
 =?utf-8?B?TVNDMFEySGJ6eStNLzZJWGtKZDJtNW90U3pDcTdxYVNsTW92cFZmbHV1WTNk?=
 =?utf-8?B?ZVJlR0RSYlRWNzArSXVQQmtjR3dGT25sWStxOGZ1bUZZaXdJZ1dTSEUraHcv?=
 =?utf-8?B?NTVacGt6UmYvb21kQVhaamJWb3lBdm9hTFovNmdZVnhLZkxMNmY4U2p2dVRh?=
 =?utf-8?B?SFpMVHFZVGxsRDFCZW1iVDFQM3IvTG9BUnNvdGxqVDcrM0tJVkpSdUhxckJr?=
 =?utf-8?B?bmoxZ3NEWkpSYjFMYW0rSkxkcjZsU2tvSEtTejRhaDJRbFNTUUtMaGY2eitp?=
 =?utf-8?B?NS9JdGdZVjRKaHBVVSs2TDRDS0VKeC9aZUpTcWFzUDk4ZGcwY0pIN09xMTdz?=
 =?utf-8?B?UkNNRi9WOWJRTk5SSmhEanNLSGpsRi9NM0RIVElVM1RjRGdRM21jSDRQQnk2?=
 =?utf-8?B?UmoyaDZCRnRuUG5FZGNoMXF4RHJIbnI2T1JXdG42QzVGK05lT2RqZFh0bUpX?=
 =?utf-8?B?UmYySlRta2hNVTFiVXZXSXB6TGROSEx2elpnc2llWWY2OUdvb285TTh3Z1pq?=
 =?utf-8?B?RVplNDFtN204K3FyM2FaaTRPejZLTGhFSU9RcThQbGllNitBdjBmeVJFdk1G?=
 =?utf-8?B?cjZOcGhjNkhTak1RMk1sMVlLYzcvREZFK2hDNDl5WVYydkNwUk5WM2Erc0ds?=
 =?utf-8?Q?Ql9AkETqMhUJXvXjFNM9vE/UJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a99ac3d-6cc6-459b-3b23-08ddea880a30
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:20:16.7343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf68+c78he0R96pdgARpT73nl9WrkSpMrf7JYWEasULZZWvd2m9R8vUwyYEtYbnUx714otbOytwFk8TSpVOwwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708
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

Add new tests for migrating anon THP pages, including anon_huge,
anon_huge_zero and error cases involving forced splitting of pages
during migration.

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
 tools/testing/selftests/mm/hmm-tests.c | 410 +++++++++++++++++++++++++
 1 file changed, 410 insertions(+)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 141bf63cbe05..da3322a1282c 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -2056,4 +2056,414 @@ TEST_F(hmm, hmm_cow_in_device)
 
 	hmm_buffer_free(buffer);
 }
+
+/*
+ * Migrate private anonymous huge empty page.
+ */
+TEST_F(hmm, migrate_anon_huge_empty)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page.
+ */
+TEST_F(hmm, migrate_anon_huge_zero)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+	int val;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize a read-only zero huge page. */
+	val = *(int *)buffer->ptr;
+	ASSERT_EQ(val, 0);
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], 0);
+		/* If it asserts once, it probably will 500,000 times */
+		if (ptr[i] != 0)
+			break;
+	}
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and free.
+ */
+TEST_F(hmm, migrate_anon_huge_free)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Try freeing it. */
+	ret = madvise(map, size, MADV_FREE);
+	ASSERT_EQ(ret, 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and fault back to sysmem.
+ */
+TEST_F(hmm, migrate_anon_huge_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], i);
+		if (ptr[i] != i)
+			break;
+	}
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate THP to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/*
+	 * Force an allocation error when faulting back a THP resident in the
+	 * device.
+	 */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+
+	ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_zero_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 0);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory (zero THP page). */
+	ret = ptr[0];
+	ASSERT_EQ(ret, 0);
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Fault the device memory back and check it. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.50.1

