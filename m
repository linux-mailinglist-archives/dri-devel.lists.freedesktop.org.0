Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED4AD8565
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93AC10E905;
	Fri, 13 Jun 2025 08:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nTLSZest";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250AE10E905;
 Fri, 13 Jun 2025 08:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD5SUPJjb9wpF3scMStURMgns7h83m2CBYgUwWv24+LRUSvYoQxYqrp2gHjGu6xjfVpat5Zt1Q6dczwOFgsj+jp3TbPtvqUlSQBOPRlXk5XujElfHjdJaUwZx16wmlGvjyGRQequkIAj/pLHo3Si2lkZkX+YV+twHzqBi6qRXjQB4Z/R3d3xWMMUeuLkytg2BHqOQ8Yfr+eLDQfcHJ4R5axNTKGlWSH7SR94m2SrDlWBqyPVUHv/HHoRkPk/PYKaBE009nNA5iPULKcJElyI7bHCC+DxTp3kOlo3xthDtCXlLkyudvygxrztlS9mMqJe3mgy5Qm+VYzRO5YSg7c6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LV9sjyvCiiOA7fieMkdHcGJhE4lyFU8Ie4jP1yAcdCA=;
 b=IDDijNaHDP4uI5zA/7MqwFhtjiuIVhXL466Jx2a0uZSjk1rqWA8WPId5jjQFjUfLvV+E3rya5kiq1N6GLCuddwrDuxxI7i5TmXBFqsdibVrmlAAdFrfPdUJjtKjxpNtyXNHEYwuDaPQQosQccVk/A29ANq8QYmkzPDGjitbrHWRqOMfN6V037c5dSq74XO/xq4MifLheSAGpWfBIYVyeWP7vibGUJ7n9NRAZAh0eAr2PDuFLn6Zr7XxfswRy7soKrifwD/XraVXJQ3jNQ7pfofpKEfR9TbzSrPE6T5JcpJbF/plpBaTd3Uc+a/3q8kN8tCXu1xoz8E3OZ1WoqUlLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LV9sjyvCiiOA7fieMkdHcGJhE4lyFU8Ie4jP1yAcdCA=;
 b=nTLSZestGz22J7qAWQHc25ZqXs9nxhIXnwoOL1niu6Rq426eiGtg/fP/dAWL2FO4qfDuEa6FyhijqdCepAL5Mf+kkwpwj33x99wcZTMCplZrC8Yh0Ac9P1PcSrHckOYWl4nEBOwG81cpac6YczaH6L3yheMcI12fRA7lPxhNI+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9453.namprd12.prod.outlook.com (2603:10b6:610:1c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 08:23:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 13 Jun 2025
 08:23:21 +0000
Message-ID: <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com>
Date: Fri, 13 Jun 2025 10:23:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
To: Danilo Krummrich <dakr@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com> <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com> <aEtnS6kvh1mssFTb@cassiopeiae>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aEtnS6kvh1mssFTb@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR18CA0023.namprd18.prod.outlook.com
 (2603:10b6:208:23c::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b55ae2f-1038-4583-96d9-08ddaa538eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0VoZDRxVXNrdis4Ny9iWjA2bXFDRGw3QWw5d2crTXdpWWNwcGtuckpaaVRj?=
 =?utf-8?B?Wm9JMmdBYytRRmlWK01SY0ZUalBuRXQyRFhrSlRhdFhnd3gvSkp2SituS3Jh?=
 =?utf-8?B?NFRCZm9XaEV5TlY5RS93YWd4c2pCWktjNzNEdHFTQ2RBWC9SakIzZWl5NUg0?=
 =?utf-8?B?Vk9PaTV3eExvTWZncGt2U3JXclVtVEJDV0FZQlBnek5abnBEd1NrWUZnTExN?=
 =?utf-8?B?VjVxNkpjZEJpQnREY0xUN1NYeCtXTHNHdy9GV3RuTHFCYUhicHpiai81aXZC?=
 =?utf-8?B?QjZJdlhxdWdSZ0NreEV6WFQ5TjA4QnRxb3h3d0dRbUNwUlZxV3lROG9Qb0VI?=
 =?utf-8?B?UUk2N083dVgrdXZqZ0tNMU9rME42OTdPZXJkMVlxb09PcitwVjhkYkRvMkhW?=
 =?utf-8?B?K0NVZWFCbllDdU1TSDlFd1pZaFZUMDNEOUFwMXplRUtuZDNoKzJKT3phaTEx?=
 =?utf-8?B?ZFFXWm5iYjVTOTE5ajRrYUg0OVp5VEw4Vk13Tk9wNUxvelRaaWZYZEE5aVZC?=
 =?utf-8?B?NWVCVko5NDF3S3hXY3pBNklmMzFCeEhhSnphK3R4TjBaSFlKTWIxQUdTQnZI?=
 =?utf-8?B?UWRycjlvazlkL1h4VHo1WVZiekIyRVErT3JrUVVFT2tWbE51WEFHVEJPY3V0?=
 =?utf-8?B?RkY0dnNKOHppcDdJZ000dFNPbVZBWmpBWEkweGs5K0hSeHNjaVllUzhZdWdD?=
 =?utf-8?B?d0ZnVVp4R3RBTzZqdFpTWHNtMW1lRWgvRldPWlNwc0xUaWhwUW5aVzQ0UmZ5?=
 =?utf-8?B?d0lkZUZ2aGpOZS91NlRkbkkyaU5DNTVFL3FNU2REUVlVaUFYc1lXQy9Bcll2?=
 =?utf-8?B?ZzM4SHdjbjRaVUlRaG0zVnY5bld3aWdWd3hXSzBOa3czVTRkWjVBUU0xQ0JT?=
 =?utf-8?B?UUlNV0o0MktxdmlsQmlIWDhnQmxLOVEya1N4a05MVXFRMnFpbjNxQ0lUV2Y1?=
 =?utf-8?B?bHU2VHREWWlJRnBMVXdOdXdMTFNpSnhSbXBESlA1dzBuYlhXZTRMbzcvbGd6?=
 =?utf-8?B?Q0RSUitqaXphTUVRNys3VjFsbTdMMFhtUWZ0MjJRSGJ6K2x2ZWhKeldHTnNm?=
 =?utf-8?B?VmdsSzVhNk1MT2JFdkt2L1RlTzJSb3F1TUNrdm15Q2huNDA5LzloaUUrTVpt?=
 =?utf-8?B?S2pZOVNwa09EQjN3Z09oY1Z0cURkMGhCcDZwbjVudWl6SkVGMkt2d3kvbit3?=
 =?utf-8?B?MFZSTVpKOXZWOWQrV2tkaGgvTkxzcEtNd2VDUE9yQm0wUnc3SXVIcHRMcnFH?=
 =?utf-8?B?MUQxTTlqaHVnNUljU0ZieVVseWk1UDZWUWFhOVBobE1ZY2FBNHhrdVNlT0Yr?=
 =?utf-8?B?Z0VGUzk0Q20xZ1VWa3VUZEkxdGU2UGxyRnloQ1JGVjhXS1M5SVBIUDJrQnFR?=
 =?utf-8?B?VUVsOHViL1p2WU1pMXZISkdMT2M0S1FqdEl0Q2pkbDJxTmhoT2R5QUMzY3lO?=
 =?utf-8?B?RnVEUTRjcUx6bDhXZmVMdDJRL3JLcHdLK1FTb05DaFBFa00yaHZzaWh2bndI?=
 =?utf-8?B?dE9rMjJndk9aL0lTQzlDYUtUcElBZTlSSzRJdTQxYzJEbnJSTjRrazZnWWth?=
 =?utf-8?B?Vm5kWEdiUno5UWpTMGFJUktaUlozY28rYU92dForRXBtOU9uaUV0QlZ6YWRX?=
 =?utf-8?B?bXZUUHFPNmQxbGM2OG5zekVRMGZJdXZJUUV6RXR0MnluMFhjUzBhMTR4emtL?=
 =?utf-8?B?NXFzcmhPYldUcHVCVC9yZ0NaMU9JMElVOWdPVGtMK01iM2szUEl0UStWb1dy?=
 =?utf-8?B?YXpBMHlnN0tqajVHdk5kN3hrMXBBdG9qMjBXWWN5Z0xTdnc5T0VIaThSUzg5?=
 =?utf-8?B?eThCUnplNTFzUWMzaE5NOWRpOUdTMmMyV01NMjZ2VXVPdGVpVXFhYjVjL1Qr?=
 =?utf-8?B?Ulo2ZkFNR3F2L1krRm9kbEtLZlgvN0hWcDlNOWY5cTBFSTk1ZWNMWTgzRndZ?=
 =?utf-8?Q?W78yAMSuqzM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9KT3YvTlRwN3lFSUo0REhmbUVXYzI3UmdUR21tdUNBME0rbS9YcFBiNWFR?=
 =?utf-8?B?U2pvQWtMM3dXdVoyZWZ1eHNybHl2N2FXdlJqa21LYWdDVWlaeElUL3E0WDJ3?=
 =?utf-8?B?eTJjTlNHcjVmNDVRZzJ4OHZTakQwaTFBUG9BYWJtb1o0VmJVZFU4SmlBRVN0?=
 =?utf-8?B?NDFHKytWWU40TUx5Z0VzSzF4bUV5V2QxT2FlU1hRSE8xb1JRLzgwby9TSTRM?=
 =?utf-8?B?by9FNy9keFBEcnlSVUx1NDRNRXVjOHFCVDE5RUFWWC82bHZiSER0ZTJra0x0?=
 =?utf-8?B?RlFPZzN6TEpHQ1V4RDlLYlZ5MXoxZHhZbUpHWmJkVjg1ZW9nK2tBSHpDdm4v?=
 =?utf-8?B?eDFWZFFrM2NCcFlaVFMwRVU3bkdOLy82QmY4Nk43R3ZObnNZME9zVGpuUyt6?=
 =?utf-8?B?MjJuOHRrbFBPTlhqSmdaeUpsSFhHWXpFbnUyWXJraTFMbFEvY01GcmRGcnNB?=
 =?utf-8?B?NC9NbmhWQmlzR1dmNWFQNWJSdjk2WDFjazZ6Q3h4MmxXY0xHQmdCSkllVUY1?=
 =?utf-8?B?Vk1xajNuQXVZNFpnaTNTazZybFhLUTdqWWpzUTEyWE1LWHlyQ3p3Szl6Ymww?=
 =?utf-8?B?dkdFSVo1OFFiMFYxOENuejdGZ25MVGIwRGRrOGtQVHBydHdIall4WnBqd2Q4?=
 =?utf-8?B?elBHQVRLNDQwQUpqNlRpcVAzS013Tjg0eWg0aDhnNzJ0T2p1VWJPYzJTM0dh?=
 =?utf-8?B?MTVGc1E0eW9iL01HR1hock1jRndFVG45eHFQRDBVU3pabnBISENlY0phQURo?=
 =?utf-8?B?ZWs2UUQrSThOQjBaY0IzMG1OMWxubnJqTllOSjhXb3F3bTFxd0pYRC96azZ0?=
 =?utf-8?B?djR2YzR2VEVVRkdnZWhBVEt6RFRtTGJwUmNOZDJ3RU9HUk5ud1Q3YzMzS0o0?=
 =?utf-8?B?SjAzOFFWdkt0VGtqTHJranRUM05qdUUwSjVBYmJLanl0dFdiV2FKNHFhbXZv?=
 =?utf-8?B?Yy9WcFlzeTZvTWJMS1YraHNqa2MzQ213NDZzQXp5bGkvZzV4MzlIYnhvVTNa?=
 =?utf-8?B?QmtKM0xVR2dBUjJuWUVqa3BrK0IwMmZLcEF3VHAwa2wvb2dYNzgzc1FlWFBn?=
 =?utf-8?B?VWg2SU1mQnFnNXFuelJmdkdEcTRCODh6Y1FWZ0VrdkZtTE9nb3VjRyswK2ZY?=
 =?utf-8?B?OFNNamFtcUpwbFYwd29aRFVPYUhDWUxOcDZ1MUhFSXUwamRnSkVJQWpLRU5K?=
 =?utf-8?B?YmtBcEM3Zy9NbXlpYmJPZ1Z2RHJxWEhWY3NjcFY0TjdxZlErZ2pYL2NpclBh?=
 =?utf-8?B?Ymt5ak1tMkdOL3VwNm1BdW81Uyt0TFgyQnZERDhWKyt1MHJybHBWZWlnU2Ir?=
 =?utf-8?B?VjJhT1ZsVHkxQWphdWRxam5lSzhPZTJFOWN1VkRNMWI0T2Z0MUwwRTlQbWlF?=
 =?utf-8?B?NCsrdnNwd2FFL0RMaCsxVDRKSVNlWDFJcnJ0cHo3QjFrYXFmQWt5MGRhc0Jj?=
 =?utf-8?B?UFhiM0V5ZHVySWNNbXV4d3B6TWd3VHM5RmhKVkxFRFJLQU1KbjdOcHErN1Jh?=
 =?utf-8?B?OEh6UjgwVlhTSGl0N0dFMVpqTlkvbW1Dc0l1OEJ1RnVTOExnRE9hSHJZTnFR?=
 =?utf-8?B?d1dxaHBESm1hL3llZG9Dbi85d0NpTUpsWWhGZlBYMmxMYzlncjFPQ25JMkhl?=
 =?utf-8?B?SkNmeVNabU5CdHZQR1prNWdkUjVQbHk1TjE3dHVGUGRldTd0dTlwU2pRUkFk?=
 =?utf-8?B?NHFUb29TRC8yMm5CVDY5cElhWnNLbjRjdzB2dVRpUGNxRWd6aWhoTDRVbkRh?=
 =?utf-8?B?STFGS3dRczU5dUtYQ3hyR2RQR1ViN1IybG16QW1aOTM2WXVPSlNNa0tuZ0Nw?=
 =?utf-8?B?YUVNUzUrTlUyODBWVXFKQjNzTFk4Tit3dHVlNGMxUmwzcGg0QnVMNGxqY2FU?=
 =?utf-8?B?YWVNcEpjRUhTZE1KaVpmZml1SzhpTGlQN0E1NmNhbWdtZlF2WC9nZ0wwR1Fz?=
 =?utf-8?B?ODZnc2hDTXVVMjhUdE43ZVIyeU5LeWhqUjVMTGY1bUZ2L1ZwRVhoNHlXU0VY?=
 =?utf-8?B?U2prVzNKREJqQnRJQ210cG1XYXhZVnRYeEpudnYzd1BXdWQrend6VnRWd3pL?=
 =?utf-8?B?K052WGtvUFA4WTJhaENrd0lOVm94Z1piNk9uRTlFTTYzOTZQT2FsRldaVnlF?=
 =?utf-8?Q?kvTCyfua080Z9AGQo52ZlSa0h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b55ae2f-1038-4583-96d9-08ddaa538eb2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 08:23:21.1328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiYpV7TbihDHvmDOFyIyVLFTWSK9cdxt+mTqcej0SXh3x6hewkS6QMm00eMvASEm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9453
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

On 6/13/25 01:48, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 09:00:34AM +0200, Christian König wrote:
>> On 6/11/25 17:11, Danilo Krummrich wrote:
>>>>>> Mhm, reiterating our internal discussion on the mailing list.
>>>>>>
>>>>>> I think it would be nicer if we could use negative values for the kernel submissions and positive for userspace. But as discussed internally we would need to adjust the scheduler trace points for that once more.
>>>>>>
>>>>>> @Philip and @Danilo any opinion on that?
>>>>>
>>>>> Both, the U64_MAX and the positive-negative approach, are a bit hacky. I wonder
>>>>> why we need client_id to be a u64, wouldn't a u32 not be enough?
>>>>
>>>> That can trivially overflow on long running boxes.
>>>
>>> I don't know if "trivially" is the word of choice given that the number is
>>> 4,294,967,295.
>>>
>>> But I did indeed miss that this is a for ever increasing atomic. Why is it an
>>> atomic? Why is it not an IDA?
>>
>> Well IDA has some extra overhead compared to an ever increasing atomic, additional to that it might not be the best choice to re-use numbers for clients in a trace log.
> 
> I think the overhead is not relevant at all, this is called from
> drm_file_alloc(). The only path I can see where this is called is
> drm_client_init(), which isn't high frequent stuff at all, is it?

I don't think so. But we should really use ida_alloc_cyclic to make sure that numbers are not re-used so quickly.

> 
> It seems to me that we should probably use IDA here.
> 
>> On the other hand using smaller numbers is usually nicer for manual inspection.
> 
> Another option is to just add an interface to get a kernel client_id from the
> same atomic / IDA.

That won't give us fixed numbers for in kernel clients.

Regards,
Christian.
