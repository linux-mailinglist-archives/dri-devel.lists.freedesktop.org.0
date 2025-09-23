Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA780B93FD9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2E310E535;
	Tue, 23 Sep 2025 02:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MEyc4lab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011059.outbound.protection.outlook.com
 [40.93.194.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7EA10E534
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgPa83eHoju0g+c22rqe7SjLQRdV4ED0ULTaM4JYsgxhqvNs/P2LfGM+j+LH7MWxH1f7WA36BtMLvfkXwA2R2kOeIT6rXq1JXfmjr3aM0f447OtEmM2hiPeei0b4y38Ngx8hPyeoPdGnkkhgOKI+nR7ZgODXkdwx/9RTwPsEnIalAv28cqeOxb0wyY/dmW0TNiuH+HE4uEwGvAltFgBAskYHDsZP5u1fBwzjGsfck0YAhWCedDuReBqyyZM+2WOWpk/OlNOY1pnjpKyFWCeCjbYdETssxMLv/wMa6Bowabx00cGWrpiNuAfeHXIaO+v5pBM0dX8cVQEFGCS8m6EO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qZi/RmJw1BECtEDQfzKvd0NfwQmUIU/fqfkSyvjBco=;
 b=XoTQesrMnrYlU7KEm0gZapd/nlOS4JbR8jQ/Ks0cs92phXWRhB0lsWb9SZ09tDXkiviGilI2Rqk5SQdPFE1VYElD1AkqNL5+Vzp0Ycva5uOl+uV1MBMch62uN0ZRvVZuBqHHNMnCDkAE/Qc2MyV3gxmznV/66YEvCGLnzhvwWOJp/mGfdeb4vc8NuvvLYoygMvQr//KFVIhDgQEdI5dUeHFtOUDtIng0FblHAwhqmE+ht7vdiZzN/v46viSfVBPF+9dx/bK97BQOT8miFz9qOtkSf6KpijoSehfMAAazRogUbppOM9DBKUXPN95BfHbTWj0O6y93yiKRa8TI1ZvEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qZi/RmJw1BECtEDQfzKvd0NfwQmUIU/fqfkSyvjBco=;
 b=MEyc4labKMV2u1/j/GFNV91wnU6+5xHJVDpLgD3Oahri26n5iCm3CMz9vAyNQm7S8QGKe4qKfAwcaV2KzDl7opC3K8wS2jntHvqCXacgx95cVP0hyLwCUJK2q73exoEn53EpedG2arc8UtI9M6VISOpYqp6wFFbdgvLc+LdWJ51V2vlZXMT7uqV6SshUGhifpz4wAoisN8wW1jc2zE+FRiCqsrICBqrWGpnAt8f/UdJnb27WI51SKLcF7Fo8DSO3EDYEfdD8CWtaay0yQr8aFWFSKGzb2ao+mHgrU6ucbyAhu9fTsz6yY3jbBcdWhI/5kVqkut4iFFwTX/HwJp5kmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by BN3PR12MB9571.namprd12.prod.outlook.com (2603:10b6:408:2ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 02:23:35 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 02:23:35 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, David Hildenbrand <david@redhat.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 05/15] mm/migrate_device: handle partially mapped folios
 during collection
Date: Mon, 22 Sep 2025 22:23:34 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <3FE3F2B9-86F9-4EED-863A-093FE3959B1A@nvidia.com>
In-Reply-To: <20250916122128.2098535-6-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-6-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0724.namprd03.prod.outlook.com
 (2603:10b6:408:110::9) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|BN3PR12MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dd1781-ebe2-45ac-2433-08ddfa4832eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlZGY3dsZkIyY01xd1JqaG1DTXZnUU82S1c1S0graFZpU2FjNjA1R2FEVlo2?=
 =?utf-8?B?N0VITjhuZFkvSVo3OXMvZ1ZDazN5VlBwOXUwMEdBdkJzRmpuQ09VdlhGL1lT?=
 =?utf-8?B?aTNUaFY3azRXTUdxdGQ3SEdDMDNCUW1kaElNLzdWN25OTFdBVm5jK0k3SFdm?=
 =?utf-8?B?UkN2UjRqTVFNN0hZcXJkL0RCT0ZJRHl2bHhkTDJMY1FROGNaTDNWOTJSNDNu?=
 =?utf-8?B?UC80d1ZUVGVKZHU0VmdaWW1wUzBweFZBRTdpa09GREZMVUNLRGtMMnliYkdQ?=
 =?utf-8?B?SWJmc2pQdE5NeEhuSjQyWm5YRHoyQmdqN2ZCRzgxR0tEMVdGVWlWS0I5dGJK?=
 =?utf-8?B?ZWhIQVJaTmRrZXE3V0thcWp0ZlFTdVVlN2E1eCtMK1cyc2lCbWFMcE9CZllp?=
 =?utf-8?B?U2VFU3E2SFQyZE13bnJ5cE0rS3JTMmhibUpjaUZ2L2NNUjZCbERBYU0xb2VQ?=
 =?utf-8?B?UVZWR25TdmlBY1QyOEdQeE01MU0vc0gwblBITlMvOEM1NExYMnN4dEs5V2pL?=
 =?utf-8?B?UDhtbHlYdU5zWk5CNDA4K0UxSmtNZmZyN0c3d0s1ampVWXp0MmNObzVMSVd6?=
 =?utf-8?B?TEthVVBnOVlGMnJkVjdKWXhMMTRmQlJvTVlteGZPQ2YrbHhWR3Y4bEl2VWpo?=
 =?utf-8?B?MkhKS0YxeHBtb0txOTkwb1puL0Z3eHI1NGVPY3MyaWEzN05weitSb3poYk9k?=
 =?utf-8?B?NG5YYjVwaTFwRlliSnVNNk5qN0h0aE5IclRuSUpFSjBRZUZabGgxOGZZQnI2?=
 =?utf-8?B?MHBpN3pPQXlwMlg5T0hNZjh1L05rVWNEWENCY1I1dGtTSnAzSnByTitBYmZF?=
 =?utf-8?B?SHRQejVsVWhiU0FOeHJ2bTRrOWtKNHdGZFhodFlKMm9yZjNHN2xMTVc2NzNu?=
 =?utf-8?B?alUxa0E1VTZKRjYrU2hvY0hEVkJZVmNFQWMrKzdORGJWaU45TmwzaUVlVlZT?=
 =?utf-8?B?ZnFXcmc5Tm9QelM2K2RCMjNpRzQzZ0tLaUhpLy9ySlpNelZaK3hid2RCakNK?=
 =?utf-8?B?U3BDRXRKcUNtQTB3Q2paSlBqaGxkdE5QYTk2MWttQnE3YkZ4MWpqcVhrUzZp?=
 =?utf-8?B?VEpQa2lTQzVJTWdoY2w0bloxVlkxSXlJbytQeTRYeWRhSWd0MjNvMEF3dm1O?=
 =?utf-8?B?Y2dudWVBTVV5QlQ2RzVYMlFsM0d3Vm95UUlndGFGUjE3N0JLbDhDeXJoNlpK?=
 =?utf-8?B?MXRocG9tdFNKWUJSLzc0VVNrcVgvNTgzUjFSSVVWSXA1YWI0YTVUT1ZyRWVY?=
 =?utf-8?B?Z3FLRmY1RnhGWTlmdWFFZURIVEs1aklNUnNHT0xaMk80SVFKZmlxZjI2SFRM?=
 =?utf-8?B?WUtwVTd1MisyK3JtRXRBNDJneWt6V3J0d0JIeFpxaEdhZk1CbVBUM3Y1dVo5?=
 =?utf-8?B?NC8vOEUvc2dmaFordFJla0k4ejlidmZRNTJVUmJ1UHhFeTI3UE1xbm4wMnU4?=
 =?utf-8?B?aUZwMHUyRnRPKzRCemJXOTNKQVBzT21PaFJNNENXWkViZXhUZkdlVFM2QzhC?=
 =?utf-8?B?NENGazBRdjRQK0FTUUw3QTVjMVFWakgzWDVMUjFXMjFVNkZDTHIycU9FTk8r?=
 =?utf-8?B?anpYeU5lL25qL3ZFbytPU0ZaM2psUmsxN00zdmhzcG1Pc1ZpWUlvamlGMFgr?=
 =?utf-8?B?Yy9OK2QxTmxndXhjbmpVRU9GQnpnbWhMN0tBWFU2bVZseS9KVDZNbnRUbGc5?=
 =?utf-8?B?aENEUFhFZ1ZDdVFZTmF4OTdUMWtZQVlyUkp1Mzhta2NmZUxyaEd0dDZxMm51?=
 =?utf-8?B?elZPSHRlRzQ1ZGp2bkZzV25GNDc5WE1DNFh4a3NqWEZCRW1ST25PdWs2WFg0?=
 =?utf-8?B?bWNPeUlNbDdvL0hDckVmRnBaWlIvNTljeTRhWE1NR1gweGMxcnBpM0kyUEJX?=
 =?utf-8?B?R0c5L3dWRFp1MTRxdnNjZXNSMVNMS1RycXZmNE1TOFRLVDdpL1JDa1Z6V1Rj?=
 =?utf-8?Q?O9ThEOltgMk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL4PR12MB9478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTd2bkNQdWdvYlJJdnFzWXpqRWIvRzU0alE0RFhEdlBoaUt6K3ZNMTh3RStp?=
 =?utf-8?B?UE44clVKWTV1dWtqYnVLZ1RFNmJSODNiQ3NBTzJlSWtuZlNZcCtwdTd4R1Jp?=
 =?utf-8?B?QjZ1WXJQMDhCUmZoUGNiY2g2VFRhYXNUMUxaK0hhY2cyOHU0bHNOaDBiZUl4?=
 =?utf-8?B?MlVtMTRxWHB1OWhkd3h2UVBBWlFrUDc1cUx6d2VtRUxUVmZsMjhwaHREV084?=
 =?utf-8?B?cmhRc3c3eldDemNtaUkxZlMydlZ1VHlMZ2c1QXRsM3JKRVBCcnZBUFl1TkVS?=
 =?utf-8?B?OExpMkthV3grcmRsTTRDZ0ladWNaczFLSjBWZkZweHBtSWIrWENhYVg2TjQz?=
 =?utf-8?B?OXA0VjNkaXlXVkpYRTBpTE1NbklUb2xORXZXQkhvbFFaNjZUYWFuVVNDNjdk?=
 =?utf-8?B?ams3TzRFTzlHWi9wZ3JiMGpKbWh0cm13Y1haQkJ4ZmViN1hLL1RUU2Vvb3R5?=
 =?utf-8?B?Q3BqSTcyL2JsUXA0Nk0zM1J5Rno3cFQ3T3o3QjBaVkJaOVZnbnRxK01Wd0tu?=
 =?utf-8?B?UjlkSkVwclBlcG5rb3pES0hJRUhENlRlWktHMGh0S1lQb2U5NitsNmwzdEZ6?=
 =?utf-8?B?RG5NZy8weUVaNlg5eEszZDJZdDZzaEduTWhWY01rR3U2MUh3Q3oxYnhHUUlW?=
 =?utf-8?B?NXlvQlBpVFoxMVJWQmhNbXhXRURleUpVNXJWL20wMUZsRmUxNC8vNVFJbjBt?=
 =?utf-8?B?Z21ydDBTdCtQSXVMbkpkZjlFc0dSWGtVNFVwWUthYVE2UHZPQXFjazMxTmNh?=
 =?utf-8?B?R3lXWGsrZGZPeVpteFhEUVZZc2d3QTMrck9UT0ZHL0tFeStJY1V5WDNPQ0Vh?=
 =?utf-8?B?YUxwS2VlYWtkSk14U0tudVpkQUkvZGx4WWlKd0hZMmh6QnBlcGkxL1BqTE00?=
 =?utf-8?B?SXYraDNWcXRVeW81Y2krODdEbzVBT3lCUUthdjl5Y1ZHam1tam5GSUZ6WnB5?=
 =?utf-8?B?R1ZpNlJERUptWXkvTlFXN296ZkNLcFR6V1JmVTVmT2pucDQ1bTZVQUF1VjRC?=
 =?utf-8?B?ZkNZZld0eGYrNkVGRFVTRDF5MlFwb2hFT1RncUxuZ1VDZWg3T0xzRnZHSUJm?=
 =?utf-8?B?cE1DOXR5aUQvTWZvVWpIMzlTb3hRTHFneXhHL2lleE0vYVl6YjhKbFpGUkVp?=
 =?utf-8?B?WUpoVkVDZVlvdGdlVXdCY1cyUlNESERGMFdpYjhiR29hMUlBaWVqY2RDZFB4?=
 =?utf-8?B?RE4rZ1o4a0F6VHgvU3g2cXM5R2toUG5SU0NUZVNySVlVdGNYSWppMFhTMGFC?=
 =?utf-8?B?MWtQZENuMXhaWHQxWnY3YkwyWWFTZWtmeEpKclVmckJ0OUpyTG5iMXhvbGgr?=
 =?utf-8?B?dFJTM2Z3bFNtNytRLzNsZVRFcmVvOEE2MUFvdzZHMHFwdkJhYU1oNHQyNHB5?=
 =?utf-8?B?akp2YkdSQkUzWERhbVc1UFYwUUdkOTg0Rm9iSWtGYWtCK0pxNlovRlNTZVY2?=
 =?utf-8?B?aGVCWFlhSC8yV2sySkc0UERSMW1iajJUbi9ienI0cDYva2ZEdUpGUnoveHgv?=
 =?utf-8?B?TEdyMmJ3S3JiK2RJVTlmNC9YVi9SSDdsTzBDdW1jempyZzQrc3I0d1grZ2o5?=
 =?utf-8?B?OUo2N0l1ZmlFQmdxVXRBNjlZTnhwcmNZK1FSYmRrZUR6T08rNXdWUStDL0l1?=
 =?utf-8?B?cytFdlBaay9GT2ZhQklQMHdDbTMzTHdHSFpUVW5STmJId1NxR3ZhWnFzbFMy?=
 =?utf-8?B?V0d5VzQ2bmJnd3RHcWZQM0N6NThnQXJHZmRzNWZCNGcvZVE0dEdPZU84ajZp?=
 =?utf-8?B?bFhZMWVDQWt5UHJOWGlWUWV5WWZrWCs5Rzd5SVJrUENEVHR6OWh3Mmd3WVQ2?=
 =?utf-8?B?cGs2ZGZDdjFKYzlwVHlOczNGQ2F4VlZ0bVlKQ2ZsdmY0aDR2d1RWelJPdElu?=
 =?utf-8?B?a2xrT1BSdlMyaGV1bFV4ekZQYTViKy9kaDJYVjBkWGdPUzluMElWUzB4c296?=
 =?utf-8?B?SEpkd0VTcUVuSVpLOSs0U0IxSzhQWFU5MFQ4Qm5Qd2dNKzE2NytOOU5sZWNi?=
 =?utf-8?B?RGQySmJMeGdBRzZKL1RlbGRtRjEzOG81MUFUOHljUE9pSXJ0YUFIdzdtUkpy?=
 =?utf-8?B?UlJBZk9UWFBvcDZUdEV0WFFpVGk2cGYxdUdVTDRyQmZ2Z1VEZk9icmtKcEJM?=
 =?utf-8?Q?hnpAxPFi7x0kn7mkra5eAp34i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dd1781-ebe2-45ac-2433-08ddfa4832eb
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:23:35.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjjbhpF6UG2g3u62Ud8/dyIdt0+FM1HkKFCRFf/O26Ls/9ut0jDNpEe+Y4VykHx9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9571
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

On 16 Sep 2025, at 8:21, Balbir Singh wrote:

> Extend migrate_vma_collect_pmd() to handle partially mapped large folios
> that require splitting before migration can proceed.
>
> During PTE walk in the collection phase, if a large folio is only
> partially mapped in the migration range, it must be split to ensure the
> folio is correctly migrated.
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  mm/migrate_device.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index abd9f6850db6..70c0601f70ea 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
>  	return 0;
>  }
>
> +/**
> + * migrate_vma_split_folio() - Helper function to split a THP folio
> + * @folio: the folio to split
> + * @fault_page: struct page associated with the fault if any
> + *
> + * Returns 0 on success
> + */
> +static int migrate_vma_split_folio(struct folio *folio,
> +				   struct page *fault_page)
> +{
> +	int ret;
> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
> +	struct folio *new_fault_folio = NULL;
> +
> +	if (folio != fault_folio) {
> +		folio_get(folio);
> +		folio_lock(folio);
> +	}
> +
> +	ret = split_folio(folio);
> +	if (ret) {
> +		if (folio != fault_folio) {
> +			folio_unlock(folio);
> +			folio_put(folio);
> +		}
> +		return ret;
> +	}
> +
> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
> +
> +	/*
> +	 * Ensure the lock is held on the correct
> +	 * folio after the split
> +	 */
> +	if (!new_fault_folio) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +	} else if (folio != new_fault_folio) {
> +		folio_get(new_fault_folio);
> +		folio_lock(new_fault_folio);
> +		folio_unlock(folio);
> +		folio_put(folio);
> +	}
> +
> +	return 0;
> +}
> +
>  static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				   unsigned long start,
>  				   unsigned long end,
> @@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			 * page table entry. Other special swap entries are not
>  			 * migratable, and we ignore regular swapped page.
>  			 */
> +			struct folio *folio;
> +
>  			entry = pte_to_swp_entry(pte);
>  			if (!is_device_private_entry(entry))
>  				goto next;
> @@ -147,6 +196,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			    pgmap->owner != migrate->pgmap_owner)
>  				goto next;
>
> +			folio = page_folio(page);
> +			if (folio_test_large(folio)) {
> +				int ret;
> +
> +				pte_unmap_unlock(ptep, ptl);
> +				ret = migrate_vma_split_folio(folio,
> +							  migrate->fault_page);
> +
> +				if (ret) {
> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +					goto next;
> +				}
> +
> +				addr = start;
> +				goto again;
> +			}

This does not look right to me.

The folio here is device private, but migrate_vma_split_folio()
calls split_folio(), which cannot handle device private folios yet.
Your change to split_folio() is in Patch 10 and should be moved
before this patch.

> +
>  			mpfn = migrate_pfn(page_to_pfn(page)) |
>  					MIGRATE_PFN_MIGRATE;
>  			if (is_writable_device_private_entry(entry))
> @@ -171,6 +237,22 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  					pgmap->owner != migrate->pgmap_owner)
>  					goto next;
>  			}
> +			folio = page ? page_folio(page) : NULL;
> +			if (folio && folio_test_large(folio)) {
> +				int ret;
> +
> +				pte_unmap_unlock(ptep, ptl);
> +				ret = migrate_vma_split_folio(folio,
> +							  migrate->fault_page);
> +
> +				if (ret) {
> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +					goto next;
> +				}
> +
> +				addr = start;
> +				goto again;
> +			}
>  			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>  		}
> -- 
> 2.50.1


--
Best Regards,
Yan, Zi
