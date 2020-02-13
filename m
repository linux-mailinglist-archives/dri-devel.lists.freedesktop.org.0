Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EE015C966
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 18:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203586E39C;
	Thu, 13 Feb 2020 17:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE216E395;
 Thu, 13 Feb 2020 17:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFWSmy2vZ11lj53cIUKsTW+yQ3DwofBA0I1zDersVoYyQ8Od3QBKfzcSXGdR8NME15TqGzCBYfYf3AYmwRcnSxtju9BqzEvt9f7Lj6fV6cGEF15k+r59ChPtUKbJHmDJazevtDTBH3Bfe3LfxcOVGKsrtlxAZp6B4auMt/xllEUVOt8mIglOFL+c1jnn5W3C91DFB+1GAYtwoh5oRga7X11uFieWFzEJcohck7IwKJ0g66GMZN4IjrSgI6FfDaxqe+uOJUlYOjfauwxaxjGvo80qmA4GC6zO3F6OPTVgBCqL0IdCcV/S5h/cYZtfKETOH6AL+plc0N0iu6rek1nIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBIbbTiYdclf9tEK6DRNFupRApT0x1y1kK8Ye8RCMRY=;
 b=NBuhuS4ID5KSWM2HTImvuttJ0jBR3WQWUZIcreb4G+pY0SWIdMJO7TT7zqB4VfG+3hCj7oJfehSJP3rMsJp5CsYzDt+2y9wBdA2OYmgJj78lV37v23dp9DArleKWDP2gEiyi4horNL7wPiSu+afLTbmM3uQjz9Edqfch5Eyxa2+EKFOqddEPiRZzPbXL8M/VmnlJjA+VJ1ewAjy6oCY0RNUOKkQ64YQyKcca+dpSGydbS5q25hSu2GOqU1UOT7HMJ0UuOqnpwpoiA47KdCtivo+0Cb6KDbYzI2OPJq75RUM743SkIarWFnYjx7ekpj0+DPV+1D8irh9I0GCl0tIB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBIbbTiYdclf9tEK6DRNFupRApT0x1y1kK8Ye8RCMRY=;
 b=YnVaRtKON/T76K0h3ejqRSFDVZMbfBSTjw0YDjM9+pbHGLWNdSuMLnfd7gPFV+yPyE9LbvNEYBJEQ32qJShkOMhUh0A3HFGunN1bsRJfj9q9P2GBP+MYiF3gmv5u41XyKKRdXwLHTYjOO9iPEhbCTcduAqFAsK1TnfywTFhTatQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1324.namprd12.prod.outlook.com (10.168.238.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 13 Feb 2020 17:26:21 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.025; Thu, 13 Feb
 2020 17:26:21 +0000
Subject: Re: [RFC PATCH 5/6] drm/qxl: don't use ttm bo->offset
To: Gerd Hoffmann <kraxel@redhat.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-6-nirmoy.das@amd.com>
 <20200213143053.tkbfd6wr5rbspzty@sirius.home.kraxel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a87cb8e9-8697-88b0-9b70-7bc8c0a25884@amd.com>
Date: Thu, 13 Feb 2020 18:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200213143053.tkbfd6wr5rbspzty@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22 via Frontend Transport; Thu, 13 Feb 2020 17:26:16 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: de8ff9dd-bb4e-46ab-5e9e-08d7b0a9d77b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1324:|DM5PR12MB1324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB132478F6164AC16B23EB0B3A831A0@DM5PR12MB1324.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(189003)(199004)(2906002)(66946007)(7416002)(6486002)(186003)(86362001)(81156014)(81166006)(8936002)(31696002)(2616005)(16526019)(4326008)(110136005)(52116002)(316002)(8676002)(478600001)(5660300002)(31686004)(66476007)(6666004)(36756003)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1324;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDev4RFN8aife072poeUhzhQqdF/UKfetuStrXK2Kjx/fR/qIpzmkB2OiFVIBOjDyU6iNo41ewhoJWjIrs39rWVkClwYtqzCDo+v0q1ig+UkCmo3vxVsoZJ2LNsb35RrHchmcqTUqltj9hIjUNI6ZUpq9s9A7t799RUopdUOCuTUA+Ys6KvWpXq3FzqKwl5x28U8WHxlHuBRl1c3awKxVDgiVCzBJCV1mQ59rj5NO8/zncHHRLC888rRt0FVRFdyz+jshZopzFtMOCH4pwpQKQ7O5lLb9I5LV60wq74nQzmCfFcxyYVLJanP2HboKW7vATh6TCEthFuNtpYBMvf2r5mn1fj1dw8kUF49OzsOci8TcRJiWrlaT24NvPr/EVeN754kERyylKNfOB2lgDh8jIg7FwPfwy/u8dahpG/zhLrdse7jO6uEXH1o5Qha7ucu
X-MS-Exchange-AntiSpam-MessageData: rh+A2S1Jjz5Nh603/v1COyG4jfRhexlxa2LkoeXQhCu14KT4j3RfkLbJcMBqQev8l0Q5nRlEcO0tcUhHwTK+P/jdKlRJ5CS+Lk/G750eMYJGl7U0Cs7CziJYQdpvHldMR0/Gsk7risgaSilp2YsnzRKL9rk0fx+mG+jayrozOUVMwhTC5QbxykyWwmNAht8mjPj+Bf9y6uiwM2UNy4UWNA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8ff9dd-bb4e-46ab-5e9e-08d7b0a9d77b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 17:26:21.1970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFnJVDuFV70uWkod8/bbu9FmQ7haR8/mieng0N8j4varyE93XdXj+LNJ1AR5wuKS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1324
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
 alexander.deucher@amd.com, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.02.20 um 15:30 schrieb Gerd Hoffmann:
>> @@ -311,10 +311,8 @@ qxl_bo_physical_address(struct qxl_device *qdev, struct qxl_bo *bo,
>>   		(bo->tbo.mem.mem_type == TTM_PL_VRAM)
>>   		? &qdev->main_slot : &qdev->surfaces_slot;
>>   
>> -	WARN_ON_ONCE((bo->tbo.offset & slot->gpu_offset) != slot->gpu_offset);
>> -
>> -	/* TODO - need to hold one of the locks to read tbo.offset */
>> -	return slot->high_bits | (bo->tbo.offset - slot->gpu_offset + offset);
>> +	return slot->high_bits | ((bo->tbo.mem.start << PAGE_SHIFT) +
>> +				  slot->gpu_offset + offset);
>>   }
> --verbose please.

The warning and the TODO should probably stay, don't they?

> I don't get the logic behind this change.

We ran into the problem that the whole offset handling in TTM is 
actually completely hardware specific.

E.g. Some need pfn, some need byte offsets, some need 32bit, some 64bit 
and some don't have a consistent offset at all (e.g. amdgpu for exmaple).

So we try to move that back into the drivers to concentrate on memory 
management in TTM.

>
> The other chunks look sane, calculating slot->gpu_offset
> in setup_slot() certainly makes sense.

Thanks for the review,
Christian.

>
> cheers,
>    Gerd
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
