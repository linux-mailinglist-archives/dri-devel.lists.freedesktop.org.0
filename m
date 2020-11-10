Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BCE2AD86D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6E189B29;
	Tue, 10 Nov 2020 14:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085C389B12;
 Tue, 10 Nov 2020 14:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcjXoplSB2IxXenRf/PMFdkZHeRwCPPakgYx7TkFUxTWTLq8qsjSwf/BnPDafPTZ4esMUpClPxiSr832fk4OpPov4zMPb+YEMda/wROajolODMURyGJqBFRDMUgO1g038L904RZmXQB9UhU5wn+G56xaBSL8F2ostjaDY8t/2QWs8++n2dlkcpR2aG2jqhm2vom2HnI3TK8i3kBJxTqCQ2mbk43a//pGrUWrrHXtBjzq4RIBE2KHXE+SNX1wvjPBoVpiuNusoGJyPkrlPGMvtvR3JFrAKF1H5Wc+V0u7+n3KoUlA/BoQZJQckfPY4gfYdeodoMKDJwjKYeghU7N/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv+t2JvLivEqRTEIrJPqK3OooDHOZFgf+0RHfUxQyi4=;
 b=LV0DxBPN6q85YfrzVIWewjyIDUJbJTLc74Ld5A8k94qID7GyUiL4KQaYfbuMZ2KHRIWmqdkJZLqPyPOyQdnkMSbvR3055oHcDwqqgamNeQSQxDJKi3dwKLKVQuhbyI+HSw2+PZ8snHelzjnwFUPaSoyOcNghXihTHouDvqL0dDFNo/tNNVE5ntP1nGSVEf70BkbDix5XraiPbhNTxpRf4gaVefeHU57TJWnOJyevY41CkSufMFC+weafWo6k/7RoA0yZLffDw5WBnKcJdiTMfwiayDYKgQqv8Zfub/MRgNHgSkB/1R1UbeY4AMxaIzlVmSe6Tq195elPALbNYA+FPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv+t2JvLivEqRTEIrJPqK3OooDHOZFgf+0RHfUxQyi4=;
 b=ZB6FTMqabSGfmCUmtE5+Tw1Xy/MCjXTiXARrBJex3A+ruIz4OaHndJwinomyBqWw4pzWFS9Lqwv8ztxLqGzYvc+h0jXqpMroatxubPtbZTCb/kFGtaUA4+/08UZ33xZvzU/10t8LJvHzl2TMAAQ5N6EqExLOXj5vC7lNpEDvTvw=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1293.namprd12.prod.outlook.com (2603:10b6:300:9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Tue, 10 Nov
 2020 14:13:51 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::95e:3860:8b43:1a35]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::95e:3860:8b43:1a35%5]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 14:13:51 +0000
Subject: Re: [PATCH] amd/display/amdgpu_dm: delete same check in if condition
To: Bernard Zhao <bernard@vivo.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Roman Li <Roman.Li@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Alexander Monakov <amonakov@ispras.ru>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20201110080318.36305-1-bernard@vivo.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <2fcfe666-3c83-17ad-f287-6a1801268285@amd.com>
Date: Tue, 10 Nov 2020 09:13:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201110080318.36305-1-bernard@vivo.com>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::22) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 14:13:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 40ba4c04-4b6c-48c1-14ac-08d88582d96f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1293BBE1BDDECE9D1C80400E8CE90@MWHPR12MB1293.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVyTJiu/DhfuCeL2t/mgDyHmTMjU83F41Uz+PQOz3Apet/odI7N8RrLLxXrjmGei2dCcyK2PvfJo9oCu1bQjHoLHPMIKBSV8ClCRqKBGvMztOFSDoLvVUvyAMI90wsYAHfBIKnVfwSnd0K8fFOIwVIn9Sg5dsQfl4rqbtrcc36YSpXMdsYxfDDP1NfIA69Ms1LROG2PhX1v5ZIlHB5LlX/VzdgsHzZ77lveHGocmgLhHK049mHJmkP5nkYMhg6ouffw0vFSIMgy+kHcBVsCdiYSeFewe+nm/auKyLjM4PpUnmB9BjQEIGPWG9UApvMy2pxlkkZAgMyHpCBFoAVhRTMS8VPP3y4H1Eyqu9CByFcB5o6TQh6fN29BdDuohWECwdMsOvhIP1j20v+r3ulXBVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(31686004)(66556008)(4326008)(44832011)(2616005)(956004)(31696002)(86362001)(26005)(110136005)(316002)(16576012)(478600001)(2906002)(66946007)(6486002)(5660300002)(16526019)(186003)(53546011)(66476007)(52116002)(8936002)(83380400001)(4001150100001)(36756003)(8676002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: p6ZfmyXPHdKD8CPtAGOpkWfUk5sdDLlUeOdoSiTPCvrIJ4olIFdrxnOaf7x4FQFEr49d566NS/o3RWYbnLxWCHSFoShAfxbwZKfUhWuJlZWMIfVCYGapHiBMVY84i/j+ybtJ5NNb+pIjNBqxf6oNFPqncPiDgHtvRBLnE0r6vSYMrv9evDlD15YfkatU/Q+su3lTmJ4j8IvxYLiGpSyzT70uEw2aZ4cjslAEYqH765kkCO60Og33PaJ/BmNyeYzrwtSn00rHPOI8AsbwKWC3C4RLDv8FH8Wj4cmpnt+i5j0JCQoqAI9n9OGrLsaDxtemJgFqbEXcDfP+8Nd6Hv7DfUI5GYoHYqGe7gMe66xbv/IPO0s4TsXWt7hSvp4jWIbLiSc+XCOGgvFcamX2b5Y3XRRlbGvlN74tliWMcS0WcG67JaPdD/twf9uwZkpB6OFVmOwBlModdU8NtkaOhpB70XI/OBJzA7UEOsAmqv+BWK5jywbZZmxkYfz4Q6EusS2K+Is8cGGaefgKosZRwn95M/OIqfP7ehF+kb1fzvSSl19EfvkMtcXkTKNNze1+WbiJlKBPPZ29Ap8ZEHDlHSaVOVzgHotlQgA4MwfTPqlyOZb5e2KACDjUD8SVg8Qu1a1hGZ7exab8IRsMqfwwEdweKw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ba4c04-4b6c-48c1-14ac-08d88582d96f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 14:13:51.5453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OV/pKNO6i9ilsVHzFGvSTYw3tN8JBQO+1m2gVAk7ON+MPNE5HVGQie9Uz6rcEAKBHXgTYUbQN5kkCxcVTE07Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1293
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-10 3:03 a.m., Bernard Zhao wrote:
> In function amdgpu_dm_connector_get_modes, drm_edid_is_valid
> will check weather (!edid), no need to check again in the if
> branch.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e93e18c06c0e..0a283d07fe10 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6352,7 +6352,7 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
>   
>   	encoder = amdgpu_dm_connector_to_encoder(connector);
>   
> -	if (!edid || !drm_edid_is_valid(edid)) {
> +	if (!drm_edid_is_valid(edid)) {
>   		amdgpu_dm_connector->num_modes =
>   				drm_add_modes_noedid(connector, 640, 480);
>   	} else {
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
