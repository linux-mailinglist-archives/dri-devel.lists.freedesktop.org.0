Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA7C2D1B44
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 21:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8939F6E8B5;
	Mon,  7 Dec 2020 20:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD536E8B2;
 Mon,  7 Dec 2020 20:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GoztSgcPf3QkkvIqraZgZ9cydD+6AcCTPLq+OPM2iO4JCImz10VgCM5AqWJEBGj7UFsPMQ9Ho2Q3CkWv91tqOmy7UHK7+0v1m/9EJ3oJitMtr9gf/6wOgewevMIZ9fjlPW5OPJNXx4/QcdKBXWLLsbwu3ggOPM+FGq6pmu6sFYOgrkyyQUiFzvmES+ynXKICOe/q+8SbBYyhOL3WCtTh33GR0MmWkYntTEaHL9n5AP3/Ilf3ix0PyZomsQXKsvw6+rdCAfl4AA5PIO9hkVQxGBF7/brlUKikY1hFIHuZEhbi2uiXUeuctLs6rSJsec0aGvJrdYkNyjBMwO/FYeliMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjx/MIoaiG8Yt+cof0s3jmnXd2XcKaDshZxVg5+irn0=;
 b=Qd3qt5pjQI0V3sQz6Xw9KQu7825g/Y74GbdALBsDXHiav+GKEDY6s7EoPrI/wJEL+/HNlosIEjN1L6RviIneh8qiwfpYVJMEjra0Jfr53SY4CQpCOkmX2S0AmcKuZI1CdhdLu791neZ9bBa8SSC70eGCli94H/XrT0+TDrrfgYl84hSL7Hgk+E5aeLpRLK/+dM+rKwVyySJbnScoEoUhWKHS3xDK0hBwPmu7d3Q3gOKdq8w6MSTc58Qgej949Vk34H/SJvIj2G9jR4u1tPtxPFFD9BUUeh5cLXmTF61piCp50fJ8chOti0wNdCdiiG1UPLUbMqWXIkJojWCkuSoyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjx/MIoaiG8Yt+cof0s3jmnXd2XcKaDshZxVg5+irn0=;
 b=Sq0oit98QJ0cyOCvwxc03orkpFMBDWWmPKQsWWbWcI7JnP5myB1CSIdUbJCeV1STYawSzEwslEGfSNRwN1/1xq6z1su1utyCfwDUe09F0Z8te+IN9zyE+rYTjzirxvbPEE9YzUMHM5Vmf42AIiZnMwSdV+AFf12EuRIEMO0dvYc=
Authentication-Results: raptorengineering.com; dkim=none (message not signed)
 header.d=none; raptorengineering.com;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4690.namprd12.prod.outlook.com (2603:10b6:208:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 20:50:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3632.021; Mon, 7 Dec 2020
 20:50:48 +0000
Subject: Re: [PATCH] drm/amdgpu: make DRM_AMD_DC x86-only again
To: Alex Deucher <alexdeucher@gmail.com>, Arnd Bergmann <arnd@kernel.org>
References: <20201204081349.1182302-1-arnd@kernel.org>
 <CADnq5_OmAVZGuz=xHRyST4hE4w1g10wNBQ6iMgfpQD16-9QSiQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b9d7e33c-4dcd-0075-d0ca-d22b2488c354@amd.com>
Date: Mon, 7 Dec 2020 21:50:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADnq5_OmAVZGuz=xHRyST4hE4w1g10wNBQ6iMgfpQD16-9QSiQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0064.eurprd07.prod.outlook.com
 (2603:10a6:207:4::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0064.eurprd07.prod.outlook.com (2603:10a6:207:4::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.8 via Frontend Transport; Mon, 7 Dec 2020 20:50:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 810267c6-ce82-48f1-0c3c-08d89af1c69f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4690886153E83497B5A1685983CE0@BL0PR12MB4690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RXb95/eKC6EPkszjv3pTXmb4+tBk7IQ2bDClx86DFpANPj/goU2znlIzZRAp1TSO/RLxKC0/PTf20Ij7NZuwbA4nGsPI+CEqH4etTpV3zTwkUxyJHCr6h2/TxZQuFOnxjsALSFT8HA2DkzB02W5u8wFLs/DIeIIJeGQY36CgqSlr2JSBzcpI/jo22X2jEwvkVRkIy2LuYZPsI0CYt95rt+5bn4MnfOWsJlHDppg3MmoynxqLrkl0mh26yUHcPTmCIbl8bh6B2YN0Zyt05TaFeE8x0PuHHxcfs2O7m0pvgwmYhbKbPcAAYEUgd6Nxnbz/JVe7mQJyOFvMQ7uJyJis2DrEKdFke+gKympr0hPzQ4mSB/19KwIT7CU8R1v4SB/LH8UP7Rg4DTrq0q4UPgZmNqjTECSYVGVp3dRHk238uLzUpd9+8kWiu9y3k8+jouyKL/UcLm6W1rspWNLuopqo/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(2906002)(31686004)(478600001)(110136005)(316002)(16526019)(36756003)(52116002)(54906003)(7416002)(8936002)(2616005)(4326008)(186003)(53546011)(5660300002)(6486002)(8676002)(86362001)(83380400001)(45080400002)(31696002)(66476007)(6666004)(66946007)(66556008)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1pJeEt3cnVPdEV2TFpRTXFpc2NOL0tYN2t3RVlVUkNRSWRpeHNVNFdBSDds?=
 =?utf-8?B?RHdqZmFhZUF1eERrdHJEWFhXMWNqZU02Y25qNjFsOENBN1NiZEw5K0s0S08r?=
 =?utf-8?B?alRFQjBEZFlJL25GSFZocngwZkwzNy9McDFnWVFrajY5V0pRemtwZE9ISWhM?=
 =?utf-8?B?WXBnK1huQlgyYjdnT0hHUDhaWXd0ZEFMOTYvMUhpWkVZanFzSkMxbkhWM1Bh?=
 =?utf-8?B?aitMUWtQNSs0R2lvS1VkQWpiUHA1NXByRkMvRUpyMkYyTnpEZ3pCTUpkVndo?=
 =?utf-8?B?NDZydzdvcVRJaGsyMTB1OHJic1VhanRTdkx3RWxFMU1CRXNjVUR2MnZ6OGdW?=
 =?utf-8?B?a1o3QXRsMmN2ZlZTODBRNW1JTzQ4dmxkQmcwVlgyZDVGREZIZWtObkRuZTJj?=
 =?utf-8?B?YVlwZlAxalhYUWVWNEkvQ1FMLzJvSElQYVZ6RkU0YWFRL1Y0disxQ2ZOOFZL?=
 =?utf-8?B?VTl2T2pKRGtTaGJEdHR6L3JHZFRacW45amR2UDFDVmtSZEp0d3hGTENNVjZM?=
 =?utf-8?B?Wkh3dEt0a1pGakl4WFd0d3lsMjZoSHhsTkNiMEJHSjJXbDRJaGdubjc0NUhB?=
 =?utf-8?B?RnEvQUliM1FzZ3EzVjNKVmYvWWJjTnJWR3ZPQXpOTWVZaFVrTktlWC9KSDV6?=
 =?utf-8?B?TzVETWNHTjZyanRKSnY2ZWlPTGI1UXZhdGUwOFQvSWRvbVM2RWZuKzk5NUNP?=
 =?utf-8?B?ZnlVaExVT21pUG15c21XT1hwWURkaFFYRUNxZ3BIZFFPMmZqWkpPOThralYv?=
 =?utf-8?B?aERzU2JIazBRWU9aZU85bHRLYjdpN3dRWVNlSW9IVThtelZlMk94SllJNmx0?=
 =?utf-8?B?cWdWMGo1c0RxeGc0R2d5Y3cyYi9wYk5IWmVFNTljek5xb1JHOVZGcyswa0Rz?=
 =?utf-8?B?MXExazUwL0IyV1NqVllPQWVxVTlOcVYzcmptdWcxUGl0YUthdGxveWNBRmhq?=
 =?utf-8?B?STlRdklHbU5mTXQwcEZZODUvS2dnWUsxM3dQdHd5WjlHS2cxWTBEcElpNE9a?=
 =?utf-8?B?UGpLbUtxQ2gwR3ZlWDhWV25mWE90bkZCT3VJbjFGVklmUlRQUGhYQVdVbXVR?=
 =?utf-8?B?R3U3OW5pMXdnS0xrZWt6byt6MHBlQkNxSUZVWjRid3I5VGVVRExJSjlZZ09x?=
 =?utf-8?B?dE1wWEg0VnVkK1lCaU5jVzRoZDVITVVVTnNXZFdNWUZ0YUsxbEZhSkhYVjhx?=
 =?utf-8?B?OWtrVmlOc0ZVWkorSjB0L3RLQ3lJbWhMeno0dHZ0STA3QVNWb1BaTHpPL3RK?=
 =?utf-8?B?bld5dERoWDdVYUdJSWNDQzg4TWdzRWtacjlTMjlYbE9yamNIZ3A4eE51RFRY?=
 =?utf-8?B?WkFudnF1VXN2Skgxb3pRYnJRN0hTWURGdU93Tk9rNmJGcGFRc0lDb0hsTEhm?=
 =?utf-8?B?Z1RPb2pzcHkyclNFaCtDWVpGbFplU1FXYUg4VlpONVhkc1ZZdjFhWnpudEx0?=
 =?utf-8?Q?jLVN/1Zt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 20:50:48.1743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 810267c6-ce82-48f1-0c3c-08d89af1c69f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWHZuWwC+2GN7WTRj3aHnOUAziHwcwk3SRgOWbGP/TimkZT9ck2HgxJIXBv+tp5u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4690
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Kolesa <daniel@octaforge.org>, Alex Deucher <alexander.deucher@amd.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.12.20 um 21:47 schrieb Alex Deucher:
> On Fri, Dec 4, 2020 at 3:13 AM Arnd Bergmann <arnd@kernel.org> wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> As the DRM_AMD_DC_DCN3_0 code was x86-only and fails to build on
>> arm64, merging it into DRM_AMD_DC means that the top-level symbol
>> is now x86-only as well.
>>
>> Compilation fails on arm64 with clang-12 with
>>
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3641:6: error: stack frame size of 2416 bytes in function 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than=]
>> void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>
>> I tried to see if the stack usage can be reduced, but this is code
>> that is described as "This file is gcc-parsable HW gospel, coming
>> straight from HW engineers." and is written in a way that is inherently
>> nonportable and not meant to be understood by humans.
>>
>> There are probably no non-x86 users of this code, so simplify
>> the dependency list accordingly.
> + Daniel, Timothy
>
> Others contributed code to enable this on PPC64 and ARM64.
> Unfortunately, we don't have these platforms to test with within AMD.
> Does PPC64 have the same stack limitations as ARM64?  Harry, Leo, can
> you take a look at fixing the stack usage?

This reminds me that I wanted to reply on this.

2416 is even to much on x86 if you add -Werror :)

So this needs to be fixed anyway.

Christian.

>
> Thanks,
>
> Alex
>
>> Fixes: 20f2ffe50472 ("drm/amdgpu: fold CONFIG_DRM_AMD_DC_DCN3* into CONFIG_DRM_AMD_DC_DCN (v3)")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/gpu/drm/amd/display/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
>> index 797b5d4b43e5..54aa50d4deba 100644
>> --- a/drivers/gpu/drm/amd/display/Kconfig
>> +++ b/drivers/gpu/drm/amd/display/Kconfig
>> @@ -6,7 +6,7 @@ config DRM_AMD_DC
>>          bool "AMD DC - Enable new display engine"
>>          default y
>>          select SND_HDA_COMPONENT if SND_HDA_CORE
>> -       select DRM_AMD_DC_DCN if (X86 || PPC64 || (ARM64 && KERNEL_MODE_NEON)) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
>> +       select DRM_AMD_DC_DCN if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
>>          help
>>            Choose this option if you want to use the new display engine
>>            support for AMDGPU. This adds required support for Vega and
>> --
>> 2.27.0
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cba72f82a98a4443b0dd108d89af15c1e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C1%7C637429708726258711%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=EU1LuB3uxSCrtAw%2BgwD%2FFWsYpZMp1FbffZvkerQ7WVs%3D&amp;reserved=0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
