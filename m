Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791283959EC
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 13:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7095489227;
	Mon, 31 May 2021 11:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2048.outbound.protection.outlook.com [40.107.96.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DED89227;
 Mon, 31 May 2021 11:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZlv/N8dTcmDPLFAUE5D8LePe0NX+Q4D1rpOZ3xfkC0CQMiXUKIg+VVB+BnuL6xnRfvQoAokmBPc/OM8CkyAiAMhZcNq5GrlFOZLx++MbwRqyfUBuf+3BT1W5s/LQcTakasCM1yDx3RT6gBzyfU5GTTbWaDkWyYERvLmwLpmqN+gtKG7jXakEQR7LzU7O4ageWO+sB+KGrEEy5VygwoiGuXCz149ySLGeaJVTa5w3fYy1oTs/JQc2qNPpiLDE7WEWcipngFr4Dgh74ltl62qqVxSseDn1EpK4S0AuOrreu3vNLkf8XIXgsJzfGD6AWYQCQyeUEU0gwqpTmg4nu63yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcSpLD8sYB/tGT59kqvvU+W+LJGhz1n3CqUf82vsvtA=;
 b=Ev+/MSobRQ/dc0nFGeQEUp54QBVUskjcV50az6z1zvLXGe2G7Iyux6RDp2X2SULY7x56i7qzHh4QAOBwmvd+/awnQB1cMwaKLGEybER3xrLn8ejQaQO3wJ6J0bMXTkKVKXvUzGQ/P3K8j984/IUergu07GmA1p6O8cQc/3LblncWbv3GIdYPpZxRSj/fBWIyqNY1E+hY3RRI+MlhoGO6+hS8wL+iX301gmY/pRxSysVdTZ8BnX+ShyHTvRtQAbMptBNFS1sncIsfg+SrsXy2JHev9Yqfn3zLzoa1XQmeqjsNLParNpFFY2RVY8WjZfcGSM0q6pW391iqK2q0V4OZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcSpLD8sYB/tGT59kqvvU+W+LJGhz1n3CqUf82vsvtA=;
 b=e8W1rqHCZgiyH+ZIw7wy2T271NtFjN4zCxIPvWqkxwLvViErSMV57qGoH7Q1h8Pva2L6MiqWabNh93LRJ8Bx4XJs0WnGHfo51YKwt0Nfw1aqJc02Gkm6ZA75TdjOrNbhGDRiaOcGWubCU3jMVoLSi0jvGJzTov9t0TwT6NVAcXU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 11:54:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 11:54:37 +0000
Subject: Re: [PATCH v2 2/2] drm/ttm: check with temporary GTT memory in BO
 validation
To: Lang Yu <Lang.Yu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210531113054.2477-1-Lang.Yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <263e38ea-b7de-5171-56cd-9e8cec337f51@amd.com>
Date: Mon, 31 May 2021 13:54:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210531113054.2477-1-Lang.Yu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b94:4956:bad4:7c81]
X-ClientProxiedBy: AM0PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:208:55::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81]
 (2a02:908:1252:fb60:b94:4956:bad4:7c81) by
 AM0PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:208:55::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 11:54:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36bbad46-0267-4048-679b-08d9242add42
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43420A50BEF5C2CAAA48EDF1833F9@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: whv9ExM4MvRBvQfRYJsSeKAkUGS+7GMhppkwWsZqYVhxxDxQDhGZwq8BTA8Pu4R24TAAAzw//NZRHPoxO/Ywoac8L2DVvja828bpQ3ipyDhnfs+hrboFoKGn69f7hlR+uJUqmSg1VIAYb7qaJsWdecgE3Y+NuJsOqZmtHCWhcguSCQeRTcggVufBAUYFidIRhqFlOUp6azsuHVCIrBdYwsivMhGeut8RV78Ne5fm6hC5pLFA8V6BTRQl7VjqSsAFOM2dvPHPehVuabhpgvfrHcs/uDskEskEoI80sfyH6w2MhBbeXM4ooZYnRfvaob3vIgAB6eEE2kw+2sP6z/S3CXtCx1389Ve4xoJ58VW7Z+NLyWIlVh2T07MZYJnv4v18eVSn06vvYkYzlW69VGc9IFOnCSDLu4TBaZfU/KFsSyZ1D1PzkauUsdLftTPjUHiytjU+s4/eCvz4gseUDjaN9npujIdzQOlVjecstCT1zD9mFfslWe4azh4Be6lbxl0sylN/3jzGM1TssvADWRs+ADYes/we2yiG6ZIhz0gb6ld4CCG8YMLvj5CLxv+nhGGaHxTZTw5/v52B9RCBYocTuhaHU0VIakqiY+As2JTlWZWSshDCrjYxzKPBUZX9GkaH4r9vDvXP7VgN+/YrpUtaF1qm/TPHsgGCOUBo/BliO+jV0kPd4AAPHazf4P6xeq0A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(5660300002)(6666004)(316002)(31686004)(54906003)(2906002)(36756003)(66556008)(478600001)(8936002)(4326008)(38100700002)(31696002)(6486002)(2616005)(16526019)(8676002)(186003)(66476007)(66946007)(4744005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MmFxazh1b0E1dHdrWDVCUWJzVXhPTS95cllEWkU5M1BZWEVQQUJNWkVFQjkz?=
 =?utf-8?B?UXNza3Roa1FkMHZCeVE4YTVBb3d0bFk3OEw1WURiQ2FiOTFMdzlmSVAwOWlM?=
 =?utf-8?B?VFVzaTkxMzFEUXUzYkVLTExOUnh3SCs1a2pBTzZURVNzQ0lISVp5YWl3RjBy?=
 =?utf-8?B?MTVsUVFpeDF2Q1I5MStFcjFzMDZER3BFSFc4WGNXWDhKSTEzc3VhemZ6cGdI?=
 =?utf-8?B?MlFpYVA4VzdpRXNacEVUQktVYXYycEE5UUV4RHdLbE5jNTR2OEtMLzBtTXY3?=
 =?utf-8?B?bTcwT2lBRFRqaWg2SFpERmREMlhFVDhOa3RxT1RsOVRVU2RQVitCUHV6Ymgz?=
 =?utf-8?B?eEdRemZSR3RsRllPQ2hlLzJTWXZpbGhzUHdncnlvcm9aU2FHWGN4UGpsSzVV?=
 =?utf-8?B?MURIdGFSTnliM1VsSEtsWHNubmxBSTR2VTB2TUhNMFkzeGwyOUE0dTZFNzQ4?=
 =?utf-8?B?aEo1cXNxamxQNnU5dTN6RFEzT0lNODdWWGJxbW5sZStoQys4enFvRll0K0JW?=
 =?utf-8?B?NW0wWHg1K0d5T3VLRmpFREtsSE91QXFobG5RUERqUzM2d3BPU1BjdmpBTmVN?=
 =?utf-8?B?UWg2MXV3NWdYTStWQTNGT3dMS05iRXdJY2dkOHlUNkJPb0JFb3FQMi9vajl6?=
 =?utf-8?B?aDNKYzEzNEJ0dW10eGJzb1NjRURkcXczc3A1NVhTZHA5c3NFV3orZ0VvQmt6?=
 =?utf-8?B?NFdSUk53TUNMV3FVQXpYUzNmQklLK2RvUS9vWm1BckxlYnp1T2QvbnR4dTNF?=
 =?utf-8?B?bDVUZGZ2WjhvSjdDb0JWaDlzMFFNQUE2aHUzcytMWmpUWGcyRDFOTnpIWmlp?=
 =?utf-8?B?K3RxQnN1TmdvL3dVMElwa3hYRGg0WE0ydU90YWV2QjRmTVlnOHZ5YTRYYlp3?=
 =?utf-8?B?UG1CZUhBZDFubWJZUDZ0eDgzM3NQNW5GVHNORlZ0MDlwTFFhcDlIdU16TjBW?=
 =?utf-8?B?MDZJZ1BYSXFRWWQzMTVNMUVkVEh4SjFweHkwT0czVnZYZGU1citPYmM3QU9B?=
 =?utf-8?B?TmFKK2dPNkR4a0dxdm8zd3YrTGdlVEh1Q0FqVGJ4U1VUdUJIaEF3NWYzK3BU?=
 =?utf-8?B?eVgzbWVHcVVPdFd4QVFxRkZVczdZMVU0YjArNldVbGJlUkorOENpbEwyazVx?=
 =?utf-8?B?c3YzNGZtMGdwdllCTkduckJSZXUzWjdIL2VMaFNFNHROOEQrcXdFb0dUb0pD?=
 =?utf-8?B?ZEtSUFlKa0oyTXBSSmlUZGdyQW5pTkdUVE8raEN5TUFydzUyaURydFA1SXcy?=
 =?utf-8?B?R1YxYm5TSmRrQjZTa3ArNG05S2NaTCs0TndIVm1JaTIvR1E1c2kwWkpwWTJw?=
 =?utf-8?B?aWoySVZkSHlrdlFrb0w2NCtwRytqUnN1ZnpZZG50OTZYYXdjbzlpSnlIRDAr?=
 =?utf-8?B?Y3BDRndnRFJUdmZ6Nm5GNEhPcUQ1bjVTb3dYSnZJYnN3cEN1WUdYZjNhTjhN?=
 =?utf-8?B?Zm01alpPL1hMU3VwNzIwNmNSSVJHaHpORkZ0bzM5azQrYU0xNzRzYjg5QXRY?=
 =?utf-8?B?MXJpSUZsakgxblhicTk5ekoweGpsWjUycUJYNUR3MTlsN3VLb1JhLzBzVnZF?=
 =?utf-8?B?cEhDYkpObjZtdGU0SkpnN1hQN0xPRFZ6VGxRZDFISXV2aW1obTV0VHRac012?=
 =?utf-8?B?OEI2Z0JXYVRWS3VpZVFXcTkrY1B0dEhjUDlNVUE5UU5KcFNXelQxVWVCL3dy?=
 =?utf-8?B?andVbDhLbS8yczJnZkEwamJtdEs0Ukh5dFJ3ejBOdFViYWRWRENqMFdGY2RS?=
 =?utf-8?B?UkpBTGhaalFtejJ5ODU1WmZDYWZpVnhlSi9XK05OY2wwYWlKb2pSNDhNQTJh?=
 =?utf-8?B?cnVEK25jbCtlbFpZZDBsTCt4eUhKdSttOThTUnQ5ZUZ5Q2dkM0hIbjRIaVZO?=
 =?utf-8?Q?tS9VyAP8LlYH/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bbad46-0267-4048-679b-08d9242add42
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 11:54:37.1537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRN04Rmv0x+hk1hiOdZ3APrdhPR8V/q6Qnuk7oSR5wKw3WcNgyPhnOIgrL1Et7ic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6?= <thomas_os@shipmail.org>,
 Huang Rui <ray.huang@amd.com>, Marek Olsak <Marek.Olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.05.21 um 13:30 schrieb Lang Yu:
> If a BO's backing store is temporary GTT memory, we should
> move it in BO validation.
>
> v2: move the check outside of for loop
>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>

In general those patches now have my rb, but let me add some more 
documentation to them to better explain why we do this.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c32a37d0a460..1802fc77cfcb 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -938,6 +938,9 @@ static bool ttm_bo_places_compat(const struct ttm_place *places,
>   {
>   	unsigned i;
>   
> +	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
> +		return false;
> +
>   	for (i = 0; i < num_placement; i++) {
>   		const struct ttm_place *heap = &places[i];
>   

