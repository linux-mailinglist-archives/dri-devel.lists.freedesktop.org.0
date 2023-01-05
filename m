Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E865E52C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 06:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F4610E6AE;
	Thu,  5 Jan 2023 05:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D6310E6AC;
 Thu,  5 Jan 2023 05:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8h0Jch7DyPl0xQJt14maV15L3VVQ/udaT1+OSAjlJrzJCK+912lFwurWTmtpMTIdjEkh8xICWfJwV1xVz50gAMlIlAmGoS8BIBQX7xz2OqbJCYjFnenneOoAxxqU/+kTRH0CzXOAkQ0an0O21Nqjh8Udr3KRls4Z5xZpERYNuwBdTdtesymoLGAdYU2SKqX7X4NMlm6Z3bmqvu6LLOTnWe96uYtgieSHVXozXQti7eyPcumoLy6FezaCv8IKJ2kHy+FUiP5ayx6Qwo+erGaPntTBvXxH0xyYMWCBFM5qS6pTumcoFvpch/8ZZyIt2y1HpW754reDxwhcVbLa2/DOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ql8TlC9oYwRY5ikeD/kPYPQJBq4QNt3v3yivASV7fuk=;
 b=U2wXK7W6HCGcThK22xA6xUy21M9WfMC1d7M2pyVHUhbqvm4diBS44vA3+2MwmeTfozE0Thjf7vJjcPtNKZnPOR5pcmK+KKV1UaogePwcDbOm2oRIMtWaL623yXf9N+QMnUznMCMF9kjsq1PR80PUI7QmY/xYj1/zeXO8xHV/AbAxkgJeqZeadGvjJUKU1rB+9V6fqW1Pz3rfum/zIywsXAusqpqBs0DF/arDPIzW5mMP5NdRPefuov01TEL7eLn24XJqhU3YAQjaoiOkYYA+SMYzBaW34KvrR4po2xJwsppZXhRvAzBWAYEf9O4RLahzTvohZLuZfh2EZGpqQ5pHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ql8TlC9oYwRY5ikeD/kPYPQJBq4QNt3v3yivASV7fuk=;
 b=Mvx5kF0yQfkEGnKBSuts9P0wc9Gu1EnedEWQ8KyHljokA70IPkCf1cj6popTLjNo2dkBNkMgCoxa/baKxvLbtmH3/She3xpLqLuDyouJuJ83g97CgcOLxIyScuA24C53nPPzKoZVGRO0QyaHVRuChZkmbML5UfBgF+wDQbbapSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 05:37:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 05:37:38 +0000
Message-ID: <1cc650c7-3bdb-6571-ee79-3bcd7affafc5@amd.com>
Date: Wed, 4 Jan 2023 23:37:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v6 05/45] drm/amd: Add a new helper for loading/validating
 microcode
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230105034327.1439-1-mario.limonciello@amd.com>
 <20230105034327.1439-6-mario.limonciello@amd.com>
 <804491f0-6e83-dae5-f108-f80950838a52@amd.com>
 <b3304913-e6f4-3f87-e4f9-b31374682d2a@amd.com>
 <d227e106-1766-c51e-397d-209c1f880a65@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d227e106-1766-c51e-397d-209c1f880a65@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:806:121::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: cefd26ef-d6b9-481f-364f-08daeedef490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfJzrp2VNHTMGkWDW2rrEU913jCCTLKL1XYnNLl43L+duQcTOjULMeDhejlAArKM2C/CQUyAzZtWJH7um+TEchmofEoAeeY9oUqeYFCWYdXR4R9pBSe4e4dKlN8mFbOapgKzmNmL4dsBtzV8z/hS/sx/RKkafLwjfdo7EY8rF9ogxmo89N6f/+QGuw2F8SvmDMwtED/X+zOsCXhE6QUvlx8ob/OIN/D7LKuD0Q3bzvcDlJ/7bBgOLE3XmBOkCdlQ59zOGIi8XIkHwEBYe+u8g/YXNyIAuJDvCPi0xxxCJeP2QMUQC/mBwnGdM5NxvBGUVx3Uaa7nNQ0pQw/SgJ3FTNOkmtHdaTHpSjOxHgWSOWioawzMBnffl0t7b9BRNnPyo2jhn6aXbUf+iJY3Yp50h3PVfkjvjpTO+y5YZNlM5XG66EnoG4t3q6NBDgxENo1MqD2YsF/N0o4GQwsUmuBNodTlNuyBEj/LCF0Ke7ts1N8nzscji1pnM4fxNnsYCOzqi0i9iKf9U0ZsDp2P7I9w4xEXFSubwxvkzd7fpe4DZpAzS0Jf8VNGCnp6xASuVsenAH0d15u7T/sEf7QKSd3w80VgyZRPxwdDXmdqGJhr0ThAkjbOBcSDRBvlUR1eXqNb8+ef7cerVd4LxaVdC1uvv4e37SjaU8imvlnbnegaslySiw9rDl0i/hmD0a/MC/sDYlK0IgbylAgt3mHdeTsuxjnp0uTV7U2GsNeBEV2/bypiWlMElvA6wPfIvW4PBCQ3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199015)(6512007)(54906003)(6666004)(53546011)(316002)(110136005)(8676002)(186003)(478600001)(66946007)(2616005)(66556008)(66476007)(4326008)(38100700002)(31686004)(6486002)(6506007)(41300700001)(8936002)(83380400001)(5660300002)(44832011)(2906002)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEVKR0JSMWtUNjg4eDNVdXcxVHgyUmw3Y1ZyeTdtWGY5ZnlUK3pCeVdjWjE1?=
 =?utf-8?B?UkxRUWtYcWFObldJSWhiZmtVQnN4YXpNREIvZ2FlSW9rSEU0eXRpbEIwYkJm?=
 =?utf-8?B?clZ3cTdMSXBIYmxrcGE1ZU04bzNDM2MvYXc0TzVqSUdGWVpTT21EdFJRM1Yw?=
 =?utf-8?B?cTVxYVhtVTdHL0poQ2xLREZTRjMweGFwUFdaUlJCUW9OMGZmdHRNL2FGMkhm?=
 =?utf-8?B?aHF1bnUvcW9JYjIwR3ZQWUpQZXZ4Uzc2YUV4MU1UckZGbjVwUnF1eDF0T1JW?=
 =?utf-8?B?MzJNR0VtbzNSWXFOZ2thaHhrWmZFdGhGUFIzdHVjeXUyb2lQazQySnhXLzNx?=
 =?utf-8?B?Wm0xaWUwU2VMNGl3Z1ZiSmFDQWt3aW9zSzlOY0ppUlpzb3dUODFTTzAzbm1x?=
 =?utf-8?B?KzFhcU96RzN5M3VISkZRMnB2QnVzNlhBME5uaUVqK09sZ3Zxb3U2aWNzVVBk?=
 =?utf-8?B?aVl4am5sQms0M2JlUWFFZFZLbzltZ3N3VGIrMEdWQlBhcWZIcXhUTTN2blNP?=
 =?utf-8?B?eUE0NWhQaDdQR3RJSmt3NEFRT2pxeUNUaTFPb2ZCMHdzUHJzNUhlLzJTTk9p?=
 =?utf-8?B?NkZRWHdobzgrMG5GUHpZRUZsekI1NExCcGtKMjdOdjB4R20wQTJMd0VCb3cw?=
 =?utf-8?B?aWR5QnB5L1ZHRGFOTU5GM0pINUpNejkwSGFxUFc0OXFBaCsxTENyRnlhZTNQ?=
 =?utf-8?B?L3duNHhJSU1LbUdwY2ROVUljT0F1b0xFb2cyZEw0b0NBejYvaHplU1JaTVRp?=
 =?utf-8?B?bVBsVG01dDBvNTJZTGMrSk9pVit3ZU8xTS8xMmZ2SWRiTVFXOTBMMGtQVXJT?=
 =?utf-8?B?YndxS3ZDaXdWSGJUaGR4Um0yRk95VFo2WUZ4ekc4T3pCVmUvUXRvR1h0Z3BS?=
 =?utf-8?B?SVgrQzdyUUdxWS9PeFdoNVRqc2l5SHplQ3hQOVJrY01sT2FxMldWTlNFalU4?=
 =?utf-8?B?aGluelNsRWlXQW96cW1LSzkzdnRUcE5XUWZIanVrc25ZQW1TL01UN3VmeWZC?=
 =?utf-8?B?SFdZYVJBNXVCR29TZGtkaktmTHNJNUhBbEZYeE5CTEpCRzJNbkJnakF4Z1VO?=
 =?utf-8?B?M21qcUp4c3Nxc256Q1FpUWlDT1ExZWpaZ1FIY1o3U0h1MU9ZZ1IwbXBTWTZx?=
 =?utf-8?B?SG1TeW00djBzb2NLM1BjeW0xLytoTkJmTGNTQVNsL3ZESmJkYVAvNlEvbVFk?=
 =?utf-8?B?dEpLY0tvdlFwYVp0VWRnTUNhTGFwT0dpbytoZWhpM1ZpamJvQ0orcVU4aFVr?=
 =?utf-8?B?Q0RqQXVsWVpGNStQQVhRUTdpMlp0SndjWHNuc2thZmpxa2FHc0d1bHRaQ3ZQ?=
 =?utf-8?B?N2hPa3RQYWI2cEdnMVM1ZmVMamdPaVYvTWtIbXFyb21UZ1g3RkJtVVF2b2tL?=
 =?utf-8?B?SitoQ2lTRXhMMEFnaHFPY1JZQ2ZjSzdRcmtPNnlBRGZuOW5SNFZ5M2ZrTXRx?=
 =?utf-8?B?K0VrOFdzZVZ1bFJ2dk5pR3lQUm1aMDhEVmN3ZEFYY21XSnEycmN6NzdPVmNG?=
 =?utf-8?B?RExWd1hYSWNJTkJTdXdLWUg3K3pWMGNzM0d1TmtrLzNlYk1ueW9OK2R2VEx4?=
 =?utf-8?B?L2cwZ1ZqNUF0YWNrNCtwS1EzRks5ZjZNUjd6NUt1cjRLSlBoYkliTzRMVUFx?=
 =?utf-8?B?TWUyNkM4c1pvbkZIbm5OdWFCREtaUW9uYWNDU2JYUVdUcGpkdXRGdU5VUTFl?=
 =?utf-8?B?bS9DZWU5QVl4c3VlTlcvUStMVGl4S2htNjVGSHFrOHJmMXRaTGluUXhnOEJk?=
 =?utf-8?B?S3NxZENpanEzTnl4elYzNFAxZkRma3N5Wmx6NWsvQlJnTDJERWI1anFkMm5m?=
 =?utf-8?B?OVdLZ3hJZ3E5OHczeXh3bGs2WG1CaStzdkZYZE8vUkp1Ky9ESWFjaUJjOUp1?=
 =?utf-8?B?MHFPQ25wNmtySFhhT05HRkpjREY2L2hGWlZhM29tMDhFTWlFZng1dDRyQXlk?=
 =?utf-8?B?NmhpVmVrQVdHU2IvNk5oeU9DTlpGRUhYSTFUb3lxdVhYNHlTT2JxUkNsVGFJ?=
 =?utf-8?B?cFlUWHl1OTBuUEx1RXNuOXRHbW9JQXdVWjQ3M1dNMnl6QWJqeHZNaVlMV1FX?=
 =?utf-8?B?K1BZVTI2N0hKSkZxQlkzRDNPZGFIaHAxd2Q2S29uMmc1NUc1N2VJVE1DQVdw?=
 =?utf-8?B?ODhMNm5Oc3R2Rlh0djdyZENyLzl4R3hRcXdvZVVHY1JRaGh5aERscXdQM3hq?=
 =?utf-8?Q?OBg3kbVp0vFiHK0BbFEYI6F4ukpoF4COUuaOj5aoK0xp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefd26ef-d6b9-481f-364f-08daeedef490
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 05:37:38.0838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCRrnC94Yx8DjrVbKwhyphtm6tfsucJtzgtk6LQ17ebFTsbnoqfWq4AUeNPqdhvJ+tFqoQeUnDMQP0llfC8xzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/4/23 23:29, Lazar, Lijo wrote:
> 
> 
> On 1/5/2023 10:53 AM, Mario Limonciello wrote:
>> On 1/4/23 23:07, Lazar, Lijo wrote:
>>>
>>>
>>> On 1/5/2023 9:12 AM, Mario Limonciello wrote:
>>>> All microcode runs a basic validation after it's been loaded. Each
>>>> IP block as part of init will run both.
>>>>
>>>> Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
>>>> This wrapper will also remap any error codes from request_firmware
>>>> to -ENODEV.  This is so that early_init will fail if firmware couldn't
>>>> be loaded instead of the IP block being disabled.
>>>>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>> v5->v6:
>>>>   * Fix argument to be ** not *
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 36 
>>>> +++++++++++++++++++++++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  3 ++
>>>>   2 files changed, 39 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>>> index eafcddce58d3..8ebfec12da87 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>>> @@ -1312,3 +1312,39 @@ void amdgpu_ucode_ip_version_decode(struct 
>>>> amdgpu_device *adev, int block_type,
>>>>       snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, 
>>>> rev);
>>>>   }
>>>> +
>>>> +/*
>>>> + * amdgpu_ucode_request - Fetch and validate amdgpu microcode
>>>> + *
>>>> + * @adev: amdgpu device
>>>> + * @fw: pointer to load firmware to
>>>> + * @fw_name: firmware to load
>>>> + *
>>>> + * This is a helper that will use request_firmware and 
>>>> amdgpu_ucode_validate
>>>> + * to load and run basic validation on firmware. If the load fails, 
>>>> remap
>>>> + * the error code to -ENODEV, so that early_init functions will 
>>>> fail to load.
>>>> + */
>>>> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct 
>>>> firmware **fw,
>>>> +             const char *fw_name)
>>>> +{
>>>> +    int err = request_firmware(fw, fw_name, adev->dev);
>>>> +
>>>> +    if (err)
>>>> +        return -ENODEV;
>>>> +    err = amdgpu_ucode_validate(*fw);
>>>> +    if (err)
>>>> +        dev_dbg(adev->dev, "\"%s\" failed to validate\n", fw_name);
>>>> +
>>>
>>> Missed this earlier. If validate fails, shouldn't this undo the 
>>> request operation by calling release?
>>
>> Actually that was original design, but there is one place in the 
>> codebase that expects that ucode validation can fail, and so leave the 
>> evaluate of error code and cleanup outside of helper.
>>
> 
> I see. Does request_firmware assure that fw pointer be always NULL if it 
> fails? Or should that be done here if request_ fails? In subsequent 
> patches, I see clients calling release without checking what caused the 
> failure.

Yes, according to docs 
(https://docs.kernel.org/next/driver-api/firmware/request_firmware.html#request-firmware-api-expected-driver-use)

> 
> Thanks,
> Lijo
> 
>>>
>>> Thanks,
>>> Lijo
>>>
>>>> +    return err;
>>>> +}
>>>> +
>>>> +/*
>>>> + * amdgpu_ucode_release - Release firmware microcode
>>>> + *
>>>> + * @fw: pointer to firmware to release
>>>> + */
>>>> +void amdgpu_ucode_release(const struct firmware **fw)
>>>> +{
>>>> +    release_firmware(*fw);
>>>> +    *fw = NULL;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>>>> index 552e06929229..848579d4988b 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>>>> @@ -544,6 +544,9 @@ void amdgpu_ucode_print_sdma_hdr(const struct 
>>>> common_firmware_header *hdr);
>>>>   void amdgpu_ucode_print_psp_hdr(const struct 
>>>> common_firmware_header *hdr);
>>>>   void amdgpu_ucode_print_gpu_info_hdr(const struct 
>>>> common_firmware_header *hdr);
>>>>   int amdgpu_ucode_validate(const struct firmware *fw);
>>>> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct 
>>>> firmware **fw,
>>>> +             const char *fw_name);
>>>> +void amdgpu_ucode_release(const struct firmware **fw);
>>>>   bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
>>>>                   uint16_t hdr_major, uint16_t hdr_minor);
>>

