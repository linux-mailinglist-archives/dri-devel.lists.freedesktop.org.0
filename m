Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C700B569C42
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 09:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540EA11AF61;
	Thu,  7 Jul 2022 07:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DF3112B6F;
 Thu,  7 Jul 2022 07:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brEZgE3LcUVR7PFD4Metxrqs8Xe5vbUMUEcGx4/JUKaLOL6SHMe8T18hJK/uELQreurVe2b6nBhj/wJ3D8i3mjRkvojVjeP+DUFPMtjG1x2XSGOfE0eEPK0vhgI8TPxL3WTcboOppbGlqFkQijnPYgdfJnSooHRzLUR9IRnWdqjmQP26xc7dp0wO0czBHzZQnyU+bd6Tzcims2/FjgqqrbaMIqLeFMIvGTtNfj90Oo36gbMrxGMe9PhpWF0lZa/CD+s3k1Q0jWYiomOLcM3Sf64I/CjAnXtseNC70vfztpmahYpK1Y23FpGEJQBkezshSY7A4/vg/6/gpFBShKTBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F09/YU3BwEw0ACkBPlJcddD1DxWcdMQ5tiMzmrYHfFE=;
 b=G0b08NoQUSpb1Lio5WyAN83+sEAnGpG+ALT6BbVJj/MDvWL/zjIfGjlE058zCokbUjqWdlCrHX8WuH/Wb3+gg5kUzluanPFyzZe/K5X9CQnQFYZbu2fJQqEcttLsM98HIrygyFcR5upOSwRZOO95SN4JbQpy+h0bBXBgW/aLyMFZuhkSRxw5ExUv+myCq63OYA5Xh49CF0Ys3LcdGNh0oYMIWNZx9lqgD0SZWZ9GEAT7ITy2Mzipbku0/ZHdnDDuyPK3rO9a1x4tFTPvNauvzXlrIhGwGVLhK8pP8onNM1SDtPHLxnhgaZULowfzpdIJXXajHNHPQArBhA/+0HNhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F09/YU3BwEw0ACkBPlJcddD1DxWcdMQ5tiMzmrYHfFE=;
 b=kyrEzAKKnELrQeHw2VqssVsZBvGW4e7J3l4Hv9FaOzoQqfRA1wilsaR4beRLmvirzH4iojoUAQr9vatF9U91gwvUOx4XNakKyg/S/jsFJRfXVmPPxui9CVZl8hMyp6ISthkKm6TnX341ucLgq1VJOB5llMOsSqkKNvf+R1ACZPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5082.namprd12.prod.outlook.com (2603:10b6:408:133::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 07:55:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 07:55:15 +0000
Message-ID: <458f78a3-3e32-a80d-e503-5e8252227ef6@amd.com>
Date: Thu, 7 Jul 2022 09:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1] drm/syncobj: Fix sync syncobj issue
Content-Language: en-US
To: jie1zhan <jesse.zhang@amd.com>, broonie@kernel.org,
 dri-devel-bounces@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220707030845.4059465-1-jesse.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220707030845.4059465-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e7041e5-d5cc-44b4-195f-08da5fee073b
X-MS-TrafficTypeDiagnostic: BN9PR12MB5082:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQMftPRPu818iAm34p45SUPdoq6t5b3FDr5bMXeQNyDzx2hblMpG/SOTGHBxaSfYfJxp3UcZqF+JkSXS5+M6vyT+Kx4VYS0OggVav1y5Dsx25f1w7qGubTuiXFYMJD0OgX/S0y9TzsWSbP9GYKZwRX7DuabrjT0npmlE3L3jw6BZJOb5tBuHnQYkweTrilrjN8oYQmxnRjjUHV/WpJtFrmoqry6QWN+NMqtBnTNESZ9nuLXCw8Om3Z66v85JYzfHh+7fRkOdPJxYcoV5SOsVe3ytwpkeJpwiVLzUAqv5n312//Zzd7VbK3EeXapZIUkTTJ4bnUyy22hMbmKgZKn36kNTrPU31xo1mVIawXRLdg7tmIsYKkhqkBR5ech8lfRt2wiQ7gH/tgOxYAQHf+DcOfeGGm3lPzba6MD+hU4MD/ycBUEOb7A5opZ2G9i/jY+CUtpiYELH9DKSzV/yZua0mBvU3As5KpE2gPO8lIfLYuaD768eNMCHQtvFyevF9t4IB7fBvLehHIOv2VlUlDqWN1Szj5cC6Gw2YA7tw2edcQc2QK/oDDgbDBToHV51IG/M/kEIoll/F3HQgsgBs5fRwDi1Fsv7/BithEB18X+mb5Y7IC0mkIMv+uotSDvNJOcSAju3StvaPJiXmE7QGYo8IJGK3z/HlIWGQZA7U2kvdrAszi5VnWhCV/fUSuuInxWct69h3d6iu8khQFYaS6GmsdFkBYRI4uE0rGprneQ4W4CF/LmdWy+ScTPmGQdo6lu/lrh6Q37ATm0zNiniG/sGfAgE8EpOcpOEmjEGCvpkh/RgZvafbStvOnfnuPqOM+xZMayBdyuqwBj7oh+YirQAFTAF1917rS+LkDaUL0cThAiTcoyxM1bQg4sw/OF3sAovMQsOveLoC9jC5BoZx9d/Kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(5660300002)(86362001)(7416002)(316002)(54906003)(31696002)(8936002)(66946007)(66556008)(8676002)(83380400001)(26005)(6512007)(36756003)(2616005)(4326008)(38100700002)(478600001)(2906002)(6486002)(66476007)(41300700001)(6506007)(186003)(6666004)(31686004)(45980500001)(43740500002)(414714003)(473944003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkk1SytiM0ErOVBZRDBab0VaRkkxM2pPcElxT2NGQXk2Z1UvWEt6Z3NIUTRl?=
 =?utf-8?B?eE9QaEhkQjNDcW5YekN4WnM4cVQ4VTNERHduZ1NNVjZPeEY4aTRsN2dsV2Va?=
 =?utf-8?B?eWduWEVzODhxSXM5WGdqb3VnUGNxT0gwYklwVUFuVGk1VUxaOElWaXlCQTk3?=
 =?utf-8?B?aVI0RXRYNmc0ajBmcXpoWU5BNEdyVllVTWZhODg4bmd1NFNZUXIvd09KTzN2?=
 =?utf-8?B?OWE2WG1ud0gwR21aVjJlT2MyTGExaW00aTJ5RklHalF2VnV1eDBkVFJZZzA0?=
 =?utf-8?B?ZWJPd2VYaWlLL1VGYUVHYTRhTk5maHUzeFpod3hDUmFLWTRycXdOWlpKS3RU?=
 =?utf-8?B?UHNWRWxHcVkrN3IwcHpqcE8zS0NZeE90V0crTEJqVUUvRUxjVWRqR3QyN1RK?=
 =?utf-8?B?ek96SUxVYlJxWHM1ZG5JU1pnV3NlQmQzbWFpR1h2blJkcE5FaVVzbVRVeWRs?=
 =?utf-8?B?NnJqK1QvYlBDaTJhckdQM3hvZU13OXdRVW9xdyt3UDF5ZTVJSDkybEsvVzBl?=
 =?utf-8?B?YURiajFnMHU4aHlKclBpY2lPU2wxNUtXQkdkdENXbmExMjdHYlBiMzJXVmFt?=
 =?utf-8?B?ZzRiRlg2R2x1ak8xNkRERytzLzZLQTFFdzlTWnkrRmttRTBWeS94REFWRVBk?=
 =?utf-8?B?eXF0Q0tTRENXOStHcUtVWmw3T2lQREV6NmVwQ0F3SmhJQ0lLYnpqWm5GWm03?=
 =?utf-8?B?UXFlMTdBSmh5SWpTUVZqWkFYVGp5cVhCazB1TnZHdS9hYS9FK3NDK0xlQkZI?=
 =?utf-8?B?Tlk2amFCUGJMYVdHL0lFMWZIMm1BaHp6dW5OTGJJd05abGEyYWV2QUs0ckRx?=
 =?utf-8?B?UVM0QUFIZE1ZNjJObzdkK04raHBmRDFnTnF1Ync3SEtqbzhpV0lVMTJtOFVT?=
 =?utf-8?B?MXZmMTFJRUVQNG9MWTBwcjZ4ZWZyakhhbGxiWWFLa0N2OVMzdnNXM3lMUVFH?=
 =?utf-8?B?Zk1ZY0t0SDZhWnZIZFhVTU9TWkpKZGtKRmtSU1pTWFRrUmI1bWtYM1pZSG9Y?=
 =?utf-8?B?eHNmTCsvSjlDTHhTc3B4cnlhY2gzamRaRnUzTU02dUk0TFF2WFk5SndibWdR?=
 =?utf-8?B?RnZaaS9vb0RzcHJCdlVRd3FVYmwxRXhrQk9QR2RKbjRmK1p2eWJqdzdibjVP?=
 =?utf-8?B?NytScHNraGRlcDdiOVArekxocXE2OVN5SktkM2szU21BN3JQME9Xdk94cllP?=
 =?utf-8?B?YXoydU4yQS80ZzhjZ0IvTFpTcUJncmxubVYyclFBdWxtRjROTnRHNC9HY1NB?=
 =?utf-8?B?OEY0MktVWk41L09HWUdST09GZ1g4N1ZQSy8xQklWVGxVNXRuRXFNWFo0OVdH?=
 =?utf-8?B?MnNQS0NUa0Jsc3ZieU1vbmtVR0pDaWRwdi92ZU9PZ0pJaGlkazB1YUNCVXVm?=
 =?utf-8?B?M2dSZ3YvMU81bkxkcHovNVVNTVFRaDZhT0lrQlQwam9wWmdlY1pSVjY2SjVV?=
 =?utf-8?B?czUxT1JGc3AvMUhMSXlIQVZ3cTc5RTZDRUVwb0JDYU9lK0RpU1pybDY2L3kw?=
 =?utf-8?B?ZW9LM0hyT3VYZzdFbzJQU1QybVRqODQwcUpsS1crbXNmdHBjZUVPbkxzNkY1?=
 =?utf-8?B?ZmNLRmlWMmVzRU0xRWhMTDNCYVJ3SU8zV0dFdTRJR2RTeHUxdFc0TWZVUkJu?=
 =?utf-8?B?M2Q2OW5nczhaNk1BTmZVTXpoVjY5WU41VFN0MGdyUGZnekFVS0NGY2RmWWRI?=
 =?utf-8?B?SStNenpVSThMcjFLUnVaelExbU40by85UWFTSnBxQ2JicVYzdGt5VkJUV09F?=
 =?utf-8?B?UGIreGpEcElYMGNxNXRuQWZkV0ZPNEZ0dks5NEJmVFYvOElWZjBIajRXUmQr?=
 =?utf-8?B?M0FOckpnSlBWMG9HYWhUQzVZanhOU1NmRkJKeUVQVjZBUGIrSWVvRThjQ1FY?=
 =?utf-8?B?UDBZQ3JndytpUk45djhUMjlxZlFia2NUUUptcmRGZTBuNDZWdlhhaW1FaDcr?=
 =?utf-8?B?M3ZtSnBUajRsSERhbVNvS0xXS09xOFM3eVNkRk10US8vUStoZ2R4SWgwb21J?=
 =?utf-8?B?VXcyN3UvK05oazk4Wk9nSlpEL2JCQTduV0JiTFZWZnFuOEkzTXFNV0c5SVYx?=
 =?utf-8?B?K05qT05XdFdGYlJUSlVrSkVUOFNVV2FXS0tSN2RQbmh6ZXNPTXQ5dHNwOVFp?=
 =?utf-8?Q?Kv23I4gmmOXtYBbwyJKtddiTX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7041e5-d5cc-44b4-195f-08da5fee073b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 07:55:15.7014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mu6Fv3J/fjqwjBe+xCaZX08eL/AIstlMESSWXNlg7J3JV0UQIbiuRl3owTFyVyEK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5082
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
Cc: Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 David Airlie <airlied@linux.ie>, Basavaraj.Hiregoudar@amd.com,
 lucas.demarchi@intel.com, open list <linux-kernel@vger.kernel.org>,
 lionel.g.landwerlin@intel.com, nirmoy.das@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Vijendar.Mukunda@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.07.22 um 05:08 schrieb jie1zhan:
> enable signaling after flatten dma_fence_chains on transfer
>
> Signed-off-by: jie1zhan <jesse.zhang@amd.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Reviewed-by: Nirmoy Das <nirmoy.das@linux.intel.com>

Well please drop those Reviewed-by lines immediately! Neither Nirmoy nor 
me gave you the permission to add an rb to this patch. It looks like you 
have a major misunderstanding when to add that.

> ---
>   drivers/gpu/drm/drm_syncobj.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 7e48dcd1bee4..0d9d3577325f 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -920,6 +920,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>   	if (ret)
>   		goto err_free_fence;
>   
> +	dma_fence_enable_sw_signaling(fence);

That looks better, but ideally we would enable signaling when the fence 
is retrieved from the drm_syncobj and queried for it's signaled state.

Regards,
Christian.

>   	chain = dma_fence_chain_alloc();
>   	if (!chain) {
>   		ret = -ENOMEM;

