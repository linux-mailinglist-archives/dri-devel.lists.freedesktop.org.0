Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD496A4991
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 19:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28CB10E2D4;
	Mon, 27 Feb 2023 18:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2715610E1C7;
 Mon, 27 Feb 2023 18:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9mMz/bRrNU3ciMM0yXZda5DNwUDvamjwi2qy3GnuLs0XKnJfdAPLEkZpGwzc2RIrCIma1FB6b6eaZMRbL97ZSUwNQpMGsOW2dfNynHpTzRmzPxDtyRVjiYJIOor1lzhlqHm9MwZ6w8NHKv1oeb6R6vijqjgjOJ7sMIb05o1+qRrRfejrl7CSxDICBpUguQU6cmNr7XMomHkwjbKl/Z7D55lHQHF9IBzHn1Tgk2026b9nUmqIF+1r/9ETUqJDkcGvpa9Z9/oEmkeu9sDVMrDOdGNPLeip+CwTSjmmorot8UW1DqH7eCEMM8Llc2wngPJ6KAVaU7ITiknZC7l1dqWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcqqCVv2NXsd1/6OXZlsH6fiGDUNKL4P55tj84hTWj8=;
 b=cVqttLw9N0p4Yi3ylPPOlXqM7TNmNMK0iEqWMqW1wrC+VjGw0CL01xVNvaSixjKQDGxkLNxlGYMBUgCH1OJyJEzHunzxED1r2Po7ck/HzUKt6b8pJLCJ/zLhQqDUbjqbuZrkmjj6t5ffkXnq3b3nLeIQ4RCEjO6yfmzpboYys+pgNfJgI6hydCfdAJfzzHVKSBBxJF81PAZYXeczONTK0KPcoT8PyYcjFhda1A3q9tfon3gJEel2bFYh3FrAVAKHV9ioWrGrizrlMyheh4nkNBN5IhUE/0OFR8gx4dAHcCTX6RziiXI8FaP7NYKRVVySbEOnRaxIXK7flZGm55kt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcqqCVv2NXsd1/6OXZlsH6fiGDUNKL4P55tj84hTWj8=;
 b=smM4CFeVmSdLbFTbU5GdoJFjWZyqOP122G8O4P+lZYQKOFVvk1vx6njz3p2NjUCtx2fzRYxDs1aTBHO2/9x95HB2HC+k77uNqvsHDWk4u4I1fvbPDUozQpwAqP+m07XBODg+yiA1FSwXirtu4dUA7NrjfNOLKUQnbFBskalKTP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 18:22:53 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%8]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 18:22:53 +0000
Message-ID: <9866ba75-0b0c-e390-5962-c2d7ca2065fb@amd.com>
Date: Mon, 27 Feb 2023 13:22:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drm/amd: use fixed dsc bits-per-pixel from edid
Content-Language: en-US
To: Yaroslav Bolyukin <iam@lach.pw>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230226141051.21767-1-iam@lach.pw>
 <20230226141051.21767-3-iam@lach.pw>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230226141051.21767-3-iam@lach.pw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0220.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::16) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a7cbb3-44a9-4e9c-cbbe-08db18efa41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uDVI9uccAjIZcdva356IexjhAFmXXEYYQlXVOizuqOOfypB8ogEU5XjVTeDbE+Otq7a7XrPqpPJX1drm04wsHQ36Hf+7MWjusayjYUTvyfG80YvOJTgu6fYCKc4xTGiSoOahQzcVUO4RmORFzKiyrmocb5WM0TF68ui0lrPlY3/ahMTgH9g15Zxz189iA18ccUjng2LeJa9+0j4a8GDIq9LVgwfyHctm84FYG240jhcmAIRAr7JYbltwmmT5VsOsN6fOfOEMyLDCjwdcN1vHAA7WTI1GL/vxcz4bK2BlMTXp+FHauoxoBEKAVBMjO8DcjCmXTarJAc600RRJ5UjGON61KaY6TJlaWVLBb7d8iMkNvDAYj++jHJE3V0NTMPHDfrjHTuxBiqHEuon7CCDwXUWXHiUEBzAmgKyLcn4y2rw65xUCX1Dq3g7eub/UUQghb62NzbBhG7T86eLbWcLFmmeHMbofWq+O7e5Wv1AbZgrC7kFqW+aaRSSjWTNIy2TjtTUtzwzAToR6yIIOmtZFow6fr1YgVQlP2stpaW6hDRDG4nJeX0b8x9Wd7meLuoxmdcI8/P1Pq6WpRRlXk9BUCIAaSaCtTidBkJNhg1QMxbgnyraZomznXyRKANoCGnFLPnIBWOc/GnE0ugBdRxo3WBUY5zQNUaJpTZ2UVwyjTGV9tg2GJTCLy0/6Tj9FCY3kJQVEoG+D1JIMrwv+3OdBy4orkXiVbB7E1iIXBctjfeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199018)(186003)(38100700002)(8936002)(66476007)(4326008)(66946007)(41300700001)(2906002)(44832011)(5660300002)(7416002)(66556008)(6512007)(478600001)(53546011)(6506007)(6666004)(26005)(2616005)(316002)(36756003)(8676002)(86362001)(31696002)(31686004)(54906003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGIwWHd4cVVGbUliMUVEaUFETEZmeW1UeEJ5K0diOWhxK01UQnE4bllOb0Mr?=
 =?utf-8?B?dFdQUWwreWNwRkRKampKS2pQVTdaM2R5TTBzTjF1Z01yNnJ4dU9UQnE4Qi90?=
 =?utf-8?B?WDg2dFVGbDhmSktnOTZhdS9BRWVMaUZEM0lUSU45a1h2VUhJbXY1NmJHTnRa?=
 =?utf-8?B?QWhSNCt3MENreHk0TCtKenlTemNOWGd3NzV6ekROL2JZVmQ1RjFEVmJMRG5S?=
 =?utf-8?B?YmVyU1ArbkduSitQaEk1a210MXhYVlFKUDlCWTlsSFBBMENqdzFTdTJMY0lC?=
 =?utf-8?B?ZFhQWU96UmhXVDNhaWpVaUZsQTRDTCtVRzVaZk9GQTZBdFRqcWlZNGpJWTY0?=
 =?utf-8?B?Q0xzejRTaDJFejg5ZDQ3RDdiQnhNc29lcGFSZnBjS05VZ3Z0NlNRYUJZTHBE?=
 =?utf-8?B?NTdVUWhmNHZ0c3psMkRGOWF6bVYyVUJ5ZTd1QVZMQnUzUjZkUEVUMEVuUEg5?=
 =?utf-8?B?dlBWNWNmMzJrZG1lM3VxRFN0THdtdzFzUHA5S2hxTm5XbVY1NHUzZVQyNjhW?=
 =?utf-8?B?MGN1YWMxU0psTW01L0lhME5yT01hV3gramhFK0xYOERlbVlYbERzWmErQUw5?=
 =?utf-8?B?RG5EZGtXcUtPV2FlamI3emljMmU1dWRHTk0vVUE0dkl0MjZJMlduWDVQanNH?=
 =?utf-8?B?YWRWY2VoYXRyYkpiRHcrVzJDUkVLQlpNMEFRSzFWRmltS2tYdGZya1R1dnJG?=
 =?utf-8?B?UzhTK3ZhZS9EcW5aYzNXR1JFK1BOQVZsVGRWSnNYZUlaU0JzSjdFVDdtUW9v?=
 =?utf-8?B?YXg3OVB1Y2dPRS9pMDMvWUo0SE1CdFBVQ3FpSEJxczdETlR6ZFNlM0tSMjU1?=
 =?utf-8?B?QUQ4SmZ2QUhndDZzZndtdE9xKzNNU20rWjlkR2NpZDFLdFBqaDRTcjNyZ2tN?=
 =?utf-8?B?MFlkalMySFU0Z3FNbXVzMXBvSE55TFVPcTZ5eDVqeGZrYzFMWk5ZQTFNSE9R?=
 =?utf-8?B?SnMyK20zVHRXdmRzaTc0cHowbnM4OS9FbHBQeG1oQTQ5V1plSHF4RGdjNEhI?=
 =?utf-8?B?YVN5QVRYT0ZWVmU1YitwcmE3OElzSXU2OW96ZCtJR1VKL2N2TFhLZ2JZeW81?=
 =?utf-8?B?eGZJNzJZVElSSkgwL2ZpSWVucjZSRjRETEROMTdyVTk3d0J2V3ZpUXErZ3Vs?=
 =?utf-8?B?ejd2a0w3SVQzenNDckdZemh3eUNhMFpIK1ZwN2RqZHdpTzBFb0dtN2dPYjJH?=
 =?utf-8?B?RDMwRGxVczVnODJ0cnlsZTcwcWR4NkQ2Q1JlT0puaFR6R0ZNSEI3TU5rbVdu?=
 =?utf-8?B?dFp5NUFOcUZ3cXZKQmpyZVlkU0NaemdBYklEMmVGWjBrNFE5S1hPSnlqSkEr?=
 =?utf-8?B?d29lb1YyRmF2QXVzQlJxZmRNa2FuRm1TV3o0b1lCQ0NIeUZFRU5EVjdKU0tR?=
 =?utf-8?B?TS9kT0hsQ3J1REcrajlmTTZkZi9WWWZhWWhqcUQ0bFBoNVlqbVNBc0tZWU42?=
 =?utf-8?B?UlJINDkvUWdMTWZGZ0dTSStWTDErVVl3WXlXdWN3eVVpTDh0Z3JiZXJkYktu?=
 =?utf-8?B?TEtNcWhZdXF6WWhmZFQ1K043elVKZlJWc1pkaTR3Q2cralR0bmsxa01hMzFl?=
 =?utf-8?B?UElCVFF1YXJFeHo1UmdiSkFBa29RNVVyNnNxcC9ja3NuOFRHeFBGVU41Mk9j?=
 =?utf-8?B?S1VjV2RUTGV3bnBYZ3FadzNUUjRYQU0vS2YxMk5Dak9EL0dZWW91aFFjQVdM?=
 =?utf-8?B?TE1mOEFNNHY0VTFiWlBaMVJiajdQVnl1UHk1V08vNmZwTm1nL1pSdExQcjcz?=
 =?utf-8?B?WmpnUk9oWEJGeS9OTHNhMkV6Y2gzNzZKZjB3cVpFNFJYVElFR2FBRnBmS3hV?=
 =?utf-8?B?bFFaWHhiUEcyT2xNa2pGaUhiTGpIN0oyNDYrcG5QemdWRW52cVJrQktySzB0?=
 =?utf-8?B?UEFPRkVMOGp1bFVtVmxwVm83V0g5N3YvVWUrOUlTY1B1Qyt0emVBQjcyTDRa?=
 =?utf-8?B?Nk14K0VBS1BySS9GbWdLdUJEY1psNWxLcUFYeVI0Zy9LOXVnYU1mVlhSSi9w?=
 =?utf-8?B?bjJCcmNmRmE0R3gyRUEwZnNjWUpPMkZXNy94OVNXbXMrUDRYOHNxWDJoakYr?=
 =?utf-8?B?ZmRzZ2hpcTl4Wlk3QnlGL0dERE1oVFlkZ1gvMjFDWjl5ZkdOdW1WMHpyYjhs?=
 =?utf-8?Q?/7mPVkkfrEmbflcf8egeOgzKz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a7cbb3-44a9-4e9c-cbbe-08db18efa41e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 18:22:53.5132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1k+Md0a8FbBL6jh6GZkVQR6+rPCRV6x6DogWinB/TrTHBOIsE/1vciB/rPkLCcI6ZfJqQZa4+M5t+ZWm41BzkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179
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
 Jani Nikula <jani.nikula@intel.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/26/23 09:10, Yaroslav Bolyukin wrote:
> VESA vendor header from DisplayID spec may contain fixed bit per pixel
> rate, it should be respected by drm driver
> 

This will apply the fixed bpp for all modes. I don't think that's right.
It should apply only to VII timings.

Harry

> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 ++
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c           | 2 ++
>  drivers/gpu/drm/amd/display/dc/dc_types.h                 | 3 +++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 6fdc2027c2b4..dba720d5df4c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -89,6 +89,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>  
>  	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
>  
> +	edid_caps->dsc_fixed_bits_per_pixel_x16 = connector->display_info.dp_dsc_bpp;
> +
>  	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
>  	if (sad_count <= 0)
>  		return result;
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index 72b261ad9587..a82362417379 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -103,6 +103,8 @@ static bool dc_stream_construct(struct dc_stream_state *stream,
>  
>  	/* EDID CAP translation for HDMI 2.0 */
>  	stream->timing.flags.LTE_340MCSC_SCRAMBLE = dc_sink_data->edid_caps.lte_340mcsc_scramble;
> +	stream->timing.dsc_fixed_bits_per_pixel_x16 =
> +		dc_sink_data->edid_caps.dsc_fixed_bits_per_pixel_x16;
>  
>  	memset(&stream->timing.dsc_cfg, 0, sizeof(stream->timing.dsc_cfg));
>  	stream->timing.dsc_cfg.num_slices_h = 0;
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
> index 27d0242d6cbd..22fedf4c7547 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_types.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
> @@ -228,6 +228,9 @@ struct dc_edid_caps {
>  	bool edid_hdmi;
>  	bool hdr_supported;
>  
> +	/* DisplayPort caps */
> +	uint32_t dsc_fixed_bits_per_pixel_x16;
> +
>  	struct dc_panel_patch panel_patch;
>  };
>  

