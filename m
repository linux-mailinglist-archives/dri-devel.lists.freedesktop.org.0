Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD531A92005
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 16:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F6B10EB2A;
	Thu, 17 Apr 2025 14:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="B9W1Orku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5622110EB2A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 14:42:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFavQrnA9ll/PX14FW3NZxG7wf5RlsmH8NjgiKmBepWrsdieFC6Q2mYX9jXN0IUkidMFiQluiVi8QM6ceLhHEKOROOuCjCqZ8QSVLbGrSQF5vdaZWyLFs7ro3CKBPSDfcTVf/DZF8CHFFsfANJgjDxcIzSzF0BEChHjveZ/TZ3DI4IECB+Ylfl+q5OQ59UEdHTzWKurF9Y/za5A7XAD56yOd41nyBYLEG7OBSy2hdEk+e/wTwQYFqA8E19Oif8nV1ehlkgj/jAGf1MSbbR6BqCnJGJ8maQJ7Bk5jHZzZkyqVsQsIwVnvjthvhzldDYpkVXCLrdWdq31ghXWvOU9EcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaEOGlFLZQrTH2gqMCrfUiTV0a1+E2CyVJtnEbyufJM=;
 b=SzOVr/1IB9+AFGmJPeLjXADoELGYQOMd1LLS5lZlhlmUohiaoTM6wrp5LTaZv4TuCP5TjRwPyqi/VBbr3BsoU/J1sgczJLQVFfjoJvX1M/2NIJA1PdW3nje9Qib1ofJlv1+i8JLV120UF2ytKmMOCc+MQlg1lH7mdJ6DqLACRk92vnKIOAuUa0o0GHQe1WtwJrGq3BWqL0EXrQxrP33wOtmiBpDs2Dspl6zjiFHGNP8SyaXZa855eiIWaEpo3/YQPD/yHCiU/+IYggG1QzgfoA32SkIpEKyMK0KAgIHZDs5PwW+/3Wu0pbaizvi31NO3mHxHVF2CEOPPbuxqEk5l1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaEOGlFLZQrTH2gqMCrfUiTV0a1+E2CyVJtnEbyufJM=;
 b=B9W1OrkuoxMXB0jpBlAZ6XMordxX4bZNMZHdKUN2hsRZJT/y3z7UU/lAXobmxenSp1I3ThkMRzzx/ZNLFk1qF/kix9IdyZmy5k5AztFvnZn04eS0Z1meR3JwVjUNGT6Eee8Tfe0PYomAYCBn098+4BXsZyYc1FsqFDnPqfNprZkreG3HSjAALVHTaYJwFYElN/OOJHsA7j3W+3Clsftr/yiMCDnJvXNbkLiLJr8h7d3c6lJYP4kpkr41aKtUmBtFDXcPYWSL22qCUTLGl7GVr6XRw9uy+mmeSQ8crWawC41JXppUW0oBA4ROqkf1qIloN3A5VQ39B9NrPEY2s6LAxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8752.eurprd04.prod.outlook.com (2603:10a6:102:20e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 14:42:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 14:42:39 +0000
Date: Thu, 17 Apr 2025 10:42:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:DRM DRIVERS FOR FREESCALE IMX 5/6"
 <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert ldb.txt to yaml
 format
Message-ID: <aAETVRHVBFN+nF5O@lizhi-Precision-Tower-5810>
References: <20250416211929.3502902-1-Frank.Li@nxp.com>
 <2987529.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2987529.e9J7NaK4W3@steina-w>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2a5966-0984-4232-f19c-08dd7dbe1a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?P7iuuxKEbOeqVMlDwIvOiMUIFt7r+PeCdKOzHUs0AjusnnjJiW2UMrtGFb?=
 =?iso-8859-1?Q?Ye3RFtOQzrdlW8ZmIgcMd/j6z9BGq9JuE1EGQ97IRx+n5k7SjVcQzbuHIe?=
 =?iso-8859-1?Q?yKHFAJdTi9rI3jn6Qa6yTQlpOO/NzdDEqgGARAQWPGQeLhQkb8iTA0wJj5?=
 =?iso-8859-1?Q?sFjnJolOnfE5AiVJy6uaHS/R9APGLR8NkvJik9ewvzYvR/vrG3tkXUmw97?=
 =?iso-8859-1?Q?KS26J+oEtJXp+7oUqvCeQLslCI4KmGQOZWohp7ozFvROvS+Lc+6j2Dy/Vu?=
 =?iso-8859-1?Q?7db9jkfbfVKoD2AcU5Pv8mScYxXhlKFw38u8P9lDNGXKcV3q34Hg2eA1Go?=
 =?iso-8859-1?Q?zvtBEJ4vGxD6uD+6mNozygcEBbW3Cr5F+7ASMpfmuBTaBmkCpkRXimhnAh?=
 =?iso-8859-1?Q?rfX/gLGmbvDzh5GB0vS98wjE0HZ570/xDFcwlhSpenpI4t6M09wxxVGLpt?=
 =?iso-8859-1?Q?R349bzjgK09kdJ3vW5QE7ZuopSvs5Tg0RKIqeqDhuB+cxzVBdy7BOmJ0vF?=
 =?iso-8859-1?Q?9hCp2AF9mGpdcCrJEROY5ycqDgiu1XDrPgTmFsfOfJ7BAihGOjRWpTEKJj?=
 =?iso-8859-1?Q?i9RtpszhZA1d/WiIIAom0oawn79QlEDFXPinHw2HQQ+hZEKYpBkuPsP6lN?=
 =?iso-8859-1?Q?BFPBeY9TVuFZKh1p0VcOGDDqigrXyEEIZWegDcvuD+Ag3YjRduKgwfFrkZ?=
 =?iso-8859-1?Q?eYZUap6GMud4s8oxBSaNahkOa0LShZov/4WZXMcJC42Wqaye+B8vqOb/BH?=
 =?iso-8859-1?Q?07MR5ySHSV+y5vFNqmyKqfAQsDdaVsaIMGienokoyaCFgy1amjq0afF8ex?=
 =?iso-8859-1?Q?Vw86RYQOb0lqeUXvcTZg+RldLqKKEDwtlYrqBnrXCsB5ESbJplxFyGqryU?=
 =?iso-8859-1?Q?oJMm0gvQiSfeZLJk/CHteZ9aKKD2JTkVUzMtZ3w1vHQn8Oac7dpBLwdKYe?=
 =?iso-8859-1?Q?i07aAtb3wtcmBwFN3//sIXqnOwmx5VWxwbEpp69E1cZGvIcSJcwCF9Glfv?=
 =?iso-8859-1?Q?o8N1583NSmfWI5BUcSjJshq0tzl2YXrsQgdFycl2Bbh5+/Wpc8HQgAskg2?=
 =?iso-8859-1?Q?eK6/kK7kFBqfjqpqDBvCU10d1a0Hh49YhwbA460Lq3tWRe+4dyoXRjtCed?=
 =?iso-8859-1?Q?EoXH2cGvfq130Mjowu9PHbZkHzEyzdOaycAb+X931p9lQmHQtIrJC8KXk5?=
 =?iso-8859-1?Q?7nsCcmkGap8njt7MeclG0UzT32DjY1kfBoSi1jR9LFbA8hT7for83rJZUt?=
 =?iso-8859-1?Q?wwO6yqlgC3Hg7DyBDbGx2q5XIO5aOINl32DyO/DRvX+kE70/9Z6kM5SsAc?=
 =?iso-8859-1?Q?nIcy5YgpkA7y/I0OPgd/gKApJMbrSc7hd0zdi6hMhfiRLyiKRg2RMNWeVT?=
 =?iso-8859-1?Q?87jfAmEoNbzJPptKI/95Y+76b0JU80fGV/nfK+nmPV8UbgZk6Nw8dBBo4b?=
 =?iso-8859-1?Q?jkWwkh37Jdj6iwoeMWpVC61TGkdSMCIc80x+0GVc7u/7zO93enYUKpbgfC?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gJCYcT0e+WcE66EeODElASBR2OFcz+4mjFpCyKf6ykDubvYhxI7cFriQX0?=
 =?iso-8859-1?Q?kpvIq3J/+wjlAraKILQxqTLq0NzFzKQlHqXpTYu8GotAWtZT/yUQAJZyPJ?=
 =?iso-8859-1?Q?z1q3VeEErNr8atvl/FtMZ8/bD0jgO6fznoo4PngRWUpXfX6Jtuld9ZZriI?=
 =?iso-8859-1?Q?fCaYMWqx8dW9enPUkBkcohyJ5PMKKaZpARZrjGAoQm9T7h/41y1oYn52Z2?=
 =?iso-8859-1?Q?m/NKaZcxO3a/U62qjcubLxpErHIix+kbTQmvre2X+4z36RYc4B2kpsGB9x?=
 =?iso-8859-1?Q?SFIqQJkmxq3Bc5hnAQZ/Qc+wEvfuURwioTB9Ya75WwqcdT9GKL3oos+PlE?=
 =?iso-8859-1?Q?g1Hlxj+gS8Umdv8My5AH29owAVadFOcUmET8+TK8oDXPjulJaOOiXqeY8e?=
 =?iso-8859-1?Q?QXsDOsrRtuTw4NHgHBF7GPUM+CIS+hv0ZIhvv/WF7UK4KpVVWBCugfPKHI?=
 =?iso-8859-1?Q?z0rDxGtQqjdrJ93Ygyj0VPVtM6utEduffdEjUPZLspNz6Y6U4CeaQ1etoL?=
 =?iso-8859-1?Q?FacSqVqfa2LiQzCW2IjBo0XisIvV/JkQu4dF3yOX6DbQpw/At8/3309x0F?=
 =?iso-8859-1?Q?+V59wVkHUqpdB1V1vwdeok0w1R7/GVVg/h2fG2LUHrG2NRq1/B8u2RKFWY?=
 =?iso-8859-1?Q?SQbfqhLjXvfphhOM68oPDESgskZciAdpdHWEAbECrY/S/1qfpqmrZPzmGT?=
 =?iso-8859-1?Q?OUQc/ZbXmfEMGK5pMxs5i1PPZBE60mTHYT8zNdacG9clUuZLq633mdmQxS?=
 =?iso-8859-1?Q?h18auO0Opc+fKlib3sUfy8BS3JTCWa2TJROYE98Ie+gfOhGYP9Nwzimxd1?=
 =?iso-8859-1?Q?bS5x02NDbpsYudqAIS0u+Ms+ku/1Jn0IqkCRlQbpvR0TQA70Epb+8WjOmQ?=
 =?iso-8859-1?Q?j68uw4myrHA0zrUMmiIAbMVo7DPpGSYgKt8nHs4SNOpl/lS/x3VijAGFW5?=
 =?iso-8859-1?Q?oDMp3TxO+Avy8qDVsZMUVdtOy6z1unabNm5MEwCtcaJ/hnteFD4gTa/ukr?=
 =?iso-8859-1?Q?WOVLzcF07zV+e55wHbXjMdfsTepFtezbe6c9QNMAkPzkTRFKVakVHl6IKi?=
 =?iso-8859-1?Q?Th2VygvODDSBrIghju5rxxXd6to97VYHO4sUZGyc82Zpd8HVym7/f3NmF2?=
 =?iso-8859-1?Q?DOjZRjHKsRdyBdlo4gtFt4dIYe/nzI185aT4slx91rSJYQxLX8X9mTDK4b?=
 =?iso-8859-1?Q?8pOkA80Q5aTToNVazlLo1hD+Oan9HyBRnMtRiX1QUP0Q0SUE3LQp+Cc2l4?=
 =?iso-8859-1?Q?Jv3QhXCR9owE2YZ1qHCfWIOGrA6J2AB9vjhWAs3Js2j+IU+2CWl6DGCMAK?=
 =?iso-8859-1?Q?MT8otaNPfeZei4kcU8eQ024xX5weZ1QZ/Ii6tmq9RbvMWDPRqHj1LYCN/J?=
 =?iso-8859-1?Q?l66jQSP+DqhxzWGof9Xj5+j8+diWO/FTcciuaWaCgJs3EXpNVCJgyEFFhZ?=
 =?iso-8859-1?Q?Fd3x2XRIt7QNam4NktaYGeSVAo3rs7yXsdpviCqTZHRNTnU06qB3DBkNVW?=
 =?iso-8859-1?Q?MeCcdzSr0vBPeY4+8oRSGwwGMv4/ADFNlV+ressKkcX9LSjAjIe5+lluu7?=
 =?iso-8859-1?Q?PgnAeWVLd1Q2uHbidYR2x2OK07la7QJKqemHFBMBWIppnORk2X7AgN7mOC?=
 =?iso-8859-1?Q?NPlACSYyVfkbs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2a5966-0984-4232-f19c-08dd7dbe1a3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:42:39.7264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bmSd2VpT2j0NigQ1ASavACTR1Dy1GZX0yBA+L134o0BODkIMDWBBcWNRReXw8DB8IiSWNIXsWoqvypy3FFa4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8752
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

On Thu, Apr 17, 2025 at 08:37:49AM +0200, Alexander Stein wrote:
> Am Mittwoch, 16. April 2025, 23:19:27 CEST schrieb Frank Li:
> > Convert ldb.txt to yaml format.
> >
> > Additional changes
> > - fix clock-names order to match existed dts file.
> > - remove lvds-panel and iomuxc-gpr node in examples.
> > - fsl,imx6q-ldb fail back to fsl,imx53-ldb.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 182 ++++++++++++++++++
> >  .../devicetree/bindings/display/imx/ldb.txt   | 146 --------------
> >  2 files changed, 182 insertions(+), 146 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt
> >
> > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
> > new file mode 100644
> > index 0000000000000..7edd5f28b1372
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
> > @@ -0,0 +1,182 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx6q-ldb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale LVDS Display Bridge (ldb)
> > +
> > +description:
> > +  The LVDS Display Bridge device tree node contains up to two lvds-channel
> > +  nodes describing each of the two LVDS encoder channels of the bridge.
> > +
> > +maintainers:
> > +  - Frank Li <Frank.Li@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - fsl,imx53-ldb
> > +      - items:
> > +          - const: fsl,imx6q-ldb
> > +          - const: fsl,imx53-ldb
>
> My DT bindings foo is not that great, but I would have expected something like this:
> oneOf:
>   - items:
>       - const: fsl,imx53-ldb

enum is correct. if new single compatible string abc added

    - item;
        - const: fsl,imx53-ldb
        - const: abc

    that means, we have to use two compatible string compatible = "fsl,imx53-ldb",
"abc".

    but here
    - enum:
        - fsl,imx53-ldb
        - abc

means only need compatible = "abc"

>   - items:
>       - enum:
>           - fsl,imx6q-ldb

Okay! this is little better when need add new compatible string, only need
one line change.

Frank
>       - const: fsl,imx53-ldb
>
> Best regards,
> Alexander
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  gpr:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The phandle points to the iomuxc-gpr region containing the LVDS
> > +      control register.
> > +
> > +  clocks:
> > +    minItems: 6
> > +    maxItems: 8
> > +
> > +  clock-names:
> > +    items:
> > +      - const: di0_pll
> > +      - const: di1_pll
> > +      - const: di0_sel
> > +      - const: di1_sel
> > +      - const: di0
> > +      - const: di1
> > +      - const: di2_sel
> > +      - const: di3_sel
> > +    minItems: 6
> > +
> > +  fsl,dual-channel:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      if it exists, only LVDS channel 0 should
> > +      be configured - one input will be distributed on both outputs in dual
> > +      channel mode
> > +
> > +patternProperties:
> > +  '^lvds-channel@[0-1]$':
> > +    type: object
> > +    description:
> > +      Each LVDS Channel has to contain either an of graph link to a panel device node
> > +      or a display-timings node that describes the video timings for the connected
> > +      LVDS display as well as the fsl,data-mapping and fsl,data-width properties.
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      display-timings:
> > +        $ref: /schemas/display/panel/display-timings.yaml#
> > +
> > +      fsl,data-mapping:
> > +        enum:
> > +          - spwg
> > +          - jeida
> > +
> > +      fsl,data-width:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: should be <18> or <24>
> > +        enum:
> > +          - 18
> > +          - 24
> > +
> > +    patternProperties:
> > +      '^port@[0-4]$':
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          On i.MX5, the internal two-input-multiplexer is used. Due to hardware
> > +          limitations, only one input port (port@[0,1]) can be used for each channel
> > +          (lvds-channel@[0,1], respectively).
> > +          On i.MX6, there should be four input ports (port@[0-3]) that correspond
> > +          to the four LVDS multiplexer inputs.
> > +          A single output port (port@2 on i.MX5, port@4 on i.MX6) must be connected
> > +          to a panel input port. Optionally, the output port can be left out if
> > +          display-timings are used instead.
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - gpr
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx5-clock.h>
> > +
> > +    ldb@53fa8008 {
> > +        compatible = "fsl,imx53-ldb";
> > +        reg = <0x53fa8008 0x4>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        gpr = <&gpr>;
> > +        clocks = <&clks IMX5_CLK_LDB_DI0_SEL>,
> > +                 <&clks IMX5_CLK_LDB_DI1_SEL>,
> > +                 <&clks IMX5_CLK_IPU_DI0_SEL>,
> > +                 <&clks IMX5_CLK_IPU_DI1_SEL>,
> > +                 <&clks IMX5_CLK_LDB_DI0_GATE>,
> > +                 <&clks IMX5_CLK_LDB_DI1_GATE>;
> > +        clock-names = "di0_pll", "di1_pll",
> > +                      "di0_sel", "di1_sel",
> > +                      "di0", "di1";
> > +
> > +        /* Using an of-graph endpoint link to connect the panel */
> > +        lvds-channel@0 {
> > +                reg = <0>;
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint = <&ipu_di0_lvds0>;
> > +                    };
> > +                };
> > +
> > +                port@2 {
> > +                    reg = <2>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint = <&panel_in>;
> > +                    };
> > +               };
> > +        };
> > +
> > +        /* Using display-timings and fsl,data-mapping/width instead */
> > +        lvds-channel@1 {
> > +                reg = <1>;
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +                fsl,data-mapping = "spwg";
> > +                fsl,data-width = <24>;
> > +
> > +                display-timings {/* ... */
> > +                };
> > +
> > +                port@1 {
> > +                     reg = <1>;
> > +
> > +                     endpoint {
> > +                         remote-endpoint = <&ipu_di1_lvds1>;
> > +                     };
> > +                };
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
> > deleted file mode 100644
> > index 03653a291b549..0000000000000
> > --- a/Documentation/devicetree/bindings/display/imx/ldb.txt
> > +++ /dev/null
> > @@ -1,146 +0,0 @@
> > -Device-Tree bindings for LVDS Display Bridge (ldb)
> > -
> > -LVDS Display Bridge
> > -===================
> > -
> > -The LVDS Display Bridge device tree node contains up to two lvds-channel
> > -nodes describing each of the two LVDS encoder channels of the bridge.
> > -
> > -Required properties:
> > - - #address-cells : should be <1>
> > - - #size-cells : should be <0>
> > - - compatible : should be "fsl,imx53-ldb" or "fsl,imx6q-ldb".
> > -                Both LDB versions are similar, but i.MX6 has an additional
> > -                multiplexer in the front to select any of the four IPU display
> > -                interfaces as input for each LVDS channel.
> > - - gpr : should be <&gpr> on i.MX53 and i.MX6q.
> > -         The phandle points to the iomuxc-gpr region containing the LVDS
> > -         control register.
> > -- clocks, clock-names : phandles to the LDB divider and selector clocks and to
> > -                        the display interface selector clocks, as described in
> > -                        Documentation/devicetree/bindings/clock/clock-bindings.txt
> > -        The following clocks are expected on i.MX53:
> > -                "di0_pll" - LDB LVDS channel 0 mux
> > -                "di1_pll" - LDB LVDS channel 1 mux
> > -                "di0" - LDB LVDS channel 0 gate
> > -                "di1" - LDB LVDS channel 1 gate
> > -                "di0_sel" - IPU1 DI0 mux
> > -                "di1_sel" - IPU1 DI1 mux
> > -        On i.MX6q the following additional clocks are needed:
> > -                "di2_sel" - IPU2 DI0 mux
> > -                "di3_sel" - IPU2 DI1 mux
> > -        The needed clock numbers for each are documented in
> > -        Documentation/devicetree/bindings/clock/imx5-clock.yaml, and in
> > -        Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
> > -
> > -Optional properties:
> > - - pinctrl-names : should be "default" on i.MX53, not used on i.MX6q
> > - - pinctrl-0 : a phandle pointing to LVDS pin settings on i.MX53,
> > -               not used on i.MX6q
> > - - fsl,dual-channel : boolean. if it exists, only LVDS channel 0 should
> > -   be configured - one input will be distributed on both outputs in dual
> > -   channel mode
> > -
> > -LVDS Channel
> > -============
> > -
> > -Each LVDS Channel has to contain either an of graph link to a panel device node
> > -or a display-timings node that describes the video timings for the connected
> > -LVDS display as well as the fsl,data-mapping and fsl,data-width properties.
> > -
> > -Required properties:
> > - - reg : should be <0> or <1>
> > - - port: Input and output port nodes with endpoint definitions as defined in
> > -   Documentation/devicetree/bindings/graph.txt.
> > -   On i.MX5, the internal two-input-multiplexer is used. Due to hardware
> > -   limitations, only one input port (port@[0,1]) can be used for each channel
> > -   (lvds-channel@[0,1], respectively).
> > -   On i.MX6, there should be four input ports (port@[0-3]) that correspond
> > -   to the four LVDS multiplexer inputs.
> > -   A single output port (port@2 on i.MX5, port@4 on i.MX6) must be connected
> > -   to a panel input port. Optionally, the output port can be left out if
> > -   display-timings are used instead.
> > -
> > -Optional properties (required if display-timings are used):
> > - - display-timings : A node that describes the display timings as defined in
> > -   Documentation/devicetree/bindings/display/panel/display-timing.txt.
> > - - fsl,data-mapping : should be "spwg" or "jeida"
> > -                      This describes how the color bits are laid out in the
> > -                      serialized LVDS signal.
> > - - fsl,data-width : should be <18> or <24>
> > -
> > -example:
> > -
> > -gpr: iomuxc-gpr@53fa8000 {
> > -	/* ... */
> > -};
> > -
> > -ldb: ldb@53fa8008 {
> > -	#address-cells = <1>;
> > -	#size-cells = <0>;
> > -	compatible = "fsl,imx53-ldb";
> > -	gpr = <&gpr>;
> > -	clocks = <&clks IMX5_CLK_LDB_DI0_SEL>,
> > -		 <&clks IMX5_CLK_LDB_DI1_SEL>,
> > -		 <&clks IMX5_CLK_IPU_DI0_SEL>,
> > -		 <&clks IMX5_CLK_IPU_DI1_SEL>,
> > -		 <&clks IMX5_CLK_LDB_DI0_GATE>,
> > -		 <&clks IMX5_CLK_LDB_DI1_GATE>;
> > -	clock-names = "di0_pll", "di1_pll",
> > -		      "di0_sel", "di1_sel",
> > -		      "di0", "di1";
> > -
> > -	/* Using an of-graph endpoint link to connect the panel */
> > -	lvds-channel@0 {
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -		reg = <0>;
> > -
> > -		port@0 {
> > -			reg = <0>;
> > -
> > -			lvds0_in: endpoint {
> > -				remote-endpoint = <&ipu_di0_lvds0>;
> > -			};
> > -		};
> > -
> > -		port@2 {
> > -			reg = <2>;
> > -
> > -			lvds0_out: endpoint {
> > -				remote-endpoint = <&panel_in>;
> > -			};
> > -		};
> > -	};
> > -
> > -	/* Using display-timings and fsl,data-mapping/width instead */
> > -	lvds-channel@1 {
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -		reg = <1>;
> > -		fsl,data-mapping = "spwg";
> > -		fsl,data-width = <24>;
> > -
> > -		display-timings {
> > -			/* ... */
> > -		};
> > -
> > -		port@1 {
> > -			reg = <1>;
> > -
> > -			lvds1_in: endpoint {
> > -				remote-endpoint = <&ipu_di1_lvds1>;
> > -			};
> > -		};
> > -	};
> > -};
> > -
> > -panel: lvds-panel {
> > -	/* ... */
> > -
> > -	port {
> > -		panel_in: endpoint {
> > -			remote-endpoint = <&lvds0_out>;
> > -		};
> > -	};
> > -};
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
