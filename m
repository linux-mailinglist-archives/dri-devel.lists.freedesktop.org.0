Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC0A441FB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156A110E6C1;
	Tue, 25 Feb 2025 14:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TNQEY0fn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F45810E6C7;
 Tue, 25 Feb 2025 14:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKZmvvTkqgX0gJecDVkRAXlLwQcuxm0jiPmnwIfGgclLyVR9A77ESnfnXQidfHgf6avlKTe9z/BXg0BQyghaC/vQBJam0mVUud8tChUGY8hxCFNS6/RZoFIqYsY1gdt2XGx4MFwKl5K5c8mIyjiJfAl8ICIe5/eOg0rmielPYBGG0MDnptiKawNNPk/OYN7tfsXAuT4/wJBgrxa3QpiaxJlULwtw8IBznN3qje+AOCS8nU41VFiN15dXS/X4NpwxYh3yhhlPyPvoGnUSA+N2gCxriUuV6aTyPK4m6FogKEeQ8MPZO71WysflIyjIhDESvVAM2nin9xwRs9HMGw143A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpWIHhkcTNKvmQ7WWAkU9+/R9CHZSqsBUi11/AYeDsY=;
 b=yyf9I+5zNxmrESEY7Pj65sRJ2pV0SlbqpLurVj39ggDdia0RnTypvuIoqYko27u22lSffx1wYSk1n4DimyZaOWCpJbQ2R3znekWY3oLvkYyJYynF1BvCGW/oZGmtWVIoviJUB97XZowijKDDPOzifF1jE2/8RY1HMjWm2+c8VisoU5hN9cNdL6c4njHftx2pczfEGoJitDUiAweWDZNtUL7aHXEOl3MeOY+4YoLtmCAcMcNV9Bpk4AeXXLL/GiTpsBqArfWsuZhqKFRlrpTmTkqqE/eSLAOVdNI55Nxqj3qecR8uVZ7HrwxfeRDvBhtwDNOZoaaKIvmD9sW4Q/2nZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpWIHhkcTNKvmQ7WWAkU9+/R9CHZSqsBUi11/AYeDsY=;
 b=TNQEY0fnyoUZ3e82VyW2Lgs34Iglmv4aNxsAfLSqhqA5Jmqmh6YIFqfnDuQBol8SDefUhJM9MpG6W3427VmDZhuXYlRAIunYkRkJMjRlVxn/md+osbMGIvZW/PYf4duYTp3fLWvy+jWljsbldX4IGgRiRtSpu60y7nGOirDklQTBkKS06qk1F9rKMh4xHtBeVmmv+tMdRhblI7BtyzAOyBrbgDRU/UXIdd2mp4X8bzadPm/UERZJDpHVLIOanFxAooNWONISXWhucN0ec1LVN06mKzycNY1ETzt0CnfKMEKPhnJWiZKiFlrNzKpyhR4/aDpKLPBuHBe6XthXhmd0gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 14:11:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 14:11:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Feb 2025 23:11:07 +0900
Message-Id: <D81L5PE1SPWC.O56MB6SRS0XK@nvidia.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Dave Airlie" <airlied@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Joel
 Fernandes" <joel@joelfernandes.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
In-Reply-To: <Z7xg8uArPlr2gQBU@pollux>
X-ClientProxiedBy: TYCP286CA0291.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: bef3dc05-0511-455d-9046-08dd55a6415f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2pEcG5LQXBNTzFXMXBEU1pnNFltZzRycnJKRHhrZTRMbEtsT0RZR0RsZkVI?=
 =?utf-8?B?QjhtaCtRend4eno1SVdyUG9FckxkNDczNisvc2VGejhxY09nbXBUVVhwVElP?=
 =?utf-8?B?Q08vUFJLblBWS1JkcnJqdkpCOTBjcGdGemdtUVo0OSt3eG1reDY3bTUwdElZ?=
 =?utf-8?B?Ulk1TERNRlg0MWVJVS9yN3Y5VTBOVnFZWndnNGsyVWpIdC82VW4vaExyeEcw?=
 =?utf-8?B?U2crTThUU01nVEhxSUcweHFwSWFGcThRc2kwaDJPZXZzMGhGQ28vYko1QXFu?=
 =?utf-8?B?ZEY2SVRlUG5GUVNuemxxREZKTVVhQUpKMURwdXRROTYxT29DQzNDOUZKRzF0?=
 =?utf-8?B?cHZsa2x0b2hiQndOcXhaV1VZZDhPK1JpamVqQUxjeHVPcXZ6bGdNU3dONG9u?=
 =?utf-8?B?Rk5hb3hUaHM3U1lqZVgwRGRYU2UrdHpDQnZua1dXdmJWNkd3ZUtuVFUvNTJo?=
 =?utf-8?B?c21NODlMcEUvMlBBYUk1THdrMWpEdnN4cDFqOVc1WXlaM3loSmxvSVVFMnpY?=
 =?utf-8?B?TG4veHNGNkpGOEYrUkdQc01HeXc5YTdITG9CdTdNRlNHZHJEbVJWek1aTVE0?=
 =?utf-8?B?TmhweVRRMzNrOUp4VVNGeXlSSTQ5Um12QUlhMC92bWtCTGoxRWJBWjkyUFM2?=
 =?utf-8?B?NXBJYjcvUDJidHRkU1hPUitFNkpJRDllUVdKM09ISnFjMkczVm4xd3JDZU05?=
 =?utf-8?B?c0hLWjZUWDFuYWEzNFc4UlpHZm45NEtEM003aXRpSVo2OXR6ZjFnVWJTTkdC?=
 =?utf-8?B?MXI1QVRvVk5oOXhnN0ExbjRpSG9GOWx0ZWNZOGY5NFg3M1JjUGdEQ0laTjBq?=
 =?utf-8?B?ckpxWWQxeDhTWWVJcldXTWp5UE84WkhWVDNQMWhDcHlLMUs2dE4yUW1tOGZY?=
 =?utf-8?B?WGU2Q1RWVzRCY3ZpNWU3aVJQQmUxKzdLYm5sTnVqbzRIdGxtTkY4bE4zTG9N?=
 =?utf-8?B?c0UrRnZJTzhid25oS1FVcnRKRTI4clIwMGx2dHhidVZocGp4QnVVb3QwZExi?=
 =?utf-8?B?N2VqK0c1Vi9PUzlYMzU5aTN5TzFuNTN6R045OWFFMUFvV25Ib2xkTi8vcEph?=
 =?utf-8?B?em1TbXpPY1BaNm1GYy9rY29kdEtyNFNIN0pUSWRWRzdRZXEvTzQxU1ViMHlp?=
 =?utf-8?B?bmNLVnVSTGNmelRYV1cxalZqSFUvWlUza1J4LzJQdm5sL2NBdk9jMktuTnA1?=
 =?utf-8?B?ZVQ2TExpSS9ZSVhiQlBaUVpTK2dDZ1VhOVNNeXBrL21HQXg3eUFta09aRVhk?=
 =?utf-8?B?YkIrS21yQ1lwUDVNSVF6M3JORFg5VXJLRm0xK2kyalgwWWhTUDZNa3ZnbTJ2?=
 =?utf-8?B?dVF3Y09NbWtBR1VtejNFaERFSGM3VXJOUkd4VURSWVZBdEFDZWF0YXAvRE5M?=
 =?utf-8?B?UnlsNm1kcE51bEJhcy9NOGE4eS8xZEVRR0g1WkU1MjduN1ZJN1JFRk5IZGVX?=
 =?utf-8?B?RHRWVjU2UjJERFo1dFRSK3hHM3VoRVBkMHpjekZUamlaTFByVElGOHVJUEhW?=
 =?utf-8?B?bmJzQzRpRnA1WFZNbXRrRXZkcGN6NHB4cmp0NFlMcXk1T3BHaEYrNzdrQjJp?=
 =?utf-8?B?ZjcwSDkrK1BXV3l6L3lTUnE3NVQ4NFNSY3liek1NVkNJanlHQkd4M3JPL09o?=
 =?utf-8?B?VGcyL1VVZThwUGF3K1VrSFhES29GbTFCWVVYNjNmNmN2M0RtSWY0NEZPWWpS?=
 =?utf-8?B?YmtsSU1WRERuZlA2Y1UvTysvd1h2VUtLZVZReGo2ZHpxcmQ5SEFCZENrY0lF?=
 =?utf-8?B?aHhzQmV5TEpKYkpybEV2U0tuaHFDRUY1NmdPaGlaaDEwUGpNamRteWRnY3Q3?=
 =?utf-8?B?WmN2UVBsQWxOV28zeU92djBaRzkvd2hxcTNrUHcxSTUxZFkxNzJMNkwvaWgw?=
 =?utf-8?Q?EbR/zJr4K9gzs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enorK08zaEJ1cE9tRlZvbkk5NFFYZ1VOd25aRGM5c054L09BeE9KcDRZUGtx?=
 =?utf-8?B?Zk1QUVN6T2pPRFFxT2xuWUNKR2VURUoyaG4rN3ZkOHZ2ajFGNitRcXRLOUhX?=
 =?utf-8?B?ZS9IRHk3OWMzdVRRS01HSW1OYVJ0YTNBV0dQaDE3N3lTKzJ2cVJYWDdhNTB2?=
 =?utf-8?B?V280ZFhuUEFNZ3M5ZTVBc3FrTTJxZUR4TU1qVzB2S05rUFo4SXFpc0hvajk3?=
 =?utf-8?B?UkVWMjU0a2R5N3Uwdno5VFFEcERkcmxWNGs1UWdKVUxXVytpMjk2WjdrS2NK?=
 =?utf-8?B?WXNuMXdXaGJaLzdqemZJbUZGNEJqSVVHS3RCT0J4Q0xXOHJWTHBaWXE0RTd2?=
 =?utf-8?B?RnZxb3g1TXhMVHlBZGtlYytXb3VGYVRtM0E0WGs3SEtGYWVaa2lOWi82SXNT?=
 =?utf-8?B?bEtuVXA5aFRYY3NYWHp4UjFxRUZBMFlXQkp0YWlydHZSb1BDMHJ1aVUyTWVO?=
 =?utf-8?B?S1dER09DWU9DbnZvQzFHMGFCS3hpTmVKYkJpVCszRHh6R0QxcHRLTGR5REdO?=
 =?utf-8?B?SHlxTmUzeG0xQXhjTDVpaHVxK3ZKZExabjMwMllxVFVxczB3SEU3R3BHazlY?=
 =?utf-8?B?YzNRYXhvam84amx1VDNOd3lIWEtDdlVwUGFjOXptSEhCQ0JXdTVqYy85M0RI?=
 =?utf-8?B?S0JGQW5MUGduZTd0RGR5S3YyWGVnazhvNTVtNk1yNG9xMndqOUF4Ny9oSkJm?=
 =?utf-8?B?MkZDNHEvMnd2Q3ZvcjJDdUlQemNwMnJicCtUWGVEUzBNRnJqdzlaME4rZStQ?=
 =?utf-8?B?M0xrSHFzNTF1eWQ0U3JKbE9RdkhGaWIxMnhrbUg5TEx2d2Fhd09YUjhqYlJi?=
 =?utf-8?B?bzdRUGxRanlUeVNyVzRBbGdweXNzWWxxclRCOHNTdkFxd3ZBaUoyQ1FUTUd6?=
 =?utf-8?B?UGVpeGhUZnVYd3ZIZXhwQVlrTmVCbytBYkp2SEJyemsrdXhSUTQ5NXpaSmpO?=
 =?utf-8?B?ZEo0ckl1RXNrSkFkcGI4blRSK2E1V2VuOHdhemdCdlFQYnJtVzJWeGNYWnZL?=
 =?utf-8?B?d0NIa05kdVJ6T3lqdU94aUhaNXpSMUYvWkdrUUJIb2ZmYXpnWXFRem1lRTl1?=
 =?utf-8?B?QVdKZFdRVlZpTnFDU01wOVplc285MDNBSURMZ3BZd01JVTA5MUtoSU5XTFJH?=
 =?utf-8?B?Y2c4NUovamlGRkxNZi9ScEVnamU5a01kMVZwQ0dmOThsYk5YSDlnKzVsd1Jk?=
 =?utf-8?B?OXJBVDhNczdEZG5BVFIzdkVvVEF2WXBXM2Z6d092UzdmMjMxMzZoTFpqZk52?=
 =?utf-8?B?ZHFQY3lJU2VkNkZOSVdQUTJkSFZiaTE2Ymkzb0dXTUMwRDBTSXNUQllJZ3V1?=
 =?utf-8?B?UWNLMGFWUVdSVkcwT0ZNMFJSMXJieVpvREZlSFNHT1VnYVZ2WmRNUzJXOVJM?=
 =?utf-8?B?M3FObDJKcFVHUnc3dkFrZ1JUM01EVnRxd25jejc4cHBmYlFnU3pINTc4YWRM?=
 =?utf-8?B?MjVtQ1BNblBEUDlrZEpidm9lNFB3TytRSkR3RUtGaVBLNExoaGxoMG1UMzhz?=
 =?utf-8?B?cG8vTysvSGEvOTA3MGxBbEs1TWFGQlduQVNMdWJlSmhDT2ZneVpCSmtlWFNp?=
 =?utf-8?B?bGJpTjNGVGd2L0tYSU1qRkM1N2h2Q0YxbjFDVVN5emc0OFo3LzlXWnlLaWF2?=
 =?utf-8?B?cmZ2UW1WaXJ0VlNBYXNlMndMRGtFVldyZWFyamZkeFpDN3gweWY3WjUyc3NS?=
 =?utf-8?B?Z0VPaEZENzlVdnlVZDdYa2sxV2hCbUpYaUZHRHlMb3pBQnRjdWlZaFNVWms5?=
 =?utf-8?B?azBPbnhIeURSbm5jRnFVV3A5WUJmd3QzYXJTRVBlQ2cwMWd2cEZSdkw5WWFa?=
 =?utf-8?B?SmR2TmJxYnlHY2RjKzlMS0tBTEpKL1JGZEQ4WHNNTGVaRy8veHQzVC84MGRh?=
 =?utf-8?B?VTlpbkEvbTVobHpYaSt2a0RaN04rYVZabDgwcEVoN0ZkekpVQmE1eHBIak5y?=
 =?utf-8?B?VW5UK0M4TGNkMHU5bFhVcjdqYTBBZDV1ekh5aFRQSXFOU2pXaHJqVU5CcHRC?=
 =?utf-8?B?Y0k5S294VGpaTkFqQlpudHp4TVU4YllueDJZUkp4Vzhoc3lBc29URy85dldB?=
 =?utf-8?B?dDB6OVY0dGY1bnVMeFQ3dloxdnBMRjlIV3prenpwUzJyOEdtcllKZHE1T2Uz?=
 =?utf-8?B?Y3dabkpZNkVmcUtlS0FvWWE4NnhoNzNsY3VzS0I3Yi9qR2I0ck1mQ3FCcXFG?=
 =?utf-8?Q?5Gj8v1dD70XFMDLRqDRHbd8bDXEP0Y5C3c+EWJVFWVIW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef3dc05-0511-455d-9046-08dd55a6415f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 14:11:11.3458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDlMWnaL7ytxxmb2Ia5OuyARZJmHtkCCQA4BeGIIPWcNcnlYkL6+ls55yoZPTfdpNe4RbzQnYefATjtNYSuQfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
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

On Mon Feb 24, 2025 at 9:07 PM JST, Danilo Krummrich wrote:
> CC: Gary
>
> On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
>> This inability to sleep while we are accessing registers seems very
>> constraining to me, if not dangerous. It is pretty common to have
>> functions intermingle hardware accesses with other operations that might
>> sleep, and this constraint means that in such cases the caller would
>> need to perform guard lifetime management manually:
>>=20
>>   let bar_guard =3D bar.try_access()?;
>>   /* do something non-sleeping with bar_guard */
>>   drop(bar_guard);
>>=20
>>   /* do something that might sleep */
>>=20
>>   let bar_guard =3D bar.try_access()?;
>>   /* do something non-sleeping with bar_guard */
>>   drop(bar_guard);
>>=20
>>   ...
>>=20
>> Failure to drop the guard potentially introduces a race condition, which
>> will receive no compile-time warning and potentialy not even a runtime
>> one unless lockdep is enabled. This problem does not exist with the
>> equivalent C code AFAICT, which makes the Rust version actually more
>> error-prone and dangerous, the opposite of what we are trying to achieve
>> with Rust. Or am I missing something?
>
> Generally you are right, but you have to see it from a different perspect=
ive.
>
> What you describe is not an issue that comes from the design of the API, =
but is
> a limitation of Rust in the kernel. People are aware of the issue and wit=
h klint
> [1] there are solutions for that in the pipeline, see also [2] and [3].
>
> [1] https://rust-for-linux.com/klint
> [2] https://github.com/Rust-for-Linux/klint/blob/trunk/doc/atomic_context=
.md
> [3] https://www.memorysafety.org/blog/gary-guo-klint-rust-tools/

Thanks, I wasn't aware of klint and it looks indeed cool, even if not perfe=
ct by
its own admission. But even if the ignore the safety issue, the other one
(ergonomics) is still there.

Basically this way of accessing registers imposes quite a mental burden on =
its
users. It requires a very different (and harsher) discipline than when writ=
ing
the same code in C, and the correct granularity to use is unclear to me.

For instance, if I want to do the equivalent of Nouveau's nvkm_usec() to po=
ll a
particular register in a busy loop, should I call try_access() once before =
the
loop? Or every time before accessing the register? I'm afraid having to che=
ck
that the resource is still alive before accessing any register is going to
become tedious very quickly.

I understand that we want to protect against accessing the IO region of an
unplugged device ; but still there is no guarantee that the device won't be
unplugged in the middle of a critical section, however short. Thus the driv=
er
code should be able to recognize that the device has fallen off the bus whe=
n it
e.g. gets a bunch of 0xff instead of a valid value. So do we really need to
extra protection that AFAICT isn't used in C?
