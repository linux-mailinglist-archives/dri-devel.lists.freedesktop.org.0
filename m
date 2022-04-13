Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB094FF1C0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED09610FC90;
	Wed, 13 Apr 2022 08:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B7610FC90;
 Wed, 13 Apr 2022 08:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHHp4PvgdfdUKeuZo6ty3HpZ6aqtc/ccQYLBWTjmhsdbFiya+1/S1eaUKjOdzUcRt2ZB+LscTWhGOo/SWu15VRe4C9MYKtjNMndCnXKNDjKt/CR5O4q9UIwz8T0K7Dv2mWL66Bzu2AJvbjL3HQGXp5jn4ZC3tl4TmaUYMV8VvH92RcC5W7bFcRWYtwf5hVsONxCcBgngpAYpUXOSw9cvk/4oMen0dK2t77c7nacCJxrOlsmTWnGCzan2/rWf8KgWNitvP9V1aQGqy4TArCC79UZ0GRFSLhtI0juhzE1CX5qsGPBBXys7hhoFyYm4jbbXCJWAJxL2aIe6rP20CXgaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzOjtAX8RkT1f/OMndfoeoUNoRMkLaZXAAR3wFWZoYM=;
 b=igzCWfgqKV0dSLP5yHGkRwHFYeSx2dOZRcZ46e8Bw14fo1vkRo8JhZLVyltpR2lACYXiWmk965kfycw/vCo2NatYNpuJaEFCANAF65hHYjG79xao5VXEP9/YHd0ReJE1VZkySq5USddnAHgkhCkWjM7/4dZVBcLg0eReZCFFfxDs8DHb+Bu4WmmCGEYEflxgoT7oyTckDvs5gQULPfcgxgk1EdcCDIkcOZjeeNYcIwzsjRNldzhHoeXDlnkV7WrfqK+FJ/CyZLd7ZC0cHx1raqcW2SOH5hNRDS5dSGBefTGW/HDpL3z28x7dNDR46PrTK0VYBUAnytNzqBAcyBqqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzOjtAX8RkT1f/OMndfoeoUNoRMkLaZXAAR3wFWZoYM=;
 b=agnQIwnlyBwehUJyNz5CUrakNe5Y3DwiH0fXGs2JFlu/1Hsd0Acj0/O0ipXTPmVdDKsIkcX4O5sLbQ6hP2Jo4FRLdi23jTWNwKfOlIe72/IvoxB/dS1YBZLXD6rJKnqX7pN/pMUTm8jUb1ZuKq/HEW4X1VagAYo+WToZg9qnG8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN1PR12MB2382.namprd12.prod.outlook.com (2603:10b6:802:2e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Wed, 13 Apr
 2022 08:24:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 08:24:43 +0000
Message-ID: <b6eee576-b950-c1a9-74d1-fe91468faba4@amd.com>
Date: Wed, 13 Apr 2022 10:24:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220406155030.0dacf051@canb.auug.org.au>
 <20220413100448.6f5f4de7@canb.auug.org.au>
 <YlaIgxknwmPbsg1h@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YlaIgxknwmPbsg1h@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0035.eurprd04.prod.outlook.com
 (2603:10a6:206:1::48) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cd17b0c-0737-45b0-4147-08da1d270f93
X-MS-TrafficTypeDiagnostic: SN1PR12MB2382:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2382B50F2A2583DCC318179383EC9@SN1PR12MB2382.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xelbPXWCmiSAEzcP5FehVg5YTcnpXaUY233+fHS/JFkOQ7V1NbxyT7n8R3lZz26Fial1f3f89N4F6NJEvYHHIyhFTHv6Kz71LhVckoyR3azlEKQ/STxHc0fNj0tJaHaQBMj79hcMBtRh6B8IeQFKaUWtJXFX3sculf559GUiF3qjX+gLIJunv2BgIl4poPG+ZZjiTU3iZLCwpKAip1gwykS0LviurACJxTzSpxPwqEiih8n+dN96T2RXmYxerSr/2BDx5a816/Fx7LkFuAdkStC0job+DANjAYryiY61SjlThmbSGqvK1gVhJwBS7gBeQ0MUParHqa0CdiOUw5RTCXQcAMkNHCgclI9rdO0Xzh4rUNj2nWTXTKlDvDpUiV01IYxO/9Wdf8Ky0iXKCg2DxeVGEO8X21mz8WDSYsbksY0GTUqfV0LBMx7KGReSbEpx0fKJnC0AdRoOTqg/fYYBcR6Miof0947X58n9xxpuXykWUwOxgUILB+uiCsoMYTSMY1FER1VrmXLDTYQ2HEmOlGPEpPoWleoi+Fn04BCQPC4RoQbCNG2HcV/cfItjSxuvE3iSGGttjG5f6lxOzkGvyKTHXaH+R89k2NqPUtijLqUJjSUZKp0p7RU3ZGvCRSPw51PK2MU5Pl+rOg7yF8jFMSPMaoSeP9O0IYH95gdqfZNeK5RitOyF7FOX66/AxB+OG9cjXDjT0Tm56sMrTHZt80fjCrshSDFW6v0up4v1ODk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(5660300002)(31686004)(83380400001)(26005)(2906002)(4744005)(2616005)(186003)(66556008)(86362001)(66476007)(8676002)(6486002)(31696002)(6666004)(8936002)(110136005)(316002)(6512007)(6506007)(508600001)(38100700002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXBRZFVVeVl6R2czN2pnN01zNGZBTzhTL3MrOFFPYU5Rc3BQUkp2NVFKajZo?=
 =?utf-8?B?RjlhcEVZNjNSRjI3T3I4NVk1eldVRTBJYlNOV24zbU9HTU1UeFpadUdFd3Ew?=
 =?utf-8?B?eGpsdVNFQWk5N1lCLzY2ZWlkNllLOGNld1BCT29iRUNDZ1RtTzNja1F1dmJ2?=
 =?utf-8?B?QWZqRnlFNkZJaDRaOVJ3c3hhR1czbGtxb2I2VDAxSGQwU3VUYks0U0tCaFRF?=
 =?utf-8?B?WURKbWswc0NXOXVHbG9pTWR1WlJ0bDFoYmJ3MXJ5L0djSUZxd0hwQkc5KzlT?=
 =?utf-8?B?czdEWlBpVWJlWmhVN3RIeGp6RFhvL2dRUTkzK1VaaHlteVdKeEdjNDBRWFRM?=
 =?utf-8?B?c2RUUmFVMlcvaHNsWS9LZzIwNCtlR0hwMXN6emJ2U3JaNUJYei94dVUrL0J6?=
 =?utf-8?B?anJncmpUTWg3aGdjbFVybDl2TzBGS1BQY3VMNXduYStOVllwaXNRZUpzbWln?=
 =?utf-8?B?SCtZVGhVVFAyV2pKd1VLZHlGc25yQ3hoK3JkVThYTzlZODZaNG04dzlhaHIx?=
 =?utf-8?B?RGh5RUZIUENsSG1DbU9LUGNsdm80d0dodTlEb2pDUHVNeVJ3UGdOQ09IQmVE?=
 =?utf-8?B?bFJTNUtpektrTHVEWnhNT0xZWDBWNndkdm9xRGZURUdEQUFtU0pPOUV5TFd1?=
 =?utf-8?B?eHFiRmJMNnNhVUg1ZmN6emRLMG5EdXZIUXRmbG1DZ2M5VDBkWHZwSTdKT1dE?=
 =?utf-8?B?SjhkL20vMjdYTWRPeE1xK2Uzby9pazFUT3RWTUJmdGJqNk9kU0VnTWVMN2JG?=
 =?utf-8?B?aGMvSFVtWHh4Vk5Ocm1PYkVGcDV1RXJsMmhOMkdYTXRsY2k4Qi9iTVVhdHJ5?=
 =?utf-8?B?RzAzL2RobEZZYndycy9rcWJYMUY1d0xjOXRMVU9VaW5NSzFWSURPQVR2eDhC?=
 =?utf-8?B?elZkYjRvNGRmaFIvRk50eXZRcTRIaHlEN1lPMEk4dzVFZklPOEtlQk1QUzNa?=
 =?utf-8?B?dUxYV2VpYitPNnJmaWNrSlNvSUpOSUYyU2Nkc2lKZHBzMFB3MVc0RjEzUXJa?=
 =?utf-8?B?NndoY2lndDcxYVMwaWpESTVkTTVOSjM5ZTlGeU91eFB6Wms1d0V4ZldnZXpB?=
 =?utf-8?B?cG04UnZxOWZaaGZEck93MUU4M28wK3ZYTGhTUitvWDNKM0ZaVmdkL0kraUpQ?=
 =?utf-8?B?eTNHZk8ycldtaEwyMVdQR2tMcldHSUdPTmZJQXdKcC9ldkhscVB1aTRmcnVi?=
 =?utf-8?B?ZTVxVytrZEh1M2ZLcHRRRGd3cUhlbmxMektsQ1g1WE92azVMWEUvekZFc2c5?=
 =?utf-8?B?dk5HUzJOSXcxQnNxdjYvd0hCd3hCU01lTWk4Q1djNVdOMDd4VmtyT1pPajV2?=
 =?utf-8?B?N3h0Uk96TldweUdmWnJ0RTY1RHBabmxiUzRwN1lrcHhrKzA5QzlRRU1sMWpj?=
 =?utf-8?B?bXBZVlBibzRUaUNTMmgvMG1sdjBEc2lueEFrVmFkbFdHU2o0RG1DQnFXOTBo?=
 =?utf-8?B?eFFuRHhQWVI1RkNDVFNSWWVOeG9tK2NTUFRybU1mVzRUQ1Y3WE43ZmU4L3Nl?=
 =?utf-8?B?bkQ4Nk14dDF1TjRyRGV5OXdqRDRTZ2xHdXRBTlFyY2tBTWxUR3J3Ym9EQ1pj?=
 =?utf-8?B?MVZnUWtFT1dsNlNJa2ZaNisvbUVFNWR0VHV3SXVnZlA1dXF2eFJ5akxBZVhI?=
 =?utf-8?B?aThsSk9YZzRGNWNiVHlaMlRJbjZhSmZqME1KSHppdVRDMEZ1L0ZqU0k0ZkJo?=
 =?utf-8?B?UDFWZVQ0WGl0QXVpTFU4TW13WWtNVkR2NG9vK3k3bnFiRGl1Qm5TZFRrMkdC?=
 =?utf-8?B?SFVjbWp1VU5nQnB4TXRsNkRWUVNhblRMM1hJMTZ4V3N2bmVFM1piZWgxNGFt?=
 =?utf-8?B?ZHA5MGNhaDVZYTAvU1hZTnFZWUhsbnpRRHlQRUZwYk5MZEZuRStFV0Nqb0V1?=
 =?utf-8?B?aU9iakZjam92Y0MxcTJjTjFiVUJUZGhrY1M4R005TjNvV3dQZnBZdkJuL1kz?=
 =?utf-8?B?QjVPTFpYY1hlWUFlb2JOSmRPNkNFWHVFckNaSU9OZWtnbEwvdVJZbGNkc1ps?=
 =?utf-8?B?cGtxRVBQdG5kcjgrMXR6NFozVmJTQTdsWjFMY1RWdlRBZUR6SjY2cjdpelZl?=
 =?utf-8?B?K0pCSkg5UElmQjlWV3VGRWRtcDFOVHVpQ09RZ3hTS28xc3lnckk5SzhaSWlv?=
 =?utf-8?B?dDJXQkNMbTJBZW8vckN4NG50Z1JaQ0JtNzRaY0J3SDVVL1NKRXdEZHhmVndS?=
 =?utf-8?B?ZEVkUlZuMEhkTDYxYTIzdGtxVHNQRlRMcUhWMWpsVkRWb1BSWkdvTldDVG9z?=
 =?utf-8?B?NW9zaWxjb2tPMTlxSEc5cHJuSHhPWDBVVE1URUNWQ21LdENiMCtyT29tQStx?=
 =?utf-8?B?ZWFaeVc3WjU4aU00RS9CL0NsVFJsT2cwYkN5NVVKL0lWQVhuTE81UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd17b0c-0737-45b0-4147-08da1d270f93
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 08:24:43.1866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /v6Xj87fD+WN4EKhabh0YmskrXbf4ixoR/Vtvac0TSISASiTgozZ0IXQdqlGFGMP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2382
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

Am 13.04.22 um 10:23 schrieb Daniel Vetter:
> On Wed, Apr 13, 2022 at 10:04:48AM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Wed, 6 Apr 2022 15:50:30 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> After merging the drm-misc tree, today's linux-next build (htmldocs)
>>> produced this warning:
>>>
>>> include/drm/ttm/ttm_resource.h:226: warning: Function parameter or member 'pos' not described in 'ttm_lru_bulk_move'
>>>
>>> Introduced by commit
>>>
>>>    b0e2c9ea5afc ("drm/ttm: allow bulk moves for all domains")
>> This warning is now produced by the drm tree.
> Christian, do you have a patch to fix this?

Yeah, already on the TODO list. Just a few to much things coming in at 
the same time here.

Christian.

> -Daniel

