Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E2A84FAC8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 18:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443C110F7F3;
	Fri,  9 Feb 2024 17:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OSv3A09B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACD210F7F1;
 Fri,  9 Feb 2024 17:14:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cc7UEfciQTi6ab5sF/taxVJr0pvQQfldtFDiLJdEy0LAdu90N+4GN9vDazdtkhCnUfvEsPhnB04jANlfM70bAP5aD5tIiOrNbsDrbujmyJoLPP8xm9EwZUySQKxz4jpKpfnwmrg+Dre7HdhrTxvxragKcQB4MVagxtPe9HO2wCUsi+QVBwAj3siG49kX4sQGbxlWgHAVqxYNZa8Oxr+kIh801/MPzQN7XIeLOZuRF66Vc+hOwc3Eo/25O9FOo3HvohnGgTUv5Ijipxo+jtuUwoNulW9m4VZwAjATnMoTJU8CwgV1BKV1FdBoxOhdAcYSmQKk0kJqJbhZZ8KXaJY0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fZfpNmnYqsBEgqG6S1f6m03KETsWTuFdF+wftAHeOU=;
 b=jgfqxoST24lUC7pBUVTRJR8Q7ROfqggIDsFb+osAPzjzqrze6R2eXJx34OJn4j8AYRt53H6VYFP9lCPxicHp2txIICOjETJP5LS3USlo9/Owlnw2FyIv4aJlETcvHv/Y5AfX+hCsl5pGFF5sUtc3bcGQC9OwJjqgN3K1bTbFwQ1FGTtMLrdnqqTzmKtCDg4lM8S+IByT++vE1XTiqAsHmYgMScduuIE7H/FdSXqycGLnbE+ugKwh8uPdJpl1ZJKPNl/xZmj5wIFjNYIhFT4koQu5OhZy4L+5VCpEqcbqODxdKEbVp7TGmmvXuFP2sYw/iL8xwCQzYnwgNtX1VQxe+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fZfpNmnYqsBEgqG6S1f6m03KETsWTuFdF+wftAHeOU=;
 b=OSv3A09BB0qPYhUMeAfj7enJ83NE1iekW0+ZK7DvaaEsSKQu0rpbPOF3jMa/MBW3ZlKGMSLQGQwNzAprgU5rREuf9HDrbFsGZU/zgCzBmOT9NuGvxTg3D4VaZep7Pkrqng371KbgrXSQg7P2xN8avtXARAx03xGuvBf7xltcFFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 BL1PR12MB5285.namprd12.prod.outlook.com (2603:10b6:208:31f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Fri, 9 Feb
 2024 17:13:58 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::3301:dfb9:528a:1fa5]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::3301:dfb9:528a:1fa5%7]) with mapi id 15.20.7292.013; Fri, 9 Feb 2024
 17:13:58 +0000
Message-ID: <e627dbef-5d0a-4e22-8aec-2a51d860ba1c@amd.com>
Date: Fri, 9 Feb 2024 12:13:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix && vs || typos
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Josip Pavic <Josip.Pavic@amd.com>,
 Leon Huang <Leon.Huang1@amd.com>, Mounika Adhuri <moadhuri@amd.com>,
 Lewis Huang <lewis.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <7482be2a-aca1-41dd-bb6e-d547571b9507@moroto.mountain>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <7482be2a-aca1-41dd-bb6e-d547571b9507@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::39)
 To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|BL1PR12MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5cd965-b442-43fa-f4d0-08dc299280cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 33VLglecGxooU6qZPSoz23fhJ3Ax+VCTK2dYj40fqx56MDEDi/CiiU2JHJKI2rQQkijQuq7lvXgS+nB6VRLtK6/sv+ClJvyblyphupnDJoatMm8LyCqdyDYRP/VP4rggrXoWrn0ZvL6L1TaLFZ02JcqXMmQyOHC449aKLKtsFTNdyz/uHYJ/8wFwt92U1nWaoBv3QHS5b+JTYaVNkINASxBwxR4ivjB33tqOaQayRGP5R6QrhB8zO+j+nBlzAj4rEchAUSrbKaEnEsogxXF2V4ue38GiuAxncOgeaZoHftPoBMAndnG/Bw3YJvPVuEm42K51F1omdo1QPueJbbgMk7DyqmZgvEiB4shjNqhRWseMAJQf5MEx/GA/PzJ1k3iZXUnnk6kB7it6joPzRiTMTMsI5pSxUtbdq3pbyAoccR+nZnL1UdOiwRdWAI1vNnExj1rPYTkEyJd0VT3d5lL5sMILNMCOKI1XVfzQ+2dSW2zya2sJBXy0WleCcNTLgStmMlSLLahPxGHyoNwdkxCH5BaRBmuW8ia/Iu2/Jxd/qG4RAfGNmuwAow7j1O88KlE3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6666004)(478600001)(31696002)(6512007)(2616005)(86362001)(53546011)(31686004)(6486002)(38100700002)(26005)(6506007)(8936002)(8676002)(54906003)(66556008)(6636002)(44832011)(2906002)(83380400001)(5660300002)(4326008)(316002)(41300700001)(66476007)(36756003)(110136005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0tPbWg5d1g0dldScWptTEd3NmltRUV4NVZBVTRjcG82ZzVSTEZEYjB1NHZT?=
 =?utf-8?B?YTI1Ry8zd2x5OTE1c0V1ZnF2WmJ6TEgyYnR6M1hhaHRRNkNrcTdTT0VwS0RG?=
 =?utf-8?B?Q1RzUURnOUFhZUdQRlhuS0prelpXOGx5N0VFVHBIQ2ZLdU9ZUjM1d1pMNHFO?=
 =?utf-8?B?Y1U3UDhhYk40RURlMnJVSWZUSFJBRW1tS3VxbUpIYjBPZ1JUUDA0NFlBUm9F?=
 =?utf-8?B?d243STRVb0xRYVl0TUlTcDdKSm1rRTN2dzRPcHF1UWl3S1Q2cmJIdjljTjdS?=
 =?utf-8?B?dGhRQ2g1YTZDZ2JQOXJ5eGJaM1l0V2VzY0tKa0VKQkpOa0dZcDZVTkNUK3lt?=
 =?utf-8?B?dE92N1VjN21FWEhrdHVVb1ZvNGlIdXN6R24rV3VFdnFKc0tWNzlIdk5YaTJK?=
 =?utf-8?B?RWRQWGhwcFFlbnNjM0tTemhOaXNMdlFUNXh5bXNTWlZ4VisyMGFWbE0yMTBN?=
 =?utf-8?B?M3JhbFVNdWJ4c0xIZENHeWhCWURtR0ZpT2VBbVY0ZEFTMHVKbVN3QUpubytT?=
 =?utf-8?B?cmRIZ1ZrVmE1MGkzRTA1N3l0ZXc2NElIancwc1ZxZDMxQXVPQW1TMGVJTGxZ?=
 =?utf-8?B?M3VxamttM2tLdDRhVFRhTExsRVczeS9XOEJlQy95NE1MTGhaRkU1QU1BRXND?=
 =?utf-8?B?ZDVxcmFtc25xVFJKWFpsK0M1aXV6Y0tQQ3I1QXNkaC9OWXlTYVg0SmQ2UVA4?=
 =?utf-8?B?ZHFiVmZ6ZGdTU0Q2cjl0aDRDK2dqK2ZzUHQ2dHdBR0NCeE81Wk5OU3ZpUXd3?=
 =?utf-8?B?TGwva3poTTdxTTQzOG1qdG1mYXdReU1tNnhOemlBZEU2Y0lFeDF3azhCbHZX?=
 =?utf-8?B?REdRWUgwN1NxOGRuQlV6UFBiZVVMWFZiSjhHV1F4N0xvOCt3bXFFLy84UURj?=
 =?utf-8?B?cUR4OUdjV20yWHVSOW5HQmZPQldpblZ0RnhoUTZqb2hVSnhBYXozRVNvWDhM?=
 =?utf-8?B?emZLM2N0cmt6NFFqUWJmNFlYRzJiZUwxcE5WQW5naFF0ZXZmODVBbUttaDNi?=
 =?utf-8?B?RXRTUlg5RVhoZWQyVjVLTlVDakpPY2s3SlNIQlBqQjNhbEZtNGZ5bzd1dEE3?=
 =?utf-8?B?eUZNSTRzcERlMHgrQjFPN3h5UDJUMmczMjh0RW1uandEc1dGa2JQSEhuaEJB?=
 =?utf-8?B?YURxZE5CcmFWM0w3ekpGVTk4cUR1Z1JCNVBxWVMwZGR4aFBVdjdJYlFnODVK?=
 =?utf-8?B?ZlVlWkdBMnJqOXRLUXlLUHl1UDg0dFJtQ0pJSjh4VUQ5dVNIQk1aTTBpalJL?=
 =?utf-8?B?UGV0NndScTMxYldkWFgzVHQxR21oQjZCcCt4WG55SWw0Q21oOG5aYXpiNWk0?=
 =?utf-8?B?QnQ4OHcrWWtBYUE3V1hZZ05GU2VBdzFwOE5HejZjQ085RFRpdkRBb0QzaEdq?=
 =?utf-8?B?bnFaaTA2VjdkUEw3YjRYQVRuTnBpcHRUd1RVZ2VnZDVFV1FDYWNYOWxuWmU2?=
 =?utf-8?B?MkVOK0hiazFSUXNWZlU5TzhYNERsV3JrSmhNQXpLVVRpZ0Q3UG0zRDJtR1Ru?=
 =?utf-8?B?dnBNQzBmalFkQ3lhcXRHNzgrSlErTzkzSkhXTmhUTy9NZGpJTjhPc1U0dU1h?=
 =?utf-8?B?d1RhS3VYeWhLcjZvK2hxOE11YWxNaVZycWg5VEdSNDFCQ1QzYTc3b1prVVZW?=
 =?utf-8?B?MVdLeXJaZy96K1lnVjRsaURUM3dVdGkzVGR5R0F0SkNQZmU5RXMzM3hQQWxC?=
 =?utf-8?B?YWF6ckNyWlIxZ3prM2QrY3E5TFhZRXFDNUNEQlJNQVBIdTZLNnNTTFV4WGJz?=
 =?utf-8?B?VU5FanNPbUZwOXNOL245WjJIcGJoaVYvNTlvVmF3M1lOTTYwSlUrMml1eFpy?=
 =?utf-8?B?cE9qWUxycHJkS2QvN0FHYUdQWHBQdG54akJ5Z3ROZnlpcmxCbWZsV3NwZmUr?=
 =?utf-8?B?Z1hUMVpERTlra2FNSVlnclZSMWVRcmYxRnh2aGFYbXdsUzZBVWxXckg1anM2?=
 =?utf-8?B?cnR6WjRjVXlpRmdqcm1oM0ZYdnJ4WDBLSkdRVDlaYWl5Q0g2eGtHZVZFK2FJ?=
 =?utf-8?B?RmZ2SHJqRmZOcU9KejNlVE5BcExlZEtPK1NGa2lSZkE4MWtaT0hnSU8yaDJy?=
 =?utf-8?B?TmRQWWorNXJ4QTJPN2NNOUR4OVNJOWM0UDlOeitKdTliNnlQa0JwYnlYSjlT?=
 =?utf-8?Q?L6HF6+40cI1bqUvjLxQWQRJ6d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5cd965-b442-43fa-f4d0-08dc299280cf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 17:13:58.4704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIiJ4TV7SYNGlBpGuvw87ZfiD51TzYZ+KiFZB5zOwPpPTDVUDMAK2dW9d2V2YvtY6vX6t6udMf72vmKNdNDgyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5285
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

On 2/9/24 08:02, Dan Carpenter wrote:
> These ANDs should be ORs or it will lead to a NULL dereference.
> 
> Fixes: fb5a3d037082 ("drm/amd/display: Add NULL test for 'timing generator' in 'dcn21_set_pipe()'")
> Fixes: 886571d217d7 ("drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
> index 5c7f380a84f9..7252f5f781f0 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
> @@ -211,7 +211,7 @@ void dcn21_set_pipe(struct pipe_ctx *pipe_ctx)
>   	struct dmcu *dmcu = pipe_ctx->stream->ctx->dc->res_pool->dmcu;
>   	uint32_t otg_inst;
>   
> -	if (!abm && !tg && !panel_cntl)
> +	if (!abm || !tg || !panel_cntl)
>   		return;
>   
>   	otg_inst = tg->inst;
> @@ -245,7 +245,7 @@ bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
>   	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
>   	uint32_t otg_inst;
>   
> -	if (!abm && !tg && !panel_cntl)
> +	if (!abm || !tg || !panel_cntl)
>   		return false;
>   
>   	otg_inst = tg->inst;
-- 
Hamza

