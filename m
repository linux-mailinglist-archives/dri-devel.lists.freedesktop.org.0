Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B47B7FE16
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271E810E84A;
	Wed, 17 Sep 2025 14:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VBb6CCcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE9B10E1C8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YO+t7hlhJzLZ5PLlnwlYPNaCK+1hV4urgsCDc7uq62ZM+sP3H6H30dlIbhLOvImIp4XsY5B80YQ1YlJLS8t0QihcpIkHRIzXse4yCCgSZ9urhEeiGNWDEv7XCwXL9cVHUbdTZ+KDN2SQB6mCGjR4DluPJiIQGSMLE2ye/cm0lWhgz6LJ0ZhE+xoCDHGarPiJUDuTV6XZyZitBkKt49vRcEpwqo0joJd8OvYlcKZIgIHKZUQmUeFdKZ8ab5Xk0iXqFKh+a2OcRR6flYrXgO4bR4ZDWnk0wl9lqIIsrMhivOqce8LoWEwzcyuBSkQpS/vftSBpYmnrneviFsdG+a8xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjbDvg5qSYD0mK+qSLoPazs/Ora+nsy3b5NYFTiQ1S0=;
 b=MJIoTcejyxwgqvsw/9YFoODxtC3Pc/6IWOYfY8D3D6ywZlWlZdhCv/5CD8HptvKjVZa9bXRZpcRc1A1ZUi4s6k0fDfTd6DkyHLFBHYglxJt6f2YuDe6QVSjOIfXFkrOsX8Dft101xZ+dBc+bazJ/T2jYG5zLUhgVVA9AF4rDJh1BKrVGVr0Z6sJzO7aym30NYkgRPv4tqVeZQJNQ+l4Jw+iOmqCV7i7ggmHKWtzvIVrMszrWzLw7j7jX+RshadW48O/vV9QdWvZTmJcUanKThXcB6rhOyOUTYGtz3T8GrHAsHGGPl+nWNr7+q0heqG/R0il8U2o0NVQKlmM5d71POg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjbDvg5qSYD0mK+qSLoPazs/Ora+nsy3b5NYFTiQ1S0=;
 b=VBb6CCcEsxVP2IVM5acSoYQZFnvjXLivlQPvzNvHJ+dhBrp8mb03dvVeYa8GemE92F1ie0enaMaV56AKnJdd2rztlEx1S+pCl7cHMiE0NjLVv3/ZOBGLb5rfWCLjYW7wE37rg64P/wBqHmH3awLGgCRfNmMfakhk00MitiKN9h1Oixkfme/qvaxIOQ0na4MK5RtKc2srK37G978UK85pghgHdePi/IiMxQdCMwG3ObnNKfuOsMb2b/GOOFBGp9htaDlW2+PdoZrR/JPqtG6wGNXyRjpxAhOkuzA8623hk486eP5Bewv9CwM8387XphflZNof7ajTyTcecpCqL40Guw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 by DBAPR04MB7461.eurprd04.prod.outlook.com (2603:10a6:10:1a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Wed, 17 Sep
 2025 14:18:25 +0000
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2]) by DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2%6]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 14:18:25 +0000
Date: Wed, 17 Sep 2025 22:18:18 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: marek.vasut@mailbox.org, airlied@gmail.com,
 boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, p.zabel@pengutronix.de, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
 simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <aMrDKkIoZvAlBD8d@oss.nxp.com>
References: <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To DB9PR04MB9627.eurprd04.prod.outlook.com
 (2603:10a6:10:30a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9627:EE_|DBAPR04MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: f20fcf13-73b0-4b3d-e74a-08ddf5f510b8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KVOweLwDUzZx1POno/PFf3zhPTpnSsfv6UJvxbaUHnYjqh6gujwj13rNN0G5?=
 =?us-ascii?Q?Mg1nZvqfSQYieM1JoM6Nz+HqlTHiPPYXD9lZWjgR2hI7O29VWD5gVWi/7qGI?=
 =?us-ascii?Q?5CPL2wkpsyl4PZWuEoStodn+DPy7PGD4SnI+WcwPhP7cGkY2VLgpn0O8GTve?=
 =?us-ascii?Q?U1R1ZC4L+omQlGbixc+uWvhzVtbSa2dDOm9ipabO/dtJ3sNTQ0f4ENe+a2vr?=
 =?us-ascii?Q?w8n89X+Agp18Udj8umtkjMJcRgei9c/pd6+tE2ZabCVymAymhEDiDbM3b1yI?=
 =?us-ascii?Q?qmCEfuNaLvPRhAHmwK0KZl6ABLAegb1cvgeFcVpwsm/XixDTRIa2AYs/9XI9?=
 =?us-ascii?Q?PG9ZDl5yCtXgQHZVDdnOUHjjIHK/5QTDGkBFjdzw+wJ0MU5vE71SAnt6Qr2A?=
 =?us-ascii?Q?YBd9of8ESIgBdJ1/lBiKcXq4iquHz93Y4lhAWycYnsEhp973WbHjlFl8/MxF?=
 =?us-ascii?Q?r7BUpzbokICmAY34PVVaophnPl74XW14twT1JtDzATXUS76+a/2k0QMMsk5L?=
 =?us-ascii?Q?9Lu60HidTEW9I/UHqeKaYSr0YON1yYBlEbU5/lyFCzY7lCqIYcOZGAZmg7IC?=
 =?us-ascii?Q?t6I4VYdEqoQUpK8Yma8rnFjzm9NB6qA2e7dKPXGhB1z0XlKP1I3HRaIu0TQZ?=
 =?us-ascii?Q?DR7K8kacrF82vehcbQM+hnRw09cNMLcFyan51vq3h2cQLB6i5iBMQCo8AKvz?=
 =?us-ascii?Q?uAes15u3RzG9rWcvNEKFfN8l89e9tA2WSOja/CUPmPv5n6xd4BC4kPFY+HOt?=
 =?us-ascii?Q?h5+q9AbLsYue1Sk/k45Ro6eBy4B4MS7NidAHHBGmsgh/dEoOJU5LbtewKrZ5?=
 =?us-ascii?Q?qPuxth8GcqkStikwNrlLOl6fMArug/VnMplrGNw0Cd3UYU21YdmAbsqvdAXi?=
 =?us-ascii?Q?uCDkfaVhij4WatY5P4MDbK2nPTta0Gqm2wJzUzT68vNQcs2wzbxI1XIyowOQ?=
 =?us-ascii?Q?rEWXkkpG9Wy6FrvpSb0pWJuFwcf1XcvrgbOOf+S40MkE6pfF/s3X2ijL5Hkw?=
 =?us-ascii?Q?jMaparntAnGAYGSu9+zrFb05F7sbaKzK5VpSsVrqxqMLmuFzE1Fa+qRoZ+ia?=
 =?us-ascii?Q?G8ipj9jGb8SEbKkQSY/vbWvEOzSfSSUwUQS4Lqa3FCAJK6Pj9bEaGVI+undI?=
 =?us-ascii?Q?0VGFvQkmM99pjiPuBnWTTylwYlAnSZF9KUlm1nJioa/PAMZ0QtOinYTbg2xO?=
 =?us-ascii?Q?3cmSQTce+p6h0UJuVu1qc+GxYRuxOSoQqH6NogCD/yzbm2gFUT4IzIDMM8RH?=
 =?us-ascii?Q?DIPO9YwB4eu3xm3sfh2AAPMmX8ZqwH+X3oImIrntZbH7DrBxVaI0l/xPOqHH?=
 =?us-ascii?Q?5uULpOTBgZEtq8WP+HGy/+Hc6sq4LSxWaV5x+rPDu9TJj4q2rsTKiJjG2+US?=
 =?us-ascii?Q?sn+jq4ukggxHGFwo1eASeopKzGO3BMIK2kOP6uK0WWp23yc+qmdeFI2731zI?=
 =?us-ascii?Q?n6RfEh9AvomGsu2YYtjyTpiZ+bILl0cS0O67aAyZBsC2CoKG/fl2tQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9627.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JndQBn6CxeotgwVYT2hwRImdGgNm6FmiQhiyd7oHCRE3Oe4J9F1Wq5TFDv5G?=
 =?us-ascii?Q?7GYTxEzSj6tEYBGCTHtdA4DRaDhBDG3FB/bDq+6iARJA4f/bnz5mczFiwF08?=
 =?us-ascii?Q?lXuvtWuWcuwnoy8XkTr62s5CGSCXmXzEGgfM0kLh38LcGhXhPOywKRYmiKB4?=
 =?us-ascii?Q?/Nz84OzQw4kpYWD4/PAojqUFDnISg0v8cA0YpTWsXm6oB/m5L6iKrX6qoXXV?=
 =?us-ascii?Q?SHUN+llhyWVpXf/tIuuY9Ls6Er5e5X5UczBbpl2TntXT5YXVYo4C8a9DkfkO?=
 =?us-ascii?Q?/jX+w+/OhfWfBbODK32KJ6wPQxW4BQ4FLe2qZUKllJqM8iAQh7j13feLYCTw?=
 =?us-ascii?Q?PanohcP/s0ayYBAKTItpZ3gzYy9e2ZsszTg/0SnF60BygPOjnudjoTC0sg/I?=
 =?us-ascii?Q?jEvyEWWOnaezN2RiExDDfRZTBwjF3cwOr7VyWD95Q0p3v/cJEoZXMv7MSK1k?=
 =?us-ascii?Q?2HgSvwXBe0+dOF63SZW2DVhx1hWoifKHnmxf1aTZy5KxOgDkwKo1n+kRlKWs?=
 =?us-ascii?Q?cVXI8UNWvHjnSo9He8PJnybXj8sSSI9PwmI/C5PsvQXmvrkGK4gw6/6ZrCva?=
 =?us-ascii?Q?Anaulxdu/mGlDTV5sMyvb/AR5Ll7uxLXCUBPAmUSwkoNinq00hiaM6t04VSW?=
 =?us-ascii?Q?0y3aiSN4rOjIRAeA9vgp/DP8wREamAhB/gX/0Kr0hLoGqT2CH0vGHx6nVigo?=
 =?us-ascii?Q?RvHq/+cDQCN/Tiv8ICglkPYn0O0tdz1pbV4MzM9jj5/8Q1TLJQSac2gUOI36?=
 =?us-ascii?Q?wSDZQi++3kSi3q9Y7fB0k6crlEPSnW/tr5ou0p/VH6LYchhqTJWVr4LvS100?=
 =?us-ascii?Q?VO+tY7zIYIFHtU6xzAN9r9i7QBWOCWm6LmP+HFlXyrLUFQ5ys45jLdH3wxO1?=
 =?us-ascii?Q?Nj5GMtt5oxooP6mEnyNYOi+ITLI9bCkFXd/FTtoxpA1R8fnuLYaL2IeBf5hd?=
 =?us-ascii?Q?dB6iwGsZUHHlZELGmIhAEGxOOOKP2ifXqy8TPbBwJxcm4ZnxBmlPNOGzR/bP?=
 =?us-ascii?Q?BKm9hrlHWCB4RYtPfF3aRtp+isVcf25Cm3VrdJueB63Rs5+uAC9D2k0TF2nt?=
 =?us-ascii?Q?t2xb2S5bBlqMQ66h7a2IkFEHMJy0j1Ra29RxwElchGhqblwqrgYpcyeTPsPW?=
 =?us-ascii?Q?h1UV+iMQ+S2jWXZiUifaHc81XnTydfPrRtQ3WbV/bhpk4dWzVQCBam+ogvVD?=
 =?us-ascii?Q?it/F9lVkqtx3FBj9ibaWtPgrXrF1qk1q+uFppYe/PMVVZ2jTwqUxDuOAZ7Mi?=
 =?us-ascii?Q?+amb6eDoSQNMGB3l5n3U2GCTD/vItGJwkKt39BgqjknlF6AJsRLgb1Dg4E4K?=
 =?us-ascii?Q?M8dT4Ay9J2APnfR+qd/3y6sRjJXuqGbdoQve07kXD6onfi+yqNQr92g+aGnZ?=
 =?us-ascii?Q?6bQXdecCrW0iBXmhJNWXNO8REHa/BZv1D4qrEQfK3lPdl2x6smr1lz4UNf8A?=
 =?us-ascii?Q?KJkqeN5/4NIJnzGXT4ieID2Ts8uFjBdn4YN+XgrPl9mPOFKu2OrJPT+AaJPm?=
 =?us-ascii?Q?Mw5SCrb8TjNU5KvzIv7U1csPjsUu2A2kU3M4pe8SAFhUDKAfH0aLrXVw6MF2?=
 =?us-ascii?Q?yiKAUzVYEs58T0TxoVvyQDiouuPZbQvdjM0ZtIiH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20fcf13-73b0-4b3d-e74a-08ddf5f510b8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9627.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:18:25.5193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbO2z0PphmoBaz95Yo6DM10YKhD74/i9OOwfXd+PeAviYs5JOUY5Gmfga7GPAl4R2PibXJyOYHZmAHqTBBYmgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7461
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

On Wed, Sep 17, 2025 at 04:17:27AM +0200, Marek Vasut wrote:
>On 9/17/25 3:49 AM, Rain Yang wrote:
>
>Hello Jiyu,
>
>> Hi Marek,
>> sorry for the inconvienence. this uboot version don't include SM-184's change.
>> I heard you're using i.MX95 A1 Chip, so you can extract the uboot in below link[1],
>> or build from source, or raise one ticket in this website[2].
>
>I use mainline U-Boot 2025.07 with about 10 extra patches, but nothing
>significant. I don't think this is U-Boot issue, is it ?
>
>I can rebuild SM, which commit in SM (from imx-sm repository) do I need to
>use ?
>
>-- 
>Best regards,
>Marek Vasut
Hi Marek,
I think the problem may be about the multi power domain, the second power domain named perf
is for frequency change only, you can try to power on gpumix power domain only.

as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
so please drop the reset change.
can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
as the internal driver use mali label to control the thermal up/low limitation.

BTW, does the dynamic frequency work well on your side so far with perf domain?
