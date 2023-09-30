Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA927B3E09
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 06:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0013D10E1B3;
	Sat, 30 Sep 2023 04:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1814010E1B3;
 Sat, 30 Sep 2023 04:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCmsEePefwTjWCCxhkKfxyIZvP5I4A9K4kovckzdJFIYNbRJ9JAiLRhtKpUOue39gIwjP1K5RiYNRXWzM/gLAQ2oC5DIHxDTVyThaZW9sEhyg7ZjeC2Xta2LOsFlcPlgfjaRvx+dRYZpvs/9Gy944iSReYC4b+nEfXkm0F1IodS505N05BnJCqRh2HYsRvF1Vbt0C4Lt9SOBfcHLmjwRtKxHe2ripo/g5tDP3EZg7oh0IKGuj/Ar4HRyOvPxOFrqxN/GxxwT/6IVHSGHZhIEmzTZ6QLLpCKdO4eoyqGNufY50Rx0jTjGBqgILsCrPCS0xm4j2B9pCiLi9tVntSIn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7MDqshGZ+p9v+RStfEaipNmgTsQMllrdB9kWqXCNWA=;
 b=f27Qg/sOOrgUcGIx81NDnxhJqifu4IzdCAko2aj6f8QVfUEQely7uTjbqdO8R8hfv0xzHdXNZn7Lw1DEtMhljdjsZ4BuuWji3bo6vhVtDoTH7g0AUonJwyleUtTmBoS0zhfZ9y99M/fniEWT1Fves43W/tPo+oZ61NeInvjlgq3JswyrLaV55HuwBItS3tnDckh4VofBez7IamPonkp9r7NZz38fY42ibd0EIl/wIbrNLMADNDkJPoDpSMirB7VsfPoSZGltD5FNVfZf+mRxZXAmzsnPh9SVhOYrou12ZwF1NT5XXyGStKNPa0f3Ug7veB/i/sEl4cJhwC/tIQzLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7MDqshGZ+p9v+RStfEaipNmgTsQMllrdB9kWqXCNWA=;
 b=r20Q5WNLc42wbz+GJzuXSn7Ztzzy0FfLOXdjNwfJdnrYGmWts++1u4vK8DCBYRKkAY7O/mzBq9AXDx3uQGoBWU6v2f6PBkScQopKHoKtkGXP/9pPgdpE5WbRST3OjWZj3Gj2VzdVl5B2x3sDe4opsYlvxAVc8XrWlY+CgPpanGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.36; Sat, 30 Sep 2023 04:41:26 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6838.024; Sat, 30 Sep 2023
 04:41:26 +0000
Message-ID: <02b2307f-003e-4496-93ab-53674dd7c49e@amd.com>
Date: Sat, 30 Sep 2023 10:11:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] platform/x86/amd/pmf: dump policy binary data
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-12-Shyam-sundar.S-k@amd.com>
 <fa4f1a5b-5ea1-4884-aafe-36696b491654@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <fa4f1a5b-5ea1-4884-aafe-36696b491654@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS7PR12MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebb0cd0-9145-4d06-ec48-08dbc16f80f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/uUGUrLYkTEp7eh5CEybY7ljGHXRs+7c66knOda2knnjxH1MNx9skyQfppSuUyjS8vtmPOESxcqaOXUxK9uc+axrq1FyiAcvfWBNrtIQZimMYSb2qbeN8t3FYNbkxRis+hkenlHmNEdiFvSS36v9h01u+v5o3pya9rbujxLyBZFMjxVERcq+VvYL7SWNcxQ43M3kfzIfxl+IVfY1maRSNV+mLLSjSiLc4CwLk3WCpCcJPPNtNbFr5JVYQJkkuhdTpCAWCNsTL/ts8W4PZa5hIyoRANq6dMbPYLWWTX+DTdT7oXtnWUYWZiY/cesTLiGtr5hjsd5c9H+eLTl1e/fJkfXVmO9oGzrl0W1XWeiDmpVb2wRkP34ozMw0p9X1bCZY1HTu0N/0CSbMAsrBeV8z46VA6cYfHDyAnGt2BHkmQb8WQ8p1XpDbVXcplkTflleY1eWNmLRhxm8vojwzTvwSK4XA4pU62B7b8oJeeFh5opoCsNtgQHBYcDxu/F4cxCdXvS2L8LY2WhQY9VCqF4mOIZl6dlEU7evkrjX6bGChZuoJBlRKSmxOOSFbiCY2DpnmOzj3dGPOf46ZUxZwx6L/nbxqApD5tlylDqEgPltxsRMEmOYlYWYfJ9NwQUF+bpdYYbdsE1t4n66qVvvB3VueBKT6/Iz0xbgazGeM5ddHDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6666004)(478600001)(31686004)(2616005)(26005)(6512007)(921005)(53546011)(6506007)(6486002)(2906002)(31696002)(86362001)(8676002)(5660300002)(4326008)(8936002)(41300700001)(66556008)(7416002)(316002)(36756003)(66946007)(66476007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUhLWExlVzNBYWJ3S1BLY3ptR3J6bndqWGYyTWFQbENQd3lhemdCL25KV1JJ?=
 =?utf-8?B?MTArSjJJTitiUTNxL3J4cEhxWXhtT0FiUjhlNkYxUFlOTmhtRFBqQmsrUTYr?=
 =?utf-8?B?eW93N1F6YXlNTnRYYlU1aDllOURKVWU0TGJKbmtOSEVDclE0ZzNObGdiTlVI?=
 =?utf-8?B?LzlwdnI1ZytwemRnbitlZFBTNXhBcmk3UTVRUFVQWkFBZGVoOGZEQVI2R3NG?=
 =?utf-8?B?amtzS0FQTW02RDNWaFpSMldQdWdrbzFLbkxHL1YveTluV2VYOWp6SDFrVmlW?=
 =?utf-8?B?WUY2bVZrZmNRSjN5RDN1VTcwdWNTRnppRFVWTEFBN1JzMnZ1bEUrN3BCb3Fx?=
 =?utf-8?B?M2p5NHBBUGUvL2hGa0UyWVdoZ3l3bUJpQVpFUkM3c2dJaU1yYnZQV3o5TVAr?=
 =?utf-8?B?UDgweWM5MXF3aldhSndMb0pmN0gwMnhiZmw1WXo3Mi9xWjZpMUpudEJ1a1I5?=
 =?utf-8?B?STZaa0RjcWhBNWVtb0h3TlQrM3ZmUU94TTAzdUIvbFg5eE5OOHdjWXhaaTl4?=
 =?utf-8?B?dzk0V0l6RCtUTFkvMmNkNUYwYkVmVWRNbStzQk8rVmV1aVRsRkc2bGx0Y0t0?=
 =?utf-8?B?Q0ptYjVPN1Zad0hXdC9WMXdlYytEa1hHTmZzM0RZbHdEZXR5akxycnFsdzM5?=
 =?utf-8?B?b0RRWjdlOUM5L2VVSm45L0lWeWU4SUhVV0xRK3hMRDRVQWpuRDFIbzcvaTRx?=
 =?utf-8?B?UjFpcWZZTlEvMHdITUNqN1lYR2NvWFRvWW1PWVZQTUFUMXA4a3EzdGgzaHph?=
 =?utf-8?B?MWpFdTBzWkdOcWlaeTRHcWhZeUp2UWx2UFFmdWJXTjVYZHdJNVNlTStWOXZj?=
 =?utf-8?B?dm9ORUMvREpVekdoOFZ2Zkc0OXFUMVNGTU5PNzFvZ3F2MW44dFo3VnIwYjFK?=
 =?utf-8?B?MFJ0NzdQMWhGcWpZd3Z4WEtyaWlEajJEdWVJN1J1Uzh4M2lodVMwZW55Unli?=
 =?utf-8?B?OW1lNmdkTnBnQUpCVldtWmNZdVlxYVYrcU0vTlNnUzJtSG5BY3k2OC8xeVl5?=
 =?utf-8?B?M0NuTDE3d0doNVIxQVBUU2liNDdHeHRVZ09vV1ZOY1FNV2hyeUlaNjJ5RFFO?=
 =?utf-8?B?WFNQSGZkZmxqOEttc2JRMlVkS1R0dE55S0RaY2RWa2FOZVhGMVZxd2tlcm5N?=
 =?utf-8?B?K0w2anJHdVZMWTREWG9uNnRCenVYZk4ybjI5b3BqbE9RcjI4Y0NEcUZrMGN2?=
 =?utf-8?B?eVlabmZlWGxIRElTT2pwLy8yTEJFNTRLa1FEaG4wR2JGK2UxTUNlaEdNTElu?=
 =?utf-8?B?S3lwcldWR2NtSG9IRXgxWWlZd0o3UlRRNVBTMDk5Vyt5VUkzNHpTbmlFYjFk?=
 =?utf-8?B?YUhPQlhieC9nVFprWEtwbHhXaHV0L01jVTljUFNYVkhpYkQra25jVmRUcXNl?=
 =?utf-8?B?d2dPbmxoVkZVNmtjcS9VWUtReGVKVHlsbFFLVkNxcHZLMG1xNXcxWnhvc1lT?=
 =?utf-8?B?NFgzNHoxY2xDdWN5Rm5XaGd6bzV2T1JJUlRJVDhBQldRb00xWFczVXdIWkdC?=
 =?utf-8?B?OVUwdmFBMzB1RlMxMnpHWGR2Tkw5UjlJcy9QdEZ2UUZldVQ3SlNxaTZHRzdx?=
 =?utf-8?B?Q0xwUU14QVgrektYRjcyTUNFZWluZEYwSFBWM0VSdmpjTlAxQlhodWlUV2tm?=
 =?utf-8?B?TW9SaEZ0d0J6cXRLZ3JkV0NuMmVYTDU3ZFVTUUF2b3NyanBjdEhiL3ZxMjZP?=
 =?utf-8?B?dUtBYklTejVKcEFVUkc2NG9wSkpPZkZSOC9IRDRHam9hVkRHY3VHcldPa3NM?=
 =?utf-8?B?dUM4cW1RekdEOXprZnNoK2xWT3BOM01UV3o3OHFWQ3ZDZFN2UE1mNFg0QW9l?=
 =?utf-8?B?VzRQeFR5cUpIanlrRi9HVkx3R2Q4TzI2SWZTOHllWjVyMTY0c3RhdHIvcysr?=
 =?utf-8?B?ZHkvbXhkeWNtbVBmb1g1VXBmcEZOVnh6alI2UXZ5MEJDSDA2VG90aXdwQWJ5?=
 =?utf-8?B?ckI0d3pVTVhERCtxR1RzR3lmVW43eGR4R283NUh4bkt1NFMvOEtudk1Bbk94?=
 =?utf-8?B?K3FiRXEzTE9CaWV2ZUJPZlRQWXFlSy9yVGJCMmNlQzNDYnJpUnlON0lGa1RB?=
 =?utf-8?B?T09ybFFic0I0bDMyZXVMcnNPc1lSY2VCSHJsa1NzeEdzSGU0SkF2OGVaTm93?=
 =?utf-8?Q?smbTNIXsXG7+cVDyebkwchrhR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebb0cd0-9145-4d06-ec48-08dbc16f80f5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 04:41:25.8435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ic3PnjuomEIn02PqVAGANBxNKwDmHP3RuGR2cvmPSCM7+OE9kjB9vQ39hk64f0KjipWpLxAGAsJqQYT+BYgwLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6288
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/23/2023 12:31 AM, Mario Limonciello wrote:
> On 9/22/2023 12:50, Shyam Sundar S K wrote:
>> Sometimes policy binary retrieved from the BIOS maybe incorrect that
>> can
>> end up in failing to enable the Smart PC solution feature.
>>
>> Use print_hex_dump_debug() to dump the policy binary in hex, so that we
>> debug the issues related to the binary even before sending that to TA.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/tee-if.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>> b/drivers/platform/x86/amd/pmf/tee-if.c
>> index fa37cfab2dc7..3daa122f35d5 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -290,6 +290,9 @@ static ssize_t amd_pmf_get_pb_data(struct file
>> *filp, const char __user *buf,
>>       if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
>>           return -EFAULT;
>>   +    print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1,
>> dev->policy_buf,
>> +                 dev->policy_sz, false);
>> +
> 
> Should this one also be guarded by CONFIG_AMD_PMF_DEBUG or no?

No, as this dump is called from amd_pmf_get_pb_data() which is already
under CONFIG_AMD_PMF_DEBUG.

> 
>>       ret = amd_pmf_start_policy_engine(dev);
>>       if (ret)
>>           return -EINVAL;
>> @@ -329,6 +332,10 @@ static int amd_pmf_get_bios_buffer(struct
>> amd_pmf_dev *dev)
>>           return -ENOMEM;
>>         memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>> +#ifdef CONFIG_AMD_PMF_DEBUG
>> +    print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1,
>> dev->policy_buf,
>> +                 dev->policy_sz, false);
>> +#endif
>>     #ifdef CONFIG_AMD_PMF_DEBUG
>>       if (pb_side_load)
> 
> It looks like you can combine the two #ifdef from the previous patches.

Thank you, I have addressed this in v2.

Thanks,
Shyam

