Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E6B4816D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2476610E0A7;
	Mon,  8 Sep 2025 00:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gaKfDwIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7573F10E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVb9SActhRBlZ2pAcenZr54n6Dy9zgrApa0Xx7zeGniVPXCZ4U+4mhzb00O4QEa4uVy58liTyGxn9vpOrYEwBEPVgs7tZyFaYXiFDpS6nbWoLWTRfkFeXQOJx3lRB+mPIJzDw8Y/iDLRISBw1VSRkgfpxGYr0g9/2uoEw+vPlPj6qDAlmoCqVnH7uhWrHKYrDQ5w81rl7u4jzwSTOpj56xHtO0JzORKQMWhPdt8Diz1+yMTGndH6Lh1oxoz9OgVsKJCLrbZAXM8BzGnfyBA29Z40L656/0oxEHTHzHqulC/L+x58YghzrhsVKZ/oYC8u3W8QLWhVF9Ql3Ic5wzbVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZhtv+NG4nDcRI2RWhA4E+/O8BFtMZn0P1RhDvy1P7c=;
 b=v28LiissdgRPVmf6OTkWLbXjAKf5L3ZArwpSdD9DPPYbjXVqNIcaQDKh0Qir2LX4DGgK0Q6SgFuxidorwA0X1wPwDLP9pQC1KZe4OgaIUsrQy1xcqQp8X0/iPpuoiG8HRQoAa7rQ+rllno45GiAiyX7rNdWczBQESJa7Y8pM3TtVkq/5nIAD9m79bTs8r66Nkt3hQbrMzxkVsnNVivSEdx5VbIh+/MCX6XeXKhoXjeWKZgg/aqYtTRHZBr3sUn5fhrAp1P85Z8eEwlYp1owfBFCMHwOKRzyiJyHvBfVo+9TnE3OyyZOSSBPstDu5zTF5r87mWC0li4JA995edClE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZhtv+NG4nDcRI2RWhA4E+/O8BFtMZn0P1RhDvy1P7c=;
 b=gaKfDwIgPO2q5BhUBrWYz8SkkmJpMOAA2apj/AQvovQwVlfBKmCiZfCyU2xKji8Ld+bLW6tIwz658o8C+/5T2GTJfW+4jo/MC/msoDJ8OfVNNDXLLiGj6mSG2Fh9Q5VwVhEayWEgFFSw3YXu77usO7jyyIs++uKjtX1S+vmqT3pnfRufgS7T5PMdpublMAbpbMdNEyvMd3Gfh2IDT/qN8pwQZBkxyluJyb7TBHXSFy2EXaa6S9aq0AtxrVw+TdtgnV4zmF6DHxq6cfmLTtPkMY4S8KjBuCbwr6u7DXIrQRnCP1wrxN+cZWG+j+RcwepYth9KN2kEgrxnrgoAAGaMLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:04:56 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:04:56 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
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
Subject: [v5 00/15] mm: support device-private THP
Date: Mon,  8 Sep 2025 10:04:33 +1000
Message-ID: <20250908000448.180088-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28)
 To PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa8bca4-f9f9-4c03-c04e-08ddee6b5809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVVka04vYVV2eTA0emVUenZpdmtjbFRuMThxai9zVGFxL2RneVZoa0RUeHJH?=
 =?utf-8?B?bE8yTlQ4MDNEemovNXFsU0lBZnBzM2RKejRPSzlMamFpanBhVExzNUVpWWlJ?=
 =?utf-8?B?WDlxbFE5cWRuKzhNdm1LZm9mVWZNbDQvMFpST2tmZjZyU3k4ODh4MnpNSHk3?=
 =?utf-8?B?Ni9jVnliQzgwK041eC90OVZMOHY3UDFybzJUNVR4TDhZR3VBdG1ERDdxNUtR?=
 =?utf-8?B?NXVqakkyUkVBVnJEbTFFU0o5VjkvVEtIdjdFYWlpd0V0UXIzWE1kSmhkeS9H?=
 =?utf-8?B?WUFKazF0WlVEZitaUkZpRkZheUNBbTRaYlBGUEtHWjdsK3BwRzZjRjMyQmJw?=
 =?utf-8?B?VDFEVHRYcDRoWkNsR0E3SzhpRHZYVGVNc0ZqMzJvZmtmaWIxeDZzWG52Q1hJ?=
 =?utf-8?B?TlVucHdwM0J1a3ZqN1ZETys0RlpzQmR1ZTgxN1dFemF5YnBTRXI4VFFqemRS?=
 =?utf-8?B?d1pIaHl1QWI5NDhubXM2bHFxTUtNQklYVTNOWGZ0eXQ4RitWRHJtZjRGTFpK?=
 =?utf-8?B?Y1M2SnU5My9POHNQZVZXSkRVWVN3S1NjY0FsdzBZTmVsbFhaWnhjNkwzKy9k?=
 =?utf-8?B?dGhhVVlqdnRCbzdOc2xYNXZ3K3VCbC9Ra2dYMzJocHlaVXRWTVlxaWQyUkM0?=
 =?utf-8?B?VGV1WkdXSEJ2U0JPOVJhUlM4ZDFvSlFXMkpNYVRrMGFmMTNVMlJHcFlmOTZZ?=
 =?utf-8?B?VkRtVDRRZ0UydS95aE00RUI0WXEvZU0vSUQwNHc2R1dNV3NrZmhPNnArTmJ5?=
 =?utf-8?B?VUZ6bVBZbEdpVi9FaHFQSjNFR3FoOWt2R1VtMVdsMEQvSkQwMGhVc3ZGK1Vt?=
 =?utf-8?B?OGFqRUlxeHA1cFUvS01RUGpTdHRrT2dTdDBpVmdlLzR0ZmVrRWVPNUFlK015?=
 =?utf-8?B?Q2VENzN6R1Bxd2tyTHZZVnQwdlkvN3gvc3N3R0JuUjRjVi9IS0dOUE1ROElK?=
 =?utf-8?B?aDBSN2IxaDlEd1lhb0EyV0ZUMzBIZkFBb0plYUJERjA3elphbWVWZ01GUVNV?=
 =?utf-8?B?OHV6MysxV1cxZTdxQmRGK0pTWE1YRkdYQm16VnYzYXpWWmZEbFpRS3pNWXRL?=
 =?utf-8?B?UldGenpYZHJ1Q2RFMldtVFdPS09EZ3lJM05VcnV1WHhzL1BJMEhpckx3dVN4?=
 =?utf-8?B?RDVXSWNsRERUUDVwZ3l6WEdnOFZSd3ZlV2VnV3NYckxPQ0VZOUlqMmFZRUs3?=
 =?utf-8?B?YlVNQjRHbEJvc1N0ek04K1J6QWlOTkcyVjlxeXdKbnMwYS9qU3JMcUluVFY2?=
 =?utf-8?B?ZlUvdDFzdG5LQlIvVTh3a3Ewc0xxTUFxYzhZVlU4VitRTFZhMnVmQVpBcUZF?=
 =?utf-8?B?bkUxN0d4K2hhZWJwK2dYdGtlRG42VVRjL0ZENW5OMmxxcS8xNXE5WHhjRGVz?=
 =?utf-8?B?MDRMNGVpb1ovOVNKYTF0bkxtQ2NHK1dHejQxZVV2Sk91bTZ3S296RFVYRHJX?=
 =?utf-8?B?MmlIa2NxYnBSdmdmWS85Nkk0aTRSZFBCTzlHS2ZHRFpJUnNEaHNSSVlRQUkz?=
 =?utf-8?B?dW1RR3FEcUpmTXgwQldzdk9LbkFGbVA0VFRJeTFmUTdqUnBzWThnNUQ0TEJR?=
 =?utf-8?B?eFh3VDFVNU4xOGlJMVRvVlhMTWVzUDNnZjlmZG43WW9PU1pmNFErZVB1aFZt?=
 =?utf-8?B?NmNPc2F3aGExS2dabnVJdHpMSE4vaGdsUkZSWjhKSzNRRVoreDdGdkxrK2pI?=
 =?utf-8?B?bEdGODFSd2ZnalNsdHZFcWRRVmRJV1RiRTB5bjY0MlFhNWtISU9QdWZwVzI4?=
 =?utf-8?B?QlRpU2xwRktpdWlVb0Zhdm5USENnNEN1Z0YvcFVtSExOK0srTFBidXd5NlVJ?=
 =?utf-8?B?bFllOVlEd01pTHBINi9XWFVqMWVlR1d2cHFLSWhqeDdCa2ZZaEwzRjJQS1pC?=
 =?utf-8?B?NFBRS014a1Naa3JRbURwV01GNDd2QmhkaDdLZVAzSFNHMkdFaCtYZEtGcXRO?=
 =?utf-8?Q?9LYhrXhNF6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JTSVBrOGdwaHZsWm5xSzRvVW5qbGhEOC9jTTBJdUQxT0ZKdDd5N1h0M2FG?=
 =?utf-8?B?US9aTmRSR09WN0hPa2QwdGZCcStzakhwVkgwR2d2RCtHNGxwQUxMeUlPZm10?=
 =?utf-8?B?ZzY4bjdvV3lKOVRMbVNBNCsvOVlPZkEreWtoWGhPd3ZGOXBRR1lWQjVLYW4z?=
 =?utf-8?B?OFhzWXh4RmVrd3haT2xZWVYxTWxMMWRnVlVyMmlxS2lFNERrclVKdWdGZW5a?=
 =?utf-8?B?bE9EbWxnUU1lcFN6SmtaQ3FqdXk4MzR1L0pIL2Fza2toOW4wTGFLZWdpNXFo?=
 =?utf-8?B?SW44WmlvZnVENHgzU3I2dnAwQXdQVzJ3bTMvZmpmR1h6NUJvR1Nab2lPdWE5?=
 =?utf-8?B?ejFGanBUVDBaenRMc2tscU9raEZyZXJqT28rdXdaQlVGeVJ0N3A0emFvVFJl?=
 =?utf-8?B?ZlBPbnhpa041MVlveU1XdmJQbVBrZFlKM2FFMDZxUHJ2elAwamtBem9GTzJT?=
 =?utf-8?B?ajFSb3BIT2hrTmVsNkpoL3NLOUIrWGd2S0Z4RVJzeEhvdFk0VHNURml2VzRU?=
 =?utf-8?B?YnpDRmxZL0hoRnFBQ3lrbGNIbG5zZ1hhazJRSkI3eW81VGRYbW9LZUlaeFZP?=
 =?utf-8?B?S25TbzJTd0ZsZlpTeFpHbkxScnhvaXhiU1dtMXMwQklnTDZZVFpldURSR0hR?=
 =?utf-8?B?TXQwV0R1NFZLVTduYzdsMkJDR1lvM3lTQm9kbFZJVERHSzFEcDY3dnVuWWYx?=
 =?utf-8?B?UGFiTVREVkdGbUhHK1FQMjkySVhXN21wNnNBRmtjN2h5RlUwd2VQelN6N1hM?=
 =?utf-8?B?cDdJQm9nS3lRNUtEeVVZajdWdEJ2ZGI4RWJTUXMyL202TWJwZWNCVklmSWUr?=
 =?utf-8?B?eHRiOC9kQmRWVEdHckdYejBnOHowcS9qNW55b21IWXpzV1QzS1NhejlwNm1x?=
 =?utf-8?B?bTE5RVI5My9UdzJlOXFVSlZoSUpKUHVqNkY0M0JJMXhTSnd5MUxoMjUrOE5P?=
 =?utf-8?B?UjgwTnc4OVA5R1g1KzhtQzJSUU53OGNtK3l6c2pONjBobGNhMmM3VGFMaFlj?=
 =?utf-8?B?a2piOWt2WU1vaDVHNnZaZGJKS1NWWW4xdndjTFFGQTM2MlV4b2J0SU56YXpt?=
 =?utf-8?B?K3BvaDN0Y3ZwSGVFc1AyV0FtUUZiQk0vbVZWNzFJbG9kakZKWUEvVkttaC92?=
 =?utf-8?B?RVgxd3JBTUFpNXhYZWdObzBoY0tCbyt1bTgwemM5VHppZG1kT1JMdnJwZ3VB?=
 =?utf-8?B?dWhMQTBOWTBycFNoUGp5SGlEOS9JK0lTdk5IcE9IbkhUU0RFUWFYUUNsYzZm?=
 =?utf-8?B?SzhveCtTamlmaVFYazNNTWJ4K25FN2RXSG44eUxFNUxUcS84Zk1XZGdET1dY?=
 =?utf-8?B?MUxaOS9MTGJjeHBYQm9ad1JyN1pOVGhnTHBybXN2V01rNzhsdzlob3B0Y0xr?=
 =?utf-8?B?YjZXMHkrVWkwQ3RLS0FTQ0grWlBnckpEVk9JM3VPVkhCZHVDWGVWbUsvdlY2?=
 =?utf-8?B?cldWR0MrQllRU1pXbFJMczMyaDhNMnZIZ0Y1WFByZmN4N1dyR0VPWkhRMVNV?=
 =?utf-8?B?VWRHQmMycE5jb1dHMDNlaXhmbGZhMWJSUjRzRlUwT083bDlVTkJMcXdMMUVO?=
 =?utf-8?B?YzFOTkhueVdZRVZtbTkwNnFaZWFCNk1wQTJIS0JTRkdwdjhuai9udmpFelND?=
 =?utf-8?B?TC8rVVVOQ3dISjNndWNVWHNJdW1kVW1WZ0NzWkp5WHM1WEM5OG5UZWpSVUlB?=
 =?utf-8?B?cWxzOTkyQmZwTUpXZGRSa3NJSUJ4OUs3OWFmYXozUkY1REFpQTdBZnV2bGVk?=
 =?utf-8?B?cjJ0VWlWVFpFalBucms0Rk80SW1odTkwZU1vbVRyWm1KOG1RbnBjZWgyOTcz?=
 =?utf-8?B?YzAremI3V2pOclJ4ZVoxblRtd0ZkQ3dTS2J4dkRYUzliMGlUN3lPZTlxR3Nu?=
 =?utf-8?B?dlZjRTI3UkxMZmIzU00yWDhWN0pKMm04VEZzYmtIQVZTV3lRSlE4OGkrNkhv?=
 =?utf-8?B?NUhObEY2Wk42WUowNk1KTFlOSXZ3UVFMa2JMZDRMNWY2WDdRdFFrZ2hYdFIy?=
 =?utf-8?B?Mkd6ZGJmdkU2YUxMRitEcklPaFl4R1lYM3dYbjJ4aHJuUTA4SVZWTnRnalBD?=
 =?utf-8?B?TElXRG8rMzdLeDRzVmhwS3llNlk2U2o3VEtyVUF3SWVWY0ZtWGNqOU5zbXVD?=
 =?utf-8?Q?m0A4ANcl63Y2LX07mZ+oqKPL4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa8bca4-f9f9-4c03-c04e-08ddee6b5809
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:04:56.5632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cA8x4BfyzXOWo7Wr5y6QXKsfSAowKR9fVNwRnjewHwee58I0tMnCv3zebBicSdCaTnX8pdABanl0aQ1hJSUlhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

This patch series introduces support for Transparent Huge Page
(THP) migration in zone device-private memory. The implementation enables
efficient migration of large folios between system memory and
device-private memory

Background

Current zone device-private memory implementation only supports PAGE_SIZE
granularity, leading to:
- Increased TLB pressure
- Inefficient migration between CPU and GPU memory

This series extends the existing zone device-private infrastructure to
support THP, leading to:
- Reduced page table overhead
- Improved memory bandwidth utilization
- Seamless fallback to base pages when needed

In my local testing (using lib/test_hmm) and a throughput test, the
series shows a 350% improvement in data transfer throughput and a
80% improvement in latency

These patches build on the earlier posts by Ralph Campbell [1]

Two new flags are added in vma_migration to select and mark compound pages.
migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
is passed in as arguments.

The series also adds zone device awareness to (m)THP pages along
with fault handling of large zone device private pages. page vma walk
and the rmap code is also zone device aware. Support has also been
added for folios that might need to be split in the middle
of migration (when the src and dst do not agree on
MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
migrate large pages, but the destination has not been able to allocate
large pages. The code supported and used folio_split() when migrating
THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
as an argument to migrate_vma_setup().

The test infrastructure lib/test_hmm.c has been enhanced to support THP
migration. A new ioctl to emulate failure of large page allocations has
been added to test the folio split code path. hmm-tests.c has new test
cases for huge page migration and to test the folio split path. A new
throughput test has been added as well.

The nouveau dmem code has been enhanced to use the new THP migration
capability. 

mTHP support:

The patches hard code, HPAGE_PMD_NR in a few places, but the code has
been kept generic to support various order sizes. With additional
refactoring of the code support of different order sizes should be
possible.

The future plan is to post enhancements to support mTHP with a rough
design as follows:

1. Add the notion of allowable thp orders to the HMM based test driver
2. For non PMD based THP paths in migrate_device.c, check to see if
   a suitable order is found and supported by the driver
3. Iterate across orders to check the highest supported order for migration
4. Migrate and finalize

The mTHP patches can be built on top of this series, the key design
elements that need to be worked out are infrastructure and driver support
for multiple ordered pages and their migration.

HMM support for large folios:
Currently in mm-unstable [4]

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

References:
[1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/
[2] https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvidia.com/T/
[3] https://lore.kernel.org/lkml/20250703233511.2028395-1-balbirs@nvidia.com/
[4] https://lkml.kernel.org/r/20250902130713.1644661-1-francois.dugast@intel.com
[5] https://lore.kernel.org/lkml/20250730092139.3890844-1-balbirs@nvidia.com/
[6] https://lore.kernel.org/lkml/20250812024036.690064-1-balbirs@nvidia.com/
[7] https://lore.kernel.org/lkml/20250903011900.3657435-1-balbirs@nvidia.com/

These patches are built on top of mm/mm-new

Changelog v5 [7] :
- Rebased against mm/mm-new (resolved conflict caused by
  MIGRATEPAGE_SUCCESS removal)
- Fixed a kernel-doc warning reported by kernel test robot

Changelog v4 [6] :
- Addressed review comments
  - Split patch 2 into a smaller set of patches
  - PVMW_THP_DEVICE_PRIVATE flag is no longer present
  - damon/page_idle and other page_vma_mapped_walk paths are aware of
    device-private folios
  - No more flush for non-present entries in set_pmd_migration_entry
  - Implemented a helper function for migrate_vma_split_folio() which
    splits large folios if seen during a pte walk
  - Removed the controversial change for folio_ref_freeze using
    folio_expected_ref_count()
  - Removed functions invoked from with VM_WARN_ON
  - New test cases and fixes from Matthew Brost
  - Fixed bugs reported by kernel test robot (Thanks!)
  - Several fixes for THP support in nouveau driver

Changelog v3 [5] :
- Addressed review comments
  - No more split_device_private_folio() helper
  - Device private large folios do not end up on deferred scan lists
  - Removed THP size order checks when initializing zone device folio
  - Fixed bugs reported by kernel test robot (Thanks!)

Changelog v2 [3] :
- Several review comments from David Hildenbrand were addressed, Mika,
  Zi, Matthew also provided helpful review comments
  - In paths where it makes sense a new helper
    is_pmd_device_private_entry() is used
  - anon_exclusive handling of zone device private pages in
    split_huge_pmd_locked() has been fixed
  - Patches that introduced helpers have been folded into where they
    are used
- Zone device handling in mm/huge_memory.c has benefited from the code
  and testing of Matthew Brost, he helped find bugs related to
  copy_huge_pmd() and partial unmapping of folios.
- Zone device THP PMD support via page_vma_mapped_walk() is restricted
  to try_to_migrate_one()
- There is a new dedicated helper to split large zone device folios

Changelog v1 [2]:
- Support for handling fault_folio and using trylock in the fault path
- A new test case has been added to measure the throughput improvement
- General refactoring of code to keep up with the changes in mm
- New split folio callback when the entire split is complete/done. The
  callback is used to know when the head order needs to be reset.

Testing:
- Testing was done with ZONE_DEVICE private pages on an x86 VM

Balbir Singh (14):
  mm/zone_device: support large zone device private folios
  mm/huge_memory: add device-private THP support to PMD operations
  mm/rmap: extend rmap and migration support device-private entries
  mm/huge_memory: implement device-private THP splitting
  mm/migrate_device: handle partially mapped folios during collection
  mm/migrate_device: implement THP migration of zone device pages
  mm/memory/fault: add THP fault handling for zone device private pages
  lib/test_hmm: add zone device private THP test infrastructure
  mm/memremap: add driver callback support for folio splitting
  mm/migrate_device: add THP splitting during migration
  lib/test_hmm: add large page allocation failure testing
  selftests/mm/hmm-tests: new tests for zone device THP migration
  selftests/mm/hmm-tests: new throughput tests including THP
  gpu/drm/nouveau: enable THP support for GPU memory migration

Matthew Brost (1):
  selftests/mm/hmm-tests: partial unmap, mremap and anon_write tests

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 306 +++++---
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 include/linux/huge_mm.h                |  18 +-
 include/linux/memremap.h               |  51 +-
 include/linux/migrate.h                |   2 +
 include/linux/mm.h                     |   1 +
 include/linux/swapops.h                |  27 +
 lib/test_hmm.c                         | 443 +++++++++---
 lib/test_hmm_uapi.h                    |   3 +
 mm/damon/ops-common.c                  |  20 +-
 mm/huge_memory.c                       | 288 ++++++--
 mm/memory.c                            |   6 +-
 mm/memremap.c                          |  38 +-
 mm/migrate_device.c                    | 611 ++++++++++++++--
 mm/page_idle.c                         |   5 +-
 mm/page_vma_mapped.c                   |  12 +-
 mm/pgtable-generic.c                   |   6 +
 mm/rmap.c                              |  25 +-
 tools/testing/selftests/mm/hmm-tests.c | 919 +++++++++++++++++++++++--
 20 files changed, 2397 insertions(+), 393 deletions(-)

-- 
2.50.1

