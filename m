Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512947C00F7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF6310E395;
	Tue, 10 Oct 2023 15:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA18110E395;
 Tue, 10 Oct 2023 15:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy5U8Yf3IW/82zvk5GWIQqZ3jWMCuBo2ndES/XLmRmzJKlGi7NDjOC2ArtuSQkg8VXbTPpJqXOfG5pkOhlPJflsbWy2ab9b4ubOvuIjEw4yAteypz+1UuXfzUh1OCfzSo16ZFVXKyiLgZCgmz9TRSAhxRwQw7jxaEpp0xw0Fw3MNm51R4oaAhx/JtEh2PRqFzv9uMFJzqAN/psqdU/ZjS7NbQ5bHi250/6lm+WFI5bZ3tdh/BIPwtwSwntYObPVOB6EpgE8ihUYeRohvOIMuIpJ4lKTQBM6JDte8iqTlYYBKPgiSkBAwUYiY6lGAxWqS3F4wD9kbiKxelhwJyb17PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHYHV9vIa1FlqibHyLqishfOQotCnEcacjOI4xS2iTU=;
 b=IUw3fJSY2UjRw1opix4WLZ6A6RosYvKdDqQNL+enJfOPUbKTGdCU1Svu/RlgPDMAVnHQ0iiJqUFhyEKN1MuaOJvYy92ocdyQWZwXCl4oe4V+3v3qLURexDOvkmDGmRPFGQ+LjCUMZyEcOasVaOkOiueB6AFps9QTH22MkVx5GZeVCS1ABGZX5txigjXSuKqzlyO8yqCbq5r1OpCto5PiwJ/jW6djTCGb0bnQXPLfyTSqX48vgewYA74IhFfc/bRG9oiVbCh5OOM/VfmWo+JNXDP96tAvM60Mk0K8ZlE050b1pdIqTexIMv1G/5psTdp1xz6xaEBSTt2/AA6Gy7MieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHYHV9vIa1FlqibHyLqishfOQotCnEcacjOI4xS2iTU=;
 b=c0egxm3VwJYqcW4RVHO4cJCAGZr9qDqBxqiseCWFeCJaIKgVlmZqzp8cCCcXeXhQCZ6DnWYWEGYFw8L1Uo7/Yc0ayPqvrRFgUiXwiKHeqt5VyFfx1T/FkeMYyBCT7IIdAHbMZy8Gif5fDtnIQRbx3s5sUzzNnVqWwMqJbqcVqSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW3PR12MB4508.namprd12.prod.outlook.com (2603:10b6:303:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 15:59:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 15:59:53 +0000
Message-ID: <8f66f473-0f41-41eb-80d9-5004f0582d00@amd.com>
Date: Tue, 10 Oct 2023 10:59:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/16] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for ALS
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-17-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231010125917.138225-17-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:806:27::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW3PR12MB4508:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3a7c29-3a58-4f89-309b-08dbc9a9f0d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k7CCRvby8tL5aTpUcyVXCuBwktkdIwhk2WGitQvf6e5rNq9qbuBGu1JVaEGD0zkPPlEueLALOqgYtWgKA8IqzdZb9MqhhBzXeYnxksD2nhlPawgjT9CYigcAb1EtMV4GNOaIwS52ozJADLQ7iX53Y5aemJHW+wmlXL4wwd7lpcAUftpgWPqvCoSRv7V12BupbMmmoeIZBEcwz8NghgBkpZ21Ww5z00iyI4mphHOfuH9p+6TT5ReWvv7TpgtZsRR+Thlu/JwMTDpn/rSXcX6QRV/0z8Yatj2gOSU5UuFpaN7LuownmGldYdMpfvwrAuWsMFG++BSF537KuQrm1HCiYxt0HspEEuho8Nzcwnvw9G7GtiMMcLaz1rkPDG9YGY6mtchbRNl/8IcLRJNLGa/HH5PAX0/b5cHxxbS0LYdZ8BzDiIhtBgqdLX90/A4g2s6opyVnTwukHwHhhRXAdky9LoiZnF5BcV25K6a9+4bsTWxVZx1zuCJnfwinOnlAjXxOt+86cjfNHtAT0quFgU5IkUIrzzaQTbSR9wIgiSEtmAMIvLYroaUD2iRmWIoQFwB0QMwl5b0ApKJBT9MM+hurTVqFW5AXvp+ROys1LA7gwNHZQ9SrdwXRBOFepOX9O/3PQ8s9pURF5uRkcjlGj0eFlncnfc4WY1SZnHw18LCfE3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2616005)(2906002)(6506007)(6512007)(66899024)(53546011)(921005)(31696002)(86362001)(38100700002)(36756003)(26005)(83380400001)(8676002)(5660300002)(8936002)(44832011)(4326008)(6486002)(478600001)(41300700001)(316002)(31686004)(66556008)(66946007)(6666004)(66476007)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzJ3NXdJVHAxV1EySlJOSTRXUDV3WHhVeHB4ZE5xMWhZVFZNRVoyWWozWjk4?=
 =?utf-8?B?ZTk2M0N1bmRnL2NLT1hTZVBSQk13amRZQ0tJWWRkdmxZZ2NwVFE2bXJsWUQ3?=
 =?utf-8?B?N3F6cFZpbjhDcStxUjVXWFJ0VmozRStTV0UwT01zYUhEbW12Mkp2Y0VGYVJp?=
 =?utf-8?B?SW9TbWl2ai9XV082dzJKRkY2UmwxTlJlYzJxU2twT3NzRDM5djRyUXAwUDlJ?=
 =?utf-8?B?OFNlakJCdEk5WVo0eGkvK1ZabCs4VVduZkN2L2MrK2sram9GdVlVd28vR3Rv?=
 =?utf-8?B?eWlwdXNGOUVpNjkrNVNTMlN0MEZGWjVJTEV6NWR4YXV1RlBYYU0wNERYV21H?=
 =?utf-8?B?VmFsam4xek9iZytrV1VYSEtuN2Z0WFRKc0xMaHE2RG5td1NSaStQWXpIZVJs?=
 =?utf-8?B?aWJLdjZaK1N3dCtqRjBvK2xOZ0pwYnRrZ2RxNm5pV1lWck85RzNhYjltTkFk?=
 =?utf-8?B?VG9CS28wVkR1SFVJdG9JcWxObUZKN3ZXYmovVzNxUnljb2VadG1vRnZhVUV0?=
 =?utf-8?B?bk9OSGN1MTRjOFpWNlhJTTQvYkJYZCtEZll0ckJOeEtvYkEwQlU1dnBxdTB0?=
 =?utf-8?B?cXNBSjQ5eUNFQU5Tdmg1czJ5dmFaT1VuWi94NmJ4UnhjUDk4VUMvLzltVzZi?=
 =?utf-8?B?dGMvNjJReGg0SkZPdHNiaUw3ZVEzZkI2eWtINk9mN1hGQnZpeVprWWhvcXFH?=
 =?utf-8?B?aXpLRUVLcWc1OXRVN3BSTS9wUEZVdzBQdGJ5OGRwL2lxdmJLY053K1B0YlIw?=
 =?utf-8?B?bG1vSVkzWVNBTW1WYmViV0NnNDdGZHlaV0VaKzJZcDJIdlNNaUZrUGZWRFRC?=
 =?utf-8?B?N2VSTXpNZkdiays5Mlg4TEp1UWRUQld4cllZTUx2aW1vT1FQSzQ1cEJtMnFG?=
 =?utf-8?B?VGthRm9QNksxYVlQMXJRSnFMMmc3Q3FPQW0wdkhiR3YreHZFbmtCNk1uWlRL?=
 =?utf-8?B?VTM3cm9BcnloL2xTNU10eUdzdEhsRDlvVjExM004NTRqRDVYcDFyd0pSNmpB?=
 =?utf-8?B?UmtWc3I3cnJwby9MSCtyY0l0RlcwUEp4Q2ZiTTlMWWtOaHpXbzcydEtLMjlw?=
 =?utf-8?B?aFc3OTA1Mjg2Y2w1VlJBQ3M0OS9jN0NZVFdscVpCcVVLdWc5RW10WVdxazJU?=
 =?utf-8?B?ZWU3dEdCRWpNL05TSWtNdG1YZ3Eycml2aGVBQUtnMzRlSlJKTDltcmhwa2F2?=
 =?utf-8?B?THhVSnhySlNmZ0o5V0c1M2ppbjBpOVE4TTNkU2QyMXQyVmhhRFkyQ3Jsd2kv?=
 =?utf-8?B?ZFBMYUFiN0R6RmdVYnBoL1lTaDJmVzFWUDBvQzhJaHUzVnpUTmR2eVBGRjNq?=
 =?utf-8?B?aDJBeXFWZkl2SE5kTlBySjdrY0hrcytRQWl2M3M0WkdaVlBURjI2VGlLQm04?=
 =?utf-8?B?NExheTVmUEp3bFk5Y1JFS2FOMi9UOE04d0tqUmYrakx5c2ErMEl3ODZVQndh?=
 =?utf-8?B?MUhNRGVxNWVwbFJqZDNDWDF6Kzh0SDdYSzlVWUVzTXQ0bHl3MGVoRDNPOEgz?=
 =?utf-8?B?NGtLN25JaUJHNVhUd2dnamU1cExNS0s5K2VxcWIyRlBoRVE2QnA0SXR3Qjdl?=
 =?utf-8?B?a0VhQUhxQjVRV2FlNWxZQ2ZMNjgyNUJuM0tWbTl6V1o1b2dtNm8xTSsvN1pv?=
 =?utf-8?B?UVdxdG9qOHZTbU9GUm1aa090endwMEFqa2NXWGtrOGxjaFhaTHBSTWJ2ZXRu?=
 =?utf-8?B?dWpZcUR5d1JOdEtkUENXWDczTWdOWitaamkwdTEwbnlRYkJEanA3VXhUZyt6?=
 =?utf-8?B?cU9ZZGIycFNsVGRxR0pqR2lMclJYOElDejRXZUtCWTFFdVFlZ1B1OUFUN1cv?=
 =?utf-8?B?QmMxdEloVm12T0NUT1hGc05pY1pUenRIVnVLc3EzbVg5TG01cjZPRXp4YllV?=
 =?utf-8?B?MWthNWJTck0rYnpaVXh4TzdXZ3NYbzRsSDRFRW1tMDdrSStMdE1VSWxRM1JZ?=
 =?utf-8?B?QnBscFVsWURBdWx3SnVUS0YwNmtLcXZzUUR4ekVHTU92aSswdG9mL1htSDh1?=
 =?utf-8?B?SEs0eUs5TTljbm1lQlo1TitwVGdNUUh1UFk3dDN5WlhzYVREcHphSGlVVjhU?=
 =?utf-8?B?VGN1QmdicEM3RXBFaDFlRlBPOC9vQTloR2d5WXRZcmdGVEtUQUdXaFJSTGJl?=
 =?utf-8?Q?6Q85qNPUzXayrjE7TA1voWekD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3a7c29-3a58-4f89-309b-08dbc9a9f0d3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 15:59:53.1696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d08IDriBgAzzj3lFiMrtHd52Rol+ThrxgJ8D2OYMuHXGkqMrr/0/zkicf1YFWEk68wEXrFdyJG91F4+oQfN7Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4508
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

On 10/10/2023 07:59, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the Ambient light via the Ambient
> Light Sensor (ALS) which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> make amd_sfh_float_to_int() as non-static function so that this can
> be called outside of the current file.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  2 +-
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 20 +++++++++++++++++++
>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
>   drivers/platform/x86/amd/pmf/spc.c            |  7 +++++++
>   include/linux/amd-pmf-io.h                    |  2 ++
>   7 files changed, 38 insertions(+), 1 deletion(-)
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
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> index 47a87b28e00e..dbc8c6943ca1 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> @@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
>   	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
>   }
>   
> -static int amd_sfh_float_to_int(u32 flt32_val)
> +int amd_sfh_float_to_int(u32 flt32_val)

This change might roll into patch 14, but I don't think it's that big of 
a deal.

>   {
>   	int fraction, shift, mantissa, sign, exp, zeropre;
>   
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index 3dc652d41d7d..f2890d329459 100644
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
>   				privdata->dev_en.is_hpd_present = true;
>   				break;
> +			case ALS_IDX:
> +				privdata->dev_en.is_als_present = true;
> +				break;
>   			}
>   		}
>   		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 7637da0dec6f..48a7a450e029 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -94,12 +94,32 @@ static int amd_sfh_hpd_info(u8 *user_present)
>   	return -ENODEV;
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
> +		*ambient_light = amd_sfh_float_to_int(als_data.lux);
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
>   	return -EINVAL;
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> index 9d31d5b510eb..7ecddad430e4 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> @@ -149,6 +149,7 @@ struct hpd_status {
>   	};
>   };
>   
> +int amd_sfh_float_to_int(u32 flt32_val);
>   void sfh_interface_init(struct amd_mp2_dev *mp2);
>   void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
>   #endif
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index e33bbf8a3de4..b6cf6d7e6ef5 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -50,6 +50,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   			"Connected" : "disconnected/unknown");
>   	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
>   	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
> +	dev_dbg(dev->dev, "Ambient Light : %d\n", in->ev_info.ambient_light);
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
> @@ -161,6 +162,12 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>   static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>   {
>   	struct amd_sfh_info sfh_info;
> +	int ret;
> +
> +	/* get ALS data */
> +	ret = amd_get_sfh_info(&sfh_info, MT_ALS);
> +	if (!ret)
> +		in->ev_info.ambient_light = sfh_info.ambient_light;
>   
>   	/* get HPD data */
>   	amd_get_sfh_info(&sfh_info, MT_HPD);
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 76e42552b62c..912d341d5fbe 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -37,6 +37,7 @@ void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
>   /* amd-sfh */
>   enum sfh_message_type {
>   	MT_HPD,
> +	MT_ALS,
>   };
>   
>   enum hpd_info {
> @@ -46,6 +47,7 @@ enum hpd_info {
>   };
>   
>   struct amd_sfh_info {
> +	u32 ambient_light;
>   	u8 user_present;
>   };
>   

