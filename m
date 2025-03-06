Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC806A54ADE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 13:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4A510E955;
	Thu,  6 Mar 2025 12:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IG2H4Lkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2909310E195;
 Thu,  6 Mar 2025 12:38:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgsW+I6O5+rmAKpLODxqIbC75AL20gfNxjVThlQBqMclNiIPwzUsiQB+g6ytlGu+9YiA1BQq47jZl6f7TZWRCcVh69ZlkPzuR5TKOsaCpPlpq7sscrWelEy+x7LyiXzFKnE4ndcB8NllXuE2VuNYVa25g9gwW83g6lf9xcERI3X1iOHZ22MEOawDlyPPIJAfbAPLDmp/kJCpD7sA2sBIFzh3gjhqIwUjw3h/fNSrFvnlFpNmkDFIHqEDh1Z4K0iQ2TknGZRmQa6e97uqi88+jJGapRqowOkboNXgjZ4Im6/7572JH7TNjxzsCpnzFWRG38MGiD9Imqn7XLUdBbDdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8sGhK7nmYgIa6dsOTzXH+sVoL/UyjWMt0L19S71C28=;
 b=qCvOiawtxIZCKYHCUojNwYwlg+0BW7Vgw7CrQwVCVRFKGD+gkLq9j5+OEOmT+Jmewpdx1UfSnUUttTW/8ZfRdamsFOXuR2tsdYrN1DT6cw6yjRZQKPJ0CRTnEZICQYsmUhNRZxcnG3KfP/dxed4R+uiphD9rllVgQk3zByute3YibBvgN40n42AO0VmP9DpbhxiICyfRPLFBChNpwJLo5yyG6k8xPBrjqJdH6nFNsYOeXTGGLnaiDV/Afpb41vU4W58IAn84XdYNM/RQ/H7y9jzs8NT78sQwQG26BkYGqdx4pja4S1Z7dJFQOu6z3/Mmtg3j1zIOxloIcNSrFZmTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8sGhK7nmYgIa6dsOTzXH+sVoL/UyjWMt0L19S71C28=;
 b=IG2H4LkpJKZ7u80K+rkuMiL0vhf27gSHj3jkYRwec31jHcl7soGwooB7Gi/vtei69BHmQadc0pIfev994OHHCxnhuvNEsfB7wVXjoTExdRfcTZ7Dzx3TtwfjUHa9CAHJh4VuVmm2wow23UTOb2txRh2xi+idJLtABsMaNVtlWFxJiGvmKdEhJP2m7ZJVDKnuSGCnUsq9hOlBuDjOZ9jsh4eFMMlImOeQLHsDbP15xs9QoPkt7aeu80AE3xUSvk2UZPlfAuqEuJoH7GTP8l8s7Ry7a9NnyVvUxHNcrpAqZFjKYrBpXAVzd0ZqV57odinWg7mdp5Trxt+XXxY+3BpfUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 12:38:28 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 12:38:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Mar 2025 21:38:22 +0900
Message-Id: <D896TLG23DKY.1SRUB54QZ8THK@nvidia.com>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <gregkh@linuxfoundation.org>, <mcgrof@kernel.org>, <russ.weight@linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/5] gpu: nova-core: add initial driver stub
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <corbet@lwn.net>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <ajanulgu@redhat.com>,
 <lyude@redhat.com>, <pstanner@redhat.com>, <zhiw@nvidia.com>,
 <cjia@nvidia.com>, <jhubbard@nvidia.com>, <bskeggs@nvidia.com>,
 <acurrid@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-5-dakr@kernel.org>
In-Reply-To: <20250304173555.2496-5-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0288.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c3ec75-a20d-4d7f-262e-08dd5cabca81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2w2dmJQLzdZcWVVNHFISzRGVzNZUDU5ZWJ1WFJ1em5IRkpJbUNiajJPNGhr?=
 =?utf-8?B?U0hQL2tKbGFISndhRllvZjVINEIxei9GdkZzcFpYUnp2S1Rvdzg5WGhLMFY4?=
 =?utf-8?B?b0cvWjk3Nnh6T3BHRUhkR2dDMDVJWGxPM3pGQ3dnSU9OQ05obGxLTm5SYVJO?=
 =?utf-8?B?NERxSW45RUFZanp5bXZnSWFhNEprMFlubWUwYXhWaE1OTXFKRkZ0ZXZkcG5P?=
 =?utf-8?B?Z3k3S2pvZ3FsQlRyUTY5ekcwaGQyUFozbENidDUzSHUvYTdsZ2pDN1JKTnhk?=
 =?utf-8?B?M2NtL2RjRTFXWi9hTXdidDNnOU50bHJRQ05pZ2srWldLdVVDOExhSkxsYXo3?=
 =?utf-8?B?SGhnUFpBdklyd0dhN3hxQWtxTVBnZzdPQ0lEN2k0SjY4RzBJWXRQSTJ4eWdk?=
 =?utf-8?B?L2JwOVJzRjB4WnA4ak53MWN3RU1FckFoaFhsRXpRWk0xcmZRVTRrVFQvZ28z?=
 =?utf-8?B?Q0IyS2hja1NJck9zd3MvUHI0dXdSazZxOFd0NnM4KzJFMGhXb2xUUjU1VEZV?=
 =?utf-8?B?Qk5BSFJLSUE2d3lvMTMwbkhSaVpWOXp5RjBEdXpzZ2lhRXV4SkFjTmUyQWJ0?=
 =?utf-8?B?L1BYemludFlyeVZzL0loTFFyaVdabTR5K284cExRZmxGdjFrQ1kyUit6MlNW?=
 =?utf-8?B?dkZIWWpEVTFHaWFocXFZQUV6T2J1TGpvNUUwZU01VUNPSHJUK1hCVnNhNk9s?=
 =?utf-8?B?ZUlGRkczWGtDd2gwVmZQY1BlYnZPLys0RlUzVml5WFZ4ZjBGOUxxOS81UHNB?=
 =?utf-8?B?ZDZjRTE2dmJlbnBqUXo3Q0QrdmFEY0Vkb1FMNlgvNkdQendZSDZ2bmxHTUd1?=
 =?utf-8?B?RUhZOEZUV2c4cEt1c0FobnNvR1Zqb25NQ2xJWU0vZGJHemFydktLenBPYXEz?=
 =?utf-8?B?MDJRWTBGMDFWQjRHcnVJVzJ2UUF1RlMyRGZvNnRZUVNIK1BzUGl1bnFKalND?=
 =?utf-8?B?OENYdk9neDhDcG1mWjBtUC9KSDU2a1RJVGxRd2ZEbk04cGtFNG1UQm8yclVQ?=
 =?utf-8?B?RlNvYTBZVkZIcHlBc09hZzU3TWdpZDFHRURHalBmS0hsWUVPdlpZazVmRmkz?=
 =?utf-8?B?Qit0U1B6OUdXQlQ3QUp2WHdsM1lmS1BVTzVHRmdPaEV1cW52UG9rZktyTUUr?=
 =?utf-8?B?TUJzbUxYcjVYTHJVbVNVbDdlbDFSR0N1andoSDVhL0hBY0s0d2Vuck5ha2wv?=
 =?utf-8?B?UzVWYkpjU0RvZGUxNThmaGdaSTNPSWZUZEZjMTVCait0bzJKdUtjTGJSc3Rs?=
 =?utf-8?B?T0oyeEhmcFd6K0tWVjZrcTdMWWFHR3hXdFFSOG04MitpbUt6UWZNby9WWTJF?=
 =?utf-8?B?UWRzT0pRcWQrUXBSaHNleWRHbkM2RlY4WlBHWkl4M3RwNGNvQTBhY2xtYTlj?=
 =?utf-8?B?Wm1lcERPMGMxc0l2cndTS2M1QXJGcHdNczU4WkErWmorcDBqWGc0bHhmQzMv?=
 =?utf-8?B?TmN1dlBhRk5WbFJuczZoUnQzanF0VEQ3cnIvLzRjSmZkRFg4WFZvS0RxSWFJ?=
 =?utf-8?B?S3R1SS9BRlQxV1hHQUltZEV5Y01WVEdZMDJzdDEvQ01aMHJJNWtqemQ1Q2p4?=
 =?utf-8?B?YzBULzI5OXoxejFzVUhReEF1cGI0cldWRUQ5bHd3b0lrbnphVkxRSWFmSU9K?=
 =?utf-8?B?RTBQWW43L0VCdXN4TVNqL2dacU04cVNReEVxclA3Ums3SnhxeDZQS0NrbjhP?=
 =?utf-8?B?dFF5ZTNVY0REQUhweENleFNBK3JlK2xBQlhyRlZFRkpTREo0UFZ3T21ydVpV?=
 =?utf-8?B?cGxGdnorYTFYWjMrSWlWVWxKYUJlMVVpZWxZWkdtZmlxNUNFYjl3N1RTNzh0?=
 =?utf-8?B?NVlVdEhBQmtaaHRSVE5YSmV3NHJCeDhpelBVM3lWMlhOZ0NBRUNCUUJWT1VV?=
 =?utf-8?B?eHZZR09jSWJpNVhRSWxvT2FnbnM1MHVzellyTElMNmVwOWpuK2FwT2I0VG9N?=
 =?utf-8?Q?UcW0Y4wjeVQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmZ4RjVFeFlPWllDNUlwY1ZSa2ZaMHVoQzAzTVdwbXhHYWhoeGtSNFdQMXZ6?=
 =?utf-8?B?dHJGTFo1cnZEdkZrZ2Nhb1JEVjRyRkJnTW03RnJUVTZtWlplZVFZYXVvc0t6?=
 =?utf-8?B?MmJTVjZQYkRWNmxyT2hrVHBNdXoxNVNmcElLUXFHWlIvM1hmbStzUWR5NFJ3?=
 =?utf-8?B?WWpGQU85RWNiMkt5MjhYRDIzdkl2d1pOdHI5bU1uYmJDWDdIL2JnMXVyRER0?=
 =?utf-8?B?VzJIMFZiSm8xU01BemVmeWhkSlphVWNsTFBBVk5BSU10aFl3Z3BjRUpQdFh4?=
 =?utf-8?B?VktPeDQ5WGU3YzBRdUgrbXFqOHlwUHNoejZwenk1KzZvR3Z2VElLckRRZGU5?=
 =?utf-8?B?dS81c2s4NUhUQ0lBWkdQOGdIeW4zVnQwYlFjM1ZIQkZ5aVBIT3I0OXZCYkU3?=
 =?utf-8?B?QzVLc3dwUHFtQWhEMHR3WlVYK0dqdlk2NEFZT25vRmtzWEpjSnlmZlJ0R1R6?=
 =?utf-8?B?ak1RV1VqWVB6eW0zYi9yaDQyaWhYYkFLdFlMOFpMQnhKd0FZNjNZa1BwTVhP?=
 =?utf-8?B?QVEyQW5xaVdkL25nUCtoaWMxdVY3M2RwV3R5RjNEOVRjSkZxOHljM1VPNmZa?=
 =?utf-8?B?RUI4R1I4cDRodG8rTXd3U0dYekZ6b09HMWhac0hiRTFwUmhnQy9iSmI1bm1t?=
 =?utf-8?B?dWlreDUzdWJ0R3NTWVByZEhSU0hjbHJEL0tMcmR6NkVoRFdlWnhEcHpaZEFU?=
 =?utf-8?B?ODZvQXpEWkxxOW4vMEUzRHNkMktvczRTZk1uS2VuS3NhaXpPL0FLcnRYaTFD?=
 =?utf-8?B?SjhuQ2pLR3pZV05pM1pGK3o3cXVPME5HL0cxcUdFa2Z4NEZsSnR3R01MbVNG?=
 =?utf-8?B?V0pUZ3BBOVg5RzVNOTVVTG9EU2MwZnhoRXA5NGRIaEllZTVETTZtb1RDeGo4?=
 =?utf-8?B?dGxVTTlHejFtL3V4WHJ5K3kreGp4Qm90THdyc1lLSVdFSW9PKzVqaXZ0VGV3?=
 =?utf-8?B?TWEwaWhlQmtYVVVrQ0NNTkMzZzYzdXdneEt0MzZtWEZmdUpMOTA5d2ZZZWgw?=
 =?utf-8?B?bTVZZUlHN2xpbnBsb0JyRjNlb3NHSEkwVkJ6UCtqMU1wS3R4ZWIwSFdMUGJu?=
 =?utf-8?B?SUNUdXhQenAwdHJuUnduMEJYMXpGbWlDa2lqSzFQdHdpNlE2bWMxWWlPWlh2?=
 =?utf-8?B?eUZVU05tR0FuWnVyQ1dQK2E4MVpKdTBSaVhMbXhacHB5NWZuaHV5T0N2TXll?=
 =?utf-8?B?dWQ5czZGak11V0lDejNkUnR6MGo2Sjl1ZDBUQjZPbEk4UzhpS1Vzb3Yrd05t?=
 =?utf-8?B?cDBKY3pnRWJRZ0xMZTV6VDl1QWZqVUZuNlo3Z1ZxZ1JteHp5emhieUZVOGtZ?=
 =?utf-8?B?QUtCRzhEbzAwRjZkOWc5S0RQMDY0VjlHT1VtUm1QTVpPWmZKdHZML2psWnlq?=
 =?utf-8?B?SUlHUGNHSXdZOFZacHQ2MERqTzh2VTZ5VUJiNTdNMjFPVVdjR1lnS2xnS1BW?=
 =?utf-8?B?WHcwYXFJTkhxMS9manF5Qjd0YThXazNZNXdBMGxRU3ZNUFkvWVRjdDgyRmZD?=
 =?utf-8?B?d2RVRWkvbVVKUWlUNVoybUczd1ptTHo2bmI1ZUpzeVNydS81aFlnWjFkQVVG?=
 =?utf-8?B?QUVKc3lpY21WbXV1NzZGbVVDMWlMMElWdFEwbDhCSGNTNXRNdzBqUndySzF2?=
 =?utf-8?B?c2ljRmM5ZU5NWm50b2taWHVSS1JvaGF0cXpLNGwrRlNNTVF1STEwSW1CV25t?=
 =?utf-8?B?d1ZYVUNObU9FOWw1TWJSaGV4SVhhc2xtU2cwcGZIcG84aW42dlBZSlYrOVhi?=
 =?utf-8?B?S25VT1ZqMDVOOGJ0NGZrN0VwWFJVSUU1SnBDOG43UC92ZzVMQlV6aitzc0tt?=
 =?utf-8?B?bWNuTVN4TzdqazNTaEZzMFk5VDZhc2xaNDFiMjlieXMxQkpDVWQwY3gwaGZL?=
 =?utf-8?B?K0pLUVcrUnB0NERhTDFFZ2NhT3lMcUU3T05pRDJNTngrNDZzZ2lyZWtNZkc0?=
 =?utf-8?B?Z0J3MHpNV0xJYWQ2R2hxQlJNNUZVY3J5bktWSE0xcHBrU3kwVjZkQWtYc2s3?=
 =?utf-8?B?U1hBcTVZbGp4YllHM0RKS0FOQktQWU5sNU5veUFCYUMvK3F5cjBIRlpOTmdv?=
 =?utf-8?B?NmtoOHJOZE9JYzZodWFxYmRqbDRJSFUrNzAvVTNhSGJaV3dKWGRhaThTYWVj?=
 =?utf-8?Q?duAOz7LPu/O02LVYKjMRjhITF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c3ec75-a20d-4d7f-262e-08dd5cabca81
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 12:38:28.1261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUGeK6CkrkGAxFSNCT9Ak0whpCl4aV0RGrZ4GG+vRq4xatj6DZ8iV8jwefzTBuZbANO1FR6lQ21pB9Rye8RtWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254
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

On Wed Mar 5, 2025 at 2:34 AM JST, Danilo Krummrich wrote:
> Add the initial nova-core driver stub.
>
> nova-core is intended to serve as a common base for nova-drm (the
> corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
> hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.
>
> The Nova project, including nova-core and nova-drm, in the long term,
> is intended to serve as the successor of Nouveau for all GSP-based GPUs.
>
> The motivation for both, starting a successor project for Nouveau and
> doing so using the Rust programming language, is documented in detail
> through a previous post on the mailing list [1], an LWN article [2] and a
> talk from LPC '24.
>
> In order to avoid the chicken and egg problem to require a user to
> upstream Rust abstractions, but at the same time require the Rust
> abstractions to implement the driver, nova-core kicks off as a driver
> stub and is subsequently developed upstream.
>
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u=
 [1]
> Link: https://lwn.net/Articles/990736/ [2]
> Link: https://youtu.be/3Igmx28B3BQ?si=3DsBdSEer4tAPKGpOs [3]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

A couple of nits inline below, but feel free to add my

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

> ---
>  MAINTAINERS                        |  10 ++
>  drivers/gpu/Makefile               |   1 +
>  drivers/gpu/nova-core/Kconfig      |  14 ++
>  drivers/gpu/nova-core/Makefile     |   3 +
>  drivers/gpu/nova-core/driver.rs    |  47 +++++++
>  drivers/gpu/nova-core/firmware.rs  |  45 +++++++
>  drivers/gpu/nova-core/gpu.rs       | 199 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |  20 +++
>  drivers/gpu/nova-core/regs.rs      |  55 ++++++++
>  drivers/gpu/nova-core/util.rs      |  21 +++
>  drivers/video/Kconfig              |   1 +
>  11 files changed, 416 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/Kconfig
>  create mode 100644 drivers/gpu/nova-core/Makefile
>  create mode 100644 drivers/gpu/nova-core/driver.rs
>  create mode 100644 drivers/gpu/nova-core/firmware.rs
>  create mode 100644 drivers/gpu/nova-core/gpu.rs
>  create mode 100644 drivers/gpu/nova-core/nova_core.rs
>  create mode 100644 drivers/gpu/nova-core/regs.rs
>  create mode 100644 drivers/gpu/nova-core/util.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736dc2ee0..644817ccaa18 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7449,6 +7449,16 @@ T:	git https://gitlab.freedesktop.org/drm/nouveau.=
git
>  F:	drivers/gpu/drm/nouveau/
>  F:	include/uapi/drm/nouveau_drm.h
> =20
> +CORE DRIVER FOR NVIDIA GPUS [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +L:	nouveau@lists.freedesktop.org
> +S:	Supported
> +Q:	https://patchwork.freedesktop.org/project/nouveau/
> +B:	https://gitlab.freedesktop.org/drm/nova/-/issues
> +C:	irc://irc.oftc.net/nouveau
> +T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> +F:	drivers/gpu/nova-core/
> +
>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
>  M:	Stefan Mavrodiev <stefan@olimex.com>
>  S:	Maintained
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 8997f0096545..36a54d456630 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -5,3 +5,4 @@
>  obj-y			+=3D host1x/ drm/ vga/
>  obj-$(CONFIG_IMX_IPUV3_CORE)	+=3D ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)		+=3D trace/
> +obj-$(CONFIG_NOVA_CORE)		+=3D nova-core/
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> new file mode 100644
> index 000000000000..ad0c06756516
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -0,0 +1,14 @@
> +config NOVA_CORE
> +	tristate "Nova Core GPU driver"
> +	depends on PCI
> +	depends on RUST
> +	depends on RUST_FW_LOADER_ABSTRACTIONS
> +	default n
> +	help
> +	  Choose this if you want to build the Nova Core driver for Nvidia
> +	  GPUs based on the GPU System Processor (GSP). This is true for Turing
> +	  and later GPUs.
> +
> +	  This driver is work in progress and may not be functional.
> +
> +	  If M is selected, the module will be called nova_core.
> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makef=
ile
> new file mode 100644
> index 000000000000..2d78c50126e1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_NOVA_CORE) +=3D nova_core.o
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> new file mode 100644
> index 000000000000..63c19f140fbd
> --- /dev/null
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{bindings, c_str, pci, prelude::*};
> +
> +use crate::gpu::Gpu;
> +
> +#[pin_data]
> +pub(crate) struct NovaCore {
> +    #[pin]
> +    pub(crate) gpu: Gpu,
> +}
> +
> +const BAR0_SIZE: usize =3D 8;
> +pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> +
> +kernel::pci_device_table!(
> +    PCI_TABLE,
> +    MODULE_PCI_TABLE,
> +    <NovaCore as pci::Driver>::IdInfo,
> +    [(
> +        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings:=
:PCI_ANY_ID as _),
> +        ()
> +    )]
> +);
> +
> +impl pci::Driver for NovaCore {
> +    type IdInfo =3D ();
> +    const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
> +
> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin=
<KBox<Self>>> {
> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
> +
> +        pdev.enable_device_mem()?;
> +        pdev.set_master();
> +
> +        let bar =3D pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova=
-core/bar0"))?;
> +
> +        let this =3D KBox::pin_init(
> +            try_pin_init!(Self {
> +                gpu <- Gpu::new(pdev, bar)?,
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        Ok(this)
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> new file mode 100644
> index 000000000000..9de1399a2a69
> --- /dev/null
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::gpu;
> +use kernel::firmware;
> +
> +pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilde=
r<N>);
> +
> +impl<const N: usize> ModInfoBuilder<N> {
> +    const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
> +        let version =3D "535.113.01";

This should probably be a constant.

> +
> +        ModInfoBuilder(
> +            self.0
> +                .prepare()
> +                .push("nvidia/")
> +                .push(chipset)
> +                .push("/gsp/")
> +                .push(fw)
> +                .push("-")
> +                .push(version)
> +                .push(".bin"),
> +        )
> +    }
> +
> +    const fn make_entry_chipset(self, chipset: &str) -> Self {
> +        self.make_entry_file(chipset, "booter_load")
> +            .make_entry_file(chipset, "booter_unload")
> +            .make_entry_file(chipset, "bootloader")
> +            .make_entry_file(chipset, "gsp")
> +    }
> +
> +    pub(crate) const fn create(
> +        module_name: &'static kernel::str::CStr,
> +    ) -> firmware::ModInfoBuilder<N> {
> +        let mut this =3D Self(firmware::ModInfoBuilder::new(module_name)=
);
> +        let mut i =3D 0;
> +
> +        while i < gpu::Chipset::NAMES.len() {
> +            this =3D this.make_entry_chipset(gpu::Chipset::NAMES[i]);
> +            i +=3D 1;
> +        }
> +
> +        this.0
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> new file mode 100644
> index 000000000000..f57b7efa10f3
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude:=
:*, str::CString,
> +};
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +use crate::util;
> +use core::fmt;
> +
> +macro_rules! define_chipset {
> +    ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>
> +    {
> +        /// Enum representation of the GPU chipset.
> +        #[derive(fmt::Debug)]
> +        pub(crate) enum Chipset {
> +            $($variant =3D $value),*,
> +        }
> +
> +        impl Chipset {
> +            pub(crate) const ALL: &'static [Chipset] =3D &[
> +                $( Chipset::$variant, )*
> +            ];
> +
> +            pub(crate) const NAMES: [&str; Self::ALL.len()] =3D [
> +                $( util::const_bytes_to_str(
> +                        util::to_lowercase_bytes::<{ stringify!($variant=
).len() }>(
> +                            stringify!($variant)
> +                        ).as_slice()
> +                ), )*
> +            ];
> +        }
> +
> +        // TODO replace with something like derive(FromPrimitive)
> +        impl TryFrom<u32> for Chipset {
> +            type Error =3D kernel::error::Error;
> +
> +            fn try_from(value: u32) -> Result<Self, Self::Error> {
> +                match value {
> +                    $( $value =3D> Ok(Chipset::$variant), )*
> +                    _ =3D> Err(ENODEV),
> +                }
> +            }
> +        }
> +    }
> +}
> +
> +define_chipset!({
> +    // Turing
> +    TU102 =3D 0x162,
> +    TU104 =3D 0x164,
> +    TU106 =3D 0x166,
> +    TU117 =3D 0x167,
> +    TU116 =3D 0x168,
> +    // Ampere
> +    GA102 =3D 0x172,
> +    GA103 =3D 0x173,
> +    GA104 =3D 0x174,
> +    GA106 =3D 0x176,
> +    GA107 =3D 0x177,
> +    // Ada
> +    AD102 =3D 0x192,
> +    AD103 =3D 0x193,
> +    AD104 =3D 0x194,
> +    AD106 =3D 0x196,
> +    AD107 =3D 0x197,
> +});
> +
> +impl Chipset {
> +    pub(crate) fn arch(&self) -> Architecture {
> +        match self {
> +            Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self=
::TU116 =3D> {
> +                Architecture::Turing
> +            }
> +            Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self=
::GA107 =3D> {
> +                Architecture::Ampere
> +            }
> +            Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self=
::AD107 =3D> {
> +                Architecture::Ada
> +            }
> +        }
> +    }
> +}
> +
> +// TODO
> +//
> +// The resulting strings are used to generate firmware paths, hence the
> +// generated strings have to be stable.
> +//
> +// Hence, replace with something like strum_macros derive(Display).
> +//
> +// For now, redirect to fmt::Debug for convenience.
> +impl fmt::Display for Chipset {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(f, "{:?}", self)
> +    }
> +}
> +
> +/// Enum representation of the GPU generation.
> +#[derive(fmt::Debug)]
> +pub(crate) enum Architecture {
> +    Turing,
> +    Ampere,
> +    Ada,
> +}
> +
> +pub(crate) struct Revision {
> +    major: u8,
> +    minor: u8,
> +}
> +
> +impl Revision {
> +    fn from_boot0(boot0: regs::Boot0) -> Self {
> +        Self {
> +            major: boot0.major_rev(),
> +            minor: boot0.minor_rev(),
> +        }
> +    }
> +}
> +
> +impl fmt::Display for Revision {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(f, "{:x}.{:x}", self.major, self.minor)
> +    }
> +}
> +
> +/// Structure holding the metadata of the GPU.
> +pub(crate) struct Spec {
> +    chipset: Chipset,
> +    /// The revision of the chipset.
> +    revision: Revision,
> +}
> +
> +impl Spec {
> +    fn new(bar: &Devres<Bar0>) -> Result<Spec> {
> +        let bar =3D bar.try_access().ok_or(ENXIO)?;
> +        let boot0 =3D regs::Boot0::read(&bar);
> +
> +        Ok(Self {
> +            chipset: boot0.chipset().try_into()?,
> +            revision: Revision::from_boot0(boot0),
> +        })
> +    }
> +}
> +
> +/// Structure encapsulating the firmware blobs required for the GPU to o=
perate.
> +#[expect(dead_code)]
> +pub(crate) struct Firmware {
> +    booter_load: firmware::Firmware,
> +    booter_unload: firmware::Firmware,
> +    bootloader: firmware::Firmware,
> +    gsp: firmware::Firmware,
> +}
> +
> +impl Firmware {
> +    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmw=
are> {
> +        let mut chip_name =3D CString::try_from_fmt(fmt!("{}", spec.chip=
set))?;
> +        chip_name.make_ascii_lowercase();
> +
> +        let request =3D |name_| {
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip=
_name, name_, ver))
> +                .and_then(|path| firmware::Firmware::request(&path, dev)=
)
> +        };
> +
> +        Ok(Firmware {
> +            booter_load: request("booter_load")?,
> +            booter_unload: request("booter_unload")?,
> +            bootloader: request("bootloader")?,
> +            gsp: request("gsp")?,
> +        })
> +    }
> +}
> +
> +/// Structure holding the resources required to operate the GPU.
> +#[pin_data]
> +pub(crate) struct Gpu {
> +    spec: Spec,
> +    /// MMIO mapping of PCI BAR 0
> +    bar: Devres<Bar0>,
> +    fw: Firmware,
> +}
> +
> +impl Gpu {
> +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<i=
mpl PinInit<Self>> {
> +        let spec =3D Spec::new(&bar)?;
> +        let fw =3D Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
> +
> +        dev_info!(
> +            pdev.as_ref(),
> +            "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
> +            spec.chipset,
> +            spec.chipset.arch(),
> +            spec.revision
> +        );
> +
> +        Ok(pin_init!(Self { spec, bar, fw }))
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> new file mode 100644
> index 000000000000..a91cd924054b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Nova Core GPU Driver
> +
> +mod driver;
> +mod firmware;
> +mod gpu;
> +mod regs;
> +mod util;
> +
> +kernel::module_pci_driver! {
> +    type: driver::NovaCore,
> +    name: "NovaCore",
> +    author: "Danilo Krummrich",
> +    description: "Nova Core GPU driver",
> +    license: "GPL v2",
> +    firmware: [],
> +}
> +
> +kernel::module_firmware!(firmware::ModInfoBuilder);
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> new file mode 100644
> index 000000000000..50aefb150b0b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::driver::Bar0;
> +
> +// TODO
> +//
> +// Create register definitions via generic macros. See task "Generic reg=
ister
> +// abstraction" in Documentation/gpu/nova/core/todo.rst.
> +
> +const BOOT0_OFFSET: usize =3D 0x00000000;
> +
> +// 3:0 - chipset minor revision
> +const BOOT0_MINOR_REV_SHIFT: u8 =3D 0;
> +const BOOT0_MINOR_REV_MASK: u32 =3D 0x0000000f;
> +
> +// 7:4 - chipset major revision
> +const BOOT0_MAJOR_REV_SHIFT: u8 =3D 4;
> +const BOOT0_MAJOR_REV_MASK: u32 =3D 0x000000f0;
> +
> +// 23:20 - chipset implementation Identifier (depends on architecture)
> +const BOOT0_IMPL_SHIFT: u8 =3D 20;
> +const BOOT0_IMPL_MASK: u32 =3D 0x00f00000;
> +
> +// 28:24 - chipset architecture identifier
> +const BOOT0_ARCH_MASK: u32 =3D 0x1f000000;
> +
> +// 28:20 - chipset identifier (virtual register field combining BOOT0_IM=
PL and
> +//         BOOT0_ARCH)
> +const BOOT0_CHIPSET_SHIFT: u8 =3D BOOT0_IMPL_SHIFT;
> +const BOOT0_CHIPSET_MASK: u32 =3D BOOT0_IMPL_MASK | BOOT0_ARCH_MASK;
> +
> +#[derive(Copy, Clone)]
> +pub(crate) struct Boot0(u32);
> +
> +impl Boot0 {
> +    #[inline]
> +    pub(crate) fn read(bar: &Bar0) -> Self {
> +        Self(bar.readl(BOOT0_OFFSET))
> +    }
> +
> +    #[inline]
> +    pub(crate) fn chipset(&self) -> u32 {
> +        (self.0 & BOOT0_CHIPSET_MASK) >> BOOT0_CHIPSET_SHIFT
> +    }
> +
> +    #[inline]
> +    pub(crate) fn minor_rev(&self) -> u8 {
> +        ((self.0 & BOOT0_MINOR_REV_MASK) >> BOOT0_MINOR_REV_SHIFT) as u8
> +    }
> +
> +    #[inline]
> +    pub(crate) fn major_rev(&self) -> u8 {
> +        ((self.0 & BOOT0_MAJOR_REV_MASK) >> BOOT0_MAJOR_REV_SHIFT) as u8
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.r=
s
> new file mode 100644
> index 000000000000..332a64cfc6a9
> --- /dev/null
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; =
N] {
> +    let src =3D s.as_bytes();
> +    let mut dst =3D [0; N];
> +    let mut i =3D 0;
> +
> +    while i < src.len() && i < N {
> +        dst[i] =3D (src[i] as char).to_ascii_lowercase() as u8;
> +        i +=3D 1;
> +    }
> +
> +    dst
> +}
> +
> +pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
> +    match core::str::from_utf8(bytes) {
> +        Ok(string) =3D> string,
> +        Err(_) =3D> kernel::build_error!("Bytes are not valid UTF-8."),
> +    }
> +}

I guess these functions could be useful to other drivers and can maybe
be moved to a string utility module, but this can be done later too.

Thanks!
Alex.

