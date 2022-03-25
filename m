Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713F14E6EC4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 08:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9849310ED76;
	Fri, 25 Mar 2022 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E08F10ED6D;
 Fri, 25 Mar 2022 07:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3rrjwxa/AMM+NgITIajUVMXUNPaTXSxp9bM0L+aE1Wm14Unev7/znaYyN3kJ8xPAF/LTQqBsEIdiHjlN+KLXNAij5vhRnoCn+Fr7TNSshBTzPbElHBvnikdiz2SAX4zeE0egabEAJ97/jcS3uqhbfCNnXq/4ccbrj2YBYhVPLG+oD6ICHAYNm6cMBomziSoM7/5b7a5UxKyoy6ndwmXyJ4s6F13SISfbZMcz79XC4ySr04lmeYGLTP8eLz0AfXknIZtwinbypIiOiTdKWalITrVDxWiChcRdzmtp1q68MUfk9B6FYAmIMr2pv3xlZYOG+mwj6UoPsYFbLX2w7RmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mZ4tVDiqjbcB18MGKUkIMYUF+68bsg3E8eZ8PzC4Gk=;
 b=h5kCUJ8LyJWUPA32irvuX5xlWhkE+761MdmkckfW+buiIbcQJjdu1fXoLni9emDDzyOlVYVYnMTunzw6sU4Hg5UZjDXkpIL+RwRJ4oAooLVF74qb39Mnhn6PobM2lKAMhZHW2GUCWPWioHizVMD2YmDligOHWewTPbTwjOWGqlVvseMxk8+lvBp/r19b5qeEU5ff/UAvluL5z78OayGJyKancl7G/KgljccgPQxqVX4kKdB+12cQ1reEXLU3HxFNt6hKi5JENNrDAwyK+FxsVsVFL5dnoncwGIIEOSK2s+BjlIr3TdTinxhaoPjf0739G4BDTkEUGQ9KbOJtBsGusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mZ4tVDiqjbcB18MGKUkIMYUF+68bsg3E8eZ8PzC4Gk=;
 b=PGQdN+p3XwTrHTDpv0GT9NcHpAEE6ti7v1S5dai4EPBA2gX3VniEG6U7zVwQZF5534y/OdTfbk9+xni3eNS40dW89OaxEKMJjbjk+0J2hEY4UCadmVRMf3OwNJG/8HNzQLA3albofJU49oMNlIU4mWOIgVsW25nxy1lUgzjFZfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB0120.namprd12.prod.outlook.com (2603:10b6:910:1c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 07:22:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 07:22:41 +0000
Message-ID: <26042d92-0fb7-fadb-140e-b633f2979632@amd.com>
Date: Fri, 25 Mar 2022 08:22:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
Content-Language: en-US
To: "Lin, Tsung-hua (Ryan)" <Tsung-hua.Lin@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM6PR12MB44177923FF4E05331A7B727FB21A9@DM6PR12MB4417.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0272.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b539f8ca-5d9a-44ed-420b-08da0e303f5b
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0120:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01204D29F7FDA6760C4FB8C1831A9@CY4PR1201MB0120.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kinQiZHDImKhIIobsRTsLNDS7q9DOEcqU/bT38/ft8dee5Z2iCdNqDP7C3pBaYKEvAjxMWSAhn3eEMHJktUT7a30TpiL1OXOj0ymV32gKt2lHtiCm0L8R+tL3yKNpa9T/SI1C924UZWCQ7ldFkjBbIKwNBi/hYt1TWA/U4z6X5PsS966EfhSDgB1IxYoS7/FGEZ8tddbK2ecKLteBQUUAHVsm4wJUT1ucizL1XgCm5SykYjJb7wSrg+sZ1cgOyqqT4gLcsksHCE/NWYiBaH9LoYr8FOP7UExXaycLMM3aLCYlQkc+3HaALccFAzCSKGo3gDNjL06u1pmbMPbjccVpJi5KED1a0SbXW0NpLczXNswj5rTWqNKI3nEyYj57iMD7eJgQmOe20EvkNlNEJwLwEuK86K0Uz6oXd5W/DhaVUVlot0NqfZhHGrHPDt0KNLc6mPHQu8TCP/MJuA651Cb7b824b+mjTCwGBdu9QT279nYPiJ5rCRmDUjiJ2xAf/kINnxU8SVhZivgh0HJoSZzwEaF+XTOO4BtXenKQVIwD+2OiEPhnvYxd3Nlm+GitxoSeIpmtZDbFYND7RVskHjAGpOTkfv5WhnK0gPYCLIB5/p8rfR6S7ApcuI1rYw6rYrizn1GmlpxPLe0HQNaXulpYaRUTRyz54FanyBW9x04Ou/8N8P++m9OHcQzUI1uxSsRm8JCrJaDX5n0Mxt56kce6BMjKXocN4OnTFBBQZImW0Wb01ApKm5R6roTs0xGj0YZChv3rOCrvgpDVTO7A8/gTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(110136005)(26005)(83380400001)(66946007)(316002)(66476007)(36756003)(31696002)(8676002)(31686004)(66556008)(6636002)(5660300002)(7416002)(6486002)(86362001)(2616005)(6512007)(508600001)(8936002)(921005)(38100700002)(53546011)(6506007)(6666004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWhQcFFYbWJhTlNNVlhiTk5CMXVJLzVBZHRVNW1uRlB0Nzl1azdRMkM1WVhz?=
 =?utf-8?B?dGoyZ2x2clNSZmtmblJtZ2NDUXhKRHdnbDlXVnlVTGZ1d2hpLzlSZTVnNWdR?=
 =?utf-8?B?bzlObEVNaHYvcDJjUlhaUGhxVjV4Q29kcjVHVFVLcFVsQWpnWm1jU3JpYjZM?=
 =?utf-8?B?ZVlIUDRHR1BlQXFPSVNKQ243OGtNQU5XNlVsbTc3SnpvQlRHak16TS94Y3Zx?=
 =?utf-8?B?WWZLYmlvVjVWSitZenBXU2liaGd0QnZYNENhcEtra20zNlRud25tMWlYS3FN?=
 =?utf-8?B?Rm1MTzJFU2oraklDT0tQYW5BR0JPZjRSR0pPZ2NocFB6VXl1ZjlJaGFLNXJk?=
 =?utf-8?B?MGV5VDR4N3FPeDREdlkrZXp0YlZOZzg3RERqRndINFVjRElSQURwRGhzWkNa?=
 =?utf-8?B?V0U3akRjY2xkelFvUkhBcnNHdk5Nb2RncTV2RjYyRTg2Ynp4T2RkcHpRMDFo?=
 =?utf-8?B?YVRJS29MZzdzY3RYUUlyTEM5aHpyY3I1MUJmcXNDdnUrM01YWWNvd1NSZDZY?=
 =?utf-8?B?Tmc5d3RXWHFrTVNETTFieXRtcTRCUGkvSTZ1MFB6cDhCSHpPd0NJUFM3anVW?=
 =?utf-8?B?UUExUjBwZ29TUFJNYWswOVFpaG8zWkFNMEozK2RTZ3kxRkx6QnZrNkhxS1dz?=
 =?utf-8?B?WXRkbnhob1pqSDNVNStVbWt5ODBuQktUOFNQdXhzS2hYUVRZZFA4cmJaVUNK?=
 =?utf-8?B?UEREUFJoMWM3SE0vODh3UEFYdEZMN0g4VnFxdWlpR3JKM0xoMXV0MXh0aWRI?=
 =?utf-8?B?RnZSTlg4SGN1RzdRa0liZlNzeGh6S3pPbGQ5N253TUdlSUhqNGZoZ3paaFY3?=
 =?utf-8?B?eGN6KyszdGZNTXRhcEtWeHpVRTN2TDBRMEQyZmhsdkhpczl3VW1CT2thTktK?=
 =?utf-8?B?TWYrb2tIZkp1ZGNMWEZSTjBCbmFlMnpuSHB2dy9Id2FwcXVXWkxqdmpxcFlQ?=
 =?utf-8?B?QS81U1dENmlyc1lKdFBEdk5NN0daRkUwVVhrYlh6Y2tORFJ1aXpHMEpxT2xM?=
 =?utf-8?B?Y3lvdEdNa1pNc3M3Wm9wdmxKVHJnTERLTDJEN3VwdGgxWlcvQ0FkOEJUdWhI?=
 =?utf-8?B?dTZ0eHRDY2FsUGJCV0VSaEcwcU85UFYzOXJaWjhNMzZzNkVXditPUFFJcFc1?=
 =?utf-8?B?SHBGWU9XQ1ZYK21PN2NRY1cyWEpCQ2ZhTldWbjc1WmlFbU9CMDVPYUIvc3NI?=
 =?utf-8?B?bVRqOWlXUks5bnRLeG5CYjVvKzY5bHVRZk9JZnIyTnlWdjFyckhxRHYveXM1?=
 =?utf-8?B?KzRrNk9NZ0dWaUJTcFVGU1BsK09XYmJjeHVkOHd1WllSRkdXSWZYQ3gxaHVD?=
 =?utf-8?B?NHRBdWFMQ2s0a3BiN3Y2YXl6SEZzbkdWYVowVTVySDRNRGxpdjFxY1B4SGMw?=
 =?utf-8?B?YzhrcVI4NDRkTTEybzZ4L3ozaStxWHhrRjgxOGEzK2xNdGpLSmRtZ1grZTd4?=
 =?utf-8?B?OHJ5OERQYmk0ZWJKZ1NCMnBEbWdveUlEYmNPTHRmeDFNeFRuWTlKVjFsbkpq?=
 =?utf-8?B?NUR4Q2JpaUIwQUtCYUowZ2ExUXNLOERSMmp2RTBpZGw1UUp5cVo3YXpUK3c2?=
 =?utf-8?B?VXY1U3pmRzh5bUVVanNraElpcVdqZkQzbEJlT21XRWRVMzFJeGc4OExIUWho?=
 =?utf-8?B?OWFpajU3d2dDRXlYeXpFMDRKNU1Jam5CTVJPSUVqd3BvWDBUNmFYeVpzS1Ar?=
 =?utf-8?B?dzEvNks3RXJxNFpNSnRzUFl3Q3BRYVdGeWp6c01EZ09MWGVRTXM2U0dlWTJH?=
 =?utf-8?B?Y29Ob0dYSUNlRmJLanJydVVWZlByNWdhTE9TSEhPRFAzQXQ0aExKaTdQK1k2?=
 =?utf-8?B?TUZjWk9VQU5saFY2MFA1UGdCbUxkK3VnQ3VyY3ArWkNlOEZ4WHVmZTFEbTBi?=
 =?utf-8?B?L2RRT2hNWFFhVlBSbEJXKy9YMlZ0T0NXaGt1NWx1L2xkUHgveEZGM1lYaTZJ?=
 =?utf-8?Q?JUb5vX9tlpUTdGh/doffxBwjTfz2BEKr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b539f8ca-5d9a-44ed-420b-08da0e303f5b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 07:22:41.3010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9CzqGun+MuLXFuxqSRUDOuz7pBSmDDGQzuk2psj/whPbJvUvnxdTao2ZmqFw8R7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0120
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

Hi Ryan,

we should try to avoid that and if it isn't possible at least use some 
constant like ACPI_AC_CLASS.

Could be that the information isn't available otherwise. Alex should 
know more about that.

Regards,
Christian.

Am 25.03.22 um 08:09 schrieb Lin, Tsung-hua (Ryan):
> [AMD Official Use Only]
>
> Hi Christian,
>
> There is already a string comparison in the same function. I just reference that to port this solution.
>
>
>
> #define ACPI_AC_CLASS           "ac_adapter"
>
>
> static int amdgpu_acpi_event(struct notifier_block *nb,
> 			     unsigned long val,
> 			     void *data)
> {
> 	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
> 	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>
> +	if (strcmp(entry->device_class, "battery") == 0) {
> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +	}
>
> 	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {      <-------------------here!
> 		if (power_supply_is_system_supplied() > 0)
> 			DRM_DEBUG_DRIVER("pm: AC\n");
> 		else
> 			DRM_DEBUG_DRIVER("pm: DC\n");
>
> 		amdgpu_pm_acpi_event_handler(adev);
> 	}
>
> 	/* Check for pending SBIOS requests */
> 	return amdgpu_atif_handler(adev, entry);
> }
>
> Thanks,
> Ryan Lin.
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Friday, March 25, 2022 2:58 PM
> To: Lin, Tsung-hua (Ryan) <Tsung-hua.Lin@amd.com>; Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; David1.Zhou@amd.com; airlied@linux.ie; daniel@ffwll.ch; seanpaul@chromium.org; bas@basnieuwenhuizen.nl; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; sashal@kernel.org; markyacoub@google.com; victorchengchi.lu@amd.com; ching-shih.li@amd.corp-partner.google.com; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; ddavenport@chromium.org; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Li, Leon <Leon.Li@amd.com>
> Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
>
> Am 25.03.22 um 05:05 schrieb Ryan Lin:
>> Disable ABM feature when the system is running on AC mode to get the
>> more perfect contrast of the display.
>>
>> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>>
>> ---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  4 ++
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
>>    drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++-------
>>    drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
>>    4 files changed, 42 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> index c560c1ab62ecb..bc8bb9aad2e36 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> @@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>>    	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
>>    	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>>    
>> +	if (strcmp(entry->device_class, "battery") == 0) {
> String comparison in a hot path is not something we usually like to see in the kernel.
>
> Isn't there any other way to detect that? Like a flag or similar?
>
> Regards,
> Christian.
>
>> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>> +	}
>> +
>>    	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
>>    		if (power_supply_is_system_supplied() > 0)
>>    			DRM_DEBUG_DRIVER("pm: AC\n");
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index abfcc1304ba0c..3a0afe7602727 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device
>> *adev,
>>    
>>    	adev->gfx.gfx_off_req_count = 1;
>>    	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>> +	adev->pm.old_ac_power = true;
>>    
>>    	atomic_set(&adev->throttling_logging_enabled, 1);
>>    	/*
>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>> b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>> index 54a1408c8015c..478a734b66926 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>> @@ -23,6 +23,8 @@
>>     *
>>     */
>>    
>> +#include <linux/power_supply.h>
>> +#include "amdgpu.h"
>>    #include "dmub_abm.h"
>>    #include "dce_abm.h"
>>    #include "dc.h"
>> @@ -51,6 +53,7 @@
>>    #define DISABLE_ABM_IMMEDIATELY 255
>>    
>>    
>> +extern uint amdgpu_dm_abm_level;
>>    
>>    static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
>>    {
>> @@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
>>    	dmub_abm_enable_fractional_pwm(abm->ctx);
>>    }
>>    
>> -static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
>> -{
>> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>> -	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
>> -
>> -	/* return backlight in hardware format which is unsigned 17 bits, with
>> -	 * 1 bit integer and 16 bit fractional
>> -	 */
>> -	return backlight;
>> -}
>> -
>> -static unsigned int dmub_abm_get_target_backlight(struct abm *abm) -{
>> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>> -	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
>> -
>> -	/* return backlight in hardware format which is unsigned 17 bits, with
>> -	 * 1 bit integer and 16 bit fractional
>> -	 */
>> -	return backlight;
>> -}
>> -
>>    static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>    {
>>    	union dmub_rb_cmd cmd;
>> @@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>    	int edp_num;
>>    	uint8_t panel_mask = 0;
>>    
>> +	if (power_supply_is_system_supplied() > 0)
>> +		level = 0;
>> +
>>    	get_edp_links(dc->dc, edp_links, &edp_num);
>>    
>>    	for (i = 0; i < edp_num; i++) {
>> @@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>    	return true;
>>    }
>>    
>> +static unsigned int dmub_abm_get_current_backlight(struct abm *abm) {
>> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>> +	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
>> +	struct dc_context *dc = abm->ctx;
>> +	struct amdgpu_device *adev = dc->driver_context;
>> +
>> +	if (adev->pm.ac_power != adev->pm.old_ac_power) {
>> +		dmub_abm_set_level(abm, amdgpu_dm_abm_level);
>> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>> +		adev->pm.old_ac_power = adev->pm.ac_power;
>> +	}
>> +
>> +	/* return backlight in hardware format which is unsigned 17 bits, with
>> +	 * 1 bit integer and 16 bit fractional
>> +	 */
>> +	return backlight;
>> +}
>> +
>> +static unsigned int dmub_abm_get_target_backlight(struct abm *abm) {
>> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>> +	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
>> +
>> +	/* return backlight in hardware format which is unsigned 17 bits, with
>> +	 * 1 bit integer and 16 bit fractional
>> +	 */
>> +	return backlight;
>> +}
>> +
>>    static bool dmub_abm_init_config(struct abm *abm,
>>    	const char *src,
>>    	unsigned int bytes,
>> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> index f6e0e7d8a0077..de459411a0e83 100644
>> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> @@ -445,6 +445,7 @@ struct amdgpu_pm {
>>    	uint32_t                smu_prv_buffer_size;
>>    	struct amdgpu_bo        *smu_prv_buffer;
>>    	bool ac_power;
>> +	bool old_ac_power;
>>    	/* powerplay feature */
>>    	uint32_t pp_feature;
>>    

