Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70DB9C591
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 00:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3A010E25D;
	Wed, 24 Sep 2025 22:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jXmEWFHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FEE10E25D;
 Wed, 24 Sep 2025 22:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+Hxg51ypPS7cXS/Bmm5hH1aV7pS2unE5izC1gqfhtcwitc+mrfROSLoqGDxwGgEUmBpZDFS2FeJfWlMqtP7T9niCBqpKfg1wy2LDj1JBIQys6IJtzyq0Hsjg6yRRggqrk0bjWFNf4knVYNW8y+G5dwm6ZQbYNrDhn9jWCay9qW3soOnKQQcYDnG7Mrne80PLmfHhkbk7H+L7sjvn2T/2XgbrN+s/yArop/HYxJuyy4MJxGNUF19CquOCHbDn8Z6Xyej6lh6pILaPNLY17Z+8d2+zLlvI2CewyCapRF+e2+ZdYlT+SLloW0FZviyUE+6nR93RaChXIm63S3QO0fx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkZYEsr2u99vnOrogtl2Mq23CTtOtnzDtWeqG2JRBcI=;
 b=HedBWeMd4R5p7qdIs09kcJcXLapwj8PHicAWjqbsKrh5Yr+WMbW58BUZIicpdVgGxM1Y+6E55CjEj8SVDrSIMYkYsg5mo7A187/oJJputuCE35cZWSCPPMWGOkrYENLbH1n0HsSA+kJwb2RRHFYE72gasODVMXvhYVDaBBW/p1Hj3qV13pGpTSZfrV5Q7Z5H6Mt7AgPsavGQPaTJ+PVQ1H/cnw2qLCArXvzoKwyI3X4SFmHcpQZ/Voi8/IN2GTS7EN9AOphUSuh+HzMaaHFqJ1kI6dPEYNJSthGmwPqBhvYAVXzWUrlHj0fbyHn+vcFShAi1EO5kawUK5Dc2H6wmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkZYEsr2u99vnOrogtl2Mq23CTtOtnzDtWeqG2JRBcI=;
 b=jXmEWFHrBcTwFmu1z3mRQgzlwxtqkdDKcQ6AHZLuKRQ1k+Kg/FF0gVVEAOVVE7orszFy1q3FwlbOTdeC/rVzftxl6yf4hJO0YMjNViKRUIYQ9NBRMWb5gaPyv67do8ikX80c0JuUNA7cXM2ZjMOXc2CUhQ65anInsViYG10CO7vj8LrqlMIKjsaSjRYRwNxz5W1wCxfWN26ajTC71KiJbWaatDcnbFU6gPXhOH+qanoEmloZvy9IwgLlobUR/mdG3ao92seriD7LSzCoqa0XD1ZIx56jzLU2SaOSRvPC0VH+ORXl+BJ88feI0hg4tV6HlC+4BMKWijZ/kjd6e+rzbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 22:24:58 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 22:24:56 +0000
Message-ID: <c267b886-b218-4f87-8153-873cb1d08c54@nvidia.com>
Date: Wed, 24 Sep 2025 15:24:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] nova-core: gsp: Boot GSP
To: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-11-apopple@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250922113026.3083103-11-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:180::29) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: 830a2242-a74b-4547-e9f9-08ddfbb930f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEtSak0yU2s0T3MwLzZsNnhCMkFkSWlmTzFUbWpHdE5rTG9OUElYWjYzZjl2?=
 =?utf-8?B?WW4vYUNRRWxOdnd0WDVEWHBQYTVJNzNhbDNpanQ1STNuS2hqbUZQeGZUdFVV?=
 =?utf-8?B?Ync2UFJwMk55c281Um93NHhLVWhmVE50aUJhemR0TGlBZzNETndYZXkxaWZ3?=
 =?utf-8?B?dTNyVkhkY2RRbGkrV2puWFhtTG00eDAyRGJLTSsxclU0eHpDK2g5TUNnNTc1?=
 =?utf-8?B?K0h5aXF4UG1rSWd1Nzduc1liS3dkWjZ5TkJCTnVLSjVZWDJtY2hYTVFzM2pY?=
 =?utf-8?B?SlB1RktaTUpQSmdPQTVrK25ReHBQQllURkoyZTdxSWxKK0c0SUJrSTFQQTA0?=
 =?utf-8?B?Z3pSd0RGbFlzTXFUU2tvZk8xWVlZZXRGbzhYaXBaR2ppekozYmh3N1ZmSEl0?=
 =?utf-8?B?U2VSNWVCc1NqaW8vd1JFRjh0SWFRejB0a0lWYVRPRHBqVHY0N2NRNE1DNHhQ?=
 =?utf-8?B?ekRFNzJyRjI0STRjVWFFYU9zNWg4QnZweUd1eFFuWjZZa3FGRlNNWXRVdEhs?=
 =?utf-8?B?YVRIZE5zdkRBMEkwVEozQ3J0bTgxVXNPS3NOaDZ3UDNyMkIvK1ROMXltTWhm?=
 =?utf-8?B?OUxGUThuMG1BZHBLRk9VVmZReDdSUWJLcWdvbmMrNXlEMDI4VHBUNGdCOXZB?=
 =?utf-8?B?ZkxQczhIS1k5UzhzVStVd09Gb3djdTV4ZEFmYmcwNWVrai9TNmN1dnMzWlZD?=
 =?utf-8?B?S0FsYkEyaUN3endTU1g1cWZwTmJ0NmlkdmQ3cnNFS3NKS1FCeVU1RnJKQStS?=
 =?utf-8?B?ZmtZSk16VjFsS3hVNDZtMmg0dURuazl1TnZ6WlVFVEVLdHU4YjI5Vk5mOXNM?=
 =?utf-8?B?TEFEejRQNEhHSmg3YW9JY3dxWlRQcmQ5SkVTR0JPSUNPQ1p1ZGNLTTJBenpn?=
 =?utf-8?B?NnU5U05DN3lOR2l6RTh3bmh0ZC9nNjVWYnlHUFVNemdyRW5KSUNQeU1YMWtI?=
 =?utf-8?B?ZmtMbmxSR21QNzVxd2RtSm92eDNFRHFzc3VOMU1nVkVZSjMzMCtIZmYwcTFP?=
 =?utf-8?B?T3FvZjBVN0pXakMzaDVUczVwZTlNRk1SK000aFo4eUd4dDFTYi9iYURYdTZL?=
 =?utf-8?B?TFhDbEFicGVBTy9nRWUyV0kyVUIvTFFXTURSSUxHcmJWQjRkMXNJZEt0TnFG?=
 =?utf-8?B?VC9XZnNkV0tnNngyL0ZmeTZWeFJRV3NUWmJIVFlMMWxBNkpYSGU0Yk1RbTI3?=
 =?utf-8?B?VGZEQXIvcXV5SkRYN2FQL2dlREV6WlRoVy9mWC91MXV2L1ozdmhyTU1vOUQ4?=
 =?utf-8?B?MVE0V3RrenZZdTMzNm1oZXRma0JjLzlYWFkvbVRLOEV4OEs1SVU2aWhGZVB4?=
 =?utf-8?B?SW94Zy9TNmFPc2hCZThHdExWS01COW5KZVh6SFlsMWhSanBERE5XZDRIZGlB?=
 =?utf-8?B?ajJHSGlkVzRWTHp1eTlCZnB6L3RDMGNzeHE3bHdyU0UzdjBPY2laMmVoaE92?=
 =?utf-8?B?dThXSDQzdENjUmgrSXpDektpd24xN1BjclR2bzNZbm1TaFh1d0krNlViYU1x?=
 =?utf-8?B?NTM2NS9UbkkzZFVaaEdUQmpYMUhVVVJmK1pVTmVRdWV2VGVUZ3l0ZWVQeElF?=
 =?utf-8?B?V0ZmWEplenNTZktoOXRCd0RQR2NtVEhJNCtuWUJvVVc5N3lwRk1TbkJ6anR1?=
 =?utf-8?B?LzR4ZEUwdXY2cFVwbnFTelNZMW9Pb0V5RTQwUmI4b04vNVpPOTRGZEg5bHk2?=
 =?utf-8?B?TDZXZXdON0hhMU5KQUZtTlhvWUVTUWxzY0Znak1uR2FHbitUck9xT05kdlhV?=
 =?utf-8?B?WkVJYUtWMDRiSlJsdkpJd3FERXkxVnFuQVRZYTFSWlNWS293ZWlhYzlwUDVj?=
 =?utf-8?B?ZHFGdHpTMjhpMlVhTCt1SlVoRHdERTFaY1V2dDhHdGdNcjRqYkVXTWQxYTlX?=
 =?utf-8?B?YUhkUTJveVFGSlBBL25NSmNGOEt2NzRHN1Q2bE52ejMyWGpIQzlGT2NzRDdU?=
 =?utf-8?Q?vz83LzzP9js=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGNLYTlyK3dqK3BzQWYrdEVzZkVSUHFLOTc3c2tmNHEyMVFlaGxLMkVXRHJx?=
 =?utf-8?B?dnVWbkkwS1I0RzlJcnVZalNYU0pTY3VOWnlxTDkzSjZBUDUrLzVYZ1hwaGFa?=
 =?utf-8?B?NnBqaW5GVkloMUpZN1ZoMWJhS2JWalhqS0N0WEU4OVRnWS9MaG9XTXB6NXRQ?=
 =?utf-8?B?NXRsUTZSZEVNRjdsR2pka25qQ1l4aGFLVkFnOGhjTGRESVVBek9lMFkvMlk1?=
 =?utf-8?B?eTNIYVpPTzR4aTZUUDhrNVRHY01nSnJCYXJCWk1QK2x6Sk5MdUNoakwwdDl0?=
 =?utf-8?B?bEFqSldLc2xad0xXcUtnUmluWTAxMUJBYXNKbkpTbDBOckJaY2F0eUNVZFRD?=
 =?utf-8?B?ZVZ1aUpTQTJ0aGdUN2RTenRUSElseVJNTDhkbGRQK1pEbjhFUVRmMU9BcUR2?=
 =?utf-8?B?T0xHYWdMSVJJVzVJRXJic0xwTkkzUFhtRjdQa29iVjVqaHhKdms1VEsxbVM2?=
 =?utf-8?B?dEw0cWlKdjNoUDVQa3ByQ1R2UVBnQ29ZbDdURWxscENzY1Z1OFhlajhCUDR3?=
 =?utf-8?B?am0wQzFHN2F3ODg4R1NBVGxqc05Nd2hpZmQvbG5Cay9QOU53QVJGL3N0Mjdj?=
 =?utf-8?B?aEtXNDEwOHlKRjhKaCsyb0dLbXpoU0t4MXRpVWtnSFpKR0pjMVJUdnJXWE1P?=
 =?utf-8?B?VlVMTlRVSDdTYUZxd3NtWnd4ZXMzc1FTc2R6SUpERitISTN5TDM5YjVkUk1L?=
 =?utf-8?B?YkNva2pnY2JZUU0rMGkvNnk2SzlxZ1JabnVTYlNjLzFSb3pxNVNZMzlTWEV6?=
 =?utf-8?B?QmtzNFcxUVdOVjRaaENvY3llZWM2UXhZUzNGQnY1MzZiTWt1Wm04L29aMmZq?=
 =?utf-8?B?cEUvaEhNdlo1SWhQTTNHazh3SXR3S0ZZMDcwQ083Q0xKWVVQbUZ1MXlJSFBL?=
 =?utf-8?B?bVpkZDkyNE5YdkZrWjNsc2UzMS81ai9nZU1uYlRKSUFhWlNPK3l0UUN4SjhV?=
 =?utf-8?B?SlkxbndUajBad3BZVlpJaXZUS2Q0K0V6WEZrTDVONldPTkplOFQxUTRmb2w1?=
 =?utf-8?B?dE5temdlemtyb21PanBNNEdPQmxMc08xYU9URmlkMDNUU0ZRbmZIK2oyUG5F?=
 =?utf-8?B?ODNoS1JkdXNqU1FFZWJ6SUNTQk12YzQreGVmOUV5b3RtRUd1TUlRTGdmaXYz?=
 =?utf-8?B?QmU5azJZZXhHMmkwdkwyRWc3V3FZTi9mSE5vS01XNG03Nm9seWhkWnYrYUQv?=
 =?utf-8?B?alh0V2FPbzN0Nlk2SVFrcFh2Z1pGbTBoQVprZk04V3pwMWNSbXZNSGdTdmlr?=
 =?utf-8?B?VzMrL3FIQnNtL0JTOHBMRmZrYnREMkQ5VXZpTDNXNUJTSkMyeVNHNGpFZkN6?=
 =?utf-8?B?NVBkbXZ1dzRQWVpiMjdMaXNhSVVyTXZtdDhyM2dKd0hwTGZUQnFYeDlWcTNq?=
 =?utf-8?B?L3RyRk5uQXRwOWtYOGRzT0JURk0zY0ZzWWlUVEgvaXhzSk90eDZUZXpYek9T?=
 =?utf-8?B?YlVPNm1sWWNHbkhXZGEwOWJWTmhMVU5wTmFQQVRMMHFlVWUxeXJsYjMxdjR0?=
 =?utf-8?B?WEtNZGFkN0xMQmdCSXJNWHNTUHlrSkE2bmlrTFh5R1RmUkxXblhjQnl2cnVT?=
 =?utf-8?B?ZEYwSms3dWhlYjFvclh4TTJMaFN2ZXM4aVFHWXVHa0FSMGJ2bEhnNUZPckZD?=
 =?utf-8?B?L0Nnb2pMVmdQWVpkVEZ0ZVc1bEE3LzU3SjNJeUIxRnBJWUNVUEpzL0daR1lw?=
 =?utf-8?B?aHBHQ0JGTitQZW9iUTBXZklXNUVqS2tWYmhTbis0Q1FFOU8reDB0UmE0c2hR?=
 =?utf-8?B?c29BL0JkNUQ4L0orUk95ZUh3R3hMWGFsdFhSNDVJaUgvTGF4eVY2UEhZT3Qz?=
 =?utf-8?B?RFRnRE1WMDZiTnpMTzRQam5wQVdYT0MvZFlxMmZ6MC93M0drbnNkeFhaOFpw?=
 =?utf-8?B?Wms0ZktpNU4zdXNOL01hOU9CR3hiZzNoZFd2V2Zub0Mrallrb2w2SnRCMmEw?=
 =?utf-8?B?Uzc5czBVMldoeEJ4TWNab1N1aFlFVThnQnZKOFNwODRuaUZLMWV6WU13TFUv?=
 =?utf-8?B?Vm1HVkdaZ250RUZrbWhtRjhDYmRDSjZpb3JUU2JualY0ekhmZ05CbG5YdEg1?=
 =?utf-8?B?WjRtYWFUL0ZHVEtYZVphQmYvZWt1RXkzVW5CcWhsMzRUQW9UNTkxV3dmOUFK?=
 =?utf-8?Q?L7XOd4GDTpf9tcIriNr69mMch?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830a2242-a74b-4547-e9f9-08ddfbb930f2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 22:24:56.6365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8z37wQPG20XDKkK2AR3EM49qF96yTKlV6V5lElkheMS6k09fNJJMPpOCq+YTq8ePzrBq/YiwBInHpKmxTkn6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148
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

On 9/22/25 4:30 AM, Alistair Popple wrote:

> +        // Match what Nouveau does here:

Silly nit: can we please delete the above comment? (And if you'd
like to keep the note, then it can go in the commit log instead.)

I might be the one who actually added that comment at some point,
but have since realized the error of my ways. haha

Much of Nova is informed by Nouveau or Open RM or both, but I'd
like to leave it out of the code proper unless it's really somehow
key to have it there (and I can't think of any cases yet).


thanks,
-- 
John Hubbard

