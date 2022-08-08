Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A758CD45
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 20:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E859510E1E4;
	Mon,  8 Aug 2022 18:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD4510E397
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:03:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEei0cKm6OKursiSp2rE1cFGo5YLKiaTPQzz/8TOHLwGiJLxsm+bYKQWkN6WbJPR/k/am1irKnTM7R36OGMZKIKpqOmItRp8a/mMP0KEQu9LG28DPNgm8aQ4nKWmEUR5AMaQgxewxnaSinjKBYi3FrphrBhf4/ZkCQXoPbNUF3jeXrYV2sDOzss3NnJCuu6TRU3XbX6+FguggLJZRa8ZYObgHOHHDiPjFy883A8ygAc3I4gAakxih1ohvSNeLgLjKZNd7u+JUGJU2R2qZCiJS+dwQPDhc4aHzNdxHKnEtx5Eh+RtnP67lJYftqek9eCsIrZtnFp8MStwgLf4rhotiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8RiFEya9nomDUDWnro0ALYCv5QU+y0Ns04ddMh4kOM=;
 b=a3HTruJ6jcOZYNDEmem/XaO0EdUO5zpcIcpu3PJbCYoScMVShtnA73mq0jIEcZhrfR7IQqY6ad5ATX7Kki+LQf8dFK+wN6UsJBMJSMUIZMZe/bcuTztgc7BRymwbl3L8w6hfz+hIbZXhZi04HcSPl/uB7+rLZRwzddxA/p4dyAaTh3fe+xKDrGdPfIsvi0vw4/Lj0IU75CT2TY4aZDp54dxDfk1ozOxIg7mnozvYSHBh+A7lRmeH8gcGjpqeeRFeFywtgxHH2rAKgkJvOH0ZbTnOa5VDf/oTsDLflkDQzsm/J+cAQ3aaK3M/A0baTHc3VYXgnBsNMrN14Mbxo3y1rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8RiFEya9nomDUDWnro0ALYCv5QU+y0Ns04ddMh4kOM=;
 b=1lR+tKylou07WoVnflJlijymnkMHP2SlFJILYnAGy3Y7/2+pxkPbY//ohIVDacKtzcTJqzrV5uP/5zsugm7uNRH6nJrHnV8lKbL5zLZ/vugYTXbehsTDXMRQyh75eC8sr1qUGJhfSST7iLXkewwUayo88V+OUc4rWeaC15VCWks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB2878.namprd12.prod.outlook.com (2603:10b6:208:aa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 18:03:38 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 18:03:38 +0000
Message-ID: <64bf4e4b-4e22-0ff0-5f92-76f603c04ec0@amd.com>
Date: Mon, 8 Aug 2022 20:03:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/gem: Fix GEM handle release errors
Content-Language: en-US
To: Chen Jeffy <jeffy.chen@rock-chips.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
 <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
 <7cd16264-fa84-7b50-f3ed-64f7f22dcef2@rock-chips.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7cd16264-fa84-7b50-f3ed-64f7f22dcef2@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74e0fd20-5af9-4b59-fc3f-08da796851bd
X-MS-TrafficTypeDiagnostic: MN2PR12MB2878:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CaUoo5EyXwv18i6i0jj/sSlrgqS8Baze68DvEoJIgNSVAPf4hc6XWVFjI2MqLROIafJGoiDrrLVoe+vG5Y6Pb4yoyvoei6U9rvFXaAvt8qw30xTNnwAS/XUHEIUkMAG4aDohyUE434xNph/yKlBkMJD+x7GVByfy4WSA3QC1EgtJCf3Y9p7RM3J/26ZWohEtRqmwRvCX85CwO4nUg15hrlRardapQsd6ICv0W1diZdYcMapnDKRF1IPe8p9F/X+7RnNc5tBrS6HMeEsQjGXeP0p7C37zmsSZVk8QWrFztX3kmOgsuRXQx5iM3yXTwgf1aqpL+xNIQcvXZdO34OU1h1o/xkE/Vd4+RH4hAz5cK7aK9E6h2GBzw8LCDMn7A1mMKRCoFa6n0+IxCdC3wFeC4L5WyvrooniSLo4a3vFQdI3obzlVDfFnjSsrv30EE3l9ZPokA805V+yQ9cC8Hw8CqdpeI6Qx9aASLdKlf6e/wQsFR+9LMfveuJqfY9Ah1u31w2JMWwq4v+GTYBFD3dgziGm7siayBI/z58Dwcukcpbd/9UoLNET45Tmf2dOZ2yKHBFzKg0v9/r+FjrAFYaWSVMaQ+TJl8MPXwUl0KrKGC1c3CEhNclAsDEze0x7DgqPv5OIuBZF6lucPn6IfM08P+VXjEhFkbYLuVL8TrrFHeapI8ltFkUoGmI9XGNCmUQeehDuBeiXmBKdggVL4HB9LRzxIAg3Rs6MEzQ5AbjSgtgLhQZmlOy9dhgl4RgufKD1PTgAYG1NFdbOpdHs1svKif8engLLrJ7Szhu8gF7VxfuwcdQStDgeoHiwBQQ/hB6QfajQkGuIGhwfvgTsnQi9ZSxwuPr9abj3Ui9oatPRUKWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(110136005)(54906003)(8676002)(5660300002)(41300700001)(2616005)(66476007)(66574015)(478600001)(86362001)(31696002)(36756003)(31686004)(186003)(316002)(4326008)(7416002)(8936002)(6506007)(6666004)(6512007)(66556008)(66946007)(2906002)(38100700002)(83380400001)(45080400002)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkdRYmYwamlLSmQxcXJqU3FZZk5JMWY4TE5KSjRkVHRyVWhraTFVdzBUNnc1?=
 =?utf-8?B?OG1XZWRDaXdkaVNsWGxQZUJIanQyVS9oOG9xNVUwc1J2c25jSVMyMjZUUHFm?=
 =?utf-8?B?ZFFreVRvaTNXcHZnZ3ozYjBjeXpHT0YxSE5hWGpSYUEyR2UwODRCNHBXS1VS?=
 =?utf-8?B?Mzh0ZkVYc3RwaXA5WG5zM0RnRWRsdHpvOUxmRXJwUDdkWFoxaHl6MXprUG4r?=
 =?utf-8?B?RmtuaThlM1hQdHJBeWMraUJGQUlzUnJVdDFqTnQ0Tzk3Qks0MUhkQkdqTkNT?=
 =?utf-8?B?K3hIUk16ckRGYVdua21uTzNveUx0RHlaY1M2NVBMT29kaWx3eUd4bTJIRFNF?=
 =?utf-8?B?TEZjYXZUZldhQUptZHh6bGgxYmlmMGRLTzFwMGhnWEZ4MVd1MXdGOVY4RXY4?=
 =?utf-8?B?akJIK3VJOXR6djZ1Nk4yai83dDZEMUZ6SHBoVGlFYWFCMUttREEzRXg1bUor?=
 =?utf-8?B?Zit0SW0xRHhmQTFEWVZQZ1lsRWdLM2MxcjlFK1JoQUF3eTVlTE8xeHVOcGo3?=
 =?utf-8?B?cDVzSTlqMHpZNXh3T2d0SjVTaFcxZU5uMWpVMFdRYTZ5b2xzYUtlNEg5ZWxU?=
 =?utf-8?B?M3oySEpIQUdCaWFrdjFyKzBMbDVZcHo5U2ZuYUU0U3Z4U2hPK1FiVGdQVTBm?=
 =?utf-8?B?dVhHUndocFNTNWZ3QVJGRzY4UDB1eFBtc3h4T1dMRDZoaWl2TVRYQzhpSy9s?=
 =?utf-8?B?MEdBSzlTVVA4aU0xRnZGYkt3ZFU3d1NsaDg3SExuK244c05vS09XZDNLMzBL?=
 =?utf-8?B?VFArUEFoQXl2QXd3dllVaStQK1VWVWdyUWJWUmk1RDRKQ21RejBTeG9BNlli?=
 =?utf-8?B?M0VFdDMrZ2ZtL04yblJEYWMvWFQxZzBRczF1OUhQUDdMbzBGWjBQUy95WnNr?=
 =?utf-8?B?ZHBEOHBLNzRQYkl4UEREM255Y1JKeTBNdW1aZ1U2QjU0eG9TeXJkVHpSbGtM?=
 =?utf-8?B?V2VkVkhxVTZ4U1cyWC85UXlPQkx0SGtpZndJODM2S1FQZDR1S3picHB6NDNu?=
 =?utf-8?B?R0xtcWJrVWpoSmxOZ0o5SzVsSEVsdnc1bHBXdEVsMFF6NExvekhLZjhtbE9z?=
 =?utf-8?B?UldkMzdZYmJpdE16cEdtbWdKdXBXbGZNSGFXVDFncUNkdXE5N2g2ZnJsdmhY?=
 =?utf-8?B?MUN2T252UFJ2cHc3MTl3Wlk4TWxBNkhYMU5FTktycE45bXdPUjN4M21rcGVT?=
 =?utf-8?B?ZUJFUmJQUmdQNG5TMEVuRVBka0lUejE5Si9iR0k1eTh6U1U5Ui91TzRsOHJT?=
 =?utf-8?B?OGd3aXdwMjBYQ2E5VUVwOHF0V2FscGo0WEZ0Mk9kMGw4V0dnZnZaRnFVRzZj?=
 =?utf-8?B?VjFnc1VYNDlFc3QrZTk4SzU5RnFqV1kyYVhQY2dSbW82dnZkb3B6b2N3cjFj?=
 =?utf-8?B?OWV1VDQwR3dEUGtwb3MyZmNIeHVGeGQ3MktubWttMWU4SDZaWG1YRWg1RzRE?=
 =?utf-8?B?QlU0S1RNSFcyQVlLWG1BT0liTk9YTDR5OCtNeWg4bSszNVFGTnFXNkExd05n?=
 =?utf-8?B?VnJnQ09VZlBoOTU3dXBNcFp3cVhXQmhEZUNCZTlIVEtuTzhtYTlyTXdET2pK?=
 =?utf-8?B?d3ExcFQrenM2TDZPSi95Yml6S1cxR2cza1BJUnB2VjV0OEQxd2tVRkcwM2hD?=
 =?utf-8?B?SmdwMlp6bHpZcmwzNGN6cGFiKzl6THJyR2NqNFErdUpnMFFpWnY5Q2JNNC9R?=
 =?utf-8?B?WGw4S1ZJRHZvL3gxNzBrNlVzbWh6anV2bDQ5aUtRYm95Z0JmU1ZrVVFlaHZ0?=
 =?utf-8?B?cWNXMkM2ZWZ1d2crd215VVR0WjZWdWttZGJMYjh2ZkJQOGJEcUdqV291VE8r?=
 =?utf-8?B?RjNiTG9wY0lINkZHUHQwdHlZUEljNlFZRHVmWk9mZ0xjUkFIM0s5Y0dBZzBp?=
 =?utf-8?B?SDBLYkZmNnN4cXkvbXdMTVBOYnJ3WmJUa1l6MnNqNEZOcUhIV2JOSWtlcjFj?=
 =?utf-8?B?am5tT25mU01JZmZjdkJnSTVNNDA2cDBzSXBaaEVYTU5PODU4NXkwR2VRazYz?=
 =?utf-8?B?K0N4TWVoT1VXZXIyQUpTM1ZtK2liY2xhY1lDdmJFTWc0enJ2ekFpN3lseG5u?=
 =?utf-8?B?Zit2RGtudGt0N1BPWWtyTHJlOUdKZU1Cb1Z1OGVueEFtRXJtNFEyU3grWG05?=
 =?utf-8?B?aGxlNS8va0lGVzVTTk9mRHpVTm14SEVGSm5UaDV4Y0hKUmtRbnROS0tsWUQw?=
 =?utf-8?Q?zBMN5YuDcqAZKwuWHoU7xaUVJxlgkQUxRDsnR3maFg1T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e0fd20-5af9-4b59-fc3f-08da796851bd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 18:03:38.3655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCxuaOx0cktSS6F18+ustuzXB+/DyW3ptzZWUYDpvkONZ43yL5MvTtwo4TS1Xl+Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2878
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jeffy,

Am 08.08.22 um 05:51 schrieb Chen Jeffy:
> Hi Christian,
>
> Thanks for your reply, and sorry i didn't make it clear.
>
> On 8/8 星期一 0:52, Christian König wrote:
>> Am 03.08.22 um 10:32 schrieb Jeffy Chen:
>>> Currently we are assuming a one to one mapping between dmabuf and 
>>> handle
>>> when releasing GEM handles.
>>>
>>> But that is not always true, since we would create extra handles for 
>>> the
>>> GEM obj in cases like gem_open() and getfb{,2}().
>>>
>>> A similar issue was reported at:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20211105083308.392156-1-jay.xu%40rock-chips.com%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cd7488e9f235041f7e84408da78f14882%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637955274964656400%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=9G2YbHcYUs1VQYyvjXwLzYawNw%2BP8i%2BjjPBSHx3r2yg%3D&amp;reserved=0 
>>>
>>>
>>> Another problem is that the drm_gem_remove_prime_handles() now only
>>> remove handle to the exported dmabuf (gem_obj->dma_buf), so the 
>>> imported
>>> ones would leak:
>>> WARNING: CPU: 2 PID: 236 at drivers/gpu/drm/drm_prime.c:228 
>>> drm_prime_destroy_file_private+0x18/0x24
>>>
>>> Let's fix these by using handle to find the exact map to remove.
>>
>> Well we are clearly something missing here. As far as I can see the 
>> current code is correct.
>>
>> Creating multiple GEM handles for the same DMA-buf is possible, but 
>> illegal. >
>> In other words when a GEM handle is exported as DMA-buf and imported 
>> again you should intentionally always get the same handle.
>
> These issue are not about having handles for importing an exported 
> dma-buf case, but for having multiple handles to a GEM object(which 
> means having multiple handles to a dma-buf).
>
> I know the drm-prime is trying to make dma-buf and handle maps one to 
> one, but the drm-gem is allowing to create extra handles for a GEM 
> object, for example:
> drm_gem_open_ioctl -> drm_gem_handle_create_tail
> drm_mode_getfb2_ioctl -> drm_gem_handle_create
> drm_mode_getfb -> fb->funcs->create_handle

Yes, so far that's correct.

>
>
> So we are allowing GEM object to have multiple handles, and GEM object 
> could have at most one dma-buf, doesn't that means that dma-buf could 
> map to multiple handles?

No, at least not for the same GEM file private. That's the reason why 
the rb is indexed by the dma_buf object and not the handle.

In other words the rb is so that you have exactly one handle for each 
dma_buf in each file private.

>
> Or should we rewrite the GEM framework to limit GEM object with uniq 
> handle?

No, the extra handles are expected because when you call 
drm_mode_getfb*() and drm_gem_open_ioctl() the caller now owns the 
returned GEM handle.

>
> The other issue is that we are leaking dma-buf <-> handle map for the 
> imported dma-buf, since the drm_gem_remove_prime_handles doesn't take 
> care of obj->import_attach->dmabuf.

No, that's correct as well. obj->dma_buf is set even for imported 
DMA-buf objects. See drm_gem_prime_fd_to_handle().

Regards,
Christian.

>
> But of cause this can be fixed in other way:
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -180,6 +180,9 @@ drm_gem_remove_prime_handles(struct drm_gem_object 
> *obj, struct drm_file *filp)
> drm_prime_remove_buf_handle_locked(&filp->prime,
> obj->dma_buf);
>         }
> +       if (obj->import_attach)
> + drm_prime_remove_buf_handle_locked(&filp->prime,
> + obj->import_attach->dmabuf);
>         mutex_unlock(&filp->prime.lock);
>  }
>
>
>> So this is pretty much a clear NAK to this patch since it shouldn't 
>> be necessary or something is seriously broken somewhere else.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
>>> ---
>>>
>>> Changes in v2:
>>> Fix a typo of rbtree.
>>>
>>>   drivers/gpu/drm/drm_gem.c      | 17 +----------------
>>>   drivers/gpu/drm/drm_internal.h |  4 ++--
>>>   drivers/gpu/drm/drm_prime.c    | 20 ++++++++++++--------
>>>   3 files changed, 15 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index eb0c2d041f13..ed39da383570 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -168,21 +168,6 @@ void drm_gem_private_object_init(struct 
>>> drm_device *dev,
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_private_object_init);
>>> -static void
>>> -drm_gem_remove_prime_handles(struct drm_gem_object *obj, struct 
>>> drm_file *filp)
>>> -{
>>> -    /*
>>> -     * Note: obj->dma_buf can't disappear as long as we still hold a
>>> -     * handle reference in obj->handle_count.
>>> -     */
>>> -    mutex_lock(&filp->prime.lock);
>>> -    if (obj->dma_buf) {
>>> - drm_prime_remove_buf_handle_locked(&filp->prime,
>>> -                           obj->dma_buf);
>>> -    }
>>> -    mutex_unlock(&filp->prime.lock);
>>> -}
>>> -
>>>   /**
>>>    * drm_gem_object_handle_free - release resources bound to 
>>> userspace handles
>>>    * @obj: GEM object to clean up.
>>> @@ -253,7 +238,7 @@ drm_gem_object_release_handle(int id, void *ptr, 
>>> void *data)
>>>       if (obj->funcs->close)
>>>           obj->funcs->close(obj, file_priv);
>>> -    drm_gem_remove_prime_handles(obj, file_priv);
>>> +    drm_prime_remove_buf_handle(&file_priv->prime, id);
>>>       drm_vma_node_revoke(&obj->vma_node, file_priv);
>>>       drm_gem_object_handle_put_unlocked(obj);
>>> diff --git a/drivers/gpu/drm/drm_internal.h 
>>> b/drivers/gpu/drm/drm_internal.h
>>> index 1fbbc19f1ac0..7bb98e6a446d 100644
>>> --- a/drivers/gpu/drm/drm_internal.h
>>> +++ b/drivers/gpu/drm/drm_internal.h
>>> @@ -74,8 +74,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device 
>>> *dev, void *data,
>>>   void drm_prime_init_file_private(struct drm_prime_file_private 
>>> *prime_fpriv);
>>>   void drm_prime_destroy_file_private(struct drm_prime_file_private 
>>> *prime_fpriv);
>>> -void drm_prime_remove_buf_handle_locked(struct 
>>> drm_prime_file_private *prime_fpriv,
>>> -                    struct dma_buf *dma_buf);
>>> +void drm_prime_remove_buf_handle(struct drm_prime_file_private 
>>> *prime_fpriv,
>>> +                 uint32_t handle);
>>>   /* drm_drv.c */
>>>   struct drm_minor *drm_minor_acquire(unsigned int minor_id);
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index e3f09f18110c..bd5366b16381 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -190,29 +190,33 @@ static int drm_prime_lookup_buf_handle(struct 
>>> drm_prime_file_private *prime_fpri
>>>       return -ENOENT;
>>>   }
>>> -void drm_prime_remove_buf_handle_locked(struct 
>>> drm_prime_file_private *prime_fpriv,
>>> -                    struct dma_buf *dma_buf)
>>> +void drm_prime_remove_buf_handle(struct drm_prime_file_private 
>>> *prime_fpriv,
>>> +                 uint32_t handle)
>>>   {
>>>       struct rb_node *rb;
>>> -    rb = prime_fpriv->dmabufs.rb_node;
>>> +    mutex_lock(&prime_fpriv->lock);
>>> +
>>> +    rb = prime_fpriv->handles.rb_node;
>>>       while (rb) {
>>>           struct drm_prime_member *member;
>>> -        member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
>>> -        if (member->dma_buf == dma_buf) {
>>> +        member = rb_entry(rb, struct drm_prime_member, handle_rb);
>>> +        if (member->handle == handle) {
>>>               rb_erase(&member->handle_rb, &prime_fpriv->handles);
>>>               rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>>> -            dma_buf_put(dma_buf);
>>> +            dma_buf_put(member->dma_buf);
>>>               kfree(member);
>>> -            return;
>>> -        } else if (member->dma_buf < dma_buf) {
>>> +            break;
>>> +        } else if (member->handle < handle) {
>>>               rb = rb->rb_right;
>>>           } else {
>>>               rb = rb->rb_left;
>>>           }
>>>       }
>>> +
>>> +    mutex_unlock(&prime_fpriv->lock);
>>>   }
>>>   void drm_prime_init_file_private(struct drm_prime_file_private 
>>> *prime_fpriv)
>>
>>
>

