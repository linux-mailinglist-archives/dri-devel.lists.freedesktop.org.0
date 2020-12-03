Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF42CE9BE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC24A6E155;
	Fri,  4 Dec 2020 08:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2125.outbound.protection.outlook.com [40.107.22.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F4F6EB74
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 16:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAsCQ3pPM6Gejn2CkUu75MoYG6v36XGUP8F/vbcMWn0F6QMsuPdilEq1i2XYVtDsK16Wlx2Um7TxRl8MgDK1ysCsWbD2MxMTDpTi8SMesbkdJZ5KFVqcs6fqFAQpiRZa+rFWslKkfku5OMfSTOut0xPTPu0/P6uNFHL+OtaXZ1TVOC7KIV+ghBL4GIMcyUKNzy0D3EOnQVH+gAiHh17xQ3A7LXh/FAxnutRxwVZPMLWQ1vMIxOtFJFG0w/yBqQfxBZUh/6nGfOpnWMM+dO4a3m0qrycLVerVrJsEvaqCiZz9hLESLeSv5xu+h0aXVc64BZcqS/z2FTcUjaX4MPFz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAFv2Va3UG6SFaJskEYhlOMQNBKc4HuHxIATp++Iwe4=;
 b=YOuOAs6are6EKTE6IoUUyH3Avo8MJwSlnIls26xyIWDJFbDdyW8CZz4Y22R/hAF8Ii2o5Ay1hmuFvICYIu8N9rhp/pp12Ctmmb7F5dYeRrs2ItRmL2fdt4pOU5meED/VDQG4dMyYfGRNQXXl9OJUGHJRK6FC4Js3p6AfzBwEQpZ8uZXY/PL0+I/g76dAmNKF0uepmS1ecbZcmsoTXydSg6RlHXzOMYBK87N2hQwsga64B/UH112mNG9GyYt9MPDaQklT8l1RenKdCVUjTpEb+K2NKas0hAakwRsSwuXKOYD/pIwGLY0yEBU2qmJ47YPjMufvFCxQ9SZL7Z2ORCqK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAFv2Va3UG6SFaJskEYhlOMQNBKc4HuHxIATp++Iwe4=;
 b=QOutTVFfQZc/0BmWqbUwbX39atIn5DtrFdrRnyFT3cWT7Umno1T/60a/IILTLVCryOrbrXN8HIQlScC/4qI2UlUeCeqOO7dTtE+bKorRyESRBBia3jHKcSN4wJr5sjITwt2dNL34jfBcGoWGSsRGhpFwO6/hCDlTaot2katHAsQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=axentia.se; 
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6294.eurprd02.prod.outlook.com (2603:10a6:10:197::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 16:11:31 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::9178:a26c:c1e1:636b]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::9178:a26c:c1e1:636b%4]) with mapi id 15.20.3611.032; Thu, 3 Dec 2020
 16:11:31 +0000
Subject: Re: [PATCH] drm/fb-helper: Add missed unlocks in setcmap_legacy()
To: Chuhong Yuan <hslester96@gmail.com>
References: <20201203144248.418281-1-hslester96@gmail.com>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <e6ebb634-4cb5-34d4-c661-4cebbe2fdbf1@axentia.se>
Date: Thu, 3 Dec 2020 17:11:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201203144248.418281-1-hslester96@gmail.com>
Content-Language: sv-SE
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0344.eurprd05.prod.outlook.com
 (2603:10a6:7:92::39) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by
 HE1PR05CA0344.eurprd05.prod.outlook.com (2603:10a6:7:92::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.18 via Frontend Transport; Thu, 3 Dec 2020 16:11:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f923d1d6-4c17-49ac-2adc-08d897a618fc
X-MS-TrafficTypeDiagnostic: DBAPR02MB6294:
X-Microsoft-Antispam-PRVS: <DBAPR02MB6294EF21C60131421EA3D381BCF20@DBAPR02MB6294.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CmfDx36URLJj0V+YtRYIrW3YMxBokwdvYh/NN8BGzXtw8awzo7NpcwGywrQv3rynunVg4lAM/Rw8YTy4sbY8VOogsGmM4dfcU9p4C3i9MxuvOs98yNfSOw2RmRZj9RbfI3hPkfEVJefdQRB+QpXBzFeS6X5nPwUvNT3gSnF2J0rz2nD76qkWktos2xVbASwIuX88G7Ek9QhyNxKoiUOmT+rdnCU+hdcC4T2+rrSez2ninzYld/cZAWXj1BCCfhX3vdMMsUOZmoA6CiBgUE4sv2izNBhq6Sg3bKWJiICMze91hRrleWkWyrN7EU87r5m8T7dqD4YR2/Pa1bD4+0n0uDzWt7fzGL5bmWenhMOtmO+LrCoPsFA4gLA0U/EwPPoKbom/tFkaHN25caClJ51+FaebYgE6ziKyXrSPLH+0es=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(396003)(136003)(39830400003)(316002)(956004)(4326008)(83380400001)(16576012)(6916009)(36756003)(8676002)(6486002)(2906002)(5660300002)(31686004)(8936002)(66556008)(66476007)(86362001)(31696002)(186003)(54906003)(2616005)(16526019)(26005)(66946007)(53546011)(36916002)(52116002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDB2TWRoVEd1aUpnSlY4NzQ2dXE4SzVRMVN1VlBqckRGcGMyT0lTK1FzQ1RW?=
 =?utf-8?B?ZjZVOWY3OVlFNG5sZ1BId3g3UG1aWjFkQ3RpZFF2MUMvaXVTOHVGbGJFb1Bs?=
 =?utf-8?B?QzIvWU00QWxYc2pYZmVNejlMR0w1WCtYbDkvdldoR3VaZ1Myd2l1MUhCVXhY?=
 =?utf-8?B?SEdXNHZreW9GSjdmQ2F2eHB4UWUwandHb0RDMnYzTnpEcVNvWmpTaHpFVUJq?=
 =?utf-8?B?a2ZZaDZyK3h0V3FEb1d1YnVoMHhEVDlEbDk4UEY0eU4rejJpLzh5cjk3NWFk?=
 =?utf-8?B?WmU1M3hXcUZnR2lTZnVMUlQ4cXFRVjRYTVZNWXg4SnZ2Z0Q4L1RMK0ZMREkz?=
 =?utf-8?B?Ulh3SlRtdWxQbU0vdVJScjZtdkI3MTFvNVcrR2pRVTFZd0ZpL0JpY2dHay9W?=
 =?utf-8?B?KzNYSzdQeVU1Y3Zwa05HVVpmbnNoOFBnQldPck1Oblh1ZnhYVlg1d04xTjVC?=
 =?utf-8?B?blBWU0V4TFUxT1hDQUdsMnZmK3FqenBSQXRPWi9Gb3J2MDN4c1ZnSG8vdlBE?=
 =?utf-8?B?b0lXbHpvM3NheDBPS0xYRjg5VjlRbVpaZjdrckZHQkZaY2VDcjJKVm1IV3c0?=
 =?utf-8?B?SEo2RGtoQXFJQk1aY1R1UDFlWE5kUmQ4TDRiaTcyeUVwY2R1Z1pIUHBWaW1T?=
 =?utf-8?B?aEI5Y0JteWJhM28rMTEvMW0wa2hnSGhSZzhqZ1QzUmtiMnJ6Z2JhMXROdldY?=
 =?utf-8?B?dm8zOEVyaHRLK3RIbFpTTTg0M1pJQkNLeUJ4ditnYkNVNlQyMUJRaGlIWDF3?=
 =?utf-8?B?WWs4K2duT2JQZCtzVHpnY1RHNHR0clZEVXoydHNmKzhuUU5QdytGMklKNS9T?=
 =?utf-8?B?NXVlbXVNa1dkZW5JUWx0SFQ2ZlllTWlPbzBwSlVBTHY0WEpIbHJBT0loNkFu?=
 =?utf-8?B?MjNDQzJBY2VlOWV5VXdlUmpYbDh4dWM4eXZZZE4vNGNJZ09GZ0FkVTlIVC9j?=
 =?utf-8?B?UDFPUUFsR1FFdUM0V0kwRGllbUxhQ1htZ05wbUxJc3gwcDN4RitYQVpwQTNh?=
 =?utf-8?B?N1J1cnByY3ZXV0ZIMjkxckwvZlJRanZtK2xDZ1FxOEU1aUtGN1RyQkgrMGxy?=
 =?utf-8?B?OElDMEo4TUpzc3o5TzRhN2RmZlB0ZUtOREJLLzcrai9JdkhLaGY5WjVDRFEz?=
 =?utf-8?B?ZkVZUk9NSXlsR3JzS2d0aEQwYTNJQTJCQjJySUU0UEhzdmR0VDJwMzFzUHJG?=
 =?utf-8?B?SVpsQnljcXJocUlkVUVQUEtadXZLcXZ2cnRlaEFabFJRUi9BdHhCRUtUalZm?=
 =?utf-8?B?L0FZMUVxZ0FkeXVielNqRmlhR3pWRGFkakhaTWgySThaekJONWowaW5UK2xi?=
 =?utf-8?Q?l1JPsfT/tEQs1I5unhHcR8YXMmNF+iHeJD?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f923d1d6-4c17-49ac-2adc-08d897a618fc
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 16:11:31.5158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdISYeFivq86ZKSNZkQ8krjLR0S5NN8BiEWZzaI7XUZMaeLsrJhWefuhy2qq+/oV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6294
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On 2020-12-03 15:42, Chuhong Yuan wrote:
> setcmap_legacy() does not call drm_modeset_unlock_all() in some exits,
> add the missed unlocks with goto to fix it.
> 
> Fixes: 964c60063bff ("drm/fb-helper: separate the fb_setcmap helper into atomic and legacy paths")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Yup, my patch fumbled the locking. Sorry, and thanks for cleaning up my mess!

Acked-by: Peter Rosin <peda@axentia.se>

(Spelled that as Ached-by at first, what does that mean??)

Cheers,
Peter

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 1543d9d10970..8033467db4be 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -923,11 +923,15 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>  	drm_modeset_lock_all(fb_helper->dev);
>  	drm_client_for_each_modeset(modeset, &fb_helper->client) {
>  		crtc = modeset->crtc;
> -		if (!crtc->funcs->gamma_set || !crtc->gamma_size)
> -			return -EINVAL;
> +		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>  
> -		if (cmap->start + cmap->len > crtc->gamma_size)
> -			return -EINVAL;
> +		if (cmap->start + cmap->len > crtc->gamma_size) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>  
>  		r = crtc->gamma_store;
>  		g = r + crtc->gamma_size;
> @@ -940,8 +944,9 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
>  		ret = crtc->funcs->gamma_set(crtc, r, g, b,
>  					     crtc->gamma_size, NULL);
>  		if (ret)
> -			return ret;
> +			goto out;
>  	}
> +out:
>  	drm_modeset_unlock_all(fb_helper->dev);
>  
>  	return ret;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
