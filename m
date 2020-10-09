Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB1A28833F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82546EC48;
	Fri,  9 Oct 2020 07:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860216EC48;
 Fri,  9 Oct 2020 07:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJTXu+gint1xiFyAUsRyhqn8HlyGyup4dvYpBE66K9axSG1sHxhPfj84nCeD/RtNdXqKAbCisBUfFto1dkGvvDSYHENhfk4fc6ZbHzlTbhilOOXPfDd44whz3dk067sCtIwM8KavFC88tbMK3b6XXCzuGLvx3cehn+zH4Ak0Ax1yvzUn6j5PMgsY8WpWolgDgxwue8LiPfemkcPkpdCnQKM5Lylh75/wUZy+rfDNg6AewT1GkEDV72ivE9Vpaw/87jtXcuDfI/lBIhRWpl0JsTwuwVtJ1mgJHnX4gj7ND6gfMep//eKchlXiYjnEj8uE/2US5R+eejm/jPz5WM7QnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7ZcAvrWCEcCvvkYm0YgUdCEInjoNPlw+tZLJBFu96I=;
 b=nY4DWLeVf0Prp+EErl8begqO9HQ3wQpQ2Lp/86eglgU9DlggUHEkhEXY9mp+wL0DYFfZIrW+XSLYcQv0Pn/la9y5fcF2it7jF8YqEYqdX03o8iVIT4ch6xMKPspIpemu4v5a3aGPQOf+5E5JoA8Htr5BdpP6P8hqoFjeeFSpEo1nQclMX1JIyWa3hLMxwDvZXrDFh6T6DscURbKV65rT7GcKuK0dsbOJ/sMf+ooKzXDiUiZup2AGvbt7940bKbOCdR0LqWxEBd3zNNTQDeG407SCc7W/vS2uwMyRKyOUPLEhl1vLdETXSkaGDPkzZaY7Nzr138AwlV3godf3LaJO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7ZcAvrWCEcCvvkYm0YgUdCEInjoNPlw+tZLJBFu96I=;
 b=B9qiLEe4h3M7cuvXq5SqqGxcXkpp5nQeTKNvUTt/pn77q8WLHPGRvb2CiyNwaTHSHS9GSV0S/P9PzV6LPDzJwhK5qPeWXNvPP8eqe1Gs3Icdbz6AXQdxj7YynHHL3RktiPfn1F2h8jOpIgucuToMJkSMcDnhTSn3frGNQYp2IlM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Fri, 9 Oct
 2020 07:08:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 07:08:57 +0000
Subject: Re: [PATCH][next] amd/amdgpu_ctx: Use struct_size() helper and
 kmalloc()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20201008143450.GA23077@embeddedor>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4fe00048-2612-39f3-29bb-c9424000f836@amd.com>
Date: Fri, 9 Oct 2020 09:08:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201008143450.GA23077@embeddedor>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:205:1::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:205:1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.11 via Frontend Transport; Fri, 9 Oct 2020 07:08:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48de9772-3e19-4f27-2ee3-08d86c223081
X-MS-TrafficTypeDiagnostic: MN2PR12MB4343:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB434398A7D59E7FFAD587B89083080@MN2PR12MB4343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9KKUAjjaBeLmK7DX++LtH8H/Fg1aCALrwV3tnqhuY+4Dzjf9DCDMWfobpPcFnnNaaa+HwSKA9qrSRE8RCTKKimTKI9TRISlzPKXMtjK6KvM6GVql2LVohwiIFW1IKAZrBI1hdEkbupv4AMMiIObcKeNeRlEazeKJqK/HN3xWYmnFKbXGqLqsQDGpD2tQMC2BZPDpCw6Mme5E3BukDTyXQ/MVE7x2fsHYTaYSA0nEyv/faeJ95Um8Ihsd5yUVkNDF+WhD5qJG4Rg2eKJ+MooCtnoION8eheXxMrwtP709xthaydUw47DRdcKEwtrCY3rIIn1oy16t3sQ8lW4FJxnRyKLgDNHbFY/TDUvj3X7ce7CQZZSwjZ+qgLLNQxjWCwun
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(31696002)(31686004)(6486002)(66476007)(66946007)(86362001)(66556008)(478600001)(186003)(8936002)(16526019)(316002)(4326008)(2906002)(5660300002)(6666004)(83380400001)(52116002)(110136005)(2616005)(8676002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: aD8ZcQyF0kZRS01i2gADf/J1/Ny7wRn40YiWyZPzNMS9DP+GTxXPQvjw33qqB1fjgOLzy82v1eRKIaP5GY4gn2S6VAswXG8FTh+RsAX7d62BVf87u7LzP3+7AXfEkr1CDuWwqqgxzaI1OylamAu+ucb9suZjoSvjRgiECYy6J5KkFcuZbUToMJWxoFZegSaJ+yKXThqGBT8QPIEbGyubCDE7ydA9NNhAN6wbeaUESkPPSa/qx8LP8F35OAENyOOp6CXzelWLPvKtYVk6FnYw8PPZuQIOiXUKhXMOsjcNCPNfE6B9bUuT4G3/0TJouWZVZsojQzWVclxnAS7tbb96qN9CHCBYSgMMEL0l+pUoAjLZr2DFx0R28yEuaIZnbJPd/VCyQcpFEWg9Jt0W8DHrPazXGfRa0U4M22bkL77pahSuzgdRw5bV7cOhK7QbhvphM5MSe0puVhpqtvwdUq05pxsYp0Ue/ofFAfJKeEBN4i0wKco2XwKgQyp60ApOgKubkN3CFtXXXBu/ivnpGhrnWZ0XI65VmIT/kMEjlDrO3R8P809jEN/AUH+WWMQNivhcVHkuuoMuc9EWmlgE6x9unzjnMIrn3+90R4xNlH7SZbs96GzCnUoEItNeM7rW6/CFmT0RioHc20afQ6QIiVB6H1RcDdtOzbhY/UL9r9ruenAv/7z6w2DIjKXAhS9tWUs0N/Mlz21yNGRQjO3cIbLWCQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48de9772-3e19-4f27-2ee3-08d86c223081
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 07:08:57.3664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny92WiB4SbLVBejhIBEOUB6DQJoC2zZTVzPBCAsPPpK7IZKIjnj6pDlnTdYI53b1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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
Cc: linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.10.20 um 16:34 schrieb Gustavo A. R. Silva:
> Make use of the new struct_size() helper instead of the offsetof() idiom.
> Also, use kmalloc() instead of kcalloc().
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index c80d8339f58c..5be125f3b92a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -100,7 +100,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>   	enum drm_sched_priority priority;
>   	int r;
>   
> -	entity = kcalloc(1, offsetof(typeof(*entity), fences[amdgpu_sched_jobs]),
> +	entity = kmalloc(struct_size(entity, fences, amdgpu_sched_jobs),

NAK. You could use kzalloc() here, but kmalloc won't zero initialize the 
memory which could result in unforeseen consequences.

Christian.

>   			 GFP_KERNEL);
>   	if (!entity)
>   		return  -ENOMEM;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
