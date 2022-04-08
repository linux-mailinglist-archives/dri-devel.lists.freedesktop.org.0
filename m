Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B358A4F9A4D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC5E10E4F9;
	Fri,  8 Apr 2022 16:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2900810E4F6;
 Fri,  8 Apr 2022 16:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsp3QViLs8CSIqdvHsYlMcfdAkq8uhzrm5WL+Wml4OzcnLza8O/Y79nVWJuNADN2/n/mYtHP2OAc/5fKVrInlnq5RNFK9bzF6KmTIKytELzkE4sM4+bBCMdpQGEh/mlht6QPQ/am6/VkrF2Fm6cxiq/tKMigJDeF3QRnjtQkUGBPk2HhZwEGGrV6p5j0XpAaiaqBLNlxnVj+sbI0zxcTw7i+/oO006HHxK0SsyM8XbXDLbxrCMD1R5vLyVz0yCieeVAVeSLzvCAJE2wjc36hnpNW3HAKQ/1n0X5sHfxgyzbpRHBZpup5ZzK6AE37AqOYIt2gz25r5eYRtVmfjoom3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRvvxliZhnL4vE5c26GGcJdHPMn3jTlUzFqB4T4qq8M=;
 b=aCdysr6w0XUElY/JojL6nteuqvqROk5a8I+BLtfGm612g2pQMc71gM0UVoyFuE8tK239y+1GQGayiWqnCn4RxH4Eq0XQ5hCd9bsyba05+PBQKHn1yxFAsjKPhjaNXnGnnfS1VJS7ScSXdJs41+/fkiioyeF8weyCZdVpvGmNUWLob1MDku1O6zN4eg6G02d0FaKo1gM1Q+3S3c12LTn8GJ0g6bRejNF9QLFKxciPLLjKzf86LTgduqfZ+RiQbalTcR+05IvA7Hi1b/dGKXm6ac6TlaskdGyw+3BHvD/NJF6GLJI4+q786Wh+toxT64d3zJXemVeprM0tARuQFZflug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRvvxliZhnL4vE5c26GGcJdHPMn3jTlUzFqB4T4qq8M=;
 b=z9WH5TEQmBCdyUGFYQjUnLgY4lBAwgvTb87PXAgEzNShW7A5RmtIsUIZkTIKisPyBzPDKAh8wjax9tAiMWiaMR/RZlTKzu6rrGkLx11X2oiViqzmCKEn0aZbnU0uz4NoNgovHIMPAcjBeKjaN/LVANBCTLvPSWAspazT3y3L7PQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by DM6PR12MB5023.namprd12.prod.outlook.com (2603:10b6:5:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 16:15:43 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 16:15:43 +0000
Message-ID: <2603fe3e-2b8b-0161-2812-6c1f21eda02b@amd.com>
Date: Fri, 8 Apr 2022 11:15:39 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
References: <20220408154447.3519453-1-richard.gong@amd.com>
 <BL1PR12MB51576654D3EEB10F5DF862A7E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
 <CADnq5_PmxGxrJG5uZkkFXQ1YbJbDZTvAqb2oYqdCE=NtqBojqw@mail.gmail.com>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <CADnq5_PmxGxrJG5uZkkFXQ1YbJbDZTvAqb2oYqdCE=NtqBojqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR19CA0021.namprd19.prod.outlook.com
 (2603:10b6:610:4d::31) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5fab33b-00e9-47f7-bc55-08da197b0825
X-MS-TrafficTypeDiagnostic: DM6PR12MB5023:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB50230F3AA39E60867E8055E695E99@DM6PR12MB5023.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8bUcYsDlFN3rqatLHgAOLngW3azD8I2UfqIwHewReEik756O4rCl4xtyE0zn2XszqtQjiruK+dWG4znAtmLb9QjrgU1EWOlKEYEprM+cDEevJquvBbq8L/pfHGRaLs+0rg3CiM24JYimAJdSl5JKRIbHpon6TD5cAs4hlBjQznyBVc6kzeZww7D46nGjgsJFAihkZ5YZwsICmfOgsYS73hlNqmEsWnb/ocw2phiuTs22HfmvPd8MS/6qyXVKaKzwh2ca1YHkLqQGhgBqfkX/92DfIdjGupo4b7KNRkebU0z9vfk6AY69/psc5supwe91hpElreF2okhIgK/ptplYi8dDdSIjtWm++qPKDD2skJjLz9W9hwlnB90oQxV2rKjJt4+4rfl2KgkLC/10bHZ55XE0EnbXKPg10vLVg2VI9MYCInPM6w4lohFh3xBhYsTOnbcbPftfkoFmYX0XrFSRNP7uNiKylOJbb5OjDlizr7PkVPM72cJBkTe34DysDnZBFmN535FfucvRytJ58sNNILlT2O74fTBaeqt0f0/0+NO4P6tJeLGgmjO/4RASrN6BPJjWlNA0PLXN0e46y2IxsWg59S8x9BXQySWyo4qe+WmlzbVSxTrowAlYRFeClS+Cd0mjSmVZdnOrRjwqIym1UcHh5M0csMWtHGJ8hsFH4NHSXUbSlqg5Pf4xc6G9VMsqj5rl9DqgkzU418n9P/s7x4V6zUssZXhG/PF/4Lqi4dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(45080400002)(38100700002)(54906003)(5660300002)(36756003)(316002)(66946007)(8936002)(31686004)(6666004)(31696002)(6512007)(2616005)(66556008)(4326008)(66476007)(8676002)(6506007)(53546011)(6486002)(966005)(508600001)(110136005)(2906002)(86362001)(26005)(186003)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlZoMktiWitxMVpLa0JhSFNxWjRZWE9qeG9LYUk1eEQ3NW0rRXNkb2FoODcx?=
 =?utf-8?B?MkRucUphdkg5cURVM0EyV0NIRjZaK1VMbmQrZDM1WTlWaDY4ZHNySXo2TXZt?=
 =?utf-8?B?STN3NndNMW1QWU55RkgyTFN5aStqYlh6OS9IMThXWWF1eTNGSVp5K1c0VjFk?=
 =?utf-8?B?UWMxTHJoVFJlSUVTNHhqK1V2OVdYSVFycEF1VVZENWlpQkpZYm95WExEdHYv?=
 =?utf-8?B?dFZBaENnUm9FMHJHWGZGZUFYejZjcGlUa2g1V3RBRzFsNjlOTFcxR1YrMVVl?=
 =?utf-8?B?Ylk2QmZsQ1FMS01wajEzSXB5c1cxVytPWktPZFVGa2xHbHFFQVd0dzZIVUcx?=
 =?utf-8?B?WXdoa2tuSWxjeHpRbWhyV2JvMmVsWnZ6d1BQaXVDUjIydTBEYm16L2FXM25K?=
 =?utf-8?B?S3hnY0FPUUNiMkJxQUluZGttb2hyNVRIRUY5N28vMzlIUTlXbGsxZnFQQU5M?=
 =?utf-8?B?Mk9GTC9pSk9NWncraHk1UkVwSHcvR2h0Qk1BVFJiVklhSjdRZ0lXQWhNem5o?=
 =?utf-8?B?RUJ5QVM1RkZvd1RhaXdsTG5iSENMWjlzYkZyOWMyamlrZSs2aVRsdUUvTnZR?=
 =?utf-8?B?c2UxYldMVkNWWWg5RTB1STBrQk1nV2FVSTREbVpWVG5ucjlLTFNubXk1dHht?=
 =?utf-8?B?a2htdWRRQk81N3FBRExQd0dKSFU2am95ejhvMWdVQVNtUXF2UVFreUd5MHho?=
 =?utf-8?B?LzNmUkZ0cHlvd3l1eEpLbEF6VExuell5T3pkRTFGYjRPWXJPZDEwYTROd0FB?=
 =?utf-8?B?MUR4RWhpaFBDWjUwdjhxQjhvWE83Z1BsNFg2Ly9UOG1yZjBsTTh6SXdHT2V6?=
 =?utf-8?B?Zmh0SDdGeXM3UjE1TFNLVlFINS9ZV1FWdmh4NmFPUFRoMmltRlFneC9hQmJ0?=
 =?utf-8?B?TXh2K2NpRFIwcU0rbHdYSVNPUjdWY3BXZnRyZk1PQUZzWkJ0bzgwRGYrYlgz?=
 =?utf-8?B?Qmk2aXBiaXVXY29lRDF3VVVjTGk5NjBpSTNzYVJYRGlld3BMNjIzbVl5bHZO?=
 =?utf-8?B?ejkzRnhKYWxJdmRyZkpsYWxYSHVJK1d5cjVSTCt1Y1Njc0VNRFZuOVFaZWFG?=
 =?utf-8?B?OURuUnR0eEJUdzhLRktMdENOa2c5YTNYaWtPV2xPdWEvN2kvUE52ZXJCcE9l?=
 =?utf-8?B?d1FleThDeGVpOTZydE13ZGhsd3RhR3B3MEpPcFQ3WU9HVDduUGFBcWRzUExy?=
 =?utf-8?B?dVJ5Q2h0b3J4ajFXeDVpVHQ5YXhOd3NNTHFMVEtIcG5ya3gwVTdJUUw3RVZJ?=
 =?utf-8?B?emFDSHcyOXdPQ3RiSkFSTEZJRFdPRDFsUm4zZ2x5ZFYvcE04dm9wVjBKRWtV?=
 =?utf-8?B?Wm1nWTBOanRKQ210VjdHcDNEQUJvZENVUjc1YzI1dG8veEc0elFQUUhXUTVi?=
 =?utf-8?B?KzdqMVRMbHdLZkFLbVV4ZlM1b1RMYW03dENhZnJkblQyMkUyM1Jhb2Y2STNR?=
 =?utf-8?B?c0NnRGU5aG1WZkdpL0pYcFJ4KzVUeHprRUlVVUE1MjRxMDF6YnVhSFNDdDh3?=
 =?utf-8?B?UUlldUs2M0lnZjZTRTJjTUpESWtmajdINFI2VEFsQ3ViTktOTHVPcWlxQXlK?=
 =?utf-8?B?WVBieC9HVUh2UTdDa0xNaGJDWXdXMjFRL2JmY1ZqZ3gxQVR4bGt6cDhNMDFI?=
 =?utf-8?B?T0xldG9STHVSWi9rNlRBc2RpZ2xnWHUrTThuTUJURHdCcUYwVm9yTlpwVFlm?=
 =?utf-8?B?bzNHSHpleVJSeHNNTml2SHZ5QTUwNGlCNGZ6RFJ2dE5lUUFzS3Z2ZDBXRXNI?=
 =?utf-8?B?Y3k4QjUvc2JiaWVWZ0s1aXRHWG00LzEvbzlNOWRlcUQzdW9tQnEwVVhOSVVB?=
 =?utf-8?B?bGRMdFdhaG1HbnE2RXVGNFVxOFRya0tXTVhTdHJmQzc3QWNrcHp2aEk0S1NF?=
 =?utf-8?B?eEdQdmI5TzJOcjB3bDZDRVI3SVZPY0FqRFRzc0ZxT3QwSEZTalZGR2RNbGt6?=
 =?utf-8?B?MXlaMUx2NmtmOSt3SFdhczJKUWR1N05QRjdmcmhQTFpiN25nbVNzZjJERjgr?=
 =?utf-8?B?eHlZNGtZd2V0a0hSMWN1OUtxZk04OW1jYk1rNmJOUG4yN1cwSzZ3ck9pbUJV?=
 =?utf-8?B?aldLNU51QmMyMU5vWmRvWGcyQUprU283UmJrWEhacE9jY1I1dWZzWVU1WUJa?=
 =?utf-8?B?R2dqZllJQ0R6VDFVaGp2Zk5FOUF0SFBEZXpLODBZUG03eWdWcmJ1UzUrVjdl?=
 =?utf-8?B?QklyK1VEV01rMVZ1dFdjWG9WL3V5NnlhSnVaZ3pkdmRiajJVMEFiKzBVYjNE?=
 =?utf-8?B?MWwyK0kreHpNdFNMcVdFUllodWJleWxDclJLejNWSm9lemsvTVFCY2NzTlVI?=
 =?utf-8?B?TXFyY2ZsNFpKaTliU2MydmtZQld6Yno3aWs2SUVyQkV5S3IzaUVkQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fab33b-00e9-47f7-bc55-08da197b0825
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 16:15:43.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGgOKDU0oW24I/+urudUfCc2RM6sEm624bd1McQjc2EnWwE3ioYpRGzMjinaNGcYEjelO23WjC4hjVKOPiVejw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5023
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On 4/8/2022 10:54 AM, Alex Deucher wrote:
> On Fri, Apr 8, 2022 at 11:47 AM Limonciello, Mario
> <Mario.Limonciello@amd.com> wrote:
>> [Public]
>>
>>
>>
>>> -----Original Message-----
>>> From: Gong, Richard <Richard.Gong@amd.com>
>>> Sent: Friday, April 8, 2022 10:45
>>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>> airlied@linux.ie; daniel@ffwll.ch
>>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>>> kernel@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>;
>>> Gong, Richard <Richard.Gong@amd.com>
>>> Subject: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
>>> support ASPM
>>>
>>> Active State Power Management (ASPM) feature is enabled since kernel
>>> 5.14.
>>> However there are some legacy products (WX3200 and RX640 are examples)
>>> that
>>> do not support ASPM. Use them as video/display output and system would
>>> hang
>>> during suspend/resume.
>>>
>>> Add extra check to disable ASPM for old products that don't have
>>> ASPM support.
> The patch description is incorrect.  ASPM works just fine on these
> GPUs.  It's more of an issue with whether the underlying platform
> supports ASPM or not.  Rather than disabling a chip family, I would
> prefer to add a check for problematic platforms and disable ASPM on
> those platforms.

I thought that initially.

But I found out that suspend/resume works just fine on the "problematic" 
platform (Dell Precision 3660, Intel ADL based) + AMD W6400 GFX card. 
With WX3200 or RX640, suspend/resume works only when ASPM was disabled. 
Both WX3200 and RX640 are from CHIP_POLARIS12 family.

This is why I take chip family approach.

Regards,

Richard

> Alex
>
>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=04%7C01%7CRichard.Gong%40amd.com%7C96f8f686f75f43abb5ed08da19780fab%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637850300760921285%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=xVKC0Q16ho5Y2GDuN%2Fnx68wm6NzOIyR5xJbiXPgqPpQ%3D&amp;reserved=0
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index bb1c025d9001..8987107f41ee 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -2012,6 +2012,10 @@ static int amdgpu_pci_probe(struct pci_dev
>>> *pdev,
>>>        if (amdgpu_aspm == -1 && !pcie_aspm_enabled(pdev))
>>>                amdgpu_aspm = 0;
>>>
>>> +     /* disable ASPM for the legacy products that don't support ASPM */
>>> +     if ((flags & AMD_ASIC_MASK) == CHIP_POLARIS12)
>>> +             amdgpu_aspm = 0;
>>> +
>> I think it's problematic to disable it for the entire driver.  There might be multiple
>> AMDGPUs in the system, and others may support ASPM.
>>
>> Can it be done just as part of probe for Polaris?
>>
>>>        if (amdgpu_virtual_display ||
>>>            amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
>>>                supports_atomic = true;
>>> --
>>> 2.25.1
