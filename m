Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF4BA31A3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FC810EA08;
	Fri, 26 Sep 2025 09:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="itHjOMle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011053.outbound.protection.outlook.com
 [40.107.130.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45E210EA08
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:18:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BggETP2l3/AVxgUmRm1ADrf1NTc73Tymw+H3vF8xN1reYH0dyVKquUeZ9DDQ3bAawvboWcvSow1LZDHTmpwdOg6OBxG9RqEXVXbl/MPhlPr2Py7vDhQybYRZ7gsC1VvKd48hg2+R7ueZk1V9s/PWLagZRORyjtpBXAZEssoi9Uur13N6qUKoHThGYgv0S/U1OZVDLiqBNm8/BmcqP6AwNlPKns83NxJdtf2zgTDbMegC7FnS+R56ra00hr+OJ1iSCpGDBFBroAKYsnj7RIUpwhY3X1Y06lR2mjvRUEPTLq9Q5kr5DzzRZJU/yi8dZBsrQiNuUUro4Xj+ttKAzE+c3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EjK9vFG7sg4FIwJV9tktgdlkYR+4sV4FEdF6HY9pk8=;
 b=ZJHEqoMsXAHm4njsr/P9oBxdMsUxluVwi1PHEOgYoIo8S5QNU4z6zhfs2CACvOEw0q/rA/n2WzWsE+5qR3uto6Etp8A0lUTO8DbB2KXcx2UA0KQjH1fH/UhOOdsUPq9Ott7IVIk93IxLX/MUeqfJHtGPIDJD3k7yI+7wqHhPtN4bhBvObVaB5Ym5mBgJZm9fNUwc2LpB7VI6BspVgosQrtGeimSiBfzG6IoTnYvHQGDAADDacPz0IrljUS6lI7qaZF2PqK6mzLA6PCJT2k/rABxapsNiLVkdYSdpDmi/J3Ye4D7yYdCKpaFOVgoX4222ZqoFQlOP98Qd+L7mNvttdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EjK9vFG7sg4FIwJV9tktgdlkYR+4sV4FEdF6HY9pk8=;
 b=itHjOMlelTkKIAgsNcd0g32Ar/LdCSM8UZyel63YP88dbGwFALOLzoU6Jx5uKZcwmsrmJw+4oTM/E1/PsXZgtulCabOwNeJsRzTm67wsoL8Dcc7UTlZWAOm3LQ+xNgEHuq4EjQ2RwpyoxR7b0H4hmecT3daOCL72PhlMTDO9wofw0Q3heloCYlnM85VPZwe4V0CMcTapTTuzDbvJ3qGuS+lVoRoKhWheTx0mJJOHg6xTSeU5TsPv1+vOhUp8aj1BBN0F6ooGrGK/HX2P1ATKEtjUby/cLvdk1eBBPBX/iI/syNEeHCTUtHnE1q9R4dTvXjNn04xFOHrHdikxyP9x9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GVXPR04MB11543.eurprd04.prod.outlook.com (2603:10a6:150:2c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 09:18:29 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 09:18:29 +0000
Date: Fri, 26 Sep 2025 17:18:34 +0800
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
Message-ID: <aNZaatnVRRkaPrnD@oss.nxp.com>
References: <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
 <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GVXPR04MB11543:EE_
X-MS-Office365-Filtering-Correlation-Id: ec90f83a-c4dc-4d3a-6cd6-08ddfcdda7bc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5y7jZ4t3OZDGJY+d7OFxG+wd/4jIltHJiBkaBtdaLjpfdZm9QIXpN2P03FK4?=
 =?us-ascii?Q?vT2wp1yfrVJtz6OGvVHLJtF8Rs6rnIQKSyzctaGY6heYBBfRPPxG6Jel5P7n?=
 =?us-ascii?Q?iKeEWQNm/Ros0MHS41xIbB9yBWIfIbjW9b6i3xWbth/rL4TInx1JjiJIdiN7?=
 =?us-ascii?Q?MkvIeuk+T/jYXzLJ4+d0DtPxjv3LsrdpJUchckL8tCoSuk6CizrCwC7SAxyn?=
 =?us-ascii?Q?j4fMm07hqPJ9Yo1PfDUZHL97f8zXgSajkpEy+6JhQ1c/0PpRBmN1DkjfLPey?=
 =?us-ascii?Q?oYgK8fr6vs1szyP5pBhFppsP8nlpt9siUNNxpSO2uQpu35DLwa8USlA3bTym?=
 =?us-ascii?Q?rbVYxLV+9ODFsb0j/XxWBEun9cLUUZpNX4lRzDtX3wl4lhJHJINfwrai26H0?=
 =?us-ascii?Q?5Y4btdSn0OlEcBLvKL5fb79a8YvYe4z+jUe8o9bhIAZYyym6OwGoUyJILshp?=
 =?us-ascii?Q?hcXTOUBN7AqLcmi5Vo1OGHNz76YI5NEUlbCn7iMCbfQs9+RRLEu1OnO1Xbs2?=
 =?us-ascii?Q?pMgh9B4vG0OugrMTT1yGO0Zd/r+eZHg05LxIsQBEghHl++lGhhIf781yIYR/?=
 =?us-ascii?Q?EK7UCdrgbVMl3rpzRK5DDIOH8jlbQsJjDioSCQGXR9MT5armD5YXZQiz+VuS?=
 =?us-ascii?Q?fRhidC5H+m7bCrvWZrVtxZyRRfjuxaa5QaHXJdnaApefbPA07JySmOF9hdvK?=
 =?us-ascii?Q?pmbNBLJF+rKBbvC77YTGO0AZUOG3JQqlROsrdh5YjCldzDeb+SELsmIFiSP4?=
 =?us-ascii?Q?JdJMJtaDh1bbYVfaEQcceah8GR0hrqYPtgVzAmOYnW92Nw79RugwnSav1Qmu?=
 =?us-ascii?Q?7c5fVmiVbFzxlP/u88NPonQMVgPinEirm/RSlyWavVYJkAzkxu8bmd/iLMYr?=
 =?us-ascii?Q?Kth5aXOdwgPlcq2MSze1BaJ4E3ZPurMVy+8eKs/uQ+M5AO7sF3CG8tjbcFBA?=
 =?us-ascii?Q?XWszo50J1W2YujMXm2nBld0KMPySczm8E5OVcGlZaz2ki10ntVcG/MWWoKlb?=
 =?us-ascii?Q?zhgn5ZYYfFWPY9tT05oq+fHzom9cvngLob+v6bPh6ALLtzzw38uW7mlD2GCc?=
 =?us-ascii?Q?fOVjrK5MSD6BeqwBScRHL4QN7SMmOb4PtTKHAOh1G3Hy4wmMZFRKAJI/pOAJ?=
 =?us-ascii?Q?slYamd4jyUKCgC3XAxEY5gQw51RObarPry9N7WkQdDR7wU4O/HisH7Zg3BML?=
 =?us-ascii?Q?d/BsGcfSvF/O41xp1GkqEUZgh46SSWBZyFaicgDafsqsAyHP4mF6mv/k2oo4?=
 =?us-ascii?Q?jUNWf+Ch6Le/4H+BqZu7iEQh7J/6QDMVkksl/TXDuFcN/2M4r/t5WuDxe//e?=
 =?us-ascii?Q?pMhGcViPfLJChTeVhRmZKhjwYDAM5aoG5XzKBGUg4X1ITVvHRK3fVqI+/LCS?=
 =?us-ascii?Q?D3sB9i9aSQGMbGWQS+N+6CqraP8Ix1v5o5Qg90Rfh2VKxPtc2KGs8hL4ggjz?=
 =?us-ascii?Q?+nc/48c5wuFXvS5SKs9o4mrqvDNuVgGTKf5H/HJbRHixzSM/2uxo6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WAvjhFecc8Zoigpu9fwiRhZSilhker28FxgNAE5mAnwPM8pxi0eGyXdRn0gR?=
 =?us-ascii?Q?lHwwXvleIgRP/3+kZ8ZY+jo8Th13iMa0JW4HiXJdeFvEkP1DqHoFc/7moFc4?=
 =?us-ascii?Q?xmDkO94S+Gd9Bv5vD/tUPjUWcLsyLLf0YIwvs3jG1oAfu9B/NhzkxL+jvq3z?=
 =?us-ascii?Q?EDjVy0sdnl1WM1CA7RA/DlGEMkFlbt6SBUZV89aXL1FAfYCcXRvjr2oFvI6Q?=
 =?us-ascii?Q?+Yb3kTghTzsU7lq7FETuEn2qyC7cTN6+5A4MfkxjpyoXzxqC0dKCznAVu2+h?=
 =?us-ascii?Q?iwf1TEgdkb7okx0eM87+wdlm1HQMGULUAKL2PkKbz6tcubrQrKvO4JEsBL/x?=
 =?us-ascii?Q?wmBX+W6ryyqvjUPzJfscGGao8PAlZyLO7ir77GeK7ngYRyfYdnp4Af4Dd6Vt?=
 =?us-ascii?Q?F4E01G7FIMO/HcZ7BBD6SeLpjb2EQuqHgYh52hnc50lDN/S82Mb4OBgpVl+6?=
 =?us-ascii?Q?EcsESkzFb/PzStvRogqt5KxypQFAlKByKDmibujnJqM5K85Ykee5FxxKhM8W?=
 =?us-ascii?Q?DUkTELFWKY1ha8pE4c5UcwbqHjQ2IuRE8AQZx83MwWKweatZSQTW8oapmGt8?=
 =?us-ascii?Q?9efWeC/LlisJe6z2waN6a6ZfQYMPJZdjpTZb01PtKDjiYjvPeFc+75tInQce?=
 =?us-ascii?Q?Nl6ULWLNNRcBMPM01SHhp0epIFCKfzzd4CHhZeW1uD9lDwRchQhsrk9tRuFY?=
 =?us-ascii?Q?7lH3qW7FZ+RMplq7LMDVP3F1sfuZtrmEClDjxBTAPbscpW30Ym80PjvEaS0m?=
 =?us-ascii?Q?s2wibAgmpLsWAgGm2Ypga8Nv0RSbTfyxJK4cQR1/dshQsC/VQG1Eh9gSZAjq?=
 =?us-ascii?Q?hFlGhKF8fo2Ck7ziAgAfn5GCjxtnuN87P8nBixki1i3vNaXKKBBtwfdKTpqD?=
 =?us-ascii?Q?SQX14Mbs4F8LynAs8gbQ5V3MdTb3R+VnX9LZNnuIaG7FMgy+eJjXhuPVBhVc?=
 =?us-ascii?Q?JjLWO5soalJaiGMrjhFCDtLZvNBjSNSR/nYvL/TtWDY4ithuOr8OjB7LVO2c?=
 =?us-ascii?Q?tXouSFLrGoNzKFOqqrNjM6uDagRXOu4BULZ+TzGY4mpRUseorjb7IlfoqgDa?=
 =?us-ascii?Q?46mPCol6JN1CdwQQ60OT4NcJKcbqLsUPxr+4aN9TtwjzyHnpVvJZmhCvQRr1?=
 =?us-ascii?Q?eGeAF4c+w1m9ISGeyJ0dv+1wIGo09oHc0dtCbldC+pNFUTUjC8IWA20vc3lG?=
 =?us-ascii?Q?mT2/zqYrUH5+gSYEcUiO2eAhc0wHj9GriltJZ2B1xLv8+Nq/pHQBvsAghOVS?=
 =?us-ascii?Q?psr9FRIuv6/a01rmdN38QPCCe1zBp8m9+FqEJ/49iq/EacG+z6Ug/TSXBgMz?=
 =?us-ascii?Q?1rHNqHuXbcI6ptZmrsEYfgNTUWRFp2R1tlRL2liuvxiLeiKPUnmJvIoVfI8Q?=
 =?us-ascii?Q?KFTQ17/PpwyCEE9so3+nbS13I/Tl725ZhEQw7MLFRhut2wOZ+pzDvi6wfwfd?=
 =?us-ascii?Q?7hspKYbfc4sw4wOqIr1tPoFOghHZXm3kC1M7ZWXGOwJFly2Ba4pf2MbWSDci?=
 =?us-ascii?Q?7P2cD/bm5sHwXGOrNJ9GJqwYl/qn0Ug2Ulln8oIpijv6cLUVaO3ClCrayQW+?=
 =?us-ascii?Q?hUpD9+XdYJFCauaIowyWuFkcROqBUSmvfkVsSRXy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec90f83a-c4dc-4d3a-6cd6-08ddfcdda7bc
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 09:18:29.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIWa3cQ3WD824jkWYZGJHqit8GrYp15//1age1P2m80nwnFKZ+bW28uv719yyqQe7eWh0GIbPMHKudl9/+L4IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11543
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

On Thu, Sep 25, 2025 at 10:41:37PM +0200, Marek Vasut wrote:
>On 9/17/25 4:18 PM, Rain Yang wrote:
>
>Hello Jiyu,
>
>sorry for the late reply.
>
>> > > sorry for the inconvienence. this uboot version don't include SM-184's change.
>> > > I heard you're using i.MX95 A1 Chip, so you can extract the uboot in below link[1],
>> > > or build from source, or raise one ticket in this website[2].
>> > 
>> > I use mainline U-Boot 2025.07 with about 10 extra patches, but nothing
>> > significant. I don't think this is U-Boot issue, is it ?
>> > 
>> > I can rebuild SM, which commit in SM (from imx-sm repository) do I need to
>> > use ?
>> > 
>> > -- 
>> > Best regards,
>> > Marek Vasut
>> Hi Marek,
>> I think the problem may be about the multi power domain, the second power domain named perf
>> is for frequency change only, you can try to power on gpumix power domain only.
>
>I dropped that one.
>
>> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
>> so please drop the reset change.
>> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
>> as the internal driver use mali label to control the thermal up/low limitation.
>
>I updated all of the AHAB container, imx-oei and imx-sm components, and the
>reset controller is no longer needed indeed.

thanks, please update the gpu node label if possibly.

>
>> BTW, does the dynamic frequency work well on your side so far with perf domain?
>
>How do I test that ?

cat /sys/kernel/debug/clk/gpu/clk_rate, although its name in dts is core.
it is an read-only scmi-clk.
the clk rate should be fixed, as it can be changed only via scmi_perf in i.MX95.

>
>-- 
>Best regards,
>Marek Vasut
