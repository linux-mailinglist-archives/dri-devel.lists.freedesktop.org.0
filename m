Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A18B1474B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 06:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E687610E5C2;
	Tue, 29 Jul 2025 04:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iSjTYxcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5334F10E5C2;
 Tue, 29 Jul 2025 04:34:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SldWPSECKKQxdlSaIvTEziFUUE/CEXbPZSBZfwn2DUitoNTSFisImbDbNBEH0FWSPgMTtCknJhDsYzP8Y0JaKEYpjjjpiexybCIl8/PypPBtdakGTlB886e7i3/B23HUIcNiPhRtsW6LPr/Eg+hWOl2yvoV14QN9P9BcfAEmzyUYdyKTpPlm7FpZ2FYTnxFbDuqx3qXB5ll+j/ZTFl02L83/DunBiPP7OxbE3Ph5iodn8oonbRUmKmeWjeeLl/Xyhh5RGTjKW0opWnE4qfUyjqxeKmujJt99PsWbo+wqJokWZ1z5yYBbWwVTA2D/O9qkzNMzFPlMWSNber2+WhrgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxBhMvqVnLShKpfXaGVQUrI9/L1pfgZ3CxPH0RJvPTU=;
 b=iFGbNngfbUzd6fMgRgPTuF9qwkzEdFunYTQ6oFQWxXzn6X5ZMme1Q6e79hkemJLyJU0CB0xmvz7AjkZagsKTnsO2dr0SnqcHZfae1Dg1EBxPa9qoV3S/Ei7LSj7R8aZTjmkn4oKmjEPCjxTdBq4wrkoIR9BlHySxdF2XwOMRwI4e2B/q2nv1hNP5uwko483tAlfaoE1SbQmj9c9MsiPTuMbGi8K20RJ9t7fBbOkyEpNwxnYl142Av2ezaQpWxk1WQOkcEsTeUmVuqIHTg5RDLTQdETBVMAxUujuel+xRRmMp/aumSnx834jsxAyOo87b2Uouy8I7XeY2iUHk9ou9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxBhMvqVnLShKpfXaGVQUrI9/L1pfgZ3CxPH0RJvPTU=;
 b=iSjTYxcqHwiwtoG1GtURzZBvhq8U/KuYmAmjj3EUvoyIg4VwlOTgWjsIsclG92/ubnn4yVrcMaIpldDXk6JplocwtTmzK1Pwk8j+ReC/4p86EyShWd3zrqFG/zZtPbDUNSrPrr8KfD29aw32tBcPizr2EFEDTi82VTSFDaTQibZZXdSDmOvkFnZMmPZ+doYkx1D9FD+gsyJk+xQb/A7F8KOws2zVgtlRdAtmyALyHz+XDeGnSW4SX37Xm04a8DPZV8PXWQaFn1TXteQmN3mG7rAde6hQc8vg/zr8eVSJwL8X+NPV9joE2uGJTz7hyI1EqFpJuAzxE6ns5mPN+MkrsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7798.namprd12.prod.outlook.com (2603:10b6:a03:4c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 04:34:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:34:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 13:34:08 +0900
Message-Id: <DBO9BTJ5Q8IM.2AY6DJQ9X9EIY@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: vbios: split out
 PmuLookupTableHeader from PmuLookupTable
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250727094903.20483-1-krakow20@gmail.com>
In-Reply-To: <20250727094903.20483-1-krakow20@gmail.com>
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0a7905-7464-4424-4bfc-08ddce592a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG80YThvVDNSbWttaTdzelNJYzdoYjdPblFLQnJLOSswRStVL25IUXpSNlNr?=
 =?utf-8?B?WTgwODNzV3NvZzh1ZzM3eXJTdGQxYmtabVY4SVgzVmZjMFdaR1J4ZmJYR3My?=
 =?utf-8?B?UFlqNnI1NnhWR1VIUXN0S3BlTTZCaWUzRzhDVFJ3S0RHVXlrbmdMcnFDRTZx?=
 =?utf-8?B?SGp2cys2RDZIeHZFb004ck5rTGFHTDg0WmhDM3pEdTBwcHdoOWM4LzlETWJ1?=
 =?utf-8?B?TVlTMnhsTnlFM0IwVk51Rm1hYjdDdUNVVTd3c0ZBSGNXN3poWjBIcURUTTVH?=
 =?utf-8?B?YTFpUFlDVFFZQ3dwZ1BFV0U3cjI3bVFWTmFuWlcvY0RSN2JkS1ZnUktaQ3ZY?=
 =?utf-8?B?TEJqRUVsT3B0YUplYlpJcVlUVkdObWJvV2JKRlViSVpQaHFIMGcxcjM4ODYy?=
 =?utf-8?B?dzh6V0txTlloZnZrRUR3aXZJNjdSa0d5eUFvYktWd0pxbVBjOUEwK1dNOGNP?=
 =?utf-8?B?dGxsRUFSODBJcXB2N2ZmVXdtYVd3dVFyTStDb3lNRlE1eEJ1UnMxOWZkdnhW?=
 =?utf-8?B?eGFYY1EydUtMVEc4ZlhncVVYblF3SThiUFA3SE9VYlZsTCtHazA4bVNzY0kv?=
 =?utf-8?B?ZHNQam9LcFBKM09KQm9XeWRqSnNkc0w0R2loTWJEcTRVTHNLV29uM2hxU2ZQ?=
 =?utf-8?B?bUxMYTN0QU5lYWlGUGNKQ1VhSS9rZ0g0RlBCdU52SFJuM2x5WmpZK0R6U1Nm?=
 =?utf-8?B?dHZNV1pQUTNYUUJydXdXSDlSUkRPdU1WZXc0K25NbkUvby93bVcweVFNVWp2?=
 =?utf-8?B?b252cGtVMWhsRUErb0FyK0xId2dSUkVuM1VEZGgyL2Zqc0Nwa3lxNUJjUmpI?=
 =?utf-8?B?TzMxZHpSYlo4VjNzNk1CVGxpbnpZanNvcmg2WmM5bnBSYVhJQXpYL2VLS1VZ?=
 =?utf-8?B?dFQ0L044ODdtUlBUQnJPSlVhS1g5NmtqcnJQdzU3RHJUZ2pFWlRuQmcwU2li?=
 =?utf-8?B?MFkzTEQrWmJpSHpVOVlBTGkvbVR4L2o2dmNEU1UzUDAyQzlEelRvdWJPb3JZ?=
 =?utf-8?B?b2VjTUpKTEhrTkVjaURLRExwakNtc3AwM245ckFYdklUeXc3VDBGcUZQVzJL?=
 =?utf-8?B?VW5YcE5wWFBwVjdzbm5wcG9Ta2VmVzQvZW5DdW94UjdhbTdUZGZtTnROakNj?=
 =?utf-8?B?QmwvbnNoOFFtY2RuZ3hGK20vLzBYa0pvb2FNUmdpVEN3azA3RzNoNjNUTG5j?=
 =?utf-8?B?d3psWWpNV2djeEtUVnZLK3RLSnl3ZmhhRnJHNUNxQlYwQ3VvdnlRcWtzNUto?=
 =?utf-8?B?UzAzSjBwYjVyRTc2YldsTGxlUmVwNVZqYmt0dkliT000Uk5wOS9IOEJOWUxv?=
 =?utf-8?B?V1VFRGY2ZXVZajN1bjBYZEQxUG1iWWJXcXJtWndmMjNwTllaeUJxU2pCZ1ZJ?=
 =?utf-8?B?MjhtY21uNERob2w5cnJnbkJTeDdJbVVLNjE4akZhc05iTENwUHhSamQ1Ykl0?=
 =?utf-8?B?SnZrNFhRMURIYnF1dEhLSXI3UEpkTnZoL3J2eEp3dG9MRXdxL293dGZ2VWEw?=
 =?utf-8?B?VTRjMHcyWDlMTW5RazFPSCtLV3BzUUN0SVlpZGNhRHJQVnVGU3pKSXI5Qkt0?=
 =?utf-8?B?dENsa3FEZ2dEeHA0TllKL0tkdlVxMklJbDMrbGorWTZZZFR5MjNOclNQVEw2?=
 =?utf-8?B?YUpnU2c4NE03ekxhM3d3amRHYkRnT2w4VlJWMFBOS3FSNjc3UGVLRXpiZWx5?=
 =?utf-8?B?R2tlMExZcFZmWjZMMkFtNlNzQ3Zvd2lLeEthdkdaY09EZCsrbG9CbGliVlor?=
 =?utf-8?B?R04vYWxWQ0dicEdHSTVrUGt3MlZIYVI2MHZtaFZqbkhEUHYvbFc1R0ZiSzEr?=
 =?utf-8?B?eVk0OWNhOXBQallnWWhUMVp0UFl5cXk1cjNVNVRyZlYyOVFmMk9DREcvVHNp?=
 =?utf-8?B?UmtjSklUMzFTTmZpWW1FZnhzbHFnRGNQTDBPa0NMbWtHNmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkhhSjRyOVcvSHEzYjExL2l5enYvQkl1RlowSHM2WGUwcmxkclhqelhoV0U2?=
 =?utf-8?B?OVVmZTFlVFovVzdWR1dNK285d0huM0c4ajk3WWV6dFBXVnpxSUhsa1Z4YXZy?=
 =?utf-8?B?Z3pqTGVYSU9SNm50UkNGVmhIaEZjL1ErU09vUlFkUGdTbVljL3ExZ05RNmV0?=
 =?utf-8?B?Q3F2M3pjbTJFYjBha05yM29wTkdQeXVwaE13eExHNFlFbzhVWjFSMlJ1MnFy?=
 =?utf-8?B?OWdPNGtVd3A4R2YxZXNUUXdmN3A1dkFWeWY5bHVSbVByVnlHRDQzNERTb0Uy?=
 =?utf-8?B?enVNN3h4UUxNcHQwWDFxWVBucWMyTWtzNE5sOGl6YzI4SFhidTdtRXZERGND?=
 =?utf-8?B?d3lVb2g1bUtubDhxaENDSXVLeDRuSEt6SVB5N1RRb1Mxa1RmM2xhZGZjVDJK?=
 =?utf-8?B?S081YUk1WElhdjVzTXVUaFVSRjMwdjlLWU1PQzNGSFo2dGFYMVFYZ2Z4SERj?=
 =?utf-8?B?Q292Q3FBUmUrbk1BYXE5ZlBxa2JUYW1CaEZ0MHVaSFkxSDJvWk5nMWpoMXVs?=
 =?utf-8?B?aUJaVGJFNjBIQ1g4ZmZNQmZ1YUpvb1RhVDgxRG9OZ1BCdzl1RFZNeDZLaDh2?=
 =?utf-8?B?Q29XNjhnelRKcXJoR01kYS9JMENFMktJS09FSFhHdGl1RGMrTEFBS1k3ZkZq?=
 =?utf-8?B?VjExQWQvRW5HSy84VzZUcE9UV2h5NU54dllUY0lob3RSVU5FTXhuUFNiVk1T?=
 =?utf-8?B?eVlHN3pFK1hpK1ZvbDJON0JmTWRFeXVMMS8rSmkwVTB6NWJibGtlNFZIeDF5?=
 =?utf-8?B?dXE4bzNkcHRFNnFyeFNpemZ0MGZGYlZLckxFaXV3b0F1S1Bvczk1WXY2UVJC?=
 =?utf-8?B?d0dXZlN6VTlUSU1UdDBkWmpUU2JwaGhnRXNRdkg5K2xIWEhqbmJ4QTBmTUxz?=
 =?utf-8?B?RVlheEczVGN2RVlFMFJSajNoUVJTVHRqMlNXYTk5VzRkODBtdThjU0ErbXpr?=
 =?utf-8?B?OThUTi9WMjNOZm45S2d5S1o5TFVCL0k0RjV2cnJUdVhidlVGaTIzQjk0SGgw?=
 =?utf-8?B?NXFTOURLUERqcTg2eStQNlVYQ25xSkVtRFEydkNFV0w3WGc3T0lqTGRCTlRM?=
 =?utf-8?B?MmptN1NMZUJOUUpwdEM3eHBEekJNRXU4d1pKSlNEZVNOSlpTWFYxUFBzZTZJ?=
 =?utf-8?B?WVhYN0VDell4aW5YenVyM2lmeC80MjA5bHQvdnBPQTJjd05LMnd4ZmVvZTBq?=
 =?utf-8?B?ZzNGWGFmL1hyeXpiVlVLZTVsL0RkSXByQTFGa1ZHaXliQWNML3JlSUJ5VmtH?=
 =?utf-8?B?b3JVd05vL2pGSlB5ZndCOHVvSTJqNmtwRCs5eGxveEpVRStNUmVneTlKNzBz?=
 =?utf-8?B?S3dvdEI5N1BXdmkzME5KK2xxelhBNExXUFY2NXFOaVdYRjhBTmhHMzc2WDdI?=
 =?utf-8?B?RUNOejcwekJSUXM5bG10a29hQjRJRENjU3BYaWt4SUxPT3EreUNuQ0Erc3Jw?=
 =?utf-8?B?U25WcnU0M1hQVHRtYit2RUZRSG9tbjJudnRVRzV6WE5sTnFmWHVtVXJKOGJV?=
 =?utf-8?B?aTZSbWdkc3QzdUJ1cnlDdS9WeU9lTFdEM2MrQVg5VnhpU29wSEZLWmVGdThW?=
 =?utf-8?B?UzcxRzVUdXhoOGdHOGFKK2tpbkpPR1VQbU1BWCtGRVhWSk50cDFtbmoxM3Zm?=
 =?utf-8?B?ZnNrK0NBRnV1MURjTVJEeXVNL21VenY4eUw1aHZmTXNzeGUyYkU2b1VVRWdp?=
 =?utf-8?B?RFJ2cTlacFZRRHdvcGRpN0doaFBOTWc2bXlxTGRKaHZpZnBPZFhkUFhEMEQv?=
 =?utf-8?B?SXJvb0xwUlZDcWV0Z1FRWU1GYUhZeGNna3ZEN25HM2pmQ1VUV0Jma1VUN2pS?=
 =?utf-8?B?WXVjU0JBeDJJbm9jWjBrK2NQdmN4Z1MrdEhyY2ZZWTRhbTloVjNLaHZ2TXVy?=
 =?utf-8?B?SzZpNWxkbEs3N0F0d1YxU1IxUW5UVFVSSCsxaHhSN3gxZTk2eVltRjZQYVBp?=
 =?utf-8?B?LzNPODRYVUZuTVFRb0lRZ0RORGlzdHgxcVRZdGVQa3RRVmcxemo4b0w1RkZU?=
 =?utf-8?B?Tm9LK2Q1Z1V0QzFxb29BbVgvTkM3SWZBOERLUkpoWkYraERSdWczOVFJLzBw?=
 =?utf-8?B?SEppUk83RWxMbzZuNEtOeFpXN0RKR2djWkthVHZLUmdHOU1JL0NENXF2UFpK?=
 =?utf-8?B?SHh3ajY4YlVXcWtoY2lIaVNsRHJKdnZBaUVYR3RBVlhVZ0RrY0tNd2FIZkpP?=
 =?utf-8?Q?SUFzUSi24SQE1cHUCmtwDwozKcrsrFYHVkBiQbOOt+7f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0a7905-7464-4424-4bfc-08ddce592a33
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:34:11.5208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHCnm2R0jg+qi7o8Jfds5OuOJKOp9VxUi6MoWmHcKRuud0/Irb7glQKe2qnS+ZZMpNmh1h+mTAJdOU3AbDx6CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7798
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

On Sun Jul 27, 2025 at 6:48 PM JST, Rhys Lloyd wrote:
> Separating the header allows the use of `size_of::<PmuLookupTableHeader>(=
)`
> instead of the magic number 4.
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 56 +++++++++++++++++++++-------------
>  1 file changed, 35 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index 5b5d9f38cbb3..a77d7a4c8595 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -889,6 +889,32 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
>      }
>  }
> =20
> +/// The [`PmuLookupTableHeader`] structure is header information for [`P=
muLookupTable`].
> +///
> +/// See the [`PmuLookupTable`] description for more information.
> +#[expect(dead_code)]
> +struct PmuLookupTableHeader {
> +    version: u8,
> +    header_len: u8,
> +    entry_len: u8,
> +    entry_count: u8,
> +}
> +
> +impl PmuLookupTableHeader {
> +    fn new(data: &[u8]) -> Result<Self> {
> +        if data.len() < core::mem::size_of::<Self>() {

We cannot rely on `size_of::<Self>` to be 4 if `Self` is not
`#[repr(C)]`. Since this is done in the second patch, I'd merge these
two into a single one for simplicity.

