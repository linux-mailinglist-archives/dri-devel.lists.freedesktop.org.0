Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467FB7E7A15
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 09:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5292810E264;
	Fri, 10 Nov 2023 08:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDBB10E266;
 Fri, 10 Nov 2023 08:25:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMmG3m8COV8f9YJKnJQwY9LDRPFJtDyI7dXcBZ2FxywP2IgloWX8cShOfy6vDmveKXZrE1nQYeWz4ynkZaV+HVYaZ3i6tP1z9fd5qbeGSeBDp3e1hntfxA8DsBVaudab6ngepF18enalmSqZ0MAowSdP+AgoPlLuqvOFsOD9mfa43af7hQqtqzH+W2h9k46whlTjrS2eAE5O2ysHBLRNK7i1FNzr3rAAixmFfdQuXEkSmV5n2qbZ4YkvIwHT33l4AAEbrja04YzyfOokyPQMfq8tTE0neQfTGlr7XdLd9LSZJU6JSZPp11oiDKTKCRE6TZ+wdCfqFT4KJi5cIWO2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCiYDQyGe4rHbWT9wIjpaOWhtBBmZdBt0P6F36xj21M=;
 b=H9jlIBMKrpIt1UWZ0W6ukB6Zz1op9w2UsCiPla8m9KZQkESg3REzuUw80BSL2Z0lHxIKY9Kbrfc+Krd9HBsKC3PR9fSVopkGcmTCT4Uy3GMF+U5M1dvxfRm6CtN05gB1vD6UPzZtdB6b//i09HCehZbcokZF2kkCmCicsqRPzYLgFMD2FmmEu6pKVPvvGCuvFcp7tFZGgRf+cJB5TXGrQQL1sgSmvYp2o7vODNz0B2x+dvcS28qV0MhvLQYB9O0LiOAwrtYWqgCVpZSEj29OgzNg/GOZE95wa1Yw1j4Tfr3aINN8KE5lGi54A+cIaYmjUvtUpDt5crpbXEkIHAIwpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCiYDQyGe4rHbWT9wIjpaOWhtBBmZdBt0P6F36xj21M=;
 b=oJl3xaKrKpc3QmNlq+O4qJQxbUiQ3jZ8pKSGsS51CC8u3Nfp+zkcOaMmNeUfMZ2QPExVulpI/N8A/nx2EDqUbcI/JwEX2V8CmJXBSXupnoiESUi243H1Ir04YTPfuiMnFTFboBKsriEAwVBgjjjvNyb7qceFlACBWQDaCTAdNIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by MN0PR12MB6126.namprd12.prod.outlook.com (2603:10b6:208:3c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Fri, 10 Nov
 2023 08:25:40 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::c258:1e94:a85b:1510]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::c258:1e94:a85b:1510%4]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 08:25:39 +0000
Message-ID: <6e26746d-5e4a-cc9e-fe5f-20187313fbfe@amd.com>
Date: Fri, 10 Nov 2023 13:55:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] drm/amd/pm: make power values signed
Content-Language: en-US
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, skhan@linuxfoundation.org
References: <20231109084110.4056-1-jose.pekkarinen@foxhound.fi>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20231109084110.4056-1-jose.pekkarinen@foxhound.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::19) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|MN0PR12MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: e45df5a9-eb37-46dd-4bec-08dbe1c69f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Fm4F4DgqL0zvRXIa177oFSbFh+uPX7zV3nyLy0i2PirnkkSFgiTow9IQNuIU7S1T5LJNPAIAZYKQB+qety4b7xvanQDijefq6avS6sJ1Q7fZn4YTJcDX++sNQa3vt+QHcrjXQ9zatWhS3wGEq4urrSlzLJfr+V9hjM5kNMdPi0PDWaWTXge2xmCQgFbAw1RgOhWWDeAdZmmOKJFNRKK4HR03fAfH4Asgf1zuKbJ9V89bWQDZ+bon6rSrJ3Pigv4yCyC7otngWp/MiD8+sNkMWTSDgJJHmaWbesytuw9FNrabi2ud5sNSDzGfMOe94/MFCQOFC1amQ7lGPQEOPJyvQa4HcwUDBf+aNW5dS74acZVc+dBEWcxoMR3f+EhnFLwjepDbxsLnQJXnUzuROKT6knLCz6WMqkatsq2sdaO3fSAdxQPmVDuQnmRHfewempAt0Vi9wFJv4v6XRE6uC6sdfyl+etWDQfm6O1wZiooajbC1rZ8irFpJnds3lBIEUuUwe09BZVtpoFA6kgKRcyL3cCbLTa7wQtdWxvNkYpUNrGQSDwvcQUW/sMWzqcPzgNduoc9dPZEAai1qdn4ADpUQuV2I7o3eZKDbb1HtRej5LDqwtJWp7BO7YfhCjGIqx6Z46rfiPgY67D6ozxLxxHFKubZaEM56SeFQzoK/gSSiDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(230273577357003)(230173577357003)(1800799009)(64100799003)(451199024)(186009)(4326008)(316002)(8676002)(7416002)(478600001)(966005)(8936002)(83380400001)(66946007)(6666004)(6506007)(6512007)(53546011)(2616005)(6486002)(66556008)(66476007)(31686004)(41300700001)(2906002)(26005)(86362001)(31696002)(38100700002)(36756003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3NWUUNqTTZyUWZ3V3M1dEM2Z01LNC9XT01ENGtpczkweUdzNzV4cFE0OFg0?=
 =?utf-8?B?b1hQbUZXTzIvTWY2T0J6K0NNNTBpNGc2bmpxTmNsbzhrbG54UEJzc0puQ3RM?=
 =?utf-8?B?SDZsdjFnZTdGRmlKU1VlNWlkc3FRcEdBaG1aZy93SzRNUjlIRGJENTk1QldY?=
 =?utf-8?B?UlEyS1VrSDlwWlFnTjVrM0JabU9kTmpKb3hFWGhsVVBnYysxTjV2MjJKQ0x1?=
 =?utf-8?B?UkhyYUpiWkxFSU9aTjh6WHpBRDJjSTFVMW54Yzg0V2R1RUJTWTFYeU9MTmNx?=
 =?utf-8?B?dmNDSnhTNUdVa0Y2aytUN0NUREwyZk5CbTdSN1EyTGI0Skl0bzhiYTdiaEZY?=
 =?utf-8?B?MnQyWkhnVDR0Z2F2d25PMXBXUlpkS1ZWaWR6VlVmNmxranFzRmlyNHdlVWNO?=
 =?utf-8?B?aERBNlE5VVVSaVBtZzByRzBHL25tS1NlQU05Y0poT29JN2hhVVZNeDE4UFEv?=
 =?utf-8?B?UDVrWlNxSWF6UUhRSXhES0ZQOWNHZnZaRmpsU1ZjQ1cySitsZzdkeTVadVBL?=
 =?utf-8?B?TTJ2ZHFWY1YwUy9jUk9LUGp1ZEhJenFiOE1yaEdsS0ppS0pWSGxDVEx2UFVn?=
 =?utf-8?B?SWlNbVJMeFJ3cnVYWERDMzdjN212VlZzOHA2TmV6bFdQVHlraXdHaVBjanEx?=
 =?utf-8?B?VDhIeFhUVkJsK1pOSDNBaXJ0U0hzV1JRSUUzRGpkUHRndVZPUmFMTFB4UUM2?=
 =?utf-8?B?TTdwRkF5YW5reTY5djlZcWYxOEFORUx1U2tqMlpKeFhlR1RuMVBmb2pnVXpR?=
 =?utf-8?B?dU1lbDNBY2FOZnRLM3pHQzBpRnJSd05wUno1b043ZUJxYUZPNGpINGJ1QURB?=
 =?utf-8?B?YTU5UkN5S1NNSmU0VmpoOEkxaWs0ajVnRE15UlE0OFlOQm1GVjNGbWQ0Wm9z?=
 =?utf-8?B?eTlFank0S293THh6bVB0Q1FDRGdsVkFWRXhCK2creFBHaC9INWdya3BQbE42?=
 =?utf-8?B?THZxQkpsNDFnWGlvZmlzQUoyQ2k3aHJiV2paWFYzVHU1dGtJMWltOWpjTVBI?=
 =?utf-8?B?eGNtL3RBR2F0NzIwcnNadjdTRDY1dVpKckN4RjkzVmVHc3JzeEdqRHBtQ3RL?=
 =?utf-8?B?OEtaczR2M0pjTGNLeDJyWnAvQjBhQkhMTkNUWWNhcjcvYUVjak5aYjF6S3Vo?=
 =?utf-8?B?M3RBV1pUc01lRm54Vi91VkxKd1lRTjN2T0FkVGNuL1dIQ3JMdmMrb0ZtTVFI?=
 =?utf-8?B?elBsUjc4WWhtODZ0NWV6dGk0MjFIZGdKaVE0elk0a28wKzd1ZGdpZlFZS05Z?=
 =?utf-8?B?MWJHK0cwNU16UW5ua3BYOEJrRmF4b3hoVGl6QU1zN21yZmoyMmVmS0huazhS?=
 =?utf-8?B?U2cyUnlwc2R6NkdyYW5lZ1BPUk16SlZZaEpvSnhIc2U3VFExZS90eFp5Y01O?=
 =?utf-8?B?M2ZEL1VJSDNSTXk2UmZlVFc1NDFMQXRyYmRzalpva1JhRTZYdDVOQVcyMlFy?=
 =?utf-8?B?T2IzcUtDazZWMEhZaElBY1Fkd29zQU1TeXptbTZDaGgyOHdtTmh6QlRnQkQ1?=
 =?utf-8?B?bTB0MVNtcU9MdFpGUDRSUkkyNXljMXJQRGplY1ZXMUZzYXkrSlBpYm5RcDNX?=
 =?utf-8?B?Yi8zeEZiZ1NZOWRyWXBPY1N6UjFPVVErRlpCMW9uSU8zUEFlMkdlQVRPRU9w?=
 =?utf-8?B?bDdjU0lQRXI0ZFUyNmxNRGQ1eEFmUE96RmNNUDZyZHRCcHZaSkFMbFczMnQz?=
 =?utf-8?B?UjZqa0JjYmVtbnR6TnRTZWJsWDhZTlk0SlIzTmtwakVWSkhGU0dQOWkvKzkw?=
 =?utf-8?B?R3RLTm5jTUhZMGJVcGFDOFpsTVBRdVVHUm03WlRVMDBzZlNLQndEc3pyeVVM?=
 =?utf-8?B?OUNEZEY1UFQ2dlVOY1NzelJDSDg2TUtab3RLbEhSUXpUd1orM3c0NkV3aDFn?=
 =?utf-8?B?QTZLaUNvdEliZFFMMXNMdWovMUppNnFraVltaTk3RGQ3bHQ4em9RRHBsMGJw?=
 =?utf-8?B?V3pGeGRnUjVLMnBEc21VZHFWenRrWHY4Um9FU0c5RGVLZERvWGxNNDFZTm1q?=
 =?utf-8?B?VGFGYXR5N00yUHV4L2RBVjUxbGNaVFVzM2hncm5PNHdCT2pwVnl3VmZvNjM1?=
 =?utf-8?B?OGh3aGh3eWQ2Wm5rSjBnbG50SUx4djd6c3dxaGtJZXJGalZPbWk3dDBhNjBi?=
 =?utf-8?Q?g7Uq+cCSkDTGzuzfg07pURi4x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45df5a9-eb37-46dd-4bec-08dbe1c69f23
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 08:25:39.6398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzxh9P8mZGMViKlyxT8XpvmMUdw0XUG6d8rmJDwKhDp4Bl3XIjue5eUblWWPjtNy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6126
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
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux@roeck-us.net, linux-kernel-mentees@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/9/2023 2:11 PM, José Pekkarinen wrote:
> The following patch will convert the power values returned by
> amdgpu_hwmon_get_power to signed, fixing the following warnings reported
> by coccinelle:
> 
> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2801:5-8: WARNING: Unsigned expression compared with zero: val < 0
> drivers/gpu/drm/amd/pm/amdgpu_pm.c:2814:5-8: WARNING: Unsigned expression compared with zero: val < 0
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index e7bb1d324084..913ff62d5d5e 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -2795,7 +2795,7 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct device *dev,
>   					   struct device_attribute *attr,
>   					   char *buf)
>   {
> -	unsigned int val;
> +	int val;

Hi Alex,

It's a different code in drm-next.

https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/pm/amdgpu_pm.c#L2936

Thanks,
Lijo

>   
>   	val = amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_AVG_POWER);
>   
> @@ -2806,7 +2806,7 @@ static ssize_t amdgpu_hwmon_show_power_input(struct device *dev,
>   					     struct device_attribute *attr,
>   					     char *buf)
>   {
> -	unsigned int val;
> +	int val;
>   
>   	val = amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_INPUT_POWER);
>   
