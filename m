Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92216A476E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 18:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A487B10E1C4;
	Mon, 27 Feb 2023 17:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7632D10E1C4;
 Mon, 27 Feb 2023 17:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaJ0vf3F8nfVesbQG93B41WWPaSqkht49L8HAyxaCGxqoHrISlTGjNOiTaxaropD0Dihaw7oXPUtGn1uXw/cuYSg4JzPZqhikz+8iooMQsV9vyASGHQNL7J2o7vvHAXbwT+AUGwxz7f9gM0JvgZRNbWkdmUixGf08/d98h6Se/+wmdyZ2TjYvm63J7U5EN2fmvWmyvFmzNnpA7qB+CEPjKCicjtKQGeF4h/PO57DK/xdyVUDk4iw3+5Jtwj7CUhxL3qMcwkWizY1tOtruzfSdB+X3u7uJ7d10v+lZwr0g7I3PT/3P7Q7+h9PlnFsPcs9aX6YQ2AzzfLMANR39BR+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn4CBK+FIIW6nZCNi38R9uxfr/ltjIpRX8UerbeKUPY=;
 b=G1TC2kZALKIMiguctHyBEtz4QlvuK+9qEQ94m86ddpEeaz7G00OHUAQm9fz6fT42n1R7sI0DUd3eb9br6wlWp5+ZGy6+go05y8fOwf2XUa0hFnwLzOAivCPGd2VHNJbhNq2yRZAxNims+aFzXaLUUOMJcZRCGnAFHAtq6C9AZeYqNg2tW2T3OkYLOjg/hS+iZPQUJA7L+0liA94dUU6bPtbopquPrhm0WbtA6RW05Q07gnfrkNO5SZ8G1v+8mYvmBtIPXZ0bCAZbKwT2Q1J7tgOqYOhK+GSL9fmmYQs9JA67BXbLkaxsSAWbf8wgzt0Vny1KCHeuMhIToTRrN+7o4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gn4CBK+FIIW6nZCNi38R9uxfr/ltjIpRX8UerbeKUPY=;
 b=wbl7yuO4T7e7FDJeolD09QUFCtbHM6b/kfK+t7tMmvICLWt46e9JzaeZ74K4sQS2T5yBZx4x0JL74bx+b66/i1lXndZcyJtP0/2NDX35apRB12VJdVIdooeLU9bfouocooeDyWqeGZO75il9E/7WCChaJv3JmydYPvoB2qDh/NI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 17:00:06 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%8]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 17:00:06 +0000
Message-ID: <bed5e04a-a0e3-fb80-d75e-cdcd85efe7ab@amd.com>
Date: Mon, 27 Feb 2023 12:00:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] drm/edid: parse DRM VESA dsc bpp target
Content-Language: en-US
To: Yaroslav Bolyukin <iam@lach.pw>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230226141051.21767-1-iam@lach.pw>
 <20230226141051.21767-2-iam@lach.pw>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230226141051.21767-2-iam@lach.pw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 811f98ec-4041-47cb-eb62-08db18e41352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wc0UCkiUdFsiZP2oLelnlA8Fg5yM2OB6c468+Sjj4YfZD29g7swaRjaR+F45C98pEAICJEfxa8ec4Hymaxvve/tjBcQSKmpaedMd3fdhuxMufL+J0JIBo4GrhiwGGBLhcuGkK2K4olIMyH0A+3DQMNauIe5G7EjbUZB38yQzJ4b9bpfMjj9ZtMHVQFxTO2n8i3cTw8D0A2Qm9BbrCEorknhvhDlAtj9trQ23cmAxljxXRAUvGJlI7EZPSrKdh3VcMrlZ3zv4vVZanGKDn9hmrQf9kQbKWW2cbWB9lAskFOETg/nPufD88QYR68xzVqH/Ix8AAfAQaiThGg2fVWYyZdy7xq8e0p0w4ReYh6e+wc8EkE9moINLpa9WthUi0sObBgbN+o6jispsqgErbxtUcrT7Gz/PuXvk6W7BVNq9y66Gggc1g479oGFTlbtAwVyYJHM/+LVxE3gj7cgkXzQssM6T2aiweJaxPtCYafOeQ7YOUcKzyLEnxliRyoqn1N7ByFrszMt7rSX/U9c9/K4TT1Re9lHfbRItz4gRE0ltX5kyonswXIZlPWX73ZIz2K0J3G23AbQomGXVZTUNWd6sXcTHkrBRHDTuWTf3mfVanCRsk68XbDHDnVDW5Y832vKIZ6SMc9eZIfycX1tI5/4oddzl8IFEydcnOq8f04qS6ooZ0XCkUQQm9UvzdvqeEQZWAQu2f3CbSx8TYzjx+fs22HsZIxGBEAM42riUfNLRCss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199018)(36756003)(316002)(54906003)(86362001)(478600001)(6486002)(8936002)(7416002)(2906002)(44832011)(66556008)(66946007)(8676002)(66476007)(4326008)(41300700001)(5660300002)(31696002)(38100700002)(6506007)(186003)(2616005)(26005)(6666004)(53546011)(83380400001)(6512007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVVITGNMbUp1c3RWSUQ2dC9iWjhXaUtMTVhYK3FOR2t3dnIyQiszK0swRmpX?=
 =?utf-8?B?bEJPWVdyMWkwZHhBUG16Sk50cVphTUVZenhIUGplSmVJTk9qZzJLQW9scUZj?=
 =?utf-8?B?RFQ0eE5uNzUxVmU2WFZsczZObVA5ZGgzc2RlU21odUVFRmhlTE5HMjl4VHE5?=
 =?utf-8?B?L1JBTWdnZ3BiMnNCSU56VTJGcHJGTUxKM0RJV1pKbFYzZEV0ZlJNMzB1VjhU?=
 =?utf-8?B?MnpVZStCRWRVR015UkViRFBPcXdvTkVicFhpUEh6SmJUdU5Vc1c5Qlp0K2dp?=
 =?utf-8?B?aUlwZlIxUlBqcUQ1WGFiVFIzZHBQVlRQYVlDREswcWovT1BXaUI2RU5VbUJt?=
 =?utf-8?B?TXR3bXlSbEQ4NVNNOUw2N1V3SmF3ZitDMG5VVDhpNEQwNVlEZ1hCcUZOc3Q0?=
 =?utf-8?B?QW1aSDE2MHhSS2llOWM4KzJTTi8rMXk4cllsaWx0NkNlZTlCU0dvZzRTZlJE?=
 =?utf-8?B?QUd2TTVTdFQ1S2hUUUlWTndYS1RZSHFnWW5CdlByelFEQmxsZlFLelU1SnJB?=
 =?utf-8?B?UklOMzl2REJqeHcrR0U4T201UFczc0ZwR1g4blkzTjFJRzc1ZVJFYUNpRWRC?=
 =?utf-8?B?dkpxemw3dHFLS0RDYWlLOGNXd2UwVk9CcGhXTVJDK251bnpYUklEd3E1MTVh?=
 =?utf-8?B?OFZZOTVEWk95UlJudEhYaTBMNmhYb28yV2tqTk9TT2FTdGV6SmxUa0hPZ1Yr?=
 =?utf-8?B?bHRnekFKc2xIZ1kzcVVXNVZYVWZ3QnBOS0JrZTd5dzdyeHpPamhOMXh6RmJO?=
 =?utf-8?B?c0xLcGdQNVkxWENKWkxLOTRtczdtVm1GaGthVS96TU9zTHc2SjRHMmxOdHh5?=
 =?utf-8?B?RlhTbk5jVmczdzN4UUFWNVdqa25XazBwSFFXcWliQ2xCRk05Ui9NNitaQkZC?=
 =?utf-8?B?dkJWa1FJNDR3dkd2UXZiTk1DR0Z4YmI4TkF3MlN2Z0VuT1NRdUs0ZmFYRE1i?=
 =?utf-8?B?UTBod3E5V0d5bmZacFA5MFJIM0o2Vko5R0tuV3Q2ODQ2TFZRTTVlUlY4WnJr?=
 =?utf-8?B?S3lEYlBDRmJtWXZoaXpZcVcxRWxpbGpLQVBDRU1adjJDWTAycXhQRkxNU0Rp?=
 =?utf-8?B?R1hBTmlHS2l4VnozZEVQVGNkdjF2a0VKRDJYSTdWVkJXNGxNcmtOejYwMFhu?=
 =?utf-8?B?L0x4R1RBNm1hWUtJRHB5b0RJdDFHTWV2TnNHOGxSVXM5SXBGbU1XU0Z6NEZF?=
 =?utf-8?B?RnozNkFMbktwU1pUNnRuZ2ZLdnMzMEpVUlhrS2Y0b1pvZVNERW9oeEVEQW1s?=
 =?utf-8?B?K2s5L21BZ3ZzT0F5cldJelc2N0ZOb3NIOFJhN2kxQ3kydjBXL1NyYkNPTmJL?=
 =?utf-8?B?c1FxelhEM0FUS2lMRTk0bER3U2FXWFBnSmtVYzZiVmkwVkZkOVQ4TkxZWmN5?=
 =?utf-8?B?NXNoOVk4WnVwaFBnQldNb3h4WTAvQk51WGY3T3k5d0tMNmJzNUcwM1BBSmJC?=
 =?utf-8?B?YXRhU0dpazdoeW9lK0ZhalRhTy9na0d5QW4yaGRiQUpHcGpYZjdxOG14SWVJ?=
 =?utf-8?B?OEVSU296MjNPbUNkbEJzczNaNjdacU1XaUVmeXBoQ0REekFUcXBuSldNd2tB?=
 =?utf-8?B?K3JybFlRMEFEQjY3YkN5a29mWkFMek02VU0zZVRHQk1kWGpuaXRJcDJRNWlW?=
 =?utf-8?B?KytLZ2d2aEczbDhCZm9oR1dGejV4MWhqMXdtNkh2VnlxbnlQZ21xVE80Yysw?=
 =?utf-8?B?Y3Q3L1lla1JyTTRQQzdkdS8zR0Zneldxanp4SVd6Q3Z5YkFHMnRobjAyMEtT?=
 =?utf-8?B?eVlvbGpEUjFWQXkyNDE4ZUZhcm9UaVU0R0FYSldlTWFIcW9wQkNjREZZdFlR?=
 =?utf-8?B?a0JoeTM2RnhmUDhBTWM4MEh0MUJvbnUwRWJad0hKRVhFUjZEbkJsQUp3MzJi?=
 =?utf-8?B?M2w1ODRRdHhkRWhmRUNGbUdRYlFWQ0dUc3NpWUkyUGdjNmxBZ3hQRS9uMXF4?=
 =?utf-8?B?MXQvQ2U2emh1M0VQRk8zY2JKTDdBaDlyR0xpbTBTRGhLVDJ3MVdIbE9oUDJC?=
 =?utf-8?B?STF2SWtCKzhzZCtmUTNnazhNbHk5V2NnT3ZOSnh4Q0ZoSkU0Sm93QnNhSXVp?=
 =?utf-8?B?VkdnN3c2dDJ3ZG5GenJSZHJGNUI4NmJWUzZEUFZBRXJ0RFFwVG9CN0tDb2tM?=
 =?utf-8?Q?2H8v6UpyiMkfZbYuj0P7maTKt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811f98ec-4041-47cb-eb62-08db18e41352
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 17:00:06.1211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvFB9Lj5RwwPRe1RzRl6OlkeQioHZvddIRZxHAxkLBFCoL5nh/2No0hjggHCAvYFunIfU7Lw/177bUi4J4UkVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "Liu, Wenjing" <Wenjing.Liu@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/26/23 09:10, Yaroslav Bolyukin wrote:
> As per DisplayID v2.0 Errata E9 spec "DSC pass-through timing support"
> VESA vendor-specific data block may contain target DSC bits per pixel
> fields
> 

According to the errata this should only apply to VII timings. The way
it is currently implemented will make it apply to everything which is
not what we want.

Can we add this field to drm_mode_info instead of drm_display_info and
set it inside drm_mode_displayid_detailed when parsing a type_7 timing?

Harry


> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> ---
>  drivers/gpu/drm/drm_edid.c  | 38 +++++++++++++++++++++++++------------
>  include/drm/drm_connector.h |  6 ++++++
>  include/drm/drm_displayid.h |  4 ++++
>  3 files changed, 36 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 3d0a4da661bc..aa88ac82cbe0 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6338,7 +6338,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>  		return;
>  
> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
> +	if (block->num_bytes < 5) {
>  		drm_dbg_kms(connector->dev,
>  			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
>  			    connector->base.id, connector->name);
> @@ -6361,24 +6361,37 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  		break;
>  	}
>  
> -	if (!info->mso_stream_count) {
> -		info->mso_pixel_overlap = 0;
> -		return;
> -	}
> +	info->mso_pixel_overlap = 0;
> +
> +	if (info->mso_stream_count) {
> +		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> +
> +		if (info->mso_pixel_overlap > 8) {
> +			drm_dbg_kms(connector->dev,
> +				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
> +				    connector->base.id, connector->name,
> +				    info->mso_pixel_overlap);
> +			info->mso_pixel_overlap = 8;
> +		}
>  
> -	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> -	if (info->mso_pixel_overlap > 8) {
>  		drm_dbg_kms(connector->dev,
> -			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
> +			    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>  			    connector->base.id, connector->name,
> -			    info->mso_pixel_overlap);
> -		info->mso_pixel_overlap = 8;
> +			    info->mso_stream_count, info->mso_pixel_overlap);
> +	}
> +
> +	if (block->num_bytes < 7) {
> +		/* DSC bpp is optional */
> +		return;
>  	}
>  
> +	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) * 16
> +		+ FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
> +
>  	drm_dbg_kms(connector->dev,
> -		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
> +		    "[CONNECTOR:%d:%s] DSC bits per pixel %u\n",
>  		    connector->base.id, connector->name,
> -		    info->mso_stream_count, info->mso_pixel_overlap);
> +		    info->dp_dsc_bpp);
>  }
>  
>  static void drm_update_mso(struct drm_connector *connector,
> @@ -6425,6 +6438,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	info->mso_stream_count = 0;
>  	info->mso_pixel_overlap = 0;
>  	info->max_dsc_bpp = 0;
> +	info->dp_dsc_bpp = 0;
>  
>  	kfree(info->vics);
>  	info->vics = NULL;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 7b5048516185..1d01e0146a7f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -719,6 +719,12 @@ struct drm_display_info {
>  	 */
>  	u32 max_dsc_bpp;
>  
> +	/**
> +	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
> +	 * DST bits per pixel in 6.4 fixed point format. 0 means undefined
> +	 */
> +	u16 dp_dsc_bpp;
> +
>  	/**
>  	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
>  	 */
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 49649eb8447e..0fc3afbd1675 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -131,12 +131,16 @@ struct displayid_detailed_timing_block {
>  
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
> +#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
> +#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
>  
>  struct displayid_vesa_vendor_specific_block {
>  	struct displayid_block base;
>  	u8 oui[3];
>  	u8 data_structure_type;
>  	u8 mso;
> +	u8 dsc_bpp_int;
> +	u8 dsc_bpp_fract;
>  } __packed;
>  
>  /* DisplayID iteration */

