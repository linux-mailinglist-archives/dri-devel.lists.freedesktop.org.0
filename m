Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB81B2B5AA8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 09:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F276189FD3;
	Tue, 17 Nov 2020 08:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA03389FD3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 08:05:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iyf25T0Q7FLerSICFJ7dl5LhmHs+2OB8tusMdKakutc8cZHboMZk66BXBksLGLrDm+xC1Ft4bvzg7PQJY27xwrsijI93j+WI8vVVZbRXLUHHXIvn3X+03a3ikv8ceB7OqCuKqb7AhEvQ2Ajdmpxq7m4/yA+zBz5H1Lx0QoBh0Z8c9nVl4aUswou0n9ShOTqLeg9C0bsUS13mfNVZ1oN98fdp6WcRm4SQsUvR0aJrtr0Kki0bIunwmeFSZcI5IeejP3pTcBUq00zGAFi2RcEA/ulF52Bm9F372g5J6efX0N8h0DjuWJNaR/HLiZ+BckOQNDKnyh03c7bf2oUtLxTS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZm198HNn8u9zISzX2lm3xLtjzNxauRGKvOQ5St1Rks=;
 b=Z176i/e42HcxLP6FcQ2LqWGh5wyj1W9k6bd8aTy4Z8/kkFwryvuenvDwXO/jghd/lpDASyMNmRAB6P5Uds5vFLAfn7hnBbwGKKuTQqin4S8gDZ+m6jL0RZJTky0LMNmxNOsJoFZ74z3wwbZaQYhIimatffnxu/+NECULad6vhqtX8gBe/PM/EE1tNmheThcqiH3rrXLD02GsPlQCRbx4KBtqeteCwNsF1oENzaMNIMP6qkiSXkVV7pP1rFUmXSFLepFuYWp4IpH7erbMjIPoahOsI6Cev918ub5Rs3mNHCPQUXkbjZuyVKFvHazd70VYEK9c75/XPDFnFpMtZUVByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZm198HNn8u9zISzX2lm3xLtjzNxauRGKvOQ5St1Rks=;
 b=R0GhlGArHHQIydg9BFsSnssjxQsM4TaiJHiQt6pD1CVkKfBuExGbJkxhcu3uADJc6T9dgQzKZ3+m/I1AMmx2uuVeFi+5lE+gQrTebr89/Toar2UopWqSXuzbK/3lnKt0sKpkHY6fiNs+O8fpFdhVZETHeo96GzD052s8e9uHvbE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 08:05:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 08:05:06 +0000
Subject: Re: [PATCH 10/10] drm/fb-helper: Acquire modeset lock around
 shadow-buffer flushing
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20201116200437.17977-1-tzimmermann@suse.de>
 <20201116200437.17977-11-tzimmermann@suse.de>
 <20201116204827.GG401619@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9f5639a6-0aa7-e4c2-c6d8-13566ad9e721@amd.com>
Date: Tue, 17 Nov 2020 09:05:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201116204827.GG401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b973:9d27:d23a:a443]
X-ClientProxiedBy: AM0PR01CA0129.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b973:9d27:d23a:a443]
 (2a02:908:1252:fb60:b973:9d27:d23a:a443) by
 AM0PR01CA0129.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Tue, 17 Nov 2020 08:05:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3f1e93a8-150c-4945-3427-08d88acf7e73
X-MS-TrafficTypeDiagnostic: MN2PR12MB4374:
X-Microsoft-Antispam-PRVS: <MN2PR12MB437408E4C9D0BF13ADDCC36C83E20@MN2PR12MB4374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ViDed/dquBRjYJqQrM1uNb/UgO2OMVmJzPY8vWPB1uZza0acOI905JORZZ2oSdAzRekB1xa7Qwx3UjIMoxHg4D4eKo9KWBnd3Az0Kec5NG7FmmxPm6/6aZJfbxVtYNGBe+NekaUBTsjKKOzQW/6La73ZntYMeq0HWWq2Lvwgz+ulgvkH8UnMvPAMMNEyGA/ahXZ/K7QHOMTaFq/UU5xcE/sMPCF+ufso+HKHMNyZWRy5Hr8Om+mHB/P8u9egwxiEcibCvRtIJWFOANoyVxVf4AFeObVuffbxj832tcMQn0npe3aV+FY8FlarRnrE6IoBe+c/p+83NpFzi+0u3huhH5572PsN5AffVJgccl1xq6HUEFe01KeBtvGs/UezRT+c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(110136005)(316002)(478600001)(5660300002)(8936002)(66946007)(66476007)(2906002)(8676002)(66556008)(86362001)(6666004)(52116002)(2616005)(31686004)(36756003)(6486002)(16526019)(4326008)(31696002)(186003)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEpUZ05NcWxzUm9KaCtNT1ArT1Y1L3czRFhKUnF6QlRwb2p5R2IveURKaXlG?=
 =?utf-8?B?NW1ZKzErdUxRL01wb3hic01YaTY0cERSRk1xODI3ZjNLT2JSbU5EY1RWYjVV?=
 =?utf-8?B?cVI1ODJsSWJJTTgwcEIxK0I2YmFEd2huUnExOFJJVmowVzliRkxqY0w1RXVP?=
 =?utf-8?B?SFF6RmFTSmxQT0hSUXp1N2kzakpIeDlKMC9jMUt2emFzd0kwTDIyZjl1WG9s?=
 =?utf-8?B?bXNLdjBzOUJPczJTM0VVL3BJU0F6Um8zWW5uRzVucG4vMmJBMU5pYUJXQWdl?=
 =?utf-8?B?TlZSemN4ZkRTQ1F5NDBjYzBhblpvOWQ1OU14ZXp4N29RUTNvY01UVUU2NXlx?=
 =?utf-8?B?UFF3WTR4aXN3TTJQS1VGa3NSSUszVUExN3ZZczJITzUrVTdRWkk5ZnNVSDdV?=
 =?utf-8?B?eW9mcXZXeWlnSEphMnZ6OHozdWFZUnlEd2NZVGt5bXpsdDVLNXdveGJXZlE0?=
 =?utf-8?B?eTQ1VUhwWURpRU9iTTJWeERSZ3VzY09OZzZOQk5SYXBHcldVb29kU0NQdkdD?=
 =?utf-8?B?dTJ3MTk3R1Y1R3JmMEtIYUt2Y28veDNyVTNtcUNYYVZONUdSMnR5YllVRDlr?=
 =?utf-8?B?dlpoNi9DU0ZuUHdsNWE0eHVCSklXSE85Zzg4V0hxZ3VXQ0x3NGlROWFvL0Rx?=
 =?utf-8?B?TGNsN0JYTjNvSkR5YW1hOTc0LzRMak10U2lWbExuNDVrTXdvS1UvNVhJUUxy?=
 =?utf-8?B?bFVTSWZpMkR1ajdCeDZRRXBEc1BDTWg5am9rVFBIc2I4ZUJlaWNCODdQdndZ?=
 =?utf-8?B?QWJ1ZXBBNDlQODAvbEwxMnVVMzVucnpmeDgrOXVkOVJ0Y0YvMzM0ZEViZWlr?=
 =?utf-8?B?Wk44eDZEd1R4Qldud294djJnTWR2UnlDcnRja0RxWDc0dmNGQTNDNDdKeHd2?=
 =?utf-8?B?ZGErdTQvVVJKN2R4Y3BUdmhHaXYxTFRBQk4zVU1MakZ1MER6ekNUS1VaNDlN?=
 =?utf-8?B?Wit6cGZzMGlrT1NETkFtNU5yTUphbk1icTlEMVo5NEYrMWR6OElsL0FwREE5?=
 =?utf-8?B?WHVIQTdiSGlyRGVIdVkxaytVNlViOXZLZUdSY0FqV1Y2T2ZBTTBzQUt6blBu?=
 =?utf-8?B?WVZGbXJGN2MrWHJzK1NHcVc1YTBzdnFZRU1nVWtlTENSZFgxQUUvcFBEUE5v?=
 =?utf-8?B?THhIQzlEbzJVaXJpTlFhOHlGMUxwdStZdDhhWCtuZ0FaQ09tSmZQaVVJSUFV?=
 =?utf-8?B?bHRGOEhVa05zMGlVdzVnYTA4Rkd4TmNrMG0vVzJLbDlYNnhYN09RbFRvenJP?=
 =?utf-8?B?aFc2L0pGdjBXblpwS1BQRk5uVHlYSHc2YUNudjhNSjZPSFJJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1e93a8-150c-4945-3427-08d88acf7e73
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 08:05:06.3604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahGnjRpeSib6iu6ENyhErdHMsilgGrI9ErpIE21QC/4ZdXt6GuV1UzVfUjmGL2me
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.20 um 21:48 schrieb Daniel Vetter:
> On Mon, Nov 16, 2020 at 09:04:37PM +0100, Thomas Zimmermann wrote:
>> Flushing the fbdev's shadow buffer requires vmap'ing the BO memory, which
>> in turn requires pinning the BO. While being pinned, the BO cannot be moved
>> into VRAM for scanout. Consequently, a concurrent modeset operation that
>> involves the fbdev framebuffer would likely fail.
>>
>> Resolve this problem be acquiring the modeset lock of the planes that use
>> the fbdev framebuffer. On non-atomic drivers, also acquire the mode-config
>> lock. This serializes the flushing of the framebuffer with concurrent
>> modeset operations.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> I think this is the wrong lock. What you want is the buffer lock, the
> dma_resv lock of the underlying gem_bo underneath the fb we have. And hold
> that from _vmap to the end of _vunmap.

+1 Yes exactly that came to my mind as well while reading this.

If you want to prevent a BO from moving while inside the kernel taking 
the reservation lock is usually the right thing to do.

Only when you need to return to userspace AND keep the BO in the same 
place then it is valid to pin it.

Regards,
Christian.

>
> Unfortuantely that's going to be one nasty refactoring adventure :-/
>
> So I think for plan B we need something nasty like this, but this here has
> disadvantage that fbdev activity in the background can seriously hurt the
> native kms client (despite that you're trying to filter a bit, you're
> creating a big lock across all planes and we've really worked hard to make
> those stand-alone as much as possible).
>
> I think we can do better here, since we're only worried about modesets
> from fbdev itself. Nothing else needs to be able to pull the buffer from
> system memory into vram while we have it pinned here.
>
> Holding mutex_lock(fb_helper->lock) here instead, with a big comment
> explaining why that's enough, and that the clean fix would be holding the
> dma_resv_lock, should  do the trick.
> -Daniel
>
>> ---
>>   drivers/gpu/drm/drm_fb_helper.c | 43 +++++++++++++++++++++++++++++++--
>>   1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index 5a22c744378c..af485c71a42a 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -394,20 +394,59 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
>>   static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
>>   				     struct drm_clip_rect *clip)
>>   {
>> +	struct drm_device *dev = fb_helper->dev;
>> +	struct drm_framebuffer *fb = fb_helper->fb;
>>   	struct drm_client_buffer *buffer = fb_helper->buffer;
>> +	struct drm_modeset_acquire_ctx ctx;
>> +	struct drm_framebuffer *plane_fb;
>> +	struct drm_plane *plane;
>>   	struct dma_buf_map map, dst;
>>   	int ret;
>>   
>> +	if (!drm_drv_uses_atomic_modeset(dev))
>> +		mutex_lock(&dev->mode_config.mutex);
>> +
>> +	drm_modeset_acquire_init(&ctx, 0);
>> +
>> +retry:
>> +	drm_for_each_plane(plane, dev) {
>> +		ret = drm_modeset_lock(&plane->mutex, &ctx);
>> +		if (ret == -EDEADLK) {
>> +			ret = drm_modeset_backoff(&ctx);
>> +			if (!ret)
>> +				goto retry;
>> +		} else if (ret) {
>> +			goto out;
>> +		}
>> +
>> +		if (drm_drv_uses_atomic_modeset(dev))
>> +			plane_fb = plane->state->fb;
>> +		else
>> +			plane_fb = plane->fb;
>> +
>> +		if (plane_fb != fb) {
>> +			drm_modeset_unlock(&plane->mutex);
>> +			continue;
>> +		}
>> +	}
>> +
>>   	ret = drm_client_buffer_vmap(buffer, &map);
>>   	if (ret)
>> -		return ret;
>> +		goto out;
>>   
>>   	dst = map;
>>   	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
>>   
>>   	drm_client_buffer_vunmap(buffer);
>>   
>> -	return 0;
>> +out:
>> +	drm_modeset_drop_locks(&ctx);
>> +	drm_modeset_acquire_fini(&ctx);
>> +
>> +	if (!drm_drv_uses_atomic_modeset(dev))
>> +		mutex_unlock(&dev->mode_config.mutex);
>> +
>> +	return ret;
>>   }
>>   
>>   static void drm_fb_helper_damage_work(struct work_struct *work)
>> -- 
>> 2.29.2
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
