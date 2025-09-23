Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02994B94226
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 05:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB8410E547;
	Tue, 23 Sep 2025 03:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sb+6MUxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB5E10E547
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agyUixGi6xyWiOckHzRBhQD8bqjjjPyXrHahBaj4TQ0bleYJ55I3f3YQR0kzZbkKbDyNdImYgGRYghDUl2ihfHrr94O4FMDSYb4qWe1wbPJ17s7u6x5Dyatai2MUooT7alev2ZTJeAVrXHwyoni8uxj51+DKAPn2q79DcHIQQYAX5eDe0ML/0BZGT7NBYg0f5GdfiOAxMWgOPhe7tULvaxsV+GfHlWLPblH/TDr/XTNNAg4tkyix1rzvaJF1hYUGhPPAmmZ2YTsW4euxotvt8WR5En+5EQuhvMlGFkIHj7/PGeAPRPtwCcPb/+kjP3fd62RP/NiAWHTL/ZPvqWPdnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR7jIqD4jmO6rzbeyVrDRHwnuS4Iytv1vIvMkosekeg=;
 b=yfVxZDC0kSHm9EYgOhitL5jbpM4SUPWO1/czLS2KiRPpsapHhBpSac/J/hr3UpL7oHWU8bAjOcgmU9pOQUbFcbzfJ0r5712CN7mA/u+D4nI0yfUjSUUK0kFARkAblWn+hGAMuIBVZPXVJ27cA1PXe6B4eotPx1qNiG5ys6crFzOZq5WScqVsKOgyG3Z4hl7siiPmtdL7iJkMlTXIp5fmjk0ubc6souSyc+P0wZr2CEGDAnc4WmHw8xN2NMbIuB6iZkE2Hm3td5+qoN0ul4pH8heLomZAQ6IILDc296DMy94dVoxbk2PyWV//bTuH+u5Bqipbbj7Jjss37X66blAc8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR7jIqD4jmO6rzbeyVrDRHwnuS4Iytv1vIvMkosekeg=;
 b=sb+6MUxlES520omzldlW11KcJlMlwCn+z25zj+jw7doLl36kbJHelxy3Kim8gJnUzi29w03mkvvQalPLUuzFyClb+gDvUUDh0F4QsymmhvX1IW45mucfXJyZMeS4lp4wyFC1i7TZsKaC+TAA5ekD8y9335uLaVC/XrJi7O3tw3copF10pEVLNF25ytrO++REFOVCBjDFBD/FvGH7XyGd0+CGup4Eyt46P9JVb6ObBq4HOk7Qvm6Oa8CPu4Arl2SaN6Xc8gO6cZhrEf/v6QEcuWioEzBfYbO71mJUuV1y58NTcRwQkIrUJdhUWuJJeTB463SsuOQzh9HI9urVMoc/GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 03:44:27 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 03:44:27 +0000
Message-ID: <62fb7aca-cd30-4058-bfd1-d08f78d5c38d@nvidia.com>
Date: Tue, 23 Sep 2025 13:44:20 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 05/15] mm/migrate_device: handle partially mapped folios
 during collection
To: Zi Yan <ziy@nvidia.com>
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
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-6-balbirs@nvidia.com>
 <3FE3F2B9-86F9-4EED-863A-093FE3959B1A@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <3FE3F2B9-86F9-4EED-863A-093FE3959B1A@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ed24cf-b977-4703-3367-08ddfa537ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NC9LdWFRa2Y5am16TkhVbmtzNUJzc1dMeVpBR0RtUWFiRXBQdXFUS0JjcjN0?=
 =?utf-8?B?eHFOSDBkTy94QVZZbWpSdkZKd3Q2RzRoR0NBNmhXdEdkV01aeERSMXk5ajNC?=
 =?utf-8?B?c3ZQektZeUlKU2EvT29zYlhVdzc4OXVxVmpGbE9lMm9QWW5nblNhaXFEOFhY?=
 =?utf-8?B?Y2VQTzU5Y1QxeU1NZDJ1QzBYTXE2cXhoL1BvVGxDTHh1cXF0Q01qUzNtK2JX?=
 =?utf-8?B?N1lSczZuaUFOTVJLQWpwSVVZRzhBOC9sSm9aeVRTSGhXeExoRXJkYm5GbElB?=
 =?utf-8?B?ZStwQS9tVmdNWVEyTDF2SzlQM3VDOXU1TXdTa2RqbG1OcUU4WXFDY2w4cWI2?=
 =?utf-8?B?SGc0UWJzRVNkY0MxVDdGaVJBSzU2SmpMTDMwVGlCdTBtOWdnL205Tmc5aVE0?=
 =?utf-8?B?ZTM4ZHlua1BZS2IyK1d0UEFDcEFyY3hRMzlkRWg4L3krMXQvWmtNOWZPcFp0?=
 =?utf-8?B?MWpCcVpyVDA5Q3lDQWI0MWJzNWJLQlhKQlR2Y0ZZakJVYXU0NDNNTGlWaFpu?=
 =?utf-8?B?VUh5NTRLZ2piYzlWcnN4L3lxTFdkQ3JDQzkzM05ybXk5UitsNjV6TG9kMU5F?=
 =?utf-8?B?ajVvZXJPS3pPbzMzelBManErVDVkVmNNRm8xNXBoQjExOE52a04wZXFNS0Fn?=
 =?utf-8?B?NFlVSHo3SWltRzg4QkdXTkg2V1o5UXZoOVcxNVBPMjRyVGxlNmNtRm1SZXow?=
 =?utf-8?B?WWlGOGwvalZ1WHcyaGFoOE5GSmlGOE9MZ1p6bDN4dWxua2Y4Zy9OV3d4T0JF?=
 =?utf-8?B?RmZkM2dTNEszYjZWaHBWRWVoQnJyWWhRTzdsWG4rQ1hGQVZ0RTJMOUlSMFkx?=
 =?utf-8?B?OU4ya2Uwb3NnUXRTald1eDRYdUNIV1c5TUIzL292WGpCZWZvTEYvb2cwVVV6?=
 =?utf-8?B?amdJbFNPTlBCMFdOUUwwendTZXVVSGE4RE1IUUs5NjhnNWw3ZDJqZnBYM2FI?=
 =?utf-8?B?YmpPTjE0Vm9GajZsVVRMOVhrTkIyQmM5UEZDNGo4c2tmZzdZdTFJbjFFaFY1?=
 =?utf-8?B?Yk4xeFJGM3BlNFVnTHhTc0FaMmdNZU5aeEorTlBldVIxWnNqMWwvQXVOdEVh?=
 =?utf-8?B?b1VKend1TEticHpIcEh1eVZ6dnZqQnJ3dGpDSXA2aVJDeVJIOWx0M050K0t4?=
 =?utf-8?B?WG9JL2ovbG5mbUFlQTY2VGhDc1FUWVhBandIYXhmd1RicXZSUzZBaWphMzlW?=
 =?utf-8?B?NnZwL3pHQ2Fzd3lHM0JZTklON3pCRDJHVSs3MXJzNzhKV2UrZGRJMnRaaVdh?=
 =?utf-8?B?ZDFteWcvOVFZMzhqK210bDdHV1hycThEd3czVmpOV1NJRzZDSUxOc0lPWHZL?=
 =?utf-8?B?OEY4ZHF0bElhdWpqclZFWWlQbGZpOHBQM1N1N0o2R0FFUnNKeHRzejEyV201?=
 =?utf-8?B?RDFZb1lEMXQ0OXFWYytpdnY0MFFWMktmQmo0OXN0R2YrVzNPWTdHcUNMK2tv?=
 =?utf-8?B?RExRK0tidWhZSElIaXFJWEp0Z2tqaThZdk5GZzJYTjZ0Z1JiSThaZHo1RWpo?=
 =?utf-8?B?OWROOEdGTTA5WE9uZzAvTGhvc1F4N2lmbzI5ZUdzdlFScXJ6aG1vR1liU05D?=
 =?utf-8?B?VDMwcWxFcXo5Yyt4T3ZCYTJIdDZxb0k3UzFNNGRRcjk5MGxEV2xXZ3BteTlt?=
 =?utf-8?B?QlErdDVRM1RvUFhkUmlTbGczT0hxVkJ0UmVLRDBITjhuRjhTeGtETm1rd292?=
 =?utf-8?B?d1FtRDgxTytabC9pM1FOVlRaT3E4c1JQdFF1ZVJIYkhpbFdTbkxYZC9vZjB3?=
 =?utf-8?B?c0hlRVBUbzhvbjliaWh0RzR1cFd1TGVSekg1ZytwR0pqcHk2VWs1cE5oTVVl?=
 =?utf-8?B?WC8rbFRhWHVLYVJaMTJuZ3NlQzlkYmxuTGpDdDNZYkNvS0FOTzFkaDBvTlk5?=
 =?utf-8?B?VGFxWUcyejNlSmk5QVVTUTdkT01UdDR5YTI1RmZoZlJzbXl4cVc3ZmhUUTVO?=
 =?utf-8?Q?lsxv94VtmDc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3BzblZEcHBITTBhcmRMd0dEcnlXaTNZMk5GM044VnRWcHcwVnFVcStVUFZT?=
 =?utf-8?B?c0dZblZvZ3c5NHE3ZyttQk5KdnlTQmd4TUlmL0E1c3JnU3pLTXdaYWdsajVG?=
 =?utf-8?B?VUhTREJSNkJXdUMvMUZkTnNDK3kvaVZvbmFZV2FoTDJqZFZBb3piekNOSVVC?=
 =?utf-8?B?NEEzRnMzODY4M08xUWxBTXBnUU9SbkxkbzZwRUhseVI5b3VwZEFuaVhNcGVW?=
 =?utf-8?B?RWQ2aVZPazVsQ3MzbXkybVgwU0FZb1dXdThPMXVpdHNDb2EwamdxRUJVSnYz?=
 =?utf-8?B?ZjlNRTlXSjk4N2pFc2ZnbE5ncEF1ZFNhaHBaMkp0YXZOOGRMMG13TEg5d2Nl?=
 =?utf-8?B?Q1NoZmJSWEpsQnJuZ0VlcFBIRGNNelhGc2lwYUFEcXFFemZIV1J6MzZ2RnVU?=
 =?utf-8?B?YVU1c0FpdmF6dFNmMEhFMjkxY0ZsZjFlQXBEMzFVMitvQk5Cb1ZYRWFpY094?=
 =?utf-8?B?c2d1N0dxaGNlRnVPcnkzTmUxdEVoMks1TmtoTTB2dkp0VXpVeWgyUWZFb0Zi?=
 =?utf-8?B?ODZBUGtJdUNoY29jdWtMQ3QwTmdEcERGaGFqblAraitQV1NYdzJUME84K2Vz?=
 =?utf-8?B?cFlYdWdsemkvUGtkRGJyK2FDTlJ4dEVlRjR6QzhwWnN0YmtuRTAxSkcvWlo3?=
 =?utf-8?B?dEtBdFpMMHEwNHVBYy9IRlRBSWliREM5NWFiaTZZMTdnSm5MRU51a2VoQXd3?=
 =?utf-8?B?N2RPVUhQV2lmcHNOWWVrU1hQbDd1c2IvazJJZE1UUVpOWVFZcXdnUUtSYlBt?=
 =?utf-8?B?dnlWbzlBejJjMmNvMU04T3NUQ3IyRGgrMXJjMnNnS1BjZ21wbGxnN21pOE9T?=
 =?utf-8?B?aEttTm9Xc2hHUGNCMTFwT3J1U21zR1BtYThvSHdNZ2tzMktWN1BvL2ZIMHhK?=
 =?utf-8?B?ckxwS1VPZEVqL3YvRXZ4WmkrS3JUVFUzS0I5UzlDZTVkQXRZQk0yQjBvQ2Rk?=
 =?utf-8?B?RDAzQmg5TWNqaXMxWDY2dVQ2eEJVdmpnaEMzV1V2MmtuM0pYUTIwU2xKN0xl?=
 =?utf-8?B?c3NvNEM0aFFtVU1kdnlFZHUydDNoWEFrVUFRU2F4eVV4eFQ0dVpzUm1RSnM1?=
 =?utf-8?B?bGlTK0VuV0tsRXVhSU11WUVFQm12dFRnVDZqRS9kVElvamFlUXZhc1N1T1VO?=
 =?utf-8?B?VEg2TlkrZzArRkV5NHgxSmRTTzRmcE9vMitjbEJ3cnMzMG1rckR0NDZYWlZn?=
 =?utf-8?B?aWE0WXgxWEUxWW41NFQyYVVYL0hwYjF0d1NTYURWakR5WkhUSUFSUHM4V3FU?=
 =?utf-8?B?TS9XUkJlYVNXVU5aRWRlaFo3d0VRdlVsS2p3TE15MTcvK0FXY3hDMkJ4aFVR?=
 =?utf-8?B?ZWYrWGpHQnpFeHM2YTZEWjQ3Q0NPdC9RdlpIYWdJM3REQnZidkwwZytYaXVR?=
 =?utf-8?B?a0V6ays2OG1tb21DUjVpQmpuWVJjbGkzc05wVUovck1LSHE4enR5dWNRMXhI?=
 =?utf-8?B?RzY2RzRXU3BneklKZHlJcGRDcXg3ZXNydFhCTWd5Y2JqT0oveGZaTTFzSzRP?=
 =?utf-8?B?R0VhalNUZHNaZjNTWTkwYVZmZDc0OWh3a0w1R0pGSkJDMlZUYzg5WGVkenhs?=
 =?utf-8?B?L0ZoU3pxOGxYNnVwMnUzRWYzM0lKazNLd1VvVGhuQm1GazBxZFAwM3hVYVJB?=
 =?utf-8?B?Ym5QUlVPenVjOGJ3ZHZRSS9EL1Blck9jT3Z6WndvcXE0MUE0RTJIVWxqQVVB?=
 =?utf-8?B?a1g1TjJpa0FHbklZWGNESHJvaXhDeHN3UTh1NzcvNktNVG9VRVhncU8vVHNs?=
 =?utf-8?B?VGl4Q3hvVFJ1RlNTbXVVS2YzYlhYUnVaeEhlT0lRTFM5ZTc5bW54dFBRTER5?=
 =?utf-8?B?RUsyM0t0azhlNkQ1LzdlZ0JMUEhvSEhnUjJuVnpEbHRTZkhJUmI1dzl6ajJD?=
 =?utf-8?B?bXhsdGk5dnkxUVVmUUJvM0x0WDd1YkVGKzB2WjBxcEhxeUFpbS9wc1M2Lytq?=
 =?utf-8?B?bjhsMzgyVlNtTitSZmlweTB3NzRRSHhndDNob3ZialEzMFZXWDYrQ2R5V0ta?=
 =?utf-8?B?ZFNwWm5hbXBiV21xaTNKY0ZKWlJDaHgrUS9pNkZoTkh3NEl5aS9lamlKbDB1?=
 =?utf-8?B?RTZiSkNVNUZoLzFIcFBqQVlaL3M4Yi9hSVM2amI5bGY3L1kxb2lVMDhmWUFM?=
 =?utf-8?B?S3VuQzZDQWxjSDBpL2JxNjBzOXBudFJ4TmRRK0oxU0hlcGtHOHFMc0pzaDJu?=
 =?utf-8?Q?Ty9jDrsK7WwNUsUHV7mVKjnSXlKaU+EwwlWTOnFhoK1U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ed24cf-b977-4703-3367-08ddfa537ee2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 03:44:27.5739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyBEX9UEGZAGPPNuMnM4Dr/9wSCuC2qwU6a0Kymgwk2hd08NF/rz2WuSWUIthjdQri1ucvtovXuCIekqr0aSdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
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

On 9/23/25 12:23, Zi Yan wrote:
> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> 
>> Extend migrate_vma_collect_pmd() to handle partially mapped large folios
>> that require splitting before migration can proceed.
>>
>> During PTE walk in the collection phase, if a large folio is only
>> partially mapped in the migration range, it must be split to ensure the
>> folio is correctly migrated.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> ---
>>  mm/migrate_device.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 82 insertions(+)
>>
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index abd9f6850db6..70c0601f70ea 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
>>  	return 0;
>>  }
>>
>> +/**
>> + * migrate_vma_split_folio() - Helper function to split a THP folio
>> + * @folio: the folio to split
>> + * @fault_page: struct page associated with the fault if any
>> + *
>> + * Returns 0 on success
>> + */
>> +static int migrate_vma_split_folio(struct folio *folio,
>> +				   struct page *fault_page)
>> +{
>> +	int ret;
>> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
>> +	struct folio *new_fault_folio = NULL;
>> +
>> +	if (folio != fault_folio) {
>> +		folio_get(folio);
>> +		folio_lock(folio);
>> +	}
>> +
>> +	ret = split_folio(folio);
>> +	if (ret) {
>> +		if (folio != fault_folio) {
>> +			folio_unlock(folio);
>> +			folio_put(folio);
>> +		}
>> +		return ret;
>> +	}
>> +
>> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
>> +
>> +	/*
>> +	 * Ensure the lock is held on the correct
>> +	 * folio after the split
>> +	 */
>> +	if (!new_fault_folio) {
>> +		folio_unlock(folio);
>> +		folio_put(folio);
>> +	} else if (folio != new_fault_folio) {
>> +		folio_get(new_fault_folio);
>> +		folio_lock(new_fault_folio);
>> +		folio_unlock(folio);
>> +		folio_put(folio);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  				   unsigned long start,
>>  				   unsigned long end,
>> @@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  			 * page table entry. Other special swap entries are not
>>  			 * migratable, and we ignore regular swapped page.
>>  			 */
>> +			struct folio *folio;
>> +
>>  			entry = pte_to_swp_entry(pte);
>>  			if (!is_device_private_entry(entry))
>>  				goto next;
>> @@ -147,6 +196,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  			    pgmap->owner != migrate->pgmap_owner)
>>  				goto next;
>>
>> +			folio = page_folio(page);
>> +			if (folio_test_large(folio)) {
>> +				int ret;
>> +
>> +				pte_unmap_unlock(ptep, ptl);
>> +				ret = migrate_vma_split_folio(folio,
>> +							  migrate->fault_page);
>> +
>> +				if (ret) {
>> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>> +					goto next;
>> +				}
>> +
>> +				addr = start;
>> +				goto again;
>> +			}
> 
> This does not look right to me.
> 
> The folio here is device private, but migrate_vma_split_folio()
> calls split_folio(), which cannot handle device private folios yet.
> Your change to split_folio() is in Patch 10 and should be moved
> before this patch.
> 

Patch 10 is to split the folio in the middle of migration (when we have
converted the entries to migration entries). This patch relies on the
changes in patch 4. I agree the names are confusing, I'll reword the
functions


Thanks for the review
Balbir
