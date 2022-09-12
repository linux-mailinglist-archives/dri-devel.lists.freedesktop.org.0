Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E505B6311
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 23:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7673010E30F;
	Mon, 12 Sep 2022 21:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8CE10E30F;
 Mon, 12 Sep 2022 21:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liGQxH3oWZ1MbEIdQ3GW2anvx5XBOj0akl4vReXhVYerznIG8L6z9HnEEFx5RqZMbcPDiX7RV1tuU9gTZCLi7ZZqOEBFzNc9EfZM0Kgk4Xwq0qyQniVgnVlHk1YmXbslERAoOK+mtimQoJCwXp/yCjEP65/4dtML54CfRlDiRIW/y/s443vtVGqypof0dHUpWisBLqbtivspYuhxpU9VVRsSB1q3pJnXxnReUrcmSklqu3gWXdINlkD3/9mbQQkIrsLxExMJvUWiHMSy9ub3ftbyw9valZ0PJr7lbZTlR+RbkG84Vmq9rUb8uBuxpRps3NLjMVWBZNGMK/Vvkx4uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVDuxn3B6IvMR+tq6G+rP819NDlP7aL+jVdGY0BM/h0=;
 b=FVs8cog8rUsM4P03OqBKNQ2l2gczZ37Q35hTuRG4o0PCEIe5cIDbdbXjxrSlj9KHY/rj9b9gEAfuQS/e6mgZCypb5oG4y4n92qlRNIM0Bi/Ws8fAv6+qrT4BcLp4CFLFYI6b1lD8BvhUhZIbdsf+J0XNqc89UsOWHl79amnJYxcjlDZlaFMCfmveIlgmmttFXnRKL5MzMSlyNBld6E7p8HvfyB4IsRzjRfCLIY/ufkYIV8WODX0XTy7ynQI88/BTjSG8XXWD9MgPfdfgLAnrXNhyExeAeiLAmhtQGGoJsXiJtUhmc+OFaxQe6DdzmFQIL3wXd3F6TCD3CAuknQ3q5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVDuxn3B6IvMR+tq6G+rP819NDlP7aL+jVdGY0BM/h0=;
 b=P/OtnartJZIpx3+usiEeOHNGN2nRJQeCLyGo6yNGAhvPAQV1BkIZcb6TMtK4Z0xeAhmRpMvCaHQqkkElkmTsbhXWQEbAoXvAQeGftD4J8cSvUsFEbJvqHkMXOdavbT3psWVJK4oNiehsZcdBUBCTO/1Ivor40sjvOrib40ZhSZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 21:50:39 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 21:50:39 +0000
Message-ID: <ddc17b2a-fd9f-2eb6-7cdc-5f17c048b26a@amd.com>
Date: Mon, 12 Sep 2022 17:50:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/5] drm/amd/display: Reduce stack usage for clang
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20220830203409.3491379-1-nathan@kernel.org>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220830203409.3491379-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0386.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::31) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: f318381b-84a8-4bb0-0244-08da9508d4ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IupeLxD0XpLnd2Vg24eMuIvYSiFzcFxNYgJQblB28jCnO+H4CjO0VW9s45JIPsT2Ihz7OuobvyM3lhWvy7Wt7fxS8AX5DbAOxmJXUWPs88nf/H+Gxm9Yj8yxhOra4NJlPTsylJeaPLmeUQU82dzo+FcN1JrbxO/HtDJkIn1mZKGtTyJuXO0l5TMMBcEqrRQ9BBVL6KPOG9BMAj7GR11fFmPVHu23JIPSrlHWaKKJzCfVnpweKG3RrfMpU+xgriIU3ifWkX1fTmcmeSK0yFIwrRpQYpvFO24cj2u1pUAi5OAVw4y/GoMe/eq7kdf1UgECXeghJHrKRi/ktVu2HAVlbFIdM69uqM6PoB52X58p1XRh+mfRxMwpNVorymHJGZqtInBfQMG/rMEvZE6gCNaiv3wd8z96gGLcBXxloGe6a2WvPZvppC4+yBvSK8iBnli4estgUxlvTCYKSG0QS4QtyRMpNN4PKZxH3mGQ/PAsd4wK+WGmlHmynMQ7RGmZwPHXKyBrMVQ/JdwSEX004kHTSWD4O9RzGL8ni8FTyAOIaM36d1qbsswj99wckmvjeb5qJp62EmGmK2qRWE6mSvdFyMr3WIWSAZ0i/jan6C+vgKe9ODCy9zoLnO2QRskekb5SnI9yUXRWZ3H51vFCv4vdw5u2I2J6xNGxpxHJGBp1ivN2WVqBMZgXyFyWf7dZR8cwbN7LALC21edxlVeEf5SWI95sj7Rx0gv0V81De7GooCLxlSnMcVWc9G4FVbntU6Cu483792p3X6Brd9FlYKgUb9Pm3ZWQl3fAlIOAc7CUc1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(316002)(38100700002)(5660300002)(26005)(6636002)(6512007)(31696002)(186003)(478600001)(36756003)(31686004)(6506007)(4326008)(110136005)(66574015)(6486002)(83380400001)(66946007)(8676002)(54906003)(2616005)(66476007)(66556008)(41300700001)(53546011)(2906002)(86362001)(6666004)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGkyVjAvUUR0VzduYzA5REoxVm9qcG8xeHpTT29LY1BsQzRkWUoxRWN1ajJV?=
 =?utf-8?B?UzZJMDZrMTB0WEFlUDFKTWZHcDVsUDV3MGl4VkJGcWFlWFlBSlhKUzltd0Er?=
 =?utf-8?B?Mk5sU2llSFo5YlFIa1NCZlV6VENMUTJWaEtROGVDN01ITUpZUHZSNkVLajYy?=
 =?utf-8?B?Z2dDa0gyaVhXbThiN1BLa2FQOGlxVDhxTDNGVTZ2eUJBaEdVdnVXTUpiM1pY?=
 =?utf-8?B?azNmL0g2OC9DTWF6emZ4Y3g3Z01meEJDYWlSK0RNSGJScXByNXMyUmVyajlT?=
 =?utf-8?B?bFdOME5VSlh3VzZ3eVhPNjh6aGN3azBTMVo4MFpFSHh5cDdrcks0TU9JUXQw?=
 =?utf-8?B?SFVaWDVCaGZKQkFUb0p6WjFaSTR5ak1vdGMzVVJESHdYeFhxQjE0ZUZjbmYr?=
 =?utf-8?B?dkJXdVN2NkRIdHhmZGJyb0piWHBLTUE1aHdwbUdScjcxSXN6clZzSmsrK2ZT?=
 =?utf-8?B?clJaajRTc2JCSkJGdkd2Z3NMMGRoSURRUGtGWmJjYjFWRlpDbWNBOVJlSkdY?=
 =?utf-8?B?dElsZjBsY1RDS0hhQ010TlVHMHAway91eGZYZndpZEtLdmtpbUxJcEVCQkx1?=
 =?utf-8?B?WXFEbkVtRjhBNEd0RlNsdFE0TityNFRyem5oMGVPT2xocStMZTlFM1V1ekFI?=
 =?utf-8?B?b21ZL3YvWjFVSXNMdU10SzdnenRXZERlRVVKSVpqajFsZTZUN0JuSHNGbXcy?=
 =?utf-8?B?aFc1ZnBQbFRnenFvdXVKbDRiUEFNb0dnczBsbnp0TmxqRnY2bVZuUnR0T2dQ?=
 =?utf-8?B?UU1mL3dkeG5jMklPR2d3TG1rQ3c0MGF2UjV1WkpMczF5b3VzVzNJVUhPWk1l?=
 =?utf-8?B?WTFhUitDd2NQWnRHekZDSG80Q0ZGS29rUHN4UHNldmpLV0NENWNuMmlmbTJS?=
 =?utf-8?B?NDIya1ZIRWJsVFNlNkduN1hqYUVOTDd6RkJISVZ0MXd4UmswWUNwaVRuam1r?=
 =?utf-8?B?ZHI0dnpUVEZnblFQV0lLSDBzb3h5c1AyRSsxdHVzdXN3YmdUSVpXdjVzencx?=
 =?utf-8?B?Y2NxNERRajh3OFZ0ek95QUJWeFc2YUQrRHB3a0RtUXY0d0lwc1BmaDJkUjBW?=
 =?utf-8?B?cGRoWjR3SlpmVGU4M3NWbmVuUEtqUnpoMG85ZEdTK0RZOStaTkdJNk5ScDVh?=
 =?utf-8?B?SjBiK3lJV3lrVjZMbktGWldNYURpckRqT2tVbkUvR0IwNWVJSURsMy9CdEJt?=
 =?utf-8?B?bTE4UStWOXNYZm5FbWFBWERVOWdJZndrYmx3Y0gyWjB4cVhaK1pLSE41MjNh?=
 =?utf-8?B?SnNCT09GRWJjMmJXMGdWczMyRGJUVFVxVUhRZkFTQ1hXSHpyWFFxUEFtblhz?=
 =?utf-8?B?Zzl4R0hPM3p0K2xtRU9teTk5aTJRU1c3WHB2cHZiRFNEdU9SR1d1UDFES2Rz?=
 =?utf-8?B?K3hSaXp0WHEwUS9NRm02UW1ValpEUVg5R1JBMjRGVTQzalQ1T0t0WmFBSGlh?=
 =?utf-8?B?U1FSL0NsaU8yT1ZST3pvcmZpMFpOU2NCQnRpTjBpM3Rqc1NMMnd5RGYzVkt4?=
 =?utf-8?B?V1U3MWR1VDNoQXhqemxNWTd2TXJiM0hYUVlrdW5MS0FpTTBVWHRjVnplaEpx?=
 =?utf-8?B?REpVbm52V215dkc0ZUNDRDFSTnhMeE1GQzdRd000cU96cUpSRUxIbE1LT2tU?=
 =?utf-8?B?Y2VSenJoczQ5U25kMUVNYzVSMnNQQmFVSzdUbzFiTytzVWg1YzRHTHNJTlR3?=
 =?utf-8?B?WTNIRUpBSFk1c2ZZOXlLUDlPbnFJN0xYRS9Td3lvbjdmSWo1MmJWT3g3YmlH?=
 =?utf-8?B?SFByRHNnT3FZdTA5TjBmdWZEM016QmpSbk8vbGJ6bnhLNjNwWTlFdTJXMndy?=
 =?utf-8?B?NVpzN2s4QjNVYXE4VE5Kb2Z6WXNucE56UHVRdFE3T0RNME5VTjFkUUF0MFh4?=
 =?utf-8?B?U3llZFRMaWVUdVJOaWZzQjA0M2R4akx0M3lQWDNUemswdXRLdGlhck80VEx0?=
 =?utf-8?B?bHJ3aDVxb2Rxb1l6TXdEaEJNbEhHbW8vTUVjNWpacTY4Tkt1djZ0ODd3anc1?=
 =?utf-8?B?ajVhazY1WGJIZmhxSmZrZlJ4RlNIZUZXTjRyNDV6bmVLeFM5VnZWekMvWXdx?=
 =?utf-8?B?elg5Kzlob2tCUDM3UmNuWWtwQmszek5jWGdXbnl0V2I2bzd3K3cyUU8xb05N?=
 =?utf-8?Q?EIM7AeB41rjct70Tv58uQ8iMu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f318381b-84a8-4bb0-0244-08da9508d4ce
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 21:50:39.1237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYDVhqJppIYbXYIkUVsiFpmAbIMnU7CHdCsKqt4fEaaMnfXO3lITmWJMCYkDfYEkVb6zoFD/F00d/g1ahFNfkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-08-30 16:34, Nathan Chancellor wrote:
> Hi all,
> 
> This series aims to address the following warnings, which are visible
> when building x86_64 allmodconfig with clang after commit 3876a8b5e241
> ("drm/amd/display: Enable building new display engine with KCOV
> enabled").
> 
>      drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>      void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>          ^
>      1 error generated.
> 
>      drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>      void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>          ^
>      1 error generated.
> 
>      drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1721:6: error: stack frame size (2152) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>      void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>          ^
>      1 error generated.
> 
> This series is based on commit b3235e8635e1 ("drm/amd/display: clean up
> some inconsistent indentings"). These warnings are fatal for
> allmodconfig due to CONFIG_WERROR so ideally, I would like to see these
> patches cherry-picked to a branch targeting mainline to allow our builds
> to go back to green. However, since this series is not exactly trivial
> in size, I can understand not wanting to apply these to mainline during
> the -rc cycle. If they cannot be cherry-picked to mainline, I can add a
> patch raising the value of -Wframe-larger-than for these files that can
> be cherry-picked to 6.0/mainline then add a revert of that change as the
> last patch in the stack so everything goes back to normal for -next/6.1.
> I am open to other options though!
> 
> I have built this series against clang 16.0.0 (ToT) and GCC 12.2.0 for
> x86_64. It has seen no runtime testing, as my only test system with AMD
> graphics is a Renoir one, which as far as I understand it uses DCN 2.1.
> 
> Nathan Chancellor (5):
>    drm/amd/display: Reduce number of arguments of
>      dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
>    drm/amd/display: Reduce number of arguments of
>      dml32_CalculatePrefetchSchedule()
>    drm/amd/display: Reduce number of arguments of dml31's
>      CalculateWatermarksAndDRAMSpeedChangeSupport()
>    drm/amd/display: Reduce number of arguments of dml31's
>      CalculateFlipSchedule()
>    drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack
>      usage
> 
>   .../dc/dml/dcn30/display_mode_vba_30.c        |   2 +-
>   .../dc/dml/dcn31/display_mode_vba_31.c        | 420 +++++-------------
>   .../dc/dml/dcn32/display_mode_vba_32.c        | 236 +++-------
>   .../dc/dml/dcn32/display_mode_vba_util_32.c   | 323 ++++++--------
>   .../dc/dml/dcn32/display_mode_vba_util_32.h   |  51 +--
>   5 files changed, 318 insertions(+), 714 deletions(-)
> 
> 
> base-commit: b3235e8635e1dd7ac1a27a73330e9880dfe05154

Hi Nathan,

First of all, thanks a lot for your patchset!

Sorry for the delay; it took me more time than I expected to review and 
run a couple of tests in this patchset (most of them were IGT). Anyway, 
I'm good with this change; this series is:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

And I applied it to amd-staging-drm-next.

We will run some extra tests this week; if we find some issues, I'll 
debug them.

Also, thanks, Maíra, for checking this patch as well.

Best Regards,
Siqueira

