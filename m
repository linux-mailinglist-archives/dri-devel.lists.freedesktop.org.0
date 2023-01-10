Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F011664568
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810EA10E122;
	Tue, 10 Jan 2023 15:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A4A10E122;
 Tue, 10 Jan 2023 15:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFuafRZg9vs/CtbyiQRUVNyWUlehMrGnzjXM1J/hgcbTWKvUuRGIb1UeaQvgzKJKlJ8DOOxeETaANbBDSRWV6rKgoLaOZkEzKIMzdJTNaZojbiW/xs7Kz4IeDuTybVMFLmohnGLr6fDKF1aK9d/zi5ZKjovkKm0EF57DElrN7zGj4qt3nKotIy3haJGoK0rjBHNUcqQ8gaWuHyb8UbPa38Its1Mx7eHk1VDpqZIViVoUVfsVjH4u+f5MxefYD6mQHWMAln19Bcz4BWZeK75CJixphFFRWlhza5dNPIN5kdjaMeVqOFt/082c7/3beb+8yFU/vGTb3FGeYNvnt8JUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=it0gokUkhnWeg8JhJ98cnJhENtTNLjA8jpw8m8Td2tY=;
 b=Q9QdyxnNHy5VkWSkUgAaewPIfGHcsk1uqK80yzo8dne87s3tO5tI6TaDQbRk6mjpT1/dXjsahou2110AxvQCnMik4uuY80mcjuVb6+yWvglJKOmjsyrAoFhWrugoP7mX9s84XeLcg0jLyf2SSrs1lC28lPZN45L3g+UnG2u9wff1GYiywfeKWdXd+NMGWKBNrnbAgGBUIdubFsjr8ZgLRyjWIFGQi0UEjdwD3UqnWwJLS9hStzAShpZ6FDOUrym3+VaqJHvDVtFHmbo7tBCZ8fvKGmoIh6NEC8PyMuISQYpOXbEnWJT2XPfLUdhIt1/SBD53u6//L9f9H/Oiy7CGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=it0gokUkhnWeg8JhJ98cnJhENtTNLjA8jpw8m8Td2tY=;
 b=LceoTwO6F07w4irjBMcCi1AjbLqEmEBZtu9Iw1HcZfSWvULc2XvPXes6ivI7542xGveTS3Cu2dpYS/dTYrlw6yEIO0KxhDZGH7vfDYcO2D8Rgux+Opn0n4Adt5qaELKsb4G7kztJlCEL4ST4TFa/+pkn64t2Jpg5cGHg0Z2BQbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by PH7PR12MB8155.namprd12.prod.outlook.com (2603:10b6:510:2b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 15:55:03 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::756d:ff13:d7bd:d590]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::756d:ff13:d7bd:d590%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 15:55:03 +0000
Message-ID: <7a16f713-b8ca-d46c-a18d-d48e6938be16@amd.com>
Date: Tue, 10 Jan 2023 10:54:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/amd/display: No need for Null pointer check before
 kfree
To: Deepak R Varma <drv@mailo.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <Y6s7989gmBZldV/S@qemulion>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <Y6s7989gmBZldV/S@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0012.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::25) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|PH7PR12MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d84fe3-b533-47d4-dc79-08daf3230788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LTQEPEvoW7DWkcFIDIdSTiEq3mjeouqkwrb8ZwRJlD3TbMp/6nnJFAsdFuIshGeYaJrSEKKZ3kzXlRTWOmPkAA38eHDJOUu7Bg9S1EbSqmUOojMTZ4rKw0zoSoD0Tl2/X5YSQ4GUvPS0xzu8exlCQgdiz7SZ/O1pdN1iHiMXLSIPpkv4srrq7pXt2SyjT9cta/TtH8puMfZjHMJziJ3G3Q11HmpC7z73VFDKddAXeKYF4wgGy2pOUVRQau4YdpF/P6Woye6Nmg/im57eUfMMYpbGga69blTQafCwmKWAmCcEXVCTuMivHtRFgwCqcG+dtjrIv9iPSRTyUwvcl5otlkrOaO1yJRtjqrW5gWgt2DuJ8xsCVbBQAoRkCVzeuv+bHZGJUIDqGsVzpOY83tZEBvIntVzWFqUr5zEMfXeWT1AtVHXp9WvdpKMWgdpdjOAt90D+WHKm0+R+qcaafnDEU9OU6MwPCdJq1PMppF/7prui6/t0hVgQfpF1OrLfTzQ0SI2oeL4hpBEpjqexcXamqlnUCkZqUulGjNE2R5Vbo3xXp8E8z4yunROgQ2buvL9ksI71ZToeeRps7Nmk9E8x+DXM0TI5aTCero3S+OFHp9dyz+KPumFe5Mg+YHlPPoT5VEiGLg+M3+d9N90gsLDTk5qWqz10XRKRIh8V8VfhH/dWbKpVyksTbm+T01Jer2vuDPkgvY+4lXeM3FUdvTdMNkTW1LcHF/bTFfn7MMsRMNFRZ4sCKJKHa6XpekZMnNQQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(451199015)(66556008)(31686004)(2906002)(5660300002)(36756003)(8936002)(6666004)(41300700001)(66946007)(8676002)(66476007)(316002)(4326008)(54906003)(110136005)(2616005)(53546011)(6486002)(6506007)(478600001)(26005)(186003)(6512007)(31696002)(86362001)(83380400001)(38100700002)(921005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGpldGk0VGtUdmk4SkVjQjV6MkZsSlUvL2VHd0hrZSs1cnBqUkZ2NklKUlJH?=
 =?utf-8?B?WE9tYXRDV0ZsRXNhQTc1V01OTjlscEJ3T3FlL1BEaHIzcFFSZlJabnIyaTA1?=
 =?utf-8?B?dzd4a3RiYzh3V3FpUEluSzJiZWE4ajZ6bE5hQmFudm1MMUZCOEJNOC9iSUE0?=
 =?utf-8?B?dVgyOC9DYnV0V2c3ZzMwc2RNQitsbmNQcCs2L1JjRExqS1laa0NhdHR3L2xq?=
 =?utf-8?B?aURiMGdPSUtyc0tCamxpWDFjSFBHbjdCK2JsQTRGWTRETEVmcnpKZ3E2NU9J?=
 =?utf-8?B?VHdocE1jRFg4bTZ1c1U3Yk9YMG1ZMHpZTGZpUk56ckFHUlRBVmZrZ1RoVXp6?=
 =?utf-8?B?aTlyS3h5WDhjeXpMUTFxRkNwdk1NQ0FOTitBaDFXTE9MN1JrRzNKbDZyeWk3?=
 =?utf-8?B?SVFNS3R5eUhQdVNQajRXT3VsREZlMkhldG95bkFlVE1rdjNLZmF5Sjl6WGpl?=
 =?utf-8?B?dTJNSExOQnBHSXVQOVNYL0x3MTdTbXgxVXVJMW1JVjFWdnFhMUNMaEdkdG16?=
 =?utf-8?B?RVlSK2U1VkZGcys5QWhJZUVhZm56b0hOcDlsMWtRa1RjalY5YmRDd3ZjYVRa?=
 =?utf-8?B?elJFemFiRWtNbGpSTG1aVW5LaGdHK2hIRW1YQm9QTExJeWd3ajBmaldOVTdu?=
 =?utf-8?B?RWdacnRHMUdjUk9QREc2U0FwMHdMVVB2dUNWYVRsYkNTdHRBL2ZUcEVnalBw?=
 =?utf-8?B?dUpWQ0dHYllvelBBWngyWG5abGFLNjlyejNtRDErbG4yeTdweFdmRTA2S3Ri?=
 =?utf-8?B?djVXd0NnZWRxRFlicWxvUlBhd04vUlh2VVZrcVZXOGEvL0ZhRFdsazFxOWdO?=
 =?utf-8?B?UG9peW9DbVkraktyQWdWNHo3VnlWVjA2UHh4Yy9wT2RaNXVHMFdodzJ5aTRr?=
 =?utf-8?B?WjB4WEkzQzJJaGxnbVlOdkMrdWRhYS9RNmt2RjVPV29EV0hNUldXOThDRTBO?=
 =?utf-8?B?U21DZnRjeXFJa25zcW1id0poeWRqS1pQNkVUOTFody9kckpzeXl6cy9EbWp4?=
 =?utf-8?B?cEtDZnV0YUZnT0E3VEk0RHhybk5QNlkyRi9RMDBnc1RQU0NmZ0svZ2FNQnI2?=
 =?utf-8?B?V1FIc0VOUkVIUkpJTFdFaGhWeDVuLzVObGxVa0FkZzJtK0ljZ2RkV0MvQjVr?=
 =?utf-8?B?dUw1SDl4WCtyR2JHV0ZxMTdqemFEMStzaUQ2M0xHR2wxZDQ5azJITlZQSlh3?=
 =?utf-8?B?YkI1Z3V2TDh3Mk9rOTEyWTc1UXJ5OXcvbkR1RDJzeERZMlg2T0ttYzk3S2Z2?=
 =?utf-8?B?eTVjTG9ZeVhyK1FlRDJDUUNod1FDU3d4UksvckZWSm9OTTF1bHhUV3hOYUZK?=
 =?utf-8?B?YkNGVklyU1dMTmY5b3BmNW1TU240SkMrUXJzc0JlcytVR0cyNnNoVDFLL3A1?=
 =?utf-8?B?VTljbVdFZHVOR1RjbUU2RTZwUi9UeUFYRnhVbGlJM2ZGdWFVdnZGL2tQVURB?=
 =?utf-8?B?VURKWEs1WU1BOEVnMmg2T3ZWbVp5K0N4cUxVWHJ2MjZKWC9yZkkyeG1wQjdM?=
 =?utf-8?B?WENnS0dSQmxWNkVhMUMvNCsvRmducDZpeUVQQTdFQ3BuOFUyaWlTN0lNUFNC?=
 =?utf-8?B?STZzc0hJTGF6ZXpCWGVIRUk5VjVTZFRpM2NNQWJLQk9hcHRDci92VHNBek9p?=
 =?utf-8?B?R0xHWTA4bitxOTlodFR2R0RZL1F4ZDkwcWk3WExZTm9VT2taaDZKRUxIZFVu?=
 =?utf-8?B?WWdGT3JCMGF0ZEZPU05SaG02bXFWREVFKzRKUmRPQUZzQ0pPUjJpZTJOYUN3?=
 =?utf-8?B?NnlWeXRLRWMrUzBNUHdLMFRkZXd4cGZMbDZUQmhBWmhuOEFTK0NWZUNST2lJ?=
 =?utf-8?B?UnVha0w2bGNvY2RreFFZdU1jbjR3L0VoWGhhd0hYaVZRU3FFdEJxazRQVUV5?=
 =?utf-8?B?YW5nbUhZVXF0alNRNzZScmlLTjlqUlpPSmdXNEZKeEcwL3lvbERWZnFhTWNZ?=
 =?utf-8?B?WG5lYU94OWk2OW1XS0lHcTJYMmQrWW53bjF6SDRNQisyVGh2dndrRnVGalFH?=
 =?utf-8?B?b3hMczZrZ0RNZVhIdnNTb21TNkNoTzc4Rnhsc0dEQUFZLzNlMFl0SWFEcnhR?=
 =?utf-8?B?emdvTjdJUnQzYmZLblpBOVRjRTlJS2tZL0JIZ1J4enQ0ZGhrcXVpQjAyajlm?=
 =?utf-8?Q?Ngjnq58aiWv4rlf808fAtXCNI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d84fe3-b533-47d4-dc79-08daf3230788
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:55:03.2940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIZZFJaWclwiQyWcNSFtIJ5j+dHXUOU5A7bgmZ5VqgIJ4CZ9DOkHiX2OFDot7HO17HFQAnt4zmbxvwHfNtY10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8155
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/27/22 13:39, Deepak R Varma wrote:
> kfree() & vfree() internally performs NULL check on the pointer handed
> to it and take no action if it indeed is NULL. Hence there is no need
> for a pre-check of the memory pointer before handing it to
> kfree()/vfree().
> 
> Issue reported by ifnullfree.cocci Coccinelle semantic patch script.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>   drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c | 3 +--
>   drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> index 3ce0ee0d012f..694a9d3d92ae 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> @@ -577,8 +577,7 @@ void dcn3_clk_mgr_construct(
> 
>   void dcn3_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
>   {
> -	if (clk_mgr->base.bw_params)
> -		kfree(clk_mgr->base.bw_params);
> +	kfree(clk_mgr->base.bw_params);
> 
>   	if (clk_mgr->wm_range_table)
>   		dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_GART,
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> index 200fcec19186..ba9814f88f48 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> @@ -783,8 +783,7 @@ void dcn32_clk_mgr_construct(
> 
>   void dcn32_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
>   {
> -	if (clk_mgr->base.bw_params)
> -		kfree(clk_mgr->base.bw_params);
> +	kfree(clk_mgr->base.bw_params);
> 
>   	if (clk_mgr->wm_range_table)
>   		dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_GART,
> --
> 2.34.1
> 
> 
> 

Hi,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

And applied to amd-staging-drm-next.

Thanks
Siqueira

