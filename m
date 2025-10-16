Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07777BE39FC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 15:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0131710E9E0;
	Thu, 16 Oct 2025 13:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1ofj/11Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013055.outbound.protection.outlook.com
 [40.107.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756E910E9EC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoD4fYNEyXyrXsiW+DHn/utuTqIbmXjUGMjvCxBJlbVIJj2tdk0N25B3pY4VvRT6JZSw8cf7fTRheSAOmJ3Hb6m8SEzMqijJptCP6rUTPcTXK6X+Dx5f2xewlC6XbkXjhUdK2r1VU+Me3tC4YZajCA4Il8CEX9j5GY1TdkWwqnq1OkMIQ/TNm1HBXkw9nqpQ5As6kA64wOD+sn3O6NZeS5PgUxDubbZAV0wzrDjsFxawPleATzKrCjDv6CJQOduxKV3Aso1c6ZGsoMcRaVKpc51oXroMlviiLBmjGc/gqZQeg7cH4IJURfHKBuhbGyuHlkcKWoRsaTiCDZggXAMeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6F9vp2NbjVVl1vIMt8eH9Eyq56F+hKcfbF56u02NLPg=;
 b=xUDX/kr5Fvxi0mVRydg9IrBT2rGjkG7EvyRDqIFARE0qizdjrEeG4r8kp9q/7Womt/2pu+3YitRNueeC1c4vrtrIbqsHNM/BcZuTcmNcn8RxOYE0137MMyQSEcnxvuaal6l3GoagfEwb2j1eZv7+bQVBvX/xGwqG3eRg3wZ/dDjNSlXaaPj2cUwdR/b4Nh8rNbmOdrOvLTUwx+wtIlDrPYPp6ZZOkhv9Pof0eOvO2JviIpGoh8uKRiP9IH/73dEAa1SOt6dJ7FUhkiRFo3nfC1dKN6hnyjAXoJUJCBo9A7A7+N7TCTFQrF/RjWjJXFaNBHVbi18neCjl1M6HnL+6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6F9vp2NbjVVl1vIMt8eH9Eyq56F+hKcfbF56u02NLPg=;
 b=1ofj/11Y+NwsFIYo6PBy2wiEgRKZCW8sAQaPhPjmFZhkCx8B7zMrjE9krxostRcnmKmfsY+yb/kei9Br2rQWVBaSPRvUQSWEud6ykWsgQzXC+kzlTJij+o4OIJtc3KFblL3jNcfPQgZ5JEf5CGN/RTXMIRRcI5l+/oeIHHfw9bQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5820.namprd12.prod.outlook.com (2603:10b6:8:64::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Thu, 16 Oct 2025 13:11:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 13:11:57 +0000
Message-ID: <08c5d03f-d099-43f9-a26b-d333e394d862@amd.com>
Date: Thu, 16 Oct 2025 15:11:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: avoid killing parent entity on child SIGKILL v3
To: phasta@kernel.org, alexdeucher@gmail.com, dakr@kernel.org,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org
References: <20251015140128.1470-1-christian.koenig@amd.com>
 <1a83e056df0a0096f85897b569993b0eca3892df.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1a83e056df0a0096f85897b569993b0eca3892df.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0369.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8fb7a7-0d83-455c-c67b-08de0cb595ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUFlUmJ6eHFoMFozSUYwUG1uY3lrZ0FGUFpyZUp1ZUtqVnJHMTNoZGhmbks2?=
 =?utf-8?B?MzN0YVM5bmduckl4VUNqd21JdzRwNVJycGUrOVRIbnhlR1Z2N3JZMzEwUERm?=
 =?utf-8?B?TTFvL0NRamVkTVpOdUNpellHNGNraW9idkFtVU9LVzhMNll5NUhzK0tremJU?=
 =?utf-8?B?QzdBYytvV3VMdGdubVZ1aUN2NWFpOEQ4SmdVQUpxVXJTM0t5TDBNK0oxQSty?=
 =?utf-8?B?dnlMSEdwNndnWWkxODR5YnRDY2tRbEJlaXZObThOeThwRFdEL2M0YlpwTkNJ?=
 =?utf-8?B?c2pIZTBDMjE5RTdYdWRSakQzQVpUN0RRbWxFZ1Z5UmZHMXQ3Y2R1MkgvWVZK?=
 =?utf-8?B?SlN5T3YxYURpSng1QUxraTdNT0JYRjd2SHd6VWVhSUFBK3M1c3gxTnFuQXk1?=
 =?utf-8?B?ajFsS1ZlZSsvUUpWYkt5Qy9wTGdSSTIrWDNJOGlhRXZtNCs1RjNxdytjYWFj?=
 =?utf-8?B?TE5JTjBiRENMRWt6SGpXbmFWaG42dzBjNFVBWmk3YUU3RHhacHJXYkxFd2Y0?=
 =?utf-8?B?cjM1VWJJM2psSUZyUEF5eEZpVGNUMmtIdWhKbGk3SFNQdnhmOUZRT0RHOGR1?=
 =?utf-8?B?MmVnUWJrVXJ1Zm5SZTlwQzBtbU5kdXNSWjRCZmVnbFY2YndIZUNtZmhPNlhJ?=
 =?utf-8?B?NmtMSGpuYm5NclpFNVpQQTdVZjZ3R1U5Snk2TmdoWjB6MkJmVUo4Ny9pNExt?=
 =?utf-8?B?L2xiZDBqLzVZdC92bngvZ2xITDN1ZE9lbTVnME01MHBDK2kycGlTV2NSbyth?=
 =?utf-8?B?OUpHQ1lHM0NjeHV0SGg5WnRHY2syL3VnbER4dERjSE1tY2VONVFCNmJRWTlJ?=
 =?utf-8?B?dUJVWE9GZjdISTQwLytXZXhCKzZrSjBkQy9sKzcrTlNiSDFueEt2aE5WMjhP?=
 =?utf-8?B?bzk3Q0UwcU1Fb3ZobHFyMmV3ZHBvZFlMdWlnQmJCVmpTNno2SUhDSlpSam1S?=
 =?utf-8?B?UFRRQlRKenZpeC8vRzdmdjhObmtvTDlCc2NKbWZNOUprUjU4azczTk42VGhY?=
 =?utf-8?B?TTV5MkdJbXJLSE5YTkY2cytyS1dJUi9VNGE3d3JyOGRLRUQvWmtQMVZsTEwy?=
 =?utf-8?B?NSt2QTBqS21xMnNKSFdISGFqRnU4ejljNWY5UW5ieGlPZzVFZVRxdmZlRnZ1?=
 =?utf-8?B?MUdNVTFQTGFteVNOL3NnS0VaRkJFSnVzM05NZDArY0p1elFveExzb25tcFBB?=
 =?utf-8?B?Qkx1elIxUkgzT0VTclViK20xY3RGakJXcURWK2Nscjc0N01MeHlRbHJXZURj?=
 =?utf-8?B?QWhwUFpzWlYyZ1VFU3ZoclBnVFNZS0dJYUZnUlBETWpQYXZNMFpQYUpIWGxm?=
 =?utf-8?B?S0Rob1AwcG1CYlFLWnEzK1VLWDBUVnFNTlU5em5OYTFhZ201RnRLQVI2amUw?=
 =?utf-8?B?OC9iclVTWkhjcmIrNVpNcHdCbWg0a0g3NDJ6VkVKR2RYbTZvMTVweWY4aHZJ?=
 =?utf-8?B?WmtUN3pTZGhZTGdRWWdwb3gyb2ZPM1NQL0R0cUxtOVRWSERyODd3REppemZN?=
 =?utf-8?B?UGFSMzhab2ZySkdQTHc2eVBMTnZrYkVsY2FjTUYvNm43bDY4T3pGa2NyN3l3?=
 =?utf-8?B?MWFabUllZk1wd2VNUWtBU2tma1lTNkxLMm9ubnV1T2lvUVFaaTZqMnZZTUdr?=
 =?utf-8?B?TENpNUtzL09iK05FNG8rTnNLMnlKUllpNHhudlNSc2VreE5QdGQ4bXppb0RC?=
 =?utf-8?B?NzdCaUNMUloxZ0U3Mm9TWktvSUpCTEVIUlZiNnh0MW5JVG5PaUR1eDROVHht?=
 =?utf-8?B?OWo5d2ZralJTcEN2TFN3NjY3dUNHcmlNZk1sbUt5dHBQaEpOc216UFdpdjNG?=
 =?utf-8?B?U1dkWHNLZGJoN05BeS8ycmxEMXIxMHdiRVdhSk1jOTJhVmIvcmdHVkJ0NzNk?=
 =?utf-8?B?SjhiZ3cxQ1RxKzRGOElWYjN1U0NBS1M2Ym5kQ3k3OXVkMXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2NJZkRjYStKbTZlUGJNeFlTQmFoSUF4bGIvMVlhZ1VsNForRWlCSDY0cFRr?=
 =?utf-8?B?SHFHMXlKY1duR1NpTUEwTG5xc2pGQUtDWHl4RDNodGswNFp1cjl2R3B3eTNT?=
 =?utf-8?B?SG9JeDdMMGEwU0lBdy9VU2dnemw4R1Rhd3FIbEdOSUdpV0dsK3lIK1pITEFj?=
 =?utf-8?B?bmRhL3BZeEVTZ3BjTFhRbjNCSnZJeUt6ZnhXMnlOaVp1aURxWjExREhRUVhV?=
 =?utf-8?B?REljbVFsaEdaSWpUUHBOMGxZR1oveXY3dGJMdFJKSWRsUnNEMnozM1RZVUtj?=
 =?utf-8?B?REJOQStmckZNYk1jUjRlaHdkVUt2Z08waWZTS3M2R1Q5R2p3cUxTdEIzOXM5?=
 =?utf-8?B?dVBGZWYxZTlnMDJBSjlyVUNCV2VkOXhHSHJXRzVjR1dQVnBvRC92SUNGRFY2?=
 =?utf-8?B?SlFsYldtQXlpbkJOSFJNOXRWc05hSlNUa1hLVDF0UHNaTTlrazh6UDIyRE5C?=
 =?utf-8?B?S0FvbVpmbWIzb0ZrTE11bFdOTE1rcDUrYW4wMnBxTzg2WnRzNVI0RlZ1aHAw?=
 =?utf-8?B?dDdLeG9lZUFiK1VBWWVXTWlzdjBqWExWWTFza3Vkb0I1SDhFYXVNbEdDYnEz?=
 =?utf-8?B?N1ZaUlhObjR5VzdWb0NvVXpMbElTTjFiQ3U1UFJyOFN1Qk1iTEdkbXZpT1Qy?=
 =?utf-8?B?dGNzZ2ZEd1VLTEgyc2luMG5yZmt4Unp5eEtpY24xN09WN0loV2ZrWjQ1UXhZ?=
 =?utf-8?B?NEozRWNlVEN3RHdNbjFkNW9Bc0VtU1dmUFcwNXBuZyt2eEJLWkd0NW5QaGZU?=
 =?utf-8?B?cnNLTWNZVTRIYWE5RmRJN1AyQUx6SXBtVVZBYy9FbElYbWd1czRPWkYzVEJv?=
 =?utf-8?B?dVJOOW5uUGE0cHUzeW1PaHFOV0hoOWR5TTRMZEltZTV2cXI1WFhvRXNrSmFG?=
 =?utf-8?B?R1ROZ1FBa0laUjdaV0krTGs5cTV4WkhiYllhZEtscURWWDVpZngvK3lwWlov?=
 =?utf-8?B?cGlXbE4vN0d5NlF3TEZUUGNSM2Fmdml0S1ptUkRVWnlHN0VPREdXRnJOKzIy?=
 =?utf-8?B?b2FYcjFjVHZpU2gvQ0ZXQUhFKzNiU2xqTlluU2xQSnBDMTR0cGdZcGlUYXZs?=
 =?utf-8?B?dEE5ZktpS3dGR2FTWlZySHE0VVFjbFV2TlhQSkF5RnVHM3ZCNkRrWlNiVUE4?=
 =?utf-8?B?Q0ZEL2R0dkdKYk5CS3Vac2hER1JiQ1hIYzgyb0x6a1h3dnFIeXduTFhSWGlQ?=
 =?utf-8?B?SGZNNGE0OU5nbi9MTFM2WitwV1owR2xZcG4xSTB2Ty8vZjNCc05pdUhiL0M1?=
 =?utf-8?B?YS8vMTJLeW9pTzdsdjgvajJCN1NPUjFyQlhTbHBzMzd2VUs2dXp6akp0RXNN?=
 =?utf-8?B?Q1FjbVBOMjYyYTJkeURuT0orNUY3cXZZSlZVa2Rmck9ZYVd3b3FqTElWNzVI?=
 =?utf-8?B?b05yM2dRUUJKcE9ET0sxdDJVZ3QwMmd2UDhKenZsL1YwcWV0NmZ0WVB5OXVh?=
 =?utf-8?B?a2N4TWt3ZlVPaERwNHVGY3FTYzFSWUU4cjArWEkyTXd4T2pRRjJzM1Bvb2pT?=
 =?utf-8?B?ZGIzdHMrQnptR05rUDB4bWRraWRkalZLUjRacU1sanpLcXk1VUhQMWNpdVZJ?=
 =?utf-8?B?VU5FU2M3Z095MTVVZnNTNDRRajFBTXlzbTNsQm9JWWUrckY2QnNOQzAyL202?=
 =?utf-8?B?R0wvb0kzamVHdmk0T2hKLy8vQmlibVFRak5HNG9QeWNmYkhKdEFlcGZ5MGRW?=
 =?utf-8?B?cDZ4NE9kSDJvYkVwM2lTK0EvRmFSV3E5bUpCWEM4bUZ6L0NHMzZZMUt1Qm5D?=
 =?utf-8?B?M3lQVFc4TVZMZUF2Tmd3NXZHR3QzTU9mVzlQZml5RmdaN1kwWlNZNWc2djhs?=
 =?utf-8?B?Ym4yYW1nTUFzWXB1VW8zNWZJUHZ2cjlmOW1JczF5UzdDaW1qUjNISEx5WmND?=
 =?utf-8?B?TGpoR1R1YUVBajBkR2srbzR3OE05ZDJzbHBPd2NseksxRlpIb0phV3BDNk5q?=
 =?utf-8?B?MFVqaGdZMjJiQzZHS2tVYklQckNhTHJackplaUJodHZLZlY0R2IzNStWYlF0?=
 =?utf-8?B?elB5cnU5YWp1RnE0cEtqYU5wWVRsR3VzazZHNTQ3MHFPdGk0VGpwUDhzb1BD?=
 =?utf-8?B?dlMzT1draXJYbmxWZmk1UmxMUC9ubU1ObjZtNGRVSDQ2UG1ObmtQTGw3TmdT?=
 =?utf-8?Q?3uAr++5KleY1w9DoY9K0zPtLK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8fb7a7-0d83-455c-c67b-08de0cb595ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 13:11:57.6740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVDE+412LTV00T9Ltnb7qVMt6/ZmimDdrSthaDEE17JSDADAIhlcgv+0bo39jm3T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5820
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

On 16.10.25 14:31, Philipp Stanner wrote:
> On Wed, 2025-10-15 at 16:01 +0200, Christian König wrote:
>> From: David Rosca <david.rosca@amd.com>
>>
>> The DRM scheduler tracks who last uses an entity and when that process
>> is killed blocks all further submissions to that entity.
>>
>> The problem is that we didn't track who initially created an entity, so
>> when a process accidently leaked its file descriptor to a child and
>> that child got killed, we killed the parent's entities.
>>
>> Avoid that and instead initialize the entities last user on entity
>> creation. This also allows to drop the extra NULL check.
>>
>> v2: still use cmpxchg
>> v3: improve the commit message
> 
> For the future, commit messages in the patche's comment body are to be
> preferred since it's common kernel style. Same applies to the patch
> version in the title, which should be in [PATCH v3].

Ah, just forgotten about it!

> 
> But that's just a nit. More important:
> 
>>
>> Signed-off-by: David Rosca <david.rosca@amd.com>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4568
> 
> Should this have a Fixes: ?

No, I've actually removed that because the patch which made it obvious that something is wrong here is correct.

It's just that this seems to be incorrect ever since we added the code.

> 
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>> CC: stable@vger.kernel.org
> 
> So we want it in drm-misc-fixes, don't we?

Yes, the patch is based on drm-misc-fixes. I can push it when you give me an rb.

Alternatively you can push it yourself, whatever you prefer.

Regards,
Christian.

> 
> 
> P.
> 
>> ---
>>  drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 5a4697f636f2..3e2f83dc3f24 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>  	entity->guilty = guilty;
>>  	entity->num_sched_list = num_sched_list;
>>  	entity->priority = priority;
>> +	entity->last_user = current->group_leader;
>>  	/*
>>  	 * It's perfectly valid to initialize an entity without having a valid
>>  	 * scheduler attached. It's just not valid to use the scheduler before it
>> @@ -302,7 +303,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>  
>>  	/* For a killed process disallow further enqueueing of jobs. */
>>  	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
>> -	if ((!last_user || last_user == current->group_leader) &&
>> +	if (last_user == current->group_leader &&
>>  	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
>>  		drm_sched_entity_kill(entity);
>>  
> 

