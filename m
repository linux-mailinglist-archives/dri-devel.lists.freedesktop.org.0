Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B344AD70
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 13:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A096E3DF;
	Tue,  9 Nov 2021 12:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36B089CF5;
 Tue,  9 Nov 2021 12:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Doj4zcv9wvyWUDu33TUla2pIgKrEEYSr+R+hxIHTNX0OM23B0nqeyjIK3FR71MSgDwxnMpUK9KR2q0QOn8wv6qbhpoqCX+dRGPdNPBga3lHnL3qcRowdQRKrFx+26jxfm1ZseP6cyxV2m3l6DBzm+EPY0f1U23IF+coBcuqfE3foMdIAGyLIl9qTWcNcDWCGtd6LYT2C8lk6+D3Y8y3wDcjrv6XXbfOU1p0Ptv75D8RXVNtk3BbePTGvS/s8nxw47iltGxNxbA/dMh/RFD1u6wgZE8zU+WwndKD/BZW1CLzqsWkbJ5Mhc+/Rz5rveglYq+fbPgBDwMkYA6EF0N1EZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TshuJvtSSzy7AqYBcd0Gnkz48BqevtVpG/VX8DvUq4A=;
 b=f65V9prKsainy3Xay6keB3FfEWsH8dEx1E/CqmH4BccehR9ycdzRYnRyErwagBZ+TLJ2pyevhZEV0rxUhv3fyS25DXHGvzHsGXlTLDc7aPCKaV7vfn1uS3Wi0KSgBzg3N1PZVbKfLDF6+hLdoFdBH1wkK19ZrDxnjSWZaDkVZD7I00ojUQOnMTRQGjuxO3ADbOc33p+DNJMZfVXrrbGuPYyJ8Fz/UF96aB6MhkRoJIcD2RMfBRH0TON237WMXXNDBzZnsQ2ELIN1CjRxTZ23HOf1G1tthz1XGP3taFgct94DIxOzOW3ehFMYoOj6spsduyNJDcr8paDxFWH47vA2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TshuJvtSSzy7AqYBcd0Gnkz48BqevtVpG/VX8DvUq4A=;
 b=1vw8SO78AMhWZob26OOwazNPbvGVdY4r3QwP1xeI5ktlXFSRFn2BgnniAZhic10m9H0WZ20AwQQzEtZYJ3QDY8UxjOEbGa1x38OMOToK9pcULflv7TR662Ou0s7AuMEvm7aswDtFun/SZjFetBDqqYAkDVcsqnlgPdPe92u6++0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1677.namprd12.prod.outlook.com
 (2603:10b6:301:11::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 12:20:58 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 12:20:57 +0000
Subject: Re: [PATCH] drm/ttm: Put BO in its memory manager's lru list
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20211109111954.41968-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <da46c607-1a3c-7ea9-92ef-78a2b60d38c9@amd.com>
Date: Tue, 9 Nov 2021 13:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211109111954.41968-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM9P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::7) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (79.194.4.163) by
 AM9P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 9 Nov 2021 12:20:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b0c7f52-a1d0-4e35-b264-08d9a37b6212
X-MS-TrafficTypeDiagnostic: MWHPR12MB1677:
X-Microsoft-Antispam-PRVS: <MWHPR12MB167709A70F5E05119601A55F83929@MWHPR12MB1677.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yc6sMhpBl/1QQjd1LE1uc8uTz/JIL7nDgNPLAGnKPIcbMpaKyvsGANTHifPKm02ZCi8hnmSNDTwWbg4x6xxqnj7Rg8NkFj/dtfFAHd2tSpkAolgofvA2X4LkcIUK9rOzQBm81sJzmm2Uj7NSrfiptsmILyTb7nJyQaORZXRUdHa+l5We9uI+uwU58exybiqhslR+wNdd/7Tl9D3smiu7lh7Y8T9zYbIxcaHgDex0GZ4LbtFZFMuCccTw18MwvVnlg7+ZjBVXzB+y1RA+hA2iwTKZtlo2EaadgbFrCie9Xwus3bmtrQLr5vgbg7URYjR6q7Zjc6M+PKoQ8bx1f52ZVeDtc4GksEp7k0qVREn9LNrCayHmsF8bEMWyyhyfovf3v9IC0+vEr4ZW7z+I7Vu/7wGKFWKsgpiuW4rQvM6zMPyZ2hTzhib/YkqjFmtDtsnIwP7HOt8YijvdG+5PUQ/W/uC94zRXOH/24Vf2cXcFReLd4azEMA1UVL1+ueZOnOO4dvwqMyjC1k6jjgx+Ud8EiGgcbtXTVg6A+0C4ads6ZC8ASPrKx6ZOo495jEWnCYUzIScp60yOaTPzA2+aoGSVjWUogYDeQgdNxfkkPhqc3Qe/6K8itows6P7bLUtwwVQs3if4WZxEgrglV7RppXm2zVLAr3/kLx2Ut7u4pZrQIz6JkPbYhUq2znPqjTNLsDrFqnmKp/MoXP3gEMbP3hMBgpNJ2Rcez8N+N/S9Ws3ntsYbhvswLaQWZbirJ+M+P2tC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(31686004)(83380400001)(316002)(508600001)(4744005)(66556008)(6666004)(66574015)(5660300002)(36756003)(450100002)(2906002)(186003)(956004)(38100700002)(2616005)(31696002)(86362001)(6486002)(66946007)(66476007)(8676002)(4326008)(16576012)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2t4emUreG5peEtPM3FGRkxTRE8rNzJoSEdCdVJmMlYwQlZjeiswcUFCUStZ?=
 =?utf-8?B?QzdESnZrSGpKZmlIeVBRZFg2RlVQcFJRWVYyQ3hxUVZRdmlIazhOYjV0cXA3?=
 =?utf-8?B?eFR5YldPQjJ0T29kVFBic1drRDFJRmpFb3VLV1ZsWWJnK1FjZVRhNFlQNzl5?=
 =?utf-8?B?a25vQXY4RUY1UDFoOFhKbTFnSlRRczRIR1FlYmRyVzNYZ1ZGc2J0MHJJaGhn?=
 =?utf-8?B?TlVwSGdSbVhoTFFEUTZxZDRDdndxKy9ZK2piSDlEMDZMeGpyMFlHNk5hc25r?=
 =?utf-8?B?V3F5aFpmMUY2bUxQaWlWOVBqM2Z5U1FZK0RscGhqdmFLU3NiZm9xSnh6OE5i?=
 =?utf-8?B?N1VGaW1YTDk0KzVLenFjVWFscmx1UnJ3QnNoQ2J4eElWcSs4Rkt5Ly9icWd6?=
 =?utf-8?B?OHVacVRrNi9WWUtlRkJLelVvYnlEN1ZNc1JZWkxUQ3gyRm1iMmVjNkpxUi9p?=
 =?utf-8?B?OElrczVZcnA1WnVyeW1kUjB4Rnk1TXJtNVlzM3AzQVdzaGRVSURjajRqeXhz?=
 =?utf-8?B?RDlkTk9LdlFkQ0xBNFhjN3drZXpWTUxnTndEZ2lsNFM2aDhQeW92bU03UHNx?=
 =?utf-8?B?SUl1ZWorcU4zUytySVBuemxVK2NCc0Y5aW41WC9NYURZcitrVTdDeWhsbGdC?=
 =?utf-8?B?dzMyTkkrSzhQZTNWVWNhUElVeVJKUnNWM240bHVHZ21ac1RMUEYzVy92dGhB?=
 =?utf-8?B?SzUwclFZR0lRMWtHRGt2ZEY5c2t3VzBYSmxhaVhCb1ZWdEoxWXVWQVk1aHRO?=
 =?utf-8?B?eERIMVB2N1EycTFsalRXVmRPT244V0hpMTZNQmNHeVRnL0V2WjM2ZEdGRDJG?=
 =?utf-8?B?MFA3cGE3N3I4T2ZQSFhjVkR5MFJxdHpHU3hjREh6U0Nnd2IxdHVHRVZuRFMw?=
 =?utf-8?B?NDRlR2x2Sk84TGp0aGFuNjFVS3l4MnVuZ2tmTlFNR0JRYU5FTDBuMEdYTHVM?=
 =?utf-8?B?cmsxSEcybGpHR2dIdVhJN2VIeXFpMFhFZ2ZOeERqNi9VeVI0QWw4aU1lL2cx?=
 =?utf-8?B?TFN6TkZ2aWU5VWJqdlZJa2NCQnpJbWNFN21OU2JSNlRDMVFNWHVLaXFlL3RZ?=
 =?utf-8?B?cWx3UWhCajY1QzhLdXdJakNVMi9mTSsxZ2RMVStvYWxmK0YrU3dOWGl5OEh2?=
 =?utf-8?B?QktvbVBtUFVPb2FOMVFlS2RVajdhbWJJQ2l2Y2xuYjZjY1V5cVNJVmNjYWlD?=
 =?utf-8?B?eTRCQ05rbkFqb1JkZ0pVMWNScE5NaW1jOGJKVXQ5WXNHM2x1cnJZVFp3WENL?=
 =?utf-8?B?eUt3ak5xUkhEdVZ6UFhyNURZYzJLVVhZbDdDSzljYVBQQjlWeG5QeG9uWjNV?=
 =?utf-8?B?VExLVXd2K1QraVBPcm1rc1JwbmQ4NWhqRVhwdmFKN2dlR1VYYXVRazZTZzJC?=
 =?utf-8?B?ZnhvYVlKRlJoUmxscTZOL0NDb3hNekdaMktsTzA0RTRVbXh0ZG4wRXRadnNJ?=
 =?utf-8?B?djAydDd1ZTFLRUNwYWhXTzh3RGV0SURxTkxpY0xBaFZ0SDFiOENaekNVakxl?=
 =?utf-8?B?YlRCSVhEYjFoN3M5N0pNemZaak05eE9aNitJbkFtNjVxdDFOUnhQb0IzZGlG?=
 =?utf-8?B?Q3p4TzBzaEJsMno2Y2M3ckFRZGI4NkVwdWtnRytPRjlaTlRZZUxldjFwRzNX?=
 =?utf-8?B?cElNQWhVaWxCSUpRY2RBN0NmenJzcEQ0U2JJNTVud3BJeTBvUk5VYjhabVcz?=
 =?utf-8?B?NlZhWG1ndnFRSWhCdlhzdEFYdDdOSmhrZ0g5ekNsVTlDYkhtQnlGbU12OXpj?=
 =?utf-8?B?RTZhaXlaYW04T0thb3UvNjgvc3Z3SHJLNTRHU1U0RlJwWU1qcVI5ZHdXK2tU?=
 =?utf-8?B?clUrcHlodzgveFlGRzdJRHl2VzYvVHdINUlKVEgxTkRpYjJpbW8vTjQzRWVC?=
 =?utf-8?B?VW4weG0xQTRNUzZLZkkzSmlNaVNBRlhjUWUwVUFvRmxhaWxjR0lVSk1BUkw1?=
 =?utf-8?B?YXYzRWlrVzhWUVlQZkczMWRybnl5dExQa0daQ0QxTVBqclQ2YzBQVWViQlRY?=
 =?utf-8?B?RmRWNzhSZlJjdjBaS0FaT3hGa3U3RDBiTTNqMThxL0MrRDlkdXFGSXVjUXpq?=
 =?utf-8?B?dXV1WXFNWmRySE9wTW4zamFlYVZqUTMveks0MWlzdEtuR3JyeXNIR2lqWkhk?=
 =?utf-8?Q?iZQ0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0c7f52-a1d0-4e35-b264-08d9a37b6212
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 12:20:57.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISCIz8U/xUH+fmK1f6jZbqv9Vzay3T7xeazRRg4yjP45grBjWKskXTFoJzaJTz2T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1677
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.11.21 um 12:19 schrieb xinhui pan:
> After we move BO to a new memory region, we should put it to
> the new memory manager's lru list regardless we unlock the resv or not.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Interesting find, did you trigger that somehow or did you just stumbled 
over it by reading the code?

Patch is Reviewed-by: Christian König <christian.koenig@amd.com>, I will 
pick that up for drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f1367107925b..e307004f0b28 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -701,6 +701,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   	ret = ttm_bo_evict(bo, ctx);
>   	if (locked)
>   		ttm_bo_unreserve(bo);
> +	else
> +		ttm_bo_move_to_lru_tail_unlocked(bo);
>   
>   	ttm_bo_put(bo);
>   	return ret;

