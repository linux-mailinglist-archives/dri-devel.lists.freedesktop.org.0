Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF0DBAF541
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3B10E683;
	Wed,  1 Oct 2025 06:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gofndjs0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151A210E683
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:59:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3No7u+hWw2B0ymAqRAKOr1i1r1ncBTmAMOvEAkZqqVsvYKm73pamtu8JMEPJrJLYbjwCAFGsxbo5Qs2qmU3VoHHwWvpmVP2hprGNsD0cCplO9j04Ki0AOTtUtTtcdC5NWrZT0Da8nolTMwPB1iR+ViicJbc61IKGtkOdWY+6HB2mUDbaGkupKrU0e5+hLJPWQJ24m8VuKpriOIkyQWyFJRwMmWTfWLMOj0lwrjIU8qnIWyi7DKI0iW2x7ZeZik12fT2pzrIbjeZutVaE8q95Vib6AWia2f+b6BYdwYjOuINTCgHs32gLIPXYt0idCxFK2zsA6+t7MHjnKTuwYO15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1jyZzKTaL2pML2tH1RnxMC3UEPPRCkesBbj7bE3tsU=;
 b=P/y7XULe8hWAxFDIRTzz/H1B2vtMLWFpW91VBRqfsHSGM6/k23wkhc4aLbaEFZBA4WPDIrp6v6gUxSIuP5rNAf5qLrmhg+1g0t98F7rZ3epeulWe3QSwlGd88AKP1MmzCP8xwIHUAmYgUrlMk7ky8QzwVrXV3IqySCRI3SgI5itThCncwZFWBXCHCI/axC/LeXKW/JAzg5PtettRMrvSkGZMp8DAN0Jc1Za/fJUPOD0gGz1hw0r4coREgTfp6tHVrJvhmoP6IZHdXFMcP1zktGsrra4+ntck/iFWI1SMISpujoSq1wsI/AovCK89HReNzaPZ9wDZ15xxF2J1Sv9IYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1jyZzKTaL2pML2tH1RnxMC3UEPPRCkesBbj7bE3tsU=;
 b=Gofndjs0E4qpEcQnmNQGy/hPtrdSP1gdmcSiUuuud51u+34URHO6trYZ62DLwZtXkVz2leby6VAMa66pusRYDP0/uTf1Gb8EwCu5HokMoBW4niVm/8Pjg+tua4kZgxTyvGAik99+Nx1I3G0SsrKd2JNVbYlgjhgMsER/bq3LVRmo5OOs27pIRCtgVLIhBKyGyEYkiPtyKpytb8l0p2bDi9Pr5Chhp9a4DQOqGrpDTqj12dAev4rf4RrKt5T8fBoUE8+HsuMsTCR9hlOwU5iEZL6MYxyVcQL/tgv5j5jj0Y5TMV+ghUaf4igcUHJqheDRRSFW7oBrMkKCv6pP++MNIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:56 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:56 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Matthew Brost <matthew.brost@intel.com>,
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
 Francois Dugast <francois.dugast@intel.com>,
 Balbir Singh <balbirs@nvidia.com>
Subject: [v7 14/16] selftests/mm/hmm-tests: partial unmap,
 mremap and anon_write tests
Date: Wed,  1 Oct 2025 16:57:05 +1000
Message-ID: <20251001065707.920170-15-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:806:a7::21) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 85742e99-db2e-42e5-86ab-08de00b7fd54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGFsMXhWRi8ydEEwZUJ1UVZ3czdjYlVuZ2Q4bUlCUFB3MWYwaFNuZVllWGZh?=
 =?utf-8?B?dE5qeHdmQnpBZHZLbVd0QnBrYnQzTFNYQXQxb1lhaVEzbFJmRU1meTJSSzJV?=
 =?utf-8?B?OUJtM1AzZWZ5VU5tanY3akpVMUJxMEdCeHlZNDRLb0E2RlZqZzNKbFNUeGpQ?=
 =?utf-8?B?dGErRElpNVFYUkl3RWNVa0pzMEVoWTd2bWxNMllOOFpIVkJTcXc5TTdOcWwr?=
 =?utf-8?B?dk8wZmEzVkdaRW13QlNuazRZUGNJdGNxTEdGcTRNaXk4Y0FPdTV4RXFlWFNl?=
 =?utf-8?B?bW1yY0tjRVVpMjBBREpzb3c0cWJVWWRsR1I2TFBDaHB1dC9UQy9TQ2ZLTVlQ?=
 =?utf-8?B?TGU3TjUvT0U5ZWgvQU5KaHNrbmZQNWFLS0dCYWZZeFY3aGY5S1dtNFFWZHZY?=
 =?utf-8?B?UWZhc28zMmRienNnQ21ycjFGRHY3SjZjNUdnUExWc0V2ek5taHJOTlp3a3p0?=
 =?utf-8?B?aW81YktRSzNNRlRVeGhleFZxVXR0TVJFZWlrVEYyQjh6S0xjR0ZqYXFZaE9W?=
 =?utf-8?B?TVJVQXAzSnJJZ0ZDalhLZXpTblkrS1BqYXd0bk1BRy9wcHRWWTh6azJ1dlV2?=
 =?utf-8?B?eDBvMDVjK29pVFNWVzU0ZzRSSkFOMmdJNU1WWUowODB2RGNKdVNEanZYeXBB?=
 =?utf-8?B?aWpLTW4rcllWK0llcUJmZGJpaEhkNXNoS0tlYVhPZUgyTVZINmNCb2lhRFpm?=
 =?utf-8?B?OU1IcHMvU1ZMRGZtREYzazY2dmpsd0tpUnFrVmZiZTUyM09XVTkyaVV0eDAr?=
 =?utf-8?B?UG5wYVBYY054MFFiNjFDQTZYRTZ2cFB6NUVqMEtuYVEyZDdhdTNrdUR6M3dt?=
 =?utf-8?B?WjdQYk9pQ1pjVDloaEp2Qm1ocDdQR2xLSWhBNlR2KzB3YzlBaStiSFlGd1hT?=
 =?utf-8?B?OVRmU2poYjN0TEFUbk96MFVDYU42QUlPTTVIaENZd25zc0Z1SmxEMGc3bTBI?=
 =?utf-8?B?bzlvSWlUT0JWNzNWWFByR3I2c2xtdWwzcGdhSDZ1TDk0MnQrZVJMb0paWmhH?=
 =?utf-8?B?VWFNQmhMVEJlWlArUWxzeUtTVE4wbTlZcHUxVm0zMTdaVytNQTdpWDJaK2lq?=
 =?utf-8?B?MWVCaHdBY3d2YWJwVWpHdGVSRUV5UnZnVTBMTmFMM3FXallzdmt2STlOeEw3?=
 =?utf-8?B?dldaRzFid2JNVWNZWmtMTWc0T0RLbUtKYkpYUFJRbmtETEQveE1QMFJJNjBq?=
 =?utf-8?B?a0JnaVl2MkFuWG9XNXhpYXE3c09hZ3ZmaXhHRm9Kcm5HakZ0QlphRDVESjRt?=
 =?utf-8?B?UTJkYnA4WUt4SW1rVUZ2M1gwcm1YWVN0NHpVRUlRTFZMZm5PVTNOS2tCcFAr?=
 =?utf-8?B?NW1GK2V5b0NXZHJUWWEvL3R4L0M1WEkvZGtMMEFXU01WY0xiVmVvWjlBSUh0?=
 =?utf-8?B?YXM0V0RLMHdaYUZpYm41YVFWWUkrSjlnVytaM0RoNlhsNk03Tjd4MTZVRjNU?=
 =?utf-8?B?SGovemF5dzhlWkxvSkgvZFlnVDFOWnVBR2poTi9JY3paNFJtam5vaHFqTkw4?=
 =?utf-8?B?dzhuUmR2MGRrOEVIQ0lPTWozaHptSDd5a0NIQWtqZE5GMk5oVWt2d2c1TXJ3?=
 =?utf-8?B?UENBa3JUcXYvd09Qb0xnTVNiVGR0SEZGOHRYZURXcjlxQjFVaDU1WXZqdXpr?=
 =?utf-8?B?Mm1hdXNSamR0TWk4UEdmLzhjUDBURWRYRzRHTThrNERHamNRVUszTEV5NzVM?=
 =?utf-8?B?VVZ4TXU4cmVWSWRxVkQwR2xXOXlTWlJ6ajJkYXlBVitBNnNqTEFvTGxDQjYw?=
 =?utf-8?B?Y044aGFKSlRYR1o1UTdHRkw1M2xqS3M5MkRjTGloL1Y3bFZ0eUp3TVpXZkpt?=
 =?utf-8?B?R3RzRmdpbGNXaGpOTEs4dFljeXJUZUF5QlFSUE1nMmJnbzBFMVdtTW9VTVJF?=
 =?utf-8?B?eEtkWWdyS2IxSytDbHJNOTQzWHBvL1FmdkNUOGNJL1RWei81eS8xRUY0ZktU?=
 =?utf-8?Q?Xb1i65iRVy53B5spSis78FCTm/P6Nbu2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU5sUkc4WTJ3YXZoTnBzKzVGcStSNUR3bEI3TXgveU45aFVnUDliSU11Znl5?=
 =?utf-8?B?VjJ0U3JQQWNna1VwMVl3WFJkR2hJcDl5QTdzOG9XTDQ4Q2xSVnkxYm02VVU5?=
 =?utf-8?B?MFc5T3pKZ1VGaUtBeEVUZm4vejlGRVlBNDd6eUxMcUM3R0k3TklyYW5Dc1Zr?=
 =?utf-8?B?L0RXWUFUaUd2ZmU3b0xENWE4TUZUQ01kc3hvaEVIakVOV0VVaWdyY0JWTVhM?=
 =?utf-8?B?ODZIa1lyMG54ZnlYcG5GSytpbVYvRVhzVGZ1UEFkUHpCYUJqS1ozRTl4aE90?=
 =?utf-8?B?NU1mZk1BY1ZXdk9vVmZyeEU3ZG5mK3o5SEp6QkdDWXZGT0s0d05JZCtzYzZp?=
 =?utf-8?B?bk9aUHlzRk1LYUF0cUZKeGg1SERMcU5TZ0ZkcEtPcCtIVS9rNStIdHFWREF2?=
 =?utf-8?B?SDg0anhaMThvL0JVTTFRMGVBbVRnS0tRWHc4S3UyKzNGY1E5N3ZvckViWExV?=
 =?utf-8?B?SmVBVFRsVERpK3ArMkw1WENMYnB0cXZ3eVpPekxZQ3BDaVp4eHdXRys5cUF3?=
 =?utf-8?B?RHM4NEEzUzdRaWkvZ0Vnc2xvTXp2QktGTU1kUDlmM0h4TFFmOVk1N1AxdE1u?=
 =?utf-8?B?aUFUK0FXbld4TkI5VU9QWHVDK2N6dTRtYmhnd1h5aGpuY2xhb3R3OVpyU3Nj?=
 =?utf-8?B?YkYxYU1lYno5ejlMM0paaG11SkcwOVpuMHBlTzVwY051V0NXV2VoaVJNNFJ2?=
 =?utf-8?B?RGdZYUozbU1SclpJQ1VQM3lPd01YWURnY1ZyTmljR3VRZXpJbG4yUXZFT1BU?=
 =?utf-8?B?Y1k5QTJKU1FTenRsYWtEK0d1cU9HMEN2eC9rNUFrOW9uYjM0bnZaSnFaWllp?=
 =?utf-8?B?cTNWUktCUEg0K0xjQ00wWCtZN1NkeFhBQWxEU1dNVnI1ME02YWErcHZEbldm?=
 =?utf-8?B?Q3dNRHJTOHpJR1JIellBdG11NGw3THB2bzA2SGxkZWs3QnZBL3oyNDBTdUs4?=
 =?utf-8?B?S2xTWVIyVE9yTS81d2dPdU9rQUNqYWVSMlYzeWlBUnliTXVxTEJ6V25ma2lQ?=
 =?utf-8?B?dmUwV2o1OWp3ajNmS1N1eWhkZlVVdTljL3RtWVo0ZFF2dGpEVWpCTWl3cDhP?=
 =?utf-8?B?cVZSZWlvRndORmdENW9saTR6Mm81dk92VEZNekwxRlJwU3R1N2Z6M2N0bWxQ?=
 =?utf-8?B?bkJCMGEzUFhTVVo1ZjZ3ZWtSVk9yNU8yN2YyYnBwR1Y4Z1hucVNmcTZySkpk?=
 =?utf-8?B?NzlZMUNTdnVORmVPK0N4M0RvaUx3bTFVcjV5eHpETVpiTWZrN3dYY3Nndzlo?=
 =?utf-8?B?amVBVThJMlZnNDBIcFBjR2xubGdRTEhURTFXNGtvZjJNWVdSMFd6c1pCSE5W?=
 =?utf-8?B?U3NtOWZFL2pibEVXNjJ5YUQvb3hvWWJFTUVQOFlBU2I4UVlxRjV3MFhDOWVa?=
 =?utf-8?B?V2RRTDZUSHZVVDdpYmtHWTN4cXRLZzRXS3kwRWxlSGlrcmpRZWQxNkpPVEg5?=
 =?utf-8?B?UzZCYWpvbE5aR0RzREd5MXRyZDIxaWtmSkJtZVRtRXROWjlOK1NjODZoZWdy?=
 =?utf-8?B?VmpJMXNjUXRPS3E5YnZNdG8rSEZmUFR5aC91dVV6NlQvdGNuaHBXWXV6SWNG?=
 =?utf-8?B?bjNCOEtrR0ZjVWJZdk5hOFhpUHkzZHRha0FoNnQ3WllZNmNOUklQNE41Ymxo?=
 =?utf-8?B?QTduZThXVUZnSVYvL0ZwSDRVNXIxNWVSSENFWWV4dzBQdk0vejZHZHhxRTli?=
 =?utf-8?B?WlFTcStBamdVSFdsc0xuUGUySThRakJxWlRzVDJ5OUJKQ01BdWlPWDdoWW0v?=
 =?utf-8?B?L0JrVXB6MW5UY0V3amRQc05GSG5YWVVoRXNmdERYZXJnM1VRZzd4NWFWTmZT?=
 =?utf-8?B?NUZYSDk4bFZqd0dxZ1AzU3ZRV0g1Zmd4NlYxRm1mMzhiTDFGOHp6Z1Q4QTBB?=
 =?utf-8?B?bzJoTDkzOURqOG9VNjYyTC95RkNtK3I2RWpTMXhKL0U5RGRWV0VudVVvMEJj?=
 =?utf-8?B?Y3MydENPRTdyVzZFa05CQ2tNZmhjdmlYZ2dOaVozbHg5VG93YzN0eURwaDQ4?=
 =?utf-8?B?OUQ4ZWpqTjdHc29MNXlscmcxQitFUCthWlkzTEVoNDJhM1QvblRNMHVoamxw?=
 =?utf-8?B?ZFMvL2VveDhPY1dFSzBrYVFWYlVBVDJod0tSL0lEcW9La0pxNVIxQkFOSmtU?=
 =?utf-8?B?V1NneTh1WEpqTGt2cUczRFBISFZ1NTY2ZlZpTVRaVmlHRzYyamN6dExCb0Ns?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85742e99-db2e-42e5-86ab-08de00b7fd54
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:56.6004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rceUeM4j9M5V72v5SqzlZDJJ/p2nBShisQS4ukKZ3Xq7wk/3Xe8XCxPwsQW19yxL7cw1mrORD1ZpNXCSpcYfrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
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

From: Matthew Brost <matthew.brost@intel.com>

Add partial unmap test case which munmaps memory while in the device.

Add tests exercising mremap on faulted-in memory (CPU and GPU) at
various offsets and verify correctness.

Update anon_write_child to read device memory after fork verifying
this flow works in the kernel.

Both THP and non-THP cases are updated.
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
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 312 ++++++++++++++++++++-----
 1 file changed, 252 insertions(+), 60 deletions(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 339a90183930..dedc1049bd4d 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -50,6 +50,8 @@ enum {
 	HMM_COHERENCE_DEVICE_TWO,
 };
 
+#define ONEKB		(1 << 10)
+#define ONEMEG		(1 << 20)
 #define TWOMEG		(1 << 21)
 #define HMM_BUFFER_SIZE (1024 << 12)
 #define HMM_PATH_MAX    64
@@ -525,6 +527,8 @@ TEST_F(hmm, anon_write_prot)
 /*
  * Check that a device writing an anonymous private mapping
  * will copy-on-write if a child process inherits the mapping.
+ *
+ * Also verifies after fork() memory the device can be read by child.
  */
 TEST_F(hmm, anon_write_child)
 {
@@ -532,72 +536,101 @@ TEST_F(hmm, anon_write_child)
 	unsigned long npages;
 	unsigned long size;
 	unsigned long i;
+	void *old_ptr;
+	void *map;
 	int *ptr;
 	pid_t pid;
 	int child_fd;
-	int ret;
-
-	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
-	ASSERT_NE(npages, 0);
-	size = npages << self->page_shift;
-
-	buffer = malloc(sizeof(*buffer));
-	ASSERT_NE(buffer, NULL);
-
-	buffer->fd = -1;
-	buffer->size = size;
-	buffer->mirror = malloc(size);
-	ASSERT_NE(buffer->mirror, NULL);
-
-	buffer->ptr = mmap(NULL, size,
-			   PROT_READ | PROT_WRITE,
-			   MAP_PRIVATE | MAP_ANONYMOUS,
-			   buffer->fd, 0);
-	ASSERT_NE(buffer->ptr, MAP_FAILED);
-
-	/* Initialize buffer->ptr so we can tell if it is written. */
-	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-		ptr[i] = i;
+	int ret, use_thp, migrate;
+
+	for (migrate = 0; migrate < 2; ++migrate) {
+		for (use_thp = 0; use_thp < 2; ++use_thp) {
+			npages = ALIGN(use_thp ? TWOMEG : HMM_BUFFER_SIZE,
+				       self->page_size) >> self->page_shift;
+			ASSERT_NE(npages, 0);
+			size = npages << self->page_shift;
+
+			buffer = malloc(sizeof(*buffer));
+			ASSERT_NE(buffer, NULL);
+
+			buffer->fd = -1;
+			buffer->size = size * 2;
+			buffer->mirror = malloc(size);
+			ASSERT_NE(buffer->mirror, NULL);
+
+			buffer->ptr = mmap(NULL, size * 2,
+					   PROT_READ | PROT_WRITE,
+					   MAP_PRIVATE | MAP_ANONYMOUS,
+					   buffer->fd, 0);
+			ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+			old_ptr = buffer->ptr;
+			if (use_thp) {
+				map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+				ret = madvise(map, size, MADV_HUGEPAGE);
+				ASSERT_EQ(ret, 0);
+				buffer->ptr = map;
+			}
+
+			/* Initialize buffer->ptr so we can tell if it is written. */
+			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+				ptr[i] = i;
+
+			/* Initialize data that the device will write to buffer->ptr. */
+			for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+				ptr[i] = -i;
+
+			if (migrate) {
+				ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+				ASSERT_EQ(ret, 0);
+				ASSERT_EQ(buffer->cpages, npages);
+
+			}
+
+			pid = fork();
+			if (pid == -1)
+				ASSERT_EQ(pid, 0);
+			if (pid != 0) {
+				waitpid(pid, &ret, 0);
+				ASSERT_EQ(WIFEXITED(ret), 1);
+
+				/* Check that the parent's buffer did not change. */
+				for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+					ASSERT_EQ(ptr[i], i);
+
+				buffer->ptr = old_ptr;
+				hmm_buffer_free(buffer);
+				continue;
+			}
+
+			/* Check that we see the parent's values. */
+			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+				ASSERT_EQ(ptr[i], i);
+			if (!migrate) {
+				for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+					ASSERT_EQ(ptr[i], -i);
+			}
+
+			/* The child process needs its own mirror to its own mm. */
+			child_fd = hmm_open(0);
+			ASSERT_GE(child_fd, 0);
+
+			/* Simulate a device writing system memory. */
+			ret = hmm_dmirror_cmd(child_fd, HMM_DMIRROR_WRITE, buffer, npages);
+			ASSERT_EQ(ret, 0);
+			ASSERT_EQ(buffer->cpages, npages);
+			ASSERT_EQ(buffer->faults, 1);
 
-	/* Initialize data that the device will write to buffer->ptr. */
-	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
-		ptr[i] = -i;
+			/* Check what the device wrote. */
+			if (!migrate) {
+				for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+					ASSERT_EQ(ptr[i], -i);
+			}
 
-	pid = fork();
-	if (pid == -1)
-		ASSERT_EQ(pid, 0);
-	if (pid != 0) {
-		waitpid(pid, &ret, 0);
-		ASSERT_EQ(WIFEXITED(ret), 1);
-
-		/* Check that the parent's buffer did not change. */
-		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-			ASSERT_EQ(ptr[i], i);
-		return;
+			close(child_fd);
+			exit(0);
+		}
 	}
-
-	/* Check that we see the parent's values. */
-	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-		ASSERT_EQ(ptr[i], i);
-	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
-		ASSERT_EQ(ptr[i], -i);
-
-	/* The child process needs its own mirror to its own mm. */
-	child_fd = hmm_open(0);
-	ASSERT_GE(child_fd, 0);
-
-	/* Simulate a device writing system memory. */
-	ret = hmm_dmirror_cmd(child_fd, HMM_DMIRROR_WRITE, buffer, npages);
-	ASSERT_EQ(ret, 0);
-	ASSERT_EQ(buffer->cpages, npages);
-	ASSERT_EQ(buffer->faults, 1);
-
-	/* Check what the device wrote. */
-	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
-		ASSERT_EQ(ptr[i], -i);
-
-	close(child_fd);
-	exit(0);
 }
 
 /*
@@ -2289,6 +2322,165 @@ TEST_F(hmm, migrate_anon_huge_fault)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Migrate memory and fault back to sysmem after partially unmapping.
+ */
+TEST_F(hmm, migrate_partial_unmap_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size = TWOMEG;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret, j, use_thp;
+	int offsets[] = { 0, 512 * ONEKB, ONEMEG };
+
+	for (use_thp = 0; use_thp < 2; ++use_thp) {
+		for (j = 0; j < ARRAY_SIZE(offsets); ++j) {
+			buffer = malloc(sizeof(*buffer));
+			ASSERT_NE(buffer, NULL);
+
+			buffer->fd = -1;
+			buffer->size = 2 * size;
+			buffer->mirror = malloc(size);
+			ASSERT_NE(buffer->mirror, NULL);
+			memset(buffer->mirror, 0xFF, size);
+
+			buffer->ptr = mmap(NULL, 2 * size,
+					   PROT_READ | PROT_WRITE,
+					   MAP_PRIVATE | MAP_ANONYMOUS,
+					   buffer->fd, 0);
+			ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+			npages = size >> self->page_shift;
+			map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+			if (use_thp)
+				ret = madvise(map, size, MADV_HUGEPAGE);
+			else
+				ret = madvise(map, size, MADV_NOHUGEPAGE);
+			ASSERT_EQ(ret, 0);
+			old_ptr = buffer->ptr;
+			buffer->ptr = map;
+
+			/* Initialize buffer in system memory. */
+			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+				ptr[i] = i;
+
+			/* Migrate memory to device. */
+			ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+			ASSERT_EQ(ret, 0);
+			ASSERT_EQ(buffer->cpages, npages);
+
+			/* Check what the device read. */
+			for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+				ASSERT_EQ(ptr[i], i);
+
+			munmap(buffer->ptr + offsets[j], ONEMEG);
+
+			/* Fault pages back to system memory and check them. */
+			for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+				if (i * sizeof(int) < offsets[j] ||
+				    i * sizeof(int) >= offsets[j] + ONEMEG)
+					ASSERT_EQ(ptr[i], i);
+
+			buffer->ptr = old_ptr;
+			hmm_buffer_free(buffer);
+		}
+	}
+}
+
+TEST_F(hmm, migrate_remap_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size = TWOMEG;
+	unsigned long i;
+	void *old_ptr, *new_ptr = NULL;
+	void *map;
+	int *ptr;
+	int ret, j, use_thp, dont_unmap, before;
+	int offsets[] = { 0, 512 * ONEKB, ONEMEG };
+
+	for (before = 0; before < 2; ++before) {
+		for (dont_unmap = 0; dont_unmap < 2; ++dont_unmap) {
+			for (use_thp = 0; use_thp < 2; ++use_thp) {
+				for (j = 0; j < ARRAY_SIZE(offsets); ++j) {
+					int flags = MREMAP_MAYMOVE | MREMAP_FIXED;
+
+					if (dont_unmap)
+						flags |= MREMAP_DONTUNMAP;
+
+					buffer = malloc(sizeof(*buffer));
+					ASSERT_NE(buffer, NULL);
+
+					buffer->fd = -1;
+					buffer->size = 8 * size;
+					buffer->mirror = malloc(size);
+					ASSERT_NE(buffer->mirror, NULL);
+					memset(buffer->mirror, 0xFF, size);
+
+					buffer->ptr = mmap(NULL, buffer->size,
+							   PROT_READ | PROT_WRITE,
+							   MAP_PRIVATE | MAP_ANONYMOUS,
+							   buffer->fd, 0);
+					ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+					npages = size >> self->page_shift;
+					map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+					if (use_thp)
+						ret = madvise(map, size, MADV_HUGEPAGE);
+					else
+						ret = madvise(map, size, MADV_NOHUGEPAGE);
+					ASSERT_EQ(ret, 0);
+					old_ptr = buffer->ptr;
+					munmap(map + size, size * 2);
+					buffer->ptr = map;
+
+					/* Initialize buffer in system memory. */
+					for (i = 0, ptr = buffer->ptr;
+					     i < size / sizeof(*ptr); ++i)
+						ptr[i] = i;
+
+					if (before) {
+						new_ptr = mremap((void *)map, size, size, flags,
+								 map + size + offsets[j]);
+						ASSERT_NE(new_ptr, MAP_FAILED);
+						buffer->ptr = new_ptr;
+					}
+
+					/* Migrate memory to device. */
+					ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+					ASSERT_EQ(ret, 0);
+					ASSERT_EQ(buffer->cpages, npages);
+
+					/* Check what the device read. */
+					for (i = 0, ptr = buffer->mirror;
+					     i < size / sizeof(*ptr); ++i)
+						ASSERT_EQ(ptr[i], i);
+
+					if (!before) {
+						new_ptr = mremap((void *)map, size, size, flags,
+								 map + size + offsets[j]);
+						ASSERT_NE(new_ptr, MAP_FAILED);
+						buffer->ptr = new_ptr;
+					}
+
+					/* Fault pages back to system memory and check them. */
+					for (i = 0, ptr = buffer->ptr;
+					     i < size / sizeof(*ptr); ++i)
+						ASSERT_EQ(ptr[i], i);
+
+					munmap(new_ptr, size);
+					buffer->ptr = old_ptr;
+					hmm_buffer_free(buffer);
+				}
+			}
+		}
+	}
+}
+
 /*
  * Migrate private anonymous huge page with allocation errors.
  */
-- 
2.51.0

