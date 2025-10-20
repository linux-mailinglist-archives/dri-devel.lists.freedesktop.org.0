Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF2BF3988
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5D310E512;
	Mon, 20 Oct 2025 21:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ka3FwPfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E64710E511;
 Mon, 20 Oct 2025 21:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWLxh1vtkBUmJ+UL0gz8iL4TWOBc0JVQaKGHzZO/D2t0Kct+iExVp7ZsaH5hirDyt+f4Xrzi265VRvYkwCu89YKjUjl7II2rLrbBCwWHhJBAJDXaSj9mgtx6AKp8tov/zCIQpzm8yaqvSudm050Ty5M7kZa7WK1G12rt8Q6YIOdud/CExndtgLXbECZlFk5Ghrycxaa+scP5xfcrAxfKOrBV990/O/l3gmqm2MsCVFj8zRtiRW77EShPuWNa1JKrUnJhWEwngj6bvsoPpmq3Z8N6T9P0c5TcvERfL6FRQxTD6ElhSbcQ4Z7mEc/RwYhxYYGXMu+1hpuVhLZAjw3Ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVKxlfNC4y3oHBt5HEAy8JLz5wMNeCb1Kohzi4FnFNQ=;
 b=isuswVVhI/nyxXH1Pl7P6dc4eOiT/wpkkKi9aaLnZnQUjULVLTEFKKu3XzZDyoDX6+Iut23R3os6H6a40GyvAOZIIU7R9na4BkEafVjxUxYCRnNSeIMN9+pgvjr2aY4Jr+mWlVHNVd4ALQXPOkk71dTbBail1ZbT3EW777mk7r+T0j9RUts74Xvj4uIgc6gkBif2UIIAWq7l2DWu/pPcEP0K7/spzwyGEFpyeFZHkReXdKqZHYgAaHbzVxb03NMzppKGL7povqfr7gruLzx0uV2CMVsswWI1xQ4eEUi2yuUYLmyFLa3xTb5dVArtGI6+5J6T765O13gJPpnWq/r9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVKxlfNC4y3oHBt5HEAy8JLz5wMNeCb1Kohzi4FnFNQ=;
 b=Ka3FwPfBzsBmsfm9iIIlUfLlMaWOvQMf7IYJVRPW2r6YP5fI19MxID2cBzQUrLjsOzLbanlL09QJXe2gPdN5Ogs77ciMbpyxmXZ9hyHAWDhznHLtYL+Hi5dBKPVf4DrxKnV4Js9a9WTKz/wbZRuAw+fxT7avoo+/Zq5K+m7nzSbj78iaaXQ87mJAh5DnfRo489xh4b0H9SfHuLZFpiSz04P6WEbWwv9xT0AEPwV5Q43sBovxM4CyAxTmWar7gO39H+G6SBLXeD3mDI/NLdzCJjowvulDtwd8Y6oiVIbRucJwvFP731q4qVLOkp7hdueI810V3mDnwjJzxLeRE1x2sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 21:00:24 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:00:23 +0000
Message-ID: <8680705c-7298-4a33-979c-d91bd4e65b1c@nvidia.com>
Date: Mon, 20 Oct 2025 13:59:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-8-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 269c744b-6fa6-4b8a-8f5d-08de101bb012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEtWZ3JPeUZKNTRvbjZQRjhVRGhrMXBOd1hYWFk1WWM5R0I1N0ZCaFQrcE9G?=
 =?utf-8?B?ZnB5cHNZeFdTUDBkRFFXQ0krWXRPMDdIN05vRm1WNkxHdDllMmE1OGFhOGJP?=
 =?utf-8?B?NlN5SVZtQnZ5SnZOUm5qZU1BYzYvNWNZYitGWStuN01HbDhHOEVITURtTUh1?=
 =?utf-8?B?UTlPZE5zallnYjlHSG4zYlZIM1NHOTJvTlB2cmhiMkVXYWJMOFJiSDYrYWl6?=
 =?utf-8?B?bWg0ejRCekwwOXYyVHpjREZNSG9BZWl5c1JqTGNvakZ5bmQ4Q3dBSkp6VWds?=
 =?utf-8?B?M0FkK2JYR1R0QWZUZDFOWnIxazJFZmwzZ3J5bVlUMm1lNnhROFdKUlp3c3JP?=
 =?utf-8?B?WnZMZUhnZlNsMklBTnFTb3cxNWxYME5yT3NQdGFNbDJSczJUMGdiejd3K2E5?=
 =?utf-8?B?YS9OVzZTVUsxQnF3RjJ6RGNxQ0NGRmJuT05mdm4zOWJwQzBoK3haUjBmQVlE?=
 =?utf-8?B?RFJBMHF6RW9telVmUTh3dHhMK28wN0d5cERwNFlNN1lROXVDSk0vWDUxU2d0?=
 =?utf-8?B?dFowaUdTNmtwWWd3Ni9RdTdCRjY5bjlwM1Z1d2hGcW9HS3g3L2UrTTNpUmJp?=
 =?utf-8?B?ZVZ0UzdiOVVNbzMrWTRGeG9HSHJtZHJ5czNRVzh5NXRwQkhSVzJCQWlxTEFX?=
 =?utf-8?B?OEpoVlQxYzR1TTZqWVQ5USt5MkdlTEZRNTdEL0JWOVlzbDI1T1dpWS9GSnlE?=
 =?utf-8?B?OTROSi9WK2duVE5MaGVNRm5OSzhqQnRMditMMTNvWFBKMGtNbHFJVXVhY3Zi?=
 =?utf-8?B?elNHMm5zNjVDZEkreG1nMDZuUUhnTWVpbUIwa0hpNm5WUnl5ekZ0SWFJQmRM?=
 =?utf-8?B?b3VQT3A5anNKQnJvR1B3Tk8rYzRST2Y5K29DUTRIUEFza0VuZExHcEc1RURK?=
 =?utf-8?B?QUwvNlU3SFNqWDVwSkkxUnV2TGJxTnlqc2hPK1kxZCswSlVrRWdZc3ZxMVNP?=
 =?utf-8?B?bE9SYWhEYVVtUVJDOUhySVZ5S1dUQmZMSTZ5TDlESnJHcWxCQndxTHBJRm9X?=
 =?utf-8?B?V1Rtb05aREtzM3BIN3NzVm0xNEZPV05POCttejVqZEN2emxMLy84UGVNelJo?=
 =?utf-8?B?UlJwanJCWUE2YVpQQkU5YlhZMFFZUXhaRlpYZGhLRFcxd3ZYaG5kWFBFblJ3?=
 =?utf-8?B?WHlyNWNsR1pMaUd5SVdmbkI2dDZMbEg2Q1o3UjR6SUpYcDlsQnByek9RdE0y?=
 =?utf-8?B?ZkR2UWp3TVV5TURsTVNib0tTODV6MW1XUGFWU1RqYXl3K2IvanM2SVVTRFh0?=
 =?utf-8?B?Nng4ak1YV2xjajNEWWQzb1REdjd3UXN6ellKNm1MRDZoamFYQmJ6bHdjVGVU?=
 =?utf-8?B?ZzVCT2JHZkJKRVRHbkxQSEF4MXNENUEwamFHeDlGeFlHci90WThoSlV0S2FU?=
 =?utf-8?B?SUlKRWZZNjlzTTVGL3lzTmZEelpmWkdjRWZETm5USXlTc0ppUUMrbVNuMVRi?=
 =?utf-8?B?c2txV3pMQ1VwTXV5cjBpZi9LbG1RVXpCSkFKbjl2QjhBU1lSSFkrY29oWStB?=
 =?utf-8?B?azZUM1VEWjhNM0k1NDlEd3NMRTYwRGhhLzVNSFNIeHpoQ3Bpa1NMWnMyeXFn?=
 =?utf-8?B?V0VKVmRZOHJiazUwL2F5NlozdHZISGx5VTRtK08rc1RaOW91NmZ1SEpJRHdy?=
 =?utf-8?B?VFBEdUc5T3F1elI4RUNLQzEvSTRiYzNqOHBOa2NWYlhIWlhmSS9pbTFLVERz?=
 =?utf-8?B?b3VvRHlaY3ZBQlpVQ0JNTmYvc0UxU0ZMVVNBTm1UaE5BcWQwZ1NaQWpWQUVT?=
 =?utf-8?B?aWV1dVkrTFJLUGFKdTFMWHpUK1NTemNuekF6OGpQS0hTMWVWMStKVms2WHh0?=
 =?utf-8?B?MGg1bEF1d0tKc0xFSWlZM3BjT2pkYk96N2VyRHp5eXNpclQ1VUtMWWprTVc5?=
 =?utf-8?B?SjNpWTk0T0dkNFV5ZmRrY2F5NlpTTmg4MXFTZFk2Wkw1TkxDTlV0WmZtWDB4?=
 =?utf-8?Q?5myOkT4iONw+L11qNcNZaZDpdqyjI+RI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2F5cUNyc2tPWVo4b1BDb3g4dFcwSERaK05Uc2QvN1BYcTZTWjNqOFQzYWdm?=
 =?utf-8?B?Nkh2bzBBRUxuT1MraGprSVBOS1ZJMEhiQ2FuUHp5UnJwV1RBZ2c3WEROSkxI?=
 =?utf-8?B?YmdVMU1RK1Boc0hDb1N4QWVSaFExOXRXOGI3aHFmL2xpYUdiTXV2c2V3anFF?=
 =?utf-8?B?clBreTA4VXZDVDRxYXBob1ZReGNMaU1yL1NtdnAwaXIza0xBMEtSS2JNY0tY?=
 =?utf-8?B?Z1ZEYld3Unk0OW9DTkQ3M0c5YlNoMjdhVVdwUG9jUld2bXZHMS9POHdGQXFS?=
 =?utf-8?B?UXVtMnAvVm9ubzVhVGFoYlRQYVArTWpjT0F6aEU0dUdDTFFCYlNKN1ByOXNu?=
 =?utf-8?B?VXhadkxMcjI5RXgzbTlvYWY3ZXNhNm91ckRqWm9Sak5tUzhvSTFEZmttNUto?=
 =?utf-8?B?YktBN1RuVGhpdzNoSkNLOTNzZHc0RXlNK3NiV2JucXY0MWJVcE4raTYzdCth?=
 =?utf-8?B?clI1RWhibG5VSXpQRDlKWHlLZGZFRGJZa29DS3JjMXl4L1lyQzA4eXRPMjdj?=
 =?utf-8?B?NWdpVStaUWptTm1QWGR2VkVUSlozdldERFBJZ2tPYUhZUzNNdmpiajdseUlG?=
 =?utf-8?B?bzR5SzBQZ042ZEdkTkZOR3JqZ3hnbzQzVS9qZ3VZRXM3cUI1L3BQYUlzRVlR?=
 =?utf-8?B?T2piQStLVGtTWHlYVGluVkI5Y2hndDBpUFFxSFRlOXJEZy9xRFFYV0hUdGdW?=
 =?utf-8?B?LzQvc21GWW1QT0VRdnliN3VudlJnZ2hzWE12V1ZBaWN3TjUzTFNoMjRWNklt?=
 =?utf-8?B?NU9sMTRyekxSdm1BelBpQk1Zc3RVRUYvbEl2eGNsanJlUXlnd1hFdU1EeWZs?=
 =?utf-8?B?UUJtdlNJZkJ4cVAwRmN0bWpBZDROa2pGRzZPYjIyTHBIS1ZxYzdMU3VGSS95?=
 =?utf-8?B?UlNWYndvakhwM242Y1dGZXNEVDJwOEtDbkQ0dkNvNytxNDE3T0NxNFBpZWlP?=
 =?utf-8?B?NUhIZXBMVWFpNEcxYVI4SWNSMXpyc0cyWXZ4U2g4VzY4aGhzaE1LRVQvdElw?=
 =?utf-8?B?NGp2YUk2Yy9KOGdBR3hhSlc1ZHJhSzBnVHllSWVaZ1pLWWlUUXNZMWorRWVi?=
 =?utf-8?B?bytyYUJZN2h0bG9sNFBUcEd4UnJOc1M4cW02T0JiTVhQeUViRHlaazlWYWFO?=
 =?utf-8?B?VTJ5Sm9aTWxtTXl6WW1aSEsra093TDIzUVcreWlQNlZ2R21ja2piemxMaDdW?=
 =?utf-8?B?LzRRZ1hXbHRzV2RPcFNSd0NLWVNncVNFeEZ3bW5RWDFDcDdpUGhEZ2QwbEt2?=
 =?utf-8?B?L01tdmsyM0kxU3lQdE5sUVdtNCszVHNtSG5vN2I0UGpyMktLZFpvWFJpVXpB?=
 =?utf-8?B?MW1zZG9YUzJWSFBmOVdTQmtFb2J5RWxmd1hmNGkzb0RxeUlQK2RrTjUwb1JJ?=
 =?utf-8?B?d2Y0TStJZTlJQmlkNGZXYWhVLzJ6dVNWKy8ydE1ZZVVyZjN5YTU4WUZEeEIy?=
 =?utf-8?B?S3RmbGk3NEkwU1hsbjE5aDJNU1ZyMFBTNnVCd000V1hLNDhxbDNvR1J4OEVt?=
 =?utf-8?B?RFpIT1VGWVd4SUtBeXNJdndIcEY0c3NJT1ZEMVdLc09rZFF3YVB4a2pOUVRE?=
 =?utf-8?B?NXVPU0xmeGpsVktQNVFIdGZYc1BXejVkT1kzbmo4OGo2ZFhlNERVa0xTN3Bm?=
 =?utf-8?B?dVRQbFNZRHBZRUhIclJwcTZPQ1NXbFFDcTh3M051YnMyUjVUZlRmVnNDSkd5?=
 =?utf-8?B?U1pwZWVjKy9WZ0xBeTN0NXZ2NmVJanFBVzJSZllucmc2OERRYXVoY1pDekxK?=
 =?utf-8?B?TTNSc3M0SFkzQnJJRkY2NGdjQXJwUjlMRFZWTERqYlZIamV5VDY2SjVud2RI?=
 =?utf-8?B?WWN6M3BBcUQ1aG5nL0pta3FXZjYyTEJoTlg3ZGEvaTNSSXZ6NlM4cXZHcTdB?=
 =?utf-8?B?R3MzY0VRVytWZ0JPRkVWUnBxMDM1djRGOWsyUjBMaE9kdTUyVS9nZnV2WDQx?=
 =?utf-8?B?S3pLd3VpbHptdmZmWHF3clFENFdwTU1odnIycWs2eGloSGlTU2V0T1V6dDdK?=
 =?utf-8?B?bStzZHY5WWl4cDFwdytKanNwOGd0VFd6VXNIMVY1dlJ6U2xMaGU5VVQvbWt3?=
 =?utf-8?B?NURmdTN2RlZCbXR5TC9iYysxQWtuS0x6dVhnMUFYZ1dnTWYzcmhCNi8zcmQ2?=
 =?utf-8?Q?XLNcnYk8Yl3DONkzqZmGLZSV/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269c744b-6fa6-4b8a-8f5d-08de101bb012
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:00:23.8718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnW5DKW6SKptcVlylafVJIbIN/a2WETa2/U3j0hcHq/BjBTNtTgLeInbGsWv4JpH5wb/OccrDHQZLuOHBLKUhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213
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

On 10/20/25 11:55 AM, Joel Fernandes wrote:
> Add data structures and helpers for page table management. Uses
> bitfield for cleanly representing and accessing the bitfields in the
> structures.
> 
...
> +bitfield! {
> +    pub(crate) struct Pte(u64), "Page Table Entry (PTE) to map virtual pages to physical frames." {
> +        0:0     valid           as bool;    // (1 = valid for PTEs)
> +        1:1     privilege       as bool;    // P - Privileged/kernel-only access
> +        2:2     read_only       as bool;    // RO - Write protection
> +        3:3     atomic_disable  as bool;    // AD - Disable atomic ops
> +        4:4     encrypted       as bool;    // E - Encryption enabled
> +        39:8    frame_number    as u64;     // PA[39:8] - Physical frame number (32 bits)
> +        41:40   aperture        as u8 => AperturePte;   // Memory aperture type.
> +        42:42   volatile        as bool;    // VOL - Volatile flag
> +        50:43   kind            as u8;      // K[7:0] - Compression/tiling kind
> +        63:51   comptag_line    as u16;     // CTL[12:0] - Compression tag line
> +    }
> +}

Hi Joel,

What GPUs is this good for? I ask because I seem to recall that
the format has changed over the years, on a per-GPU-architecture
basis...


thanks,
-- 
John Hubbard

