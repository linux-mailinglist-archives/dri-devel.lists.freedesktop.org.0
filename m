Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE1708E24
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 05:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033B710E5A7;
	Fri, 19 May 2023 03:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA2810E5A7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 03:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnblvInAFfoxPJkf1BipKx1nL/CVhDC1u3WASDqlR0cP4q6vg9OOz3bUlbaClfVXVJ8ZVZflSp2GFddtalGzbhVBc9x2MxTzJCj4yrXgzd5wEU+dpDKnd7cg26I9vTPLd/rYgiQ+W0yJXQRVjF81uOx6Ou2zSDdU4gPAmTLU9VP7la3abL2nfZKq8SktSKl+a2ojHs+ch6Bs7b3u9dH4o0MbxPd3j1c+PGO0cYDGov324wPEVT9JWP6sufpNkhfD+t30iXEXzTWWLLPdMZjxbW8ixryLJ4XhWAqOIRlkIm5ZCGOB43MR6Db8uquAlCDCCGNoawvf04I+h2iYbd8VOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/xzZBhxsnYMR6g+PxM113Go50OkDe9y8NOOynJrwo8=;
 b=ly4zSyS7zpM99WUwh7lzHV7Yabk7293tFmMI4CBh9K+C2MbR5OVukrDi2DLT8oqLppZ8vVW/LI8T9tF8bNyFQ0gsNZta8mllTZCjQ3YWf9PkrnaLIImk7FtgjRaAy78AJSp0u+kOoQNyPfZtE9Z+N+VYZHVGK/41SEWzqDXbCklgvgwshlAD3l82LuFQJwuS6AM24vU0IpQZ6SUz2u0oKQ0xOkI/lGZbXETUm+0V+WD8xO4QqebnlFoSrJZGx+A20h4pqnZm2nhTG6UPpAiAPCN/t8SsT1Alivq3UQJZAa5L6PkhUtr4MBmzJQpDrpx/6JeEe46R9JJXejnYka5WDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/xzZBhxsnYMR6g+PxM113Go50OkDe9y8NOOynJrwo8=;
 b=yh34tv4n2by0jiMy2XMFBP/x4Ab2Y+y0LrrhlxdbS2SCaJHmY2RLSoFnRVQVRYX6kysaZ2aRrQW5v6N626BXl346pPQ2KP/royQZafAfD+QtIjy30i2ofwnstOwdPm8ZO8knGduFm5SMjbu13uzV3x3PBTkSRCYyPCGErtFIz6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 03:10:35 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::29b3:39df:b69a:7db2]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::29b3:39df:b69a:7db2%11]) with mapi id 15.20.6411.018; Fri, 19 May
 2023 03:10:35 +0000
Message-ID: <c4768d59-8247-e94b-fdc9-46801beeba07@amd.com>
Date: Thu, 18 May 2023 23:10:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20230519100608.7e836126@canb.auug.org.au>
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <20230519100608.7e836126@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::31) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1753:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c03855-8b2b-4bc6-b1da-08db58169d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K6s/v6j4eCTPYHgpgHlYQPTg2i6H0TzSTqtrpt3BeAlUiLJENC2QzcZxh4uqstR3vfZjLvwGu2d/nJTFXn7cWW9GukHHEWzhxVAhrrZh6xS8IKvlW7jqkr3fe8p6iIF508xugGu3t8CdQ46APh1aFaUZkZETlMtJeaRFWzfxi+DuZYR0/Waj8PMQr9DzjWCA6QDffdUf1ZFBl7dHDjjJ6NvCLLOu1TaqvUUoJ/p7YCCbBmt9qy+wNeGnCzur1FbJ8GEwsaYDCyBtjf2kt0SfZ8tKKKl94JU3RSmukZ1nrPnvUQ5B7zbDAzH1qzpies6gI1pZUQcRdmWU+CNFZAp+v/v1q8g6gapRbhpbWm5rG5PjngaKBpHZnpLoEPE/l6+nJbBJeaObRbXmfB0n5GOTHWdeBmRx3Fm8lz5QOsUQoEGu2QRrNzJRCNDJdzH5BCZuGeMR7SwjzxNIzWENnmthAGj1i+TD+ERApsENcUVzia/tig9obJUwxNZ1VG9bssOfxxTSUR2Gp7Yq1Z+ZnFUYWTfKJRheHwDx+McQ0SQVyAsSDkZKdLgwTGyFohmmTzEoRWomPgCTDogcQeyi3XR69mTTCKp7SveT77cYpvhUx+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(2906002)(4744005)(478600001)(8676002)(41300700001)(8936002)(31686004)(316002)(54906003)(110136005)(6666004)(6486002)(66946007)(66556008)(66476007)(5660300002)(4326008)(966005)(6512007)(36916002)(53546011)(26005)(6506007)(186003)(38100700002)(2616005)(36756003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2gzQmJ6WTNtdEdocVZLMXA5NHFiTXlOb2pnMEUrSUx2aGNHajVXR2dtd2hw?=
 =?utf-8?B?Tk9qR0U4M0QzR0lPNHFmOW1VTXRmdlM2bjVkS1QxWW5zeW5lT1BpNTBRUCtN?=
 =?utf-8?B?M09pRVlpbG4vOVhlTGVnQ1lySmhCOHZaSVNRT0dwOTlCcjJGN3B6eW9DN0J3?=
 =?utf-8?B?cTZLbFBTM00zWWVIM0VZY2lMZi95NEtnTnA5dkNpdE9JT1VjZ3E4TWhwMTlB?=
 =?utf-8?B?Y2FDQmVtd0Rnc2F6Y0ZOQmpEOFlZZXFQMlBDUFFYODllZjVOaUhzR25iaHlT?=
 =?utf-8?B?WGtlRVRJWjZyUU5tTjdSVUJDVlpITytYSzZxWWhvL00vVHBXWXVxdGo0YjE5?=
 =?utf-8?B?UmxrNGNSREM1eGl6Y0MyWkRBek5MVnpqUWN4MGw1aWpJUGdZS01lKzRvVFly?=
 =?utf-8?B?bWFnVDlRUDZtSlc5eTdsVmZhV1NYVnMzaHIwZ3BKR0dpZXlrakkveTZaUnFw?=
 =?utf-8?B?WS9XU0tDbG8yd051VURYdUJrZDh2cXhMZURiSmJISEorcjFoSUxKVlVwR0NL?=
 =?utf-8?B?M3kzWlBZM1hPYjhTbjBRcFFvSXJvMXVZMEkxZm1JL2VZZitKY2xFN2VQQmhX?=
 =?utf-8?B?bUxuMHY5a2tqcFBqU2wwV0ExclFkMGNDRWhtTlhqQWkzZHNHMWY0d3ZyRXpO?=
 =?utf-8?B?TTVjK011blp2YU5NMDdBUjJPc3l1OGRMZys3ZndrOGxtWjc5V3BEL0Z3YnR3?=
 =?utf-8?B?RWUrZStDejNMRUttZWJDVHdaTmE0ZGR1RGF2NW9RQUg2VHpteWpPbUMyNm1G?=
 =?utf-8?B?Q0ZpdXhZVXRJQUQyUHN5TkhCMHJnSDRZT0poT1IrN255U0ZBSEVtWk9DU3JE?=
 =?utf-8?B?OXpFWG5zK1VlcjdsdHh3aXFTVVVNWkdQcDVJWE82ekFNbVJZMkY5TXRUMWpM?=
 =?utf-8?B?N1Fad0g1NUcwa2pXa254Z2JsSnNUZWdOUFFsZWR0Ym9OQk5aSnVkTEQwdys5?=
 =?utf-8?B?VUtSTHlZbEZtTEJaOFY5ZHU2TWxWN21tanlUY3Y0dzJWR3BQZFRrMk9Xdmov?=
 =?utf-8?B?amtNWGlZTi9uRlRvU2lwVDlTUkNhK1YzVUkxdDRidXlFUzRaeDFsZ3NqSjFM?=
 =?utf-8?B?RFBUakNHOG9CcFhYRzBNenJoaXNBTG1INlg5SGNiUDZyUkQ0bm5iTng5elMz?=
 =?utf-8?B?QjRhYUsxcEJVK2ZJTXRXNkR2dTlTWmhibGVyMWNSRGhYYjhIQnlIeUthQktU?=
 =?utf-8?B?YWd6aW9UOTdBY0p3ZG91cm1TTm1hWWZaYjdFa1ptbFR1dDhteTJzcEpiNC9o?=
 =?utf-8?B?Y01qL2NhSktqZ0s5NlNRRjYwQzNwQTVVSnEwZWVYbllBZVhxSG5GQURPR0N0?=
 =?utf-8?B?SWpYZ1dFd0VFRmpYSXpzYU9DUTdJY2swV2c3OEpFVUphb2JvcmJNQzRSNFVC?=
 =?utf-8?B?UUpFMlJyN3M3RHp3b1p5UDB1eXhZWUZzVEJDaW9hZzh6YklvaitHM3FoQjFx?=
 =?utf-8?B?UUF5R3ZqblhpZWJJTDk1MmtiaERFUVFDTlZBSlBueU85c21uZXVqNE5kOEdp?=
 =?utf-8?B?TEdBNVZrYmprdWxYdHVsKzEwZ0t0d0p1RXlhbEFhQkl6MUFQcStaL1oxczNW?=
 =?utf-8?B?c0UxRXpQamFKU09ST3p0S3dGd3EyMG02Y3Z5dUU1T2M5Ym9lT2VrTXNGcTU4?=
 =?utf-8?B?ZjZ2dU1jQXRSNHRxNEV3YmhTSjMxMG9SZEtERFNyU0xEVzlYZzNVcG5CZTVw?=
 =?utf-8?B?K3V0NWtRc3llWUVUcDViNUdIWnVSa2VqK1NsRUw3b1BYeDB3TUs2U0FZbzI1?=
 =?utf-8?B?UGlJVlFtTjhRTE5UYzVURElReGhXTTFSTnVEWkZaSGV2bXBwUnpEdzJOazFi?=
 =?utf-8?B?eWNzUTF4Q0dGdzNSTHJ0MmRZQ2tyRndpS29zRmFrUDZuTkdkVW41RVNtWjZI?=
 =?utf-8?B?TURiQmtrek16VHhsS2hDYi9yRDFBV3lwTHZDMjVRVkxGZkY5cmYrbHNvUXFz?=
 =?utf-8?B?bXlyUWRRWGljbWw3KzY5cG04Y25NSUczSTlTNXVmVDZNcVNsdzhUSiszVXdz?=
 =?utf-8?B?eDM3S0lJQVZDdFFZdjNCU0dueFdJclZIN2FzcEd6eHBMUWFTbzJ3aWRxTFly?=
 =?utf-8?B?U2ExbVJyT256N2JHNDBQVlZISWJpZ3dmVnpDdWFJY2tkMzB1ckdSLzNtQ2hW?=
 =?utf-8?Q?G0ORaBUeCt8+qNORr+p++Us60?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c03855-8b2b-4bc6-b1da-08db58169d15
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 03:10:35.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6HY9ro8jQb1WDVsjvq2S67E8fTo3LqJaljg+Tot8//jOn7sA5zyEZUinpkE2OOG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 James Zhu <James.Zhu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

I saw 
https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c#349

should not have this error.

Thanks!

James Zhu

On 2023-05-18 20:06, Stephen Rothwell wrote:
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c: In function 'amdgpu_ctx_init':
> drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c:348:26: error: 'fpriv' undeclared (first use in this function)
>    348 |         ctx->ctx_mgr = &(fpriv->ctx_mgr);
>        |                          ^~~~~
>
> Caused by commit
>
>    2458393a4e98 ("drm/amdgpu: keep amdgpu_ctx_mgr in ctx structure")
>
> I have used the amdgpu tree from next-20230518 for today.
>
