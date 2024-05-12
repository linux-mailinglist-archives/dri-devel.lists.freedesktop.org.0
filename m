Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6A8C3741
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 18:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C36A10E1A9;
	Sun, 12 May 2024 16:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lJA8aZ8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0558910E1A9;
 Sun, 12 May 2024 16:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1EQnupxzI2PVJOoigMOjhYTRN2v+bvn4vbrkyP2iWVocqCuNktt9b+lqh5R5BuYrZqQaEJxtA3tLeEfbH8s9V+LN3lpmj7DrmHCUAjPBu2BpMj7B9GUebMIV1vQ864N1zqLS4/5/OO5f8eWO19gLG0bJQ8mLuSvtwvPgJLdu5PPR9qufqs+b8lcol6DLPNyVgWEUiwtJeLSFLrsxvtC+NjfmUZpqPnLtu5z2tC8PXkS3rtQ3Mz3wXlrEudZ6Ebf0U1jIEL8rVyEBUCx4NfUrGZvQ0hHPAWvuTWjhJJGseJ1KlZeX0PxuzV/nIBn2pw6xGIiriL+j7tGUlhMiBX32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ4xIbHYp46q3hW31MThHu3/id056cSMGD16uD3oG3E=;
 b=L0g+vPN6u5qu9ohKpM9QTkjBaZUEdJtefczZkmVJ0NW7Q2TEMUXQ5oIDJXyoGH9+14oRf/lCX4ZmrrChgv874185Vs+dZY69pbjE4zmmFEQ9azeouhLY2b/TZlcbFrs4ybuOkeR/kXEPlL9W5V1LlwvycliD5+Ej7B6/218Obs5+ywdP0Drbvf3MpSTrmUPm2SoYq7kf4STvX3B2P25sTroEtdqBBkJmpMyN2i9NVhXCL2kJxipdjVo2g7wYE9juXPtHfQOFvbA0J1qSCG17jmktx0kJ314s/1r44KBRifYApG9DRKatOkZ7R/PJFMAO5A0fAgSjbS5dlU2LKHIwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ4xIbHYp46q3hW31MThHu3/id056cSMGD16uD3oG3E=;
 b=lJA8aZ8sg3QU93zLWiOFGjQwV9jA/RSqi5Cbt+UqNk5WbgNk4g91wjhV1LRox1cGqAlyqOWzPPj1mNPMkfWCc+h72LMKe8uOryJSwCqrDjbywE7YeONh13qATuspW2wJ9AobvU9A6Hz6c0beS5VdNh8EzYbll5nepedHg5Ii7tc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sun, 12 May
 2024 16:11:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7544.052; Sun, 12 May 2024
 16:11:31 +0000
Message-ID: <6f66e479-2f5a-477a-9705-dca4a3606760@amd.com>
Date: Sun, 12 May 2024 11:11:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
To: Jani Nikula <jani.nikula@linux.intel.com>, "Lin, Wayne"
 <Wayne.Lin@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "Wentland, Harry" <Harry.Wentland@amd.com>
Cc: "lyude@redhat.com" <lyude@redhat.com>,
 "imre.deak@intel.com" <imre.deak@intel.com>,
 =?UTF-8?Q?Leon_Wei=C3=9F?= <leon.weiss@ruhr-uni-bochum.de>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20240307062957.2323620-1-Wayne.Lin@amd.com>
 <0847dc03-c7db-47d7-998b-bda2e82ed442@amd.com>
 <41b87510-7abf-47e8-b28a-9ccc91bbd3c1@leemhuis.info>
 <177cfae4-b2b5-4e2c-9f1e-9ebe262ce48c@amd.com>
 <CO6PR12MB5489FA9307280A4442BAD51DFCE72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <87wmo2hver.fsf@intel.com>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <87wmo2hver.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:806:24::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e76ab3-10f1-4bf0-1e07-08dc729e2fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnlmdlFFOUZCcFYyQjJjK3VEVDgxUzJFTUIyTldUUklmakRTRlM3eFM0My85?=
 =?utf-8?B?bGo2Z3BwVnV0cVh1RFJNUHpvc1ErTHQ3Mk5kdUtVYmU5QnVPaU5Nd3Ixb2g3?=
 =?utf-8?B?UGNVd3NaL25scTJtQjJVOE44Q0RXOEZENUtzOUI4SnVLSHBPcm5EeVRiOE1m?=
 =?utf-8?B?cE9VSnhhdEFkRE9qTjdGOC8xS0h0dTVsOEFhcXlMSmlYMkNFTUx6V2E0NlZZ?=
 =?utf-8?B?cmt3UlZScFI1M2d1S0tERXJuWnNjVnl4VksyTWNURWxlREVhSVY3Vkx0ekZR?=
 =?utf-8?B?QWY4ZHFQR0t2RXAxbmJ0cUpZcXhJWWZvdFpEaGNEdkttOTQzN2NhOTdkRnpk?=
 =?utf-8?B?czM3WXM4VkdxSzdIVWUyYWxSS3p4SGUzRCtlTnVqUzdDVnhuVUEwTEZncGhC?=
 =?utf-8?B?VmI2em9Uek94ekxjVmVFRjN0NjJnUVp5eDc3cTg1aFNjMmlHdVFJL2VrQlRL?=
 =?utf-8?B?K2RrQ1lqNVV2M2dvOFR6bU40dmJodUFEaG9sK0k4ZzhRb3AxcG4xQzdUUnFZ?=
 =?utf-8?B?cVpyT01vTFRNeFFmUDhFeFZabGplQTBkMzlaTzNtdmRrb1B6WTQyTHhrcWNw?=
 =?utf-8?B?a1dnaERBaTNzUk5vbnhpNHduMUFabUpFcHQ4MS9iRE8yaWFpVERXZUZrTzFJ?=
 =?utf-8?B?ZVR1M0JTeHdHdmNHYi9tZjFpQ3lRUWZVNEYxdVIrMnhCeFN4c2pDWllnTUFW?=
 =?utf-8?B?dkkrc3VYZHh1SkJDZE5KeS8xSkViRlFOTk81Z1o0ak42eGdCblZFbnIwZXpw?=
 =?utf-8?B?aDN2eUpvdDRQNzlZQXk1V1N0SUl6Sy9pei9IeVY3QVNrQ0l1ZVVCQytvZndS?=
 =?utf-8?B?bXJCU2o3U2VIdkF2NEtoZjlKSEtOUUFPMjZUampONWEzS0tmQU53UWtlVmZC?=
 =?utf-8?B?OFpSbDl4MGMyb05sU1pHaFF4M003SDhjZDZtbHd0WWh5cDRLVjcxRDVIT2VW?=
 =?utf-8?B?ZzdadGFkbUtZbXp6U0gvZ2JTY2ovaDJRdVlURUFiVkVYOXNQNXE0MG5XeFVD?=
 =?utf-8?B?Uk4va0hJUk5IK3B6dmtRdFg4amVoUE1RQ3RrVzNVMzJJSlpUWHZLT2IxWGV1?=
 =?utf-8?B?Q3Q4MkxteUhVUGhBWlpaOTkwOUREQ2FKSWlUM1lSQS8wREl5MkhHcXJQYzhO?=
 =?utf-8?B?bS9wbGZ1aU5mK2xpYno0d0s1YmFQemp5cC9VSWVrYnNSeWVFd2U3dDFOUGtJ?=
 =?utf-8?B?UmhqSzhPcldUK3Ercjg2Rk1NV1RHZEFyaTB4cFVBd1U0UHprdjVzRm83WFJq?=
 =?utf-8?B?YzJFcVcwaXF5WWgvZldreXgzMVhuaGxud2FYRVVsejVzYk41WXZDSjRyNkVW?=
 =?utf-8?B?OTRsV1JPYXJXTmFyK1hmZGtTTUJzQWtTUGduc21jQVhyY1RIYmlmWVBYTlF6?=
 =?utf-8?B?OVQrTTB4bi9NL1hUMGhKUGorMVR0VzR1WEx1WUtxQk1IWnB0OWVhQkNNeGFz?=
 =?utf-8?B?T3RaQ3NZUldHanVTKzhGNHhSVFUwMXI1VnVZWlQ2SzBZa2FpZm11NDQ3Y2dx?=
 =?utf-8?B?elN4ck15UlhwRW5RZU01R0Q5aGw2bXJSTUVCQTFUZnR5L3hmaGowRExlMG14?=
 =?utf-8?B?RGdIaGJOaFFKbU9IWUI1VnNIUytpai83czA3ZEs4dmQwT1JPMDUzYnVmSzdV?=
 =?utf-8?Q?sxQte/rHIX4dL40I0PW0t0w/pAjb0qZQ9BJR0GRz1kXk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEJ4NFNIQkh5TUZRd0dlak4zTnB1U2hkNkYyQmpyc1d3eWJGQkdVNGlPRkVx?=
 =?utf-8?B?RzV2V25iK0NNOW11ZXF6dEZPa3pkTmRDakdNcEd5MDEya2pMMGhxS2MrdlZF?=
 =?utf-8?B?TzlyUjJrTU1mNUlnQzBmTjg3N1JXR2o2blArVXJKcEFvcGNOZ1pRUnliZUZ4?=
 =?utf-8?B?Wm0zV2JTbEZxTnR6QXVnZUkrV2FyZG1XOWNGYmlMYmZnVWpvS0VXS3UvWnNH?=
 =?utf-8?B?VUZPZ0JxYWtZc1dySy94ZEt4eDNBNUEzdC9WQncwdWRxS0krdVRLZG1NZlJY?=
 =?utf-8?B?NVlwSm1JZmVOR29FbS83ODIxR3M5aStqSWdGYU1HSER3UmdWa1JNNXNyRUdn?=
 =?utf-8?B?MHAxWFA3YXpQUXprQ3VCZHErYUpmK1M5Ri90L2g0cmVUcEFnbEpRSE5vbldi?=
 =?utf-8?B?MkgxSnVyWWhwRi9WdG1wdXJUNnFYdDloOHVCMkRGUVEySjZCaGxRUEY2cFd5?=
 =?utf-8?B?bzZKYkp1N2hqUGk3aFZzZFc4bUIvS3piN0xrSGNVbERLd1hkWjhpckRDV0xn?=
 =?utf-8?B?aS9uNnZWdTI3Z0FYOVJoRllBemJhTHg2Q1FEWENVaGtjbmdiS2gvUTJMZmZZ?=
 =?utf-8?B?YUNpREtTV0wyU3BxZ2xGSXhMb01jNzgxKzBaaWdFaE1OZE5NdXVLdVg3UWQw?=
 =?utf-8?B?N1lZUTBQUUxJWUNNUlpialJsRDRLQkNQbW10ei9nd0Z3OTRqVWlwTWFCSTBF?=
 =?utf-8?B?R0NScElvV1JZeTZsTlBldlpxZWx1L2J6a0ZMUjZFbFdUazdBeUk5eURCd3g3?=
 =?utf-8?B?cHBRV3YzcTBBOW9MN29PUXRBV0tsNlZwNTFJTGhZcmhQY0hndFowbG1BZXJ3?=
 =?utf-8?B?MGxpUUhya1hJWmM4YTNpNGYvTWxQbS9hMWVUOHR2UTZEcWRrVVdseS9KaUFU?=
 =?utf-8?B?eGxiaFVEL2wrZW9FYkRhUFQxMUFNdUdFdGtzR01oM1Jia0t1UTJldURWRDRG?=
 =?utf-8?B?Nnl0Nm1iUjI2Qkpiam5ZSHo2QzhzSVJNOEQyUGd5SzkvdG1DZ1ZPellqK3Jh?=
 =?utf-8?B?dFRaenNrRkgwZVBOam5pSlF5VkRmOTdSY3VBcjdERGx4SEtLc3AxTkNuM01Q?=
 =?utf-8?B?WnQ2Q3I4VmNvR2Mzek13L3d2VVAwT25KbHRaNEVEVDVibjhkZU12VzIyZnk4?=
 =?utf-8?B?SWppNXVCV1BaeHFqbzFIU2tLajdGeUxnYi9yc0V1M1BiY0huT04yYWFlL1lr?=
 =?utf-8?B?aHFoNmN5aHRqdW1Ra2ZRZGd3ZVhBZ3Q4WVdlMllmUXBwS1U2YVMvWVhpUDBW?=
 =?utf-8?B?bUtqaXpuUzI4Q2paR0ZXajdpN2Y1RGFqWjZFWGxnNXQzVTgvR2FFNUoraHpy?=
 =?utf-8?B?YnV4NXh6L05lQk04MXFiMm11c1U0TTBQOUxOTk1zckZKaGUwV2tCYThsTlhU?=
 =?utf-8?B?cGQ3RGNBS2NrTGtZRysxNWdTQU92L2k3cUxQQmM4VG5SSXFWaGhDVzBzQ25X?=
 =?utf-8?B?S0V3REtCZ0w5Sko4M0oxeW1qRHFuRFdMMHEyd3AvMGtYRVJHemY3YWthcEhQ?=
 =?utf-8?B?eW1LaW05bmFTS2ZJK01GeG5pL1hyS2ZYQWVJa0l0ZkVUSEltZHNtcXk3VFdk?=
 =?utf-8?B?aHZwR0pQMHRsTllreEEvM0pYbTJBaDlvUWg5ck1SMER5YkpTMGh2M2tKMHRy?=
 =?utf-8?B?em02V3h2V3NoR3BSZ2dERzZYTWRzRWZpZUZOQS9FNTJuR0NsRWg0bkhCbDU3?=
 =?utf-8?B?ZS9yaUlXRjNudDgwanc3aitXdUhVSUY0VGJ4TE5Hd0xLNXBRYk5XajAwdGw4?=
 =?utf-8?B?ckNrVmt4RmxuQXM4QU0vOEZZbHZIOVVVbFV2ZjdQVis4ZWJwclFCODhSd0c5?=
 =?utf-8?B?MFJRNTVNNWxMdnhiRFcxVU1ETGJrK2tMekhWenM2Yk9VeFRTelJWOHJ5eXJK?=
 =?utf-8?B?MlFMeVhiU2VSdXVUOWtSTS93c0NjRW5WUVpuclpLUWh6dHEwUjJqRXh2RVlR?=
 =?utf-8?B?dm4xelpQNmlscVN1YzZoMTJwOWFRaTlwM3hQMnJDUjBqdk5rVUt5NlNmbit5?=
 =?utf-8?B?TzF1WmpjUHQ4Q2xVV3Y2UjlNZmZuRE54MnZUQ015WFNTOXZmV2lQR2ZRREZn?=
 =?utf-8?B?d242eG4yUFFNdnlpaGMvakFFQnA1b2xUNjg1dnN5aWsrTHJ5NXQ3S0xaS2hu?=
 =?utf-8?Q?ebd515c9vB9HPO3am+UEPsmZr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e76ab3-10f1-4bf0-1e07-08dc729e2fc5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2024 16:11:31.3165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76SvKHSexKrImR43QtCHhRjzM/UMSx0r3L6qs9Fjg9f5byWZ0+PdOqQKX/KigcjXaPQkAmcJPNnJReMWyAP40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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



On 5/10/2024 4:24 AM, Jani Nikula wrote:
> On Fri, 10 May 2024, "Lin, Wayne" <Wayne.Lin@amd.com> wrote:
>> [Public]
>>
>>> -----Original Message-----
>>> From: Limonciello, Mario <Mario.Limonciello@amd.com>
>>> Sent: Friday, May 10, 2024 3:18 AM
>>> To: Linux regressions mailing list <regressions@lists.linux.dev>; Wentland, Harry
>>> <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
>>> Cc: lyude@redhat.com; imre.deak@intel.com; Leon Weiß <leon.weiss@ruhr-uni-
>>> bochum.de>; stable@vger.kernel.org; dri-devel@lists.freedesktop.org; amd-
>>> gfx@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
>>> Subject: Re: [PATCH] drm/mst: Fix NULL pointer dereference at
>>> drm_dp_add_payload_part2
>>>
>>> On 5/9/2024 07:43, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 18.04.24 21:43, Harry Wentland wrote:
>>>>> On 2024-03-07 01:29, Wayne Lin wrote:
>>>>>> [Why]
>>>>>> Commit:
>>>>>> - commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
>>>>>> allocation/removement") accidently overwrite the commit
>>>>>> - commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in
>>>>>> drm_dp_add_payload_part2") which cause regression.
>>>>>>
>>>>>> [How]
>>>>>> Recover the original NULL fix and remove the unnecessary input
>>>>>> parameter 'state' for drm_dp_add_payload_part2().
>>>>>>
>>>>>> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload
>>>>>> allocation/removement")
>>>>>> Reported-by: Leon Weiß <leon.weiss@ruhr-uni-bochum.de>
>>>>>> Link:
>>>>>> https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc8.c
>>>>>> amel@ruhr-uni-bochum.de/
>>>>>> Cc: lyude@redhat.com
>>>>>> Cc: imre.deak@intel.com
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Cc: regressions@lists.linux.dev
>>>>>> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
>>>>>
>>>>> I haven't been deep in MST code in a while but this all looks pretty
>>>>> straightforward and good.
>>>>>
>>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>>>
>>>> Hmmm, that was three weeks ago, but it seems since then nothing
>>>> happened to fix the linked regression through this or some other
>>>> patch. Is there a reason? The build failure report from the CI maybe?
>>>
>>> It touches files outside of amd but only has an ack from AMD.  I think we
>>> /probably/ want an ack from i915 and nouveau to take it through.
>>
>> Thanks, Mario!
>>
>> Hi Thorsten,
>> Yeah, like what Mario said. Would also like to have ack from i915 and nouveau.
> 
> It usually works better if you Cc the folks you want an ack from! ;)
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 

Thanks! Can someone with commit permissions take this to drm-misc?

