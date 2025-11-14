Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D95C5AE4C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 02:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232F910E977;
	Fri, 14 Nov 2025 01:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nI3T6b7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011039.outbound.protection.outlook.com [52.101.62.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6CE10E973
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 01:22:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+H4oU7tt6bFoZ2bINEJFfCERrOdqyxq2uO/mQBD/oH8oMjvJtYvr7k9F5t81Ieq/9aY2QiZS60rFY6+4hAWN6MHYc0huUokW41+3wo5C1OR8gU8PJ993/PJI0MtCMPvg6D3xP6xW8p3/1DswFJyaJ6yxu0WOddZ/5zi1qqHoDV0z5+ogq3p5ZRvxwy9THYifrRMJ0n5Q4j8azJ14+PFUiXal5TX9FzlIkPxXNt7mMNWDctA+ArFw4FmlCCFl28rAwzHFF3fpnJwQexqaku5Owvw+Ya6cDiXYbVqVW3Iu7wFwX19+lO82tT1d9mCayRqnrGR+OHksRONOBRc0UAXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66i4CRJ3PMhE2+WgDRZkiWZHmo7bM+Zxj73tmVAeQew=;
 b=dr6ZNiBjYqB5GMBiR3GcVKWsQepW0VIqxZ2YrlRGHukhYr9iydHkd114HmbiYhd1Py0LjEHdbLVlr6WnsRZ6ffJFzdTHUAfKkZ3b1JWmOD1CBdcPwEq32WD8Xz3D1tyLQXaapbgrtTkgOqeGy2XJ6LmL6H9zmx2bfpMJbwMccHLlxJ92xz8U3KD/FBr2vUJYZHUl6nkT/cFs8CMyATsPp1qMxC5NuR60wKBfaTYXfLIzI13uuazBxwJDUBKjcyuF8kXZmDaH10xZjupqf/zo16U+RDS9n/brIA5kgZ/aLpF0Vt0T1Qce4ofiGRLiGAigACzjF4ZS2RoFLxWdCMEsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66i4CRJ3PMhE2+WgDRZkiWZHmo7bM+Zxj73tmVAeQew=;
 b=nI3T6b7pHrxmApBDwjme00IkC3SAIJKNZPKcPxWMdaN1qQYIh0m363e3fOId30FXQcuSfWOtaWZnqrDKKIBqciotC+0PWyo2zJkRMmOUfmdtZkUj6ma43GdiHx+j7MoUhpmVvHF4RNnROSd4l4K+ZiD4tEpYKxWHUTQ6kPegUGKORhewRQBR4qHWXiA2475wlcrBWqE5M+DZhFyoMxrJ8PxtNl7jp5DnPmmBkRVqZ2c4gZDz9BaMm95Zd4iEw/N/qsE50R8s165NF5OV0qRE+GEmF0RlmMJpaVGncEPfCFebr/UE/tRyu41WM4MQxZQU8xD3D8qjaTVR+lhBAZOoHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB6769.namprd12.prod.outlook.com (2603:10b6:510:1c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 01:22:04 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:22:04 +0000
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
Subject: [PATCH] mm/huge_memory: fix override of entry in remove_migration_pmd
Date: Fri, 14 Nov 2025 12:21:53 +1100
Message-ID: <20251114012153.2634497-2-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114012153.2634497-1-balbirs@nvidia.com>
References: <20251114012153.2634497-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY8PR01CA0015.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::10) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 3237beaf-7cb1-4bab-bfee-08de231c3806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVFpOE81Qm5VOEM2Lzgrc3ZJc0RNQlNIVkljVFhZWnlBUGFtZlovN2ZYSEFU?=
 =?utf-8?B?eUxpN3ZoMFZtR3ZqNXB0dGVKTUQ2NUdzYks0R3RCYzBBdU5hejl0NmJoMFVK?=
 =?utf-8?B?WHFqck1veTI5aEtaRHdYRHNlckpxUXVyQ0JidnlieS8zdWRGYW9ZTzRQWjl2?=
 =?utf-8?B?MjdCYUhQYUtheTdBREdGUGY1TWY0WGdHeUdTdmdvK29XNjdRSE5TMHpjYndS?=
 =?utf-8?B?ZThCRU5DRmVHOEZITzJDRjV4c3hER1B1WUNpd3AzMnVZbE1Id2tFeW5vNlRs?=
 =?utf-8?B?cDdmVDFvNERpWTZQLy9qaEVxSkpnblU0SkZKcC9hcEh3cGpxMDBqUGgzOWdP?=
 =?utf-8?B?OUlsdmkwbC9CR0d0dDVCSmdNWDhzVm9mcXcvblA4Z2xtSTRYN042Q2Z2YVNr?=
 =?utf-8?B?Uk9ZVjNMWFRwSEtKZEs5WGVDY1BSRzNXdjFaOGhDSFRJbHRsQlRJTFpUTzdS?=
 =?utf-8?B?cVZTd3dPVzlyNEZtdVV1VHpLSXhQQkxuTFFtWkN6akdaeDZsclVpNEcrZGU0?=
 =?utf-8?B?VWd5MEp2ZDkrTDhBU3ZPd0RrT2YwL21FcjlrZzN0MWxXVEpaVWxxKzE4Zitv?=
 =?utf-8?B?QVdIZ0N4Mm5ROC9KWkRUVWZRVnhWbjZDMmVuemR3RXZMRjg3NTNKYVRJRXND?=
 =?utf-8?B?M0xMU3gzWCttZ3dhaElVVTBRdDhYMnYrOE9wTnpEcVhHT0JGRlNLS2xwK3pZ?=
 =?utf-8?B?TjdZY2lWcTl6WVNqaWx5UW56WjZBRGJ2K3FxVWxUbE9Wa05qbHhqT3d1ZWY0?=
 =?utf-8?B?U1Q4a3BoR01NZ2tEM21jYkxrYWIwWktucDI1Wm1LVUFlVjFFZHR3dTR6MjZG?=
 =?utf-8?B?Ry92NllVdEtEQlFrNHVvUjFGc015MXZRNE53WEZZR1E2Y0dSVGhaTEJ2RzBB?=
 =?utf-8?B?clNKUWxMU0hPT2IwaVhjUnN0ZytTM2lXclpka3hFUlVJMHcwVU0wUmV2K0dN?=
 =?utf-8?B?ZUQ2c0VVUGRzSHppTWhDV2dXb1lTSnJZVFcwVzVmT2k1K1AydzRJMEphZVJj?=
 =?utf-8?B?WHdqdkJtRC8xRUloaVJIU3k5VXcxa3ZUQ0hmL21aaVM4TXExTFlWcURvZlVB?=
 =?utf-8?B?ellCZGxCd0xhd1N0QnBJUjBDUFplcm9LTTI0K0hzQkdqaXlVdE4yT3owdTha?=
 =?utf-8?B?QnJJbHpadWdicmYrbkcyR1VvZ0c1YTJwYjNLR1QraFhkV0dlck9KMktHckFI?=
 =?utf-8?B?QTVhS0R3d1JZZE9MNFZaKzgyWjV4c05neWsxMjRSaHRlWWJPR2Y3bHdERyt6?=
 =?utf-8?B?amJDaFRMaGxNdUc4T1kxTFlNb29pL0x5K25WeHVRNlh3Rmo3UzcvQnVMclNX?=
 =?utf-8?B?TDdkS3V6RXBLNHJpWUxwcjJlZy9INktqakEwWEFFa3NscEMrR1ZoWllQWjBY?=
 =?utf-8?B?S0NqeWVsbG9SS2dFSlREdmpXQWhMYWZZckEyWXVhN3NaTkVUeDJuUkUzYkRB?=
 =?utf-8?B?YW92aUVaTWVDSUprN3FrVUZLaGdldG96RUJ1bEc1YXBRb3NLblRUbzYxZDJH?=
 =?utf-8?B?NitIaS9lNGgxdzNiQWRMRWkzMHcyUFB1OVVjRnYzSkxOZFZXcGc5VUpjZ20w?=
 =?utf-8?B?UGhPNUdCdUxSZHBrOEc4MU5aUHZOaXFGSDVaclZ0KzVKakwvZThUaDRBbDk3?=
 =?utf-8?B?bmpsZ1QyMVhRWDhMellMYW9vK3R1ay9neEtMMHNac1pxNU5WRHlNVnRqb0xF?=
 =?utf-8?B?TmlZT2lpc2VDWEpsY3o0a2EzSXl0ODlJTVMxUlYyNzFkQzdGNnBKS3huc3N0?=
 =?utf-8?B?ME1ZK1REOXR1RU51czJNdW1qK1pmWXNNVmR4Zmd1MkxRTEpWNEVhVFluakNL?=
 =?utf-8?B?b20rckJqK2ZyTXZLYkwwNWdaMlVXTDJQdndOZmNIZGFEYUgrQzh1V3d1QzNK?=
 =?utf-8?B?RkdCdUMxeTY0OFhPMmlKQVhZNXZCUWE1ci9IMWJTT0VtVzVWc1RXN0tlbWU3?=
 =?utf-8?Q?tp1Nn/6MIDSWwkeA/iP9PehBv/AZxmHs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFkxMU5YYTZYMXFLckdJa2ZnZ3NKU0J3UTZDTkZIOHovc2Uza3FzdEZwU05v?=
 =?utf-8?B?Y0hQRk4zT1dFV29KNm5tMkpvcTVKMkpXNHNxK0dwbnFDYm5BOHY1d095V0I2?=
 =?utf-8?B?eDdEcC9Cc24vemh2UTRIQlVLQ3BiOXdleG55TG9odi9DRE1meUJEYnlML2U2?=
 =?utf-8?B?cEMwalRmWmJ1ZEhvU2NMTEFpQWhVY29kMGdJM2tZZlJRZ1JrdDNiQ29rSVRU?=
 =?utf-8?B?Z2Z2WXdhVDFNZGl4SW5hK2VjemR0RlFIMEQzSzlaMlJaek9mdkFwblhPdnI2?=
 =?utf-8?B?OTBSZ0k1bDJoYkh1dERzWlVpR2NIWHdJcUdnci9ENUNZOURDdFFPMXMwRXlD?=
 =?utf-8?B?eXZqaU5SWjNrVU9CM1NrS29MaHdPS0pXQVBVVnlNRnlldFNTRjlGUGhEbkI0?=
 =?utf-8?B?NWJKOXRNZ3RzNGlPcUJzaXFGR2xQY0N5Zm1saEFFTkp5cXpxNSs5RzZ6OFRO?=
 =?utf-8?B?SFUxUnA2WHExUWQvZHV0cUcwZkllZWhjdGFnLzZUN0lnOVRCZHFMOW9KM1pO?=
 =?utf-8?B?ZTBSenFLN1Q1cGVuSHE3T2hjdzBvVklMM1JmVTRONWphUlRibGJUS2VmVjJi?=
 =?utf-8?B?WVhlWnFXWG91aDU1bWVuY3BXeG1ObWFMcHM0ZGM1aFZjWWtqQkViRTBCNVM0?=
 =?utf-8?B?VVVPWTJHWkdlM3FrdWxaRDU4STRTWFdIOWRSNWRvUDdjNmpxdDJRdm1OTzI3?=
 =?utf-8?B?TVMrY0ZKTGNpL21sRWhJUWVlVFpiSnhDcnpQZ0I1RUdnQ1piNDhQL0dYeUFL?=
 =?utf-8?B?eHNWWWd1WkFhNllqbVg0OEQ1Y1BXTTlNbTNRVmhvRm52TEppZ1h5RytvWURj?=
 =?utf-8?B?TFNHeFd6cnZXZVI0ZTNuSU5vUi9tbW5ENDVMRXJLemRYTzBpc3d6VUpVYjlo?=
 =?utf-8?B?cDM1amE0N0FuY3JDc3RoTEJDZGlzelJFejB6ODNvelFpeU0vWVNyclJaSnEv?=
 =?utf-8?B?K1lHSkV2ZitmUkR6ZkNXbkNDUjh6V3VIdWUyaUk4bitvdlZwN2VCR0tQWmZq?=
 =?utf-8?B?NEQxQXN1TVhVN2NSc3dnSWJvdE1NTGdWVzQ2aVhaV3BmTm1VMTFSczFhTEtn?=
 =?utf-8?B?aU1QQ2VxOEdpWUFtbDNYaC9tdkNrREJINEdyV0x6TXF1a0ZsMUFmdDVnbDY1?=
 =?utf-8?B?aTA5ZkNkSjRKWFp6aDBrK05IQ0R6YTIyaFBud1BRaGk2Z1dMdmRQQmdWRWE4?=
 =?utf-8?B?MHlOdDM5N0VnR2w0dVp1MlY0WHd6dlFZT2pLRXZBTGZNZjBzYWZPK2dXWVdC?=
 =?utf-8?B?TmxXNEwwM2lVN1EwRDJHamZzd1lsM1VyVlpvR1o2RHEwaVhUREhML3dBUmtj?=
 =?utf-8?B?V214S2ZYMk5DSWExbjVKeFpzNjlIcjNqR2RjTWhna1lRNjlHRFVVajB6cWpS?=
 =?utf-8?B?RE02bFNlQWcxRGg4REJJOG9xU01yWlhCOS9WV2M1Z0pzaisxWlJjdlNCWnJJ?=
 =?utf-8?B?TDEvb1prNndtZW41TkJqQ1o3KzlCbWVwTXZrRlBrT1BZaG1HVnU1ajU4MjFD?=
 =?utf-8?B?VGlyVDFXWkR6eXZqVGRVUURFa3J4c09SbjdMRUg1UXlLeEM4OUFDUzdqRmsr?=
 =?utf-8?B?eFIyb1RuNkJFdVBhdnU1RGNkNHdFK3NkZjQ0b1ZXOEdzbm5KQjdWdnJQOWUv?=
 =?utf-8?B?eE0zMjlOZ0ZSaVRRTTIyWG16N3U3RFFVNWk2UEhMQXZsbkpieWV2STQvVi94?=
 =?utf-8?B?WE9LRFN1WlR6VkVVOEJ3NTNBM2NueExLaCt1TnZwOWFwYk83b2dZblY1dVhU?=
 =?utf-8?B?Lzc1Z2FIK1RBcE5rSSthTWRTZVNmUkFiNGlEK2g3MmFSQWFUczJMMHN3b0wr?=
 =?utf-8?B?ZlM1N2VzbHhzaTlEN1RMTHdIWVNmcHgxNUVwUk9EWDRJWlp1UlViNDQ1Rm44?=
 =?utf-8?B?THRwa1VDbzAyVUxmbnlHaGtNeURJcDNQa2pLZEU3Zi9DWUVKNWE3c3pNN1FW?=
 =?utf-8?B?MTMySEkzQzRGZ0FrWXpWNUI5Mm4wN0JGcGZ2c05jaDFZblo5NmFwS2RFbENB?=
 =?utf-8?B?Z2N6U1lkcEtDMVJRbG5ObkhVWEp5TENFVE56Nm95M3BJREp4bkcxdzlIRWxF?=
 =?utf-8?B?MDlpQW5NSUNSMGdpcEl4TWg1NG40c0s2aHY5b01MaWFtcjRVYzAzZEN0WFVR?=
 =?utf-8?B?NXpVanFMcG5vQTBrK28rcHhyTGhyUWttNWtCTC9GMFc3TkVPeGNrc1BKZjVn?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3237beaf-7cb1-4bab-bfee-08de231c3806
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:22:04.0941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0GvU3r91KvQtfjwllb3BZ1//dlBlK6dLLKUF7qazBFDlYggAPMfNKgqjwpdLF8xuIrlCh4hMivDK3Y2RCnh5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6769
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

Recent changes exposed a BUG in remove_migration_pmd() where the
migration entry was being overridden when the folio is device private.

Use scope local entry for creating the device private pmde. Make the
pmde writable if the migration entry is writable by moving the check
is_migration_write() prior to creating the device private entry.

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
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/huge_memory.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9dda8c48daca..df93768a6e15 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4698,7 +4698,12 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
 
+	if (is_writable_migration_entry(entry))
+		pmde = pmd_mkwrite(pmde, vma);
+
 	if (folio_is_device_private(folio)) {
+		swp_entry_t entry;
+
 		if (pmd_write(pmde))
 			entry = make_writable_device_private_entry(
 							page_to_pfn(new));
@@ -4710,8 +4715,6 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
-	if (is_writable_migration_entry(entry))
-		pmde = pmd_mkwrite(pmde, vma);
 	if (pmd_swp_uffd_wp(*pvmw->pmd))
 		pmde = pmd_mkuffd_wp(pmde);
 	if (!is_migration_entry_young(entry))
-- 
2.51.1

