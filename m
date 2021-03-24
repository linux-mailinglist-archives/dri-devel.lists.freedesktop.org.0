Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1747B346FCA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 04:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BC56E2C7;
	Wed, 24 Mar 2021 03:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50070.outbound.protection.outlook.com [40.107.5.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66036E2C7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 03:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dovnvLnNNAHYx9eL+utiB/x6u6moKgKhL86uX0BYPlTeHCHy+OWgzD9Xz+vy+CnRIbQxCRLd1OIJRCQk6/komkY4rXiLQU9rJHtmVw8n+/FyX+y4pt0Sw4u42a6OxzH/fhaM0Bf8lnKijY+IXA3YDFXc9JP9Lsijam7y0itX6dHxzNJ5hlf2a8kxo2i1o3ppVWOJX7M6Omi8pSzAseloKbl5aXGtA6E8KIj4YuP5EwLQdcowApg91ETd62IkcvONgAD0bB85JEresJAt4mpaK2llqjeR9tx7I0BOVR/wceKIYwz7m09OOw/HNyGxge1jltiIB1IU1+DVSFam9+6arg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS/grFHYooVMCtNqiByTnW84q4eEgMgp2V5BttBbHvs=;
 b=PCcpmZeW0cXOVIp6WuuDksxWKx/xSffW8BZ8tEy3WNxuM/dOharIfe1zTebAOXDqf2MF62ApS49pDWF32ZgVvSDEJUoxlol3IKJhJKpDLm/6QSAnVdMqRzSugm57ZnAhbJchfWS5hUE560bAMv+tDKkhYcnB/PZxZm6bSVrcd/qroq/3VHljZILMtcbnwlz6Dog01jaHtM+MD2TUqBQFSDLwdrUY7c6hOn+BD4mDF7J+eOpQA6i8qy+7ic5i53FRNYUsC46HN/PFr9Lw4Icvai/Jswt+2AIZjSUkpQdd+XovtDd5goXmywG9agfqjg+iQnPCb7sMIqLLXJ4Vgt70EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS/grFHYooVMCtNqiByTnW84q4eEgMgp2V5BttBbHvs=;
 b=YehoAyU2/f4TiWiSUW13BOqZ1lNOaKIs91rM16Jvw/FXb+k8jabM24duy6tBc5Xtvi3Raj2/OrheNin1gpgs/39KiTyZFrLDsgdR9JOwIlWduXMH7AmckqtgdOiTz6yMwIyeZB/pXtIgiBVdxZKAhdQE0ks845iFaMTLuTZWhIk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2974.eurprd04.prod.outlook.com (2603:10a6:802:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 03:05:28 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 03:05:28 +0000
Message-ID: <417d943c6585a40453e65afcbf6c15d273af3a6f.camel@nxp.com>
Subject: Re: [PATCH] drm/imx: fix out of bounds array access warning
From: Liu Ying <victor.liu@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Date: Wed, 24 Mar 2021 11:03:52 +0800
In-Reply-To: <CAOMZO5AUJ=OjBwB=GA4Y0dy+oheHyzK3eVq+YCgT4HKEaQJhNw@mail.gmail.com>
References: <20210323130550.2289487-1-arnd@kernel.org>
 <CAOMZO5AUJ=OjBwB=GA4Y0dy+oheHyzK3eVq+YCgT4HKEaQJhNw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:203:c8::20) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HKAPR03CA0015.apcprd03.prod.outlook.com (2603:1096:203:c8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.10 via Frontend Transport; Wed, 24 Mar 2021 03:05:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8af90ddb-56f3-42de-1901-08d8ee71ad6d
X-MS-TrafficTypeDiagnostic: VI1PR04MB2974:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29747B18D10EDB1AFB5E2A8998639@VI1PR04MB2974.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OgLvdELEghCF5oJAdZLlu3x7MD0AR4CLDKckRLLgHIj/C5YMv0zYS5rP7Jn4EpL8omgCyt7ZdhQGHfRtxdSmQ8jVs0UVlF5an2eNEUp4Hj3PWRS+bCxoDcyLzU6KvYBqGOYur0e7cRE5Tbz/FhWvSlfVUxUjYNSXjyj/cfAcC0GZ/gC+F9WArbT4+kL1/PG59EFf+WysFdTgq/tJxtxeLK9wQr/nXB7DXLgk8GDtqqqaNC8EITjA76qkoFHEEV6GO77R5ipKK2PiEIuN7vPNqbybTGO9nFjAcOJCK3mDk0561GMuA9kVLKIkPArTL4V58aF3OOcyKaVkwUVSq5+/a3fDWiVvC54oxhw9ui+qLrdjdLH5XwYQbq7zx7LX6AlGgcOaOjv0xGG0MaGh0cFZuerdfUm/pmCUcHzIqZ9eWgwZlj+mvOO7mjzb/w9ZPKmZw7WYggkuiM5CmsxmKmVKimh0TwuJN5K0dpA/Zj8WIEOng9UVizhzeRJ6xsvVEhDsoJpvNlFj2E9wiJUOIBifvjNwgJDtBm1Th4dj4GnskGiuy/ALu0wGsWv5KeOfLIeYvbCJTfc13NBxnzDVDD2tVCDEpPAl7IzLnBPyUpIu/DxzF2J6FaPyKYrHeyE+9epR1Ng09leZjIbUL3Cpo7xP7TYC8rhkMgB3PPUa7Mg3r18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(38100700001)(8676002)(53546011)(4326008)(2616005)(956004)(8936002)(6666004)(86362001)(6486002)(36756003)(83380400001)(52116002)(186003)(478600001)(66556008)(5660300002)(7416002)(316002)(66476007)(16526019)(2906002)(26005)(110136005)(54906003)(66946007)(6496006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dkp5YnB0ZWw1VEFpWnp4M3lCNnFWVGc5UHVaRmpjaVQwN0s0b0MyVEZNTGZK?=
 =?utf-8?B?WW5xaDd2Qlk5SXVVc2lrMTdMTm5KS25SdW5vRGtIdEFycVJQcjJkVUlXN0Jk?=
 =?utf-8?B?NWJYa3pjbUJ2MmVWeFB5ZUZDY21pM3BDY2Ezai93QXQwQXdOc0xkK0NHU1Z3?=
 =?utf-8?B?TUdQS2sveDNiT2lkcjNCNEZmK01HS1VMWXF3TVhKVVUvSFJWeGIwREN2cHZR?=
 =?utf-8?B?ZGEzSWtWR2ZTekFreDk5RHVsTjlkcHRBQjNXWHloamJuSkwwWU53WHRUcEMz?=
 =?utf-8?B?UDByeGtVdHlUUlVrKzZjMHdiVlJhTHpTYWVTZzVxU3RmdEZ6dnhZMG5MVGl3?=
 =?utf-8?B?UHB6cTBsU1V6bHpWd0R5aDRIaHRvVU0zNER4WENEZytIWVJTdXZEaW1hSkdz?=
 =?utf-8?B?UEFuVU9YYkxEdjZYRkpwZkFoK0lQaE5sTlRPRFNxNzhhcDFPMDNEQ0VuYlkr?=
 =?utf-8?B?MXBUckxDeTZBL1JJWXB5TTM3bzlaV2kxdm5aUU9MbmlEVzhWVW14R29YM0hE?=
 =?utf-8?B?SlVHU285a2ZxOG10MVVXdGwxNlJaUW5reGRDS2xzbzF0ejdkSEF1SGN5MzYz?=
 =?utf-8?B?SmxpdzhER1JFWkFmUG9NUTNLT25ZWWhURktwZGcvZkM4R0ZHWDB3TC9tcG5v?=
 =?utf-8?B?NFV1cGVRTWMwK1pZZUNZOEVmbEQybHNrRGt5WGR2M2RsY0RibXIwbEwyS3pB?=
 =?utf-8?B?V21EekhsTXh2djdRVkJLUjZ4WGtqMDJYRldudWRnZWVFVGk2Rk1SRTZhMHov?=
 =?utf-8?B?ZGIzaUxVSUVKTURGWjFDTDhOLzJIaktwV0RKdzJiUDIwUlVzWTF5ZTI3dnFZ?=
 =?utf-8?B?TGo5endRSUVNSFFIWjZ1KzdCNmwwWjN4b0FNbE0xejZTRVZNU0dUTXBlK09u?=
 =?utf-8?B?dDlibThmNEczekxRenVFTTVBSTNPKzVsK1JKeWlXcFJxeXI0ZHBNcXdSUE5n?=
 =?utf-8?B?V2RsK2hneHhEbGtNMm82U0dBZkJrdnRqZmpQTlNPODBVNzNibDhLbm9JcFd3?=
 =?utf-8?B?MnJUSmkrK0d5a3Z3OG9nMFUzVG4rL0tWTWlzWkE1TU13M3ltS1czbXRIS0dK?=
 =?utf-8?B?a255UDM3WUtCSlgxUzd4dndTQ3c3L0VIV0xQYnU5UXdleENvNkdpYktCWmFR?=
 =?utf-8?B?Sm9TN3RmR2lwZ0hvS2JPQ1ltZWs2d1pNUHRvaktvdWhaeis0enpQMnJYSXhG?=
 =?utf-8?B?NkdEZEZabkNVc1M5a1NzRHloQTUwUHBXdzZaUGVxM0h0VnVNaEFnTnFTMkxi?=
 =?utf-8?B?ZklsUUllVXdZZlQ5MGhwUTZOZnkyR1BraVVBd2pFOVBNaGpRYUNLSUo2SUM5?=
 =?utf-8?B?dkRFU0orRU5LVGpDRFNxM1JtZGVFU3A2cUdNU2FsTERpRXAzemp0UFJEczRW?=
 =?utf-8?B?VjlZQVlRK2hrU0k0TFpFQXBMK213ZjNQTDNSTnk5Z0thSVhwdVB2bDJSaitK?=
 =?utf-8?B?Tk9DMUlCNDhLM2FoSVNHYS80SEFvL3ZCemUzTW1TdDJOMDUrVStFcUZ4MmI0?=
 =?utf-8?B?UWRjaDVsR1dwaXRqeFkxTVJkRUJhNHNNcit1NTgxalh2QVFXVTNIRnlqMERB?=
 =?utf-8?B?VUNvamdaRmFjZk42cmhvaFV2NU1lZXRTUlJkQVZKZWNpT29mcHRLQ08yTURS?=
 =?utf-8?B?aTJaVkNuc2ZGaVA0dk9rRUluR1N6UndqOXVnSGlzWU1tU0tmOG9aOHZ6bWRU?=
 =?utf-8?B?d2J1K3lRU1MvenF4REUwRUt4eWNiQnV6ZUV0NmhTLytibW9JbGhUNmc0WDhW?=
 =?utf-8?Q?bs8pJletihPUAHv2SUqDOVDnP6dwDhe2aImDvLC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af90ddb-56f3-42de-1901-08d8ee71ad6d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 03:05:28.4986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeOVBS4nEzDNM8swAGNxls2Cuqyvv1e5HxQnnBDqFMtNG+JzHWlO1yJmmEmoUToT9VgBb/PxUwqOxlMAcyg6oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2974
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Joe Perches <joe@perches.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

On Tue, 2021-03-23 at 11:02 -0300, Fabio Estevam wrote:
> Hi Arnd,
> 
> On Tue, Mar 23, 2021 at 10:05 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > When CONFIG_OF is disabled, building with 'make W=1' produces warnings
> > about out of bounds array access:
> > 
> > drivers/gpu/drm/imx/imx-ldb.c: In function 'imx_ldb_set_clock.constprop':
> > drivers/gpu/drm/imx/imx-ldb.c:186:8: error: array subscript -22 is below array bounds of 'struct clk *[4]' [-Werror=array-bounds]
> 
> What about making the driver depend on OF instead (like it is done in
> DRM_IMX_HDMI) ?

The below patch made DRM_IMX_HDMI depend on OF,
because of_drm_find_bridge() is not defined when OF is disabled.

drm/imx: dw_hdmi-imx: depend on OF to fix randconfig compile tests on
x86_64

It doesn't look like DRM_IMX_LDB is in the same case.


Moreover, even if OF is enabled, drm_of_encoder_active_endpoint() is
likely to return -EINVAL.  So, it looks ok to add an error check.

Regards,
Liu Ying

> 
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -27,7 +27,7 @@ config DRM_IMX_TVE
> 
>  config DRM_IMX_LDB
>         tristate "Support for LVDS displays"
> -       depends on DRM_IMX && MFD_SYSCON
> +       depends on DRM_IMX && MFD_SYSCON && OF
>         depends on COMMON_CLK
>         select DRM_PANEL
>         help

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
