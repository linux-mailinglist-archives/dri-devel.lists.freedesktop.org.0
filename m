Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0632B51C95
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C1D10E95B;
	Wed, 10 Sep 2025 15:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kMys61f0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D3E10E95B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9pVmgSmc1b29DF2iijaRz7RgGBvW4gDtcswzOOaQ+Jt82pkAn+YHpDUF2JFwSYTxhXCj+Tu6Gmtwnlo+N9Bn8QY+4cCV7fYnQmtuIdH8aj4/Ej3rPAGHFPygnmwuHjx89WO5GxgAtlysF9ETTU9cgmQFKezCG5TiUaUYM0bGkfJtdzx47pEQoIi2atLuuynoMwraVzbe/Wj365tdotEejoxUPfWvyJ0I+WzCH/Ego1DnLCQtloLRNqcRekTYPVjk0owqrWXNqb4oR3iH88qByK9geJalHTj27atIzLz9K3yYK/Wz9kmvXFMko3NzQjdDq55gUGxEd06qASqiIADJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El7madXrGMOTJh0ac8DV+uUUjgjqxtLTX1VRUxI4Ojg=;
 b=MHmEfn46NjgLtqIdrY4aOP8XlC4KchrvVCx++kl7C+aQYgvfNet06ZwMU9dFLBxLtoE4rjGkqulXSuhSK/HlEDP3gMNLHC6yNjrD0OndPBcSQ52dhOQgiF0+/S5/i+eZwWux+/+74g3pnE8qYi04N8xA/M5V3IjVmjtACmueK+cTB11XNQaMjB66QpViMS4lvVQh5PTTu50/2jqAnJ8d5FLffMqPUAPGpDEZa689hXcrzVCyOVk4GsiNNPAPujH5A5IxX6WRMUz+YfhHk9ORwXNat+mh25GU4dOTjdlWnx9EEpb/lNepZP50HVAdr7vcckrGorTXYSQ5/THhK2FYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El7madXrGMOTJh0ac8DV+uUUjgjqxtLTX1VRUxI4Ojg=;
 b=kMys61f0I8eqCnCw8UPmWaRtPDwFzHmVUyI0szUye9H8PdnwGHn5S4MdVbItOu4v3CEB3Iw2RmBPhCSzJBgHA2shhjwb9EdA7m4fWQPKlKbYqNyahZZQfpllH2TpJblim2+ZUF4aJD+FGwtA88nGfPETVVj92OxkKSg1IQHO6n7i+k9XOOEYZHlW1WHCOfnRMaUKjl18DoUACjIV9Wk+E4gmAKyqsCssDIY79uHGmgyJlkMdVnGY2aFaEPCuzxrjjPOby27J+cXYWL/PsRKFPhgKezmRFlskZIFPYsvqk5WKYpGZcQSk7KgDKzsGAHfhNr93NGsNOabF6B2VMPCjAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8860.eurprd04.prod.outlook.com (2603:10a6:20b:40b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 15:56:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 15:56:00 +0000
Date: Wed, 10 Sep 2025 11:55:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the
 imx6sl/imx6sll fallbacks
Message-ID: <aMGfiOZrVaFIqA2R@lizhi-Precision-Tower-5810>
References: <20250910020525.342590-1-festevam@gmail.com>
 <20250910020525.342590-2-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910020525.342590-2-festevam@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e20568c-7dd1-4035-29dd-08ddf0828977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|7416014|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BZFSdjIrtkkfjhdyE/kTTKFPBtGGhC4aPZfSDim0n5ywo5A/KlbQg6Whyh+A?=
 =?us-ascii?Q?fI2ELcrZAyHM9EEf1OY+FBNZc9UwVORj7foE/3FvkVhgK77HGvxO1Q8SNhti?=
 =?us-ascii?Q?0wWDlvEro7XXtJBt9uUZmk6etrvuCCim9/SV4P7YhTKekGnDGU7XXgLW5h0+?=
 =?us-ascii?Q?Pok+8bCpn9zWCXSgubDy8LygQVLcwluFidMlGF29pwlWY5zPYk8gUF23e+mb?=
 =?us-ascii?Q?dZrnFAVY78cWM/Wc55dsY8jZGNEQ1/zkoNFJj2zyfl9mbg1n9t27geHYcd+u?=
 =?us-ascii?Q?9Vks/QrrkqCaQLloF82hK8Pq9gYzWtVMdOBSwmXx3xyapEo9aCIN3iAT6rE9?=
 =?us-ascii?Q?l0SdTb8lK7aDu6Mrkyxzckc67ozDGtcLtlRrZMvtoNxotFiQhmAFpZJPRXNv?=
 =?us-ascii?Q?1IouwM9ea89jvUIYfGpYlsyMKGGBbCVLy2cHS2GZaWJIO9/46qOBFpHfNxUu?=
 =?us-ascii?Q?VPoGEQK/88PrSpGvqxtBJs/KUxBerKV7ruucFOvUlUfzl+0AsqK8dXjNkgTH?=
 =?us-ascii?Q?Dtmh9ioxMVR8AQ3gGwUgsJlPEI1vFZOtFX/Wp6N4aGzTjqp1R1Ol2dHfeVnn?=
 =?us-ascii?Q?UE7KyuQEZornQikYpxxgyTos0lbo23aTckjxJbzMPqZDVJHTv13K9gYuvXYo?=
 =?us-ascii?Q?REMym0S+d0f/bX2OW4f06mduSM7cvcyQFstwDknLG8cCdypTqKpGdl2PUeGU?=
 =?us-ascii?Q?s5BMz2uKiAEFrWGV9m0x5wsNJWW1bCGy6pOCeSfRdyzNk/1aCk7ldkU3656O?=
 =?us-ascii?Q?7Cr6baYJy6rviUX+kef4bX8vaHi04kI0sYHzJT2qp87O7gYiRhCrRuAmZCcB?=
 =?us-ascii?Q?JyUd0wBJcxPEqB5x6DG95LkATvNFyVypMYF0kDtLvl5OWv0y0cBrMZvLnww5?=
 =?us-ascii?Q?PnXZYpwSQ0HPV8ewCdUfBDQt/2nJa7Yye0pY764GZW5xToyyR0wl2ao42zBk?=
 =?us-ascii?Q?ZsnG/8tE2zfTYjoRMoQe3D5vxZmkM+8UE+mEYVDMHLswzcHPavJlvtjOvYLw?=
 =?us-ascii?Q?wMk+2ti09IZl3bGB5KvIOslGfA7dsQW1rRO3tn4p4tt+UQ3jwyYp1dc56aGN?=
 =?us-ascii?Q?xgYS6O9KjCwFkt05wTCeYGcVvwE53cP05ec0f0uq9virsQZGq5+3CPZx0Obb?=
 =?us-ascii?Q?Rg3/YCAm4LREWo6nZhYuyHGl/3Rq5ifKBjAjhP+99hI1WbVplKQO7G92eipt?=
 =?us-ascii?Q?GG72MZEbeOHXtwGfCeqIwOvuryQ88fsldb7kI6NOvokVZFWo0ThKytB3/mJp?=
 =?us-ascii?Q?i/209kTYJB44yG2sHeqwpgeMjDsx2VO4enhcb9silRAXtjShaXGdeWVqJWaR?=
 =?us-ascii?Q?5CJsbEADfv9knr3frLI177y3o7NfefW18V9YVo6lZkAejbrBtL1sTVgbJ1f0?=
 =?us-ascii?Q?o9VYeEgmmFmcGsRQacFDhtTSo8LGeLBpM6/svnxQWHceY6QCR+tjnozazh70?=
 =?us-ascii?Q?n9k1AdwtToiIAuyAdnK/n/rD+AHwbrwRn5En6FplgDQDg/dEw2h9NzLLeF8W?=
 =?us-ascii?Q?nuHJalokxgrle4E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DP9q60rUTtgYYGdIl7xEC5Jk7V5j/5Z3/uaTlB12ay47JPGrimRTpvjJ3vgE?=
 =?us-ascii?Q?ONf8gBC1VRcL9rCLJMaIo0WSnwDUEEJeNtdqkwbO6NOBa3RXbc4INZ9ADFR9?=
 =?us-ascii?Q?Iid3g1gqyYQcPrVs0BCGxHZ5XqM8RLlqknU8aqYtSQ0xRRojn+tTNyqqI2B9?=
 =?us-ascii?Q?Fr7ZWU+JULN9iZoKKnpZnJF1hbAsaYwn5FY5LWWvd6cy08A2V66eoWXurtO6?=
 =?us-ascii?Q?LCvWu5m85qXXsdo2HkDbZxPzt00BCmVDJecgn/P7Hb/HYVFkCsvQyu2tEPWN?=
 =?us-ascii?Q?JRCFybHpYOXHEIFwMkyIDUyt8GWVU4e2Q6DsPVJmv3YMQPTfjzzQ5/hKeeRK?=
 =?us-ascii?Q?KmNW/XOwW9/TlNqx/BK1mTw0o0NdiijvcOOwQPo3zX1pnLYZjAY8RG1iBKAO?=
 =?us-ascii?Q?bGaUsD8MjSQNLi9vhYlJ/NeFnB/+mq0JewaSCpVWr++I6bw5pJppg3ugMk/j?=
 =?us-ascii?Q?UFDdf+FeaZW/4SU7ztGvIfyn0ZmC75gQqQHnNYbeGY9fr04p5u+pV1naHEiY?=
 =?us-ascii?Q?oVgOFU9xY1PPFA4EUcwi3eoGTNKLFPFYXCa/clA8FUVR3h+kQ9E7FZKDAXHx?=
 =?us-ascii?Q?L1NV13Cb3pWP6jU7D7TmSv3bKtT+pNeLUPFZ0n/ZnECZGdzSYMFkbzuHQBTc?=
 =?us-ascii?Q?D9Crs7kKnQq1IYG2XGY46d31UDRWpLfS7pT/aT1Iv0rr+9oIqOE65P3ezqt6?=
 =?us-ascii?Q?AP/yH/wV1MrAohjKWNL1gpd6FDUD57q3YvGqM9U9gTnAXdHtZ0jP4wj7wIiv?=
 =?us-ascii?Q?FG2FTUHZPdxhuFS9ZQzA4voSvtF7B9IhVKSjp2+51Rtya0I09VNT52UxiSiw?=
 =?us-ascii?Q?0RW5ZZkf/Gis48xhHRFaSXaiWaGf06v8n+UfqSsg2fR53OISgYGHiwAaenS4?=
 =?us-ascii?Q?7Z6BFFartqTZ/Rj5yRCr3nQIAxvV9lV46YnyfApQZka4dZv8XMYzWl35lLnb?=
 =?us-ascii?Q?qL/V82NrqIp8gGbM+/ewFrnlrAkcHz0bPTEW23oplwTK0e8yue67GCwafi4k?=
 =?us-ascii?Q?dL2l/PIoml7n5bdnXIqE65+2ol8c5VEmVex/cc/0+CMbg5FWizdT/0/woAVv?=
 =?us-ascii?Q?tkdIzP680JeJFn0uMj3hp6xBARRCAxeLtRFJXBW4IMrQieMG1gzpV70ZiJtQ?=
 =?us-ascii?Q?lWl4/3yq4lw0CtsQIKBeCHHTz6sCQIpIhzXx40MCPuJvseG98Kg38672Esm+?=
 =?us-ascii?Q?JO4+jbMjCe0GCGtl/aWZy9rwPLNbqqDI0S5pZTrKJOrFewuFBiHl4iooKrQZ?=
 =?us-ascii?Q?cOofg4JrupdjA3m5eDT6FqOftyE7PQaFdG56vTAlBaG2mqljpUUHvDMBqkqH?=
 =?us-ascii?Q?zdEPqqQX509SURL0jRIB4pOKgHmAPvk0/t8jeROz7/a6khfRfqp2f4UOgiP0?=
 =?us-ascii?Q?k97q0H8Yxko+wvNIOgsdhii6f4wde8Z+DQmZa/v8tfRHDt+j8KGqCdira3d0?=
 =?us-ascii?Q?OSqd7uKpaqAUQx1Z1G8fnKqJO4+uoxuzXKpN0nFF0MiBu32xPlqDvYC5HZQh?=
 =?us-ascii?Q?tdoaVMk3S9LSb5aytgJnKxRoEX8iPaF/qY4xqLP37nQbctV+x/DngdIemSkt?=
 =?us-ascii?Q?ArVM6Th8joEY2UheWaahLcYfzF8oNIuNHaaJw/+b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e20568c-7dd1-4035-29dd-08ddf0828977
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:56:00.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhfReMrivO6fntQYT/Qngh/H7jHnGMPTS0RJiJ0iLskNcJJb/PSVG+oqAatM5lP9Q2wNNtrVWyy62YeI5yqJrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8860
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

On Tue, Sep 09, 2025 at 11:05:24PM -0300, Fabio Estevam wrote:
> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
>
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
>
> This causes dt-schema warnings as the current binding only
> allow 'fsl,imx6sx-lcdif' as fallback.
>
> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
>
> The imx6sx-lcdif programming model has more advanced features, such
> as overlay plane and the CRC32 support than the imx28-lcdif IP.
>
> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
> fsl,imx28-lcdif fallback:
>
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

Anyway, you change dts. If you change dts as

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";

needn't update binding here.

Frank

>
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index ce31b873fb95..d665f3241e97 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -23,14 +23,18 @@ properties:
>            - fsl,imx93-lcdif
>        - items:
>            - enum:
> -              - fsl,imx6sl-lcdif
> -              - fsl,imx6sll-lcdif
>                - fsl,imx6ul-lcdif
>                - fsl,imx7d-lcdif
>                - fsl,imx8mm-lcdif
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mq-lcdif
>            - const: fsl,imx6sx-lcdif
> +      - items:
> +          - enum:
> +              - fsl,imx6sl-lcdif
> +              - fsl,imx6sll-lcdif
> +          - const: fsl,imx6sx-lcdif
> +          - const: fsl,imx28-lcdif
>        - items:
>            - enum:
>                - fsl,imx6sx-lcdif
> --
> 2.34.1
>
