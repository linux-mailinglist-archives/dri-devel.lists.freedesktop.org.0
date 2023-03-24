Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5E6C8522
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 19:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ECF10E185;
	Fri, 24 Mar 2023 18:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC1F10E185;
 Fri, 24 Mar 2023 18:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig4LCCfmvjd7JIm3xOS4q7L7YTQ4Aw+rpPypOZProDLfnjbI0l4mo4i8tkQSb7+ei38vj9XEdkk69vE0bsFquxtIe4ucACEtlU7mMGG2+3ooKiCrdE0AS9uYzAApuT8H/adKe03ZlY1NCRMtmhZYwUGmEp/RI8GLt3LSdCScNKppADRcaVuKKvfKj5ak/99ZQsf1FqJrvyFCVBbH4xoA7vfZ3d0ICuzB5husSnO3jJkjkJ1jx+U5PX6i1B3SIfTinjI/BHJyQpX3d22pVbHQkTjpYbBpNEp+i6XxGoGH7AjYOCpXG1LFjjv0PudeghGTN4MCmixMIYIRNT3lcsonOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCDyfoGs0DbQ/6XHQNcIN2rDqxqn+A5/LrTePMqCyKc=;
 b=RHBvJ2THcmsm/q571+pG3TZMDTbskFHtCvWBlFL9/r7PWDvR+6fMfZsSnd+/DtTtLrGjHYgDG11ZalnEvPhaYdwHqVWjkoAKS0M7vuB/sWl3ymZZrVMFQFEhQVzVBZP/0qxUHYkl5zDbmPDeAsohAKYQVVeyYx6orcqM2JXt4m9KZX/saMKG4dLmrdM1xuj2hBdLi1Olao/oTXx9aMoNlh+kdazJvVJYzkJXv+pNWnll5k9rueBeuNDjYemrjLCA0dUDFWE8+oxHsTsqGIFtXcqgKtza4/L4nT7Vaapei37KHntt+lB+74aXMTh5Ca4C9LrXPl1QG3/PEMBCm8LkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCDyfoGs0DbQ/6XHQNcIN2rDqxqn+A5/LrTePMqCyKc=;
 b=nBIdR0/azkvWjwsLsC4nkmRFlK8WQBAfjcKTkMip2302YT57DK9axEOrg2dn7n2QWoLlO59LstVwcXOegQgFBAoHVRwn3ixAj44QjVV9UpInk/5piHK88yDBXY2rFwko5mfvZwS0sWUh8BB8/K/KonlnRkZYH2nwspMtZsrka+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH7PR12MB7257.namprd12.prod.outlook.com (2603:10b6:510:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.39; Fri, 24 Mar
 2023 18:32:40 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 18:32:40 +0000
Message-ID: <2aeaccd0-d105-fc97-c343-8be16a93626b@amd.com>
Date: Fri, 24 Mar 2023 14:33:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH resent] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <7a523efc-a82b-a1a1-e846-6047226cc968@web.de>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <7a523efc-a82b-a1a1-e846-6047226cc968@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH7PR12MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a11f8b-306b-465e-8b6f-08db2c9625e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJbawNU36Enmv68bZU8BMopPxs4zrIoZYcGszIyJAXFjCUvI9k9Sz6eEV2a5gqtDDjVApTX+kx/Rpu4YPYTJU17caWZQ0p/utssHcnTMFLuzsfEORJ/VdSFohQzrECGly2vVUSXCeXXb4YEKwCrWQOtE1/BdVDh9nK1uqdK6X3qB0mXlg7UEQUec0ZqNvz6vpJJTIlVOGzAKAN9DcYflRgs09IuSheeL2SUcmsFDw+y5HTwTJowrYrlDAQpefUjMHvB7U/7fbMGxUTeGpegsnzfUhxN2ZuJ5NsL12Auol0nryOW853sMtYWax45SzdU3s/IDU9zf9I8x1V3f1tnPlRLQR2S65B+DUITTUEXDSLgJmuSNuvr4+zRrflKzlE5dETnomge2lRVF+91w8Ca6knK1GIVFu57fpt2Er97CV5Q4gjWVCz+h4GIrN1FHLVjXG7a2hcDyQxQbVPMNR/7lADj3bO8FCGlD9toCan3qMm4abt4HKmMwW5Y9XGoYY/19JQUHQXhL9rBsGSd6U33vuQfdWkh6Jo78kZrH4L6ctZJ3zo+EBMrvF8HdbH37VKKN6xDvNPvV6qD4GD7jCEtL8EZVMVDriPA+Gn7ljc1MuhPCX7mVk4Zqc3EGde40/YGckfvsQztC+U39HI+XIWzidc0zP8oTCkBW9VW2euH9ZutECw2z36s/zG3TCZUJ1TrH52ffxQjhc2ZWTDdZIGXcXCZOFQbueuuMZtffdNYXvlWwY2T69kBCq5wWA152ex6j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(66946007)(66556008)(110136005)(66476007)(86362001)(8676002)(36756003)(2906002)(44832011)(316002)(31696002)(478600001)(921005)(6636002)(6486002)(53546011)(26005)(186003)(6666004)(6512007)(38100700002)(31686004)(8936002)(4744005)(41300700001)(4326008)(5660300002)(6506007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGpYZm5wYlpiaVFWN0JVZzdyRkZKc1BwN1RqR0FOdU5uRkhDODl0MnczUThp?=
 =?utf-8?B?eUhBZUd4VENiYU1OczBQd21vaUVRWVVlMnE5OHQzVWtBc2pwSEtKcEl5MWFX?=
 =?utf-8?B?Mmo1Wnd5L3loRHZKWU9nVUQxLzlsWGRNclNIOVh4ZjAzRDZwd3Q2MW54U3Nw?=
 =?utf-8?B?dG9ET2dIQzV6WWRna0J0cVZ1dVBFdnRLOU04L1NGMEpKRXRVU3lFOGdlakFw?=
 =?utf-8?B?Rm9DY2pGNGg3MXFXdnViWDdjMTQrVmpqM2N1QVhLYllrVmRieVJva1JXdFoy?=
 =?utf-8?B?S0g0eVJFcFlTL0pObVp2UjZlSWVhN3gveHE1Q0ZnUFpoQzdlVDluWkM3Uzh4?=
 =?utf-8?B?a1BBRWZJZVJGWUE1b2tPTTFuOTd5TVZ6NVNpcmFyWHZIbUJ6cUsyZXJjTVNn?=
 =?utf-8?B?aXZOUjJ6RHJqZGV4QkRzYkZ0aEs0cmNIN29TeFRjdXk0TVFQUmZaOUJQaVFK?=
 =?utf-8?B?NUlSM0I3dStIUUxSMzVvZ3lHcDhqMjhmelg4VFhwRGY4YTBLdm5yY1J6Mkw2?=
 =?utf-8?B?aU1oY1dyWEJDc2NJMkxoWTdhdWI0SWJEUi93NWczbzlsVlZwRHFYb1VieVhh?=
 =?utf-8?B?YXNmU0M2eXNrU2VNSEVGTWJzSDBkb2UrWDNnMjdqalVzQTFMdUxWeC94S3dy?=
 =?utf-8?B?RGJhWHZ5QVNNN05ONFoxSFNuMUthZ0c0N3JXNk5idElJbEQ2NzFrSUM5bzFs?=
 =?utf-8?B?K2JGOStmM3JBT3FtTDczRURmTFk5RkVqN1RWTmFlVWwwQms2K1J3blgvQmgx?=
 =?utf-8?B?WG81V21QVk1YQzhMVFcxR21tV1hlM2haeTNiQ3VDTzVzbTRFYjNIMUJCbjd1?=
 =?utf-8?B?SkVObTVoaVdlNmxWeEZocGovTzhvUkdXajV0WXhLM3FjbWh6cGVEeHZCR3Bu?=
 =?utf-8?B?clpQWUlCKzFob2hCUEVKcnFkZGpOU2xjbFN0UEszSzBhZkpxRlU2dlYyY2hX?=
 =?utf-8?B?Z0hFU05sRjJHY0xpTFhIMXdIQ2FYbW52QnN2Y1VFMnFsUGI1ZkU3QjlMNGxY?=
 =?utf-8?B?Q2lSSXFqRVdUNmFPaVZWakt0ME9PWjlwbFZFQTNoazM2ZFJtM1BST29sUVpN?=
 =?utf-8?B?WThPeGk2dnU1bG5YeTU2aU02OGpjbEVGVDNZb0xFWTQ3Mi9HN1J0SUdXbEZz?=
 =?utf-8?B?SGVDU1J2enl6dnoyMGdLallsZDdLSGdycTh4ak45R243ZnB2dVJqa2I0ZGx0?=
 =?utf-8?B?ZXMyMTJ2eFd5MXpEd0wydGpLcStiampXU1FTRjMxZUNLdm1CWjJsL2VjL01J?=
 =?utf-8?B?RExFNnBpUHVnZy9lTXowSXU0Y3BUbkdOMlAyS0tZSkRKK05tU1ZoVnI0ZitJ?=
 =?utf-8?B?TW96dWRJZjNNdDVKR0s0YWxESnZscGFvN01HYk1RbGxicnlkZGwzVCtHTDh0?=
 =?utf-8?B?RTNyL0gxbkY5Z1B0NzM1UXhqT3pscXU0NHFiNG5zK3VuYy9IdTZJUUZvcXU4?=
 =?utf-8?B?T0JpSW5TZmwwelcrVS91Unc0Y0tuL0ZYcHNBNUFnZDhkR0ZJYUlHY3AvdXlQ?=
 =?utf-8?B?UXBZU1Z5STduSFp5R2JmWG5SYTNCZ0F5eFBrWDdKMHRTaktTTUZudVRscEd2?=
 =?utf-8?B?NXFxdS9FRjZHaHBFRDk3Yk14bVdNM0dCRUh6Z29OTjJaUlFkZC9iUkV2TXNq?=
 =?utf-8?B?ZmE2cUNiV0lOT29IYzlGSjlyL2tYK1JPTUFNM1doV1ZteW12NmQzSmFyaEhp?=
 =?utf-8?B?WTV5V25qSkJDeUpuWUVDSnhJeGl1M1hzQjJXVFlreHk0QlVHWDA2b3RpMHV3?=
 =?utf-8?B?SURpVEs5K2ZqNHM5bXpzZDdORUl2NnBNTWJlZC9TcWFpcXNEdTZKellPRFcr?=
 =?utf-8?B?dE9ySS9sMVc2RXBtbmVXOUl3ZExnWFltY0tIa3JrUzdORVhrRjhJQ0pCQVVa?=
 =?utf-8?B?b3JzV3BTbUdVZi9rZGprYk5PUHprdTh3a3BXZFhhNjFZSEpBWnpwY2NtVkwr?=
 =?utf-8?B?R20ybWhVYVpwVkdORkhSbU9tbmwvckFvbkIwQkxNUjQ3UktRWTRiTXdyYTQ3?=
 =?utf-8?B?dXFncEpUUzdaTFlPby94b0Flby9ZcG9udzlHbXBWTU9KdlpuV3BuMU4welJk?=
 =?utf-8?B?cXptMzJaa1lqVHU3WnpYSWZOamxGdDQ5L1lBd3M3VnBXUDMyVkN1Wm1ybk9m?=
 =?utf-8?Q?5mIX+HClJv1GDHdW+3z/kQneM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a11f8b-306b-465e-8b6f-08db2c9625e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:32:39.7786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgN0W8ydgmko0dbNkeNeKxcxGwoPpRJmTSSgy5pm6y0mm+7xj7ADaufPhEoiocGNKyYjKhwGU/6565UxNDfOfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7257
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/24/23 14:19, Markus Elfring wrote:
> May longer identifiers (or even the complete SHA-1 ID) occasionally also
> be tolerated for the tag “Fixes”?
> 
> How do you think about the proposed change possibilities?

Well, the hash length is restricted by convention (see
./scripts/checkpatch.pl in the kernel tree), so to propose that change
it would have done more broadly than just for amd-gfx.

> 
> Regards,
> Markus

-- 
Hamza

