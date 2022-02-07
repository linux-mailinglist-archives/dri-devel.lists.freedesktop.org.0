Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A554AB387
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 06:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613C010F760;
	Mon,  7 Feb 2022 05:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F3010F760
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 05:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmAROZKWQJ6oTfsw52pciwbnMSvTU2bzGrB/0NeZnmHiOo/lHOfQPq5m4iVtF+NjbfkzCJFuRZDXlrUfT2mNTVY3/CN3wtyeesZuFssqHZwON8RMNykKkGgvLXQmAenk0J1Nbjbma31ljj4nOqAZ+mWMRnKY8DbzMcLmmav4VITWF2DUebJPjWalc4joU3Hrj3oFU1PLuXIiVQeMmicCbkF8EVArl4YEOHBumzUV62sCOupl5IWdSnXS8+48GGv3DKLHrvnBdVf+0PiMC7f9yAcqXiefUov9o/AH1zZkXoGnlbLOYApbZTFTgVNiqKNk8qdZPMTGIcGfWcQovrssRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOMnLnHs4+CXwicx4hF0qAcCjuK0o/Xgnz5FKS+i5Dk=;
 b=WACb5J4cURCidtxSCp/NrtOO22kXrSsqjk+kEcBMmkT31dYqtv0U+Ywmk11Ag+7hY2Fh70gLrQAFaStb/x5h0A8ak0bWHHo+mEggWhGsuvbOUFD9T/vJxPFyIYX5/EHpZp90+/M4ChE60mYt93V9HbfrfiTyOpXlzjaQSBj8EhdDZlha/czlmkhZJ+s9azWUX8OMj2/w/yyDgAQAOld7z57V4a6ebZBYJRdQVR/qpU94mXbtpq/yqC8TF766xpJtv0x3H2bPYEL3co4ODrXWboZhq2ciViYEpWpTkGfuLEpocAYQbjjFaQ0pHTV162dAu2QWfy7dkYOXus9hhy0w9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOMnLnHs4+CXwicx4hF0qAcCjuK0o/Xgnz5FKS+i5Dk=;
 b=BjRvRxmv04Cnd1sNoo4dN9QDb9EwG4nwBMHe+n3Bf6cK+yhluURHfDKYP72LkCLE9/yqd5RAGzznI1dL1hz0DJvFoHINQWX4OwlzyA8fVZw7Mbzd3MSMoVLByh6b8JrxRlWofrvwSUCfyrWfQvmUYAxsO0V2Zhnla9h40aMKydw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB6PR0402MB2840.eurprd04.prod.outlook.com (2603:10a6:4:97::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 05:18:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 05:18:14 +0000
Message-ID: <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
In-Reply-To: <20220206185643.275811-1-marex@denx.de>
References: <20220206185643.275811-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Feb 2022 13:13:27 +0800
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea9965eb-3af5-43f3-7d79-08d9e9f93d96
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2840:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2840365CB6E3273B3D6CAF99D92C9@DB6PR0402MB2840.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQ6o4DrrgmXSkg7f4RojpLY69DSaeIfhRWTBHahylxUSq5yaMSAYU+Cw8tWdHL7dO8yclFmNZD2nq+DseRtW0ddcEXmWh9FNL+mCvD8Bv7cJNFqii8F+WpkPKqfUxFDzMGi+M0ewqNdmtpwbskEFb2yTnCb7dmE9Pwq7LEPvYvmtQpobY+aAQjGw+HBfDuhkgGSf+hVfqHiwE5S6XXtLB8USILa3AMqpgYBEKU9FFckhh/cktzcRWgOUJ333Vyg93MVqm29OFy20KCbplwwaF1xkpichhsq4bgveuWT8ZyYDe3jIFbchNgYIrb/3I2dzEldJPvJ33AUJVwPE2nnuNAExxB9bATLQD94SCagoxjbXHXcsYv+zuVk0Wls+gmd6AbERBHZbCzgHZZFS7wX8oB7WyyCLmONnTOwmY1soci2FBgZ+Xec/O+PRiaKNMTLhBljZ7KFeHnmpKSp4OBjLetj8cFXRYdiMiC4QUpugrAJNZI20phugMx+vVvzMXQEc2dcnwVOPswVrmiLpON/B1Wk7gee1aP4Il6teVwsa01uESPqq5ouhFl1ScHfJlvGiTdUMt8PgfOonomBL4GQLOUz9Z1sVmMWlj2SptahnjfhI1pTmjMxdk7qovViUTcXH6uHcb0g/78DlPYgCeRPpt/7jCqur+Zm79rCvBKgz5uHxM8JvIla+tmJ5YfY6noqk6j9aqlmVeshyciIT3rOMEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(66556008)(8936002)(4326008)(66476007)(8676002)(508600001)(83380400001)(6486002)(26005)(38350700002)(6506007)(38100700002)(86362001)(52116002)(6512007)(5660300002)(66946007)(316002)(6666004)(54906003)(186003)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1RYaGZERmxkNEVMZDRpVmQrUUQwYlc3OHgzSVc5cTloczYyT1p3bHB3STg0?=
 =?utf-8?B?cDJST05FQUlZTWw5NVZEcWhXMCtmYUlzaHhYNlpvNGlSYkxCM0t2dHFWR0dW?=
 =?utf-8?B?REIvaDBPcnJQTU5DbVJkQjc3SW8rODJaN3NNajEveVpxb3I3a1hJaDFxc3Bl?=
 =?utf-8?B?U0J2UnQyMHRSOFRzYVJhQ3FFQU5wcmhhNExwWittQXZVUmJGa1Z1UmgzcWcr?=
 =?utf-8?B?bWVDYW8zUGR0VUR4dFB2UzZMRzhyRnFGVURPbi8xSG1MNkpmRHZlYVNXTDgw?=
 =?utf-8?B?VjlvT05mM29TaW82b0RoN1hLbE5ZbXpvU3dGeDB5eXRLa0JLOVdKTEkrdFV4?=
 =?utf-8?B?SlYrdFBzYzVFKzB3MEYzRmlLV3JZelNHbGFzSzl4R0lQcVVmYlBSMnBrWGx5?=
 =?utf-8?B?ZVBMTGVLcjRjdWlNaWEyWVhYY29zOXFRcmZvM29zY2NxLzVnR3R0ZmdRSmk5?=
 =?utf-8?B?OXpvL3FQRkZtcW5rUjN3YW5SZW5ISzhpWmpJdnhIWHZRM0o1VEt0b0w4bENw?=
 =?utf-8?B?VzZwVDlIYW45VmcwQkVVQXNjVXlhYU5rSWVGM3JsbXhLdjR5TExmNUtvR2hk?=
 =?utf-8?B?MjRKWkMxaWxGL3lvYytwUUtqaFo3eGs1ODhTYlJYelQ2OHpCZlMzRVpNUjN0?=
 =?utf-8?B?amljS1A5SzgybXFuTUN0bzg5VG1COHdRRkNkL0dIWXZmREVqc1RpOHVGbGRm?=
 =?utf-8?B?U0kycVpYSzU5dGVMSnJNd2xzSE0wNS9oU0xuOER3ZGZ5QWtMYkJwRkZ5RDFr?=
 =?utf-8?B?K3h1Yk9PUkE2dFhyRXV1MjN0QXUrM3YzamthZ1UwRTMyeVZSdEV3a3dSNVl3?=
 =?utf-8?B?N2REVTMya2pvc2c2MWNsb1lIM0tGdHk1bFVpVHRjdUtMV3ZneHl1aGd3aTVS?=
 =?utf-8?B?Q01DODZkMkxFOE9VRmNLejRDUnViUll4VGhEZFB1RlZSSTFMcDRuYWFxOTZ5?=
 =?utf-8?B?dlVOVmZRNUhtRnJnQjJXQ0NLb1pjZExFVlR5TVVSVnlLY1NUTGdKQlB0Znhi?=
 =?utf-8?B?cnFiYlFleFhITThaZDYyK0hnWkhuY3VxRGlmZFVFZEtVL1lzRmF3blJDNElm?=
 =?utf-8?B?VXdOWERsS2NvRFFMU0dQbW4rcHI1YTFsckgwdUZwQnpGMnNyTDFZQi9SZkNv?=
 =?utf-8?B?NzJmYkNPNTFtMUNudkY5MDk2ckczQkw1d0ZwWFUvYXppSE1kVnlSREc5Lzhz?=
 =?utf-8?B?aWVHV0tyd1dqZmdQL2owSTBNQW90QXdjMU9GQVdUMEFJSWxTTDNWT3NPZjJK?=
 =?utf-8?B?SkxVS2RUYkNXNkRkVFlJdHl6K3c4cjE2ZGVUNU1RaHg4TEJ1VXE5YUFuNE1u?=
 =?utf-8?B?SkJkcjU1cTZLSjhXZUhicEl2aUtSeVZKV1VLdUtQcTdtWTMvbWIwUFRDVG5K?=
 =?utf-8?B?VTNhbzhyajhUTmxudWJDSVl3TzQwbE9DVHRiNFY2TEFKQWNjVnl0YlZPN0V0?=
 =?utf-8?B?WWZUUnZsc3NEQTJaMUQydTV6UklBb1NoOUQ1NkwwQnJrVjVPa1Jzd2NwWGUx?=
 =?utf-8?B?WE9OUWVtS2pNV1QycW1lV1Zza01raS9mWmJQK0FZbXNBNHhvS1FBYkFZcXow?=
 =?utf-8?B?SzU1djdMNzVMMnMyN2c3bTRGYnIrYjlmL0ZXWkQwRUlUZDFwTlZtcDhBMVBs?=
 =?utf-8?B?KytYN2E3Nmk5ZHlZKzJ1Ty9tTHhiTlNkVk91Z2d5N2k5SDFTSmtTZ2U3RVMz?=
 =?utf-8?B?NnRVTlpad3dodVdxT3N2eXhod0VkSDltTEVzemYzUEI3WXdyWVlaZHcyazRG?=
 =?utf-8?B?bmQ1dzUzSzl5L0lNQTNhUUszd0psZ1N0WUxvSXViYVpGa0pMTVFLRkpScDNS?=
 =?utf-8?B?SldsZmhVZFczc1hBNHNxQzVoUEFUWU80VmVLdXd3ZXAzNWxrYStQeWJmUDVr?=
 =?utf-8?B?UnNBbUN2M2o3SWF2MjNZYlZEbnJKTSs3VFlsYlFaUmN0Z3FtVE5NSjc2UUJp?=
 =?utf-8?B?WWJYdHlKdmQxS2FlTDQ0N2VydVQyQVBVbFNQenNpYmV0dnRPRVpoaEVDd0x1?=
 =?utf-8?B?bTdwRWc2VXBsbDV1UnNqKzYxM1hRT1ZvQUk4VngwcmN6R1lsOG5FOUEyT2xJ?=
 =?utf-8?B?czY4MDhvNzAzSjRIL28yV25Gem11Rlh5M3M5TENBajlHNEJHNXc2bXFEQ3kr?=
 =?utf-8?B?SXphS2Y5Q0JuOWJFK1g4QU5MS3k5dmxQMW1kdWJ6cnBxSUlTMWFLcXVqaTdU?=
 =?utf-8?Q?FzK3xsdi7BG8ptk7fXlSQ3o=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9965eb-3af5-43f3-7d79-08d9e9f93d96
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 05:18:14.2630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrYgtYkf65yYk0T7EdlZeG0Kmg/yCVy9kTYEhRQcxH8C5fxHWGS5jxNTa6w1JCw7noHEjIFe86ouOs5VLmzKtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2840
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Peng Fan <peng.fan@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Sun, 2022-02-06 at 19:56 +0100, Marek Vasut wrote:
> The LCDIF controller as present in i.MX6SX/i.MX8M Mini/Nano has a CRC_STAT
> register, which contains CRC32 of the frame as it was clocked out of the
> DPI interface of the LCDIF. This is likely meant as a functional safety
> register.
> 
> Unfortunatelly, there is zero documentation on how the CRC32 is calculated,
> there is no documentation of the polynomial, the init value, nor on which
> data is the checksum applied.
> 
> By applying brute-force on 8 pixel / 2 line frame, which is the minimum
> size LCDIF would work with, it turns out the polynomial is CRC32_POLY_LE
> 0xedb88320 , init value is 0xffffffff , the input data are bitrev32()
> of the entire frame and the resulting CRC has to be also bitrev32()ed.

No idea how the HW calculates the CRC value.
I didn't hear anyone internal tried this feature.

> 
> Doing this calculation in software for each frame is unrealistic due to
> the CPU demand, implement at least a sysfs attribute which permits testing
> the current frame on demand.

Why not using the existing debugfs CRC support implemented
in drivers/gpu/drm/drm_debugfs_crc.c?

> 
> Unfortunatelly, this functionality has another problem. On all of those SoCs,
> it is possible to overload interconnect e.g. by concurrent USB and uSDHC
> transfers, at which point the LCDIF LFIFO suffers an UNDERFLOW condition,
> which results in the image being shifted to the right by exactly LFIFO size
> pixels. On i.MX8M Mini, the LFIFO is 76x256 bits = 2432 Byte ~= 810 pixel
> at 24bpp. In this case, the LCDIF does not assert UNDERFLOW_IRQ bit, the
> frame CRC32 indicated in CRC_STAT register matches the CRC32 of the frame
> in DRAM, the RECOVER_ON_UNDERFLOW bit has no effect, so if this mode of
> failure occurs, the failure gets undetected and uncorrected.

Hmmm, interesting, no UNDERFLOW_IRQ bit asserted when LCDIF suffers an
UNDERFLOW condition?  Are you sure LCDIF really underflows?
If the shifted image is seen on a MIPI DSI display, could that be a
MIPI DSI or DPHY issue, like wrong horizontal parameter(s)?


> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c  | 38 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h  |  3 +++
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 11 +++++----
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
>  4 files changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 4ff3c6195dd0c..6f296b398f28c 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/crc32.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -292,6 +293,37 @@ static void mxsfb_unload(struct drm_device *drm)
>  	pm_runtime_disable(drm->dev);
>  }
>  
> +static ssize_t mxsfb_frame_checksum_show(struct device *dev,
> +					     struct device_attribute *attr,
> +					     char *buf)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> +	u32 hwcrc = readl(mxsfb->base, LCDC_V4_CRC_STAT);

Access register without relevant clock(s) enabled?

LCDC_V4_CRC_STAT seems to hint that there should be some verion control
logic for MXSFB_V3/4/6.

Regards,
Liu Ying

> +	u32 swcrc = 0xffffffff;
> +	int i;
> +
> +	if (mxsfb->gem_vaddr) {
> +		for (i = 0; i < mxsfb->gem_size / 4; i++) {
> +			u32 data = bitrev32(((u32 *)mxsfb->gem_vaddr)[i]);
> +			swcrc = crc32(swcrc, &data, 4);
> +		}
> +		swcrc = bitrev32(swcrc);
> +	}
> +
> +	return sysfs_emit(buf, "HW:%08x,SW:%08x,OK:%d\n", hwcrc, swcrc, hwcrc == swcrc);
> +}
> +static DEVICE_ATTR(frame_checksum, 0444, mxsfb_frame_checksum_show, NULL);
> +
> +static struct attribute *mxsfb_attributes[] = {
> +	&dev_attr_frame_checksum.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group mxsfb_attr_group = {
> +	.attrs = mxsfb_attributes,
> +};
> +
>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  
>  static const struct drm_driver mxsfb_driver = {
> @@ -335,10 +367,16 @@ static int mxsfb_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> +	ret = devm_device_add_group(drm->dev, &mxsfb_attr_group);
> +	if (ret)
> +		goto err_attr;
> +
>  	drm_fbdev_generic_setup(drm, 32);
>  
>  	return 0;
>  
> +err_attr:
> +	drm_dev_unregister(drm);
>  err_unload:
>  	mxsfb_unload(drm);
>  err_free:
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index ddb5b0417a82c..0a3e5dd1e8bab 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -44,6 +44,9 @@ struct mxsfb_drm_private {
>  	struct drm_encoder		encoder;
>  	struct drm_connector		*connector;
>  	struct drm_bridge		*bridge;
> +
> +	void				*gem_vaddr;
> +	size_t				gem_size;
>  };
>  
>  static inline struct mxsfb_drm_private *
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 03743a84c8e79..2a4edf5a2ac57 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -196,7 +196,7 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
>  	return clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
>  }
>  
> -static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
> +static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb, struct drm_plane *plane)
>  {
>  	struct drm_framebuffer *fb = plane->state->fb;
>  	struct drm_gem_cma_object *gem;
> @@ -208,6 +208,9 @@ static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
>  	if (!gem)
>  		return 0;
>  
> +	mxsfb->gem_vaddr = gem->vaddr;
> +	mxsfb->gem_size = gem->base.size;
> +
>  	return gem->paddr;
>  }
>  
> @@ -370,7 +373,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
> -	paddr = mxsfb_get_fb_paddr(crtc->primary);
> +	paddr = mxsfb_get_fb_paddr(mxsfb, crtc->primary);
>  	if (paddr) {
>  		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
>  		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
> @@ -476,7 +479,7 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
>  	dma_addr_t paddr;
>  
> -	paddr = mxsfb_get_fb_paddr(plane);
> +	paddr = mxsfb_get_fb_paddr(mxsfb, plane);
>  	if (paddr)
>  		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
>  }
> @@ -492,7 +495,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
>  	dma_addr_t paddr;
>  	u32 ctrl;
>  
> -	paddr = mxsfb_get_fb_paddr(plane);
> +	paddr = mxsfb_get_fb_paddr(mxsfb, plane);
>  	if (!paddr) {
>  		writel(0, mxsfb->base + LCDC_AS_CTRL);
>  		return;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> index 694fea13e893e..cf813a1da1d78 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> @@ -26,6 +26,7 @@
>  #define LCDC_VDCTRL2			0x90
>  #define LCDC_VDCTRL3			0xa0
>  #define LCDC_VDCTRL4			0xb0
> +#define LCDC_V4_CRC_STAT		0x1a0
>  #define LCDC_V4_DEBUG0			0x1d0
>  #define LCDC_V3_DEBUG0			0x1f0
>  #define LCDC_AS_CTRL			0x210

