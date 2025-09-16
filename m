Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C903B7EF91
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BB910E0B0;
	Tue, 16 Sep 2025 23:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wNyGeKQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BB910E0B0;
 Tue, 16 Sep 2025 23:01:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmtKSF3BazVLesKoFviZgCLUSdv3kJpkZ6UWT51yZv9wq8bj0z+x4WJcYqlbuz32CpHhLuwEXAiAHieriFK6jwe0iW+1kMUnexnkJCcw4q7rUZjojcTL3ks5o4VHJ4Mn9yKTEFBxFWbpNUnUc4nKQFtgm1c647EVHBT9m3MgBkQ65UlkLmFUhtp3+14T7X3omYdYCl4cfJfwUjkOmQOk+5EI5ftlfmw6qMJpvZHUYynYRAy9lskoWMRYwsYghhJVh7HaVSRrUotr2OkeeOg/Wqba4oagE+neVaS4pmsTw3O2hNoVYZlxPcpySnzrmBwTytD9C8nFdkTyyY49df3uZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNfgXopiIUevbkMQQ7++rJ1gOQ4LnFKLZvN+C/1mJHI=;
 b=lXcJdC1meORr2EzXx3l1AC7aqnNHSSFbW4OW3MQ7N3tAvMnlHVI7eMDi6OWVJi4PaHdL4bi/Rti9MFDuF1nzkqQ1IR0wy2RG5KHUfUN+rONtYdv8JyRs6caBIXLmpPLRuUNB4J0OmtYkjfk1p1Qvq47Rn82mJQ67DbWdvHTz1Tr+SfuD7pI3wIgtj6tW1mRSmzyQlx8cEN/dZsya+nuRlVQNq5CpVeRoUUs4tqkt6bjPv3eSV86rZo4NdW2UAUGChEe9kJS+Wh2F0k4y8Eqv60ggrzHdQCC51DzOBmH7Q82H/RAFm/b1Fu6rcgVnWQFEKMLtytykE3jZVwSthDA03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNfgXopiIUevbkMQQ7++rJ1gOQ4LnFKLZvN+C/1mJHI=;
 b=wNyGeKQsUmO/vA0HHoQDZhm+Uvhhqg0hQ+45Bf2ZTBJtQAXias7HkIyg58ZLJXrkuiOhzc2uPp/gzGfMKLtxkO6MOkPWUnbILv/0NeNqkBUTrerVsbYjZB2tegqSphfsH1ky78s1jyArPr8/Wk07mjNmD8n3Pb6bp0n+5HeEa0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 23:01:11 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 23:01:11 +0000
Message-ID: <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
Date: Tue, 16 Sep 2025 17:01:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Sebastian Wick <sebastian.wick@redhat.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, contact@emersion.fr,
 mwen@igalia.com, jadahl@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250826120306.618c275f@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0246.namprd04.prod.outlook.com
 (2603:10b6:303:88::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab18383-8f1d-4a6a-dd98-08ddf574edbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkNWRTh1YVRmbzR0dEsyblhOZ0NOYXRxd0wxbjFYWlpRVVVtRGJNU1hZSU8y?=
 =?utf-8?B?VDZhTmN0a0hsNEpxQ0Qrd0M4bjFKWUZBTGpRNXA0cW1wY2NBMXNJWFVsREpF?=
 =?utf-8?B?ZjAySmo1dHBLK0R4ckpoZXhDU3dNb09DK3VIdVUvdFVsSkF3ZzZzb3FmLy9z?=
 =?utf-8?B?aXB6bHVQN05saXJBc2lreTFid1AxZjhhSVJkd1lYNFVwY09wSHE0V3M2SGpl?=
 =?utf-8?B?Rnc5UmZ0UG1jR2Ztc1hoR2ZGeXdvUk42NHJaZVd6bmI3bGtKMFJoZndPb0k3?=
 =?utf-8?B?MXBpUHJpNDR1QnJ2Q0hRUXVlVk1nU2xGTVJtdE9LYmFnU0t6d2wxWmFIT3Np?=
 =?utf-8?B?M3BacFFTNG4xSnJmT05HVmdhdlI1OXRPREFzVTllVDNMY3hNK3ZwU0NKOW1G?=
 =?utf-8?B?d09nTy9CSlFqNE1jQjZRRnNJZjFLSW8vUFBXQjB0RWZUNE43NklndWpOMnNp?=
 =?utf-8?B?cEFRbjVhTUlPNGNxWFVjdUlwWmk2enpUNkVlNnFsQ2ZaOFYwNTBiOGc5MVZY?=
 =?utf-8?B?YXlGVTNHNTFCQVcxVEZVZ3JNUmJOVkhhMXNLWDlveGY2NzFmSkQ5TFJiMVBL?=
 =?utf-8?B?L1ZXc2Nad1V5MUV0WXlhV2RkZkhhQms3N1ZSTEdabnZkOE5HcDJXdGpMaldF?=
 =?utf-8?B?c09Sd1RPaHdvYXMybWVyeFYvbDdDMkdyMkZaYTI3UFJYeGkrbG8yb2R0Sndm?=
 =?utf-8?B?YlBOeG9uamZyNzVIa2RWem1Gc2NPMnozQlBsTTY3ejNFVVpxNE5tajR6ZnJs?=
 =?utf-8?B?Z25sSy9QYTZTYkdlTUFEY29ZUkJ5UEg4c0tkaFlyMG1qTjhrcmhlVnc2V2Zq?=
 =?utf-8?B?ODNaenBtMDNxenFaYUlmM0FVYnArQWlLRUFNTUhoZnpVQXJzQU5GT3J1S0Zv?=
 =?utf-8?B?Zko5eHVxc0FrczBOWmhlUVRzQVpkWEljVFFqdkZYeFFVTTRRQ0ZyRUVxZXpj?=
 =?utf-8?B?K0twVDJUWkZZWlZGNi9GSlcrUTFZcjgwNzEveTVhbDlxMHhKYldteHdtemRC?=
 =?utf-8?B?U0M1NmVTZEFSaFpvc1ZlQWFmazlUakpQYVpicnduMktSaXkvRWZEYzhhN0JH?=
 =?utf-8?B?RUdsMVpITm5KTkRpblVjOWI4VEVROENYL2x6dWtvM3pWdFFXRDF5VC9OSk9x?=
 =?utf-8?B?R1I1djRROW83RWFzaUhZSm5pam96VVY3MzhqME5ZNzJVMHBYK0pCWFJnYUJh?=
 =?utf-8?B?SjAyY0traS9wd1kveW1XcCtLUjdEeGpsWmRoMEhoaCszZEFWdEtqd3B2aEV1?=
 =?utf-8?B?VngvcGtKUXA3WDRoVUc0M0xXTkJKWUltWUE2NGxrcWptcTlBUWQ5WXp0MStC?=
 =?utf-8?B?SDBzVnU5cFo4aEo3bGxWcFNPcnhqMzRMVlp1QlhIbFBmamxKNnU2T3Y0UWxS?=
 =?utf-8?B?cnliUXhqWHl3YVpjSUZhTGFxWEtMb1pyaVBDWUZIaldPR3BxUEJ1UnlTcy8r?=
 =?utf-8?B?aXlzQWpJa1Y0cDlhWHozNTN4Nnk1T1lGRWRWZzFvSlo1MlhPK3N0OCtrYmJL?=
 =?utf-8?B?TldJeGxNbWhNYi9yQmtRMjlhS0hSSFFoQTNOSlc2TU9nWFJyTTUwNE9hNEkr?=
 =?utf-8?B?SlcyQ0dkQ0JEbEpUTWk2NE5sSHI4NUowY3VGVzU3UTd4ZXNRcXpXREhtb3lS?=
 =?utf-8?B?NlpBYkhZZE5kYTBhREd1dWRPWkFUVUJaWWpJTEtCL3pEam5nZjNDZHB4UnRo?=
 =?utf-8?B?alFMMDZYT2cvcmxMMU8rVXBvUkZ1QkpFZlQydEU3WEorOXcyTmxaeUtYL3lK?=
 =?utf-8?B?VEZCeFp2VTBLbmR4bjBMRmNkNXVqbis2bG5OcmluQ1o2Q0ZyOGw0YWRMM3pZ?=
 =?utf-8?B?YlNtSzYraFVZelNNSjVlLzBVSUNhOEF3MjdpVHFGNGsya0twZ1lxdHVwTzZT?=
 =?utf-8?B?Y0FRZUVEc0hUNitkOFB6MjdtTzZ0cWxZNWVURTMvQVprRG1FbGJnM1JORGcr?=
 =?utf-8?Q?q5vKzogPVh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUQvLzk2OU04dkp3a1RkSTViNEZlOWF0c01BWEhMSVRqQUhnN29BcGhpejFn?=
 =?utf-8?B?dklhN09DQllkYlpPK3doMTNyOVN1SkNDKzk3MmpWUWZYdndXNGJEZzBNMWJB?=
 =?utf-8?B?NHVMT0dyeS9tNWJhYjk4RmdjT0E2VXR1WEdJZFFHNFRFNnJibmRxZnRvSFQv?=
 =?utf-8?B?T3Q3RTlKMnBqTGhIak9xeUFpVkoyYitNbGhoNG1lRVRtMVlJcGQ3WTFKRm5k?=
 =?utf-8?B?WDBzL1pETHpvU0N6WVQyWWp3c3dOM2pXZUYyVytwN1B5bWcrOXlLK3VSYUZp?=
 =?utf-8?B?OXlIaTJFczF5eWp1cXZxUXhMQXBjYzNxYndRM2NLeXdoQkxsT2hHTlVUeVlq?=
 =?utf-8?B?YkpWY1RrOC9kSEZzYmdRWGtOTHgyWTE2V0hNUmFUTDJrNlRKMkhrWkwyR2hV?=
 =?utf-8?B?ZGlKa3VJeTR3SldnTk9jU3BZZll4Q1hmSDlmRWVMTVNCdGtWOFBmRytIbXhL?=
 =?utf-8?B?Nzc2TjI5V2tJa2w5R3FPM0VNdng2UzBqeWtReVlzYkxqeTdVK3ovdG1aRDFM?=
 =?utf-8?B?M3FWcVhLMHVVZUFEZWY3VkFKbytTTlF4cG8zYUR5RWRUNXc1YWZTaFQyYjV1?=
 =?utf-8?B?SENvQldRU0F1WGtWQkR1cVNZUVNoMjNIcVdqaTBUR0R0RXU5VzBQV0xuNmgz?=
 =?utf-8?B?cnlFUVhYNWJMTE9SN3loNjVHTHdzREp5NnZWd2drbHl5Lzk1RjJhRzBVejVB?=
 =?utf-8?B?VWd3TWZFYUQzOFRQczZXMDFUNVdhNHhGTEljK2IrU3g2OE1mRXRYYmkvaWI4?=
 =?utf-8?B?eU5vR243SVNmSDRId3ZFNUUreHhYQWFlYUZHTEFhUkhJaWQwMFBaUStVZnor?=
 =?utf-8?B?bW1OYkxsSDdpRDR5R0hZcTR2cE9ZaFd2Q2hFc3FxeTlXU1lPd1R0aCsyb1Bh?=
 =?utf-8?B?QlBNRk4zTGhhOElBRVB5dFAzbDc4NWpzYUNadEZ0bmk2UThnYmYyRWRDSlpB?=
 =?utf-8?B?RWxCT3R4REsrOU1kUi94YnZvOW5zVU9wTG11d1hwOWh4LzBqRnFOMEhTaTJT?=
 =?utf-8?B?S3dFVk1ZcUg3N3NFdER5eHZ1QmpMZU1FdFRQZXhLNlc0N1BuY1d1RnFaWW5w?=
 =?utf-8?B?QzFMTUFGd1F6QW1ScncxYW9YUUFYaER6RFdYTmlPd01GRXRBV1FySXZvMmkr?=
 =?utf-8?B?b1BqcmRTR2dvcHJYc3Nubzd5YmZCVXRwaG15cy9iWmZBeGNxOEprcXFaOEJN?=
 =?utf-8?B?ZjdJMVVaRG5LVmNNa2dtSTNKbEZCeWZLeFAvbHMveEt5b3owM1R2RHVieWpY?=
 =?utf-8?B?N3N1NzgyZFloUVN1bWpKd1hCWnBoNUY2RHRPaTlGQUdVTmkvQTZlcEI0MVVB?=
 =?utf-8?B?NjNQTEFWRVpKRllqWEVjdjE3NzEzaHRXQW9ZbUVXR0UrRlppdnpzM3VyQzFY?=
 =?utf-8?B?ZHJUMEtvTUl6UCtwTkdBUkc3enZEQXM0YStiOWZXS3IzaE1XME4xcVpPQjY5?=
 =?utf-8?B?RDZYVkE0ZFFsbXJVYkQ5ZFRRTHdyR0FYZ1R4MVowd0JjNlFWT0VDS2tOZWRS?=
 =?utf-8?B?QnZBZDJtMzY0aFBFZ0k3dTkyV09kNzZvYWNyUjZ3TUxGZlZ1am9JdmxCOTZj?=
 =?utf-8?B?akk0WU52b0QyZVNqKzhackxVSmxNNHUwYjdMTTJ6RERFZURwaFJkMGtCUVpv?=
 =?utf-8?B?YzlKTGZDVjhRbzVoSk1UTzRzSHJMSUlKNVF5WVFlUDh3bWp3aHR1cTFydmV0?=
 =?utf-8?B?VzBVQmZjeW4yZkE5WjdBUytTZmdYSTQ3ZCt6OUJhYjMyQ1kxb2tOckJDV3pN?=
 =?utf-8?B?TzdmeHo0UUNUcndDVEIzczBxY3BBa1BNeTVjcWsrRUhSY284TFBSanZjd3kz?=
 =?utf-8?B?RGVqcmNINzI4NVl0RnRVaUpjdUhuaWZ3QjFzZEtUQ0ROZmNrZDdiN09NeFVI?=
 =?utf-8?B?Nk52ZDM3bk9PWTR6WndYK3dtc0JOdGRjT04vQjFsdUprUWpuK0hWUXMyem9V?=
 =?utf-8?B?WThoTWVwNVBqMFIxWFYwUys4dGFEb1F6L0xFdUs0amc5cHMwYWIvU2VMa0px?=
 =?utf-8?B?Y0hoaFNQckRWT0VGVnRqaGJnTHVmRXZhT2hNNmVFWW44TnRGQXc5di9qR2pU?=
 =?utf-8?B?QlozeEZjdUh4a0p5TktBZVVoVS84VlZuQmJHQnA1OGQvSVFlSHo2Z3R2d2d6?=
 =?utf-8?Q?2Z3hIqZ7IN+n7H4wUcJ7bPpou?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab18383-8f1d-4a6a-dd98-08ddf574edbb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 23:01:11.1656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uU1PPU4xitLvb8flIrLCq8r9VWdQo1tNtbNLrFHrQvuYH09HaIwMShK8jzu+LOddpT1HnT9oN/aazSC3W+lUWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191
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



On 8/26/25 03:03, Pekka Paalanen wrote:
> On Thu, 21 Aug 2025 11:54:32 -0600
> Alex Hung <alex.hung@amd.com> wrote:
> 
>> On 8/21/25 06:23, Xaver Hugl wrote:
>>>> We user space folks have been convinced at this point that the sRGB EOTF
>>>> is actually gamma 2.2, and not the piece-wise function. Now, if the
>>>> hardware is actually the piece-wise, then that's what should be exposed,
>>>> but I'm a bit unsure if we should do that under the name sRGB EOTF.
>>> Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
>>> hindsight, the naming of "srgb" in the Wayland protocol caused a lot
>>> of confusion, it's better to be explicit about it where possible.
>>
>> I will leave this to Harry to comment. He is taking a few days off so I
>> will check with him later.
>>
> 
> "sRGB inverse OETF"?
> 
> Strictly speaking "sRGB piece-wise EOTF" is not a thing AFAIU.
> 
> 
> Thanks,
> pq

If an extension in future after this proposal is merged, can it be GAMMA 
2.2 to be [DRM_COLOROP_1D_CURVE_GAMMA22] = "GAMMA 2.2" so it won't 
conflict with current name?

Meanwhile, do we agree to change "sRGB EOTF" as "sRGB Inverse OETF" as 
the following? or do we still want to add "piece-wise"?

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 1551b86471ce..90a216c0b6ac 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -71,7 +71,7 @@ static const struct drm_prop_enum_list 
drm_colorop_type_enum_list[] = {
  };

  static const char * const colorop_curve_1d_type_names[] = {
-	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB Inverse OETF",
  	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
  	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
  	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e4250b7d8de8..ce85c52c60c8 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -43,7 +43,7 @@ enum drm_colorop_curve_1d_type {
  	/**
  	 * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
  	 *
-	 * enum string "sRGB EOTF"
+	 * enum string "sRGB Inverse OETF"
  	 *
  	 * sRGB piece-wise electro-optical transfer function. Transfer
  	 * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent

