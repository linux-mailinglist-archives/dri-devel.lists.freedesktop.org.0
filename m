Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54912B48174
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9BD10E31A;
	Mon,  8 Sep 2025 00:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="af0nh2Ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C95110E31F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc4xgUndByxyh/evc0tDCuEzztKlwr0GiUE9P6VKXfRzhsoNiZtscCt10xdIXrZ9TF6fDKvt1PjjtFOGVMO/iS5fCjGeWQcI/1Su/k1pPBkF7TntjpF9OUzgrks5EFUMdSUoWEcd6CyVU9CXFL7EkHk7Xz43U0VmxZOCOdWPZtYZ59lQu7wt96+Tmcc6POjfw3oXnbaefy+fu/axtrSCjAG39cHzs8IqrQPsJEze2FYKQYJ+yG7dtqifIul/lH+Ki8AHmrT/HY5qcuMy8aodmoUCZ/o9Ma/pmdlgld2Hxp+XQla/vXm54wrkmAUscW5F/WcFI2ZLVqCezcQH1tHMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlBQM59G9oYoHYxr5J8Taf+UAXbXVHuHsqXFowFa/dQ=;
 b=lCj6dLJcxFR7H2sfEgtiVNKzXwRZ8pv+TB3HvHj795W3iQdfrMFpLZe42pUEdpmdSarVKVC6DZecR3pb0jUVioU0lAxVGTfuP5/j5vftK46JPzLUa/5wfiQ1itLEknjhPzS7ZHfiR6ZTDiWlQn0aRxFBJVYtlSNOADu4ouUbSJ9lVKHDq6ktJ70gRm1lheGsbc/L0cuV74e+jwmzyZU6s/y634WurzdxEJQH9+DcATPUY+9kbE1vaKMRToP1TIlNb0CwTm9rclS8+JDDA70eRPWlZcT5PlrtkFBb7KAaZx3XIExq6rPwPtbocE4NbwZgW8auMhWj1ca5PWYMtT7s2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlBQM59G9oYoHYxr5J8Taf+UAXbXVHuHsqXFowFa/dQ=;
 b=af0nh2Ng3nAlYa9WaQGLf8wOtfXWhzvFZDtHsmlLkBSSwR7P+IF5KtEA2M/gfpJ0VAssPv3arsP4FIicdZwhiJD+xEE/tzHq4WKw1dCpClg28Ad5ueq/QVV8C7h8rvZsFqVOw8AebHOENgMQqvjqY6VrEy4a60fAA6P7/5uFFVuTFWYpcZiD4Oqk7MkTf1MjkPEaA/B8oiaKeBg9NkPKDLKg70PnUmU2NDgf4W0s0KhJW954e/E+XyfahI8vm1LnhcvsRHBBQ/wjU4HtT4lhm5SxUiLoRDP0IAi6VtxbZLqZpWylZZp1TnqC/jowWhpczOGjrnh8Ejaej9Q+Ag20yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:20 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:20 +0000
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
Subject: [v5 06/15] mm/migrate_device: implement THP migration of zone device
 pages
Date: Mon,  8 Sep 2025 10:04:39 +1000
Message-ID: <20250908000448.180088-7-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0198.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 6761762d-15e0-46ca-2152-08ddee6b6630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGtnZlNKS2VkbUVJMlJVVTlJWUdobXVNZUFUYnNha3RqcFo4MkRmb1dneC9s?=
 =?utf-8?B?a1hSNjBCbVI4dUVQN2pWYVNEU1VvYXBzU1pwY2JNS2xyaTJ1aTU4aTdrdDhH?=
 =?utf-8?B?TmcxVGRsVGdBV0RvUFFUS3VvbUtsTFJHN1RkTUVmYjR6Y09VdE5Ea0tyODNO?=
 =?utf-8?B?ZEEzSWh0d1MyaHRHMjh1b2IxV0lIck9sN2hsM09tOXo2ejdCRlBiZE1yT1A0?=
 =?utf-8?B?S0t5MmJiQTNzK1B1OFhBQWkyZHEreVJYQjNOSGlFdFg2ckxZTy9MRUZPSWps?=
 =?utf-8?B?cHJPZWpTZG0rcThLRlE4ZFExZWdrMCtIZWlMNVpKMW9KRmwwRnMzM1c3RVh1?=
 =?utf-8?B?cks4RGhINkZ2WWpCVy9DajdNR2h0WGI3MzFEZkRHOW1iMVpLZzExN3oxUm5w?=
 =?utf-8?B?MTRjVFJEOHdueFRlWU9DVDlOa1RiMno1emZpVXZXQ25COEw1ZUdnQnhmaGlB?=
 =?utf-8?B?TFJDdW1jbVFxN2NsSTNBN0ltRytOakxhYmQ3S3JVRDYzSm12NzJGRGV6a0RY?=
 =?utf-8?B?eld6R0RZMzVsWXZOVFlXVHFhS01RRkErRzNxUm11WUs4dHlVUlgzb3UvK1dB?=
 =?utf-8?B?WmRzNzdTa0R5bzRJTG5NUmZhSStrZDh1bktxUk45L2ZwNHBZbWxXZ1pjdm00?=
 =?utf-8?B?U2szRndHaFNpMHhSbkN1aUxuckFTVkIxRGhYK1o4R09JMFBlR0JXWk9QYXJ3?=
 =?utf-8?B?MTlqNm1oOEJnN3MrTGUvRzllZWJFVWNrOWZuWlVwOXlyRDBmMGljcEdpN2tR?=
 =?utf-8?B?WGlSWkxnTmtibHFOWll5anBBZkFxOExqVGVuUDd3Y3JaazN1WkpNUkJPZ0d4?=
 =?utf-8?B?SDhXdVo5S3cwOUJiTVFzTkpGYUo2bnJrMVRDcmxuRGoxZjFQS1dZN2xvcGVq?=
 =?utf-8?B?UG9adU1Cc2lBNzBMTk9qSzFiL0JYNWMzNEgvMUtlRzhZbHkxbWx1RUN4NTJR?=
 =?utf-8?B?TE5FV280ampKMDJEWGNESlR4ZTNJMEhjaWZZbzdNMzg3VjFRb3VXOUllY2Nn?=
 =?utf-8?B?bm9PZlZ2bStYZXREcXVPMDdJOWc3d0FYMjY3NWwrZTVXWDNGZUcxYm5XYXJ6?=
 =?utf-8?B?eWlCRU9OUjZjQkJpNE1aY2R4Sm9vWDRTclFxTzVIQi9NNlgvTjE4N1NtczRB?=
 =?utf-8?B?K0tnZkxBcm9EVk81VmJ6VnEzSTlYZTVjTVVqUHRSZWF4a0ZESThyZmVNbUE3?=
 =?utf-8?B?MG5pOElaTThxenV1WEdxY1dKQnVIWVdqQmdxdmF0N2Y0ckFNYXNvd1htdGd0?=
 =?utf-8?B?a3pXUEJIMFFJTzdKVDNFa1gvUGVHU284a3FsYzFxNTBQZW1RdzE5dndQWjBj?=
 =?utf-8?B?aFpFVXNqQjA5WFgxNU1DcVRmQkZWM25QTVE0cWV1d3NXQ1Rwdk9za2hDRnVM?=
 =?utf-8?B?V1ZlaFZFYk9yVkp5TElPVERYTHJvbEVkTTkwV1N1M2VhMW1NY1lEQmdxSWll?=
 =?utf-8?B?YnRhajV3YndtWXpsVUlyeWs1Z2NYUGxrdzJURFZBTkd1TkpEN1NHMFhEZ091?=
 =?utf-8?B?aWRCejhrc0dNZm85UGhLK1FDdGI3OWN2dU9MS294MHhLTHhMWTQyQ3NkVHBR?=
 =?utf-8?B?TW1RT3EvZDZGOEtjWlU1M2V3dXJ4QTBKVzNHYmRwckVGczlQL2JPWGt4cXJ5?=
 =?utf-8?B?SVgxNjY1Y3phZ09renp4c0NHSUlLdDRQOFlRQ2hWbUJKa28vZGJLTU1LNHI3?=
 =?utf-8?B?N0pIVGZwU0pHUHZVZ1VXMVJmelBFUGx0cmRqWER2SEhuNWt3ZU9UYnlXNFpP?=
 =?utf-8?B?MzVSblBkQ1dTZDJib1VrSTgxN3YzeDBrR1paWnVORWdiQUx5VzZiVyt5VGxK?=
 =?utf-8?B?ZllDLy9Oc3hSbzFucnRidFJUTGlWS1ZHQnJnU0RPVlBJRHlQaHRXRnZLdWs0?=
 =?utf-8?B?N1o5TFFScSt1NitVUkxqb0M4a1MwUWFIendTZHU1WWhHNmRSSXlkZWkvMWpn?=
 =?utf-8?Q?65ZvNb0v4K4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0F5Q3cwd0xST1RqbzZlWVJnTUYvMVg5TEs5NVdpOTFETW5QMzZvMVA4Y2lM?=
 =?utf-8?B?QTVGTDBRRHB0QVZ2dTJMRnlYZjdxM0h4d2VPQ1RwbDg3dVREWWdaZ1pXZCth?=
 =?utf-8?B?Vkw5QVFaZTFaMnZ0WGUzRjNVZFB3QzZDSXA0RFZsZG5mV1lqaDE0RWFjRjAr?=
 =?utf-8?B?QlFvRGp1RkZHa3M4cTRFTnFEeDl6bGdjZTNjRVBxMU0rcUsyM0xrc2lmdHhu?=
 =?utf-8?B?azZQN3lvS0gvQnFZaHgzbVVCT2xUbTU0MWF4YmtVVVJXazJyRjdYenM4NkNu?=
 =?utf-8?B?MVQyRE9yS2hSTnVZeU9EZkJlRXZtYTEyUERZKzNSTlFkSlBRZ1kwVUovZ2p6?=
 =?utf-8?B?R1JOcUw3Y0hRZU8zUFpTOWJUaFd0Vm95alRmS043c05aR2pPQkhzZjZtLzh6?=
 =?utf-8?B?eXNKYjlXNjhNUHlVcXpGQnJ1dkZxSGRSVUJXRHlUa2ZHUkUzTDNjMmlwKzJy?=
 =?utf-8?B?RGR5VWtaMjB4dmdYTG4zeTVpT2NhSHlWZENFRFlMKzhFVDBuQkx3UFNTbmtV?=
 =?utf-8?B?WTFFckRrOVp1RTBMM0U5cUFlMjNwZEFiZ0ZWZFVQY01LUjQ4YmFNeVhxQ0ZP?=
 =?utf-8?B?blEyNnRFNmk4MW5WSnlHd0hBZVZ6TzdObVpjZUJVM0dZVHRZbXFKK2ZkbWc1?=
 =?utf-8?B?aHNjYThPRkJ5WkhvUGZrMGpPRmJmbndDaW5GQzZhazA1Nkg1QmEzOVdmdkt1?=
 =?utf-8?B?Q3BZV05naSt2b253bTE5Ny9BQzU1YytDOC9kelhLb001TW4ydGRsR1R5Z2ZH?=
 =?utf-8?B?Y2pTZWF2bk9LcjF3UHhwNXRQWUgvenVJQ0JDbnlXOFk2WHlZdHBVd2swaFRN?=
 =?utf-8?B?Zm04NXdZWnBuWFd4OElXeWlROFhNNjdYanowL3BHeUM4OTAvU28zQWpXQWQv?=
 =?utf-8?B?VzRxODNKbm95Z1d1T29qOUhIMEVCY3doS1d0VkhZeTVxVEhmY1puQUhCOWFC?=
 =?utf-8?B?Q0NTRnVVbzdramt5L0tkbzNvR051bDZORXV5QTJ6Qm44blRWZVozZHNQeEt2?=
 =?utf-8?B?bHZhVC80YVJZeGRVZGY3eEtxSzUzbWFOZ0h6UU1Fc21iSDZXNEpBRjhaWFVz?=
 =?utf-8?B?RTcvbFB6dUc2WXZ4T21ROFlrUWpVSVoyOVRCVnhYYWxLUzBWRU5pcWFQTWxB?=
 =?utf-8?B?VFd0VGtyazBqRUdVRTh3dmVpbGNwd1Y0ZnluamxWYS92enRVcENwaE5HcDVz?=
 =?utf-8?B?VENqek9YODZXU2lKdE1zdFEvK3FVeFpXcDVNOUZjS0FYL0ZMYnl1TnNmeXBy?=
 =?utf-8?B?WXg4WTlSK1BDZ3RqZ1pEZXRCUTJoQllnVy9lZ3djN3h0Y0lOV1Aybk92aGZC?=
 =?utf-8?B?K3ozVVI3OFNxQ3ZXYmJOeGUrdE1pMDZRMW55N1FzSlhseVByRndsaGtyR0JB?=
 =?utf-8?B?clFnRTB2TUJDUGR4NFFRT2JsTlFISlBpbENqUWNVeGcxUFRaeDB1SzhmaWNP?=
 =?utf-8?B?bTI1d2d3T045L01Wd3BmdmZsSUQza1BVYkdrYjdFTDk1dVFGZnkvKy8xL2JM?=
 =?utf-8?B?ZVFFVWQvTm9FanhYUWNldXQrVVNUZ0VPdjZPT2RVSXZDbE5zVUtlY1o4UVE2?=
 =?utf-8?B?Mi8rZ0h0NkhIYi9LcUV3U3V1aUNKUTVLcEM4MkVUUlJxSzNVbXg0cnlyenNM?=
 =?utf-8?B?NlRUcVdPcUJGNkVyYzZyOHZCVElSSXdOWVlvOWdRMzIvdmFTQit2Nkg2aUpo?=
 =?utf-8?B?VFBZRUZ5Q0hQS3dEUFN3VW9IaWRpdmFtSExLK1kwZFY0Z2hJclNxaFdMczc2?=
 =?utf-8?B?aE15VTZCOFBhMDlET2lET0ZaRFNaNUtoU3NsYlJlRjVyNVQ3UUErZ0hqZ0Fk?=
 =?utf-8?B?SFZFcDNvZGZUZWtsTmZEdElVY2F3MWZMcmVjS3V2THBUWDBHaC9NOCtERGZo?=
 =?utf-8?B?MTBHbTBRYXVXZSszeDhqNDdURkJWM1B4b0J0d0RST0ZMaWI0dzhXZEx1UUNS?=
 =?utf-8?B?RUNVa0V0eVhVMWU4ZTZMZ0JnRFNCakpvL1MyTnM0M1Q1b2hWbk44ZXMvUnM3?=
 =?utf-8?B?Y2QwcTdSWWxkL0lHdkJ3TkZSQklCSUl3Q010TWs3Wm9MaFpubW5mN0hjdHNI?=
 =?utf-8?B?VWZjY0ZpUXNKR01ZZTJocFh5UGN2cjlZSU9BUDJ5TjRjOFp0SnZqUTRtNnQ4?=
 =?utf-8?Q?vjXlhsYRVQzA0MDOhA9Fp1HvT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6761762d-15e0-46ca-2152-08ddee6b6630
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:20.2595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nn+/OyqGtGrm0YlMrLj3cvhyJhP7AIgqyMEv6AVmwbcjljX+mw4FvKxcRtg4XJ5nhcEiQQZX+Q3/HmXXf8uVhQ==
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

MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
device pages as compound pages during device pfn migration.

migrate_device code paths go through the collect, setup
and finalize phases of migration.

The entries in src and dst arrays passed to these functions still
remain at a PAGE_SIZE granularity. When a compound page is passed,
the first entry has the PFN along with MIGRATE_PFN_COMPOUND
and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
representation allows for the compound page to be split into smaller
page sizes.

migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
page aware. Two new helper functions migrate_vma_collect_huge_pmd()
and migrate_vma_insert_huge_pmd_page() have been added.

migrate_vma_collect_huge_pmd() can collect THP pages, but if for
some reason this fails, there is fallback support to split the folio
and migrate it.

migrate_vma_insert_huge_pmd_page() closely follows the logic of
migrate_vma_insert_page()

Support for splitting pages as needed for migration will follow in
later patches in this series.

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
 mm/migrate_device.c     | 456 ++++++++++++++++++++++++++++++++++------
 2 files changed, 395 insertions(+), 63 deletions(-)

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
index f45ef182287d..1dfcf4799ea5 100644
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
@@ -101,57 +119,150 @@ static int migrate_vma_split_folio(struct folio *folio,
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
@@ -269,8 +380,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
 
-		/* FIXME support THP */
-		if (!page || !page->mapping || PageTransCompound(page)) {
+		if (!page || !page->mapping) {
 			mpfn = 0;
 			goto next;
 		}
@@ -441,14 +551,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
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
@@ -479,17 +581,24 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
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
@@ -501,7 +610,7 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 			if (!folio_isolate_lru(folio)) {
 				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
-				continue;
+				goto next;
 			}
 
 			/* Drop the reference we took in collect */
@@ -520,10 +629,12 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
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
@@ -669,6 +780,147 @@ int migrate_vma_setup(struct migrate_vma *args)
 }
 EXPORT_SYMBOL(migrate_vma_setup);
 
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+/**
+ * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
+ * at @addr. folio is already allocated as a part of the migration process with
+ * large page.
+ *
+ * @folio needs to be initialized and setup after it's allocated. The code bits
+ * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
+ * not support THP zero pages.
+ *
+ * @migrate: migrate_vma arguments
+ * @addr: address where the folio will be inserted
+ * @folio: folio to be inserted at @addr
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
 /*
  * This code closely matches the code in:
  *   __handle_mm_fault()
@@ -679,9 +931,10 @@ EXPORT_SYMBOL(migrate_vma_setup);
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
@@ -709,8 +962,25 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
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
+			folio_get(pmd_folio(*pmdp));
+			split_huge_pmd(vma, pmdp, addr);
+		} else if (pmd_leaf(*pmdp))
+			goto abort;
+	}
+
 	if (pte_alloc(mm, pmdp))
 		goto abort;
 	if (unlikely(anon_vma_prepare(vma)))
@@ -801,23 +1071,24 @@ static void __migrate_device_pages(unsigned long *src_pfns,
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
@@ -835,15 +1106,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-			migrate_vma_insert_page(migrate, addr, newpage,
+
+			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
+				nr = HPAGE_PMD_NR;
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
@@ -856,7 +1159,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				if (!folio_test_anon(folio) ||
 				    !folio_free_swap(folio)) {
 					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-					continue;
+					goto next;
 				}
 			}
 		} else if (folio_is_zone_device(newfolio)) {
@@ -864,7 +1167,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		BUG_ON(folio_test_writeback(folio));
@@ -876,6 +1179,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 		else
 			folio_migrate_flags(newfolio, folio);
+next:
+		i += nr;
 	}
 
 	if (notified)
@@ -1037,10 +1342,23 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
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
 
@@ -1058,10 +1376,22 @@ EXPORT_SYMBOL(migrate_device_range);
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
2.50.1

