Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD68332E56
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 19:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931206E925;
	Tue,  9 Mar 2021 18:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7006E925;
 Tue,  9 Mar 2021 18:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOhsvljRD9j4POiUyttxhXXCvvpjsElFYbF6CkVK03Pkrj1VGZEs2oHZ02HdI9NjbD7FNU5ao9nv0hN0YskEkEuZqCwIA/n0iRXrFZKV5pKkqzytMriXxX7b2ygeowvB13QVkaI2qEAx8DUgtSBBbkKmHd5HVIFLkjrPRZzw/5hfodwwqW4yMIqLKNUerWWa72qfcwLuRcNC2ll5kHkFlNA/W/LDRUTfGHvKAtCumJVH3FQwVmH8evYNPDmAa4HKJY2Qoj0AKjcYsW1w0J53mzLoLe9TUYroHtixx/dmbXK73Y4RrFiTE+onkBCNOpyk2PF7Vhs+l9xvRsomTZ2UTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLKu4AKaIBe1cLw7fAym+S+LtLdK9VE5sIgD5twS+hE=;
 b=HJDSXErpqWyKScosMQFFqggw8PV6A+oh0IjBjbhpOray2ohbXdpaMovQg5oQu7/Q51JZff3pLwkDW4lo5a3f3U4ehGPbA0syWoNH9/v1BFd06Xsn2al6gS9AmGHyJfeHzF136ToWUSeBlla1d/PPuBCzgjEtOfOJchoNsALwNo/67OXTn8c02z+b708CHeqM7iiIuqc+inz9xmCQpmck/Y6uOEwA12O3Kh1NkQpdsMpGVgN3UYQGiLUnt2RJDLSfD7X//tojLi9SNMEAdimPZerFbOeKFo6paWu3apWP2/1ACYxNtfX15nEoSIaq1JcwD9HbZ2wrQeZpBBJarQ0U8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLKu4AKaIBe1cLw7fAym+S+LtLdK9VE5sIgD5twS+hE=;
 b=SnhksxCnjK42xs2+6lgJJfqWO/TKjddSHp46ttTAUoPor8skze9FyOYhmuaJw66dPZTUQNaApFZ6GeX9rORqC0SxpkxD7MWZtXPd/J292uj1kOFVqoLeeJTqGuDrGPjxVctbln3LeheIQcNloH+iJjCIjV+SE2FnKeyA+m/wcZA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Tue, 9 Mar
 2021 18:35:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 18:35:04 +0000
Subject: Re: [PATCH 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
To: Alex Deucher <alexdeucher@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
 <20210309032356.20800-1-Felix.Kuehling@amd.com>
 <CAK8P3a1EeHimbufajcHzV+-bBarWtLHzzFSsa=qdUDsip=Wz_A@mail.gmail.com>
 <8023bb6b-b6aa-230c-afa5-871ce32782c6@amd.com> <YEexf0/V/YF394bf@myrica>
 <CADnq5_OTeK7-nN57+F+WE+Hdg86uiuTN8c_n0bmCtx40N_wraQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7831d401-d1ec-13bb-0b3f-b0e0a1a63f7c@amd.com>
Date: Tue, 9 Mar 2021 19:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CADnq5_OTeK7-nN57+F+WE+Hdg86uiuTN8c_n0bmCtx40N_wraQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:f611:3416:fc43:bd62]
X-ClientProxiedBy: AM0PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:208:122::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:f611:3416:fc43:bd62]
 (2a02:908:1252:fb60:f611:3416:fc43:bd62) by
 AM0PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:208:122::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 18:35:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53716659-85f8-43db-04cf-08d8e32a0e34
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4319E335410E7B375992556C83929@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9B97TRDGypuZBmvzmzslSsWC2uiXRqZfytHfMR6BVxDkZaCXD57zxyR1KXDH6KdXM6af5kzs8vnRyJsPYbeppWnvhQhB4kGwtG6BvEKbb9Bw/G3dVHMMymRdZatxROGCEvfqRMo4tf8n238TRtvcbxwwMIyQApHsisZzt1uaqD1mQY7qfrL1ennNamkLFlD605ZYj4U0k1LriQPWI7m/Dcos7OQwHXLrcjWmKc8iciwmtcHUnGKUGJ+8uIiKiPT/LYN6IgSevr1idmK3bZzctLhxjjj2MzVIJ0rJB0Ine8UHwIdQ/jop5POo4DX+4zEeiOjMvvRTt1wFg7dDuNvO3QVHAqCpV8Nnis5hB3F3TbDFeBe0CJdKzLr83C4n4VefmCdScsVtUs+LY+Xt1Ij//VHZ8gfQ/hRcqUNmEzvh4pgCYh58vYQP+iQJ4yGIZ1nmOu6sx55mnUyjKvifdZ+veR9ByagiwuWj1EWYXXPKin7MFsyRqdz5Jz0VDW7sF37nC6wkv4Blb6+YMy8Y6O+FIneo1CIKayj5wiNPkrZH6hwYnMafnN7Eb4U/SBVYyeLC9AnN+Qi+jdf1JY2ao4xX+a8PUiuPAI2bBElwrpY5Ck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(5660300002)(6666004)(31696002)(4326008)(86362001)(16526019)(186003)(316002)(6486002)(31686004)(8936002)(2906002)(8676002)(66946007)(66476007)(53546011)(52116002)(66556008)(110136005)(54906003)(478600001)(36756003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZENBRXZjREJ2SXZUM2lDUEN0bzBYdXdidngvaU5JVml4SkdEcDVFWEhQeHdq?=
 =?utf-8?B?VDJOSVBaRTQrL1k4OEZEbWN3NXRtVndJSVBGb21LZlZaRHNCVUZpNDJpNkRk?=
 =?utf-8?B?YjdncytpU1FCVE4zU1hFdmxqcGNxdjJNSFBhT01US3lzVjE5UDRGTExSd0tS?=
 =?utf-8?B?NlVvZTNuQ05SWXFHZmtnWkVGTzI5Y0ZqclhiTXJqRUFodW1YVTNnUEI1bFBJ?=
 =?utf-8?B?MWNzWFVYYTFLVmpBWndrT3plWEZKNkY3UFU4ZUxwTXNPbzF5V1VaT2wyTUJl?=
 =?utf-8?B?QjB4eWw4UXk4R251V1BiUmFlRGd6VGg2eVp3cFFvNERNT2M1dmtxa1RjajBD?=
 =?utf-8?B?V3B3ZzhIYXFwZEdjdGc3ME01YVFIZ3ZqTlVkeFRvdnYrdjFGdzVaMXlmSnJM?=
 =?utf-8?B?bzZHRFFVWVpKNXF1WXF2UitXeEJTR0tXcGErenZpa0ZtVGwyVCtvQ2R0akRm?=
 =?utf-8?B?dWcwRzNUNVJYZVBEZldoM2owbHI1aWFBYy81MDdOTU40VkVOZno3eC9zRUJv?=
 =?utf-8?B?WHlqOFdMWW1lMkR6akpTUTZxd3hadnRTZ0R4VCt6U0J6b2tGaHNZbFN6WGN4?=
 =?utf-8?B?MmVLYmJKWGtaWmkwdVNDb1laeHp2cDN3UkhEaVdRQVlLN3JLWE1UU280WXJm?=
 =?utf-8?B?ZVl2RkpnWmdtQjBLbVh3ZTEwd3I1bWJtRDQzNGtycGhZUnZQWjBaTWhxRUVo?=
 =?utf-8?B?b0ZpbVlSTm0wWWV2Z1hEalBIblFHS2UvWk5kbi8wbWFSbjUzdzg5WWI4cWxE?=
 =?utf-8?B?SFVwa0pyUVA2aDBQTkowSlJMUkVDQXFpL1loRlpCb3FYSDRPSkFoUlR6QjhV?=
 =?utf-8?B?NXJacU94TlRITVpPZmY5Qmh3L2x2ZTkwMjZTaFgrQTIrU1M5dzFkTUYvaDVT?=
 =?utf-8?B?SHlmNFJqMHlvU0R4RWJBT3RtM1dKSGNqSGF2U3VsSVBsSHVwSllONVllUmxX?=
 =?utf-8?B?ck00OURLb0k3bGlRcndGS0NFd0NPb1ZrUjY5NnZEdUx6NmlWbjVlTmRZdk4y?=
 =?utf-8?B?a2FmR2VJOHhSOE9kWlZBRTBJQy9Zb3Q1eTUzRmZpekFNazE1TTRBSlFJVnFM?=
 =?utf-8?B?Z2RyVkpGMlZuUEVFVmdQcXJ3Zis0dkUvT051ZU1yNHdjVWVmQjRrVklUQzE1?=
 =?utf-8?B?YWZUdk9BMEVWaGdxQnhNUDRiWVNWSGNhUVY4TXBlTFVUVXFkWGtSdkNpNDQ3?=
 =?utf-8?B?VWJPaDNiUEdSWnBzYU9mamRlU2p5RzN6QVJGNnJJYU1ERExNMlBnNjFhbjQx?=
 =?utf-8?B?VWl6MHduSFBuRkZ6eUJhL3cvcHA5UEh5aDJWQjI2QjN2VUVkNndZdlU0QWdp?=
 =?utf-8?B?bFBNSWFwNC9kNEJFWXhSOHpBaTNuakI5VC9scDhNOERKK0V5TG9QYnNZbDNW?=
 =?utf-8?B?VnR2NUk0dTU3K3ZFSEFxTmZjcnFqSmhVNHRBcGxmdTVDc2gxOTVqUkM2ckYr?=
 =?utf-8?B?OEhMVE5LVFA0RGtzUjV3SzRzMWk5cXVXZjlsbW1vS1lISDN1bDRXMkNXNXZY?=
 =?utf-8?B?Z1hLOVl3dy9UNHRGWVZtU3RmSHlMTVc5MnJYZUU2YWVlWUsrbndQVDFRMmVi?=
 =?utf-8?B?RDA2MHJMQ2RUa202NWxkZlFOU202YnJXeThoUjZsbE1qN0FVeS9IbFM1cFcv?=
 =?utf-8?B?NTExK0xBaVhpNzB1Q3ZWN0ViWjhGWTlRZ0VBNEprYWJ5NXpXbXQ3RjZvbTJ6?=
 =?utf-8?B?MWx4bUZua25pcW40Yk1ab0dmcHE5THVnRjgxc25haGlmRTQ3TEZoSEJGbnlk?=
 =?utf-8?B?bE8wKytyMmZjOTdYb0tMUFYrZGpSQjNjdGRKQVRTMXhvZ3BJR2U0eWVRdXpD?=
 =?utf-8?B?cHg2K1lIRGd4TTk4dWxRQkJRTXlJUG5wT2RjbStqUzNsbGc1K0ZuMVdVSVoy?=
 =?utf-8?Q?MHEjRUzpwNL2x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53716659-85f8-43db-04cf-08d8e32a0e34
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 18:35:04.1475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2YuCrS+sGHVZzZ26bir1tV21Ay6Il8HEiG89vW6hwfb8c8w2NZuQKojr/7q3u8C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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
Cc: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Will Deacon <will@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.03.21 um 18:59 schrieb Alex Deucher:
> On Tue, Mar 9, 2021 at 12:55 PM Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
>> Hi Felix,
>>
>> On Tue, Mar 09, 2021 at 11:30:19AM -0500, Felix Kuehling wrote:
>>>> I think the proper fix would be to not rely on custom hooks into a particular
>>>> IOMMU driver, but to instead ensure that the amdgpu driver can do everything
>>>> it needs through the regular linux/iommu.h interfaces. I realize this
>>>> is more work,
>>>> but I wonder if you've tried that, and why it didn't work out.
>>> As far as I know this hasn't been tried. I see that intel-iommu has its
>>> own SVM thing, which seems to be similar to what our IOMMUv2 does. I
>>> guess we'd have to abstract that into a common API.
>> The common API was added in 26b25a2b98e4 and implemented by the Intel
>> driver in 064a57d7ddfc. To support it an IOMMU driver implements new IOMMU
>> ops:
>>          .dev_has_feat()
>>          .dev_feat_enabled()
>>          .dev_enable_feat()
>>          .dev_disable_feat()
>>          .sva_bind()
>>          .sva_unbind()
>>          .sva_get_pasid()
>>
>> And a device driver calls iommu_dev_enable_feature(IOMMU_DEV_FEAT_SVA)
>> followed by iommu_sva_bind_device().
>>
>> If I remember correctly the biggest obstacle for KFD is the PASID
>> allocation, done by the GPU driver instead of the IOMMU driver, but there
>> may be others.
> IIRC, we tried to make the original IOMMUv2 functionality generic but
> other vendors were not interested at the time, so it ended up being
> AMD specific and since nothing else was using the pasid allocations we
> put them in the GPU driver.  I guess if this is generic now, it could
> be moved to a common API and taken out of the driver.

There has been quite some effort for this already for generic PASID 
interface etc.. But it looks like that effort is stalled by now.

Anyway at least I'm perfectly fine to have the IOMMUv2 || !IOMMUv2 
dependency on the core amdgpu driver for x86.

That should solve the build problem at hand quite nicely.

Regards,
Christian.

>
> Alex

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
