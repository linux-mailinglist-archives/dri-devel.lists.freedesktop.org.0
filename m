Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A740C18A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 10:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203866E8E6;
	Wed, 15 Sep 2021 08:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51196E8E3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 08:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m31Ria5l0NGm7iCnbuTC6ZhXuAd5cX+X5L9oDGuoMI4VxbNFK4WLkypVFcLBzO5aUZasia9BdUBpvmwG5TqDVSDoKAwDYAajdxvgharL7kyiFTfEm3HFexjeFSZoIJpakKeKJfLQArpWr6+7ukJCkReN4P9TxTOle+fzpfa9rPIjesUg6DhUH/FQXnvxnHaAvLaWlidK4pM0jQ1PhHqK2Rxw7/yylIjHn6Wzt9gbJ44xzYcrkO/3Li6AsbokB8mySUV9t8+Ll00EiYjz9q5QpevnNNLKXzUEm4/eLG+5oyVi0clpnEb1TvjU4jGXqr0veQcP8XS/TPZurs8ymmsP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rTYymjclCqtyHGagyXuy+Nz+B3ugAs22O3PND14VSOw=;
 b=n8EmXbZJ7gLTYFtSe9HVkRDZZkPBli8ZzIY0dlNbQmClmd1G8qZB3UC9HoQ1+2tTOyV/QrEzAfbUypPQF5dhPFntOe8wzpJcAv5IYPBLyZXRTBBMTQezWaADbz0hS739KGIiJvxdcH7wVri3UADESrq80efQ8LTZAXEaGRaWrYh/iTJpvKSMs750AYOA2+jW97t+P9E6Ucd8wv2qotNOQSd04X+//2s2b0h04xBGY2ulMqX4ECPvjOeUBF2ssba7gk5iKTvhsnrpH6Fsk5GGrhC6ZRaGuUOrO/9qH1w6FdigerKu9IqAn87cnUXTr64aTXWUO7KINkQQPowFJdPujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTYymjclCqtyHGagyXuy+Nz+B3ugAs22O3PND14VSOw=;
 b=r1nwwtZtIq9x+DO4VHN4N80VQ4SHxnD88wkE+8AYKTxb+jtb2BtNcm/Hv02eMYCF7VyqNxHmDNgRENXT6Vhpeh5uR37y3AuqP5Pl0cTRUlHvmTAQqtjRHIuKTdjRyT46nj4EJGGQKbwAcZ/5yvodbiPvHZOcySOvo5E9eIKTpEE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 08:20:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:20:59 +0000
Subject: Re: [PATCH] drm/ttm: fix the type mismatch error on sparc64
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-sparc <sparclinux@vger.kernel.org>
References: <20210907100302.3684453-1-ray.huang@amd.com>
 <5e365947-4ae1-47a0-7565-7f0cdde0bd84@amd.com>
 <CADnq5_PXOXiob3k5Z+cZz6K2k5iSCdzwNm0ZxKQOuC+PvdJxxg@mail.gmail.com>
 <CAHk-=wi=rz3trQgOJ76pe1poCtmFkat-Y_Dm9_x=fzb27OszJQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a6fe16b7-dc7a-3ea9-e043-eae202d9ff0e@amd.com>
Date: Wed, 15 Sep 2021 10:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAHk-=wi=rz3trQgOJ76pe1poCtmFkat-Y_Dm9_x=fzb27OszJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0077.eurprd03.prod.outlook.com
 (2603:10a6:208:69::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:d03d:8939:3840:1f95]
 (2a02:908:1252:fb60:d03d:8939:3840:1f95) by
 AM0PR03CA0077.eurprd03.prod.outlook.com (2603:10a6:208:69::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Wed, 15 Sep 2021 08:20:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb63a1e0-dcf7-455e-4a78-08d97821bf73
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4094D8BBBD7F9265F41A9CA183DB9@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r0m6cCf1XuJLXsp2H6yu2bRincsNXj96PE95ht//traLDijB7Zr8NHmcCLJxixmrFePTZw0RKuW7joZaxahA/ZwrDFhOpISGQ2F1nOGfMnMhWC1TntflOBmoE/s+oxGkWQhzezvTVGd14W1vBYB5+3z0+Hq3IcPU0PwG4VdiHNS4QT5Zz/CHgiVzeS0qk0pf+GnnV4EO9PwN3OpPyl0dD56AitSP+80+s5xmRik7HCyEmGliDFWXxS0koIABF5gw9ka25akuqyrD9j1hIabM9XQ21fYiZzpBg4soSNuTvZOYo7dXljc95diIKcb44SH8ZsjSuFJHjQre3SegNlJ/qJv9jcDTro+DX38Cx6JLvhOFrwrhs3XH8aBw1wGRzYqQbV9zJHddXC59EQY4Dp4kPR9S4Mdc2gnFnajDyE4ML2jRRjdC0M6OVucJBIZnZpa8TYpUjzpdrg3JqVoYoj2GVcqGV/RBzL1uZp+e5Bug+SmcDUIQtRkhZQ+87Vx+8+VqepjgV/7hIKU2KJqUArYqWxd0EkbGPSSv+d5NXWG1FAqAAATAMdrEqBBZwqJvIiho6yAfBSO836hKf1g+ewMTJleXFrpe2qtVR9srkIOcNwYWpXQOxUmrNRhpdDHqYxAJKmhp1TnDwLFsyxqs8RJm0DcpDdEE1EBSv0vOLj2Nc2p8HqQ5oT/J+LOLu9Ii+vV8kWKriRT6HumuuHR7kva1jq2H379dmv6KPK71XAJPMbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(478600001)(6486002)(66946007)(8936002)(66556008)(8676002)(4326008)(2616005)(54906003)(110136005)(316002)(86362001)(38100700002)(66476007)(186003)(6666004)(31696002)(36756003)(53546011)(5660300002)(31686004)(2906002)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEtLTEk2eWdwMXkwK3VPeHpDUi9XanV5eUU3Q3NwTkgxcUoxaVUyYmZleHFu?=
 =?utf-8?B?NS9uUzBNazJaNmtIT0tWekVnZkZiWTlpblluWVdjRmtJcDErdzEvUXYyM05P?=
 =?utf-8?B?ZDN2Qnk1NDBhZ21nbGhaYk5zVlpob3ZjOS9IM2hidVV6eFVYY2E4ZzB4OXUx?=
 =?utf-8?B?TFBXUk5zblpGWkRVMmdaOHMvdXNleTBCVlk5K093K05sNWNVSW9WM3N2Skpt?=
 =?utf-8?B?L1hxVGJUZWRNZ0VZUmRaSGczZ0FpN0N0K1RUSTdyWFNCZWlLaTBNUGNGc2hU?=
 =?utf-8?B?ODlpc2w5YjVSci8vcDVxQkYxWWx4YStHdHdIbkhSdmNWbXBIeTNQM3M1RGNr?=
 =?utf-8?B?Y1VjWGQ1TS81Yjdlc092ZnFyZjZSNnN1UWVac284VU9hVW5meWJ1UDFTMk01?=
 =?utf-8?B?ZmhWWi9HOGZwQVJaZHZjNlNrZXJSUFVnMnBKdmw0SWtrU0lKK1d3NVZGQTlY?=
 =?utf-8?B?ZHRxUFROdE02d2QyQWFjYnpReWZoeEp6SjdIOTJIL1d4d0l1SDg1N3JjUkg5?=
 =?utf-8?B?V1VMaHdrbUJJTEhuWktyOElULytYUDd3dU9VbVNVcW1WZENRU0V3SWxKSmRx?=
 =?utf-8?B?L1YrOXVtc1FtY3hsZXAyQTlLQmpOZE1PejdYazFib0IrWU01dG1GOHN5WXRr?=
 =?utf-8?B?UXk5V1VkZUl0b3d6c2x5ZUpLZktnaERUWnZvTlpuZmpaZGdjME5ueHl4bWRZ?=
 =?utf-8?B?S3pSU2F2R2ZFd1Rmd1J6OUlNR0ZmVjdoODE5K2JPajI3YWw2a0JTUlpibElE?=
 =?utf-8?B?T2FZdjJXL01vczE4ZUluZm1ZamY2RmtFTDFTanY3U1VMY0p3aGRCalMwMjRY?=
 =?utf-8?B?R3lHTC8xV2NodmhJejdNZVJaY3czaWdKdUtmaGU1N202MjhUVlVCaFVjT3Qv?=
 =?utf-8?B?dCtBRlQwU2ZWNHBBUjNtSVdubDdDYkcvNmRsTm8zS1dxUHFtOG9vWjZIY0s5?=
 =?utf-8?B?VWlGVTBTclhKV0RwY0M4dTdsbytvWHAzZEJadHAvaEpjUDJhVzlycEJCYkxK?=
 =?utf-8?B?OGo0cXZoekwzWW1MZjNkNmFIUzdWdEZwNitaV1h6aEY2ajJBdk1ibFJCdHVo?=
 =?utf-8?B?ZGNCTnJKZWJiSEZJRnQ3RmxwYktRcTNudjBpb0ZYV3pkTHBQWktRakM5WVIw?=
 =?utf-8?B?T2lJWnFlVUlmeEFnM2dyMTY2YkpWVEFKeHA2UWNyZVZ1OEQva3UxLzJETlNC?=
 =?utf-8?B?dWNSSmlHNjJBV282QTdzK3FzU1A4OU1YeSswb2dXVk5qUzk4dE9mbm10Q2g5?=
 =?utf-8?B?MzBXNXRTTCszbURzc0xEOWVPWTJWVlpQYU5aUzF2a1Q1WjdHY2Z1TDRVWWFx?=
 =?utf-8?B?NStyZFR5b1k4Mkh3elJMNW8rcGF1NTI0NkRZYTBabnpnOElRdUFJaXhCLzRr?=
 =?utf-8?B?SHJmTXY0SGY5YjJ3ci9vREd3T2d6N2tLUDlBVzhLWXlIWER6SUp6ajlYQkFW?=
 =?utf-8?B?QnM3Yk5tVCs3eXdhSnQ2cVBkQTN5U2Y1MlNlWUwrOCtHclFYVENaVHh5eHpG?=
 =?utf-8?B?c1RXK0JnRkFQL0IxMWEybzRqZy9zNWphRGJ3S1A3S1M5eVl4TWVpOW9STVI5?=
 =?utf-8?B?NUdKSm5qdk5laGlscm9vT1NibTBMNTE3M0MzTmh6djJZYTlNZVc2VkxVSlll?=
 =?utf-8?B?YkxVSE5KdVdSb0xhSjdTK2c0VmNGMkUvWlprRkFHU3VkM3JKdzRUWkh1cWE0?=
 =?utf-8?B?LzE4c3lBMmNWSUFTUzMyL05GcVNjNHNxQXIxTmNNN1lZUEV6Z0pxWEFlT2s1?=
 =?utf-8?B?ZGYvSWdTMDdHUlZlOEMrVDBXOHhndllFTVFONFd1K2RWT1EwMHdCTHVzQkJx?=
 =?utf-8?B?M0RJWkE0TU82QzY4OEYxL1YyYU5rVFozU2JPdEtCTXlZWkNQM1JuRDFiN2xo?=
 =?utf-8?Q?5vjNgEcq//6e4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb63a1e0-dcf7-455e-4a78-08d97821bf73
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:20:59.3022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUe5Xocs6KZmirgNKUbeP7R31GQZf5s+SaeIw60bgrOvRQ4u2TE4SOcCgT0kHu4t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 14.09.21 um 22:03 schrieb Linus Torvalds:
> On Tue, Sep 14, 2021 at 12:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Tue, Sep 7, 2021 at 6:25 AM Christian König <christian.koenig@amd.com> wrote:
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Is one of you going to push this to drm-misc?
> I was assuming it was there already.
>
> I guess I'll just apply it directly.

I had it already prepared and just forgot to push it.

Just did so a few minutes ago before reading this mail.

Sorry for the noise,
Christian.

>
>           Linus

