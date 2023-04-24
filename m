Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22666ED308
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 19:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B8410E140;
	Mon, 24 Apr 2023 17:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7E10E0E8;
 Mon, 24 Apr 2023 17:00:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkZf5dZKP/yJvoq9LsikQXkuDbI7NcVMtTpQn5CbuHsTwZOKs9AKY2KiBEJUPHdtKwEFTQQaFhJI4FIR4Wd9/zlWjs05VY4YpOdBTUSH/t79CeN2DT7EYRuxLgC7rHRH+d3u5ZKac4nobchDO70lmP/rmWK6Q+QsZ70xGTy9fc8R+nGD41cpp5QHz3scQKJ1tjIsDAfdWrXpBbiZqttfwzue+Cc8ijgvxJnIlHs6Jk2DwWO3DKkSE+XRZaeMKeKK8O/IVkepmkbdB/8tLCFOJcWiW4l12RIqxjYgSmvVCvOO/Ie9D70mnvCurt0f/csSeD4V8jfK4E4Nc/uzTA1X1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvlNQvv2vBf2bFX+KJV4QDyQZvHqngAC4T3Uc/3oxrM=;
 b=d6a1ceqVMD9cNZoaSizwwZ5cgPfib6GYDmK7g3yOwRwtx83bSL0bfkpVonDFurrnyHXyb5qS+Nn2AYIDSdtY3/h8HU56H1X54dSA1kjIvli5tDVlAUb2z/KI7KjVMNxTSq0I7OUyawjeJ/a99cg8MgUDBIciwZNpAsAZCSgLWBCbDAQqG2By3jo1pnpJaITKTWCknBHR8q+RA0gtP0kPwnkhdRnf938clNiyM/pA2ByijShRvnfvWFhDCCGODMpffmO42ouVwhL4zlk4FynqdhPzY2tVqcyGt9Fdb94c9iSs8F1nQb5Lx0Wg6lqQGU8/x4zl/00KmS3GhzVek51ETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvlNQvv2vBf2bFX+KJV4QDyQZvHqngAC4T3Uc/3oxrM=;
 b=1ePLNzUFOJwm8tsXQpWVcZmwPSqrc7xvP5NNrjqZm2EPgqDWbP9TufEBf+ZcfNO7B+8nerJK/fInV1OrsxTdYtQYj7APBiTBuf9GcHexChtxnV7NT7q8ZWqvbSki9qA8xVSGDa+QBgqSbaSEZrX9JyBhARoQYvY4T7Gy2OyBE/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS0PR12MB9040.namprd12.prod.outlook.com (2603:10b6:8:f5::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Mon, 24 Apr 2023 17:00:49 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 17:00:49 +0000
Message-ID: <9910a5e3-a161-edfa-19d4-2bbf3bbf405f@amd.com>
Date: Mon, 24 Apr 2023 13:02:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] drm/amd/display: return status of
 dmub_srv_get_fw_boot_status
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Alvin.Lee2@amd.com, Jun.Lei@amd.com, qingqing.zhuo@amd.com,
 Max.Tseng@amd.com, Josip.Pavic@amd.com, Eric.Yang2@amd.com,
 aurabindo.pillai@amd.com
References: <20230420135901.3889747-1-trix@redhat.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230420135901.3889747-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0244.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::17) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS0PR12MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: 8239dfa0-5b78-450a-e4c6-08db44e57438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q0np4zcZZ/CGHOqapHg5632TJxz0EsZVdOgw902R2kxHYZx0Tit8vpoZnfRTt+YUHW8ke08k7z27gkYDU01Lzo8uEwVr1n+qb+gEsnrSsGEDNb0EzECqiphtoz5gw5JvFc65KX19nKcTn1k4dYLHnk9y23NAxk8KZG/i2ud3jTZ+hKLic/ocS2IL8JmrgavAyFI1mqcWdB2XYYb/y1pL5BbLaQG1BUyMn3LIr9UGsgcy7jpdM47IyVDLppItr+pXzF+RIN1mRvvllCPPzgCpkDhT563aW88KjRvnPaArjhxXLSZxMfo/wrnESUPqiWtJLydPkydNlW/7ttjK9alfVRZmbjAf/VFvzu3QfXvealvyMzxqu0/KCXyJ2FvFNqvXtg0mgkZX/U0EOVvkdcrKtQsyI3CBQujKokgVUTumYJ0D/X+hQ18Wb1EhFWa5qZowgA3freWySErq2NB0iJhfyg9URwhEAA79cJx4NAwGdonhBoBRNtKTzcyn4sAd3SjowWJvSrZuMheT7iQHxR8BTEFDzoZ7WkpVZa//xz2Zft6jPmAPMZMx1OwTVIkcWaM7odfFN8Wtv4sel/gMVNAFW6JnLTtqXhhdEsCUpomtZvC4wvmGeGJ2B2t3hgKggTUdTC+7YJogUPp98nbZ5l4KyIXddoJH1yKR9srYnegm12Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(31686004)(66556008)(66476007)(6636002)(44832011)(8936002)(8676002)(478600001)(31696002)(66946007)(38100700002)(86362001)(2906002)(41300700001)(4326008)(316002)(6666004)(5660300002)(6486002)(53546011)(26005)(6506007)(6512007)(186003)(921005)(2616005)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjE0cStJY0dKSm9WR2hCMUpiL1o1czkxNFJlVTluenJSRVl3Tk5KN0NxM2JX?=
 =?utf-8?B?bXQxZ1M1YmRRS3VnbkhnY2FIOWlNNmltVXNzZDFXMm9QeDMyMDhvdFpWZXE5?=
 =?utf-8?B?Z2traGdrMjJuZFhqcEN1YmdKUWhkcFpLU1Y1Q1M1WElwWXo1cHdVWWsrNm42?=
 =?utf-8?B?L3V1ZllaRERSTWZhaUhYVEJzeFhxdlRSV05aenowVkhrcWtVOGJQMzRSdXBE?=
 =?utf-8?B?OWN0eHIydUtEZkJQWFJxVTFzUUNhNHZKT0JEeGJ4YmEwMHV5L1c2OERzOHZy?=
 =?utf-8?B?ckh5a1hjMHprcmptTTRtTWxrY2hXbUs4emNjVlljOHY0K2VwalMrazhNYTBm?=
 =?utf-8?B?aXlrUDJoYmdUd0R6SnQ3WU5vZ3JEMjJtckErSlJ0cHJLNlBIdG1KZG9WOE5r?=
 =?utf-8?B?K0pDR0g0STRiT2Z5RmZVZDl3aEtrbFhQMmJ5RFgwTDFjZmJ5RWtBMm1tMXE2?=
 =?utf-8?B?SlVOakYzVUQyN25qbXR2U0tlYTU1c2xQTEczZXFPaFNEU0RRWnAzdzgyQUxH?=
 =?utf-8?B?R3NIOEF0RWE1aVVIVkgrQTR4VThMamdqdVNFVFFFeklHWURpT1FIQ28rWHpD?=
 =?utf-8?B?SnFNSkhkdk9CU0RyZTNTb08rWkxoNDU1YlcyLzI1aUVzOWtwZjRUZGlKaTh1?=
 =?utf-8?B?L1pObC95ZWhkYXE1RXBkS0Q3c3lNWFRwU0x3Q2V2TVBrdjN6UmsxVmU0eHZL?=
 =?utf-8?B?NlF3MWNKaWg3ZUlFSkZrcXNuLzBaUW53U0NMMmpoeGR6M0JNdGp3dnZkbnBu?=
 =?utf-8?B?N0IvT2pJUzRlbUllK0FZenFYOTMyYWY5Zm5LMFZYaEpHMlFMQ1UxSGhXbWlF?=
 =?utf-8?B?aFJTQmkwYkdVZ2MySkxpdHI3M1B0aE1aRm4yNzVibFVDc1J4aVc1UFhZVDRT?=
 =?utf-8?B?dG1yWVJCcmVsUkwyT1ZpTTlob2NYQ3ZrQndFOUdIa1Nickw2MjI2cFB6elcw?=
 =?utf-8?B?N0t1Y1Q3OHh2TVRpa2dkN05IWGozdTR1QUlTMllKd2QwWFhNSWV5RzlXWnVB?=
 =?utf-8?B?TGwrYUZxK2lLVk9GNkwyQi8zVlRKOXdlSGZDTk9RcVBYL2NzVWJnTEN4OVpY?=
 =?utf-8?B?Qkk1eXhWRkFCUmY5YWlHMUxCUEM5ZVBJTG1CbHRWRXlTM3pjOUtGVUFwZjBM?=
 =?utf-8?B?K0d1c0x1ZzhNd080aEFnNjZUWXFwWlVRYmZuSml4U3lBTnFUU3ZPZmtTakg5?=
 =?utf-8?B?eFc2SVhyT2RQdlI4bzNZMUVMYjFBNFdXanJoc0duU1N4VFBNUFlJMUxIUkd1?=
 =?utf-8?B?c1ZKand1cXhPSUM0VXBrVURGZUxZR3lNaHBXSnppT1hyY3RlZW92MkQrRVJL?=
 =?utf-8?B?YXMvQ0tpMmhKNVVLOVJzRE5TektYcUxTQVA1ZG5qa0hXbWRSTURrZFl3REE4?=
 =?utf-8?B?Yzd2NlphbFhZNllGQk5odHZwYXdra1N5SjQrOWpsYkRqOGsxSCtMenlPTk10?=
 =?utf-8?B?bmt0dDBqSE02RGlXUkNwUmJadHhQUGhsczJxdnlEdFBPWTRZS3l1ZXFISnpJ?=
 =?utf-8?B?NVJOaEptanpZaUhoRWsrVUtUc1RiZUpmOThaUm9xcWpPeFhtRm0vbTNGSCt0?=
 =?utf-8?B?NW1UY0NicTM3YWZTSms2RitNMUZZNXh5SnBVa2JLM1lKREJMb25PbWsvZmZO?=
 =?utf-8?B?RVZLQ1dwQzNCUXBFY2h2SlZKTEhhQTA3OCs1U1pJUXFFd3VTMjc0R2x3UjZK?=
 =?utf-8?B?cHpCMWQ1bDl4dGZkT09HYkt6S3dHL0dlNERJclJVK3cvV1pUZnptcDB0d0RK?=
 =?utf-8?B?OENNb3ZxdWFCNnpYYUs4L25sN21SbDhQQ2JEeHd0THl1ZWsycWx6VnBVbnJW?=
 =?utf-8?B?UTF5Uk5wVWd0QkpaZzh6MjhxNTU1cjNJU0VuSTRVWUZRK3ZhbHJqUWx6aEhI?=
 =?utf-8?B?VjNob0dCTlpGVmptM1hQTjJGdVF0M2FyL0NBYnU0T3NMei90N21SUlEwOEpP?=
 =?utf-8?B?SldUR0JrRzhwT1hwdmZwaVR2d0JwdFUvMFhTVkE2bUtLYTZkWEZvbDhnN3g2?=
 =?utf-8?B?Ukpuc3BDSlYzYjdDbCs0d3BQSzc5bGlqaWRaYXpNbGdFN0tiL0VhbGl0U0Fh?=
 =?utf-8?B?bDFsdmxvYjJGY3RPTEdTQUpFN0lha2xwNFFHWnhZVUJUUE9wVGtINzRIdVc0?=
 =?utf-8?Q?VYuDEm45ZHEEI+8+pLYtrzIrB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8239dfa0-5b78-450a-e4c6-08db44e57438
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 17:00:49.3306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /A+x2jG7Q28oyuSNQ9CwCEfMVjopG/bvIZy03Tm3j3iKOCk9RdB3jR4f5jFFIGGZwZL6hI5e6NmPQT9qOrwYZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9040
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/23 09:59, Tom Rix wrote:
> gcc with W=1 reports
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:
>    In function ‘dc_dmub_srv_optimized_init_done’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:184:26:
>    error: variable ‘dmub’ set but not used [-Werror=unused-but-set-variable]
>    184 |         struct dmub_srv *dmub;
>        |                          ^~~~
> 
> The return status is never set.
> It looks like a call to dmub_srv_get_fw_boot_status is missing.
> 
> Fixes: 499e4b1c722e ("drm/amd/display: add mechanism to skip DCN init")

What tree is this based on? I am unable to find that exact commit on
amd-staging-drm-next.

> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index d15ec32243e2..36d936ab4300 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -182,14 +182,23 @@ bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int coun
>   bool dc_dmub_srv_optimized_init_done(struct dc_dmub_srv *dc_dmub_srv)
>   {
>   	struct dmub_srv *dmub;
> -	union dmub_fw_boot_status status;
> +	struct dc_context *dc_ctx;
> +	union dmub_fw_boot_status boot_status;
> +	enum dmub_status status;
>   
>   	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
>   		return false;
>   
>   	dmub = dc_dmub_srv->dmub;
> +	dc_ctx = dc_dmub_srv->ctx;
> +
> +	status = dmub_srv_get_fw_boot_status(dmub, &boot_status);
> +	if (status != DMUB_STATUS_OK) {
> +		DC_ERROR("Error querying DMUB boot status: error=%d\n", status);
> +		return false;
> +	}
>   
> -	return status.bits.optimized_init_done;
> +	return boot_status.bits.optimized_init_done;
>   }
>   
>   bool dc_dmub_srv_notify_stream_mask(struct dc_dmub_srv *dc_dmub_srv,
-- 
Hamza

