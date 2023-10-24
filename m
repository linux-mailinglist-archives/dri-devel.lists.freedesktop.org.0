Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364727D5872
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9212310E41E;
	Tue, 24 Oct 2023 16:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7782310E41E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 16:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhbyDnxM7R9XW67e2ij1POBjB7O2mDYtYcR0PP9OSq3vHHnHUD2FWK/UJBd++XqNrBaB35tUmBiGjHuRTpxStX6K98I2OiWDp8z5Oiy7T5omN/ro2+enE2NkNTBGVZHvXr5bHbMNY7JL2wJOAAaOj8slfv5H8KxN/x4X6ymd1qyw0Jpe5bFlfSv+Xu5U2SEbXwz4OS+6eCnlJl56sWpYvauH+VbdFJlaEMV9v2wYd+x/m2utOPQXqzMrq7hxvZ7yXWGKH79uotVzgvC0Z8IbEsX+c/rx/ghzor6E+FIWjt8mKynw7GDk5pPiqWFIk9Y0bs+yVh9qgSRcd2KiprZ2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdPxYLzGgeQdUW9fMmK+mbFWUIOAi2eljhoHpYDKTnw=;
 b=CFU/zGeDdZjvXjrjEN6yZJf6QWpHFy71+eTMvtr7LFXuLHu0oTplRWGDD8zDP1sHO4BBizXRtuC3VojsCPlAmeyxm2qjVlwLsFtjXmsz9gml1Ut0rzQN80X8+iyNmoB2kdlDTe78jpdfgbgSoqFX7lIAvIPqHjzwJ8xD3ZkyDMiK/Jn5aluHuBWr/4z4ZQ98850V5tqXhdfKGPc8mXdktIIVGz/emq9LfxEUAc2DZAIMZN6PzU7fSxq+tIEcq3EoZ4P0gBnxSRpzyeLPIGhzlGhyYPO2/FnghJNDakE5IM3hJFdXZMXZwF2P6VrgKSecJJTqrnNhk+Ovafqdz+XLew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdPxYLzGgeQdUW9fMmK+mbFWUIOAi2eljhoHpYDKTnw=;
 b=eQZYhqX8we1uAl99zQQKGeK1MDeTMy1ymwH9OHV97CEmPgjSWm1zK9mfxu1GMhQ+WyE+oj2uoqidalxms3N22HeR1Yw5zFD+cEQqiFkBfnBcdQ7DyGu5PPl7Y6MNW4pqICk56LLh3GS6ls/pNuftZe8hm1p0/j6ERr0ieB7GySM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SA3PR12MB7973.namprd12.prod.outlook.com (2603:10b6:806:305::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 16:33:26 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5588:7117:d54e:9466%6]) with mapi id 15.20.6907.028; Tue, 24 Oct 2023
 16:33:26 +0000
Message-ID: <16225a07-c0da-4970-b0a1-39831b1bf616@amd.com>
Date: Tue, 24 Oct 2023 12:33:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/client: Convert drm_client_buffer_addfb() to
 drm_mode_addfb2()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <4b84adfc686288714e69d0442d22f1259ff74903.1697379891.git.geert@linux-m68k.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <4b84adfc686288714e69d0442d22f1259ff74903.1697379891.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::13)
 To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SA3PR12MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 8404caf7-e4c9-4c4a-7a28-08dbd4aef293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tIkya6KMlpKTLxFdCEojdUF4P6Q6+TrQz+xCg3ao3aIy2O1QxAsgK2ulpDba+Ispx0u5xRPQiutU3txf29zGLDN/YM8/oRwqgYEYXEbfDrZmL/1S4hW/rQJj7aKtLJkAWG3scogrH8eDYmNvjoqEseShEYjuyzI5Y/Xxz7vslRxdN2HsWgYPuydmEEG/DrpkihnoTezA4llyJ8y6C//lH0NjWMXDJCKJQTweJGAYXTA3Kk9a25el2Xqhgfuo6X5Vr6QLNtecsDrg56w/koYvyw850be3k1NTUsJlsX32Yin+50l+4flmgR58nbxvaGwa636iCK5Nu0E8Beaeorb6z4dcWpixNO9+F0X02QQr9VtIHUS93h9fxskhK05+hWCe/AxBhLh1GErjZy3l1v2aqGSxRChqX5bGsBAA/Fpc3l+PPpUwxhqpjrCBwrgQg9YoMEyWjI9tLXTcxMi6kvjgVYUz2ghXPY8/4FoYSoCIFsuAR/KGc+wxiDuOfNfUsJ9/wunDYjqr3hlG4JRIWmioEocU4v6akDcv/OJMYRi3PVYlCocvy3Tcp5J7LoKCV2TwdOKDu/SjWai2H6qm8sdxgkbtUV8ar4AqecBCR5UGRPd6uIHK9VZkYBfAVVuf1J+no87Lzfj0+LU/26u8VpGodw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(44832011)(2906002)(38100700002)(110136005)(66476007)(66556008)(316002)(2616005)(6506007)(478600001)(6666004)(66946007)(26005)(53546011)(6486002)(83380400001)(6512007)(41300700001)(31696002)(36756003)(5660300002)(86362001)(4326008)(8936002)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG5XZVd0bCsyVkxHNE9KeTQ3QkdJdWdLYWlUMGxISG1NOUdHV3hVNGViL1dR?=
 =?utf-8?B?WU8wMGNZcHN2c2tDdVNrbjZaalZncjFLdG1yRXZYS01HeEhFTzQxUzRvVlVO?=
 =?utf-8?B?NERDQTBmMEZwdEk1bVozZEMvc2VZVlRVenZZQ3FPOFBuZmpUZVdvTWUvelJG?=
 =?utf-8?B?bFBGNWpyTk94eGEzQllnWC92b01ray81cWlweG9VNkZkRjdZbmhsNFdNTUx4?=
 =?utf-8?B?QndZNnhISUhLSzY0Mi9uY3ZBL0dqc2xGMG5UUGtudXU3b2RxVnUza1BOMlJF?=
 =?utf-8?B?dXR6SU94NC8vckFDb2JRYjI1M3lxSXByajc0QWFWL3lCQWhIaGMrV2ZOWlBm?=
 =?utf-8?B?K3dJTVk3WlJrdWh4cHMxOXJ1NHU3NGZpZGZvVjF5MVZwYVJFeHB3aFNkd3BT?=
 =?utf-8?B?VXlSOEdLTkRRU0dwbWFiY3FaMEFWcnlmWE9RVUoxODBMU25MNlkwNXJSL0tR?=
 =?utf-8?B?cFE5amtESGdoV3pydlJvTS9qTXhhZGxMdENGeXkxdTNMeUNwRFU5Umt0ZU11?=
 =?utf-8?B?RjNVVi9ROUxDeDdNYUdkTWg2Uzl6M3h2cEczN0p2ZTEzeDFMVjk2bVFlZlFV?=
 =?utf-8?B?NzhvMFlVUVVlZ1gwSE9uQnJMWmNxb3hLc0RQaktQaHJUZFFVOURlbktGY29B?=
 =?utf-8?B?YVBHVzhXQ1lxRHhaNTM2Q2JtRTRRMXJTRWtybjQ2Y2NLa05VcEVvY0d0ZnMw?=
 =?utf-8?B?YXIrS2JJN3YyM2J1dlBQaGNNUld3eEdub2Z6L2Z4djd0M1N3L3lYaDVrVzBq?=
 =?utf-8?B?RWllYWVzSGNpRGZMWDRvcVRVVmNnZFpJclk4VUxYbUNCamJQeUZpSVpqR3RX?=
 =?utf-8?B?NGJISEtJbFA4OTUzTU5EYWpoQVpqMXJZUi9MUVBRUTlzNlV4bnZUanhQT3p4?=
 =?utf-8?B?aHBvMFVjQy9NQk5WK1lGb1UwQm5VeDVsakJlQTY5MXlHdkdLZFIraTdnR3pk?=
 =?utf-8?B?UE93L2NDbk9LUXV6ZEtjZ2c4M3ZkT09vS3VxME9nV3Q1MWsxSVVWQnRLRjZy?=
 =?utf-8?B?WGJXbm5hKzhzYWdHYTRuc05obnZ5dFlFSGNPUW5xZTludjNLZjNHTTIxVEZk?=
 =?utf-8?B?SzRRTUZjRFVUMEk2bG5uL1l3dStqblpNNVBGb0hERURzb0QvcjFKQ0FnbDVz?=
 =?utf-8?B?RkdJWVBUQllBaW91WEVQa1BvRE5aR2R0ZElJTFVQZDZRcy9TVU5NYjNreXdP?=
 =?utf-8?B?Ry9LbTdaT2hzQTBpZVFVaFFvdXlmb3g1dlNydXFkZjhPT2VpUWFFd2E2aFRr?=
 =?utf-8?B?NkloR2JpQUVFV0wyN28zc21jdmowOWRBTWgrNXpOQkxNV05hL204S3h4R3Nh?=
 =?utf-8?B?ZGpTWDVpMW5za2dlSkhuNDZvalpqdTd2LzlYUjVDcjFUZGc1Y2xSSDUySFpS?=
 =?utf-8?B?MmVGM01uK1dMUktFdWdGSnBsVmkySXNDdVU3YTEvcDR1TFQ5WVNNQ1ZkZEg3?=
 =?utf-8?B?dzZvQnBvN3pEYWJFaDRCRktVL2tqNmgyeE83YWc2REJDZ0tlMG43Nkc1UzF2?=
 =?utf-8?B?Qi90ZG5qYkh6R1lRdS8yaVdPVmJsazdiUUI5eW5CVjN6TnNRSEJGR08zVW5a?=
 =?utf-8?B?bURtVkFRK1U4NXpEZksxMWF0ODRaR0Y2VnRRS0dxNDdabWxBZjhMMXl3YjRl?=
 =?utf-8?B?YnZQeUo5UE85Rk9PeVhha0lWb3VvY0kwVWgwcCtOWnQvb2YvZldMdGpSMTRK?=
 =?utf-8?B?dnNhaTBhemZNaFdYRlh0QVBuTVdtS3dreUNDYkRKdUVNUlRvSXlZWFRTQldl?=
 =?utf-8?B?QkVmOHN0SFI0WjdlOHdLVUZicUczWDJXR1ozbkt3dHdpS05JcjZJbURvWG1R?=
 =?utf-8?B?Z1pWaDdZUlZrcHBxL001TDIyREo5VUNpaGNWRXVOeVVpRDZSeHI5R3d0REJY?=
 =?utf-8?B?U2syVEhrczFyaWN0VXJKSkl6SFluUno1bWRXKzlnRmNQeWdOWHZkSGZsYi94?=
 =?utf-8?B?SnNjTERjOFFHOTNjRm9OeWRydE05d0NjTXJNcWxabm1uRlZhRUV4bFRBa0NJ?=
 =?utf-8?B?Nzl5WTR3WjdLcWJEL2ljRE03dDZCUzJaUlBBWGt0emhZZHBZMWs2N0VNbWEw?=
 =?utf-8?B?cldZWWVVdDJvUVNIZ3lHSXJiVzRiRlJlMXp2UnpzV0lNUVF6bXdzYXNOZjJC?=
 =?utf-8?Q?KA89Iy1Ucz++cHNXS9ZLuqSWA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8404caf7-e4c9-4c4a-7a28-08dbd4aef293
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 16:33:26.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faeXnnn+PKnb7cDypAEafTUP4I08f7duvwEw1hJn2QWZbZSKXPNRz5uYOzhvA1+7KDQs27TGEnraUj6aHKKQWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7973
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/15/23 10:27, Geert Uytterhoeven wrote:
> Currently drm_client_buffer_addfb() uses the legacy drm_mode_addfb(),
> which uses bpp and depth to guess the wanted buffer format.
> However, drm_client_buffer_addfb() already knows the exact buffer
> format, so there is no need to convert back and forth between buffer
> format and bpp/depth, and the function can just call drm_mode_addfb2()
> directly instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Tested-by: Javier Martinez Canillas <javierm@redhat.com>

Applied and pushed to drm-misc-next, thanks!

> ---
> v3:
>    - Extract from series "[PATCH v2 0/8] drm: fb-helper/ssd130x: Add
>      support for DRM_FORMAT_R1"
>      (https://lore.kernel.org/all/cover.1692888745.git.geert@linux-m68k.org),
>      as this patch has merits on its own,
> v2:
>    - Add Reviewed-by, Tested-by,
>    - s/drm_mode_create_dumb/drm_client_buffer_addfb/ in one-line summary.
> ---
>   drivers/gpu/drm/drm_client.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index d4296440f297fc5a..a780832a0963fe38 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -395,19 +395,16 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
>   				   u32 handle)
>   {
>   	struct drm_client_dev *client = buffer->client;
> -	struct drm_mode_fb_cmd fb_req = { };
> -	const struct drm_format_info *info;
> +	struct drm_mode_fb_cmd2 fb_req = { };
>   	int ret;
>   
> -	info = drm_format_info(format);
> -	fb_req.bpp = drm_format_info_bpp(info, 0);
> -	fb_req.depth = info->depth;
>   	fb_req.width = width;
>   	fb_req.height = height;
> -	fb_req.handle = handle;
> -	fb_req.pitch = buffer->pitch;
> +	fb_req.pixel_format = format;
> +	fb_req.handles[0] = handle;
> +	fb_req.pitches[0] = buffer->pitch;
>   
> -	ret = drm_mode_addfb(client->dev, &fb_req, client->file);
> +	ret = drm_mode_addfb2(client->dev, &fb_req, client->file);
>   	if (ret)
>   		return ret;
>   
-- 
Hamza

