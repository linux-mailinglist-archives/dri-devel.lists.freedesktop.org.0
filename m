Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD87BAF532
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD5A10E676;
	Wed,  1 Oct 2025 06:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="og2qj1YL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D04210E676
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9gN5SrvJ86+xZR5lgJ5V/x5B3HI+O8dpUMNDfbCCeIdKuSkb0ytXNd5myX5m7rgCma00cU8djYlM9Kn4rjszen2Pp7wOZzwElzr7xKJMHnOP5c0CTYmK///Cm0f5GCM2FPzg3QbYz4wAk/4xQKUsV1Ax0kzNup5Q6dMEHhlvzTFhwmlDBTJzv7UbUEYpsLxQ4a8RdGMFX634eeRpTxoJp8we4ni1TXE5/7mZEk+G8R5wVPWiSd8jRCqpzK6no2EIHCGYwNGmh2iNhroOi/Q8TB8g38R2GcD2gQN1Qnhf8iVrK0uXypjzFSTUts8MEC8Me1+hXse7OOtvoQar4npBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Owc77XdQzRRTRdRN/LdXS7ya2DNChj16REY5ruhJXF0=;
 b=tbI/HHhlfKAwMo+Mm6MdCcxDhDwHowCDPl4PDqDzCHRPPRWbxcIEHkLZ6Hg4NRy5Xp0UdvpTMOLgBxtQKxXbG9olpnWkqrc4qWYAH8y1BkPXtDypVIc1wlP58rgUG3x9+0h0nusdivy4jspj1D5LTku6tHmLh/2PXv8RJWG4gRX7pHRDEXMNjEwKNMjg1Cle3hWVTMCxyj2vF1TY/Oe2mN/bfw1D2t2bqaCnN7kn1CPt+GeUxin1AWTyBXbbhmIwyev6Akv31se0IB2TyVHUeMVxtr4KPXGDiV+V6FQ595ediuvGeM0Re401f9JSO7DXoot9xaR0cQCxvs1+l54bYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Owc77XdQzRRTRdRN/LdXS7ya2DNChj16REY5ruhJXF0=;
 b=og2qj1YLsth3rTbiFlU/Ofsna7cZA+Kv1+A1K81N/4nLpfXgNP9CBDmDXTxCwgX9wrf+wTB/WJY1ENBYXBdfj1iwlzpF/OMjZkagCGz/+6kUzvGL/w/Kv43aBzkNKoUoDGTueen+dkvZlkw6Z3VHjyGGB4eSspYiQgB9RNqstgOtlTxThY9hTUG1QPdmOeAIbSKU42S08OvnWmXpC4rv/abdzl+fQkNib60Ys+yTEC3VI6j4knm+RsfPFpYjcT3LE7L2L8rXtK8v5Zd0itypLpNyxN9LnuOrx88zU3qJYZ6cokkaFsuFW7ExMzUtM8Vzm91nlbKMmfVapMQqkCXgKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:36 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:36 +0000
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
Subject: [v7 09/16] lib/test_hmm: add zone device private THP test
 infrastructure
Date: Wed,  1 Oct 2025 16:57:00 +1000
Message-ID: <20251001065707.920170-10-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR02CA0148.namprd02.prod.outlook.com
 (2603:10b6:5:332::15) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: a2787312-4ef4-439a-ee90-08de00b7f13f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmZvcWpON2pCWGVLZVc3VlNscWVnY2kybzlzRzVzR1lMNkkrVFRzQjNWdFov?=
 =?utf-8?B?Slo3Z0RrcjUzVForYm9QN2FEanhabUNwaUxoQldWVVVHQk1DZGdqTEsrakc1?=
 =?utf-8?B?U2hXeTBMZlFLZ0hoU0RHbTRXSGx5ZCtrSlFiQVYxakd0cFhuUjlvZ1NMU3pw?=
 =?utf-8?B?UXFDdll3eVVwVTZoQy9qYlZxMzVMWi9BL25ubFpMb1RzNDMvVjgzYWthZ3BJ?=
 =?utf-8?B?NDdRb2NCdDFLWVJrQloydVUxcy9SbGtWK1RQMko5VDBzOXRxRTNicjRSUVli?=
 =?utf-8?B?Sk5nNlNPVjZnd3BucE8yKzROd3YvM0lBR3UxZ3I0cE8wenU0WTNwQWJ6RGlq?=
 =?utf-8?B?bTArd3pVdEY3dVc4ZUJFb3RMbHVSa0Q1ZmRuWTFSSFJlbDJBYzVOd0NGbU11?=
 =?utf-8?B?V3pxb2lyOCs4SnMvaDdUY05FUVVCdFdVWDljUE9xSXFIY1BPTEVoSHN5cllX?=
 =?utf-8?B?T3B6Q3RUTjZQT0lUVzlIeFlvc1MvRjBzM29qWENMRmZISk5CV1VHZ2h6azhi?=
 =?utf-8?B?UEVjQWlKcGo2ZVhQNHdhRkZzNkx4ZkV3MUI1dzM2UlJlMU84OGdwRjYwQkxn?=
 =?utf-8?B?M29FMEFTbmN2WEZhYjdkWEVCQzNjM3NCTkxhNmFrVnkwaWlJUGlxQmEyWEF6?=
 =?utf-8?B?V1V2UGlsWnpScUZ1S1prSU5RSWpoOXdFbFFyemI2SjJpZnpZWElFT0V5dC9k?=
 =?utf-8?B?RTBTL0NNL2ZYeStwUCtiOGs2ZDlqTjNZOU04cTdDNjdVVFVaNk83a3FBWnpQ?=
 =?utf-8?B?TEt0YWQwOTkzMTRkNXdZbUp4c3grZUQrbVAweDR2RjZsSnFwVjUzVm5GSmlN?=
 =?utf-8?B?MDdCSnk2a3FYbEZ6TkZpS1RjYmRHYmkyVXJtbzcwNkZBaGdUSXY0OTRxaUhF?=
 =?utf-8?B?QjU3akpHakxMaS9ueTE2Y1lpMGFIdG5ocEpuNFlNa1RKTzAxeTJsTXg5RSs4?=
 =?utf-8?B?TktJMVl2Qk1XZmZIcHUyalFkUEdPaS9LL3Mvc2FnSWQ2Zm1obCtIbEhsUjk5?=
 =?utf-8?B?eVZjU3g5WnNnOWdkcmViWlNFck0xRW1KTmtCcmMra0V1cGRBSUZNOWs5UHls?=
 =?utf-8?B?ZmlLanpJb1orM0lsZldNR2UvejBIbUlmZXVIZFpwWEFRZlpuMHB5NW9hQmVM?=
 =?utf-8?B?MjVQb20ya3BxN1hLOG1zWExjcW12NUJhbGYwRWpKWWo4RjEvZmU0V1YzWVA0?=
 =?utf-8?B?bXNSTnZRUk85bnBCbGxSWnRLUUpaMm04VDg3dVdiZjNndmZIcFdGdlJZNEtU?=
 =?utf-8?B?VVJENDdDTW1PT0I5Tmc3alBXV2ViazlibTBONDIyelk3ekZ3cGVoYzFoWXBm?=
 =?utf-8?B?em1qczVHRHM0MXVlUTF0akZVOXprYUswTkZnMTYxVytHR0l3VnVUY3pudmRw?=
 =?utf-8?B?SjRMVjRhMk5mZG14ZUlpejRqaHBLL0N3RzlWSHRSSUE5T3hZdnJWT0c3c0xF?=
 =?utf-8?B?VFBGUU1ReGRMM2tha0RYNkZoUXZNZktjSEcxanprVWxhTGhtYWViS2ZLWksr?=
 =?utf-8?B?aWR4UXRwN0oxQUgzMVM2Q0VNaDNKMkwvM3E3QmhSWEpydUJ5Yi9FZ3h5TWQx?=
 =?utf-8?B?YkJFbDd3aTdBQUFIYnY4TSs3VGYvMnNkb3VxN3RPTWNZcVU1RlBtNjRBMGlx?=
 =?utf-8?B?aEdkRmFPdUtxTWpUOFFXdmRlcDZrSW9MRzZ1Z3dPSHhRSWJrQmRQZ2tZSmZ0?=
 =?utf-8?B?eHJQZkoxV1FYMWZ5UnRhRW4rU2hkV0ZLUndiSFRwYXcxbXg4Q2krM1FxaWdK?=
 =?utf-8?B?RVB5WlNNVzNkNWFmUHdpUFFaUEl5aGRaTS9hclZOMHpNdnR2MjBGSDZkcW9T?=
 =?utf-8?B?VWZlWE8xYjFycTFuTnlST3dMQU1xNTZrVVNUODRyRFJHS05NRGpiYnRML3Fp?=
 =?utf-8?B?a3plVE1aOU43K2pYVmRlY29tb01Kc3pQeXVleGhOaiszbHBsZ094SzFuSnRO?=
 =?utf-8?Q?NAztvDOWmmaF2Xr3xqQMTNB/5JzPapsx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3VzWVZkMG9aTUtpV1lyWlFBRWFrUTJKdGlJVkZsNmhUa3lOVVN6RHMzRmY2?=
 =?utf-8?B?d01SR2ZDZjdXdlRNaWwrWk1OZE9PQ0pySU54eWNsaEh0YnpKNllRdXpqR0Vw?=
 =?utf-8?B?VWs5ZGZzVi9VeWI3ajJMZGFqeXd5WkNvZlU1OWN0bzdJczZwQVBzUUpVUk5T?=
 =?utf-8?B?OXFGbnQrUkUzVTN5QWVQTlRmN1hjb0V1cU1ySWl3bjM4K3pBeVkrSEZmQmFG?=
 =?utf-8?B?clRaR2tJZTBNbFY1SytYdFhjOTlKak0xTFRKZEVIVHBtK3E3UjdRNHR3QndS?=
 =?utf-8?B?dC95TTIwaHJMN1J3TXpUak9UUUlySjRWSG02U01YWXhOM0xqS3E4TW91eW0y?=
 =?utf-8?B?cXFYL3FUVldHWDFkWjEwUWRmbnliOXdvVnJuWUk5SjEra1RBZVh0TktMc25K?=
 =?utf-8?B?SWNZbEl3SGMvQWtxZ2poV2RHWTlHbXFEQ085a3JxektxaHBCNjd2NGg3MVpq?=
 =?utf-8?B?UzdlT21pM1VadnZDcWt2Qyt6bTBhQ3lucmc2NnBXV1QwNVhZMXArQlI2eHNt?=
 =?utf-8?B?VmJJS1JaOUx2TkgvYzJ6UUxKcjN6QitZbHRVTk9ueHhvZW9UV2doYmw5ZzJR?=
 =?utf-8?B?Mk01RjkwK1d0OGJKZW9xRWVaemtxSHdhTnBEOUNZK3cySHlyV0RYZy80V0lh?=
 =?utf-8?B?MHRITlY0ZjlyNWR4K0k1TSt3cDJFYzVKc2l4RWpuUE1kVXhIenpPMWJSRTJv?=
 =?utf-8?B?Z3ljNW9SRHYxeFVsd1IyMXR5NUF1enNDOUZvNFVxcm5ma3Q1WTl3WVZrTkk0?=
 =?utf-8?B?NUJiS1ZlSWFFazZJKzQrbzhOVU5OcWx6ZWwxbGF1ZWZkU3pEN3RWRm1NMmwx?=
 =?utf-8?B?Mkg5cnphaStzdVVkWTZrdGptSTArYVFmMkhneG5Fb1h0dFBYckJiV1dpem8v?=
 =?utf-8?B?TkhjeGJwaVhxK2p1Z1N1cWlrUVNxS2o3YzUzVStnbzJTQjI5WjIrdHdYbUFk?=
 =?utf-8?B?dS9RaDl1THF1Y05wY2p0NDZyWDNVUnIxUVlhZ2JKZkRxeHY3N2UwZFhTdFB2?=
 =?utf-8?B?cjBQRTJVUEJIYkd1QmtjdmZGN29YSloyVU0yVG8yRjRJcHFPUnZFa0FSRnRO?=
 =?utf-8?B?TE1zMVhXRmRBQ2M2R1hrSXAwTjkyV1FGZFUwUDFjdFFzbFpaSERvendqRTJI?=
 =?utf-8?B?Wlo5OXloZlJJVTZudStTUENHbGVtL1NIak9sNkd1a3dJdzJtN3V0bG5kcWR2?=
 =?utf-8?B?WG9yZHV5WEUvZlRkdWZ4ZldUdWcrM05FSVBCdldvZnRDL0hOZ1RkbWlZTG90?=
 =?utf-8?B?OEw0QXVCVkE5SWxiNXNQRXlVaDh6cFpKQW0rc1NNM3dqTGVQTEJNbzBpQlZH?=
 =?utf-8?B?SVIyT011ejFVWXlnWEE2TjB5MEFhMWYyNG90K282YzNyUlBHeFhQeXhGZzJB?=
 =?utf-8?B?cjI5VjJzRFI1VUpGTDhPOEtJL0JEYnVlUEFBWGxZaXhFcitQdnN1N3BFbmFU?=
 =?utf-8?B?QTdmeldEZUo3RDM5emVtRkJpRlRTcUlMSS8wem5vWDN0dFYrUHJWcnhRclIr?=
 =?utf-8?B?c0taRE4rZStjczdtRk5DTDAxa05SZmdUeVRZY0dremJ4QTNkOHY3NHoyVFIr?=
 =?utf-8?B?SUhWaVB4LzlMYWNCZmFvV0NVVGhyL28ybTJLbGZFZ3BIcEo5V2VKVEx0V2dB?=
 =?utf-8?B?ZkJhNkI5eGhveXFpV2F1ajQxRTArOGdRTW16WXl1VzBJZHdERHBkSHhzbGI2?=
 =?utf-8?B?RnZDUFN6OHJKYTBjQzZVNjdSRVdsdGFmZVNGMGZSNEVHbFZETVNyL3M4ajNR?=
 =?utf-8?B?aHVvdm5FTXFzYlZwcFlxanhsZk9qTTU5SlB3YjgyOGYrYktwcm5jbW8yZzBh?=
 =?utf-8?B?eXZwY0laTk1ibVhpdG51eFUwbGUvc1pxbGtlUUdKZUxEOUcxdDZKYVk3bUJm?=
 =?utf-8?B?a05LMXVOSFc3T1FhWDNGbmVMclhNSENxbWcwV2YyR2xVT3JMVUV4ZW5ReUtT?=
 =?utf-8?B?aGtEMFJjNnNGK2I0MjRpM09TQkQxeno3b2FOQXR2V29CZ1BoaEtTNmZoQjBP?=
 =?utf-8?B?cWVMTXZpdEx6MkJQUjJ6bzRWbGZ6SGNBalpyTVdvMGo5bGE2Zis5QVcxdGFS?=
 =?utf-8?B?aXNpMmJTL2wwMjBYS0x5QUJ4enVEdytDZHFTTjNvWjVYS2gvdDNlWjJsaUc1?=
 =?utf-8?B?VFQ2NVhTbndCMWlBdGNzaTV5NkpVNmVEQ2xuUGF6ZU1iWTZIVzkrU1VDK212?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2787312-4ef4-439a-ee90-08de00b7f13f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:36.4798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTok1n1PecJS8jPbH8Tn8i/mvQ8B6z0EZkcL5abQ4JWTi9beQR5ykNIm8SDiePwYn7HN9wMQ1EwdkULgVFyiPw==
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

Enhance the hmm test driver (lib/test_hmm) with support for THP pages.

A new pool of free_folios() has now been added to the dmirror device,
which can be allocated when a request for a THP zone device private page
is made.

Add compound page awareness to the allocation function during normal
migration and fault based migration.  These routines also copy
folio_nr_pages() when moving data between system memory and device memory.

args.src and args.dst used to hold migration entries are now dynamically
allocated (as they need to hold HPAGE_PMD_NR entries or more).

Split and migrate support will be added in future patches in this series.

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
 include/linux/memremap.h |  12 ++
 lib/test_hmm.c           | 368 +++++++++++++++++++++++++++++++--------
 2 files changed, 304 insertions(+), 76 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index cd28d1666801..7df4dd037b69 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -177,6 +177,18 @@ static inline bool folio_is_pci_p2pdma(const struct folio *folio)
 		folio->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
 }
 
+static inline void *folio_zone_device_data(const struct folio *folio)
+{
+	VM_WARN_ON_FOLIO(!folio_is_device_private(folio), folio);
+	return folio->page.zone_device_data;
+}
+
+static inline void folio_set_zone_device_data(struct folio *folio, void *data)
+{
+	VM_WARN_ON_FOLIO(!folio_is_device_private(folio), folio);
+	folio->page.zone_device_data = data;
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9dbf265d1036..32d402e80bcc 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -119,6 +119,7 @@ struct dmirror_device {
 	unsigned long		calloc;
 	unsigned long		cfree;
 	struct page		*free_pages;
+	struct folio		*free_folios;
 	spinlock_t		lock;		/* protects the above */
 };
 
@@ -492,7 +493,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 }
 
 static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
-				   struct page **ppage)
+				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
 	struct resource *res = NULL;
@@ -572,20 +573,45 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
-	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+	for (pfn = pfn_first; pfn < pfn_last; ) {
 		struct page *page = pfn_to_page(pfn);
 
+		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
+			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+			pfn += HPAGE_PMD_NR;
+			continue;
+		}
+
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
+		pfn++;
 	}
+
+	ret = 0;
 	if (ppage) {
-		*ppage = mdevice->free_pages;
-		mdevice->free_pages = (*ppage)->zone_device_data;
-		mdevice->calloc++;
+		if (is_large) {
+			if (!mdevice->free_folios) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+			*ppage = folio_page(mdevice->free_folios, 0);
+			mdevice->free_folios = (*ppage)->zone_device_data;
+			mdevice->calloc += HPAGE_PMD_NR;
+		} else if (mdevice->free_pages) {
+			*ppage = mdevice->free_pages;
+			mdevice->free_pages = (*ppage)->zone_device_data;
+			mdevice->calloc++;
+		} else {
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
 	}
+err_unlock:
 	spin_unlock(&mdevice->lock);
 
-	return 0;
+	return ret;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -598,10 +624,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	return ret;
 }
 
-static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
+static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
+					      bool is_large)
 {
 	struct page *dpage = NULL;
 	struct page *rpage = NULL;
+	unsigned int order = is_large ? HPAGE_PMD_ORDER : 0;
+	struct dmirror_device *mdevice = dmirror->mdevice;
 
 	/*
 	 * For ZONE_DEVICE private type, this is a fake device so we allocate
@@ -610,49 +639,55 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = alloc_page(GFP_HIGHUSER);
+		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
 		if (!rpage)
 			return NULL;
 	}
 	spin_lock(&mdevice->lock);
 
-	if (mdevice->free_pages) {
+	if (is_large && mdevice->free_folios) {
+		dpage = folio_page(mdevice->free_folios, 0);
+		mdevice->free_folios = dpage->zone_device_data;
+		mdevice->calloc += 1 << order;
+		spin_unlock(&mdevice->lock);
+	} else if (!is_large && mdevice->free_pages) {
 		dpage = mdevice->free_pages;
 		mdevice->free_pages = dpage->zone_device_data;
 		mdevice->calloc++;
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage, is_large))
 			goto error;
 	}
 
-	zone_device_page_init(dpage, 0);
+	zone_device_folio_init(page_folio(dpage), order);
 	dpage->zone_device_data = rpage;
 	return dpage;
 
 error:
 	if (rpage)
-		__free_page(rpage);
+		__free_pages(rpage, order);
 	return NULL;
 }
 
 static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
-	struct dmirror_device *mdevice = dmirror->mdevice;
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
-	for (addr = args->start; addr < args->end; addr += PAGE_SIZE,
-						   src++, dst++) {
+	for (addr = args->start; addr < args->end; ) {
 		struct page *spage;
 		struct page *dpage;
 		struct page *rpage;
+		bool is_large = *src & MIGRATE_PFN_COMPOUND;
+		int write = (*src & MIGRATE_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		unsigned long nr = 1;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		/*
 		 * Note that spage might be NULL which is OK since it is an
@@ -662,17 +697,45 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		if (WARN(spage && is_zone_device_page(spage),
 		     "page already in device spage pfn: 0x%lx\n",
 		     page_to_pfn(spage)))
+			goto next;
+
+		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (!dpage) {
+			struct folio *folio;
+			unsigned long i;
+			unsigned long spfn = *src >> MIGRATE_PFN_SHIFT;
+			struct page *src_page;
+
+			if (!is_large)
+				goto next;
+
+			if (!spage && is_large) {
+				nr = HPAGE_PMD_NR;
+			} else {
+				folio = page_folio(spage);
+				nr = folio_nr_pages(folio);
+			}
+
+			for (i = 0; i < nr && addr < args->end; i++) {
+				dpage = dmirror_devmem_alloc_page(dmirror, false);
+				rpage = BACKING_PAGE(dpage);
+				rpage->zone_device_data = dmirror;
+
+				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				src_page = pfn_to_page(spfn + i);
+
+				if (spage)
+					copy_highpage(rpage, src_page);
+				else
+					clear_highpage(rpage);
+				src++;
+				dst++;
+				addr += PAGE_SIZE;
+			}
 			continue;
-
-		dpage = dmirror_devmem_alloc_page(mdevice);
-		if (!dpage)
-			continue;
+		}
 
 		rpage = BACKING_PAGE(dpage);
-		if (spage)
-			copy_highpage(rpage, spage);
-		else
-			clear_highpage(rpage);
 
 		/*
 		 * Normally, a device would use the page->zone_device_data to
@@ -684,10 +747,42 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if ((*src & MIGRATE_PFN_WRITE) ||
-		    (!spage && args->vma->vm_flags & VM_WRITE))
-			*dst |= MIGRATE_PFN_WRITE;
+
+		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+
+		if (is_large) {
+			int i;
+			struct folio *folio = page_folio(dpage);
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+			if (folio_test_large(folio)) {
+				for (i = 0; i < folio_nr_pages(folio); i++) {
+					struct page *dst_page =
+						pfn_to_page(page_to_pfn(rpage) + i);
+					struct page *src_page =
+						pfn_to_page(page_to_pfn(spage) + i);
+
+					if (spage)
+						copy_highpage(dst_page, src_page);
+					else
+						clear_highpage(dst_page);
+					src++;
+					dst++;
+					addr += PAGE_SIZE;
+				}
+				continue;
+			}
+		}
+
+		if (spage)
+			copy_highpage(rpage, spage);
+		else
+			clear_highpage(rpage);
+
+next:
+		src++;
+		dst++;
+		addr += PAGE_SIZE;
 	}
 }
 
@@ -734,14 +829,17 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	const unsigned long *src = args->src;
 	const unsigned long *dst = args->dst;
 	unsigned long pfn;
+	const unsigned long start_pfn = start >> PAGE_SHIFT;
+	const unsigned long end_pfn = end >> PAGE_SHIFT;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++,
-								src++, dst++) {
+	for (pfn = start_pfn; pfn < end_pfn; pfn++, src++, dst++) {
 		struct page *dpage;
 		void *entry;
+		int nr, i;
+		struct page *rpage;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
 			continue;
@@ -750,13 +848,25 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		entry = BACKING_PAGE(dpage);
-		if (*dst & MIGRATE_PFN_WRITE)
-			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
+		if (*dst & MIGRATE_PFN_COMPOUND)
+			nr = folio_nr_pages(page_folio(dpage));
+		else
+			nr = 1;
+
+		WARN_ON_ONCE(end_pfn < start_pfn + nr);
+
+		rpage = BACKING_PAGE(dpage);
+		VM_WARN_ON(folio_nr_pages(page_folio(rpage)) != nr);
+
+		for (i = 0; i < nr; i++) {
+			entry = folio_page(page_folio(rpage), i);
+			if (*dst & MIGRATE_PFN_WRITE)
+				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
+			if (xa_is_err(entry)) {
+				mutex_unlock(&dmirror->mutex);
+				return xa_err(entry);
+			}
 		}
 	}
 
@@ -829,31 +939,66 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	unsigned long start = args->start;
 	unsigned long end = args->end;
 	unsigned long addr;
+	unsigned int order = 0;
+	int i;
 
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
+	for (addr = start; addr < end; ) {
 		struct page *dpage, *spage;
 
 		spage = migrate_pfn_to_page(*src);
-		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+		if (!spage || !(*src & MIGRATE_PFN_MIGRATE)) {
+			addr += PAGE_SIZE;
+			goto next;
+		}
 
 		if (WARN_ON(!is_device_private_page(spage) &&
-			    !is_device_coherent_page(spage)))
-			continue;
+			    !is_device_coherent_page(spage))) {
+			addr += PAGE_SIZE;
+			goto next;
+		}
+
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		order = folio_order(page_folio(spage));
 
+		if (order)
+			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
+						order, args->vma, addr), 0);
+		else
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+
+		/* Try with smaller pages if large allocation fails */
+		if (!dpage && order) {
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+			if (!dpage)
+				return VM_FAULT_OOM;
+			order = 0;
+		}
+
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+				page_to_pfn(spage), page_to_pfn(dpage));
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
+		if (order)
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+		for (i = 0; i < (1 << order); i++) {
+			struct page *src_page;
+			struct page *dst_page;
+
+			src_page = pfn_to_page(page_to_pfn(spage) + i);
+			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+
+			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			copy_highpage(dst_page, src_page);
+		}
+next:
+		addr += PAGE_SIZE << order;
+		src += 1 << order;
+		dst += 1 << order;
 	}
 	return 0;
 }
@@ -879,11 +1024,14 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
 	start = cmd->addr;
 	end = start + size;
@@ -902,7 +1050,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -912,7 +1060,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = dmirror_select_device(dmirror);
+		args.flags = dmirror_select_device(dmirror) | MIGRATE_VMA_SELECT_COMPOUND;
 
 		ret = migrate_vma_setup(&args);
 		if (ret)
@@ -928,6 +1076,8 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+	kvfree(src_pfns);
+	kvfree(dst_pfns);
 
 	return ret;
 }
@@ -939,12 +1089,12 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns = NULL;
+	unsigned long *dst_pfns = NULL;
 
 	start = cmd->addr;
 	end = start + size;
@@ -955,6 +1105,18 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	if (!mmget_not_zero(mm))
 		return -EINVAL;
 
+	ret = -ENOMEM;
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!src_pfns)
+		goto free_mem;
+
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!dst_pfns)
+		goto free_mem;
+
+	ret = 0;
 	mmap_read_lock(mm);
 	for (addr = start; addr < end; addr = next) {
 		vma = vma_lookup(mm, addr);
@@ -962,7 +1124,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -972,7 +1134,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = MIGRATE_VMA_SELECT_SYSTEM |
+				MIGRATE_VMA_SELECT_COMPOUND;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -992,7 +1155,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
-		return ret;
+		goto free_mem;
 	mutex_lock(&dmirror->mutex);
 	ret = dmirror_do_read(dmirror, start, end, &bounce);
 	mutex_unlock(&dmirror->mutex);
@@ -1003,11 +1166,14 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
-	return ret;
+	goto free_mem;
 
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+free_mem:
+	kfree(src_pfns);
+	kfree(dst_pfns);
 	return ret;
 }
 
@@ -1200,6 +1366,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long i;
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
+	unsigned int order = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
@@ -1215,13 +1382,25 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
 			continue;
+
+		order = folio_order(page_folio(spage));
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+			dpage = folio_page(folio_alloc(GFP_HIGHUSER_MOVABLE,
+					      order), 0);
+		} else {
+			dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+			order = 0;
+		}
+
+		/* TODO Support splitting here */
 		lock_page(dpage);
-		copy_highpage(dpage, spage);
 		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+		if (order)
+			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
+		folio_copy(page_folio(dpage), page_folio(spage));
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -1234,7 +1413,12 @@ static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
 {
 	struct dmirror_device *mdevice = devmem->mdevice;
 	struct page *page;
+	struct folio *folio;
+
 
+	for (folio = mdevice->free_folios; folio; folio = folio_zone_device_data(folio))
+		if (dmirror_page_to_chunk(folio_page(folio, 0)) == devmem)
+			mdevice->free_folios = folio_zone_device_data(folio);
 	for (page = mdevice->free_pages; page; page = page->zone_device_data)
 		if (dmirror_page_to_chunk(page) == devmem)
 			mdevice->free_pages = page->zone_device_data;
@@ -1265,6 +1449,7 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 		mdevice->devmem_count = 0;
 		mdevice->devmem_capacity = 0;
 		mdevice->free_pages = NULL;
+		mdevice->free_folios = NULL;
 		kfree(mdevice->devmem_chunks);
 		mdevice->devmem_chunks = NULL;
 	}
@@ -1379,18 +1564,30 @@ static void dmirror_devmem_free(struct folio *folio)
 	struct page *page = &folio->page;
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
+	struct folio *rfolio = page_folio(rpage);
+	unsigned int order = folio_order(rfolio);
 
-	if (rpage != page)
-		__free_page(rpage);
+	if (rpage != page) {
+		if (order)
+			__free_pages(rpage, order);
+		else
+			__free_page(rpage);
+		rpage = NULL;
+	}
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
 
 	/* Return page to our allocator if not freeing the chunk */
 	if (!dmirror_page_to_chunk(page)->remove) {
-		mdevice->cfree++;
-		page->zone_device_data = mdevice->free_pages;
-		mdevice->free_pages = page;
+		mdevice->cfree += 1 << order;
+		if (order) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+		} else {
+			page->zone_device_data = mdevice->free_pages;
+			mdevice->free_pages = page;
+		}
 	}
 	spin_unlock(&mdevice->lock);
 }
@@ -1398,36 +1595,52 @@ static void dmirror_devmem_free(struct folio *folio)
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args = { 0 };
-	unsigned long src_pfns = 0;
-	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
+	unsigned int order, nr;
 
 	/*
 	 * Normally, a device would use the page->zone_device_data to point to
 	 * the mirror but here we use it to hold the page for the simulated
 	 * device memory and that page holds the pointer to the mirror.
 	 */
-	rpage = vmf->page->zone_device_data;
+	rpage = folio_zone_device_data(page_folio(vmf->page));
 	dmirror = rpage->zone_device_data;
 
 	/* FIXME demonstrate how we can adjust migrate range */
+	order = folio_order(page_folio(vmf->page));
+	nr = 1 << order;
+
+	/*
+	 * Consider a per-cpu cache of src and dst pfns, but with
+	 * large number of cpus that might not scale well.
+	 */
+	args.start = ALIGN_DOWN(vmf->address, (PAGE_SIZE << order));
 	args.vma = vmf->vma;
-	args.start = vmf->address;
-	args.end = args.start + PAGE_SIZE;
-	args.src = &src_pfns;
-	args.dst = &dst_pfns;
+	args.end = args.start + (PAGE_SIZE << order);
+
+	nr = (args.end - args.start) >> PAGE_SHIFT;
+	args.src = kcalloc(nr, sizeof(unsigned long), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(unsigned long), GFP_KERNEL);
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
 	args.fault_page = vmf->page;
 
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
 
 	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
-		return ret;
+		goto err;
 	migrate_vma_pages(&args);
 	/*
 	 * No device finalize step is needed since
@@ -1435,7 +1648,10 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	 * invalidated the device page table.
 	 */
 	migrate_vma_finalize(&args);
-	return 0;
+err:
+	kfree(args.src);
+	kfree(args.dst);
+	return ret;
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
@@ -1466,7 +1682,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 		return ret;
 
 	/* Build a list of free ZONE_DEVICE struct pages */
-	return dmirror_allocate_chunk(mdevice, NULL);
+	return dmirror_allocate_chunk(mdevice, NULL, false);
 }
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
-- 
2.51.0

