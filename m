Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B094FC60
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 05:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D8810E22C;
	Tue, 13 Aug 2024 03:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d5DoK9Lu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2074.outbound.protection.outlook.com [40.107.22.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BA010E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:44:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcWP9A3QSJcziOWgZZ/sE+VNCYDypBZzQH+8Dp5W/Sry2KZaOGSNvIVVZBlbQ3yJ+lo/5Vbc3UEt51Tu8RkyOHhtK/GZ47erKWqp74rKTl3p13Glwy2da5EkuQRjNyxKoU37ALCgETj7wYf2skofONLUQ69HWQtcqBSwXUwGT693ZTE+ggTrZf+wmcGKbgqR7mTftLdPsgAbiauZZGwR2dT49vLhVI/2b+lpXCsW5d1gkH95YCuRCUVD6VriRuQvTsLlEyRQxWPuGm9xkAhhj2pSYFHzwjIAbq2T5cj68o3Uf0HK9/NgYJSdFlcfFfDs2dAsirG9scolLX0EY0mkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp5uo7HjrZ/Env0mHbVUXY6VDaCBYxzn/ambT07TKs0=;
 b=ePdb9ISx3OQtMcXOYv5we9ywvlPSlWjUSfcG0IXI3Ik5phVMYzDZB3MO4LK2gHqmGfu4lYTmc8JDJxw12QWch0S3K+VtupY8M507/9fpjEOoUtlDFSWqce8jHF2IJvZFKXaHs/0y3ks6HAo92qBmxE3g7+orMxIOBp+7hscqpYvKwlB6ZoiEQ63dJZ4MP/8AfcVE40VQxe7EL8WMlmTW6VPvTwKAnmTti3czTKNhxlrhU9yv6kYGynP9T+XgCD52ylAivSC47yRfStuZhaytmjjOxejQA6ztLKScLFtlGMkUS+XZ3jEtdZtdAVqlX8hnyIKF99wPgQB0+OyDXlhxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp5uo7HjrZ/Env0mHbVUXY6VDaCBYxzn/ambT07TKs0=;
 b=d5DoK9Luj+ksCgPcvVAU9i5tWeGEuKddAMxSv2pKxTDIexQ3waTSro00mr5vor9k3S4/cpTUdluiyDnnXTFum248W8nJCOwcDjJ/iX9RsmMsu1+6eReK1Zx9PSWnyTCG6lsSJx/HCLQvpFjLcS9YcM1YVo4GLiMSej0blVOExHm1AjETCM8rosXOVLMZs5DqkNxMVOXl2bhhPTaugiWnnj7t2/zeGlUZF840punLdgkvomOL9M3aG1Q+mAbr6vstD1G6gPTXSPi4gO2YW8KTx6uXeD3u1n7Lh+nhEH1IN6HGIT9zDQ8ihAfmPQw5RS9XxvJxWFHScPfF1VD24tkkig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10318.eurprd04.prod.outlook.com (2603:10a6:800:21c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 03:44:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 03:44:21 +0000
Date: Mon, 12 Aug 2024 23:44:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: panel-simple-lvds-dual-ports:
 use unevaluatedProperties
Message-ID: <ZrrWi0HuAIDe7C0x@lizhi-Precision-Tower-5810>
References: <20240812193626.3826250-1-Frank.Li@nxp.com>
 <143d7bcb-c3ee-4f9f-833c-6680a25681b2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143d7bcb-c3ee-4f9f-833c-6680a25681b2@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10318:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ca922d-d6c5-4805-3d5b-08dcbb4a3749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2I5eKY1iookgXN/1gsa8qn1jK87K+LH4kMXW9KVFXTkllmy2JsECDLP5wbvg?=
 =?us-ascii?Q?2yFDfnYm4QvgNIHtMbbL4fv6oT2XQP7Of5Qwi36LgKIhGiUNroeYmGro/uac?=
 =?us-ascii?Q?+9Se93ERp4bQIo+CyA8ODNUX048p9MSpbnjIk21sLJK6fUVkWlyLnivpvYPW?=
 =?us-ascii?Q?VWj/LgilHEjYHk1qHq9t2/+c7tzayy8pjh2R01133nsJU8fjlNnncliHqmBi?=
 =?us-ascii?Q?2J0hfw3l7qFChjnFkXde1F5lTpakigYz68SCJ53qU3IOB/1dSMHfqlE9VfeX?=
 =?us-ascii?Q?ooUw7/07/Agf0qfZ1w+DuzTZn7gQkikkC59wrKrqRcf5tBBW1zsGCN+2a/hZ?=
 =?us-ascii?Q?xJu6HhOdgwBzxz0JWDvcBb2ZXVD7/CXyHvG3j4jopuwEyx5MAHBEndtQekev?=
 =?us-ascii?Q?4yE19VvVKY+qhoaygY8fBp1DEWJsC4gQGvJ2HodS8FLmux+8o0vFKvdGVq1r?=
 =?us-ascii?Q?rxcXBqEnr5zP4uOsn1CZ6r8ez5VBVmiA0sph3kHy+3hbHCd71/871KxfKq/b?=
 =?us-ascii?Q?+TGsaTv4XGTFncAaRqj3iMxru7/F9CGmjLBymKNT++nugLhv3SsuCLAirLuw?=
 =?us-ascii?Q?4W3AVXzDIoHGJoDk+z6xuW9IlmYLkx1nyMXDBUHbZ8HEfRtyAsksCoXq9wIn?=
 =?us-ascii?Q?3sIakmu60CejxdL3MFAnYdXm655xtrNSDcKnWcHUDcayWCLZZzWAg2iypM1V?=
 =?us-ascii?Q?YV3M47AKXBpDZvuY03NCLTwwRvfs2F2S15VIUdoU/tvBWkkNX4FiDoPHiHyk?=
 =?us-ascii?Q?frYE0S1CUjmYWaagL03WsTJ3+IqrjfJip3Cdl0EGlYG7edAHtUxI726sfUqw?=
 =?us-ascii?Q?J5jvLIVKnihVYOLD6hTVfRVFCpJxYWUmzyKe54xXZ5cRHJd9YNegTAk2hSr2?=
 =?us-ascii?Q?+NICRcE2hDSO7eXw3cBvDDrw97YAKTeREiOcGfh81goyDfO2bvz71MGkxikY?=
 =?us-ascii?Q?5LoNtgLy5pB/48A13NiUHbqXmaklOfxmxMmFN5Gog4rj7aB4EEsdcocFh+pm?=
 =?us-ascii?Q?9R78rdjYVbxpYoVYw0ICEQ8D/B1uatn7LliNukMRew5cu5MXYrdc8LkLuMp/?=
 =?us-ascii?Q?FCP8Ugv2Iktb68vN6zRC+j8K62a2KTCTuGbiwlAmm9d71o6IPh1ehAXJBFJ7?=
 =?us-ascii?Q?uvm4Xf7UFNrbNqiC42Zjh1LTTSz2L+d2JhThGrjYr1kPCebXKc/RDwObUqn5?=
 =?us-ascii?Q?ySYv65vQTtsZOn/iY6EwHHLWfi7G893bYWjS5n9CtKVRxT366Ovut22ejOfJ?=
 =?us-ascii?Q?YL2//IMnLlzSK+wzGHBMgj3w7HnQ5PuTSP7fvyavtGCIplSID/Qr+KlnPHUH?=
 =?us-ascii?Q?DCOCSvIB0AOZZoFrtAfY+4zN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xwlpd0RMkzoPFctM1hJ/wJIRkRo8xvc0Jfh9H/kkaXMWuikBMJ8LhoTuNTBV?=
 =?us-ascii?Q?zRMNQIA1wO86OgIdf4ax9iHj7PAtifyDFTjMem1zBUoU8QjioFl8++VcnIIY?=
 =?us-ascii?Q?atNvJQhfLP/diTL4OftMuljAUdchoiUIsO2QWNAbKH3yj76X7XmQXmM2h1Ig?=
 =?us-ascii?Q?99KLOoyInwtmHbMRVK6G/CBLfYI8cfH7SgVX4L08052o3VDTX49Hs3QAmIw2?=
 =?us-ascii?Q?5FqRXZTJhN78veOeQ7A+xrOW5rpqjCaP2sMGp9AV4q124+xo2qmIaAgXpXFY?=
 =?us-ascii?Q?eRfDv7N2FIOMXlxcuQ5jv308jZ1ScKcxJiCc0Z830Z8SEUNqknwvBWozE5C+?=
 =?us-ascii?Q?eOxt+aDl2vxDuoEsbjB9wXMVnaAQUutaNWl2kBSM6yR/ufBK9pnnoTtbVWE/?=
 =?us-ascii?Q?q+o4AEjlRA9oR/nSiWg1apymrHAfOGPMN0nTQZb0Am8tlUGbdRncfKkc8lpC?=
 =?us-ascii?Q?ZqC1kKfGojxta8z+tV3A5SVlb9W6cCjvd9v24bBPzkUM2nlLIpki+2nOjmEt?=
 =?us-ascii?Q?/2ODbYvHGm5DO7Qxc969E5QrNe45P/1QUIgdu2JLrZBfO0ksEZ9Jk0wMh5pv?=
 =?us-ascii?Q?D/sn/Fa2PcjQoVTpPgkY8bCxKZuXLRVA6wYJDQOHVovPkWjxfIj7Lp7lpZgh?=
 =?us-ascii?Q?+2bJcnF/kccs1PPbrEJ/+mlyN/VIn+zJfNeZUVShpbg2VDpHkH5a5o87RFB6?=
 =?us-ascii?Q?MxO9Fq5zFOocouvMuWPpsWdU2pv+QgtUBkjb8EPjrWT5BJfG/SDefINJqAHi?=
 =?us-ascii?Q?+dOe0skYyURZM2Bl0wvKb8icIpttPIljKnfaCCGmBfqtgt4zGFTzK0orEFF9?=
 =?us-ascii?Q?p9NF3g4Lp1IDZ0ebJKYWsRx/1SMPcruNpqC0+hONbSYbLT6RcUWSYb6KcsCi?=
 =?us-ascii?Q?h5IAD9QNjdZ3ZVPVNPlxublroBbLo5bRG0N6tl3PjmQo0c4xk2FkaR9LkffE?=
 =?us-ascii?Q?9m41OBRs6ErDHmPy2Du8NjMy848QZNmXageiF4XTUyXMARojJ4CiiMcsnEuk?=
 =?us-ascii?Q?8orWjg597uNZ79+LZB+gOZL6KOBKKlrbmxUpB4/HQB+k0fmVbvu5RNDD/7Vd?=
 =?us-ascii?Q?d2STAIiGYibB3g+NLKdeuQgRq1zFd3M0oKR9SKGQM+9jiu9yFG9c2PyPfmCy?=
 =?us-ascii?Q?FP8Gf2TVL8mQvbWPujFiVg/FJrsY/W8sEqqWkNxKjFUwb+nMG4NBOu90BMbe?=
 =?us-ascii?Q?bjIKUIeHNOeVSGzZQaelc6t5WFonO9lnjHAyQ1WlsA2kkLgEUf1FsLJiCxLn?=
 =?us-ascii?Q?od3LHhKDipCZK4RBXluQo4Fh+x8LinT9gtrNeXKNkGPGpJ7OGBDnfsXJpBFx?=
 =?us-ascii?Q?gs6Sc7BBuk/zDhr2wUZpVbP/T9GEKO3SQlEPtBPKT8xrWBKdEwdGD7pHfexN?=
 =?us-ascii?Q?5oTDiCik6/R1ZAL58mbEGvGgnv+ffUYgl4uFQvMbxCQKev6eTnFtqF/DgMiZ?=
 =?us-ascii?Q?ekOUgtIVPAZSBfBoXbQ22TAp0obJlno7e9rUNCwcSpIzzmTPjH/DKrQe3cFO?=
 =?us-ascii?Q?C/4hoFfWrk99Fjht4gFzXsCtRpqLiuaSFVDBEndjp/HFJjpc0MSK316OKx1A?=
 =?us-ascii?Q?Y8/a1ZVeCV+bFbH55mI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ca922d-d6c5-4805-3d5b-08dcbb4a3749
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 03:44:21.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1Tf8zRKOC3STxkkL2PjFO+WoEk6V3BMGbRfm0J9xuvk8jiQIQ6UvyGhjs1tKNz06BTnEbAceWFnw7ruJbyz5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10318
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

On Tue, Aug 13, 2024 at 10:32:04AM +0800, Liu Ying wrote:
> On 08/13/2024, Frank Li wrote:
> > Replace additionalProperties with unevaluatedProperties because it ref to
> > panel-common.yaml.
>
> This would allow all properties in panel-common.yaml, which is not expected.
> Isn't adding 'panel-timing: true' next to 'enable-gpios: true' enough?

Strange, you ref to panel-common.yaml, suppose it will use all common
preperties.

Krzysztof Kozlowski:

Can I just add panel-timing:true for this case?

Frank

>
> >
> > Remove properties (backlight, enable-gpios and power-supply), which defined
> > in panel-common.yaml.
> >
> > Fix below warning:
> > arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
> >         from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../display/panel/panel-simple-lvds-dual-ports.yaml         | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > index e78160d1aa24c..10ed4b57232b9 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
> > @@ -84,11 +84,7 @@ properties:
> >        - port@0
> >        - port@1
> >
> > -  backlight: true
> > -  enable-gpios: true
> > -  power-supply: true
> > -
> > -additionalProperties: false
> > +unevaluatedProperties: false
> >
> >  required:
> >    - compatible
>
> --
> Regards,
> Liu Ying
>
