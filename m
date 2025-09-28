Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A005BA6AE0
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 10:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4481A10E0D2;
	Sun, 28 Sep 2025 08:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k7v9WKuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9E10E0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNRwzuGoUfZJxVvnobDmPfg/epb578QS92ZHw41Hct4rVnzAprI630VHrwcKrTJThmswzJeirfG6UdIxvQ3kjNkWQ8BWbJ6cmGoZIhi8OGr2xJMzjG4u3BMWTrsM17T5ABhwc406Qhrswgi/f4X0lUt+Xq4dhonc8uwiI2jwzAZhA52dW60t5mKYt0HxFQcxm/5uVm9eP8NABJttLrM0mFOch5fntgRoJTmEQRTNpZJZXtGxlTvDaKWirJVe0ceyGVwmMAb6S+hv8xWZ5K7EbMo+SRG94CIXmxIPPLqui5pdM2fZ5YDhjDp1wxTfYkWxC7n8oOmOZkMJ8ZTaLtw7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+iEs9uAQ4MQ7QoPF9zt758oMx4WhnEzt2hnKkTtL4Y=;
 b=WslTIuM7J+1iusDdOOEcLjQSn6EKLsdsQOpF2ueTn3ahCXgggk3ox3KABd8Yg19wVRQQ1wEvwSPKLMk+ILb2fOYE47r1MAu+bUlag70ZTx6+fw9RjWVKmSBX7ZV3wRzbJFz+G97K/hqphVOKKP6GB9t0mD6WCOgPBBguDLqUcG8xng1TWOYWy+MUhXdySowLRTNUPWYNd3KIhu7bN2VP/Rufe7N7lRHRFqunMtPZotnhwonaXS+8pbKdOv65ZFRkN8LEf3LWQa843YM48m1LmtJKr1l+5GdzifZxkj2b5rae39qjnyeT51C4UvNIdOW+ie/p1V7/lQgQLjf4bqFg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+iEs9uAQ4MQ7QoPF9zt758oMx4WhnEzt2hnKkTtL4Y=;
 b=k7v9WKucC9MK0EHE9GN4Hn3LPOITRrzLK+UXQRSwGodd37CSZfOqsHuWWBhFfMyUF9Jl87t901eO1EhYFZZw1Kp58pakGevyBn0ZguLaj/1z2XXvBiUa/chMuOqJAKgTKDIzZp57rmzuxqgO3oa16vNuSIOLzZZQzDMd4ChLikatCqyzOK9hzkHU+9tPVmtIJCC6OwPj0LOU0x4jks5xRdNfzOVixdesKJUdArAU2HLg15m1LrkUQiVQVSkddWNkvrBdEXJo1t6hXHJGgpdRgGv+tnCML17sU8Ipa74OInJVBvGXlYiSn4zpFREHkAdeXOGu29xztKOIRUWiAoNjHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sun, 28 Sep
 2025 08:24:43 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9160.013; Sun, 28 Sep 2025
 08:24:43 +0000
Date: Sun, 28 Sep 2025 16:24:40 +0800
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
 simona@ffwll.ch, sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <aNjwyIgs9fzWiprq@oss.nxp.com>
References: <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
 <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
 <aNZaatnVRRkaPrnD@oss.nxp.com>
 <32fffaad-7738-4fa6-80cc-2f8eba7ca099@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32fffaad-7738-4fa6-80cc-2f8eba7ca099@mailbox.org>
X-ClientProxiedBy: MAXP287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::13) To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: b77c149a-2853-4adc-9512-08ddfe6879bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LvFVbgS6bF7sAZidNrhzFov724ZugXyff5GP4jHLFg5ngZf4uDvt8alIkAbE?=
 =?us-ascii?Q?oxBFXwFkSTAmZTZvanLvmDav1t9jJdH3VnBtFsvYsYVr9hkFNJRQLGuy89E5?=
 =?us-ascii?Q?TC7Zgl7RO+lxmrsjm3kwcScShu4jY9JXTZkL77b38FioUxgaWDugqi900VkF?=
 =?us-ascii?Q?2s0V5jgB+pRa0xIDrv64ONZSUicJFM+7MmLm0VfpnEnvSGDr2baV3dnOjpwJ?=
 =?us-ascii?Q?sLJ1RzXaMD3/vqnt2oOQz786JGWEdoJICpe9LDZAl5M/A6xu+GWNHkwVWE95?=
 =?us-ascii?Q?0jej5NRom6TaXRaCjBVoYUaA7beTvR/+E69jzxbwlYFUBgOpbLQqId5TWHIL?=
 =?us-ascii?Q?xfC95afc2YXjkm3+mBO0RWjWrzaXABqR2TuZTPxKqHY+OMmIIwLr7lr5cTxq?=
 =?us-ascii?Q?dDribAcTw6fL3JjaMeMlhHZM/kg3HL1eS1ArD2Ve8csH4ymkSrnDnAut+1Ds?=
 =?us-ascii?Q?M8yE9vL5g0Rg4p25yLUGXqGbEkUotfxJResfVCyBv5PVxgsoyFsJQRf/yfdY?=
 =?us-ascii?Q?Ww1YaGdxU3UbbB9PGlv0K6aRFB8FkJW2g6IFSKrzDQ8VE7xLJN5ELUdz75fB?=
 =?us-ascii?Q?/iBMAbsSHTKUQGwIHxg32ax8Jqyvh3pDWZHjujgQYOAuSlopmsHmqkzaCVuU?=
 =?us-ascii?Q?5Z1UqsWuf3rh9wR2B1WVV8C+QF6VOXOVj2Xvcp69T7GlMwAkPACm6zZ4P3Zd?=
 =?us-ascii?Q?T6FMGmISMrdWWcnrByeHfTtLwjUe/GrM5AcCVLeUIhnn5gxe4tlmP3jkxiO6?=
 =?us-ascii?Q?OZENYDxzaUmvU974qYHcxRZ6dmxhZJa15I1DmxxFfZfckHVaL5WkBHT8I358?=
 =?us-ascii?Q?qlabsEhPQG0hkbR6iDoyFR16bdXGsx+FisxvIOXQltoH6GOE+/NHX+YutkMT?=
 =?us-ascii?Q?vGBTiZKmhGJ3INNRE98G+jLkcqx8xF5di6nlLzQMW3qXCvfoNjFK6SOr6NfD?=
 =?us-ascii?Q?i/E8oPitOEDP/pG3UyjrzLsewu0BHfPyujwm6TGmRAH+9fPuqyQ4TY8YJNZT?=
 =?us-ascii?Q?croP5P5h1PurWZe8W4DoYiwLbI0SEZC4FZYquRZzWpXAnbJlOlR9aSQF8DyD?=
 =?us-ascii?Q?FIgO/T5zBp/+Reak0vH/7GAdPEKavcynAD+Ev+EYaQSCAGMgnomDefAtcMCP?=
 =?us-ascii?Q?/VpMKov40bDV3VRjb9Gy4azSWbZUQtdu/EKWgLmXJdEhaYYEnm/5A/SAZFqF?=
 =?us-ascii?Q?xKmzQoQAewWe3yWRdeAiEUYSjMHMA7eGud5XcmV3/dArDJ/j3lgmDYce4ibi?=
 =?us-ascii?Q?EKEfo1CqzU8l8/tgvqX/N9qKK6ihcVnBz2mwfMtKfANPSvJJDD3bU9k2tn8z?=
 =?us-ascii?Q?oGojNHXOWl179tFQHtbanalOx06ORZl7+zPdZBx5GU4mA2MPaFkylhNCoNgg?=
 =?us-ascii?Q?CYk6c3S71NZSbrCD46Ku2eVofq9SRIzMZ7Au0yCnIJT/L+F2JmlYU1xB4A3m?=
 =?us-ascii?Q?oNHvtYWrawlj51QmDzocrdQ1tp+Sk2sF0ADcVq4b6xfhmINQol6EZOXR6wbo?=
 =?us-ascii?Q?jjz2+gEEl3qma7K2/ALTY1dZo0T8NYsbHnQ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XKvGcRe4+Yr6WvNXT+/eNeMXw5x2hRRs48c/cBtq8sdYm0DvPF0ft5o5/Dkv?=
 =?us-ascii?Q?6ePvxdFfgkNUovCnbMWw3MDTtKKCRBWcRYa15npPKSEHwCg86UDIBB5Q+g2D?=
 =?us-ascii?Q?+yUXQiFAS+kRdi9qScqSk29sE3/4A1WFilFEOXCkMLhXkZwZ4bfQknx6djDb?=
 =?us-ascii?Q?eMojHpzeJLS6/8pfJTiVnVqkmAYSoECJqg+IDW3CoVKz+ZRZr3h9xqDe5JMU?=
 =?us-ascii?Q?EikEbcX+sHM3dflr6Bb1ppz3Fja9yomeDERK+Y009MCGTA9xFPGaaNGRM1r6?=
 =?us-ascii?Q?z84akYHDrgTb/PGYvjuOE+aYLnIOi3uFJ4wshCKgdwUE9ScndLd1grhDqmED?=
 =?us-ascii?Q?vgzK4JfA2jDr5pCkB5T/DnN12WcoBfXT3E91VvLstxYmnK2L823REuMuM+rm?=
 =?us-ascii?Q?Ve/z4pY/kYzL24AM1E39DnZ0sDAsTd8vqdo8T8WHgteWOTOb789j7+xt6l0f?=
 =?us-ascii?Q?iNRSM+XEK7fzDc57A6PpAH5xJYeuulXsgYwpJUj5XmGZbA34USu0OoGaLLxd?=
 =?us-ascii?Q?nybxWAaOy3wr7ykN+vtW1Am2OKUzUt/LVBzDz+SyhLrRVy95isFi/tUOF6py?=
 =?us-ascii?Q?pCgmP4YFFnarTNClYImeh6ifaRsIdr5ZFa4/4ZywTwpjLkcjPV3tTHQtRmcc?=
 =?us-ascii?Q?9x+mrzzq+zFZ4REDbnSFy/t2zCu7L2FmZJs753rBz+4Tai1eqMzoJU4CyHBi?=
 =?us-ascii?Q?NG2VLVrfJN4zBhV4tq2X3JfOZ62WrrtskJfM+oK5xiH1PQh8uEYd+1z2TGy4?=
 =?us-ascii?Q?uDajRYWDPvf4mD5rnsDjRAY+p7HzGWkmSapj/m7vmY5iIqX99NyQVcO6xj6f?=
 =?us-ascii?Q?xYj2kc9axctjR3o7Mtb4AB6UhDWtcsAyAAHhR+38acwimzhIWBm0gjPURu9r?=
 =?us-ascii?Q?Cc2nPKzW69MqCihHCChQChZaTPeQfhAW6zEgySZXxVFhj0cl/Sif5Nnd6Mok?=
 =?us-ascii?Q?AS66LgpA5nDlgWa/gTRWvsvH6rQQ739XXUHd71C+LRy5QagZ/QrXiq+K7sNJ?=
 =?us-ascii?Q?foXtYNrhKoLd9Vy/uPvUR5Nih/nFZHrYhgj2JDaw3vR0VE6Np/lWxYhP4uvA?=
 =?us-ascii?Q?Gore4yFkVIpg7c6CyQjG2ljBW9Xh8NBpsrb5zLKyGH7n13peRsZZ2vC/79BP?=
 =?us-ascii?Q?SmR0oJ5u9Gkp7nUH15pZb3GszjmGcnDsrsEKoPz3koh1sSPb4tP53k4q40V3?=
 =?us-ascii?Q?JwVSWwHTZ0p9RmUcqlZDDq2qU3HWWecJhkAO6FTZ9BVkytiAy0sQOpyNgzlB?=
 =?us-ascii?Q?8XsNfgvFRLmrXyBhk4ruq8bfSI3o2vlKjz1GnDcH5qrWcmvyc7NqGuyp8wgY?=
 =?us-ascii?Q?6OMbdp30rncGANh7PjXtBNwzOaFyaYkBTAYpMeEMKrdLiwsJJlaUl7sTLAHp?=
 =?us-ascii?Q?Nj6TVQqQdr53v/VSPz+aApmPI5uMSvLLX0xQboJSOkWcHVlm+W3r4PvUAQG1?=
 =?us-ascii?Q?eGS43wXjmDZSIeRKgv3gsySLetuVpGIhi6j8pzDlVrGZogBFeuEzaDeISplw?=
 =?us-ascii?Q?Wcp0WoxDnWM1fwe4kDjdm5H3IOjINTCKsuYddoccxc7wVnawaR2+lqvRq+pq?=
 =?us-ascii?Q?KdCRjtOJH7wxxLQDcUlZzVCP79iQ6SNs0ECE5AiN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77c149a-2853-4adc-9512-08ddfe6879bc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 08:24:43.2509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhlIpD66egC6U4SGdGpJbgjtVLJ/tqgIE8MSd2vbDHw0AeO4yklwEBU3Vy7fPxDS3JbLrBM0ctAXJlctXFO4Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500
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

On Fri, Sep 26, 2025 at 03:32:46PM +0200, Marek Vasut wrote:
>On 9/26/25 11:18 AM, Rain Yang wrote:
>
>Hello Jiyu,
>
>> > > as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
>> > > so please drop the reset change.
>> > > can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
>> > > as the internal driver use mali label to control the thermal up/low limitation.
>> > 
>> > I updated all of the AHAB container, imx-oei and imx-sm components, and the
>> > reset controller is no longer needed indeed.
>> 
>> thanks, please update the gpu node label if possibly.
>
>Which label do you refer to, and which one would you prefer to have there ?

"mali: gpu@4d900000", not "gpu: gpu@4d900000".

>
>> > > BTW, does the dynamic frequency work well on your side so far with perf domain?
>> > 
>> > How do I test that ?
>> 
>> cat /sys/kernel/debug/clk/gpu/clk_rate, although its name in dts is core.
>> it is an read-only scmi-clk.
>> the clk rate should be fixed, as it can be changed only via scmi_perf in i.MX95.
>
>Right now, it is indeed fixed at 1 GHz .
>
>-- 
>Best regards,
>Marek Vasut
