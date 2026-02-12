Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JyFOs6OjWn94QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6466E12B48A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C300110E701;
	Thu, 12 Feb 2026 08:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pt9LpFB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB2610E706;
 Thu, 12 Feb 2026 08:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbwsBqwmgMab7/GWoR0Vic+2V3wYjI0i3C7iTNMiizAns9P96EB9Wc8rOZqCMkog7aTM+77C5C4iWFvhtkd8wMRSFzRod8xlC/PV5ezgHZnPI3Wrp39ace8BMWrYAIovI+vbJTjkY2mgvITVCSjRoftSlMqzMDqvaCTf3MFCuP54/Qioq7KJFl8p63GFYKwIsRSnID1L/CFHctFche1X5yLs/BlDRU+SO23qPEoGj5Wm7vWbf3/xeP5GKAegoB15OdfadBNSA0eebnq5BGSIWbYeYMtiQhbki0CdqxTkyOgoT6lUkYpfI5YZ1naX8zjlHP6wZfZyd3mcMcSSueu1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbbndLXH/Gz7V/HX3+ds/c84PTUtRZGlfJGHdEdS3NM=;
 b=bv+S3E7N4tlp3oToNXlaSgfcAqaFKQBuOj7Id1O8eWuHMvHmNDAVD71yC693zcLh3xh4Cvh3WzUypmoER6BqQUyqFPd2mwcX3lQLoX8RLQ1EkDaMS97LrMFwtK1FeYkwvALMoPtc4zplL3Gd4KRsYe3EeJSSLYGdGw8+xnL9LD5KMmhQ9t3ug3GNPgJw44O/NsMDJhoxLVVDV0xR12n+NaOfA4cH+sahW8Vk7Q6Nc96d9pnNkTaCgG9UfGCf8qJ/vnenuK5HQL+StzFYiFzt3k6fh9jQRXRLvIaBM41mQQZGhWSGG4wWA95ZIxndaCeI1HFSkNq4ft4CUxJ/t0/6ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbbndLXH/Gz7V/HX3+ds/c84PTUtRZGlfJGHdEdS3NM=;
 b=pt9LpFB4MaBsLG54hvL/VOVXLfZW8PVKWI1x7IEAzqODok4EJ3/dSB5KaOK//O0ZPhV1VUOqGSXqtfFj7LUUn1lw+ZocbIgriCqbxkOiX/707RNImj5O+kxSecKqRf076j4dIJ2npvfnVSwTq4Os8TKNAuBLRrL5X6KKo/GGpFMr0O9oEr6tJuAdbU49eNIC1s6w3PDU1hbGvbrclrNolOahKsT6RkcUwWzq6kZgp4aEyuZybEbxT/R02+TbMtIunFO/mpy7MJatz4wat4ulfOkM63a5uov4Ddrb/0lNku0hUpY8uuj8nCqhAg55SyV86XBF70BKfeBHANWH+MDhCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:23 +0900
Subject: [PATCH v9 6/9] gpu: nova-core: add PIO support for loading
 firmware images
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-6-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 58fd7708-3d62-4d77-d6d6-08de6a107674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REVpem42U0ZpRjkzcE5sQ29rV1g3YXlrNytvdUFMdHMrVTVGVDVxWUQ3U0da?=
 =?utf-8?B?cGF5WnFyb0ZrS3ltV1ArRmRaNVF5NlFQNDFCd203cW1pT1lYSHJNZVd2TzFL?=
 =?utf-8?B?WWhhM2hNMkJ6eGxpZ3IwREdaNGxCbE1VNnBjNUtBMTR2ZzJ3Y21DNXN1N0pv?=
 =?utf-8?B?L1Z6NFN0TXBNeHluTmpCejhHc1Rma3ZjYStCbEVKV21DZDlXUytHYXpGYTZJ?=
 =?utf-8?B?dFNoZitINUtTSlhHRkM5TElhQ2VhWmoxeFJyUmRNc2hUbDZFODVMUFZEaXZr?=
 =?utf-8?B?SC80dW5pbXJiNUxUQTNnR1A4WVNyVEdUdlJLRWxxd1NGU1RUMFpsOTV5SjZv?=
 =?utf-8?B?R0NqUW1xZGhPdDFCZEhEejZydjF3c2x5a1ZOdi9YY2UyTFNGTDlENXhuYUxD?=
 =?utf-8?B?bU0vcjJWWlhMazhPbERIOVhZZlNOMjVBeDdwMmtKaEN4dUZrT21tWTZvVFdv?=
 =?utf-8?B?aHZURjVQQ2ZhYS9vb096UjliWmo2dlNzdms5ejkydXY2U2F4dkFScXpobHpE?=
 =?utf-8?B?TlR0RlcyYXdDSytqRlZmQUJoMlhFN3BRQnVNeUY3aGpqQVdwenZDNEdiSXZq?=
 =?utf-8?B?RmxlcGhBN29YNkpXTGhFZGNock8rd2xneklqMnFSMDFEUW9GcDBoY2MrUVMw?=
 =?utf-8?B?NW5RNTJnYUc5S2VMaTVJOG9JWSszN0pXOCtrb2lqdmlkU3pKSWJhbTVBazlO?=
 =?utf-8?B?UXFXeVQveFBJdlJ4N0R3VmVLV3BqLytuZmQzblQzUFd6SEdiWG5sbVZLb2J0?=
 =?utf-8?B?QS9ONytCSDlUN1l6VTNGVzcrREx2WFNXWlpXbHI1MUpEblZvNEJYdG1QUElt?=
 =?utf-8?B?L3NLM3dZYy9pZTJ4bUxRcUJ4MTh2NHlFeDBDLzhSU080Yys4YnRCWDhCU1cx?=
 =?utf-8?B?SXBqK3p4Qmd1bFlIc216N21oZThYWHpsbVlJZ2xzZDVJTTZKS28zbk5YWE12?=
 =?utf-8?B?THQ1amlCekluSDJTak9RY1NEbUUweklhWE9qMGFMMlJwT3NYdUIzemJLZDJE?=
 =?utf-8?B?VERPK3Nxc2lEUkFxRDFlUGpNMHJrblltTWNIZXFmUDVBZDJyVHBGa00xMytr?=
 =?utf-8?B?dFBoV2ZYVVVRczhUMmJWY0swSEw4UDlKQkRGck1aT2VDemFKWEJNbjZBQmdI?=
 =?utf-8?B?VmR2MllQdmdqS25EK1NtRFdaam1VTkJoTk10eFJibEVneXFNTlpQVGVFc3p5?=
 =?utf-8?B?T0lyaTNqSnZ2djF0SXJNMzdmWjdqd0E5ZmZ4dlJ6Y0VCZ3FscUZ6NEx2ejkz?=
 =?utf-8?B?Nk1KYVI2QjJzUlM4UFk4WVJWc1RLWWpzVGxDVExiakU1YzBTd1p0bkxSZGlm?=
 =?utf-8?B?Qy91YUxLTmR2U2wxYVVYT1pBUk00dHRVMnpmdjEyMEpWanJ6anZhV0NOd2Yr?=
 =?utf-8?B?Z0pMNk5CbTBrZUFXaEJDa0FLaXZVUDNzMysxeVZUMTZVQjVIRjRhYWtQN2Nm?=
 =?utf-8?B?V3QvV0VnU2JmY0R2YTNMN2s3eFVGU1FtcG10dDgyM0dEdllRMHdsU2oyVHJ2?=
 =?utf-8?B?M0QrRHhSeXh2RWRQVnN4dVlEYlBINGF4V1hFV1lrSU1tb1k4RjhKbjNxWHpl?=
 =?utf-8?B?c3hZdGhjb1p1dXU0OVBDL3BiV0FJY1VnTkdSOXh4bXlkMzdvdWdocUR1MGxr?=
 =?utf-8?B?UTFybHFFd1ZwYlA2b3FWWCszSVRUR2Q4Z1RMT3kwaUxSbjNyYU9YL1FkOW9h?=
 =?utf-8?B?N2JCTWwrZG5FeWNmWlRNT21NY2dzdm83ZGtqTjE0QkV4Qi80NEVXLzBUYkdk?=
 =?utf-8?B?MFRZSFB5ekdMOW5zSW4xTUhXZE1CYld4Yk5SenkyOGI1Qm9NQVJnNGZiaTVz?=
 =?utf-8?B?MEIveDBoRStYSnQvNzlCYm9pek91dHJpOFdTOGxDY1lhUEphVDVmS1JYZkRk?=
 =?utf-8?B?SE0zZHI0bWx4OHdGMkJIdmxBVjBwdTFGNndDOGE0T1k5SlRyclk1NnIwWG9j?=
 =?utf-8?B?dnpleHRXWjh4eUFOcWtyNFluQTUrU2RROHZib09KMWlTOVJwUklxczBvS2p6?=
 =?utf-8?B?NExjVzcvRENHZjBEWEtweWtUaFBKT0wxd2Y1bjFqNEZhOXdhSmdkSjR0V2gy?=
 =?utf-8?B?dzBTUUxSOTE3RnFEUFlsNlcwWnBoUktjUTZkUCtiT2xrc2wrblJPVDA1WjB4?=
 =?utf-8?Q?wxqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hPcVM4d3FvbnFDTTYzUVJETGdDZ1RrVVE5a2dWbm9xbTJ3aXBNbXF5dEpx?=
 =?utf-8?B?SDI0T05iZGU1dXRwY3JReUxaQUszdDFFTEpWaWFpZmFBM3JiSllVZ2lWQVYy?=
 =?utf-8?B?V3pTTFFUY3JiVUpSL3R6NTcyd3ZjUFpQdUpFVFFHcGFRZXRmUHlOeUswQWpa?=
 =?utf-8?B?VzBkVElOd3NEQnNpcytkNWQ4RTZ2YzA5R3BQaEI2WEFiT1hYeXBJa2d6ZzZP?=
 =?utf-8?B?RkFPS2N6cTViRXdGNWdEKzhaTnJHNXUwMEhaYm9QanYzRjhvZUZBSlYvVnUv?=
 =?utf-8?B?dDJIVWxxYTBLVVZLWjFGZnhPRzYzZ1BiclVXd0xTMFJaRzdaMDJKQndjd2F1?=
 =?utf-8?B?NjJJY3paUlZZNEdnb2NYMUdyNFZBa05YSVJQbExTZHlRTjExemJiZkxrakYy?=
 =?utf-8?B?Z3ZSNXdreW5yaDVhZGxKZENHSVBTbUNBaGNxcE9JekYzQXkxMFQ2ZldFejV6?=
 =?utf-8?B?b2dFbHQyeHBWYWYxOU0xVndUVG85R0luZndJNHRZdi9jRnBidmxqY2JIS1Qr?=
 =?utf-8?B?SnJBcDZTWCtraXRHMmtVZElldEdESVZYaUFLSlQ5aDU1d0JDTjM5LzNyT1k1?=
 =?utf-8?B?VVpjTWRGTXdaMGZEUG1FZjlXZngzVGFTSVorOVdveC9nUzFlQ1hqc2VEQ2tZ?=
 =?utf-8?B?eXVROTc4ZFJPaDlTQ1lIQU1UVmJTQitnNkgxdVQrb0x0UWc1QUtXNC9FTWho?=
 =?utf-8?B?UFhpVE9UMDBsa0dkZ0w3S3FXZnRQTHpkSzBJdmQ1TFhlWGc1ZFBuVW1GR1JF?=
 =?utf-8?B?NExJbmxVNUhsSklDQXJQcC9CM2lZajRxeXFGcHRFZ2lEbHcrR2xVc05RQVJK?=
 =?utf-8?B?TFB2Uk5ROTY1dnJWN3BER3NYeXR3YTJkSUZkdDhjcHQ4ekFVcVdQcUswY0wy?=
 =?utf-8?B?Vjg5NGFobDhTSml2THk1WWNVb1RFVTF1b2UrOUdpSWtJY3Z5Z3lrRkhxdEp5?=
 =?utf-8?B?dC9vaW5tQU01V2YxS1FwTVhDdk5IRmxCQUYxRHFYd01NQkE1aFpOcGt3Q2sz?=
 =?utf-8?B?UHYvcURyMERRdUVSb2E3dldmUkcwMFB2MGlVbThpdzBNeXVUbUtQUU9IcEN0?=
 =?utf-8?B?bmQvaWZsNys2d2dUaEpnR2lScXMwa1ZaZmlZaFpDR0JmaHNsTTVEeEV4cHll?=
 =?utf-8?B?VGZLbml3RC84S1hPYmZ3L3RyQXMyVmZvMDVwR3hLUHdWKzFhRlIyMU8rUVQr?=
 =?utf-8?B?YTdGalRGZ2grVStRQ09KS04xZzlEZ0lxN0YyQVBSYmNseUlva2ZBa2xmZThj?=
 =?utf-8?B?ekZ2UzA3MWMzWHoydTN5Vk1mM3JCOHZ0d2VJb1BHNXVaVUxQdlZlaTd6Tm1n?=
 =?utf-8?B?RTVoUmVnaXJURDlZMkRJTytkdTBIak1Yd1kyZkxLWHJqbHJkMnRWeTN6YVBx?=
 =?utf-8?B?dFlmenpTWCtrVllTV1Iyb2hRL3hDUFJUMTJIQ3BCNUVwZDNkNmtFUkhiaVJw?=
 =?utf-8?B?YVBpSVJ0R2hzcnhlSHQvTUpJMlp2dTlqTTZlUTAwNlg2VDlaYXpvS2FaRlFk?=
 =?utf-8?B?Y1FTRlJGRzFpSGNWbGdDVERncVNtZFFuR0pTR1Rpc0ZFTnZYY3lZQjA3MHdx?=
 =?utf-8?B?QVI4K0dkOGNkMVZmUGdUZlVkckRvTldBc3V1T014dm5mcGljVWc1VUtxbTht?=
 =?utf-8?B?YUh4a0x6RjJoQldHQjBkZ0sxVmZnazZCRWE1Q29pVUdUcXBtcEJHZk4zY0Nt?=
 =?utf-8?B?ZGh0Q0J3RFdubFdRc01XNVloakxZK1lHT2k4SUZNRjBlanFwMmpsUXZaQjlW?=
 =?utf-8?B?Z0FGYUpvNjhTMFdpUW9FUTYyUVdYTFYyRnFQb2h6cWdpbjlwdC8wOXJDallp?=
 =?utf-8?B?MFNrNHQ5YksxN3JITHZESUlHZXI0L2NDQmJZMkFxU01FVzRDV3ZHNTNpUGY5?=
 =?utf-8?B?bWZ3bVJCUnEyblJtWWdmaENLMk1CcXFLejhPM2NZN2RlZnBMem52MUVGNnIx?=
 =?utf-8?B?cHRYdjFIUHVncjl4RjBRakJWZmhXTTFHU0IrN0pGKysxMWh6OUxKL0puaXJ4?=
 =?utf-8?B?UU9SOHBSQ29PUFY1dkpuZmN4TTVVM2ROVG5RWTBaMU44NlVZYnJnYThGbzdV?=
 =?utf-8?B?VFU2VzhyTGdrMzk4aTJ3aTRseWVLQ25DemFReTVEaWovRTdIVzdaUHErcXlQ?=
 =?utf-8?B?ZllaTUFUT240dnZHOUxvL29iaWdHQitKV05HSXRYV25zTkp2T2IyeEhEam1q?=
 =?utf-8?B?NUI5anBGd1JlOUFUc0xmV091TVp6TDRpR1BPclBKWjhPQmk4U2dIZ2o2M2la?=
 =?utf-8?B?VzBBMEo0dUNwNEVWTWE4dVh4MXFDZlFGSHQ0MVBTdVEvQmE4dWliZGd0MjBF?=
 =?utf-8?B?dXBiTk5yK1ZIemtQVVlvRStlMXkweStOMG55UTdPOVo1MXVYK2hUVkFPZXVF?=
 =?utf-8?Q?FJBEMuOUxLQSvbZQFf75iBSh42eAAHFjCXCQJJ2bdPnXW?=
X-MS-Exchange-AntiSpam-MessageData-1: zicDSUegwz4WIg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fd7708-3d62-4d77-d6d6-08de6a107674
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:47.4870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xi3EETa/1mms1tjkokiZmtoPRGJncGHk5hN0jyR2Tl6GN49nSolJUAxphpm5SbB98vcc1r8HBGHY4tGJ5chfmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 6466E12B48A
X-Rspamd-Action: no action

From: Timur Tabi <ttabi@nvidia.com>

Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
firmware images into Falcon memory.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     | 230 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/falcon/hal.rs |   6 +-
 drivers/gpu/nova-core/regs.rs       |  30 +++++
 3 files changed, 263 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 7f52b051206a..f8de36abd135 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -361,6 +361,138 @@ pub(crate) trait FalconDmaLoadable: Deref<Target = DmaObject> {
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconDmaLoadTarget;
+
+    /// Returns an adapter that provides the required parameter to load this firmware using PIO.
+    ///
+    /// This can only fail if some `u32` fields cannot be converted to `u16`, or if the indices in
+    /// the headers are invalid.
+    fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<'_, Self>> {
+        let new_pio_imem = |params: FalconDmaLoadTarget, secure| {
+            // SAFETY: we keep a reference to `self` for as long as this slice is alive, and the
+            // device will not access this DMA object since we are using PIO.
+            let data = unsafe {
+                self.as_slice(
+                    usize::from_safe_cast(params.src_start),
+                    usize::from_safe_cast(params.len),
+                )?
+            };
+
+            let dst_start = u16::try_from(params.dst_start).map_err(|_| EINVAL)?;
+
+            Ok::<_, Error>(FalconPioImemLoadTarget {
+                data,
+                dst_start,
+                secure,
+                start_tag: dst_start >> 8,
+            })
+        };
+
+        let imem_sec = new_pio_imem(self.imem_sec_load_params(), true)?;
+
+        let imem_ns = if let Some(params) = self.imem_ns_load_params() {
+            Some(new_pio_imem(params, false)?)
+        } else {
+            None
+        };
+
+        let dmem = {
+            let params = self.dmem_load_params();
+
+            // SAFETY: we keep a reference to `self` for as long as this slice is alive, and the
+            // device will not access this DMA object since we are using PIO.
+            let data = unsafe {
+                self.as_slice(
+                    usize::from_safe_cast(params.src_start),
+                    usize::from_safe_cast(params.len),
+                )?
+            };
+
+            let dst_start = u16::try_from(params.dst_start).map_err(|_| EINVAL)?;
+
+            FalconPioDmemLoadTarget { data, dst_start }
+        };
+
+        Ok(FalconDmaFirmwarePioAdapter {
+            fw: self,
+            imem_sec,
+            imem_ns,
+            dmem,
+        })
+    }
+}
+
+/// Represents a portion of the firmware to be loaded into IMEM using PIO.
+#[derive(Clone)]
+pub(crate) struct FalconPioImemLoadTarget<'a> {
+    pub(crate) data: &'a [u8],
+    pub(crate) dst_start: u16,
+    pub(crate) secure: bool,
+    pub(crate) start_tag: u16,
+}
+
+/// Represents a portion of the firmware to be loaded into DMEM using PIO.
+#[derive(Clone)]
+pub(crate) struct FalconPioDmemLoadTarget<'a> {
+    pub(crate) data: &'a [u8],
+    pub(crate) dst_start: u16,
+}
+
+/// Trait for providing PIO load parameters of falcon firmwares.
+pub(crate) trait FalconPioLoadable {
+    /// Returns the load parameters for Secure `IMEM`, if any.
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>>;
+
+    /// Returns the load parameters for Non-Secure `IMEM`, if any.
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>>;
+
+    /// Returns the load parameters for `DMEM`.
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_>;
+}
+
+/// Adapter type that makes any DMA-loadable firmware also loadable via PIO.
+///
+/// Created using [`FalconDmaLoadable::try_as_pio_loadable`].
+pub(crate) struct FalconDmaFirmwarePioAdapter<'a, T: FalconDmaLoadable + ?Sized> {
+    /// Reference to the DMA firmware.
+    fw: &'a T,
+    /// Validated secure IMEM parameters.
+    imem_sec: FalconPioImemLoadTarget<'a>,
+    /// Validated non-secure IMEM parameters.
+    imem_ns: Option<FalconPioImemLoadTarget<'a>>,
+    /// Validated DMEM parameters.
+    dmem: FalconPioDmemLoadTarget<'a>,
+}
+
+impl<'a, T> FalconPioLoadable for FalconDmaFirmwarePioAdapter<'a, T>
+where
+    T: FalconDmaLoadable + ?Sized,
+{
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(self.imem_sec.clone())
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        self.imem_ns.clone()
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        self.dmem.clone()
+    }
+}
+
+impl<'a, T> FalconFirmware for FalconDmaFirmwarePioAdapter<'a, T>
+where
+    T: FalconDmaLoadable + FalconFirmware + ?Sized,
+{
+    type Target = <T as FalconFirmware>::Target;
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.fw.brom_params()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.fw.boot_addr()
+    }
 }
 
 /// Trait for a falcon firmware.
@@ -412,6 +544,99 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
+    /// Falcons supports up to four ports, but we only ever use one, so just hard-code it.
+    const PIO_PORT: usize = 0;
+
+    /// Write a slice to Falcon IMEM memory using programmed I/O (PIO).
+    ///
+    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
+    fn pio_wr_imem_slice(&self, bar: &Bar0, load_offsets: FalconPioImemLoadTarget<'_>) -> Result {
+        // Rejecting misaligned images here allows us to avoid checking
+        // inside the loops.
+        if load_offsets.data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_IMEMC::default()
+            .set_secure(load_offsets.secure)
+            .set_aincw(true)
+            .set_offs(load_offsets.dst_start)
+            .write(bar, &E::ID, Self::PIO_PORT);
+
+        for (n, block) in load_offsets.data.chunks(256).enumerate() {
+            let n = u16::try_from(n)?;
+            let tag: u16 = load_offsets.start_tag.checked_add(n).ok_or(ERANGE)?;
+            regs::NV_PFALCON_FALCON_IMEMT::default().set_tag(tag).write(
+                bar,
+                &E::ID,
+                Self::PIO_PORT,
+            );
+            for word in block.chunks_exact(4) {
+                let w = [word[0], word[1], word[2], word[3]];
+                regs::NV_PFALCON_FALCON_IMEMD::default()
+                    .set_data(u32::from_le_bytes(w))
+                    .write(bar, &E::ID, Self::PIO_PORT);
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Write a slice to Falcon DMEM memory using programmed I/O (PIO).
+    ///
+    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
+    fn pio_wr_dmem_slice(&self, bar: &Bar0, load_offsets: FalconPioDmemLoadTarget<'_>) -> Result {
+        // Rejecting misaligned images here allows us to avoid checking
+        // inside the loops.
+        if load_offsets.data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_DMEMC::default()
+            .set_aincw(true)
+            .set_offs(load_offsets.dst_start)
+            .write(bar, &E::ID, Self::PIO_PORT);
+
+        for word in load_offsets.data.chunks_exact(4) {
+            let w = [word[0], word[1], word[2], word[3]];
+            regs::NV_PFALCON_FALCON_DMEMD::default()
+                .set_data(u32::from_le_bytes(w))
+                .write(bar, &E::ID, Self::PIO_PORT);
+        }
+
+        Ok(())
+    }
+
+    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+    ) -> Result {
+        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
+            .set_allow_phys_no_ctx(true)
+            .write(bar, &E::ID);
+
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+
+        if let Some(imem_ns) = fw.imem_ns_load_params() {
+            self.pio_wr_imem_slice(bar, imem_ns)?;
+        }
+        if let Some(imem_sec) = fw.imem_sec_load_params() {
+            self.pio_wr_imem_slice(bar, imem_sec)?;
+        }
+        self.pio_wr_dmem_slice(bar, fw.dmem_load_params())?;
+
+        self.hal.program_brom(self, bar, &fw.brom_params())?;
+
+        // Set `BootVec` to start of non-secure code.
+        regs::NV_PFALCON_FALCON_BOOTVEC::default()
+            .set_value(fw.boot_addr())
+            .write(bar, &E::ID);
+
+        Ok(())
+    }
+
     /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
     /// `target_mem`.
     ///
@@ -645,7 +870,8 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
-    // Load a firmware image into Falcon memory
+    /// Load a firmware image into Falcon memory, using the preferred method for the current
+    /// chipset.
     pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         &self,
         bar: &Bar0,
@@ -653,7 +879,7 @@ pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
     ) -> Result {
         match self.hal.load_method() {
             LoadMethod::Dma => self.dma_load(bar, fw),
-            LoadMethod::Pio => Err(ENOTSUPP),
+            LoadMethod::Pio => self.pio_load(bar, &fw.try_as_pio_loadable()?),
         }
     }
 
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 89babd5f9325..a7e5ea8d0272 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -58,7 +58,11 @@ fn signature_reg_fuse_version(
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
 
-    /// returns the method needed to load data into Falcon memory
+    /// Returns the method used to load data into the falcon's memory.
+    ///
+    /// The only chipsets supporting PIO are those < GA102, and PIO is the preferred method for
+    /// these. For anything above, the PIO registers appear to be masked to the CPU, so DMA is the
+    /// only usable method.
     fn load_method(&self) -> LoadMethod;
 }
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..53f412f0ca32 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -364,6 +364,36 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     1:1     startcpu as bool;
 });
 
+// IMEM access control register. Up to 4 ports are available for IMEM access.
+register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
+    15:0      offs as u16, "IMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+    28:28     secure as bool, "Access secure IMEM";
+});
+
+// IMEM data register. Reading/writing this register accesses IMEM at the address
+// specified by the corresponding IMEMC register.
+register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
+    31:0      data as u32;
+});
+
+// IMEM tag register. Used to set the tag for the current IMEM block.
+register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
+    15:0      tag as u16;
+});
+
+// DMEM access control register. Up to 8 ports are available for DMEM access.
+register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
+    15:0      offs as u16, "DMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+});
+
+// DMEM data register. Reading/writing this register accesses DMEM at the address
+// specified by the corresponding DMEMC register.
+register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
+    31:0      data as u32;
+});
+
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
 register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {

-- 
2.53.0

