Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B007AB9CF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716D210E706;
	Fri, 22 Sep 2023 19:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B35310E705;
 Fri, 22 Sep 2023 19:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jznASR0fQ2X2gnuy1QSBlr/4pXSfPN9hPEP4iJfaxTzkRou6Jl/mjwSrm04eCOuSkRaXnCiRedXTmCg7mY+VvvSil7RG39t2QNuuPi+Q9cS+94cDqStSJi0oTq6ZCKcTyBnZgrM4afWR/XHFTSs8R2sTn73+NwE/Ch6FL4q5/9EcNGIRA6qRlg+Fhb0R2TnVdLHXXkwSeJpIsdGZnrNqP7l2lv1lIJAR+g91Rmzv4YBASYZ7+SIa1Gj12gUWeX6teggy3NPMVvfe/8e6RfVDMeGeX6CV6zRRhoUAAij6e5CExW1TKgM7IuJRCk/dxBCLhKOScRG4j3ULLzmHBCVeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OnhvIwOkWFAVUfMz3HYhFeeqJ8UprW+wsh+xqIWlAg=;
 b=lm8MbCoTlgHftbUo6IZK4MsBgGgUWtjOve5MzglWcfoZrQ6Oy7DYgNwvN8kDeERRnUFN5b4Em6CzwSFne/sYyN57ho3c+8CVG4o2MaG3jc2n4s0T3RE2+agQZAeC5qup329LqwfotW78JqcSANv0cLDAXT4+EHYTaWwFAIEBs+KO6v25om06WfIG6ZO22CmuayJjUqwJRhTORXFkU3/Gg8bU9FBKadedTqqtsbO5CYrT3BfbwDom88abAR2qBq282fuiITFvydl9sPt8PpOmN5aYwAgnFQXnrPIf4bUZdT4jrdgQmoA8CFXtzJX2GV/jJ+A5uCgLicgf3h5R/n3u7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OnhvIwOkWFAVUfMz3HYhFeeqJ8UprW+wsh+xqIWlAg=;
 b=TtZEOxBWy5hFGPhJYrur/FQGXpFW9mUXyflWBmTwzV32iE0+mfzSIczsptSTz/Lf/rAY+ZmxBQl1E6nBYEc70D0mXgVNopfGNEIfDL30bkZl3A11WJ25/gPTlEZOKVxFe/I2nY93M08EbqSo+JRRpmdIwSSSCsyVNKhl1VoohV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 19:06:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 19:06:01 +0000
Message-ID: <c317988d-5e64-429d-8e79-f87c33075330@amd.com>
Date: Fri, 22 Sep 2023 14:06:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 ALS
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-16-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230922175056.244940-16-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:8:2f::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: e58f5970-ccfd-4bca-8001-08dbbb9ef676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TeyAAesC2j8JIi2oFZkyBXXbmhLsThV0ZPJYtpfNgrik3g6MBqZRmAeN+Y3lDY9EAoR5hklSOYDA3mT5wrqWzyUvLdDbgr/2Tk5orGCi+R11Rp0p9IzvaPPv4qUYnKSDtWf0zvuh80JX9R0iup1uMitM+92NXiwhEsCNcptKxf0BnJXJwHy6i1vmRQp5X6WKsxeyX8GL81R8wBKiDsjCRhfQ9lGwLEFm9e9vaRMZJheSeVJfB5/N+rVWYJ+g5h/S5cbt3ZHR0P5vE3y70GOJhBLvmagKQJf1O90AEC5zZ4HCzsTYskyGhg+JAOM1Me0U9JePfAvDd9u935RbTQcNn6Zi5fbxKD/86RunslwYjzFU7Xc1k1q9utXMReo2V1GtCqQJgdIXI5TvLPOTSz23EgCyvXSFMNCXFUvUxhZ7i98lv+2fU5xGdX222ZPLJYpnIUfOpI/Gen1tUjoCfjJ5AHdbxmv9RdPue3R46OgwiI3KloJvbxc2zwZY1O4LlPdPBjKakSbn7qhtXePXuWYlC1Rg1W9/c6P9XZ1dTNRnQg0m6dIj4mCmknTBAwfZVvXDclMuLoLJS362dAfEBh7XEgGVx4Md1+OplTQ34P+EuVEaIvi57enLgnBDluA54GtQdGbPzEaq3iwtOeVklZzF4Huu0/X7DysUVug2mIOQ2ZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(366004)(346002)(396003)(1800799009)(451199024)(186009)(53546011)(6486002)(6506007)(41300700001)(83380400001)(8936002)(478600001)(26005)(2616005)(66556008)(316002)(5660300002)(66476007)(44832011)(66946007)(4326008)(8676002)(7416002)(31696002)(921005)(36756003)(38100700002)(2906002)(6512007)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2RlclFoQ3VHZWR6eDNQWGF2KzgyWjdqanNBN2I3WXRkNEVDMFJzMFZPZCtw?=
 =?utf-8?B?ZXV3SXNpejFLL1NRdHVuMVdUbkpRY3kybXFnN3Axbzl0UFRJWTEzK1JJaFQx?=
 =?utf-8?B?VVBTRUVsS0RMNU91OGljMis1T2VmblpzZlNKTXJMNXh0c0xLRFJEeDBnOFE4?=
 =?utf-8?B?YlB0YU82NFV5a0c2UVhCb2RZdjA4ZWZDekdmYVg2ZkhSVkhITkREOGNtMGJM?=
 =?utf-8?B?SEg1OHF5N1FET3M2bVFhVnhtZE1TNStENmkzVXkrMlNNU1JlcFZqMnFJeWVI?=
 =?utf-8?B?cXBVSlJiRVE1VmRSbFZBRHM1NENKdkowQUZDQkp6REZ2Q0V1VWpyNTg4Um93?=
 =?utf-8?B?cVM5NWRaSHhDM1AwUFcwSmtncEdMTlAvMm0vZHE4T2dkaUpqb1B0eU83ZjQ4?=
 =?utf-8?B?Z0RLbms0TTJ4dGxSMnVxaUlaaXRTQ0dtLzJOU05JU2Z0K0tGWmZ5cVZVSlJ4?=
 =?utf-8?B?ck16eW5UVFFGK1habE94dWt2VUpBazNpMWtOeG1oWWRPejVON3VncU51Zmc5?=
 =?utf-8?B?Wk1hTSsrajNhRGhBTFNEVW1aUW5PNGsrS1oxNDRlblpxcVBLNU9zcWlRaXor?=
 =?utf-8?B?cUVwd0RNUmNBb3F6VWVSMXFFdTc1NHM2SU9BdlIrT3BUUnVFZWpCZnEvVEJ4?=
 =?utf-8?B?ZHF5TCtKZmt5Y3A3MVF0NmNZRHUxUWUrcUFidkNSTTJXdTY5SHd2SU51b1Fw?=
 =?utf-8?B?V0JzUTNJQzZtVGNLbHFKa3VGREszMzJQcnJQNEVXSWtGNC9MT1hjdDMrTVYx?=
 =?utf-8?B?dzNndDJ0eWtOdDRkaFIraE5TWUZKNDBuc2wvTXJWckt2dU5PMTFBWEEyYStq?=
 =?utf-8?B?VFhZc1gwODVaR2FMRjJSRTVYUmxBUEJyb1FycEZtbzNNeXc4eFAvbEx6YzJO?=
 =?utf-8?B?L1JmVEhBdThDWG9JbDZxZjROSEhJQXp5VkhFbm00OTNYcnRqR1ZseXpTV2dT?=
 =?utf-8?B?OHhXVDIzQkNCRmQ4NENzSW8xVk5USzc0VjkraHdkdERKNFdKeVpWYzFSbUFs?=
 =?utf-8?B?VGJxZU1yTTRSczNrcUo1NFp3NlIzYnFZcVRSK2JranppM3plbWZ1anF1RFQw?=
 =?utf-8?B?U2Q1VEtrOFNFUUNuTytadUlPK1lzTmkvOTliV2lHdExCWVNlR1dnMDRFQ29F?=
 =?utf-8?B?bHh0QStDWTJ2dHlZTGp4Y1doM29lTFpUQVFzaVhPUFpuVW5RUnArZk5KSC9t?=
 =?utf-8?B?TVJmejZLYW9XK2wyNnp5TldEUEFUV096dmNCTFNjU1hwYklFNElhczB6QmZL?=
 =?utf-8?B?NWJ2QnluczF5WHdrb00wU3hZYzlmekQ3MVBzbHhiR0NRMXBxWEpBaVVEeDlj?=
 =?utf-8?B?bnBML2tPbFAvZS9BR0wvcXFGNnBGbmJGN3d6eDZrc0JuWmYyZVdmcEhRcHpm?=
 =?utf-8?B?c29NZXl1VkhVaUYxWFFIQzNzd21MWHlKZk9jUkp5NXZZQ0Fxckp4eWpPVDgx?=
 =?utf-8?B?cGdsdkZQeFlpUk13TUpHRTQvK0hoakJGN3lXM1BwNThzSWdwc2pSZEtyZjlp?=
 =?utf-8?B?Znhza05pZ2htVkhjYVNhNGV4TVhrem40Nk9tSmhiL3hZRnU1THV3UDB3enZ2?=
 =?utf-8?B?VCswNTArM2VxTDRFVC82SGd0eEhsL3BtaEJoclg5VzRpUjFzMnpGaWRKNngv?=
 =?utf-8?B?UjFvS09Wei9tUjE3eE13dDBDRjZmc0pSRTlDNmR3QTNsSUVRWS84WWFESlZt?=
 =?utf-8?B?TkIyR3dBMVIzZkltYTFWRVNJSS9pWE03OGNPSENmSDIzQUVlMDhmS0xSdTMy?=
 =?utf-8?B?NGV3eG16WHVRWVd2cTJNdmdlRjJjY1F1Mmt3NjE0Zm9CTFhGY2pCM0p1b0tY?=
 =?utf-8?B?YU9tT2lkQzFXMmNlMFJqcFZoRDZJMXhRUTRLTmNtUEdPNmFOSyt6ZWUvSTY3?=
 =?utf-8?B?MXdXQzRkU05BbWYvbGpQVFA3UlZrV3BsZUVMU3dZeG91M0VvVEttTDBLQUNm?=
 =?utf-8?B?SWx0L09aajJTei9qOFhsaytIbENsRVBjM0pFc0JFTUNjN05WMHYvbFFEdmhL?=
 =?utf-8?B?dU41cnBGUFAvL2dTc1lQOTdlUEEwcnlnYnFIUUU0OS84ZExmam5xUXNZUVB2?=
 =?utf-8?B?cFhBWWdHay9VWVhlVUtjNVVlZWlVK29MRHg1NUNRUDB5dmZ4WEFWaE4zV0ov?=
 =?utf-8?Q?+zcGGPKuXQLGmJT+KgHbsKHd2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58f5970-ccfd-4bca-8001-08dbbb9ef676
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 19:06:01.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOHhK85fN6PwAIkTWd74OcZJeD6qAIXtMtuQOmm7eNNXoyTowfVwklD6fNFyGdA9sv9dMDBwgMCHoqitD5OwxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/2023 12:50, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the Ambient light via the Ambient
> Light Sensor (ALS) which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 20 +++++++++++++++++++
>   drivers/platform/x86/amd/pmf/spc.c            |  5 +++++
>   include/linux/amd-pmf-io.h                    |  2 ++
>   5 files changed, 34 insertions(+)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> index cd57037bf217..a1950bc6e6ce 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> @@ -39,6 +39,7 @@ struct amd_mp2_sensor_info {
>   
>   struct sfh_dev_status {
>   	bool is_hpd_present;
> +	bool is_als_present;
>   };
>   
>   struct amd_mp2_dev {
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index 9c623456ee12..d8dad39d68b5 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -77,6 +77,9 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
>   		case HPD_IDX:
>   			privdata->dev_en.is_hpd_present = false;
>   			break;
> +		case ALS_IDX:
> +			privdata->dev_en.is_als_present = false;
> +			break;
>   		}
>   
>   		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
> @@ -188,6 +191,9 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>   			case HPD_IDX:
>   			privdata->dev_en.is_hpd_present = true;
>   				break;
> +			case ALS_IDX:
> +			privdata->dev_en.is_als_present = true;
> +				break;

Same missing tab here as previous patch

>   			}
>   		}
>   		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 63a5bbca5a09..2f8200fc3062 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -94,12 +94,32 @@ static int amd_sfh_hpd_info(u8 *user_present)
>   	return  -ENODEV;
>   }
>   
> +static int amd_sfh_als_info(u32 *ambient_light)
> +{
> +	if (emp2 && emp2->dev_en.is_als_present) {
> +		struct sfh_als_data als_data;
> +		void __iomem *sensoraddr;
> +
> +		sensoraddr = emp2->vsbase +
> +			(ALS_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
> +			OFFSET_SENSOR_DATA_DEFAULT;
> +		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
> +		*ambient_light = float_to_int(als_data.lux);
> +
> +		return 0;
> +	}
> +
> +	return -ENODEV;
> +}
> +
>   int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
>   {
>   	if (sfh_info) {
>   		switch (op) {
>   		case MT_HPD:
>   			return amd_sfh_hpd_info(&sfh_info->user_present);
> +		case MT_ALS:
> +			return amd_sfh_als_info(&sfh_info->ambient_light);
>   		}
>   	}
>   	return -1;
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 97293ae25cf5..8e19b351e76f 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -49,6 +49,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   			"Connected" : "disconnected/unknown");
>   	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
>   	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
> +	dev_dbg(dev->dev, "Ambient Light : %d\n", in->ev_info.ambient_light);
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
> @@ -161,6 +162,10 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
>   {
>   	struct amd_sfh_info sfh_info;
>   
> +	/* get ALS data */
> +	amd_get_sfh_info(&sfh_info, MT_ALS);

Like previous patch, I think you should look at return code here.

> +	in->ev_info.ambient_light = sfh_info.ambient_light;
> +
>   	/* get HPD data */
>   	amd_get_sfh_info(&sfh_info, MT_HPD);
>   	switch (sfh_info.user_present) {
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 4f82973f6ad2..dac0af573a16 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -31,6 +31,7 @@ int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>   /* amd-sfh */
>   enum sfh_message_type {
>   	MT_HPD,
> +	MT_ALS,
>   };
>   
>   enum hpd_info {
> @@ -40,6 +41,7 @@ enum hpd_info {
>   };
>   
>   struct amd_sfh_info {
> +	u32 ambient_light;
>   	u8 user_present;
>   	/* add future caps below */
>   };

