Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A0AAC3EA8
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E237410E31F;
	Mon, 26 May 2025 11:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yU2oA5pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2059.outbound.protection.outlook.com [40.107.100.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD8810E31F;
 Mon, 26 May 2025 11:36:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWV/zBefkrZgkmqg1ABnd6i0gsbWz2SIGYF6IpQWDPQulad9lJsazFj87ZX9jquOaUL17ww3Q7f0Tt6sp2/7poWfWkgUe7EOf7+OEfsFAkPxY+osgwqw8MxTVnpn/52QaM9MYvYwWbEQtmAgqrlC2uOKwPsso6EarFv1GTZje+zJb7CUSef9fJUmc8joeIwtpEbVPTcia4DX0BJJpwR+wFCajtitqftG90vOgDwBbLzTXhtgyc0H3hScm/wn4dvNVeXr7cmfG4c1r2TlKXkHDgIMCtQYJjfSqOyO8J9DPyrH3Kt79tndyzrpGn23/Jb95Oy312kxd2OxNFWhzY1cOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZxUFU/46phmwuZHEjRitL7U6HVuZvygrNCmnOSS3J8=;
 b=R44ptUJ6iSgfF9t1MN88EJjNP906/n10ATCCpvJFA77J5ItD1fH7GbvYjdrahseVyZ/8LUkP4t/y5WeM/BA/guQF7q+1qoyRnNDSltPz7g6cvxTSW1e42YfvhTD6ujgZ7MLJ4Jxy8Y90ygdeWfqviKK5OfhnJO46g21SWg+HbfQYJNyvwSwa0fYWg/bOtyjZYwMGmG6sVxSKvqFQVvgj8il7OP+WA0vBbRfVRy8qL74khPSFYgtnRcF5Xiqhvjdpkp1FYngBZcPFVlSXqWD2OW7OXPfz+fizZMYdsQMG1ih1AyHa1DcLZmXyVHyOhIr4bxsci6RlbsaNE5LQ161/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZxUFU/46phmwuZHEjRitL7U6HVuZvygrNCmnOSS3J8=;
 b=yU2oA5puJ5qGQwDcx+4tS1iRfCl/H2nmENIbWiAzU7XsLU7pikqFLTI2lKu7h89spmrpkJp1J7j1e70D7z325J9eIEy65GeeqabQz+sXNbiXKHJPwyLAMSqVSxoQFHuKd75MNzyEbqtk7yw9AnNmdA9NizE/QyP52FSwXZxLleg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 11:36:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 26 May 2025
 11:36:20 +0000
Message-ID: <f9830eac-c491-4702-b74e-f523728bbfd1@amd.com>
Date: Mon, 26 May 2025 13:36:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
To: Danilo Krummrich <dakr@kernel.org>, Matthew Wilcox <willy@infradead.org>
Cc: tursulin@ursulin.net, phasta@mailbox.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDGqt0jERFlU42J6@pollux.localdomain>
 <9ee10cc3-733b-4d64-b396-28e62c631dc4@amd.com> <aDRNGnPjmFDwzPOR@cassiopeiae>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aDRNGnPjmFDwzPOR@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0005.prod.exchangelabs.com
 (2603:10b6:207:18::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 263ba451-79b5-4dda-aa74-08dd9c49891c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmM5cVVCTStiZHI2TmVzZjZtWmd2S2dhVVJqQkMvWUQ5dElKNXQ5NzMxeGt6?=
 =?utf-8?B?anBFTFNzcWF6M3hxblNjWEpINVRPdWx3RzFZcHo1WTJNY2dqN0VnajVPS3Va?=
 =?utf-8?B?a2dJSVE1Nlc3N3dQZUV5dmQ2S045VjYwdENRQnNXOGpDbTdYQUhLNXVScVph?=
 =?utf-8?B?K1prcVk0dklvNUhaL1g1WjVkWDloenY5cUtCeWNoODhQbjloVFozZVpKcG5D?=
 =?utf-8?B?SDJ1Ti9ibmwxWEh4NW00bkZGWVhzV2o2M21EdSt2akJmdHoycXEyVWw4MEdi?=
 =?utf-8?B?bVJEVGRIL3JheWoyQ0xFNmVXVFZQNVhUakZ3SE1nakdoV2d2RzJZeWc4VWx4?=
 =?utf-8?B?c00yNUpqWTlpdlBwbXkrUmY2OU5lRThYM2hDdEF1ZFMxd3Q3NnVwSk1yZUw5?=
 =?utf-8?B?UFRKY3VCZjduZ0RKQnY1d1N5YnpuZWlwMkhkMk93eVpxdm1mSENLSXpnajFC?=
 =?utf-8?B?Z3R5WFN2akhqMlRjZnNCQ2dTd08ydjFoSjBCSVFrTUxFL1BmcTVZRFdkVDl0?=
 =?utf-8?B?Vm4rWk9PWUM2dW9iWE9qNFR3aXV3elF5d0VLRDFHME90ckpERXJJenBqVDFl?=
 =?utf-8?B?ay9FMXhRZzU2NzJBaHJ5cFUrU3hwelJqMDFFWGhSS0FjRFZnNDlhYlFab2Qr?=
 =?utf-8?B?Yjg1TDYxWDNqWFVhWGlzR05IMzd3VlhtQmRlbTgzNlZXTzc4dENCQ04xbVMz?=
 =?utf-8?B?NlVXcDkzUVNHZGQyNWJ3dXhaTzNOVHdYV2xoSXhwMFlnZmVKMkxqTHlsOWhi?=
 =?utf-8?B?THZOY3l1cEd2Y2RBeHdOcEt1YWIweklGUHFzUDNwRzFyUCswU2FoZnBqWGVC?=
 =?utf-8?B?bkFNOFlJcE1kb1psTVZVTEczbWZyTjhqRUdPa2dXSW15dUFSNjVNYlE4a1F5?=
 =?utf-8?B?OXJnMGdJaUdVeTB0MlYwSG5XUXlTVWRlSzhkUExCdmhFWVVXaDJOc3VaR2tt?=
 =?utf-8?B?c1RORXdBR3hCTHhneDFqWlZqaFdCV0laVlRZR3Ixb20xaGhqcG1YWGNzWDJk?=
 =?utf-8?B?ZnEwanhrUm1nRnFOT1lZeHBUMzgwREJEcmd1VjZCQlNkd3NYNTRkRE9BUGpG?=
 =?utf-8?B?QTBaWStaMytIVmExSFZQRHJTSVp5VXdGVnpUT1BYRTBaRWFIdlFqdTNld3Zl?=
 =?utf-8?B?RUdXNG5IRnJOTEZ2cWNuTUR3KzdxTmYvRDl4SjNya2tONlYzcDZ0emVjSlVk?=
 =?utf-8?B?ZmVQbERQTFVqUE91bUJ3TTgzNXZqTk9sUzB0akl5NXRSS1BCYm4rbGVNZHM3?=
 =?utf-8?B?dFZDK0VmSUxPSHJCZnREK2s3bEpCSGJFSFdHZ3hMV0ltN3Q5S2czREZZbDVj?=
 =?utf-8?B?ZEwyV2xoLzhhRHdsbkxNbGZOMzMzeEl3czV6cFJYdEJITXpvaldhbmdHb2dV?=
 =?utf-8?B?R0NUN05lUks2bTBxM0w4VmlCZlZaNnN2cy9MbEpaRi93YVRmZFJlT2loc2pT?=
 =?utf-8?B?WWJpajhxZU41TVc1ek1WZjdUeHduMVlTWHZaeTlEVE1XM2R6NlBYUC9QUThj?=
 =?utf-8?B?dlBVaHdtWHg0MjYrckpjM3k3OWZjbmNRVXZxMTRYODhVcmJrUmgybmhYUWdW?=
 =?utf-8?B?Y0dTKzlIMnRjemRQckhYd2ZINCtHR3ZBblYzcFNHWEZYLzQzbHVsYnNxMncv?=
 =?utf-8?B?ZEViUHM1ankvMC9CZmNFY1pwejYzaTVIckp3WEFoVk1JQ3Myc1pKbVQ2ZlRV?=
 =?utf-8?B?RlRHekFIU3c5WFRyUTdneWRMbUtsaU9wenR0V3ovV0I0ZUdwMFhkOVRRVjgz?=
 =?utf-8?B?NUI4Q1lmL090TnlSQlZRUlArU2hlV2JicERqR2hQNE1VNDFjZGFWMmFqd3RZ?=
 =?utf-8?B?bVIyL0l0T0VpK1pCdTRxZlg2eERCTDJycVNrUDZtb2VOVnhxclB3dEM4MEJ3?=
 =?utf-8?B?RnBiNVdXemo3Y05KaHZOYXRMUDRFTmxNck52emVqRG8rYUc1VERReWhyYnAz?=
 =?utf-8?Q?+Qgjp+N5SjU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFBYbGpVajFJcWxReG4vUmY5b1h3czdINUlKZnh1RTV2YWNVdDd6UHp0bU5J?=
 =?utf-8?B?ekROSUtocEEwYXhiUUU5dFlSSVM5aDIxQUhpaFBaUUhuNVl6cVkrQ2c4emtt?=
 =?utf-8?B?NWx6NHA5MFpmN2ZDc1JWa1MvS3I4STF6eG9IdWx1OEN6RFZaelp6VHJTN0xa?=
 =?utf-8?B?YjNnVXFSeHRPRFBCckdMaWVuaVlRNFY5LzMxdGcvclF3MisvbFJXR1BuU0hF?=
 =?utf-8?B?NTFHNmF2VTF1YXFWNTBoZmZlNFBoVHFHaXJuWE1zSVd1NmhmYkdkeEp6V3hz?=
 =?utf-8?B?eU40UnFUSDRzd3NRb3UxUkVxeFVBTEN5NlpYV1dBbFl2WHRYNHpHeU0rT1pD?=
 =?utf-8?B?TjRKN2dtL0JhSFBDc1RNMEVYTEQwTGxFV0l4QnM1L3lMWjhUM3haQzlrcTFX?=
 =?utf-8?B?czlmY00zS2xReG40QzRMOFJrZzR6d3Y3SFdwSXAyak9TT0dtS0poUTk3S25E?=
 =?utf-8?B?UjE2empiK1RJRXM3VHM5UWN5Sms2M0hnY1crN2o3NFZrbHZoOHRMelNia3pR?=
 =?utf-8?B?RmljVHJkYkx1QzY4ZlJXWDVEUmJ1VlVocnNiR1E2TG5DZXQ3Z0FSbnpmc3RZ?=
 =?utf-8?B?MjJhUG1GUi9yc0JHSytlSFpwWlZLajVkTWxDZXYzbFZ3cXlCanh5Q21KejZ1?=
 =?utf-8?B?WjliOVE2amFHNWNXR1Q2Sy9PbGVueFpyNkM2OXREUTJWUlIvOHN3VTQzTjJq?=
 =?utf-8?B?OVkvdTZWejFURmY0c3RDUnFYQ25pRlFuUGlqQW9yT0M3QWcxU0gyUHZnRGFP?=
 =?utf-8?B?NWVuVFFBbGdDcnhLRHo5Y1JXbDNyVHRHdXlPbkpGWTNVbFVSTE1OempvZjg5?=
 =?utf-8?B?MStKMWowQURDb0xZc2t6aEVUeXJFM3lXWmY0WDZiRlFXMk13UEJCMXNCVnZD?=
 =?utf-8?B?L1lTWnFOU2RqaGhoeHRJb1h1bGh0cngrRXorVndrbkhabHVkV05aZjI2U2hD?=
 =?utf-8?B?Y1puMHlxcHMrYVdRNjNEdnF1cnJ4UkZFZCtMNW1RZWQ3VEI4ZVVpV08rOFh2?=
 =?utf-8?B?WGNnUkhuanI1Rk5aeXVQUWIvZVpjTlhUNVNFYkx2WE5ZM21UN0haVkYycFFX?=
 =?utf-8?B?a2pCQldxK3lIaXJJalVzSmNadE5sNjJ2ajE3b2FKcmRYNTFpYUdSVStRVUpK?=
 =?utf-8?B?bkY3Q3RLM0hkY25sTzRvWDd6a1pqQi90Y3hITXBBb0Q5V09URnBUcjFMcmY0?=
 =?utf-8?B?ZzdiUjJLOWFZQ0xEbjRwaDZPalVPOEJ2N2wyQWd3K3BRN001RTBJTG80QklT?=
 =?utf-8?B?REZvSEJISDFQTmQ2bEZlc1BNbGVzZ2djVEZ2U3A3L0ZtNVFTOXNIR25Kdzc2?=
 =?utf-8?B?UXd3ZmFSK3FSTkt2WHVadXNNOGtMUVVUVWxmVmxSRXpUQk0rUnovQUNzOUEv?=
 =?utf-8?B?Z3ljOVhYUCtaZHNzRWNZazBxRFhCWlJvQ0NFYlFQaGtRR256MEJ1eWtCOEls?=
 =?utf-8?B?NDBzTzJldWFMVDczc2VpZHZKN0lGc0RmTXFIL2l4YVg2a0dXYTJWYm8rVjly?=
 =?utf-8?B?YndhTHI1Sys5cXpDWlNhOU5SanhSUkdUUEJlbEdHbmJ6U21CTXE3OG9vRDN1?=
 =?utf-8?B?S3BETXYxcFBDazc2ZkZqYnNObUl4MnBQblR5RWUyNmx6WVVqcjRWRmVNVm1v?=
 =?utf-8?B?UTJYWm14Y1EwUVl3Q0hvdUd2b01rZnVYaExHVVB1ZVRCNWZBUE1Qa2h3Qlpv?=
 =?utf-8?B?Q3hqTC9xQzR1Vlp1SHE5cktyaEQ2Yy9pdGl2ZTd2RUZhRmtHdVFpa25jQXNL?=
 =?utf-8?B?TUJKaXA5UE1MaitKWVlJMG90ZU9jM3gybVQwUTlJd1VwR0JaaWl6QjRQd1hQ?=
 =?utf-8?B?WlZ2UmF2RDAzZ0pGSzRncmM4UU4vMjk0ODdtUXRYSG16aUNoVGhkZERXc1c3?=
 =?utf-8?B?Qk9QbThKLzJmNmJ0WFhqMWtZSjBGa2YzVWRLRnFTcm5mTG44eE5JWEdSR1ZZ?=
 =?utf-8?B?Q052RHN0Rkp0TXhlbmFGRHByYTAwalBZLzdSL3kvZDlZNXhEVWkxcjgzckpE?=
 =?utf-8?B?TmZYWDlXSlJpa2lMSHV0VWxDaHVZTXo0RWVMT2diVWNCOEliczFYdm1EazZV?=
 =?utf-8?B?UG1vdVMxR2xWNFp0MHA4RmEyOFhGRWQ0eTc3Y2c5b0tLVnEyMGtJbW5MRkZ4?=
 =?utf-8?Q?tAKU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263ba451-79b5-4dda-aa74-08dd9c49891c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 11:36:20.5177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTdCDXO1j96dFMiSk8Ku75oPjJbxJeuq+Bse5BjsxJqUtikkQc1fIwXMX/HK1pea
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
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

On 5/26/25 13:14, Danilo Krummrich wrote:
> (Cc: Matthew)
> 
> Let's get this clarified to not work with assumptions. :)
> 
> On Mon, May 26, 2025 at 12:59:41PM +0200, Christian König wrote:
>> On 5/24/25 13:17, Danilo Krummrich wrote:
>>> On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich wrote:
>>> So, your code here should be correct. However, I'd still remove the goto and
>>> just call xas_store() again. There's no reason to make this a loop and backwards
>>> goto is better avoided anyways. :)
>>
>>
>> I was considering that as well, but than abandoned this idea. The xarray() sample code and test cases as well as the use cases where I took a look either use a loop or a goto.
>>
>> I'm not 100% sure why, my suspicion is that you need the loop when there can be concurrent add/remove operations on the xarray, but I think we should stick with the common approach.
> 
> I don't think that concurrency is relevant here. xas_nomem() stores the
> allocated memory in the XA_STATE structure, which is on the stack.

Yeah, but it could be that when you have a concurrent remove that this memory isn't sufficient and you need even more.

> I know that for maple tree a pre-allocation is only valid for the exact state
> of the tree it was allocated for.
> 
> But I think xarray does not have this limitation, i.e. concurrent modification
> of the xarray does not invalidate an xas_nomem() allocation in terms of being
> sufficient for a subsequent store.
> 
> @Matthew: Can you clarify this please?

While at it: Is it possible to run the xarray without locking?

We have exactly one thread handling the job at all times, so no concurrent accesses whatsoever.

Acquiring and dropping the lock is just additional overhead and without it the memory can also be allocated just with GFP_KERNEL.

Regards,
Christian.
