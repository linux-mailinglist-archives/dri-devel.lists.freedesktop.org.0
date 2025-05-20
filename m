Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DAABD02F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D294810E498;
	Tue, 20 May 2025 07:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y+hvRCCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312A710E498;
 Tue, 20 May 2025 07:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+v5pgyaZKdnZrQBWqGYAS6LeZQ0fna+zbIiwtZopt3fx/N3hFalyQNdD5Nlq+6PNjopvPutohy6i7QgaZ21eBNAwrNvwLzQe94sOjJOX9ErEWgnjo1113Py6SPAiDvkfBKnE1Hv16zxv5VaKHWT2fZMKc22+1QJa1K1ynbWzOcc/TLfBfn64yi4iMUl3jmgDYjFf0oZe3Lp1ozpE3qQUdLyNXUXYyd7meUqLO+ouBdx4Wtb73+JxmJMvVseFRYWGRGGa4PIU/H4fu+LHTXvleCJ3HFYFwKwebu5jWDzzGJq98cJxLJq64Gs5/OnatLMLoi+9XO/IUyW3016umNQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tte1qcuz31vL9cZjjSCDOu9AG4+icAPmcVaRWmurd+Y=;
 b=TFfXohs1ET9kikG1BoyMQyd8OVOO7FKI+aS/cFoxDCd5zgsAyew66okN5mbAY/jntn7X7aVpcXmSt4q+5Ux692pTmqpwzfFOuwAF5HOFHAODKXcqtx3/6HvHfK3c12X05JHmAIG/8poYPfTrKX+RbhiPABq+nfYILOr2CWyHZmMfmmmc0/yVE7ZievfYxxKwqGo3LUUfRtqm99HdFtXzwN3/fZf6UY/ZW6rRbYRC5gbwG3fjnyhCu491Syb/HZ/N5OmQ9GI9ZQhJHruA/qVmRD0gYigkCaY+fpTnFrOV3OM6O/KHU1BQgppPWBPDCLYU/xgEtEx7kFtoiwphAVd9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tte1qcuz31vL9cZjjSCDOu9AG4+icAPmcVaRWmurd+Y=;
 b=Y+hvRCCH0x+khLz+jrbG0ZstZoftHWB2vnlP3emuUc9mPd1jPzwwWVXWPmBRz766hCmtqzXfT6pjF1HpbYSUgU2ZNIx1q8IjlnFc1hU6dNZgPL+6DNNC/wt+wSKWKkkzP3MJNCCuzUdU4ldQMi6y1X5iup1SzWDSrx56j3biKe4pU0xLehCTaOO8LZ1iBJrmn/Y6JH4mFbQ0/S69NjD83Ef+tYMx5qjiUMPPT5PUQOFnbwd35M1ecQ+ooWy9NcRIpUJYt7B1uPg7SmA3mhWcy7796OeEyYO7iVw17OoMfqo4qp0/jpdLNdd4JQbSLA56V+WVvwR/FDHkJtculoz+wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV3PR12MB9186.namprd12.prod.outlook.com (2603:10b6:408:197::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 07:19:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 07:19:00 +0000
Message-ID: <b5d608e6-34dd-49e8-8cdf-fabc2ab78fb0@nvidia.com>
Date: Tue, 20 May 2025 03:18:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCTDk9UKRWHWYexR@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aCTDk9UKRWHWYexR@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:91::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV3PR12MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2ed721-8eca-41a5-6328-08dd976e97be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elZMalJ6VE90VDh0QUh4Zkp3cGNtci8zbW1rUVFWUDVEdVhmaFpwYVFHc1ds?=
 =?utf-8?B?WkZyNnF6VlNqZVNNb3RERjNVTHc4K0xUQmorZ1JSbEdzVzB2d2lBbGdYdzNU?=
 =?utf-8?B?VStWSzd1K2NSRVNsaFFGaDNiUkFQdGdtdU40NG5LVms0SjR6b240WUtHRmwx?=
 =?utf-8?B?ekg2MXQzaVBUcFk2NzhXVDVYanNDY1B3TXFINE1JWlozbnNYZEdaSXVRelc1?=
 =?utf-8?B?dWMzTVdXR21OWlplSTB1RDJpZElzZ0tOeDZGeXhMVFJSZkMvMFdJNlI0Wi9Q?=
 =?utf-8?B?ejBKbmhkRFpRc2xPc2ZQU2NlTnE3S2UyVno3VDZFMTVaRUdPZENkRG5ab1pp?=
 =?utf-8?B?WHBGSVI2U2dCRXM0eWdBSkU2eUFaNXhnOXJ1UW5WZ1ZZWVllNVdkQ3JoNFM1?=
 =?utf-8?B?S1pzVFlETVJHU21mN1ltOW1TejZ1K0JnSzVvbi9JQ3FzNmlIT2YyUHA1eWZI?=
 =?utf-8?B?Nm40eDNuMnYwbGlIaEpmRWtsOUNYM2E1cVdvbFJzbUk5UkpVNmN1NGd2MGJI?=
 =?utf-8?B?Y3BUK0Z3Wm42Y3NFR242OThwWFI3bXRGYUI1QUhEeGNyMzduY2hVbWpTQ2Z1?=
 =?utf-8?B?alluWUxJUS9aQ3JOa3RKWEdqMWprclpUUjJuR1pQYTZKbzYzSFZaa3gwQkM5?=
 =?utf-8?B?cU8wS3BEbmxpOUV3ZjAzV3NRSXBzMUdKK3IzWDUrWDhDRGJEUDlVOHdiemtC?=
 =?utf-8?B?dzk2cG1aRTY1clRDdzFsdzBLZXY3eExSWDZ2Ykt3SHJMbGkrTE1xcmtOekNl?=
 =?utf-8?B?V0EvQnBnakszTEM5djQvYkc0VllRdkJZSTNPTzVyMTlxdUFpM1BUMWNhNEo2?=
 =?utf-8?B?cWtrdEtPUHdqM3NXend3Qld6NXhpdzJoRlZhRUpxMVBRVzhVMWdmdHJPTU14?=
 =?utf-8?B?ejY1UGplcmZiVWR1R3RicHU0US9XWkFGejhqRnduNEhyaG53eS83eGZrYU1k?=
 =?utf-8?B?SnpQQVJDMGg0cGRrWFY5WWlTd0JtVVVlam5lWWZNanM2TWtRU3c3Z2Y5amNN?=
 =?utf-8?B?OXRoUTJxRDhPQmdpY0U2dG9sN1ZydzJpRkliR3c3bW1DdjhjV2Y1Z2k4WEJv?=
 =?utf-8?B?SnZaa2FpdlpBdGwwajRDZEFiSkFzdFBYL1g3V3diTGlwVGt3c2hRTkFWRTk3?=
 =?utf-8?B?cEhhQ1JkeWJNRDVvSXpDTEYwa1VQSzVVWnc0TG43MGRGWGNKdlJYZXpscGpv?=
 =?utf-8?B?dXVUSmwvcmJYUWRSTnRwSC9jZldldll3NlA3NDZlTWFOUFNLQUJxTVBBOWRU?=
 =?utf-8?B?Z1ppNFovMTZPbmRnY21rSjZOMUZqZDhMUFc0eW11eXpjd1R2TURKL1dxN09N?=
 =?utf-8?B?YXk5Ukc0OVhpR1BENzdvYjJCYmM5WTlNMUFBRUNQdHlzNEdwMnorNHpoSGtn?=
 =?utf-8?B?UU92Z1dBS1NCcFQxenJGbWp1WHhUODc1bVdzeXVJaFRZbVFFbVdZVkRpMHJO?=
 =?utf-8?B?MGlseG1LNzhmK1Z2QkRISTl0N0ZjeTl0aGMvVnJIdVBrcXZQbmJkWFNBSkNI?=
 =?utf-8?B?VzE1TU01RjRicjBpM2tyd3c1WDFoVWt0bjdaaytUbnJKS25jVHFacHdDTkIr?=
 =?utf-8?B?R3M1YkU3M1ErN3hLbC9wSlRZWVFYUTVGejBKRC85Umc5ZWRhOVVPRU55QWU2?=
 =?utf-8?B?d2Y4SnRaUnJGcVdTbG5Gc2pOOSszTmJ0L1YxdDVHZVR4d1pPVlJPbldRK3lK?=
 =?utf-8?B?ejQ4TmZFRm91cGxqbGxWSWROSHl2bCtBemhld0NoNC9vTk9CQWltdm5mNk9x?=
 =?utf-8?B?VU0xcDd2SDYvRlQyUGFudHExQ0pYSXpqQ1F1aG5KNmZ6bEo2emNjWjltSzV3?=
 =?utf-8?B?OVBBak9VSTVaUFJkM1NRUGY3V1FIMTBiamgxSUd4SmZUVkFlKzZzK1lJVUVF?=
 =?utf-8?B?elk5ci9keEtxZVdIYWdiRERxNCs4cGlxaFY3clBCNlhwZFZZYzkrRUFHUC9s?=
 =?utf-8?Q?lwrwz6VD0MA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1NSK2tJRDhGTHJ5ZlFsUlZ0NEg2ZG5tdmtacmZBQjhpejdWQi80cmMrWHlY?=
 =?utf-8?B?UzBxYjVyV3ZudVFlb0taZ1lhWk9xUzloenpJY3JiZjJEMVRUOTMxVFdCUGpB?=
 =?utf-8?B?TjFucXEyUHBuZ3ovQWdLY1RObkdFVFdqUDRBUnN2T2VPVmFScXpvbHcxb0RQ?=
 =?utf-8?B?N2xxQkNVVjRHV1NtODVRdENlRERkT0lZTlQvOURRbnZVTjFEaG03NjlkejQv?=
 =?utf-8?B?L20reTQ1VWt3VittUjMybmw5T09ySStnd3Y4OVQzNWFhMTA1RFRRaXF2YlVQ?=
 =?utf-8?B?VjBlSjk3YnNPeWx5cDg0dTFZTG9adUhtL3Yxa1R2bVpaeGRWZk9aQkNvZW1u?=
 =?utf-8?B?Q2h3UWxsRUZSTXFETDh5OVBrTTNUU2JmeUNsY0ZKSXEvSnRUUG1LbjE4SENm?=
 =?utf-8?B?YmphQm0zdzhFOGtSVHcwVXJLcWE3K0x2V1dpU2E3SStEQVlLbThvam52cDFH?=
 =?utf-8?B?U0pMa1NydFA2Zy9qUlFiZklzYWg3dGVrcERHbUJYR1V5TG1md2E3TjRjaHJV?=
 =?utf-8?B?cldnYncvMGUzN0RpUXRNSEVpOFMweW8ycVhOSUhoZS9pbWprYnRUcC92dy9H?=
 =?utf-8?B?a1dSbWo4N0oxVldTUjlnSXRMb0dmS3ZpUWNlZm8rU2xYMG1Yek1kUWJEaGF3?=
 =?utf-8?B?TkZIYlNkTEtiZzFGenFUUUx2MEF1Q2tPcFJiNzhCQVBwWGRUZDNrRWk5MDB5?=
 =?utf-8?B?VUsvNWE1blprNTkybEJRRmNUcTMzWlM2elk5TlI0aVFvQnMwSDRoSU9TT3Rh?=
 =?utf-8?B?V0V2Sys3NDF2N2ZWMU80R2lYTXpLaW80dW9nUzhDSjJsbGY5WEEyamJQWHlK?=
 =?utf-8?B?cTBqMFMzSzdIbHpBb3M1YTllUE1oTVNrMW9xck9ZRzAvU1ZCTXlscktiUUVi?=
 =?utf-8?B?dU1qSEpDN3M3MmxUenlVTzFYV2ZKZzJhczQ5Z3RwUE1MOGhGTERFRWVCZlll?=
 =?utf-8?B?K09GVkhIaXNONEVLV2ExaG1oSkNVc3d1dDlLak03a2EvN3hGM0dwTnltejI0?=
 =?utf-8?B?SU4rZEpnVE5oR1ZLbEE4ckdjQUNwMVQvNFVoeDBLb280NElMMmlwQ2s1aUtX?=
 =?utf-8?B?NEtFYUFYcEMwNmpEYXB1MXBGQlZRUzdBVHpaMmVXZTI4c2ZDejNIWi9jeHpj?=
 =?utf-8?B?WUNzN1lRSEEyUUZFVjBGKzdnU1FJTElHaHZFcm9tclJrdlVnSVN5Q1ZtN1k1?=
 =?utf-8?B?eG9UUzRQcm9TT0lmeEt3ajh5ZTN2UFpUNk9ZVldjVjVkeENtN3RuTFNwRUQz?=
 =?utf-8?B?cXZxRGFabzVIYkROaTk4U3NBanhDZnFjTGdIenFFQnJMTUJMZVh0Y3VCSEZQ?=
 =?utf-8?B?Q2RabHpUZ0l5VHR3VzRSVGVVQ05tQ1dwUWE5aGd1UGNkU2o5UVVvMzlsdkhC?=
 =?utf-8?B?eU9iRUxoTUdDMStkVFZ5YWNoMzBxRUdmQU10VDFYWmdhbE4zcWZvRzNHSEFo?=
 =?utf-8?B?QlVHalp2QXBlMFdZZWFNc2FocEdxKy9RSzFjc1dPSXkwSnFMTGdLVVY4NUR0?=
 =?utf-8?B?aEVUWjU4ZnExQXh5VnpDTlpyNG03MG9qbGphMkFmT0hITmpyOHJBSWplT3l3?=
 =?utf-8?B?R1UxbTRjR3VCWFFUdGRncFJXMU01VFVYWjV3MjNxSllxRVRjMTh1TERQL3h0?=
 =?utf-8?B?REVRdGhEV3ZxTXM1bmgwVUF3Q2tHd1hFNFBDa1owUzZTSVM0bmlNMUxjcURO?=
 =?utf-8?B?eFFvS0hhcUh2Zyt3ZDVMSFZMUUtQQWhFTVcyWi9kUjVaWUZNeWRFSFV2M285?=
 =?utf-8?B?d2lCQkdRR0o2dVE4aVhiUCtCclpHRXRub0orQUhDWXk4L3NpUWVHK2l6ZldJ?=
 =?utf-8?B?MFFPT3lrWjhqd0JDQjBESndMUVRsRWlNdWhGVVhWdHpWZHFMTlRpUjZ4Zkd6?=
 =?utf-8?B?WW5WVHYrU1hVN1VGUC9lVktTTkdFTTB3YXJDcU9scS9nZ0ZQNTRTRHB4Sit6?=
 =?utf-8?B?bXZMSGgzUWdPTlFWbDlTemFuSUMwM2FFTWxXdGdFUjA0cGFTZkJtdnl2SUw5?=
 =?utf-8?B?U1ZzQkJsTXp1WHh3M1Mxc2tNRHhVdlI5KzBzVmJhM1o5YXBCUVdCSnpYeTdz?=
 =?utf-8?B?NTNHbkloQnFXR0NwZG4xOTZRN0d2MkhHRmZRQmlEdkhoR25nc1hQNEpFSEpB?=
 =?utf-8?Q?w+0fVFHVuqEHwRC2IM+RlUYlc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2ed721-8eca-41a5-6328-08dd976e97be
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 07:19:00.6161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAYQ7cFDjJ+n+/Sn+TQuidgOkfNzka5/+6Jt9i3AmkEiCEFeQSpgmEEldNbfYsISanS+xKTh7cFmdLGyR2qxmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9186
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

Hi Danilo,

On 5/14/2025 12:23 PM, Danilo Krummrich wrote:
>  I feel like this patch utilizes the Option type way too much and
> often without actual need. Can you please also double check?
> 

I found one other instance (vbios.fwsec_image). Other than that, all others are
required AFAICS.

>> +
>> +            if cfg!(debug_assertions) {
>> +                // Debugging (dumps the table data to dmesg):
>> +                if let Some(ref mut last_entry_bytes) = last_entry_bytes {
>> +                    last_entry_bytes.push(byte, GFP_KERNEL)?;
>> +
>> +                    let last_entry_bytes_len = last_entry_bytes.len();
>> +                    if last_entry_bytes_len == entry_len {
>> +                        pr_info!("Last entry bytes: {:02x?}\n", &last_entry_bytes[..]);
>
> Please use dev_dbg!().
>

This required passing down the pdev here, but did that, thanks.

>> +                        *last_entry_bytes = KVec::new();
>> +                    }
>> +                }
>> +            }
>> +        }
>> +
>> +        Ok(PmuLookupTable {
>> +            version: data[0],
>> +            header_len: header_len as u8,
>> +            entry_len: entry_len as u8,
>> +            entry_count: entry_count as u8,
>> +            table_data,
>> +        })
>> +    }
>> +
>> +    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
>> +        if idx >= self.entry_count {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let index = (idx as usize) * self.entry_len as usize;
>> +        PmuLookupTableEntry::new(&self.table_data[index..])
>> +    }
>> +
>> +    // find entry by type value
>> +    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
>> +        for i in 0..self.entry_count {
>> +            let entry = self.lookup_index(i)?;
>> +            if entry.application_id == entry_type {
>> +                return Ok(entry);
>> +            }
>> +        }
>> +
>> +        Err(EINVAL)
>> +    }
>> +}
>> +
>> +/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
>> +/// The PMU table contains voltage/frequency tables as well as a pointer to the
>> +/// Falcon Ucode.
>> +impl FwSecBiosImage {
>> +    fn setup_falcon_data(
>> +        &mut self,
>> +        pdev: &pci::Device,
>> +        pci_at_image: &PciAtBiosImage,
>> +        first_fwsec_image: &FwSecBiosImage,
>> +    ) -> Result<()> {
>
> Just Result will do.
>

Fixed.

>> +        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
>> +
>> +        // The falcon data pointer assumes that the PciAt and FWSEC images
>> +        // are contiguous in memory. However, testing shows the EFI image sits in
>> +        // between them. So calculate the offset from the end of the PciAt image
>> +        // rather than the start of it. Compensate.
>> +        offset -= pci_at_image.base.data.len();
>> +
>> +        // The offset is now from the start of the first Fwsec image, however
>> +        // the offset points to a location in the second Fwsec image. Since
>> +        // the fwsec images are contiguous, subtract the length of the first Fwsec
>> +        // image from the offset to get the offset to the start of the second
>> +        // Fwsec image.
>> +        offset -= first_fwsec_image.base.data.len();
>> +
>> +        self.falcon_data_offset = Some(offset);
>> +
>> +        // The PmuLookupTable starts at the offset of the falcon data pointer
>> +        self.pmu_lookup_table = Some(PmuLookupTable::new(&self.base.data[offset..])?);
>> +
>> +        match self
>> +            .pmu_lookup_table
>> +            .as_ref()
>> +            .ok_or(EINVAL)?
>> +            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
>> +        {
>> +            Ok(entry) => {
>> +                let mut ucode_offset = entry.data as usize;
>> +                ucode_offset -= pci_at_image.base.data.len();
>> +                ucode_offset -= first_fwsec_image.base.data.len();
>> +                self.falcon_ucode_offset = Some(ucode_offset);
>> +                if cfg!(debug_assertions) {
>> +                    // Print the v3_desc header for debugging
>> +                    let v3_desc = self.fwsec_header(pdev.as_ref())?;
>> +                    pr_info!("PmuLookupTableEntry v3_desc: {:#?}\n", v3_desc);
>> +                }
>> +            }
>> +            Err(e) => {
>> +                dev_err!(
>> +                    pdev.as_ref(),
>> +                    "PmuLookupTableEntry not found, error: {:?}\n",
>> +                    e
>> +                );
>> +            }
>> +        }
>> +        Ok(())
>> +    }
>> +
>> +    /// TODO: These were borrowed from the old code for integrating this module
>> +    /// with the outside world. They should be cleaned up and integrated properly.
>
> Okay, won't review for now then. 🙂

In the next revision, we are removing this TODO and can continue review. :)

thanks,

 - Joel


