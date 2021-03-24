Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4A347023
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 04:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B1A6E2C8;
	Wed, 24 Mar 2021 03:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007DA6E2C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 03:32:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igh4HaFBnBVCPTK5U+Na3NnXay9ls22QkRNc34XqPWbTsLOSXvsIX3z/KqfzyXsgq4WlXoanrrkqNZW43JPWumD8/RrJ2K9966FP2WY8//F/BTCHjsbLmdT+VXrI7TahtHof7Dhk8wKIDGvlfLaMD29PRRGFm0C1ni81kXwlppTBGmfeAMUn5NhM2IkTUN4vmfc7kahNTp7CsD6jMMiWzoUXuh2XixIGCFnU99IfBjzdQve0agl7gEpkZYhQ6N/l8xcLXifb6/hQ5sOJ8gXQff/RphoOpArRhcl+cjYU1kpv6VCy6BNXEsBznJ/w1RvdqG0z6HB3KNNdm4859o67Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=360GPYGly2Vsq9tXg5V5q2IB4G4s4wNz8rU/2AywEEg=;
 b=fmJUOaMO5q8TMF8TwICDmxkcQwYVgUh3K4oLnvkdFdxS58EXXrQKaxlnoTwzYxmjPAmrObxaylMQRRQjUZO9V0Sp/NiTrKKBYcDwXMNU45s0YblV0ev2Y70UU3OeIKK6j6HcGlml+UaGU1/uA8LaJvFeqrzlwfo+T4sXi72xiOSs6hQ98Bi3mczjL59UXIa+ckti+l5LYLf9Tx+uCB4azVLl1Ai4KnLpDD1nkLdvYWHi+sQY+J4HFtkd+3Cx9L2XTHvFPAMJ7AXcyGmVokcN4gHg7m0CV3C3CeHGoR0HZo1i4IuNp8L2E+bFJ1VYb0ewUY3pv6LCtWZKq0PsW+AXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=360GPYGly2Vsq9tXg5V5q2IB4G4s4wNz8rU/2AywEEg=;
 b=NfD5cZcPyWYvFyRJ74Brp5Zu6xo1EWVNfIilfInstPCGn72IQEqrozR67cVFrVTcslwEInprH1Wlnn3MXcfT4B328oRau+ian5IVw5N5CM+PgjtOGiO+jV+yUebKLQpGaLMH8t9tgoLwYpcSiRBzM3ygBeiNM0aU5koFGi1zh68=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4238.eurprd04.prod.outlook.com (2603:10a6:803:4e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 03:32:08 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 03:32:08 +0000
Message-ID: <ba7610119fbb676597d0d8f1bd0beffa076e171e.camel@nxp.com>
Subject: Re: [PATCH] drm/imx: fix out of bounds array access warning
From: Liu Ying <victor.liu@nxp.com>
To: Arnd Bergmann <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 24 Mar 2021 11:30:33 +0800
In-Reply-To: <20210323130550.2289487-1-arnd@kernel.org>
References: <20210323130550.2289487-1-arnd@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR06CA0021.apcprd06.prod.outlook.com
 (2603:1096:202:2e::33) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK2PR06CA0021.apcprd06.prod.outlook.com (2603:1096:202:2e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 03:32:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 109f6b28-f225-482c-43f5-08d8ee756704
X-MS-TrafficTypeDiagnostic: VI1PR04MB4238:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4238526CE997BC3515894E3098639@VI1PR04MB4238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:226;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OCJpf8T7dBOk1YwjPjVPiKkEE8ga6zbRbs8co3NsLzjOOasZnMNLEQdpQX12I5WUPH64iLIL8vlMxoYQ9S9biDkITlVQLtnT+ipjuG0MLGMStyAE9AfmnpMy8K7Y5DA5OEf3ZUHg/1+CAEn2nIg27gE369GdjVNvIdX2tmf+pit3EuTmkAY03dfxe/4Xu9EBB/HFYGI8jEt+bpfK7yg/v4/hc+fgC24E9fHp7DMhUD/c080ARzW3OqAP/P4Ld2VAYZpvPlHkxqSq4cYvw8N51ZxsBpZmcKH+/cHyMPFudfoiwvJXkugMyan7vEoAc8bZO/Fdly4P2K46d3OqcT7y3h+bnNRF3sPymEea92+UGg+f9CBGwxzSI9MmApGpiqMJhDadYn8BSbLJCpulun7Vh8W/fi77spRb71rxUXhXqnhcuCjv4wYN7D7IGmfzq5so9051UFXQWTjeMTruLdQ4oW+6HwUjb9HJU//6SruCWo10N1ykTAXYEhe2ShsVbkFjpwms7Iu8AcR/X3zTXEGE9Dyzo6LWTlav24xyUfST1Tusnt4z1vNy1b8z2Rj5J24eGKzZw2WqPdxAPsVkFKljtUHzlE0IoSavTlYQ31O8cHLAPz51uXOVeTOgRU6TJFtbvOi05gilBjUiwWNA/HkH7amztfDsAPxE/YBvF8s8hCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(66556008)(5660300002)(7416002)(6486002)(2906002)(83380400001)(16526019)(956004)(66946007)(2616005)(6666004)(66476007)(186003)(52116002)(110136005)(316002)(54906003)(8936002)(8676002)(478600001)(6496006)(4326008)(26005)(36756003)(38100700001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a3NsY2xqbjRXa05TbzJRQ0dOVUtUZXUxV052Ym1YeThBbzdKbDRFb2FWeVk0?=
 =?utf-8?B?dmVxMzhsTldFYXlWTFhJMTVpanlmNjdvQnNTZXdrZG4wL3EvSjVpM3d0NnJT?=
 =?utf-8?B?MnAzb1VoOUYrNzhEZWJveGUzQjlVQmNKVGFGcm82QjNtUVNwcjdDMzJoT0Ns?=
 =?utf-8?B?c2c5UXE4ZUo3SmpWTE5zZGlRVXBjbG5mMjZtV1RiOWdLK2RiQ2VuVG5DMEtq?=
 =?utf-8?B?UlpwMC9VNWFyT25rMURsYXlRMWJvMmxyVll4QlY5QUtJU3NEY3RtTkx2TXIv?=
 =?utf-8?B?cktWbnhqckUydXNjUXVuTU9EM1FBMVoxenFBOXVYdUlIZ1dPMVZhYzlqWWlS?=
 =?utf-8?B?TzhqYXd6eVFYVkhwcGE0dERxYnZjV05qWHdBc0VWVUhBZTZxVFlQbW9ZdEZR?=
 =?utf-8?B?U0lNd0EzbnhzVFNJUnlzcWdZdUZVQnVRYWE1SEh6YUluN05KaFg5NTRUUXUx?=
 =?utf-8?B?Y2Rtc0tjSkl4TFZUQk45bTdwSHArZm0xRE1rQTNmMFk5N0kxOExUM0QxdWFH?=
 =?utf-8?B?WDd0OGRsQnM3aXdiMEMrdk5HNmkyU25obFBtNTYyTGk5aUtqczROamdyTzJC?=
 =?utf-8?B?eWtGSGhQYWEvNjBLdUNaRmJWemYvQ1d0Tm91UDFiVUxNVzBCQ2JNVkRPdG51?=
 =?utf-8?B?M1dkL0J2dWJIRFpsdWxvdGpYMmVIRVVvWDVqenQ2QStJbEFaL1QvMzlEYjYy?=
 =?utf-8?B?M0tKdUtRUlNlYXZrS3BxNFhsUEp5RkJaQ0NuTmhWbmdYeGs2UHlKZWtFRWJq?=
 =?utf-8?B?dFhrbjYvWXN1SzliSk00eHNTK1ZKNnZ5eTJkc0Z4eDVxdjNzSFdIT1lEM0Ux?=
 =?utf-8?B?QUxrQ1RJd0hhKytuWjRBVWVUSnE4cC9aTkdNdzViOVkzM1E5YUxyUXRCaUI4?=
 =?utf-8?B?Rm9uTGdReHZkOTZqMVFUSXJxQlpoeG9jRTN1clc0ZjBvQmttUmFON0kyQWxK?=
 =?utf-8?B?VHBYcWZ6Y0gzSjRFL3NzQ1FTUWRhZUZGakt5NE5wdnpDYjdFNndtQU94d2xn?=
 =?utf-8?B?M3ZsVnpsL0UzekxTaUZnUG1Bc1hneDhZaE83Zkt0ZHpvM1c0L2J4R2NBOEo5?=
 =?utf-8?B?bFJjMU1zb3M3cjFRc0l1M0F2L3IvQW5EK283aWx6cUZubjFLMjZjTGhVUzA3?=
 =?utf-8?B?ZXIzTGNDVkxYUHRpaTlneGNHR0Z4NVVNSUdFKzA1VGhvb0UrSnBleU9iUGsz?=
 =?utf-8?B?eFQ3dDFOU0U2ZStKaWtmVU13RWZKcG9CTHVkL1VVR0xmWnE4dHJ0azdBWmlM?=
 =?utf-8?B?MndGOVhMS0MxTFhYd1MxRWZzRWRUbVN4d1lxQWJCSW9IcVNLWEIzYlNHU1Az?=
 =?utf-8?B?YytJdExLRTc1VkN5ZGs5ak5DdFhFNlF5cGc1cS9WNU1PK2xucVNBekEzYzQ3?=
 =?utf-8?B?czJKR25PNHA2emFZNlVpVUJQRjVDbHVvRVZiTFNFcWlPYnpmNzQ3UkRYcmFT?=
 =?utf-8?B?dW5xZ2dLRXNhUEVKV0JVWVo5T1Foc2lpV0tpdHdIR0piVFoxc2V0emx0MVh2?=
 =?utf-8?B?OWc4SC9MK3JWWllLZUNGSHIxTmNyU2lJV3o5R0drMG54WFVxaFIxZ1ByS0lu?=
 =?utf-8?B?UE1FVFRLSTVIdjJxaCtHUXJZOUJNSkRnVVFhc2hMeTBvc2xyNDgxVXdNdWhU?=
 =?utf-8?B?UC9aRmpsMnFiWXNPRWhVb29vTUtxb0lIOTFjODh4dGtDd21TWm02VEMycmln?=
 =?utf-8?B?TDVJZ2pScWxoNUFOSldRVTRHWEFhUnNiOTVCNWR3L1E1Y2RUeEJDeDZhQ09E?=
 =?utf-8?Q?+1ERm+2SBqUeIa2+Xrc5QP+Hi76Gz9Vr1Ka4Maj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109f6b28-f225-482c-43f5-08d8ee756704
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 03:32:08.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYs4KCB+k8DaMIzUMj+kAG49afwOSUVR/Uzvsbsng5nYu1Y0kfzp6EalaB5mM3V3AROp+h0uKdSNhxc4etSUBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4238
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

Thanks for your patch.

It would be good to improve the patch's head line to something like:
drm/imx: imx-ldb: fix out of bounds array access warning

Regards,
Liu Ying

On Tue, 2021-03-23 at 14:05 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_OF is disabled, building with 'make W=1' produces warnings
> about out of bounds array access:
> 
> drivers/gpu/drm/imx/imx-ldb.c: In function 'imx_ldb_set_clock.constprop':
> drivers/gpu/drm/imx/imx-ldb.c:186:8: error: array subscript -22 is below array bounds of 'struct clk *[4]' [-Werror=array-bounds]
> 
> Add an error check before the index is used, which helps with the
> warning, as well as any possible other error condition that may be
> triggered at runtime.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/imx/imx-ldb.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
> index dbfe39e2f7f6..1210360cec8a 100644
> --- a/drivers/gpu/drm/imx/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/imx-ldb.c
> @@ -197,6 +197,12 @@ static void imx_ldb_encoder_enable(struct drm_encoder *encoder)
>  	int dual = ldb->ldb_ctrl & LDB_SPLIT_MODE_EN;
>  	int mux = drm_of_encoder_active_port_id(imx_ldb_ch->child, encoder);
>  
> +	if (mux < 0) {
> +		dev_warn(ldb->dev,
> +			 "%s: invalid mux\n", __func__);
> +		return;
> +	}
> +
>  	drm_panel_prepare(imx_ldb_ch->panel);
>  
>  	if (dual) {
> @@ -255,6 +261,12 @@ imx_ldb_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  	int mux = drm_of_encoder_active_port_id(imx_ldb_ch->child, encoder);
>  	u32 bus_format = imx_ldb_ch->bus_format;
>  
> +	if (mux < 0) {
> +		dev_warn(ldb->dev,
> +			 "%s: invalid mux\n", __func__);
> +		return;
> +	}
> +
>  	if (mode->clock > 170000) {
>  		dev_warn(ldb->dev,
>  			 "%s: mode exceeds 170 MHz pixel clock\n", __func__);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
