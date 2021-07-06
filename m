Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB473BDA3F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 17:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75D96E503;
	Tue,  6 Jul 2021 15:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7916E503;
 Tue,  6 Jul 2021 15:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceW23S2ouDUQz82lVZN89OgaZnV4TAs7SMyT6xP3pBQ2cVBG7LCQehdEo464GhfnX5ChV3LS76Gjd0c5deWwSNLnXgnjJRt8T4vnqlIkL0WbBWLIGYbFcLtxX12QmH8zsl7w76S/pFYdKC3j4K47nSo28fzxAttpEcW+B7CPdMZmoCpqeJqSlY3+zSAkthe076Uvuid/pf5VeclNesaR8AQww7djiAjIW7OTNeSvoFluy36WBLxzWLXgQod96mK6Q+3Mz8fM1CK5iT1amMupxNe/+FVu7/AeMYYxO7sCvN90i5zCmrDsv4jPd8dzJHqVraOgYXXoBq/vpvOLI3ItYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53nHl2JkfKrRM7k0z1yxUXsAW64q2OcTYSNNbJDqFwU=;
 b=GucKU263PXlYYUPSWNP+VMe2reU1ZlIR2VzF/AK7PbXRgXCiL5RzHDopADiDuBKJMYDPBrycf08FpCamYT6aijOUnygEBAVgkL54WPfCZBXqfp/wxPEUn5nI4dVbUbCn5KjwRDO+FS7mHm6AXaYqm1gHSJ0T8Q8QHwmD7yIb75mAx/X2I4vJiwjIk8XOvQc0HIJSFfptD8XJs5xAUnLvoqvK/BkUm9k9HfzJDFscda3ALs+H5D7woKGmcJjtVs/riU5e8LvTKzyJq5uJAaiNHiJ3SJExccnEGK1cs9LJUcD32e1A9JQaqP1V0YUhhNl0NNVRxLrV8s8WZy5MODGZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53nHl2JkfKrRM7k0z1yxUXsAW64q2OcTYSNNbJDqFwU=;
 b=1hii8t7t6YE/SH+veqGfMstVP4UGIUDsSHM82xMXkzUX1LGNnMcITTsFUYlp4FCq827I6oySHcFW8UTcb7mp32vboaDR622y7elDDzruscXWSvqEPhpIT38Ay/g+CNkMTPP7eZa5HSEaE7DDt8wlwi3C47cebsRO8I6loJnilcc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR1201MB0025.namprd12.prod.outlook.com (2603:10b6:4:53::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 15:32:32 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257%4]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 15:32:32 +0000
Subject: Re: [PATCH] drm/amdgpu: Return error if no RAS
To: Alex Deucher <alexdeucher@gmail.com>
References: <a836cafa-86a9-3d72-1f02-f9f2d58ee127@amd.com>
 <20210702230455.31196-1-luben.tuikov@amd.com>
 <CADnq5_MMc0b6Cy+A46oqa1Pdy=GFZjFmC8NqJK=rOV6B-Ba7aQ@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <de96672d-0b0c-869a-1d9b-072fb4b1fd60@amd.com>
Date: Tue, 6 Jul 2021 11:32:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CADnq5_MMc0b6Cy+A46oqa1Pdy=GFZjFmC8NqJK=rOV6B-Ba7aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
X-ClientProxiedBy: YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37)
 To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.84.11) by
 YT1PR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 6 Jul 2021 15:32:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50e8b980-91a5-4371-c294-08d94093458b
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0025FE0A910CEB3722F237AF991B9@DM5PR1201MB0025.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /BaoyzbQiVnVRra6M2CpLD4NBut4T+VV1VluK39v1/Qq17RwY5H2bxvbVtG8hzFc5mNhM8GHyXhylPDA0AEHkLjUFMY3TMjXp7K+1SL3Qv0s1FY1OO1Qdx0VwIu9cD554OaVTPAF0WAPXXPqtB0rzTARFNkLwpoPfaX0PsdqXZp1k52qt/QjzNEWKkb463kh29fYnt9umxDZmMo5X0+68QzNQqJErGhKOK7rpwZ/BF6yc6krZXbSZpJZ4whyLNirfBrmFh2j3634LQliB5GQn0LP8Jdos+XVj+pvEl3i04Ae1q67Wa9nlPrucbUqBQbkFfIiTJ/t25+5YapB6+cg/FY4M2qvZrotDvhy/IEHZohxxnzBEJEp8f6riy4UGDLkfZaog0EJGS/64tX8xImxY92shVaYwQVpUyGk4yRvC2xYHhlwPgM/f3/BnkkAPFzQyhLmtLe93yGeAo37InK0A4h84C1DcYJeQhjUhId1k8QqqTlMtIphJY2E3F/Pz0fCtPwSdkJRFxFqQAZaQ6cRcYScNon629RIbGekdD1hZHfilibTE6pFX3hL5Olqzs7PdKlgCJ7hrY4Q3Aq+Qqqac511if/lSUSN51h1mlU3SufuVEPrgYetuzWv5DcSvyEnJH0gztQHIDcU1Skp6LwvviF2ViOFPGH/pc6JH7xUL6KuxBBMmWMfM4BcwhjMCB/gtyoeLuvU+4aG/24cmLXRWU2JhZ34YHOnjeoc4s0AhmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(66476007)(66556008)(6512007)(316002)(38100700002)(2616005)(186003)(6916009)(86362001)(54906003)(478600001)(36756003)(66946007)(44832011)(6486002)(4326008)(956004)(2906002)(45080400002)(83380400001)(966005)(8676002)(26005)(53546011)(6506007)(8936002)(31696002)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek0xMHcycHU2YmV2RU5icCtnNk52UWZlMVo2QWxUT3AxNXdWazB4aG1ZaFg1?=
 =?utf-8?B?WGpBdGI0T0QrRUFiMHZvZjY0ODEzcGFpTitQNVprTkxOa0pVY2RnTGFiUGYr?=
 =?utf-8?B?dmM5R24xV2NOMDVGTEUzWXY5bGc2NmRzaDRCSXhFSW95N3kvMm9iMkhRQmJr?=
 =?utf-8?B?UVdsWWFmYVVrTk9wYXlyVTlXVkU2STdXb3VQNG0zRjkxL2k0UlR0MUxtREk5?=
 =?utf-8?B?UkVWRE1zSStqYzI3MXZzMGJmeEd0SEZVeDl3aE9lM1gyN2J6SUF1VXZyS3oy?=
 =?utf-8?B?KzNoaFJYRWpHSXAvRXRiN1E2RUwwZGlaQUFBWVBNQkVyaEU2RXFaZnRpQSs1?=
 =?utf-8?B?eXFJQXB1Smt5em54L1lzUGl0OUdaTWx0M1pZQmY2MWVQbTB4TE5NWlRwS2o3?=
 =?utf-8?B?TDRRUUhSSUJ4Qk1JQ1V6dlc0Qjg5d1h5SmZUbnR6R0U2R3c1aUhBZER3Y1E3?=
 =?utf-8?B?YXNueTVBOHhUQ3FmR1VhM0VmNnZEZXNSTk1lT2xNNkQzMXNESTZxY2NHZzNj?=
 =?utf-8?B?R3c0TGdDVE9qdiszRGhGRmJjeTlsNTZ5SlBkdUR6WGtBTDVMRU9sZm5yOGpr?=
 =?utf-8?B?REN1MVdOdEt1aGV6S09VSWVtTzA3bkRwOXBablZNTU5KS2IzOVhpRUJXb1Rp?=
 =?utf-8?B?T0RHRE01djR1QXZEcXduQVFweXJ1dC9OMUpRazdWVkJUTzkybzBid25nbzRp?=
 =?utf-8?B?WlFRWkVaY1JBTEs4TTRNcndUK0h5c1VmeHVpbk1Jblp4VGVHdFVvRnZZeXdS?=
 =?utf-8?B?LzZLVVdWS1poSW54QlF6dTF2T3ZDbmlwZTlrSFVaZ2J2TUhJUzl1aFpHeEw0?=
 =?utf-8?B?Z1hFOVkzZGpCNGExNEsrZ3lSbTE2ZG9tSCszR0kyeThUUWtNN29MSHpqb0di?=
 =?utf-8?B?WDRwbGV1Z1lwRkZKS0lwd1JLOHFRNE50TEk2bDVGTW5yM3ZuY0I1VFFkYi9O?=
 =?utf-8?B?T2dBTGYveUIvMkpDcmdTYUErbGZ3Qk0xUGhFQ3BtWlFkSXN5Qk56M2ZHdEVN?=
 =?utf-8?B?QUtJcVU3SUlaWnA4NWF0S3ZvcTFkNjNWNzNIWmIyKys1Zi9tcEhDNnNlb3Nt?=
 =?utf-8?B?UHF1V2dsU3ZKMCtSQjVXeHBMcXljenU4QlFZTzhpbXprNzNxalRIRjNyLzAv?=
 =?utf-8?B?dnVrRFlRWWI2RGdvVmowbFF2ZG9PYmpFZ1NkK3IrMjdhN0JIZU40aGJlcndt?=
 =?utf-8?B?M2RBa3RZNzJwV2NPRGlXNENaNE1yd3ppa2lsZGw5dERnNStwOFpQRmNxRWhZ?=
 =?utf-8?B?ZmpEV1lybGVlNFN4RnkwVHV1UThKOXBJeG42Z1U1Qlo3Rzh4SUwvS01IZjhC?=
 =?utf-8?B?NmQ5Y3dJN0t2K20wOW15MGgybEhXMlZPVnVmR0ZnQ0NwRTl4UWttN3VaZW9J?=
 =?utf-8?B?Z0MvckNLQ1lwSmN5cURJOFJpNUY1Tk9vZXhMYkU3YW1HMmU1VjVXb3E0b09I?=
 =?utf-8?B?T0IzbGtuL3oxUU82c3VxQThGbEkwR3hMbms0UHE0WlRMcVZDQk9yUmZWbGJs?=
 =?utf-8?B?MlZGY1hETHVWM0RYSUl6WDkxMjZycEVuYVVEYkR0WUpBaENoZnE1Wm52V2la?=
 =?utf-8?B?MHd3bzkzUWpxYmZlRE9HeVN3WVRuTFhiNHhMQWszRkcyd2M4WWcwL2Jzaldp?=
 =?utf-8?B?aFl5d3UyQ2hYNThlNkdFTkVmNFZGWHROdmJuNG9QajhvdjJ4NWxSZzFqMmw4?=
 =?utf-8?B?L3ZyMVYyaVlvRzM0NDdBYndOdVlDZWRXZDB0a2taSWVPQU5XNzM2dU1hOGlh?=
 =?utf-8?Q?kJcN/BpxUGx7gPHD3G3T48NqyUtFrq0zi16UO6s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e8b980-91a5-4371-c294-08d94093458b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:32:32.2332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8KW+sk4qrHdSYN3bqVm+2dhLE5ePw7EeuZbIOwHbpu2X+nLvVjtpsjO4NoNQRRX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0025
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
Cc: "Chen, Guchun" <guchun.chen@amd.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, xinhui pan <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Tom Rix <trix@redhat.com>, Alexander Deucher <Alexander.Deucher@amd.com>,
 John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-06 11:25 a.m., Alex Deucher wrote:
> On Fri, Jul 2, 2021 at 7:05 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>> In amdgpu_ras_query_error_count() return an error
>> if the device doesn't support RAS. This prevents
>> that function from having to always set the values
>> of the integer pointers (if set), and thus
>> prevents function side effects--always to have to
>> set values of integers if integer pointers set,
>> regardless of whether RAS is supported or
>> not--with this change this side effect is
>> mitigated.
>>
>> Also, if no pointers are set, don't count, since
>> we've no way of reporting the counts.
>>
>> Also, give this function a kernel-doc.
>>
>> Cc: Alexander Deucher <Alexander.Deucher@amd.com>
>> Cc: John Clements <john.clements@amd.com>
>> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
>> Reported-by: Tom Rix <trix@redhat.com>
>> Fixes: a46751fbcde505 ("drm/amdgpu: Fix RAS function interface")
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 49 ++++++++++++++++++-------
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h |  6 +--
>>  2 files changed, 38 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> index c6ae63893dbdb2..ed698b2be79023 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
>> @@ -813,7 +813,7 @@ static int amdgpu_ras_enable_all_features(struct amdgpu_device *adev,
>>
>>  /* query/inject/cure begin */
>>  int amdgpu_ras_query_error_status(struct amdgpu_device *adev,
>> -       struct ras_query_if *info)
>> +                                 struct ras_query_if *info)
>>  {
>>         struct ras_manager *obj = amdgpu_ras_find_obj(adev, &info->head);
>>         struct ras_err_data err_data = {0, 0, 0, NULL};
>> @@ -1047,17 +1047,32 @@ int amdgpu_ras_error_inject(struct amdgpu_device *adev,
>>         return ret;
>>  }
>>
>> -/* get the total error counts on all IPs */
>> -void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
>> -                                 unsigned long *ce_count,
>> -                                 unsigned long *ue_count)
>> +/**
>> + * amdgpu_ras_query_error_count -- Get error counts of all IPs
>> + * adev: pointer to AMD GPU device
>> + * ce_count: pointer to an integer to be set to the count of correctible errors.
>> + * ue_count: pointer to an integer to be set to the count of uncorrectible
>> + * errors.
>> + *
>> + * If set, @ce_count or @ue_count, count and return the corresponding
>> + * error counts in those integer pointers. Return 0 if the device
>> + * supports RAS. Return -EINVAL if the device doesn't support RAS.
>> + */
>> +int amdgpu_ras_query_error_count(struct amdgpu_device *adev,
>> +                                unsigned long *ce_count,
>> +                                unsigned long *ue_count)
>>  {
>>         struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
>>         struct ras_manager *obj;
>>         unsigned long ce, ue;
>>
>>         if (!adev->ras_enabled || !con)
>> -               return;
>> +               return -EINVAL;
> Maybe return -ENOTSUPP or -ENODEV here or something like that since
> the device doesn't support RAS in that case?  Other than that, looks
> good to me.
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Okay, great. I thought about -ENODEV but didn't want to confuse the IOCTL/userspace that the device isn't there, so I'll then return -EOPNOTSUPP, add your R-B and push it.

Regards,
Luben

>
> Alex
>
>
>> +
>> +       /* Don't count since no reporting.
>> +        */
>> +       if (!ce_count && !ue_count)
>> +               return 0;
>>
>>         ce = 0;
>>         ue = 0;
>> @@ -1065,9 +1080,11 @@ void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
>>                 struct ras_query_if info = {
>>                         .head = obj->head,
>>                 };
>> +               int res;
>>
>> -               if (amdgpu_ras_query_error_status(adev, &info))
>> -                       return;
>> +               res = amdgpu_ras_query_error_status(adev, &info);
>> +               if (res)
>> +                       return res;
>>
>>                 ce += info.ce_count;
>>                 ue += info.ue_count;
>> @@ -1078,6 +1095,8 @@ void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
>>
>>         if (ue_count)
>>                 *ue_count = ue;
>> +
>> +       return 0;
>>  }
>>  /* query/inject/cure end */
>>
>> @@ -2145,9 +2164,10 @@ static void amdgpu_ras_counte_dw(struct work_struct *work)
>>
>>         /* Cache new values.
>>          */
>> -       amdgpu_ras_query_error_count(adev, &ce_count, &ue_count);
>> -       atomic_set(&con->ras_ce_count, ce_count);
>> -       atomic_set(&con->ras_ue_count, ue_count);
>> +       if (amdgpu_ras_query_error_count(adev, &ce_count, &ue_count) == 0) {
>> +               atomic_set(&con->ras_ce_count, ce_count);
>> +               atomic_set(&con->ras_ue_count, ue_count);
>> +       }
>>
>>         pm_runtime_mark_last_busy(dev->dev);
>>  Out:
>> @@ -2320,9 +2340,10 @@ int amdgpu_ras_late_init(struct amdgpu_device *adev,
>>
>>         /* Those are the cached values at init.
>>          */
>> -       amdgpu_ras_query_error_count(adev, &ce_count, &ue_count);
>> -       atomic_set(&con->ras_ce_count, ce_count);
>> -       atomic_set(&con->ras_ue_count, ue_count);
>> +       if (amdgpu_ras_query_error_count(adev, &ce_count, &ue_count) == 0) {
>> +               atomic_set(&con->ras_ce_count, ce_count);
>> +               atomic_set(&con->ras_ue_count, ue_count);
>> +       }
>>
>>         return 0;
>>  cleanup:
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
>> index 283afd791db107..4d9c63f2f37718 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
>> @@ -491,9 +491,9 @@ int amdgpu_ras_request_reset_on_boot(struct amdgpu_device *adev,
>>  void amdgpu_ras_resume(struct amdgpu_device *adev);
>>  void amdgpu_ras_suspend(struct amdgpu_device *adev);
>>
>> -void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
>> -                                 unsigned long *ce_count,
>> -                                 unsigned long *ue_count);
>> +int amdgpu_ras_query_error_count(struct amdgpu_device *adev,
>> +                                unsigned long *ce_count,
>> +                                unsigned long *ue_count);
>>
>>  /* error handling functions */
>>  int amdgpu_ras_add_bad_pages(struct amdgpu_device *adev,
>> --
>> 2.32.0
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C9ad19b88bf0d4f471fed08d940926367%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611819760889211%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ldf4psDK2bA9Bvln2yLQ0ycmrJk2KP82v5qfwhjovNo%3D&amp;reserved=0

