Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E53486C8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 03:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9D46EB12;
	Thu, 25 Mar 2021 02:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00073.outbound.protection.outlook.com [40.107.0.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDF26EB12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 02:05:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiKkWZujUy1N3m/0FrCIDaWP1pXeECSDdzA0qNKZrDTvqK+XGUE1YCP4QzIaF6K9UHfvXgkb2jg0BqZEvNwuhRvBSaiOZ0/rkO8XhPO6tnsrNz40Szenks5j7Sa9RkZgzE54QNTOGerX9l0sOKkanOX5WKAvcQVmOFBkM8XqxH3RZHsCUpbuxEzFbthRSyRhOtsA1Q8Ex7XZrZK/Cd2JP+x0a0OoBOF/BKGToMzXDKxsp/0FjftAViBkp00dRdHZkCuY7mqFUWJouttSqoBJIfEygOAI9JWDXW5m7MJUsrLO5CTyfLuzuNSjOXIhPEpsny1r+QMsGhpHSgw+uldp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0KR2G95ebUlVYdomKy5FRz2A3DEHgpjonaDI3qGiBI=;
 b=cnlehInPxCBtQZHSyBkHTGJW2MdS/lmvYNDzEKDoMTUb+hKEpJAb2GI/FUDxY92tbLFphJa7D6lS6FSRjwZW2qEAIOkLUvLuufqkLLiF2LrSWImIzON3Z/WrCSYupbwUYBHTZei0riMfvAU8m1HrNqRWkOmu/0TWjW14wEM9bZPxTPAgcfOniU5o0wkX2dPNQSckrQ5OIaV4pzkt3s8rIdNLstIz5yci3h4D0cIPCPG9KeQkbf9lcajnWQIFKsiJcT0JQ2D/r6uol7bLdS+Dyhp9U/V8JmmTeSFxbuWXCl04+gZFpyW/4yqv69gjpsXYVQ7AfcH/eAb8TGc5kjfoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0KR2G95ebUlVYdomKy5FRz2A3DEHgpjonaDI3qGiBI=;
 b=ONNvYSv5LJs1/Spglk/qtIatOv5RwVsPLrci+oYynEDQ5vhROXfVF2sdsxuOfAr31d/XHX01h84ufY68jCMjG160i6jtaskwF7wLXzakRefj2jkpeDDFd09Cf2BRC/23SrITfk1M5p/Dtut8E+t8CMR7Ro7nHtaxbyOIfYvS5xc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4237.eurprd04.prod.outlook.com (2603:10a6:803:3e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 02:05:19 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.026; Thu, 25 Mar 2021
 02:05:18 +0000
Message-ID: <42e9cf4dd5f12ca437787d80fee0945b0af9424c.camel@nxp.com>
Subject: Re: [PATCH] [v3] drm/imx: imx-ldb: fix out of bounds array access
 warning
From: Liu Ying <victor.liu@nxp.com>
To: Arnd Bergmann <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Mar 2021 10:03:23 +0800
In-Reply-To: <20210324164750.3833773-1-arnd@kernel.org>
References: <20210324164750.3833773-1-arnd@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 02:05:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c12862e-ca84-4c78-2cae-08d8ef32705b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42378B097CEB42839B8D42BC98629@VI1PR04MB4237.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SX0t4LNK2xq9QKNcVMj7qioNx9WGg6F8WpsZXz5SJRLXy7cVKh+5Zqm4eVhzQmUxcMV93oJ2X5rnZp+z2QIGcegw9VVpYCjb5nliXsS+CLJu9PQ+RRsvKLzPEMKuWtau5GeSGuJ1DRlAKbgIOl2cfdBoRcv6k/7Dg6SOaE/1jyZeKq1Vb3njc4tmpelDA6iLO04ivuuJAgydmH28j7HUZvxHpv8MTvFZM4ZegyjgPrZPHBYGap8Sz40qE0zcP2tWm94ECGTdFWs4QcbPk8q0E6wXs9uHsHjbalwprqImwKOosIfxucfajJIDGOxX+kJT3sw4adt8Q+pkhODTFQWBulLEa2JgJtT8yCeZiDUXNH2Ha3c4MSQPodAi/qgq0Y345dnMyum/qiZ4P3rDZbpSvHtKPxKivmIgk/JZkQB159SwTD4GlayTWKqkO14aD+nB3wIkQzOq76eadVY4KLG4y1wfktkTJ/4+W3mXmD0mqlsz5dgnzPmyiBpKcoU4Dmeqzait/10xqNqzykpCcweFF1h3gYdoo0oJdqIe8rUq27h43UCz5CBsWmvQQ7qUBARZbiusgKL+GGvF9tpjMwoALyXarFDuH9zy1ks8H9sow9QszpbdK6t4O3OwEYzO5uic178q5AiG6yivr2hyRIaZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(26005)(54906003)(110136005)(186003)(86362001)(478600001)(4326008)(16526019)(5660300002)(52116002)(6666004)(316002)(38100700001)(956004)(8936002)(2616005)(83380400001)(2906002)(6496006)(66476007)(7416002)(66556008)(8676002)(6486002)(66946007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGJ6T0ZCbTlIRW9iS0M5UzlFTDJiVFdhSWxobm9lVGsxREd2SGNhQ0NhN21i?=
 =?utf-8?B?REtUeUhIUDE5VWhwNzg4YnhyZkMwMFk0ckZuWVE2SzJEMXJrTldJNjlRbGY4?=
 =?utf-8?B?M1EyazI0VWVEbXg1bUFidHhvR01qRWFua25yZVZjQVMrZTJqUGZTQU5WV21l?=
 =?utf-8?B?cjFxczVMOGNCdm1JaTZ6OHIyOXBUQS96TWFVRzdKRktCOXI3NDRRLzBhQ2lV?=
 =?utf-8?B?RVVOSjNwS1BzaUQzVG91eFZHSkNraHRKZm5NRUkyUE14Q2QrQkxrYXh3RkJQ?=
 =?utf-8?B?V2ovZlY0TXdtK0lSOGc1bVJXTGdXSkRKUW9lZk91bnhuUUlXU3pNd2tlMnpm?=
 =?utf-8?B?NVEya3JSY0hsNy9UaG1qOGpIOFVoWWY4WEtpOVc2cXdKUVhzR2tUSDNmeUNN?=
 =?utf-8?B?S0o4bzFtYUgweVEzVW95NUFucCtDcU9odFEwb1N3SmowcUR0SXJ4WXVHYmVm?=
 =?utf-8?B?Qkp6YzI0ZTA2SDkrdFl4bXF6UmN5bmNqNGh5MnlocW1oTTQwa1hydVNEcCtP?=
 =?utf-8?B?a3ZVSmwxL1NrZm1DS1ZHc082RnlVZnE4bWJ5SjB1Ym5FQjgzQk84L2o3bWpa?=
 =?utf-8?B?OHlwbGdOelRhNEZwb2tXb29qblFJTk5XNFJRbU5YdytneVdnUnkzS1VSRGJq?=
 =?utf-8?B?dFBtTzRIQ29QelQ3eFVsODg0YjJreDRLZVlLWGYyaFVQanJOckdsUHdGeU9C?=
 =?utf-8?B?THAwRnc2VTUvUzIzTkNoZEg5Yi90MHFuRDBJdWhOaWtOWGJmZ1orNXF5NDRo?=
 =?utf-8?B?YnhFMmxxREgwL0t4YzJWd09nSjBoc1dLbzRlS0twT3MyTldjQkVYKzZNN05O?=
 =?utf-8?B?SWh3Vm96YVBrOHB0WjZxTjVha0JsZUJERWcrSjNyWDdSZTZ5VzNxU1liQXg0?=
 =?utf-8?B?dnFYc3BJKy9UdjRMYVFlYzBLNkxkNE1YUXlydUd3TUkzRjc3YU5nL3UwV1Qr?=
 =?utf-8?B?WGZtKzhqZEsweDBpbkU4RitPSkZHYUcyaGtzVWF6WkFvODFtczJjWnFRdHg2?=
 =?utf-8?B?Tk84c1BWR1BkaGJ0RVRpS1RjbVM0Si9NRi93eEFUUTRwWFpFVFdDb0I1WkZz?=
 =?utf-8?B?YXp1SWpieU43T0g0WFhNZnU4aXp5cDlQY3RpREdzd3Z2eFA4a3VmVGtheGNh?=
 =?utf-8?B?VFV1cHZ3NGZjMmhpY0w3SXk4RUlrRkJSRWlRRWFUWHIyZ2tGaGkrQmR5SUls?=
 =?utf-8?B?ZnBEM0owSFltRFlZMm5LWHlYYlNWbmYxd3g1bDFQY2R4eGduUkhpQkZibytX?=
 =?utf-8?B?NTlkOC80Y2tZR3BWVU1xTFpTTS9YbWRlSmdWRzBxb0pZODFOZm5zWkxrTXhD?=
 =?utf-8?B?SWRYdUVUWEphTGRDVjZ5c09lZ0RIUU5zVm1tbE8yUnowMlFNeUhEVThHMU55?=
 =?utf-8?B?WmJrdUFqWWlBb1dJbG9WakRkakxhWUJJaHZDNkd3eUM5QkhiUkNyQzhsLzc4?=
 =?utf-8?B?VzdrOW9rOWJXbkdXc05kTUtaK2lpT1VwOHFvV3FEb3RMY01uM1hYdUFMNDhK?=
 =?utf-8?B?M0pnSlNlRTZTN0hRQmV1c09TVWRPNUZsTnFERzhld0ZnUEdERjFNV1ozSlVI?=
 =?utf-8?B?aHp4UXlSYjQ1U1lhVjZXU1ptNjRMcWgxcE9XdkQxMnVuZXl6Ym1RWGdVZ2o2?=
 =?utf-8?B?SGpoZ1MxRkJKdFE0QXVxQWlQSUo5MzNXZEl1dVNvRGRTVXpUUXB6YTVmUjAv?=
 =?utf-8?B?dUFzTmRWZkJLWVB4bXlTdmlXOFc0Kzk3dldEZXVNdnBuc1N0QW44THpqNkxR?=
 =?utf-8?Q?I68CyTaN1kU7deKtnzEQHX2AGHj2+mp3hQhRkM4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c12862e-ca84-4c78-2cae-08d8ef32705b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 02:05:18.8130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0Kfsb4GFy35z//uvAqnrGizFd3G6OEKHiB9pIdK2eD6U/rDsPm1w+EZOxGh1rto59G3n+7oPoOKrqZuluZ4bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4237
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
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-03-24 at 17:47 +0100, Arnd Bergmann wrote:
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
> The warning could be fixed by adding a Kconfig depedency on CONFIG_OF,
> but Liu Ying points out that the driver may hit the out-of-bounds
> problem at runtime anyway.

Almost impossible to hit the out-of-bounds problem at runtime, unless
something wrong happens and makes unexpected parameters(node and/or
encoder) be handed over to drm_of_encoder_active_port_id(). Anyway, an
error check on return value from drm_of_encoder_active_port_id() looks
ok to me.

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Liu Ying <victor.liu@nxp.com>

Thanks,
Liu Ying

> ---
> v3: fix build regression from v2
> v2: fix subject line
>     expand patch description
>     print mux number
>     check upper bound as well
> ---
>  drivers/gpu/drm/imx/imx-ldb.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
> index dbfe39e2f7f6..565482e2b816 100644
> --- a/drivers/gpu/drm/imx/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/imx-ldb.c
> @@ -197,6 +197,11 @@ static void imx_ldb_encoder_enable(struct drm_encoder *encoder)
>  	int dual = ldb->ldb_ctrl & LDB_SPLIT_MODE_EN;
>  	int mux = drm_of_encoder_active_port_id(imx_ldb_ch->child, encoder);
>  
> +	if (mux < 0 || mux >= ARRAY_SIZE(ldb->clk_sel)) {
> +		dev_warn(ldb->dev, "%s: invalid mux %d\n", __func__, mux);
> +		return;
> +	}
> +
>  	drm_panel_prepare(imx_ldb_ch->panel);
>  
>  	if (dual) {
> @@ -255,6 +260,11 @@ imx_ldb_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  	int mux = drm_of_encoder_active_port_id(imx_ldb_ch->child, encoder);
>  	u32 bus_format = imx_ldb_ch->bus_format;
>  
> +	if (mux < 0 || mux >= ARRAY_SIZE(ldb->clk_sel)) {
> +		dev_warn(ldb->dev, "%s: invalid mux %d\n", __func__, mux);
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
