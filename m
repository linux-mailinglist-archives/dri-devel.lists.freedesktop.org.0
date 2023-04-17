Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10BB6E53AD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D12010E60C;
	Mon, 17 Apr 2023 21:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C122C10E620;
 Mon, 17 Apr 2023 21:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OohtHc3e9Ve63cOc8C1fIlcF0YRtiiNnxI7AyiNwSqxZQL0AldPD+zpFHiPzOwDXMGgmT6HpwsnRMp3vXxFyrSOb6YvBSEOvG7rt3Fr5gEw9aAQYb8j1DHKW7E1uLwlosBWAfjUBjfuEW5WBrVYreuAUjGRwsOaePCUgSN2gJzc/kthPdB84ex5UCjX6+uMMKU9iDR//bfM0/3dCZVevXI+mpFld49FZwNNKVboAhWX8S/5sigRxP9PO821FGFDtMzUU7Y/jhzQUUTTJVak3E0oER4LHDY0+3ASU3KyH/Me4QvHUiSspS2EhW+xiriDL6NltoL6laJHJjoRNNei9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdlTsVHTtSOsoTNDE7bTAINLudRbzyGng7xzbUerSp4=;
 b=kYTGByjUunOkkUoscj+x1mCEQ5OP4YmnF2Tq6jfcwIs9wd8atXW79EWnRy8OGsd4FA1Y0lk/A35eZ6bmFtUK90xZF90+17WGItOICOxoGbafsqptmN9r9y1hJtA0m1OhyYsYzBuGJNCQnvohVH5irOa269kb7nYTe7q9qoGLHvc8nQmuYWol0qCL36EL1+kdzBP1DfWTvyessQZe5G5GWWcR7eIVrJZS7dXpXwqWSFqCSxuPOEe3/UdLVT29jdVZDNeFm6GgXjK8XyYfsZwszbP9Srn3vajvSfbobLxfSmhG8PDs5ZkfqF4jEtoDMJqqE+zciG3RHnh+LPsvX5lO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdlTsVHTtSOsoTNDE7bTAINLudRbzyGng7xzbUerSp4=;
 b=YGZ//B+ZRZhd7P2E9XpBBqz9AqzvAR2zPlYclaicYamucYsr2ZWp1DnQzuhHO5fR2wpom7imAhfCo/NGpNvPbBH2qWMqgk4uCN8UQTZ0DclYi00PxCKoYhF6HjpUDrENo/STvnGqefaZ2RfF4zq8BLDtUCyOQyXKYN5JgqN1Y0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.45; Mon, 17 Apr 2023 21:10:52 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 21:10:52 +0000
Message-ID: <de29b7ac-910c-8d4b-50ff-47ba4134d16a@amd.com>
Date: Mon, 17 Apr 2023 17:12:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] drm/amd/display: mark dccg314_init() static
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230417210602.2614198-1-arnd@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230417210602.2614198-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::23) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 8540b53a-eaf8-492c-642f-08db3f8839b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQZ+8CmFy1cZBFBUhmq4uqQlMGn1+Dzrrb7ra3msCfu60LJ2pnTFSXke2pTNsFw8UeTY0s/H0dTSjqcfclDM6o49AXKvhw9NHng8xX1eGgFjruej6cwvweRddMvy4QJvcNy4VyK3O/7jUVZKfci9n2vZCoIu++OXUn1zuMuL6FuO4OnZAKVAYbNJR9D0wpjHNMlKrR2XINcAPH2ANxFPlgecmJ28gHpEWVtGcbXzheO2+MHi7VQ6OJmWt5jm0a9BQQMDr6EizgbKEfXLSv/fMkh3xba0a/xZBtu5nPfkigAQfmBej8HvlxezpjbRxicuNORQG81Xik2GceWO4b1uDjhaYOIXfXS2Q7Q7W5H7CPGb//+g0eUBNF/PDfUXAC9sjTcUT5ETV/colaoTlIrVa5OPODqiOlLj8HKT+4A0dRNQ4NVaIqZbmfHHwCBHRc4SarPE3KrtOMgKSA22/xtYME4Mxko32Wp/E80beGXW3F/ZbmGWF0UfGkms2uya555jvZVwi32bU0IwdVn5TUKqo2q5G/vHGpFwCpKGKhlKhEOhjpLh6BD0O3rSvmQCbnXKFfPV55P1aks0Dg6uVMR1/Y/KhkBeCGVN3EnQB3dQgxCBtraBAM3ODPSwAsunlwOKvN3NbmgoMbmabR4yacBsFnazQB7kYSULv4OnubCfDyQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199021)(26005)(186003)(6506007)(6512007)(41300700001)(110136005)(54906003)(66946007)(86362001)(53546011)(2616005)(83380400001)(4326008)(316002)(31696002)(66476007)(66556008)(2906002)(8676002)(8936002)(6486002)(6666004)(921005)(44832011)(31686004)(38100700002)(36756003)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk5FU3p5UU8rSHlOemxNcVc2Mk9mRGFtdk5NVmpMTUwvWTM2d2NlZzR0Z01n?=
 =?utf-8?B?UEIwVmNidFlkVGtUdFBKRlZDTGo3bUVIUGw3TUh0aU8weXlyRkN1SHpuRkw4?=
 =?utf-8?B?MHY4a0hrbUJDRkdFRTcraVl3OHQ4MmtlczdKWEVXMWdEOEtmWmZTSGtJSE03?=
 =?utf-8?B?eGdiMW4yYkdIQi80aG1QTVAvUXVDMVVTVWNsNUUrVUk3dno3ZnlEMy94NGdv?=
 =?utf-8?B?NWU4QTRqcGw1L2JqZFFoN2JVWG40ekFOWHMycktZeGE0WUoxc1d5SXJOckV4?=
 =?utf-8?B?UWJUOGJXWmtXQ1krSC95UWw3Ui9DMHpGd1VYOGM3NjR5KzNqNk5sc1JoSm00?=
 =?utf-8?B?Z1pndVNrVmNZaktDOEJGSVpXUTBsNlNXd0tISG5xSmp6eGlPcWtPN2srcGpX?=
 =?utf-8?B?a1ZraVVTMGxib2Z0OHUvSTNvaVEwUTBtK2VuWFJsVFB4YTlLa2hudERuaDZl?=
 =?utf-8?B?K09MMVVaT2N2MUJVdXZtYzN0K0pjaEhVTmRBMnc3eE9nU2NreUxIZmp1amlS?=
 =?utf-8?B?MHRib29MeTRlazcrZVFLdjhSKzRhVTZsRmtlUHRxeURqRmtaeWpxR2MwODg2?=
 =?utf-8?B?MmkrejNncmhhVDRUZkVWYmQ2MG9tZWVmeU9jcG9vbWIxdy9Nc2xRNkk3bHNV?=
 =?utf-8?B?SHNmYjlZZitkRSsxRWtSR2ZZb1NGTVpVMTdiQWQrekVDb0pZZVdaRStGVjFj?=
 =?utf-8?B?Nk1zalkxeXhCdzB0NUlvbXRuSFd3WGExb1E4ZEc0Mk10OHpIWnMzam9yQlJU?=
 =?utf-8?B?emhtZFg0T2x0QUdnYnE1NzZjeTNVRTJIeVVQRlJrUnNNVlNVL21aOXhjSFdR?=
 =?utf-8?B?UFB2cnZMd2NYcUxIcWwwZUZpcVlEWTZYNE12OWh4ODNqczNGbTFOdGdRREMv?=
 =?utf-8?B?dlNjWlBEQWRIU0xMTlA3L2ZydVAzdjZTK2VUUVRmSTZjNjBYM1gzZ2dad3d6?=
 =?utf-8?B?QVd5VVphZVhvTFRDQVZFbm1BL21SRG1ZRDc2RGZJK2UrUkdIWWJYZmcvOE5K?=
 =?utf-8?B?Tm5pWHhPV2RmbVRWRW5uNFpacTVVNlJpY3ovREVkNlFxb2o0eExpQ25TZG43?=
 =?utf-8?B?SEVuNTB6bkFHYU5tbXZmMmdGRjBUKzk3OHdnemh6SVBTcnRJcnlOSERWcUxI?=
 =?utf-8?B?bmVLYndsWXRGMDR3dndGbTFIRmY0bW94OGFVQWdha0hNVGdIU1RmWC9RaTk4?=
 =?utf-8?B?VFlSQ2hiWnRSMldxM3RZMkZ1NWJ2Zkg3NWxGZEs4U004M2xXUjJPOGNRaEl6?=
 =?utf-8?B?azU5ejhrQUY4TDZJMGxBOVoxOU8xd2VGMExKR1RKWS9ZdjFVN3RHbDkwZXFJ?=
 =?utf-8?B?ejBhR0owaXA3VkdoZGdoQlI1SEE5Rzg2VmM3WDVIcXowazR0SlJHOFI1RTFr?=
 =?utf-8?B?WW1TWDMxdzZzd2FWaE5HTmR3QUd6cDRCVUxVbzBlbHRRNVVJamZ4L3dwMmdn?=
 =?utf-8?B?aVZ6RVpiallUNlVkUTBXV2x3LzVqVDZoeGpDSVo2MTVZaUZKckhMVGduSTh6?=
 =?utf-8?B?VFJaMVNZem9qcFp4V2VhSEZFSGtibzdpMTc2Z2NCMVN5ZnMwSEhRQVVSWStr?=
 =?utf-8?B?dHd0aTZJT21uQWF5am9uWEpySENhNmFGUGZaNlpOR3ZZVC9YZnlvVW9hWCsw?=
 =?utf-8?B?RzB3Smc4TnZJNHIvUU51N3VJNEUzTjJkcDRLcjdDVHZMTWM1SnI3MjdlbGY5?=
 =?utf-8?B?K25MY2cyU2I2Nk4yWFhSaXpoVDJsV01uaUNUWGdxcXVxd0QyWnNmNGhTME9l?=
 =?utf-8?B?SFBkZ1Z6SmdtS29MNWhiYm1DaE9pR2RoQ3JBWnJtRGxBQlJsaWlRVnVqcWFh?=
 =?utf-8?B?eHE4aUo3eE1hQzdXQ3NqU0lnbHVTS2FZZHh3cjhUK3NvOGk3cXQyUGZMZXdE?=
 =?utf-8?B?NG5iTW1laTFMZkNaZFJVa0ZYVmFyRmFxZ3lZK1pieEpsV0FacENxSitNaGM2?=
 =?utf-8?B?ZDhhNElIdVNsSWNZR3J3TmdKaXdncGMxUzNSOFNyUE5RQmlBeWVBMXpMV21O?=
 =?utf-8?B?OE5CcGExS3RHekI1RkU4VUswTEx3M2E0WUtFQ3JKaUxmSnQ2ZDFkZk1SSDZD?=
 =?utf-8?B?eWkvTE1VMUorZ2dJTkovOVFUK0VXdWQ3d2J6OHFUNEdOa3dhVXdUeExqSFpm?=
 =?utf-8?Q?8W6vAgQ46Vl9WwLMUWjrpy+sh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8540b53a-eaf8-492c-642f-08db3f8839b1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 21:10:52.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UcoB7S+HOmQQQwHMyUuV6mFcVYBMO9rRhjvFmAHXujjcIyvfGY2ryqT4YW19nMU698BspJ43jYbxog+Y2atew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
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
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Hung <alex.hung@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Taimur Hassan <Syed.Hassan@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 Jasdeep Dhillon <jdhillon@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/17/23 17:05, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly introduced global function is not declared in a header or
> called from another file, causing a harmless warning with sparse
> or W=1 builds:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_dccg.c:277:6: error: no previous prototype for 'dccg314_init' [-Werror=missing-prototypes]
> 
> Mark it static instead.
> 
> Fixes: 6f6869dcf415 ("drm/amd/display: prep work for root clock optimization enablement for DCN314")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This has already been fixed as of commit 669f4ac40947 ("drm/amd/display:
set variable dccg314_init storage-class-specifier to static") in
amd-staging-drm-next.

> ---
>   drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
> index 6f879265ad9c..de7bfba2c179 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
> @@ -274,7 +274,7 @@ static void dccg314_set_dpstreamclk(
>   	}
>   }
>   
> -void dccg314_init(struct dccg *dccg)
> +static void dccg314_init(struct dccg *dccg)
>   {
>   	int otg_inst;
>   
-- 
Hamza

