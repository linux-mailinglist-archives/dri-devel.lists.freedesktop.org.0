Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF124B008
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E8E6E8C5;
	Thu, 20 Aug 2020 07:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC7C6E8C7;
 Thu, 20 Aug 2020 07:16:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHwonqhxxNLh+7dVW541elC9KXVaiVsYrxfvcfcnqRrFuZL05DAXOdB5XY1QTMiBmJqNKI1b4Q5FNs5o9B9D7EPxsWG+zfdlL5A/j5PAXLi40PI55VVdtNFfSXNDnhgOWkWfvO6Xa2z4B2nUPh/76gGaN2/sddV9/EFsa1p8T+UjtFZolZmKPxLYox3R6cyFReyKbZAQTUPWp9FZeYDbc9aGYPqDLfHa28U3EClb6wNVPPDxEfR778EfiLViPgqg6e8UJZLIuczsbJyqEgqmBl7lDhXIo09EL62/ymiv+UnxtBSaTEHNEG2EbypnRjISS0R9cH0RqoG9f5fAyXKbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w/0RWwRc26NWiJdkn5nasEeGpSZIfORA9bANmiSFZo=;
 b=GIJwZ0saLCnIQXcwZ+EnEugVv6Lq8gyidYplj2l9LNe8NjDjdcSsxuJVi7/s9LgFmDt27kz4OURxpxJqv4QiA5XejHecKFfcoJTSg6RrUOjoSkby/Yqj4j7FrBFOpwYm/M6A4hBs7TeardUyYnLcTTvPuhnHzdFYds0RaglXKWb5QdzTHcI4RiTwUr9DB7Nn2eRYl2GSSv6uSnH75pGTKYJ5Co6SaayB6JNQQQJJqmmDTJWEqBIfnay6953f1dIG+RJQjU3zVgMSbUqjuu5zReSGzw1jobzwy97XdVDaMUceEtW4XwUfVh0c5JN3751rS/Mk2+nb7+vo76O0evN5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w/0RWwRc26NWiJdkn5nasEeGpSZIfORA9bANmiSFZo=;
 b=VlJOVfotihUtiJSxYWLn6gqeSnWtkTFRr1QhpJF/tyOcm4Ad5sOdPlzSY8YtnJRgocWdj0e2YdsAhDh9LUnNW1taK415ebvLt45CQJ4IPTee7ZbWPGTu16I/1s0+YVyTpnFbdz0RVeNRjKIKd8i9TOGXZ6vo2MqQyuh0Y45i8vY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 07:16:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.028; Thu, 20 Aug 2020
 07:16:50 +0000
Subject: Re: [PATCH] drivers: gpu: amd: Initialize amdgpu_dm_backlight_caps
 object to 0 in amdgpu_dm_update_backlight_caps
To: Furquan Shaikh <furquan@google.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20200820052600.3069895-1-furquan@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4ec56556-299b-31e0-e639-b96e1666b215@amd.com>
Date: Thu, 20 Aug 2020 09:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200820052600.3069895-1-furquan@google.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.15 via Frontend Transport; Thu, 20 Aug 2020 07:16:47 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2fcd80ab-4438-47e4-e8a5-08d844d90174
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4206EE27675ED52E2F4C1426835A0@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mn4n1HssOwSod8dUzwzEMJ9CwSehjtqUIPeRcOc+aUXfFyztfiQJbsKAoo5Qk54GKjl4PQMZnbGwh5j9+DhNtH8J39E+V7HxAi+kfYDrnReaoN51g10nztdBLA+NhF+nbrULbPJyH3kKuI2QXbcoBPZzZZboypT4kXyiNMDiIqdDzF1sa7fomNDGjQlsFfwx2lRtvQcPSqEo6eGFW8rM/fJuKd544HUosPnM/nLxhqRs3G/XUgrBWbhmJ4OIHFj1gMbsIGIsIsmieJAkPaSrsJv1dXTdWG0Ewj9ZvmZ2a4Ee9OPOLTqfjkNvBhyOkPgt77k471xWriSCme74Hh/Ou8vp/kTjnibBx76+RmGrFvC6Gbirg/5xAIKoxCVGQd3w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(54906003)(2616005)(110136005)(8676002)(36756003)(6636002)(31696002)(8936002)(6666004)(5660300002)(31686004)(66476007)(66946007)(478600001)(83380400001)(2906002)(66556008)(6486002)(316002)(16526019)(86362001)(186003)(4326008)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: fEdDPwJV4470TtfLoFwbCR0t6WQaLv8usqx4S/jZpNRtTmKHWPr2iwuGW0oMuusmYh2lUrbit1rIO8Gsf/OGbjamHLDHLcJ0hnezKqyUh1SL4juH7OHR05JZyBQHG6x29QqkoCKolEYgrAaDRvG/bYu1oE/VzyDTislg+CmAgF6h8kNBN0IEiBMqvywswTObI+V4RCo4LxGoBzLyrYcTOZ2sOqkigu4uF2/WDkoXSvpdOIOB2SHrcuyfI8Yu6BVahDDK0ws8YPiU7Qdegje4tYBHPn6SnlXrhkm+lcYHp2rbr6E2ysNYN7h/Pf1nkIAyNhjzC8P7uDTykjHRG6OGOM/gGXzwk3fpOubKJoYkCZRwOeypBU+w6FqtxsGUPFZ+qLGsENgrzlVYASP/7Ll2nZgBbSnJp6ROO/O1igbnAemEMfO51DvHSD3KwnscVg9/V+1NOuLP32u706naAV1dVR79UNzzBcf4JF9H6cC3whznduzMBhc+fIQjaZHJlGtJeB9lwvcqAAZwHoMyVuicMKm03eNa0PQeRIOytXXZAmlo1YC4oGeeQ5l+/5Uv7KJcphpRGKPl1fG5rzq1nunxyEks3wK0hRps8ilWJUKC6fNoPH6d8Rn5RHXk1sEjwRBwL2ecVlHl2CgTu83z6Smy2LyEnczGwz72hPj3KPBBYe/F/J/TZU45hZJatZxgz1U9aTgLWegv6hpqN6UUk0VZuA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcd80ab-4438-47e4-e8a5-08d844d90174
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 07:16:49.9254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyglH5ziOgLRDNd7jG0bDIA/J1srxrIM3ioAiVV72lT99O1R9W7rNLofrXjsPmKV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: Stylon Wang <stylon.wang@amd.com>, deepak.sharma@amd.com,
 David Airlie <airlied@linux.ie>, adurbin@google.com,
 Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikita Lipski <mikita.lipski@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.08.20 um 07:26 schrieb Furquan Shaikh:
> In `amdgpu_dm_update_backlight_caps()`, there is a local
> `amdgpu_dm_backlight_caps` object that is filled in by
> `amdgpu_acpi_get_backlight_caps()`. However, this object is
> uninitialized before the call and hence the subsequent check for
> aux_support can fail since it is not initialized by
> `amdgpu_acpi_get_backlight_caps()` as well. This change initializes
> this local `amdgpu_dm_backlight_caps` object to 0.
>
> Signed-off-by: Furquan Shaikh <furquan@google.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e4b33c67b634..725d8af634ee 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2853,7 +2853,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>   static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm)
>   {
>   #if defined(CONFIG_ACPI)
> -	struct amdgpu_dm_backlight_caps caps;
> +	struct amdgpu_dm_backlight_caps caps = { 0 };

Please use memset instead of "{ 0 }" for initialization.

Christian.

>   
>   	if (dm->backlight_caps.caps_valid)
>   		return;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
