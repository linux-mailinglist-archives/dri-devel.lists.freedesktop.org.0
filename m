Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16AF57D3CE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 21:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C26810F63B;
	Thu, 21 Jul 2022 19:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF32E11257E;
 Thu, 21 Jul 2022 19:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvkD5gKBfRiMQsvAkwbgSlJQOVDON1Jne+tMM/adY9gOEfKrP3OZgEXv5z4MtfreH/QDdwKdwUNlHefvayGTN6Pe+dJskHxygi3xNh3pBjaivo0h//eVVXLnIWYzShYv2Ve1TOxGM6STH3nhfw065bQXNU6cqSEmBPgpF+6nCfaXL18MEyX8ym0MjgbIWl7jl83tUAErSz/BH3bKgd51xXk02iXPaTX2uC2yL35smFodSizMTp6Fl5ahbJpfoyAG+Mxwl/W8Yy7A47YiPDxgwfW7AsMPLie1IR3WwNPzLE+7SaRhOObncAQrOqEpH3Wa/anVYd7pvZRhLfJbAgwEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5PxrXyWRtcFbOAy18160snTfCYwoU1/tAbtD/yUG/o=;
 b=gW04a7zsgJBOYhokMq20xCtzGxS8ALNvv/vQK/nDW5EJIxSjGZ9PcYWA6hufVdJ84m+DMt76lrnZBfKm1wZm1JA6IOT52wvepCiuJie84e4k9wMzFsJYL2DbHPmmvI4JeJo74u1diJX8I0pX/2AAZxkBm+MRwwmR//8lmzOQmwdgIaComQQuASLPDEgvqlkaRrwtCXE77gQUWaYI+x5DlxQQjkQ4iANQDQBmA+oj8Crcl7Uv5133AQk/bZS7Qd2regKmyIYOtTMzyBzR8GJGswpvkSm0RR+NMEXTKM6Vn+a9K4C4DaAxbMFet+kcqag+tUEGlMTw03JcAa0DHcIimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5PxrXyWRtcFbOAy18160snTfCYwoU1/tAbtD/yUG/o=;
 b=F8MTDqmtkDQPdSB/6mxplLFIecykky2Z0v9zFHPL+68N/HXllzDO+uIuhtP2CRcDwJkl1B21kZxEpF+tVxNz3KaL0y+XMgi9W92vPbu7A3uzev/y9FPvUhb+9ubWdHKll8+LQUtB/xczb3cZCzB9I4jVxoRh8bajUHKgTfxz8RU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by DM4PR12MB5376.namprd12.prod.outlook.com (2603:10b6:5:39f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 19:07:22 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 19:07:22 +0000
Message-ID: <c13ddeb3-2b34-09b2-ffb7-6eb7b38e2859@amd.com>
Date: Thu, 21 Jul 2022 15:07:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/5] drm/amd/display: FPU cleanup in clk_mgr files for
 powerpc
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, airlied@linux.ie,
 alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 harry.wentland@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com
References: <20220720193208.1131493-1-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220720193208.1131493-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR01CA0003.prod.exchangelabs.com (2603:10b6:208:71::16)
 To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dbc2177-3553-4174-b5c7-08da6b4c3ddb
X-MS-TrafficTypeDiagnostic: DM4PR12MB5376:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bfUDkc1St0/KxNbyFX/zfCXDWnov4jEOJDH8wf/HZv4qyJHu8zq924gfedLTIhJFYIzCx+ZXFKcXPuvpIHeS/kdTrX/dGVcA+xAs+4Rn+SEtdiR0evYKpRguIdPN59UGejOUeT5YZplS9Z17gEwwHtUwK9iJS2esgAbtEPJqsU/aNfAABsfdc2pAZ5SUYpjNY4zMO3IUmhURWUXTv5Ceit181oqThg5AH2d7BqpvTHkb6d7Yn2nW324v3Qx3LmIt7sK50gw7hot9D2zFDPYyUi/KIX+Na1N+ZlAcqJcvIjBG5+JZnlm7o0sTYiqV7V9UVIzHEMqzHPu8SIXHq4NIkvF25rlEm1cw7Own2ZTMFFXFZyBZhSA8c81dZAA/CrJ0h0q/Jm+1IKmZDRTN6ZX21LdX6lOrw4BRV52W2Blf9+m9vcEIyEslLq/aLcCPoG9+CwzSdWkoV9YzTlPz1pyAyOgkOEguYizzPB6fg3f+abYa9GfIRZCdyB986A/mMerVO930hx7/5/YdBEX1XTB5sJOeLnSQQLfOe1Aqx7lBADgQ4iR7aPJCiDi5y/lPwil4pPBkU0YG/sKyDN/KG5XUveFLfk513vuP2GBwpsg4r5cum6L0uQr8nEmWaT5ChJbe1ruhx10znRYZdZfe9CiOyTWF2s9Ic+ADVVsJzpMyoYAnvz/EEBD0oVaMiAGmKrJB+HbXwzysDcQVYIgST/ReXmwgLsClkGfjwYKOkZ8wJ2yIDrC6sqdWeDr5gv2mMI2DGKc5T4zeRJX+60LgDUkj5LkmdCvp6p0Rf0Iyz9i5/y44NwsjRzFrtej6kW+ZctfNwDBbaVgvr1PlrdFP8s9b7NxiNHd5u+tWwJDAX5am0OftHBwjuU3M/RJHCdm+wCk/jLrhx3st4R/Pe3AHael1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(966005)(26005)(6486002)(2906002)(38100700002)(6666004)(4326008)(6506007)(8676002)(53546011)(66556008)(66574015)(66946007)(66476007)(86362001)(6512007)(31696002)(5660300002)(8936002)(36756003)(316002)(186003)(83380400001)(2616005)(54906003)(478600001)(6636002)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VURSQlRjQS9Kb0RMSXh3UTNZVmZnZW1xM2dBT1FtaXE0VGg0RVA1VU93bVFK?=
 =?utf-8?B?d0h3VmdGbnkrTDN4MnNBYkJJUGY3Y0ppTExNNXNiMmRjcGxyeU9DWDUvZFor?=
 =?utf-8?B?OTZXd3B2cStwcWo2UUhPR3UwK1pHdyttdFllT1FkVE0wZkl5bStDRjRKeUt6?=
 =?utf-8?B?M2Zvdk9nQ3lCWDU5Ky9DallxRWwxZk9RS2FQL2ZaZVlqZWhGNWlZbFZoZTJC?=
 =?utf-8?B?MjVBa1VJc1ZiL1BCVkQwaEtTUldBbDU0cDd0UVQwNFNoenY2eGxCZllGbndQ?=
 =?utf-8?B?QjkxZUR5UmFBb1VjMldhcU9NanN2ZUtBdnhKQ3Evb1NsNEZ4TTNybG9kdmxW?=
 =?utf-8?B?c0MwQ1dKV2lBSHN5V3ZEL3oxNHJKRXhrS0dmWWFaV2FtVjRPVzdHL0YxYTNJ?=
 =?utf-8?B?d0dRY3BZUURPWVBjYjlzRzdUdmt5bExRY1Y0VCtFTjJkVEMrSWNSMGdDOXhj?=
 =?utf-8?B?VmZaNXpUV3lqMFB2c002U1BwVjJ6QmJDdlBPOUNzeDZkVXBKUExCUjNEak9l?=
 =?utf-8?B?S1pxTEV1dlBldEc1K290WEU3TW9RSFdubkNxalhvODNCVFhRa0pNZkQxaVJy?=
 =?utf-8?B?YVBYSDZCaVRhcm80YWU1ek9Tby9pSlpyd0ZhSU0rQzNTQURNY2FYWDduUWVl?=
 =?utf-8?B?ODJJbTY0REhFRkFCTWVjY01XV3NHUFFHVnR2RGZmT002S1FWWDBlbmg3VFJM?=
 =?utf-8?B?d1ZsWWRsTXlVSWpiRnBISlg2RnYxL25zZkFMTEZrNzliWGlYZzhJRDVLek5G?=
 =?utf-8?B?eE5SNTRKQ0FHeW5jdzVQbUZORmZ6cTNUYnBPdHIzdFdZc2h4WlpONXVkWm1V?=
 =?utf-8?B?SWI5NkMxZVNzaDRaMW1JMHFjbWo3VzZOL3J3U0UyMUM3cmk5N2pXTHJ6RHlr?=
 =?utf-8?B?MHhNWmhJSXFDY1d2N2RRYUhiZlpzS2dMNFJ5bnExYjRJVHhKS2c5WjFoUGJM?=
 =?utf-8?B?Z3FEci9xRGEwSFFNTDRzOW9zUWVsK2ZzWDQ4d293cittUjZvZURZK1BuSWdm?=
 =?utf-8?B?MlQvSHhHRnVMeWlRTEZQZG1USHNmVFNOaDZKNlRVMEp5SWtTVkwrVUhhUi9a?=
 =?utf-8?B?QVNQdDFJdm81L0RESC9oQjQ5THd3WUxSZFlobU1PQk9nZ1NCR3RvV1NFZjFn?=
 =?utf-8?B?Tkd2azZOOGRoM2VGR2tKVmc0am5FOS9Xc0pPWnpPQ0ppWEZXOGZLa3kzN3Vj?=
 =?utf-8?B?amZ4Y1VRcDlNVmEyYWpQOU5TbjdJc2xqVkJuaFZXMUpQU2FpWWJ0MGhVZ1lI?=
 =?utf-8?B?cE9BVC9La1NMaldhTG9NTG9lcEpDTStJaUVrRmV6eGdhaUxwME1uc3RKcys5?=
 =?utf-8?B?NFRzUkltditjUkVRYXU0YTdpZlRpV21LdkYxaDMwekoyTWlGamptVVNFT01q?=
 =?utf-8?B?U0dtaEZISmhTQmRobWVWSSt3cjI1RHF2SERyTFB6Y2ZCNUxvT0xiVy8ydkJm?=
 =?utf-8?B?ZEZNOVA3azdaSTU5eWJ2UVQvRWtuekN0N3lVWHI0VXVQMUxSQkFudGNNTGpj?=
 =?utf-8?B?T1I1cUlUV0ZobzlPcysvZVJ1U3Ura05DalUyYkYreXlPRkFTejNOYXlGNERT?=
 =?utf-8?B?cTg3MWNDOEJxSkEwSmFGRldkcFdsZkNORjlBVGtXcFFaamUxdVkrZFZQamdk?=
 =?utf-8?B?aTB6SkRiTDIzK29ZNDlya2Z6L2ExQ0oyZkc0RnZjbjNrb3lVZVMyR05tdTN6?=
 =?utf-8?B?S05leHIzcWtkSDBEdDBJbWd6YUxIL29tekRtaCtiUS9QbzdGWmNLamQwNTVq?=
 =?utf-8?B?bk5wZmhrU3dZd00vV2M2dkdtVWlTOWtiSFhGRkFjeExCS3JOM0c5QWoyNUdB?=
 =?utf-8?B?OWptc2tZOEozYVBEQjM2Y2FDeWxQa0M3SER4RGZXTE5udmVOWlF3NTFzcUlh?=
 =?utf-8?B?VWVwd09kak5Fc3ZLdC9YOHZSZ3V4N0pPSkdvamZZQTFtSk9reEtzZWpTOG52?=
 =?utf-8?B?eFc5WUFPWUpod1l2K2NjblJmK2FYZHJKK1g3ZU96Tmx6aisyV2dOTmRaZDNi?=
 =?utf-8?B?eTZjeWVnVnM4S2hLOUFsMnEreHpPcFV0NE5IY0ZaQ3NvenJNNHZldmFESURR?=
 =?utf-8?B?YUFBTnZHOWV4N2V3Z0hOYXlqNVplK1JjVHgzZ1dob0ZVaDV5dWluNDZJRFhq?=
 =?utf-8?Q?H6RnZtXzJgX04stHnExKmmF50?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbc2177-3553-4174-b5c7-08da6b4c3ddb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 19:07:22.6935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmTyKh+dtHX2kSONbGTy6LvxGIz4PF+Z5pKcUfTAyw+6Nr4AGf4Mc/vP02tx/VZTXS+oIBCXG0gnlU0nuVMSqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5376
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-07-20 15:32, Melissa Wen wrote:
> An initial report from Guenter[1] shows some soft-fp vs hard-fp error
> from DCN31 clk mgr for powerpc. I was not able to reproduce it
> cross-compiling with gcc-powerpc-linux-gnu and gcc-11.3, but thanks to
> Maíra tips, I can reproduce the issue using make.cross, as follows:
> 
> - wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> - chmod +x ~/bin/make.cross
> - mkdir build_dir
> - COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 ~/make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash

Hi Melissa,

I didn't know about these steps, I was trying to reproduce this issue by 
using the standard cross compile package provided by my distro (Debian 
testing and ArchLinux), and as a result, I was never able to see the 
problem. Anyway, I can now reproduce this issue, thanks a lot.

> with a config file generate by allmodconfig
> 
> So, the first patch fix the issue reported by Guenter. The second is
> just a cleanup in dcn31_resource file to remove useless DC_FP_ wrapper.
> Finally, the last three patches I'm removing the -mno-gnu-attribute
> option, that was just hiding FPU-associated code in clk mgr files of
> dcn21/30/301, and moving them to DML folder. This series doesn't cover
> recent drivers dcn32/314.

I validated this series in our internal CI by running multiple IGT tests 
in numerous ASICs. Tomorrow we will also send some extra patches 
associated with this FPU effort; hopefully, after that, we will finally 
have all the FPU code under DML. Again, thanks a lot for your effort!

Thanks
Siqueira

> Thanks Guenter, Maíra, Siqueira and Alex for all inputs on this
> debugging process. Let me know your thoughts on this approach.
> 
> Melissa
> 
> [1] https://lore.kernel.org/amd-gfx/20220618232737.2036722-1-linux@roeck-us.net/>> 
> Melissa Wen (5):
>    drm/amd/display: fix soft-fp vs hard-fp on DCN 3.1 family for powerpc
>    drm/amd/display: remove useless FPU protection wrapper from
>      dcn31_resource file
>    drm/amd/display: move FPU code on dcn21 clk_mgr
>    drm/amd/display: move FPU code from dcn30 clk mgr to DML folder
>    drm/amd/display: move FPU code from dcn301 clk mgr to DML folder
> 
>   .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  18 --
>   .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 234 +----------------
>   .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h |   7 +
>   .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |  63 +----
>   .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    |  86 +------
>   .../display/dc/clk_mgr/dcn301/vg_clk_mgr.h    |   3 +
>   .../drm/amd/display/dc/dcn31/dcn31_resource.c |  11 +-
>   .../amd/display/dc/dcn315/dcn315_resource.c   |   5 +-
>   .../amd/display/dc/dcn316/dcn316_resource.c   |   5 +-
>   .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 235 ++++++++++++++++++
>   .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  |   2 +
>   .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  |  63 ++++-
>   .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.h  |   1 +
>   .../amd/display/dc/dml/dcn301/dcn301_fpu.c    |  74 ++++++
>   .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  |  11 +
>   .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  |   3 +
>   16 files changed, 423 insertions(+), 398 deletions(-)
> 

