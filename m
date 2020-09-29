Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88727C4F5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 13:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298CC89CB3;
	Tue, 29 Sep 2020 11:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3489C8D;
 Tue, 29 Sep 2020 11:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQB2iGEwezsc8dOrpYNYg9YXPeIVnqqrOuUkU7TuDFkqRcV+HIhgEXHerk0Rqe9BS5CA3alnBskThoCq+GJEnalObRjZikcvKxRqHzfO8prK31NVDQ7lM763ySEk1UDFkx092RbiYxD6Axx4sOhu+/oWFNT6T8ebOI/UsQ51coznsPdJqvsVVoCCd4y1yO6X2zpD7zTr4d0d1yK416BnHt4FrLZVv6Lx22P28aEBSmKLm6VrXc73Xg8E970v9Egz1fOVPEATwZdSV6th3Rq3eC/0VDl9Zoi2JhY6qR+zVVrKmepaBZjVMBV3zXLkewXAZKOY3/soTzIp7Mf8Oa1W6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mktaV4/jslCqVv/N+3wkpvY0QLkq4vXs1tSWawvfHU=;
 b=DiuOFAluH5yq2OdtHpU07zlFHdDMfIpOXn8VmZMcSYPZi+lQfJ6lswbGgAzRyN9MGH/eN6GuHZDbbFL3K5grTcpi6Fo8RAxHidem7i9M8PVB/FedbVIh+i4X+2zQii90TYV2vO6JxHABQTsbXcFMVRJj1PFHK9VwdOV3On+wG+fF3wdLXDgP2lSpGRCSJS1bmxdwV5yZajZVBZbO06MzxED/hwOqz3LCF7jOdujR50W8JMPs7AMQcHk5rug4NEDZNC7RwxmbDxEEVlX4+TgYjfhkFIIRoItiDwYZgxFVBOQB4HGLUIVsyTorxCsVq/anNqgGMN8i0qGoQLMOizivGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mktaV4/jslCqVv/N+3wkpvY0QLkq4vXs1tSWawvfHU=;
 b=cwkNuRoWQTFQuUjx/FmFsvBFX8TT6jv2S21OIDJuPVZMDyROPPhaWBIQkCXLVv7UJvrSXgQiEvbx2mBoqYCXjZQd87As3gqyRvmj0yNRM+ZrO9wtFhbVEcLP07kzxYFBgTTq9iwdMEFDuHunv7+ol5lGbHK3BilliF1St0hFG60=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4930.namprd12.prod.outlook.com (2603:10b6:208:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 11:24:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:24:11 +0000
Subject: Re: [PATCH v2 4/4] drm/qxl: use qxl pin function
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Huang Rui <ray.huang@amd.com>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
References: <20200929095115.24430-1-kraxel@redhat.com>
 <20200929095115.24430-5-kraxel@redhat.com>
 <20200929105300.GM438822@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <52df08b0-e78d-3824-7a4f-02837ad0891d@amd.com>
Date: Tue, 29 Sep 2020 13:24:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200929105300.GM438822@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:200:89::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0021.eurprd02.prod.outlook.com (2603:10a6:200:89::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Tue, 29 Sep 2020 11:24:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33411f93-4244-4396-17c3-08d8646a3084
X-MS-TrafficTypeDiagnostic: BL0PR12MB4930:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49307D3DF198465FA351BB9083320@BL0PR12MB4930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ID822Q39pvzfTzesG3nktD9f/Q6wT17R4JF078gzmKSJNdRC7Qm8WbvtC3NIa1JQyjF7eMwgMbUMjiukPhPuUhWZ9NB/EThY/BU3WQ3pzJsr/1a/Euxt89Jy9A3N+JA+oviv01JqfQoTjl44A+hL6upo8YSejt+5nEsbIqMqW4hgvqgevMmijQD2IjPY7Yky9eXaxYGy6wKn0AUAYZl0qxmryA2AsR0w0ccjeLV+yop8xP1t4HJwAm90EEULS6NYACa/F3RJDG95hZXOh+XrbNulw5PmDt1co3KWrQTqZWv2oN2E8FdOO6NJYeCB3/X1Hps7zmvXS7F1HSfBlxcOiYFrhU1Cv2Vn+J8TJTB5vBd2F3bsVEhh2kyJILqkwn3TzDMsAchGCnvkXx5+wcxQz/y2YS6mftGJJRLs4I0t8DbXtGFfd9oOnrOwQfRyNAev
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(6486002)(186003)(52116002)(66476007)(31696002)(316002)(66556008)(110136005)(66946007)(8676002)(8936002)(2906002)(16526019)(2616005)(83380400001)(31686004)(6666004)(86362001)(478600001)(36756003)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lgdVkfWFdx+MB0HVTOavCOWoRM8j8uYVJtV8/9gr+GbaZEhmyJbHV+jmWxWBoe/yyRVLcj0644m6RdmE+blx+YnnVde9HAcsTX7Rx1JAp/8CBE+EpDudGBNxBL3iTRVV05uiksGpYpxsAnEjurUrHgFSR4LnfUGrK3Rt8yP5eDvm5kivEG9arYjM8XjLRVVsPx5bvFhP1Ya7JOaeq98cOLJ410kxKX9g0nO7EIt6TB0psyp5kG+b26Ea/m5Ui15jkLsPCgbz5bQkLIyOrcjcgrxZSi2INukPXFZr0bAAR62/eW+avdXU7tbmX6f0XJ7pNmVzpYNF6DWIK4vuZdrvjmB4LqMNZ5r5qmnaJJo7VWrJf7AKURize1cPVDTmMghW1y/aov3ySG2rNwcvdUvG47G7FMxJq7cHfq1BcVsO5lMOK5WQuzXEGteI0HX5oIyaE0qwMlZzohiUeMTUzMJ9P2ZVf8IZMHRC/qwNnB+xy3HOUPVtq8lwtEDakHt2mqt1oekDfR+JQ+szi8T3kYFcTqzldmJqDz5aEKQkn2jLRgEje9jqX5/CEMsRyGjkyqRkQqRs9JoWTFScvkgC7+VsKJXRqhrf9/cTloWbif/akmspUbOfwIiRzq46/O+yPtRzoe9yOHQduHAQrL2paY3UeshJBj5X9We1LYgTPuDVfXEJrExt6GQAlJJZIDqoGPjFl4d82WrTo7MLz/0NtY0N7w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33411f93-4244-4396-17c3-08d8646a3084
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 11:24:11.7628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t17YhWHLJoB+VErSVdHGhI3uhwdHvLBoE86KR2EElmEhjrZPrX0w9AQB2BU0187b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4930
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.09.20 um 12:53 schrieb Daniel Vetter:
> On Tue, Sep 29, 2020 at 11:51:15AM +0200, Gerd Hoffmann wrote:
>> Otherwise ttm throws a WARN because we try to pin without a reservation.
>>
>> Fixes: 9d36d4320462 ("drm/qxl: switch over to the new pin interface")
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>   drivers/gpu/drm/qxl/qxl_object.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
>> index d3635e3e3267..eb45267d51db 100644
>> --- a/drivers/gpu/drm/qxl/qxl_object.c
>> +++ b/drivers/gpu/drm/qxl/qxl_object.c
>> @@ -145,7 +145,7 @@ int qxl_bo_create(struct qxl_device *qdev,
>>   		return r;
>>   	}
>>   	if (pinned)
>> -		ttm_bo_pin(&bo->tbo);
>> +		qxl_bo_pin(bo);
> I think this is now after ttm_bo_init, and at that point the object is
> visible to lru users and everything. So I do think you need to grab locks
> here instead of just incrementing the pin count alone.
>
> It's also I think a bit racy, since ttm_bo_init drops the lock, so someone
> might have snuck in and evicted the object already.
>
> I think what you need is to call ttm_bo_init_reserved, then ttm_bo_pin,
> then ttm_bo_unreserve, all explicitly.

Ah, yes Daniel is right. I thought I've fixed that up, but looks like I 
only did that for VMWGFX.

Sorry for the noise, fix to correctly address this is underway.

Regards,
Christian.

> -Daniel
>
>>   	*bo_ptr = bo;
>>   	return 0;
>>   }
>> -- 
>> 2.27.0
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
