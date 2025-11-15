Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290A3C5FE64
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 03:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106A810E0CC;
	Sat, 15 Nov 2025 02:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ltwwb4We";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C3610EB66
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 02:32:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3Wl1bGYdzg8hBtmHipKZTE0BeujBfqcaN1B3mlfL4X3iSDBHr2VYMjKkdy+R+T8Cr7iOB6vSTHsfD/FsNuZqT325HvQ8YPYzi7e0MIr4+GOZ8UdLMjoxlcZwWcZVXXNHeJ02aloroMbM7phj/pysDE4jvyRkO17FIn7NgPZmBg9d0CgFwXZT0TRozGnxG0HBQ5v5GfdLm7fYVs2MEY4NKg1+ZVe47siNZBqeH6tvXFbUT6qNxHII6JeDg/XnJf1Gzq87ktCbbQNq9pzvRwNYJ/+lXQrseg+YZbLMW9LFYER0vM/oSKrpH8/W0QtKw7ISfMVG9CHvqgOEV7B35vG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Q6PE1gpfcYMGrS9+52BaEsIXMogt6o6aT5XF+Ucp1Q=;
 b=SQQXkC4uTSFhWzx3wJ5rqTBBvg01t+2uiJvC5l/K2GDyDw4NQLy7YYTogLr+ntuZLqsKsTNCldwZGGPSQgZd8hYTuiVc7181kKzAcGolvtygmhCR7E/CGNUqcjxbxItpIaggR/5FEnkF35uLhcj+TVYLYg8yYaMDUCe0R1uqqtNN09DT6+aonez27SIIOtfp78Y3sSAz3xJC6ZfzLEGgriDwXZhU0tLKqSJHK82l5ujh0IyPN5LBBBvqk3dZh/ZVBLU4DroMw3s7f59cLCS+HAV1iQ1IHtxJ0EwxvPTCTDiMIWsgAIEOtOQn5b0e7aMlVYlSkcL8U/fADA14GZY9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Q6PE1gpfcYMGrS9+52BaEsIXMogt6o6aT5XF+Ucp1Q=;
 b=Ltwwb4WeaVqyoutdvy1rYl9DOee72W/1kCeEd6kQ4RjhjJIWdkcS3GBNdLXSW4hVM1Dk1P8Oa/Fc/D6hIDO26nvNOuZiFzVdCRk1MjeoMqyA7mUFRYWtTleEaotJrFDC08f2kfz/Cu5EZ6hIbRREkJV2rKWQtxruE5WQfo2cRJxugAF/4lZHR7jvW1rjETPxfonrR1VnbyW0ZfppjWeRRwbkBY6hqruRSJdvIHZ5RGAQCRdhsIn9YOxnc5sr8jzXsjYzi2O+xC37aqHHWlT7jXJHuXA6VVem/C2cXIXJLscxi3e4J27mIsbV4ME1QxszA4/I3eluMpuxJR+AOA6wzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 02:32:08 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 02:32:08 +0000
Message-ID: <e1f3074b-c4d4-47e3-9303-18ba254e3662@nvidia.com>
Date: Sat, 15 Nov 2025 13:32:00 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup: mm/rmap: extend rmap and migration support
 device-private entries
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251115002835.3515194-1-balbirs@nvidia.com>
 <20251114165146.5c51eeeee200bd37b378bd45@linux-foundation.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251114165146.5c51eeeee200bd37b378bd45@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ac5485-f689-44f3-6297-08de23ef2c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGZiODZBQkd0b1NVaWNrVk1uTGVlN0lsOGw2NVJQampuRy9uVlV5bE5lNTNa?=
 =?utf-8?B?c3pVWktBek1MWC9yTk1pQ1RqWUVCbWpWOGJaTlZBQ1U5V01pUFhhOEV4b1lE?=
 =?utf-8?B?ZVZxOEFEUkZNeWdsZ1A2aE5VUnkxYUIxM2ZvQkZGR1hha25JdEg3aTZmZVhW?=
 =?utf-8?B?R2hrWWVnRlZVZDVpYWZPWGsybTFxTVp2bDIyNDdib3pEVzVrOExGMTVEOTBo?=
 =?utf-8?B?c0Frd0JiY2dETVhoUFAvY0R1WGtOWXB4alZHSHVTY1hMK2gxK1Ryc2ZxV0lK?=
 =?utf-8?B?YWlxMDJ5cGp0UmZIc1J0WW9oalEwdEVyU1RVeGc4K0hjRkNZekFQVVRrL3A3?=
 =?utf-8?B?YkhaYXpKc3NWM051VjVWaXpGR3UrOEZqMXRpY3NTcHdIZWdTQWc4RGRxWlox?=
 =?utf-8?B?MTdTSjJYV094YU4wRlRvVDVzUFhsUTNXL2M1ODBzRmF3SjJJNHBoNlNybFRO?=
 =?utf-8?B?eis1anhmU3A0bVlrdHFwUGFsVENXbGhjN0ZaVldXZVpKa2IrMzF1TDVKa2Rh?=
 =?utf-8?B?c3NCcFl5ckVzVlRoRFpZakpKLzhkdXRSVytJbUQ4di80Ni9lZTIzWXphekx1?=
 =?utf-8?B?SnJlOTAxNFBEM1EzTC9qOVdnMndDK1FDL3QzbjJFRmdDOXBQbWk5NXFXRVNl?=
 =?utf-8?B?RlVUYy80OHFRYkRidVBBaldHTWhiZ0UrUFl0UHRvMHZISisyVG1iUWs5ZDJI?=
 =?utf-8?B?dXdHaGg3MFgvRWJBVU5uL3dkRFZXZTZmaXhGUzVhOE1VSWlFVHhTNVBzRUVY?=
 =?utf-8?B?em41TC9sYU1ZUGRYZ2xRRVBMWUpXcFRKU0tCd3IrVVJXRlBLeU9nTXBUSEFF?=
 =?utf-8?B?bUtCMjNZbHZ0Ky9DVTdudTdONjNRME1XcFJGVHhicUZDY3dhaE9rWUx2QkpN?=
 =?utf-8?B?T0FtMyttNm9saVYraklFNmFPbk5DbGY4RFhrQ0F3cys5SzMwcGpIODBaZStQ?=
 =?utf-8?B?QkVZTjNReWZuZ0UxU1o0Uit6SFh1bjBmeDVqL3pybVE0TUtLTThQeUZrTWY4?=
 =?utf-8?B?dW9EbGl5Mzh1U05jMlZGYTFSTGo5UkFXVktNWHhUNXkzOXRENkYyM1BsNnZH?=
 =?utf-8?B?RFAxbmlselFEU1J2bU5FQThESkhldUw1bVhwRTVLU1AwUUJ1WFNESDN6U1F3?=
 =?utf-8?B?VXRGcDhmalg3VDIvRzBJQWpCbFRDZ3F3VS9YMlhaUFpmVmZwRnhuN3FnaGpm?=
 =?utf-8?B?NGhMdTQzSTNJaUdzTDBCUWFycUdjcGRpOTJVNkZpS1d5YUFyZkFpUFFHYzcv?=
 =?utf-8?B?SW1WeTF4T29zU0JWamRLUDYweklwU3IwM0VwY1BzdzRxTFdacDgveVVNMm8r?=
 =?utf-8?B?d1pTdVllZVB3TFI1TDhreWFXS25ScUJ2dEpjaWVDclNvOEN4NkVqTUVHdlRP?=
 =?utf-8?B?NGl4eEViRHFJTEE2WDFMdllPNER6TWIzbVRKZHNCNFEzbVFLRGRGNjdPcmQy?=
 =?utf-8?B?SUFlSVRuY05zdzdPMFpsSkR3djJQUnlZMG5xV2djeklzTUVqeXg4V3V4NFYv?=
 =?utf-8?B?eUgyb3NyMjlyYkdONVFXNVFLTHk3dm1EUUZIMk9ieDVNOGFrTVQrUG04VVQz?=
 =?utf-8?B?YmhQUWN4eTBSU0tKTDQrMGhaWjlNWWVBY0JHYStQRmtGR2wvQXhlWFExL0or?=
 =?utf-8?B?bURvTGJtOHVRN2E5QldoVTdxYXNZRWJ6VWswL09uN2Y5VFQzOWJXWVllY21Y?=
 =?utf-8?B?NC84SkN4T3dKY3pWNzdEak9vV0gybWRuT2RkTks0dXNEdWVHMEk0alU2MXZo?=
 =?utf-8?B?TEdoNmVHUjA5czN3U2gvSjJWRmkrVnlWM0VGYkZ2UVNtbzlHTUlEWDh3c3Rn?=
 =?utf-8?B?VXlIc0JXSzV1MnNhb01EMmxHMGNNc2RGSXhJME80Zk13ZCsvdm8xdzhyalJE?=
 =?utf-8?B?SWY5REE0bnFsYVUrU0R2dEFKb0NxMVp3R3lPWFhDbGZoQnd2SnZlZUdkSWFn?=
 =?utf-8?Q?GJcQygFeGmBwHYM1Z/oNn7B7lOqHbDpe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJGWnNMbHNNR0NBbHZvSGVMWThOYlFKa2VjRXJjT3NXNVVlZlFsOTFhNmNY?=
 =?utf-8?B?NVkydEcvN05NMlZpdjZwQUhoRlZRSnI5d3RkcmJwTTBLRzk5SjUvbW92UER6?=
 =?utf-8?B?S3F1MkZSMlRnaGxmRWhxTDNKU05qQmJGYW94WEIwcldidXhHMTNoWUtJQjhv?=
 =?utf-8?B?SERpRm5LRTN3NXo4QjNXK0N6VThBWG5wTjR1RStYTDg4b1BJRUEyRFNlWUI1?=
 =?utf-8?B?RFRCR3ZYRmNYeWUwNWhIM3V1TVZXTXRWSnRvSSsvbGJCdUZmL2I3TStHOEtU?=
 =?utf-8?B?ZDdxdWE1SzB3alA3Zkt2a1FmcDRobjBhemRXZzRWUlJ0dEtWQXR3ZFpySkNi?=
 =?utf-8?B?MzdQRTdKVlloeEhwUUZXcUl2UjBRZWExOW5uR0U4Qm14YVc5YUpjNy9jU0lv?=
 =?utf-8?B?R0s0Y1dVTUpHVllmOHIvTGtKUUJ3TUx1aTlRSUlpbnZmWm9JVWRyM3l0bENo?=
 =?utf-8?B?RWhiYWRDeVNHZ1ZqUnJycFZzQk44M2tBYVVzUFVNWUF2OXlUS2E2VEVLUURk?=
 =?utf-8?B?enpUQVRXcHJCMHlIalJqWWt0MExzRjRaaUZpY0RFV2ZUaXVSWHRLSTBmRGtJ?=
 =?utf-8?B?S3JjalpaSFI2bFEycEQrQTZoNUJkaFhCYXNJVnNWL2hLQ0R3RzRzTTN4TXc2?=
 =?utf-8?B?VTRqQzVneGMvZEdJMm52MThSZ2xHa0V5ZlpQNlovdVA3YmhjMGQvUm1ML3k5?=
 =?utf-8?B?bVNtSVFZSjBxMG5NRkx5MktxMFdRREl1RFI0ZG5HczZZZHR1YzVycVJ3clRM?=
 =?utf-8?B?M3dYR3BzRjRlRkRzTlZseHpaVkdVTVFacXl0NVBoTU51a1QvcXBKWW1laksz?=
 =?utf-8?B?WnM0akNzUTA4WFlyYmFFVlRhSHlHL3ByWEFDRWE2T1JzeFFiNHJwQkQvdm5M?=
 =?utf-8?B?NVpUNE8wa2UwNFdJMjl1eHp1bkNIVGFxQitlNXp6QlFhWlhXTUtFMTltUnp1?=
 =?utf-8?B?b3FZWkUwRHhzZjVPdHY3VmdYY1BrVU1hSDc1QmdtK2VCaXdiWlJYUk1Sd1cz?=
 =?utf-8?B?b0pORjhFWjdHVml4d0dJWm5acHJzTGZvQk5ucjBxWkdNeDFobW8yK1cxcW1y?=
 =?utf-8?B?MVhzKzBsR05rd3I5YW4zc0FmZ2dMTzNYK1ZxRXBKVFBwN2hZdk9FV29WZ29m?=
 =?utf-8?B?MlpWQkFFdElQTWRqdDlPUzFCMXhUeHpneDNKUzdVc3Fwd2MvaXNNcUE4UXVT?=
 =?utf-8?B?QmowdzZHUjlTSXgvRCtvTER0MUpjSXBUWWRzZ0dxUXZScHRScFZLZXV4Yy9t?=
 =?utf-8?B?VFhxRHArdW9qYVFRVHRCVW9hOXVvSXBjblNhU3dsRTF3S1lDVjBRdFIvNEhP?=
 =?utf-8?B?bHAzRE5CaGNRN3A2RWt6Z0FVRzdKTjZUMEs2MG9ha3lyRU9nR0swamtwWEZh?=
 =?utf-8?B?dDN3UlhsUTUzSHYzaHlsa2lEdmlkNUpEL1dldU5IWFRoZTJZVFVzZXR6WDdz?=
 =?utf-8?B?RVU1eGVodEVWV2oyVWhFS1l3Q1h0dDVMTnl6UlNrbWZDMmhZS1pHY2dQd2RT?=
 =?utf-8?B?My9XUjBIclE0M2RYQVFDakluK1o4bks0SzJ5c2xGT05Ia20vNk9iNzFzcDZy?=
 =?utf-8?B?RWtHalRvc3JNU05oSmVpV2tOaDhteE5ETmh1ZnVwekxCZS84blE2K2YwaWM3?=
 =?utf-8?B?ckRhR2JjTlFRRmsrSGlUK1NSbU9HOG94c0R0SlNzdjhsblVVQlJONlkvaHNx?=
 =?utf-8?B?K3drYTl5VENoWk5LOUVaZGdja3lqWE9vVGpMMlhIbDV6eE5Ic1NhZ3QybUFP?=
 =?utf-8?B?K0V2TEFlUDNBc0U3eW9iajhPRHFGWkp0MFgzTTEzcXk1VG1uaDJMdGhUcnJa?=
 =?utf-8?B?cFhKOWZSNldFOUxnYUZnYTBVTndZOGNyU0gzM2YwWnhEYjlyb0FaUmZFeERF?=
 =?utf-8?B?b3NJRk1sUXJIL0FweUk0NWV1MW9VU3VPaE54djYyRy9Hck5HUUpkTHRUTk1R?=
 =?utf-8?B?YVk2MFdtdTFtcWRqSDlZV2JaUU5JOWF4ZUx2T01XUDJSVFl6RjBtN1RsSm1V?=
 =?utf-8?B?eVp0UmJuV3hpd0dwclFvbG03ZTVwLzc5NkYrenNuVnF1cHE1eUl2am4zTGM4?=
 =?utf-8?B?WXpWRGpQQnJuVDJ3U1lvbTZlYzVEV2lRc0hwSXBsaytQTkZvVlVsdU9ZTWNs?=
 =?utf-8?B?b2djRTUyNzA2d1pCYTFNMzA5eXBFdHhkeEVlRmhCaUhwcFY3OGRBczBmVE1V?=
 =?utf-8?Q?fMbCJlwPtXA05T0a4TK13nAZuBeSAyBTx8F0cqxA+DJL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ac5485-f689-44f3-6297-08de23ef2c19
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 02:32:07.9380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oID5p6czTOHkzcNCQCwmtuh8/Jlow0JaAm0+XkcVjVvoQAKqHtfE7/dm012MEJ6M2RnkJBC9fK73UP2aDUlWaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256
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

On 11/15/25 11:51, Andrew Morton wrote:
> On Sat, 15 Nov 2025 11:28:35 +1100 Balbir Singh <balbirs@nvidia.com> wrote:
> 
>> Follow the pattern used in remove_migration_pte() in
>> remove_migration_pmd(). Process the migration entries and if the entry
>> type is device private, override the pmde with a device private entry
>> and set the soft dirty and uffd_wp bits with the pmd_swp_mksoft_dirty
>> and pmd_swp_mkuffd_wp
>>
>> ...
>>
>> This fixup should be squashed into the patch "mm/rmap: extend rmap and
>> migration support" of mm/mm-unstable
>>
> 
> OK.  After fixing up
> mm-replace-pmd_to_swp_entry-with-softleaf_from_pmd.patch, mm.git's
> mm/huge_memory.c has the below.  Please double-check.
> 
> 
> void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
> {
> 	struct folio *folio = page_folio(new);
> 	struct vm_area_struct *vma = pvmw->vma;
> 	struct mm_struct *mm = vma->vm_mm;
> 	unsigned long address = pvmw->address;
> 	unsigned long haddr = address & HPAGE_PMD_MASK;
> 	pmd_t pmde;
> 	softleaf_t entry;
> 
> 	if (!(pvmw->pmd && !pvmw->pte))
> 		return;
> 
> 	entry = softleaf_from_pmd(*pvmw->pmd);
> 	folio_get(folio);
> 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
> 
> 	if (pmd_swp_soft_dirty(*pvmw->pmd))
> 		pmde = pmd_mksoft_dirty(pmde);
> 	if (softleaf_is_migration_write(entry))
> 		pmde = pmd_mkwrite(pmde, vma);
> 	if (pmd_swp_uffd_wp(*pvmw->pmd))
> 		pmde = pmd_mkuffd_wp(pmde);
> 	if (!softleaf_is_migration_young(entry))
> 		pmde = pmd_mkold(pmde);
> 	/* NOTE: this may contain setting soft-dirty on some archs */
> 	if (folio_test_dirty(folio) && softleaf_is_migration_dirty(entry))
> 		pmde = pmd_mkdirty(pmde);
> 
> 	if (folio_is_device_private(folio)) {
> 		swp_entry_t entry;
> 
> 		if (pmd_write(pmde))
> 			entry = make_writable_device_private_entry(
> 							page_to_pfn(new));
> 		else
> 			entry = make_readable_device_private_entry(
> 							page_to_pfn(new));
> 		pmde = swp_entry_to_pmd(entry);
> 
> 		if (pmd_swp_soft_dirty(*pvmw->pmd))
> 			pmde = pmd_swp_mksoft_dirty(pmde);
> 		if (pmd_swp_uffd_wp(*pvmw->pmd))
> 			pmde = pmd_swp_mkuffd_wp(pmde);
> 	}
> 
> 	if (folio_test_anon(folio)) {
> 		rmap_t rmap_flags = RMAP_NONE;
> 
> 		if (!softleaf_is_migration_read(entry))
> 			rmap_flags |= RMAP_EXCLUSIVE;
> 
> 		folio_add_anon_rmap_pmd(folio, new, vma, haddr, rmap_flags);
> 	} else {
> 		folio_add_file_rmap_pmd(folio, new, vma);
> 	}
> 	VM_BUG_ON(pmd_write(pmde) && folio_test_anon(folio) && !PageAnonExclusive(new));
> 	set_pmd_at(mm, haddr, pvmw->pmd, pmde);
> 
> 	/* No need to invalidate - it was non-present before */
> 	update_mmu_cache_pmd(vma, address, pvmw->pmd);
> 	trace_remove_migration_pmd(address, pmd_val(pmde));
> }


Thanks, Andrew! Looks good!

Balbir
