Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFA72B7857
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7D76E428;
	Wed, 18 Nov 2020 08:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4AA6E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:24:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJij29EcJ+fhF/s662msPyXoqBH30QgDzwkQWbgyvEmPHI2j5mLHH8OqpTMxG4UUfyC16OGtEMwkisLFfX9VbnYokXb/a2v72o7ENgw1SQWP18QlINUxYHElJWp4f7Kmwxh1BAZQ4D1kegU8bPlkDCU7S+t/xF53k8rzKROrfU0s2/a7P2DuGj+BGTSom3s8MxxWuYV6q4aFtAmYHpPsVe6cfsKY9XRfAVmOg5Gcw7oqTmIpdIkAWcjufh0WR0rfA1qx0KIXh/8hR0ufjLisL5fl//T10ld3D45NlYq9odC/aKOWdU2W6d5sUXPYmEnmitQz5QekLi+UM57cO7OVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pE4t0tWOyDrfBvb8u9ZV5yT/oSOStR1Lac5ND6T8/U=;
 b=hYSQkXyvlc++anQI0aWf9IWXAb0vmPqKizVy/QRwINsTbWr/2dph6qzZbRefMb1teK2G+oDKOJuMrhxMEcsFgJ8/MAq9+KbReDtoMLoPrH1N2Q/axDwGuE56lsfQ8jxJh7U2ZiKRhIpusLWWabPJY8LDKcah90qVKkgqcaDk4LnfXyHHEIHisiegIJbT1LlmehAjNA5fFPwVSaG+XEUl0Oroa1xMG9LrbCQmIRTW95OyWq0wJm97BfNr1V2GALHFevL3XyAwj0LbSFeVG+nWA0LcPSV7uxAbK/KpPcFWxTb3/P8Cs0KGC9cY50LkkFq5J2QMV+zv4VwE43iel7AU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pE4t0tWOyDrfBvb8u9ZV5yT/oSOStR1Lac5ND6T8/U=;
 b=11iEb30E0NaEcjkLKjSTgk7duESkqUMh2weAIYeae0hUrmxubFmH5lAETAdMtr8xHiwYk8hk3rYV7TiEIme2GbcmUs21gkC9k2CDToTZOvy/DulBVUe1rn1C2XfUPMc0LhEKC8BXgqS+zvXv2s5CNZGxd07f9utND95Gu9JiV8E=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (10.255.86.19) by
 MN2PR12MB4551.namprd12.prod.outlook.com (20.180.244.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Wed, 18 Nov 2020 08:23:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 08:23:57 +0000
Subject: Re: [PATCH] char/agp: Disable frontend without CONFIG_DRM_LEGACY
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
 <f2fa78c0-047e-de26-579e-7c75110005a3@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8526d6c3-5d35-d605-0bb6-44ce323740f7@amd.com>
Date: Wed, 18 Nov 2020 09:23:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f2fa78c0-047e-de26-579e-7c75110005a3@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR03CA0075.eurprd03.prod.outlook.com
 (2603:10a6:207:5::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:207:5::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 08:23:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d58d264-6036-49f5-84d4-08d88b9b4b3b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB455180A8DC0EB6E935B946AA83E10@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FzLOGh+ZNJ4Wa2g2WYrvDwBhP/RQLAvnpec5sHsZqYE5/tZCJzb2SRSRD5kFQ30lifBc98GWt3K1DkR4rjBKgJWfl+93z9ePjjhSvM50un7N8gtgCvuVQeQm7L1mLzrlXXb0g3jvTL1B2l7bBWA5+0nGBbsw1qaBSSK79g9mOe1XkFCykr++rHfzHheRPyvgbHBh1soWZRi0a0YzYkuak00IiMuVLa0fS5Z6eB0KHtOBVEjkRpK2MEwl9Ym0tG6Lb/6jXx4ieobFSBkgzMPiQUeQOzZo/trLCpfUCkMDU0FV15fiGv3cCmzbLe2wlnMmZ/0SXPSS6M5X44ijyKTJBj+s855EXcUJ5AxY1aRFMmgVvsMR+OGWqgQKkdvVnuc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(8676002)(5660300002)(478600001)(66946007)(66556008)(66476007)(6486002)(8936002)(16526019)(186003)(54906003)(86362001)(110136005)(31686004)(36756003)(4326008)(6666004)(31696002)(83380400001)(2906002)(52116002)(2616005)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGRqNlNyN003ck5mL1JIRU5JYzNSUHd2N2VrR2ttQ01BWElrakx6bVhuRDZE?=
 =?utf-8?B?SFNITTk4SWg0Ty9lcW1PUVNxVnZ4dmYyeW9GSW92LzFmMFRlZVV5TEJuMHZu?=
 =?utf-8?B?ZEg1M2xYY3hjZzhQdTdWTEJNS2JBK2REcURReDU2N2c5K2FrUXJMZ2EzUWx2?=
 =?utf-8?B?MkJTaU0rNE5LaWJjQ1RKaFpra1NxN0h0UFdPNUlNaFZiU2FhNE5NbUdJZ2xC?=
 =?utf-8?B?eXkzbS9COElOTVFMY0VVVldKWXZKM2FYVXR4cHRtdmZVMERqeVdFSHVQVlRn?=
 =?utf-8?B?SHBEOXl5bG8xNjdvRGdKVmdIUmVacE9qc3BGQzFiQlRGWkltUFNCbnR2aW1F?=
 =?utf-8?B?TEY1QzRiWFFHMDZROGExRW5McmUxSnR2M01SWkRCOE5jOWF0YUpMc1hCUTJC?=
 =?utf-8?B?V3lVTXVlajJ4bWIycDBYbFdiR1E4dFo4TFR1cGROZUNxYjFWYm1IOEZJcmN1?=
 =?utf-8?B?UytOZGRZVTZjbkFtcXRQeFpocWZMcWdITEFOa3IwcVJheW5mWlZxSU1NcFB4?=
 =?utf-8?B?Y1pxSk9YalIwZUdIQnphM3M3bjBBQ01URDh6RG50eVdzK0tQZDNqUHFsUkhQ?=
 =?utf-8?B?M0dKYjB4SU1VNmxLZk5LTlIyVHdieTBGZmtnMFlwQTYxWjF4SlJFMWtUQTdx?=
 =?utf-8?B?cnBQdXEzQjk4cDFoVmFOajgvTHFiaEtadE83Qm1GTXVmcGRXRmdtK1hYVGw4?=
 =?utf-8?B?cnFYTWlHT3N6V2I2Q0dHTmFDeEJQMXdjOHJ5OTFrSHpOdVF3dG1GZ1RUWFNi?=
 =?utf-8?B?UEkvVC9VbitsT015cmxZdTBsWElBMmpTeU1UaS9TL1Z5VnUxcFQxTTFnYnQy?=
 =?utf-8?B?YzBEaXJOdDYwcjBZTFRoMEhhTW1ML0tnRm1GU3dHbTNxZm5ETUZRQkJDSDEz?=
 =?utf-8?B?TW9IZkdXTkNXOVlVTHZNNndSYU1OT3ljdTBZdkswSkhzblJCWnJlZXIvaHB2?=
 =?utf-8?B?QVB4NnNJUndpaTV5b3kva1BXZkh4b0Nnb21lSkRSTmI1ckcxY1NDeURmSjg2?=
 =?utf-8?B?bkRsMzIydExGYzZyWDZnSEtlZjVmMEo3Q0lWWGlBYVcwUEtzREZ2UUdRVlRS?=
 =?utf-8?B?Q0hDRVVnOHI3SU94Zlh1VHVYdm12N3ZjTlEweURwVWdzaXhaQkh3b0wrSU5J?=
 =?utf-8?B?ZlJSOHp5Y2pENUdQRC9UT0dyUjFURzJXZE1QY3NRd2loOGhLQXliRWdHcHZE?=
 =?utf-8?B?cU1Ja2phaGxydWMyZmpvN0duQ0w3UVZQUVQ2N2tjNHFPNEFsTEdVUFB0VUNa?=
 =?utf-8?B?dlpWR1MxYjk4ajZPZmY3NmsvdHlMeDBHRnhVU3FPYW1WODNmQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d58d264-6036-49f5-84d4-08d88b9b4b3b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:23:57.2937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhPXwIN36IaD8CPMIAR/Sgv9B9zlmSWgt7J7inbDdjVwjuf2jGpzSj+Z4w7XmjnK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Alexander Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.11.20 um 09:02 schrieb Thomas Zimmermann:
> Hi
>
> Am 17.11.20 um 22:40 schrieb Daniel Vetter:
>> It's probably full of bugs ready for exploiting by userspace. And
>> there's not going to be any userspace for this without any of the drm
>> legacy drivers enabled too. So just couple it together.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Adam Jackson <ajax@redhat.com>
>> ---
>>   drivers/char/agp/Makefile | 6 +++++-
>>   drivers/char/agp/agp.h    | 5 +++++
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/char/agp/Makefile b/drivers/char/agp/Makefile
>> index cb2497d157f6..90ed8c789e48 100644
>> --- a/drivers/char/agp/Makefile
>> +++ b/drivers/char/agp/Makefile
>> @@ -1,7 +1,11 @@
>>   # SPDX-License-Identifier: GPL-2.0
>> -agpgart-y := backend.o frontend.o generic.o isoch.o
>> +agpgart-y := backend.o generic.o isoch.o
>>   
>> +ifeq ($(CONFIG_DRM_LEGACY),y)
>>   agpgart-$(CONFIG_COMPAT)	+= compat_ioctl.o
>> +agpgart-y			+= frontend.o
>> +endif
>> +
>>   
>>   obj-$(CONFIG_AGP)		+= agpgart.o
>>   obj-$(CONFIG_AGP_ALI)		+= ali-agp.o
>> diff --git a/drivers/char/agp/agp.h b/drivers/char/agp/agp.h
>> index 4eb1c772ded7..bb09d64cd51e 100644
>> --- a/drivers/char/agp/agp.h
>> +++ b/drivers/char/agp/agp.h
>> @@ -186,8 +186,13 @@ int agp_add_bridge(struct agp_bridge_data *bridge);
>>   void agp_remove_bridge(struct agp_bridge_data *bridge);
>>   
>>   /* Frontend routines. */
>> +#if IS_ENABLED(CONFIG_DRM_LEGACY)
>>   int agp_frontend_initialize(void);
>>   void agp_frontend_cleanup(void);
>> +#else
>> +static inline int agp_frontend_initialize(void) { return 0; }
>> +static inline void agp_frontend_cleanup(void) {}
>> +#endif
> There's one non-legacy driver that uses these agp structures, which is
> radeon. Does this change affect radeon?

Nouveau uses AGP as well, but I'm not sure if both drivers use any of 
this stuff.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>   
>>   /* Generic routines. */
>>   void agp_generic_enable(struct agp_bridge_data *bridge, u32 mode);
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
