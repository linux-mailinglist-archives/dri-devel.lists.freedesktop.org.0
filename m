Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78019ACE44E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 20:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B8E10E7A5;
	Wed,  4 Jun 2025 18:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aifstS76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584A310E784;
 Wed,  4 Jun 2025 18:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKENNjRLqH+/eLCWS9RL9EBEinp8ZFyZbiYOocNHUz74Ozgb4hVqFm9SE5bIASRjkc8Te0yfyK1yVF+ateU4jFAz7dCsQC7uRXiVbP3uX0ecOoJOEc3lvFyCUXUgDdkgfcVOSGS3coJpugSMXc8aWaL5BmuAekTddGb/Qy+yqb/dZ5fTOObReeFKQtx8fkoZDVIdPkjnm1EfdlNWdB8+Y1w4OwvgH4aG+S/3as34u6tDpgmd4FuOvehkOE3x5284U9S3x3w6D6Zxd1Pudl1lBzG1RmXvzYrrYL3PwJDyM14zTeDrlginzEUAvDJHas2ik+VrbXrlAEJLdJmPgmQxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOFRMMtgvf9CjjrXWCFC3mP5yHiysTTHFgN1ZMKa0lU=;
 b=HcXXYY+DfJqFduh44lj8Nn4JHNNG49NJJ7XdsFHGmm22jzP2mJ6+JkwvjikyQIMKTw+mh4WWoMUwF8H9QsepnP/LUXLwvZOrpHmT2gNqPQU83iJaHRE7po1nJgoUv9f12NWKGemiwGgjqrs0yXM2E0XcJtQiMAfXHs6KaLIFIe1EihUkuvWPch/2D7UnNAXk9QkNSk1rdjkvM9ZtFNXK88eH21kn7gx+9x85ke/eaTle2oLTnzI47D922hjDcLgR93A+tpEyE18DZWqNXgl2hbxTMjzeXGHdXJAkara07jByQKFtKDDNTKtzAwxST2U/+0MwFoVY+A5/CFzrS1fWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOFRMMtgvf9CjjrXWCFC3mP5yHiysTTHFgN1ZMKa0lU=;
 b=aifstS76PuiTPD4QTQ4rS2leEmw2wBFc0CBSj/nWU8CIxlmSOFHwoOo1aoQi2FLjKROdGyYqehmtjbhPcYkSe8ZIxVVl8l/ha2lMm5jgVzxxrNUMBFDQe/AgGzbOe9ehjzTrAzN6/25QKugcok9VGCUSdo2UQY3Ci7Cy/rFDhszQUaEDiF69C3nHRiRhdIgDNcCvqDSRvcEb3msXBMcn/S/NsT1jewgvZKl5ZT4ebXo3LsPpD/SzgKp5z0UEKaPxBhFGPmNOBOO0irT4NQENVZzJV9CPKNTWaHkRHs8LSHkpLxkMy0nHG6gS57nRZ0DfUK4B0Vousx3BgiQsGC/vHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7167.namprd12.prod.outlook.com (2603:10b6:303:225::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Wed, 4 Jun
 2025 18:23:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 18:23:34 +0000
Message-ID: <5e9f52d0-d2ad-4d25-a481-22f8c6055021@nvidia.com>
Date: Wed, 4 Jun 2025 14:23:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
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
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com> <aD2oROKpaU8Bmyj-@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aD2oROKpaU8Bmyj-@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a60ddbb-b5fb-4533-352e-08dda394eab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1ZpL3RyQlBJM2F5c3BzUU9RL3duMW05WkJ2MGRIMXhDdmx2VWtDRUUwRCt6?=
 =?utf-8?B?aU15azdleFA3L0xDMFlHcDR4eGxrTXE4aWRQMEV4Tk1jSjA1Y2ZiK2QxR0Fx?=
 =?utf-8?B?cVJkeDMzN0ZRanpZcmdmYmZHUDlOanhqa1EzTTdXTE83TzFBTmMzazc3QUZO?=
 =?utf-8?B?V1diWWlmMXVxbTBrcHhrb092VVB2cEU2NCtjTWlPdVpYQXlGUGFNcjlmc3lm?=
 =?utf-8?B?R3pqcWZPOU96dzlLVVBQaGpTaFlDVW15STQ0bWVjY2FVM0ZudU43MjhUTG9t?=
 =?utf-8?B?SEtERVVib1VZSi94RlljT3lKY0pnZ0xZaGNUYWlQZW9oem9xb1BSdUVFaHg5?=
 =?utf-8?B?Y0lYUzd0aml3Nk80NGxCMkQ1WXVIVFo5UDR1NmtrZG1RYWtJbU1WaUFZSGFE?=
 =?utf-8?B?djlFamF3TEtEUEYvT2d5dU1QeExoMWNyYTEwbmhVNk9lQ2RNbWI5dVpJWjl3?=
 =?utf-8?B?emhtanVNTEkzYUJCSDVCaitoR25WU2MwWkZZelJmZTRSN1Z2eGZ1dTZKcnFz?=
 =?utf-8?B?TzVMcGdMcXF5QjBsOVY1NFVLakM5bmtjVHFuWkdSK1lWV2ZVVjJlbU9ndUxF?=
 =?utf-8?B?cTlMWG1UL2RhNk9WWEl2bEJsTTZSY0doTG5vdTBOQWMwTEZFRE82V0FIL1Nj?=
 =?utf-8?B?OUJNQnc3SDFUcUlUSmlRd0NpYlkyTXowMVJYVEFvV3VWUXQ3N29wUERtTllw?=
 =?utf-8?B?UGlPdVpuZ0IxR1MxV2ZCNnJSWlJ1d1dEN3pxUlNYeFBqV05jZlNTWEpDTjgv?=
 =?utf-8?B?V1NUNnJsQ3hBeDZCbE9pbUJ5a1BCSXM1dnM0ampKeENpaHE3Z2FEVG0vNTdp?=
 =?utf-8?B?L3pySkxzL3kvdStZTkczN1ZOMUVlZytZbTR5VlpSVEtUUGk4RHZIUnJFSmE3?=
 =?utf-8?B?cjdlWkNFdlhJNVNwZjExN21XNCt6NnhRVUFPb3NGQm9RaGhBS3BZZmNXalZY?=
 =?utf-8?B?MkNuOUpXcXRsSXA1SFlveXlUbHBzNHJzL2ZlWmo3Mko3ZGM5SkhjTlZ4Ymlt?=
 =?utf-8?B?U3VEcDJtdUFQb0wwUGJzdmtUZlpiZE5WUGNsL1dFTlJFN2xINEk2MHlEYVoy?=
 =?utf-8?B?QXZWMlMwN1JMNzlzbkpPdUVsRzR4VTFIaG95MDMvMTdPdzI4L2tVdU5WVmg2?=
 =?utf-8?B?b0tQaGU1d2piaUZxL3JOVkJVTzZKKzVVRWswbm9KSitpVGJ3NU1Db3JSMGhS?=
 =?utf-8?B?dHhSNEZYVGV6SVN4VWRWVnJGOU9FNEZYbUFtY21DTUxLMndLb3krMHV5bXdI?=
 =?utf-8?B?Nm1jbHF1TnBxQXNZc1E4cE9ab0RBdTRhNGl2enA1T1dYWnJrMmk0R1ljYktR?=
 =?utf-8?B?d2wrOFdFYzdIUU9Cd1dYVVA5a3Ryd2tzQ2xObjJGSXl2OCsvTW1PQmZEbkJP?=
 =?utf-8?B?VUVibVZBRnhDZjk1SXExOTJSeEhBUy92Nmh0aUlRb2wzMHVHR3VnR1R5V2p4?=
 =?utf-8?B?dVp6ekd2MWtoWnZRM21la3pHa1E3WElVbHFVbzluNHRHZWR1R1AvQnRBZHls?=
 =?utf-8?B?cVBoL3lUT04zSjZYcXdPN3FXemp5WUVsN3RUalExVithQTdkb29oNW91VVpo?=
 =?utf-8?B?dEpZYUNkbkxqQkFOcE5pbGtkREw0amhxRGdvcVFSR2VFNUZwQWN3dU4zd1Fa?=
 =?utf-8?B?dk9mM1dVV0w1SE5ubjJxNWJhdkhlRDhxWC9BdUVQYmplK21aTXRBRld4WjVI?=
 =?utf-8?B?NU5wQkZnbVdIcktYdWRmS2M1SDlPUzg4dit5TzlNYUNmbUMvemZLb0tKVkZm?=
 =?utf-8?B?dGxhRWdXY1lxOG13eHBtbE5oQ2dkNnBuNWRmaFVPZkpkUmF6VWhkMUJxZUdY?=
 =?utf-8?B?UEJmOFFPc1d0Y3k3eVhWOUZjOTBqb2hrVHlOMVRNY1hxdW92SjdPUEc3aHlp?=
 =?utf-8?B?cXhscktzVGV0MjJhcVlJNm1oZUhjTXZYOWNYOWN2Zk1yTFpuODB3VTFSYXBX?=
 =?utf-8?Q?hjU6WiYshbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rmt6N0JCcWZORExISE9aeklWekF4eUt4WlZJSzM3SE1Ca0Urb0JlM2t4R2Yr?=
 =?utf-8?B?TGNSQ2k5eU9pem4zWWd2c3hVWDIwejM4MU53THlxd1lLYXQ0WkNCNTRoRE11?=
 =?utf-8?B?bXVoSmE3OTNId1Z3cHNtV1VaN29BUjROcUpXM2ZwK0kzYnhGY3BYcTZ1dldD?=
 =?utf-8?B?TmVZZmN4YmpORlpzSEI3K2hwNGVBQ2MzazhyN2pmZVRtQkJKaTFuWUlacGxk?=
 =?utf-8?B?QU5ET0lKOGxNeTMvR0RJU2pHRUc3TVViSTVkVWFxcXZZcWhCdHJtTWxOSG1q?=
 =?utf-8?B?eEU5SzF2VmpYNENacEpYaDl6Q2hKODR5bXNhajVydjAvazU0S0hwN2lIMi83?=
 =?utf-8?B?b0YyL2JRem01MktYTThKVEdId012TmV4MzRvVTNHWjRCRi9oYTYxQm05QW9D?=
 =?utf-8?B?Sm9mcDBWaktoYWFlT3F3MGh4aGd2SkpUVlZaMTkvZ29jcEIzNzkxUVRzOXVC?=
 =?utf-8?B?ejFFN3FaOSs3N2JlZDM3aSs3U0RXWXNsYUVhak5EK3Z6SVQ3ci9BcnQwbE5m?=
 =?utf-8?B?QjdreHNBOVZuaUZEVzFvOGpEYmQ5RTV5b3kzdGEzM0dEbFFqSlBadjNuQ1dC?=
 =?utf-8?B?dVZWd3RwRTArVnY4RDZmTzRWY1hVYzVuMjg0VDVYNitFRXVWR25IYXNLN3lO?=
 =?utf-8?B?VHhKMi8rbEd2aE5HUFYyRHRydlo0RGdhQVpNbWFQdEJyRVBzWCtXL0Fxcmkv?=
 =?utf-8?B?ZHBzclFzNUxhbGw0bUFSQjBxN3RzLzB1Y0JzTFZtQ2w5dkdRT3phTFMyWHdM?=
 =?utf-8?B?TlhMbjVuZE5LOTRiV3hLT2pRNEdiZXlZSU1MTlk5bmVaZ2FCTU1xbXlmRGVX?=
 =?utf-8?B?dTRIQ0FKakJqMWhqUHJyTCtxV1Y1Q1FRMWlCN2JkMjc4WFZrSXlVY0lFN0VP?=
 =?utf-8?B?YWczTE82NGVwZzE3VHgva05FK3VmWmluT1B3QnAyQkhqZUZwVGx4aEViMU9F?=
 =?utf-8?B?UXRNK0piaHVjMk5hMEo2R3IxRllJL2UvZjhyZldLUWJGWHQ3eU9zYzBSWURu?=
 =?utf-8?B?YlY2SU55TTZnY2RsUis4d2xJL3U3WlIwU2szVVd6T0d5R3NLenBmaC9iN1p6?=
 =?utf-8?B?WDVzcVBXaGpWbDl4UUVwZkZaOTZ3dXZ2Y2xsbCt6MzhFZStHazBWUnlCVkNN?=
 =?utf-8?B?aVdLamhWT3ZEd3ZBakVwbWMzeFVjRko4VUxVS0x1S1RSRmk4dkl3Qk5zVjRh?=
 =?utf-8?B?TDNCRW9uak12K1l0THk3U2NaR0lKZWNMeTBKNXNNK2cwcXFGTzlwa2lrTGRw?=
 =?utf-8?B?ZzZmcVBqVng0MlZlbHNmUVdnb2ozZkNJT1pRc2U4U0RQa0dlUlZHb3lNVHJ6?=
 =?utf-8?B?ZS95VmlSVjRJS1V5MjZaYThUV2ZzR3UrdDNib2E3L1dsWDFnM3RMSytuWHAx?=
 =?utf-8?B?NGllVEtaWitVQkZlWTNVMG5jOTlTbGtwbVNlWlR1Yzh3NnBYbEt0OXowcFEw?=
 =?utf-8?B?b1N4MUtKTHYyK2tvRitWQ3Q3WGk3YW9pMVdXVkJaZWMwRXVqdFVScUlhUXAr?=
 =?utf-8?B?b0NJVThIZTBHSFB0a1JnRkQrYVA4SGtWNytZL09JQk9tbWZVQy8wNTU1UFR0?=
 =?utf-8?B?UGQ0NXI1R3ZhYm5DNXFTYmI2NXZSbTZDbDcxaXVhMG5xSGJPUDBBamdRbFM0?=
 =?utf-8?B?dUgraG5GbHRNM25nNCt5T0tDQ1U0VW5ONXRmeHFabTRxSzZROVRKME84T3RJ?=
 =?utf-8?B?NFpUR1VJT0k1UkJYNnNmcFRSeVJVenRSL2RwQzNKUjlyRytVbWJwbXFXMXpE?=
 =?utf-8?B?R3ZYK1BXaEd4bndhckhzV0ZQSnJKQ0dUTkYyQWdYcXcwZmxJUVBPcUpPVmRz?=
 =?utf-8?B?eUFpZElTd3BtZUEzODNGbWFoWWk1cVhKWCs4NEk5V2ZDWEg4T09CQ2xVcSsw?=
 =?utf-8?B?L2N4KzRhTEs2ZUhHelBCeU00czN5Mi9rMDJZaE5sMFczZFIvMjRsd1gyZ3Fw?=
 =?utf-8?B?bHdhc2U5VHE0UnJzQXFQWjJZZlRjRmFtRlVRTzdFYXByVGNHTEk2UHZvK1pK?=
 =?utf-8?B?Y2JETEw2a0tCNnFVSjNqeE1aNksvY1NuakYwL1JFWXZObW5Oem51ZDBPS2wy?=
 =?utf-8?B?SU1UdCs1R3RZeC9JRHBiblVWVmpDRnI3aDJxbzBVcXVnMFJMM2FheitDM2Q2?=
 =?utf-8?Q?Bfm0HQmb10wJd4X3om6BadI16?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a60ddbb-b5fb-4533-352e-08dda394eab6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 18:23:34.7068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMCePpkPJn/qDTxRR+UUC87BQ4Ln1LbLZbH89ocs0213cMQkea3UbGlvjjlVJI2rINKITyzqLmf/XWP5OGiZVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7167
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



On 6/2/2025 9:33 AM, Danilo Krummrich wrote:
>> +    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
>> +    fn find_in_data(
>> +        pdev: &pci::Device,
>> +        data: &[u8],
>> +        rom_header: &PciRomHeader,
>> +        pcir: &PcirStruct,
>> +    ) -> Option<Self> {
>> +        // Calculate the offset where NPDE might be located
>> +        // NPDE should be right after the PCIR structure, aligned to 16 bytes
>> +        let pcir_offset = rom_header.pci_data_struct_offset as usize;
>> +        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
>
> What's this magic offset and mask?
> 

Oh, hmm. I had a comment on that above though ("NPDE should be right after the
PCIR structure, aligned to 16 bytes"), does that suffice? I could move the
comment further down.

>> +
>> +        // Check if we have enough data
>> +        if npde_start + 11 > data.len() {
>
> '+ 11'?

Good point, I replaced this and the above with core::mem::size_of::<Self>().

> 
>> +            dev_err!(pdev.as_ref(), "Not enough data for NPDE\n");
> BiosImageBase declares this as "NVIDIA PCI Data Extension (optional)". If it's
> really optional, why is this an error?
> 
>> +            return None;
>> +        }
>> +
>> +        // Try to create NPDE from the data
>> +        NpdeStruct::new(pdev, &data[npde_start..])
>> +            .inspect_err(|e| {
>> +                dev_err!(pdev.as_ref(), "Error creating NpdeStruct: {:?}\n", e);
>> +            })
>> +            .ok()
>
> So, this returns None if it's a real error. This indicates that the return type
> should just be Result<Option<Self>>.

I made NpdeStruct::new() return Option only for next revision since NPDE is
optional.

thanks,

 - Joel




