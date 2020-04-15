Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9151A9552
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB6B6E8A9;
	Wed, 15 Apr 2020 07:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680077.outbound.protection.outlook.com [40.107.68.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D646E8A9;
 Wed, 15 Apr 2020 07:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCUC/dCfR0ABTy9zS4br3l2HoVhw3CBzBrz79IzXACnRARQLGTn1O/hdafgrU+6hT5vO0uAH8RkFKVG9Cmu+Z3DjOrFTlt/xb381VZZc3tQuDLIIvlTVXh5HDBpqM5C6l3d4BK51RwaVTAwA3mP8rJppHv351EIGlA1e+ucAIBmVwzfzXQt5fi5GLr9wosHtQ08mKFfl3mny+3pQ94x52dSmyHot1hH3FmxDLC0x3561yMPr9SjqWLaJO1SrGBFEzzeXxOxA1RuiRmWi1ddkGfA1mGr2kSBVdcTfloy069kl4UF+DwXv66HW3TB6aIo4X9lQAqljcWkTEv6+QLxTqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtOglB0MhSHQryD5/76ThrnM5Oa2dv8QpLLNFy5JcIA=;
 b=e4A1Cb37hjEtUgQjGDzGKpMXGtiEL29ePholh26b1mK8Yt4zdPzifQxbiB/b9zuty9tUWyZfUn8OSu5fsHRPKh/dA2LmVqZkEwLvWyrRjLN6+fFzwv56hNiDKrus0P3hOLUUuPJRzN25qdx1vpq8bm/S8Vtl+vU7VgeFE0rlyw2nfg5DQt0jUVuUQyDNirrhz25D/xljriCI2iydpqjCDlwJQfGNWxm7s5iHcx2AsEYTbdXqRPnEpJm7TMqJhuqpIcylIK4O6JQRBapgA7M/kEIqP4QNlUInMjA90SdmqQCVOwK23x9JzVo6BRezQEemqqh6i04N1ZyLRaeGolattg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtOglB0MhSHQryD5/76ThrnM5Oa2dv8QpLLNFy5JcIA=;
 b=SugizqfQXnE/5wrMz59ET0ve2Q0GpvRfBF1TnH0rb7nLWOoBlcATkwrDEI/kVl8i2p+9T0sh/crb8YrfN6sg9DG8tdOYw8cryRrZ8XGhJWxpSj+lGV3nU4AUS1npEcr/nG0XxrMPdJ9++oL96xLVLm+V8J8UhmBPkJYxVvTvdsA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB2939.namprd12.prod.outlook.com (2603:10b6:5:18b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Wed, 15 Apr
 2020 07:57:28 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 07:57:28 +0000
Subject: Re: [PATCH] Optimized division operation to shift operation
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexdeucher@gmail.com>, Bernard Zhao <bernard@vivo.com>
References: <1586864113-30682-1-git-send-email-bernard@vivo.com>
 <CADnq5_Phca3L-HGOQz0DPBoARHgwcJRK_a7-WmeFMPkrPWeOeg@mail.gmail.com>
 <87lfmx5h72.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b5ffc6b7-bfa5-0827-a267-4e8c20027982@amd.com>
Date: Wed, 15 Apr 2020 09:57:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <87lfmx5h72.fsf@intel.com>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Wed, 15 Apr 2020 07:57:25 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90c6ddf6-2092-4351-e186-08d7e112a438
X-MS-TrafficTypeDiagnostic: DM6PR12MB2939:|DM6PR12MB2939:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29395310950A119383D1CFE883DB0@DM6PR12MB2939.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0374433C81
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(31686004)(45080400002)(316002)(31696002)(86362001)(54906003)(478600001)(966005)(8936002)(5660300002)(2906002)(53546011)(81156014)(52116002)(8676002)(110136005)(6666004)(66476007)(6486002)(16526019)(66556008)(2616005)(66946007)(4326008)(186003)(36756003);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+Rz/JGeGreoLC+yNBp4PXB1fxvy+T++D8YThOsya+SdU9gVvyt0tbarL6jCi4WYw+8wHtazOh3wBg0ForYBdBVKNsGqSWwheMsLQUfCPfwMuyWNR4+Z6FuqTHzHeV49jtTCuMcrYfar9FazP92aSF8bpHU/RRj9AgeDAA1RjPdGRLb0d+b7Ib/BlohkL/tXqKufCKhcZ2yq4yM/cUdtSybxp6ApoZO3tL1eB7JJmFLAnzzVHhEaPmi3UTqPdn716euKOzaaDOgKirDL5gTxTnB91uudfXmX9kktIatk4gu5Du/NGMoYvaoRyI2hPG3tPLSe5kkNPDej6YrnlaR2hS1nFPeUXcS2BkFJo6xm9yJNJcT7VZHezSC+5eBfQ2TFEaJZ8U8LNVVeVAoVJwsAviIUi7VBPhCXWDTThKnAAELyg69w1dPGiRtFNFaqKCH7sowTea8VypO9Mves0wuYN87DyOxj2j7X+ejR4Gih4E0=
X-MS-Exchange-AntiSpam-MessageData: ICv30Vd7Gklg6DnBoGB3c9LMvkKVJCVgeJUxKSimZ8TDdMZMECQA9wK4TyOgpo/0Nvk3NtoGdd0bQlQygixEeTm6bFuvHJ8EjUMj1lk5iZ0CZq8BWGZdprqISqNO8cW6QQw+H+yV+FkvOXeEYpzv4mc/eJXXPndM3yyZb9wvlFnIKj2BjE95jBE//Zz2o/OZQsZNiFTNP629ZhvFlvJP6w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c6ddf6-2092-4351-e186-08d7e112a438
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 07:57:27.9247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrVziHQ7iVyDM+0zjGjc2BzpSffEVJmEn3OirbP2DTMR3fE9muP18CdnFnSGwQs/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2939
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
Cc: Alex Sierra <alex.sierra@amd.com>, David Airlie <airlied@linux.ie>,
 Oak Zeng <Oak.Zeng@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel@vivo.com, Huang Rui <ray.huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Kent Russell <kent.russell@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.04.20 um 09:41 schrieb Jani Nikula:
> On Tue, 14 Apr 2020, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Tue, Apr 14, 2020 at 9:05 AM Bernard Zhao <bernard@vivo.com> wrote:
>>> On some processors, the / operate will call the compiler`s div lib,
>>> which is low efficient, We can replace the / operation with shift,
>>> so that we can replace the call of the division library with one
>>> shift assembly instruction.
> This was applied already, and it's not in a driver I look after... but
> to me this feels like something that really should be
> justified. Using >> instead of / for multiples of 2 division mattered 20
> years ago, I'd be surprised if it still did on modern compilers.

I have similar worries, especially since we replace the "/ (4 * 2)" with 
">> 3" it's making the code just a bit less readable.

And that the code runs exactly once while loading the driver and pushing 
the firmware into the hardware. So performance is completely irrelevant 
here.

Regards,
Christian.

>
> BR,
> Jani.
>
>
>>> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>> Applied.  thanks.
>>
>> Alex
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 4 ++--
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 4 ++--
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 4 ++--
>>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> index b205039..66cd078 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>> @@ -175,10 +175,10 @@ static int gmc_v6_0_mc_load_microcode(struct amdgpu_device *adev)
>>>          amdgpu_ucode_print_mc_hdr(&hdr->header);
>>>
>>>          adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
>>> -       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
>>> +       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>>>          new_io_mc_regs = (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
>>> -       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
>>> +       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>>>          new_fw_data = (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> index 9da9596..ca26d63 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> @@ -193,10 +193,10 @@ static int gmc_v7_0_mc_load_microcode(struct amdgpu_device *adev)
>>>          amdgpu_ucode_print_mc_hdr(&hdr->header);
>>>
>>>          adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
>>> -       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
>>> +       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>>>          io_mc_regs = (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
>>> -       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
>>> +       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>>>          fw_data = (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> index 27d83204..295039c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> @@ -318,10 +318,10 @@ static int gmc_v8_0_tonga_mc_load_microcode(struct amdgpu_device *adev)
>>>          amdgpu_ucode_print_mc_hdr(&hdr->header);
>>>
>>>          adev->gmc.fw_version = le32_to_cpu(hdr->header.ucode_version);
>>> -       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) / (4 * 2);
>>> +       regs_size = le32_to_cpu(hdr->io_debug_size_bytes) >> 3;
>>>          io_mc_regs = (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->io_debug_array_offset_bytes));
>>> -       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
>>> +       ucode_size = le32_to_cpu(hdr->header.ucode_size_bytes) >> 2;
>>>          fw_data = (const __le32 *)
>>>                  (adev->gmc.fw->data + le32_to_cpu(hdr->header.ucode_array_offset_bytes));
>>>
>>> --
>>> 2.7.4
>>>
>>> _______________________________________________
>>> amd-gfx mailing list
>>> amd-gfx@lists.freedesktop.org
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C1e91f7edcfe0473b0d7008d7e11074a8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637225333103893889&amp;sdata=VDJlEY2%2Bl1SSO8Fw1dYqqPFqQtyHpsxQ0Tm7iVOgJQY%3D&amp;reserved=0
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cchristian.koenig%40amd.com%7C1e91f7edcfe0473b0d7008d7e11074a8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637225333103893889&amp;sdata=EpqRRbCiksur%2BjMlVQplExuJsmw6UPODhyBOutOVukw%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
