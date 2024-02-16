Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D1858285
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C6E10EC1D;
	Fri, 16 Feb 2024 16:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RCY6fnZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F1410EC16;
 Fri, 16 Feb 2024 16:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOtGL9fZI53CEI8cb3cocJNnUpXLsfzAj3kd/s8QkEM2kxdF4rImF8BKPNDJEL/F+22JAPOTunchgNpbL2VkvfYyQ4VXPK6fQ3nm+sslYq7yumyl54BLuzE7bD9RjMPqEy+QofVxBbw5LtJygkIohJtOOsmDgxCIAU6iMxCgr068zXPYsE+OeI2OrhiaF3E3XKe5zDVqEi1e1A/ExDlVt4SzfdBfIzrUFTpauCLYgjL2eqP7SsZyUI1K28fMBFC1e1xCzBRoQuyndFGvANkyJ5ZgyhsA0VloJst+qsd3GrjlO4WBadvEgmELPzbzxmcTV/0Qeor1IsQ0r38NY5HUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndVa9xUKIZ6ngLfIfQktOwNd3s4TZhCE9dntNnEz31k=;
 b=nunrd7jOKwS8OzF0a0g2VOoZ2E1Cx2PzqGIWCFu6nhrkSpgOHWx8Ffneds4ujsrbb624B9iEG+USN4OmbxtKfPIPfXtMndRSQ4fPfHY1ypeRcTXGt3oacFjfY3Ryo5GHs2qE01bWIM5fZxhojXX/gEseAAGB8d6tfA20p+aRi5ej8zTMVKfaZlA8aeuqGGuj8ICZDc6ZQIdr2taR0x8e7HDXxoTkTxL3u6O54u+SEwsAwTfz6VR+iCGtuS5I5gxWEMH7zDcKRuvQlnkLno6SBi0p5gQM36kHpiXGvpDF5JatFv0owB/ioLnI2MXnN8Eo3+N9/fWn9vgfZObhzBcvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndVa9xUKIZ6ngLfIfQktOwNd3s4TZhCE9dntNnEz31k=;
 b=RCY6fnZLGMtYgIG70VeO6Shr+Op0k87tKOuAjC5QAIx29eeJfGFYEZdwZsPpN3BRRaODSw8aRz3LIKPG4Ms9QL2So/yWl1vef5j4BzmIdauKlNjMWdIGK1TWvmDdOR9CODUnqF75O7e7NCFcgQjzfQQrdIYF3OROT7bLEyxVofo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8286.namprd12.prod.outlook.com (2603:10b6:208:3f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Fri, 16 Feb
 2024 16:32:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 16:32:14 +0000
Message-ID: <14cd1dee-94b7-48b4-96f4-b3c58512a605@amd.com>
Date: Fri, 16 Feb 2024 10:32:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
 <20240216101936.2e210be2@eldfell>
 <82280a39-4e1d-41ee-82fb-758ceed953e4@amd.com>
 <20240216174242.15d07657@eldfell>
 <a25a6205-c43f-40ab-bb79-8199a8290912@amd.com>
 <d30e50bf-5b8e-47cb-8abf-e474f8490c99@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d30e50bf-5b8e-47cb-8abf-e474f8490c99@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:5:14c::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1b6780-07d7-45cc-2cce-08dc2f0cd4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OaYUT+qtalhjBY3MO4sZ5CQ4gXuZD20P22GnHvckbmCXCCCCFjwKo5aBZ/+osA0PKiZ1A1B9EgviGQMRY02ovoUXBNO1wUrtTNOB1ETiPHibOS8fsvNT4Y18wbLZRhAZZvtZAIbC69tgZjh9PaK6NnZ97gDHCPfWFkNUs7dlH8v+gFk9Mdu1vKFJOlh2a+LtEWqGV39C/5FMDPATtG/gQRGpNq425tDw5U/MH2p7RFGUxdOgQfSgR19WNh0PEg1W5zwd9dH3l4si4GyuhXGitbTAj9gMe5BLqseMshcyM1Yx184v1lyZVWgBhEGCXOvpQ+lI7dWQ0LFYMxbenbJOWyIAgg0FymQ4U0sH+bmQt7ZOYpnjuaTEnOCfRu46H90Pfw++K9e1dzwkIYL6+SJU/4pi94mhw1dCPb1q/2VIWiVQ0Ma3BN011kdf2KFRtmUUCosmoY5BTtYCcInLY7QLFlV/7qfP+zuThjEW0WF5Xyr4SzKv0yQu4qWP9l/6yN36EMhs/wK1CJ5O/KctQHkBndUvF61oFl8s8AnB5VGhYqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6506007)(478600001)(6486002)(66946007)(6512007)(66476007)(966005)(54906003)(8936002)(53546011)(8676002)(41300700001)(6666004)(316002)(4326008)(38100700002)(110136005)(86362001)(31696002)(66556008)(83380400001)(2616005)(26005)(36756003)(5660300002)(31686004)(2906002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWxpR1U0QjNiN3U2Y1h3dEdFVGM2YVR1NU1OYmRGMGpTcEk4cG9haVhBcTU5?=
 =?utf-8?B?QWsrRm9vdi9laTZxKzNWRkN1bnJvMStaaklZTk4vWStkMW5EQ3hERUlDM1Rt?=
 =?utf-8?B?S3hheFY0QUFDM0l4RlNhMHkvRGlpV3RGNXRiY2luSWZsTWRHRldIZXJITnQz?=
 =?utf-8?B?aTAyOGx1RExCc1QwdXlzU2tlZmx0TkhoRy9hZml2TGdDZC9NS1ZLRm03RkJC?=
 =?utf-8?B?MzFXMkd2SlhGWkFvYkI1ZTlOVTZxSVNkOWpVVHlMUHUxbVA5MFVrK01wWG94?=
 =?utf-8?B?ZFBKSDZnbVczNVhlWjJkWERYQXpia1ZtMVBaLzZmR3F0MUkzYkphYjdlNitk?=
 =?utf-8?B?bGVtdzlEenVzWFg2aC9pelpUamNWTnFwL1JZM2FBL0JEZUVUL1pCbmloRmZT?=
 =?utf-8?B?RXRuMjV0YnlpLzlaak1BK1RqcTNiM3NERlZZd2NCN2pjWmNiUkh4U01lZG1V?=
 =?utf-8?B?ZUpvc3RXZUpYNTBQVnJiMGFWMDhQdFQwRGg1VmpPai8wY3hPTXlYakdiajE2?=
 =?utf-8?B?Y3ZoOU8vUWZmeitxQVplZU4vQnlSWGxnUW0rNmRsQ3AvWHo0bk1VTzlzMUVR?=
 =?utf-8?B?cGZWQWlvZFU3em0zenpYZWNjMzZOcXNkMUhVVGhMRktNREFmSEVETWtjajF4?=
 =?utf-8?B?bW9ObDJad1FGcmpsQUI2MkxQOVo5NE4yYTBvdVZWNzZyRVB0bmp0bzhjU0Qz?=
 =?utf-8?B?eTZzYVFkVW5VdExRQllZZEtLRm5VSHUydjE2MFQrN3dFcmRFUklTU1JwSldE?=
 =?utf-8?B?R0tXdlp3QTdlNFNZRXJiMndGTnVKcFNNYmtHMEcwSG12dHMvOTJTS3R6QVZz?=
 =?utf-8?B?QU5vOC9odG1xcjhxTlFTSGtwNURYK1psRXhtc1lKUFVMa2FjZ1hqRzdGUE5x?=
 =?utf-8?B?Rk5wU1g0R1pVd1Bib25valVScWpkVmVCU2tJaUNjSXpPY1VSVlpqRnpFdWdq?=
 =?utf-8?B?NDFzdVg2d3kzdjE3MGtiRGJIaFhnMXdkeVphTk5LWWE4NFdCMjQ4MWFMcFNn?=
 =?utf-8?B?QXovanBLUVM4L296dndIMy9QRk9zeXIrS3FLNFIvOHVOUDhNZHlnSmt2aXpC?=
 =?utf-8?B?ejVGcGtZRWJxSFl4MnVGcXNzM0ZsT2xXWElMQmhHaVM1UTZYbzE5eFFjUHJs?=
 =?utf-8?B?N2tRelBqR1hDcUZ4cm5mS3dSOVoxOHBOWGVMYWhmMHg2WU9FMFU2UnRjQklu?=
 =?utf-8?B?bisyZlkwVXkycE4xR0RpY3djV2R1bkx3aTkwcEg1eFRtc3VBU3pnZkFUKzd0?=
 =?utf-8?B?c3diVDRvUU8wUGI0N0lXTVd0T2NSZjVJS3p0NzkxMkw0Ukl2QXE5TlN6TEdP?=
 =?utf-8?B?MERBdlQrVG9kS0pNMlUwNExHWmhBOGNPVWw2UmhsU0thYnpid3dDVXZUY2xC?=
 =?utf-8?B?dUZBYlVIcTZPWGZYd0lvaUdDb0o0Zk1ITjRjeGh3Rm1uK2VuRlM3a1cvTFRF?=
 =?utf-8?B?bXBNdU5na2haR2s1ekV1TjV0K0ZaRWtMdUc0Yk9aTmhURklTNDd0YWdoa2gv?=
 =?utf-8?B?a0pSRGtDVU1VbDdiTUEweDhJbGtGNFllMHN5dHdwdWVYeU9MU0tlQm02YUlv?=
 =?utf-8?B?MzdQTk9mbTEvKzE2aFdCcU5GY2J3RElNbExVek1ydmFwTDIxQm96UHNZT1Za?=
 =?utf-8?B?RWVxYmhEWWpreWpKT2VUNEVQejByRW5Lc09OY0lLT0RqTlU1QldMb2k1aGJT?=
 =?utf-8?B?MytZUmlCOVl5NWxvRHBCdWh3RE96d081dGhSbXorOUhkN2M2ZFdEUWNxSHNS?=
 =?utf-8?B?b042cW81dnk4MXJtUWhCcXZKaGFweFE2cGszRGNuK0hvbUxPeGlCbTlsaGR5?=
 =?utf-8?B?S0p3NW9yZHoxVUc4c2dEMzh4M3ZZU0dLL09oQWI0KzJhSzZDVDZVWXNhamJy?=
 =?utf-8?B?RVVFb2hTVC9EcUhFbTVRdUFJNWlRVzFydWprWUkxQUYrQUxYMjFwWUR6SnNJ?=
 =?utf-8?B?Ync3YjlxK0t5ay9BK2NnZEtFVkpETGxsTlh0bVNONE9HYnRCZkdXTmsvcGp2?=
 =?utf-8?B?cDBOekJVem9xa3hVM0xEYnk3WlRweFpxSjV1ckJIM1pwRGNCUVlUUzhNaDNx?=
 =?utf-8?B?cEM0OTF5VGlBQ25YeHBUYU9rYUMrZXpjYS9OQkJqcHgwemt2dXBSc2luWWhp?=
 =?utf-8?Q?mTrM3ITL6QeqhfD/95CQaD+n1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1b6780-07d7-45cc-2cce-08dc2f0cd4e6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 16:32:13.9428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+2yWKjq6DK8j+8puUrB33QDj+PxBuSNbbxOWIaMk6x6T3IRyl1GRMeSrQKUVDB1LCbKjh7/TeCZQt8kgQGDVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8286
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

On 2/16/2024 10:13, Harry Wentland wrote:
> 
> 
> On 2024-02-16 11:11, Harry Wentland wrote:
>>
>>
>> On 2024-02-16 10:42, Pekka Paalanen wrote:
>>> On Fri, 16 Feb 2024 09:33:47 -0500
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>
>>>> On 2024-02-16 03:19, Pekka Paalanen wrote:
>>>>> On Fri, 2 Feb 2024 10:28:35 -0500
>>>>> Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>>>>    
>>>>>> We want programs besides the compositor to be able to enable or disable
>>>>>> panel power saving features.
>>>>>
>>>>> Could you also explain why, in the commit message, please?
>>>>>
>>>>> It is unexpected for arbitrary programs to be able to override the KMS
>>>>> client, and certainly new ways to do so should not be added without an
>>>>> excellent justification.
>>>>>
>>>>> Maybe debugfs would be more appropriate if the purpose is only testing
>>>>> rather than production environments?
>>>>>    
>>>>>> However, since they are currently only
>>>>>> configurable through DRM properties, that isn't possible. So, to remedy
>>>>>> that issue introduce a new "panel_power_savings" sysfs attribute.
>>>>>
>>>>> When the DRM property was added, what was used as the userspace to
>>>>> prove its workings?
>>>>>    
>>>>
>>>> I don't think there ever was a userspace implementation and doubt any
>>>> exists today. Part of that is on me. In hindsight, the KMS prop should
>>>> have never gone upstream.
>>>>
>>>> I suggest we drop the KMS prop entirely.
>>>
>>> Sounds good. What about the sysfs thing? Should it be a debugfs thing
>>> instead, assuming the below question will be resolved?
>>>
>>
>>
>> It's intended to be used by the power profiles daemon (PPD). I don't think
>> debugfs is the right choice. See
>> https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/commit/41ed5d33a82b0ceb7b6d473551eb2aa62cade6bc
>>
>>>> As for the color accuracy topic, I think it is important that compositors
>>>> can have full control over that if needed, while it's also important
>>>> for HW vendors to optimize for power when absolute color accuracy is not
>>>> needed. An average end-user writing code or working on their slides
>>>> would rather have a longer battery life than a perfectly color-accurate
>>>> display. We should probably think of a solution that can support both
>>>> use-cases.
>>>
>>> I agree. Maybe this pondering should start from "how would it work from
>>> end user perspective"?
>>>
>>> "Automatically" is probably be most desirable answer. Some kind of
>>
>> I agree
>>
>>> desktop settings with options like "save power at the expense of image
>>> quality":
>>> - always
>>> - not if watching movies/gaming
>>> - on battery
>>> - on battery, unless I'm watching movies/gaming
>>> - never
>>>
>>
>> It's interesting that you split out movies/gaming, specifically. AMD's
>> ABM algorithm seems to have considered movies in particular when
>> evaluating the power/fidelity trade-off.
>>
>> I wouldn't think consumer media is very particular about a specific
>> color fidelity (despite what HDR specs try to make you believe). Where
>> color fidelity would matter to me is when I'd want to edit pictures or
>> video.
>>
>> The "abm_level" property that we expose is really just that, a setting
>> for the strength of the power-savings effect, with 0 being off and 4 being
>> maximum strength and power saving, at the expense of fidelity.
>>
>> Mario's work is to let the PPD control it and set the ABM levels based on
>> the selected power profile:
>> 0 - Performance
>> 1 - Balance
>> 3 - Power
>>
>> And I believe we've looked at disabling ABM (setting it to 0) automatically
>> if we know we're on AC power.
>>
>>> Or maybe there already is something like that, and it only needs to be
>>> plumbed through?
>>>
>>> Which would point towards KMS clients needing to control it, which
>>> means a generic KMS prop rather than vendor specific?
>>>
>>> Or should the desktop compositor be talking to some daemon instead of
>>> KMS for this? Maybe they already are?
>>>
>>
>> I think the intention is for the PPD to be that daemon. Mario can elaborate.
>>
> 
> Some more details and screenshots on how the PPD is expected to work and look:
> https://linuxconfig.org/how-to-manage-power-profiles-over-d-bus-with-power-profiles-daemon-on-linux

Right, thanks!

The most important point is that the user indicates intent from the GUI.
The daemon orchestrates the various knobs to get that intent.

It's intentionally very coarse - 3 power states.  The policy of what to 
do for those states is managed by the daemon.

In the case of ABM it will only apply the policy if the daemon detects 
the system is on battery.

