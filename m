Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D1B411C1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93BC10E0AA;
	Wed,  3 Sep 2025 01:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JeZyxvmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0961310E0AA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAYYrfna++nwJhLw5aLIMJqrwWNICGMID3GNnMFt761vdRwonBQU9BK6S/znW16ovidKHPQD1AxiTkM7AsRJf7sRQmPO8yu0Ayxx/Tr83C/obF3Q3aYKmQNhY4mQc08eMjjisc7SVAKMXRMkII+yoVSBfGSz1/kpvkXlAvnpTay5vIIj6FvL+8xATwMB3ZXfLt2mtNqSMM1Y0rxxnvg836UWjFBvaLL1+XjqmL8O1u725wvzQDrF2rFaW8fxxPGybtT/447Pf2vf6tdhKlFBGlJ7mtaBPXJeFZZORp6ekvmdKO5pvds1TkUvTxexKoQ3J4HMT6B2MDyXUXCppB6GHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrRgDxsiYm+sXsa0TBZN7lOw/vrJGo7vAIFGdXXYVE8=;
 b=SSTz5yISUUq4YGNjexx5L5FBWIJ7OA0UALEEFlul1dTN0Mq69bi5nFf9rLtIOic/FAtutbMOZtALGKdzr5ikzE1Vca2bC0U/3wL4QwEVfDcarIVsAO3r2wHlfci0gUHx9EKQjQAB/LeyC0ADjplBRTP1pzY8vJtUgTgE5cHXsZ5eMZ5kdYb7wgaYxAe56exnQtfcqzJHNQbHIQoSHzCkfhcEQa8IIVuBuwGWJ80R9gOpLz578YpMhl6PXva4++coW+5ww78a5+RA2T91WuL3GWhYBQSI9Jk4kADyl2TJVCo4egHncAiNxJQnqMTEWcUkPFU8xzhNKNCZnSmTSvnCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrRgDxsiYm+sXsa0TBZN7lOw/vrJGo7vAIFGdXXYVE8=;
 b=JeZyxvmKcEaoeKaW/KdZ6Bf9v0Ys5Lv0+7hf7UfUSTondhXrHsIVZ+A9M2G3k/rfyJqhPxmfruKu6xC80JC4yGsSyyQuRwMNL1ICqrTr/6nKKf1WvaU5FRJIamMqSXMDY/MDclUi5/24Y3ko6eKVeVg9uYpnDkmKhOR5KJFc99hf0F1meX0YXGyLhzJEUxF6PsPVRhF9w+QVr1C09C1IPAsqEwo90A+ZiJ3L0aM0f/If4ej/3+SEZQwY1y0eaU9iLJp8bBPtvHhhIW4fjNHceKFmFIOAinJDsDLOU6dp0R/uOazAByEyzjmunG93pUhhmGiOpO/m9vKWucUJ2y9bNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 01:19:32 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:19:32 +0000
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
Subject: [v4 00/15] mm: support device-private THP
Date: Wed,  3 Sep 2025 11:18:45 +1000
Message-ID: <20250903011900.3657435-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0167.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:24a::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c1c236-72bc-4644-3986-08ddea87efbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVZNeXVrYWxqZjlqQkJoN1B4dDJUMjFERVNjVU1vN2RDS1lWZnVVM1ZkZ1BM?=
 =?utf-8?B?RnJVS2N3STY1OHAzMFFtZWlNY2F3OTJrTXBJcnBseWtXcjJkSDdaSzQxU0Yr?=
 =?utf-8?B?RngyKzEwYjRCVVB3dDVYZm85eHVKT3B6SE9RRDBETEU2QnFENHRmMWRtZ2Iy?=
 =?utf-8?B?b3lLUkhpUmw1WFFzeHVjeE9CenRVcmdYRWtTVlJJU0lLNFZPRERydW1IbU1x?=
 =?utf-8?B?aEQyMU5CMmJJNHlHcTNsdkJ6ODd5OGhCRUR4UmQyMTNGK1lRZjNEQXRqUHdq?=
 =?utf-8?B?b1dYY0FHb3dTMlo5ZWZ1OXVINjRZWWRJMHRHYUZSakJWd01tYXFQb3BaQ1hw?=
 =?utf-8?B?d1Z6TUxZZ3F2WEFHeVJLNEtFVFdWTEZqcTljREFySE8wZXdRNDBsZWtwSTVG?=
 =?utf-8?B?ZG1mUVRkWUVvc3BWalFpVWJuSWYrMkxVdEJNY1k0Y2tHaGVmSUhpOG5TV0pj?=
 =?utf-8?B?aUx4WUJaQUlyNURReEc3QkR5WGVJNmEvblMyV1hDQ2VzUWw0Y0JLaTVqUFFk?=
 =?utf-8?B?UFFtUHBlQk5uQ0owMmJvTlFFWjlFazNNRkJjMzUwNFZQdXpiRzZXUWVwSVdT?=
 =?utf-8?B?d216Q1cxbEV4c3ZSOTV0eTNMTHFodUI3QlRuVFI3aUpadkI4ZGNiZ1pZMFBF?=
 =?utf-8?B?QXpRUzlkaktmU0VQVnl3WTBUOUVWMDIyL25ScjRYTnVOUDUrUC8zanAwNzNy?=
 =?utf-8?B?RFpINGwwaFZpQllMOXpPK1hrQndlMDlYT1ArNTVRTTNWdVZWS2V2WGJvSmcv?=
 =?utf-8?B?bGNWcisyVE0ySHNSNHNvZmpIajI5VDFrczJ5UDJlQXk0T2xGMm12YjUrMjBr?=
 =?utf-8?B?a1BFTzByZkQ2TG9weGt3cmZnU0tNdGVHTUd6bzg3T3BiRVRFYTRabGJFV0lD?=
 =?utf-8?B?UXl4UFptTEk2SmlzaVE2RWpjL0wwWC9raFVRWVZjNHd5aTl3cTV5VlJFdTZH?=
 =?utf-8?B?eUNOQ0dWajBEQXJxZTNINkp0MXpwS3ZSY2pGMkdXRldpZVFSdVlpNHdCM3Rr?=
 =?utf-8?B?R1NMRHpNclhRbUFidHdabjA5SGpPQk5scTVqcEpWcTFCMVJ4Y2lQTW0ycHpp?=
 =?utf-8?B?UlE2QnlSMWhsd1V5Sk9vRjVGNlFob2hwd2Y0L3Y4NDNjL21aczFOL1I0K3pL?=
 =?utf-8?B?U1dOaThZbnR1UHJaRjlqYXpHT0JYTk0xUUpyZXdHK05mcGdQMUlOU0pBZGhK?=
 =?utf-8?B?NGxJWkZtaWtsVWlFTnJzaWlFQWJBNUk3OUtVeHhUaUQzSHI2TmExa1ZLOUxw?=
 =?utf-8?B?RVRyYUFzcTRhSkRqaGdrSy9LMW9mMmxKbk1IOTkwQ1NTS1VvNHhuSi9Pc0VD?=
 =?utf-8?B?M29PM3E1TTBnSFQ5MFdhWGNhZGVnUG4vQ0F4S1RVTENadnk3TjlQR2JFRll4?=
 =?utf-8?B?djRnR0FMT01oeTdobnBoUENVVGxzbFZ3L25yL2owdldzdEh4TERRaitlQTdF?=
 =?utf-8?B?UGFuNFdhbytWRlNVb0dZS3NxWThkSVZVUHRhMHZ1UHpxSnlWVkpDY1VaQ3pS?=
 =?utf-8?B?VDhNYVBCd0JkcTVYS2hWYmM1bFJZOXVueWZrMXJ0djd4UnZzQ0xYZnJ1YUJI?=
 =?utf-8?B?emhJVElWbWc2R2lPNy82NUJTVGNWNlJLK01tK1ZxQUVhMmtrdStpUXoxRUdl?=
 =?utf-8?B?aktOa2J1Z0RiSnJ3VGdxRzBPTjBZRE45Z2tyOEN4aHZZVFc0Rk96SUVUejM3?=
 =?utf-8?B?VG0zUUZvc1FSTXloODU3REQ1eC9ORnV1SHhoTi9aVmE0L2tOdE1QVk5ZMkZh?=
 =?utf-8?B?aEd0b2J1UmhWamFyUm9NVkpSdUhxaHBPN3dnTWZhWUxoU3U2ZTNvVmVqWlZk?=
 =?utf-8?B?K0xyNnpvYUQvN0tKcWNZU1NjOXVCSzNOcU8wdnFlRjVqZ0MycnVLTnFrd0gy?=
 =?utf-8?B?SmZWSFJHbG1iWnFsM1hJTzhMaEs0T1JmWGk4RGpjdlhneHdaQmkwU2ZaOWpt?=
 =?utf-8?Q?gv1/sByx9wc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3cwSWErdDYxSWd2SjBTWmFHMEhwNE9Nb05yMDVyQ3l4OVgzU1BGTHJqeVhZ?=
 =?utf-8?B?cVdXSjZ5QzNoNzNJM1pYelFGU2VsYjFrMXZ1SUNpaFZNS1dlZGNZYkIrd01w?=
 =?utf-8?B?S3d1cDBmNzJEUFg5VmY5YjhkMnhpWFlVTDFRN3dUcEZ2NnFEYkl3NWlPOWEx?=
 =?utf-8?B?NnRoaXBRbjh1czdIQzdqdlRCclFUakJMZElZeFZRUHB5a0JMb2dMT0tZYzZz?=
 =?utf-8?B?bkxVbEpiTGtFWm5CV1UxTmJyanpwQkp4d1BOMGphZ1JPMXIwdjBzUnNRR3Rp?=
 =?utf-8?B?YmJPanRYZGIwRUhsN1kxc3dZamYyRWduR1JvNUJSUnhRUFVzVjFuNDB2dUZP?=
 =?utf-8?B?ZTVxblpoTkx0WUQraDZHSVY5YVFSbmVrczRpeHJIdE9WTzY4Z3d2QXZnYUd4?=
 =?utf-8?B?TmRtMGdyQnltOGlXQkg0SzJHNGhhalhQRnRCNGZpZXMwL0czcDBHZ3kyclRx?=
 =?utf-8?B?UU9MUHZJNWxDL1JEaWFPWU52aDhjVTYyUHBTcUZSNHJtVDYwa3ZaRms5WTV3?=
 =?utf-8?B?dUZ0SDNCVkQ0RVF0SjUzUXNNcHRwVkY2TGtUK0NYVVVxSGNTbHNwcWtIMDl1?=
 =?utf-8?B?aHg1YmtERmFrMFVaZ05GanlpcUk1QjlxNlc2QjhiekM0cTZpN2tIYThrL1do?=
 =?utf-8?B?WlRzR3ZlcTkvN1FyOGZvMngvVm5zSFRaSGRwdnUrdUZuVUZzNWFYSW41eFQv?=
 =?utf-8?B?ejRqTzkrLzJtVjZsZmw2UjMvcVArZEVwaHBvdHR1MHZoczlGdUt0RlpQSFM2?=
 =?utf-8?B?NlJOaVRIVTFHRHViMDBTOTQzMk9LR2RsVUxWL09WWTZTa29BRWFTdkgzTFB2?=
 =?utf-8?B?T1hDK0pvUFJGeC9hT1NqdFZoMGc4dXhFRHgrOG1nczZLOWxKZkFOQVpodU1w?=
 =?utf-8?B?RWJXaG5zc1FpOXBPV2ZMdlRiQ1BqU1orV0Q5OSt4YnREOE8xZjdWeEVlMERT?=
 =?utf-8?B?ZTE2RjdrellnZU5YbVRuem43Y1EzTFFEeGlVelJ5aUo5WkNYR3g5UEhMbFdO?=
 =?utf-8?B?QVFZVEVFQWtSN3RJR0QxTW5iZHhmNDJVall3TWtlU2lYSEpTQytGK2FVNVgy?=
 =?utf-8?B?WGljM3RkaU8xWWhraXY1T0lndnVZSmpJRFhXazhZV0FzaExpY09rNUlic09J?=
 =?utf-8?B?cnZqeUljUGozVEVoOUt3R05VbVVXTVkyRTcxTTM3WnF2cjNUQkx2SVh4b1VB?=
 =?utf-8?B?NnJLcVN3WkFJRWVKN3lrV0pMb0NYQ1NGTjlXREJmZHdqWkNUWDR5bGFFeWZS?=
 =?utf-8?B?ODBlbDdpQWpVdlJmODMzYlhnSlVCVURwU3lNWFVRYmhQWUV3bkEyRjFsTFRr?=
 =?utf-8?B?UERRNGJOZUlHWVNITjB2a0tEUm1ScEhVNVo2VTBCUTlwbnBrdG0rSTViNzB4?=
 =?utf-8?B?QlJHUlNNQVpRR1NwNlpxbGpHRHg2dmdsaVpPYW43R2NHZzB0OGlZcGlIOFBS?=
 =?utf-8?B?enFIaXM5elBqdk1SRytQVXh4anRRZGFQcmt5NE9xTEZ6Z1Rhb2o0THUyVGZl?=
 =?utf-8?B?eHRUOVZmMG1lRmlFdDlpN09jNCtlVUFhNmNCWlFsWjkwZzNObEZrTG1pa1Jz?=
 =?utf-8?B?alBXQk80Ty9Ya1RTWTZiVGEwV2k3ZG1jbTJDVy9XUDZVWjdKR2pNR2Q5QjNt?=
 =?utf-8?B?M2ErNXhmTytqRUNlS1FyL0h0aHJSSkY5K1pZbHhNd2RQdE5rRWxRL1R2cTM4?=
 =?utf-8?B?ZWpZRUVDMUNIZWxqK1JNNXBsM04yTHNhOHcvZEpxMnpyWHBCaWI0ZURJQ2VT?=
 =?utf-8?B?bGtmZ0pGb3MvdHBhMEl4bVU0eG1KRi91TWQ1UzRia1BqM1U1c3dZM21YOUE1?=
 =?utf-8?B?Qk5kaUY3dzFlTWlKUW9lL3B3TmlJb2hhVnJLc3Z6ZkNQT3h6Snc3Y24xcmlE?=
 =?utf-8?B?aE12disyckIxMjJiS2d1SE1BTktPbHRobzlpbmpiQ0dxRFFPc2FOc2t5Y0ky?=
 =?utf-8?B?NzloeUgvZ1UraDA4S3NpdW45OVdHNE1SVnhFV0E0TmhXMlIyWGtqeUQ5am8y?=
 =?utf-8?B?ZnBDS2Rva1pQMWxHU05RSElaQlMzTGp4TGFDTkVvcWJZY0JLaTN0YWh4emVP?=
 =?utf-8?B?YUNjeUVHUHc2UXBnUXh6a2ZqNHRncGxoRHNPL1Q5YVRNbHNLTit5eHBpS0Vl?=
 =?utf-8?Q?15Mkn43PaN7fJZGi44iEAWjT4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c1c236-72bc-4644-3986-08ddea87efbb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:19:32.3173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbTE4Epd0elAojRvptqy5FhpfjM0Z3LCb0AmfhCeGZhl3j2PO7pSswDlltlqjH7332O+O7YtQWjZkIBVv5U6Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
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

This patch series introduces support for Transparent Huge Page (THP)
migration in zone device-private memory. The implementation enables
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
series shows a 4x improvement in data transfer throughput and a
5x improvement in latency

These patches build on the earlier posts by Ralph Campbell [1]

Two new flags are added in vma_migration to select and mark compound
pages. migrate_vma_setup(), migrate_vma_pages() and
migrate_vma_finalize() support migration of these pages when
MIGRATE_VMA_SELECT_COMPOUND is passed in as arguments.

The series also adds zone device awareness to (m)THP pages along with
fault handling of large zone device private pages. page vma walk and the
rmap code is also zone device aware. Support has also been added for
folios that might need to be split in the middle of migration (when the
src and dst do not agree on MIGRATE_PFN_COMPOUND), that occurs when src
side of the migration can migrate large pages, but the destination has
not been able to allocate large pages. The code supported and used
folio_split() when migrating THP pages, this is used when
MIGRATE_VMA_SELECT_COMPOUND is not passed as an argument to
migrate_vma_setup().

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

These patches are built on top of mm/mm-stable

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
 mm/migrate_device.c                    | 614 +++++++++++++++--
 mm/page_idle.c                         |   5 +-
 mm/page_vma_mapped.c                   |  12 +-
 mm/pgtable-generic.c                   |   6 +
 mm/rmap.c                              |  25 +-
 tools/testing/selftests/mm/hmm-tests.c | 919 +++++++++++++++++++++++--
 20 files changed, 2399 insertions(+), 394 deletions(-)

-- 
2.50.1

