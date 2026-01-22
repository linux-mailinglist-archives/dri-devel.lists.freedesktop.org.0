Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD69H86ScWlZJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F12611EB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54E910E8D1;
	Thu, 22 Jan 2026 03:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L5wuQj+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F14510E8E8;
 Thu, 22 Jan 2026 03:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P67FZSSgw8e+kz29FoQ2BMw2kqDaVLupd4HJ6sIfp2vnPCL9nhXiXDSZmgPOk3dZI3M+f46jFVv4lUcv5rgkEyebFztMfGsRd4wSgfprqkN+UAebZqPGWF9gbZCGFmOTCwnOlOYl2EMEGaD9HXDwS0B3WTfn0f4KkbJeefsDaqqc3hcs1wiKwTc1cB/rjonR582FloYqQzyyWMSrzykrdYtiYlQnQQbNOzNHBuEYBw7yu7l7ey+1RMI3rUJmW55tncbjNny5tjYVP7y9TYafzn05m8b3kndZtCrIYkI73Gb+fv+5eIIkm0KlBmuXGo41LKgDvAcea5B5sxfiGBD/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJVRE/Lg6+H/iFUgGm3W88U8n6pTgNs2h6GprJcfWoQ=;
 b=jnxAif79JN+AkJZ0s8EIJiv6dfncqnM9OF2iHKmz/s4hCER1ritHGMALoQ3yK27g+AwaZAz4e8BeSFJHrBWMz4lsyEEyhBLsd2et1Qy2oug+VQ3cZ/N2/vAo2Ee9isXwy8g7c4Ohjw/w8VUVilZR7YXBOG5ZcxxBhW5vViMgUm2ybR3LK5h5iUuZOJloAoEzmqtsP5Sk81kch0ustPE8OpN6AFpZCivCsIl2bJ7EiOxD/HBdr73e6iLSdJZuMWsoi2fobCUI3Qgld98tcHY/3zOtdpY5bQv07G3nM1bEfPQAEzfkoiqgL4idX2rgvGyfxiBEr9HLQVB7JH/FlQADkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJVRE/Lg6+H/iFUgGm3W88U8n6pTgNs2h6GprJcfWoQ=;
 b=L5wuQj+k69cO7mYbSWOUDPCVfueTzSytGkZaA81PqX1sNbuwj0eDT5+6yIxW/iFia6yiSuGG1cHGpJWhOPNMPH3QBKdZMp+monriVUksp3zScHefOvvypvm9aSHLfwQkZkGIvO9aIL4PD3f6jb3nsvVE+QJcsq74jTe+PU0DzRbqcq8ceC2L7jNKmzNn1JzX0ZJxVbKlmcCtmflG+xTfP8935ULJ0PYyfOHPwu7V96T7vd1fDLHZtbxT7Cle01uJ6Yf3uL97fXS6q/MlhA3YMuIbFNbmBliUAkxXEtK0Krffmck+jdUBRh9UT8bCwhu32OKrv5Tx+EDozf2RBDE/wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPF7D510B798.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 03:00:22 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 03:00:22 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 22 Jan 2026 11:59:05 +0900
Subject: [PATCH 2/4] gpu: nova-core: gsp: clarify comments about invariants
 and pointer roles
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-nova-core-cmdq1-v1-2-7f8fe4683f11@nvidia.com>
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
In-Reply-To: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c432f6e-1814-4735-39aa-08de59626213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzlqTVhwY2QxeHUrR3NVdG9VRmg3Y2lJUzR0TUozRWh3OURBV0M3bTZzL1Fk?=
 =?utf-8?B?TzVnMjBIQVQzUEFuQ250TWFBaHh6eW9OS0VVTXR5aldYVmN3RUZoNGx3cFlZ?=
 =?utf-8?B?NzM1dGN6TEFnNHBpYjFBcDh3d0V0T3hzSVdJcWRWTmZibWNuZ1g3cTVkZmtF?=
 =?utf-8?B?V2xnRWI1WFF6Y1E3TGRZUnZrUTVvdjRoU0JLcmViWUJMTmlBY1lRUW9hYWc3?=
 =?utf-8?B?dWs4d3I0enFPZlNyTDlNSERycVBDSHk1Ykh0OEN1RDd3bVl1cnR2Z2VFcnFK?=
 =?utf-8?B?UkRpTjdQekpHV0xyWmNRZXlVNWNsQzU2a05kYnJmemRvMVhWQ1pWejlaVEpJ?=
 =?utf-8?B?RHl4K2wwMmtkWjVqeGJTNnpLTUZnVHV1N1JjQmsyRndyZDEwVyswNU1ocjgz?=
 =?utf-8?B?VjZhTzFuMVRNbkxMaVdubEowSmdvZlpseCtHSGlrbFVXa1Q1aHVFYXlSNEhr?=
 =?utf-8?B?TlQzZ0lHeFF4OWhaaTNBU3V0RXlzOFJjK2I3MzRwemIyZEhCak41cDY5ZFg0?=
 =?utf-8?B?clp6NHhDUm1CeWFaNFpzVjJacUlDbWhDUXZ2RDk4cjMrWVUvdGZwdkdrSnBX?=
 =?utf-8?B?RFpmeWZoYTJQL2JhbkJGSVRMSDFjanhmVWh4ZUhyYUdHSlNsZlZnMVYvWFJ5?=
 =?utf-8?B?ZDRSdDFTTEh6TWtkRGNZUzFSVk5pUDRWUGVtRVhXZU5tWldwRlRhblp4bTFF?=
 =?utf-8?B?cHVabnBQbVpmK1VIOHplTVR5M1RoSnFZVTl3dkNDclk3QVN1UFVhLzFkMVI1?=
 =?utf-8?B?YU04RGM0RGNzY1o4ampNclNrZ1EyeUJ6dGg2V2wvUk1JbVpjNUViRkY5STAx?=
 =?utf-8?B?T0JXU0JIOVl1Um12bTBpbmVhaU1HSEhxUGdrTHdhQ0I3UmFmZmF4VmU0MlQ2?=
 =?utf-8?B?eENpb3ozcVdpSExwcTVOcFVuNmxsSGVJdVZhdThlUFlrTWJ6NVJuWGRkRnpa?=
 =?utf-8?B?d3ZRMnVqR2x3ZG1JZ2FzblFRenM2VWpUV2FEZmN5emUyU21zSS9RM2pTaEpS?=
 =?utf-8?B?Ukw1MVB2UE56VlpPenptdnFNRFRqR0pnZ0phMFhmVk1HQWVISTA1S3lFZkpV?=
 =?utf-8?B?ZEh0KzRmZEhvWEJEMG8vUUlGU2hjYlpyMGVkTXlabndBMkxhODF1OW1PVEJD?=
 =?utf-8?B?YmdjL0hBMlNvR0NHS3V5U3htUk9vamhsNkVDNmVrNCtoeHh6RUNHNk5DZVgx?=
 =?utf-8?B?bm1nSUN1M2xiQy9OUmZzVWlaTDhEa0o1UGU4eFZWdGxKTldZMFZaSE1ZZjlZ?=
 =?utf-8?B?MnYvUkRBMExqQ1ZPVnVqZG1OVDJseFBiVFFncksxVW1FRFM5bzRNcjNlZmNo?=
 =?utf-8?B?dVdrRWRFRUxCQURVOWFQK3VoRkJ4c1h6YmFtcndUa1ZWK1E3OXMvamh4Z08y?=
 =?utf-8?B?MXVZYmgrazl6L093d0RLTThmM1l4aGNQYmJzcmJnNTQyK0d6NC9BV2JTc3JQ?=
 =?utf-8?B?RlZ2dDNQMUVuaC9pVjZWN3VyU3pOL1prRmkwVUFwanZ5YTk2Y3hDaUNDWFlN?=
 =?utf-8?B?T2wyem5XWEVwWm0vbWI1eDkwMGFFd0QrdCtKRk9xSGNON3ZBVkNLMnhZN2Vj?=
 =?utf-8?B?bENvZlBKNVY0YW5Tc080dUx6TmFSekhLcFpIR2VuSm9CU25ZUk1kQ3QrTFNy?=
 =?utf-8?B?NFJiYnVKR1hXM29vMWNVQ2JodFI2a05kT0oyTjBRUFM1blNHZXlZMEFoREdZ?=
 =?utf-8?B?ZnJPbHcrNmFWNTcwbXNBZUt3OWduQ2ovZndnbzVaQklRa2Z0N2JDRDB5VGVt?=
 =?utf-8?B?SXB1anlKT3pkM0NuU1V2Zk5MWmRUOUNSbW5IaEpzTXEwdDNoWnVoKy8vVnBQ?=
 =?utf-8?B?Qi9oRk54b01XSTZMNE5ZQ1lpVy9EamU5dDVMTjhZNFQ1cGFQVUg1OVBrSk1l?=
 =?utf-8?B?SjNzcEtVUURxbnhUZDAvc1ErbWsyLzRiSndTcnV3SGI0bDFZczExUmtGUVZy?=
 =?utf-8?B?RGJqdTM1dzRmb2xvN1JpUCt0OE5oZVRzanZhcGZRTzZReWkrelpSc09SMjkx?=
 =?utf-8?B?Rk5VUklKN09DMGRITXZqVXpiL1ZPVFdHa2lzdVZHMWJxV25MS2d0a0Z4VCt0?=
 =?utf-8?B?cysydHl5NzlDdFNQaDJueDU1NjIyNGdTczBSUUZoaUlteEdUalFQSG50cDBj?=
 =?utf-8?Q?iSMc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHkvbndlK1BQZnpTV1FHekNwa1F1Mm4zN2VTV2hBWjRXU3dDb1pMQ1RUcjhN?=
 =?utf-8?B?czdwUENrSGZMNVVKa21UWElKVVVSRDNIRTN0TzUrWlZlTDE1ZStEQUlJQTZG?=
 =?utf-8?B?Z3UzWEx0ekt5eEoxY0ZYYnZ2dEp6c3F6MmFxZWE2WC9zSURxVlhjZXBobzM0?=
 =?utf-8?B?a3lNcTY2SkMrSE9KeFZkZFNqMGNTZ3U5WTlSOHIyam9VZmNNZjZOaThWaHFn?=
 =?utf-8?B?T0hPei9USzlDejJRaldnVThVRDBDeXN6MFN1RFBIandGL3paMTZMZDcxcGZR?=
 =?utf-8?B?V2NIWDVuZG82ZW9zSXpDY3AxajlnMmp6TkdQbThnV1JQblJBK2VBN3dTaThP?=
 =?utf-8?B?amxCWGRsaEhabmdFVm5uTjlwc21QVFBhcit3c0lSelJGbVh6VDNFYTdUUHdy?=
 =?utf-8?B?d2VnRS9TdXJITE1FcVcrUi9HMThsRzVZT09nMVNzaU1wSlhnT2oyTWxGSjRj?=
 =?utf-8?B?NnpwdkFUb05JMUpqVjFSVzFYTmc4QmlTeTIrd2FhdHc0Y1hDQ21GbHNzRHlI?=
 =?utf-8?B?UWEreVVTaHgrWW5lakJaUVd6ajY1WmZmTFBobG90UGpZSXVJNGk4d09LRmdT?=
 =?utf-8?B?Ti9SRHNuZWJ6OEpDTHdjc21KUHJ4dDIvSkFHSmJhY29Ta3AwRmVXVFZKb045?=
 =?utf-8?B?UjJPVXpPUEZQN0hra1ZGazFYZ251cGQxN1NoQ0JtQkwwdms4Y1BRV1NLQWhx?=
 =?utf-8?B?NnBXa1V4eUZibENHbDgwYURXdTMxWGRVK01rWVhtMktDS1pRTm82Y1JwdjJD?=
 =?utf-8?B?V0Y0MU5WVm9wNjJNQzVDaDZ2OWtVRXRpdCtXZlJhQmxGSFRLcFNJUTlmaEdu?=
 =?utf-8?B?b2lhdE5kOXIvODd2dmI3djVxUzhPamk2QWpCSWlCemZEQ2tHUkJHRjNkRnlQ?=
 =?utf-8?B?UDRKQWFVVFRXWXJJMkVBeXJHMmQ5OTZhZEF4YlVSTGhpdDdKakF4a3RsK0pT?=
 =?utf-8?B?STB4TVRTc0VzNzM3VFVMaERIM0s3Nkh0b1VtMTZqNFV5Q2VuMTBYTkRLeWVG?=
 =?utf-8?B?eGtVTmh3Wmk4aHA4UzYzZ21nNDhuM3g2eHJXNThFQ1E5Qi9MSFhUVEs5allC?=
 =?utf-8?B?ek1vTW9seENpWjNycWpJUThqQTN6cThEOXRJaEliS2pkTGV4WmRiUW1WT0RR?=
 =?utf-8?B?QWtNUXB1c3JmbjVHZUloOEhZZU4yRG0vUm90bU0rTkNQV0MySiswc21IV2Z3?=
 =?utf-8?B?ekdxOENRSnozOCt2bEcwcW9Fa2JOZVRCc3ZVbnpVOEt4bm4yYzY1dVhEVUNh?=
 =?utf-8?B?a0p5WG8wcTlYbzU2amU4K3VVQnNyVzBVSVZNclczVDlXYXpLUUVzaktXMnpC?=
 =?utf-8?B?ZEZJWnp1bnVTMlFVU2RwTWZ1SjdZaWtuUGJyYTk5OTFhejZqcGlUWGNBU3VR?=
 =?utf-8?B?aks0bGlZWjVua2VCY2txR0J1OVh2MVBJWVpJeTJGOG1hOHA3bVRVaG1wRVVM?=
 =?utf-8?B?L2x0Y3dSY1grN3BMdXlOSGVLYm5qWXFzQ0c3VmRUbXZnRkFzSWtjWFFaRkFS?=
 =?utf-8?B?eG9RUjEzZjlxaTBUWXd5bW1pM3Avdm82WmdGWThiR0hYUzNCS0pYc2o1UElR?=
 =?utf-8?B?S1dIc3JHZVJoNksxK3pPNkxmVkhpNzBwVVZQVGhjb0txMWdPOUx4eEJBZVBS?=
 =?utf-8?B?QWJDL1Bxdkh3dkJlSzR2WVBYa0JRVUw2U3RDWmluVEJ3aFRRNVY1VWVpb0Vo?=
 =?utf-8?B?Sm1ZbTY2MnJ0clVQeHhsdXMzUUVPUmtsdHBPdHQ1cmFFbDdvcFErNWd0Qytn?=
 =?utf-8?B?Q2hwK0xLN0VIWDUvVWh5Q29BM2NRbTJSUUF3eDZoNHRvT201NzlmUHR2ZGU5?=
 =?utf-8?B?MXMvbmUrbVBIODVlRy9WQnRqQTBGMm12ZTVJK0EyNVFqU1psREdjVVN2Rjd1?=
 =?utf-8?B?KzJ6eUdib25Ta0lrSlVsRGQzQlM3RlUrWFp0cHNqdU5hQnZBbW94Zkw4dzNX?=
 =?utf-8?B?Z1JwU3A5MkxUUkl2M2pBN2E5dTAxYnpLd1VOVFNiMVg5T0tqbGNybWg3TXpx?=
 =?utf-8?B?VHdFYUw0d2ZNWFEzS2RDRUNjenNWQlhERTc2bzBxUFI5SCtHZFBqVy83Q0Jk?=
 =?utf-8?B?ZUJpaW4vdW1xd3E3TXhmeTI0MDdqNWhOYXVtWHlZZzZ2ZVl0RlJRd3Y0YTZZ?=
 =?utf-8?B?UTkxVTNwdzdWTGZQNmxyY0o5NFhLTWlyd2hPbjJDMERQTVVmS3NSY3JNZERq?=
 =?utf-8?B?bGtERnppeDNrenVZeGxja25VeXpzZ1cwVWNVREV4eG9NQmQvZVNQbTBoSnlr?=
 =?utf-8?B?ZUxwc0Fzdjdiem45dUQxa0tZa2QrS1Vka0k2elVOL21jNDhZK0FwMmROb0Fh?=
 =?utf-8?B?WVlYUHQzUnI1NE8rVUJZU2NsUklyamIyNUI5TTYwMS9laUhWdVlqUlkvTElL?=
 =?utf-8?Q?n8mQ+ag0HSih38nOpMHC1v8GyqqqaQUPkryfDAa7YDF/F?=
X-MS-Exchange-AntiSpam-MessageData-1: BiUBINwW/sbLxQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c432f6e-1814-4735-39aa-08de59626213
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:00:22.2536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iof8fikuDf8mm606W7sAOOIsnlYOp04XGQUC3tC7idY0l+txNmHDg2RVU1fKAY5RzehYENnWIQQ7tABI9gkkHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: E7F12611EB
X-Rspamd-Action: no action

Disambiguate a few things in comments in cmdq.rs.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f139aad7af3f..09c28eeb6f12 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -161,12 +161,14 @@ struct GspMem {
     /// Self-mapping page table entries.
     ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
     /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
-    /// write and read pointers that the CPU updates.
+    /// write and read pointers that the CPU updates. This means that the read pointer here is an
+    /// index into the GSP queue.
     ///
     /// This member is read-only for the GSP.
     cpuq: Msgq,
     /// GSP queue: the GSP writes messages here, and the driver reads them. It also contains the
-    /// write and read pointers that the GSP updates.
+    /// write and read pointers that the GSP updates. This means that the read pointer here is an
+    /// index into the CPU queue.
     ///
     /// This member is read-only for the driver.
     gspq: Msgq,
@@ -222,7 +224,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
         let gsp_mem = &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0];
-        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<= MSGQ_NUM_PAGES`.
+        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_NUM_PAGES`.
         let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
 
         if rx <= tx {
@@ -257,7 +259,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
         let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
-        // PANIC: per the invariant of `cpu_read_ptr`, `xx` is `<= MSGQ_NUM_PAGES`.
+        // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_NUM_PAGES`.
         let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
 
         match tx.cmp(&rx) {
@@ -315,7 +317,7 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inclusive.
     fn gsp_write_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -329,7 +331,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inclusive.
     fn gsp_read_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -343,7 +345,7 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inclusive.
     fn cpu_read_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 
@@ -372,7 +374,7 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // # Invariants
     //
-    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inclusive.
     fn cpu_write_ptr(&self) -> u32 {
         let gsp_mem = self.0.start_ptr();
 

-- 
2.52.0

