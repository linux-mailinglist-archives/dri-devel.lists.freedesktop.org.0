Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C34EF7FE943
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 07:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4B410E6B4;
	Thu, 30 Nov 2023 06:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F21D10E6B4;
 Thu, 30 Nov 2023 06:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+vU4tBppGeqmJUEw7BoARRt9FSE3Uh0WJBIk9impiSA4l6ve7gfX+9G4yTaHvhSjjlFOYC0jxcv+kEQYTGdf/KONivYHOZMVVX5mm0os8dEnUUCH9/tBsnqN1PyqSh+qNRB3SY/cAKoqtloxZVJbByt0Sw4EulfAJMvgxEdz5V5odgRXLy+S34vw2d6fdDmG515zhbgw9/oK5fsLJ74XaeqGrAg4F3lHijN87yshxAHiqXMuJl+/rK72y/cqRNoB1Hxg6An82uT8o2khItBHq+SPjh0ANQoSonMbpuY4oDavSFnrVspj4zm5B4KjZ3cHYazMbYbXnjdG0Zfqa4/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+cYEAcm8Ikbhyf8Udvo2QC8txplggeJINjr1qIgMgI=;
 b=cEK4OAkXNdx/OQOQtEy7V8sJ1vXUA5FjwJo2lK0Qk5DDIwE2syet9eMEOf+ztbjILJTIUO8kEq0ohC5nWdw4t0jHr7Ef20HGFxO0Qgj0DNbBkk0Vl5gPvob9JdMgRgTsThxStkLyuY6bJXgantKzJH1rEGOGFSNxYoHHQuonAexvIHPcY2fSnCsnpQUZ9fPHZyHncUwtdkhgjGiFDd2pjEJ+uJDqa/v7lEhwfA9+RJqSU4khQ31zZh/VRV6Hy70l895bW0lTxVpZugWfXrvo/wrjsnUF7osS0lpuDNrePYdUr9GtdVWHL9jUREBzHJq6ZwHMrDoXSL+9q53+EbashQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+cYEAcm8Ikbhyf8Udvo2QC8txplggeJINjr1qIgMgI=;
 b=1DLUS7zkM2fYbl/vSK9CH4xh8xxv/F1BVgtYCsWIVBkk5SY4b4zHzZ2wAc9Ik6u1kQDVFBILgCed/HTKibMUVYRAhN5l3sIKANIhyhDgq3Redg6ifLe+JpBATXffHbkFIq7UQrm00UrZuKkeQ+9Lkf/wvZMys17jnzfe+2NzCnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 06:41:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 06:41:44 +0000
Message-ID: <716d82a7-146b-4b67-a434-dd7c32e77d57@amd.com>
Date: Thu, 30 Nov 2023 07:41:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/r600_cs: Fix possible int overflows in
 r600_cs_check_reg()
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231129152230.7931-1-n.zhandarovich@fintech.ru>
 <6a26b0c9-cbea-4ca2-bc16-79ed53e3a6fe@amd.com>
 <CADnq5_P-Bxghq4N4GXZXUNwGR5BPyU2qQXDYzDeNkvn=VSTfwg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_P-Bxghq4N4GXZXUNwGR5BPyU2qQXDYzDeNkvn=VSTfwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: d95cce96-66ee-4fab-aefe-08dbf16f6adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZVHmPsbbDZxgqx6323hbLgSij6bpnwSQJ0FKaNzy1K+fAcdWWH2U4r+XDiweeTRKiPM3+i1VstOqb5wjrpI/PVtyBBMZ8ZuHr1xekyqOWEJVFvJCm1c2v9ZJv14I7pdnDw2QYOexSkKzbvTZNNb2X/S27ZyiR5JGEMHPt/lhuOSYesvoMIqR/pm3fXVCHj8KiB6P0aB52UCQ99MtbFOzSz6TTH+4TLRTfLMgmuBH90HD6og7Zha7LlDqpXQJpY1dzoEPzxQr5UFPukBjtFFsqOY8Bp99Q2osuDTchByzjjojXa+eQQqFa3MWsIaP52ufpuLheQJQ3gYn1rrTWM8bwL3vGS1HWAnhIKSDI33rme/YOAmXCF2g26gWwCad8DK8WAQjSJ9mQpshr0Bivz2F18XA+bIVl6JRSUofYgmsVGEVRlVtw9KRrd3JDGpj+qV3T482ywaPyGepg/B2O91KwdSNsYQQWDxLxVr2Y/HQa/L2Vmudk4lZYLTF8dr8YCnuAn/L9wx/fD7JzN4LTLVMU3xuXv/lGKGYx5Gp/PKYScdNIFwXpf+Hfga14uBI8iS0VlLG0Ml1FFBhM4quMjlU9HCH02e0OiwdrgV/w/gL1UY7lNtxZBaPODk1SO5YR0PH1nCnSqUo7ccqvS0X68LgyEi4CMJwXacUjHuMw0pVe/q/8ysmbsVl5bV4qsTjVY+GKo3H45FxXzbaaPdfnS78uScVD8AWsHb3/y03cs+ZwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(31686004)(202311291699003)(66946007)(66556008)(66476007)(54906003)(6916009)(38100700002)(36756003)(31696002)(86362001)(83380400001)(66574015)(26005)(6506007)(2616005)(6512007)(53546011)(6666004)(6486002)(2906002)(316002)(478600001)(5660300002)(8676002)(4326008)(41300700001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHdQcFFuRXRiZTlLMTlGZ1h6TU94a0FXSjBlMTFJYm9DcmdjZFZJMjBMRlRV?=
 =?utf-8?B?MlhKMVdvRG1SUGExRHhDOUpHaUFLUkY3ZkdrVENnVnNLTE11dEJYekhrdG5N?=
 =?utf-8?B?aWIxUXJqKzNvd01TVXZCRXFHYUoyU1R1VllmcU11V3RIZHU4QmI1WlhnR0xi?=
 =?utf-8?B?TlUvd2FySlBRUGRhZXhTd2JGVUNSMHhSOGNTSEpSOVlQZUplMGNMeW5GL3or?=
 =?utf-8?B?RUtGdFRVNHViaU01SUZBRHlYejV1bUI5TW5JMVpXbFFhUUl3RHFnaWtqY3hU?=
 =?utf-8?B?L0RrK1JCQmZyZDVYOHk4bTVZZHJrY2pqNzJtRldRVlo3Y3JxbFM3clNucU90?=
 =?utf-8?B?WmlVVEEvOU9hQzV5U2VLdUhWU1ROR1VoczEzaFVvUkNlZDA0Zit6T3B2TU9D?=
 =?utf-8?B?S3pWb1VGWVpmcnVqbzQ2QlFyakJpVHRubTdzRHZHYTB5dFlhQXJGZ0NWZ0hN?=
 =?utf-8?B?OGk5M2ZiZmJBM0FOVXJtejRxQWxOMWN3R0dNMDNuWWtrdklYSTM4U0JTQmN0?=
 =?utf-8?B?dnp0eFhDREVIL3lxaXpRbkczQmZpN3hHSFpKTWw5emtqVjd3Z0ZlSWprejlt?=
 =?utf-8?B?VGVjdVFCbjM3M2JJSU5SMnpJdDJPbDZqdUFNY0hqOElnNTNRSzdlMWcveGtK?=
 =?utf-8?B?czFyeTg2Qk81N1RwSXR0eWVqUDZ5OUxneVI4K1hIczlVSmdFYmxuc2ZDSnI2?=
 =?utf-8?B?akpxNDZuN2R2TElRbis2SFV5QWlrUjRSN2xvN2RISXBBekk1ZFpOZkw5cjhR?=
 =?utf-8?B?UGwyNERqZ3l1L1pNZ080bXJHTk1zbUpYMVJFdmV3alVGTDJOUFJtQjZsQ01L?=
 =?utf-8?B?WWxIRmUxUitDUmVCUGtJc3JWTGlLWGNESG40U1dQUjBaL1dlREZpcnNvNlBu?=
 =?utf-8?B?T0FnT25IQ1V3aFpBY09XcDlZSlplSC9uT0JnZ2hqWUUxZXd3ekEzZnd3dVVG?=
 =?utf-8?B?TTlnM2hUL2laUncyaU56WVNKOVQyK2RHZDdNR3p5ZGNZQUdRMlN0RkF0UVUv?=
 =?utf-8?B?c2FhYXdITjc3VUdFNFQ0SC9QZzFnSDVDVWNFdXhvdGo5WERZN0ZqOVI5bjc5?=
 =?utf-8?B?UXZnT2NlcmVFYlJ4b1Z2Ry9GNTZjajl0cTJ3UVd3WEVwcjVCTkpuY3dQRDlr?=
 =?utf-8?B?TnA4VVMrcXlDa1QyY3F2anlpTW5iN0dDTmhBRHQrbmE0ak95bkk5Ylh4ay9z?=
 =?utf-8?B?cWJkOXB5QjlWOEgreDh5cWt6a3RKa3k3dHgzTVN0WUhhUzNIaGRpMnBaOSty?=
 =?utf-8?B?RDZSK1dYdTlQQkg4TDRkZ2p3eFE0QzBNRDFmbEZNNXlBMy9ORzFrL2tkVXkx?=
 =?utf-8?B?UHBPUkJHZS9mZlFUdksza3dIdGY1alN4Mm9WWVZMaFdTT205WWdlQ1RmNW1w?=
 =?utf-8?B?dmVFekxEL2VmUzhReWhVRGMvYnd6MmdHWmxjemdWYTJIdUQ4UU5TZFphd3Fw?=
 =?utf-8?B?RHRUc3FXZ1cxQ3BzUE9wcUtrTm5tMTJFYVlTdVRDSk5wMHZNZ01DWkFaVlZR?=
 =?utf-8?B?Ti9ybzZkK3NmbjE0MUNwdllGTEFCbG80Sk1YMG9WSXNKVWtmUGNkcU8zVFhT?=
 =?utf-8?B?bjdPM0pkSlo5MmFBTkZoRUQ4SVIydWkrZERVNWJ4dnhLZEVOWnVYSWtoM0pD?=
 =?utf-8?B?QTd1cVhvMWhvR3ovMExRWXQ0SmcvMmdhN2tnOE40d1hlWVYwOFhMTEtvMGQ1?=
 =?utf-8?B?Y2xyRHZBaXpGanJEMGFYYkVUdFV3bDg1eGFqMlhxOGdBQzVBT0hURWd1M0J1?=
 =?utf-8?B?MjE3ZVJpRW5oWVMrVmlOU09MSkZNNk5Kcklqbmh5WGRNR2Zkc1gzbkZETDZZ?=
 =?utf-8?B?c3MyOFRsWnVndnJpMTB2R0wwYW0rSm1JQ1JtbFVabFJ3aGcyM1ZxMVBMSkQr?=
 =?utf-8?B?Z2dWa1JVMFAySDduem5FTjRWK1JyMGtHZG5yR2RCVGVod1B5N2dvdThtQTdq?=
 =?utf-8?B?MVZ4MDA5cHlaTmlab0drRmFzMU4zUjN1S0NRTGgwSW1jMHNuZXBkMCszK2tx?=
 =?utf-8?B?TWI1a0xmWVRudHY3NkRJYnp2N2lrcEphblhhN25vMk8rR3FsRVJRS3pIRGx0?=
 =?utf-8?B?c3B1ZU9hN3FtTTRhem9HcDFTeUFMeHJ5cGx1TXo4UHNYZ1JVTTdMTFliNVBY?=
 =?utf-8?Q?TYAU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95cce96-66ee-4fab-aefe-08dbf16f6adb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 06:41:44.1948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjlJge+VMim3eGl0AZn5YaI3dH5lZyWwE5DrzZujxs0sEHIhSz7j6ZqGihPrpRji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5179
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.11.23 um 17:03 schrieb Alex Deucher:
> On Wed, Nov 29, 2023 at 10:47 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 29.11.23 um 16:22 schrieb Nikita Zhandarovich:
>>> While improbable, there may be a chance of hitting integer
>>> overflow when the result of radeon_get_ib_value() gets shifted
>>> left.
>>>
>>> Avoid it by casting one of the operands to larger data type (u64).
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with static
>>> analysis tool SVACE.
>> Well IIRC cb_color_bo_offset is just 32bits anyway, so this doesn't
>> change anything.
> All of the GPU addresses in the structure are u64.  The registers are
> 32 bits which is why they are 256 byte aligned.  That said, I think
> the MC on the chips supported by this code are only 32 bits so we
> shouldn't see any addresses greater than 32 bits, but this seems like
> good to do from a coding perspective.  Otherwise, we'll keep getting
> this patch.

Just double checked it, in evergreen_cs_track the fields are just 
32bits, but in r600_cs_track they are 64bits.

No idea if we every used the full address space, but it's probably a 
good point to merge it just to silence the static checker warning.

Christian.

>
> Alex
>
>
> Alex
>
>> Regards,
>> Christian.
>>
>>> Fixes: 1729dd33d20b ("drm/radeon/kms: r600 CS parser fixes")
>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>> ---
>>>    drivers/gpu/drm/radeon/r600_cs.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
>>> index 638f861af80f..6cf54a747749 100644
>>> --- a/drivers/gpu/drm/radeon/r600_cs.c
>>> +++ b/drivers/gpu/drm/radeon/r600_cs.c
>>> @@ -1275,7 +1275,7 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
>>>                        return -EINVAL;
>>>                }
>>>                tmp = (reg - CB_COLOR0_BASE) / 4;
>>> -             track->cb_color_bo_offset[tmp] = radeon_get_ib_value(p, idx) << 8;
>>> +             track->cb_color_bo_offset[tmp] = (u64)radeon_get_ib_value(p, idx) << 8;
>>>                ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
>>>                track->cb_color_base_last[tmp] = ib[idx];
>>>                track->cb_color_bo[tmp] = reloc->robj;
>>> @@ -1302,7 +1302,7 @@ static int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx)
>>>                                        "0x%04X\n", reg);
>>>                        return -EINVAL;
>>>                }
>>> -             track->htile_offset = radeon_get_ib_value(p, idx) << 8;
>>> +             track->htile_offset = (u64)radeon_get_ib_value(p, idx) << 8;
>>>                ib[idx] += (u32)((reloc->gpu_offset >> 8) & 0xffffffff);
>>>                track->htile_bo = reloc->robj;
>>>                track->db_dirty = true;

