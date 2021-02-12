Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B707B31A103
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 16:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B406E5CD;
	Fri, 12 Feb 2021 15:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E5C6E5C8;
 Fri, 12 Feb 2021 15:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiKwOLK4MkQPm+oMK9wlO8usRe5eh2T++ze6v+z4kEVWqzAIjJpfNy2yuCrgJVLgOGbAkAYksRrtuje6Y56jBgrWO9qGpso8ijNd9zgg8+n6Xu4KfHHP+nXN8mI+3oBy5lfWKNGmPPu+6O7bSghv+UTaDpjnZKE4QBv8gRv7gJqZgamPNzLXQ3hKQsu2OJPUPcVyyR6+XbC2hh3FTK6zEtDTu3S4iyNC5Q415kAxYV2BBqw5TGEcfGdO9OPytrqoHJMECkU4kuukYuJaqoGK5zsg3h5yXODXo+wlPgnml7J8m5lugPyyFOpW2qNgYwlVevQ2hOcS8GM2fPC7MbgW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzwNsO/MAp079pDkyDydyliYxTvD3Dl1aemi3MC/rRk=;
 b=asqh3JFvkX9oyjery6gifpbZbqjrXGkEG7D0k4k9K7EQ8CISe1onOiLzn7EJvpVyAftjK0/WQ2UgK1syxCYoSyD/nu7h51F/e4gJjCADt17ABhC/T4QPMMdKXpIdlzrzzWfCD713UjYuIwsM2JVbe3sSAPGj6ZIEmtWPcoxAXu2+I0u+vpkt1opyZDwMFnb21D/OtqiIqmtrX5lQNn08oydJB+GxDbmH0ZM1M2EMrSf4cy/jZHPutK7x6mrtdo0eVXSUntMEF5u1O5KbxbaadQOUA1cftDgpJ2rh+SqxFFZoSClCgOHdAv7kinmQPde+SbIEGawzGc7tkide+d9ePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzwNsO/MAp079pDkyDydyliYxTvD3Dl1aemi3MC/rRk=;
 b=wmfFY/6AP6S+oWTvIezB04sxZUtMsk9e8RQafr4XUJwQL1LB7Jne/tLBIXSkJ97g0LtvqOB3f4fEQAjX8Abbx3bjOCJMkmiM/zov3Fk6Z3mEl9kaNB9aDhZNtdGzIbQUeB6Nm2O4d47/PJ/2273jMLitTN8Ovv+gWcSVj44jyCs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 15:00:09 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Fri, 12 Feb 2021
 15:00:09 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
 <YCEJBfA6ce4dD3JT@phenom.ffwll.local>
 <6c639669-b78d-b6a3-71b9-d546ca34121b@gmail.com>
 <YCEOY5wFmpGRl7jJ@phenom.ffwll.local>
 <90eb7a73-1981-6d20-a83d-1690321212c7@amd.com>
 <CAKMK7uF3HkTgDhM5Lk3hnGB+35Vi-Nt7YOBJ_rpO8wZw9ifhcA@mail.gmail.com>
 <f8b3417f-a697-c8c7-b131-5c8823f969d7@amd.com>
 <55862d1f-42da-4a9c-0720-e6abf72615f5@amd.com>
 <da7b71c6-5045-5a52-2ec6-504d0bfb6761@amd.com>
 <28c0f887-2f9d-2964-77ef-e56b3e0a8482@amd.com>
 <7cbc510e-275c-5747-32d0-ce6a5f531cfe@amd.com>
Message-ID: <d8f6d2fe-09a0-1eab-b20d-06ecfdd167fa@amd.com>
Date: Fri, 12 Feb 2021 10:00:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7cbc510e-275c-5747-32d0-ce6a5f531cfe@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d7d7:97c3:4fd3:e40b]
X-ClientProxiedBy: YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d7d7:97c3:4fd3:e40b]
 (2607:fea8:3edf:49b0:d7d7:97c3:4fd3:e40b) by
 YT1PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 12 Feb 2021 15:00:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04d94fb5-f541-4efb-c331-08d8cf66e3c3
X-MS-TrafficTypeDiagnostic: SA0PR12MB4461:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4461F3A4646E05A0F7079570EA8B9@SA0PR12MB4461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2nYpXiEdKgfQvbwRa/RUgh58btn8J2yw+JtYIzSvyrK9Vh+oks6obJzMwMigH3tPjS2nEqrCNCJweY0VdjKzFTHIOLiBQl7DCtjHx0uXwrZ6DgzbRmchZpZEm+AhsEmY2eiGLr8GdtzWaoYLZXuUlqTY/a6nx9BoqVgPvmqqSzYl4jtojqP0oDYr1A9ra3WnVtWehOJWvDca5GS2PuWveS+MrtmA2OXXDb6nkZbUoI6J9eXG7rJ9Ieb9tXInqPnQzOlha6c5bW4aEfkhXUJZLj9Kp4apVncRx5A5qmb052alqh8PpYjsjVEKqYtFPU7p5sR9XIHB1TZvsK2TWC77P46ew8R8EtKTnjYfNAzqK/jfosfSHGx9SZwWsSIt1TI9BSn2AaqU+y/Pm4DzzN36AcaLzBR6Xccsyjhgap+Gnut8VoOyJ72/z9BF2RSm325DheMg7ghn9bO8X7mnKISpthlaUKM2gpdcbjQ1biZHbIlGyiI9FVOXOxTr2waHdn0qey6EF5o0CikGm7izSLuQvPfYHxWM/Wc5ZfJFY85+IOfwe1DTiEQPwuCelJtVcZwRSJdLtEFbfCLOhlG8WVf6kSzEqdFeEwP2JU9t/ah0QUnNWRTH+djBgTeRRWEaUsHk5CayD/XKGiSc1WmoO8iYDg7CUjUpxKNrmAKqOnkx9cbuRuCJHbODD8WrBFQIILWU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(66556008)(16526019)(110136005)(186003)(66476007)(83380400001)(478600001)(52116002)(316002)(86362001)(66574015)(31686004)(966005)(8676002)(8936002)(36756003)(54906003)(5660300002)(66946007)(53546011)(6486002)(4326008)(2616005)(31696002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SEY4MlcvT0F5dVFtNkNqK1dvRUtMNkJ5OGx3eXZWY0dJcTIvVXBZMEw0U1gv?=
 =?utf-8?B?SWNwTzUzWlRpaVlvRTFaSEpQeU1DNXVpTGgvN1p2WUk5U21oa3BMRnYvb2g3?=
 =?utf-8?B?Y0w3NEtTeTY0N0JyTWJSK0V0eGhyOTZPcXpuUmFSdjBrWjBUL0dOclRJck8x?=
 =?utf-8?B?ZTAxUUFMVU1seFRCamhYbTN5ZTBEMHkvamJhYWFHTlhyT3dHOGUzb2NlZ2ty?=
 =?utf-8?B?bnJ5SnFxZjFtREpkeW9JaUU1ZkxUQitMekpmN2NFWmVhTlhmYXhJa2lVblBG?=
 =?utf-8?B?STZLQmNyckZWRU5YMlhlbU1leXhxanEwbURrcThsallnODMrU0VVUjVMQ2pm?=
 =?utf-8?B?a2g3a05vdEZRYVlhQlRiVlNKazBvNi92Rm0zVGJuNTNpc3FCc1M1T1FmbFM2?=
 =?utf-8?B?Q1RseU0vMVg5VW9ZalU3WTlDcSt6a1BDOG96Mk9OL2FmUkhVTlBXNFFXandX?=
 =?utf-8?B?bmRSOTIrT29UY0w1S1ZYSXk2Y1JWRUg3V0lOZXdueDJ3d1gyaHA4TWhLa3J6?=
 =?utf-8?B?eWJqakt3T3pLWnowRGZkU0JFeXFLTTVBTEdlVjNZQUZ2R3FnaitVbmo3Q0tk?=
 =?utf-8?B?bGhSQ0s2bllBcEx5TVN4SFVlZkZVbFFHbTdLWmVRUDg3cDVBd2dOcUtha1c4?=
 =?utf-8?B?NSs1MEJEVStjdzBsbDQvdVZ3UnVqMzZCbWU0cGVxZW1ZdTNNbm1aT3F6Vitu?=
 =?utf-8?B?dHZUWWVXTTRnTGlLOGV3dlJybFUrTlhGSXJ2L1ZYd0tXUzZXQWNTMGVSSTVr?=
 =?utf-8?B?cVNaem5HTld2cDJ3Skx2UFJFSkl4ZTZaUTU1eC95aXZLOU45SDllWjYrbVp5?=
 =?utf-8?B?cTQ2bHJBY3pMZnNTOVJLSlRmSjNQczVVZ0ZzOUJTZmVjTVNSa2VMNkVBbmtQ?=
 =?utf-8?B?YndzbFpYMGQ5bWZkallwa0JxYmVCdGRBOWxPeksrdG1EVWVYYWhmWGZUMXQz?=
 =?utf-8?B?VVI2am0rN20zeUJLTkxYSm41dU0vRHFTU3FoM09GczBGMks5U0l1NnpORWNU?=
 =?utf-8?B?UER3WVF6K2JoY3hIQmk1dlRSZ3NDTFFzOTdIdmZUcUlzTlB1em9ERHBtaWt6?=
 =?utf-8?B?VGErcjdLMi9Da2QvQXNyR1YxVEs1eENtYzVQTXJzUmQ5MllBZ3JoM2ErbWVk?=
 =?utf-8?B?SjR1TTlWeGU4amRpRjFkcFlpMm5mQWRxdFdDeFc1UEttV3NQSTBwek01VFNT?=
 =?utf-8?B?NGl0ZUU3SDBGWlJEZ1pRbUU1THVnOHl4OGxhU1hrdUtxelVrdVJOeXNQc3RJ?=
 =?utf-8?B?eER4WU1LcU52TlE3QVdVeS9NazllT3UzdkYvVU9YWmcvdHE1bUJGRlV0Vzdk?=
 =?utf-8?B?MDdvZFBaZEF3aEZBOUY4QXM4VEMydGdCeFVEeEdsOGloQm0zTVVKVm5odCsy?=
 =?utf-8?B?aGpVOGRaaVd0WDZ4cm5ETGZsbmEveTEvWUUraWpmMk5MWVl4K3U4WllWcndv?=
 =?utf-8?B?YTYyNjBvbTNnMFF6a3JqcTJVTmNWdHlJcjBDMUhUSzVFNDNqZ0VOYm5yeG4z?=
 =?utf-8?B?dXM4SGx6S2lRclZpRlN1SU9LZzR5ZktuUDlnMVRMNHljMnA3S0tQK05VSHlD?=
 =?utf-8?B?Rk04MTF4aEJHOHZZVWNpeHdMUUpUL3BzT085TytLcGUxanpLZEJvVmMxSHZD?=
 =?utf-8?B?RWpaMU9kUWVkM2hkZlAvcmFkTUJLZDdaOXJkaUpZU09BVEJPSjJyc0RjcmVX?=
 =?utf-8?B?UVZJZVplTEpIQSttcGFZTWVlYTM5UUx3M2Z5VFg1Zjh5elNNdHZsT0RUQ3ZK?=
 =?utf-8?B?Y2ZkaDBZTU95dXVCV0V1S3pycFZNbUVxTWM4WnFpN09ldGxnWlM3SjBDNHQx?=
 =?utf-8?B?SFl1R3ZwT2lDbE1Xd1FEKzNxTHUrS0k2Qnh5eWhsNGduODdWQ0Z3MUNtM0h3?=
 =?utf-8?Q?BB//HDA9jos7e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d94fb5-f541-4efb-c331-08d8cf66e3c3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 15:00:09.4192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNOmvajeGrAzNCcC6HGapP5uXd1vfXXS95yQ0MEEEXk+UGpa1p4TudkKkQSBrNkrHI1zfV7rGZ1XuWA+wbFqLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZwoKQW5kcmV5CgpPbiAyLzEwLzIxIDU6MDEgUE0sIEFuZHJleSBHcm9kem92c2t5IHdyb3Rl
Ogo+Cj4gT24gMi85LzIxIDEwOjQwIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAw
OS4wMi4yMSB1bSAxNTozMCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4gW1NOSVBdCj4+
Pj4+IFF1ZXN0aW9uIC0gV2h5IGNhbid0IHdlIGp1c3Qgc2V0IHRob3NlIFBURXMgdG8gcG9pbnQg
dG8gc3lzdGVtIG1lbW9yeSAKPj4+Pj4gKGFub3RoZXIgUk8gZHVtbXkgcGFnZSkKPj4+Pj4gZmls
bGVkIHdpdGggMXMgPwo+Pj4+Cj4+Pj4KPj4+PiBUaGVuIHdyaXRlcyBhcmUgbm90IGRpc2NhcmRl
ZC4gRS5nLiB0aGUgMXMgd291bGQgY2hhbmdlIHRvIHNvbWV0aGluZyBlbHNlLgo+Pj4+Cj4+Pj4g
Q2hyaXN0aWFuLgo+Pj4KPj4+Cj4+PiBJIHNlZSBidXQsIHdoYXQgYWJvdXQgbWFya2luZyB0aGUg
bWFwcGluZ3MgYXMgUk8gYW5kIGRpc2NhcmRpbmcgdGhlIHdyaXRlIAo+Pj4gYWNjZXNzIHBhZ2Ug
ZmF1bHRzIGNvbnRpbnVvdXNseSB1bnRpbCB0aGUgZGV2aWNlIGlzIGZpbmFsaXplZCA/Cj4+PiBS
ZWdhcmRpbmcgdXNpbmcgYW4gdW51c2VkIHJhbmdlIGJlaGluZCB0aGUgdXBwZXIgYnJpZGdlIGFz
IERhbmllbCBzdWdnZXN0ZWQsIAo+Pj4gSSB3b25kZXIgd2lsbCB0aGlzIGludGVyZmVyZSB3aXRo
Cj4+PiB0aGUgdXBjb21pbmcgZmVhdHVyZSB0byBzdXBwb3J0IEJBUnMgbW92ZW1lbnTCoCBkdXJp
bmcgaG90IHBsdWcgLSAKPj4+IGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LXBj
aS9tc2cxMDMxOTUuaHRtbCA/Cj4+Cj4+IEluIHRoZSBwaWN0dXJlIGluIG15IGhlYWQgdGhlIGFk
ZHJlc3Mgd2lsbCBuZXZlciBiZSB1c2VkLgo+Pgo+PiBCdXQgaXQgZG9lc24ndCBldmVuIG5lZWRz
IHRvIGJlIGFuIHVudXNlZCByYW5nZSBvZiB0aGUgcm9vdCBicmlkZ2UuIFRoYXQgb25lIAo+PiBp
cyB1c3VhbGx5IHN0dWZmZWQgZnVsbCBieSB0aGUgQklPUy4KPj4KPj4gRm9yIG15IEJBUiByZXNp
emUgd29yayBJIGxvb2tlZCBhdCBxdWl0ZSBhIGJ1bmNoIG9mIE5CIGRvY3VtZW50YXRpb24uIEF0
IAo+PiBsZWFzdCBmb3IgQU1EIENQVXMgd2Ugc2hvdWxkIGFsd2F5cyBoYXZlIGFuIE1NSU8gYWRk
cmVzcyB3aGljaCBpcyBuZXZlciBldmVyIAo+PiB1c2VkLiBUaGF0IG1ha2VzIHRoaXMgcGxhdGZv
cm0vQ1BVIGRlcGVuZGVudCwgYnV0IHRoZSBjb2RlIGlzIGp1c3QgbWluaW1hbC4KPj4KPj4gVGhl
IHJlYWxseSByZWFsbHkgbmljZSB0aGluZyBhYm91dCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgeW91
IGNvdWxkIHVuaXQgdGVzdCAKPj4gYW5kIGF1ZGl0IHRoZSBjb2RlIGZvciBwcm9ibGVtcyBldmVu
IHdpdGhvdXQgKnJlYWwqIGhvdHBsdWcgaGFyZHdhcmUuIEUuZy4gd2UgCj4+IGNhbiBzd2FwIHRo
ZSBrZXJuZWwgUFRFcyBhbmQgc2VlIGhvdyB0aGUgd2hvbGUgcG93ZXIgYW5kIGRpc3BsYXkgY29k
ZSByZWFjdHMgCj4+IHRvIHRoYXQgZXRjLi4uLgo+Pgo+PiBDaHJpc3RpYW4uCj4KPgo+IFRyaWVk
IHRvIHBsYXkgd2l0aCBoYWNraW5nIG1taW8gdHJhY2VyIGFzIERhbmllbCBzdWdnZXN0ZWQgYnV0
IGp1c3QgaGFuZ2VkIHRoZSAKPiBtYWNoaW5lIHNvLi4uCj4KPiBDYW4geW91IHRlbGwgbWUgaG93
IHRvIGR5bmFtaWNhbGx5IG9idGFpbiB0aGlzIGtpbmQgb2YgdW51c2VkIE1NSU8gYWRkcmVzcyA/
IEkgCj4gdGhpbmsgZ2l2ZW4gc3VjaCBhZGRyZXNzLCB3cml0aW5nCj4gdG8gd2hpY2ggaXMgZHJv
cHBlZCBhbmQgcmVhZGluZyBmcm9tIHJldHVybiBhbGwgMXMsIEkgY2FuIHRoZW4gZG8gc29tZXRo
aW5nIAo+IGxpa2UgYmVsbG93LCBpZiB0aGF0IHdoYXQgdSBtZWFudCAtCj4KPiBmb3IgKGFkZHJl
c3MgPSBhZGV2LT5ybW1pbzsgYWRkcmVzcyA8IGFkZXYtPnJtbWlvX3NpemU7IGFkcmVzcyArPSBQ
QUdFX1NJWkUpIHsKPgo+IMKgwqDCoCBvbGRfcHRlID0gZ2V0X2xvY2tlZF9wdGUoaW5pdF9tbSwg
YWRkcmVzcykKPiDCoMKgwqAgZHVtbXlfcHRlID0gcGZuX3B0ZShmYWtlX21taW9fYWRkcmVzcywg
MCk7Cj4gwqDCoMKgIHNldF9wdGUoJm9sZF9wdGUsIGR1bW15X3B0ZSkKPgo+IH0KPgo+IGZsdXNo
X3RsYiA/Pz8KPgo+IFAuUyBJIGhvcGUgdG8gb2J0YWluIHRodW5kZXJib2x0IGVHUFUgYWRhcHRl
ciBzb29uIHNvIGV2ZW4gaWYgdGhpcyB3b24ndCB3b3JrIAo+IEkgc3RpbGwgd2lsbCBiZSBhYmxl
IHRvIHRlc3QgaG93IHRoZSBkcml2ZXIgaGFuZGxlcyBhbGwgMXMuCj4KPiBBbmRyZXkKPgo+Pgo+
Pj4KPj4+IEFuZHJleQo+Pj4KPj4+Cj4+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+PiBBbmRyZXkKPj4+Pj4K
Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+Cj4+Pj4+Pj4+IEl0J3MgYSBu
aWZ0eSBpZGVhIGluZGVlZCBvdGhlcndpc2UgLi4uCj4+Pj4+Pj4+IC1EYW5pZWwKPj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pj4+Pj4gQnV0IHVnaCAuLi4KPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+
Pj4gT3RvaCB2YWxpZGF0aW5nIGFuIGVudGlyZSBkcml2ZXIgbGlrZSBhbWRncHUgd2l0aG91dCBz
dWNoIGEgdHJpY2sKPj4+Pj4+Pj4+Pj4+Pj4gYWdhaW5zdCAweGZmIHJlYWRzIGlzIHByYWN0aWNh
bGx5IGltcG9zc2libGUuIFNvIG1heWJlIHlvdSBuZWVkIAo+Pj4+Pj4+Pj4+Pj4+PiB0byBhZGQK
Pj4+Pj4+Pj4+Pj4+Pj4gdGhpcyBhcyBvbmUgb2YgdGhlIHRhc2tzIGhlcmU/Cj4+Pj4+Pj4+Pj4+
Pj4gT3IgSSBjb3VsZCBqdXN0IGZvciB2YWxpZGF0aW9uIHB1cnBvc2VzIHJldHVybiB+MCBmcm9t
IGFsbCByZWcgCj4+Pj4+Pj4+Pj4+Pj4gcmVhZHMgaW4gdGhlIGNvZGUKPj4+Pj4+Pj4+Pj4+PiBh
bmQgaWdub3JlIHdyaXRlcyBpZiBkcm1fZGV2X3VucGx1Z2dlZCwgdGhpcyBjb3VsZCBhbHJlYWR5
IGVhc2lseSAKPj4+Pj4+Pj4+Pj4+PiB2YWxpZGF0ZSBhIGJpZwo+Pj4+Pj4+Pj4+Pj4+IHBvcnRp
b24gb2YgdGhlIGNvZGUgZmxvdyB1bmRlciBzdWNoIHNjZW5hcmlvLgo+Pj4+Pj4+Pj4+Pj4gSG0g
eWVhaCBpZiB5b3VyIHJlYWxseSB3cmFwIHRoZW0gYWxsLCB0aGF0IHNob3VsZCB3b3JrIHRvby4g
U2luY2UKPj4+Pj4+Pj4+Pj4+IGlvbW1hcHBpbmdzIGhhdmUgX19pb21lbSBwb2ludGVyIHR5cGUs
IGFzIGxvbmcgYXMgYW1kZ3B1IGlzIHNwYXJzZQo+Pj4+Pj4+Pj4+Pj4gd2FybmluZyBmcmVlLCBz
aG91bGQgYmUgZG9hYmxlIHRvIGd1YXJhbnRlZSB0aGlzLgo+Pj4+Pj4+Pj4+PiBQcm9ibGVtIGlz
IHRoYXQgfjAgaXMgbm90IGFsd2F5cyBhIHZhbGlkIHJlZ2lzdGVyIHZhbHVlLgo+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+PiBZb3Ugd291bGQgbmVlZCB0byBhdWRpdCBldmVyeSByZWdpc3RlciByZWFk
IHRoYXQgaXQgZG9lc24ndCB1c2UgdGhlIAo+Pj4+Pj4+Pj4+PiByZXR1cm5lZAo+Pj4+Pj4+Pj4+
PiB2YWx1ZSBibGluZGx5IGFzIGluZGV4IG9yIHNpbWlsYXIuIFRoYXQgaXMgcXVpdGUgYSBiaXQg
b2Ygd29yay4KPj4+Pj4+Pj4+PiBZZWFoIHRoYXQncyB0aGUgZW50aXJlIGNydXggaGVyZSA6LS8K
Pj4+Pj4+Pj4+PiAtRGFuaWVsCj4+Pj4+Pgo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
