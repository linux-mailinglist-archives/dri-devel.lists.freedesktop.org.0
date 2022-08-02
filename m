Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4408587F9E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 18:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB25D90BB3;
	Tue,  2 Aug 2022 16:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BEB90B37;
 Tue,  2 Aug 2022 16:00:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwRe6RMIlFtc5iAiCklz7XlnHXX0tc9/rS5ONdR8D/sytoVnt/S1bd/PpW704YT2KUUfULArtx4v3m4rV4sO0sHeadjeME0+STamnqno+JUKUVtyWncUOUXvJ3pMyXGSf63JL9r3KDvi3NkEwKNfLrz/pBiyWpbzGBMM6S2wDwiisw2/ExXD4ZC5hO8PuoKYgc+A1Y1/aGkgChIr5srpLmdg42PRSWmXYode4jHR5Lv6ZY7gODupdj5m5dLMyDRtpDn6stukjoKjI8ar957rL2iGTI1zMVj1N35jRQTYQtZ4F6UKDgwvOcXwDEjWJaQOiBmva9o8FyP/CFq13agarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2xHi9SN5picCYkAVl730+lrYOYa7ytVmC8RYd4NYX0=;
 b=cgju/AYc00iYYWQTcTYSCQOzUwtNd1o2PJwsWEf0tvBr6gFXXekVZ10KmcpuTupGihQMGUp5B7RwwtAWJuB66khzagS3nUZAxKKja9OnjtqWKRxOR9293PY48zpS5p9FIkykJYoDPeKTP2trsmtWzdE31MVdde0nbZt87tVRQ55ytbqPkovMoIB6oQUgXdu2yS11tMm+jH1eFRJItO2+DjJeqJT3+wFm3ughD2y5GrNWgMfNOkyyswsC9OEx2dBmwoRIVAajNBot88gqt9PAxOA6n3vY6X82Y3rgp2GS4h7afk1KZ9rokzHEbyNZW7NJFgfsZUhUvwVDAj5zdOybbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2xHi9SN5picCYkAVl730+lrYOYa7ytVmC8RYd4NYX0=;
 b=yJ6pbNRQCnSPqC8/tvcOMhP72nFR2jxfN4I3+Tpqyll7q6ujrYblH/+FShHX6IteYWI2iXFhojYqqGyNib8LJiJ3EuqW1ot7HS4m1QGYOaeMwcdmgqAvSyAWbnqGR/t6lCDaHirrmQKp/VzVINPUKVVRg/ucLgAOA/Dbc+ClB6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by BYAPR12MB3095.namprd12.prod.outlook.com (2603:10b6:a03:a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 16:00:35 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::289f:f718:af41:f38a]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::289f:f718:af41:f38a%5]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 16:00:34 +0000
Message-ID: <c2b5d2ea-312e-3e5e-4f0a-d8ce8709cbb2@amd.com>
Date: Tue, 2 Aug 2022 18:00:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] amdgpu: add context creation flags in CS IOCTL
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220802135558.6324-1-shashank.sharma@amd.com>
 <9e342f6f-cfac-83df-3b03-ee1d095d27ce@mailbox.org>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <9e342f6f-cfac-83df-3b03-ee1d095d27ce@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68e488a9-0110-4168-80e9-08da74a02186
X-MS-TrafficTypeDiagnostic: BYAPR12MB3095:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYAcZYDb6zkTIlVTzF2ceJmWKh5/Yb7iS+lrZBcUpBowftiPkrllVckGemYYlR/5dS+vEshKp//eY0GcfvxXC8sPZRmA9xePhi96Ab0b0RiWpp0Bz3CM/WjPV1/lpzbZZ7x+5EV5K8mHXXHdWKTOoY0PAC6/gPhLnMQD48GbA8PhjW9UcHIve4ML07HShvHEDSbAq0zPYVBSgLDA+V+5Xg4cvEz8s98iXTqOBO4u64QD5nkS0gpiwvaAXY/giSv3GWHj8/bnn4XIwLo/hgihwllF0qJcu7sWZ1gdi7kxjOxd3Fp/BFZB4LUBpt/42g3ENnpSrqNBlE75nc/8V9Za1AbU85BBiv9eYCuLhHmJb1CI93Rq5/8qhZEqRItYdatl3u+h8QZyElhfl+cwEMn6frMZ38q5VpzREpyl+qxaYhRsu+UF6eqT06GMbZx1MP2ee91qwcSGHuIrQUf/MWmE0XVJ+vDs1dOQ9Ng07y21GTNIuwz7GMM3MCFdC0NK4ldrhl+qpmI+Ry5Q+xvEpytYlZeI1vXNW+eGIOD1Ni9w5jUhrzNsBGpFY0zzVJh+wLg7/wg227PGNEtr3Z5izvXk4lLnqrOHcntzmtjHlT980KKETvL63WV7WVCrtpFHS5nvOl0kq4uUYWYUgZKNQqnvPUEssrShooEgpcHXMjQAOtojN1rzohbtlNebTB+Kzqf5raXsfmeHLUZoegyfKanhE8p0II+YBqsj7jTylLZrXkOYcLTwbckg1lDoo9EycNvc2Vl5Q09pHQ3VsYKXVwGgwkM3f7YHfkUpSI4l5u5g7bo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(31696002)(86362001)(83380400001)(38100700002)(8676002)(4326008)(66476007)(66946007)(66556008)(316002)(2906002)(8936002)(5660300002)(54906003)(6512007)(26005)(6506007)(53546011)(2616005)(186003)(45080400002)(6666004)(41300700001)(6486002)(478600001)(966005)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGQ2QUpLWlYzcFhFMnFUS1Aremh5RllSSS9nOWhDRlEydDFiQzBoY3YvNHJx?=
 =?utf-8?B?bEtCWjVNaWdsVTVpaG1HN1k0VmQzdUJHOG9ubUlRc1BJQWZzN0UwSFRaQ3BK?=
 =?utf-8?B?d1RqUzRUQjEvb1c1dms3OHJRUHVIWjE2L21hU1I3TTNSd2RJK2lLS21MT2hH?=
 =?utf-8?B?VnlOVXJ1bGYvK0lDa3FnRXpqS0VmNmV3V2xhU1FZKzQyajhXOUIwdWJFMW1w?=
 =?utf-8?B?d0oreHJYYlZUREdIaFlnOXh0dEU4SUdBZFI3SmE0TVUxcm1VblVsTjNYZTlY?=
 =?utf-8?B?eTJkay92UlBzN2lObjBxQkhMaWVROGplT1FXaDM2ekhIeWg1VW41SEFQU1Fh?=
 =?utf-8?B?OTdrTjdjczltWlVZZXhZYnFuYUg2c0NFNGZuSFhhbkNWa25VdEhCcUhPbFNN?=
 =?utf-8?B?aHF5YjgwdTIwZVJMdDlrL2JnSWIxQlVRT2lsUUgwalJ0Zm96c1dRcTRRbm82?=
 =?utf-8?B?Z2t2SGtTOHBzMzh6dFRocmlZRXkzODZRdTRHWS9xRUlzTXFRUnZCaFAyTzdn?=
 =?utf-8?B?Wkg2SDljSEpwT3hIclR4S1lFL1Vpb3E4S2xNbitQSTRhcXZGb2dZMng1U3ln?=
 =?utf-8?B?Nlc0ak0xMUJ4Wml0eGJuNHdUM0RNazI5bGFjWG5LMUV0bzVUcmJ3ZXNHRXFO?=
 =?utf-8?B?TEVKTlpqbEdBajU2NlBJbEtBMGJZb2FVUDdJSElFTWxlZ3pxTFBnY1p3MEU2?=
 =?utf-8?B?ZEE0UmMwV3g0ZjYrTWVHRmh0M1UvOXlhc3lDSGhnWS9XbzFrcEFPSHJRK3N4?=
 =?utf-8?B?NWdESmlCUXNiQXRzYWE0ZjIycEFjZVgzeC9lNVkzc3dXL095eGJEaXhHQ21v?=
 =?utf-8?B?OWI3cVRGbit6YzNFOE9WNXVmS1dvb255UkorTzF4NC9Jc0F3SXU3bkQrNkFr?=
 =?utf-8?B?M211TGYzMWNhbEp1b0FYc09JQ0wvL1NjbmRER2JsN2g2aU05K05QTzFSU0xU?=
 =?utf-8?B?NjY3WDJmSFY0WnR3YUtzYmszTjZyRnFEQThOeUw5ekRSbjAvaGl5QTBHb0RS?=
 =?utf-8?B?cHZ6NDd0NWdEWVg5OU9BR000azcrQmtMNVpUNnRYZzVqWWxDb3RpRlRlTnNG?=
 =?utf-8?B?c0w3SmkrRWl2Zk16aEkzalB6U2x4WE8rT3JadEFhV2NLc0kwbHlUc1RuYVIy?=
 =?utf-8?B?c2pXcG9FcklTS3JESWZKSUp2S3luUnNkNStoK0Rpc28zVjRCbmZjOE5LUUZK?=
 =?utf-8?B?S0FDWGpUNW1KazJjb1ZRd29LQkFxY2g1eHlkWFJPcUQxU3Q4Y1RmaHYzMlhD?=
 =?utf-8?B?Rmw4NStpaDNPanZCVHp4dmxuMmpGY0pIVXA3eUl3UCs3aDRibyt0V2hTdlds?=
 =?utf-8?B?UnAxRkJ4N0hNRW9RSUluTWdsSFoxV3BrRDZIZi83UFB6bG41Si9RYVF1Zy8r?=
 =?utf-8?B?VFVDZjN4ZmlEbjFLRXhJblNFS0M4ak0vRGNmRFZDdEN5RWcxOUZEQktkdDM4?=
 =?utf-8?B?WjNsMllPVFh2QUtJd1Nveno1V2tpL01KSllLOVZNTjFJUGdNczgwWW1tT2d0?=
 =?utf-8?B?bmIyRzgyd2ZiSFEvcVJEbHNxajNONmhUVzBEUHluWFMrbzRBeUJKQmU4SWFi?=
 =?utf-8?B?K1poczBQTFJTRUl2L2NsdlpVNytzY1FiVnczZU1RdnlwZ1BpcEpGNXdUTlR4?=
 =?utf-8?B?YWxRR1Q5RDdGbXJsME8zM05mb0h1aU9MNmdtK3F3YkRabnpCYTVmSXU2ZHQ3?=
 =?utf-8?B?eGE5cFVRSDhGWVZQUk5sSjhWdlc3YVVySG9jSHJXMWRSdG5WbjNTZUtjS1BK?=
 =?utf-8?B?U016bmNjU2ppbkdPRUcySWVuM1ZOQWw4TlVBeFltd0x0WXVqOTNFK3ptTlFK?=
 =?utf-8?B?TUdNUTQyMUtLaU9DTGxUdUg1dmEybmwzUVZueEMxSFpkZjVuUGlZSGZWdFRH?=
 =?utf-8?B?Mnc0RERVODZrWFR3QXJyRkVzYzRuSEJiU01vNzVxU1p0VFBUT1AwNE13OXJp?=
 =?utf-8?B?ZzZtVjJGd29BN1lnai9TbEhBMm5HMExEZzk2UE1Ra0FzWGF3TXBBODNldFBz?=
 =?utf-8?B?VTJpTjVsTERIOEgrbnRPRmVYTXdieUNRaWwydnIzVXQ4RWZWTHJlbm1GRHd0?=
 =?utf-8?B?RjlpZUFJdzZYdWIyalF5VmI1cTRBUWp6UlpxMFY3ekEvQ2ZCSFgwODEzb2ZS?=
 =?utf-8?Q?bTapIY4vGdiDXzM4o9oZXwSD6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e488a9-0110-4168-80e9-08da74a02186
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 16:00:33.8506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csGb2MbHkKBY7zSD9L0EMAy70bcAOxIZGjF8w8hdcmgigE/w3C+T0WWuij9ecZJeHsdhtnlgt1KPYFbjoXWKww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3095
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Marek Olsak <marek.olsak@amd.com>,
 Amarnath Somalapuram <amaranath.somalapuram@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/2022 5:58 PM, Michel Dänzer wrote:
> On 2022-08-02 15:55, Shashank Sharma wrote:
>> This patch adds:
>> - A new input parameter "flags" in the amdgpu_ctx_create2 call.
>> - Some new flags defining workload type hints.
>> - Some change in the caller function of amdgpu_ctx_create2, to
>>    accomodate this new parameter.
>>
>> The idea is to pass the workload hints while context creation, so
>> that kernel GPU scheduler can pass this information to GPU FW, which in
>> turn can adjust the GPU characterstics as per the workload type.
>>
>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Marek Olsak <marek.olsak@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Amarnath Somalapuram <amaranath.somalapuram@amd.com>
>> ---
>>   amdgpu/amdgpu.h          |  2 ++
>>   amdgpu/amdgpu_cs.c       |  5 ++++-
>>   include/drm/amdgpu_drm.h | 10 +++++++++-
> 
> See include/drm/README on how to handle changes to include/drm/*_drm.h .

> 
> Also, libdrm changes are now reviewed and merged as GitLab merge requests: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fdrm%2F-%2Fmerge_requests&amp;data=05%7C01%7Cshashank.sharma%40amd.com%7C50e342a42eac4d4d4fd408da749fd574%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637950527087917031%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=qU41z3Hxo0jKMWgehDWLYi7r4x1QDsA%2F2KfOigj9iew%3D&amp;reserved=0
> 
> 
Noted, Thanks.

Regards
Shashank
