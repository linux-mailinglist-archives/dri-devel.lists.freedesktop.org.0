Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C45B7D44
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 00:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D0910E633;
	Tue, 13 Sep 2022 22:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D05710E5EF;
 Tue, 13 Sep 2022 22:48:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYxPNCvasuSX9iandyoYnX2ZbIBeGtamJlXcU+wB7qY3RDqba2jlh1Xr931wSBv9SjXuF2pU+Qngw6cjI0h8wfW0ilMVOLeY1UmhHz4RVMeAABmjKxMJnCv7wgT+Q2y3jWeqalhyK2i1ngn9lMci6Crsw3ysp91orhgKXI+GEKejgA7qNkMYc1rcyOvSk4cw+MqPbvN3n5e/Eo/QDMoSi3hlgdO1vf6bmHINK9TRRIWq8yQqrmXaQG1yd6qfDk+hIPnKcs0pTeOttQ3hwCLig8cdzMp1Ldq5tjDNWdVcwz6uQQu+cpQwHwLotBl/uJ+xBZ/iX3HKZQl/cx4xhuvt+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8pimXFsGLm+Y9mrpbZ042MAHq9WwTi4e4Rs2BuV0V4=;
 b=micDA9G7/LIokIfAT5zb+VcM63w3n+i2e9RI9Oti2UJln8gomgJ/lBo8hcEhuE+svHUGqfj8gHuQ6YXmuGFX98N1+kWSIv613npyZXBayZ1q9Zi15QrkQvuIE/1bz7NiJtLb0/3UTBT2/e3v+Wa3EmU6i9Hb0F9SxUXhDNZ4WLM1IoY7NGWc7xr6JGlaCY6YeG7ILOiCMP+e32fjyXlXuj25utsMz1G1e8OvXQj3eKVdSlzNTK2GmjjmAx3bzo+8IcvESTXG+TyGTE5zLh+h1AALXIMPUxwSAuc5ixp6pppP1w0+rbtB/WLINg9ArpOangC2VdD8M3nc1dpUcoKvww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8pimXFsGLm+Y9mrpbZ042MAHq9WwTi4e4Rs2BuV0V4=;
 b=zggh4DvKg1bsxZpGaRCFJvjWhUF4jqSNPh+ekAAc6OadZklvcmoHBtJDo8x20Sob4D75GugtylBzxiR8yD5PPM3aEBxhQ7NpVzLuw7JJOk6qKlhvqgbv+o8Gx+Nj6eWd1Q7mIpGSUGV/OLiXYhhgmTAC7m2uJKBy+HPoLE4xLyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by MW4PR12MB7239.namprd12.prod.outlook.com (2603:10b6:303:228::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 13 Sep
 2022 22:48:32 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 22:48:32 +0000
Message-ID: <fc0a6e1d-c529-25ed-4e91-abdfcabfcb58@amd.com>
Date: Tue, 13 Sep 2022 18:48:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/5] drm/amd/display: Reduce stack usage for clang
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
References: <20220830203409.3491379-1-nathan@kernel.org>
 <ddc17b2a-fd9f-2eb6-7cdc-5f17c048b26a@amd.com>
 <Yx+sbmj94AOGAMCP@dev-arch.thelio-3990X>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <Yx+sbmj94AOGAMCP@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:208:32a::11) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|MW4PR12MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9c20a4-e2b5-4b38-fd41-08da95da152b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6AqQG855+Q8YOrsQKevY4kdZJzxh8ppLuPJ3PF+FkMj315Yb9segcLMlT3JqY1xOYmBtsBQT1lwSRaMiYLij1/hnJijVo6BPcYqaKlc8lTGtEnmYy0YWF+KQdaWgP6igW9G34SFK1+M1HZVRtYW9AM0oEe6WHj56fN060073VYKg2RQ9/hc9ZTc1cWR6LaoVFLmbM5fGdQDRWL5x59w18aQcAkUEBXXsgQPccQQiH85dQ4o0iwDFb9Nnlrgy+4ox/Q+ci1zRJzWwWbpJFHv6qbv5niVEWb4ik0f58EY74KiTvxWMCvhop2/th6gY+PiOjgXTO7qJDKYpbTxMQGdFczvDhj6B6krjERVEh/F9lOcHx4jfUtVQahjzwDRtffkMxDwg+dSwlsILdJyChdLfr8TP/vqWF2aF1hD0UbmlJy+IV/36DZxyPq5BSTHEgaZscxexk927RPoN2f7x14t1Dhc+PSJsXaZjtzAs5BWHGSLex92uVuQZEtT1GmLcyqiJisEuy5dx/miN/PSKbqHxIYO22FEY8GmGSLhNkks71DGPr4rztuRQzeVkImeyBnJhw0fSnHAEp8oFJ1z9Fw0bTHbO2YNzYVPJwP06a+8SS6Dz+57UGJ2D48zN56ZSZbspy4izcc+4SdqZKI+OngyFR11+5EyNa1skIrQeOPGbK06cKrxdcnuaUc87iIdIALVRJGK8ZdYpcP+LuJFSMXWyxREWcyK9fmWMcnViaG65M6w5yGiU61mKtEgl6GvjAl5EKlXNUOXngbmn2tWSmiyKwUou2Mios8Yq9Hs2++0q/A0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(31696002)(86362001)(31686004)(478600001)(54906003)(6916009)(6486002)(5660300002)(186003)(8936002)(36756003)(6506007)(53546011)(26005)(6512007)(2906002)(41300700001)(2616005)(316002)(38100700002)(8676002)(4326008)(66476007)(66556008)(66946007)(66574015)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3ZTVjYrNzc1UzcxUWNnakowYVpPbVpFc29nVEN2QkpYYm9VektRR0NwRUhI?=
 =?utf-8?B?UGhGQjlLcGRQZVErcWkrOEhaWktEVHpvOXYrazYvTWhqdS9yWUt5WEtNbTdk?=
 =?utf-8?B?WXNFd2J5d2p0WXppSldYVExoUVBnNFZ0NkRHL1JROU91a21vUExrK3V3VmQ5?=
 =?utf-8?B?M3hvd1pXZWQyV2ZOQmZ1V2lsbzR2c3ZxVEJvTDVPRUtDRHk2Q1hsM0d6STA0?=
 =?utf-8?B?VzREVS9NU3QwUGZTTGtaNy9XSm1ISVBXTXNKR0szWEN6R21zRzJ4NHM3VmpC?=
 =?utf-8?B?MmNONVRJMlQvZG5ITWtSWm4zRVkzeGtXSGlrc2lSWk9tRmZSMHJCbHoydTd1?=
 =?utf-8?B?dzFCV3plUmNLRVpsSVR3VzVlRFBnd2RpWG9pSjZSaGw4cnJjQ3EwUTE1REx3?=
 =?utf-8?B?WEdGRE84V0xOcEhWd05Lb2VtYmYxeUlvMjh4TlZTZlNZb2VDU2ZObGRMTWRI?=
 =?utf-8?B?Qm0yQmh4Q1NwRFgrb3JxR25ibEFQSTYyRVlDYzNwYVJ5MFlESHdaWEVZMnBt?=
 =?utf-8?B?dytBU3Jpd1d4Z0tBZ0dDYmVvSUw1K3lxazBnVmtKc2llUHBSVzI4QXdBUHhy?=
 =?utf-8?B?TWhHLzhUMjA5c0piMFUwbHZOY1Y4b1lXU2lzQnZBVXVCRXhEZWU4SEw4RU5J?=
 =?utf-8?B?cVdhZTFuMEIyQTgwNFVyNEMwd3Awc0JWUHNNcGZqT0tHK1QwaXVYNXdMSCtD?=
 =?utf-8?B?NXEzVDlRam5RbjEvLzIrcWZja0NXcVM4WWdEMnNJNm9TVjdNc2VYcEhjWDR6?=
 =?utf-8?B?b1BuSE5PRCtERDRjOEFuYWhvNlNvR3ZBTHovampUN0RDWVUwWkNqZkZrVnFi?=
 =?utf-8?B?bHFmTkNqR1FFdE45NkVXa1RYMXdJaWNZSzAxT3FYVi8zSllsQWduUDdNQVZr?=
 =?utf-8?B?Z3VIRitzYm5GM1lUcE1VQlBxZ0E2cVNuZ2dHaXV1V3dta2pyVEJEVUpaQmdC?=
 =?utf-8?B?akNkdTRVTDM0YzNzbmMwd3hGN0NFNlAycXpYUWZaa3pDWDhseVpKb01yL1RF?=
 =?utf-8?B?TFdFZWVRcWh0T1ZwY09lYitaQi9uVkl1T2UvcjZaOUxubFhua1VxSDk3REtI?=
 =?utf-8?B?a21XbS91amIzQVY2RFhZb1gxQmdVdDFBMnZOcmtKQ3NZRTRPekdVZ01yYmhM?=
 =?utf-8?B?elVOME9xUm5LdXFYbTNkL2Y4bU9xOVVPVnRRekFXZ3pkK0ZRem9GRzR5SlNP?=
 =?utf-8?B?M2ZTU1lWVEdrRElVMDZhVEo4c3N4YnhnQU8wOFhkWVdjUHdUZkE0SWxZMHJJ?=
 =?utf-8?B?YURKNnMxZ3RpaHkwekNHUVBIaHdMclh1TDlNYmYrR1VhY1Nhcm9jVVpFNVVN?=
 =?utf-8?B?SlhFOVd1MU1vWVpWaW9FYmpybEVRNmlVRUN2d0tkNENhWGk5SVdocHY5RFBo?=
 =?utf-8?B?OVdLYXZ3dFYxMjFBc2sxWkZsMWhjaFUxYkljaFRWMlFJblU1eHdIMzYvTHMw?=
 =?utf-8?B?VXJvNko0ME5zVWZFVVZhVXFtMmNiUkdqb1V0U3E1MlhVSnNpYXhIVDhJUUxT?=
 =?utf-8?B?bzVVS3RtUlRMZHBDbTN3M241ZStId01WTE8zUkZXdVh6c1V0ZWw1dTdaUHBY?=
 =?utf-8?B?c2JRSjJlamVJS1hKOFpOL1BQYjN5OTNGYlJrSklrTkh1YVZlQWxlS1VMR003?=
 =?utf-8?B?Wmg0TlJ2TjJHVE5SV3RTanpIcmdCNXh4VkhHUktjc2dvQTNGUHhXMlBrNUNh?=
 =?utf-8?B?R2ZWQTJIZzRCR0wyaDJOc3FWT0JpNlpyRENWOTcrNmEwZFJoS1pVZGF5YTV2?=
 =?utf-8?B?dkRKc1I0dnZxOFlMdUJlSytLY2FrRlVkQnkxR3pwejk3ZXc3SlI4ekxZaHJX?=
 =?utf-8?B?RFo3bGJOTVU2V1VySE9WRkNTMWxQb3hyT1V6ZVIvb20xb3FqRWVtMWVUWXFI?=
 =?utf-8?B?R09iSDVlNzVVSUhMSkVwcGxmWVBFMGNYejNQRzIzUVZ5OHVSY3lHb2U3Q004?=
 =?utf-8?B?U3RBQ1NYdjR1cG5jcHNYV1VSSEU2eXBYR29NeGRKUnNHY0lvZVBSYndnLy9T?=
 =?utf-8?B?d1pMRFVpbi9SSHZSV0orYzBWZWRreXM5MDE4VkJ2SU92aG90ekNKbGd5MEQ2?=
 =?utf-8?B?KzhGNkduMXUvV1ZkbEFaRC96L3BEcTFsWlFxbHhLVURXUURLQVIzMDB0V0tK?=
 =?utf-8?Q?Bf/do4SfcRt1gXBdiB2Z7/Ckv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9c20a4-e2b5-4b38-fd41-08da95da152b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 22:48:31.9928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoHwQOD8JtqNJpp2S+w2apa8tvqnwD1fdH8P/uKeaO0Mptohcq0nqWwDg8MjDQBb/GR+tFvkbToJGxDUVj/+yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7239
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
Cc: llvm@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Tom Rix <trix@redhat.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-12 18:02, Nathan Chancellor wrote:
> Hi Rodrigo,
> 
> On Mon, Sep 12, 2022 at 05:50:31PM -0400, Rodrigo Siqueira Jordao wrote:
>>
>>
>> On 2022-08-30 16:34, Nathan Chancellor wrote:
>>> Hi all,
>>>
>>> This series aims to address the following warnings, which are visible
>>> when building x86_64 allmodconfig with clang after commit 3876a8b5e241
>>> ("drm/amd/display: Enable building new display engine with KCOV
>>> enabled").
>>>
>>>       drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>>>       void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>>           ^
>>>       1 error generated.
>>>
>>>       drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>>>       void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>>           ^
>>>       1 error generated.
>>>
>>>       drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1721:6: error: stack frame size (2152) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>>>       void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>>           ^
>>>       1 error generated.
>>>
>>> This series is based on commit b3235e8635e1 ("drm/amd/display: clean up
>>> some inconsistent indentings"). These warnings are fatal for
>>> allmodconfig due to CONFIG_WERROR so ideally, I would like to see these
>>> patches cherry-picked to a branch targeting mainline to allow our builds
>>> to go back to green. However, since this series is not exactly trivial
>>> in size, I can understand not wanting to apply these to mainline during
>>> the -rc cycle. If they cannot be cherry-picked to mainline, I can add a
>>> patch raising the value of -Wframe-larger-than for these files that can
>>> be cherry-picked to 6.0/mainline then add a revert of that change as the
>>> last patch in the stack so everything goes back to normal for -next/6.1.
>>> I am open to other options though!
>>>
>>> I have built this series against clang 16.0.0 (ToT) and GCC 12.2.0 for
>>> x86_64. It has seen no runtime testing, as my only test system with AMD
>>> graphics is a Renoir one, which as far as I understand it uses DCN 2.1.
>>>
>>> Nathan Chancellor (5):
>>>     drm/amd/display: Reduce number of arguments of
>>>       dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
>>>     drm/amd/display: Reduce number of arguments of
>>>       dml32_CalculatePrefetchSchedule()
>>>     drm/amd/display: Reduce number of arguments of dml31's
>>>       CalculateWatermarksAndDRAMSpeedChangeSupport()
>>>     drm/amd/display: Reduce number of arguments of dml31's
>>>       CalculateFlipSchedule()
>>>     drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack
>>>       usage
>>>
>>>    .../dc/dml/dcn30/display_mode_vba_30.c        |   2 +-
>>>    .../dc/dml/dcn31/display_mode_vba_31.c        | 420 +++++-------------
>>>    .../dc/dml/dcn32/display_mode_vba_32.c        | 236 +++-------
>>>    .../dc/dml/dcn32/display_mode_vba_util_32.c   | 323 ++++++--------
>>>    .../dc/dml/dcn32/display_mode_vba_util_32.h   |  51 +--
>>>    5 files changed, 318 insertions(+), 714 deletions(-)
>>>
>>>
>>> base-commit: b3235e8635e1dd7ac1a27a73330e9880dfe05154
>>
>> Hi Nathan,
>>
>> First of all, thanks a lot for your patchset!
>>
>> Sorry for the delay; it took me more time than I expected to review and run
>> a couple of tests in this patchset (most of them were IGT). Anyway, I'm good
>> with this change; this series is:
>>
>> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>
>> And I applied it to amd-staging-drm-next.
>>
>> We will run some extra tests this week; if we find some issues, I'll debug
>> them.
>>
>> Also, thanks, Maíra, for checking this patch as well.
> 
> No worries on the delay, the series is not exactly the smallest one I
> have ever sent :) While the changes were mostly mechanical, I could have
> definitely messed something up and I appreciate you taking the time to
> review it and run it through some tests. Please let me know if I can be
> of further assistance on that front.
> 
> If you have any thoughts on the blurb I had in the cover letter around
> how to handle the warnings this series resolves with regards to
> mainline, I would love to hear them.

Actually, I think it will be valuable to add a kernel-doc about DML and 
create a Troubleshoot section where we can have some of the things you 
described in the cover letter as part of this doc. I'll work on that, 
and when I have a V1, I'll Cc you.

> 
> Cheers,
> Nathan

