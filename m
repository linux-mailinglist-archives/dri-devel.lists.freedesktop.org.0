Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C8A08CB0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD0C10F03D;
	Fri, 10 Jan 2025 09:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WwcSDaul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A422010F038;
 Fri, 10 Jan 2025 09:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAmOUNyLamwGqm1CpZDtjDd6RjU0tr3Lp4c3anU6vn/tNR4lyuHqg6INQjgDYnmxHao15p68CEjv6G++6F3ZGidh6Qunivl+LLHGw1QhSC/ZWzgrUDtnGIYKXCPIKrvnz1fsflD3gyVg2KHaoeOyzj8kCywjA0kX2YxdL29LUz0QFjtkPUHdkGWUlf9iTl++84ydD/nDBfk+BvgnSZF8DyVeiPkRWh1WD+gxJbjGlpuo3nuDVK2tZyWbwFV7C3Hpvl6XFlum6TMTX++yXVyTlYuqkRHPN2J7+PjH+eozcV9lHpG4qibaj2deTc/0+/hulEliiMEA99Q3Fk/FVO01Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPws4JWh6nnLhrPB0Yk95nT9LGs2MsIGrH6+8QM/IdM=;
 b=WTkXxgbn9JEPWCz12baPRDUE1pLebCIRQWpSxpUNWwEz7wG8Xbz8mTfT16gLE7KEV9HPs2gtU3C1nE76UyeVe1Kb204aFRk61fTQ9YWuRAWc0YEntDpqnU50FckU72sibEJpuQrnkiDuSD3U/CUpTr97WABoXyC0Mwk86MRSvYRYug8gVjBY5TlosXE0lzVSAGUjSiEr/jTTt7XHhz8NQWn6gOBgj1biXqABPj+Tdt4JbmUaHKyaf+XD8OAZTbobUPqy7Q+ViT35TG1NfeILdIOleJRBtX54OvgGhHO59R4KBbOldInWK6/M3efxCRZXJ3zNiwC7Sm7e/RAp2XM2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPws4JWh6nnLhrPB0Yk95nT9LGs2MsIGrH6+8QM/IdM=;
 b=WwcSDaulaNPNNHwGWOy10hP36mbkGKM3VpX/agcUE6dUUi1OjATdIKJnRECoBN7KGA4wqISnmeiBLzvx5hF+d8XSpzsOFwCST5z0F5VLEpsKefuJQTrpdfKXPVp3k9wdPQek5gihMss7tV+X2LMTZGJAWkIfOODwsTvoY559cTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6347.namprd12.prod.outlook.com (2603:10b6:930:20::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 09:47:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 09:47:38 +0000
Message-ID: <d1f431f6-559f-4ca8-8cf2-b97fcbd2f5dd@amd.com>
Date: Fri, 10 Jan 2025 10:47:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/9] TTM shrinker helpers and xe buffer object shrinker
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8ae190-6b0d-4fdc-72f4-08dd315bd182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWY4dnNlTGRjVExmR1FodElPVnJ4YXZzMkRFbjY0M0k2SkZqMEs3d0hBdXBO?=
 =?utf-8?B?cElpYUN3QmROenI0NHFBdU4wYUNIeFFzTUhMS3hReVdhMHN6VHZvQnJXU2hn?=
 =?utf-8?B?Zm96WnFzZnVSeDJHVWpYTzhKc3plNyt6WHNUaUF5Z2dPNEN2UWVSUWl4dGNz?=
 =?utf-8?B?VmpINStUcFdlOE1CVzlTMjRHVVp3Q1pIbnFGenBDTXFza1VkcVhLMllDNjQr?=
 =?utf-8?B?eHcvN3FScEN1Vzd6SUVDWk52N1p2RTBYT0ptSTdlTHhqcDg2b2tmMTI4eVEz?=
 =?utf-8?B?NzdraXNXUEpBeW1iUG8yMllnUXh4cE13ZE1aU2dmbHd3c2JXZkNKSGlpZ2Mw?=
 =?utf-8?B?dzg5aWV5a0kyZVdONkgvcnlSa3F3eTFvUWVQTVVMWDJQWWNueFNkRWxJV2xV?=
 =?utf-8?B?T0VMYTRrY2lNNTFZU2RyQ2VBbStBN0RzL1dNcUU4Zk9ZcEtCc1pTZ3o1bG5l?=
 =?utf-8?B?b2FlUEQrTTBlelJnN2ljdElsMDlsdzQ2c3c4TmVyd3lwUlpFZStaWXhUZFJN?=
 =?utf-8?B?ODlsM3o0SUdRUFFiVm1jMlB4QlNSS1ZyZGljNERhNXlzUnFZMzZPREd2d04z?=
 =?utf-8?B?TnozNDY2T2IxS21hZnVTL29oWWp3SGs1d0hhOTlNZDI5L3QvZmhseWxsWVlB?=
 =?utf-8?B?Q3JWSW01Y1hsek9mNDZSNmVEMkUxNDJ3b0FFbjZDZjZMQkk1MzEySE9zaHlD?=
 =?utf-8?B?bFd0emE3bmNWUjlYQm1HcUdWMW5LNFY1WlBzbFo0M2VuMW10TTdiNEE1Y1VK?=
 =?utf-8?B?b3ZwbGZwSmhSVWxkZUkxbThBS1lXZVJKUmpWajgwMHRxV1pUdHB5SVBIeURu?=
 =?utf-8?B?MGJzcDBmVDc5a1lsR1RpdXBzUU8yZ21tZk1qcWxuczRKVCtkSjZIaFlCQWIv?=
 =?utf-8?B?VGRUZHhoOHFhYm9BcnRjb0xReExDUnBJN2dkV244Q1luRml4M2tJM0FydVJ6?=
 =?utf-8?B?anl1WXdwRUZ2TmllSFdxVWszUzFDUjlPSU94aU5COWxsSEVXYmxnanVTNTNS?=
 =?utf-8?B?aEJpTW5lOFdJY2JJY3JBZVF6ZDF5NS80VkpEeE9FbDNRWVYrVzNSSDBacitT?=
 =?utf-8?B?WGVINjhwZnJpaHZFOUFaOElSMFVKMFFHL3hYdnRpLzN5Vk4vdk91MkloSW1O?=
 =?utf-8?B?VlRJRkdYdzI1dHA3ZlZtUUVvQmM5WU1sK0xJVW93STV0Nkx6eUVWb1hibnNS?=
 =?utf-8?B?THdZSFlOWkFRbnk5OENxUExsZEdtQWRhMEhjdXBVSnVzV3M2M2NHSzNPYnVp?=
 =?utf-8?B?TWFQNXEwaXAxL1hzWHFqN3I4UlZLNmxZbUNaUVB1bzVvRi9qUTExZTM4amdE?=
 =?utf-8?B?UmJNaFdiY2ZZeHhRNkE5N2hjaXYwVmFIT0FOc2tMdGNyenJhZUlNWVRoK2U2?=
 =?utf-8?B?Q1VDc0JaTTQzdUdhcDBxWDlkSDZ5V1VtNnZpTDQ2UHBsNDJlcHhqdXVERmNG?=
 =?utf-8?B?OW00RnZlZzhNS3l0ZzUxL2E4VW15RGp5ZlFDa0Y2ci9KNWg0cUhXQkJoZlRs?=
 =?utf-8?B?NjFnbUx2Tk9PVlhhdlRjRW5rRmgrTEw2U09SalVaLzBBUnkxOGp6QXhpdThH?=
 =?utf-8?B?Y1hhc09qQ2lpRUlxdjFzdVp1OUMyNUZCeEZuNE1aZEZRMk53VHFxV2NHTjVz?=
 =?utf-8?B?MmtaTkhiQXEvQkpEVFFQeGxjUXl3cmJtdEZxdlF2SXVxQTljSEIyTUFyQi93?=
 =?utf-8?B?Z3lidjBTVzNUazNLa2hqcGhFZS9raXFmMkEvTjcvOU1Bd09nMUpoaWVIdjds?=
 =?utf-8?B?RzdCa0dwVnAxc0doOURjdjBDYWJvL0RCWFlIeG5DTmYveUN2Z1RVNUMvVURp?=
 =?utf-8?B?SnFUemk2WlVQYzZGNDRKUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXByY3hCb0JKL0Z1TnJXTmEyc1h4NExRcStxcERTTE96NTVOVktXSTdRTjcv?=
 =?utf-8?B?S0RrNW9aVU1oNExaTGU3NTd3RGFteVpzL1VacTNTN2hIUE5vR3pkS3BlTDhW?=
 =?utf-8?B?S1Evd1lnVTBCUjlLUFB3VSt3bVIwbjkxZlVNRkh4QytoUUlSTlgzWXJuQnRG?=
 =?utf-8?B?WkVjQklYVDg5cEhUcG9QeVBOVnZYdUttRmpnenQrMFFNUkFGRGowc2Frczkx?=
 =?utf-8?B?UGVoUXJhT2dCakdZb1czRTN3dFVwLzBNT1lWbVc0d2ZYMGMvNzZrWVpSZkRE?=
 =?utf-8?B?czBFNlJMYVB0c21ldnNFKythdmJXV1Fpdi9UZEExWVRxMjhXOEJ5RUNyOXU3?=
 =?utf-8?B?MjBydzFiRkNiMDBjWU9OTW0vNkU2b2FQZXk4YTZGaGpMbmJRbUJOeE5WMHFt?=
 =?utf-8?B?alhQWnVnSERGM280UVI5NGoxQ2dSbHl3R0IvWXR6NzdCWFV2UWpWd0trNFAy?=
 =?utf-8?B?aDNldnN5bSt5R2p3emsvNmdXRmNVcEFTT212VHhOVWdoMUFBWWVYbjdEZ3Nr?=
 =?utf-8?B?Y2d1WFY2c3FHNVpxeWJjNEViRUpmTFpiTmpXS0xMMkRjb1l6V3RzU2tXWklm?=
 =?utf-8?B?SmxMUjhPM3N3RDY1cjlqRnJ5NVZIcUlHR1E0SmViYUx0b0NQeGhtQmZjcVht?=
 =?utf-8?B?VjB5WWx2MGNvS2NEQlN5WUNxaTc3S2luVWQ3U0RzQWw5dlpTZ05JN0FoQi9I?=
 =?utf-8?B?VS9pOGw3ZjhBK3FKZDZPNjAyRFdFY0FGQUVObDhHd2pPd1JTNE90RTYvTHhs?=
 =?utf-8?B?TTdySFJhZDNVNnBzMS9JWlMrYmZDUXU3VndXbXZnY3AzNEVFU01oNUV6TXAz?=
 =?utf-8?B?RnJEMDZ5dDlvakNRaU1EUElDU3Q2NU1BdzV5SXd4TWx6MnhXNjhVUjlkYnZ4?=
 =?utf-8?B?QUY2VzFHdWtwNUdQTHdqazB0amNHMi9UYStNTlpDQTRLWU5qYW9PSGZYVk1o?=
 =?utf-8?B?akdWajB2TC8zM0hBMXgrWnhBbUZmSnNNVFlVdytrWFNWdWNSVXcyQjd3cDMz?=
 =?utf-8?B?UlVqMVk5OGI4SjJHN2NXd0dxODhTeFdlejVGRFRLUXYwUFZWYkl6TDZUc2tM?=
 =?utf-8?B?Z2ZlSWhQcGZXM0RvRnJGc0lyZlFxSGdPa0YzQ2hOSlFET3RpUXdDSWxjM0NR?=
 =?utf-8?B?TzZlb1dySndnRlRobHdnT09Wc3BZYkQxK3l3VHJVTXh6cFp0NlhSUHlPWkpD?=
 =?utf-8?B?cEYxMlo5VjFpVlNwL2lVTlVXdFpCK3B5QloyS21jeWhDVllYckpzK2pMb2Y4?=
 =?utf-8?B?U1FBZFdlalFQNWpkWGl3RXJoY3pGMys0dXJyZ2hoalE3a3dSUEduWjBSellJ?=
 =?utf-8?B?SVY5bUpNMWhhc0xBZ0FweDlWWnJFb0dvb3FRQ01UdERxbGFOeXBMazV3cWFL?=
 =?utf-8?B?bVpSOGNmUW1FQ0tlQjRDazBoT2pLNzJyU3ZPSG9NUGRpTnJBMEc2YVV5N01o?=
 =?utf-8?B?SkhLSkp1NWh1bHZSL284ZzcrSU5mZE1MWnpRNEpDQ1VqMGtVTlg0YVdlMkgw?=
 =?utf-8?B?M3JadkMyMlMrc0V4R042YXpiRWYyd0lIalNtZUptZGtTd0kvbFJsenZRYkhs?=
 =?utf-8?B?RlpsYXVKdm0xUE44dUhPVzZBQXlpQjdMQWI5UFdNYTdubzJ3QmNjU2pJTkFO?=
 =?utf-8?B?ZjNITHZMV0RYcVdWK0hmaXlyWHFhUmF5Z3hrOEVWRERueElKU2RMbXhzTmpM?=
 =?utf-8?B?eGg3MDlESDVsVVdjRk5sS2ZnTlVUOWU4eWhCcXR6bHB5TmVHUUtZUy9nNmVv?=
 =?utf-8?B?bEdkc3ZXc1RmM09IUXQ0YklTdzJkcUZuaGEvb0t1bGhIZFF3Mi9reWU1U2Uv?=
 =?utf-8?B?SUhVSzZjK2V6SzNBSXlONVZXSUhyaVRZTG9SekxSbG1GSUlNeXNnNWc2YkI2?=
 =?utf-8?B?Y0lFcWE5NVVjb0lTdTAzZW9rUU9FekFra0hWaFRZQ1FyNnc5MWJCd25BcDNR?=
 =?utf-8?B?eE82TnN0UGtUeVZqWlM0cFdONVhQWWdELy9ySGlpeGg0RjhZOFI1LzcybXBl?=
 =?utf-8?B?YXZISHdSS0M5YjMyTktkQ0gveWRYZ0pMK1JHWGpvVDlHb1FKeW9SR0tVYnZ4?=
 =?utf-8?B?MTFpbkVLKysxSWpLWngxRytPUVhEYlNYY2RuMUtzTnMrMFIzV2FHenFzbWhH?=
 =?utf-8?Q?/YFW/2xNl60T8WhLtQFuh1px7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8ae190-6b0d-4fdc-72f4-08dd315bd182
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 09:47:38.4497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjUjhPtsq4iJKps8SNtwUOGROaewVAA8idVUbdVQPZbhzDMyxk22uOQvkXGxtbTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6347
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

Any objections that I push patch #1 and #3 to drm-misc-next?

They are general cleanups anyway and this way we have them out of the way.

Regards,
Christian.

Am 17.12.24 um 15:58 schrieb Thomas Hellström:
> This series implements TTM shrinker / eviction helpers and an xe bo
> shrinker. It builds on a previous series, *and obsoletes that one*.
>
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/
>
> Where the comment about layering
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
>
> now addressed, and this version also implements shmem objects for backup
> rather than direct swap-cache insertions, which was used in the previuos
> series. It turns out that with per-page backup / shrinking, shmem objects
> appears to work just as well as direct swap-cache insertions with the
> added benefit that was introduced in the previous TTM shrinker series to
> avoid running out of swap entries isn't really needed.
>
> The series earlier consisted of a LRU traversal part and the current part.
> The LRU traversal part is merged, but is still mentioned in the history
> below.
>
> Patch 1 balances ttm_resource_cursor_fini() with an init function. It
> makes patch 5 more straightforward.
>
> Patch 2 introduces a backup implemententaion.
>
> Patch 3 reworks the structure of ttm_pool_alloc in preparation for patch 4.
>
> Patch 4 introduces functionality in the ttm_pool code for page-by-page shrinking
> and recovery. It avoids having to temporarily allocate a huge amount of
> memory to be able to shrink a buffer object. It also introduces the
> possibility to immediately write-back pages if needed.
>
> Patch 5 Adds a simple error injection to the above code to help increase
> test coverage.
>
> Patch 6 Implements a macro for LRU iteration.
>
> Patch 7 Introduces driver-facing helpers for shrinking.
>
> Patch 8 Implements the xe bo shrinker.
>
> Patch 9 Increases (removes) the XE_PL_TT watermark.
>
> v2:
> - Squash obsolete revision history in the patch commit messages.
> - Fix a couple of review comments by Christian
> - Don't store the mem_type in the TTM managers but in the
>    resource cursor.
> - Rename introduced TTM *back_up* function names to *backup*
> - Add ttm pool recovery fault injection.
> - Shrinker xe kunit test
> - Various bugfixes
>
> v3:
> - Address some review comments from Matthew Brost and Christian König.
> - Use the restartable LRU walk for TTM swapping and eviction.
> - Provide a POC drm_exec locking implementation for exhaustive
>    eviction. (Christian König).
>
> v4:
> - Remove the RFC exhaustive eviction part. While the path to exhaustive
>    eviction is pretty clear and demonstrated in v3, there is still some
>    drm_exec work that needs to be agreed and implemented.
> - Add shrinker power management. On some hw we need to wake when shrinking.
> - Fix the lru walker helper for -EALREADY errors.
> - Add drm/xe: Increase the XE_PL_TT watermark.
>
> v5:
> - Update also TTM kunit tests
> - Handle ghost- and zombie objects in the shrinker.
> - A couple of compile- and UAF fixes reported by Kernel Build Robot and
>    Dan Carpenter.
>
> v6:
> - Address review comments from Matthew Brost on the
>    restartable LRU traversal path.
>
> v7:
> - Split out TTM restartable LRU traversal path and merge that.
> - Adapt the review comments on that series.
>
> v8:
> - Address review comments from Matthew Brost as detailed in the
>    respective patches.
>
> v9:
> - Rebase and fix compilation errors
>
> v10:
> - Use a LRU iteration macro rather than a function with a callback.
> - Rebasing and cleanups
> - Address some additional review comments from Matt Brost.
> - Drop the shrinker selftest. It was already merged as a swapout
>    self-test.
>
> v11:
> - Move more core interaction to additional TTM helpers.
> - Don't back up without __GFP_FS, and don't start writeback without __GFP_IO.
> - Rebase.
>
> v12:
> - Fix an indentation flaw.
> - Rebase
>
> v13:
> - Remove the backup base-class, and use direct calls for ttm_backup
>    (Christian König).
> - Rebase on the ttm_backup changes.
> - Move shrunken bos from the LRU list to the unevictable list.
> - Provide an accessor function with sanity checks to set the
> - ttm_tt::backup field.
> - Update documentation.
>
> v14:
> - Update documentation of ttm_backup_bytes_avail().
> - Work around converting between struct file * and struct ttm-backup *.
> - Don't set up backup for imported buffers.
>
> v15:
> - ttm_backup return value change. (Christian König)
> - ttm_pool restore/alloc implementation rework (Christian König)
> - Documentation update.
> - Remove cond_resched (Christian König)
>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
>
> Thomas Hellström (9):
>    drm/ttm: Balance ttm_resource_cursor_init() and
>      ttm_resource_cursor_fini()
>    drm/ttm: Provide a shmem backup implementation
>    drm/ttm/pool: Restructure the pool allocation code
>    drm/ttm/pool, drm/ttm/tt: Provide a helper to shrink pages
>    drm/ttm: Use fault-injection to test error paths
>    drm/ttm: Add a macro to perform LRU iteration
>    drm/ttm: Add helpers for shrinking
>    drm/xe: Add a shrinker for xe bos
>    drm/xe: Increase the XE_PL_TT watermark
>
>   drivers/gpu/drm/ttm/Makefile         |   2 +-
>   drivers/gpu/drm/ttm/ttm_backup.c     | 207 ++++++++
>   drivers/gpu/drm/ttm/ttm_bo.c         |   3 +-
>   drivers/gpu/drm/ttm/ttm_bo_util.c    | 250 +++++++++-
>   drivers/gpu/drm/ttm/ttm_pool.c       | 718 +++++++++++++++++++++++----
>   drivers/gpu/drm/ttm/ttm_resource.c   |  35 +-
>   drivers/gpu/drm/ttm/ttm_tt.c         |  83 ++++
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/tests/xe_bo.c     |   6 +-
>   drivers/gpu/drm/xe/xe_bo.c           | 202 +++++++-
>   drivers/gpu/drm/xe/xe_bo.h           |  36 ++
>   drivers/gpu/drm/xe/xe_device.c       |   8 +
>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>   drivers/gpu/drm/xe/xe_shrinker.c     | 258 ++++++++++
>   drivers/gpu/drm/xe/xe_shrinker.h     |  18 +
>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  |   3 +-
>   include/drm/ttm/ttm_backup.h         |  74 +++
>   include/drm/ttm/ttm_bo.h             |  93 ++++
>   include/drm/ttm/ttm_pool.h           |   8 +
>   include/drm/ttm/ttm_resource.h       |  11 +-
>   include/drm/ttm/ttm_tt.h             |  69 ++-
>   21 files changed, 1935 insertions(+), 152 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_backup.c
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
>   create mode 100644 include/drm/ttm/ttm_backup.h
>

