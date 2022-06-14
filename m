Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82054B079
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CC410E48A;
	Tue, 14 Jun 2022 12:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACC010E013
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D75exSdsX8HQGkHd6exYZqB8Oy8y0+9VrkZmWCQ6NhKaA4K/qQqX8C4ZRcjcwnpxyxsKPayMJbpin2AQM7+q3OvsSm9UllZ2xReksHllNYmyUzAyhxjMit5kWn2SopoxSl87GHomcAWsyH9Lc2wfDFA3GFTP3jXmfBQvBCE4/xfiVZW7Ws6wFVWqWiR21hSjLBp83wga1GWSIgMVmtulZ+89j+g6ENwl9YcHKrhAkpmSftbA1Bp4xYgLhfB4PVwKVJ3esz60hkCBCwfTfJwDEstfcNA0kiKjVJfmkVk3GRuwcc/kbPo1Stb1BHLhb5g/dhvyUEx2OAiZvr1UJzi00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+d8EODgR471aO0yTTwLu9KPNZ28xKQLg9aTNgFATDU=;
 b=eYt5bMkn5rwAhmpH7fnQWCA1qc463JhxpvFazO78XJ/jcZh0YRZOSVHGhtkWME2j50UzfdcCBh3ptdhoFoE995DkQWRADGq+uXHMPEf1PiOSpUpUb/aG0v6K/i8S/jS7s441mjeEv368jCPkSOZuI5hPhG90W1bxgNAhmgYyaUjesS/sS2ZleAk3f16P+kj00cf5ib9OzcdMqQQyzH202OCOacfy953sfDL9C9h0T0ixYTxr8lhgs3l8KWzta3nXEAoYWRFk1/wOuI3vhBSXLitS65wP7oSFgK+4VYoP+bWHU6ODzyJOwju49VJ+oHBWNSyzzEbXmBbeWIgbsSOH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+d8EODgR471aO0yTTwLu9KPNZ28xKQLg9aTNgFATDU=;
 b=cutPXO+u5VlXQMWFieT5e4NAbcW+fVeiD2Ba/7+NI6nwWLorLvoNYR87/6Z3IPYmvR4NkJpTrVNUWGRbru8LlUCQAjj2jEMJMP3hJpTEtihis9DhlDNYJYU5Xpog9V386e0rRaQC304h0RJ+4NVbck0xmTxzLlh0OwCQbVBayxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4922.namprd12.prod.outlook.com (2603:10b6:610:65::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 12:24:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 12:24:00 +0000
Message-ID: <d5c12c3f-ec0e-f624-b649-e75fbdf062da@amd.com>
Date: Tue, 14 Jun 2022 14:23:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm: fix an error code in
 drm_syncobj_transfer_to_timeline()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <YqhG3ozn3cSazbrO@kili>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YqhG3ozn3cSazbrO@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0108.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::49) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c61ecad-b884-456f-c6b5-08da4e00c313
X-MS-TrafficTypeDiagnostic: CH2PR12MB4922:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4922AD6F578FADEAC440860E83AA9@CH2PR12MB4922.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcyIz6uCZhYr+4vFeWVeeu4uGJf8Hlpo9L5/sNJgEvMlhVehR+v/+0Lwe+D5lXnIoi88UEPkdM7cc1pUEkDGWEaYbmFeMhbW0dLDNBssQ7viVf2TWA/iG/4umxAyV+mIEQRQggqsQKg9vj6jIYqucz8POFaCn6gSt7FSLCVtqb36maaTHkBcR69e+MmcUKbIA4Vq/L041tPRgIrTSuv+Ru3iabO9wFfcJUP9jsD/OJdd/FxoOZjpilH6+PWCridJqmzncdojDgtiC2hyilX/T2w8SNMqjEh12yj/gzL5hcr9mNK2fkwb+tPIN+uYw247isY9Wl1keMjZBwMz6kZMP1R+hCK3TqUb2IAW0o6UPQpELgJRfJxSa01Dc/EB/bGkZaTx2g9MMEwriNyEOlW0ws5exfBFjn/+63CWr3y1RxmBx9STBrs/x2M4OGP+nNQBHCrrs3pq2Ycb2yiOOh1UP04sfbR9CZ+Y2FFDqJq3YVGo/v/UvHYEKmBw24jBIO3qhAYop/g67gOP6RAKle5TWarAKU44hGNglmKAFhRK4caJnxzsXNKqE0Afha50smK2zgdKQPhUTWfkoDPb7cVoJueE4MB8vjGZF23BY+CsgaRFAdg8n1DPYAgJM9BRud402PhAGFrVQC/g3x5Ib1sBr5/G0lhbQihIRIG6AF+EPLAngwMNajqo2Ny92rUpL311kmsgX70VwYvLkpXdN3Nz5n6InCX2oJwVSuv/FC/MxjZU4JGUd9BQozuB5yDzlUE5UaLl+8v+6EreCncjHU4+Lk2enHqdaCicpJJyDDdbtPsfBvSRIZ9gjvYyfRHqCXhY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(6666004)(31696002)(38100700002)(86362001)(966005)(8936002)(6486002)(5660300002)(2616005)(508600001)(110136005)(54906003)(4326008)(66946007)(8676002)(66476007)(316002)(66556008)(2906002)(83380400001)(36756003)(31686004)(186003)(6506007)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RsMTQ3SVNHSUtIaGZ3a2h3Mkp3L3hPc2dJaStTMTVlZlVyQnRPVGFWQ09u?=
 =?utf-8?B?RTB6b2FmMTM4QjRZbDBLZ3B5TTR5eDdtUHdFTmVFME4zQmoyUzliQ1dOSm5I?=
 =?utf-8?B?WStSLzBuTVM4bUFuVHN3cnBRTHh2bStUSnJ6OU1Nd3hpWEhxRHArWFBKNlBu?=
 =?utf-8?B?a2lsWEVDQTJ4WWZFd3ZoNWZFc3R3cGJVZC9zNVNKc3lsYXVwMlB4R1ZpbEFm?=
 =?utf-8?B?M0ZUdTlJVjJ4VUMrbDdrMDYxdjU5dUZiemU1cHdkQTFRNWd3WXlDald1a25z?=
 =?utf-8?B?K0prMzgxbFROamVLN1VyVHBoelRZUm9VVk9CZXFyVFlacnR2MjVOYkoydnAv?=
 =?utf-8?B?S3luaHFEVUpOWk5aSitzTnVJaWt2ZTcrQ1VZbnE1N01TY1JZT2s3RUFRc01H?=
 =?utf-8?B?anNIMFRKRXdWTFpxSUVHZysrUy8xYkhhMmlmYjVjNTNRejhHRDZuQVZEb29H?=
 =?utf-8?B?TlpTVkxqSUpLdyt2Tk45MGNwL2FxeGxpQTcyc2dlOEFLeEhUTDN2QzUwZVFR?=
 =?utf-8?B?NHRFZys4UXNUanlRTWQ2YXk3NmUyS24vMCtMQ3VJRWE5WGJub2FCb1BIUkZW?=
 =?utf-8?B?OFhXTExBUmtmUE9PVWFUelBLWlkvL0kxeFFFRGpLaHRzdFF1dEZUcWJkYkR6?=
 =?utf-8?B?OXFvZXhMRGpzYU44QkJ5eC9FNkdrREdFaXBmNlRjRlV2a05TQWNNMVZKYkE1?=
 =?utf-8?B?OXNESzZIcmRXbWFCRXpOdkpkVEJmK1ZUdnhIZlpZb2pSdGpTMEFvdGI1TW8v?=
 =?utf-8?B?T0FlUktaUlcyY0JSVWFpTUkxbldxRU1QNUJrbXpySkh4V1ZhQ1pBYWo3N2JH?=
 =?utf-8?B?WFZ2ZjJqR2lLdnFGbGFlUno3VnZWQWVaVHBaZFp1TE5sQ0pNM085dzY5Rmt0?=
 =?utf-8?B?M3M1L3krNVJGTEtvbnh2WW92UFVQMEZ5MmNYUkpnZHpYd2JjUno4VGQyVnE2?=
 =?utf-8?B?eTFVYjM5cjhveTAxcm84TkkvRmZQNDNXOTJQNmJ2NSszaHhuSkh3a0VINTFK?=
 =?utf-8?B?TEtLSmlDay9tLzRrcGlPUVU2cy80WHBjSXNPSWh6dWVwZHBsWnBoeGlEWG9U?=
 =?utf-8?B?d05FRTZvM3JkTzRNL2p0T1pIYmd2NUltMlBIcW9tTllCUTBVaEpBcDMyZXNx?=
 =?utf-8?B?K0krVXM5anF4UGF4M3pRZy8rWDN1OC83L1ByamFiTHhITGJoNzNtRFdVUHZ5?=
 =?utf-8?B?eUlSQldOLzVoajE2Z0hSSHlBRFRPWUE0SUtacXZPbzNjRFdxd29aRkZVVnZw?=
 =?utf-8?B?Q3ZmRm9uekNrdk5pTExNM0t5VEZyVFk4cE90NGttdTJXZm9OUWcyUmVYaURn?=
 =?utf-8?B?QWNQaytHMXcrODFtVVFVQTlJcHREVStZSDZSdmtKUWkxRVJ1ZEhBOFlOOUpM?=
 =?utf-8?B?TlV0blFhblBhTzFUQVhwTGxFc2M3ck5pOVNPdUZIbVFvSkpzZjY2Sytnd1Nh?=
 =?utf-8?B?d2k2aFVKQkRBdFVpeU5iMnFyc1p4K1AxU2E0ZzRUVU1Ba3c2dUx1OHlXNUFx?=
 =?utf-8?B?NXFaTGVXalNwTmp6RXIrMkx0SmY2VmdYazdsQlZGSUcvMGZ4ODFxNkJsNjhh?=
 =?utf-8?B?WUtiTXdkRkErK2Rnb2RYR25QRTVzVlhxOE5yakNlRnBWUjU3YUFna0s0ZHQ1?=
 =?utf-8?B?c3hNRGI2RXhYcU1ETmpyUFYzcGtaT3ErRTgxVWh5NlFOVzRjQUkyOGxpdGFW?=
 =?utf-8?B?NDBYdFZKdDNVTDVOdFVFUTlaUjlUTC9zU2dCVVBIMHp2MzZGWklXS2k1Z1pa?=
 =?utf-8?B?VmtWTkxvZ1drWmcrRjlQcmpzRkRSYmloWEVNMTRJclFMQ3FVQVJPcnk5ekcv?=
 =?utf-8?B?QTlaU2JSY1VpMXB0TDh4UHUydUxRZm5yaUVCSmJLM29iTWpQeHF3elVveXUv?=
 =?utf-8?B?Z1FyTVZHeXRmaThjRldUcGdDMHRYM1F1dzJwSG54NXBJaWVvNkZwT0pHOTQ2?=
 =?utf-8?B?UTVIR3FyRkQxT3QvV2hoeS9SbFhPVG04QzJlMStKRElPem1hSTFMbmEvU2Vh?=
 =?utf-8?B?eWd6ZUNaUVE3L2drRjZwUGdLVldxNkNDb0pxV0ZIUG1sSUl4c2tyTlRqY0xh?=
 =?utf-8?B?ZnVPLzk0RDZTTjd4SWpXWjNVd2RyOFNzVkpOUjhYSHZqeVdYRFVQS1JIVEZE?=
 =?utf-8?B?d3AzekpmMVZKSURXb3A4dHNDc0pvZ3o0SHlveHJHUjlQM3Q3ZXk3UENPNEpn?=
 =?utf-8?B?ajBFZUFVbTNMQ1l6SCsrUTNHWnhLTFVLaXlXdUlQWng5eXI1L2tIeHV3d2dq?=
 =?utf-8?B?My9kdDNlUEVUQ3h2MkNtanNBOEJDMFZkL1lCdnBzSFlUWkhBUXloZ3h2eHNY?=
 =?utf-8?B?ZGlseDFRaHdwdTAvK0pjMStEV3U5V2FuMk1tRzdjUmRHSzZLS1c2cWF6eWlO?=
 =?utf-8?Q?Z8wOvS11erxflP6k7KiQX8YrIxcYsyi7VYO7YIj78qMLv?=
X-MS-Exchange-AntiSpam-MessageData-1: rVKXOPER/DE7RA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c61ecad-b884-456f-c6b5-08da4e00c313
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 12:24:00.8822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxAS0B0+DvYd+HJFpaXXqtY4wCEi0DZ/pnj4lDxybVawKL7rc4M2QWbkBQxoOQOP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4922
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.06.22 um 14:10 schrieb Dan Carpenter:
> Return -ENOMEM instead of success if dma_fence_unwrap_merge() fails.

You are to late Dan, that one was already reported and fixed 
https://lore.kernel.org/lkml/4845ad23-476c-97b9-9b3f-d8aaa9027d26@amd.com/T/

Interesting that now the automated checkers are racing on finding and 
fixing those things :)

Christian.

>
> Fixes: ec8d985ff26f ("drm: use dma_fence_unwrap_merge() in drm_syncobj")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index bbad9e4696e7..0c2be8360525 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -874,8 +874,10 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>   
>   	fence = dma_fence_unwrap_merge(tmp);
>   	dma_fence_put(tmp);
> -	if (!fence)
> +	if (!fence) {
> +		ret = -ENOMEM;
>   		goto err_put_timeline;
> +	}
>   
>   	chain = dma_fence_chain_alloc();
>   	if (!chain) {

