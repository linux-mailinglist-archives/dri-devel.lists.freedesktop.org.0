Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FD2C5FBD9
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF1F10EBE1;
	Sat, 15 Nov 2025 00:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mUMuTNh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010012.outbound.protection.outlook.com
 [52.101.193.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C2210EBBD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 00:29:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzNnR9Mm/a+ysDW7u9gm1D5/uz+06YpRuQ9PwanGHAWPe1/LZRjxreD7q8OzrxCGEkg/dSv4MjsFiAWl2xTVP6oPsUrrx+AltrcT8PgS96c4FubRSnfizDhQkbsEOrtHT3fLwjCew8R5Dal1+JOQuX4NP+1+Wu5/Iqzizri6txict/4mUSf3fhD66/ugRkp5SLDgnZ11a+C4tgRl1QlSk/P6yT655qpYvjQzFabDT2smR/KpusLtiFQo2mmyj12bwLlTn8M+3ZHS5BLxUsm0DuFqZnhTTRZVoWTD00nXyo44SBONDzSZDUL64QUVVdWtGy8ZkA/Hi7YPaPjHynjL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziLeQYgSTlJKqaxafE99QeuKsK9F5rTSACdYGzLPdMM=;
 b=sIRpjPLmWO8VYrb31V9Mfo0yZms/gvtExwebbLfvtccthR9AVZjfkBPQET2RkpVD4Xx+G+E3LzZAVszuIHFeVMRG5MNRVnEIcT+eei1fucZyD1rlnXGzEP7NTD5Okjozx2FCOU5NOBtNszHznmvrVkjW8Go+YML+QQuT5Rg+C0ljy2N9W8BXajpW40JcSU0To9M5bFNYDwz/xlhdp3c23XGZYtHumFGGMQABT7DDtNY268/3Fk4JO8Mmy/mgRYroUzdhOq48x5vmKK1VDctZrwdU19/h1KqPYrnfjb8WXcdaf9n2EPBbY81RXiHPp9Pj/CLpCl2yxK7in2j0eYhBow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziLeQYgSTlJKqaxafE99QeuKsK9F5rTSACdYGzLPdMM=;
 b=mUMuTNh5aqJynWJyPiYAOD1B8HwvUZliggAZZF8Jfm8r7LQ9PQwMvyYcYMmf8QPWaJIfUhg68gB35K4wPksxpxP8KSLbZnGRtBSvFtMbTEPhWK05ojGDZoA2Dwodo6uq1Le+S/ha2kbAYt45BK/JBKOyprnQvMtw5/DNwM7sCxQ1gGkHc3O2/anAuEXHsskTznWWfPpEKHIohkrMvaAJD4ZZ6WMQwdLIfGMx+astnoOP9vjsFW0VCsNAIq9CQtaiAmTfcP75+o96cstSm5yh4q5+EMmLwnQp33ecLDspJzr2ujkccR2fojmPkkrklfaoSexrouRt+tdcDSVIjdhrlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY3PR12MB9605.namprd12.prod.outlook.com (2603:10b6:930:103::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:29:12 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 00:29:12 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] fixup: mm/rmap: extend rmap and migration support
 device-private entries
Date: Sat, 15 Nov 2025 11:28:35 +1100
Message-ID: <20251115002835.3515194-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0065.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::19) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY3PR12MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c11f442-5ea9-43bd-6550-08de23ddfff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFdqS3hDekZ1RnJ3d0RvU2FIMTZpRmxyc2ozSktyVFdJRXAzakpHWms4SFM5?=
 =?utf-8?B?QmtoWm1lNEk2VFlEOEJSTW1JN3B6QnU3Ym5iQWI2TEVjQWJSb2pwQnVaUDNh?=
 =?utf-8?B?NmdsNnRvdy8zaFBiSmdpa05hbGRaZ05oOElEWEl5N2taejNEczRGS2JwQzBa?=
 =?utf-8?B?WmlvSUx5bUdlaGdzdmxPVWtuUi83T2c1UTBKTmw2YUtSZGVmTWUvSkVnL2Yr?=
 =?utf-8?B?RFZKQk5qVmRRVXJJQ0xlYUxQbFd0enVCeFh0RzVha3cwc09vNTFkNzRjZU9E?=
 =?utf-8?B?dHYvdzVTbUVibklUTEI5OWlVTkJkbmpoTkcyMGYxWXl5NnFIWWRXeDNrVjJ4?=
 =?utf-8?B?MzVjM2pUZGhkMW11RXZHZkJER1krWnloREpYOU81UTlZaFdGeTJGSENYM253?=
 =?utf-8?B?cjF1YjRsQUkybHI1RFRPUVpPVkd5bTZ0b2xmUVY5WlhwTUdFa2w4Z2lQNFc5?=
 =?utf-8?B?K0pYYlYwMDZhM2lHYXJ6dVYvMzlGcGQ2cW5kbUgzQkdwTk10bzROOGJrN3FE?=
 =?utf-8?B?M0Jsc290aUUvUWdhRVRhMkRxa3NzaFRlTTlsNGNrSTRjS1poL1QrYTRsakRH?=
 =?utf-8?B?Y1l5Zm1TeXdSK2YvbmVSbDNWbVVsT2FYZkg3blRKSVFKVmdZcVo5MzdaV043?=
 =?utf-8?B?c2R3Skc0c0dkeTIzdURYMUZVZTQ1U1l3ZFkxVEpSMWFOOXk5R3p5c0UyUE9R?=
 =?utf-8?B?U3dYdzdXbW9SK2Joa01qRjdrNjVzeUpHM1pWc2Q2aG9lV2VVMUI5OUcxZjZK?=
 =?utf-8?B?NWhIcTFrNzByRy9vM2hWc3kvWTN2RlpPQVpVQ2Y4eWxRSVh1MUF3SHU3N3ha?=
 =?utf-8?B?NUJjOFFETFN4NHFSV2NTdGdmNUw5ZU5yYkh1ZVlmMzNWY0g3VFptM0M2K0Q5?=
 =?utf-8?B?eldzeHdNZGtMSUw2bnJGU0lURWFkMXhCUkNlZmRueUJ2TmhtNVRuYmF3ZC9w?=
 =?utf-8?B?bDhMRjlDMjE5YzBDTHAyc1YyUTJxY2kranNaWUZ2V3lUbUVKeHQrWUQ0OW1P?=
 =?utf-8?B?bUJKd3RHYlBkcHRWM2tXTXU4WFk5dnBKTVMvN0hXRDNMWUxLeVNCUVBUNDF5?=
 =?utf-8?B?aGNyY2xWS1BlZnpiZVRqVVhpNlVJbTczVU1TWFM4TGRHMVFBMTVhWVlsRllY?=
 =?utf-8?B?M1pCUDJDeTFiZmJiUWJHQXFsb1c0MWtvb0l1TjBpaG9oa2RHNXY2WE1kMVNV?=
 =?utf-8?B?bTAxLzM0dTNlNTlBUytPVndtOGdGK0FsVWx0MVhmU29RdVhET290L3VFWFdE?=
 =?utf-8?B?VjRKejRRVHNwV0J2WEVOL2JuQXlCUWloU1ByRWp3L2F1bmRmRXd5T3JiZU5F?=
 =?utf-8?B?R0lsZ0NtdGRwaDZkYnJiVWJITTJ3N3AwWkhmNEV4V0pQTGVnT1JEZ1VIdmc2?=
 =?utf-8?B?bmxzVFZES1BUb0U3dFB5eWtJY1dVMFY2ekdHa1ZmbkI5WHgrUjBjSzdibk5o?=
 =?utf-8?B?am9SN0szc2FUbmZFd3ZuV2c2dGtPY0psSnlZd1g1YytEODhubXBtZy8yNWVW?=
 =?utf-8?B?OGJabmN1TE9LY0lwazFDNXIwRUIwSHI5bnMzU1JPQVpZYndhSE96SXBvcnFP?=
 =?utf-8?B?eVhNS2JCVUNkQlNyakl1Z1BZaXZNSzJYTytqVnA5QnNneWxoYXlyK3JiWUdC?=
 =?utf-8?B?enVIWHVTM0hxVVA2YkVJeUJwZ25DRjkzd1VmUXVnV0ZNUWs5Vk5IN2E5NURV?=
 =?utf-8?B?MHpxdGNkQjB6MUl5NnczTTNyT1lpYWRIa1c2YnA1aXN0cHhsUDZXUndGb3Va?=
 =?utf-8?B?QVlzbVZCQ2JJMld3YTJpU3FYRmRrdno4RUIxN1NRK2VDTG11YzhuNERtRTZX?=
 =?utf-8?B?Y2c5OUhDQWtkb25KY0FzaWlNYVdvdWhqdXNibVNEd0xKRHBNNlMvTWh2WGFo?=
 =?utf-8?B?Y0ZVemZIZWZiQldKZHhsYng5SnNlSTNpU04xVUYyR2V5Ui9nd1AzeGhTNGhB?=
 =?utf-8?Q?5Uuf0a3iZ3tAiEwz4m36wk3Q1yTv5PIE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW9QaWJtK0x5UkJINjBLTTBlOVpDSnU4RjdKMkxVSDdBeGgrb1NmaTRRUTNa?=
 =?utf-8?B?TTR2UFFsc3VMYkdqaHVLeEoyTkZKa1ZBKzM0bHRWYWVFUXl5NDJrUjd0QXg0?=
 =?utf-8?B?eGRlN0sxS2pHQm1KQkJud040Z0VqNy9DQ25MSHVVTVRyQzV2OWdFSGVYd2wz?=
 =?utf-8?B?TnBFTXhad25WaWlTc293UDYyNk1wandFaktPOFVBRGRYcjNpekVmRUozakxG?=
 =?utf-8?B?eWRTVUl5RWxRMmJOcFo3K1V1TFozaVZGR1BYaXpoNEpNSUszVk9aQmZKbjZO?=
 =?utf-8?B?QWMyazU4a3oyNkxHZWVobmU3YzJVRUlRaHFCYmFGemRVMno0dG9WQ01CckRk?=
 =?utf-8?B?bmVZalpDKzU2YlRDV0Q3MVpHNDYrOU5uMWlHbVRSSEgyVTMrMnF2ZXQvS1ZN?=
 =?utf-8?B?b1dwVGk0OGo4OXRaY24wU2ZUVVFpNE1kUXBONVIxMVJXYlFHdTI5T3ZNTDdM?=
 =?utf-8?B?OFRGajJhY3NEU29SZ29Vb0xGeW9NdmphL2twSFJDa0tTRTB4SUxITXhUeUt6?=
 =?utf-8?B?VllJL2RlOFZkcyt6aDR2YzY3T21TRldabElHWjczcWVOeURZakpCT1piejFK?=
 =?utf-8?B?aHdKNUhZZkhlM1V1V01TWmE1S3BhOVExSDMxWjk2SU9ZNzI3Qi9DZm9Wcnpw?=
 =?utf-8?B?d2c1d2NSRDNoOUpJZ2VXR1pDQWJnOTJNa1B6VXlySVl5ZTdNUXVSdVN4a2hB?=
 =?utf-8?B?WlNSMHVMbStSUk51RkxoVDBOVFFGYS9IWDljcXBxMHNhejYyUFM5T2x5ZE1H?=
 =?utf-8?B?MVJRcENsbjJ0aXdlWExEa3NjM3l2YVgrdm5PSW83V3FIdWp5ZlJEMkZnNW1z?=
 =?utf-8?B?UlhpMDZMVGtPcVhTZ0ZiK280b1VubGV6aU5JeGQ3Q2hTQ3dlampoYnQ3RHU1?=
 =?utf-8?B?bjdpSEdXWHR5bktTaUVGVVFJRGw3YWE2TVVYaksyNElCYmRETVZmdDRFaGNQ?=
 =?utf-8?B?aUR3VDBxUnVoMFYzNTY5dndOSllRQ0tqNVZqbjM4WjRkRkwvNTRRQXdLeVB4?=
 =?utf-8?B?S3FIa2NORExqT1dzUzZJVFpPbDJVSGdQVXpVcVhtQXFBSWRjdW1BSFBzWXJ2?=
 =?utf-8?B?ai9DN1g1Z1dOaElXZHJFQUxrcldIKzhGSHUyaGI3dnZHWGRSMEk3VHQwdU1Q?=
 =?utf-8?B?K2tyZ0FTM0lpRE1UUm1tVHhVMnQ4ZGp0bGZjSHpaR1JIdm5oY0JrRkx1bWpx?=
 =?utf-8?B?THU5MjFObCtkWldPWmdSNGVVSHZLWUlhbDNwdktjWFlFaldPYmxucy84RlRo?=
 =?utf-8?B?azZDSG5rb2pwRE9CZTN3ampmMlBOam1Ea0E1VmdEYSt3UmV0Kzg0N3hTR2Jh?=
 =?utf-8?B?SzFFaEdod0owMSt3eTF2VGY4WUtLbW9xWVYwY2twWEM5ODVyVW1BM2FRR2R1?=
 =?utf-8?B?ZS9QVWpkUzdWTi96Z1N4MlJmaXJjT2ZhUSt5cHJPa050Mlp2NUdWcWhNVjhF?=
 =?utf-8?B?Y0hIS1F1UjFBZmsyYUF6YXhDWTMvVzFEckdkYUM4ZGVCb04zdkp3T1RPMk0y?=
 =?utf-8?B?MEdGcFB0M2xrWTdIb0xPTXV0QmE0Vk4yd09Qd3RxQXRzSXlldzJnbGw1cWFj?=
 =?utf-8?B?TTkyQlVwUzJlZ0JWVTBHRHBpdENvUWFUMWxCSnRWWjRaREFHVTk1dE1heGNK?=
 =?utf-8?B?dUFoQjNyT2h6Qm02c09RV1BOa214eHFMdE95NlF2YnV5Vk12Nk5MYTJyVDhR?=
 =?utf-8?B?bEJHK2FYRWNKeTFHeUtiZnN0ZVJRb3B5eS9qQ2pnUjhQVTlGdDZnVGtzZTRh?=
 =?utf-8?B?YUg1TXpoUk0wNDlzS0RFMUx3K2FlN3JaRW5TOVdNTWZTcThWY3RzOTdrUXg3?=
 =?utf-8?B?YWJoM3dmaGcwdC82U1MwSEVSUTdMNmd2a0gvOVR5enhkZFNpMmtYaDN1aWVU?=
 =?utf-8?B?QkxiZTdFcTFUYXhKSU42N3FYKzlCeFljbnpreDZBVUpReHhmT1VseHZlRFoy?=
 =?utf-8?B?SWhhYU1pbDNKeDZRaEdzZTZkMDRZUFQ5VkM1RFpFQkpTTURoekFYQ0VzclY4?=
 =?utf-8?B?U24rOEZUQStQdWNZMk9uQVlLR0Mrd25HdTA1bU83bVJvKzJDZnVFNTVNZkFt?=
 =?utf-8?B?RFA1eDFiZTRlWnFSQ2lZYmZxL0NYSHRXRGpqT1ZNZzVGRnRJYUszSGcyaGJR?=
 =?utf-8?B?R2ZSS1k1ZFNGR0kzcWpYUWRza01GaHEzVFdpYlhtTSs2TjljVE1aYUphQXd6?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c11f442-5ea9-43bd-6550-08de23ddfff7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:29:12.3854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YkOoMgM+BGoaTt+TTsb60RD857mNrpvWxfc26bVBmSeHpw4MdDQqUylehgBC8Qul2uCpbopySjjqeJ+mQqtEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9605
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

Follow the pattern used in remove_migration_pte() in
remove_migration_pmd(). Process the migration entries and if the entry
type is device private, override the pmde with a device private entry
and set the soft dirty and uffd_wp bits with the pmd_swp_mksoft_dirty
and pmd_swp_mkuffd_wp

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
This fixup should be squashed into the patch "mm/rmap: extend rmap and
migration support" of mm/mm-unstable

 mm/huge_memory.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9dda8c48daca..50ba458efcab 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4698,16 +4698,6 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
 
-	if (folio_is_device_private(folio)) {
-		if (pmd_write(pmde))
-			entry = make_writable_device_private_entry(
-							page_to_pfn(new));
-		else
-			entry = make_readable_device_private_entry(
-							page_to_pfn(new));
-		pmde = swp_entry_to_pmd(entry);
-	}
-
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
 	if (is_writable_migration_entry(entry))
@@ -4720,6 +4710,23 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	if (folio_test_dirty(folio) && is_migration_entry_dirty(entry))
 		pmde = pmd_mkdirty(pmde);
 
+	if (folio_is_device_private(folio)) {
+		swp_entry_t entry;
+
+		if (pmd_write(pmde))
+			entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+		else
+			entry = make_readable_device_private_entry(
+							page_to_pfn(new));
+		pmde = swp_entry_to_pmd(entry);
+
+		if (pmd_swp_soft_dirty(*pvmw->pmd))
+			pmde = pmd_swp_mksoft_dirty(pmde);
+		if (pmd_swp_uffd_wp(*pvmw->pmd))
+			pmde = pmd_swp_mkuffd_wp(pmde);
+	}
+
 	if (folio_test_anon(folio)) {
 		rmap_t rmap_flags = RMAP_NONE;
 
-- 
2.51.1

