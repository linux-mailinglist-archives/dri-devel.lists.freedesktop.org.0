Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8AB2FD95
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E1C10E9BE;
	Thu, 21 Aug 2025 15:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="smlod/ir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367A310E9BE;
 Thu, 21 Aug 2025 15:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDTpb8SnwPrexkWLx+Ib5UBCwK7vbPoA4G+041KvKijoZmMtXjdmUhRrKzi6Xlvg1df1hnFeR5DdDP+D2BTkEpAsQLOoKhbOnLhZQ8p4vg5yJ+Giyhe9ZogXRAYea6fnz8kLMh9dZa76iDZTzq84fMh0EE+pKNdbbsBimJUCtPQ87ZelOH8nauxqIyLPkW02mXji9AS9NXgSHQIYIOT2s6pcr1ZuVu6Kcsx4pjrrzzvuCiUaKNcI7J3QlHHFt4C/qCWRCsWPkQKZcPnfDnkRAZPyjv0X15YhwF1qYkdXi2zqrBNEzvxv5ylCo0lVUOE8v0gSaVbaOSIT3n8J1rrQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcBsyKAuIhtKP9wYpKA2JkCQF4ZtbIJQ+5do+c23yaw=;
 b=iQ/56/JBSTVI8XEf27ZMwj0Fjom+3fitZQbYAKj+gJ6rZ0YcPQGRLkItRZ1vTLEU/dCSJDH2z3pHfsUrJ/40UYFR2trU0y+CDgnyV7mzKoZPHYadi/hXBWS+hc/HoVgTpR0HMLEFC+/cgF0p0s466Xl0bJqcM+YSRi5Hvt+qSLfQZbfJKtCoDACACOnZgBHBpLprRUd50BLxTd9Fdud/bkhCw85zMG58a0/Zo1JpMr4wLkHmp2dFVx/lH0SfV2+F8HcnWeX33slu9PyNTlbLVCJXezllR6fLH+mmvT7I9GxEJ48032GsW8WpA2VRlnMJzW87dU2TcGD53+GTdrnJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcBsyKAuIhtKP9wYpKA2JkCQF4ZtbIJQ+5do+c23yaw=;
 b=smlod/irVT4Eg5Cwn0iryGQbuUL9w73YXlFEby5YzLqedoYP2auUuTA0anWDlJISxCRPgk/yGoY9UvU1QuXqn0NKhPfh/FH054MI3pgJTsvNfJRafIog3SfmuxAsq18s/OTmwNA6HheEeDCCZ0DX9fvmayVwZK25O65fbeX5qRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 15:00:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 15:00:00 +0000
Message-ID: <d3f60146-39d3-458f-8271-cfcec1c92254@amd.com>
Date: Thu, 21 Aug 2025 16:59:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
 <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
 <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
 <fd34b897a3223346518d3fe009772996eb25c90b.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fd34b897a3223346518d3fe009772996eb25c90b.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: e65f7419-9126-4a35-0d34-08dde0c366ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2R5YjBLQWVySUd1Z1FqajNLTUJ2a0NiNHpiU1BkRS83eFFEWEdqVU9GT1RN?=
 =?utf-8?B?YXBISUdMbmZCdW95ZFdHVUNRaC9mNWF2YStuRVNpaWRDaHRCTUFQQlhrRk13?=
 =?utf-8?B?cDdZd1M5aXNKL1laT045THAza3U2VEs5eFhNUmdIOEZiZ0J2MjJzcjY1NXoy?=
 =?utf-8?B?UXZwaGk1RUhReUdmUkRrOHpwZUh3QTltS3Y3WE1uc0V5Y0phU1I4WnJxUW8z?=
 =?utf-8?B?RVY2NXBRSXNPNUREb0xuWWxHWFFodmxsVUdZeFh3d2ZsMzFpMmx2NXhnR1NE?=
 =?utf-8?B?RHpvUE9QcUFvZnQ4V1VVeWdVY2ErdnZjdG5Xdm1iSFp3VDJ2WHBuam4wR3Qw?=
 =?utf-8?B?cmRYTXJrNll2SWhkUmdkNEFlT2lEblEzRjhtVmU1Y3E0djM4OUpHckpXWDRD?=
 =?utf-8?B?OTExUEM1ZWhReVZtMmhtZ1NUR3dIMGtXb0NHTk4yMTBVTzc0OVczM3llZzZ3?=
 =?utf-8?B?MHk5VW5qN0Vmb0xUKzVkeFBFeTNXU0wvTGlmWTUrRFdNNm0yS1NqSllxNUV6?=
 =?utf-8?B?cEtpZTI3bDU1UWF2aGlPMVpHTzVEbjZUcXFxN1RJUkZpWEdNRk1vNUM5YjhU?=
 =?utf-8?B?clg5cmdSWTBXVUpIK3JneXJRVkFkU09nK3cxWXFRTk9LQlBMcWxIVmdaRkZC?=
 =?utf-8?B?RVY1R0Z3cFhubkNxVWJ1ZlpDbW9SQ3ErSUJuWVYxRGJYMU5aelRaY0hub2Ex?=
 =?utf-8?B?bysvQTNrZG5FYnFVYWswOWVaSXlOWCs4djJJN28vd0c3ZnJWQkx3dEtTNllW?=
 =?utf-8?B?Uklwa2Q0UkRGQlVxcXYzazIyeVBHMDZHamhzS2JZQ0p0aDhRK0V6RkhYMHg3?=
 =?utf-8?B?OE5tcUpWRUVDOE8rdEVTRjZVVi9ubWZRc0wwa1dMejRMR1lDdWtUakVxNWVh?=
 =?utf-8?B?L3gvUTRETkpSS3VTWXY4YWdYb0JYU0dlbVZ6SzRIcGpvREN4KzJ4TXEweXZm?=
 =?utf-8?B?WEJUSmpGZHJBYzJDQ1Q3bkkxdzJlZkxaRnRMQUsvWmdrNkxUY2RHYmJIcTdl?=
 =?utf-8?B?dGE2NkVhaUtGY2YrYjZlcUVyYlNxVURSS0tHT1VGaGZ2ZmdhSzJwbEVaM2s0?=
 =?utf-8?B?VmdzVGhvelBnVmFoRHVTQlZnNUU5MzFacWU2Q2MrZStGSENPdUVOZk1adThq?=
 =?utf-8?B?d2toMWZlWnY3YkRCUDBuM3BlT2NrZW9McndWOE9GNDg0TmtGWFRPUzd3NmVE?=
 =?utf-8?B?MU4yM21za2tST0pLNncyOHFEWFpXd25KaTg5MEx1ZS9OcW5lcnFaNnhBelBS?=
 =?utf-8?B?R21WV1Q4M1JhMCtlNXVQZFYzZmNKaFJBL21IVUxLWnhEN240QS9TU1FwWnNp?=
 =?utf-8?B?bWVWOUI4bzZ1dmg2c0lxOC9oSzkrelpwcm4rQzVmcUhucVkyU0d6UEdTUHFH?=
 =?utf-8?B?QVI4R0lGOEVjd0x3dWVMVXF4TTZhQkJ1R05meGh2d01jQS80ODJqUUsrNkcx?=
 =?utf-8?B?a01QUklxYUM2bGJoVWtTWnM5NDU4TDVWMFVucDFMN3dMc1BBZjZWVXBjL3lI?=
 =?utf-8?B?K1U5YWdjRURUSVhCaVpja0pJQjBQVmpVS0JoM0d5NlF1WDRKZkxGUlNvd2x0?=
 =?utf-8?B?M1A1VEIvY2lmRWxNbFVnRUNGbSsyK3dLVU5TclY5NTNwZWp6NWdtR2tsRjEy?=
 =?utf-8?B?N0s3bVRVbXJyZnFWQlFRd2w3UEYreFhuRlNBb0tQZVFmZVcwUVJPQ2lVbkd4?=
 =?utf-8?B?RCtGTWt0WHhLRVJEYWRnTWI0elk5QXNobmFNWlNHc2VKNnBtVjcxZUg4LzBi?=
 =?utf-8?B?VUZmU29RYXJ3R0liQTdGMzhsUzFtc1FvT3pmYU5xSFNoMFFVaFRuUk1ENGVo?=
 =?utf-8?B?TnJjZGZxK2Rtc1FkWTd5N0dHejJuVGRVWndEWWlwUVdrbWs1ZmFnTTNQa201?=
 =?utf-8?B?TmFBandkbkkyZjBzbk9OQnVJbzR4eWV5S1N5b1pMMDdlL0J2RU5ZakR4RDR4?=
 =?utf-8?Q?FLZSx3/xXao=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUErWWNIMktxZE54M1E1Qm9id1hvQ1RMblZQU1dnZmFhWktSUzVnNXhqRnh1?=
 =?utf-8?B?VHBTdEJvaCtlbHNSejVLRGFUcFBiQ2NYMEdZcVVBRDN0eE1vL09MZHZ0S0Rp?=
 =?utf-8?B?N2FtUWJaLzMyT241M0dvY0ZEeGd5ek0vWWtSc2hHM0lpMSsxOVREMS8xZ01Z?=
 =?utf-8?B?RWh6Ulc0Z3dBeVNzQUkzUFhYSUdINXRWcUt5S0FQd1BEMUhsQUJRSEhySVNq?=
 =?utf-8?B?QWV0OTAzdUora2pXdUlOVHE2RmhaSVdnWVlIWlVGakZVcHhKcmxtUmxhUlVk?=
 =?utf-8?B?UDdZNGJMSHh6dFNvTjlkTnlLSC85VHY2Q3VDMTh6d1U3NEJqRVBGV0FSNVMy?=
 =?utf-8?B?dXZsZU56ZHVYUUtuMW1IcHg4NXlsdWlsa3ZacnBTREc1TjFJMXkyVlF6aFNj?=
 =?utf-8?B?R1p4amk2M3VjL09zQ2ljMkErSDhWeXJTM1BSK2tUMTVoTmFDaDVmT0dYdGtj?=
 =?utf-8?B?bVR3UW5iMnhXd0wzMmVrM2hkVU5mdit3OHZ2T085TkFoRXg2dnFoL2ZYZS8z?=
 =?utf-8?B?UElGL2tlMCt6RGxrbk1PallVcmxxWm1zYkE2bVhuRFd2ZmJlQThpczVES3hs?=
 =?utf-8?B?dnRwWjFxZkhlQzJZMXgyVDN6SjEvdG1hNFhLRitkRldJRnNLeEsrYnBxV2lm?=
 =?utf-8?B?NHdQbEFEdUFWQUhKOHdFMG1GMzR4bm5ZZXNtcnR0STRhajBmTVdRaU1YVmU1?=
 =?utf-8?B?YmRpMjhoZWtJRlFoZGtraDJ1bDhJMUJJTzhYNGRvcXZOYTFOd2paQ3JHZnJQ?=
 =?utf-8?B?cjBuZHBSUDJWNERFRDlIUWVZTGtBSTJqQjdLN1JDTnJXbkczWGpEeVlqUnFK?=
 =?utf-8?B?R0xKbXltL3lWVXJwZzFaSjZDa1RLNW4zeUliRDRpdnB2Zms4akJjNCswWER2?=
 =?utf-8?B?ZE5QRDFBaldXUmRxdFIwcTJtUlNMWGNxNGlXemNGRlZPQkUyL2pHTDM4SnpG?=
 =?utf-8?B?OFZBM0E4YjFkSWhtWDR0RGU4cVZxQmlDU2hsYVR2MHNQdEl4TDhjenBvaC9K?=
 =?utf-8?B?QlEwUjNobWQwdHBvOWR2eHhwV0pGTUplZlhKR2hKSGVDTEpTRXgwbVJxM25V?=
 =?utf-8?B?ck9KaXc3U2Q0RmNXdnN2U3liS25WanNKWkpYSDlESmg5MlU2MzNSZW4xa0dZ?=
 =?utf-8?B?UVR6V25Vb0dqa01vTHhMYklTSDZ3MVVKdkFSU1REMDlpWU43WU1GZ3FzYUtC?=
 =?utf-8?B?cHU1VFJBd1FCd1NQR28vVU5vZEhpRlF5YU0rV0QrUys3YVFWUzBGR3JhUU0x?=
 =?utf-8?B?bEo1MFh6NjJVTmRxbzJWWjBITVNOSElqbStvUW9uRlRKME9lbFVNaDB2WVBU?=
 =?utf-8?B?aGpGK2FtVk1nbVRlb3g1Wlp3WDREQ3hqbmpXNllwaGgwSVJTcFBTWG1hMEx4?=
 =?utf-8?B?U2htd28xa2l1cW12MmJhVkdzaFRKZWRFS000dC8xd1JVOGFTMFR6bmZJMk9t?=
 =?utf-8?B?a3U2cE94dE4rZjdnZWpXMmlxOWJTRm9Ha1h4Uk5QNEh5Rk00ZC9CVjRoU0dI?=
 =?utf-8?B?aER2dnFLM3pweW9qSkwvMHVDcnhXK2htaWpkVzFURnlYNXFvWmFJa2NqcmJr?=
 =?utf-8?B?S2hNUVRyYzU1MEhXZ29uajJQZTVDTXJSNnV6TEc2Ym9qV2YvSXJMZldrTGxK?=
 =?utf-8?B?ajliRGpaYkNFa09KL3hNb0hNbmtUODJFMUxZYVZtUDR1T2JZdXJEWThlak5r?=
 =?utf-8?B?djlmQU9QZEhVMjdvYkt4OUpkOExCMFAxajZvOWpMQnU2eGE3SDdHZ0FvS1dU?=
 =?utf-8?B?ZVRUdC9adFFUOHZwMEpRL0cxd2tRUXpqYjRLVkIxN3Bhb09pSEpEdFBxaFR0?=
 =?utf-8?B?dkFwQVQ0dzR4VDJReFNBMThlSnQ4YTlSQmpQUjk5RExRa29yYXFXdmdDTW5B?=
 =?utf-8?B?SlI5cjcvMVpJdURpUlJFZXlqRXgwbVp6aWNNTDNpNXl3U0srZTZyS0I4YXNl?=
 =?utf-8?B?QTd4cjFjcTVhN1h4ME5RNFA5emZFTW9PZTBtZUVrQmx2ZXlGc0NEMHR2V3M2?=
 =?utf-8?B?YnhsRkRrZnQ0VUlhd0FXbDcvT2phY0FaVmtmcTJWS2FwVHRsZXdiWmMxMkkz?=
 =?utf-8?B?TTM0OUZvS1BkWjBHRDZMcWlTWVZxWXpCT0RuTTJFOGVFYklsSUhWZ25nQ0FH?=
 =?utf-8?Q?1GXAD4V013jpIBw/3LESV+qqa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e65f7419-9126-4a35-0d34-08dde0c366ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:00:00.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVMcxluiiM2a3iADP77RM6e+Y38OZTWl/xQ+gLfAWcJ+BEGWxKw2AK4DgHBNxU+b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919
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

On 21.08.25 16:06, Thomas Hellström wrote:
>> What are you referring to?
> 
> https://lore.kernel.org/intel-xe/a004736315d77837172418eb196d5b5f80b74e6c.camel@linux.intel.com/

Thanks, that one never made it into my inbox as far as I can see.

> A couple of questions on the design direction here:
> 
> IIRC both xe and i915 has checks to consider objects with a 0 gem
> refcount as zombies requiring special treatment or skipping, when
> encountered in TTM callbacks. We need to double-check that.

I think I've found all of those. The one in i915 were actually not TTM specific but try to catch the same problem on the GEM refcount.

> But I wonder, 
> first this practice of resurrecting refcounts seem a bit unusual, I
> wonder if we can get rid of that somehow?

I was also going back on forth if that is a good idea or not as well.

The usual solution to such kinds of issues is to use two reference counts, so that you got a multi stage cleanup approach. E.g. backing store and object, like what mm_struct is using as well.

The problem was simply that TTM/GEM ended up having *four* reference counts for the same object, each was doing something different and they didn't worked well together at all.

> Furthermore, it seems the problem with drm_exec is related only to the
> LRU walk. What about adding a struct completion to the object, that is
> signaled when the object has freed its final backing-store. The LRU
> walk would then check if the object is a zombie, and if so just wait on
> the struct completion. (Need of course to carefully set up locking
> orders). Then we wouldn't need to resurrect the gem refcount, nor use
> drm_exec locking for zombies.

I had a similar idea, waiting is already possible by waiting for the BOs work item.

But I abandoned that idea because I couldn't see how we could solve the locking.

> We would still need some form of refcounting while waiting on the
> struct completion, but if we restricted the TTM refcount to *only* be
> used internally for that sole purpose, and also replaced the final
> ttm_bo_put() with the ttm_bo_finalize() that you suggest we wouldn't
> need to resurrect that refcount since it wouldn't drop to zero until
> the object is ready for final free.
> 
> Ideas, comments?

Ideally I think we would use the handle_count as backing store the drm_gem_object->refcount as structure reference.

But that means a massive rework of the GEM handling/drivers/TTM.

Alternative we could just grab a reference to a unsignaled fence when we encounter a dead BO on the LRU.

What do you think of that idea?

Regards,
Christian.
