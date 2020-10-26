Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB5A2997DD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 21:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444306EA68;
	Mon, 26 Oct 2020 20:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8656EA67;
 Mon, 26 Oct 2020 20:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIPKjSIPGD2DRt/G4NMcKLA5j/mZc0ZNy55DmFJL7TTgNN3LJCesubDdeB9EsQll1vrytTlQ0t0eroOitCv32wUeDFYW2zCHIZS+MF5WO9+clFzBD9v2zqOG+PfAcsS0PB9ecXzuiLcAQm3FWr4icO1mOMGym5cBAKi9f/KPR226WKGaBu9KC+c0+el3W56dDHfPBVQ4iqqoCmIzP/FQfHWV82uscuBZQQImCFAV4Dlo7QHdYxVn1TgZc+96bCjafMfs46f8ctio+oigq9Nxfeia2ze63G7jd++jRm/v9+onTrgWtmpA46Mlmnoc7ykYqwbrKh9jG0ezbGtTFplbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/istzXITo3ijTlDsDU060YiZLIWtPlhC2q1FZyce8g=;
 b=U3FSLM1kMWvfON9XLpvYlQXx++rKsj0W/4alT8sYYpaGkCHXO+dr+Moh9NN/tgotuC83QxpwxV+0aH0ohMtH0qZVlCSK42R1BSBXX+4PlZMjGLRYCS2IeWaCJnOG1sSC4ZN/zNTK8WZ8w8DzNEaKmWEHRv5S7BNIbWu5d0xQCv5l62Nea44bEdYlM4g69fqlvBCNc8FexwTMGVgS5NrWHM8zjfS+wFEp6fGZQT8iGjuhGbdVf97uy4lhqOvlrqp84BqrxJi+fDKjxwE4n1mE9vYFtqK0DLDJwq1KR5/aDQ+5mIdnxy1hcI5m6wO3mYRavYcqnb7ZtWFT7ovl1NG4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/istzXITo3ijTlDsDU060YiZLIWtPlhC2q1FZyce8g=;
 b=a0Lqkqb41Or2UBCMWfmbRjzog6XIiAqWd0NDT+T33wnGV8D4I6rv70JhGgCEqZpDUha6HBchkagE4ANUNBgf3heIqFfmuTgfX7hfWpEz0/zshz9aXrIbozZ0l3d5MzUOV5zYPcVEhtjREz8lNAb0XYJdmq3EZsBt01Vq9xZU23U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4273.namprd12.prod.outlook.com (2603:10b6:a03:212::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 20:22:23 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b46f:9253:b0d8:7999]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b46f:9253:b0d8:7999%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 20:22:23 +0000
Subject: Re: [PATCH 0/3] drm/amd/display: Fix kernel panic by breakpoint
To: Alex Deucher <alexdeucher@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>
References: <20201023074656.11855-1-tiwai@suse.de>
 <1d3e22ef-a301-f557-79ca-33d6520bb64e@amd.com>
 <CADnq5_OY8tRqs-bao9mkKxgcXC=305-_71U=04C5z9HM0+5MuQ@mail.gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <22ab9117-0281-2ff3-8328-d7780e353643@amd.com>
Date: Mon, 26 Oct 2020 16:22:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <CADnq5_OY8tRqs-bao9mkKxgcXC=305-_71U=04C5z9HM0+5MuQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.211]
X-ClientProxiedBy: YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Mon, 26 Oct 2020 20:22:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 76cdf65b-8ec1-427d-7e3f-08d879ecd8cc
X-MS-TrafficTypeDiagnostic: BY5PR12MB4273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB42731D108AC7D28B55E79596EC190@BY5PR12MB4273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wbsIHzCNpYPw97v25JN2Shwrbr/hfmcGBlNW3feLf1Z+AdktJ4qtHV0xP6gokPDTe3Cmh+YGRyAobJ2w7/VnZIlmC5BNCnlBaLdVL2x+jbh76nzlYU/WM6ED0EmKUj0xUS1ggL40XWy92/clsBrwzdfALB6aOrYSMG4mmAN9vgRJU/r+UPfiRqpDNVPTdnSKGXGWUH4+SB8ASjZXOhjLYVwRWcM/fnq+zvEIGvM3c6oBgw6wOQNfsb18IOg01xV/hm3+ZkSpTfDLVCKYasL8glffbwcPSibxXYZlJGyVtnWZ9LOHs5qzfT9ZtcdpxfAmwZl0kjS9UBNqYsXlFPeKysUUEvXCSLsIWUpjps7Ql2HCh2m4UTJlgvMwlQW1kMe2klfKnU68oVXrkD9U7Kaj+qLiScPPia7rCfa7R84gohU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(956004)(8676002)(16526019)(6636002)(31696002)(66946007)(2906002)(86362001)(8936002)(83380400001)(36756003)(66556008)(66476007)(4001150100001)(52116002)(2616005)(110136005)(966005)(186003)(16576012)(26005)(31686004)(478600001)(4326008)(5660300002)(6486002)(54906003)(53546011)(6666004)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Hqda6JH9kEt0yITUZ2vlKYs217Oi+QSx/fuCf6fSCEhmjbMB5hoGg0IhTtkHVvPftdSgO6FAgc1Ku0A+k14Zpu5E/AND1kqQSmDMkXVClGZazU4KC6RfWYP2GkkjxtEL1bOzU0zKwF8D3tC5jaPfK2QblK2GYhKvUJL2HxkR5/PQbLl2PgPdVxIG7d7qEkoCV+rmhreCLK16821qE4Z2jvPb9ZvLw4Olo4ivbYI16opOSn1FI6S2/rUSkjzAW8GRNWnTzygsCRyBY6mk3WFUSsiBZLO6eFCrGAkZ+ylm96alKZQ0414c4R605heAHDSnUbpV5B0Y9hB7S234cd3FLkHkwJrgccCGhlQkdJKFVtv6+aQ2co1+jVH6ImiVmeU+V9uQQJsgqlFTkisE1BC+zE4zekGMVhW/+vXbmiGql6P38d4X6RyHffz7RK3w+hqumBQuayjkS5E9q2RaHgTkwn+0lRKYx11R8XFK1y+W2ZAO/0qTx18gLGRsigzZoVv5k2hawoY5EznwMkCh66s09TABNWhP7Ysml64STOq9KinMwc+I40yph/nQHp8UDdSygu8XsQWFKiVgABnNB0bGAlHyJ6nekfVdwZXc3uvlVcbf/C/YFIk0vfpHqLo72uaJCtQzow84XIBP5FkR2KfACA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cdf65b-8ec1-427d-7e3f-08d879ecd8cc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2020 20:22:23.2856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0pNmK4/WQctCPLlPMaf/tdgg/S8zBIJ0z9pO6X7iVjmtvx1BkQUYs/Hyh9P1Rfc3nM0YKZfDgLfaUObutL2Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4273
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Looks fine to me. Feel free to apply.

Regards,
Nicholas Kazlauskas

On 2020-10-26 3:34 p.m., Alex Deucher wrote:
> Yes, looks good to me as well.  Series is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> I'll give the display guys a few more days to look this over, but if
> there are no objections, I'll apply them.
> 
> Thanks!
> 
> Alex
> 
> On Fri, Oct 23, 2020 at 7:16 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>>
>> On 2020-10-23 03:46, Takashi Iwai wrote:
>>> Hi,
>>>
>>> the amdgpu driver's ASSERT_CRITICAL() macro calls the
>>> kgdb_breakpoing() even if no debug option is set, and this leads to a
>>> kernel panic on distro kernels.  The first two patches are the
>>> oneliner fixes for those, while the last one is the cleanup of those
>>> debug macros.
>>
>> This looks like good work and solid. Hopefully it gets picked up.
>>
>> Regards,
>> Luben
>>
>>>
>>>
>>> Takashi
>>>
>>> ===
>>>
>>> Takashi Iwai (3):
>>>    drm/amd/display: Fix kernel panic by dal_gpio_open() error
>>>    drm/amd/display: Don't invoke kgdb_breakpoint() unconditionally
>>>    drm/amd/display: Clean up debug macros
>>>
>>>   drivers/gpu/drm/amd/display/Kconfig             |  1 +
>>>   drivers/gpu/drm/amd/display/dc/gpio/gpio_base.c |  4 +--
>>>   drivers/gpu/drm/amd/display/dc/os_types.h       | 33 +++++++++----------------
>>>   3 files changed, 15 insertions(+), 23 deletions(-)
>>>
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
