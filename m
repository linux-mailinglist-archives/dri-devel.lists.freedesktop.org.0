Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B14B3161256
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 13:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0946E944;
	Mon, 17 Feb 2020 12:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3137A6E943;
 Mon, 17 Feb 2020 12:49:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBqByATXhGnizN0CCdKV1FyogMx1s5LHoQKwKNX3xhYU2aWGw0A6pQe0ea8ayLQxV4IZR+Yalp6pl2mqSMyO+ynmb7uCaCBsv0suZFb25SbsmLp1b+BmvRA0Ospplqtc8sGggkQdoOIKxkNolfLyc4GfNldW3Bspm/PYRTe/idvfN3yF8ZP6anFU9Aex9kjCXCGmLsTqMeRVA9E7D3D1Du3vTnYZiRg/oTIYK6E4qzpF4D7X0zDdl75YLEUajAdAx9N2UAIcjBEWHOqRU/Y5XI1U/X+wu+BsmWIB4Yio9sBRXrVboAHptKMQSV5IeV+ZJFG/MF6pV7QQ4RfZNFfbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NSmFRMw1N870owlGA73k00pN2p3TuLfzrksQxov0cg=;
 b=e3OJZRuvMcb4B/f1wHjRWEH2OiTt9hXNCAvR3LAetkQbn86/eBDnzu07GWbfwy313mAFpgmYKiXUN9xIbd4QPV23mk0cYfS+uX2f0TxQ6lkkiAyEwHniNVkiI/+1qmMwf6bCQIHuo5LM8hSxVZgn5eMdZHI7lK9WPPL5nFaxpkv2prpNJJ8v2ScSjbseF3LqUN/xsGHInE8jRj4yFSH0n8qiQrswC4AfaWJ9ZSLKj4WmxFoy2LXK+/x0pY4vEU8OAj+ZIF/naJ7YX+oL3xGhVYGmDbkAtWSRXubxcRkD8LlSImO1oENNtSw9BxP3grwdKu+N37iNVzUJ6dCZnDneag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NSmFRMw1N870owlGA73k00pN2p3TuLfzrksQxov0cg=;
 b=3BDKkYOoj9uXpLtYlPB0sCTho7Jpp0XMBIjFl594ndBMbbu8Pk1L1QxUp7qOe6Kbo4QoxSjnu8BizUA4HxdaI8Ga+vqjmciyo713odDcTv2Hx4m6buaocTRQzVOHerXlTLUQTHXF3yMUasWoH/2xbRu5M2ge1PbTd0z8FZeUWFI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB2550.namprd12.prod.outlook.com (52.132.143.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 12:49:56 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2729.028; Mon, 17 Feb 2020
 12:49:56 +0000
Subject: Re: [PATCH 6/7] drm/bochs: don't use ttm bo->offset
To: Gerd Hoffmann <kraxel@redhat.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>
References: <20200217101841.7437-1-nirmoy.das@amd.com>
 <20200217101841.7437-7-nirmoy.das@amd.com>
 <20200217124119.et35zk6ndp73nlfy@sirius.home.kraxel.org>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <c8cee9fa-3501-9799-a12e-2ba73f5f9cc6@amd.com>
Date: Mon, 17 Feb 2020 13:52:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <20200217124119.et35zk6ndp73nlfy@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR0102CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::23) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f26:1400:bc11:1ead:619e:c67c]
 (2003:c5:8f26:1400:bc11:1ead:619e:c67c) by
 AM0PR0102CA0046.eurprd01.prod.exchangelabs.com (2603:10a6:208::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Mon, 17 Feb 2020 12:49:53 +0000
X-Originating-IP: [2003:c5:8f26:1400:bc11:1ead:619e:c67c]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbb98f48-7764-46e4-706f-08d7b3a7e3f6
X-MS-TrafficTypeDiagnostic: DM5PR12MB2550:|DM5PR12MB2550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB25509A366BF3E747ED7D82B68B160@DM5PR12MB2550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(189003)(199004)(6666004)(52116002)(4326008)(478600001)(2616005)(316002)(110136005)(2906002)(66556008)(66476007)(66946007)(5660300002)(6486002)(36756003)(31686004)(186003)(53546011)(7416002)(16526019)(81166006)(31696002)(81156014)(8936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2550;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnLidFCQyxdLrF/W2iaDGuG/eA/HIAe0v4NNHJWAsmFqRNc3YSNoI5Sfez6nrXPyp/FB/ywzXkKemsdutcA4L3MpBqCjxgW3ysMrMkpwBrbKrozP+25IOxEjunuOCxZTnvNuD6bXheTy2PUCnles3rOX3zyeZbZpb2O6JCbYyvqqaP4/WpgzpLPHcUEBWpatB6edrSW8eTq2qQrYmCG6hcmoKKPbtZZbKeiZ+5uWUCch+hd/AifxBbNsrx/NF4kgG9IzUpuKhMiHEwHVmy/k8jLaI2fo155W5zUMoVjCqJ0O4maZOMMi/6J3O8Nxl9aDEwV+4pSR8ZFAlcfStIi1b8WpER4wjumepKsBBegPcTTEtxstHs3NYuXs3Ag81Nn+GXH+I6u0SqiMU2XuAA/X8oeIBgpNNHZGiA7y3Z0FUcPqr0fFBlOK66cLY/H7Ku41
X-MS-Exchange-AntiSpam-MessageData: 8dQ0czNIHNn5RIQVK0Zn9+gcBS4+8a/wwtWdGM58Usw0c1KUB9T25eNyEvtjQwRRYtlTZ0AsZrZBRpjMfgN4u6/NlOsEvaFBmavXeXgZ7Vg0v0bcnSjhWklsXvQns0lajkHlJUvNjExzQAh+1bJRLQwcAz2NV7FFbZ6LhLzb1MTPItZlNOk4nmuaQJ72x+rUYwvTU6vl1FqAHeak63QoXw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb98f48-7764-46e4-706f-08d7b3a7e3f6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 12:49:56.3772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wn/kYOUvmGCNeZnobSxVyaKt3VcAl2JPgHxT9l6EpnjI633Sby+la0Lg73sP1NdZidD37vKx7+Y3ygafo1Yvlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2550
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
Cc: thellstrom@vmware.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/17/20 1:41 PM, Gerd Hoffmann wrote:
> On Mon, Feb 17, 2020 at 11:18:40AM +0100, Nirmoy Das wrote:
>> Calculate GPU offset within bochs driver itself without depending on
>> bo->offset
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> ---
>>   drivers/gpu/drm/bochs/bochs_kms.c     | 3 ++-
>>   drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
>> index 8066d7d370d5..852ec7910d84 100644
>> --- a/drivers/gpu/drm/bochs/bochs_kms.c
>> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
>> @@ -38,7 +38,8 @@ static void bochs_plane_update(struct bochs_device *bochs,
>>   			 state->crtc_x,
>>   			 state->crtc_y,
>>   			 state->fb->pitches[0],
>> -			 state->fb->offsets[0] + gbo->bo.offset);
>> +			 state->fb->offsets[0] +
>> +			 (gbo->bo.mem.start << PAGE_SHIFT));
> I'd suggest to use drm_gem_vram_offset() here ...
>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>> index 92a11bb42365..e7ef4cd8116d 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -214,7 +214,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
>>   {
>>   	if (WARN_ON_ONCE(!gbo->pin_count))
>>   		return (s64)-ENODEV;
>> -	return gbo->bo.offset;
>> +	return gbo->bo.mem.start << PAGE_SHIFT;
> ... and move this to a separate patch.  The vram helpers are used by
> more drivers than just bochs.

Thanks for reviewing Gerd, will send next version with your suggestions 
applied.


Regards,

Nirmoy

>
> cheers,
>    Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
