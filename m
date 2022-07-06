Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA29568A01
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0345B10E3FC;
	Wed,  6 Jul 2022 13:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C660110E98D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daEnHZoIQb/FDu6GfGvIghepqDNe+7kvt0oROVXniaY4XGPQ/nWfp7sK2ZykRIRTqf82F4fGYVdX4+WFUNIjQyd6qbMCe2116Bg2XOCrjOFXg7ZbztWQ4r4hdosck3e+4hHykJQFWNtjdK1mH4jD10L7tOQIGN64gYM4cpITmGlrVDOzlvl0WZuQW781PLCmh6CZcMt+ABc2tkHzYvllI8Q5sr3pSZntzdTLDjWmMsvf9lQ8jZUW16l5NKQE44rQ8wjlyVJmWKPx/NZEFFr7X+daCMPjMqbWva6jH1Mj+ZHcjm3LL8VdDRk+OtzsPwHB7v6YDE9a6PyJSr4yOBwaww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVbYJPhYbHMdqdQCwGUVOLHWE7j33Wj33jq21o8VaeA=;
 b=WoHRVgkKpqULIJCSXT0op4WYSg4PpzDLvlSNXVVYo1VoR79XzuOqcHA4ixmYOBhe6LDfPs5AJGXpp9744AQdexJAxhm+5t2lFll3sNY7nGbouRAT4Sq+efZ2RKIAa1IVyqRpJZPPwvw09R+Tg0IMos2SurLcjyJH7u6xf5s1FgIWBu3LQ6IYKEJXNGwx2+Ad/P+wAufFkvETadL+WGKPzl96OkIAeZo+PovRxV5YuuZYkJyBRRxpNLnLtqkKCA3VcfmNfo+Vp7RwzDgvRJ8m2DhUNMWE95j8vj79XtWePBwnzF5D3b3TNgqQCLliN+OkFytyIyjB4LFL38629cQUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVbYJPhYbHMdqdQCwGUVOLHWE7j33Wj33jq21o8VaeA=;
 b=wSViML2OZ6yEAPZuX3C3qqQb+0Hpv29I/kaiDKIxUEHKdl2tpLruBtjlitb1YEP9fObb55CuyegGAU1zmevhBz8azeQG9S8nUdt8VAK7YrC+x4d0doAxvMriPKI0/syUEhYOqYcNzMG47EOWVRSNbr7g+w9qksWUAOlhjkCXG/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MW3PR12MB4523.namprd12.prod.outlook.com (2603:10b6:303:5b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 13:49:43 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 13:49:43 +0000
Message-ID: <3e07a8d0-2cbc-8f3e-8f9f-5b73fb82028b@amd.com>
Date: Wed, 6 Jul 2022 09:49:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Erico Nunes <nunes.erico@gmail.com>, Steven Price <steven.price@arm.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
 <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
 <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
 <107fe968-8311-0511-cc31-22feb994a6d7@collabora.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <107fe968-8311-0511-cc31-22feb994a6d7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::24) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f21b2b34-e52c-48cc-3e13-08da5f566165
X-MS-TrafficTypeDiagnostic: MW3PR12MB4523:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwUCbnqjR8jO7GZ2D4iC414xW6n4ciS4lJRqv3U6y/NrncoqIjczn1qtRpLCxRW0KkHRhh5ocOarE9UqEvSXr8tXE6zJ5effulULmQyXY4TfWkswMwkzbLmajwI9PUx5T45WElW+nvl7kzNqXsLvZTbnsduV+5ZMi0OI2NPhT3rXtpKKfuhFlnRhxdgLj/dhancdN9BRyhBR3Irc5kwW3/CjMX0GjpqUqmuAD7V6M5DwTmB+VwCKWDwQ8zlhx5uNn9A+OVpgab0mUjxE18l6MLV70un7ocYMzmC8ICRIcX+v0Ne/6UgTSQpL3nDJK1FGBpL1H/C5/XvN/ZvRklNMC0kPa/YPHieBQ50LJqWgZKR+e510gwcAEmVYkBt+rPtR8Wrwj2C8LM8APYpM9VraNdyXoaawsaLjVxVGJ1KZsscK/4GxjiD4W/RPNY7ReBgXeo45BbmBIozwBSYw+n90op1SxHaLnldWHsiB8kEOnkUZM9dOb6sdRfTRqljHMQTJwLFyAICCeKXF5oGmY+p3nN6o1cS0R1ovf/JJYq2paUBrlE903FsH9l68HFK9fOVefDZX+n/t4R0DpcXiY7svj8W684K56V9G+ZT2AE1QNpwUwOsdZhRPDh8Yjs8QJqZxPHkE+PK0MkGmRWpPug97MIhD2irgqN976f0Xu3ZuhCNmk0d632P5CMv6Snre2GApsylrk7dBJWFFdFFkPBVcZp8mOXgBVz3RkXEkSE4GSy/jOwSoG1MjOt8/QNiiTuhDUSZQqL0k1/x36042H3hICFhJyeIG47Sri+/c2vHdNqfUZDkxpnQfKsT+rF+bPdu+6YGLXVkiikjdRvkJz1PpaA7qiP6I7x/XCSvayJp+wvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(6512007)(2616005)(66946007)(66556008)(66476007)(8936002)(7416002)(4326008)(8676002)(5660300002)(31696002)(36756003)(41300700001)(86362001)(31686004)(6506007)(2906002)(6486002)(186003)(53546011)(478600001)(316002)(54906003)(110136005)(4744005)(44832011)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjRmbEwySlBkWWV2T3o4WjFEa29ZdnZWUzhVUEFuN3ZlUkdHVXd2cWZKTTFw?=
 =?utf-8?B?WkVxakNjMFZXbGZSMWZoL2ttOXdGdG5lYld5aXoxaFJwcXVtbko5cGs3YXBj?=
 =?utf-8?B?TDFXUFZqVEpNbGQzUk9Jb2FMbkV6WkJxTUJVYmNsTjlxaDMxV2dOKzlOTUhN?=
 =?utf-8?B?QTJ3N29WeldTK01PRnJmbmpaVmMxK3lDNmRzL25tL3JIRGJrVko0WDNxRHhz?=
 =?utf-8?B?K3BVU2lnRWVSaUFTbFFUUGhpR3FSeXBpUFBQWExPcGJUbDdTaTFRa3ErM1dI?=
 =?utf-8?B?d2ZIb25BMkZKOVBrdGthQ3ZTbllHcEpmdVZRS2cxbE5xc3pqVVZFbDRFVVJ5?=
 =?utf-8?B?T1hIVFF5VThFTFI2VTlUMnJTalZIZ0RUdGhkOHpHYXhoMXBSekg2OE1pdFI2?=
 =?utf-8?B?aklNMldLbUI1SWV5dEc3NytIN2xDeDVYSlFKYnI3Qkp3U2psMjF2NUZrN0hK?=
 =?utf-8?B?TkJwUVE1cmFObW1HQmlxVmZpQ0F5VVlWNGZ3eFBNK1M2Wkt4OUw5YzEycGtk?=
 =?utf-8?B?R0xRUjZQRFpiMFlsNUJXMnRCRjJzT1RYSmNNWDJaVWZETTdMVnhmL0ZwdC9Y?=
 =?utf-8?B?NzIwNEJDM243YTJTM0lMbzBOdEJNQU5ibDVuK0pQVkVPNFVRTXdPWnhTMlIw?=
 =?utf-8?B?RVgrOEZ4TTJ4N2tjNFM4TGMwb1lYWVF5YXhmU01DMVBYQTJ1VEIwaTg4ei9T?=
 =?utf-8?B?MEMvU3drb1ZoMDZ1bE9mR243NXNaR3hweTEyRmc2ZzF6c09KZ2dRN0FjN2ds?=
 =?utf-8?B?SU9pWEQvb09MZzdNZ3VPOFRSOUQ2ejdHTkoxNlNkZllkMXAwWFAwMysvZGJq?=
 =?utf-8?B?MFFNdGNKZDRSbGFtbnlwc3FOaTNiT0J0Qm01R2J4aXZuMUJzMGpnSHlzdnht?=
 =?utf-8?B?Y3h6ajMrUDBoRXpIVmt3OEovanNnTnhmUXlEaGV5L0tDTzNtNUJEU1krOGE0?=
 =?utf-8?B?TGplQ0h6MzJycTdyQnAyem41VXBuckZxcnR6ODF3d2JScHY2R2FDU1lqUWU2?=
 =?utf-8?B?VEw3VEk3SmlpZGZvMi8zRUVtalFnTWs4elc1ZHM2dXhCSVJsLzliaG9STXFX?=
 =?utf-8?B?SitJakt6Q2lhQWt3WHBkN1VBR0x6dmo2VllEdUd3ZEI5Zkh2UVdWTXZGbXFM?=
 =?utf-8?B?dlA3V0xPdUxjekQraXFzekxKcG45ZGF5ZCtvbGIvbTZYY2E0WWs3a3lpekox?=
 =?utf-8?B?cVJIbXFQeEJUVW1FZmZWcHNpcDFGbzZXM0lCOEYvc3R3ejhiN0ZHYVRseUFR?=
 =?utf-8?B?d2liM3hKK25RdVBLbnJWZGI4cjdCU2NuTzdqY1lsRksyaDkrOEdrd1VjL3RB?=
 =?utf-8?B?cXhUa2l4TU9hdnloaklDRnhGb2JRaXB1OWpuVEhFSERFaVhFK0lFM004emp2?=
 =?utf-8?B?Qk84dHFuK0o4YWFRMzB4cThGTU5CeGJjM25rcy9LY1NIbHpmTFVqWmx3ejJR?=
 =?utf-8?B?S05GNFo3N21UbEpYdGVqS3BMSmlkUUJhaW9rc2RLaGdtbGVROGY5SUxrWmYz?=
 =?utf-8?B?OXBON3JpdE1DTGF2MXNZcVd0bGNMSVZnRk5UYzRLR05NWkdxYjVvY3ZUNWQr?=
 =?utf-8?B?STBnem5aN0ZIZ1Vtc21JS1QzNWZqNlhiRHhJYVFaWDNYa3BDZ25sTzY0MHZT?=
 =?utf-8?B?ZVltcHRvNk8rU1lxMENzNkJwTFNsdW5BenJtcU1vZ3dkRjVYZzNlZnRtMzRX?=
 =?utf-8?B?RWJHWXlFaVJOcUpLcjltdHVxRDRvS0tHWUtTWnkveFBCZVF6Qjk4NGVSRlJh?=
 =?utf-8?B?Nk45RVVBUVNkdnZCanRoZzR1RUFsY0o0RHF5emFGVlhDQitHcHRnU2grT3Jl?=
 =?utf-8?B?dUYvcm9Kamc4TXNjVHRWeHVFblc3ZjJGZjR4KzVtS1FoMWhOa1NNRCtCSkFj?=
 =?utf-8?B?cFZNd2FvSDFrbVJqSmxnRUY4LzJvckp4TWt1SHhpL285ZWMxWGNzYU5VcDFH?=
 =?utf-8?B?YTRUSjlwYXYvWmJpL2ZQRnByUHo4eXAvL3RCWWNlYUdGRklZSlJsdGo5SWhJ?=
 =?utf-8?B?K3hIeEFjRGRCMjlHUDdIcXg5czY2bkkyZVhVVnpwR2RMWkwrdTkxWm9WZWxM?=
 =?utf-8?B?N0hSRTFXaUhsL2NJY04yampidE9vVWpJSnhGNTRjblBwNjhucmVhTjNzUlVs?=
 =?utf-8?B?L0pYL1M0dzlQL1NkMC83YWR3TXZUU3NwRnRYWXltb0tGUmdQdEtoUkkyRm56?=
 =?utf-8?Q?zWGdSMbFc52EsFORutUS4El7mlM5NRc5+rP5RoAg2AnA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21b2b34-e52c-48cc-3e13-08da5f566165
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 13:49:43.3760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qWFytNu/yiXZ+wD2xIlxKAbprmscTggYzF+1HJc4Me3Ngk+0a5iBOtqzaBfXlw++O6FCuFPA1/Sc7TpLbm6Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4523
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-06 03:07, Dmitry Osipenko wrote:

> Hello Andrey,
>
> On 5/17/22 17:48, Dmitry Osipenko wrote:
>> On 5/17/22 17:13, Andrey Grodzovsky wrote:
>>> Done.
>>>
>>> Andrey
>> Awesome, thank you!
>>
> Given that this drm-scheduler issue needs to be fixed in the 5.19-RC and
> earlier, shouldn't it be in the drm-fixes and not in drm-next?


I pushed it into drm-misc from where it got into drm-next. I don't have 
permission for drm-fixes.

Andrey


>
