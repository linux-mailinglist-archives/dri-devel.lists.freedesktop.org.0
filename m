Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF8AD7313
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B520910E85C;
	Thu, 12 Jun 2025 14:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z2pHncbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE58010E859;
 Thu, 12 Jun 2025 14:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vsz3VxgI+11h+pusJ5Sx52cF7n3EOktk5GsaVKvyp8s9Etgxv6GKnkvm1vG0lTGbtG948fwLjxPbnYXcUJSOJVCjAuQukDyGUCCIIKOg4dpE60vWyY0mhNaCSUchiWdbTEXEbisvEYfccMaTR8mtYsgc6PIe6DNEjqL+BCs/KUCPDLjEPPPJfqjQEo0Z+qc8SoYsDngeYzWoju7Ggwf7ABBkueedw9EExcjArAb5oS8qr7TK0mytfqCm+5LXdIP+d9elmAml2myPSDSuFiziByVkXBuF7QnW2ufjah+km0GgWrYrOBSOK5t0BunCWdVpjvOCNPjpyX6PoqcomJRVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHxHbvbWaYrErMIaSLTVS1clfHN06I5HbOcPi66j7Ns=;
 b=lF9LadLr+YkBycHhiIXKBJ+ovIUco1opvZL7tktn5KDJwjT4FVSFRMVA+YFh249RIaoTvfHU0yCpaP9pBldrpw4zvSdG+xH64KsMlX0BitnMHVL9KIpRKI4qp9EhDq+1yus/19JLncO/1xzKW2PUR4PnORqV6okTy7jUhC2RX8cdbJR+2lv08iIB5DmcTnEH6/5+ZU/8GYzAq7ZAx6woRmCU/6jLklt5OjuoS09tuLuckHzFdV0RSfg9lyFHYDOcol5O+xSp7zetGw3Y5bLmOdLe70/r62A6xWjHATcjN0qGMrbXelPSkVdtIhMv7QNoTVk2EbgYAlgcNZGmfx1xHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHxHbvbWaYrErMIaSLTVS1clfHN06I5HbOcPi66j7Ns=;
 b=Z2pHncbqvC/B+UJHGohvK/P+U22J09/UzynxWdqj+OW8N8MAfopF+CpaUQm7wjcPcI8VcBJH6CzrKkojjg4h0aqxeEzEmKWv0EBt84X0j69S+6Ox55Td2WeNnXR3knpG3F9ZHPFdKMT3Cv2YQSwQYIQVL2ysu3Ybg5I7zfY3Q9+uhawGiGtmp2UmwgCXZGT6/LNkAKbUgcaXFggLz1slnbl0KVUKawWSSdhlZD5cukqSSbF5RHsOiWxwL8J+wj0mSFJKAhKJ5PZwTNmklKYbO7w8PlJxe7UlCxMlhNjqrwoH3fw/kF33xHHtew1wM1K7tIuY5ft3H+IrAGOzvmSHxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Thu, 12 Jun
 2025 14:03:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 14:03:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Jun 2025 23:01:47 +0900
Subject: [PATCH v5 19/23] gpu: nova-core: vbios: Add support for FWSEC
 ucode extraction
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-nova-frts-v5-19-14ba7eaf166b@nvidia.com>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: d396d77c-3b60-4349-c56a-08dda9b9eb8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVhzMjlTbWoyRVZsa3BvYm1KMVAwMDVYUkt6bzFpZnJVMDMvNHNtQThKei9U?=
 =?utf-8?B?eXhJRGZHandBUXRGK0NHdWRXQzdnelBJOTFsSTJKeVl2dHREZGVMbGZxUkpP?=
 =?utf-8?B?dTdhNnpIZzVDYnRqaXVyam9tekxFMWM1cHlTVFJiOGc1eHVaV0J2dFgrNnZH?=
 =?utf-8?B?MzBXZ3F0ckV2SzM0ZEMra2dBc3BPb3ZQeEd0Mkt5TWVkYVlvM1dnamtDV0Vt?=
 =?utf-8?B?MDZKU3h4MjJybjBxMVlmMWo5Z2txSld5OUdSandWREdrVXp6NHRSVzhhZEZZ?=
 =?utf-8?B?MmZWOGdaZ0ZUK3h0bDc3UWdVOEtjWXRFTVl1c29ra05vQnFFcFpJckJaSkFT?=
 =?utf-8?B?Q0hvN1pOdGc5bDYyLzErQmxNUjNHdU5mcFo2WERreTR2aXRWYTNzYlFKcTI4?=
 =?utf-8?B?RGxNb1E1SzJrQ0Q2a3BnakFtaEVBdWtxWDRkd3ZmOXJDamJ5ZGQwM3BaTWpr?=
 =?utf-8?B?dUMwb3dPVWNGMmdxbHVQNjQ3YThUSGJFcHlmOHJ1bzNrb3hKbXJ5VWt5Umcv?=
 =?utf-8?B?aWRQZVhQWnR0RXpwenB0RUJPOFhEd0VaVWdCNnBDL3FGeVB1QVFKTmZvWkxX?=
 =?utf-8?B?QXBBYmdYQUx6alFVNHo1MzFZemR1SG8wdTVveG4rUExucDFsSTlCeUtOL0t5?=
 =?utf-8?B?bVZIK05zWTFSdUpDa1dZK1pDa1JQYklYbHRUZitEeVMyOVpNUThyUzlpeXAw?=
 =?utf-8?B?Q1dnbWM4VHIxK05jYTNseGwxSk00VUk3WUwyYkZMVVoyTzVQblVLWjc3Z3Ry?=
 =?utf-8?B?d0s3UkFibWJ2bWNnS3FxN1IwTm55ZDJBUzI1WEk1UDRCd3RSaUExSzBtWGhk?=
 =?utf-8?B?K2tMd3IyVUFPNUp5anJEWU1xeVVsMHZhWGR2VzFaVm9HN1k2MUxyc1IzT3ZM?=
 =?utf-8?B?U3ExcFg3TmpTNVoxaFdOY3l0cndzYmVzV2VPTys1T2gwaEhKU3MxVW5KcDUx?=
 =?utf-8?B?bit6VnpKbnZ5cmszb1BlOU5OQXA5ZWtzNjRLQytKeUdMYjlEeUh0QmNWaW9y?=
 =?utf-8?B?NzN0R09TNHNQSkxleU9mVkZyeURlYVd1QjhidnBwWFA4b0tKS0JXNUw4UVF1?=
 =?utf-8?B?RFNBY2hIM2RWcjN1Vy9RanZVdU9tdEZpM1d5WjQ3RGsvVWdIalJqOStTdTJv?=
 =?utf-8?B?UEJHYVhET1ZMNkFFVm93SW45Tk5oWDRNT09FRithVlB5ajhHVWlLdDVtdENq?=
 =?utf-8?B?MWIrS05kNEVxSEFkcWlHVjk3U1J3d3ZqdHVsMXZxMjg3YUNGTmo4aVRGbGZo?=
 =?utf-8?B?a3krY2lhbXZ4cFpYbnRaSVdRYWpKVWxzcTVDcnNXSkozRTBQVUdTUFJ0NndI?=
 =?utf-8?B?OEd3dGNNSFUzTTNNclAvN1B4UE5oY0F6WHFlU0c1dTdNUDc1RGZuUHA2YU5D?=
 =?utf-8?B?dEVTYXJiNkJWMVdoYXgwN2tyM2ViZmhLdzl5WXVaNVR3MENkakxPNnhkNVBV?=
 =?utf-8?B?djlHTCt1RzgrdUI1dUxiWVltL0dKZHBlZzN3ZDlqUUs1aTZGV2VGV2pxQ1Jj?=
 =?utf-8?B?enhYSGpMSEVoMlBTSDIrbzRjV2pvZ0VKdGpoQWZrS0ovWDRWaUFheDNiZ0Rk?=
 =?utf-8?B?d1pJUjc1N1RwYStZdUN6SzZ2ejBROHBPRVdTRCtKcExacm1qU0tpQnluaHR2?=
 =?utf-8?B?eFM3dGtTWVVpQ3FkNHA4MGMxU1dpa3M1NFp0L256VWdBeEhuT2gxU25WR1JI?=
 =?utf-8?B?SHpZM1Z4S2ZMSFZLSk1qYkpMOHJDVEFYS0RjVTN2aGJHeWV0WGZLemdyNXZu?=
 =?utf-8?B?ZEhWSlBHQlJIZUNYWE8wVjB3TERkVVh4a0M4cjVpdEdWZTlFTEhtZFlXNzB4?=
 =?utf-8?B?c1Jjd0NqZm4zVEFZZGRqSHU4QkhuTkJLdkNvRHlpWHE0UWhKUmJRVTJxOSs2?=
 =?utf-8?B?WkJIWHZQdnhrSUNvTDQwNzhSb2RQRWFwYkJxLzUwYUwwcmVLMlZSUWhHTUVk?=
 =?utf-8?B?eGwxaCtmTUJseEtBTC84TzVheWhYR211YmNBUlh6R2dtMGkrRXlVazNEMHh0?=
 =?utf-8?B?M3M4ZmZFYnRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0hLaHdGTjhZV0pIdm9pSWdHY29OV240N0txZlkxd2RLTk5FTTV0L1Y4NXI0?=
 =?utf-8?B?VnVBcm80em41Y1hjQnpUWWxGZXhzdGI1Ym9qSEVXY1VLNmhRZkpNVG9zRHBo?=
 =?utf-8?B?MldvcW42eU1KZm1QYzFBMGJKWk96b2J2ekE0eXF4OTFKckdvU0xualU5ZWZG?=
 =?utf-8?B?WldCcTJhZHVYS3plYU1kc1ZhMEQxWXdkaG9NMWMrOVNYbUdiK1RHeWRGYWpJ?=
 =?utf-8?B?Tk5LeHNOejBxa1VDbjFEM01hMkRPUzdwREFtN2pUdmhNNisrRnUxTXRyN1BC?=
 =?utf-8?B?RVB6SVhVK2t1aTcxSDdqRDRXaFd3S3FkdDdNNDU5SHZFNERHZEhiNFhaL1dQ?=
 =?utf-8?B?NE4rYlRtQUVqenNVcEEzWlB4d0FLLzRHUGk3Y1RjNGR5WnBnMGxKS0U3WERi?=
 =?utf-8?B?ZVdrRmI1VThHN0xpOGN5Sjd4TU5oWmFZMW5YSTU1bEcxQ2xZUkZoNFMvOCtm?=
 =?utf-8?B?bVYxbmJDYXkvSmZIeXB0QkM3clI2MmtzelJzd2haMlJjV3ZWUUM1TXUwTGsy?=
 =?utf-8?B?akV1cGc3bmp1NTRDS2dEZGVOL1VEams0U2U4Z2JMSkR2VkdrZkRKZG0yZzlX?=
 =?utf-8?B?eTJJeXgyYUVKdzJDVXZXcVdlWXVJY1V0STdaWlhDZjExMDc0REpkbFJtclhP?=
 =?utf-8?B?QUdkLys3cTNWS29DN05IelJTSlp5eHozWnN3aUZSSGtKbW1uZmdCRHJXZXVh?=
 =?utf-8?B?VFkvb3dMVWx6SjA3UnEyQkVXWi9QbmVCdm1ZRUw0L2g2cW9zM1RKZVVYOHR3?=
 =?utf-8?B?eG85RTl6TTRNejl5N0d5MVRFSzNnam1RK0hkd1RWMndrcEZaK2cyemdSMFN4?=
 =?utf-8?B?K20wMXA1S2d2MEl4SG5CaTJrTlFnNjlkVnNtUW9pbjVIdnplb3hDWUV2OXVL?=
 =?utf-8?B?aWRhaCtJc0I3MDI1K2dTMlZZdzdZcldJOXdtKzMzcVBJZFBGcFBKRFZzamdV?=
 =?utf-8?B?YWJJTmdKK1MzVDdKUXR5YWZvUnlqYUVyaDN1K1Z2WjltVmNVRllYQytkWkdy?=
 =?utf-8?B?RXdCYWJteGNlN3UyVVNybVVna0NHQVdJUmJqYlB1alNXUkFFd2hVTFBNTUNB?=
 =?utf-8?B?d2VWbnIxL05qa25kS2p6M0N4NkNjQ1l2cTFmT3hoQ1Mzd2lLcHZWTHhnMUVP?=
 =?utf-8?B?S3cwRUpldDZLVm13ZzJ5VmRHbUlXK2x5VTk4ZjJkQ1A0MzYvVVdjZ2toejkx?=
 =?utf-8?B?VDQ2dEd3anZ4SlZhc211cVRJUmFwaTh5K0dvblF3Yjl6SXhWY1pQN1JDWUN0?=
 =?utf-8?B?YVVhSXQ5akhPM1hkTXQ4UHgrV1R0bURJUDY4T0JrNVZBMmRuRS94d01UZVA1?=
 =?utf-8?B?dTNWQ2l3UmxYaVFaUFIyN29TdEtXNEdJeGZ3VUhtS1NOZGtsUGN5V0dEQW0x?=
 =?utf-8?B?ZDZDb2l4MVFtSkwyMkVwQmhsS3ljY1krd2hGWnU1K1djQzJ3UzJtTU9FeVBz?=
 =?utf-8?B?blNDRTRzNmJveUZTY2xWQ2doQkJqM1pmZGhueGplRVB2TzBadGE1Q2hQL1lR?=
 =?utf-8?B?STdONjI2N2RkaTFIa282YmpYbG40alY2MDFHdFRsRXlsUHEvSXErUWJSb3Vl?=
 =?utf-8?B?UDM5M1RYRWdXaXgwdkZTSWlGNnF2K1haODY0TnZuZDVyL3RmWGhKa2ZycWYr?=
 =?utf-8?B?YTEvOXlDQnlFK1VnR1MzbEl6clFURERKRzVBTEZuRnpIYWdzN0RQNHVkTnlU?=
 =?utf-8?B?czRhOVNzN29Td1hyQ2FLcjVEK3Q1YnNZMUJ2aWhYeFFsZERXUkNycWRtQkNa?=
 =?utf-8?B?UWE2alpGdmg3aHkrK0VkTEptZmhtczVrQk9zVFhNRk5yY0R0MFpsZkx5NFJ1?=
 =?utf-8?B?ZEhYdmY3Tk9FSm1NS1NxMVl1RFpVdHRmdFFiWVo1UzZDdEN5SWlPd2ZxN1oy?=
 =?utf-8?B?WFdkWTJzUkhtcUg4UTR0Y29QQ3BqYTJUUEYzT0hXU1F4WFhhS1lzanRhUEFJ?=
 =?utf-8?B?SDhhVU84M2lUam55bEtsNGIyakd0NjhpMVVCN2pMcHM3dVJHSHRPNktaZERs?=
 =?utf-8?B?cXNTOFordUcxMnJNdUxndFNYenV5dDZMS0I5WkIzSEx4VUorbUNXQ0l0cERQ?=
 =?utf-8?B?clhsSENZc0dHZDdPaWhicndLMk9LTlA0YmJwS1Y3c010ZWt4cHAxMG55MUpJ?=
 =?utf-8?B?MHZ0NE5PdHpQdDB4MWJqTllBandBUFJtb3lXOSs5RkRlNE45aEJSME1ZSTAy?=
 =?utf-8?Q?qfmwy5gBa/R4WcU6BvmQ+XABueArPNwq4eCQq5XSYjCX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d396d77c-3b60-4349-c56a-08dda9b9eb8f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 14:03:34.4273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSeZJEDODtzWiTckHpsllNloOqQ25mOgLm5kiGcJsV0EIprg7Xym2icxxPMnWJCMLdTJ78G4h40Txa2nojdyKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Using the support for navigating the VBIOS, add support to extract vBIOS
ucode data required for GSP to boot. The main data extracted from the
vBIOS is the FWSEC-FRTS firmware which runs on the GSP processor. This
firmware runs in high secure mode, and sets up the WPR2 (Write protected
region) before the Booter runs on the SEC2 processor.

Tested on my Ampere GA102 and boot is successful.

[applied changes by Alex Courbot for fwsec signatures]
[acourbot@nvidia.com: remove now-unneeded Devres acquisition]

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Shirish Baskaran <sbaskaran@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |   2 -
 drivers/gpu/nova-core/vbios.rs    | 307 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 298 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 41f43a729ad3bf2c4acb6108f41e0905a6fac0df..e5583925cb3b4353b521c68175f8cf0c2d6ce830 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -44,7 +44,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
-#[allow(dead_code)] // Temporary, will be removed in later patch.
 pub(crate) struct FalconUCodeDescV3 {
     /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
     hdr: u32,
@@ -77,7 +76,6 @@ pub(crate) struct FalconUCodeDescV3 {
 
 impl FalconUCodeDescV3 {
     /// Returns the size in bytes of the header.
-    #[expect(dead_code)] // Temporary, will be removed in later patch.
     pub(crate) fn size(&self) -> usize {
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 312caf82d14588e21e0fa2bae0f8954d0efe3479..032ee510646af21f26f3f46c2d54a0f812c25978 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -6,7 +6,9 @@
 #![expect(dead_code)]
 
 use crate::driver::Bar0;
+use crate::firmware::FalconUCodeDescV3;
 use core::convert::TryFrom;
+use kernel::device;
 use kernel::error::Result;
 use kernel::num::PowerOfTwo;
 use kernel::pci;
@@ -192,8 +194,8 @@ impl Vbios {
     pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
         // Images to extract from iteration
         let mut pci_at_image: Option<PciAtBiosImage> = None;
-        let mut first_fwsec_image: Option<FwSecBiosImage> = None;
-        let mut second_fwsec_image: Option<FwSecBiosImage> = None;
+        let mut first_fwsec_image: Option<FwSecBiosBuilder> = None;
+        let mut second_fwsec_image: Option<FwSecBiosBuilder> = None;
 
         // Parse all VBIOS images in the ROM
         for image_result in VbiosIterator::new(pdev, bar0)? {
@@ -227,12 +229,14 @@ pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
         }
 
         // Using all the images, setup the falcon data pointer in Fwsec.
-        // These are temporarily unused images and will be used in later patches.
-        if let (Some(second), Some(_first), Some(_pci_at)) =
+        if let (Some(mut second), Some(first), Some(pci_at)) =
             (second_fwsec_image, first_fwsec_image, pci_at_image)
         {
+            second
+                .setup_falcon_data(pdev, &pci_at, &first)
+                .inspect_err(|e| dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e))?;
             Ok(Vbios {
-                fwsec_image: second,
+                fwsec_image: second.build(pdev)?,
             })
         } else {
             dev_err!(
@@ -242,6 +246,10 @@ pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
             Err(EINVAL)
         }
     }
+
+    pub(crate) fn fwsec_image(&self) -> &FwSecBiosImage {
+        &self.fwsec_image
+    }
 }
 
 /// PCI Data Structure as defined in PCI Firmware Specification
@@ -675,7 +683,7 @@ fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
     PciAt: PciAtBiosImage,   // PCI-AT compatible BIOS image
     Efi: EfiBiosImage,       // EFI (Extensible Firmware Interface)
     Nbsi: NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
-    FwSec: FwSecBiosImage,   // FWSEC (Firmware Security)
+    FwSec: FwSecBiosBuilder, // FWSEC (Firmware Security)
 }
 
 struct PciAtBiosImage {
@@ -694,9 +702,24 @@ struct NbsiBiosImage {
     // NBSI-specific fields can be added here in the future.
 }
 
-struct FwSecBiosImage {
+struct FwSecBiosBuilder {
     base: BiosImageBase,
-    // FWSEC-specific fields can be added here in the future.
+    /// These are temporary fields that are used during the construction of
+    /// the FwSecBiosBuilder. Once FwSecBiosBuilder is constructed, the
+    /// falcon_ucode_offset will be copied into a new FwSecBiosImage.
+    ///
+    /// The offset of the Falcon data from the start of Fwsec image
+    falcon_data_offset: Option<usize>,
+    /// The PmuLookupTable starts at the offset of the falcon data pointer
+    pmu_lookup_table: Option<PmuLookupTable>,
+    /// The offset of the Falcon ucode
+    falcon_ucode_offset: Option<usize>,
+}
+
+pub(crate) struct FwSecBiosImage {
+    base: BiosImageBase,
+    /// The offset of the Falcon ucode
+    falcon_ucode_offset: usize,
 }
 
 // Convert from BiosImageBase to BiosImage
@@ -708,7 +731,12 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
             0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
             0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
             0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
-            0xE0 => Ok(BiosImage::FwSec(FwSecBiosImage { base })),
+            0xE0 => Ok(BiosImage::FwSec(FwSecBiosBuilder {
+                base,
+                falcon_data_offset: None,
+                pmu_lookup_table: None,
+                falcon_ucode_offset: None,
+            })),
             _ => Err(EINVAL),
         }
     }
@@ -854,3 +882,264 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
         })
     }
 }
+
+/// The PmuLookupTableEntry structure is a single entry in the PmuLookupTable.
+/// See the PmuLookupTable description for more information.
+#[expect(dead_code)]
+struct PmuLookupTableEntry {
+    application_id: u8,
+    target_id: u8,
+    data: u32,
+}
+
+impl PmuLookupTableEntry {
+    fn new(data: &[u8]) -> Result<Self> {
+        if data.len() < 5 {
+            return Err(EINVAL);
+        }
+
+        Ok(PmuLookupTableEntry {
+            application_id: data[0],
+            target_id: data[1],
+            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
+        })
+    }
+}
+
+/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
+/// for a given application ID. The table of entries is pointed to by the falcon
+/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
+#[expect(dead_code)]
+struct PmuLookupTable {
+    version: u8,
+    header_len: u8,
+    entry_len: u8,
+    entry_count: u8,
+    table_data: KVec<u8>,
+}
+
+impl PmuLookupTable {
+    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
+        if data.len() < 4 {
+            return Err(EINVAL);
+        }
+
+        let header_len = data[1] as usize;
+        let entry_len = data[2] as usize;
+        let entry_count = data[3] as usize;
+
+        let required_bytes = header_len + (entry_count * entry_len);
+
+        if data.len() < required_bytes {
+            dev_err!(
+                pdev.as_ref(),
+                "PmuLookupTable data length less than required\n"
+            );
+            return Err(EINVAL);
+        }
+
+        // Create a copy of only the table data
+        let table_data = {
+            let mut ret = KVec::new();
+            ret.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;
+            ret
+        };
+
+        // Debug logging of entries (dumps the table data to dmesg)
+        for i in (header_len..required_bytes).step_by(entry_len) {
+            dev_dbg!(
+                pdev.as_ref(),
+                "PMU entry: {:02x?}\n",
+                &data[i..][..entry_len]
+            );
+        }
+
+        Ok(PmuLookupTable {
+            version: data[0],
+            header_len: header_len as u8,
+            entry_len: entry_len as u8,
+            entry_count: entry_count as u8,
+            table_data,
+        })
+    }
+
+    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
+        if idx >= self.entry_count {
+            return Err(EINVAL);
+        }
+
+        let index = (idx as usize) * self.entry_len as usize;
+        PmuLookupTableEntry::new(&self.table_data[index..])
+    }
+
+    // find entry by type value
+    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
+        for i in 0..self.entry_count {
+            let entry = self.lookup_index(i)?;
+            if entry.application_id == entry_type {
+                return Ok(entry);
+            }
+        }
+
+        Err(EINVAL)
+    }
+}
+
+/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
+/// The PMU table contains voltage/frequency tables as well as a pointer to the
+/// Falcon Ucode.
+impl FwSecBiosBuilder {
+    fn setup_falcon_data(
+        &mut self,
+        pdev: &pci::Device,
+        pci_at_image: &PciAtBiosImage,
+        first_fwsec: &FwSecBiosBuilder,
+    ) -> Result {
+        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
+        let mut pmu_in_first_fwsec = false;
+
+        // The falcon data pointer assumes that the PciAt and FWSEC images
+        // are contiguous in memory. However, testing shows the EFI image sits in
+        // between them. So calculate the offset from the end of the PciAt image
+        // rather than the start of it. Compensate.
+        offset -= pci_at_image.base.data.len();
+
+        // The offset is now from the start of the first Fwsec image, however
+        // the offset points to a location in the second Fwsec image. Since
+        // the fwsec images are contiguous, subtract the length of the first Fwsec
+        // image from the offset to get the offset to the start of the second
+        // Fwsec image.
+        if offset < first_fwsec.base.data.len() {
+            pmu_in_first_fwsec = true;
+        } else {
+            offset -= first_fwsec.base.data.len();
+        }
+
+        self.falcon_data_offset = Some(offset);
+
+        if pmu_in_first_fwsec {
+            self.pmu_lookup_table =
+                Some(PmuLookupTable::new(pdev, &first_fwsec.base.data[offset..])?);
+        } else {
+            self.pmu_lookup_table = Some(PmuLookupTable::new(pdev, &self.base.data[offset..])?);
+        }
+
+        match self
+            .pmu_lookup_table
+            .as_ref()
+            .ok_or(EINVAL)?
+            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
+        {
+            Ok(entry) => {
+                let mut ucode_offset = entry.data as usize;
+                ucode_offset -= pci_at_image.base.data.len();
+                if ucode_offset < first_fwsec.base.data.len() {
+                    dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");
+                    return Err(EINVAL);
+                }
+                ucode_offset -= first_fwsec.base.data.len();
+                self.falcon_ucode_offset = Some(ucode_offset);
+            }
+            Err(e) => {
+                dev_err!(
+                    pdev.as_ref(),
+                    "PmuLookupTableEntry not found, error: {:?}\n",
+                    e
+                );
+                return Err(EINVAL);
+            }
+        }
+        Ok(())
+    }
+
+    /// Build the final FwSecBiosImage from this builder
+    fn build(self, pdev: &pci::Device) -> Result<FwSecBiosImage> {
+        let ret = FwSecBiosImage {
+            base: self.base,
+            falcon_ucode_offset: self.falcon_ucode_offset.ok_or(EINVAL)?,
+        };
+
+        if cfg!(debug_assertions) {
+            // Print the desc header for debugging
+            let desc = ret.header(pdev.as_ref())?;
+            dev_dbg!(pdev.as_ref(), "PmuLookupTableEntry desc: {:#?}\n", desc);
+        }
+
+        Ok(ret)
+    }
+}
+
+impl FwSecBiosImage {
+    /// Get the FwSec header (FalconUCodeDescV3)
+    pub(crate) fn header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
+        // Get the falcon ucode offset that was found in setup_falcon_data
+        let falcon_ucode_offset = self.falcon_ucode_offset;
+
+        // Make sure the offset is within the data bounds
+        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
+            dev_err!(dev, "fwsec-frts header not contained within BIOS bounds\n");
+            return Err(ERANGE);
+        }
+
+        // Read the first 4 bytes to get the version
+        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
+            .try_into()
+            .map_err(|_| EINVAL)?;
+        let hdr = u32::from_le_bytes(hdr_bytes);
+        let ver = (hdr & 0xff00) >> 8;
+
+        if ver != 3 {
+            dev_err!(dev, "invalid fwsec firmware version: {:?}\n", ver);
+            return Err(EINVAL);
+        }
+
+        // Return a reference to the FalconUCodeDescV3 structure.
+        // SAFETY: we have checked that `falcon_ucode_offset + size_of::<FalconUCodeDescV3>`
+        // is within the bounds of `data`. Also, this data vector is from ROM, and 'data' field
+        // in BiosImageBase is immutable after construction.
+        Ok(unsafe {
+            &*(self
+                .base
+                .data
+                .as_ptr()
+                .add(falcon_ucode_offset)
+                .cast::<FalconUCodeDescV3>())
+        })
+    }
+
+    /// Get the ucode data as a byte slice
+    pub(crate) fn ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        let falcon_ucode_offset = self.falcon_ucode_offset;
+
+        // The ucode data follows the descriptor
+        let ucode_data_offset = falcon_ucode_offset + desc.size();
+        let size = (desc.imem_load_size + desc.dmem_load_size) as usize;
+
+        // Get the data slice, checking bounds in a single operation
+        self.base
+            .data
+            .get(ucode_data_offset..ucode_data_offset + size)
+            .ok_or(ERANGE)
+            .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
+    }
+
+    /// Get the signatures as a byte slice
+    pub(crate) fn sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+        const SIG_SIZE: usize = 96 * 4;
+
+        // The signatures data follows the descriptor
+        let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
+        let size = desc.signature_count as usize * SIG_SIZE;
+
+        // Make sure the data is within bounds
+        if sigs_data_offset + size > self.base.data.len() {
+            dev_err!(
+                dev,
+                "fwsec signatures data not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
+        }
+
+        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
+    }
+}

-- 
2.49.0

