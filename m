Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E97B43E40
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F4B10E05F;
	Thu,  4 Sep 2025 14:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OBZNujBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011033.outbound.protection.outlook.com
 [40.107.130.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EA410E05F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 14:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7aRO58pdwZqp3UJNEFTTcCluZCSgHU5gPo01eYDKgM/bkPgA/89jVeyK3OY6oDM9NQLh8bCnIz4It2nCTGQ+LBEHcpIhv+rPyR8q+S4mj/cUlm1uBIIjff69J1minCXXN03fkJOOSrAsWCrdh12xnc28I1GxE9t2HCd5AQUr8+Cd5HhmPywu3vzt3HQQGX9d5Om1Bu3aVD77siP9jCjXECtVOC6FxJ557VQJs6K2GFGzFGoMeIwP9YVlA5dylNT9CRJyD/DknuDoxwo4oKn65Z+9zon+U22nI6oDBsML34EIPzCmq8PkNMWylXT4QR5HzRB+AYIGVRUfg122NdSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj97W7M0ZRvMjSq3v1ZaC0VIqu3HpI37flMCEjyvZro=;
 b=a3CWOQPFreFwXeAFLTfs4rP8A5heNIqSDf/jgFc4Yer4yPW51xoaYcSvJnxZ4QdK9b0tEgQwootBdmtxu9tuHKh0yRk1jPt9/D8t6QSCKFoNL4ZKCQZAkmaVwUlrEZiSPbt3T322uOn4IOfEB+pHw9/Y6RJdU2jFXwQ8tStUxRl/XF9jaTgEMwed8jaO0UoW/zq4euLYzoLv5Zk0LD0Nc74ypsR1ENVjXUc8+yn0McP2Kc/O+lEncMeWbnievTFExaIO9vIhVVUb1qrNQqTq2CntEUpuBfHX9889ohlYzMV4fb+9tSdUzQzQjpJ0LNpKwDiRLsATZJqf8am9JhtrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj97W7M0ZRvMjSq3v1ZaC0VIqu3HpI37flMCEjyvZro=;
 b=OBZNujBKKbxc0QP2fbymEapuQ/TkWci5EywrMOtlhSgjp122YeALNN4nlDVN/bTsHewSbiCV4sgATf4dAG8DLRLeKEuYwy5KATHF8MJALHSsMexmz/eYsk3+SDc6duYQ1bjnZBBw5uonp7QSq8lD257dUe4tPiENHO0j3PMNAhKSHx2/WzD33YtKCshEi1o3/whQ6sZ5F4I24g/GIboHtHV56Al5xLyhRXDKGep8yT6jGcvBDjZHmYBGFRLNqjoq+8WCyEipIlslHX8p6I2DJgYsjWYaRrASJ4VWFk775uxe1o2MYcNG+YXXdVEXKZz7FwjMatftCuR9JafmeTRxEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI2PR04MB11025.eurprd04.prod.outlook.com (2603:10a6:800:277::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 14:11:59 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 14:11:59 +0000
Date: Thu, 4 Sep 2025 10:11:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/9] dt-bindings: display: imx: Add bindings for
 i.MX94 DCIF
Message-ID: <aLmeJU3Bk6HpEWpq@lizhi-Precision-Tower-5810>
References: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
 <20250903123332.2569241-5-laurentiu.palcu@oss.nxp.com>
 <20250904-attentive-seagull-of-fantasy-adea9f@kuoka>
 <s6uc6wjdb3seygps6nvusvu3x2io46dc5kai2bnelpnggpgyyh@j2ao3lhupohz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s6uc6wjdb3seygps6nvusvu3x2io46dc5kai2bnelpnggpgyyh@j2ao3lhupohz>
X-ClientProxiedBy: PH0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::33) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI2PR04MB11025:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf0260d-29c4-4568-6765-08ddebbd02d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|19092799006|366016|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1l1HaZ/1UnydzwPXcIcvWPe50fTvRwZUCRxuxWu6StzYaHQ3nP6MHBRCnaJP?=
 =?us-ascii?Q?0sPLY4u5MiUCQr5EPldkjhRPye+w2C6XGHbRLg1KICX8nhG6ARQBwWR6rNHL?=
 =?us-ascii?Q?RP3VwOxzYm/r2OKUoa1U7KmBPy7brLzbUaFd0EH+8njBrQPv3CmHG+nSIvlf?=
 =?us-ascii?Q?dXkSWA2P2aZa2Da9VtwjSkgAke8+6+iC7tdY8yXCDXY3koDAniqGPo7+FE7N?=
 =?us-ascii?Q?Z4aN8zrecD3e007/5++xlTeRwqU8k6YA8/WEwrC6PCLxpb/AtvF3SKlED9MX?=
 =?us-ascii?Q?/VPbvMXUHL+IpieeESMjGXzAS12FTxGHp3qvbCg7wIO9f7Vz1Srup2lzYeMa?=
 =?us-ascii?Q?k/Uaw5kJPXa8S9ThPYEHD5zAo8rT5UAPPF2BWVcaKmmP/6K8Bm0U6PR0Ewc4?=
 =?us-ascii?Q?qUaMPaPxrj4xePk2U0785FCltos3aOs2HRA7kIQVrbRcj8lmLfehXQut5Zae?=
 =?us-ascii?Q?ar2oXonZeLUTyLGilsU5E9oXscC2+1zItchuMdk/ube8LOSPG2Z/vu7csWQA?=
 =?us-ascii?Q?9EvvxaYbiXmr/+VQzQNit0n4/TvEWpLBjWugVKbooq59ZnOmF5HwC/Hw81TS?=
 =?us-ascii?Q?j8mZMHG/Qn2AZfPZsfwzag35HNeLQPckHk5Is7Tu7m6Tl9sGXMY46PgTKov0?=
 =?us-ascii?Q?ueF8FT/VlEaaxi9EHPHyHBYsebK2B5rp8pNIKshpK9jG+YI6tH31LoVLkDCz?=
 =?us-ascii?Q?L/0YU4ihKcfeGLh/trR48SHAi+8y1w5upGjAkatbId5pu76STVZ6t9QL5wqX?=
 =?us-ascii?Q?VYXsnTvxhHDSj6nSfr9K6KNiLT9SkCktNPceKYpLB+aDsCXNan7vo5fWO4tI?=
 =?us-ascii?Q?g9TzDlFGeExeFDoXvCOoOo3ocS4FoK2jiKH96m4t9dU8OXijgk519paUTFEX?=
 =?us-ascii?Q?KadcL6lQ9263Wx2Yr8JZeLak2zh+xfVIYwX46R4BeI14HbFC7rKihSdlPXDb?=
 =?us-ascii?Q?GlFsch4oqoGC4hF/SnEnjHKu3dEWaAEbDdSo0KKyrJw4Vwh2pfXLQPOsz2JP?=
 =?us-ascii?Q?ojSvKiiwJCvLMkLsYhAdOy+1zmBfugFfkcIyvXJz7GZmK3PF89utG2cwSP2C?=
 =?us-ascii?Q?Q55ghSuQZ8gh8TE0VlnXgRUaqEg0pkZupAkzAlUzfUcceov1n6/GTftgkFcl?=
 =?us-ascii?Q?/ecfLX6PGYO/Aq2Ir0S4y2KXHWxsXJso19+fYZHUtCLkQDV7O03ovDu0PSwz?=
 =?us-ascii?Q?dFxIkEipOxE1jI5TN9y7B7tNRp+iRw5Hbe8xj8iLbk8agsS43NYu3Vrska5c?=
 =?us-ascii?Q?rRCxgXPgkZlt9/JxGk6Pb0bR5wbw20JHoGU0T02HS8ji2Hp7bQh9ZEH/UXvg?=
 =?us-ascii?Q?Mptp+hDnt4+8xz5sEpcl3zTdx/zlPlyKuQdtWlrQoCRa6pmYG8TPvDw/rfsF?=
 =?us-ascii?Q?s4Cj3JcHEqjzmc5ZAbH6kIQi6qWGa0qYd3iThdbRb/vSuWWaCAXK0a8Wdf0+?=
 =?us-ascii?Q?G52/M9FR6mIYh9xaiSzi5RGpuJBc3EHi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(19092799006)(366016)(52116014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1a6biJBgak1hr6DLg4mKbbyQn9SI/41SLM4LxXMdSc2TUZ9sdgDY3aD+/6ay?=
 =?us-ascii?Q?Y9DBpf4Kdt7zMEnOjqzvquE0zj+AYEcenRnfg9MQ97/Wkv5kbU8ctKe3teUu?=
 =?us-ascii?Q?JdBQtrpbPUY7jJ8NGHMJUlfYWyXgg6fqx6vY0zYgVq6goFLT/z0+/FUaMFEA?=
 =?us-ascii?Q?KkTsCbn5+L/K4BDu3+aqTv7AZpkkP2HexxTQglTno1WYtx3zzW3Jolfxh4Ki?=
 =?us-ascii?Q?PGBrbsHLznD+N8gppH33kYasGsBqaXdKk2ARUr6EbG0dLZzDIcJ8eTsV3B7J?=
 =?us-ascii?Q?xuXlolGFSFn9AcetRCD4cYRoP8ldvXSo7ZhpkbriDzrtzz4agD26L7DolneB?=
 =?us-ascii?Q?bBIWB+jqjTOdYTgLfb6S9mhtWuC1ICHzAA7Sl9xZKwcMRpU7GdrXfqfYY8PI?=
 =?us-ascii?Q?Cx4Nuv5PZVujncfIgwzeAHmh3UfDifgTVhY1kfPEf4+UWp8AJzMG2BqEpLqs?=
 =?us-ascii?Q?mmwmoNfseGAZOFsU/ejdZdXPJ2O6WKtgGqJW7XBDEgLYgs1fWJn7AmR8K0kL?=
 =?us-ascii?Q?5DVz5eUero2sT73HQy2XIdWtT5JzabwPZv6G72/X8wvMMRiun6l/LDIRExT2?=
 =?us-ascii?Q?+LvRAFh2c8vvyRrQJrCmAL2/uPM0Tw0dwb7qAU/AvBrvblerLhMF+vgdv2q2?=
 =?us-ascii?Q?Ip8WqPk3j2CetDFLFGr1ehEN+DPIdMAO0yQ17UjNbQbJSsARdyp+1tK0EIJe?=
 =?us-ascii?Q?mBBlyDG/0MjKRBEZYb0UKR+F+pc4RD6s2ALgmLjvjNpRwrXMgmZZ/dHeVI4R?=
 =?us-ascii?Q?IOhSIRKE/S+wE8JSsLzjHnHkiAGwutW3p9CR2C1ScVb455qSlfJV2Ha7Ac77?=
 =?us-ascii?Q?JIUZvM+8bhFFov+GYC0Rn5Yw0Ar/dU8uZ6Rcs3yMHpAbRpm3/dgmQd9t/rTx?=
 =?us-ascii?Q?k52xanwMYKOp4FB+qRW4338M6EGtXQzmuJDFBSMn6/zp7wpLf5nrzeZeIc3V?=
 =?us-ascii?Q?Rmf3YdJ7Sv/C5dpvyqy8y3/e07x87gKX3+qjLDHGBxqB4fyn18q2hC5/xsNm?=
 =?us-ascii?Q?4kuPtI0+esVaovQwXTMJu7D8w3oOlptgELse3k4rY+Gq81wJNhLhf9i+1kl5?=
 =?us-ascii?Q?C9QYEo30wTpBQV3Ev4RV2ybuTCd2/lUW6+TASH+jRLnJ886/nmMNSXAV3ved?=
 =?us-ascii?Q?yFPDhn9wHnFUHIv7aVn81yTWF5BkTUN83kAp4pDGRASnvAQj6VTCe4DcIM87?=
 =?us-ascii?Q?sXN0Jy1A4jh/erw0V7sxjQghnZgS1TL/Wl0WiOCnX1tLn9nX6R/IRQceygZb?=
 =?us-ascii?Q?Faff2w/I4YzIbpDIphsN/0DeINoIjIvGfXAzpJqLTAnPbQf75l0Nn4v5RCnH?=
 =?us-ascii?Q?VEKBdMI0Iz3AqUkGTeBYUnFKJR1viPgr0xIbFv6XmqwLEsT5UpBHism9YggQ?=
 =?us-ascii?Q?f9qoVRf0cX4dFWAvBh/QVgVi4SaTyeBlHt2unIh3AfK2kqLJzzmTUdWwkTKj?=
 =?us-ascii?Q?OI3KCgOZauT0odp8Tkdex7fAOdOHLPCnFaMuLkiNKLMOLru2HeTey5GoY3BE?=
 =?us-ascii?Q?5DB/aGejh5Gjt2ipdqkBnRTih3nA8BsB60o/tSMSssgmEEjrLSfcI0LHLWIT?=
 =?us-ascii?Q?vV4bdAd9h0xcdewfl17LOVfU+FNILAJIDUwzXiWo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf0260d-29c4-4568-6765-08ddebbd02d9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:11:58.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chjHYETLKlKw4FxJ2gC9g309EX+/ImX6f6bm0M36SmKsa76JIJgZgDyF5+vU36ckgM7dcddrfYVzKl+IXWjn3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11025
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

On Thu, Sep 04, 2025 at 03:14:31PM +0300, Laurentiu Palcu wrote:
> On Thu, Sep 04, 2025 at 09:24:57AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Sep 03, 2025 at 03:33:22PM +0300, Laurentiu Palcu wrote:
> > > DCIF is the i.MX94 Display Controller Interface which is used to
> > > drive a TFT LCD panel or connects to a display interface depending
> > > on the chip configuration.
> >
> > It looks like you are going to send v5, so:
> >
> > A nit, subject: drop second/last, redundant "bindings for". The
> > "dt-bindings" prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> >
> > Anyway, nothing in the changelog explains dropping tags.
> >
> > I am not going to do the work twice. Write proper changelogs.
>
> Sorry about that. :/ I agree it's frustrating to do the same work
> twice... I admit I was lazy and only wrote a changelog in the
> cover-letter. I will try to add a changelog to each changed patch next
> time.
>
> The r-b tag was dropped in v4 because I removed the QoS functionality until
> I find a better way to handle it.

If drop review tag, need write it at change log and said the reason why
tag dropped.

Frank

> Hence, the 'nxp,blk-ctl' property in
> the binding needed to be dropped as well.
>
> Thanks,
> Laurentiu
>
> >
> > <form letter>
> > This is a friendly reminder during the review process.
> >
> > It looks like you received a tag and forgot to add it.
> >
> > If you do not know the process, here is a short explanation:
> > Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> > versions of patchset, under or above your Signed-off-by tag, unless
> > patch changed significantly (e.g. new properties added to the DT
> > bindings). Tag is "received", when provided in a message replied to you
> > on the mailing list. Tools like b4 can help here. However, there's no
> > need to repost patches *only* to add the tags. The upstream maintainer
> > will do that for tags received on the version they apply.
> >
> > Please read:
> > https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> >
> > If a tag was not added on purpose, please state why and what changed.
> > </form letter>
> >
> > >
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > ---
> > >  .../bindings/display/imx/nxp,imx94-dcif.yaml  | 82 +++++++++++++++++++
> > >  1 file changed, 82 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> > > new file mode 100644
> > > index 0000000000000..54419c589ef74
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
> > > @@ -0,0 +1,82 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +# Copyright 2025 NXP
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/imx/nxp,imx94-dcif.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: i.MX94 Display Control Interface (DCIF)
> > > +
> > > +maintainers:
> > > +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > +
> > > +description:
> > > +  The Display Control Interface(DCIF) is a system master that fetches graphics
> > > +  stored in memory and displays them on a TFT LCD panel or connects to a
> > > +  display interface depending on the chip configuration.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: nxp,imx94-dcif
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    items:
> > > +      - description: CPU domain 0 (controlled by common registers group).
> > > +      - description: CPU domain 1 (controlled by background layer registers group).
> > > +      - description: CPU domain 2 (controlled by foreground layer registers group).
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: common
> > > +      - const: bg_layer
> > > +      - const: fg_layer
> > > +
> > > +  clocks:
> > > +    maxItems: 3
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: apb
> > > +      - const: axi
> > > +      - const: pix
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > > +    description: Display Pixel Interface(DPI) output port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    soc {
> > > +        #address-cells = <2>;
> > > +        #size-cells = <2>;
> > > +
> > > +        display-controller@4b120000 {
> > > +            compatible = "nxp,imx94-dcif";
> > > +            reg = <0x0 0x4b120000 0x0 0x300000>;
> > > +            interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> > > +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> > > +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> > > +            interrupt-names = "common", "bg_layer", "fg_layer";
> > > +            clocks = <&scmi_clk 69>, <&scmi_clk 70>, <&dispmix_csr 0>;
> > > +            clock-names = "apb", "axi", "pix";
> > > +            assigned-clocks = <&dispmix_csr 0>;
> > > +            assigned-clock-parents = <&ldb_pll_pixel>;
> > > +            power-domains = <&scmi_devpd 11>;
> > > +
> > > +            port {
> > > +                dcif_out: endpoint {
> > > +                    remote-endpoint = <&ldb_in>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > --
> > > 2.49.0
> > >
