Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04C72D9DD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 08:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CCB10E1F6;
	Tue, 13 Jun 2023 06:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2049.outbound.protection.outlook.com [40.107.14.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5D810E1F6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 06:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIaFUP6HQr35o8dq89LmkiziEovBmy3C2mcr126aWlVh5tcyFm26vfKekSTZDn5LrhYBoHXUSQmGlyMci2pjw4v18RTttAsrD6Y+UJHQXDJ4dylsN+TattnOwyRPCcvyxutEuiU3dv+Nl/EG2+Ux7IP08zU3kAmMfWRkqgPLvsigF75q0AOQ6SAw61IGncF94ez+LsC5ZLJO89/tD/tReo9QvVZ/gbVnMsD1fFvAmhb1MKikNofInrm6u4j+CaUpiv1xTxnEtqk/9/PzlKPzb+Q3cwxb4HG2BCOezfrduNaY0tHiJ8eNo0LHX5r+Pr5fUWXkacfdBTucIvO1YIJWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBEbtU2bxfsuw7mx49Yzn14h6NJUsJFtdYiYB64KB4A=;
 b=a+L0PDBZ2DrIAP/aA9UBU0q1SILjTuJBJKAA8FE2bKdyRG8ctMCDzNzWSgjkWCN6urU8C+ypeGxI8XlUJvox2cwRE2wiOobmEdfKJLpTy3XtZF7YcUIdDB+mjWlNlZx56KHidbtJcfwG5WUelyqDZIMura4fi/YvwNi0/Ins7RkIx0zoPL6v/SOK4zzwlq6l+jM28UGSvdCgwzcdrtUUj+wV51fTZYCol/YeCd8uJSyfCqEUhl2zIeHDiUuxU5oLxaMfkJ6pBkuHCVHzQa+6YfhozIQBGqcLq2mbNqI6UyzLeXok6SSmu0E8w125oYAYtVe8sXsQmuJwz+pjG4i6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBEbtU2bxfsuw7mx49Yzn14h6NJUsJFtdYiYB64KB4A=;
 b=DvZBoWO8PM4OFi1N2SCvaSfhZMjx54HMe/n4q8ipLeJCyuGRn+2zIim8iaI/MituKG/WzHZIGvE3wIRnhmQdMYce02IQyk4ELBqjs4p4/1dKupcEEDcQf4uQi2/wfslkYzstnQAnhA3C9TmXyvGkOoKxDbQsj9Awn+/ntg34MHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB6230.eurprd08.prod.outlook.com (2603:10a6:20b:29d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 06:25:10 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::77dd:14e4:a772:d85f]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::77dd:14e4:a772:d85f%7]) with mapi id 15.20.6477.028; Tue, 13 Jun 2023
 06:25:10 +0000
Message-ID: <b3bd9e37-a028-0a66-d6eb-7dc01a10443b@wolfvision.net>
Date: Tue, 13 Jun 2023 08:25:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] drm/panel: sitronix-st7789v: Check display ID
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-8-miquel.raynal@bootlin.com>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230609145951.853533-8-miquel.raynal@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0195.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::11) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 5576089c-7cb8-4584-7db6-08db6bd6f043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4os5PYUgT2y2NK+6AU4940Usc55sGTuQYPe2Urnn0Ll2eVt9svDgmcym04PEQMl0yAdLsacZ4HkrRhp3cCFYFK1n72mcn8D5O84Ko71X8Ej9/Kr8oxAE65NxfCkr+sS0+3Sq0q4A1szhM9DI6CXKU8/8DQOx2yRB/wrSdjBhqv3HX/Sl3/LkjvGL3oO/mM9hCftzd3ghC7mhsHVwzsiHnNGVGTvjoBQCL9GXyfBLXVdZejqW2IAyF3FNF8xXSAAQc4zUewIx4/+X2zTcUVwyBPDpe1k200y3uPG9IatschKvsV4nmrrsIFSrtuDbiSds5M7O43rpgcIw+grHAFqdYtOuGuQHrNZbu/JEi6aNiOt/GlMuz+nEnSRe9gLoRZ6PlStaLOYyPYaJxiULH8ohtWH7/1Sx9up3nvYgsWkbBO5IWq6ON9K1ZoFqAzFMPsz309p81KaIP/gciKL7lyibosAmZ5HujFS1iSI+7s9hjBFOKOkW55aGvKHZVxAyTTDdRHEPcRguONN3tM9zg0Wto6KcXVmWMsER3MjaggYLvzBIe+h4U0yyQCSzz836ndzbZ4OH0qHzGFW9wERI+9KXGs39Z+dumrHTfiCHyoV7koa7HQNuFE4Umlv/9svA5mR5Qh4EzSfdZ+X5xZvxJ0AlZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(451199021)(31686004)(66556008)(66476007)(66946007)(316002)(54906003)(4326008)(110136005)(478600001)(6666004)(31696002)(86362001)(36756003)(6512007)(53546011)(6506007)(83380400001)(186003)(41300700001)(8936002)(8676002)(7416002)(44832011)(5660300002)(2906002)(6486002)(2616005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3M4U3VwWWJ2WmYzdXBQeUxJU0JCejUreGxpeW8rdEtjZG91M3dLTGFwTGpQ?=
 =?utf-8?B?RFJHWi91YkZhTEYzY1ZHNDNnSENqQ0FDQlhCTG5sbUVqUjEzOWtMZFQwTEU3?=
 =?utf-8?B?NkM4d0ExMDdEaElDRXI0dTB4cFlqckNnNm1TYjBxWkZHMGZIc2tzZ2RaYUln?=
 =?utf-8?B?eUFOd1lsSHd1MzgrWDJDVDk5TkhCYWxFck1yY1kzK1d3bW5RME4vMWRkUjFx?=
 =?utf-8?B?WjlUK2FWWEVvMmRLeHdrd2dOQ0J2amNDTFRJWFdYZlpYVVJMVmxPYXF1RjVl?=
 =?utf-8?B?NTF4cERkWVNPL1A0RnhQOWwxdE50dWQwbDRWYktTSmE2czU4bzU0Skk1Z2VJ?=
 =?utf-8?B?K2JnUFkyZ3luKzA0d2pHSU5RU2NDRVR3YkRESFQvUjNIWkZxV1VSL0l3eTN0?=
 =?utf-8?B?cWpnNTRuT3MzbUUzQ2o3MmdyZ3BVdnZlbVpTeDloRGUybGJ2ZDFUWmdaa3F6?=
 =?utf-8?B?Qy94cjJETFhieFJ6djF3R3dUVDdBdEpPVjQ0Q0hKRVh1WHRNL2hIRURiR1Er?=
 =?utf-8?B?NXpiSW01TTRZdFhodUZwcXNpbHp5VjcySUwwOHFQNlFjbmp5TDFDa1VSdDBl?=
 =?utf-8?B?ODJWQXMxUnU4Z1IwWU5ySlBvNDNBUlA3TEdEZG5OYUJMb3NjczV5VG5PcGRS?=
 =?utf-8?B?b3BIU1NOTFVhc1RsNW5NSy9QTytkUVk2anhJYWkwNGlFS09TUTNiUDRVajNG?=
 =?utf-8?B?YWNzNkZsTTZLNTN5a3k5dGRUY3Fsa0t0dE9WUVdFd3RoZDVuU0t0OWY5ckpC?=
 =?utf-8?B?THJzdmFERVU2TDZzY1RkZE9kZU1JL1hoRFdxQ3ZTTUFBMUltV24rUHlQSHlr?=
 =?utf-8?B?RzB3bmdrQVQ2MzJiTmROZ1Z0dy93UWNXQkQveTJZZHdMWEF6V1QrM05MMjk0?=
 =?utf-8?B?akNGL3llQ2RySk1NaENyY01JaitQV2c2T2FvenVkazVKcXVPbytmeDVodUt2?=
 =?utf-8?B?eW90VEljYVQ5NDVQSGhwS3lHM3NPUEFCSXBycTZzZEFGRUlqM0cvdHcxUzNi?=
 =?utf-8?B?WDBTM1dpNXEzelFJOGtaaUNaVVVGaWdsU3pBUVB3eUx4NnB6V2pNaFR1VENW?=
 =?utf-8?B?TzFHVC9DbnordHV6allBemFzekV4Njk0SktlWXdjTERDczhyL1lPYnErOUta?=
 =?utf-8?B?N0FNaUVBcVdodVNoY0E0akx3Y3BpYVMxQlB4Sno5MXZHUllXU0o3dTVtb0tY?=
 =?utf-8?B?S3Nqc1ZPVTFGU25DZXhvNktBSjgvbW9ncmRreE5sN1dUSDhLaTNxN3c2TUNV?=
 =?utf-8?B?Qkt4Z1dvdFlHYWs0TUROUFI2ODhURnRIbjdmNDJJRHdKOWdIVmxhQ3BEdWEz?=
 =?utf-8?B?aXh4TzVEL1dXanVQWDNMQmxOSzVuVmdxMDRFUFNGcUN6amI1Wk85ZkIxbE5N?=
 =?utf-8?B?UnB2cTNJWGkwV0FEbnAyMnZjY1RocFptcS9rU01seVZFcHZRYU11SVkzSk8y?=
 =?utf-8?B?WkY2czcrbHNCdEU0bjEvTkZZWXZ2cWw0a1J0eVE3aHpuOXdDM3V1WUd1eDM2?=
 =?utf-8?B?SjhvMWk1WjJGbXJFdmJIdzc1OFo4UVZxQWQ0S3llclhKOVpob2FzaGJTN3Uy?=
 =?utf-8?B?djJHcmNQVDkyNUNTbXcxMnYxVi9vVi9CSWJROHVBL1BmYU5WblBTZ1BSZG9m?=
 =?utf-8?B?QjdZbUlzemU1MCtWNzR0VWJLSUt5M0owaEpXRXpzZXVXMWlEKzd0dC8yY1pu?=
 =?utf-8?B?RUs5MG50dkFvQ0NwMU42eFpNSXRkMGpGTU1NL29HQXk5aFBLS252STY4NTdB?=
 =?utf-8?B?cnN4SlRmeVJlMW9EL3Ura2Z2bC9mbUVzWWtxeTVJSlhlc0I3NkJBMVo1djF6?=
 =?utf-8?B?Q2VyS2VmMllUQ1BBTkZBOEF0NUtQaEdZUWV3b1drV0k2K29BWTdKYVpmdTB0?=
 =?utf-8?B?dU5MdTJSR0FUdWFsUk9nYVlxeVY0NmxLNTFPc1JGY3BLT1lGNWU3RnFkTEFN?=
 =?utf-8?B?ejB0cEJOZXJ5N29TenlweGp5VUMrdnA4Qk5BMEg1Q1lOWmZ5Uy93TGozSDdr?=
 =?utf-8?B?L2h2U01mM012SHgwaWVKcmhaMkpsdlFoeVVPaEIxYWM1MThXaTQvMlQwUWcy?=
 =?utf-8?B?WWVXRThlZWZybW15bkpyQ3EyRnk0aUtYb0pzZ2o5eU43V1h0czhVR2lUMXRy?=
 =?utf-8?B?c2U4MVVWbFVoK1ppSFRtZ1VvRzQ2cmYzU1FPMjkrNmtNbStLSEU0QkNqZ2FO?=
 =?utf-8?B?MnJRZXNrNlNNaE81SStZVlpuUVUrNUFiTElHeC8wSUdVNDN5Ujc3c1c1YTM1?=
 =?utf-8?Q?DLHLdUR+bNM466NbQf90iP9ub40bHKrd4dWP1Jsez4=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5576089c-7cb8-4584-7db6-08db6bd6f043
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 06:25:10.3211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RY+Mdqt6x0rtDL223025UDZdt1kpr/Rw2ADlBxD8363Gmm/7G4V0J+gNJIIYQWQXuF/G8Uc5XDdK7d4OQYvs00kixyCloWJ8vC1FNrwrz9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6230
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel,

On 6/9/23 16:59, Miquel Raynal wrote:
> A very basic debugging rule when a device is connected for the first
> time is to access a read-only register which contains known data in
> order to ensure the communication protocol is properly working. This
> driver lacked any read helper which is often a critical peace for
> fastening bring-ups.

I am afraid I don't get the last sentence. s/peace/piece? s/for
fastening/to speed up ? Only guessing here.

Best regards,
Michael

> Add a read helper and use it to verify the communication with the panel
> is working as soon as possible in order to fail early if this is not the
> case.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index 7de192a3a8aa..fb21d52a7a63 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -113,6 +113,9 @@
>  			return val;		\
>  	} while (0)
>  
> +#define ST7789V_IDS { 0x85, 0x85, 0x52 }
> +#define ST7789V_IDS_SIZE 3
> +
>  struct st7789v_panel_info {
>  	const struct drm_display_mode *display_mode;
>  	u16 width_mm;
> @@ -165,6 +168,77 @@ static int st7789v_write_data(struct st7789v *ctx, u8 cmd)
>  	return st7789v_spi_write(ctx, ST7789V_DATA, cmd);
>  }
>  
> +static int st7789v_read_data(struct st7789v *ctx, u8 cmd, u8 *buf,
> +			     unsigned int len)
> +{
> +	struct spi_transfer xfer[2] = { };
> +	struct spi_message msg;
> +	u16 txbuf = ((ST7789V_COMMAND & 1) << 8) | cmd;
> +	u16 rxbuf[4] = {};
> +	u8 bit9 = 0;
> +	int ret, i;
> +
> +	switch (len) {
> +	case 1:
> +	case 3:
> +	case 4:
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	spi_message_init(&msg);
> +
> +	xfer[0].tx_buf = &txbuf;
> +	xfer[0].len = sizeof(txbuf);
> +	spi_message_add_tail(&xfer[0], &msg);
> +
> +	xfer[1].rx_buf = rxbuf;
> +	xfer[1].len = len * 2;
> +	spi_message_add_tail(&xfer[1], &msg);
> +
> +	ret = spi_sync(ctx->spi, &msg);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < len; i++) {
> +		buf[i] = rxbuf[i] >> i | (bit9 << (9 - i));
> +		if (i)
> +			bit9 = rxbuf[i] & GENMASK(i - 1, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int st7789v_check_id(struct drm_panel *panel)
> +{
> +	const u8 st7789v_ids[ST7789V_IDS_SIZE] = ST7789V_IDS;
> +	struct st7789v *ctx = panel_to_st7789v(panel);
> +	bool invalid_ids = false;
> +	int ret, i;
> +	u8 ids[3];
> +
> +	ret = st7789v_read_data(ctx, MIPI_DCS_GET_DISPLAY_ID, ids, ST7789V_IDS_SIZE);
> +	if (ret) {
> +		dev_err(panel->dev, "Failed to read IDs\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < ST7789V_IDS_SIZE; i++) {
> +		if (ids[i] != st7789v_ids[i]) {
> +			invalid_ids = true;
> +			break;
> +		}
> +	}
> +
> +	if (invalid_ids) {
> +		dev_err(panel->dev, "Unrecognized panel IDs");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_display_mode default_mode = {
>  	.clock = 7000,
>  	.hdisplay = 240,
> @@ -237,6 +311,10 @@ static int st7789v_prepare(struct drm_panel *panel)
>  	gpiod_set_value(ctx->reset, 0);
>  	msleep(120);
>  
> +	ret = st7789v_check_id(panel);
> +	if (ret)
> +		return ret;
> +
>  	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE));
>  
>  	/* We need to wait 120ms after a sleep out command */
