Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4B858023
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A19810EAB9;
	Fri, 16 Feb 2024 15:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R1PTm20e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFE610E1B6;
 Fri, 16 Feb 2024 15:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKUnINeaU6b8DBoNbIwP3D+bvvF038zLHMjr+x7/bV2jXiZzsZXBCxdikxWz5FLiojyKlTHqOyJKffLcDKqFXzPRtoIz4oELnINs0pp5tC1+ItvUln26kUOkBlWBGiU5mBi5Yi85oImd5s9rVmWPXL66s4E56gWv+waYDT8A2yirJ7ekQMHzkNHoIDGHLF/gisSOIFLKtvzpmOpSa2NYKQu7xBtcrrZ7/yetwKUDJeNO/LDGqeXoW2B40JLGUSoKPseSRC2JYkz+nYPM42t+NLYZKBJV4OT8tOAgA6uYtvIon8ir79GNuU0ZpkHLGapFGG9CW2HD1E36nBh1fS+lYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/FxKDlAeJxaRWRoZ8WfuFkvWpytRMt0UsFjxW85tgU=;
 b=FkgcVKXE4h4zT7D7MrLHtTB9tGx1YIMICAuSpiCvAjLaW20Qtkp7QzlhWhjheiJZFZrFsjix8WYbh3PGXyCVmgo7lIef6q4HvM5vwRTiHuxBiUCBaDwCVwmm/jixlGRWyzjevvsdMW+QPHYNbJLAL+2AqSWQLXorPAY00EgR4UgGbELUR08elmQ9yO5U2VNy1n33XpQbSe1M31i/x0fUagmw2I3g8SzmsOkojP4WjkEdXjpVL25FiRDZayW4EZzs8bt+rMAN9F6lglNJlHlSv0Qva1CAvuPQXmFYs9ZAbeh7e6Sq432KsSYbDBhErczCWv5dl08drMdpxE3iwxq9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/FxKDlAeJxaRWRoZ8WfuFkvWpytRMt0UsFjxW85tgU=;
 b=R1PTm20eXvXGxADuLwWj21Z5eQJsUNW92KShDcCBt2O+SXKwfVAkZYXT99neS0NurAYpLCAenvGOqOOBBkC7ze4zIKWnC71l8gozEku17Q6k/GI2LUL0Nconhw70FdSMlhQCUERKhPZ7DTkwKsJ4usJvKmP9d3DMp+pCQPIyBX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH0PR12MB5250.namprd12.prod.outlook.com (2603:10b6:610:d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 15:06:02 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 15:06:01 +0000
Message-ID: <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
Date: Fri, 16 Feb 2024 10:05:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
 Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
 <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
 <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH0PR12MB5250:EE_
X-MS-Office365-Filtering-Correlation-Id: 3153f203-2039-47c8-99e1-08dc2f00c9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B1VqLk1S88R0zfxQmuP9eeLZMfKD/Hgst2jVBdp4c4Wf0iiEG783Ztdx9FMgcK0jSoDOIJLb6gbER5jletcQcomFF5+8vjrBdY/18GKgMpOfzRIIBVbENgJfSvIJ4Pfc3TeDGW5W5Um9UhGk/WLTRCDaFVWEE4AJT8hiPORit1RCEad8M0tK0PQz8bZ0gKtQ4HbwMxqeL+TGJmv/QXGLeCzblq4ppqvh6DycEBeQr8o+vyGVb95o7HEUd1s1LNMm5Ruc68z4w1OUoLi2HjHo+63qNtTExYTxEgmgp32RysCscM6RO9yUjhiEgtpBBTQS0l4iZwPFfG64qd0AsNDimWTUCjhfPebRmiRATKmxCyntbnSyO7OPRVzEWMPw145agAzAiK/XXtBtZ2oGZtscMiU9HwIOcSikYKceR8KKqeNX7/BuRjQYAGk7jQYVhXTPwtFoL5Kd0OSMKmIQr9uoJqzikoVxyiMZsTp5+tQfc8i14+XAOQMGUu8Bvt1kyqjp8pupKqf0BF1eEVz/a/ynnrlbss9rm2NJwZwnDulG/g2JG2WS4R771IkZrDsmEK9E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2616005)(8676002)(8936002)(4326008)(5660300002)(66946007)(66556008)(66476007)(110136005)(2906002)(44832011)(66574015)(83380400001)(26005)(36756003)(31696002)(86362001)(38100700002)(54906003)(316002)(6666004)(41300700001)(478600001)(6486002)(6512007)(6506007)(53546011)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVBPZThXTWZET2F5ZVBaYVVSVlNXOGw0MUkzaExEWVRwSlBFdWw1UlJWNElj?=
 =?utf-8?B?V2dHeFE0cjBlWk53UEZVYVIwcUw1eG5wb3hDVmFDUlAyWTRYZHdHNTVnNkJh?=
 =?utf-8?B?T2dKR3JCLy9zZU1HL2ZnTDlMREpPT0pRKzhYVk1HUnNZNXp1RzlCNmhVUXQ2?=
 =?utf-8?B?ZkJ0QkdSc0FQUkVSemVacGxHR3Z5ZVpXZnprcDBjYXE0a0xlT0VJWjF6aVNL?=
 =?utf-8?B?QW9UNDFHT2Z3bEg1UGZabXdOYUJ5QS9YZ2pKMW9VYjhpUGNuVXdxd1VENDJH?=
 =?utf-8?B?aXJ4V0FCNDZMRnFFS24vYjU5TWs0c1FYQjBWNHFHMlBJbktZMVIyZHN3R0hG?=
 =?utf-8?B?eEtMVXBSdTZCNGhkTE5jUWlVNGVyVVpTdWhoY001R0wvVEZVb0xhSy9RNm55?=
 =?utf-8?B?ZVdTY09MS3JQckJDeWJqY3ZNQVBhMHAzOVhHZkxNZnl5SHFVUEpuZ1c4UG03?=
 =?utf-8?B?b0xTYzhINFVXcmpFczM0aGI2TjlmMUNoTENndlJseGpMcDNEdE0zMkdlWlht?=
 =?utf-8?B?ZlM5djlnS0Qrd01PZHFUVUtneThiUE00YXA0NUJMQit0Yk5ZQjF2NlZzc2k5?=
 =?utf-8?B?aDFZVStzYkFvN3VXQjJPcGpjU2tJSFJXZy85dVEyU2tBUVJLc2VvM3NrRzcx?=
 =?utf-8?B?ZmpOdFlFcC8xSnh4VjFxb25tM2liYnB4WStHblZnakFkTlVuOTREbGdzWm9V?=
 =?utf-8?B?OFhMUXJSd0VsVEZTYlBZUHdyNzcrK3FEYll3VTFEa2IyeEFEUklvZGRjNG1L?=
 =?utf-8?B?Slp6OW9MNjJCSkZmZStKQy9WODRpdEd5eXJUd0hUNFQzZ2xjc043YjBENE91?=
 =?utf-8?B?aWZtT09YN3dUeXJSNnEwOWNQRG12Sk4yRkppVXlaN1hQSGpLa3YvNmFjbnVz?=
 =?utf-8?B?NFh4aDBMVkV1cDlKdXdWN2dBZmJEaW1uVmlLS3M0VlB5UGxhcVo0ZnRxdnJw?=
 =?utf-8?B?U21GSjU2eklwUm9ta21SM0NxSklvY1RCaXNWV1RrSCtsMEs2TjZtNVppd0RQ?=
 =?utf-8?B?SXRld0hIcFV3Vy95dVJwdU5kWE1xVU53UTdyY0lia05DcUg1cnphOXJLUXhj?=
 =?utf-8?B?cG5BeVZsWHZiMEw3OXJtSVZaWG5Fb2sxVitOeGVGRDNpQWFOMW83YkdpN3BF?=
 =?utf-8?B?RUFNS0pyaVZLU2JHb1lCLzN5d2dKVWs5L3pRNFNoaXhRZGZQTmJNQUZiOHdM?=
 =?utf-8?B?TVRDRGRpSDlOZS9NKy80Z0FMbW9XdFhPeEg1anRneEhmUW1RVWxNQUlXRlp6?=
 =?utf-8?B?RWJsNXRhdnl5aGllZTNwQnpkNFNhTEdMSVhxWmRTbHhjelBKY0lteVpoTlRL?=
 =?utf-8?B?V1kxUFRBZCtvZGJVV0ZqYjdISzBRWWJtMmZudEpadnU0dXdKUjJDclFkOVpE?=
 =?utf-8?B?dDk1NXBaSTJHc0VKeUdlR3ZDK1VJYlFqMWdVa1lXN0RlT2xLQnI4ellZWStu?=
 =?utf-8?B?UGs1d082NzBTTk1Bd2Q5RzNPVEhUb0svWUFTeG5nYlRMd1QzVHE5S2lHWFVL?=
 =?utf-8?B?ZEhNZlVPZWIvVG02dldpQ0dCR1lGVWx2TU5lL0ZEZmdtYktIUWU1NmJjdFBF?=
 =?utf-8?B?VlFkUnJqTG1jVmFNWUNOQnZiZWIzODAzZXdweE95dDF5N2hjcHlFZTdFQVZS?=
 =?utf-8?B?SWc2THpUeHZPdnNmV0lDbTZLM3dSaFpVZlo5RmYvVG1PazQ2ajNjL2FUTzAw?=
 =?utf-8?B?YjFzWTFmcDRLbGpwRDg4Q3VOOWVreGxYSko5enF0MERFdEcxMVo1NGlRaVhZ?=
 =?utf-8?B?bm9GZHR0dlVrUHB0bTRLZG5qYUkwOWNqbGF5aFRQc0I0RThWMjU2dTF2VTFZ?=
 =?utf-8?B?aStyenNNV20yYjZHd0xwbEVPSWJNWG45T0N4TElySEh1REhkMmVTZUcxaVEy?=
 =?utf-8?B?YWZWNHY3RUFoVUVyTDRpeHliU2NwZTdQRXprRVBwMDJ1cWxVTU1CeVZiaUlz?=
 =?utf-8?B?d0FCTWxWQmNHM0k5YldFNTQwckpnYjZOMWtubjR0RFhNMWU3d205MVcwSFdS?=
 =?utf-8?B?bDZoVnFYa0x0MDd3ZjZZc25Kdit6eDdHVmoydnhkWXAzbUtRVkxNRUVyUXBC?=
 =?utf-8?B?RUpPWHpKVTBkN0xrdUJ5bldwTkg2YXhBUkt4U29pY2RwR1doZCswVVZ0eU04?=
 =?utf-8?Q?nyzyiiiOfSijyqXNUkjVixZ8J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3153f203-2039-47c8-99e1-08dc2f00c9f5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:06:01.6064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iU2Bimbx4MWm04e3MDZ68VKdHE0CERNnQM9oBw6D8/dc0wEQnM6dk65BZzTl1a46doC0Yprux4RljhCCJIC/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5250
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



On 2024-02-16 09:47, Christian König wrote:
> Am 16.02.24 um 15:42 schrieb Mario Limonciello:
>> On 2/16/2024 08:38, Christian König wrote:
>>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
>>>> By exporting ABM to sysfs it's possible that DRM master and software
>>>> controlling the sysfs file fight over the value programmed for ABM.
>>>>
>>>> Adjust the module parameter behavior to control who control ABM:
>>>> -2: DRM
>>>> -1: sysfs (IE via software like power-profiles-daemon)
>>>
>>> Well that sounds extremely awkward. Why should a power-profiles-deamon has control over the panel power saving features?
>>>
>>> I mean we are talking about things like reducing backlight level when the is inactivity, don't we?
>>
>> We're talking about activating the ABM algorithm when the system is in power saving mode; not from inactivity.  This allows the user to squeeze out some extra power "just" in that situation.
>>
>> But given the comments on the other patch, I tend to agree with Harry's proposal instead that we just drop the DRM property entirely as there are no consumers of it.
> 
> Yeah, but even then the design to let this be controlled by an userspace deamon is questionable. Stuff like that is handled inside the kernel and not exposed to userspace usually.
> 

I think we'll need a bit in our kernel docs describing ABM. Assumptions around what it is and does seem to lead to confusion.

The thing is that ABM has a visual impact that not all users like. It would make sense for users to be able to change the ABM level as desired, and/or configure their power profiles to select a certain ABM level.

ABM will reduce the backlight and compensate by adjusting brightness and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3 and 4 can be quite impactful, both to power and visual fidelity.

Harry

> Regards,
> Christian.
> 
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> 0-4: User via command line
>>>>
>>>> Also introduce a Kconfig option that allows distributions to choose
>>>> the default policy that is appropriate for them.
>>>>
>>>> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings sysfs entry to eDP connectors")
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
>>>> Cc: Harry Wentland <Harry.Wentland@amd.com>
>>>> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
>>>>   drivers/gpu/drm/amd/amdgpu/Kconfig            | 72 +++++++++++++++++++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
>>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
>>>>   3 files changed, 90 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>> index 22d88f8ef527..2ab57ccf6f21 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>>>> @@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
>>>>         Add -Werror to the build flags for amdgpu.ko.
>>>>         Only enable this if you are warning code for amdgpu.ko.
>>>> +choice
>>>> +    prompt "Amdgpu panel power Savings"
>>>> +    default AMDGPU_SYSFS_ABM
>>>> +    help
>>>> +        Control the default behavior for adaptive panel power savings.
>>>> +
>>>> +        Panel power savings features will sacrifice color accuracy
>>>> +        in exchange for power savings.
>>>> +
>>>> +        This can be configured for:
>>>> +        - dynamic control by the DRM master
>>>> +        - dynamic control by sysfs nodes
>>>> +        - statically by the user at kernel compile time
>>>> +
>>>> +        This value can also be overridden by the amdgpu.abmlevel
>>>> +        module parameter.
>>>> +
>>>> +config AMDGPU_DRM_ABM
>>>> +    bool "DRM Master control"
>>>> +    help
>>>> +        Export a property called 'abm_level' that can be
>>>> +        manipulated by the DRM master for supported hardware.
>>>> +
>>>> +config AMDGPU_SYSFS_ABM
>>>> +    bool "sysfs control"
>>>> +    help
>>>> +        Export a sysfs file 'panel_power_savings' that can be
>>>> +        manipulated by userspace for supported hardware.
>>>> +
>>>> +config AMDGPU_HARDCODE_ABM0
>>>> +    bool "No Panel power savings"
>>>> +    help
>>>> +        Disable panel power savings.
>>>> +        It can only overridden by the kernel command line.
>>>> +
>>>> +config AMDGPU_HARDCODE_ABM1
>>>> +    bool "25% Panel power savings"
>>>> +    help
>>>> +        Set the ABM panel power savings algorithm to 25%.
>>>> +        It can only overridden by the kernel command line.
>>>> +
>>>> +config AMDGPU_HARDCODE_ABM2
>>>> +    bool "50% Panel power savings"
>>>> +    help
>>>> +        Set the ABM panel power savings algorithm to 50%.
>>>> +        It can only overridden by the kernel command line.
>>>> +
>>>> +config AMDGPU_HARDCODE_ABM3
>>>> +    bool "75% Panel power savings"
>>>> +    help
>>>> +        Set the ABM panel power savings algorithm to 75%.
>>>> +        It can only overridden by the kernel command line.
>>>> +
>>>> +config AMDGPU_HARDCODE_ABM4
>>>> +    bool "100% Panel power savings"
>>>> +    help
>>>> +        Set the ABM panel power savings algorithm to 100%.
>>>> +        It can only overridden by the kernel command line.
>>>> +endchoice
>>>> +
>>>> +config AMDGPU_ABM_POLICY
>>>> +    int
>>>> +    default -2 if AMDGPU_DRM_ABM
>>>> +    default -1 if AMDGPU_SYSFS_ABM
>>>> +    default 0 if AMDGPU_HARDCODE_ABM0
>>>> +    default 1 if AMDGPU_HARDCODE_ABM1
>>>> +    default 2 if AMDGPU_HARDCODE_ABM2
>>>> +    default 3 if AMDGPU_HARDCODE_ABM3
>>>> +    default 4 if AMDGPU_HARDCODE_ABM4
>>>> +    default -1
>>>> +
>>>> +
>>>>   source "drivers/gpu/drm/amd/acp/Kconfig"
>>>>   source "drivers/gpu/drm/amd/display/Kconfig"
>>>>   source "drivers/gpu/drm/amd/amdkfd/Kconfig"
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> index af7fae7907d7..00d6c8b58716 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>> @@ -844,17 +844,24 @@ module_param_named(visualconfirm, amdgpu_dc_visual_confirm, uint, 0444);
>>>>    * DOC: abmlevel (uint)
>>>>    * Override the default ABM (Adaptive Backlight Management) level used for DC
>>>>    * enabled hardware. Requires DMCU to be supported and loaded.
>>>> - * Valid levels are 0-4. A value of 0 indicates that ABM should be disabled by
>>>> - * default. Values 1-4 control the maximum allowable brightness reduction via
>>>> - * the ABM algorithm, with 1 being the least reduction and 4 being the most
>>>> - * reduction.
>>>> + * Valid levels are -2 through 4.
>>>>    *
>>>> - * Defaults to -1, or disabled. Userspace can only override this level after
>>>> - * boot if it's set to auto.
>>>> + *  -2: indicates that ABM should be controlled by DRM property 'abm_level.
>>>> + *  -1: indicates that ABM should be controlled by the sysfs file
>>>> + *      'panel_power_savings'.
>>>> + *   0: indicates that ABM should be disabled.
>>>> + * 1-4: control the maximum allowable brightness reduction via
>>>> + *      the ABM algorithm, with 1 being the least reduction and 4 being the most
>>>> + *      reduction.
>>>> + *
>>>> + * Both the DRM property 'abm_level' and the sysfs file 'panel_power_savings'
>>>> + * will only be available on supported hardware configurations.
>>>> + *
>>>> + * The default value is configured by kernel configuration option AMDGPU_ABM_POLICY
>>>>    */
>>>> -int amdgpu_dm_abm_level = -1;
>>>> +int amdgpu_dm_abm_level = CONFIG_AMDGPU_ABM_POLICY;
>>>>   MODULE_PARM_DESC(abmlevel,
>>>> -         "ABM level (0 = off, 1-4 = backlight reduction level, -1 auto (default))");
>>>> +         "ABM level (0 = off, 1-4 = backlight reduction level, -1 = sysfs control, -2 = drm control");
>>>>   module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
>>>>   int amdgpu_backlight = -1;
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index b9ac3d2f8029..147fe744f82e 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -6515,7 +6515,7 @@ static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
>>>>       struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
>>>>       if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>> -        amdgpu_dm_abm_level < 0)
>>>> +        amdgpu_dm_abm_level == -1)
>>>>           sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
>>>> drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
>>>> @@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>>>>       int r;
>>>>       if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>> -        amdgpu_dm_abm_level < 0) {
>>>> +        amdgpu_dm_abm_level == -1) {
>>>>           r = sysfs_create_group(&connector->kdev->kobj,
>>>>                          &amdgpu_group);
>>>>           if (r)
>>>> @@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>>>>       if (connector_type == DRM_MODE_CONNECTOR_eDP &&
>>>>           (dc_is_dmcu_initialized(adev->dm.dc) ||
>>>> -         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
>>>> +         adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level == -2) {
>>>> drm_object_attach_property(&aconnector->base.base,
>>>>                   adev->mode_info.abm_level_property, 0);
>>>>       }
>>>
>>
> 

