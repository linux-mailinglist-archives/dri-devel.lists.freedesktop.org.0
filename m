Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC11EC1977B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214AD10E00F;
	Wed, 29 Oct 2025 09:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yY9e/Y8Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0786C10E00F;
 Wed, 29 Oct 2025 09:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiBH+PJ80YLlB3MKPQg7lDqfcqDqpfTr6TdzNJKhhX1R5S7yZGc4dKiI/jJOpFl5+gPBwpekduVCMITjhlNJCzFZpDNKWnCPdpqx0LghnNaVvKsDvfNFmVy+fbaaRt67r1IfpSvOXc5LrCIF22+lQKfsD07/o3yt8uzMYS0eCrtVtaThH6UF6fsWjxxb1n4XJXO79hJFz6kG+nUzbQDkZtAnZt6z0IBORNe6xgGlrxgZPx1cfAQTci4M29y9PYT0ZYaJjlYg59bVjDrzx7hYlTP3qjgUCRbwq3O59rMM8v95FDWyK94PocrvZHuJ3uBq5WtHcSPtQ9F7RNMZI55aRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtapmJYt6usC9rmgqSZuUfh1PDXSj9FORrZ/LVQ3AYM=;
 b=vxFbDSrOKFMVmoRpOfT+Tfqf4RVkgOSaIR6U2pVK6mHmrNKSfjWMXue2nit6fIIF0rJNLbYAXtfpuDDpe+tqyaCGkGvNgGkbDlsyAXVWw7OEkXjTn3PoYtXL3BKSk5vCsKi0RaqKNjtzAqXHIDwTh8Bz2QV/VMO8znpu6t+Uw1rmFinI4iz8pDQG5NJqtXc4udw9X1lrtQH8WBaj+1Wx6ev0FitEfXKVoWH1HFMANa1IgIstPKGrAbxvmvqnW1U9VQ2U14YtPCLRbjC9msCjGRQGmDWJqc/0znEDhiFphL1s+4WZ8dQJWFQ1FaY/ooZzSFQB1db3i5gUGnk06crpAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtapmJYt6usC9rmgqSZuUfh1PDXSj9FORrZ/LVQ3AYM=;
 b=yY9e/Y8Zwobcxhi9YnQPfE/0BN8+2heRQwQxUQV66XFPNLuqYej+5g3eDLhGLJoctU6EvedGkMido9ITX5yG2ZIR34RZPZBxTQ24bTy04kQ7gUtlJAqo3x8Py4MQULQuxnxN5/f2m4V+oxZwao8NVcjOcS50i4zs8yQamE3183k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8778.namprd12.prod.outlook.com (2603:10b6:510:26b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 09:48:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 09:48:50 +0000
Message-ID: <9565366c-6821-4767-bcfc-079378fb4348@amd.com>
Date: Wed, 29 Oct 2025 10:48:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com, tj@kernel.org,
 simona.vetter@ffwll.ch, pstanner@redhat.com, dakr@kernel.org
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <2e1e9d6f-4f9e-49f7-90f0-6759c260701f@amd.com>
 <aQEkq7DYy5/AaJ4R@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aQEkq7DYy5/AaJ4R@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: fd17c2d6-3994-415f-4feb-08de16d05cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzNObDhjaWxCUkZBemJlVGp4bjhsaTlsUEJKU0M4UzBLS2t1VU1VNGxsVmha?=
 =?utf-8?B?b0dZa3ZzTDIyc25kWkJ1ZHpRTHMxcDVOUXpRaXJSajlKYXhKK1pydHZvL1k2?=
 =?utf-8?B?ZWNqdFZuekRIODZib1gzbHhFUG1VMGJTNzJueGRaUkVRdFFsejVkeTc2eUcr?=
 =?utf-8?B?d0c3c3c5ZjBmK1ZjUm8yYzBsS1hlcGtBNFVvMUJyUTFPVUt3VTNIL05uSVlw?=
 =?utf-8?B?dHo5OGk4bitUazR0UmgrbGlMSDRIeld6Q241VDd5dmdrSmZMeTEwTVhPejNj?=
 =?utf-8?B?VFgrNFBaNlB2U2dpL0p4d0xsMWhmcDFQOCtkOCtqYUNKeG16MXpnOU5MV2Ji?=
 =?utf-8?B?cFN2ZzREalp0OE0zTWdjeFk0QlpOM0M1M1hWS3lsVWpKUXMwVy9ENDc0Q1dK?=
 =?utf-8?B?N2hEWE9sTm1IZWVRWWRML0o5MWY0QXFSdjQ4blVLTUUrU3BnWnNVU28rS1lm?=
 =?utf-8?B?Nk4zcnZMVDdoT1FTeVU3TmVjOEVJNE9BRUgvUjkyRFozUmxVZVhzazZ2ZDFq?=
 =?utf-8?B?b1NiK1FwWi85NHZCb0o4Z2ZLWG1qbTFGYmVZMytaZWZLTUlBSXg0L243Uncr?=
 =?utf-8?B?Vnd1QUxWeERlN1IycGFXbWEveGswcjE4OHlIV2ZSaEF1d0psK1pldGQ4SDIw?=
 =?utf-8?B?WTZzeWNibEQxMk9qaXFLOGg4ZUlrZllLdWhYVndBKzhyUFhyTU5SOXQzNkRa?=
 =?utf-8?B?QjJjQjdVemFlMmd2SWRabTdHS3ptZkR0eVRSZHVTcUg3NWJ0L1FJUUF0bzdr?=
 =?utf-8?B?dlNjMzFVeUtPdElYbEd2V3EzcnJWNkJiSndVR0ZHUzdYRE1tNTZ5TGt6MkVm?=
 =?utf-8?B?ZzBRd3JKd3YwajBneWxsaGhXRXg3eXZ1M2xFRGZHWW1JbnNkM2k4elFYTWsx?=
 =?utf-8?B?dWhrV2tLK0piWU53cWgxaGVJd0ZqNXdUazVPMllTQmpybXppajYyeVZZWkJj?=
 =?utf-8?B?cmQxejd6NzUvMnlxS1FLdVREd2pmWlp2OWhHMXZwQWg0N1dlRU1Oc1c3dVBR?=
 =?utf-8?B?SGpxNlF5cVpQajE4Mk1hSDZMY1ZheHlEdzNhZE9xUHlRVEh3M0orR1BjZm5L?=
 =?utf-8?B?NVZDMWlya3RVSlpiM1F0aGlEUGtjejNyZ3AvdE4yK2NpZit0cnhTUEJGeGJu?=
 =?utf-8?B?emdQbUdIcFBtSXRJN0tHZWljYXVuZmhkZW91WjVqTzVQM25kMlNFL0ZscXB3?=
 =?utf-8?B?bUpZRVVWV1hYbHdhc1NPQ2dVZGFVSEdCSEdZNGd3a0FPQXpQclhnaC9EeTlX?=
 =?utf-8?B?bDF6dVlWaDUrWEhJVmxteFpIYnNHOE1yUk04SE1WcWFSU2o4R3dJRHp3VU9w?=
 =?utf-8?B?NG0wdnA0STZDaU55ZHcwSHlPZjFSbUd3UE0xOGkwQ3FWeEVhb0ZWT2pDWUtJ?=
 =?utf-8?B?UGM0cjBHRHk4VTUzcHJpS0ZZMWo2OWxMWDM5aHlvckJkdDhLUjZzUnNpVUxy?=
 =?utf-8?B?R0lZU1ZHZW5tRjFJUzhra3VQdXNXYmJoSU8xM1NkUlVTdm1WUlRqMTFWNVZC?=
 =?utf-8?B?c3I3R3R1ZzM5MXJJQU1Td28raXNMSk1zWVN2Q0NvM1YyTFZ0d1gxck11cXh5?=
 =?utf-8?B?bnZLVkdBQWhjQ1l5WFVQZWt5V2JzN2wrRGlhVE1aUXBpNGFQaUxWdmhlaEZF?=
 =?utf-8?B?TEpobTc1OUhvY0FMcURSZUxrdzZFTjc5OGJJUmtHc0hldjlhcWRRSlZHc1F0?=
 =?utf-8?B?YmJjYVQ4V1pXbjZOYnhFeDZ1MXNOZDRldFUxRjJZZTI5TVFYT3Mvdlo2RmUy?=
 =?utf-8?B?L3hZR2FTekF1c0E0ZVAxaDdQeW5oUzNocEdOZ2JnWDNVbkYxeThOS3N1dlNN?=
 =?utf-8?B?QnN1d0E4MXorTGp3VHJ2QkxNVTdwbXl5SCtRSWZna1NGMUdnckZIdXZGczUy?=
 =?utf-8?B?dDEyb0l2bWdSMlNQOXRUa2tlSjEwbWluSWttWGZXeVo1eHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym5BYVRpL1FiOTZ5cHV2NGdEdi9ncCtCVDJXdDFiZkZkS1dLWlNsRlBXbVFh?=
 =?utf-8?B?TS9KcGtkREJBdGJNRnlnc282MzQyRDhxTWlrSWFZam53anhNV1Rid2czcDg5?=
 =?utf-8?B?ZkRvYnp0cXV3SW5UVWZhZUxTOEFtWG1ROTFtQVo0N2lwdzVPY2ZrYjF4Mllt?=
 =?utf-8?B?bVlBN0hmMjhnd2dnd01GWDhpUWlzMTJnaTczaE1qcDFrTkVFVUNZOUV6QlVP?=
 =?utf-8?B?RVFqUzQxcjg2Zk5XYk1qZmxRSzRVanJHeFRTMzhsYzVmUWJPVUFrWFg5WHRu?=
 =?utf-8?B?SWhUVXJUbS82Tm9QSk0rVXBlQlFPWHU3UzNFeWJtenNMT0RnOW4zeWZ4ZWRX?=
 =?utf-8?B?WVRIeWtCb25VQ0dlTzFUc2Zrck5INWZjSHc2WUo3Tk5WL0JBVSs1Y1g2Z0E0?=
 =?utf-8?B?NzJySGlpYjZlS1h4MGpJeWJwSldrOHFQT1NjcDhUYXFwOCtXV2lQK29hb0ZU?=
 =?utf-8?B?Um9heWZHS1o0UVVGdG5JOXpZaEw0K1N5ODgzMWJIdDhoQnlyYXhhUFVqNTBI?=
 =?utf-8?B?RHZBRlovYWhIcTNQRllaQndkZXN1dk5NOVdQR1YvemZkMklEM3A4UUtKTWIv?=
 =?utf-8?B?bVRQV3JtY2dTNmRmTnpEdnFOQVZXMERybjlKNElBU3FtU1BJYzYrQUFrbUhR?=
 =?utf-8?B?TzFXRkZ6eGw5REtwbG9TRTJraEtlTUhaeXBUb3FoNHlTOFZJYkhoSDNEYWsy?=
 =?utf-8?B?b0pOdTZIMXJTZS9qQTgzRE9pSDkvWFViOEJEZ1ZxRGF5enJ0SzVMLzVzd3ZG?=
 =?utf-8?B?dTQ3dEREODVVZFU1c3JMNTZhbGF0dVp3NmIxRWJ2Tm5MWkMwQnNmM3h4TjUw?=
 =?utf-8?B?TVVmWGg3SWhuNm90Y0pJUlk0UUtjSVd6L2JRODFsUy9Yb3hjeUtlZU9xSm5l?=
 =?utf-8?B?RjVFbWk4NkRESGxhSVFKbFNyamRxL3V6Vy9HUTFsR290NDQ2blZJdkhGNHlr?=
 =?utf-8?B?NUY4WmVKU25lVzh4YlJrc2dqdXYrV0syOVVKbExMVWNwZVRTdkZKS0prOE0w?=
 =?utf-8?B?TTRhb3ErWnBTYVJ3emZuTmIzSzBXRTNFR1RLbzJUc0UxZlpOeE1XQnlyLzNS?=
 =?utf-8?B?dXRYSlI0RjdpeTBONWxJNjQ3NFZzR1BCNVYxZUJ6eTBFdGJyWW1jOUwvMGo4?=
 =?utf-8?B?QWZPbmUvT2RrSUhzZ2s4ekFtRzVGdWR1dUtHd0IvbjZuY2I1d3dyOTd0OXk1?=
 =?utf-8?B?SXdoZTN5Z1gzYkJhVWkyWlFXbVkxdVg4WjFEKzc3V29Oam1sOEkxWTh6ZDBj?=
 =?utf-8?B?RmdGSXVtWks3QlNPTk1Sa25MN3g2bTJwekxERWRINnZwZnhVNkNpZWwxbCsv?=
 =?utf-8?B?L0RubEhXT3NQZ1l0MVkvcmozZ2JCUE1pOVlyN2JqcE0rSnJ6NU44NFNSRHUv?=
 =?utf-8?B?YktMSWpjcXJpRVBOYWp1V251TEI1S3Noa1p1YiszMXdncU9Kd01lQ2gzck5k?=
 =?utf-8?B?UWk4RzlWays1TEtVbURCTU1NM2NXdDlBUFhSK3JDMmJyN0JKRksyUlVaNWFW?=
 =?utf-8?B?c21WNGlKMnZrais2SHFIakI1ZFpzcm1YVVMxcjR1aERaL0xIMHptdnUxZG9Z?=
 =?utf-8?B?ZTBJOUNuUVI3LzBIbHdiRWlOYXpMNVJqSGtsQWx1NkhoZjZ1cC9oRWYzaG5w?=
 =?utf-8?B?YUdhWXJZRW5oZjMvR2tsTGF3cnFMeVZnd2ZxbFFLTU9WWEgrSkt3ZlQySDB5?=
 =?utf-8?B?VngvM1VMNFlqOXFwak5jNTFJb256OS80SHo0cTdjeWs4aG9MSmRnblh5VVB4?=
 =?utf-8?B?bDVQWiszbWpDQ1F5cHpxWDZibFR1NkdSVm1OS3BMdk5kWC9sVktNNVkwcGI5?=
 =?utf-8?B?V0tMRE5nZTZBeVF0MzBtQ3RjT0M3c2tWZ3VaSFhUcGlGZ2pSTXhUcGJoWllC?=
 =?utf-8?B?S0hzZGZTTHROSVFXTkNQWWJmY3FBZTZoV0QvenZVZkRnTDlYY1VGbGc5aW9p?=
 =?utf-8?B?TU9XY1JwMloxeml6akhlUys4WThmZ0ZNRmhTUnBJTWhLV1puTkVud1RXM3BQ?=
 =?utf-8?B?V1lDcXdPSk4yV01wYndaclpIRUtyL01BRm1TZy83WGRBSTZzMlJQTGdhQUp4?=
 =?utf-8?B?MDUxTHZZeUlnanBLODgxMXhSMWhwTjNvd2ZZaWlQc1Yyc1ZpLzY5SUMvTFhL?=
 =?utf-8?Q?S3WoBHh0Rf3mXVwk6Q700ktC1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd17c2d6-3994-415f-4feb-08de16d05cd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 09:48:50.1403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwlYQy22Xnl6uyB/DGEJEab2jRyWw4dTOvsoQWWpVFyl7SZGSHJrKnM3KNbtFYNM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8778
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

On 10/28/25 21:16, Matthew Brost wrote:
> On Tue, Oct 28, 2025 at 10:32:54AM +0100, Christian König wrote:
>> On 10/21/25 23:39, Matthew Brost wrote:
>>> Drivers often use workqueues that are in the reclaim path (e.g., DRM
>>> scheduler workqueues). It is useful to teach lockdep that memory cannot
>>> be allocated on these workqueues. Add an interface to taint workqueue
>>> lockdep with reclaim.
>>
>> Oh that is so wonderfully evil. I'm absolutely in favor of doing this.
>>
>> But can't we check for the existing WQ_MEM_RECLAIM flag in the workqueue handling instead?
>>
> 
> Tejun suggested tying the lockdep annotation to WQ_MEM_RECLAIM, but the
> entire kernel explodes because many workqueues throughout Linux don’t
> adhere to this rule. Here's a link to my latest reply to Tejun [1].
> 
> [1] https://patchwork.freedesktop.org/patch/682494/?series=156284&rev=1#comment_1255380 

Sorry my fault, I hadn't read up to the latest discussion when I wrote the mail.

My educated guess is that a lot of wq just set WQ_MEM_RECLAIM to be guaranteed to to start even under memory pressure.

So yeah probably best to keep your approach here for now and somebody from core MM should take a look at cleaning it up later on.
>> Additional to that we should also make sure that the same wq is used for timeout and free and that this wq is single threaded *and* has the WQ_MEM_RECLAIM flag set.
>>
> 
> Currently, free runs on the same work queue as run_job. We could look
> into moving it to a separate queue, but that’s a separate issue.

We really need to make sure the free and timeout wq are the same and single threaded.

The hack the scheduler currently does with removing and re-inserting the job on a timeout is something we should really try to fix.

> IIRC the workqueue_struct is private and so we can't fish that out in
> the DRM scheduler without adding helpers to workqueue layer. Ofc we
> could do that too if you think this would be helpful.

I might be wrong, but IIRC there was a helper to get the flags from the wq.

That should be enough to test if it is single threaded or not.

> 
>> Otherwise we run into the same lifetime issue with the job and memory reclaim during device reset as well.
>>
> 
> My patches in this series taint the submit_wq and timeout_wq in the DRM
> scheduler [2]. I have a solid understanding of reclaim rules, and this
> change helped uncover some convoluted cases in Xe—specifically in our
> device reset code involving power management and reclaim [3]. So I can
> confirm this has been quite helpful.

Yeah, completely agree. We most likely have quite a bunch of issues in our reset code path as well.

Regards,
Christian.

> 
> Matt
> 
> [2] https://patchwork.freedesktop.org/patch/682496/?series=156284&rev=1
> [3] https://patchwork.freedesktop.org/series/156292/
> 
>> Regards,
>> Christian.
>>
>>>
>>> Cc: Tejun Heo <tj@kernel.org>
>>> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  include/linux/workqueue.h | 19 +++++++++++++++++++
>>>  kernel/workqueue.c        |  9 +++++++++
>>>  2 files changed, 28 insertions(+)
>>>
>>> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
>>> index dabc351cc127..954c7eb7e225 100644
>>> --- a/include/linux/workqueue.h
>>> +++ b/include/linux/workqueue.h
>>> @@ -553,6 +553,25 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
>>>  						1, lockdep_map, ##args))
>>>  #endif
>>>  
>>> +
>>> +#ifdef CONFIG_LOCKDEP
>>> +/**
>>> + * taint_reclaim_workqueue - taint workqueue lockdep map with reclaim
>>> + * @wq: workqueue to taint with reclaim
>>> + * gfp: gfp taint
>>> + *
>>> + * Drivers often use workqueues that are in the reclaim path (e.g., DRM
>>> + * scheduler workqueues). It is useful to teach lockdep that memory cannot be
>>> + * allocated on these workqueues.
>>> + */
>>> +extern void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp);
>>> +#else
>>> +static inline void taint_reclaim_workqueue(struct workqueue_struct *wq,
>>> +					   gfp_t gfp)
>>> +{
>>> +}
>>> +#endif
>>> +
>>>  /**
>>>   * alloc_ordered_workqueue - allocate an ordered workqueue
>>>   * @fmt: printf format for the name of the workqueue
>>> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
>>> index 45320e27a16c..fea410c20b71 100644
>>> --- a/kernel/workqueue.c
>>> +++ b/kernel/workqueue.c
>>> @@ -5846,6 +5846,15 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags,
>>>  	return wq;
>>>  }
>>>  EXPORT_SYMBOL_GPL(alloc_workqueue_lockdep_map);
>>> +
>>> +void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp)
>>> +{
>>> +	fs_reclaim_acquire(gfp);
>>> +	lock_map_acquire(wq->lockdep_map);
>>> +	lock_map_release(wq->lockdep_map);
>>> +	fs_reclaim_release(gfp);
>>> +}
>>> +EXPORT_SYMBOL_GPL(taint_reclaim_workqueue);
>>>  #endif
>>>  
>>>  static bool pwq_busy(struct pool_workqueue *pwq)
>>

