Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA5784876
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 19:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8888C10E3B9;
	Tue, 22 Aug 2023 17:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB8E10E076;
 Tue, 22 Aug 2023 17:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeryVAyumu7wFVuTuymN5sNy10HieC8e4hv5CJRQc1XIMyds0evWlRSElh4E9ctuYL+dgN9gPIGFH+bt6yMv/i5msWXYkUVrKKJ3Hr2eUf8Vie61IJaAca5p5ztpLYcXYzSBxql5+lUzRrD9un8/0kkmFhEcT18sfA+1KkthbfCnt4V7EjBSj9JWVxxsd0r0u1nPUDc5ZQIB1bgQIQPbJ25HKlPey4LLlQadVvU84bUgWGPUEZEGa8CaocuKXwa4j9JL2XjadIO9irK6NB8Gs4pz6tbRdPV0pv0WfcPt+rvxlDD3P+r5JmjSa0KomhymYqAE2oHw3gLBhTgcRVZH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o23fC0Wia3kV6z8KEDFYbSrzdOvG+XfeOpbNyGOM/hs=;
 b=NwE93TcDQuKQXq+qIYdZHLo5CvAOsmKEY4EnbmlwerJAnyTTgTKnUqtp4tPXpZZNksqf+TlmBlNgrV6nRQSZ5pPS36eWTTJ9kw/nAYpYuOw/7pyCsIu0q3nA2JNc/afxvXFPpJgpvuLfmPWaX87BY1lewYi4jWgT+PnRVKz5qqwn9S6swTDD9wsxpOSEuXlI8qD54SCEDAFY2+J0XMOSn2QslercFJWcWQXgxiDcpXYXu0tP4bESPwmwMvYGWIyVeFxkgDjJYTO7dJhB/8Best5O44rgNBON3y+LhQFNN2h9MHLAC2j1hqg0793Tkk5tbEVedwWHZH4+b5HIy5Q+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o23fC0Wia3kV6z8KEDFYbSrzdOvG+XfeOpbNyGOM/hs=;
 b=wC8H9Q8EGpltrBusVm6pvDJqYFf5h/+7lhRZj1FDMDOIm5xf3Py8iPv1MpthlzR75aOPMDvmJoS+begIRxz+VJ+DYr1ijQ5MyHFVaIzA4ebvP76wyP1UgJhur9E55HatgxUd+fRbe6nC3N/JmI5a8WcWtYPrSgKicIJ35z5i7Jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB8795.namprd12.prod.outlook.com (2603:10b6:510:275::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 17:35:55 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 17:35:55 +0000
Message-ID: <2d7e2d96-69a8-4e7d-b914-8780343344ff@amd.com>
Date: Tue, 22 Aug 2023 13:35:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: register edp_backlight_control() for
 DCN301
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230822170343.137958-1-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230822170343.137958-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0280.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: b90e3551-f1ed-4051-695a-08dba3363cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHtWTZPTMrx3igfc5L8FxSVp0QEBKa0zccaA1z9wFfurjLA7VUzt4d/iLJZkHcwlWIZaDKdOb2OJZeuyJ4EFr7JrZXb40+w3jH8adrD8OOkBAOCx6XHRNaQb0bMDPzTBLE4sKg0PGr31y/GOEC7T4btHbtCP61P5ZewU585wqabjD+DQ4+Di5HZOH7yU7Ju4HNvDpPEd9t4rPLTGl/ckAHEjYiQm71yRKZR/9yc6lV2lvCrtG0CCzznkDyKsiiTvTkP0vzVuyH0UfjwRMtFdqomDVxHQtIYUwBmMFFqShN8KqpM/IJb9ufEEslTNQ2QI9TKPoBDAa8wopcIEYAIIhDQTWw+EZBzC99e/n1j42YALlPHlrZXkqMTx40gJrB5nRldkTcUNdLWbVsYzUwoh4Vom9ABLEy6+Rr5jBSVBILz7r04xEdc5fcTmOjnZ+M2SeFa6KgExChTVWww5geNjZ4+qD9aLIWZjZ9JzJdCjbeMcF1wsMVGENjMF/nzIIBkWPlg3WbWbQQ8wXh60FyGvEKBC3ACi8o/fnApnt/i/6hqhJh4XEGKmvflHFYQ4uCVrTGilUqSTPu9RmvBEfvyanvxEu8dTzZWD4to8eh01rPsKnprbOlIctZIkbdwkZLCIWjYF/t0V2cLl9AZDWzS3nQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(2906002)(38100700002)(6506007)(53546011)(6486002)(83380400001)(5660300002)(44832011)(26005)(31696002)(31686004)(86362001)(8676002)(2616005)(8936002)(4326008)(966005)(316002)(66946007)(6512007)(54906003)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1QycGVYcFdzekJpOXRnSURmMVVwaGZkRWg1SXUwZm56bTM5OXFHejk0MEZO?=
 =?utf-8?B?UUpWUjJ1YzUreVpHVFd3N1g2MCt0NWQvdlZsaXJDSXIzbmFzMUpzRFVmSlJZ?=
 =?utf-8?B?TGJndWJ4ZkRvQ3ZMTG9yWWZ2dW5TNEFYaE52U1NPa1B5cE1oVmQ5WDl4b2VF?=
 =?utf-8?B?b1NmVHlucUlsRzlxTVNlZ2Z0SnRJS0ZVamJPaVRiKyttWk9VQStjeHdsS29z?=
 =?utf-8?B?K0IwN05TSEIzMWZubnd6SDQ3bTVhNVpmVFMzUTJKdmR1dlhjS2xWa282Y0xy?=
 =?utf-8?B?WjZpTUl2YmVHUitjTnRNR0NMNHJFYW1DR29RMWxoeFNiL24rU1J5T2QzTlEw?=
 =?utf-8?B?MldJS0xVcytaY0Yva0RPeldGUytYeTl3a0FQQ3VoUFFZeU10UEp6M2xXQzNj?=
 =?utf-8?B?QVRZWFEyL3FzR3J0d09jb0cxWFdvMXpURnU0NkFQMXpJRmFwak1VenNmei9V?=
 =?utf-8?B?dWxkS09VK3dDK3JTeVZIcUt0QWVON3AxZkRsRlhFcWNFQmZRTUpGTVE0clYy?=
 =?utf-8?B?eGIxZjJFaFF1MjRTeEhmZmxKUzVMOFF4aU1RTTJ0SFRLOHdlOEJWbko0OHJE?=
 =?utf-8?B?dnd0eUlSc3RJelNFUUg2RzhhUlhBeGFQa1NUcUh3S041RDQzbkpjemhHaUhk?=
 =?utf-8?B?Rm1yMC8yUTlKbzNHVEdqNTRoQTJEZ3Yzdk1CZzJZbFZnQnRVbk9pWllRNTM0?=
 =?utf-8?B?ZmRVTWVJZ1IveTQxZTd6bER6Ryt2WjBZb0VsWWJhdDFoVmRDS2g2eHBrZWow?=
 =?utf-8?B?RmpBbFMxbjNNRXdzOFcwQlQ3VFBHdjlzOHVZOGdXZlA1OUpiaDc3dzJLYlBR?=
 =?utf-8?B?YkZTOU9DQllsWC9TZ3dxOUY3ZFZsSmdnSHdvQy9ETVNKTFpDaWZ4UkNHbHdn?=
 =?utf-8?B?Qm96YlF5WUEwNFZoUDUwQXpYNTd0R29XQ0RvMUVEY211ZExGcUdoSUh4RnA2?=
 =?utf-8?B?MytmVE5aVTNKVEtkVVF2TCtsZG9YK0NHMDczL1BaQk02Ry91c3docWNRY2hi?=
 =?utf-8?B?eHdtSll3bTMwT2dha3hTaXgwUUVvNSsvdVN1ZGR0UnBoUnlzMUlvMHNyTmdI?=
 =?utf-8?B?cWdQUm1ISVAremhQM09oVUFtRFVWclNGaitjdTdERTAzV0F4Wnk1VER1TzFJ?=
 =?utf-8?B?V3NvUVU4alJtbGhyR3h4TzNFUnQxZWpUZmQxbVhkWHQ3SGQ2UFFWUFpKeEJa?=
 =?utf-8?B?c0hQUXFacEdPaWlOTExlb0k0Yk9uT0s0cEx1aHNxNCtwN3QwQWhyQzNqaVJy?=
 =?utf-8?B?NzVMSVBJeWJOZkxDcE5DMXEzMytVbWZ0dVBUVmFyUzVPRFp6S001NVBETm5p?=
 =?utf-8?B?SUltUzVzMTlmU3lGc1c0Ym0wYmQ1TktZTzRIVWpLUk9vYWU5TnROQXQ0UGY5?=
 =?utf-8?B?QmRBSHZOTU9QNlluRjB1N3dIbENObjEwK2w1UHEvTURhTFk0RG1pVCtQblBv?=
 =?utf-8?B?VU1VaTJrRWRBWWVsWFdIYVZVcE4xZDg4SEdxTlR1UVYxYzFoaHVtRDBOR3hV?=
 =?utf-8?B?alFsMEdJMWljTTU1Nkd6UVk1eTFpdFpYdWpWNHpBelJqWWdVeEthUFUxVEs5?=
 =?utf-8?B?WTBPTnk0ZHZRMzljcDZ1dExqdTJyN2hKdWNwN0FqRlpCLys4bGdKNFYvK1M0?=
 =?utf-8?B?RWwrbEFxd1g0S3JPd0VDRzJnZXBaZ2pubG5QQlE5dlBlQWxRYjVkWTBDM0ds?=
 =?utf-8?B?RHhZejBDT2hvZzNFY3B3amJEakVJbnFFTmN1QnBGQTc2emNraFdRaWtKekFh?=
 =?utf-8?B?MGM2cHdzZGM5MUpwK0JmNWUzdE9QVGlpZVRoMDgxT0VRS1hKbEY4bmU2SE91?=
 =?utf-8?B?alE5d241ampZdSt4TFFPeU8rWGhVQzZ1UStsT2NKQ3BXYjNVQmJlWm13T0Zv?=
 =?utf-8?B?T3dCcXNoR2Z0bVVHNCtLZm92S0VzOG5INGc3U3ZlUlorb0c1N09pYXBlVE9n?=
 =?utf-8?B?WiszR1VJdmJZUjB1cTVSeE5rVnViWng1T0Z6c09xMHhhSHZCRkFPc3RWTm8w?=
 =?utf-8?B?SjdRVjREVndIWVFzNENzME4vUTVLYjFrTDRJNnp1V3dFYjd2VzRoR2MyYkNa?=
 =?utf-8?B?cTIxajVOM2lvV0xZTU5pM1JMVGI1QzgySEF1NzFsYm91Rng1RDhFN3F5RmxQ?=
 =?utf-8?Q?+gc+so7XtwcMhyP9esB/v4d9s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90e3551-f1ed-4051-695a-08dba3363cfa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 17:35:55.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tT1RnLcVtYTGnJoPisWra8roBvKh5Wujo4X2s9YfdMnqc6COjqBn75I5BLdCPvXfZNVC+H5DbhVbyGTTq7OoYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8795
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
Cc: Swapnil Patel <swapnil.patel@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>, Jun Lei <jun.lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-22 13:03, Hamza Mahfooz wrote:
> As made mention of in commit 099303e9a9bd ("drm/amd/display: eDP
> intermittent black screen during PnP"), we need to turn off the
> display's backlight before powering off an eDP display. Not doing so
> will result in undefined behaviour according to the eDP spec. So, set
> DCN301's edp_backlight_control() function pointer to
> dce110_edp_backlight_control().
> 
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2765
> Fixes: 9c75891feef0 ("drm/amd/display: rework recent update PHY state commit")
> Suggested-by: Swapnil Patel <swapnil.patel@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> index 257df8660b4c..61205cdbe2d5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
> @@ -75,6 +75,7 @@ static const struct hw_sequencer_funcs dcn301_funcs = {
>  	.get_hw_state = dcn10_get_hw_state,
>  	.clear_status_bits = dcn10_clear_status_bits,
>  	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
> +	.edp_backlight_control = dce110_edp_backlight_control,
>  	.edp_power_control = dce110_edp_power_control,
>  	.edp_wait_for_hpd_ready = dce110_edp_wait_for_hpd_ready,
>  	.set_cursor_position = dcn10_set_cursor_position,

