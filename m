Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90393235F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9711010E61A;
	Tue, 16 Jul 2024 09:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0hvgkioi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D5A10E61A;
 Tue, 16 Jul 2024 09:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHPIjD6hdkMXxzIW+d4Ay54HmbGiGUoiuC1ynGYHa/Wvznx3tKE+N+zUNllZbsjthaVJx9xh2dKww0FE5hzRhshEol++oVDKOF40Yp/tK/o+Y8lOLS3Gcb6I7B9p00Fzmxvmm7W9DIO7ZhBlw/byJzknOa0ycQm6VCPa6EjvreKa50gkB5TlqjWFPuZtVFuondpGP12HgDIrH1yYfIGBZJSNouRonV6xukhTkb3fK5G6yK1wLQ3pAKb8bdEGcWLo/3HvcdSdDcPn5cHK/NRXJg7PHj9sF2/Bd+ZMgQMKbrLGaGJQjerG0mFVaFky//Bkh+QBSq9pDXPa+85uoz1uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5f7mRVkE99qNbHUwEAAG86iqxiKoBw9hLBp6hHnF7Y=;
 b=sOWaRd/MrW68jtgf4rBJqvTnlbD0BBQaJumNpjlYTbrufMG6K4k1nUynJn2V9kT3E08ejb6waFRK/3sqPXa48GPyT/2+Tp/4c7fCYLRg3ebLbURvHkIgid0hBVtFg6B+g1LvwoAO7w9NuxNH+ws2eqOP8ecvi7VyWLmpV6yy5I1QK9MBD+/GoIn5WSNTrQzFUs7PWiZAQoWjyMOZZRV7LVgeEqtWn+KHRjBk/n3MXN9tzFDMnzvVuIsJhkFfoPjpBDIjCPw+j3WL3psSXACoBBWP3wpLJeag/5TpSjwQ5YONR0xscUmLqCG1OTIa08tGNpHatdvn+BYcdZ8MXLJ5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5f7mRVkE99qNbHUwEAAG86iqxiKoBw9hLBp6hHnF7Y=;
 b=0hvgkioiDmQyTdwMzb/+TpSa0WL7cIdA1Eu94vepGPwg0u4nLF/KDiaqusmA1rx+y193VOhtdgp5Xs+0H+mks97gZcMNM4JxkKlU64KtZqArlVgYcbzQop6snd1reqqasvn9mWO9ujPCtGoe8vMnrYgjmuncuNsSwRNXwLpBW50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 09:50:57 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 09:50:57 +0000
Message-ID: <f4027aee-1ff2-4f0d-8230-6f6b2e101f78@amd.com>
Date: Tue, 16 Jul 2024 15:20:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Add start address support to trim function
To: Matthew Auld <matthew.auld@intel.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OcuKoZYizbeU_RGPaWYvTpxGMPWg6xOXaPASBMYb5kig@mail.gmail.com>
 <635ee761-13a5-413e-9953-cfb8c6d3cc0e@amd.com>
 <67ca2d5c-a762-4627-94d1-532b0e3d2100@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <67ca2d5c-a762-4627-94d1-532b0e3d2100@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN0PR12MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 42de9fc2-42d7-41d0-1fe7-08dca57cca6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtqNXVUUDdYb0g5NjFCOGN0RTNFSXNFWWZWT05LOVRQOGRKblgvdnBUNDZx?=
 =?utf-8?B?dTVVTXJMK2RFNkJ4cm1JNTJHdU9ONFdaQlZLYUZWQVAzRVNVVGhWQU5jeWs3?=
 =?utf-8?B?RUtFWHVCVGxuWmdGSmdnSmZhM01iTHEzTUZjYkNwLzJMV01JeWtGS2VyaVpF?=
 =?utf-8?B?d3dqb0VBeHZzTkt1dUhKclc1Nk9vWXpvZlpqd3Ira2hEbXFpeGNsdFBDbVdl?=
 =?utf-8?B?V1I3VnFUN29UUVRVU1I5SmhlTWgzMmY4bll5NFhteWN3SUlsYVFsSXNwUERJ?=
 =?utf-8?B?VHZIMkpOOEhuQllmMGhEOWVIK3A3MU1OdU55bXF4YTdJelNlLytGU0FvZFVH?=
 =?utf-8?B?Q0ZqSzBlRHVGMXpkMUhndForMVIzNEJYN0lRaHZSRXVEQ29WUzA4MkNQMnpJ?=
 =?utf-8?B?bDVvZnU5MVFGcmZVcng1MlY3SVNtT3AxTndTLzd3bkZxZW9xR2xucDk2N043?=
 =?utf-8?B?T0o5QWFWUFR2V0JTZXpKZ2JWYllFUFN5QWZjQVA4T2RMVlFXZmZlQVpTazhV?=
 =?utf-8?B?dzRYSFNkM1U0aWFVOWcxdDU3ayt2RXVEMWlHaC9UazZCYlJEOFZHa0U4UTdz?=
 =?utf-8?B?REQ1ZVVPWXkyVS9jVnlxZHdMc0VyNXJoM3JHZVlJVndoL2RPYkRqdEtwa25z?=
 =?utf-8?B?a0V0eTMzeFJCODl0dnFPaVRlT1hZeGhwTU5ZTnZXVFMrNUw0R1Vmakx2K0lx?=
 =?utf-8?B?K0NZRWNseG50ZXVmL1M4c01mK2ZIa3ltOUZOMFdiZG9tdldUZnJ0ak05NUVr?=
 =?utf-8?B?MmwyUUJmQW5IRUZ1V1FidXFWOFdzT3hrSGF0SlhjNlVnUC83RWRVU0FYYVpo?=
 =?utf-8?B?M3RoQVBHaHU5NERBandYdFJ5MHUwOXpBT0NrdS9zd1FldE1zM0RLNzdsZnRF?=
 =?utf-8?B?V1dmMTZRdXdTMmplNUUzZE9aK1QvZXlmSTUrcWgwN1pjVk9pM2FSZjNCY20w?=
 =?utf-8?B?QzN6MUZpZHVCWFVvQUR1dHROTlpYdXBQMGd6RXV1NkgzWjBWQ21TbmR1RjRz?=
 =?utf-8?B?WFhhc2U0T3Frdmh6Y2J0TVJBL2o5M2NndzVmYzlMYit3Y2lnNmErNXhXRzNt?=
 =?utf-8?B?UHNiWkdNQTAwZFhhWjV6eldCZW9OWFNERU92RjdXRHdjZUMwenp5TkM5a29l?=
 =?utf-8?B?bUV0N1NsSlhic0Fkc3MvUjVRLzZqWlMxMWJybkJDd0hrQzdKbCttKzl3dkY1?=
 =?utf-8?B?UUdnb25xTzFucTFXSzgva3VtSzR2eEg3bk9hSjYrZnJyMnB0eERUNmdkTXJL?=
 =?utf-8?B?ZWhBTHU3OURWSWlQdk1FNGR2eUR0cVF2N1NRYzk3QjVmaE9Ed1FYWEY0U1ox?=
 =?utf-8?B?UGsxbG42M2hXeFc5T0RZRFA4OHlZVzRPcmNBU1hlVmdjaTBiSWI0VjVGK096?=
 =?utf-8?B?b3Fya3I4SGpDdmNHdDh5eGZ4cVdEd045cE1qWFk0NUFEK3UySWtjVHlvZExE?=
 =?utf-8?B?eEplb2krVnNJbjZtcmFsQVdWZjNQVEtvR0VrbHVlQWZiYVdaSmI2ank3bm9i?=
 =?utf-8?B?aEtOa0kwd1ovMUdqWHgrVWVHcEY5QTV2LzFIVUEyS2FrT1NGQzZVaVdWVFB2?=
 =?utf-8?B?ODhBSGNEVHNJVXkyMjFmUEZIREY3QXpmdjNsdDdVRERXLy8rU1d0UE81bkZm?=
 =?utf-8?B?eHp2YkhhcHMrRFR3aDlvNXhLaGRmTis1VXNpeWpnUUcvNnJUL1QxZUdHU0w4?=
 =?utf-8?B?eW1iNG5pcjJiTjFxdlFPM3VJREFJbFRsTkk0cDl4VndEQ1dnT0RPc3V4bFFm?=
 =?utf-8?B?Sm05VXVZL2pBWGRhMlVXWmx4RkJ6UFl3VmU4RzNLWTREWW8rbitXcjJRYUU2?=
 =?utf-8?B?dEhGT1Y1bDFNaUJmMmNjUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTZGcGJSSUJrN0dZS2lYUUhMcnNBQXhOMEd2QiszTXVMQm9RN2h2N2ZmaHVh?=
 =?utf-8?B?OHdvZU04T296SUs5ejRaYzVmUlRVai9rdHBSNUFsazBPanhrRTJ6MUNMblVh?=
 =?utf-8?B?KzNNeWlkc3JkbXk2eXgwVjYxdDFaTmpUV2RZb0JJOTdCQjhLTlh6SFB5V0xM?=
 =?utf-8?B?M0R4cTdpQ1V6UDhZazZCdkxUbXpLcXpHS1p3V1VZcHFmTHJIMmcyR0lzSHJE?=
 =?utf-8?B?RjFTNjlNZUczdjNyYVVVYys0cE96bGowMi9nS3pwWXNieERxek00L0l1K1lL?=
 =?utf-8?B?WEdna1NQTkZMZlBUNG5kcjVGNGlMMStKeGJQQW5aaGtKNEF6V28xYXpxY2lR?=
 =?utf-8?B?c3pMWFVib0RCeGsvSWpiWXFEOFYvR3BKS1Q0NW1Hdjd2TEowZ2l4K0pxNTds?=
 =?utf-8?B?SGdEVmpSTlNaUVpJcEY3a1ZVWGVGV2dESnppOHZETzFlUS9xTS9JNjZDa2tW?=
 =?utf-8?B?M3pqZnZZRGt5U3JjLzFEMTF0MmxBWXV5Y3JaQU9vU3Q5WWV3SGFqYjkwcGc2?=
 =?utf-8?B?NG5xT0k4MFkzL2wvK1FnWDdJb2FTQXFZMmxWMGxUSWErR21nNmJCaCtrcU1X?=
 =?utf-8?B?RjBvSFFYbERFVVdvTUxMOEppLzdxVWJ2aEljQzNEWGlzMWUyNHJxSzBieDdk?=
 =?utf-8?B?L0prQXJ6ZUd0V1g2SVRKWThRT0oyNDVPdzBoTkpsTEFQSkhYRmF3bkcvbDhs?=
 =?utf-8?B?ZTNHcDJEaHNnR2RiWUgyVkpEWldNU2JsL0t4OWpqS1BqcHpucThqUTZIeE03?=
 =?utf-8?B?SXAxUTdwd3ErNE9JS3FSSitXL1VzTzNTVm13WVF2cm5Tcy9aY0JwRHRMcnpH?=
 =?utf-8?B?cGM5YUI5a09lSzdFTElCYkt5MHAySjZmRXEyd09jWHZUbStOREQxT3dZeTNR?=
 =?utf-8?B?Q2F2M3F2dlpxSzZzVEpESmRRejhUbm5JSlR0YU9ZRTFyOFlsRCtNVUxlbWth?=
 =?utf-8?B?dlJqMzNka1pCUXBiU3VoazBsd0RkbTFyUUI3a1locDViME5DK2ZJWlF0dVpJ?=
 =?utf-8?B?eGpSOGN4cHNxY2RjeEFQVHZYYjNxaGNoV0FpUUJhd1Y0V1dFaHBGSzRCaHFJ?=
 =?utf-8?B?b0pNajRVMG80SWFqS0QyVnpvZFNMK3R0a0pXNnB3WW1sVUlTMUQwTklRR1lk?=
 =?utf-8?B?ZmZsTVZ2T3NGVzY2WVAzRm9veXpLbFJKVGVDck03RzVzSXNLKzBXVmFNY2xs?=
 =?utf-8?B?REplTlhmcGlqdUJ5ZUxmY24yOENWTEF0STdQQUhPSkwydm1wUlh6VWJDblhC?=
 =?utf-8?B?cXk4Vncwb0w1TFFPeXptUDhTbHpnakw4TzJKZi9YUmNNYWdWTXVsQ0ZOREo0?=
 =?utf-8?B?SEdaSmRNTDdsS0tCMFdCV3RIeVI5czhkV29mWmZWbW9HbGZ3MkFZUHF0cGJU?=
 =?utf-8?B?dHZGY1FQUVBqaklVR0ovak1mVlRlbzVQQ3BTM1dpU0sxZm4rK0cyeWpyalEy?=
 =?utf-8?B?V0JsUnpSaFBIU0ZjMVVqNDdRT1hMRnpIdkJUSXM4V2JZdkYxT0FkTWMvdE9s?=
 =?utf-8?B?RzZBZXA3QlZtaHp0NkdIWktRZE9odGxoSDRLdjNUUFBUeXdSUGZMbXdaRE8z?=
 =?utf-8?B?SHlUY1E5OEwvNThKWm9tSFdsS3pybkxHZmVyK01NalZxVXJ6ekttSlBZU3hG?=
 =?utf-8?B?clR1Vjkybkg0MThrMmJuTG90UVB0MVl4T0tTWE1WL1NRdTlkRzlUaXA0UmMz?=
 =?utf-8?B?ZXZ6WWhZYXhCRTh0YVFIdm1XYnJ2c0ZjU1V3MjJGZEYyRTg4MmdEUnFNdElJ?=
 =?utf-8?B?UkRKSEMwdDZGbTVUZmU4cnBpckRCV1VpTmU3YkFEVm45RG0xUDhSMnRWdFBn?=
 =?utf-8?B?dDNOalA5aEFPUnNBTjhkNHh6MnU1NHU2N1I0V1lpdFQrWm5pZkpxRE8zUXNW?=
 =?utf-8?B?elpuUE5Qc1Z4Q0VwTE5ySnVBejdZMm14WHhaSkZjRUR6YS9OZ1dPc1dpOVcw?=
 =?utf-8?B?OXJ3c0U0R2ZKTjA3clpmZlpkZzdCeUc5cU9kVXQrckZzTnY4QkM5UVRKdUVn?=
 =?utf-8?B?SFR2aE9QZHVEaWtkZExMNGRkL0thRnZweE8zWncyYmkrT2oyRk5qYmJmYTZU?=
 =?utf-8?B?eXk5NVF5c29PUjJMK0c3T01FM2dEZ2Irbm9LSlhHN21xVTNqY0RSRS9CeG5k?=
 =?utf-8?Q?Pxm6jT1ld5kgC1V6OTnwlbAXm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42de9fc2-42d7-41d0-1fe7-08dca57cca6a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 09:50:57.4311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4N93kcQWhn7athIs8QYXRs36/x6T+8QpjgBd+FHTD2Lm6B0nUOXiOa+MGfBzURBPdrMecxTpzRZZWUdA/QK0Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5907
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

Hi Matthew,

On 7/10/2024 6:20 PM, Matthew Auld wrote:
> On 10/07/2024 07:03, Paneer Selvam, Arunpravin wrote:
>> Thanks Alex.
>>
>> Hi Matthew,
>> Any comments?
>
> Do we not pass the required address alignment when allocating the 
> pages in the first place?
If address alignment is really useful, we can add that in the 
drm_buddy_alloc_blocks() function.

Thanks,
Arun.
>
>>
>> Thanks,
>> Arun.
>>
>> On 7/9/2024 1:42 AM, Alex Deucher wrote:
>>> On Thu, Jul 4, 2024 at 4:40 AM Arunpravin Paneer Selvam
>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>> - Add a new start parameter in trim function to specify exact
>>>>    address from where to start the trimming. This would help us
>>>>    in situations like if drivers would like to do address alignment
>>>>    for specific requirements.
>>>>
>>>> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>>>    flag to disable the allocator trimming part. This patch enables
>>>>    the drivers control trimming and they can do it themselves
>>>>    based on the application requirements.
>>>>
>>>> v1:(Matthew)
>>>>    - check new_start alignment with min chunk_size
>>>>    - use range_overflows()
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Series is:
>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>
>>> I'd like to take this series through the amdgpu tree if there are no
>>> objections as it's required for display buffers on some chips and I'd
>>> like to make sure it lands in 6.11.
>>>
>>> Thanks,
>>>
>>> Alex
>>>
>>>> ---
>>>>   drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
>>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>>>   include/drm/drm_buddy.h              |  2 ++
>>>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index 94f8c34fc293..8cebe1fa4e9d 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct 
>>>> drm_buddy *mm,
>>>>    * drm_buddy_block_trim - free unused pages
>>>>    *
>>>>    * @mm: DRM buddy manager
>>>> + * @start: start address to begin the trimming.
>>>>    * @new_size: original size requested
>>>>    * @blocks: Input and output list of allocated blocks.
>>>>    * MUST contain single block as input to be trimmed.
>>>> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct 
>>>> drm_buddy *mm,
>>>>    * 0 on success, error code on failure.
>>>>    */
>>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>>> +                        u64 *start,
>>>>                           u64 new_size,
>>>>                           struct list_head *blocks)
>>>>   {
>>>>          struct drm_buddy_block *parent;
>>>>          struct drm_buddy_block *block;
>>>> +       u64 block_start, block_end;
>>>>          LIST_HEAD(dfs);
>>>>          u64 new_start;
>>>>          int err;
>>>> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>                                   struct drm_buddy_block,
>>>>                                   link);
>>>>
>>>> +       block_start = drm_buddy_block_offset(block);
>>>> +       block_end = block_start + drm_buddy_block_size(mm, block);
>>>> +
>>>>          if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>>>                  return -EINVAL;
>>>>
>>>> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>          if (new_size == drm_buddy_block_size(mm, block))
>>>>                  return 0;
>>>>
>>>> +       new_start = block_start;
>>>> +       if (start) {
>>>> +               new_start = *start;
>>>> +
>>>> +               if (new_start < block_start)
>>>> +                       return -EINVAL;
>>>> +
>>>> +               if (!IS_ALIGNED(new_start, mm->chunk_size))
>>>> +                       return -EINVAL;
>>>> +
>>>> +               if (range_overflows(new_start, new_size, block_end))
>>>> +                       return -EINVAL;
>>>> +       }
>>>> +
>>>>          list_del(&block->link);
>>>>          mark_free(mm, block);
>>>>          mm->avail += drm_buddy_block_size(mm, block);
>>>> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>          parent = block->parent;
>>>>          block->parent = NULL;
>>>>
>>>> -       new_start = drm_buddy_block_offset(block);
>>>>          list_add(&block->tmp_link, &dfs);
>>>>          err =  __alloc_range(mm, &dfs, new_start, new_size, 
>>>> blocks, NULL);
>>>>          if (err) {
>>>> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>          } while (1);
>>>>
>>>>          /* Trim the allocated block to the required size */
>>>> -       if (original_size != size) {
>>>> +       if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>>>> +           original_size != size) {
>>>>                  struct list_head *trim_list;
>>>>                  LIST_HEAD(temp);
>>>>                  u64 trim_size;
>>>> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>                  }
>>>>
>>>>                  drm_buddy_block_trim(mm,
>>>> +                                    NULL,
>>>>                                       trim_size,
>>>>                                       trim_list);
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> index fe3779fdba2c..423b261ea743 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>>> ttm_resource_manager *man,
>>>>          } while (remaining_size);
>>>>
>>>>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>> -               if (!drm_buddy_block_trim(mm, vres->base.size, 
>>>> &vres->blocks))
>>>> +               if (!drm_buddy_block_trim(mm, NULL, 
>>>> vres->base.size, &vres->blocks))
>>>>                          size = vres->base.size;
>>>>          }
>>>>
>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>> index 82570f77e817..0c2f735f0265 100644
>>>> --- a/include/drm/drm_buddy.h
>>>> +++ b/include/drm/drm_buddy.h
>>>> @@ -27,6 +27,7 @@
>>>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION BIT(2)
>>>>   #define DRM_BUDDY_CLEAR_ALLOCATION             BIT(3)
>>>>   #define DRM_BUDDY_CLEARED                      BIT(4)
>>>> +#define DRM_BUDDY_TRIM_DISABLE                 BIT(5)
>>>>
>>>>   struct drm_buddy_block {
>>>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>                             unsigned long flags);
>>>>
>>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>>> +                        u64 *start,
>>>>                           u64 new_size,
>>>>                           struct list_head *blocks);
>>>>
>>>> -- 
>>>> 2.25.1
>>>>
>>

