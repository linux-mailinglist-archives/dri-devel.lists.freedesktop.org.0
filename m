Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AA2473D71
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 08:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA1310E9B7;
	Tue, 14 Dec 2021 07:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1A110E8D2;
 Tue, 14 Dec 2021 07:09:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW4C/p9Exr0yUBVpCMzX8tlu68MICloZqWkJGLr25UCWKfIXom+jFbv1ZF9W9s3+eCTBvqa5ARj758gl1fw7etga61kL2VUvEkrMbNtcQMMqn0wMii0qtq2JXrvgagEb7aPgz7T3hdJKvq/xa3Sfba2RxXO/4v/egDBVEFa5BO3asrhrN8sFm9VLacKQ2NiUVyEGodgoy9pKUHZo5iDEvxX2WBaEgq8JapUIB3R6B6ddV2mDG3vcbHCRnvxJ5sVolMQYs6KOOVUACMvJqIK2e0CfbMQVtYbaBkWFEt4zwvWNIc8MCVjSzZq+4qi03MqCndFKPlM4mreZrbws04i7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0Q4j7puZtY+ouufvzLOw6TLDXc91Yj+wqCnHD0Z9lg=;
 b=TQBXl5a+AAuVAotxVG0M4R+IrL7xhPfqHJOfo4SIk9aApZzZqGmA4NNKkD6XMzpvpjhD/KRVMftGU4q72dFlUuDbUa71gIxLSFrVluBuaT2qaPYAY6ePgYv1+/+USgKRiuVHEfdLxihT+twkLSnQCwqhrNcG5E9IBxbMtIPNb6SBt8H18X4NXPlF+ZU5An45DmilO4wUZzy9ZGmNA9rKJSa+vd9L1DaZY7ubU7qC9uJziO6X+B5D8i62+yBztVHG2x4yQrJd1rB4tuT6zF/btUX6IKsiktOAsHXwC/8LuYqAL4y1iEJ5roy0BUJqJvRWpPfZSzmc+rmaYtIax/7cEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0Q4j7puZtY+ouufvzLOw6TLDXc91Yj+wqCnHD0Z9lg=;
 b=ZJCcG8osQRajrZBu6AHhkGXbii86+K6ok6B5sUdm00SHW3hvfj+nKm25MD6AbJyEX6o/8AjAWMri3/LM0d8vDXf5III7UEzUTBWfNdOvqG4C0EV46SO6OVUazzibUP4UHEdCJu5/qqwFARHdNvlLYCJ7mVYtdq9GH8IAr9AI9dc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4345.namprd12.prod.outlook.com
 (2603:10b6:303:59::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 07:09:39 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Tue, 14 Dec
 2021 07:09:38 +0000
Subject: Re: [PATCH 6/7] drm/amdgpu: Ensure kunmap is called on error
To: Ira Weiny <ira.weiny@intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20211210232404.4098157-7-ira.weiny@intel.com>
 <5bbd3c48-1388-9469-8b6f-deed64406d7d@amd.com>
 <20211214033725.GR3538886@iweiny-DESK2.sc.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c3b173ea-6509-ebbe-b5f9-eeb29f1ce57e@amd.com>
Date: Tue, 14 Dec 2021 08:09:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211214033725.GR3538886@iweiny-DESK2.sc.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::33) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5451f853-1b5f-4fa0-7af2-08d9bed0b110
X-MS-TrafficTypeDiagnostic: MW3PR12MB4345:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB43452D92257C3E72030AD8E883759@MW3PR12MB4345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjPBVXcqOz5z4lTpLNkIfKMcPOnztczZGN0l0ptN9frCgE9XKyBeLss19Gbi2Qk247VyWMT2MbdCCVmo7NxqLIcK2gEa94NE2j3T6kGaoSLUSe1WCcs8bwCOSYaN/3vf5CQ8e/rXVQA1MvXc3u02Yk6eO5BzkVrFvlemtWhFgRkzMECU6CG3kur95mlDefpLfH1dxFk4/EDc62MZr5wgh4DOqoy218kG4BPPVUWv5Xh1rRG9JIqsPTNRpkV0Rl9UqHf9gMtOVGX6oJ3+ukY8+osBi1MHmK3qnVbNDa7l/aUknlK02D6SJH4Dev8keNGXqVNfs5bAZh6GYFERMT2etMSpWywF3Ur/54VCYur9CpChyz6bciNgB8PlXtLy0W/3m6ihdc8Rakqai57DG1yNh4AXbnety+Oi2pHd49i8g4NyoRlLdzwT8voxmT6L9YHI3DM9/iC/2Z0tTkyytIAcXUGvMd+s5Is2aBAQZyNd93ccK3W6GBUycjyd9PVYE7jIq6MINO1zUyEPbsV7eDjVnEB9BXkgHvRN95GYOoXm/8OVgOJ5s3elQHqA69wGNP7hKFAfcHbjdLL90gPogkqkI78yn18okWS0Dv3hHs/KXZlIBLQmODbaxbMLrkYKN5WmQ8qqFQgCGJm6DoEiMrereYfzuGFiWfjnec3DDWen5gxIQ3lJCt61MkCatbdUQ+oj1xJQhEWwXl0uE3wHn0iZxDJMmuv50ge/vhvdaye4sl/lLd4Wvhlo/cvYQILfm26K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(316002)(186003)(31696002)(6666004)(5660300002)(6486002)(6916009)(86362001)(2616005)(36756003)(31686004)(7416002)(54906003)(4326008)(38100700002)(26005)(66476007)(8936002)(6506007)(8676002)(66946007)(6512007)(508600001)(83380400001)(66574015)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTQzd1NHbldhSTlWK2o4eGw0TlBYL1NyYjR3R1F2ZzZGMkNtRnZaVlFDeVc0?=
 =?utf-8?B?c3gvR245TVQxajFnNEdRWURvZFBQL3R6elFNeVlRKys1OFE0bWdMSnZxcXlS?=
 =?utf-8?B?Y1RXdHVYWjR6c0QrODVWY3lZemtjdW1PcTMvSHhoaHMyWWYzMm9PQWh2dHI3?=
 =?utf-8?B?NmlHdE5BOTYxN01SSm5OeXhvTlVqVm8wSGlUTmxFbTJNUG1WcXFqMkVNVWNC?=
 =?utf-8?B?RkgrN01yNDJqbUJVcXFqOGxmeXJIREVwcDM2cENkTnd5N3BLYzJOcW1GZzA5?=
 =?utf-8?B?QkRGSlc1ejZML2FFbFVpVXhDZGtzTHFjc2M2NlVkV0dYdFJWcTEyYmZlQ3RY?=
 =?utf-8?B?b2o3cSs0K1pHdThGTFJBb2NFNTlPUWJaRFo1ZklORHcvYjRvbXF4dXkwc2s1?=
 =?utf-8?B?QWUrY3cxeFBaWGVWa20vTC9qOVdodEV4Q0ZsWVlPbDBXWStSakl5RlJKR21a?=
 =?utf-8?B?c2VMSEVGbW56L3lraWRkZGNGU25uOC9UQnBDOVB4ZTdjUzZtRGU0aWV2RGQ4?=
 =?utf-8?B?KzlkRVFOKzBGUzh3VmVHaWx2WWZmUGdFMjFmRkkxUW1nK3RKSlRURGsyMERU?=
 =?utf-8?B?SzN5ME1JSlIyRHpqTTJCTFhMV25paW5mZVZRNHljL1BuQTJtWmd2eUJ1ZnVa?=
 =?utf-8?B?eU1nRC84d2R2UEpYeUt6R2poWXQ0aWE3aVNSZUhqWmtEUzdFTkRyRnBLSlY0?=
 =?utf-8?B?QVpya3VIVXpvM2I5R3ZoTVBldklvVDA5RjcxVjN0aHZzcDZRaG5TZ1FrZ3NE?=
 =?utf-8?B?Z3VPVHpyQnBsM1BpNm1BZ0hJK0JJb1VmZGNRbmh1cXJuMTNZNEtieXRYTTg2?=
 =?utf-8?B?SXVwTml3SGtpeVo0eTBRSC8zME9yUXM5TERyNUxTek5vemlsMzVCdUJZbStq?=
 =?utf-8?B?N0NZbGV6dDNlTjdJYW9xTS9pUlNLUU0wbUFwM01NcFA2TEpaTjRCbHYvUzRr?=
 =?utf-8?B?d3ZIVk4wS21JLzBBNVNsb2tiQzMzbC9sVmRWSVlUTWo3a01uSHQrcytDbG5F?=
 =?utf-8?B?b3UrNlZiejArSTBiTk1uWlRWTExuKytaeHd3a1A5aGJhMGltWmVkTGtiaGJB?=
 =?utf-8?B?SVQxa2szc0ZTNzJrZ09kOE5QeVUrbytUUlc3TzZtSGREV1lscFJaTk1mV0Ix?=
 =?utf-8?B?Slo5ZlF2empNbFQxem84aU5hVTIxK0h5cVFXUnp5OXpzc3BDZ05ERXpPK0pJ?=
 =?utf-8?B?OFl2YzVzSEJMUm93RmwrZnU1aGM1YlNsK0lHcmRxZDZPRlNUcUVKUjFDSEVI?=
 =?utf-8?B?SXEvUUNPakNHRzhudWhlSjg3ZElZME5NWXpzcDE0dm05L0lrMzRyVXkvVzRE?=
 =?utf-8?B?MkZBQ3hNZFJ3ZFRoYjAvZXZlbGVLWnBnZ2tEV2ZpaDlpbFVoMEtDNXdIa3Qx?=
 =?utf-8?B?cmkxTUNYWkg5ZUxJVWJkenVpZisxdEpFcnpBc2FoZU8xZDAyS1JoOHRMVFI1?=
 =?utf-8?B?TnRIMDVLcUh4SzVzWkNHT0RMSG5ROEp2ZGpNM25FNjRnelB1STJOYnpEQXdl?=
 =?utf-8?B?NmRiYkxjV1ZPREs2Z1p5dFc3S2VLYTkrUkloVDhiVGVYTGtITVJQdW1rcG5P?=
 =?utf-8?B?cy9xSVlOOGMwdmJ6VU10Q3BUNjZqbEx5QlFocUQ2OWJoK0lrRHdvczREUWFy?=
 =?utf-8?B?QnhFTHNtOFBYUkU2Y3hPQzlLa1gyeUhUcHFPL2R6MmZGZUovbVNET216bmNq?=
 =?utf-8?B?WjdaWHdWVGErWXVoYUt6U2ZIaHhybzY1a28zMlRwbGx4VjN0VFFtYmlmcnc2?=
 =?utf-8?B?MXRnQ3Y5eDhGZDhFR1JRWjlzTDNiZ25lYnVMaTRJakN6OTdxZ0JxZk5OYThr?=
 =?utf-8?B?cVcwN0o0Tzk2RGJFTzJyMlprNlNVMVFxOWZ6aytxUmc0T1Rmc0MzMER5M0JW?=
 =?utf-8?B?OVVFYmMyV3hBWkJsbmRyNExaZVRnWXpTL1ZHYzVXT2ZLTjYrb28yQmFJSVg2?=
 =?utf-8?B?bEhhNFJuVXgyUFEyZUVvNHZWQWpYd2t4TG5Wai9CYWpyV05TcUNYNUgzTHV4?=
 =?utf-8?B?M0VFWmNIb2E1dDVQUmE0eEoxMUF3L0pqZGcwSGF6alVaNDZqMld2cHMrUlNZ?=
 =?utf-8?B?bTlqcktQRDZPazZ6QnNSRmUzdi8xRWxSdGRtQ1lzNmJycjdiQ3BDZ2JhRGRM?=
 =?utf-8?Q?+0SA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5451f853-1b5f-4fa0-7af2-08d9bed0b110
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 07:09:38.6296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfyKD/xRjtQA+7j45FWpDNFcvU414XqXV7wbYX0csT4oKBUzm6vqWJqkU5R74J7R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.12.21 um 04:37 schrieb Ira Weiny:
> On Mon, Dec 13, 2021 at 09:37:32PM +0100, Christian König wrote:
>> Am 11.12.21 um 00:24 schrieb ira.weiny@intel.com:
>>> From: Ira Weiny <ira.weiny@intel.com>
>>>
>>> The default case leaves the buffer object mapped in error.
>>>
>>> Add amdgpu_bo_kunmap() to that case to ensure the mapping is cleaned up.
>> Mhm, good catch. But why do you want to do this in the first place?
> I'm not sure I understand the question.
>
> Any mapping of memory should be paired with an unmapping when no longer needed.
> And this is supported by the call to amdgpu_bo_kunmap() in the other
> non-default cases.
>
> Do you believe the mapping is not needed?

No, the unmapping is not needed here. See the function amdgpu_bo_kmap(), 
it either creates the mapping or return the cached pointer.

A call to amdgpu_bo_kunmap() is only done in a few places where we know 
that the created mapping most likely won't be needed any more. If that's 
not done the mapping is automatically destroyed when the BO is moved or 
freed up.

I mean good bug fix, but you seem to see this as some kind of 
prerequisite to some follow up work converting TTM to use kmap_local() 
which most likely won't work in the first place.

Regards,
Christian.

>
> Ira
>
>> Christian.
>>
>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>>>
>>> ---
>>> NOTE: It seems like this function could use a fair bit of refactoring
>>> but this is the easiest way to fix the actual bug.
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>> nice
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>> index 6f8de11a17f1..b3ffd0f6b35f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
>>> @@ -889,6 +889,7 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
>>>    		return 0;
>>>    	default:
>>> +		amdgpu_bo_kunmap(bo);
>>>    		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>>>    	}

