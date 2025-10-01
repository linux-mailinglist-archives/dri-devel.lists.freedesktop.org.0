Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAA3BAEF9A
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 03:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35A10E646;
	Wed,  1 Oct 2025 01:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G/EFG07h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013048.outbound.protection.outlook.com
 [40.93.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8243410E646;
 Wed,  1 Oct 2025 01:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxYni70s3kxeVMoMEAfbCNFAWe0XVQjMEBBjSdiO1zF5r0a1LdZ4+crwjXu2BdmNL4czfp2Gbb2X/ur8m8Lf9xTLWsDEVj4Z5TvNZDd4k8LJSfEnMxVWv+GpsiNNES9qqGsJLpwoS3zBbRVXLI9lcICBAX+O+sb2AfMpkAWHU7EWxl0yzHl2VhzMkQDoRcinxgzxhBXe94xrFOSKlyDTwuv8gpRqQYXg2fWIC+VHPqOPg00GUfDfsgHw58Tl/aCLofXbU/skCrZCItim1p68yjhJ46+NvXjg5Umdq5PVJC0pt2upEYfJ8RGYjzqKknDcsMh/NnZkJjMODWISm8lEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB8iAkwMldMFBeXU1pBkZplBNaQYe1RNXYtmSF/914c=;
 b=QlLBZOigu5HV/HbmijjWiB3CtmYe4AgrrSpFQ1ebQxUt4IBcj5q8krnzm/f0YVQMhPgltmK9sXTVgIMS8Wp3dTPMNiO/qQ+VrCh414Xw88zMXT66LypbEIq0ARWZ5g9Ytf7KGxpDh9GPI1bha1qfMvkq2NSezr6a5Vh3vG89x4kZALDPLPJ7hWpaNEWS8b1baaWrqgBiDoxBSofrCafM0t5vFWa3YJ4VHUXJ35QQbjBt/FK0RF9k3yS7SLDuKh4nKdIjEpE56IJkQTo2W9ZzpCqxj3O5Bb/ApnMpobTjNr7bgGClRUWyO073Orww0FYHJLE7y9VS+CWZP0NTXMrNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB8iAkwMldMFBeXU1pBkZplBNaQYe1RNXYtmSF/914c=;
 b=G/EFG07hRdjdsZwujZszFDo3N4/7/2B8rr9ebpKniURZMOPLmwWGFAKUs2iXTEl706MOa/64lQkIpIAYIEkhJcgNhe+oUhfgWktBvG6dvcv2O67FPLKkLgJKNZhC0eywok3RBNENkCa8M4WiFga6DN483+755cYd22g3ooUc8ynAKqHRTFGu7lrUYdqm6fFN1YGLg1oxQqmSvjGUNyf/MOraB52rHQbv4IwmJbHUtUeb2lm4g58YsTjQPtLpvV5stUfo8t4yu49pALjCi3qyq07AS2c+M30qhu33uFkJdHQD0G8YSZlQfSOXZ2OxA5hjGNhbHp5yPf9tsHa1Z7fG+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 01:53:44 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9160.014; Wed, 1 Oct 2025
 01:53:44 +0000
Message-ID: <378160e3-c081-4a0d-9f58-80a2105de071@nvidia.com>
Date: Tue, 30 Sep 2025 18:53:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] gpu: nova-core: Set correct DMA mask
To: Alistair Popple <apopple@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-2-apopple@nvidia.com>
 <94bbd268-efbe-4ff6-ba09-e6254709d981@kernel.org>
 <ljesevy2hkryskvrtjtjzubybzc2o35wdrz6tgsodc6ljiv27j@mvyi6gqiryvz>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ljesevy2hkryskvrtjtjzubybzc2o35wdrz6tgsodc6ljiv27j@mvyi6gqiryvz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 8782497d-590f-4ecb-96e5-08de008d5a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dG4yZkkyVEhISDJTTkJDalRzcDFLUzFUZjlUTG9KSHdyem1HRDVHaXNuNFlX?=
 =?utf-8?B?WEZoMkQvNlZiUS9vcVBBaVp1V0t4eFN1Q3Z4RGpBeWxGWEwxUzd6QkNSTnJQ?=
 =?utf-8?B?dmNQbEg1OS9oclVtS214bkRXbzhXdE9xdk53dGFDQ0xTdTcrZCsxV0U4U3ZR?=
 =?utf-8?B?OC9FMVdiaHdOVVk2SS9OOGwwMzYwU056Z0VTWnZOamJUTEN5NHB5YkJYakt4?=
 =?utf-8?B?bW85ZHg2MXU1ajMxOTNzZ1k4cWY4MkRBSmZobkR2NEI3clVNbmZONHhFRnJr?=
 =?utf-8?B?bXkrNldZVDJqRktpR1hNMlBUcTlIWEtiMG5tdUs4ZU1QVG1NNFJJNlgxbUYy?=
 =?utf-8?B?OFlzTWp2b3d4UnZEQUNBRW9WZzM3emhkZ08xR0g1QU5KN3ltRXRXL012WWth?=
 =?utf-8?B?NGhVSkw0bEU2TXVzVjZaeTNKMmRyQ25sTjFmTVUzVmV4ZW45aEd2ZU12ZTZx?=
 =?utf-8?B?V1RqclFuZEl1cUhKL2hJTjV4MHdMVTBINmtjUTdJUjZqSmwza0xWME4ya1k3?=
 =?utf-8?B?QjdaMXlwbUlEdmpvU2ZPYmNzLzlhVmlyVlRaZlZDelZwOWZoODdXVUxPUWd5?=
 =?utf-8?B?RmFuZjUvQ2k1dkpvS3M0UEpFSDFDaGlVOHVGS2o5U1Evc0Fkazc0eWllcUtq?=
 =?utf-8?B?dm9yUFVpNmp4Wm1XbTRHbGh6RzEyeXErK0ozd25LQ0phYXkvK1l3aVN1b3R5?=
 =?utf-8?B?VnVSVlhwdnB4VmxjUTU5UlZYUUVwUmtBVWlWaXlvcFkzUFVybGNVMHBmZEpF?=
 =?utf-8?B?WDR5TFlhU29rNWxiN1Y5RTdtb21wWnk4cng3NjRiMWEwN0owejJlbEFoK2Ft?=
 =?utf-8?B?dzZHVkpVQnNXalFjaExNRnRRWDA5UWxEbXFQSXlIKzJyczBjTXlKSC9FcFV6?=
 =?utf-8?B?ZTVIS1lxZElwczZDRmlISG45RkhDQzVUMjFRU0FNdVI5bDhGQ1JvYkY0Wis0?=
 =?utf-8?B?VlMwV1FEYzF6c3JacDRNN05LLzMyVFVuZENtamlBQ3RFZkR0Nlg5UWhUSVRC?=
 =?utf-8?B?YjY1R0E4VDN5RGRyU0w5eTB2dlhQMEJwWWIyYnoyNDZEL3plNkMzaVFScUNX?=
 =?utf-8?B?RnljaFpKWGJobDdvVTZXY3JhU05jU1hTZWh3RmI4SEdLODRLcFNyS1dxRFBF?=
 =?utf-8?B?ek1PdlpDL0pNQWdkMEl1YVBxbGNJcXRzTzBwejRPNW1adGllUUd1M3RuZmlS?=
 =?utf-8?B?TTh5bUpLd2s0N0Q3a09vTjRBaHpwUktSNWhIUDJUNHJZSXJUdmdFVW1iZUdh?=
 =?utf-8?B?WGFUVFBjNy9oSUR4Rm1qMnd5RE9uYkgwbmIxQTBoRjk0TGlPY3EwOENOSmwx?=
 =?utf-8?B?UGk3TTVVQmNDdGVRa1RNNXNFYzFOSklCQStHMWZmQ2UrVXlDeS84dHp5OGh0?=
 =?utf-8?B?QWdxbUE3NkkzYU9WcXZ2RFRaK3ZDTGNES3VXMS9SM0VhRHVCZ2NlOWhKZDlv?=
 =?utf-8?B?S1cySnNUZnh0c2ZUZDJHRGRBRFduejRJdWMxdTFjSUF2aFNaRG5KVzNHU1NZ?=
 =?utf-8?B?TUtBOUpOaDVPaUsrRnNVTWNrUUZvd29wSzY2T21FOGRPbzN5NFNKdDl6Y01m?=
 =?utf-8?B?Qk5PbjRJN2ZxeWRIc1UzWVluUGdURys1bkJVUTdCeUhVUHIrUldqQ2N5NGZZ?=
 =?utf-8?B?TWZUSjRPZUR3MkxYREdKRUU1aEhzVnZtSEMzR0JGL1l5VFJRTlZtN0RFSEVx?=
 =?utf-8?B?UXlXV0ZJNXowZ2lOV285Mldxd3lOZVFWRTcvYUYwYWJjYWRhZ1dRU2k1S05j?=
 =?utf-8?B?Z0FYVzRsamFiYWRRM0VnRzJnOXc1TkJkVk9JMHdtSlRTWXlmUk5OaVJuMmZW?=
 =?utf-8?B?Y2xkVjlNbXdhUE53MmFVNzB5a0czK2Q5c2hFZ0J3Mm1TdExxcHRtTmlpZ01O?=
 =?utf-8?B?c1RLNGYvSHEwWEZMOUY4TkYvMGY0cHAyTHZMMkJvRjU0OUFZbmhiZXltU2pr?=
 =?utf-8?Q?Mj2+60fsMC2x4J0TJAsNJhupJT8ujzIy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1l5cTQxZExPYVZvTGJySHUzYyttaCtYNkFBdVQyZjBZNUkzd3BTakJNTWZ2?=
 =?utf-8?B?blpRMjBZb3cyelU0UGdaSTRneEJKVE8zLzJjd3VLOWloOHVUWlRucGV3bjJF?=
 =?utf-8?B?Y1Vxa1BweEJ2ZG9MbkVaWWZvdUhtcnJKc1ZTNDVlTk50akpxa2RyUXpyK0hp?=
 =?utf-8?B?UHBCQXJJdVVJRkJYU2xXbnZNWFQ3cmxqd3hpQUZuajQrNDk1OVdPRGFGczV6?=
 =?utf-8?B?bU81clozcFYxTTdZOVF0TWxJSlp3V2M0UzJ4L0pIa0FXaDVyc28vNFdYZzFa?=
 =?utf-8?B?ZXBmMm1tUWsxclRaVGFyNDduUkhsVU5jVjdwQWNPeEpUTGprWmN6TmpDKzht?=
 =?utf-8?B?T3RCOHlLSjVzSkxleitqK2k5eld5aldHWkhleksyZDhZMDUzY2xtRE5jZVBP?=
 =?utf-8?B?Yi9WRUFaTk5NV1lRTFNaeWVSRXlJQTc2ejlubHhzQUVjNXhFTzBiRGFZZWFW?=
 =?utf-8?B?SXJYc3JZNTFIWjVMcmJKeHFSTjNXNlo4NE9JUDI0Sk5vbCt5YWpCeW82b1R4?=
 =?utf-8?B?UkNYNlRKRXFnVXJBOUJXQXk4RmNpVWtIRTRwalhGVndaV0hvSjEzTVBVRkUz?=
 =?utf-8?B?VitDdmwwakJRSXV0d1djYUs1ald3NUVac0NUaGlEME1hZkNyaCs3cERWVkN2?=
 =?utf-8?B?bGJ0K2RMQ2VVUzl2OHhVSFdlWjN0RXBWTERtUHhDYzJYZmNTWjlmQTFuaG00?=
 =?utf-8?B?Y3VQTGJiMkgvcCtNdzRKWFpiUmpDOGY2OGNuRmhDUUUrYlh0blRVWnI3ZUw3?=
 =?utf-8?B?THhnbkNqakdLMldPRk9zOVdmMWhOUFRPTDlJRk51b1BnSWpBWFVxL2ZYWFdl?=
 =?utf-8?B?d0NFNUVxWVprcWdNWENjOGNJTXRnR0FuZkpFSXBjV1NtRUZRRnpIYXI1MUNq?=
 =?utf-8?B?YjJQK0xtQUJ4aVdSdU40RmRVSWhhRzZQc0FxMWQ2OGxuN3lwZitmclZYS1I3?=
 =?utf-8?B?ZDNJd0JxWkJPU2E1ZlV4NUZ2Ulg0bkREZkRldXF1R0YvUlk0UnVzY0dZNkhz?=
 =?utf-8?B?YWZlYUdpTGJCNnY3NnhaMnlLbml5bmVPL1RGUHplQ25KcVhHbHFCRVYwS21n?=
 =?utf-8?B?VDZtNjZ6cTRTd0ZaYksrVTkwOWxnSUIrRFdsb1BRUkZpSWFZelF0MXZUeXdR?=
 =?utf-8?B?YnY5TVpiV3dyMXdWaW5nMHdiSTVNU3Z5T0VKL0FKYlBEVWUrcU1STHMzcVZB?=
 =?utf-8?B?R09WZmxrZHlheFJrdFNBblJwSW5KT04rNTNoRjJGTDRZb05hZlNIekxCckx0?=
 =?utf-8?B?UW9vbi9abnBiNGN5cjYxQlF5N244bG1tKzNSS2wxWVFJVHBQQjUyUTZVREZj?=
 =?utf-8?B?TVlLTWY5eW5la2pscURQZ041NVc4a2JYK0xZSlpQeEVIVW82OE1yTjJEZU43?=
 =?utf-8?B?L3J3U2ordVR6TTloZk1Ud21CVktiNUZlUmw2YzM0RnNMTXA0dVRiK1d0cGdx?=
 =?utf-8?B?NFFORm5URUliSmoxSjE5Um5ySFBsUkRqU091bDBQRHFpSDMyQ2ZnWGhOU0pJ?=
 =?utf-8?B?aVVqL2JjN0VrR1d2eTY5cm1LNlpTM3N5MmtkbHp2UURDTmRGZzhWR3Z1ejdD?=
 =?utf-8?B?ckhuT0w0SlpnZzQ3emJicE5oTEVKaGtJWUh4OWxIbVh6cnk3ZkVRQ3JNN0Rr?=
 =?utf-8?B?VVQ1L1NTekxkS2RzczU2YVNhSE40L3dtYy84M0dubm4reVEyUk1WeUdXTCtw?=
 =?utf-8?B?YjhIb1QrenhsbDJ6M1VhT1RHZEoxcUpZSnB6MFRLeE0yclhnMklPSEtVNHcy?=
 =?utf-8?B?UXgzWWlNY25ZM1FsOFl0SUNuOWpuejVySHpEM1BWbE41eWZ5OWZydTRxRGdJ?=
 =?utf-8?B?SDBGZUg2Z0pLbHFhdm56VVErbXdCdGVvbEtpS0tCYXg3dlJaaEQxeUx2RjJH?=
 =?utf-8?B?anpMN3Vhck1LNU1ZRVRNZWYvNjB2dmxsUlhxM2VObGdQL2NVWmdTSnhyR1Js?=
 =?utf-8?B?cGJJc2Rxa2RJaDRsbGlYZ1VBdWloN2tUdkZFR0N0NTRZUmhMdFRzZXJ2ckk5?=
 =?utf-8?B?RUpZdWdsZ1hUcVROY0xrRldxUGp0b1gwTllYNzIxVTZuaWcrR3ZxVmNMVEJM?=
 =?utf-8?B?bE5VK3U0YVgrZVhNcTBtaThoN3JnWSs2cjJoM0ovc1dnSXdKT3FkMUt2N3p1?=
 =?utf-8?Q?S/hBBbr4ywj1HPPvrvaHX5pXz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8782497d-590f-4ecb-96e5-08de008d5a9f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 01:53:44.6738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhZ1QHRvH8+yc57vKbo1NEPpa2/DHgv+y9tvz9TxPzdaDiH99bCw2IEr4k583NKKMXp43vGlNTzwJXUjx1NCig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263
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

On 9/30/25 6:42 PM, Alistair Popple wrote:
> On 2025-09-30 at 23:29 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
>> On 9/30/25 3:16 PM, Alistair Popple wrote:
>>> +        // SAFETY: No DMA allocations have been made yet
>>> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
>>
>> I think you forgot to derive the value from the relevant sources, i.e. physical
>> bus, DMA controller and MMU capabilities.
>>
>> I assume not all GPU architectures / generations have the exact same capabilities?
> 
> Right. Long term we need a HAL for this, and I believe John was going to look
> at that. In the short term everything we care about supports the same 47-bit

Yes. This will arrive with the Hopper/Blackwell support patchset.

> address width. And when I say "everything" I mean Turing and Ampere, although
> I'm pretty sure 47-bits goes back to at least Pascal.
> 
> Newer GPU architectures (Hopper+) support greater widths (52-bits), but there's
> no real impact to constraining these for now until a proper HAL is in place.

Yes. The "soul" of these various patchsets so far is, "get GSP responsive
for Ampere/Ada". To that end, it's OK to temporarily act as if the only
thing that matters in this driver is Ampere/Ada. :)

> 
> And that sounds like an excellent addition that I should make to the commit
> logs and/or the comment on the constant definition, which fell off my radar when
> reworking the rest of this series but will fix for v4.

thanks,
-- 
John Hubbard

