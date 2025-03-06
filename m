Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC7BA541BD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A6910E11D;
	Thu,  6 Mar 2025 04:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M/+XCAh0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EED510E100;
 Thu,  6 Mar 2025 04:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRU8MEYKsrAhkzRWRgnvqXl8yiCHVxVODx0vI6GlqRRUP5hEIG6GJU/48jXSfE31AhO1m3TrTmS0MFH/gFbklina8+fPd8FkZifpFN/AYji1Sa4dJtn1/DIe5T5X25+5XhG3AJ+UCXw1FPjC1TkRbtzEnze6Q/zqO4VFLAwRAAH6XeaU+OKhuJGpao18CNtmlcQ8qdNBXKl5HOsnGJtfBBL/GTzHLgnzKqUN66cKSAhBIuMUZSDVLBH5AZ0WDutkbeehjxOq0KCZTR4BsSc0avcXanvQjBqRvocQVaue+qOgyupKAjkqB9CXIXiBFnt5I5PHEmHWoVYelNam3ha5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEiN1R594GiUTbIEP1lF9AXj6UN5pBWNtHkFzo5QNmQ=;
 b=VSMUWUspZzbXCV8TDysABk2ZVI6S/tw9qPVZ7QoIIqIls1XLlkzT3sVW6zBEcvTzcysi4JLbwmedHsCddoPMGDp/5Vf2TSJKnYVkt+z2O2cRRby+50dteEY/MiJQK6G935lgnLszU9nXfIJj7zHvWyEIEE/0NyiyBXkjOPM32uU64NU5SdoXKvc88f5Vjxy3/6okXY9YLy0f9MV8ZryanjLyR5e9SWPebSsCZkeXMUPkVbSkCtxCAyAyn8UVig2mNQ8gmMKWFLc/We5ssvv6DX/nfo8gsjuxdQhr3Mn8bjiXPDC7/95gVI4mjh/mTPkst1AZv5Tq0GNBZH/vh6Kk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEiN1R594GiUTbIEP1lF9AXj6UN5pBWNtHkFzo5QNmQ=;
 b=M/+XCAh0PGqlwnjDWpxhcj0Kf/vP0bvfr5233KJ9Y+BoowMne/V2ooR/EilcJmC+XyessbC+0G2zqIfQCP/d3qJKZhi41MMDtNXBvjZ1jqUC7RoBmmh8Rt4L9Jqg8fjWEBUUuUpcDlS4RLsjecR0vHnkXivVPpxKqu31y00DPtwfG8N/s3AgvdAPMIzimN9vwG0qL7wrSbuwOSOxE5j14f9qgzhnnQVOsf4G2mWdjEJ1zaa57x7W1FAaAztfWZK4BbwBVSX7PFFGENBzib39Xw+FrgqX9pe5UUu4/1LTk+y3P6ScTdsbUtYgGgRMACte3gvuALKMMAWJax/evnYCkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 04:43:33 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:43:33 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 00/11] THP support for zone device pages
Date: Thu,  6 Mar 2025 15:42:28 +1100
Message-ID: <20250306044239.3874247-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 350507ea-c07f-4250-295f-08dd5c69730b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0RWL0JGemY1cGE1MWp0cWxwMDFaNHpLTU94Q2VPcGI5RXNuSENyRDVUMTVF?=
 =?utf-8?B?bGt6S3duR01aVU5yaDNrckdSRWF5NWJsWXFVdzFOYjJDVERucHRzSzVSQnVU?=
 =?utf-8?B?aU9PcW5hZHl1a3J6RlR3ZWNkZStGT0w4Q00wYnU5UjlMeEsyamZzV0g3NXpD?=
 =?utf-8?B?cERURXdtQVFkTllmSjB2WkdvZHpIenlEZ2t0TUIwY2k4bVp4RWhVd3NFRWVn?=
 =?utf-8?B?VFZJTkF3Z2EwWTJWYW4yK0ZDR3RIMldFZThEdFBpVWtyUDJzQXV4enlXbzdq?=
 =?utf-8?B?U3hUODJDbHVHUVR3emVUWWs3cnM1amtmRzNURHFHS1RSUGdZUlVYRVJJQzBq?=
 =?utf-8?B?TVpUOXEzY05wZ2JmTkpJNkVOSkFPQ240cHZWeFYreWYybWMyM205MkVJbWMw?=
 =?utf-8?B?STV4OGpLOGg2eDdqUlNEUGgyclZGRmE4by9JdWx1OWVyR1hQTi9SZ21aMlVN?=
 =?utf-8?B?aGw3WlVpS1dmcVBzbkY0R3dRWThWUW5nWkJSUC85dFVMdG14Tk1pRFduMjVE?=
 =?utf-8?B?M1dFUW53dTNDRlFuNUNTNVYrUTF2TmhST0tiQkFjUXdLOGRvRlgyYzc3cm90?=
 =?utf-8?B?NTRVZ2tFdnJuQXRMMEFOODdhYXVVRjVkbldzRE1Cb2tmalhZQnUreXBIQ1Rz?=
 =?utf-8?B?ajhkTGdHUXdUd3dxRnNlV1hmempiNWc2YWZ5SUJ3NWFJM2RXRmZ5ZGdKSGMv?=
 =?utf-8?B?T2JkcThuTGpiaWdDMGw5elR1d1RYU3NzS1ZRQkRRM25PblJUQzBLSkZGRXBC?=
 =?utf-8?B?bzAvMll6M2JrSU82Z29HZVZwK3pWUWQybTlwN0MzdlBGYU5wMExsSDRPbjFW?=
 =?utf-8?B?dTNGUXEzRXdUUmp4bkdvaHp0bk0wb1hZcVN6RnZna2dQeDdwclcvNTdaSWJB?=
 =?utf-8?B?cUxyeDBqZi9hZGEvUFF5WG4ydkZyNUF5TzJmd3Y4NGFTZHpwelg5YlAvZmk4?=
 =?utf-8?B?bFU3TkU5NnduVWhsSUY1b2Q5a0dNei81cjBKcWpOeWIxOVowN1FzcHgwQ1c4?=
 =?utf-8?B?RGlxZTZHcllJNzFkNXZqamNQeWJVQ0pVNVZseUpheDROdHQ3SDlEWDBKZTho?=
 =?utf-8?B?c1huYkI5V25uZVVweHNVcktrVG1pY0ltaXJhUDVldWo5Vm43SjA5dEJ5TUdW?=
 =?utf-8?B?OUxVdjJYMUxySzNLUjhyV21yTjNBZzFFN3pwZmM1aHJvdjI3N1h5K3FSa1VX?=
 =?utf-8?B?Lys5dUpmZk1EUStyQVFzbFBaZ0hSd0U0R2xBTVF1YmQvc1p6SHJSdWFCdHh5?=
 =?utf-8?B?dGRQdzdGLzlCUytOcDdvV3VveTc3MWJwTXJ0cWFaUVluaXVqOEtCVUhSeUJK?=
 =?utf-8?B?THkwOTk3VXdkYzM2MXAwV3FOemFORThuemhvaHRGTnNZa1lnVUpSRHNhMWVz?=
 =?utf-8?B?RlNLbmFuNE5mUlhBVFd0L3doeG9vLzRaemY2TDNWQlJuck4wNGFybkVFU0sw?=
 =?utf-8?B?Z0FERVRFNE13WTZNaVUyNmEwUVRNWk9xMG9zN0orMDQvWUwxTUpPc2NPbnEy?=
 =?utf-8?B?dFJ1WTFxeFROTlpydk03ZElCTmpFVWlVblVEYWxQU3NFS1AxM2lNY3FhWVQz?=
 =?utf-8?B?MW1IL2xsRUIyUGFiTndWbS9hRmJMejdhVFN1b1BkOXU1MitpSUZ1Yk1keHB1?=
 =?utf-8?B?TzlheWNYYUEzaUhscGpPNUoyVDFyT20yQUdmQWttSVY0eW92SGJsVmUwc0VJ?=
 =?utf-8?B?WWxtZEtMcE5oWmhzRjZZY0IwWHJGeDV2RVptQ214aE5sZHNwbDRzMnhhRTZF?=
 =?utf-8?B?UWhVN1A2NWRsQ1Y4L2N0VEdGMm1WZ1RnSmwvRmpjMVdEM1Z2dDFxWUVPR2ww?=
 =?utf-8?B?WHBhcWFpSzhBMTlrRUxoQm80ZnI5MG9JTThZS2Z2ZEY4di96STZhV016eDJF?=
 =?utf-8?Q?EWJozqRtCUywC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkExU3dnbWRRWm4wRllqSTg3eC9taFJ2VG1ZRUJ2WEFSRnVTQ3hJLyt1WXdl?=
 =?utf-8?B?UFA1TFR5eWM2S2dMdUI5MUZPK1ROMFlMYTF0L2VNZzdVWG9salQwN2JzTXgw?=
 =?utf-8?B?OEIzbXVHTDdDY1lzRS96L2ZHTUtUK1VNR2p3WDRycjlOKzU5NERPZlNPYmw5?=
 =?utf-8?B?Vm5XT2p4NVd1YUZLU1EzVGZIY1o1eEp5Sm5mV1FtNWtOeVFZWlhjUjRsdnpY?=
 =?utf-8?B?WXVFcEZTT2F3MFlML3plK0FaRGZZOTkxdTI5Zi9LbjhuQXhXRm1kajI2RE1R?=
 =?utf-8?B?K2VWRUZkOFVOcmJUcy9HajcyUkxBb2liY2ltNm5DUWIrRkN6eXNBVTFlekpz?=
 =?utf-8?B?d1d6WGQ2cGtwVTlKWVlLR0FZRlVIaXpQdEh5bWNHMHBraTRVNkdLemh6Tkd5?=
 =?utf-8?B?WmVHOU1sMUtvOEJtaE5vbmh4Mk1TSzN5ZGJ0QmRJSGNncUduQktuTnVSZkF0?=
 =?utf-8?B?dzV3dlpZYXJEMDMxY1JmN25IYmhjY0hXKzV0Mm5OU1RQS3RSblpaNmpVTllM?=
 =?utf-8?B?WGs2bDdWYUZIbDB1YWlZVDUxL09RNitIUlhKeEpJRHJCdXUrZ3FTRVIzTlRz?=
 =?utf-8?B?L0YwZ1BWUUUrNHQwQS9td2FkOFRoRmU4ZlN6RlRhTWxzSThURUZNbU80WmlZ?=
 =?utf-8?B?RmRmWWU2VVA3RndTSXV1N3FHMEMxR3p5OS9mVjI4NHQ4dnVSWXNET1FDclNQ?=
 =?utf-8?B?cHNyKzJCaHNKR2tWdWlIa3hHejk2NUJSakxFTm1qZ2NSZzhrbVlFVnU0MTcy?=
 =?utf-8?B?Zk9KUU50b1dZWkZzVFJ1WGRUOTg4NWE3amdsTmhja0dRRzAwUzJqOW5oWkNU?=
 =?utf-8?B?cEVabnFBd0tJL1ZyZXBsUnZPM01RWng4NlNSUUFGZUdrM3FabUYwekZjL1JN?=
 =?utf-8?B?VlV6cks0bDIzbmMzNTYrcDBSYklZbWxpUjJDcFJkaEg0OWJIM0hjQ2REZkg3?=
 =?utf-8?B?eUZvTDIzY0JZNWF3V1V0d212Ykg3RXlEMUNKbjZJNGNLeEcybkJmY2FiWFJG?=
 =?utf-8?B?YWpQRE1ZUFFvVUs2TTgrVzVJWVRyR3EwOHhlek80L0J4Z3hBMktPTmZkT3RM?=
 =?utf-8?B?ZUlhTUtSejZicHNqMHF2cWRmcG1IM1ZsQjJhNitzQlRJYWRpQ2hlVjZkcHQ3?=
 =?utf-8?B?dmtzMllEZ2JxTFhhb0dnaVM1ZGZBTEJ6cDNQN20wT3dPc3daTWFMbEwrcDRO?=
 =?utf-8?B?bWxTUXU0TEZPZlJ4bnFMZExxQklpZmdQT3VlOVYxckFSaEh3YkJjT2F5bjU2?=
 =?utf-8?B?UlB3NGsxRmdEMjhrKzdsb3VXRnZuVWtvZjRsZ1d5Unp3TFgxNVNpeVlLQmR2?=
 =?utf-8?B?a3MrRy9aWi9TR1NqVmY3Rk1nVitranVQTDJIenVwblBrUnYvNkxtRFk4UEhZ?=
 =?utf-8?B?bWJBRWUwUk1GeEZ0WndVRVZXS0VPcVJXN0d2bWExS3YrdFFWcUxZV011dHFp?=
 =?utf-8?B?dXRJdmd2a0FUZmRRQ3dZMEI2MWFlUk9Ha0FQcWxmQnRvVXlMYWc5ay9pUkxO?=
 =?utf-8?B?ejZCWk1YdEYrU0FvdWQ0YjlWTUR2SlQ4S3UwMkNmZ0VCTXRncW5jNnlFc0d3?=
 =?utf-8?B?clh3OHVyOWtNZlgzY2FEbTA3aE80K2RrUnd3MDVPS1N5R29ycmhoUGtRL1VK?=
 =?utf-8?B?ZDdKcFdDdGQ2UVNOd0JZR1lZb2V4Ym9qaDRyQXY2bXVmWDNvamlqWGlDYzZr?=
 =?utf-8?B?aDZvVER3ZVBKTmwzc05GUU1QTXc4eUhRTlZIcm1iVytMWlN0UUg0QUVOcmxH?=
 =?utf-8?B?ZHdVS20vaVQ1S0Rna1Vwc2R0RUlLekxpNTcwc3hKdWJGTWFGdUttSGl2QkVk?=
 =?utf-8?B?YXY1ZmVNTUtScXpkZUdjRHc2dTA1NVB4MFRvVFRLOUVkYlYzMSsrNU5QTDVV?=
 =?utf-8?B?RUIrUnExQy94ZmtZUHg4VjUybXZoZGo3LzVSMW5idmxNWTMvOHhTUS9tNzRO?=
 =?utf-8?B?R200N1Era2dsUmtsMFV3aXBGZys3SzQyVkErQXFldDFHckhFTEcyNGJBT3hr?=
 =?utf-8?B?TE5NaXBZa3cxQWhZSkRBQ3pIMStWR0QrT05IcHRSdFJBOUVCNkJrcS9BTEFW?=
 =?utf-8?B?VnBrZVJXQk5HbURrQmx3UGsyWmVtZmIzVThEYXJISnlXeUlqMmFFeGtOZU81?=
 =?utf-8?Q?UBBj3cmky6tE8LhnoPp6uctxF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350507ea-c07f-4250-295f-08dd5c69730b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:43:33.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOfSvAdR96V8IjKzYbMA5Hc2f3ZRcqO4qQb1JuyfkJWF/aqi1wKM9RKNdtNHNPtHz/BP+mRkL3TikYU0HiPTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
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

This patch series adds support for THP migration of zone device pages.
To do so, the patches implement support for folio zone device pages
by adding support for setting up larger order pages.

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
cases for huge page migration and to test the folio split path.

The nouveau dmem code has been enhanced to use the new THP migration
capability.

mTHP support:

The patches hard code, HPAGE_PMD_NR in a few places, but the code has
been kept generic to support various order sizes. With additional
refactoring of the code support of different order sizes should be
possible.

References:
[1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/

These patches are built on top of mm-everything-2025-03-04-05-51

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Balbir Singh (11):
  mm/zone_device: support large zone device private folios
  mm/migrate_device: flags for selecting device private THP pages
  mm/thp: zone_device awareness in THP handling code
  mm/migrate_device: THP migration of zone device pages
  mm/memory/fault: Add support for zone device THP fault handling
  lib/test_hmm: test cases and support for zone device private THP
  mm/memremap: Add folio_split support
  mm/thp: add split during migration support
  lib/test_hmm: add test case for split pages
  selftests/mm/hmm-tests: new tests for zone device THP migration
  gpu/drm/nouveau: Add THP migration support

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 244 +++++++++----
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 include/linux/huge_mm.h                |  18 +-
 include/linux/memremap.h               |  29 +-
 include/linux/migrate.h                |   2 +
 include/linux/mm.h                     |   1 +
 lib/test_hmm.c                         | 387 ++++++++++++++++----
 lib/test_hmm_uapi.h                    |   3 +
 mm/huge_memory.c                       | 242 +++++++++---
 mm/memory.c                            |   6 +-
 mm/memremap.c                          |  50 ++-
 mm/migrate.c                           |   2 +
 mm/migrate_device.c                    | 488 +++++++++++++++++++++----
 mm/page_alloc.c                        |   1 +
 mm/page_vma_mapped.c                   |  10 +
 mm/rmap.c                              |  19 +-
 tools/testing/selftests/mm/hmm-tests.c | 407 +++++++++++++++++++++
 18 files changed, 1630 insertions(+), 288 deletions(-)

-- 
2.48.1

