Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2496A442A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 15:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B5510E413;
	Mon, 27 Feb 2023 14:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C49910E413;
 Mon, 27 Feb 2023 14:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYxAdH2bewmOscqwbZVxsaMtAa8vMO5K8Wn+LDSVf7FHRECxCVKTRJ0S34CnF1AbBHcL7RI0FkDbFdAFhoaVbxUxgD2vAqhF4K8wRQaKr+1lNoBDljI+jwgqEqeXZn69p+oZ1VSteiQzdoHwsIkMl4laLpMruwJQEMQHlSBxlNrXPRsLTG51qqOsqqJ0nt76t4JFyCbRnct8WLfpytbiFHIEp3vFaFNaifb4rFIIiA4g17STSv2lw2/mfB6RBvZmdz7jRtLFwFU3grbiIbVm9BF6jlZu5kFXtNFV513gpar5seuuu7I0eeONdkuaQoWv557j4Eb0AJMUrg5umUy3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6mAd7vZlatsvU36fI9qjKB+U27EqBLthVv+GWqQsz4=;
 b=EECnUh+XNvKddyWPyGc78JF/HGFDNzyUH1tFhQCapjuDcKny9ZrrYbYZJ3FE5+kitmRsxubsGtubOZCXjupkLtimYJYU9M66JRiv0hiT1jUTRY7JkX9qFsmk6wGDh0DzV3VF8iV4hTH6cKtLYGYHJy77GhDnnFN6AdSCH28ke2YAWeVDceSawEE+XJo3zRw8cmB53K5mD6nwfu0O9GE9AHAyFO4bT7K0SXTl58FSX7IFcghuqNiNlG7AOsI+JJUG8h70FeDKAdtiHJZRfVhu9n/QexWd9GDUEqQKUuAbLDGCZ6HIjiV2GYjBjXhxkfiJmLG0csW6lFs1Oowkm8ct4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6mAd7vZlatsvU36fI9qjKB+U27EqBLthVv+GWqQsz4=;
 b=k1XAP8TLlEZBVkEVrEXJKFFUtynqo985YN5g+tR+yIT7gyJcau5XbLuBnt5hMjvHAwWYjETsXNIvwQhl167F5/JIDGJbs0d7/Qf+GeVrx0RaZH6jYcsbeMZczMmaq2I780ufhZNwRhlX9qsDTiDJCs9F/8o2mddpi8TUlaYTciQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:20:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%6]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 14:20:18 +0000
Message-ID: <2975957e-51a9-fc44-9157-f3c4dba3cd0a@amd.com>
Date: Mon, 27 Feb 2023 08:20:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] amdgpu: add a filter condition when set brightness
Content-Language: en-US
To: Yuanzhi Wang <wangyuanzhi@uniontech.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Bokun.Zhang@amd.com, tzimmermann@suse.de,
 hdegoede@redhat.com, jingyuwang_vip@163.com, rafael.j.wysocki@intel.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230227073953.326-1-wangyuanzhi@uniontech.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230227073953.326-1-wangyuanzhi@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e04c800-27ab-418b-07ac-08db18cdc0d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7UzqEMYRJCqVzI1Xtvs7Xi6OI3URM09Duh+ipbX8MiOzdnLLFlv9pa4s+8T8j7JIxIHv6whkXVH3oJs1UPNyfvc4h84mvecC7vmzHf3+CoQbDxExhKlEdKLmI0RyoAZgNLQHTV/jNZ3YkgUweguAbEnQ1xsV2yjxj0srJr3cIEniphoeeaFcc6Y5iWL6jvDqPuCyQlA6GwnCp4IV139W97dwpMGxv8Fym0NzfEruheiRNI0InnFpvbnQawCtjr0YuUUIdHqP8bT+RQt1xqzENK0m/ZvaU0CmSqBUTcvAvwDDaFIok/OcEC5FVtDmzHi/UvJrFnneJkaokGobjB62x0CbO5vX/clxjN9u1TPlFh9Nc5cAXlV0GYPSTavr+W07aby+fGmZ8DFlyKpgQyn8C1vYLfLRANAGJ++YWZbxSyMRb42dK1FRunt9wWsoLBy8DVQM64m/lzokzwhL/tunlHPaSj9WtpOCSQ52JGv6r41y8qzXRRWhMCymdOvwSbB5ur17+hNDod1Oiy51lEP/tYkXJaSZdDb4dDNAqisuYvt44F5+LIUI/NB8fQB4i2oHbZCdIbOJaHdorZKnVEnrvfe33oJaJR331X5sMZHEe4bzVmLA+kdOxGBQUMTRI3WwFS5Yk/66ASMvwS1Bmt3b+hIvVCc7qbxtj3KSiNaHRw+OAxDgJfh7qcOl8C3VytB3II+reC2EhKuafDaSkPrmvaN7zN6pANFcU7SbhrDw3QKoHDrI97M3FvC7MjJS2fot
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(8936002)(2906002)(5660300002)(31686004)(7416002)(41300700001)(44832011)(66556008)(66476007)(66946007)(8676002)(316002)(478600001)(6486002)(6666004)(6512007)(186003)(53546011)(6506007)(2616005)(86362001)(83380400001)(921005)(36756003)(38100700002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVZkbFFPaUM0Q0FkL2QwNGZXWlFTbkZINjFWSlRpZEd4L2w0TTJtYUxJYU5T?=
 =?utf-8?B?dXJkRkFXVGhNc0RleFVkd1daOGpPSXRhalhKUjdlTnQxNEE5RFhLM0ZadVlp?=
 =?utf-8?B?aXhUb29QZXNrRlFva0pGWEFMTm1NU1pSU1FML08wbXdRSTErVlRuM1ljYkJr?=
 =?utf-8?B?T3gzV2Y5ajFmeG4zOC9QazFFRXowVENFOTlDTVMvZFdKbjZCZC90YU5kTjVK?=
 =?utf-8?B?U2ZDWW9LcEJxTEJIMzljQnlUaHRiK3ZnRXlhc3VSOWxaaFVpNERZd1Uwc1Rn?=
 =?utf-8?B?dDRZRXQvbzg4WE1lSWFWQ2J6NU52Mk9ndnE3OHBTZVF0TUpGckxkVkNlZlBL?=
 =?utf-8?B?eXpndmcycFkrUVpPVUJ2R1NQSU85R3ZZN2dpaTRLYnIzUUlIQW9SZ1BvNkZE?=
 =?utf-8?B?UkxpOUc3WTZ2NHVpd3IxdzRNRlE5c29YRURyOThNTDVRUWJBQkRqL05pYkl6?=
 =?utf-8?B?SDUzdXEzc1ZkSDNic3ZsNm5wYnBMWGpGTmxrbkhTV3JjWjJZR0g4OUs5Rmtl?=
 =?utf-8?B?YVdsVDJSOUQ0NG9xT0xGbWJTWFdsUGdsM0gyNDZJdkVNUFVYaDFsb09heWRC?=
 =?utf-8?B?VG14RjN5VmhsTHRrVEMxNGNkeE5VSStGSWdSWmk1M2U2MlVLdWZLYklWZ2xO?=
 =?utf-8?B?b2ZqMEVrQmNGSUR3alh2TzVncFBGd2RSd1Y3aTFTaks3cENrai9ucEZvYWRC?=
 =?utf-8?B?UnFGZFRqc2RJLzRPbFliczZGdUc4M0JIUVRiSktVdmo5QzNNWHEzYU9jTjdx?=
 =?utf-8?B?OWp6SHdpampHQTlXckE5ZU5JT3NJMURqU1VXaGtaa24wcFUvVzJiK3FmMDdy?=
 =?utf-8?B?SlA4eURWcTFRa01EODRmSWN1R01vbUNNRld5WklwRWtyUS9mb0Nxa1pMeE9P?=
 =?utf-8?B?N1FBQnlmQ1ptWlhtaHdmRU1RUmRRUEZRbSswR2pkN2thV1JMWSszZ0Q5a0l5?=
 =?utf-8?B?RzBZVHplSXRUcDIvdVVjWlZmdytmNVRseXU4Ry9tMzBjL2xyNUpoYTR1MDJl?=
 =?utf-8?B?MmdnODRkd3NGWDZ2RzlveU40ZlNhZi82WG01SE1vcEk5UWNRMUFzaDU1aGJK?=
 =?utf-8?B?VGZhR1FWMXYzMC9PSFpBb3h1dlFreFBlQW94M08yWDVBOXIzVmNIZy91VDhE?=
 =?utf-8?B?cDJna3RhNVZoZUNWRGdBRktOS29YUFFtU0swL3Q4aUwrV1FaT016Y3F0QU9p?=
 =?utf-8?B?Qzcrdjhua3pPOWxVT05KYXQycmxIbUlMOG1SaVhKelFlUnhyczYwdFBDbnBt?=
 =?utf-8?B?cjZTQTlSNWZWT1NlUTZxcWltVWp2OE9FTmZPNVpOdytDdy9FUWVjZStDWHBy?=
 =?utf-8?B?ajFQNEV1NXdrcml4NVVrSnFBbDdiUXhQSFVFR0NKYVdoMTZWSUV4L3Q4VWox?=
 =?utf-8?B?dFQ4aEFjRWhWM2NDcmd0d1c3WlJMWm96U1hWYXRKTVZ3UWxscDhON0ZPREdD?=
 =?utf-8?B?ZjdqcFdMUEdFcDV0am1laEx4aTFWWmtsc0s2aE5ReERYTW8zalFaODQ0MndD?=
 =?utf-8?B?V2tEdkRnaWNqSC83RHBZQUhiTjNaaTBYWldGVGkzMVZ1ZGdxMHFMTUptcmFG?=
 =?utf-8?B?bmY1YytMdXNrUXBZMmpLTUloR0d4Y0hoRXpmbXNXQng5Rzg1SjRRc3dZMlNQ?=
 =?utf-8?B?cFFRRy96ZWEvY2NGUlEzNkZSVEVoUGVETENleS92eEVGbHp3TlN0emlCN2ln?=
 =?utf-8?B?RXU3QnA0WmVBQTZRNEZlTXZob0dxWmRCV1F3ZEJQQ2lZT3FSQ3hZZmFQbmcz?=
 =?utf-8?B?MHJ4am9rcjdUeVFhVU9MWk51U3JZLzErOUxURWtKLzhoS3FacFhidXgyQ0tx?=
 =?utf-8?B?NnN0NW4yUnk0RkpVSlk3TG1wVys5SVM5a3dGZ25hZHFaY1l3Y2VVZGYrM2Zj?=
 =?utf-8?B?OXdDeEpxQitWdmFTMG5Bd1V0SW1VQTFoeEdCTGpmbmRuV2pET1lsMU80MjZq?=
 =?utf-8?B?d1JKQTJxTmUyMEg0S0xMSmJrMkRkblpCYWpoeWI1YmxjME9NZ0Q2K3pKK0Vt?=
 =?utf-8?B?MTBJNEYreitndFdheVhkYnBTRGw3N1NJb0ttb1JDaGNoS3JOK2lKcW4yQzNz?=
 =?utf-8?B?cEE1T3lnRVlERXAxV2lkbjFoK2M2bnJWTTMvQmhZR2drS3NRM0dwamVGN1Qw?=
 =?utf-8?B?YjgySmJXeGd0NEJFZ1RrT29sRGJieUlnM284TCtRRjhEVWdtSUNSMCtsMEZ2?=
 =?utf-8?Q?/zFh0ZF0FtUgcg7bg4yDNICkSqjxkR50Io6TgVbD/WgT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e04c800-27ab-418b-07ac-08db18cdc0d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:20:18.7597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anUKTWaFmfHpljV38Mw/IWYqgaj9xWR/2fRJ8+Fhz6tdWXPNXVmoDFagpvadoksjTFPvPJPfzMGdJw2BZwXZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5086
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/23 01:39, Yuanzhi Wang wrote:
> When the laptop is plugged into AC or DC power supply,
> the brightness obtained ACPI may be smaller than current
> brightness.As a result the screen becomes dark，this is
> not what people want.
> 

Do you have a matching bug report with more information included?

Some relevant details I think we need:
kernel version
laptop model
BIOS version
if it's the latest BIOS
some sample numbers that this new warning/behavior catches
acpidump

At least as described this sounds like a BIOS bug.

> Signed-off-by: Yuanzhi Wang <wangyuanzhi@uniontech.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index d4196fcb85a0..93f1567028c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -406,6 +406,7 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
>   {
>   	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
>   	int count;
> +	int old_brightness;
>   
>   	DRM_DEBUG_DRIVER("event, device_class = %s, type = %#x\n",
>   			event->device_class, event->type);
> @@ -443,7 +444,13 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
>   				 * hardwired to post BACKLIGHT_UPDATE_SYSFS.
>   				 * It probably should accept 'reason' parameter.
>   				 */
> -				backlight_device_set_brightness(atif->bd, req.backlight_level);
> +				old_brightness = backlight_get_brightness(atif->bd);
> +				if (old_brightness > req.backlight_level)
> +					DRM_WARN("old brightness %d is greater than ACPI brightness
> +						%d\n", old_brightness, req.backlight_level);
> +				else
> +					backlight_device_set_brightness(atif->bd,
> +						req.backlight_level);
>   			}
>   		}
>   

