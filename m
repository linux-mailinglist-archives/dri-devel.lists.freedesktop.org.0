Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B4A2FB70
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 22:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4C110E3C8;
	Mon, 10 Feb 2025 21:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EQFQ9zx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067D410E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 21:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHOTL2zIK+qWqqeHJ1vPuXp60tI2gwBjV2KrsEG+mkLpvbmKnS+XyPWDqST/cwtkJG4LIpl0Xhnqjc7w9l08jTm2ebUMyjUCkHzDlEyuDWxvxUGgBGEKPfdXyfrRAZ/QM12aM6V+wltKiNgdA+LEzAJCWrR72dd2jXTWmOonnBbo+nz9X4GBMRc5keZijtaadYZyByJI+ZxM3/0ibvlUaBaiyrxgblOyaUgKmi85mdl00s1e+QiFYpRbT8xWhW69elTevwQEfijiAMaCkLSa0semSLSed+I3ROPCGqaA1cQSqxn+a35qGPhd3DKyogOFPgpg+Soy0cpN3OV4eyIi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ooo2r762qKBKyx/Mn2gSWBJz/knM+T/PBGIfTBZ92E=;
 b=RZEWZFwLi7S9uZEy6BJlQYdostHYQ7CYUgirts3u/nD35CbyYbA6IOUUIhs1U8pYZBtGmXiYoe1zAPhmDIy6nRXRcL/K3+b+TCn9DGElM+B1w9dWQAwXmybhw+ftTBOu6JjSJ2M32vAZlzhsYEvDor98DOB3iPJur8Jj0a6OKDfS1VKupE7qcxL+noJ6OBnAou8dRZf3nZch447lp64H36PRf8SpKCQapgAJRZ2O23krwWGpVazDdatKdFWfB8ryxaaX1pNtN/miGbwsUWGcqPAZNtx0T9F/kE65h2jpm09oUanEdsY3YJ/huvvoiQllXfbbTB1Ahmc1elSVeKofaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ooo2r762qKBKyx/Mn2gSWBJz/knM+T/PBGIfTBZ92E=;
 b=EQFQ9zx3cbZihny09L0Xz9ebdlpmRUVP+W/EMVrfEBCgomMoww6SW7gHijwrfCZBvisqeu8Aw1yyxRiHHTz2HXz81T1rEFiOLgX2EPxiybOwwyCBi4MNNxXDudvoD+l6Z9900YGixgIvRU4XH1cQj7SWtSVl8N4zrOnHRPxfvM626VJpZlx3RWYbJOW5YvxqnSwsPHZPVRZmKdpUWZEaAJQbfcsH7J6sqAoqfs3riNAaf6jJ0LrXLgZTlxwoRH6MTJoLrAr9ZoZJRG6avTJUP5Q4Rdy74R6FRfP7bqjlGCQkjM4ZMGGMWgFxMFc1GSFhAOxnh2VNsB+QIy+9isfEQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11223.eurprd04.prod.outlook.com (2603:10a6:d10:170::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 10 Feb
 2025 21:09:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:09:41 +0000
Date: Mon, 10 Feb 2025 16:09:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guido =?iso-8859-1?Q?G=FAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Message-ID: <Z6prCyX+edpaSwUH@lizhi-Precision-Tower-5810>
References: <20250110161733.2515332-1-Frank.Li@nxp.com>
 <c5y6mocsd77wj5lah6n47vtteqc5ekcrbdod6z5vtcnxhleudw@kfhpyoiylqqp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5y6mocsd77wj5lah6n47vtteqc5ekcrbdod6z5vtcnxhleudw@kfhpyoiylqqp>
X-ClientProxiedBy: SJ0PR05CA0175.namprd05.prod.outlook.com
 (2603:10b6:a03:339::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11223:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3c1477-360c-4d3b-719c-08dd4a173c47
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rvl5vw0UKXGDRlSTwwdfAz98RnI7CaQ9xczUO603LD4/pNdj/RvOLuDhjUEn?=
 =?us-ascii?Q?XPh3JIG8bo0ngfce21IEFvWCYpyvaT85SZ9fsllksYvwRXgxguGCnrkaIWdI?=
 =?us-ascii?Q?yFtVTPbzkkFrEXZe622mqtQqgw08HLACvajxrgdLiFGYZqPmXV9ywJoWIiWk?=
 =?us-ascii?Q?UghHcbbgcJfNU4GIbvYYKwSEo7xIikqpksM5RWqHvwT1CwgoLhiU3ixL7QLC?=
 =?us-ascii?Q?jgNRtR7WdizXrhxsmIUgHzlQJ7ynp+HdB1aHlgggksQxibK4kRf1y7KvgogM?=
 =?us-ascii?Q?oKl3/VIWqVaN7E5c4sA/Ye7Dwnuk/yAEBgKuG1b8T00xp7kraHN8upwQvPdb?=
 =?us-ascii?Q?kHbM/siqahJwQDj9zbzrO7gkfAdCHLLmr9QisBIxA/SM059iMAq81hzd0c7H?=
 =?us-ascii?Q?hL6vDJ1d4x7WGbL43K9VovBEmR50YDUc725gT9+FxI5RV1zQk0NFm6HfkCzg?=
 =?us-ascii?Q?ygx0IbFeQu1Ju/ygQowtok4k6aBPHOp3i/M53dO4J2WiH1KQaiNIkeuWs1X3?=
 =?us-ascii?Q?kPdQCmPHLrDZyiGYiOdiz41Gr3eXFU3SR7lMU7+MY9i8Ln8R+6I/oOJXNj38?=
 =?us-ascii?Q?NXEKu9P1xFtnZvbP9gls3/f1jn24lIR76WbDw9xqNIpg12sLlfmEkajd7DY+?=
 =?us-ascii?Q?FEkLe3mf6SG7OQquU560o+u3lRIfkcTyeiLwBy4LmtbiMg6iUVtG+IlOKo5O?=
 =?us-ascii?Q?gOrYOG4wr/Yf/aWyvDHNgw4t7WE+zSnA2IKG4KA40SNT6Qryv1T/wV8Qs54n?=
 =?us-ascii?Q?/B7kfJ4fEJx0npxLt6DvPOFYDnUCPWzZgqeyxILTrB09rPkwgPOU51hX0L2w?=
 =?us-ascii?Q?5jzKyCUi1W3c16MtfmJKfJ9AGZxlX1tF5cgrB1pMWkaQW0zy0lkdJhxkmQiw?=
 =?us-ascii?Q?a2Y/dpBJhUB1iFJzgofNhxjFdw+gO14TV1EwJl8BZ76tMXIbINzKG7pFuSn5?=
 =?us-ascii?Q?bh2FsBC+xJWm0Orw1P3z8otr6GkzNxWwZdhmTVkz1OQGo8HIDkOPftpzAMTa?=
 =?us-ascii?Q?wx8adY7eejQeeN5DCWPtXvaheRTVe69aQiKYFq6b8AoiOabSq5mAXEdZHFMQ?=
 =?us-ascii?Q?phJIhVwQK0A8CWuUtQwcC2S1NZ/GmNNvsW8RzKrKYKMofiLkUuTf5BKYfF/O?=
 =?us-ascii?Q?Zz/FkQdnw/n5IAuGFlkqx+oDq6JkB2HWaQfvYEKhuYkvbuI6/jUwLcAdTNw0?=
 =?us-ascii?Q?fJfBlIcOecOtUNk5yL3YMG3Z1x51WcPErsfb15UXYcMM5+ZPYob4ANAUVyVz?=
 =?us-ascii?Q?XtzgaOZdfOBeGqU8VcLwFnTxaiFVuJ5S42dTzbe1f/OFm6fxqsvV1xSZBR2w?=
 =?us-ascii?Q?qFLcvS82Cf8ayrTpu2LOdhUBteElgoBCNZaYiFiBzLQrT98Z9dphTB1/uCxf?=
 =?us-ascii?Q?N8m1bXzp9XEOgOC5d+8Lfd/54ASNyBh8NJ5iIHXmU9vCLfhfu2Zr/AXsiKEd?=
 =?us-ascii?Q?jfd4qnh9yhGs1EsaKNGJFpFy9mYfBRgw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XQ0HAQYYIwLmbtYjCfaTSJoK43Y4ZyQpOJohipDc+m/gNZhMLIKmI4KS3afm?=
 =?us-ascii?Q?UPRKXfrWDTxHspNpdzbeNqgDSZREFDXMXHdpexUPcDMHOMkGef9LbIRne/Ic?=
 =?us-ascii?Q?FLHdSqk8YRg4BNFleL/iAHSh832p+97Tp1R56ONkpfX3lY2TkKNXxL6eDnUs?=
 =?us-ascii?Q?5KxsC2Z/ZSbs+kirI1Gw9vY+3g0xOgmllI6iT4YnS685cYiHIV8Ap8erKbJU?=
 =?us-ascii?Q?QHgO4YwBX2MVHj3DdMy5rW6t9vljf/V+GJ14jigGDb/MwqlxCR/2i5mz6Hcp?=
 =?us-ascii?Q?rH1/df+T6zWwbGYeewsPcV8N4Lihg7EB76vwZl5ua9BKJKJp5ukDZoKXigqD?=
 =?us-ascii?Q?d1leC0JTPOUhkYPGLdhe8uz8lrFDUQkhUU63uk6g/X0647D4L8HCHgACMSSi?=
 =?us-ascii?Q?5ArHDqw0EI3f7mWdIbkJhUGd4iouVs/Ojx5f7zW3XD4GBt8jz9wGmwYZ1OUr?=
 =?us-ascii?Q?utWVkhojg3SG/nOGFVV8COSkXOvi0XJyCGr5O8BFsJomn/QIBRZYRJDAQY5B?=
 =?us-ascii?Q?Zt1Ti4jOcpQgDeM0+j7HDZWa6HnAb+e1ClsiKJrRRmdNYMbmq4e/czUVVXBn?=
 =?us-ascii?Q?Hc8QwcbSvZNrZd5tu5SV+N+vmE0cc8+ngxS2S2ET0P2A7lqXutE2J6HIA+ZU?=
 =?us-ascii?Q?XNGvirK4yPnCfZdTz5zyPEQzJguNc/LiiYvVWFSAU9EtrS4N71MTivLZj3tu?=
 =?us-ascii?Q?g7pzHgCQfKl+8+Nb7TDgBWeF9tmAR6DUOPbGcQRJXEesEdajl2Es5U6Lr3pC?=
 =?us-ascii?Q?OaXWfHIUsyz0vekmKvUEWhU/uJkO+9JZKvCDTHNIDTlZcw+dp6SafpKiJ+Rw?=
 =?us-ascii?Q?ftMRWnGbQn/1jGvSqyA1IOGnIWobpsU3nnJbTBK/Rn7xHWpkcNc4bXAlXfBS?=
 =?us-ascii?Q?smD0/iOJ8ZpaAmthJQjQpADPn+MAIqrcZc6uczEdKh4YSV6T6zIxmFuKNbmC?=
 =?us-ascii?Q?WatclWLKgT9baHAubDd4GtZ1bn5J9uyNLxct5HB+9xChwj61/6fTipWHet/x?=
 =?us-ascii?Q?B/Igbv04HFUqFPu8ZKIjbCxDAkjWmoS0KJ4lpT67iMQUUdF+cXQ5DKlUiWM1?=
 =?us-ascii?Q?1aLCQ8f9z4bNDXPMfX7znc/838KMFZapE1UWkhE7rqqrX2LFDaNGginVAjbM?=
 =?us-ascii?Q?eslENbKDaBJYqis3zRUzHFg0BU0waomHnipvUzf1Ihs3mMe01eRj6Xw01mPb?=
 =?us-ascii?Q?gJUjQ/zEO654jq1tF2MfQOj4vrfyXXW8xUf5Yj0ohbXyfUDs18BVu5f0WBFX?=
 =?us-ascii?Q?ezz249A1zDOOVhV7FSueXYPAeTLLAGWN8vZR+4bhGw5T+6WRRS6X+X1w3ixN?=
 =?us-ascii?Q?eWTq9R9vSw/2IAXQPU5PkELmuqQGVhSUYjd0Fqj6G4tGGAkNRlltff8yNG34?=
 =?us-ascii?Q?X/bsIhDS3zQ6JRVJQxz2kOkzJFCnAo0LIZBP87F3nvU+It0xNxYpAlPl9sbz?=
 =?us-ascii?Q?NVkyk+5Z5UJAnr6BOmfMUlduqRzH6erz24siQKUU+L5/2LiluvIyLL0hJlAH?=
 =?us-ascii?Q?A4ZQhpM3Nj8mm2V4Eu57WZ6LCCxsJTucPhNaVcXOAl3akFDUvysf6Saf2bd/?=
 =?us-ascii?Q?d1+PKaJ8dxTjIYfVM+A=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3c1477-360c-4d3b-719c-08dd4a173c47
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:09:41.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk1nCh6zRtExf2tatTMMi4WpxKfXoC/ccZI9Sm9pg2jWs3yTHwQnkZouWY9tg3+PkkadQbthHomkFSIcE+IITA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11223
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

On Tue, Jan 14, 2025 at 09:34:49AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 10, 2025 at 11:17:32AM -0500, Frank Li wrote:
> > This controller support scalable data lanes from 1 to 4. Add the
> > 'data-lanes' property to configure the number of MIPI display panel lanes
> > selected for boards.
> >
> > Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> > property referencing video-interfaces.yaml. Allow 'data-lanes' values
> > 1, 2, 3, and 4 for port@1.
> >
> > Fix below CHECK_DTB warnings:
> > arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
> >  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change from v1 to v2
> > - Add the reason why need 'data-lanes' property in commit message.
> > ---
> >  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

All:
	Anyone take care this patch? Krysztof already acked.

Frank

>
> Best regards,
> Krzysztof
>
