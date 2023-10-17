Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A227CC5E6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 16:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C8E10E2FD;
	Tue, 17 Oct 2023 14:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E0F10E062;
 Tue, 17 Oct 2023 14:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idvkSb0LyRVdIidKWwkk2m9BVe/6U/MJjj4uCEiqmOAL5DwPVragh+cINbZSO3P/ZS8AVOwYyKCyWrnt+NvGtZgAwZMYxZM0ALAG+vvmiuCKUflIxZChUo316ynMEkySDf1Dg5taEs/lHTCs4Ysjen3Sf8sC+UotXRg7TI8a0hNcyjb3UY/mL8ajk3IgDAlO29yFlxGpNDbfDBh2yblTDX8dJPQQJzRtiq50iM9AYE0MbQZqzzBJkCgPj3sYgkmGD8NXp+o9fJ400UCrElSlmazb8l02X11UCoTrfemG4yUlEPehDVPRQKW/e0ThEJbjAQ/343i8ZuG5bPek3nZUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v59JgElCbH24x3PeS95X1NhuMv1qUekc12XU5GSB+jQ=;
 b=hocPDTQBjSBIPug+r3m3RxvaO/BVMaN5mlamFK0u6aHzck6lrneF9tg1Xx1qMy3C2dpyBgtSso3z2qsSEVtGIA+X5jRqeHhsWFMdlcFrl3lG3YLFJY71RVmhOE4dhUr+OHlR8nF6hdjQyI+GP/Y3lcbpvSDxPWM12nzP3B1ysdo/l9fcx0caWWcYAon2kPIqZyoCGvnAH8aF4EaijKgdMmamHsNYYs8Ps+uU5vMg0PokYhM4BkYVwcBw+0FQBwzu0XK6da4RgqY6QKQxpOgtJP2DvAE3ojwB4ikolZMXUdyJrkAwBMexOG/Gc7cNk1nMXRbKWgsgv5bqdhiSW/WcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v59JgElCbH24x3PeS95X1NhuMv1qUekc12XU5GSB+jQ=;
 b=us8Cb+5U3JVkMheZcxfYQ47E70lK2mVSq8cTWBOuyOHcMeD7M9XSxEKMPR3EZaJHlW3ngepLKCJ53guFYb36Mc/vvihP2kNjtcLD3DADDNoLo4i5ujMYjwgoM+llJK846r6i+oNUl+CQsuWNzX4xFCpl2NeYZVG8UqbyFF9VzyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB7167.namprd12.prod.outlook.com (2603:10b6:303:225::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 14:26:57 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 14:26:57 +0000
Message-ID: <b66ea9a2-0a46-434a-8d56-06f7388d837a@amd.com>
Date: Tue, 17 Oct 2023 10:26:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH 1/2] drm/amdgpu: Unset context priority is now invalid
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231017035656.8211-1-luben.tuikov@amd.com>
 <CADnq5_NyhWLmSbtmeaHv7RRXhEc+C4XTPZ-U57zrpw3N3nObCg@mail.gmail.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <CADnq5_NyhWLmSbtmeaHv7RRXhEc+C4XTPZ-U57zrpw3N3nObCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::20) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: a6dcd546-db4a-4a61-ae00-08dbcf1d1e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rgfbpZuiy3zx1FxidYYcSMLDpGBLURSxmKzIQG1kWAAFyjK/k/sMEfB393EXV3dS5kaunVk5+T41lc2L/rR2n8c6a0ksbQPQRbtP3TzCgF4nv18F1j06mdtDSXwIInxgeVEU546YVNZY8jOiST2AvFR3wCTSb4ajbZIbMvCZl4JIqToTMBOcefnCUpeUEYu6fpnyCy2Ipx+Ba/5CrVHMyhcQPG9s7FEwcpEfV8k5owqP5bVapKSZYIEuda6gLZZUkrp0F+khiTV18Yy/lGqB1ucLMc5c0mQYj63plZceteTQLUk+vRIueorvfMXshmDIRd6l15nhPXvn3MbtdnhSeZ5R1EstUoYY5abR/2RXFT5DkK6RM9Oh3cSOth6qiPovkl9aHShSXS2ocqDDPK67MgPYibRTZVU5qK7HHWabZ3ETE7kmZ02whnicMFsL7sWb6l2CT8q4olu0+6wUbIlybLSCKiZljqIndRvYhy7mkd94LQXMQrDkCxaI8/0W0dKt5yEW6fNvJ2OQq5Lchtder8pScybzg/qrFD4D4kq88AAdnme81EF1pugityfyOtzXDXE+4jF0g8GnFkFbwMm7KaULMq9KEtwU52LzzypRrJdAsM1TzeIuKNIPP2xRNuNDgnrqIKERYUOIF653LKQ5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(86362001)(41300700001)(44832011)(53546011)(4001150100001)(5660300002)(8936002)(8676002)(4326008)(36756003)(38100700002)(31686004)(2906002)(31696002)(83380400001)(66574015)(54906003)(66946007)(66476007)(66556008)(6916009)(26005)(316002)(2616005)(6512007)(6666004)(6486002)(478600001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnprZXZ1QlVLdlIxQno2RFU4aHpuMW5OUXR6UUFHbHpmT1VrTTVVOVBDVTYw?=
 =?utf-8?B?Y3BaMWhwTXBNUnVaMEc0MXVmOUhmblAyZFVLVm5lTVhTdUNaREZ0K0srUE9Y?=
 =?utf-8?B?NnRQbHRDYUxqQmI2ZzZjNFJGQm9Lc3VJMC9xZ2NXQzZ4MHlZQTQrRGtxdmF3?=
 =?utf-8?B?TkZNU0gwTzFnWXAxOGluWnB5eFY1QzFnSWNsSmsrbDdDV0lSNzMyb0dLSXp0?=
 =?utf-8?B?NGp6dDdDcW84OEx4cVUrbndPRm5QZ09Qa0pLNllUdXRnVlltbi9YMlMzaDhs?=
 =?utf-8?B?eHBrVUhBa3h6clZjRE4vV1pKbjQ3WEQwWWovdXlYMjU4eTJRMU4rSVkwSG1C?=
 =?utf-8?B?M1ByVVErWTVvQTdJQ2Z6VzlnMm00eWROOHVUdk5EY0JQK1FBUnBDaDJqWTRW?=
 =?utf-8?B?bFNkSkt5WUtzT2VQa2l4VVVwYkNyMjVZdE91ckpyYVVuR3Exd2JLVTNwNXFh?=
 =?utf-8?B?dXIrdlJUUWNqajJBYkdsODl0bnduWjRWOXJYSVJzYytXOHZuOVFPQUF4K2Q4?=
 =?utf-8?B?MWQ2ZkE4V3VsZXJ3djY0YlV6M3JrYWgrd3VlM2tDUGNQUTIvb0drRStFK240?=
 =?utf-8?B?TVQ3d2gvL3FaSWtHTE95Q1Y5d2ovZW14Umh0bTBTY0VPTE5xZitMWW1vQ1lB?=
 =?utf-8?B?SjNEcG50VEtuZktHN09RNnRFR2RGUld2anZieEt6SW9aZ3NqSllEcXZucUNk?=
 =?utf-8?B?SklEWDFxTGZCUU1qeG9qRjlFKzVIb1o4cUZ6WnZ6ZDZCSGFGbDdNQnFPdStF?=
 =?utf-8?B?bEZpWHFXNm50OWRKN2ZTcU1LUmdyZXFHRTJ5bjBzUGpYQ0R5L0srZ0NDYUx4?=
 =?utf-8?B?K2ZER3RuamR5VlZQLzJBczlWV1JKMEkxeUNwZWxFbW1DWlYrRUJWWFZ2VTJX?=
 =?utf-8?B?WWpjZ01aWmdxQysweWNjd1YvWXJSY3FZTGx4NEFPcklDV1BOd3ByanFKZXgr?=
 =?utf-8?B?TDNPaDRjZmpRNU52Z1NMN0ZXZmZGYXVhT1FFak9WUVRpaFZzQWIvR1lkWTRJ?=
 =?utf-8?B?bXk1bGdSWnlCRzJnSU90QUF1WnFHeVpHS2w4M0daYk40eEQrZTA3QUJOaTkv?=
 =?utf-8?B?MnpnT1NrM0d4MUFaN0liYyt1YW5JaXFDMFNQbmdBelVndFRjS1VkaTRwdkVu?=
 =?utf-8?B?NHhjdm5lTzJoUEN5OTFWZld6QnJlTDQ4cnhzSmMvMGtDS3ZBNWNBSkZja1Q1?=
 =?utf-8?B?aHhHMURUbUZROFY3cDRQU1BwYTZyKzErQlljK1lNekVkb3V4d1NkVHA1N3Fi?=
 =?utf-8?B?S3g1UWw1cFpIa2dsNEtmZDQybnM5ZUs3bVR2OUI1SGk1RHdMUEFkSVFac2xr?=
 =?utf-8?B?TmtMSzJvQlBlbXNWbmExcVRkanF4d3R6Qm5PRnpnQlJlUlNtU3lTT25yQk0w?=
 =?utf-8?B?SnpvVFh1R0ZGUHpFNXZNTnZ4Kzd3U3pNTjNqU2F0TjlreGNLbTA2MHc0WkVX?=
 =?utf-8?B?K2N6WG9Ed1lyV1JvZ1RLL0tmRDdFZytrUlJRM3lzR0NkcTd0TmxuVDAzQTRF?=
 =?utf-8?B?RlgvRmpnaFZmeUs4a0NtQ2JnOFdHVGdaRlloTklvUmxnV1hLV1N5N0VPWlAy?=
 =?utf-8?B?L3krT3piUElXRjdwT1J4TitmS0tvdDczdnkzWG94TTZVQzdHZGFQVVExMDRY?=
 =?utf-8?B?dWhUY01KVHhLREVhMFlEdzJ1enZWRHVIaW9UV1Fhb0hSUU15NkVyRU1yeFBp?=
 =?utf-8?B?WmExYXZhbEtjUmtRbHFRWThySXZGT0UxdWlEaEpheXpEY2R0Z0ZZYmcrVjNW?=
 =?utf-8?B?eDVNUlNxS1BvMzJNVWxieFNaSFRCV1dmckxONi9IdVJFOU1HbEdoZWVDMzBi?=
 =?utf-8?B?dFZ5ZGtMZzRxTitZanhzN0RuMkN5U1R3VlBNWHc3NG1CVTNiQm4wb1VLTnVO?=
 =?utf-8?B?OVo5bFdoVWtjK2YvU3NnNS9aZFErK1NReGRQNkl0ZE5TKzBZNXpuRnRLbFJK?=
 =?utf-8?B?RFRYaEdYSytoLzB5eXA2K2JkYkRpbTl6TDJvN3VYdzhXOWRMK2dTcWp0OW95?=
 =?utf-8?B?Yjczcm5HcSs0WFlGb1dRUmJwdFFuZE05YWFmNTlUc29pZ1dTOFRsa0c5RGNX?=
 =?utf-8?B?dGxPNUE4c3BQSmZrMHRML2hXSjU2Q3AvSmRBZTBHTVNlV0FCSE1GVkQyeHNq?=
 =?utf-8?Q?L2eA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dcd546-db4a-4a61-ae00-08dbcf1d1e17
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:26:57.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vv6cMsU9TWA/NTJFk2xo3XX0V27NTiedmJowZriRqj2Mt/zBaLBprysCOY08SIKY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7167
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-17 09:22, Alex Deucher wrote:
> On Tue, Oct 17, 2023 at 12:52 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>
>> A context priority value of AMD_CTX_PRIORITY_UNSET is now invalid--instead of
>> carrying it around and passing it to the Direct Rendering Manager--and it
>> becomes AMD_CTX_PRIORITY_NORMAL in amdgpu_ctx_ioctl(), the gateway to context
>> creation.
>>
>> Cc: Alex Deucher <Alexander.Deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> index 0dc9c655c4fbdb..092962b93064fc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> @@ -47,7 +47,6 @@ const unsigned int amdgpu_ctx_num_entities[AMDGPU_HW_IP_NUM] = {
>>  bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
>>  {
>>         switch (ctx_prio) {
>> -       case AMDGPU_CTX_PRIORITY_UNSET:
>>         case AMDGPU_CTX_PRIORITY_VERY_LOW:
>>         case AMDGPU_CTX_PRIORITY_LOW:
>>         case AMDGPU_CTX_PRIORITY_NORMAL:
>> @@ -55,6 +54,7 @@ bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
>>         case AMDGPU_CTX_PRIORITY_VERY_HIGH:
>>                 return true;
>>         default:
>> +       case AMDGPU_CTX_PRIORITY_UNSET:
>>                 return false;
> 
> I  don't recall if any userspace uses this, but this would break
> userspace if it does.

This is shielded from user space in the following manner,
1) amdgpu_ctx_priority_is_valid() is called from amdgpu_ctx_ioctl() and
   if amdgpu_ctx_priority_is_valid() returns false, we set the priority to NORMAL.
   See the 2nd patch.
2) It is also called from amdgpu_ctx_priority_permit(), which is called
   from amdgpu_ctx_init() which is called from amdgpu_ctx_alloc() which
   is called from amdgpu_ctx_ioctl(), _after_ the call described above,
   and thus priority is now NORMAL.

Plus I'm typing this on a running system with 6.6.0 + those two patches.

User space can send us down UNSET, but we set it to NORMAL.

Can I get an R-B?

> 
> Alex
> 
>>         }
>>  }
>>
>> base-commit: dc9b2e683bcba017588b9aaad80f442ad004a48f
>> --
>> 2.42.0
>>

-- 
Regards,
Luben

