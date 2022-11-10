Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49E624D34
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 22:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AB310E1D5;
	Thu, 10 Nov 2022 21:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BC810E09A;
 Thu, 10 Nov 2022 21:42:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG6jpeTmYGO+VEILGWOv/h5oTCr9rxFs9FydvOLMcX7RwLGckVPDKHQJ6pGTU/A04mHXuSfcjETaV7ypbp/qEZ/ZA5T8QzQgrVPlJ486NFAxUiiI0XiiLDuuiHuwbbQ5x6WFGmMAZrK3pmAZKzpAFfL8gRTrqVxMLeJSvr5qMhb16c9na7bzjGa5VzpPKFYggtFq4gq1bdJD+VsnvuUN2FqIZrR8gtWBLuyv3Vs9/b39FJF27VZSoK7GY/xDnSMAqh7HQJMOgDjpqIifvuoGbYUK9wa1GYtDKD9qsEs2S377hJjZSXv+pZxR1eHUQFLqg73/geqzTBS1MCSpoF+/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRSklfj+G/hdcTVkvB/Y2jqaghh5ExQWPYY8X0nyJrk=;
 b=bNfTB88mvDmEanrC6p6Euhi10Yx5tAd/KNtEgOAecp3gj1gQqXZLcDTodNIuGS3lqi7aLkWAAl1KkujNUpnfbaQDhXFGx4jFuI/EjL0fomP/gF/MhLryH7PIclpuTtE5tGWqp2hfjZ1XLYmTCtaty31voJodnVIdZGmjJo67A0l88VN24+Wh+W6CD+xjKvc5VK4HqmtkywF9cP9eyUebwz2GXFvminD2M511uNx3ZNWOJVBgzAradzWH9QRnPSrPKi1JMuM/RhoI7gSIgzA5M+0dlXLhygs4CvAFS9jMh1Qv8bBumQUc2mFRI00GOo1kggbzSP2fSCqdmlRuRannzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRSklfj+G/hdcTVkvB/Y2jqaghh5ExQWPYY8X0nyJrk=;
 b=OLj9v6SbsKl3RkrE44NH0xR8ychqst8uazqHylJvCVwX/FL7EgJP5e/re6uHQ48QXByvO2S4mPtUuBjoBo8uYSyRg/xIT9UvuBtzHrGwvzkYyaZCvgTExJ5t5G7YLeGU8l2PNrEpBwCcRBLbNKwZcFX8CfosQwDsaXCIqL94oOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6864.namprd12.prod.outlook.com (2603:10b6:806:263::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 21:42:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::44a:a337:ac31:d657]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::44a:a337:ac31:d657%4]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 21:42:24 +0000
Message-ID: <76bae3bb-3cb5-dd9c-a1b0-bbe61721abbe@amd.com>
Date: Thu, 10 Nov 2022 15:42:21 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: nbio_v7_4: Add pointer check
Content-Language: en-US
To: Denis Arefev <arefev@swemel.ru>, Alex Deucher <alexander.deucher@amd.com>
References: <20221110122848.20207-1-arefev@swemel.ru>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20221110122848.20207-1-arefev@swemel.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0066.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3e61ab-fb29-47c5-df0d-08dac364742f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 11w+zQkg5BN6AiK4hjyFckcpkiy+mra87h6Sgo04Rm5oprkd22Bzqx20rIIcIZ0S2sSmbC2oUcUehhKRKx+TtWtKcZjVq4NwMfqLubOk/u74VO9fkEyKb4GI92oKw0ishSuiB7/eDnwgZkAYwDOtcGtGGrUDg09o2LNW0or2vQ7pk9UIFefLgZoQNO2TtBjcDp/6Yt9GDKVE56jnQ3ZYMZ4ctU3khs0+wToCRdKAnMe9kQJHOhW5y1XnYnB8bgRHuE+4DRAJmdw2i9jRyfF/VrTR43dceqwEfpPiYjtdyUFemEED8xXl554TlX1b5weE2a9TunO3Z/rWCxbr0QDxTkI267oX/kicYP1Kd712MgSgFsgC0NnX5hdzkCGgzTXdbKa/+5NqqxZ8qzKOj7XHomx99qILvqcaVdf3XN2RlzN9UrNBIX0ltAylecFKJwex92TO9jBkhnjCDVO9NVyOOQPo+4LEwmw/ylL+xgmPckq44SqMRLZQ9ITSXNa/Y4hpGqTyuyqdlQJZMZ756RLNrVtFI25VHxNBjQixlfGkdl8vPystl/MZ3vHaEFsY/to+4mgU2CtIAzLdfXPiKH3hF2gHwd3gg0j26czQ2Ler3otijPjv3N2XLpmc1/GOAZ22Xb1xEs12FZ4dzgDm8zsZP34TwbSan5unkAuOQEi44z63BEK1JYJKxsTD1KdLXxo7SGMHsRmb2RO0fxRfgsSN4dF7AIX52vBhoahLELDwygsxwyCkZyie6Lf4d2g1HzsjHxISpsNerTB3IbeMsUb79WKVVTxlExIPRA4e5EK4zH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(478600001)(6486002)(54906003)(6666004)(6636002)(110136005)(31686004)(6506007)(31696002)(316002)(26005)(66476007)(66946007)(38100700002)(4326008)(66556008)(8676002)(53546011)(6512007)(86362001)(5660300002)(2616005)(2906002)(41300700001)(186003)(8936002)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlNFSTN6azlxb2EwcnRvTnB3K0hTSS8xN0EwZmpURnVyeXNhVmhlaEQwdHFR?=
 =?utf-8?B?emlPeEs4aEc0M1N6UTR6QUovaXduQjRnK3BuTjZlSUZrV3JmQzVEbGZTWFhS?=
 =?utf-8?B?T3lIL3RCZEpObWhDMDdOcXd0VUgwMUdhUU8xZy8yRWJ6NVlXRDNPZlE2UHJl?=
 =?utf-8?B?L2hQVlNwKzdLTG1sNEUwTHdMbFJKT3cvWkhGbUMvSysvVDBoWU9CR2pGNlBm?=
 =?utf-8?B?VTRIdnhtQXE2L1hZMWhaMU0xb1EwUnoxdFNBRGVFbTdENjJENG01em8zUTB1?=
 =?utf-8?B?dTBnaE9wNjJWUVNrQXZBeElIQ0lFR1NzallvMzdlMXA1TVB0TE9MclpDVC82?=
 =?utf-8?B?UmtHaUszQjFhRlZ4MVdQeEZ4RElPUnFFR3RmY1dmcEdCNjFBZHpLbnFyQ1FS?=
 =?utf-8?B?VWZ3VXhpYmtjOW1TU3A5TTJDQUNBWHRNbU1RU3hNZWJqMHROaUZxck94U2Vm?=
 =?utf-8?B?Slp3c1hzT2JBVlVFY1RVWmlxN0RjcWVFSi9HdnZZK1JzdENDZ2pPemZlWVU0?=
 =?utf-8?B?NHhYc3dKSllSU2RCY0pvRnBlTEdqc1EvejRVbmxLTjl2dDRwOHV5TkhrUUJW?=
 =?utf-8?B?MlhZWlpSc1lHazlwT1pQM0ZQSzFDUHM2cFRWUjU4UXFMckZrY09LdzVjNkd3?=
 =?utf-8?B?bU9YYWZBRHZSc1g1ZHViQVhXdDFYS3pNbVZpYVkzSnNEVGhsREN4SWFRSm1E?=
 =?utf-8?B?QmQ0dDRrT3pITzV2Z1B6TnBVeTNhb1JvL09EY3gzRXpleHpKK01yd01saWwv?=
 =?utf-8?B?cDBXUDJ5U1pEQ0sreHJJTWpsY0Izc2pNc3V5SWFsUC82dEYzalpWdFlZMnVa?=
 =?utf-8?B?enRlWTg3VDJTVCs3VGlEKzZXcTh0ZUNqSlFFT2d0b0xNQXNlRnd0MExJOFFO?=
 =?utf-8?B?T0JBcm13cGNRMWFydWFEdU5zNGsrWCszUlBCOGFRY2E2QWg0eURUWmJkeVkr?=
 =?utf-8?B?RWs3RGwzTWVrZ0hPbjJOaEQ4U2xNQmdVcGsrU09Ec3FvekV3MGRmaEM3VDVu?=
 =?utf-8?B?WVRFbEpNNHBkZXVSbVNEK3J1MExmcVNvQTBmcFMxamhDVEVla1VKTW9wZlNS?=
 =?utf-8?B?cmlsY01JdHlFYlpNY0Q1clNpODg2cVlpdWhFWVFQdUVucFBXS1c5d0tra3I1?=
 =?utf-8?B?ZFRvcHhUZ2Q0bnY2ODg0OERMSkllK1lwTWYyTlF5MVRFRS9kb3M5eERKTW9C?=
 =?utf-8?B?YlpoNjVHTzc4cXpqNnZDUHhlQkI3T3A5TVVLUWVtMTY5aGM3VlVTNkFJaGl0?=
 =?utf-8?B?ZS8ycnFUL0d1a0pmWTl5YjA1c3lNVy9XMjJvcVl2U3d4S2RTd01oemV1a1hu?=
 =?utf-8?B?RGdTVzhMTWpGRGNEVkNNRWhqUnlFdXBVUWZmNWJ1NzhKYzR5a0JZM3o5ZTFz?=
 =?utf-8?B?MHBlNnowaWVHbHUzRjB1Q3pmZlVSWjFwa2pPekZpZ1JIdVBLZG9HMTJFWGxX?=
 =?utf-8?B?R1V3T0h6dUZZY2ViTWM1RG8wSmRmQUFtSm11RTM5aXlDNGVxcnc4aWVTLzJK?=
 =?utf-8?B?aVZlU21ldjVOL012YkMzbGU0clhTTnBpR3RzNTNoWFdoN3FTUUw5SlZBT0Zl?=
 =?utf-8?B?Q3NCUkRrMll2QTJaR0lkeEVxcHZuM2ZSTzJyd1c1MHRoeStzQUxuMnhka0Yy?=
 =?utf-8?B?Y00zVUlGaGE1TytKN2pNSzFoOXQzaHVTbUxQSXlzWFFldWo1QTFCMTVqWDRP?=
 =?utf-8?B?QmFoTkdiSjljaHc1dzVEb0JhcDVBcE51NHdidnc2U09mZG1NckFSLzYxdWlV?=
 =?utf-8?B?amhLdGZlaE55Mm1tMndhVDZYZmxQbFNQLzIyVU9EUkxqcmVHcGQvYVJlQXY2?=
 =?utf-8?B?dDczVlU4cUtoSTJPQjIyaFQ1RHEyOGJqcU44czN3Y2svYWFKaFliMzVUM1A2?=
 =?utf-8?B?TDU3VVJjWTdiL1BPdTVEN2V3Sy9jZjlCUWZ6UDYyMlZnK1pxSzczNWNOWjFu?=
 =?utf-8?B?ZmllbGIwSVVoQ0h0UUdZWkNKVFFraEsyaHBSV090WFNWUGVwVUJqeGpuc2hJ?=
 =?utf-8?B?eW8xdlhCb0QvalBUZ01SMGN4a2JVc043dlVvQzlhNnl5anNlbng3ZWRsMG1n?=
 =?utf-8?B?NEVQd1Z0a1Zka29VWTNkWTJURk9kR1NWRkVqcC9qZndmYXpYU1p5V3Fhalc0?=
 =?utf-8?Q?dtZMO+2qMREXfdIe49PlOaIjI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3e61ab-fb29-47c5-df0d-08dac364742f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 21:42:24.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA9OAr8ccaahLa2W5l5bVDJ819TykspIDaEFH3cltYLHoO15raGkeRsCTJhWdPt0kf+tHneK2w4VTVM6rw/a9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6864
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
Cc: avid Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/2022 06:28, Denis Arefev wrote:
> Return value of a function 'amdgpu_ras_find_obj' is dereferenced at nbio_v7_4.c:325 without checking for null

This line is too long, you should be wrapping lines at 75 characters.
Could you run your patch through checkpatch?

> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Denis Arefev <arefev@swemel.ru>

Probably should include this tag:

Fixes: 28f87950d935e ("drm/amdgpu: clear ras controller status registers 
when interrupt occurs")

> ---
>   drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> index eadc9526d33f..0f2ac99de864 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> @@ -304,6 +304,9 @@ static void nbio_v7_4_handle_ras_controller_intr_no_bifring(struct amdgpu_device
>   	struct ras_err_data err_data = {0, 0, 0, NULL};
>   	struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
>   
> +	if (!obj)
> +	  return;
>   

Whitespace seems inconsistent here.

>   	bif_doorbell_intr_cntl = RREG32_SOC15(NBIO, 0, mmBIF_DOORBELL_INT_CNTL);
>   	if (REG_GET_FIELD(bif_doorbell_intr_cntl,
>   		BIF_DOORBELL_INT_CNTL, RAS_CNTLR_INTERRUPT_STATUS)) {

