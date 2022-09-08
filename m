Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D75B1AE9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 13:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC63E10EA98;
	Thu,  8 Sep 2022 11:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF2E10EA96;
 Thu,  8 Sep 2022 11:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTso2lYsCC8iTzRPDKEnkK64CCn3kmp9GKDnkmq6wwxpamWMi2Pu8tJ5Xy6ZV9FWzNl8+ufoe83E15oxYjTnJMv7Ye8rfi2RHES89YnwVh/AuE1k0nJAYaMmoy6Art0NRS3rhWEh7ZhlVzBK3sL3RAJFkBeUeV85YqEeB5iPHVHPnsYWWOIyMPV8mZqUGPJ9R7WW0lD5JWBvrA8gnNhNkzMX6Kg/FEbHYwi2jpgAeTAeeaZPbLIXYWFv+UMbpOU9r5Y+b5LdUbUL+y4/w38PKTpdvoWc/5v2yf8oKxiQ77LLwE5fqUIwu+CeArk6J5nVI1aQ92Wy7s4uZ1FhAXjr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAeh9E+dUhjG8xlzKu2bkThk1qRCo6Du5EXVk2jiJ8A=;
 b=hJiypWesfZ6Txckloc7oKqE9Zn6Wkk2srLQhoKMtZw87Y2hvkuyfwdj1rhV6b6QVXNj0SfgbBhRfrsiof6Cf/pD/pRyDiSzFFiWb9LN9zjla6nT74fJqKwvASi8AGqOEPJ8YGXlSnN4AL/0/FEZXkxn1fP3kDZ5ISCBt0usIqSl0hnhEp6FJWRNxAFrqD/5GCkYnyXcQWG5bzcczkYk+Pb3jNMLy6MNVCItzC0CmCOz2YTuBfV0r77/2VYzJMaKfCHfh0Cpr/TnmL37SY9FxSe7BDExl/s4MGe378OWElKP6TSHDOaC8oCgOIDmc91lvqg09Cv9DYqPQ6EZVyitBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAeh9E+dUhjG8xlzKu2bkThk1qRCo6Du5EXVk2jiJ8A=;
 b=i//u962E1OyPDhFIcQg1xB8ldBSuLmbLjJ130W2wVAwMG1LrF4zCUkCEEIu0hP/V0du9WJNF38RGA6q7etSoMD+HcD2906wvZbjhKx6H87n1DSdXld4LPHjKUdCWXg7fjdhczw64xrSdXkbHmk+Pua6BRVw88qDCxKfB4+HluGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA0PR12MB4429.namprd12.prod.outlook.com (2603:10b6:806:73::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 11:08:35 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6cf:60a9:3ed3:7be3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6cf:60a9:3ed3:7be3%7]) with mapi id 15.20.5612.019; Thu, 8 Sep 2022
 11:08:34 +0000
Message-ID: <c0036ff6-b667-4c70-6d2b-d9ecbb10f508@amd.com>
Date: Thu, 8 Sep 2022 16:38:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
 <b6ade0fe-367a-21f3-1942-a9d7eefcf1d3@amd.com>
 <b0b4f3a0-0df5-8d2a-c1a0-ad6d721e9cba@amd.com>
 <YxemSP4IrQQtmHps@phenom.ffwll.local>
 <6988c6c3-892f-799b-0114-c2c8462c7ace@amd.com>
 <YxjOOLGVbFvtrwrF@phenom.ffwll.local>
 <291548ba-3fbe-6a7d-eda1-ac12f1e799ff@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <291548ba-3fbe-6a7d-eda1-ac12f1e799ff@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::11) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA0PR12MB4429:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3bc6a0-5b9b-4bdf-b039-08da918a78d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: faQa6pa+OsQ9ayQqW/+KcR7AZQA+C9ti/ioQ2XX+rQ5aBesFIhPscT5NP2Te959zyY6X5L+a2mQYKELHLSHkfHgATHNCmroKzzMp3c+D1bASXEnGM4J2E4DUTPSXuRf2VxaAlGnCLkrsmbMbliK3TxlFzZnNPVpRHRyzbhrl+3mNzEmcsvapaV6ipUCB2m/MauOCCuyxDopz0RA2B4kKy8ZmJpUQ9jZqDs2qGdrwgxtVaW0mao1jGMjShrIcQEbtiOTKsA/fYL4CALuAtNHtmhNG45wbSJaprgXi15RNA3zDLESJK51szzb2JQOOn485IDe/jBlGVjc4HAUy7g6Rq8XMtVKkthdq25vFY24e3mAru0XNiav6kWPbvfzAkd10PEO28LoGkdfoIpwMqzd3UWiH6WG/aMTfIDzRPnPimHfbT/mp3AcJbaaZfp5I21T5t7ExbmKLuvE6e6lyoj1QFpB48zYVjuTm4xpNtAtuu2UBMkP1TzZan3kbgJXAMZRR44eMOKQWNkhC43LCyj7r00Zxh8nMgIvuFxmELKgaw6bgwrzYOPGJW5cLcq2Tu+xUhntAZNFrZUdD6HmaDOFVZFG/L1Kh5GW3cVM37sr8xsG/MMMhzcgst4rpGF7d9zrDoJoKM2uLVcjHO97bXa2uGOfn2zoqBKhRMoYZ6gPWV8wZtNKzv95MapLog3y9ukGU6ixxsH6s29gGwIGOm8r/yno0KqYd7ncY866f+V3RSM+fgU1AG78IQJr8xCDmThEIy7KW/vQIsyOCBYfM/eMfCtbpqNUdnCAaN66GgYSuAmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(6506007)(6666004)(6512007)(53546011)(26005)(6486002)(478600001)(41300700001)(66574015)(186003)(2616005)(2906002)(8936002)(5660300002)(110136005)(316002)(66946007)(66556008)(66476007)(8676002)(4326008)(38100700002)(36756003)(31696002)(31686004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW5JNjIyYjBPL0RpTm5MT09FYTFQbnlJQjJEWElQOC9OWFdmSngrWjkwd1Nj?=
 =?utf-8?B?TUpRazU5VXRyVllBNTJhMlFqTE1RNzZNSGRyTW11SGVqYUpYTmVBVE5MODFY?=
 =?utf-8?B?cXE3dG4zcUx1Vnpybzg2WDRUbjFIa1dsMEJMS3ExbUdUeHg2RUt4MWpaakdn?=
 =?utf-8?B?TFJaa1E3eURTY010WGF3eXBlUUluS0VWSHRycjVOeFVBUGhQeE9aZlVJSE1h?=
 =?utf-8?B?YXpHZFdhN2NVWXZzZjJhTEM1NU1hMmxTdTBkUGl2Z2RKaGF0QXc0MWpxL0Nx?=
 =?utf-8?B?UnRYN0dyQURxbFRYdmNIOU5sRkU3VlQyb1NVNURTTTkxUlpDVlpaenVsRXRs?=
 =?utf-8?B?Zjhya2pJVExFTFJaSGYwMG54Q29XU1cvSG9NeW53LzZEenhVeUp1NXUzc2Jv?=
 =?utf-8?B?aERHd0FtQk5TNkhtbC9BZXJJSjQvVlp1K0RBTGs0WHZ5ZmE0WngwdEZLNHF2?=
 =?utf-8?B?RlZqRzh5TmZFRzR3SXhiOUtjVFRpd0NTUzljQjM4MDNnSkNrcmZqZlc5ckpT?=
 =?utf-8?B?TnJWWWNIK3M5clVaemJ6bUNFZ3JqRDN2M3lLbGRvVURjQmpoVGIxb2JIaTJa?=
 =?utf-8?B?Nlp0ajdSQnV1Wnc1YjVGUWRNcGRCRHhYaUJyeUpsMHRwUjY5SFZYNi9JZCtm?=
 =?utf-8?B?K2hCZkZXK3FyZkRpT0IwRTlwTkNXVlg0V1ZLUStWamk4cmM4SDNKanpoWDl6?=
 =?utf-8?B?SnJmdWlLa3pPaUJFSjhjM0syWlJyS0FQRUViaC85a3U4cTNiMWRnODB1NE10?=
 =?utf-8?B?bDdnbTJJY1Azb1Q2ZFFpRkJyaEdpVEpMcnBoTTJEZmg2QmYySC91SUkycTZ1?=
 =?utf-8?B?WXQ5NUZ6Y0wweWNyQmdtdWdhN1plbi8yL3BnbWVWQ3o0NXdJMUh1dWpiNjdH?=
 =?utf-8?B?QVoxSEcrUXV1d053NnpzYlVId0k1Z3JGTEpkNDhlRjFHeUVibnduNXc0SkJ5?=
 =?utf-8?B?NFoxUzRFTnNyK3lnY2lTemRqT2dNM3VCK0JHODFhTFNiV0MzdldZcDNZVnhy?=
 =?utf-8?B?ZDkvVU9WWGkvQzgrZWFHN0daRXJHNW5zSHAva2dhdHRRaS90M2lYREdMWjln?=
 =?utf-8?B?RHY0ZkM1dEVMV1dxMnJvMTZWaDlwa2g1ZUtEbkdNQmQ1Tkk2ZWRKM0tONzdk?=
 =?utf-8?B?TEg5MDRDeXJaMmdmRG0zUWRWeDA0dWo3L1NGRkk3S1c4WlV2QWhkbHpxeDR0?=
 =?utf-8?B?djd0c0R4ajhuTE5wSlVOV05pMjdkR0dCS3J0VWhDL2lkMUdNSFJUQkJaOVlq?=
 =?utf-8?B?a3U5QjZQU0xXMmlLV3BocExqdVRJbVVETEFhSjJ0VUJROThka3liZC9rd3JU?=
 =?utf-8?B?aE1PODJmcDBiSTVncmtOR0RXSjdZanV1c3JWVWY3M0lmOThFRHY5bzZUZFdC?=
 =?utf-8?B?ZVNZa1QxSWFhdmk0ekg3aDlray9BMTk5bWtXb2hUOE5saTlkZyttWTZKa2VU?=
 =?utf-8?B?U0p1R2NpSEMyMmdtMXltN2ExSHBiOHBYZSs5M05YeTBIcUF4blhYV0d0Rzgz?=
 =?utf-8?B?cExjQ0RtbDcrUTI4M0NSdnhzOVd5YjlabDlMZ0RIeHlIOVdZZjM0RUJ2dHpQ?=
 =?utf-8?B?bC8zVW1SVVpWeHQ2VEhiQWJYYjNqQUNSRVZ6RWJIMkZHYzhxZW1jckZ0QzhL?=
 =?utf-8?B?cElMd0VXUmZzYWxGVEFlWVo3ekl4dHM2dDd3OXVvV3VDaTFQeHQ4aHZvek0v?=
 =?utf-8?B?bm5pbWJKNi84eXkvdzNhTHFNVTFoVXg5NVovS2JuZmMrZmlCTUs2SFhNeWQy?=
 =?utf-8?B?U3ZRczdGTXpwRjhxaFlGT0Vta001K3lzdlBwcTZ1a0lTRWtDWGhYYnFsdTZw?=
 =?utf-8?B?amJ2VWZoMTBmZStiT0hmbGE3Z2t6OGpiOE5ZTnpwMFI5Vk05TVdYdjc2bHRH?=
 =?utf-8?B?NS83SWVFbng3Ynk1TXFiUXNKOFVKWXVEUytiOWliT0F6Uyt2OXhTbEV4OG5z?=
 =?utf-8?B?M3BNdkZJREdEZENWVkRySzg4N0RKdGVxZ0ZPNGxQUEtTWVBEK0Y1RmVkci93?=
 =?utf-8?B?Rlh6MGxsblJlci9ac1p0R1FhVlI1WjdJRlVxR3Uvdmwvc09zVHcvVnBIQ2Rm?=
 =?utf-8?B?Y0hWMFRJQ2ZCQlB0U0hvVklmU0c2cnVMdlBlNnRSWDU3dmt3MlVucEFwaVB0?=
 =?utf-8?Q?R3KliTzR7SME+syG13rW+cu/D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3bc6a0-5b9b-4bdf-b039-08da918a78d5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 11:08:34.8724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRnjklm22WcjZVqCwABG7tskL8Q2scfOtPvqfKinqM1MyXCeqSFwNSPkbpbq4hQFuYVJ94QArG3/OQr07bcJWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4429
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
Cc: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/8/2022 11:34 AM, Christian König wrote:
> Am 07.09.22 um 19:00 schrieb Daniel Vetter:
>> [SNIP]
>>>> I'm a bit confused why the bloat here ...
>>> Drivers do have specialized implementations of the backend, e.g. 
>>> VMWGFX have
>>> his handle backend, amdgpu the VRAM backend with special placements, 
>>> i915 is
>>> completely special as well.
>>>
>>> Here we only move the decision if resources intersect or are 
>>> compatible into
>>> those specialized backends. Previously we had all this in a centralized
>>> callback for all backends of a driver.
>>>
>>> See the switch in amdgpu_ttm_bo_eviction_valuable() for an example. 
>>> Final
>>> goal is to move all this stuff into the specialized backends and 
>>> remove this
>>> callback.
>>>
>>> The only driver where I couldn't figure out why we have duplicated 
>>> all this
>>> from the standard implementation is Nouveau.
>> Yeah I didn't read this too carefully, apologies.
>>
>>>> Also please document new callbacks precisely with inline kerneldoc. 
>>>> I know
>>>> ttm docs aren't great yet, but they don't get better if we don't start
>>>> somewhere. I think the in-depth comments for modeset vfuncs (e.g. in
>>>> drm_modeset_helper_vtables.h) are a good standard here.
>>> I thought we already did that. Please be a bit more specific.
>> Yeah rushed this too, but the kerneldoc isn't too great yet. It's
>> definitely not formatted correctly (you can't do a full function
>> definition in a struct unfortunately, see the examples I linked). And it
>> would be good to specificy what the default implementation is, that 
>> there
>> is one (i.e. the hook is optional) and when exactly a driver would 
>> want to
>> overwrite this. Atm it's a one-liner that explains exactly as much as 
>> you
>> can guess from the function interface anyway, that's not super userful.
>> -Daniel
>
> Arun can you take care of improving this?

Hi Christian,
Yes, I will check on this.

Thanks,
Arun
>
> Thanks,
> Christian.
>
>>
>>
>>
>>> Thanks,
>>> Christian.
>>>
>>>> -Daniel
>>>>
>>>>> Thanks,
>>>>> Arun
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>

