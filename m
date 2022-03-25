Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF044E705C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 10:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17A810E37D;
	Fri, 25 Mar 2022 09:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88B10E190;
 Fri, 25 Mar 2022 09:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmjwsKD5n9KG8pkP5+lwmD43GdfnomP9mYhNVF/sZtgw4lYrr6YIe4KPmbR0pplB9AwjVkoOqEVYOo0HaDOxBSxtJUpdSmEbn6NaUMgdAPJA9j+hFWKX/gLEKwUd3jOOd84ornADReWbAPx23CExKSI6D7QM9gE1NzveNfnPmHPvyQsi/r/MrfUtkcV9PUb3UuROzX0Zprbcf5iaVkFdYU5RaKOXBFo9fhFZiPLjKUH8rFhAR6eIE0gvtjngMG6Chgsff4rugfC8aehxQI2TPl6237MRmqdw0ipwfzqW85AtapQnr3mUhQZg80VVAD/k6t2MXS8CutMqzzbe8CA5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/B3jQF8dNsY90tHebMoi1oT1PauhoZZpuzD9zVyd8c=;
 b=lmGUyHcTJ5KoJP7s5YIEv2QGQFoPX9SmGsB8JH4aWZGl2JLaUZZzwx9+/UiRPvcAJ1BlTLdQq08SW9aBa5OjmFgxpMsLEJgSzrcJ6+3TdYZ9UwFDdpNYWRCliauYRrf4dDn6SWG3L9TSYrF23ziVY7FDbOVqtZ4uwb/26p5XpXDk9B4qmtMZ7/GdNdA4FfGS0sk264xqVPW2ZMmjuw9jETmUWPimMq1CHIXG5K/ubheU8rpaCyGw35DZ3v9b+ks9HE4Xl1INHOVvCVgVWZyhT/fnKr5PZ6tmE6OERAPQO17xz1w6J81iwZz2HpjCqfKfZEg0878v/jTQhIiaqBcnVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/B3jQF8dNsY90tHebMoi1oT1PauhoZZpuzD9zVyd8c=;
 b=y3TMqueyCIQHn1leTxCju98nOMnOPdCpnw9TRz4L2P4mUSr071buaveWElZZW8a2jh7/msjA7uxT+CHF8Pa66sMKsXxT2PSBm93/4b4rvkPIEaTpqxIU9mK8kCX6xGCQPr/LElmgOyia4jntQolMz6aiQvz0+1ujqvfL+Me2JYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB3650.namprd12.prod.outlook.com (2603:10b6:a03:1a3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 25 Mar
 2022 09:59:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 09:59:09 +0000
Message-ID: <de28a847-82cd-9571-a445-d1fdd5b79f63@amd.com>
Date: Fri, 25 Mar 2022 10:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
Content-Language: en-US
To: "Lin, Tsung-hua (Ryan)" <Tsung-hua.Lin@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "bas@basnieuwenhuizen.nl" <bas@basnieuwenhuizen.nl>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "sashal@kernel.org" <sashal@kernel.org>,
 "markyacoub@google.com" <markyacoub@google.com>,
 "victorchengchi.lu@amd.com" <victorchengchi.lu@amd.com>,
 "ching-shih.li@amd.corp-partner.google.com"
 <ching-shih.li@amd.corp-partner.google.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "ddavenport@chromium.org" <ddavenport@chromium.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Li, Leon" <Leon.Li@amd.com>
References: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
 <2125c5b2-b377-076a-4177-d5ef482eb657@amd.com>
 <DM6PR12MB44177923FF4E05331A7B727FB21A9@DM6PR12MB4417.namprd12.prod.outlook.com>
 <26042d92-0fb7-fadb-140e-b633f2979632@amd.com>
 <Yj2QKsKet4/pHvvX@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yj2QKsKet4/pHvvX@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR02CA0023.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::36) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 742b1ce7-6520-4569-f0da-08da0e461b4c
X-MS-TrafficTypeDiagnostic: BY5PR12MB3650:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3650C47541E6C8A062F66F67831A9@BY5PR12MB3650.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eh4+y5feH8BMpflqpffj8mTrdWn3J/aN+taQTL0YoKgXq7vwnXjoPuEbEzhcOUZV3Xtv9C7PIwF7NByyJ6hOwPvdtr2mkfovpXuuWAvXM3rcKPbcd5U7gBZfctXtM095W89aPsM8atF4/Tgt0DSY1vMkb0nnSefaw+YlhG5B2Q7G44ClrOHFqLRhViMwLGv2LL6CK5MMgD7LFNktuMuTzcTBpBW2F0/lKdYb6d2Cc14ZuHo7IC/Ohpeh65qmgkHFlDkChcM4G3UdTBsQPXHEsf5BPeN7ZGIW9YG4VBlJZSgcE/lrje315gKmVgrC+BpcGrSJpKEsux04QRR5TK4Jt/oo0Q57mbCO5Js1WEO873t4OOlLFL/b/MFPu4fyN5rb/Cb8JZoRlPjgPZX3D+xMhj5bmNQxDEB10eE7uj0ZoSV9E9NCKg5v4suVNVC471ZCnxeGANn9Pwq45Rz0hhLlnUp2NchhRysVzNMnxUvUvvcaAL9OH5XdifU1z35mc8ubZzglLwuXvSHOFXnUspcZck9A6HD/SlV6yKdngqQKVrMY3eweskijIscc6BEYYsgaumhmOyhrydMk08xgBQcp5LBZvM3MSe7Ik6FiS230rCK1pHLszwMf84y1B8zrtr2aFwPVXV3/MiL//zMcS7ARtUDYWFAUWH4MJAIGD0cTabdhEvt/quQy0+E6UTNPC5y+Xx/8auHbZ0aDpz2lKd/g37LpzTdE7XcezxzKBqX2jpBZ0V1g5BEdaQsUbIuPxKRJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(316002)(6636002)(8676002)(66946007)(6512007)(83380400001)(66556008)(186003)(36756003)(6486002)(86362001)(53546011)(31696002)(6506007)(6666004)(508600001)(26005)(2616005)(110136005)(8936002)(921005)(2906002)(7416002)(31686004)(38100700002)(66574015)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE1vRnJCMnpCZ3dTU0VIb20xc3BMdDB3SnY2Y296VWczOFBQMnhLRjdqaFVN?=
 =?utf-8?B?WHFIaCtldml5UGJjc1F4VTZkR0dXMXdBakFzYUdUWm9JKy83Y1k1MlNPNW9n?=
 =?utf-8?B?d3FaYWpPKzliKy9lenZGVHhMalBJZHlVdFUrVXpudHJNaThQSGFwTHpPM1cx?=
 =?utf-8?B?bXZYUGUzWkJsUGVKcGdvNEU2TU8wMklEaEtSZzlJS2haOTdQL3YvNFU5UjZD?=
 =?utf-8?B?TlBGSFZDdi84V1E0dkxnNU1YaEF1aWVlaHZIRkM1RS93a2h1TkRjckhQRVBX?=
 =?utf-8?B?ZjhqYUk0UlFZeitLcW9kR2xrb2lobkhvVlpoL1RIMEZOT2VoSlpSL05YTk4x?=
 =?utf-8?B?aFpmSFdmQkZSdW43L0NFekpxUDlUU29oZkZDNTAwclJLY1VPM0lNZm94TTZX?=
 =?utf-8?B?cnhabGc2SHp1TGJmYXJob2JmZ0Q2N0dzK2t5MDNmN1k0eWJjbFFaOUhjREFu?=
 =?utf-8?B?a09nWlJuaW9yMTd0Y1JmUUkwVVFWemN0R25SUHdTZWY1d0JFM3JjdUg4TTdw?=
 =?utf-8?B?MlVvWUc5eE11RWdlNGdPUFBhMkRyN1pvOW1hSkNpUVBmdlk5bjYxdE9CeXZD?=
 =?utf-8?B?Q0tjS0wzbHpIWDhua1VHMkxIbncxbWloSkhtNWpkK29hbVQwVlBsTEVjSUt1?=
 =?utf-8?B?cDF4YzIzK3d4a2I2QTZmSExHNytDa3loNXhDUk5GWHJTMWg3V3owUVJ2Nmg5?=
 =?utf-8?B?V0RteDR6eXVGK1NGRXZCOG5QQVQ3MmFLL0tzdEdRRExOVTQzcmpNZVMySnQr?=
 =?utf-8?B?Tkd5d0xBNUxhcDJxRUMwYVhubW9UbEdpT1FGMnJYTTQ4Q204dWpZUmM0cXVh?=
 =?utf-8?B?bmxnemw1b1RhYlFnTnJ3V0ZoTDVXUnM0ZDd0Z0REeE1iYU5mR3FpMkhlU1ZP?=
 =?utf-8?B?MTR5U0hQT0hqR3RNVVYvUXhITjlrWVYvbUJMOXJBK2lnRXVFa3ZCM3RHVTB1?=
 =?utf-8?B?cTZ1bk0vcWZiMDdHOWlXRHpEQlJOMFMyd0Z4UEp6WnpEQy9YaWJvZ2RCRTlQ?=
 =?utf-8?B?Ryt4enFyVW14czhYT2RDbzI3RytUUU5pY01ZQ2QrVk83a2tzdjRUdFRjanZE?=
 =?utf-8?B?OHg4Q0JFVlZpR3BDZVpNanZiZldjdVA4d0pBWHVrdjNITWhXUlA1QkZhWlJT?=
 =?utf-8?B?UmtMWnAvNkNmb1JWeEdoLzVucEx2Wi9lM1JHblQyVXJHREZueUgrUytvYjVr?=
 =?utf-8?B?V3BsdzBRN3JBUTBNY1ZSazBwS1JwY1VDRWZmLzVsWGJvditwckZva2RvOWxi?=
 =?utf-8?B?YW1QQitweE9IUng0N0xPdzNZQ2FLcGdTT2N2YkhQSG11M3dJTXQwUU9SODFJ?=
 =?utf-8?B?MTJWL2Yyam9HN29GeVNIa1VPdzVvZHpwNFJ4Nnpvaytzd0Y0M2hKSU1FYzhF?=
 =?utf-8?B?bmtGdGhhZ3NMenZzV3U1TzJieVhFZVRmWWI0OHZOQjUzUGM3WFAyYldQUUZT?=
 =?utf-8?B?cmJhR1o1QitmcUN6a1d1RysrSGxwZ0R3ZzhXSlRhMFNqK2EwUjNldUhpd2NH?=
 =?utf-8?B?bTdraFdQQnJiNWROWDZ1SytmTFg2cWZ0ZmxsWXpDR08xd2ROVjFNSnlFcGVi?=
 =?utf-8?B?aTJ6dFM1STZpeFN5WjZmVXYrUDlQTXEzMGpXS2x2dlFtN0VzbUdEZlFpZDJj?=
 =?utf-8?B?NUpvRDMxK2I3K3QxUHBuNG9FdjdSZDA5RkdzV1pCdmFnejkyZHMxYWk5Tm9s?=
 =?utf-8?B?TkpMZmFCQ3dEVzhCdHBpVWI5anJXNXdCd0lUYlRPalU0QXYraWRjMmcycnkz?=
 =?utf-8?B?TVhQYzVJTW1va0N1QmdFYUE2eFN3dGpDc3hEejRwMjQ5YjVXbm8rTHhCQVlV?=
 =?utf-8?B?RDloK1VveEFaWFhTQnJUSmdUVTZtRFdwNWNHemxndDNxNDl6K3JzUlJFdU9U?=
 =?utf-8?B?SG1EUXJ2bkloRjBUOVlsZWNNcERIdlFMUUN6MTBYQUpjTk5rUUpzTVpVc1Ri?=
 =?utf-8?Q?/QAWTI+NKuM90rRlxvFUmoMSloro9BD/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742b1ce7-6520-4569-f0da-08da0e461b4c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 09:59:09.7529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAchzqexkm+qiwoNZsjM87gfrGNwTp2y5/mZTISVoe2X7gURX3ZtujIA6wgWZL3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3650
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

Am 25.03.22 um 10:49 schrieb Daniel Vetter:
> On Fri, Mar 25, 2022 at 08:22:29AM +0100, Christian König wrote:
>> Hi Ryan,
>>
>> we should try to avoid that and if it isn't possible at least use some
>> constant like ACPI_AC_CLASS.
>>
>> Could be that the information isn't available otherwise. Alex should know
>> more about that.
> I wonder whether we shouldn't need a more dedicated notification from acpi
> for power supply events instead of stitching this together ourselves. At
> least this kind of stuff feels more into the policy/tuning territory where
> a bit more careful interfaces might be good instead of just "hey there's
> this very funny acpi protocol we just have to take part in to not upset
> the hw/fw".

That is pretty much my thinking as well.

A quick grep shows that both amdgpu, radeon, nouveau and i915 all parse 
the same information with self defined macros and strcmp(). That's not 
really the way we usually do stuff like this.

Ideally the ACPI layer in the core kernel would parse the information 
and give it as enum or flags to the drivers instead.

At bare minimum we should move all the ACPI_AC_CLASS, ACPI_VIDEO_CLASS 
and raw strings into a common place to start with.

Regards,
Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>> Am 25.03.22 um 08:09 schrieb Lin, Tsung-hua (Ryan):
>>> [AMD Official Use Only]
>>>
>>> Hi Christian,
>>>
>>> There is already a string comparison in the same function. I just reference that to port this solution.
>>>
>>>
>>>
>>> #define ACPI_AC_CLASS           "ac_adapter"
>>>
>>>
>>> static int amdgpu_acpi_event(struct notifier_block *nb,
>>> 			     unsigned long val,
>>> 			     void *data)
>>> {
>>> 	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
>>> 	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>>>
>>> +	if (strcmp(entry->device_class, "battery") == 0) {
>>> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>>> +	}
>>>
>>> 	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {      <-------------------here!
>>> 		if (power_supply_is_system_supplied() > 0)
>>> 			DRM_DEBUG_DRIVER("pm: AC\n");
>>> 		else
>>> 			DRM_DEBUG_DRIVER("pm: DC\n");
>>>
>>> 		amdgpu_pm_acpi_event_handler(adev);
>>> 	}
>>>
>>> 	/* Check for pending SBIOS requests */
>>> 	return amdgpu_atif_handler(adev, entry);
>>> }
>>>
>>> Thanks,
>>> Ryan Lin.
>>>
>>> -----Original Message-----
>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> Sent: Friday, March 25, 2022 2:58 PM
>>> To: Lin, Tsung-hua (Ryan) <Tsung-hua.Lin@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; David1.Zhou@amd.com; airlied@linux.ie; daniel@ffwll.ch; seanpaul@chromium.org; bas@basnieuwenhuizen.nl; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; sashal@kernel.org; markyacoub@google.com; victorchengchi.lu@amd.com; ching-shih.li@amd.corp-partner.google.com; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; ddavenport@chromium.org; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Li, Leon <Leon.Li@amd.com>
>>> Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
>>>
>>> Am 25.03.22 um 05:05 schrieb Ryan Lin:
>>>> Disable ABM feature when the system is running on AC mode to get the
>>>> more perfect contrast of the display.
>>>>
>>>> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>>>>
>>>> ---
>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  4 ++
>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
>>>>     drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++-------
>>>>     drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
>>>>     4 files changed, 42 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>>> index c560c1ab62ecb..bc8bb9aad2e36 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>>> @@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>>>>     	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
>>>>     	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>>>> +	if (strcmp(entry->device_class, "battery") == 0) {
>>> String comparison in a hot path is not something we usually like to see in the kernel.
>>>
>>> Isn't there any other way to detect that? Like a flag or similar?
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>>>> +	}
>>>> +
>>>>     	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
>>>>     		if (power_supply_is_system_supplied() > 0)
>>>>     			DRM_DEBUG_DRIVER("pm: AC\n");
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index abfcc1304ba0c..3a0afe7602727 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device
>>>> *adev,
>>>>     	adev->gfx.gfx_off_req_count = 1;
>>>>     	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>>>> +	adev->pm.old_ac_power = true;
>>>>     	atomic_set(&adev->throttling_logging_enabled, 1);
>>>>     	/*
>>>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>>>> b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>>>> index 54a1408c8015c..478a734b66926 100644
>>>> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>>>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>>>> @@ -23,6 +23,8 @@
>>>>      *
>>>>      */
>>>> +#include <linux/power_supply.h>
>>>> +#include "amdgpu.h"
>>>>     #include "dmub_abm.h"
>>>>     #include "dce_abm.h"
>>>>     #include "dc.h"
>>>> @@ -51,6 +53,7 @@
>>>>     #define DISABLE_ABM_IMMEDIATELY 255
>>>> +extern uint amdgpu_dm_abm_level;
>>>>     static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
>>>>     {
>>>> @@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
>>>>     	dmub_abm_enable_fractional_pwm(abm->ctx);
>>>>     }
>>>> -static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
>>>> -{
>>>> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>>>> -	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
>>>> -
>>>> -	/* return backlight in hardware format which is unsigned 17 bits, with
>>>> -	 * 1 bit integer and 16 bit fractional
>>>> -	 */
>>>> -	return backlight;
>>>> -}
>>>> -
>>>> -static unsigned int dmub_abm_get_target_backlight(struct abm *abm) -{
>>>> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>>>> -	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
>>>> -
>>>> -	/* return backlight in hardware format which is unsigned 17 bits, with
>>>> -	 * 1 bit integer and 16 bit fractional
>>>> -	 */
>>>> -	return backlight;
>>>> -}
>>>> -
>>>>     static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>>>     {
>>>>     	union dmub_rb_cmd cmd;
>>>> @@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>>>     	int edp_num;
>>>>     	uint8_t panel_mask = 0;
>>>> +	if (power_supply_is_system_supplied() > 0)
>>>> +		level = 0;
>>>> +
>>>>     	get_edp_links(dc->dc, edp_links, &edp_num);
>>>>     	for (i = 0; i < edp_num; i++) {
>>>> @@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>>>     	return true;
>>>>     }
>>>> +static unsigned int dmub_abm_get_current_backlight(struct abm *abm) {
>>>> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>>>> +	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
>>>> +	struct dc_context *dc = abm->ctx;
>>>> +	struct amdgpu_device *adev = dc->driver_context;
>>>> +
>>>> +	if (adev->pm.ac_power != adev->pm.old_ac_power) {
>>>> +		dmub_abm_set_level(abm, amdgpu_dm_abm_level);
>>>> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>>>> +		adev->pm.old_ac_power = adev->pm.ac_power;
>>>> +	}
>>>> +
>>>> +	/* return backlight in hardware format which is unsigned 17 bits, with
>>>> +	 * 1 bit integer and 16 bit fractional
>>>> +	 */
>>>> +	return backlight;
>>>> +}
>>>> +
>>>> +static unsigned int dmub_abm_get_target_backlight(struct abm *abm) {
>>>> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>>>> +	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
>>>> +
>>>> +	/* return backlight in hardware format which is unsigned 17 bits, with
>>>> +	 * 1 bit integer and 16 bit fractional
>>>> +	 */
>>>> +	return backlight;
>>>> +}
>>>> +
>>>>     static bool dmub_abm_init_config(struct abm *abm,
>>>>     	const char *src,
>>>>     	unsigned int bytes,
>>>> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>>>> b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>>>> index f6e0e7d8a0077..de459411a0e83 100644
>>>> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>>>> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>>>> @@ -445,6 +445,7 @@ struct amdgpu_pm {
>>>>     	uint32_t                smu_prv_buffer_size;
>>>>     	struct amdgpu_bo        *smu_prv_buffer;
>>>>     	bool ac_power;
>>>> +	bool old_ac_power;
>>>>     	/* powerplay feature */
>>>>     	uint32_t pp_feature;

