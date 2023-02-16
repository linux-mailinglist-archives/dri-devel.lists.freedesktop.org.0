Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3946A698D7C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 07:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF5710E0D4;
	Thu, 16 Feb 2023 06:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D732910E010;
 Thu, 16 Feb 2023 06:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgQ3dStbuqA3MyHPiSK9lgXyHpToH26LxqUJEAcMrDlMm1W/lMdIdVxZAQku+9aBfqzFnuzPx9cf5d4XSKvCT7Sv+FAg3AbHzHCPoYA0afUJEdUjWs3OktENCOK8FP3crZrrdZDJ44u6Vdaj1d2DWF44a5TV8kQM8zsCETJ8H4c85ycRjAMQvENKBSvBwS19UIIsv6bjsQrW5d2aWZkLI0uxG8kZZ9HaEAXOMwk/vhNM5d2MaeJ27H79tkW8aGI8a6lgqJHxgzWtN7EfAVybh+Zsz0Uuwi18EVv62c2KorZJ61JlIVFXR6wV+mhKQeRtY+wjuv4vDYzt/OxC2umxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGlC97RgIXSWT2N/hqrSClBkyPGbRVbLnd7D58br+RM=;
 b=C0WorjvSeW153L8dSMTo+On/5pdHZlRQCWGvYUSpfLwfO20GH5bYx6etLpZsHp8UaB9x70D46LOvj5hiQgT/hMUE8oV3yak5yva+tJbLYlhSE1vpzSMlwH1KCdUIE6Q9FPAytw857fwbG1UUYXvaOcMGtuJWYDJxnKTuc+ktNYY1zV0FenhrGs0k8q5coHs/qsHvBdZADDNtV//vZcSVzw2VQmleBEjhahZttwzPLPUolwBvzcBznlIr1lTipke/gQ21Wuc/NIjnloRvtjpEIKKNvluU9leYGfH2D6ntHtGTPGA9BlgZSD7u6NBjWExCXRpXjC6K2VdGCpkgbSWLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGlC97RgIXSWT2N/hqrSClBkyPGbRVbLnd7D58br+RM=;
 b=12a0sBqGTZcb9HjxWOBDbxxO1SVtw95K6XuJW19/eHKfS18XwAPE7h7ztKi4eDpqeMwYH9ariz8t9ZZ2IQMsBGTTYE7n66k1rDZZvnMEoqg8+Hy8TX0jqE7/C8Zydds6U7i2DETXdYw+IQXmehFVC9CC03RoUaVjprpazTm1QAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4540.namprd12.prod.outlook.com (2603:10b6:303:52::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 06:58:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 06:58:53 +0000
Message-ID: <ba5c8e8d-2418-aca0-59b0-721d08af452c@amd.com>
Date: Thu, 16 Feb 2023 07:58:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amdgpu: make kobj_type structures constant
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230216-kobj_type-amdgpu-v1-1-b382ab606dc7@weissschuh.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230216-kobj_type-amdgpu-v1-1-b382ab606dc7@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c8376c-cf38-4be0-2828-08db0feb43a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vop2Vt3Q7z4YUnePptsbIIKPvySR5XepuCp1TfGs8tajNY/UVrik4guU1W1/vmXNyRivc8nWpI8QkH/AJWhP+pD1e5MaK8i1sFnb+aeLQBnhcFa5Yc3WOgysqZFMjkqM9Uj8akAIfv0Z8301E1bWmeVRKfBBZrGnHNewkXy4NGPRcqdw8pdHjZox0moQuEF6Xpff4kYQwiLDGKSiX90GfMa13xqvcOJ/ipS23/vsjlh/N7bEz0Z7sImT8iO0ewDUIxQnK75P9+SSgvnWRJ7U7KWe/7bjpy4G/IdpWHbu7j8UX23MPvcUCe1auwtdjgJb9yLbNY29XrKT3VZwG5xIcS++LtkHlb5cDo/i5DibWEp/8Om8PuE58Kbqj/yo+KIK4+PNvnOI22vOEndn/+E6bV9dLyQUIVFJ+SUY9O1USILInoHljmt6MhW2DSN25dvMHaPmg+7e8AblaQ5FtIiMlC5GiBn2XVJgJakxbGGjFqSbu2v4vJQOfC8VUUH1OeTC/mut9dhnEO/vkntj1bB/LLOPjb0WUGsM6zfGeByTP3lUu0vlPNVE8BaOpcM5xMELUTNTZEeMx0aJCac20CFqsReI9PaZfQt4ktdqdOobw8Vl9LbZmfKba8RHao2C3OOyVZhR0EFbs6YTAKqlkfOxaw5SW6zHpPNxWfh7IYH9nkmy9PZ5h5U+pG0tOemmUf90WHlA2FNQTqrWctQAqoX5U+gBTFx+ZHgYaCAcclhxNSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199018)(5660300002)(8936002)(8676002)(41300700001)(2906002)(66476007)(4326008)(66556008)(66946007)(316002)(110136005)(31686004)(6512007)(6666004)(186003)(478600001)(6486002)(6506007)(26005)(36756003)(2616005)(83380400001)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1B2ZUNXZ244eDJjSGFLajcrcW9xTmtLOFlwTXlVWUFWL2NCL2owb3VnT3Vv?=
 =?utf-8?B?SEIzNkRhL0RWNzk5QmRURkFGUVYwZExuSG8zYjgvMGdrWnlBQ0RSYzVLV3dW?=
 =?utf-8?B?MTdYTi9uWG9qVWEwOHZsM2dmSHAvdFlSV3YyTUJPV0xOdk9DMng2ZGZtd1pO?=
 =?utf-8?B?cUYxWnYxL21aeWt3YkNpYnl5SmUzZ1A5bG11cGtQeVZOamZvaDJVbkV3Q2dN?=
 =?utf-8?B?cytrMVpyZHNIbHRuT1JJaDBnV0ZqOFVaUC94Qk1jQXQyWlFTbVBqMHp3UjV6?=
 =?utf-8?B?OXRmQWdvTFdZb0JnMGJZQ0FudGcvTm9YSDlMWHpYNDB0eEFockUyTXhFM0RX?=
 =?utf-8?B?QmF2UG9EUzk3cEU2aTNDekt3eDdEUnBOZGYxWHF3TjR4M3FMZFF5djR3ZGIy?=
 =?utf-8?B?L051SU54eWd1K3ArbTNxLzQ0eC9nUi9LUGtXY2hSK0lRazRPMDlpdXFrN25z?=
 =?utf-8?B?OTM1VWNMMzA1RURDMmQ4ZXUyUEVuZnVRRzU5bWg0ajkwc3hXdmFwTzNmL2dX?=
 =?utf-8?B?bzdjNSszdVJIWGJSbU9rQnR1UktoVDZxamcvbW5zcHNjT01nSkU5YkZlM1dz?=
 =?utf-8?B?cGNON1VOQlkxRGM3Qlk3bDhVWGk0V3A3djh2NEVuaGYyaTFzOWx6Wk5YNWRq?=
 =?utf-8?B?SDdPQ1B2SW1zNDJPbEthVlJ1ak0wNWEwYzVHbXl5WU1MYnR3dmVoWDhjTnpI?=
 =?utf-8?B?aTVCdGZack9PM00vV1JIaVE4aGlpb2p0cXIxc1NCZU1lK1k1WmVKUWgvbjAr?=
 =?utf-8?B?aGF4SG5LU0NMQWtkcnFTMWZpTkZtOFVKaXJOSEtyNFliditnYXEvNkZCWTZu?=
 =?utf-8?B?Y3FnTjNrTVpleVpFb1dmYWpKYWhHWTdGYlB0MERPMXpFR21Obm81NkpBRVpN?=
 =?utf-8?B?Y0M5UityYjAyNjgxWHp4dGIxTU9BSlZiYWdBT0F2RGU3ZXcwVmJ1TER4Tm84?=
 =?utf-8?B?VldTODhxdGRsMnRNazBWdXNhTFJRWWlZbEZBRlBObE9tV0ZDaHVjaEQ5K1BV?=
 =?utf-8?B?L045TGQrZXg0blNEOE5xeittYlZaandMVUVScHFmS2piWXBVNmVvZ0FtZkZ5?=
 =?utf-8?B?TTVtem1nU3BNaXh4TTBtcTRsUlVkU2dPYmswN0o1Q1MxVXU4bkhadDhDY0xJ?=
 =?utf-8?B?WXdPUjV0OFpweTRhRXBMYUZsRWtpSzU5bHBxbUpveUtqTlRyYUdqZVlMamZj?=
 =?utf-8?B?RXo0a3NmUXViaDk3MmlpWXhTU2tyaGxQSkxWbHR0T2k4aVp6bXNpWXMrV1Zu?=
 =?utf-8?B?Yk9OQTBmOVlUeXhtQjg3SGJpYjlseGp0dkw1RzhYVlFmdzk3d0M1VktJUE1J?=
 =?utf-8?B?Q3ZMNUdkWWNDTm9ISU5lWC95azMzTVRDZ2l0NUg5Z25KTUgyN2x3UkRNYU1p?=
 =?utf-8?B?Kzk4eUloaDZ0aDRhaWpCeWFuQitwakpuMldSc20yWjNnWkM1a3V4L2hyOEdV?=
 =?utf-8?B?RVBCcjdvNXEvd2w5M2ZKZHBjdjk3L3lEcWN3a0ZPb2VITEhibFkxSjN0VzJ4?=
 =?utf-8?B?OE1SLzNDMHlHb3F6NWs1UndGVGJWMys5cmpVSzFkQ0hHYlNMb29wMHozLzRy?=
 =?utf-8?B?eGp0WGJEaHdrSnFGS2RuVWdLS1k1Z1ZDT0hLV2Q5TVBGMHk0R2tCOU5PTFVF?=
 =?utf-8?B?WHpHS2FISmJOMjV3ZnR0cFkydWRNeU9ZRkhEak92aEFBckd0RXEvamorbVVW?=
 =?utf-8?B?QWJ2ODdkWkg1NG1xTk1VOXRON2Rzd2M3ZkpKZEJENVErdGZxeTBLM3hWRUE3?=
 =?utf-8?B?UDBnMlZ5SU5PaytBb083TDk1TnhqdCs3Qy8xeVZxaUNkMkNQS1RmQWpaRWZG?=
 =?utf-8?B?VDRiQjdUenBINXo0cTRsbmpOeTEzUGRrK3BBdGJseDRVVkZQQldSQWk0bGcr?=
 =?utf-8?B?aGl1dnRrUkk3UHhxcWdUVU5ISXlITGErT2tpM2tOKzYvejBLaWlnUUJJVFgz?=
 =?utf-8?B?ejZMbzZMQU1mMFduWWhkMUZsMEtHeEs0amI0UlY5SER3VjI2bCtBbmhJRVM2?=
 =?utf-8?B?aElWb1FaSUJwWUZDQ3J5WVFpdHpGQlBySklnQ2pxSnFMSllMVHJjZTd0N3Va?=
 =?utf-8?B?a0FVUmN0dlpQMno4VlY2OU54SDNTRTdNQ0dRNEU4TVNCMUFCd2lsSlhlTnFB?=
 =?utf-8?Q?W/GxBDreDHAJIKtbcdc8RYjU1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c8376c-cf38-4be0-2828-08db0feb43a7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 06:58:53.2003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cg5gzUAZnjWy6wUXOlCUYZIytw5uEkxVqIRFV20gUdacA1ZA6dZBzxekTy/tTE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4540
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.02.23 um 02:07 schrieb Thomas Weißschuh:
> Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
> the driver core allows the usage of const struct kobj_type.
>
> Take advantage of this to constify the structure definitions to prevent
> modification at runtime.
>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 10 +++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c      |  2 +-
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 1bbd56029a4f..8e04952e5144 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -704,7 +704,7 @@ static void ip_hw_instance_release(struct kobject *kobj)
>   	kfree(ip_hw_instance);
>   }
>   
> -static struct kobj_type ip_hw_instance_ktype = {
> +static const struct kobj_type ip_hw_instance_ktype = {
>   	.release = ip_hw_instance_release,
>   	.sysfs_ops = &ip_hw_instance_sysfs_ops,
>   	.default_groups = ip_hw_instance_groups,
> @@ -723,7 +723,7 @@ static void ip_hw_id_release(struct kobject *kobj)
>   	kfree(ip_hw_id);
>   }
>   
> -static struct kobj_type ip_hw_id_ktype = {
> +static const struct kobj_type ip_hw_id_ktype = {
>   	.release = ip_hw_id_release,
>   	.sysfs_ops = &kobj_sysfs_ops,
>   };
> @@ -786,18 +786,18 @@ static const struct sysfs_ops ip_die_entry_sysfs_ops = {
>   	.show = ip_die_entry_attr_show,
>   };
>   
> -static struct kobj_type ip_die_entry_ktype = {
> +static const struct kobj_type ip_die_entry_ktype = {
>   	.release = ip_die_entry_release,
>   	.sysfs_ops = &ip_die_entry_sysfs_ops,
>   	.default_groups = ip_die_entry_groups,
>   };
>   
> -static struct kobj_type die_kobj_ktype = {
> +static const struct kobj_type die_kobj_ktype = {
>   	.release = die_kobj_release,
>   	.sysfs_ops = &kobj_sysfs_ops,
>   };
>   
> -static struct kobj_type ip_discovery_ktype = {
> +static const struct kobj_type ip_discovery_ktype = {
>   	.release = ip_disc_release,
>   	.sysfs_ops = &kobj_sysfs_ops,
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 4b9e7b050ccd..6d13ce6ec9cc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -228,7 +228,7 @@ static const struct sysfs_ops amdgpu_xgmi_hive_ops = {
>   	.show = amdgpu_xgmi_show_attrs,
>   };
>   
> -struct kobj_type amdgpu_xgmi_hive_type = {
> +static const struct kobj_type amdgpu_xgmi_hive_type = {
>   	.release = amdgpu_xgmi_hive_release,
>   	.sysfs_ops = &amdgpu_xgmi_hive_ops,
>   	.default_groups = amdgpu_xgmi_hive_groups,
>
> ---
> base-commit: 033c40a89f55525139fd5b6342281b09b97d05bf
> change-id: 20230216-kobj_type-amdgpu-4d3f0e1e05d4
>
> Best regards,

