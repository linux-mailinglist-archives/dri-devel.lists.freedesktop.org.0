Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B4839B4F8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470286F5DD;
	Fri,  4 Jun 2021 08:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFD86E97B;
 Fri,  4 Jun 2021 08:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCoL/kf2sBbXFfFiqkExHMOVqDYEgvox8clEDbU+fWsLKlDkbGH0lqqc/HO1PKYlJzEwLequxevBhdx0NW278ttMFOjDg+BMUr6Lwm6SFZQRd9PldL462sxK7Y/OJ4GNLVwU8VM0ky2TzkxaT5L0UhBLNC9i6UzEv0vtKYZYBftXddNEpnHpioJBSBMCQBuOY6BY+Bello/TUgT+4hjverYKDYT98XJ0RDd6P6aj9u8WT+2Hw6i9nfFqs83sNjrkOwLY4+sQ5/w+jm3e7YR9ZduOKwNpmU5F7ds5SPPsd4FG41TfZy22vCWbhIAYr6rc6kdjg7pjol4ZR/vh2oqwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVIsiyNTi/CzBASnSvckYnwI40nRWhrvL9or+RJpgzg=;
 b=KRaV8dCovsX/VATA7nt+kBbDDWkh/SzakCtyVYbzEoo3wa1BDBBK1vrR29mQhZpfNdk3B8MwvV0kfJQzAxgArAAgo5ZXDjOMxpV2pxZ6iOi5kSvhGsbuKovmjgaZ+gfTYwgGUnsRPgV/dhfsegtuaY9KqZ/QYKUmU1XNgNgs2hxZ0KnxNiIjEXBmc4sv+sQaWR7b0R2pdF1mZI5xIPJUnH6TLEn30SLAfDGm1lT8DBbIJmn+c4J1QEAGuj5XJf8yVOrQMEsNP0tWBXKsA9+J2WT7BZ6lFuVCnEfqXbovAri3z8tsD39ez1WmVFN2f5HMnVSKLlfQoG3LjT4S9JYKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVIsiyNTi/CzBASnSvckYnwI40nRWhrvL9or+RJpgzg=;
 b=ZHqmA2jG412YUzMWpyRcH+mC7hxYT41LT/lzPkYPHhxJpg5Zn5y2IvjVWzgVPhsE8uXpTdVv+8t8dmnoNMtA2ibd7DOkwGvrKxJ2BLWB1oPs46aLtWpFBgvOvxg4TqzMfrsbr8WWhXgo2WVIfVfSwhSuBmcSDL650jU1JCGZ5CQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 08:35:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 08:35:56 +0000
Subject: Re: [PATCH v3 2/2] radeon: use memcpy_to/fromio for UVD fw upload
To: Chen Li <chenli@uniontech.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <87o8cnfr3s.wl-chenli@uniontech.com>
 <87im2ufhyz.wl-chenli@uniontech.com>
 <0689a006-a0a2-698a-12d8-cb11156e469a@gmail.com>
 <877djacbfx.wl-chenli@uniontech.com>
 <c4941cb6-8c40-aad1-e61a-2786ba1ab225@gmail.com>
 <875yyuc9tt.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7bf7e03a-4733-bf66-4a81-ac712582539c@amd.com>
Date: Fri, 4 Jun 2021 10:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <875yyuc9tt.wl-chenli@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [178.202.40.45]
X-ClientProxiedBy: AM0PR02CA0202.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.54] (178.202.40.45) by
 AM0PR02CA0202.eurprd02.prod.outlook.com (2603:10a6:20b:28f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Fri, 4 Jun 2021 08:35:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e48312c8-5196-41d6-3630-08d92733c51b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3678358BE189C244613CF7EE833B9@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTj++Rls/sMf3vHIxX4I9hxKX7x3Fh0otbO6BjROPu0Wk07ZQtNu40DbJ30AvfvC8iDka0KwwL6R8RB+HqFZ5SbNMMXZrZFAZXKtev574H8DeFgY5CUbgFkkxwGezldRf8K5XrZ8PjgfHDcCXqYk7Vw1erS1Bnc+wJpgTb6lMN40huGocw8XJzKOz5g5B0fYaoVM2XlZQAMSgRgVIbBw+cOQvcMqasCoajt0TBxU+5GFHULJ5eIZ5XYL7pjCY9PBbS9JtIeoCvJx/kikoeaHIFZe3MXUZbVNzT7Rm3mn7GMqm+WjHcbZiAiXicIw9Jti1DDBIJieQ0BVmiKslOoA4OPUgcogwRM89uJGD8z7Kwtpz0yJbtewG3RTVQ+QMVb3IRHmE3ADkwzBAa/B5Ag+LRpizE0MZy1zZLkhbu6ex9JO8/GCYCc0GeJSuHZWgrlQ8IPXSh4UPwKjTE5jHCr8pJ/4VG59TdEwA/a6LdMBaMQHpEYpKTs1Czr00jb5Q7RRMLrtX87CxWjCslmIaIWKqx+NQNhDDbAQpOI39d3lyafTULWo5LtwVAPGelCM2qH3Um0FiDhCsAZReOmQMCg/okgqnR1otgm6jWQYxfn495sC7msgNOVtQDa0Hbiwwnj5XuSHJ17oQckzXj/z0glhUL7o+tQKqdg64nicsFwU1Q37hZ7BxLEK/Ysu1w7Q46in5CO1ggammdYGJrKnj6jEPfnGzYtbL3jknHHciNbfp6vt8VgklUXJxXi929a1EAC0QO/HFDHQvQeNg6wlrEqIvh1LE8Ve25dhWoqpBqT1xBY+BzvAB4YQLvPKzjFkOep1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(966005)(45080400002)(478600001)(38100700002)(83380400001)(2906002)(4326008)(5660300002)(6666004)(36756003)(16526019)(186003)(26005)(316002)(16576012)(66556008)(110136005)(66476007)(66946007)(31686004)(2616005)(956004)(8676002)(86362001)(31696002)(6486002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sk9DZExjSzh6dzFBNkdjKzhLa09Td1hDN3lld1RPOVNqWVJidUhxT0RpNGh3?=
 =?utf-8?B?cW5uK1lPWXA1RUM0bEw2elJOenVENVJpc0lQbzZaRVdlZVZ4ZUJUclVKcXlY?=
 =?utf-8?B?TzkybXorbUhOczh6eGpjVFl3OXU4bXJ1WWlWTUFEUUF3UmtINjRNN2ZnVVE4?=
 =?utf-8?B?bTFUU0R4MFNieTNRSGhKT2tNVXhWM1RyRHBiQ0tXMERMRnJkWSt6VnN4YnJS?=
 =?utf-8?B?QkwrcHZQUnJzRGk2SC9pZVRKSnRMNzdoLzFMc2lyRmNoMTl5U0N5RjJGVFhp?=
 =?utf-8?B?NzcrcWtzWHB4UW1lRUt2M2pEY2pNdlRvNlNpNDFsZ2VmcjUrbGg4QzBEcjlp?=
 =?utf-8?B?VzZUcVFiSzk3VUdEeGhheVE0enh4Nm1mbnYzMHphZDlEM1JlN2p2eC8ycy9V?=
 =?utf-8?B?UUFYbG1YaWZhaEtuZTZsSmRzOFZuOU1Tcm5OeHRacVVSMWE1Z1JBUnJRYWdV?=
 =?utf-8?B?SHdzQUxPMkg3TXpieldOZzB4b2xmSkliVGcvUEcrMjhreHBNZVY0b2RCSkw2?=
 =?utf-8?B?UlpmWHU4VlllWlY4bU4zVDA4TVhrU1l3Q09VM2xKZFhrVWxaS1g3Yjl4SnlP?=
 =?utf-8?B?bTUrYzF1S3UvNFRhU2dtSzNKS1RJbVJpSzdRNnNUcEJkanF6Zjllc1IzYnNi?=
 =?utf-8?B?bWN1SnNnamNaQkVqNEpkYmI0VW9vbU9sRjJkNkdDOWNxb1BzbVh5eUl3aDEy?=
 =?utf-8?B?eE12NEpEdFFHK1d2VXBROG03cHgwa01HYWliSEtDUFp2clpFYnZuSFZDM3dY?=
 =?utf-8?B?d3AxUmxWUFBJd1k4Y3V2VXVFY1VYYTFZZG9vS055aVRyUExnNVA4Ulp0SGFH?=
 =?utf-8?B?VisrL1JkVTVReEdPWEJndkFSSlZLbFp1SmczVHF5U1p1djhLcEl4U3pZZTlM?=
 =?utf-8?B?RDlZekc2VEpOYm9SZ1UrVlpWeFZzN3FJczNNN0NFWWpkdG1ISG44ZjRZNW45?=
 =?utf-8?B?aWdSYWkzQlU5WjlkN1R4NkV5bDZwTE9POWt4VVZ3cWx6akxjc1NaWmhCUncr?=
 =?utf-8?B?RXFZVzBJWUxrZVlieXQ5Rk81TUFSc2VuK2xGTkJXb2l5QW5nMDN4Z1lQOGZH?=
 =?utf-8?B?VG1Eek1DQWhWZXFtYm5SN2JORnpDMUZTZWdueDE3Sk1jS3psQ0YraHNycHF6?=
 =?utf-8?B?TytQYXRGZWZ4RUh3bm5TT1JPTFc2cXZDaHhYL1FFOVRHd2xrdTlnc0JtRnNL?=
 =?utf-8?B?bTlqdzNnS3BjR1EyMm9ra3V4UXExVjVCeUhrV3BHZWtOd0dyZGttSEpPa2VC?=
 =?utf-8?B?V2V5UWJFa0VUb2VTQTdvV0U3T1NLT3FCL0FMd3d5ZGJ4b1VHWW5ZblJaUmhL?=
 =?utf-8?B?RVZSbEFnRjFtQXBwcDNKNitNWVhraHdNNzRieUVoa25jQVBpMkxJVmI0eDlm?=
 =?utf-8?B?clVNODJQMStYcU5mNHRIcThIQVc1Qy9MSHN2ZVVVOW41UFptSFFYaFBacktP?=
 =?utf-8?B?NGxlSktJR3NYaXJxTUg3UmtRMHRKcFk2SDhUaXJsMHpucEwrYTg5M05sdStR?=
 =?utf-8?B?cWw5TUhIRHFhSkJGcUQ2Rm91SFFZamVvOFltT1dqWWVtZ1hkUUF2T0tsZHhx?=
 =?utf-8?B?OUFVUmxrZmhraHFlV1MzNVNTUkF6N2hQS1pSQWZ0bzNybkZDUVJHMnhQUzdD?=
 =?utf-8?B?cUQ3Tmw0T05Oc1FTWHhkOTJqcHBHWVJOd2VRTkV1aDFLL1c5NHA1L1ltRUti?=
 =?utf-8?B?M1Yyc0Fyek8xbG1zakZwbnczVThlS2F6THdNckh2SCtraDBnVTZobitDcDBt?=
 =?utf-8?Q?9gEnrbBHnwvpv4pceG/ArffgWbanrXpQTjTgjaL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48312c8-5196-41d6-3630-08d92733c51b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 08:35:55.8033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fHCiTFuWqqAhYrJCagqJFNFTpU5ciWOqMUgiR6rz3KNQxwEmqdZjDnhskJ/bmTZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 04.06.21 um 10:28 schrieb Chen Li:
> On Fri, 04 Jun 2021 16:08:26 +0800,
> Christian König wrote:
>>
>>
>> Am 04.06.21 um 09:53 schrieb Chen Li:
>>> I met a gpu addr bug recently and the kernel log
>>> tells me the pc is memcpy/memset and link register is
>>> radeon_uvd_resume.
>>>
>>> As we know, in some architectures, optimized memcpy/memset
>>> may not work well on device memory. Trival memcpy_toio/memset_io
>>> can fix this problem.
>>>
>>> BTW, amdgpu has already done it in:
>>> commit ba0b2275a678 ("drm/amdgpu: use memcpy_to/fromio for UVD fw upload"),
>>> that's why it has no this issue on the same gpu and platform.
>>>
>>> Signed-off-by: Chen Li <chenli@uniontech.com>
>>> ---
>>>    drivers/gpu/drm/radeon/radeon_uvd.c | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
>>> index 85a1f2c31749..55abf9a9623b 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
>>> @@ -288,7 +288,9 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>>>    	if (rdev->uvd.vcpu_bo == NULL)
>>>    		return -EINVAL;
>>>    -	memcpy(rdev->uvd.cpu_addr, rdev->uvd_fw->data, rdev->uvd_fw->size);
>>> +	memcpy_toio((void __iomem *)rdev->uvd.cpu_addr,
>>> +				rdev->uvd_fw->data,
>>> +				rdev->uvd_fw->size);
>> The coding style still looks wrong here, e.g. it is indented to far to the right
>> and data/size can be on one line.
> It's really werid that the patch before being replyed has not this coding style issue and do always indent the same with previous memcpy(in all of v1, v2 and v3),
> you can check at https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F87im2ufhyz.wl-chenli%40uniontech.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C3faf061c19b54a68e72508d92732cd5e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637583921450406148%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=b0726ORwyeLQsKVzqjfZEMaU4Vi543szpFYoHekPMIU%3D&amp;reserved=0 Cannot figure out what happened, sorry.
>
> I'll take merge them in single line in the next series, thanks.

It's not much of an issue, just make sure that checkpatch.pl doesn't 
complain.

Christian.

>> Apart from that the patch is Reviewed-by: Christian König
>> <christian.koenig@amd.com>
>>
>> Regards,
>> Christian.
>>
>>>      	size = radeon_bo_size(rdev->uvd.vcpu_bo);
>>>    	size -= rdev->uvd_fw->size;
>>> @@ -296,7 +298,7 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>>>    	ptr = rdev->uvd.cpu_addr;
>>>    	ptr += rdev->uvd_fw->size;
>>>    -	memset(ptr, 0, size);
>>> +	memset_io((void __iomem *)ptr, 0, size);
>>>      	return 0;
>>>    }
>>
>>
>

