Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF083D00803
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 01:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3838610E0FA;
	Thu,  8 Jan 2026 00:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qsfc2VE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010068.outbound.protection.outlook.com
 [52.101.193.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16A410E0FA;
 Thu,  8 Jan 2026 00:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmuuf0XwxuxDvT+5/t+R+6nj9D74tUqh+i3tyEVsra++NIZnZtJZk6zQNhkzx10tWXITZ4DtAiD+qGrC3sJShXVACtU26KCFvi3kpNtEg6yiFNuzvrKVajAWhJt70/mJzFZDXni/8Z0wdpULZII218IDhMplAGY/45w/Hp9X/28+bA5iCPHz1M7iHQMvEisrWjzTyhrySPfR6176EXBtI51VoU+2Y73dkNgPnUXAR+Y8K1t7XQ/f649b703kdVRgVPJVWMJ+OwxOOm0mP9zRd3fCqENfrZWDfmdirix+oGdAkIJXbbtwTxxxbcv4ozHQKrPOfbl5sDTNGpSMvjCZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3UWwxFgUgnTdyw9dWE2b5NWmPBEhaIgWHO3zBKyjxY=;
 b=xL6U1l7gqzJsYmcLHbFo+O6yTb/FLgUoJlCohIK63FvtS+GL9evCPKK6uFFOssopvHRYTOYq0NPp/KOKTi9t2aOL74Tnx1ATrQ6mtDdUQaPNrVtqTBFc2jCT9VIGPt+o3dvyTVLc3z+1FIn5FRf//2D+fNZNUtzDViNR+cMDPUSvkw/mdJ8KcMtMDFHqt/HrmZNjg5K2E5XUOgxk8J6c+69dJoYnmhA0ibD/eX4O7SDcMOJr36u2F26kT+gItOx1/CYWIligXvOrxO3foSd6TsfBgGKNl37tr72ULS12Of/o5ULRX+fKPgNUSChGKjbmj3kQuAYzMjjiyJ7hGFPkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3UWwxFgUgnTdyw9dWE2b5NWmPBEhaIgWHO3zBKyjxY=;
 b=Qsfc2VE5Fmkh5IzICCFnTSNXPqF99n4nu99FprytjzS8AEN5MhBuO9ZRnCuSlIykZ0mCclHNavecJejxW/JN+05MFx/1z76Vx1h9koJhjuCgdHDD0USYrw922tXx1GFJ0rIlsAV9m0Y1QaFAadsRtpKAcSefGxqrh6h5rACUupn/6jnnM2Bt5cCniUdwH/TLOhioR61VlcSnXQxcHl/bD5hNONYq8/eB2StZxyLii6EXWC4ls9pBr5XWI2yUH/MbQp5J9dfDNlUQ5ucd00Ha1WxdDgR8Tdbn84tQwi9U9n/3Y3Oylvy3+2NsR4vF6lhPd3W/ozzHu9oqZJCPVeBV7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 00:56:09 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 00:56:09 +0000
Message-ID: <b39d13b2-cc10-4803-b6b8-0a0447aa3349@nvidia.com>
Date: Thu, 8 Jan 2026 11:56:03 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
To: Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Matthew Wilcox <willy@infradead.org>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <F4EAA470-C922-4066-A115-13D6D055C73A@nvidia.com>
 <95BD5D5B-C8EB-4EFA-A895-CFD660504485@nvidia.com>
 <aV7NBE3NS1wdsXBo@lstrano-desk.jf.intel.com>
 <541B31AD-1472-4D32-A968-B92895CC6890@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <541B31AD-1472-4D32-A968-B92895CC6890@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH0PR12MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f3706e-cc05-4fd5-6cbc-08de4e50b5f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVJCSlNZM1pZR2J6R0RPK0VQWi9RSHRqTG12UG44WTMwMzQxNkpEb1VwSHVD?=
 =?utf-8?B?S0phMFR0Ym5LY3BKK1MzSXNsMjdHbVBaUEM5STF0YklYOXNJRzBpcGViUWlK?=
 =?utf-8?B?OG9JL2tFMU03QTBoUXZMR3RCMVNBQ3MyWmxxN2tydGNPZFBrT2Z0ZDMyckxp?=
 =?utf-8?B?WFZhNE9PWkdGeEh6NHhIOUVOU0UvM1Z6K0NCcUZ6Z3pneHd5WXJpN0E3U0Mv?=
 =?utf-8?B?aTROQnhVWXNpdWliK2VPWHB1NGlGakI0ZlQyWU0rZUZvRU1ub2hMM0tIdnM4?=
 =?utf-8?B?TG0rOWhQU0xRQUtpYnBqTWNWVnUweVl6T1JZenZIOWllNzVueUJidm93a3Fw?=
 =?utf-8?B?Nkx2dnVjS3k0bjVXcENSSU5TSmVYWElEMDhYZTRlVFd5dXBWOXNlQnBqbFlt?=
 =?utf-8?B?UlhWVm9NZVNPVS9GMzZIVGEyMVRObnY4SEVrUFdvMHNLKzNOYXlXRWxUWlZX?=
 =?utf-8?B?MTV0YzRadk1tcmpjdjkvSEU1ajF0VTRKVUQvSTBPQVFxR0VkMzZjMkJSTVlo?=
 =?utf-8?B?Yk9QY1krUWNud2drSXVKWXUzYUhpOERpcWJkdFIzdlFkTWk3K255cnQyRXdF?=
 =?utf-8?B?Ukt3Y0hHQk9UYktzb0RJaVFPYzNzSlRCMzF6a2pkZEtHWWZxWmNYbFNKYnA5?=
 =?utf-8?B?L1h3bmlVWGtEVFc3RVlwdFNHOGV2L0V6SnhKeEMyenVXZUt2RkY4ajFoVDNt?=
 =?utf-8?B?ZXNaNHQ0dVNZSFJJdlRDTitCNGJRYzc4eU1jRXVXZmhXWm9qV3J3Y0lzRTFz?=
 =?utf-8?B?UE1SbkkrRDc3dWtrazc5ZFdJUWhlZ3lvREFqOUwvbncxbDg4ZVpVUWl1M1k2?=
 =?utf-8?B?VTI4WUNkaUdoWDg1VFBkOHJPU2pHOFhHdWRPU3Q4Qzl0V29jRC9oczdYOHlx?=
 =?utf-8?B?c0NYMkUvMU1rL0JaTjRNcTBhamh0SGh6aHJxZXdoNENBRUdVSjJyUlQ0bkwr?=
 =?utf-8?B?QWUzSjF1RzlwYVYxakhSY01ROXJTSlFJQTB5UUltcnE4YTRCY0ZuZEMxdkRP?=
 =?utf-8?B?eUtFelcrMkI3RkV5SHJCK1I4Sk85RzB2eWcra2wzUEdjdXk5dktiZ3VTZlpn?=
 =?utf-8?B?d2l2bWVheFFPNXhUYzFyaTJ2YWdVMVJyaGcvWDAwQW55WEdmVGp4R2MzaHVY?=
 =?utf-8?B?WUJ4ZWxQeVJ6MEVGVllTZm5ZRm84eFQ3RGdPWkJFVVRhVzJOSG93enJnYS9I?=
 =?utf-8?B?UUx2SnpOR1lCWEpmTUE0RXpNMlVNRVE2eWhEUkxJeHQveFdRYzRPaXlPRnRW?=
 =?utf-8?B?cVFOSWFVZEREZVI0NmJNWThYRm9OM2tnOEhIV2ZZa3FlNzdIM2NBQUNwdWwv?=
 =?utf-8?B?TExTMEwxSkFreWt3Ri9lMHFQWjhSN3BIem9qQmFHZHk1R3QraVBxZDQzbUY1?=
 =?utf-8?B?OGZGb3J0NmdqcTZ1dXo5L2hBTnRRUjRZK3ZhOFArNjVjQ1JFaVZsNXk4N0gy?=
 =?utf-8?B?ZFc4L3dkUkpXd0M0Rnk0ZWRjYkN1NENrSElMZjZvdTVwRmhnNEVBclo1RE83?=
 =?utf-8?B?VXh3NExiU0N1SmF1K1h3WlB2aUhZS1pMVFVqb1JRa1lPa09hTlNUSTd5eFB2?=
 =?utf-8?B?SWc2R1pDMGhTcTFoN04ycWRERlpMcWM5VWl5K1BtSnQzck5qbm9OQWxWNzJK?=
 =?utf-8?B?NmhBcW1ZMkNVY0R4TmZHOUprUFM1aUx6WXBia0Rib0FseE52OFJma3dxQnF0?=
 =?utf-8?B?NkNRbVJRWkR4Q2hLL2RGa1ZQc1UvM2syWitwcDQ1Nk5pZ0ZJcnJHbGlXbFBL?=
 =?utf-8?B?aTFQZ3BFTklPVmhMK2k2aXBXWjlJUzYyeVZER0RsR1QrS2ZkNnQ5ZXhWVzcv?=
 =?utf-8?B?NHRPUk5JQU80Z0FrSTZka2kxaURkZXQyaHJRaFlQZmlWeHR2S0tMZ1JvZzBS?=
 =?utf-8?B?RXNsOW9aNVNjcXBMK2cxK0xBWTFhNVdCV2RabmJxckZUaEtEZ3NUVmJJVkNv?=
 =?utf-8?Q?TY0QWmuJDtVGmifRCVvyFFxOM5vo8/3Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2hqcVN0ckZlYWdvZTBFejlDYkFJVmdEZlNQOHl3UEJDQy9Zc3NXTkRxOFdM?=
 =?utf-8?B?Skh0RFNFSUVLakVsaktiV1VXck9pR2lWbU5sdy81T1phK0dSTkdsRWdEdHBR?=
 =?utf-8?B?T3ZMUms3dzQ1L2JaR2hnanVFSFQ5THRLUWpqNHJGSFlvUFY4UnExTzJ5N09I?=
 =?utf-8?B?Vjh1djlFbmlsOGVhU3lWYnhzVkoxekhEalBFc1diWFlULzBzVjB1K0gybWRT?=
 =?utf-8?B?NVdQb2lhVWZQZWg5T05iNHdjemJ4NTdvVVN6N0Zqb2hIemdxQytmVjQ4aHQ5?=
 =?utf-8?B?WkhkZ09KcklGT3NRamhpdXlXcWlBSUFtUkd0QnhZK3FDUDRQTHE5NGJUK3No?=
 =?utf-8?B?d1RnYTlpdW5YTFZHSVMvbGRDdmlQb1RGazRWMlRxUEtSdlV2ajZIdDhMYllS?=
 =?utf-8?B?MzZOWThJMXlEZGdwVHh2bTZ1amRaVVNOeVlJQzFKc2FVYjY5YVEyUnkwRHBQ?=
 =?utf-8?B?SndVd2VzV1REdjF3TkxYQ3EvS1BLR21GMFIySUU4ZW8zYzYrbk9ScFpYbTBY?=
 =?utf-8?B?NVdLN2JYTzF6elNneXJZTXVWMWE1SFBVTWsrbW9IVHlQQWRDdlNOYlhiODB0?=
 =?utf-8?B?eVNIVVBudEIxMWlTS3FrdE5HWUFlYjB0QXFCUW1xUVY4Y3huQWNWUnU1cFp3?=
 =?utf-8?B?T1ZxeS8rL1A5QWE1TGtZbGg0MkExVm55WWlxTXB5QnVNalFiSDBocVdYOHVt?=
 =?utf-8?B?ay9HaGplN3p5YU9jYUZHWFJvVTMvUjhlUWVwQ0FIVVdZS3pLREtJeEUyTGRn?=
 =?utf-8?B?YTR5bG1kNGVkaVZ5UFRTN1YvYlRaU2FTczZTSStnaWhMSUJSQVpBdXJaTDdN?=
 =?utf-8?B?b2NvU3ZIZTJPUGNQYzg3T3pvS3FBTTdPQzZNbEdDd2dIOEZ5S0gybW5NR3Rl?=
 =?utf-8?B?eDJod3krNGh4dzVWRGtpNVdUOElWWkhXZ2c4N3lCWEpwblFqMCtBQm44SHhx?=
 =?utf-8?B?azJRZ3JMMUVyYnhhUVlqRW5mdHVQTmwyT2ZIN2tJUFRsWmRJMEdIa2Y4UW1v?=
 =?utf-8?B?QXE4S21OQVU1TGVjZ0VJUGNRbmUvUFFRa3Z2ek5aYlFwMXdST3lRNlQ5K1k2?=
 =?utf-8?B?SUxtaGVyUFA0ckFKZG5oWmVKV2dadUpPd2c1WWIrOG1EYXJaQjBFeXlPZmhw?=
 =?utf-8?B?alFacGlNS2xSaFRtaHQwYlE2NUd5b21OalBraFc4TTA5QUMyNUdwRW1ERFVi?=
 =?utf-8?B?VFQrTkY5ck9QQnVtK1NiYktEUEZhWVFObFRUY2IwY3Y2T2xEdUZTUGVaWWYw?=
 =?utf-8?B?VUdod1VWQWVacGJFY21WcXA4T2RGV2p5R3l4YnQ5bjlXVzJtbTM2Z0UzM0M4?=
 =?utf-8?B?aFVkTTJzdlc1VW1DZDl1ODFJamx3UDk5bVhMS2I4azdTK0J6V0NDTmVqaHJ6?=
 =?utf-8?B?OUw3ajRNdkdRTlZXTVQzSTJ3enp1ZHBPSWNCbXd1SVlKUlNhajFpbnlSbFh1?=
 =?utf-8?B?SksyZHpPZTJsMkZvRFY1aG5pak02S0JacHQ2SjN0aFhDd0VhWmNPUWhLQzkw?=
 =?utf-8?B?UWNhSDZwd2lhVk9qRjRqeW1YRjNxckNQRStZYXNsVjIveUh5Wmczb21qb0Qr?=
 =?utf-8?B?OForaThDZ2ZMSVJINlNvTytjQWpYRzdjNkthNm05c0dIZGQxRGlnbVFON29C?=
 =?utf-8?B?MDVoWk5HeUp3dFZNbHBOS2o2U0UzV1dBOHIxTmFXQ1Y3ZnRFWEtialVVdXJY?=
 =?utf-8?B?RlNjd3MyK1lYL3pjOEVIK1ZoVkVtM2ZpMlEzdzZ3Y2dCZzBCNVVjajRuN3JS?=
 =?utf-8?B?QU9POGdHelU5dE8zazFUV1ROcEJmSGZPSHpjSDNvTG9FUVh4YVgwVkJaUFVq?=
 =?utf-8?B?cEFXVmxlK1BZcTNFdVFWYnl0ZlFBM2NKOFlnREhLY056Y3ZES2hsTGRqa3JQ?=
 =?utf-8?B?eTFLTlNXZG9md3BIRHJlK0xwek1WMHhXRW1ISk1rU1pzcHNQSWMyS09KdkV3?=
 =?utf-8?B?M1h3ZktrQzBBbUkwSkRrcktsamQzbXdsWWc3L2RYUW84OTkrL3hXcjBabTRB?=
 =?utf-8?B?NThQa3lMYWpjS0JTOEEvMkhMdHIweG1Pa1hmeU1lQUZNNWtMaWh2dHFVWFpz?=
 =?utf-8?B?dDlPYjdiUTlCWFNtcDd1S1dBQnVxbG9TT1kxTGxxSDZJQ05JM2FKUmJsSnk2?=
 =?utf-8?B?S1o3aDlJcTJXUmZaQ05xYVB6RjJHakdGQW9kSC96ZkZWckVYMjVCSERvOGFX?=
 =?utf-8?B?S0VWTXZralZYQ1RuSUovNWhkM1RXZjd6ZXBZTDlyOGhBelk2ZHV1a2dCWnlB?=
 =?utf-8?B?bWZ4blE5bU4zN2cwUWNVdFp6dUdBcVdwZTNLeFRFTFl5d2R2b0l3NmJrSXJ6?=
 =?utf-8?B?WDBmQ0hkS3l2aCtsdjFqT0FlUTBYS0xJUjFsVENuQmlsL285cWV1cVdtSEpu?=
 =?utf-8?Q?A9Th6RRnVKdmXw/jWBRcYZPCNV2dmK7YbH8/cksKQRKK+?=
X-MS-Exchange-AntiSpam-MessageData-1: 6Ksmvybl7v7fdA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f3706e-cc05-4fd5-6cbc-08de4e50b5f4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 00:56:09.2591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +N/Nyg3R/xFVIchZi4BAgjTGjzWtlA+CyKrxKZufmCj2sMAagpHNcg0qPufLU9Wn+cw5s39OXTcl+hzmcteCxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7957
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

On 1/8/26 08:03, Zi Yan wrote:
> On 7 Jan 2026, at 16:15, Matthew Brost wrote:
> 
>> On Wed, Jan 07, 2026 at 03:38:35PM -0500, Zi Yan wrote:
>>> On 7 Jan 2026, at 15:20, Zi Yan wrote:
>>>
>>>> +THP folks
>>>
>>> +willy, since he commented in another thread.
>>>
>>>>
>>>> On 16 Dec 2025, at 15:10, Francois Dugast wrote:
>>>>
>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>
>>>>> Introduce migrate_device_split_page() to split a device page into
>>>>> lower-order pages. Used when a folio allocated as higher-order is freed
>>>>> and later reallocated at a smaller order by the driver memory manager.
>>>>>
>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: linux-mm@kvack.org
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>> ---
>>>>>  include/linux/huge_mm.h |  3 +++
>>>>>  include/linux/migrate.h |  1 +
>>>>>  mm/huge_memory.c        |  6 ++---
>>>>>  mm/migrate_device.c     | 49 +++++++++++++++++++++++++++++++++++++++++
>>>>>  4 files changed, 56 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>>> index a4d9f964dfde..6ad8f359bc0d 100644
>>>>> --- a/include/linux/huge_mm.h
>>>>> +++ b/include/linux/huge_mm.h
>>>>> @@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
>>>>>  int folio_split_unmapped(struct folio *folio, unsigned int new_order);
>>>>>  unsigned int min_order_for_split(struct folio *folio);
>>>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
>>>>> +			   struct page *split_at, struct xa_state *xas,
>>>>> +			   struct address_space *mapping, enum split_type split_type);
>>>>>  int folio_check_splittable(struct folio *folio, unsigned int new_order,
>>>>>  			   enum split_type split_type);
>>>>>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
>>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>>> index 26ca00c325d9..ec65e4fd5f88 100644
>>>>> --- a/include/linux/migrate.h
>>>>> +++ b/include/linux/migrate.h
>>>>> @@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
>>>>>  			unsigned long npages);
>>>>>  void migrate_device_finalize(unsigned long *src_pfns,
>>>>>  			unsigned long *dst_pfns, unsigned long npages);
>>>>> +int migrate_device_split_page(struct page *page);
>>>>>
>>>>>  #endif /* CONFIG_MIGRATION */
>>>>>
>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>> index 40cf59301c21..7ded35a3ecec 100644
>>>>> --- a/mm/huge_memory.c
>>>>> +++ b/mm/huge_memory.c
>>>>> @@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>>>>   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
>>>>>   * split but not to @new_order, the caller needs to check)
>>>>>   */
>>>>> -static int __split_unmapped_folio(struct folio *folio, int new_order,
>>>>> -		struct page *split_at, struct xa_state *xas,
>>>>> -		struct address_space *mapping, enum split_type split_type)
>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
>>>>> +			   struct page *split_at, struct xa_state *xas,
>>>>> +			   struct address_space *mapping, enum split_type split_type)
>>>>>  {
>>>>>  	const bool is_anon = folio_test_anon(folio);
>>>>>  	int old_order = folio_order(folio);
>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>>> index 23379663b1e1..eb0f0e938947 100644
>>>>> --- a/mm/migrate_device.c
>>>>> +++ b/mm/migrate_device.c
>>>>> @@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>>>  EXPORT_SYMBOL(migrate_vma_setup);
>>>>>
>>>>>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>>>> +/**
>>>>> + * migrate_device_split_page() - Split device page
>>>>> + * @page: Device page to split
>>>>> + *
>>>>> + * Splits a device page into smaller pages. Typically called when reallocating a
>>>>> + * folio to a smaller size. Inherently racy—only safe if the caller ensures
>>>>> + * mutual exclusion within the page's folio (i.e., no other threads are using
>>>>> + * pages within the folio). Expected to be called a free device page and
>>>>> + * restores all split out pages to a free state.
>>>>> + */
>>>
>>> Do you mind explaining why __split_unmapped_folio() is needed for a free device
>>> page? A free page is not supposed to be a large folio, at least from a core
>>> MM point of view. __split_unmapped_folio() is intended to work on large folios
>>> (or compound pages), even if the input folio has refcount == 0 (because it is
>>> frozen).
>>>
>>
>> Well, then maybe this is a bug in core MM where the freed page is still
>> a THP. Let me explain the scenario and why this is needed from my POV.
>>
>> Our VRAM allocator in Xe (and several other DRM drivers) is DRM buddy.
>> This is a shared pool between traditional DRM GEMs (buffer objects) and
>> SVM allocations (pages). It doesn’t have any view of the page backing—it
>> basically just hands back a pointer to VRAM space that we allocate from.
>> From that, if it’s an SVM allocation, we can derive the device pages.
>>
>> What I see happening is: a 2M buddy allocation occurs, we make the
>> backing device pages a large folio, and sometime later the folio
>> refcount goes to zero and we free the buddy allocation. Later, the buddy
>> allocation is reused for a smaller allocation (e.g., 4K or 64K), but the
>> backing pages are still a large folio. Here is where we need to split
> 
> I agree with you that it might be a bug in free_zone_device_folio() based
> on my understanding. Since zone_device_page_init() calls prep_compound_page()
> for >0 orders, but free_zone_device_folio() never reverse the process.
> 
> Balbir and Alistair might be able to help here.

I agree it's an API limitation

> 
> I cherry picked the code from __free_frozen_pages() to reverse the process.
> Can you give it a try to see if it solve the above issue? Thanks.
> 
> From 3aa03baa39b7e62ea079e826de6ed5aab3061e46 Mon Sep 17 00:00:00 2001
> From: Zi Yan <ziy@nvidia.com>
> Date: Wed, 7 Jan 2026 16:49:52 -0500
> Subject: [PATCH] mm/memremap: free device private folio fix
> Content-Type: text/plain; charset="utf-8"
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  mm/memremap.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 63c6ab4fdf08..483666ff7271 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -475,6 +475,21 @@ void free_zone_device_folio(struct folio *folio)
>  		pgmap->ops->folio_free(folio);
>  		break;
>  	}
> +
> +	if (nr > 1) {
> +		struct page *head = folio_page(folio, 0);
> +
> +		head[1].flags.f &= ~PAGE_FLAGS_SECOND;
> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> +		folio->_nr_pages = 0;
> +#endif
> +		for (i = 1; i < nr; i++) {
> +			(head + i)->mapping = NULL;
> +			clear_compound_head(head + i);

I see that your skipping the checks in free_page_tail_prepare()? IIUC, we should be able
to invoke it even for zone device private pages

> +		}
> +		folio->mapping = NULL;

This is already done in free_zone_device_folio()

> +		head->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;

I don't think this is required for zone device private folios, but I suppose it
keeps the code generic

> +	}
>  }
> 
>  void zone_device_page_init(struct page *page, unsigned int order)


Otherwise, it seems like the right way to solve the issue.

Balbir
