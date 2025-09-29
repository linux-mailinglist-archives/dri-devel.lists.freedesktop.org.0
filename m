Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4829BAA642
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 20:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B64510E47E;
	Mon, 29 Sep 2025 18:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="l2+Gh7N6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010056.outbound.protection.outlook.com [52.101.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FA810E475
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 18:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdYwsybls3XsYBkXpTntJqzQIMWxr2ut6MrWK++4cWXumKTPVi25bEUFzOC4ODqXp/1emKT4zAa9LK4mRBqhOhbNytFOSSjXb3ok/03B2gOmZRpsit51sJJWscY3qBdjvJ8+0fc5UKqcqfgokoivg7Km9ydjsAPDvI+SGVBljxWzzQZD/MrZOk4rQxPFH3im1cQ8aKwJ+pjHyN3BB5ejrVz/JmyZus5ZqeKb3t/kgRLRdAC3diwhc80UaQQe3UoqVcNU9ZXQy/dHgtzoYJVia+GnK8c3bqFqhfYd/G6awvW2nEZAkC7lpUYm6xdZuhg0GdcIFRPOPGBoA5EPolJFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8D62V0nwPwHYnLntEFZVtSScrULlpJgB7wx38tnFRI=;
 b=SAtuJvN8S9aO2cXPX1d+DOSf8VxM/970iUC8FgdEU6UEQZwW2Oh5SJ+V2ky4EX4Znc+C/AvYLR/n1tkT5l7sCAVjVAHSkSfU9PYEQgg1Bh03O3E32P8MEBFLXfq5ZdbJyW2lx5FsaMlwqrDiUYLY9pgqNcffFP9NPk1iA/uOPe6ibgbaHZXkK4zGdGh4526JWmAzVhj4flWqCqJzvHF3kzPsMACTkemkccNDeSzp3H4E1uv4NHTk25hl9TXhsbly8hd8G+1H+q3atflz9L1UGh9BuaGFiZ4tm97q6Ru4vpiLWgBD3CgFyd52kxWlzp8UdR0ntPdwfaH9RoOr0e/KGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8D62V0nwPwHYnLntEFZVtSScrULlpJgB7wx38tnFRI=;
 b=l2+Gh7N6amt1qxYariiIU5CCPwylVio7LWz5ruIz6iEVHcUSMxQj1P3fp9PpzUMgNzXzQDxJ44sU8oxe0InzPOscBk4qtgNumlm7V1T5h3H7a9VKW4bKxExlqkJ2qVGrY2cVEzW5iu1N2rN0f+V763r2k+GGT4yDlITkJD7hPo7tB2QYcPE1S1VNqchx74z2+PdYlL3bFQg65DPEz/VY1hs52eWh1w1E6NvWOYJM6+/g27MhkunXRDJaUqfXE3F9z7MWWuuUKglEV23cCseljpt3xl/NHChYEkh3MJImw9cEVn8Y/brY8iQ/bNFMP/icbwpVbIosaVUMolYq/+b9rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 18:54:01 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 18:54:01 +0000
Date: Mon, 29 Sep 2025 14:53:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: npu: Add Arm Ethos-U65/U85
Message-ID: <aNrVwn1ibQmB/rKJ@lizhi-Precision-Tower-5810>
References: <20250926-ethos-v3-0-6bd24373e4f5@kernel.org>
 <20250926-ethos-v3-1-6bd24373e4f5@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-ethos-v3-1-6bd24373e4f5@kernel.org>
X-ClientProxiedBy: AS4P191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::11) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PA4PR04MB9367:EE_
X-MS-Office365-Filtering-Correlation-Id: fe37429b-2103-4273-1dd9-08ddff898dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3dhQGsCf9YRE9GAZ0Dytgz6enqlsNR57zSDATv60uyRCgSRNPkfKXOR280x0?=
 =?us-ascii?Q?UqDlQdXrjQvQdkhQGfmMClFute9AkK81TI/7cTNN+GYVqOHa8i+girc/PsTX?=
 =?us-ascii?Q?WA9r1vfwoXPqtLdiVdivJhhGShg2GFwbUP1QxgesKZ8i2GfIN2t/cgZva7a5?=
 =?us-ascii?Q?2BQlaIBwv2u4aUnDsBXow/cbHN1yRlql9bbql1vAyKMDd3FMXcaJFx8n5iA+?=
 =?us-ascii?Q?XvIEeBKIB0DHKGZd/powUIYW6efPqAsYyFJFZtfu1b3DCopO1Q/hXZfUHy2T?=
 =?us-ascii?Q?w+JkNDWC9+upcdEoZN0RSkH5sgiRSdPkSOdckW5Mo4oVCumWFI04OPAe2iym?=
 =?us-ascii?Q?aKRDirGBqafOPkIgCV82cUTWg8Jl96bHwMj7s7aa98AxC9HrGcY0vEHgi33P?=
 =?us-ascii?Q?eBAEfRxhUBO3Qn0MWS3Gle3SCggDeQonTd1Tc3EEUbJOB2wNxKnLlmSd8Hz6?=
 =?us-ascii?Q?2ntFKYhowW/ja4AtmA56A9SMWCsHWK4lLlAtiuURtHe11TkCMW5oNlhyQvba?=
 =?us-ascii?Q?ZuoJNivrE645wqjrl5TdcvgY0hX3SauJCg6QKMhcmk/XFXPAsagmT/2nnyOn?=
 =?us-ascii?Q?uuyqVKrUYhrCq48UQICz3+LVmO+cC/E6AYrv9cWSzxRCLaM0uCZii7UEbxsq?=
 =?us-ascii?Q?cYZMQyxxCVFLaYhW0QEdSWBGqaMDiPN5vf4N6asqlYMUMZA1aVrvswxVjErw?=
 =?us-ascii?Q?CZo9JPxJDnXhks0zeHx/1ovOCFqSMWhPO5vQnqY9vY1qNl0CKvqiRxzbiCsg?=
 =?us-ascii?Q?NNRMU9+Op6VS4/1x8Z3yaWCfZEmkOUEn9dbZO30Yxo7FDxsbqNkkvdMGCSw1?=
 =?us-ascii?Q?i6rP4gmFianTlJ2lpHy7bT2XwChhfU4BKiLr9yJ1/t/pWJVsH+GpEMcECxNY?=
 =?us-ascii?Q?GJvoU7PypNZsNa/hfV2Mah8Q9MbanOHp0Y4g5nHQ/9IHLqG4WHdrV9IOuMil?=
 =?us-ascii?Q?UBbH8lKoIjN0223fOeDOYZZNUe92ZcTaAX+LkRn9uYYT5cNywVMUTn+DxyaQ?=
 =?us-ascii?Q?rFjtxxyJwoYt2PrDC7daq2F0e2jm+wEMWgoNwsQhGfILvoBNIxMoDfYIfPdV?=
 =?us-ascii?Q?lQ4NGO4u6DPQAEbSDKBEa6XqyN5h4X4+XcWl3sxYSmU8XaCtZM4Iiz56kKbb?=
 =?us-ascii?Q?EL2Zzs29EPyOz243Y4rV1FLtVwTbQ+OVuQnKx/RzK/VOq2goLJAQ6IM84BNS?=
 =?us-ascii?Q?5bidvzOK4KXTN5zEZn2ya2l8EKqza+BJqfEqdJqHY8+cuapoWUujDDYmMLMR?=
 =?us-ascii?Q?NfLsjQ6ZmyQ3bRVSLRUQbalo6MoQzUQHe7vuV+rDJeVTDxa1qI6FoN0/lb/U?=
 =?us-ascii?Q?TptblOxC98qdj7m4po2aKCCWPw1yWXG4lhtPehxB2WwutORPcJVwbM17UhlZ?=
 =?us-ascii?Q?SwfeYxyREiijWLoeIXOSn+9vK4h1p3RGrSIEj1Dtgj5RSgTDCvno+8xTAf5l?=
 =?us-ascii?Q?2u+zsfpzbwfFlRtLzaRv0Fw+vmPhI/iIiA7x4ARIligtYxhPewDJRQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vmzHSX+oSz7JZAOymGTfy/bfFF632Vz14jLVQ/UmesHZ1UK9wR0bdT0yYaaG?=
 =?us-ascii?Q?c9VW4JrQdBYOdP0+3JJWtlyvO2VpwB7rdGMe1oUKzzDc5d2iiKEo41Z8G2GI?=
 =?us-ascii?Q?Zi1LRzJBFzlFjUKWfpwU5UFZFbUpDl/CYbm7izvQxzYmTYOx27F46MYNwVH9?=
 =?us-ascii?Q?PMkirMfFjhALtPS+QiN+wn2bvkylEy8L6LZklme0JZZHjgjFdROAOxYZBD+b?=
 =?us-ascii?Q?Xvoq6NesyEAq+vTHqNjAKoyJYCYykMjKmXbmacbTNdBV4C4K87CUlkcohJgr?=
 =?us-ascii?Q?+d/Il5q8TctVnbF9bN4qEp4pQ93CCbZFGYeD4T1tVN/iIn3dLE2fxlRRnQ8w?=
 =?us-ascii?Q?4Y8hp7uKDb1TfZYXvWa6nWbT2P1OAbRu1umcSIS4uTEkag8p37jA3Z8rRE9e?=
 =?us-ascii?Q?2vNSGHtcW+cEgBL8fAIhqlMsBMqX2YQr3YYTX5jR4zfXmO5E0fXBhnf4iX34?=
 =?us-ascii?Q?tuFTw2iLy7WH8FsTiwFsaYAAsZdGvtzDONZfeRPmMUfqp4fWm0pNPMV8bAPK?=
 =?us-ascii?Q?joMG+/QzXCKvoRLMQ4Ny2ZrlWuPwXImcHL4t/Lm89f4ijq3vItiNAIGfXf5j?=
 =?us-ascii?Q?wsNJd/+PVeQuT+Q6HfJnCbZUoeckptwtfLL+sJaZXfemjewVgmq5curXmb2M?=
 =?us-ascii?Q?6cm5AY2NNyn9JA/J5icOQcwls6cPZcTXTjW0Qr07q6Efy/ytbeG6k/QooX+N?=
 =?us-ascii?Q?b2uo/I9y7921qmWfWAVXWXXBC4PgXT6hlnDN2AcbeHzRVn0r9qYZAIvIL2rG?=
 =?us-ascii?Q?ztINAjD71lcOmE2EHpH2Cbl8ZCGZMWCT7yqQNVvPMAOPvX9OMVLtas/asmjZ?=
 =?us-ascii?Q?6jVKXcEgBMO/bdNMMQgyNu/s4mdKspMhFnl2lviMYBDvKWNc5J0MRThOJriU?=
 =?us-ascii?Q?WKlVsKwVtumdV9dGLRqemUA7nxtpylE74cJXZNOaWHPMUOl3aEsPgb/EaKVP?=
 =?us-ascii?Q?K2VPj3vp+5LCPcMEkDDMWQABNdGmPMS/mspWFh2iR9ynOidQwhhiborcP9/a?=
 =?us-ascii?Q?WlBwkIBL7aLUSWmXp5C8DwJhX6qGOvdRc4Hge9M3RdHWb0sf0si+kIF4Qg4m?=
 =?us-ascii?Q?NWSwtIbYUzOI8HpD2ARyqZduCRv1OnQcKMCceQ+L4SeGyCsyhx62q22VBXsk?=
 =?us-ascii?Q?z+olcoeXZ5nFDpsMt4nC7O1QlhB4xLIIDHLaJvxbKyLMPqgp4O2lxJJ8P0qp?=
 =?us-ascii?Q?17QN1N+ftdTdpKHmnMRy1FmqYHbAEhgLusqtlMEiFOJLKJCSSE4dTkTBr1xE?=
 =?us-ascii?Q?Ne+jTJB0xjzfRBGIxnl+lNkfFZGxuOOMKAUkJnDPNz8oCobuSyCy6JMZsjm1?=
 =?us-ascii?Q?jNH3+pG0QhvkKgeGaZvxU3Fxb+tTj2yTSZvwbTw0z58Bsf8hkLoMGNdLL7Qd?=
 =?us-ascii?Q?kxAbZajAh9mkJBOqDfFAk/z8W16gw1VVsYRBrMwI5HbAId9bsGHVhm4Pq/NW?=
 =?us-ascii?Q?sFwoISl7tiETNpPPqWK8PxA/TrmWXxehEFsGCrejRVy+QWZr+Wg3GvAMK6vv?=
 =?us-ascii?Q?cFF+z92ihIgrGVPPBsCE8c0mTfqlSrwYVynh02MdVEHFfMSbn8l3Fp+GEoG2?=
 =?us-ascii?Q?IvF6t6zxmN2QlppC65I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe37429b-2103-4273-1dd9-08ddff898dc3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 18:54:01.4355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqgTqYSP6bKvzOngt5BSd3b7ILLOVEVILay9+W064kUI4tQwB86gOM2nkbSJ/UKSWELAxiyOHhM1YK7pkIWtFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9367
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

On Fri, Sep 26, 2025 at 03:00:48PM -0500, Rob Herring (Arm) wrote:
> Add a binding schema for Arm Ethos-U65/U85 NPU. The Arm Ethos-U NPUs are
> designed for edge AI inference applications.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/npu/arm,ethos.yaml         | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/npu/arm,ethos.yaml b/Documentation/devicetree/bindings/npu/arm,ethos.yaml
> new file mode 100644
> index 000000000000..716c4997f976
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/npu/arm,ethos.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/npu/arm,ethos.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Ethos U65/U85
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +description: >
> +  The Arm Ethos-U NPUs are designed for IoT inference applications. The NPUs
> +  can accelerate 8-bit and 16-bit integer quantized networks:
> +
> +    Transformer networks (U85 only)
> +    Convolutional Neural Networks (CNN)
> +    Recurrent Neural Networks (RNN)
> +
> +  Further documentation is available here:
> +
> +    U65 TRM: https://developer.arm.com/documentation/102023/
> +    U85 TRM: https://developer.arm.com/documentation/102685/
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx93-npu
> +          - const: arm,ethos-u65
> +      - items:
> +          - {}

what's means {} here ?, just not allow arm,ethos-u85 alone?

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +          - const: arm,ethos-u85
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  sram:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx93-clock.h>
> +
> +    npu@4a900000 {
> +        compatible = "fsl,imx93-npu", "arm,ethos-u65";
> +        reg = <0x4a900000 0x1000>;
> +        interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +        power-domains = <&mlmix>;
> +        clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
> +        clock-names = "core", "apb";
> +        sram = <&sram>;
> +    };
> +...
>
> --
> 2.51.0
>
