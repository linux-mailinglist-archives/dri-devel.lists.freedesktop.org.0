Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B057ADD1B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4884710E2A2;
	Mon, 25 Sep 2023 16:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D6A10E296;
 Mon, 25 Sep 2023 16:30:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQxQuvlpLVXl1jwkigCVBdHFabs6QMIPh2fo+OAuUKPhO4jZto1pF0z9aSmBdexCDOhnZ9NzXouEGofa0EnhKnIHR5xwTYH0bZ365SuEz/mBqEvY443JDCRfxrN4RwBqX3d433qSSTKMezPLErX6zz7N6bAwPZidlfP37iyLTgzi4MiOu/h2S7VTQn8TMslI0KnmzLQyqbITkeHF2JJIK0Adprm+6zun6zS6pkd5nXmvqZjZ+rdEqWTsgPtXtjr603XjLCeXh4pvo7osq/AdCj/dg/nEPQfU0Y5APWlS0vdjT7H5M+RJAsUVOJ5aC1ixl/tWMkBg5aiW69xrTfbqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZSH5E8lULsftvE4Fo6Z3jyMHvTJL77iNYw7tLCeFkU=;
 b=Qvyu3oYsLgH4U2obSIv644tmfuMrSefNsbxiuiQWRT9tpvNjW1qdLjUfxpWxun7Qs7tfnoGVf5SlgGAJhflAFbul4JPEKnX2KJnnERhgY33TUVoGSigWI7J/ILVmmV2KueHhoHyJkaiejdnDxdD9SvLJOGyrcfrMBPbkKzFm2rMfSIfq5WEaatDHELx6CPtxqmh23yWjXTeoqSNpHBSKrHXUeTdoysMFLbuQ8z5J/O3PaYTJKvoHBa7eL+E8wjGTIymGKUgUHuv2jF+3x9WwS8EXkT0fa8s5256sW/GT/fZ6Dn/HIjsWOAhUtU1dvdCKplsmcj4vkBZC8+G9m6bXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZSH5E8lULsftvE4Fo6Z3jyMHvTJL77iNYw7tLCeFkU=;
 b=f8XsxH6xhJuawskMUKkFCEVvweGVpJgenWKOWtYK5NctBB9mmC2w+7rxG4Hv2StUest7AgOx0DhfVguUqeFgllN2uRGW1eknOZii1TbzxcUOCDSLl1zkwneTDcesaLNsiTP3oeenHMPfHbOhRi9AFvq+MS5LcSLA65clnLDJId4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7586.namprd12.prod.outlook.com (2603:10b6:930:99::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 16:30:20 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 16:30:20 +0000
Message-ID: <0ad32609-d47b-4114-8c51-09e96d7737f2@amd.com>
Date: Mon, 25 Sep 2023 11:30:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Content-Language: en-US
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "markgross@kernel.org" <markgross@kernel.org>,
 "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
 "jikos@kernel.org" <jikos@kernel.org>,
 "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <BL1PR12MB51442D18C314B1E34B77DE2BF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <BL1PR12MB51442D18C314B1E34B77DE2BF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0034.namprd05.prod.outlook.com
 (2603:10b6:803:40::47) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e739db-491c-4860-97c3-08dbbde4b590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAeTdorgonUNJ6tUT4GpsPDehLoK5PPbQdxwg8VePVKgZsganYsFJ67orAp0EIcmyqtsN54yaD7V7TNZvraM/6E4c8tOO65i53UwCCICa6WSCe3I27X/Y1Hpfo/GuDJhqr4fragsX3AvUYzAE2tnI9YL9vbfE/rY5BhGXTDBmDxKfJm9qJABHnQg108rEY6K1qD0fDT6ZtUwnSAgg1hHTgCMcB5jLc6sfvguaHPuftyCXuatMKFOMSx9lF9hGu3dxBloFxp9C9ZXPYE1NnuLe0hf0VZZt9RAmpJ1iPLUxTWkg7ad4fEPOz6yZ5nO3Nq/hAtCNsiPlf59uJwlj5eAAymS+NtQ1e41G9VQdBjUaBMfF0vhPryssbz3HKPsRLms/H55+Dgm8DN3AN37UDIUcO60Mz4ovLS8SqFhf+avyEhIIPh9G2MnX9gSnDDf5OY4cBWw0NY77/T3pchQ4GtbuqK2N/TFm0QYQQr6Mb2Y2V7tBmGSmINcq5EkFRM4aQ1R/lRLMoVfGSkNflAE8T1BGDtyDbOxXAkod01hKDP8Imv0zo0CIJLeKN7hQ5HDtciI39h1vy5wOWZ3gEBA+iix68agPhn+3VyhOvm7oMhxYY1VGTDEzcd2MOIdVzyICIcxntNs3gAfP4V4aSXITAwTX1tL5yagV8CYEqTTnWzDpxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(53546011)(316002)(66556008)(66946007)(54906003)(83380400001)(6512007)(6486002)(6666004)(6506007)(66476007)(26005)(921005)(36756003)(31686004)(2616005)(478600001)(5660300002)(2906002)(110136005)(31696002)(38100700002)(8936002)(4326008)(8676002)(86362001)(44832011)(7416002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWx1Mk9Nam5vNGV1RTBja29kNlBGWTNYMnZ4VUtTU0t3NlRyWFZjQ3dBenBH?=
 =?utf-8?B?RlhHeGovVmNtb0wxWHY5djg5a3ovUzlOZjRDQTBnaWs5ajFxaUpZNTl5Q0th?=
 =?utf-8?B?RmJoNTcvYmRvSDA3My9vdUloVUhuYjNsa2lhdElHN3Vxb0V5cWVRMHdycDFZ?=
 =?utf-8?B?c0tHQ2FIVTVuQjBoY1d0Ly9nNHc4TDV4TUVITWZOYjVXa0J4MGhFNi9WbUxJ?=
 =?utf-8?B?UGVvcFo0UUZZeFlRbll6VEVkc1VERGx4amtjM0xRWUFESkZicHZEMFpDMDh1?=
 =?utf-8?B?WG8vRTFpL0tGN1djaElrUTlhemlkeHR4emx1MmtRZUc0WGVkUzFQR1pQTENr?=
 =?utf-8?B?eTg0SmpwQWVaQnpnbTErUEcwSW5RUXF3b3RxZmlXU21lSWRlZEkwRnFsaExm?=
 =?utf-8?B?V0FuWjZtNjY1WklQL2lWSTB3SzFkaGN2d3B4YXF3QXA3S3hnWGtLSDdHR1NN?=
 =?utf-8?B?YTBZQzNWajdmdUUxT29FUm9MTk95dG1naXJ2emo0aXF4Y2tRckUxbHcrd2hj?=
 =?utf-8?B?RE1EczM5TjdmTUJXWkJObmJWdUk4NHZvMzd0M2ord3lEblM0aWx1OVJHZ3VM?=
 =?utf-8?B?dmJtMVBBemlOaXRWK3RTa29HMUNuZW1pV3gxaHlnMldHQXdSdDVpQzV4Rzhq?=
 =?utf-8?B?VUJZZzNXMDkzVzMrMFo0WTdxcDBJV2xVODNiZ2IrSk1Od3NSRk9NRWZsS1dM?=
 =?utf-8?B?VTI3aXlhRWhCTXMvUjZWS3JxUmtMQzF5enJiaFl0d0tlTHhQbWZCejFiRXll?=
 =?utf-8?B?c09PclZ4anpkNWNUZm9jT1pXZjRvTVlFTHJZYlhzYmtpalFNdXFGdHZ3VUxN?=
 =?utf-8?B?VVBwTFBySWYvaDlyajQrbmVVSE4xNVozVWMyTmNRYmNqVFNGQmUySXdhd2Nm?=
 =?utf-8?B?SEFSUmh5Ylo1c1ZVeUxsY3pKU1hWYnNyTjEva3dnSlg1ejNKT3VsNGFsSzdT?=
 =?utf-8?B?Z2xETEd6WFhIWnVncmZRVmZLeDQ1MDExQzR5L241cTVUd3VKQWE4ZHJ0bUtr?=
 =?utf-8?B?S3J4Z2pURFMrT01ZdEdKckJoRnorOGV5ZVFNSFZ3ZE5lY3dJM3JFLzRBa05Y?=
 =?utf-8?B?UlNSY250WmhFbmgyUnRJTWU4Z3lmMHhCRmZzbUJhdjY1UEpuR05ybWpqWWw5?=
 =?utf-8?B?WmRoSG51bXB1di84bHVlaHdBbXFaM0FhT29jWTdQWFByWURkOWJBVmJTV3d5?=
 =?utf-8?B?SUFXY2pTcnJmVDlXZUdWYTNIRWMwWFBvZmZkV1c4NVZmd2ZpckpiRHUwdTA0?=
 =?utf-8?B?RGgvajkxOEx4MmdYaEIwR0VJSDR4MUp3bnc2bytaNVNNdTE4TCtZSEVQMUVE?=
 =?utf-8?B?a3JHd3grTEJWVHJ0M2Qra1RNZjliTkJkNlVxL2RRcXBKeG1pSEd1TXdLNzdl?=
 =?utf-8?B?TnpzRlY2RHRnT1cySVhSL2Y3VVZmUVVYYitncjM5YWhNbUovTHYzTGFTMFdm?=
 =?utf-8?B?ZWlINklMN0E0YjZZc1VtSXJ4L1Rpa1pobU9lQnU1eEtCNHpwNnl6WkN5U2Zz?=
 =?utf-8?B?YkhWSGlER2tQS2pYaWNibEc0enRFVVZzSGUzUGhwbC9wZFRId0RZVzQ1LzdS?=
 =?utf-8?B?U1J0RjZpeU5VWEJJOGVhcCtDYTd4S2c1Sjg2WkRQbGJCS3ZlMHpaZ0NNdEJF?=
 =?utf-8?B?SmpHclV1Z0N5QlpmbFZpL1lpVW5wTUJTM2hVcWQyV0wyL0I0MGZ5ZW1KS2No?=
 =?utf-8?B?WFhUNWhGQ2xOb2dieUY2V3BTeXNnNnd1YzhvS1VUV3VwR2JCN2c0cmMwQXpM?=
 =?utf-8?B?MExmdTRtREFOUGdvTjMvSUl4SVk2cTh3MytrU2h0eXA3NDRxa3g4MUlyUERD?=
 =?utf-8?B?Z3Nla3p0bmFYRWVVM1NVV0VMeW9wR1l4Rnp2Ny85TlhmNG1zQS9sdFJKbThn?=
 =?utf-8?B?VEJ2UW5yY3BEc0hCaWJxaHR0OEhxd2xXZUpXMVdJRXJFeC9HN1hsNTlmOThK?=
 =?utf-8?B?OTAyRHFoR1ZYRXl5TnpYK1NVWGRzbWp4WWRpejlDalR2L1ltVytBMDZ6Qjgw?=
 =?utf-8?B?Mng0UnBKUTV2ZEdHdDlKSkxJaHF5QzdvU1Z3TW10akhObEdMUEZ0bEtXR0Ni?=
 =?utf-8?B?ekx0RzlDNGd4c3lNWU01ZjI5RlROM2VGWHVQOGVxWXBnU3V5RHJKckhiMW9R?=
 =?utf-8?Q?Au53J7Px9jwtJuBWrHB3K4RPg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e739db-491c-4860-97c3-08dbbde4b590
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 16:30:20.0964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqyvR3e8fJ1Vd4Xqv/u46/n2IJhDL2kWVEElBi/2QV24gjoD+9y0sOAE5RuVb38Uc2fpQjF9K4ADcsIVqYtZdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7586
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
Cc: Patil Rajesh <Patil.Reddy@amd.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/25/2023 11:27, Deucher, Alexander wrote:
> [Public]
> 
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Shyam Sundar S K
>> Sent: Friday, September 22, 2023 1:51 PM
>> To: hdegoede@redhat.com; markgross@kernel.org; Natikar, Basavaraj
>> <Basavaraj.Natikar@amd.com>; jikos@kernel.org;
>> benjamin.tissoires@redhat.com; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> airlied@gmail.com; daniel@ffwll.ch
>> Cc: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; amd-
>> gfx@lists.freedesktop.org; platform-driver-x86@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; Patil Rajesh <Patil.Reddy@amd.com>; linux-
>> input@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>
>> Subject: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set
>> interface
>>
>> For the Smart PC Solution to fully work, it has to enact to the actions coming
>> from TA. Add the initial code path for set interface to AMDGPU.
> 
> This seems to be limited to backlight at this point.  What does setting or not setting the backlight level mean for the system when this framework is in place?  What if a user manually changes the backlight level?  Additional comments below.
> 

It's also for the display count.

>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21
>> +++++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>   drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>   include/linux/amd-pmf-io.h              |  1 +
>>   4 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> index 232d11833ddc..5c567bff0548 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data
>> *pmf)
>>        return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>> +
>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf) {
>> +     struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>> +     struct amdgpu_device *adev = drm_to_adev(drm_dev);
>> +     struct backlight_device *bd;
>> +
>> +     if (!(adev->flags & AMD_IS_APU)) {
>> +             DRM_ERROR("PMF-AMDGPU interface not supported\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +     if (!bd)
>> +             return -ENODEV;
>> +
>> +     backlight_device_set_brightness(bd, pmf->brightness);
>> +
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>> b/drivers/platform/x86/amd/pmf/pmf.h
>> index 9032df4ba48a..ce89cc0daa5a 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -73,6 +73,7 @@
>>   #define PMF_POLICY_STT_SKINTEMP_APU                          7
>>   #define PMF_POLICY_STT_SKINTEMP_HS2                          8
>>   #define PMF_POLICY_SYSTEM_STATE                                      9
>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS                                12
>>   #define PMF_POLICY_P3T                                               38
>>
>>   /* TA macros */
>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {  };
>>
>>   struct pmf_action_table {
>> +     unsigned long display_brightness;
>>        enum system_state system_state;
>>        unsigned long spl; /* in mW */
>>        unsigned long sppt; /* in mW */
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>> b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 1608996654e8..eefffff83a4c 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct
>> amd_pmf_dev *dev, u16 event)
>>        return 0;
>>   }
>>
>> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
>> ta_pmf_enact_result *out)
>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
>> +ta_pmf_enact_result *out)
>>   {
>>        u32 val, event = 0;
>> -     int idx;
>> +     int idx, ret;
>>
>>        for (idx = 0; idx < out->actions_count; idx++) {
>>                val = out->actions_list[idx].value;
>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct
>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>                                dev->prev_data->system_state = 0;
>>                        }
>>                        break;
>> +
>> +             case PMF_POLICY_DISPLAY_BRIGHTNESS:
>> +                     ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>> +                     if (ret)
>> +                             return ret;
>> +
>> +                     dev->prev_data->display_brightness = dev-
>>> gfx_data.brightness;
> 
> Are we using standardized units for the brightness?  On the GPU side, we align with the standard blacklight interface, but internally, the driver has to convert units depending on the type of backlight controller used on the platform.  Presumably PMF does something similar?
> 
> Alex
> 
>> +                     if (dev->prev_data->display_brightness != val) {
>> +                             dev->gfx_data.brightness = val;
>> +                             amd_pmf_set_gfx_data(&dev->gfx_data);
>> +                             dev_dbg(dev->dev, "update
>> DISPLAY_BRIGHTNESS : %d\n", val);
>> +                     }
>> +                     break;
>>                }
>>        }
>> +
>> +     return 0;
>>   }
>>
>>   static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev) diff --git
>> a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h index
>> a2d4af231362..ecae387ddaa6 100644
>> --- a/include/linux/amd-pmf-io.h
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {  };
>>
>>   int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>   #endif
>> --
>> 2.25.1
> 

