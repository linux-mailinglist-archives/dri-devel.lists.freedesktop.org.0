Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A474FB595F2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1263410E7C2;
	Tue, 16 Sep 2025 12:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j6rs0eqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990D410E7C0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqbxMkxAL06WuKGXAGlnFuCWVpL/0X5jMb1DR0KaaQq7985lDOTuYUqrtztxSCoNDZIrwXs1GRiClHJj0dmUMQOuao83mS5OvsJ9BP58R2owk938keQ+egsKJvN4BDAdfBjqiViFcdtcu+FFlEVLpLMC9ul5bdMBDDdSZissG5xD6xuNjo8Yoa72A7O7PwqF4nKfFDw/bJEfG6qe4tatiBT2wITIyFP7IYAEb32BpGhP2grqlqW/IKNRA08hxm/ZwXDYgjEPSTQ4mycQ44HOWp1e08E9fTpW+pxizLyK38w6D0CcNsCDLzld0pt4+z/w7iwNOybb2ZNTO/b7BPAzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPoayDgo8BpMbRACUCVvq76qjnPN2UmzWtOZAJqjAFA=;
 b=nr6PrvG/0tEDAgra2chxFqJZnl6XSupWbYjTyOzOtqjjdK5FuqR1Zt6RFNQWEcQ+QOo8PZWuUpxB1QJ2UfqZ9YjrVNbAQXG8MpV+ihczKyy4oSuX5hfI5PUzFn2i15FcJvxZljSc64sJcDVo9GlGKQ7xxgReiiWWitb3kJp4tSgRDTM04W0N8Lcx6l+DZvaTnWIaqv/tSvF2lNqdljOW9ir8BUO6mu8XTUfj7n7ysg7C4/V/e/RJHJwJO3xsEnavf/nYTgiUSYED4y7FpFsaWZx64YnNrnf0PEg7Kxw/BZGDz/PJtkDLfkUTTJ4PvQqCrcLU9EYGttywd/8/lJomiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPoayDgo8BpMbRACUCVvq76qjnPN2UmzWtOZAJqjAFA=;
 b=j6rs0eqLLM1DYaP59Z1fY8TaNTUnc1MW3/EAEeFy/LDvyDnxq+i0d3EL8r2qedmUIIOLfW+scKUIiXAtiZuyq/L7dUTYopKyl5tx+mMaDS7T+TP6vJAPoLMq+lpp3Xm6L29xgxniSK5S+pbbk0nLQEeVcvZGU6gNTe02V4rgGcdDOh1e7Zp273YZ9R/oBUvPdf6h5YrIykme3O2iD0lSRxR3bfwHd196XIyeDaz7Wlq5k+rgdDwiWFwSkKmtB7QpHUUUx7Dy6q8+8rwRcNVUC8THBg48JKYjPjP5Td2bploHRuheD+R1yWJW1eDaaipg7W66Wc0EV5+xux9ThdqRIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 12:21:46 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:21:46 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, SeongJae Park <sj@kernel.org>,
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
Subject: [v6 03/15] mm/rmap: extend rmap and migration support device-private
 entries
Date: Tue, 16 Sep 2025 22:21:16 +1000
Message-ID: <20250916122128.2098535-4-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916122128.2098535-1-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0109.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::11) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d24a05-ec7b-4516-da9b-08ddf51b9a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWR6T1NQZjlRTTNaTjUwdFU5NWJFK1BUVm5hcEFEeTQ1VTFoeWhwYXhjN3Z5?=
 =?utf-8?B?NTBuQ3VCSXVsNDFpamlJUkorOGY4Wm9TS0xMSUJhNGI4TXpwTVVrZHZXYWVC?=
 =?utf-8?B?NWFjVnlicWt5L1dKY2lqeXEwN05CMFBMTmZyMHNXRnlZcS82M3FIb1BmQ3p5?=
 =?utf-8?B?VjRmWm9UQTM5NHVWOGtQNGlvN2xZZlc5TXpCS2c5N2d6bnlmejNENFB5dVps?=
 =?utf-8?B?QmVOSzVDNUI5TkhzK1F5d3Y2Uit3Yllldkptb002Q3RmcXBiOXRFaEc1VjdG?=
 =?utf-8?B?dENuNTJ4NTlseitEOFN2RStJL2cwTTdaWS9yUXd6VWhQblhBcExQOU1JQU1r?=
 =?utf-8?B?end5U0NWbFJVTHlQb3QwaXZVeHVYZjVxZ1JKQUhHV3pRUkNxNk9jVHlHc05w?=
 =?utf-8?B?YUVxclpDOTNPdW80VzVOZFJFU3dtZ1RxazRwNisxVUJkNTY5Q3lxL2g5Nzd4?=
 =?utf-8?B?WGZjdUZZNEcwamhyUWhBUEhsOG9CYWZjbUdTdjZoVzRDV2E1YngxUXBLbEJW?=
 =?utf-8?B?WEdxM3haUlMrZHhSVXRHVHVqTEtoQ2ZkcVBLc1lmcEJ3K0tlWWgzc045SmVr?=
 =?utf-8?B?Qmt1V29zaU04a2p6R20xQ1F3K2M3VWFuRW9PdnFCcWxiOUoxcHBnTGZMOWFq?=
 =?utf-8?B?TDAySEVqT0kxaTFEMGI2U240Qy9kYWJvK2dtd2NBVnpGYWQ5WkVnWUh3OXR0?=
 =?utf-8?B?MXBCdnJqZHFvU1orSk9TdVN6azFPWDA0M29hNDhPem9kWUpDa2RWdDYwMSt2?=
 =?utf-8?B?V1d2NWxsVGdwY3JYWURoVlhXVk1rcmQ5aEV1WUdjaGczWXFZMm1ESGRWd05i?=
 =?utf-8?B?VG02QUpuR0x1QW85UlJFNlVZNnd0dURSdkNNN3RuSzJzMXkyaGxwdnM5cU1P?=
 =?utf-8?B?R3l3ZW5mdUdENEp1enZITEpaa2FWb3BxTGQwbkxkU09aaHh0SklpZWt3TWV3?=
 =?utf-8?B?dERFMFovOW9MdkxSSUhKNGttVStZYnZqRXEwQkdvVGxmQUgyN0Y3dm4rUjRX?=
 =?utf-8?B?ZTB4UE5vR1NvNnM0SlArcVdrK1g2a3lsNHViQWUyRThyK1NhWHdDTE9hb2tS?=
 =?utf-8?B?TnVOVit0akhqZC9Wd3ArcjJwd2gvNkNIRjNWeHlodkJwS3JBa3dWVWJ6VnFH?=
 =?utf-8?B?TmQ4dDhPZGxKa0J4M1VvOXBIUFF5NW9tTVVXV0lnWGJsQWh0ajRWdU02Vkpn?=
 =?utf-8?B?b0Zlc2dmRlFCL2Y4cmZhbUNlK2NmRERjUTN0bnZSU0Nnb1Vya0h3YmUxNUww?=
 =?utf-8?B?MXM4Q1FsUFBUNlFGR2NUeG1TbWkwTTUvdEhhSWpsdHJrb3NRYXErNWh6cDBs?=
 =?utf-8?B?VzdjSzFpV2dOVmQwMC9wa1FCUy9HSmJ1V1crS1J5NlVjcU9vSkIwNUQwNGZp?=
 =?utf-8?B?Mkh5UDRmenI0ZWhUeHB2V1dyRWZvK05xbTM1MHlvQisvMXNqUlJxbzhpNkxm?=
 =?utf-8?B?VnltUmR6a0VpQTFWUGhpQVdaTEZudDJlR0ViRWlGb3RYWnVqdlhuemozUmFs?=
 =?utf-8?B?WFZTZS80ME14TllLdjllU1lId0p3YVFGdjFiVGRFcmQvc2djcWFkd28zQXdH?=
 =?utf-8?B?K2xiZVJkcmdEV1BzWEtTQXc4ejN5NkRoekliL2xWSTVxdmVEVGQzOUZOZnJz?=
 =?utf-8?B?aStaTGJjazUwbG1GS1JqSjlydTZaTUNPWEMzRTdSZUxKRytETGg3TGZzTGEr?=
 =?utf-8?B?bEpWNXdRTytBbDZPLzZmdnN2Y2V4WTYyUTBwY2lreEM2ZVV5VVBMcW0zbTJK?=
 =?utf-8?B?UjFydVE5dW14blhYazJyWXc1QVVQN1pOSDZldkhSQ0U1UDJIM2RUdzVHK0NV?=
 =?utf-8?B?MFAveU1rT01MRFNxNElOKzJSeHhhZTJmRnl3WjhVeVlxMTY2TENxZVAxUXc2?=
 =?utf-8?B?aC9YaDZRaEhFRytmQXFHRm0vQTFPWVRuQSt6TEkzVGtIc3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVdWU3BxT3Y3V3lLclhoeW9UOE1PTlprVDI3ZklvRE81YVBZc2Rkcnk0OFkz?=
 =?utf-8?B?WVh4UWV6ZHhGVnpCbmMzbEhmbUdzMmFXaFhWc3RvOGNxWGY1K0ZvdUhlaEJu?=
 =?utf-8?B?blUwYnM3c0JCVDFFY0dwOGRwMXExdmJuMFlNd1NvRXlaaUM5cWY0aEd6dWNn?=
 =?utf-8?B?c1V5WHE1TDE2ZDhnK3RyeXVuNng1ODBydlh3YmRpV3FndzZBRzVpMmtabmZ6?=
 =?utf-8?B?TFZGZTZOTi9LeEVSMndNWDRMcnVqVnY4RlNqSjlXdjV2QnJ0VTd5NkV1TUpu?=
 =?utf-8?B?a0VnRlRUNlVOTnBhWjB1OVRzNkNLVDUxdi8rVUYwMVJ1VEVEbHZLOXFOVVB5?=
 =?utf-8?B?VXp0eFk4Wm1RYXRsYzFSUVJzdFVMYjFzcHoveW13Q2FBVGc5cWcrQmMxL2R0?=
 =?utf-8?B?VE1WZkhmai9xdG50MG9sYkhVdVJvdjRZeUpxRXVQSXFCKytMcDBBSFN2LzFV?=
 =?utf-8?B?UHBCWkNOVkhzVVBUOGN4NW8rSmdnMTdxY2cweEsvRFdQVEc5eVhnczlFd3Zv?=
 =?utf-8?B?dklMYWN0dkpCVy9DWFRUQWNBVnU0VTdSMnJ2NlZaeHpyM1k3RjM5blNJVXkr?=
 =?utf-8?B?M2JzQ2tqYUVUZmRBcW4wUk5mWlVLZTJDZ1RTeWt3b2Eza3RFSytLS2xGYnRD?=
 =?utf-8?B?NmNWUldQWkM1eWluZWFEQ3ZmckFmU1QwYXVPRzd2cmRxSDBOcG0xUjR3V1ls?=
 =?utf-8?B?UHhWTUdFbFVPblZaek9EN3lTQUZjUFBhUmRBS3VrV2IzSThHWDlkdHltMHR1?=
 =?utf-8?B?MHBZOU9qQmh5amtOb3FnWU9jbko2a1krakh4WWxQMlF2M3FSMFdURU9EL1h0?=
 =?utf-8?B?T251a1dnRzgzUzZjZW9rajV0eUZjMVlrSFFTZzc1eWU4b0dzR2Jib1pVbVJa?=
 =?utf-8?B?eEpac25rVGRWOE1YZFE0bFVrTG92OEgyVXRNc0JYR1QyNm1pZy9lZHRtTDht?=
 =?utf-8?B?RVcwbmF0M2RmZzhZUlZNM3ZHUktweTRHQXpRcmVtQjdvWWxnTmp2bisyTnMz?=
 =?utf-8?B?aE9FZ1BzcVpxbGh4dnlOd3NpeGVRbUtuOTdzZk9XN1k2UEJrY2Qyc3dVWUkv?=
 =?utf-8?B?WEJUTlY2MVlmY0dRSHBWUDNNeTJFRHo5VDRhMm5ZeWpuZVBsTU9qV1Nnb2Mz?=
 =?utf-8?B?dEFFMDlxZFR6UnBuSnU4SmhJbDJVR3pLT09DeE1IYU1BcWJaZVFDV1ZYYURp?=
 =?utf-8?B?UGpCSnZVVTllWUVxTzY4YUFxU2lDWFFFbmNJZzEwVTZIR3NPWWFVaHlxenZ2?=
 =?utf-8?B?UHFKNVR4cTVObWwyNGszR2UvWjU0MzZWU0l5Q3BxeVEwcjk2ZTExdkRwTGFx?=
 =?utf-8?B?K0h3WUtQVlNoekJzNUVidXFhbS9yUEZLODA0SW9KN0t5MjBxTHBPd2xLSWdJ?=
 =?utf-8?B?Tkw3dWplTmdXYlRTVmlHWGplWWdPSU9wQUtWNjJ2R3plNm5JVVBzRExXbXdq?=
 =?utf-8?B?V1Y2T3JlUjVXV2xId25Sa3NLVVo0Tm1GTm5ML1p2QlBZUlVHUTZCME93TFRX?=
 =?utf-8?B?OWdscWVtTkdTUEh5UVZheXhrS0hZaEpmMUJMOUkrMCtYMVpzZVR0R2NGc1Fk?=
 =?utf-8?B?cVJhL2VPMFo5M0wyTUJ5d1RvWlRXdS9Yb01GSmFGNHplUTJTOEhvYmhOVnVT?=
 =?utf-8?B?Zlo3Sk91OWJZNjhKRi95VUp1MElaNzhZNFZWdlBkZDRVNFBJZDJZMU1kTXNl?=
 =?utf-8?B?K2ZJRXIwenJzYm5ZaEhKblRnUE56Q2wwYWtqMjdweTNQczBEd0R4dHVtZm1Z?=
 =?utf-8?B?dEtGN3ZXai8rZW5OaFp6a3lxaFRlaGx1a0tMRkxkY0ZFVllEc0FUN0p5anor?=
 =?utf-8?B?Vk8zMTJSb0NIOTFzMzZMTjBOL01IYU5xczc2MFA3T25waE50ZUhldUkwT2lP?=
 =?utf-8?B?Mjl3MEVxMTN6ZStQTEhtc3l6V0tBcjJYWjRqRkVxSytmTWJIZlB4cmsrVXdV?=
 =?utf-8?B?aTJMblZRUEdISnl0OCtFSUFJdkZXdVRvNlIzWEMxUHpnOHdqaWk1a3FBMTlh?=
 =?utf-8?B?azcrSStQWWp4VWVvSkhxR2hqQ0hYSWlvWlhaRTFmNEF0enpCYnhnblp4Rmpq?=
 =?utf-8?B?RnM5bUVnMWpRb0E3MDJKZ2xDRThRZmhLaUErY2NIMGcxMDBwOHc2UU5FR0hr?=
 =?utf-8?B?NHdzTWt4K09uTTRiYzl2aDFaMTFYb0JWTmtjamtJOElmUUNnZnlLemtzc0E3?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d24a05-ec7b-4516-da9b-08ddf51b9a7a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:21:46.2760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgfOUw2OYXN9Vh5b5BbDv6/FY1FXHzEUpZXRGQxwTTLk2u5SzHUdBMouwtM+H/poEXu7CWcxQ6oYCc43iceBuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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

Add device-private THP support to reverse mapping infrastructure, enabling
proper handling during migration and walk operations.

The key changes are:
- add_migration_pmd()/remove_migration_pmd(): Handle device-private
  entries during folio migration and splitting
- page_vma_mapped_walk(): Recognize device-private THP entries during
  VMA traversal operations

This change supports folio splitting and migration operations on
device-private entries.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: SeongJae Park <sj@kernel.org>
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
---
 mm/damon/ops-common.c | 20 +++++++++++++++++---
 mm/huge_memory.c      | 16 +++++++++++++++-
 mm/page_idle.c        |  7 +++++--
 mm/page_vma_mapped.c  |  7 +++++++
 mm/rmap.c             | 21 +++++++++++++++++----
 5 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index 998c5180a603..eda4de553611 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -75,12 +75,24 @@ void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr
 void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	struct folio *folio = damon_get_folio(pmd_pfn(pmdp_get(pmd)));
+	pmd_t pmdval = pmdp_get(pmd);
+	struct folio *folio;
+	bool young = false;
+	unsigned long pfn;
+
+	if (likely(pmd_present(pmdval)))
+		pfn = pmd_pfn(pmdval);
+	else
+		pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
 
+	folio = damon_get_folio(pfn);
 	if (!folio)
 		return;
 
-	if (pmdp_clear_young_notify(vma, addr, pmd))
+	if (likely(pmd_present(pmdval)))
+		young |= pmdp_clear_young_notify(vma, addr, pmd);
+	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
+	if (young)
 		folio_set_young(folio);
 
 	folio_set_idle(folio);
@@ -203,7 +215,9 @@ static bool damon_folio_young_one(struct folio *folio,
 				mmu_notifier_test_young(vma->vm_mm, addr);
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-			*accessed = pmd_young(pmdp_get(pvmw.pmd)) ||
+			pmd_t pmd = pmdp_get(pvmw.pmd);
+
+			*accessed = (pmd_present(pmd) && pmd_young(pmd)) ||
 				!folio_test_idle(folio) ||
 				mmu_notifier_test_young(vma->vm_mm, addr);
 #else
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a5e4c2aef191..78166db72f4d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4637,7 +4637,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 		return 0;
 
 	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
-	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	if (unlikely(!pmd_present(*pvmw->pmd)))
+		pmdval = pmdp_huge_get_and_clear(vma->vm_mm, address, pvmw->pmd);
+	else
+		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
 
 	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
 	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
@@ -4687,6 +4690,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	entry = pmd_to_swp_entry(*pvmw->pmd);
 	folio_get(folio);
 	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
+
+	if (folio_is_device_private(folio)) {
+		if (pmd_write(pmde))
+			entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+		else
+			entry = make_readable_device_private_entry(
+							page_to_pfn(new));
+		pmde = swp_entry_to_pmd(entry);
+	}
+
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
 	if (is_writable_migration_entry(entry))
diff --git a/mm/page_idle.c b/mm/page_idle.c
index a82b340dc204..3bf0fbe05cc2 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -71,8 +71,11 @@ static bool page_idle_clear_pte_refs_one(struct folio *folio,
 				referenced |= ptep_test_and_clear_young(vma, addr, pvmw.pte);
 			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			if (pmdp_clear_young_notify(vma, addr, pvmw.pmd))
-				referenced = true;
+			pmd_t pmdval = pmdp_get(pvmw.pmd);
+
+			if (likely(pmd_present(pmdval)))
+				referenced |= pmdp_clear_young_notify(vma, addr, pvmw.pmd);
+			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
 		} else {
 			/* unexpected pmd-mapped page? */
 			WARN_ON_ONCE(1);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e981a1a292d2..159953c590cc 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -277,6 +277,13 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			 * cannot return prematurely, while zap_huge_pmd() has
 			 * cleared *pmd but not decremented compound_mapcount().
 			 */
+			swp_entry_t entry = pmd_to_swp_entry(pmde);
+
+			if (is_device_private_entry(entry)) {
+				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
+				return true;
+			}
+
 			if ((pvmw->flags & PVMW_SYNC) &&
 			    thp_vma_suitable_order(vma, pvmw->address,
 						   PMD_ORDER) &&
diff --git a/mm/rmap.c b/mm/rmap.c
index 9a2aabfaea6f..080fc4048431 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1063,9 +1063,11 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 		} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 			pmd_t *pmd = pvmw->pmd;
-			pmd_t entry;
+			pmd_t entry = pmdp_get(pmd);
 
-			if (!pmd_dirty(*pmd) && !pmd_write(*pmd))
+			if (!pmd_present(entry))
+				continue;
+			if (!pmd_dirty(entry) && !pmd_write(entry))
 				continue;
 
 			flush_cache_range(vma, address,
@@ -2330,6 +2332,11 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	while (page_vma_mapped_walk(&pvmw)) {
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+			unsigned long pfn;
+			pmd_t pmdval;
+#endif
+
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				split_huge_pmd_locked(vma, pvmw.address,
 						      pvmw.pmd, true);
@@ -2338,8 +2345,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				break;
 			}
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-			subpage = folio_page(folio,
-				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
+			pmdval = pmdp_get(pvmw.pmd);
+			if (likely(pmd_present(pmdval)))
+				pfn = pmd_pfn(pmdval);
+			else
+				pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
+
+			subpage = folio_page(folio, pfn - folio_pfn(folio));
+
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
 
-- 
2.50.1

