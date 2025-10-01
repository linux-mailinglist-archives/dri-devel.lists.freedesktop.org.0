Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6242DBAF529
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D7910E678;
	Wed,  1 Oct 2025 06:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hcN9taSv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012006.outbound.protection.outlook.com
 [40.93.195.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F174810E66E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTKI+1bcWq983qtN2ogMgEwG1bD4jRT5rUI2G8xkCzPB9VEmaDzya4uQz4GsP5L3W5mR2NCkRBVOq2cchXV8B8UwGfdjwSBZFmSFxrEnnJk2DxAPWloe2s342Z1bpmavQ2xqWHfRIg4dWJTXuKqRsAkeE7rJm7wmSJSM1EaSTL+fJd0ZHyVWRjWL0wTsC++ldmeTkTMdcUiQHNv+YgaFTZXanjXAS2UYVpFG2lMp7u+xojogq6uyNsChBtpFfYbfXURcfTLF2CcEJDCGhkrZJ0DgAoz8IrRye+874oDhIeqRZOfidxrYoZuYtrlSst7Niqd4rUWKReBL2xAeYlC+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMWd92AlIUpsOyl8vnoUAOAhJooR9njP2iuUWcWlN/U=;
 b=yfYTN31TqA5CwaIka0R4H89V1tZK+hbOb1rGYsa1bT5thS1ZvkxPCaGrMDN5eGZClXRq9OmcPp8sBZfNElQRYFZ7oq5i1KRcm88SF+duhNWgYZLUKGzGKchugn5uYusYBJXOeSppxfzTtWmAeT2jBVPzQsCF1SIQal1uXjN7h3gVhyYWqWQh2NGz/QBrIwm2/+sGykP3p/krQb8ewD2dB2D7A3pPte+CaS/HZ4UwhN/3wcvRRQtemyz1ygthqGWxOBJKFwORchyguhgFjAvkfWQjnfFZ+Upr6g6qvy7l+YUXgaVxWZM3uDdXkg4VnWWAiIdz2vJlN2FhH19unH2x1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMWd92AlIUpsOyl8vnoUAOAhJooR9njP2iuUWcWlN/U=;
 b=hcN9taSvFSYxPsyaZHY9YyfR1c5eJdvImJVGvsyvaK48IGWtZcngAgUllx2PPf/v97ngsQz0zMQHNGnO6gnmOrnQBiJ/UhNfzOjZr0n6Bnz0RZLyYm6z32jyc1axaaNMm8X80eJ6jbvOO65CrymdiL/y1Wt6ZxlYlpCUeZBTktBbwV1OonzS5YogY1Plim2BKzkVPR6jOteBaUv4tZ2jbwoHF3VTaVFH7M2dO87LhAMzliXFDQ/2j8pKGJIxuZ6YRIvlQcnIayTHqUr3GBnyBWeprMppn5TAyXL8Wqm4QJa3p67QZEGyUcoHFUQlbprIbKsYEUiVa+0bvUAnVED08w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:27 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:27 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Balbir Singh <balbirs@nvidia.com>,
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
Subject: [v7 07/16] mm/migrate_device: implement THP migration of zone device
 pages
Date: Wed,  1 Oct 2025 16:56:58 +1000
Message-ID: <20251001065707.920170-8-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:8:2f::27) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0f6f18-c78c-4585-2303-08de00b7ec19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzQ2WWg1UG9RbTRYRTJNSFh1MUh0SnVyWFNvUVAzRklaQU9jcmV5V0FOVkxm?=
 =?utf-8?B?Tm8zUysrcjBrRVQ5VUVGQ0tMOG5BSldFSldHaWxFa011Qi9vSWczZWh0VXJ0?=
 =?utf-8?B?bjJBaXlLb2J3QUh2cmVRS1BRR0o3ZklYQ1hnYzBhT1F3Q0dTbWdzUGhuVzN2?=
 =?utf-8?B?bFBjaUlNOWlMR09VNmNEUnptNFBiVXBIaXJsbCtrNmRkWXluaGllQWR2L01u?=
 =?utf-8?B?UStOeVhlbzJma3drUklRcm1GK3N5K0JTRUZKdmxWeXRvcGV2STFxTStGM1Zs?=
 =?utf-8?B?dmlqaWpBVGxWVUVKWXVGODNoVG9OckdlbVNHNnVEbnFXd1ZpYlQxQzk1Rys2?=
 =?utf-8?B?RDQrUHhvMVJkRUN2K1F6czJWeDNISE43UHByU2RSMFoxdSs5dlFzZzg0MzVQ?=
 =?utf-8?B?WnpKWFNJNkowa080N3o2WFdkZUwrRUhWRkZOR1dKYW9mOUhJMi80S1JWUHZH?=
 =?utf-8?B?Y1BKN3FoV05Ka2JZRDZFSFdYSGxrNXJTcThkcEFSdmtiemFJYk5ISU5zeVdW?=
 =?utf-8?B?bXl5Mm1WU1h0ODZnN0ZyNDloSmYzWFFuUVFDMEYwRmkyblhwMVN6TFBpT3Y4?=
 =?utf-8?B?NVlkSzJ0V3NjbzA3VjBRYVQ4OXVFaU5EaEJmU2srZkxSK3h5LzhzREx3alB6?=
 =?utf-8?B?dXpRTlZ0cVVkTm40Nm9OUkVJYXBvWjc1Y05zSEdZcDlqWmJISkQ5dVBvZ1ow?=
 =?utf-8?B?T2FGVEpvSDJTSklQQXJtOUQyYXI0OVVDVzdIVjZLQUxXVElSOGhOZStJZ0NO?=
 =?utf-8?B?V21Qc01IUi82dU43Tkh6bis5cFg5WHdMMEFYRXVTcFc5T3BKNTZ5cE9WT2F1?=
 =?utf-8?B?VE1lTXg3cjE1OWdqZGJLdXhQQU5iZ1FEaW53Q1A4Q2RTOGRyQVhvRHczUzND?=
 =?utf-8?B?U2lISFlrTGxVYTUvbEp6SmlQRS8wUjI4YlRxdm9ubXEyS3pLY0kzS0dVT1h0?=
 =?utf-8?B?Ty91VDh6THJPMjExeFUwYWJNOFJtQ1BkQ0ZxZDRpUm5wbEdyTmRXc3NZVVhu?=
 =?utf-8?B?Z1VRRE8zMHMycE1FaTZXMWZqZ0hjSHd1QkFhanF6TDVMVDRLY2MrZEd3L0oz?=
 =?utf-8?B?OXNpZ1RhVGhJSTh3OURGSHJ5S1RRNUR2WkZvdm9KbE5uOUhnVXJTd0UyZlhS?=
 =?utf-8?B?OWgzMEdjMEV3UlA2d24yT0EvNTd6ZFBZdTR1M2E3NFJvVUprbGt0UXNJaUc3?=
 =?utf-8?B?Zlo0Zmd3SllIR3RBOGgxQ0wvSEJmN2F0UDdPUmJENzEzeFRVcGFIVUxPREZT?=
 =?utf-8?B?bTZJWE13UTRiYlBKZm1kdEt3V2tMRXl3UVh2WW14cFpBbUpkekQrc3piTUdN?=
 =?utf-8?B?OFFvMDV6a0M0Ti84Zk5LVDBmckNCSDhlQTIvUHVTQmtRMmxGNkkyMkR4bXk5?=
 =?utf-8?B?ZkFjVWFUenNiUjRjSTcvdUlGUlBlc0UzZ0VTcFBnT1dKTzdOUXo4dzJmNnNH?=
 =?utf-8?B?ODBNa0RsRDkwZ1RxVlU4MzBuRWNwSmhOdmRiYmg1UVJ4SXh3bTZBbXgrU1or?=
 =?utf-8?B?THlWQlloeitaWUUyZk9jdC9tbTY5aENFRUJMTFNEd0IwbVVFZk52MXNkREg4?=
 =?utf-8?B?K1lQR1FKQ1pBSkwyckw2bWdiZjJhT3FlNVltVkRoZ1paKytQOFNWUzJHdWlD?=
 =?utf-8?B?VitjSGJ1RDhIZ3pTV1YvQU01cU5Rc0tOSVE0S2pnZHZxdkVGUkptRit0QzdZ?=
 =?utf-8?B?MngvYzVEUnhnZk1OQmRwZFYxRHpiVWh1c0VnVy92TVBOR2ZlQkJrZmN5anlW?=
 =?utf-8?B?aWN1MXFRaUl3MjFIak13c2hUbTNuS0J1TDB2VW9jd1cycnZXWmNzejQ3MGxk?=
 =?utf-8?B?aTIzaEQ1RTV6ZkluaE4yTkk4WkdKcDZ6azRyNkEwc3dLZnB4SytYVmQwTUln?=
 =?utf-8?B?TDZQSXdPRU1HbndOZWo4dGpDQWhPS3Y4aHd5eHp0STdFSlE1WGJxUFNUQTVF?=
 =?utf-8?Q?6h2SC8VvfS3VeXT8VEowfgKYQDmV8Unu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNkTHBBUWJKQkc4Q2Qvby92Q2g3aWZKMWtPWVNtVGZlSWFYZEZYUXc3d0p4?=
 =?utf-8?B?U0RhQ2lGbDlhZTEwMTd1OGFtVTRHemxQRjBrRS90TmZvQWU4M3pDNE9KYm5w?=
 =?utf-8?B?YW94eDVNSEVkMzZQVmdsUHVFaUxRWk5XbHY2WlIzZDBKSjRSZ2c4OXcyZXN5?=
 =?utf-8?B?R1BkaWNaeGhMVTF0Y1JvYzRmai9nUTdwbVlaaUtMRS9yTkZDOUJqS2pQekQy?=
 =?utf-8?B?Tnk2dVFMZU0yVVQraEw5aXBxSTFkZ0o4cDdXNE95SlRZM0JtZ3ZuVkt2VGkw?=
 =?utf-8?B?eFV6QWRoL0l2QWt3K1ZrRWRYUjdtSnlVczVXOFBFa01ZVlY5RmdUMmhBM3pv?=
 =?utf-8?B?OUVjZzdkZjkrQ2VJZ0xZUGhlRURSc3N6OHdkbWhkQjMydEZhNDBIRGJETzE1?=
 =?utf-8?B?VzhYM0Vnc1BGTlFjYmtZeWFVdXlHMWkzaXJkTjQzT3ZBNzAxazdFRUdubWhp?=
 =?utf-8?B?akJETVRYQjNYRGtlcjdTcWU0QmpJdUJDemRxL0xhOXd2ZUhPaW1xWkEra1VT?=
 =?utf-8?B?UGphRFlibEt5bHJRRG1HNllOVmVnWXNISmFtM3FwZkcrcG1UcENpS2hxODBC?=
 =?utf-8?B?Z002L2MxYjJjdWZQaVNGV1FDWm0rOFlqOEM5MVk3Y2IwYW5ZMW05SmplM2t2?=
 =?utf-8?B?dmsxekhpVFBSRUIxVFlHZU1RUzR0WU50cmtTbm40TW1Qek5ROTNqaG9tZlB5?=
 =?utf-8?B?VVpVSUFyNkFXSGVyV2drZU1rUlFRVGF2MWpacHk0VnNEcVgvMkNHdXdPNWZ5?=
 =?utf-8?B?VlpWanZDMFFWUFE1WGNIRGJzWDBaMyt2NWQ1Szh5M0d5bmlvb3RYejZkdTc4?=
 =?utf-8?B?REc1c3Q2Uzh0c0l3bVl5Z3ZTODQ3QUg3U1Y0dGdCLzFLaHFkUnl0c0xKS2lQ?=
 =?utf-8?B?RmR3eUo1aVcrZHh3M256NnJHUU9xOEt1TXNSekhKaGZEYjgwcHcrYXlhOStC?=
 =?utf-8?B?d0sxdURLTUpmbGQ2YzRtVk9sdzF0ZW1laURBSEFOSTdJc09ETmNaaklKZkR4?=
 =?utf-8?B?VXJ4eDFlU3hoZCt6SWdNUVhCdmNxeGUxVWxtVWVmcXRmdnhmbkxhNDViQkFo?=
 =?utf-8?B?UCt5QTk1WmM4cHI3VWNSVXE3Vk4xQUpBLzBnVHV0eDhabGpuSUNueVRFRXVE?=
 =?utf-8?B?TkZDWjFsUTdROFl2U1pVOTBYdVNYeFN5VC9vUGxZazNKNSs0d0tmNzBFemlM?=
 =?utf-8?B?MlI4cWsrNldsMWljMnNpN0wzL3hTZUJWdjRZZTVzdTdvbHZQSHhMdmp5N0RT?=
 =?utf-8?B?UnVBQWw1MC90TEVFVUFvSExESFpBSUdTOWoreXV3ei9JSUQ0VDcvMTlyR2FM?=
 =?utf-8?B?eU1FblFQa25kWmZFQm9WTU9xeElidnhnSFp5UGlJdGo3U0IvSktqRTk0SGV6?=
 =?utf-8?B?WU56U003aEJSOXl2SThyL3hrMnFpYnpqRWQ3RW9SZUFBTy9tOXZrQnRRc2ow?=
 =?utf-8?B?OW45U3ErUktpa1Bjck8rTW5VM0pZMG4vaEl6Z0JOaU50aTJWWDFkRnlWbEZQ?=
 =?utf-8?B?bDRBaWovRUVwNUFnWTNVUmtqbTNOU2ZFZnlGWUFLZzQyUHpYZmI0K0dGcUsx?=
 =?utf-8?B?eHovSUFBS2cvVkZTOWtJdmhaSVlhVzZYOEJuVlQ3QnRjdTRGeDA3SXlEMmNE?=
 =?utf-8?B?bWE1eFFXWGVMQzk5TUlmRmJHc0NRaTVFZXlvMjU0WmJFSURsVXFzNU1ZYTBy?=
 =?utf-8?B?OWZ4Z2R3bURGczlMSDBTVlQ1cVVvWWVidmFBeUxLb3NEZ1FKTUxUdWhKR0pR?=
 =?utf-8?B?OUpseEdrcVRuMFB5eEJwaVVPZkc3bTRPMGdFRkQzeDkxQnhadGZRV0lRbkxz?=
 =?utf-8?B?TTFTSDlKdERjbmViYnJCMVVPanVxaWx0eDk3U3Y3ZWlYZ2NERFJzQ0toVCtq?=
 =?utf-8?B?MHFCcHl5Uzd1NG1PU09GcjZmbzJNaEZSMUExcU1od1M0UlFjeVpWVE0wb3dU?=
 =?utf-8?B?UVg4U1Q2Y3Zjam0zc1ZoSCtNVHRiUS9jK1p3Q212ZEFTR0R2bkVXREpQQmdx?=
 =?utf-8?B?dDFyYnl3aEk0Ykwzb0JQUHJ2NWFNbStZUlgzei9PR05zSjFIb25nbzFZQ05y?=
 =?utf-8?B?dDVJVXhmalFTVmthWExOa1dFTnNpZEU5QUFSQ1VBUVUyQURpbXdLZHowWHhu?=
 =?utf-8?B?V1doVHh3V0ROS1lLNkEyczd6Njl1alcxOGU4QkxrZmZvUFlqeHNqcXlXRTdE?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0f6f18-c78c-4585-2303-08de00b7ec19
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:27.7678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvguDhBLh0UjRcf7kjVc1zXO1HfOuZBIbsblS5QdClhr8olIwlnYUYpspVrFDufu+ONxgf1N3gj+YEEvWkjx1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating device
pages as compound pages during device pfn migration.

migrate_device code paths go through the collect, setup and finalize
phases of migration.

The entries in src and dst arrays passed to these functions still remain
at a PAGE_SIZE granularity.  When a compound page is passed, the first
entry has the PFN along with MIGRATE_PFN_COMPOUND and other flags set
(MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the remaining entries
(HPAGE_PMD_NR - 1) are filled with 0's.  This representation allows for
the compound page to be split into smaller page sizes.

migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP page
aware.  Two new helper functions migrate_vma_collect_huge_pmd() and
migrate_vma_insert_huge_pmd_page() have been added.

migrate_vma_collect_huge_pmd() can collect THP pages, but if for some
reason this fails, there is fallback support to split the folio and
migrate it.

migrate_vma_insert_huge_pmd_page() closely follows the logic of
migrate_vma_insert_page()

Support for splitting pages as needed for migration will follow in later
patches in this series.

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
 include/linux/migrate.h |   2 +
 mm/migrate_device.c     | 469 ++++++++++++++++++++++++++++++++++------
 2 files changed, 408 insertions(+), 63 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 1f0ac122c3bf..41b4cc05a450 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -125,6 +125,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 #define MIGRATE_PFN_VALID	(1UL << 0)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
+#define MIGRATE_PFN_COMPOUND	(1UL << 4)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
@@ -143,6 +144,7 @@ enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
 	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
+	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 1c70d937ba44..4156fd6190d2 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -14,6 +14,7 @@
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
 #include <linux/swapops.h>
+#include <linux/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
 
@@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
 	if (!vma_is_anonymous(walk->vma))
 		return migrate_vma_collect_skip(start, end, walk);
 
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
+						MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages] = 0;
+		migrate->npages++;
+		migrate->cpages++;
+
+		/*
+		 * Collect the remaining entries as holes, in case we
+		 * need to split later
+		 */
+		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+	}
+
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
 		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
 		migrate->dst[migrate->npages] = 0;
@@ -101,57 +119,151 @@ static int migrate_vma_split_folio(struct folio *folio,
 	return 0;
 }
 
-static int migrate_vma_collect_pmd(pmd_t *pmdp,
-				   unsigned long start,
-				   unsigned long end,
-				   struct mm_walk *walk)
+/** migrate_vma_collect_huge_pmd - collect THP pages without splitting the
+ * folio for device private pages.
+ * @pmdp: pointer to pmd entry
+ * @start: start address of the range for migration
+ * @end: end address of the range for migration
+ * @walk: mm_walk callback structure
+ * @fault_folio: folio associated with the fault if any
+ *
+ * Collect the huge pmd entry at @pmdp for migration and set the
+ * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
+ * migration will occur at HPAGE_PMD granularity
+ */
+static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
+					unsigned long end, struct mm_walk *walk,
+					struct folio *fault_folio)
 {
+	struct mm_struct *mm = walk->mm;
+	struct folio *folio;
 	struct migrate_vma *migrate = walk->private;
-	struct folio *fault_folio = migrate->fault_page ?
-		page_folio(migrate->fault_page) : NULL;
-	struct vm_area_struct *vma = walk->vma;
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long addr = start, unmapped = 0;
 	spinlock_t *ptl;
-	pte_t *ptep;
+	swp_entry_t entry;
+	int ret;
+	unsigned long write = 0;
 
-again:
-	if (pmd_none(*pmdp))
+	ptl = pmd_lock(mm, pmdp);
+	if (pmd_none(*pmdp)) {
+		spin_unlock(ptl);
 		return migrate_vma_collect_hole(start, end, -1, walk);
+	}
 
 	if (pmd_trans_huge(*pmdp)) {
-		struct folio *folio;
-
-		ptl = pmd_lock(mm, pmdp);
-		if (unlikely(!pmd_trans_huge(*pmdp))) {
+		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
-			goto again;
+			return migrate_vma_collect_skip(start, end, walk);
 		}
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
 			spin_unlock(ptl);
-			split_huge_pmd(vma, pmdp, addr);
-		} else {
-			int ret;
+			return migrate_vma_collect_hole(start, end, -1, walk);
+		}
+		if (pmd_write(*pmdp))
+			write = MIGRATE_PFN_WRITE;
+	} else if (!pmd_present(*pmdp)) {
+		entry = pmd_to_swp_entry(*pmdp);
+		folio = pfn_swap_entry_folio(entry);
+
+		if (!is_device_private_entry(entry) ||
+			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
+			(folio->pgmap->owner != migrate->pgmap_owner)) {
+			spin_unlock(ptl);
+			return migrate_vma_collect_skip(start, end, walk);
+		}
 
-			folio_get(folio);
+		if (is_migration_entry(entry)) {
+			migration_entry_wait_on_locked(entry, ptl);
 			spin_unlock(ptl);
-			/* FIXME: we don't expect THP for fault_folio */
-			if (WARN_ON_ONCE(fault_folio == folio))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			if (unlikely(!folio_trylock(folio)))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			ret = split_folio(folio);
-			if (fault_folio != folio)
-				folio_unlock(folio);
-			folio_put(folio);
-			if (ret)
-				return migrate_vma_collect_skip(start, end,
-								walk);
+			return -EAGAIN;
+		}
+
+		if (is_writable_device_private_entry(entry))
+			write = MIGRATE_PFN_WRITE;
+	} else {
+		spin_unlock(ptl);
+		return -EAGAIN;
+	}
+
+	folio_get(folio);
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		spin_unlock(ptl);
+		folio_put(folio);
+		return migrate_vma_collect_skip(start, end, walk);
+	}
+
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
+
+		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+						| MIGRATE_PFN_MIGRATE
+						| MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages++] = 0;
+		migrate->cpages++;
+		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (ret) {
+			migrate->npages--;
+			migrate->cpages--;
+			migrate->src[migrate->npages] = 0;
+			migrate->dst[migrate->npages] = 0;
+			goto fallback;
 		}
+		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+		spin_unlock(ptl);
+		return 0;
+	}
+
+fallback:
+	spin_unlock(ptl);
+	if (!folio_test_large(folio))
+		goto done;
+	ret = split_folio(folio);
+	if (fault_folio != folio)
+		folio_unlock(folio);
+	folio_put(folio);
+	if (ret)
+		return migrate_vma_collect_skip(start, end, walk);
+	if (pmd_none(pmdp_get_lockless(pmdp)))
+		return migrate_vma_collect_hole(start, end, -1, walk);
+
+done:
+	return -ENOENT;
+}
+
+static int migrate_vma_collect_pmd(pmd_t *pmdp,
+				   unsigned long start,
+				   unsigned long end,
+				   struct mm_walk *walk)
+{
+	struct migrate_vma *migrate = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long addr = start, unmapped = 0;
+	spinlock_t *ptl;
+	struct folio *fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+	pte_t *ptep;
+
+again:
+	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
+		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
+
+		if (ret == -EAGAIN)
+			goto again;
+		if (ret == 0)
+			return 0;
 	}
 
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
@@ -238,8 +350,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
 
-		/* FIXME support THP */
-		if (!page || !page->mapping || PageTransCompound(page)) {
+		if (!page || !page->mapping) {
 			mpfn = 0;
 			goto next;
 		}
@@ -410,14 +521,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 	 */
 	int extra = 1 + (page == fault_page);
 
-	/*
-	 * FIXME support THP (transparent huge page), it is bit more complex to
-	 * check them than regular pages, because they can be mapped with a pmd
-	 * or with a pte (split pte mapping).
-	 */
-	if (folio_test_large(folio))
-		return false;
-
 	/* Page from ZONE_DEVICE have one extra reference */
 	if (folio_is_zone_device(folio))
 		extra++;
@@ -448,17 +551,24 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 	lru_add_drain();
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
+		unsigned int nr = 1;
 
 		if (!page) {
 			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
 				unmapped++;
-			continue;
+			goto next;
 		}
 
 		folio =	page_folio(page);
+		nr = folio_nr_pages(folio);
+
+		if (nr > 1)
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+
+
 		/* ZONE_DEVICE folios are not on LRU */
 		if (!folio_is_zone_device(folio)) {
 			if (!folio_test_lru(folio) && allow_drain) {
@@ -470,7 +580,7 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 			if (!folio_isolate_lru(folio)) {
 				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
-				continue;
+				goto next;
 			}
 
 			/* Drop the reference we took in collect */
@@ -489,10 +599,12 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			restore++;
-			continue;
+			goto next;
 		}
 
 		unmapped++;
+next:
+		i += nr;
 	}
 
 	for (i = 0; i < npages && restore; i++) {
@@ -638,6 +750,160 @@ int migrate_vma_setup(struct migrate_vma *args)
 }
 EXPORT_SYMBOL(migrate_vma_setup);
 
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+/**
+ * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
+ * at @addr. folio is already allocated as a part of the migration process with
+ * large page.
+ *
+ * @page needs to be initialized and setup after it's allocated. The code bits
+ * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
+ * not support THP zero pages.
+ *
+ * @migrate: migrate_vma arguments
+ * @addr: address where the folio will be inserted
+ * @page: page to be inserted at @addr
+ * @src: src pfn which is being migrated
+ * @pmdp: pointer to the pmd
+ */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	struct vm_area_struct *vma = migrate->vma;
+	gfp_t gfp = vma_thp_gfp_mask(vma);
+	struct folio *folio = page_folio(page);
+	int ret;
+	vm_fault_t csa_ret;
+	spinlock_t *ptl;
+	pgtable_t pgtable;
+	pmd_t entry;
+	bool flush = false;
+	unsigned long i;
+
+	VM_WARN_ON_FOLIO(!folio, folio);
+	VM_WARN_ON_ONCE(!pmd_none(*pmdp) && !is_huge_zero_pmd(*pmdp));
+
+	if (!thp_vma_suitable_order(vma, addr, HPAGE_PMD_ORDER))
+		return -EINVAL;
+
+	ret = anon_vma_prepare(vma);
+	if (ret)
+		return ret;
+
+	folio_set_order(folio, HPAGE_PMD_ORDER);
+	folio_set_large_rmappable(folio);
+
+	if (mem_cgroup_charge(folio, migrate->vma->vm_mm, gfp)) {
+		count_vm_event(THP_FAULT_FALLBACK);
+		count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
+		ret = -ENOMEM;
+		goto abort;
+	}
+
+	__folio_mark_uptodate(folio);
+
+	pgtable = pte_alloc_one(vma->vm_mm);
+	if (unlikely(!pgtable))
+		goto abort;
+
+	if (folio_is_device_private(folio)) {
+		swp_entry_t swp_entry;
+
+		if (vma->vm_flags & VM_WRITE)
+			swp_entry = make_writable_device_private_entry(
+						page_to_pfn(page));
+		else
+			swp_entry = make_readable_device_private_entry(
+						page_to_pfn(page));
+		entry = swp_entry_to_pmd(swp_entry);
+	} else {
+		if (folio_is_zone_device(folio) &&
+		    !folio_is_device_coherent(folio)) {
+			goto abort;
+		}
+		entry = folio_mk_pmd(folio, vma->vm_page_prot);
+		if (vma->vm_flags & VM_WRITE)
+			entry = pmd_mkwrite(pmd_mkdirty(entry), vma);
+	}
+
+	ptl = pmd_lock(vma->vm_mm, pmdp);
+	csa_ret = check_stable_address_space(vma->vm_mm);
+	if (csa_ret)
+		goto abort;
+
+	/*
+	 * Check for userfaultfd but do not deliver the fault. Instead,
+	 * just back off.
+	 */
+	if (userfaultfd_missing(vma))
+		goto unlock_abort;
+
+	if (!pmd_none(*pmdp)) {
+		if (!is_huge_zero_pmd(*pmdp))
+			goto unlock_abort;
+		flush = true;
+	} else if (!pmd_none(*pmdp))
+		goto unlock_abort;
+
+	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
+	if (!folio_is_zone_device(folio))
+		folio_add_lru_vma(folio, vma);
+	folio_get(folio);
+
+	if (flush) {
+		pte_free(vma->vm_mm, pgtable);
+		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
+		pmdp_invalidate(vma, addr, pmdp);
+	} else {
+		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
+		mm_inc_nr_ptes(vma->vm_mm);
+	}
+	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
+	update_mmu_cache_pmd(vma, addr, pmdp);
+
+	spin_unlock(ptl);
+
+	count_vm_event(THP_FAULT_ALLOC);
+	count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
+	count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
+
+	return 0;
+
+unlock_abort:
+	spin_unlock(ptl);
+abort:
+	for (i = 0; i < HPAGE_PMD_NR; i++)
+		src[i] &= ~MIGRATE_PFN_MIGRATE;
+	return 0;
+}
+#else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	return 0;
+}
+#endif
+
+static unsigned long migrate_vma_nr_pages(unsigned long *src)
+{
+	unsigned long nr = 1;
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+	if (*src & MIGRATE_PFN_COMPOUND)
+		nr = HPAGE_PMD_NR;
+#else
+	if (*src & MIGRATE_PFN_COMPOUND)
+		VM_WARN_ON_ONCE(true);
+#endif
+	return nr;
+}
+
 /*
  * This code closely matches the code in:
  *   __handle_mm_fault()
@@ -648,9 +914,10 @@ EXPORT_SYMBOL(migrate_vma_setup);
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
-				    struct page *page,
+				    unsigned long *dst,
 				    unsigned long *src)
 {
+	struct page *page = migrate_pfn_to_page(*dst);
 	struct folio *folio = page_folio(page);
 	struct vm_area_struct *vma = migrate->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -678,8 +945,24 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	pmdp = pmd_alloc(mm, pudp, addr);
 	if (!pmdp)
 		goto abort;
-	if (pmd_trans_huge(*pmdp))
-		goto abort;
+
+	if (thp_migration_supported() && (*dst & MIGRATE_PFN_COMPOUND)) {
+		int ret = migrate_vma_insert_huge_pmd_page(migrate, addr, page,
+								src, pmdp);
+		if (ret)
+			goto abort;
+		return;
+	}
+
+	if (!pmd_none(*pmdp)) {
+		if (pmd_trans_huge(*pmdp)) {
+			if (!is_huge_zero_pmd(*pmdp))
+				goto abort;
+			split_huge_pmd(vma, pmdp, addr);
+		} else if (pmd_leaf(*pmdp))
+			goto abort;
+	}
+
 	if (pte_alloc(mm, pmdp))
 		goto abort;
 	if (unlikely(anon_vma_prepare(vma)))
@@ -770,23 +1053,24 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 	unsigned long i;
 	bool notified = false;
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
 		struct folio *newfolio, *folio;
 		int r, extra_cnt = 0;
+		unsigned long nr = 1;
 
 		if (!newpage) {
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		if (!page) {
 			unsigned long addr;
 
 			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
-				continue;
+				goto next;
 
 			/*
 			 * The only time there is no vma is when called from
@@ -804,15 +1088,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-			migrate_vma_insert_page(migrate, addr, newpage,
+
+			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
+				nr = migrate_vma_nr_pages(&src_pfns[i]);
+				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				goto next;
+			}
+
+			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
 						&src_pfns[i]);
-			continue;
+			goto next;
 		}
 
 		newfolio = page_folio(newpage);
 		folio = page_folio(page);
 		mapping = folio_mapping(folio);
 
+		/*
+		 * If THP migration is enabled, check if both src and dst
+		 * can migrate large pages
+		 */
+		if (thp_migration_supported()) {
+			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+
+				if (!migrate) {
+					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
+							 MIGRATE_PFN_COMPOUND);
+					goto next;
+				}
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			}
+		}
+
+
 		if (folio_is_device_private(newfolio) ||
 		    folio_is_device_coherent(newfolio)) {
 			if (mapping) {
@@ -825,7 +1141,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				if (!folio_test_anon(folio) ||
 				    !folio_free_swap(folio)) {
 					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-					continue;
+					goto next;
 				}
 			}
 		} else if (folio_is_zone_device(newfolio)) {
@@ -833,7 +1149,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		BUG_ON(folio_test_writeback(folio));
@@ -845,6 +1161,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 		else
 			folio_migrate_flags(newfolio, folio);
+next:
+		i += nr;
 	}
 
 	if (notified)
@@ -1006,10 +1324,23 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, pfn;
+	unsigned long i, j, pfn;
+
+	for (pfn = start, i = 0; i < npages; pfn++, i++) {
+		struct page *page = pfn_to_page(pfn);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++)
 		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j - 1;
+			pfn += j - 1;
+		}
+	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
@@ -1027,10 +1358,22 @@ EXPORT_SYMBOL(migrate_device_range);
  */
 int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
 {
-	unsigned long i;
+	unsigned long i, j;
+
+	for (i = 0; i < npages; i++) {
+		struct page *page = pfn_to_page(src_pfns[i]);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
-	for (i = 0; i < npages; i++)
 		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j - 1;
+		}
+	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
-- 
2.51.0

