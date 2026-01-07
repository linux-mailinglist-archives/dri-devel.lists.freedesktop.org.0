Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A0CD00241
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 22:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5314C10E115;
	Wed,  7 Jan 2026 21:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Rht53Xbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013010.outbound.protection.outlook.com
 [40.107.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABD610E115
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 21:19:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEH7nhFa0ij9g5P7e+AarcdYneTl0r92fJD8xSSQxXSQA/i6qt2WOBvpSwlbGIreAUmOL5V2Jt2QY0k9j+6hGQaGKQ3yz6stdUi9rRqohr+BNxY0fazDITZ/I+gzJhAjA4tOLKxj0FhgU4lNN+TrI+g5RIBn6zE2UUqkZNI9gqSPELRVywbtTrtkyzKR4gMpiCowJgoyYvxtC2QIYrVw9M9Lb+Sh8KIuKw0IrcwBEWsBc+05ICHCAiQ8EbvX5oe0J/e2VZMHqtx9gBrnlYFbBSV5dzBUFqRJS8um73h///yQZVLDgXBc5z967GnG4PmwZA8SVdH4YeAI710F9xsTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbO2VIHihFbeUDCfWLgvHRPCppBPpMamfbhN58euglY=;
 b=L/pLWyhbbfVkcS6YE0sMwC5daL6u1MMQdxJHj2nfqVrScjhV3UDn4wvcyypBMmtB/pkVtUzu8WiwuXEjBcAtSiqN440Y2XGjrxsp+dSdvOknjFpbJ9li8JfPm0M/EKBsXQluPESfCuHnHb93T6qHxqRIysvo5+BKcd6ImYzgXMDYvhW48yArkF41sX0kOU5zlYsiDeVWukJonv1uJ7EreWLI+qoc+8BkNACf73bgdz3yzJOepGugUeDcKlEKHxBkwtsYKa7aaF0Y7nHde/0d2kfS+yttyI0/L4MZK9P965rrOcako3CU+LDV/ZHsGaLwPPRSwbxTQopXs3JE/iSihA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbO2VIHihFbeUDCfWLgvHRPCppBPpMamfbhN58euglY=;
 b=Rht53XbmFMTclrvXBimrRdR7nk9O5SZE+MdFDqfysxJaR3inLtb9NSaM4waA4O+YTimWTgWKzKAWXzSRNrtbExRPiKMvtSUwa4PWzt7fUlEnEabb5osz2XBhQEgNUjv1BvezfbWa/+6/4Ko+VGRKF9GdZiZaVH4meKeByrvPAz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7432.namprd12.prod.outlook.com (2603:10b6:303:22d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 21:19:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 21:19:53 +0000
Message-ID: <812bcf91-d903-410f-91c8-8a71be3f3f02@amd.com>
Date: Wed, 7 Jan 2026 15:19:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] accel/amdxdna: Update message DMA buffer allocation
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251219014356.2234241-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0051.namprd04.prod.outlook.com
 (2603:10b6:806:120::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 6680cf8d-d8d1-419b-971f-08de4e327fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0RYQmFEbTJ6cTZhVTJ4ckVTbmRMWjhpU2JnbTU1TGNvMDJDWENjRVVjL2xB?=
 =?utf-8?B?bWxwamFUVmwwV285bGl3bWZFUmZlWFpyMk9nMVp4TlZLcUV1V0ZnZ05TUWV3?=
 =?utf-8?B?Zk5tTVJ1YitXMTA1NDR3dlBqbW01aU9GZEdCbHd2M3NwS1FKbmtnb0dOK1ZG?=
 =?utf-8?B?TW03QWI5M2M4eG5wL00xN2pWbjRCTnlxcHJaZ3pSSlVmZWVtaDRod2NiQTBh?=
 =?utf-8?B?dXRmL3VFdENmdkphTWc5WTBQYWw2dEYzMjhwWE1sRkhUeExvWHpIVGE4UzI4?=
 =?utf-8?B?aHRSdExPR21FdG54eGxRT2RWSW9VS204dlZxREdpSlEyanV4YW1vd09CMTkx?=
 =?utf-8?B?ajZ5aFB3Ty83Q1NBQ2MwRXl6WUNyemRycll2TXdiSktnYUVud1VMbmtNcE9q?=
 =?utf-8?B?Kzc5ZUx4THpwdGFJWldyUjdXVytsUXp5WG9lajdHRENIQ1AxaHZqVldPN1pz?=
 =?utf-8?B?S21tUStqajVTNElZd3EzY3NIby9RMGR0alh2NjB2OWRidHZaUGk2bzVkcnVu?=
 =?utf-8?B?endyT0ZxSVlyNTI4S3U2YjI0OWJpWVJYOFJxanZ3dVo1d1UxNnZPQWVISEpL?=
 =?utf-8?B?REJVZTFWQUpYM2RiYjVES2MyR3gxcjBnMFo0djJZQ09lWllReXVKcURMWUc4?=
 =?utf-8?B?Z0NRQWhmSlU0RU1nYS9vaC81R2JQZFRKTlRiaGpzczloVm9LMlhPaktyTUl6?=
 =?utf-8?B?c3N1bVRNZzhCZE40OS9YdkQ2S1BYRUVVSyt6Z0xoYW53THFMeVZRRjdDUHFs?=
 =?utf-8?B?Y1RIdE1yd2pDOVlPUGROdUI0US9Wb3VOdHAyOURFWUZvYXNQMHI1V1dYdTBU?=
 =?utf-8?B?TTFLam4yTVNoVUQydHJYZmoxSi9xOGRUTGxuNUIyS0piM1p0Zi9BL3YyakN4?=
 =?utf-8?B?M2grNlk3bFgxNFg2cjFEUVBZWFBTMFlIQkFaWkxjcklMMjMybzlWVDJpU3p4?=
 =?utf-8?B?blhjdldpMFhuSXZvMFU1RUJMYmtKSldUSXRPT3BqUFhqRnNtWGFwMy9xOEJ0?=
 =?utf-8?B?WUJnK3RZV3hHczAvbXBlbk5HemxmQk90VncwRjFuR3RzVTNrM0VBTUF4SVQw?=
 =?utf-8?B?LzVGUFkxVSs1Tng3eDNnUURvYy9hV0ZPd3YxeDBzVEU5WUJhQit4VUJEbFJP?=
 =?utf-8?B?ckhDM09DOVBnZXFGU2tpaHh3bjJteEEzbWp6L0lGd0QrZk1ZRU5BVDIrN0xk?=
 =?utf-8?B?L3VRYy9PZ29CSGtTaTVPTWFKOE5UZ1ZyMVlnNTNJcW5UMy9DcDFjYS9HN2F5?=
 =?utf-8?B?RzBIWUIyZzJDOHNVb2ViQU51bFU3dXhOTC9IQnhaTENMbkswTjEzOTZGUG5N?=
 =?utf-8?B?WndxMUFhSWtZMzZlbjRVQWhSQmc5Sk0rMnVHMFJVQVVsY3R0VmgvT1I2RDV6?=
 =?utf-8?B?aHVjTTg5YWtTSVprS29UT04yVlU2ZDg4N1ZjenhjMGFkNk9aRWVLTVB5NUhC?=
 =?utf-8?B?QlpTbktHQVJZNjVlam8vcDBveFlzOG1maVZ2UGUxcG0wdWtyc2lha2s0ZHN4?=
 =?utf-8?B?ZkVRVStpUDZpeE1pbnFpRHJ1OE9vNkFEN0g2Q3pnS0JxbHhTY2RhZ0s2VHVm?=
 =?utf-8?B?cUd0QVZnZXRPOVg1R1Q0OXJoMzBGbHdwdFJ6UTlST1JRQ2RBd3pSdHBVWXIw?=
 =?utf-8?B?S3B0Sm9XTEZXbFd2ZU5ERVBhTWpTOXorMWZaMlV3OXNOeVBLcjk2Y1Q5d2Jv?=
 =?utf-8?B?Mnh6R2FzKzdEMFBvSmFNR3N1RWVaUGhHdUNJVEVvdy90Ry83TDVSM0NuajFl?=
 =?utf-8?B?VVovRzNEV01yaTRLaWlZUXhkdlRUR0szdHFPSUlOaHVHWWQ3YWZYWlZwSHFw?=
 =?utf-8?B?RzZrbmRxeFlwU2pWY2N5R2VXeWFCd2x4bzJlWk93ODVzOStZbjZaVDkvMnB4?=
 =?utf-8?B?S3RXMGhpUGRaSmYzME5XRU1BL3RqQlhzeGgrbG5hbWpFZFJ5QzZpS3E1MVNk?=
 =?utf-8?Q?riFAJmbjjfCUcZRV8a1YnhbDKm2JKuYk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3RNUUJhY0ptZ29GaUJETGwwWkIzcEhQWHgwL3NJYmtzUmtvcUMxQ0xHRUdt?=
 =?utf-8?B?RE9aUzVtOWN2UFlsMXlkdnEwZDJuVDQzNEFqVkd2Slcwdk1OaFp4cjA5ajFD?=
 =?utf-8?B?QXBVUzVuWUc5WklpTnBOdGN2eDdWUGVXRVZCV0JvV29sbmtTV09LakcyOWJw?=
 =?utf-8?B?L0cxVmZvYWlDN2dXN09zMXdJNTZDZFZma1dsUmVhb1laWWpqUHNGRmZIVjZj?=
 =?utf-8?B?ZnJibFRQaFoyc0szRVJmWFNIV3hoOTlFQURsTWVsNElyall5MHdYMXE5dTZy?=
 =?utf-8?B?WXEvVlMyYktXNW40S3VVYllKSlM5OVRZaHRyZm90TjFLWXNidGRVTGlhMUhU?=
 =?utf-8?B?WElwd0ZVdXFJMnpoOEZaNjFsa2liTlVJV3dKbWFLV28wNllBUnhNTXRnd1p0?=
 =?utf-8?B?bE5FM2JveStPR1dOZlNVYXJuZm5xdE4rM09qRlJldXZ3SVo5UVZac29ld3hk?=
 =?utf-8?B?SHk0Wnp5UUR6RXRKcENHZ0ZoYUxqN2xGMDJBQ2pKOSt5bmNFRC9xZGFmR205?=
 =?utf-8?B?S0Y3a0pXVk4rNGtHWlBBR29uSEI4dTl2dmN5ZkFBbFBZUUpyUS9tc1FMZkN5?=
 =?utf-8?B?d1hwVDc5Z2pCcGdZRzVKQzVFdHZkRzNteTJJVGFEeHZWdHNjYllNQjVncENN?=
 =?utf-8?B?SE1QdUFIQ0p0N0dvQVQzUlFCQjNiQU1zdTZDbERqaGZhekhaTUdkeG1IUVkr?=
 =?utf-8?B?dkdaeVFoQVlZMGNzVWFyY0dzSmlycmJZc3dzWEJ1am5OV0dUandEL0RyTjJ0?=
 =?utf-8?B?WERDSmlhN1lNZDJvOGVDc1BCeGNJa3Uvb00rNzN5aDYyc2hScmV4QldtQVVK?=
 =?utf-8?B?SWtBMStGUDJ6SG9rUU4xL0VJRFRHc0dIaWluQm1YRGRwcnZVOTd4N3dGWk96?=
 =?utf-8?B?YXpxK0NIcTlBbGhFTW9VczJLZWJnT2JQb09zSE85V0JzMWxhOUZ2R20zOVVB?=
 =?utf-8?B?WEFIYXA2M3F0OFUyOGJROWl4TjFNNDNmN3NteUFEdUF6Vjk5SzRjY2ZpY3RN?=
 =?utf-8?B?Y2lZNnV5czhKQ2RHcUYwSTZCMGhoelN3djgvZm5DYldoZHRjaWlCUXcwakpN?=
 =?utf-8?B?N0pRUEM3NEhERlJYM21walBKbjNJdEZqek43c05OY0xEZDFvRFJ1bGF0K3or?=
 =?utf-8?B?QzRaSmJzL1FNcHdGNnNwbWY3WHZBbjEraENHSlRMa0pvRlpLOE5hazQraGgx?=
 =?utf-8?B?aFl1Zko2cUJrWUMweEF5elRzU1ErWlVOZWVHaDZ0eXIxb2prNUoxWVh5M3FW?=
 =?utf-8?B?QUlEMzBXdTFlMGJUWlJGaU1BTDlTWEtUQ2lXRTZXYytHMDNWVnJmeVdJVXY3?=
 =?utf-8?B?TVB1UHBvaExRTnlCMzVVY1FkLytFM3ZMcFloQXpmdWFZYTNmWmRpc0UwOWtO?=
 =?utf-8?B?TW92dFhrakNlSDNJR1F5U1lUZVlPeHBVM041UHl5MWFoY2tYQzZjWG5PVG5n?=
 =?utf-8?B?RllpMk05MWlTSXR2RWNEKzFhNExaY2tBY1lLUGRvMU1NRzkxZXVicXJRWFM0?=
 =?utf-8?B?a0d6UExFbld3MjlMSlJxcTBpQXVRTi82WWl0QUQ5T1lLVXZTUVpiVlkvcFRV?=
 =?utf-8?B?cHpZWXUvcmVwZkdLd04yVEhIdUlDSWw0U1N3YkRoU29CbkJlQ2NSVThYTTZT?=
 =?utf-8?B?blgrdjBrZGJyQkgrU3FhemsrVG5jZ2VnRXF6ZXlaNE9COTFQcDNRRDVwSDlV?=
 =?utf-8?B?amJXVVhzVk9qSkdkOUZFakJXTmpPTytIcFhrN3ZiakYwNXlIeFQwUkpJYmZR?=
 =?utf-8?B?YWZCcXNlQTc0ZTZaVHAyVjM0czdxbm9qU2RYV0NnTjUyWndyanFBZnRxOFJn?=
 =?utf-8?B?blE3YzVXRDUxQlZsYUd0Z1Z3NjA5a0hNYW56SGFsZU5PeHNXVjhES1ZZbWYw?=
 =?utf-8?B?V2piNTNwNG5UNlNDRFIrYWhkZ2R4Q0ExNEE1N09uc0w5dVJyb25jR2ZBM2sr?=
 =?utf-8?B?R2hkL3FQc0Y0S2FFRktUTGJhSStwSlNpT0trWVRlSkIrNzJoQStIc29sMFl2?=
 =?utf-8?B?YVV1SGVibHJxcVBlWS9IMjJ4QzM3UE5ZaGcyM1dMSU1oM0pyWEt5TmMrRFNQ?=
 =?utf-8?B?ZUJSREo5UUlpbWtPK1NIYTNIRndIVWptQTY1blFVUnkyb21pdUZraDUySUI2?=
 =?utf-8?B?SUl5eVpLU05BWUZ0UHU3R3RXZGY5YkpIaEc4cTN2ekpkOUZRN2FZQkJBLzRV?=
 =?utf-8?B?K01KT3RiUnowSXR2bnlDSEl0Qk8ySHFWQWpVbHhDRWpUaHRzbkFnS0syMXdI?=
 =?utf-8?B?QXdnOXNPUk5oQXJjT0lnTXl3Z0dVUDVHS1dPRUdWOTd3c3FHMmxGWW92b3RZ?=
 =?utf-8?B?L2pHUHlJaW5obmZSTkh6dURHdk8zNldvcUJXYzkzS2tTZmxmT3c5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6680cf8d-d8d1-419b-971f-08de4e327fa4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 21:19:53.1530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pk3a8bAD79ZF9afOkkZK8gC0NVdh8lYZkkMqazL4jgE9lZqbn6O71hVDM5J3sGzHoRCvAb5LvZ58yy5uCTaFtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7432
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

On 12/18/25 7:43 PM, Lizhi Hou wrote:
> The latest firmware requires the message DMA buffer to
>    - have a minimum size of 8K
>    - use a power-of-two size
>    - be aligned to the buffer size
>    - not cross 64M boundary
> 
> Update the buffer allocation logic to meet these requirements and support
> the latest firmware.

We can't guarantee that kernel and firmware are moving at the same time.
What happens if you run old firmware with these changes?

If the old firmware can't run with these changes then it would be better 
to instead add a fallback system.

IE:
1) kernel tries to load new firmware name and use new behavior
2) if firmware is missing, kernel tries to load old firmware name and 
use old behavior.
3) if firmware is missing in old name then fail probe


> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_error.c   | 10 ++++-----
>   drivers/accel/amdxdna/aie2_message.c | 33 ++++++++++++++++++++--------
>   drivers/accel/amdxdna/aie2_pci.h     |  5 +++++
>   3 files changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
> index d452008ec4f4..5e82df2b7cf6 100644
> --- a/drivers/accel/amdxdna/aie2_error.c
> +++ b/drivers/accel/amdxdna/aie2_error.c
> @@ -338,8 +338,7 @@ void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev)
>   	destroy_workqueue(events->wq);
>   	mutex_lock(&xdna->dev_lock);
>   
> -	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
> -			     events->addr, DMA_FROM_DEVICE);
> +	aie2_free_msg_buffer(ndev, events->size, events->buf, events->addr);
>   	kfree(events);
>   }
>   
> @@ -355,8 +354,8 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   	if (!events)
>   		return -ENOMEM;
>   
> -	events->buf = dma_alloc_noncoherent(xdna->ddev.dev, total_size, &events->addr,
> -					    DMA_FROM_DEVICE, GFP_KERNEL);
> +	events->buf = aie2_alloc_msg_buffer(ndev, &total_size, &events->addr);
> +
>   	if (!events->buf) {
>   		ret = -ENOMEM;
>   		goto free_events;
> @@ -396,8 +395,7 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
>   free_wq:
>   	destroy_workqueue(events->wq);
>   free_buf:
> -	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
> -			     events->addr, DMA_FROM_DEVICE);
> +	aie2_free_msg_buffer(ndev, events->size, events->buf, events->addr);
>   free_events:
>   	kfree(events);
>   	return ret;
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 051f4ceaabae..99215328505e 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -55,6 +55,22 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>   	return ret;
>   }
>   
> +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
> +			    dma_addr_t *dma_addr)
> +{
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +	int order;
> +
> +	*size = max(*size, SZ_8K);
> +	order = get_order(*size);
> +	if (order > MAX_PAGE_ORDER)
> +		return NULL;
> +	*size = PAGE_SIZE << order;
> +
> +	return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
> +				     DMA_FROM_DEVICE, GFP_KERNEL);
> +}
> +
>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>   {
>   	DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
> @@ -346,14 +362,13 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   {
>   	DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
>   	struct amdxdna_dev *xdna = ndev->xdna;
> +	u32 buf_sz = size, aie_bitmap = 0;
>   	struct amdxdna_client *client;
>   	dma_addr_t dma_addr;
> -	u32 aie_bitmap = 0;
>   	u8 *buff_addr;
>   	int ret;
>   
> -	buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
> -					  DMA_FROM_DEVICE, GFP_KERNEL);
> +	buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>   	if (!buff_addr)
>   		return -ENOMEM;
>   
> @@ -363,7 +378,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   
>   	*cols_filled = 0;
>   	req.dump_buff_addr = dma_addr;
> -	req.dump_buff_size = size;
> +	req.dump_buff_size = buf_sz;
>   	req.num_cols = hweight32(aie_bitmap);
>   	req.aie_bitmap = aie_bitmap;
>   
> @@ -391,7 +406,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   	*cols_filled = aie_bitmap;
>   
>   fail:
> -	dma_free_noncoherent(xdna->ddev.dev, size, buff_addr, dma_addr, DMA_FROM_DEVICE);
> +	aie2_free_msg_buffer(ndev, buf_sz, buff_addr, dma_addr);
>   	return ret;
>   }
>   
> @@ -402,19 +417,19 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
>   	DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
>   	struct amdxdna_dev *xdna = ndev->xdna;
>   	dma_addr_t dma_addr;
> +	u32 buf_sz = size;
>   	u8 *addr;
>   	int ret;
>   
>   	if (header->type >= MAX_TELEMETRY_TYPE)
>   		return -EINVAL;
>   
> -	addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
> -				     DMA_FROM_DEVICE, GFP_KERNEL);
> +	addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>   	if (!addr)
>   		return -ENOMEM;
>   
>   	req.buf_addr = dma_addr;
> -	req.buf_size = size;
> +	req.buf_size = buf_sz;
>   	req.type = header->type;
>   
>   	drm_clflush_virt_range(addr, size); /* device can access */
> @@ -440,7 +455,7 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
>   	header->minor = resp.minor;
>   
>   free_buf:
> -	dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, DMA_FROM_DEVICE);
> +	aie2_free_msg_buffer(ndev, buf_sz, addr, dma_addr);
>   	return ret;
>   }
>   
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index a929fa98a121..e1745f07b268 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -336,6 +336,11 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   		 int (*notify_cb)(void *, void __iomem *, size_t));
>   int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   			 int (*notify_cb)(void *, void __iomem *, size_t));
> +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
> +			    dma_addr_t *dma_addr);
> +#define aie2_free_msg_buffer(ndev, size, buff_addr, dma_addr)		\
> +	dma_free_noncoherent((ndev)->xdna->ddev.dev, size, buff_addr,	\
> +			     dma_addr, DMA_FROM_DEVICE)
>   
>   /* aie2_hwctx.c */
>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);

