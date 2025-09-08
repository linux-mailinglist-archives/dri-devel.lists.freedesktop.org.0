Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D943B481A4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C2410E32A;
	Mon,  8 Sep 2025 00:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lJ2Qgl97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E14C10E32A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyzfUf7C3Rh2PBldHecatS9pz9UVrUjRMbEHmiY9in4d1Pdh5oPPvRYX4eVJUuV9lPgak/qMvJBfc2BFuKpM3ELpFvzcUUD9iTa34/6nV9r2T7GqEcj8ngbEfIhb3ILIqz+p8pXxwF/CGUWuAeXX+NVYpImzEUabHAjVGRSCNZKlr01Jpyed754sjAccKsmepOAcAZ1t0Mgmw6HUxK87R8mBC9+SXJg03BF+q9+lAzSj/VVnRB+x4ezNvU8AccsC4S8oOq3NBv9vIxpa/7qT8vTXnYpbpr+D5v8acrgoUUFss4Cn4spVv3rjqCnekeBVWc9yNaa14wqQf41kC0rENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEZmhU0SlWgbgYTBsn07OMlSZ9+t7ABoGqAAHM6Pgz0=;
 b=RmTc3r6xSsW8rK3o2v9ecbYoOdbbIAkRYcp+wYObP8myluKzm7Pqqu1akQOedsBHQQK/sf+DaPheLpyBIkc/HVWZyVMPr/ofAAx4HZqgctu1JXxf/Kmvb7k1Kq6HBZtoEhJs5r2OIScPF7vUPPGLEhHpWFNHX90HdvazxFDnS4i9nRaxibjm12FJZNQkavMTa0eQbFAJOjN7X9WJorN1HkQjC8bhbQUd5XbNjPSPYGUztQL7YnaSyIO5LG8qeXAbjSSenL32ScFdoCkD9fMjPCHULg2qn6mRNIcJ/yVKjBVn435yHUGjHZidear7llzHzOfoe5b+LN1+qysRslvmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEZmhU0SlWgbgYTBsn07OMlSZ9+t7ABoGqAAHM6Pgz0=;
 b=lJ2Qgl97JYPQiEkwMI+SqPkzlZXNg8LRuWQ5T4htxKv+3987zaUXs7lK6Fb8YpNa4G82SmBjWVRAkhVxv5n1lh/yZjn2VbRTrQn3KEh2ggnfKalH9uQjZN3bAfgceqtFTreQBRCrKnoepOJ9s6qdZipGTHxumHV4n+sJ2evvtgVPtqLQ7qK/AuC7WGZ3rs6Ssct+9TDLbwYoRwItp+ANAWPRekbapA9A5I32ksBwQ1Ch8qZurtTdIuyxQPpBOQ8WC1WPxxqjYJW3UhHPfsdaaov2PHKCBPOc8/A9gjlkD52Mt/UIvExXEFlkVsRIwqc4t1xrW24ppPrsSAi9N8TsVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:53 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:53 +0000
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
Subject: [v5 15/15] gpu/drm/nouveau: enable THP support for GPU memory
 migration
Date: Mon,  8 Sep 2025 10:04:48 +1000
Message-ID: <20250908000448.180088-16-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::6) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6a4b4a-7282-405c-94a1-08ddee6b79ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzNTTVQ1bEtWNlp1ZEU0MDE4anJ5THp2T093eDQrcnVmVWlyTmZVY1JwTWh5?=
 =?utf-8?B?VU52U0wxWmxtWFYraThPbWFRbld2TisvN2J4TzNvMzhMQlJvTXZFZ3hqb0o0?=
 =?utf-8?B?VHlIYmlNclRwY2U3RlN2WGhIMGJoWUc1YWV2N3VBZkRVRkU5SFZZM0VPS3U2?=
 =?utf-8?B?MHEzb3QyaGhCa3ROODJUMXBLNGpwT2kvUGhSM24yWStheXhUUlQzUlpxelRC?=
 =?utf-8?B?VHlGS3ROd1VDQjlrTnNxVVlWbHlmOFVETXY2TWFrMzM1WitSVTRIbUpzTjV2?=
 =?utf-8?B?YnNsZXQzYTFxMnZVS0tBdlFDRzQ4Zy90UW5qand0dm9uQUlnay9zTHBEekt5?=
 =?utf-8?B?andyWXkyT2xjcWJPRFgwbjdEd2N6WHA4OENMUnJWRDVHVnlsYWVGRmhwVmlv?=
 =?utf-8?B?TTBveWcrVHhRRVVsQWY4MkFCdWIyUG5RMTdPVXlRcDcyeHpJckJSdXBseEdL?=
 =?utf-8?B?cEthOWc0Q3J1dDV6dmt3dlV2dXk1YVpRQ0ROVXhtOGlrRkw1WVlya204QXFV?=
 =?utf-8?B?Y2FJUzVUenFtRWZDbHoyLzFURnc2MGUxYVlhaDZHRGZFNW1VMjMrdkE0M2dB?=
 =?utf-8?B?dmdVRFUvMzFLbnVYdEwxWld5MWl3Y0h2R2ltdWZRUUxiUmFoaEtiL1hoWnVN?=
 =?utf-8?B?WmltblBhOFhuMklGV0Jla0tab1E1b1ZZc21kdlIrWFRVSjBrWExOSEZiVWZS?=
 =?utf-8?B?Y0RyVjYyY0JhbVZZampwbnN5UVVRVDFoM1p3U2Z3ckJCRnVyVXNGeitZOXZp?=
 =?utf-8?B?ejhzcWdrT1NLMDVnTFRMeWFrVTFFTE96d3MzNktLUmRNV1AzUzVidjRPLzJq?=
 =?utf-8?B?MU9KZlhhbG5qSSs1K2F3Y0dTdGlOdDR6VVgwVHZKSkttZjk1UVhsdGdMMzUv?=
 =?utf-8?B?dVV3SnFMVXZKQ0NYYUMvcGdzOWloL0cxT0ZzUzh2NFlPTlZlY04vZjJlY3lP?=
 =?utf-8?B?cU9CeWpxenAvemttcFJkeU1RTm1qaFRhSlNoZmVWeW94dlBJR0hjakViRUpY?=
 =?utf-8?B?S1pjTlQ4dzY4eENyL2NndktQdGw2dncxTi8vOG4vN1hVVllHMDdqcEVBcmlQ?=
 =?utf-8?B?MGJsWHdnMVliNDJpMjlUWEJyaDNObStSa0hWR2kzRXJxaFc5MUVhMmpUUi9N?=
 =?utf-8?B?YWZpWnJWZm8zSm85Rm1EcEhmemsycE1BWEhqOFkwMDNIcURpeDVJUnA2RjUr?=
 =?utf-8?B?bEFhUENIWC80ZVQyWE5iK3RrZlJIS3J3NlBKOGVXRjJ6UCt2eEJzK0Q4TWd4?=
 =?utf-8?B?N2lqVkhvTWt6U2taZnBnZ2hiUlB3bTdway9ZNmZPVDlXWEduKzhwWFgzWVVN?=
 =?utf-8?B?VEthaEdKdllCdlhrTWlDcWI3anQ5Q2FRZlJwN2lwZTZaYTVLU2ZyMlVNT3Y1?=
 =?utf-8?B?Q1p1cHgzQm9iTndEcHlSeCs1bDVEbEVKM3FMcmdyT0U0Nis5bVp0QWZlTU1T?=
 =?utf-8?B?b0FsN0tpY0YwV2FWYWx1RmRkUWpSY0lVT1E5bUt5YnFwRGdXQUc4M1d4NU5T?=
 =?utf-8?B?K0tyWllGdmhYTVZtczJPdS82d3Z4RGRDMXczWTBLamdPVFhULzVsOFp5bGho?=
 =?utf-8?B?RXhmLzVTVDhXTmMxWWxTU2JQS25ORHplcFNMWG9jNVFLR2lTQ0xrWkNlUEFR?=
 =?utf-8?B?NENQcUczeXdNL2ppZjNIMDFHNTJEUVJxS3o0NFdaNThuNlAreStRQU9sUmJV?=
 =?utf-8?B?QTJWYVU5bllRbVVWcUEyaUMrelZYMjNRdlE5NkxXNXhsS1YrTEg4eXNvRWlG?=
 =?utf-8?B?d1hlZHJoQnBzWmZ5TnhLOUFMNndNdkpGSFIwcUIvVlVtK3BOdjRjOFl5SGxi?=
 =?utf-8?B?LzZsMkxZNmJzTzJXY0ZQRHlUYU5ncW5mVEtZY2orS0RnNmRTWjhaWHI1SEor?=
 =?utf-8?B?bUhwZ3dBSFRkRWpKYnRzTmg5Z2VONDNLa2huaTBENDFBeHAvREh2RE0zcENa?=
 =?utf-8?Q?97TxWwtmFcI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0NFY0l5eXRyS3cxZ0p0eUtVZ200dkUyakFVV1BYRjY5MGVDNzZxT0E2eVlz?=
 =?utf-8?B?QW4wRll6WlRhVlVKUUVvbHRUWEZTUFdtS2NqUXV0NXFhUW5RamZreTlQUTdJ?=
 =?utf-8?B?VUtZS2ZLRTIvdGluVFpmWCt3YUVQTTl5bmZuRUErQmoxLzlyejBxZjNXVmNx?=
 =?utf-8?B?UmxxeHF6eU9OM01pNllmaGR3WjJUb1F2OTlzWGJCeEJYUVZIM25jTHJnQ2ww?=
 =?utf-8?B?Wndld3liWFJGd3JHZEVhanJoMVowU0ozSjRuckhhUG1CbE5wK29yVHh2dnhG?=
 =?utf-8?B?cjQwaXNBeTFsTGEvc3NLZnc3VXREc3ZLTURrNXhyWXRqdjFvTzUvdzlTY2Fm?=
 =?utf-8?B?OW0rd0tDMlRwbWp0TzdndGpUQlNLbmY1WHNaWG9WUm5JNGFreWs1dE5EblBx?=
 =?utf-8?B?eWVDbGRlclRCWTR3UGl1UjdnUkNtYmpqaXM3WWY3ckRwNmxJa2FwRUdzS3gr?=
 =?utf-8?B?d1NKQjNscnNTZDZ4djZKTWtRMGFmcG9LeUdyR1QrZXBKYmorNmhuSXFQZ2xF?=
 =?utf-8?B?dG1JVnd5anJGQ3NKTlpkdTZqdVFrVGRWQm9RVkNyakM3OEZPcjdrbmZZanAw?=
 =?utf-8?B?UStaK0lxRm9QT0VGN3JXZ3RCd09nT29rYmtHZVZuQkppSERmcUM4MFY0NmZH?=
 =?utf-8?B?c3ZlT3JhazZlTE1jVithSk04bXlLeFV5NTdCamFGQy9HRm4wQU9NeVNzc3NB?=
 =?utf-8?B?MCtSMEZkUDVOMmdGb3NjT3BMMTIzQ3h6VGh2Ny9CdnNNdVNwYTd5WXZaeld1?=
 =?utf-8?B?Q1NHOW1WdHZrekNxWXpLWEltbHhVTDYrK21zaGdua1FCaENmakhaQXoyK0hZ?=
 =?utf-8?B?MCtxcDJvdENwcDNubHhLRnQxNXk3WHJkcTVsZTduaURCWlFjVVcwcmlpbTZo?=
 =?utf-8?B?RURCZkgwc1ROZ1MwMU9WL1JVeG9EZVRnM3RlYm5iOWdWd0xOMjc2UmJybmhD?=
 =?utf-8?B?RndUV1NkRVduVmRzandzVlEvYXBJR2Q2dWE3SFVNSjluNDlYeHQ0MVlHSFAx?=
 =?utf-8?B?WklyeDVjbzNQL29XZlF4UHBTWkV5WmlDOVdOb1lTdjc1T096aUExeVJ1bTZi?=
 =?utf-8?B?SDFJRFZVdDJnQllXZEEyTXNiZjRDOUU0VXlTVWpGM2J4UFZtRjlwcmFQRjBV?=
 =?utf-8?B?VklpbmUvdCtXaTVVblZ4Zk5ETExwaUxIUTkrTGUxMzZZcTlFTWZQaDdLS0xN?=
 =?utf-8?B?MDQ5NWk5ZE44SDlPYTY2aDZ0VVVJNVR6UnRWY2VuZDRYYmRjeEhVNUx3S05l?=
 =?utf-8?B?Uy90MzlVVC9zY21XRGlnQURid0p1SHdTS0RtYzBNd3dCekdqU3k2VXE5MmNa?=
 =?utf-8?B?Slh5Qm1wZFUyanBCMEVtLzV5WG1OR0lkaUlxd1FuZklEVTF2RGVGbmcrdlYx?=
 =?utf-8?B?VzNORU0xS3p1NDV4Y1VxRFAzbXUxLzViQTlMUndKYkhTSWZVb1MyZ1NVa3pD?=
 =?utf-8?B?ZnJYZC8wVzlYSkFnSzAxTlZKMlM2dHc2UldxSU1HTW9WRno1NER2S3BpVGxh?=
 =?utf-8?B?dTFSSUQvVW44ZUlPRFFqWjRDVG9XdjcwU2hTaVlYaWl5Ymx0V2FPVDJ6aXVk?=
 =?utf-8?B?RGRhNklLS3BZQUgreWZ6bVVMUkpybEZZYU56SGpsdk1EaWpMWFlGWTM1U3Qv?=
 =?utf-8?B?aHE5bHBVUVN2UUh1aWZYZHRKSEtKNENSYUp6MHdnbEYzejMzOFZXelpKckYx?=
 =?utf-8?B?Q0xuTDVPN2NQTjdwOFRUTFlHZE9WenI5ZHhMSEd0V2JWRW1XcGZUOWpIN1R1?=
 =?utf-8?B?eUZSVmdUd1BqVmVYbm5aTmoveFZnNThhWUpYU3dpbDE5aFUrZDZQYXhST2NL?=
 =?utf-8?B?ZTM0QzkyL0JOZ0R0Mk5nWWk5dFNQOWJXL2k3UjNicEtiR1d1eklEWkZlMHNC?=
 =?utf-8?B?SDM5TW50aHYyaTVyczlaYW1RdlJXNndsc013M0o1S2FhUyt4ckhJVFZrZUFm?=
 =?utf-8?B?cnJUeUs0a3l2bDYwd0EzQ3hQbjNLeStkdUdPQVVLUyt3SGRCS2N5NGZrQUI5?=
 =?utf-8?B?YkFxK3ZhVmtsSnVDQlUrUU9KS3dDczBEYWxJdmJyQnc2VVRIT2lrZFcvRmdt?=
 =?utf-8?B?ZDl1d3ZESzFFalhBMkw0WkhsTzhZTlZyaGE2aVRUVGdvWlk3YUVyTXB4ME4v?=
 =?utf-8?Q?sZ3XC+Bob2ACWCiPr6XjQ8TAC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6a4b4a-7282-405c-94a1-08ddee6b79ab
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:52.9844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1pE5PFCLjiayJyqFB62qnN7PH6IFdcNbR3PIapel176TOjFDx7jwa98gwH/NbZGkHWnhci2rZFaqdMoKLnJGw==
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

Enable MIGRATE_VMA_SELECT_COMPOUND support in nouveau driver to take
advantage of THP zone device migration capabilities.

Update migration and eviction code paths to handle compound page
sizes appropriately, improving memory bandwidth utilization and
reducing migration overhead for large GPU memory allocations.

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
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 306 ++++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 231 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index ca4932a150e3..7e130717b7df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -48,8 +48,9 @@
  * bigger page size) at lowest level and have some shim layer on top that would
  * provide the same functionality as TTM.
  */
-#define DMEM_CHUNK_SIZE (2UL << 20)
+#define DMEM_CHUNK_SIZE (HPAGE_PMD_SIZE)
 #define DMEM_CHUNK_NPAGES (DMEM_CHUNK_SIZE >> PAGE_SHIFT)
+#define NR_CHUNKS (128)
 
 enum nouveau_aper {
 	NOUVEAU_APER_VIRT,
@@ -83,9 +84,15 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct folio *free_folios;
 	spinlock_t lock;
 };
 
+struct nouveau_dmem_dma_info {
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
 static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
 {
 	return container_of(page_pgmap(page), struct nouveau_dmem_chunk,
@@ -112,10 +119,16 @@ static void nouveau_dmem_page_free(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
+	struct folio *folio = page_folio(page);
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (folio_order(folio)) {
+		page->zone_device_data = dmem->free_folios;
+		dmem->free_folios = folio;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -139,20 +152,28 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
-				struct page *dpage, dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
+				   struct folio *sfolio, struct folio *dfolio,
+				   struct nouveau_dmem_dma_info *dma_info)
 {
 	struct device *dev = drm->dev->dev;
+	struct page *dpage = folio_page(dfolio, 0);
+	struct page *spage = folio_page(sfolio, 0);
 
-	lock_page(dpage);
+	folio_lock(dfolio);
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, *dma_addr))
+	dma_info->dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
+					DMA_BIDIRECTIONAL);
+	dma_info->size = page_size(dpage);
+	if (dma_mapping_error(dev, dma_info->dma_addr))
 		return -EIO;
 
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-					 NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage))) {
-		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
+					 NOUVEAU_APER_HOST, dma_info->dma_addr,
+					 NOUVEAU_APER_VRAM,
+					 nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
+					DMA_BIDIRECTIONAL);
 		return -EIO;
 	}
 
@@ -165,21 +186,47 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
 	struct nouveau_svmm *svmm;
-	struct page *spage, *dpage;
-	unsigned long src = 0, dst = 0;
-	dma_addr_t dma_addr = 0;
+	struct page *dpage;
 	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
-		.start		= vmf->address,
-		.end		= vmf->address + PAGE_SIZE,
-		.src		= &src,
-		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
 		.fault_page	= vmf->page,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+				  MIGRATE_VMA_SELECT_COMPOUND,
+		.src = NULL,
+		.dst = NULL,
 	};
+	unsigned int order, nr;
+	struct folio *sfolio, *dfolio;
+	struct nouveau_dmem_dma_info dma_info;
+
+	sfolio = page_folio(vmf->page);
+	order = folio_order(sfolio);
+	nr = 1 << order;
+
+	/*
+	 * Handle partial unmap faults, where the folio is large, but
+	 * the pmd is split.
+	 */
+	if (vmf->pte) {
+		order = 0;
+		nr = 1;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
 
+	args.start = ALIGN_DOWN(vmf->address, (PAGE_SIZE << order));
+	args.vma = vmf->vma;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
+
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
 	/*
 	 * FIXME what we really want is to find some heuristic to migrate more
 	 * than just one page on CPU fault. When such fault happens it is very
@@ -190,20 +237,26 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	spage = migrate_pfn_to_page(src);
-	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
-		goto done;
-
-	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
-	if (!dpage)
+	if (order)
+		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
+					order, vmf->vma, vmf->address), 0);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma,
+					vmf->address);
+	if (!dpage) {
+		ret = VM_FAULT_OOM;
 		goto done;
+	}
 
-	dst = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	if (order)
+		args.dst[0] |= MIGRATE_PFN_COMPOUND;
+	dfolio = page_folio(dpage);
 
-	svmm = spage->zone_device_data;
+	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
 	if (ret) {
 		ret = VM_FAULT_SIGBUS;
@@ -213,25 +266,40 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(&fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(drm->dev->dev, dma_info.dma_addr, PAGE_SIZE,
+				DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
+err:
+	kfree(args.src);
+	kfree(args.dst);
 	return ret;
 }
 
+static void nouveau_dmem_folio_split(struct folio *head, struct folio *tail)
+{
+	if (tail == NULL)
+		return;
+	tail->pgmap = head->pgmap;
+	tail->mapping = head->mapping;
+	folio_set_zone_device_data(tail, folio_zone_device_data(head));
+}
+
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.folio_split		= nouveau_dmem_folio_split,
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
+			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
 	struct page *page;
 	void *ptr;
-	unsigned long i, pfn_first;
+	unsigned long i, pfn_first, pfn;
 	int ret;
 
 	chunk = kzalloc(sizeof(*chunk), GFP_KERNEL);
@@ -241,7 +309,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	}
 
 	/* Allocate unused physical address space for device private pages. */
-	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE,
+	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE * NR_CHUNKS,
 				      "nouveau_dmem");
 	if (IS_ERR(res)) {
 		ret = PTR_ERR(res);
@@ -274,16 +342,40 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
+
+	pfn = pfn_first;
+	for (i = 0; i < NR_CHUNKS; i++) {
+		int j;
+
+		if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
+			for (j = 0; j < DMEM_CHUNK_NPAGES - 1; j++, pfn++) {
+				page = pfn_to_page(pfn);
+				page->zone_device_data = drm->dmem->free_pages;
+				drm->dmem->free_pages = page;
+			}
+		} else {
+			page = pfn_to_page(pfn);
+			page->zone_device_data = drm->dmem->free_folios;
+			drm->dmem->free_folios = page_folio(page);
+			pfn += DMEM_CHUNK_NPAGES;
+		}
 	}
-	*ppage = page;
+
+	/* Move to next page */
+	if (is_large) {
+		*ppage = &drm->dmem->free_folios->page;
+		drm->dmem->free_folios = (*ppage)->zone_device_data;
+	} else {
+		*ppage = drm->dmem->free_pages;
+		drm->dmem->free_pages = (*ppage)->zone_device_data;
+	}
+
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of %sdevice memory %lx %lx\n",
+		NR_CHUNKS * DMEM_CHUNK_SIZE >> 20, is_large ? "THP " : "", pfn_first,
+		nouveau_dmem_page_addr(page));
 
 	return 0;
 
@@ -298,27 +390,41 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int ret;
+	unsigned int order = 0;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
+	if (is_large && drm->dmem->free_folios) {
+		folio = drm->dmem->free_folios;
+		page = &folio->page;
+		drm->dmem->free_folios = page->zone_device_data;
+		chunk = nouveau_page_to_chunk(&folio->page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+		order = ilog2(DMEM_CHUNK_NPAGES);
+	} else if (!is_large && drm->dmem->free_pages) {
 		page = drm->dmem->free_pages;
 		drm->dmem->free_pages = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
 		chunk->callocated++;
 		spin_unlock(&drm->dmem->lock);
+		folio = page_folio(page);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, &page, is_large);
 		if (ret)
 			return NULL;
+		folio = page_folio(page);
+		if (is_large)
+			order = ilog2(DMEM_CHUNK_NPAGES);
 	}
 
-	zone_device_page_init(page);
+	zone_device_folio_init(folio, order);
 	return page;
 }
 
@@ -369,12 +475,12 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 {
 	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
 	unsigned long *src_pfns, *dst_pfns;
-	dma_addr_t *dma_addrs;
+	struct nouveau_dmem_dma_info *dma_info;
 	struct nouveau_fence *fence;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
-	dma_addrs = kvcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
+	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
 			npages);
@@ -382,17 +488,28 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
 			struct page *dpage;
+			struct folio *folio = page_folio(
+				migrate_pfn_to_page(src_pfns[i]));
+			unsigned int order = folio_order(folio);
+
+			if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+				dpage = folio_page(
+						folio_alloc(
+						GFP_HIGHUSER_MOVABLE, order), 0);
+			} else {
+				/*
+				 * _GFP_NOFAIL because the GPU is going away and there
+				 * is nothing sensible we can do if we can't copy the
+				 * data back.
+				 */
+				dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			}
 
-			/*
-			 * _GFP_NOFAIL because the GPU is going away and there
-			 * is nothing sensible we can do if we can't copy the
-			 * data back.
-			 */
-			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
 			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
-			nouveau_dmem_copy_one(chunk->drm,
-					migrate_pfn_to_page(src_pfns[i]), dpage,
-					&dma_addrs[i]);
+			nouveau_dmem_copy_folio(chunk->drm,
+				page_folio(migrate_pfn_to_page(src_pfns[i])),
+				page_folio(dpage),
+				&dma_info[i]);
 		}
 	}
 
@@ -403,8 +520,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(src_pfns);
 	kvfree(dst_pfns);
 	for (i = 0; i < npages; i++)
-		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
-	kvfree(dma_addrs);
+		dma_unmap_page(chunk->drm->dev->dev, dma_info[i].dma_addr,
+				dma_info[i].size, DMA_BIDIRECTIONAL);
+	kvfree(dma_info);
 }
 
 void
@@ -607,31 +725,36 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
-		dma_addr_t *dma_addr, u64 *pfn)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfn)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
 	unsigned long paddr;
+	bool is_large = false;
+	unsigned long mpfn;
 
 	spage = migrate_pfn_to_page(src);
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	is_large = src & MIGRATE_PFN_COMPOUND;
+	dpage = nouveau_dmem_page_alloc_locked(drm, is_large);
 	if (!dpage)
 		goto out;
 
 	paddr = nouveau_dmem_page_addr(dpage);
 	if (spage) {
-		*dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
+		dma_info->dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
 					 DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, *dma_addr))
+		dma_info->size = page_size(spage);
+		if (dma_mapping_error(dev, dma_info->dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
-			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
+		if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(page_folio(spage)),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,
+			dma_info->dma_addr))
 			goto out_dma_unmap;
 	} else {
-		*dma_addr = DMA_MAPPING_ERROR;
+		dma_info->dma_addr = DMA_MAPPING_ERROR;
 		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
@@ -642,10 +765,13 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	return migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn(page_to_pfn(dpage));
+	if (folio_order(page_folio(dpage)))
+		mpfn |= MIGRATE_PFN_COMPOUND;
+	return mpfn;
 
 out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, dma_info->dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -655,27 +781,38 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 
 static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
-		dma_addr_t *dma_addrs, u64 *pfns)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
 {
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long order = 0;
+
+	for (i = 0; addr < args->end; ) {
+		struct folio *folio;
 
-	for (i = 0; addr < args->end; i++) {
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
-				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+				args->src[i], dma_info + nr_dma, pfns + i);
+		if (!args->dst[i]) {
+			i++;
+			addr += PAGE_SIZE;
+			continue;
+		}
+		if (!dma_mapping_error(drm->dev->dev, dma_info[nr_dma].dma_addr))
 			nr_dma++;
-		addr += PAGE_SIZE;
+		folio = page_folio(migrate_pfn_to_page(args->dst[i]));
+		order = folio_order(folio);
+		i += 1 << order;
+		addr += (1 << order) * PAGE_SIZE;
 	}
 
 	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i, order);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-				DMA_BIDIRECTIONAL);
+		dma_unmap_page(drm->dev->dev, dma_info[nr_dma].dma_addr,
+				dma_info[nr_dma].size, DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
 }
@@ -688,20 +825,27 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			 unsigned long end)
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
-	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
-	dma_addr_t *dma_addrs;
+	unsigned long max = npages;
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM
+				  | MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i;
 	u64 *pfns;
 	int ret = -ENOMEM;
+	struct nouveau_dmem_dma_info *dma_info;
 
-	if (drm->dmem == NULL)
-		return -ENODEV;
+	if (drm->dmem == NULL) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		if (max > (unsigned long)HPAGE_PMD_NR)
+			max = (unsigned long)HPAGE_PMD_NR;
 
 	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
@@ -710,8 +854,8 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!args.dst)
 		goto out_free_src;
 
-	dma_addrs = kmalloc_array(max, sizeof(*dma_addrs), GFP_KERNEL);
-	if (!dma_addrs)
+	dma_info = kmalloc_array(max, sizeof(*dma_info), GFP_KERNEL);
+	if (!dma_info)
 		goto out_free_dst;
 
 	pfns = nouveau_pfns_alloc(max);
@@ -729,7 +873,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			goto out_free_pfns;
 
 		if (args.cpages)
-			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
+			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_info,
 						   pfns);
 		args.start = args.end;
 	}
@@ -738,7 +882,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 out_free_pfns:
 	nouveau_pfns_free(pfns);
 out_free_dma:
-	kfree(dma_addrs);
+	kfree(dma_info);
 out_free_dst:
 	kfree(args.dst);
 out_free_src:
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 6fa387da0637..b8a3378154d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -921,12 +921,14 @@ nouveau_pfns_free(u64 *pfns)
 
 void
 nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages)
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 
 	args->p.addr = addr;
-	args->p.size = npages << PAGE_SHIFT;
+	args->p.size = npages << page_shift;
+	args->p.page = page_shift;
 
 	mutex_lock(&svmm->mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index e7d63d7f0c2d..3fd78662f17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -33,7 +33,8 @@ void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		      unsigned long addr, u64 *pfns, unsigned long npages);
+		      unsigned long addr, u64 *pfns, unsigned long npages,
+		      unsigned int page_shift);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.50.1

