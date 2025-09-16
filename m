Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA5B7E312
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701CA10E155;
	Tue, 16 Sep 2025 22:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xtlSEh8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8DB10E6DB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 10:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4AL662gIUDTxMqQcMed3OBkTnaDwYt2+NkWyW0R8at94iROm6vKNPgLZ0cmR4DUxB13pZHRpGlRfPE+JmMsojPaY+oYSIM1gSkz2eAfkW5Yw9xzagr8ExyPBwQrYnC7LNmZEfEUzPFG7sQDUQK8ql4QDlEBBklKa7jTOBJd6zw4DFsYy6t/cxPuGMEKp4FWKuLFxSXP4Jiajd48IiwTLLRzRywjwOuoEu7Ru6PmWCUPB2Bnjx1FCrWwYMzCm3WYPGFt1qhgAckjGsVELCEdxvmh2gzJEYO4DdGDnSW9TeA5c404n+wOOO5weDrZlCa1tCl5h4otxBizWCPx+DiQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLbVmHyhfH/bI0jov0Byw7tlBv3+GMCKI2IbWVnYBhA=;
 b=jXhKXsFKnsFfX60Y18FE7OadbimWi6oIFoNoTINDAL3RvdUIlg4wojjk+c91ZFhpnrqoH2X1gk0rIvmoLrAAlvXWrL6+70m2aFnhpBR/hpOSuImAYR6s6aRvXi6NdmtoEv4DWI5hnphE3lh8sUUaF0nzmvvq/lU7u809hcsIULF/CvI9hBEP/uYaNfMohd4xCeMXc+VQ/NnpjwngBMw4hG6DE5OqJLFG3qumUTsNL72aZvXunL/b+6vBszEQaPjan7/3ZrohXmzFgEnpIdkRnS0WbqnJVf0ldoGzwvQiNFRaBR8FVvbG9KMuUjugROJbIZPEM97E7zdGVjCP9J3nAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLbVmHyhfH/bI0jov0Byw7tlBv3+GMCKI2IbWVnYBhA=;
 b=xtlSEh8jxorLCfqrQxXCScVwfDRaXm3v373IJYTsBR3wjqfXRYGcVANrWXmY9kdKLF4EAejJxlt9HIZC1Sq3Ak+/Y+elIx40R2sLEpwOb+awjC0tGdoay1ZYZ9lwBsHisO7fCXVA953hfDzoZ85AdKEOf6KS+X6T2JqWdFr+zivy7rZFb3YKAJEQeX8QL7zP90EAbJSYC6hWGUBcRFwiWicDpGE/E2KaPUtlrvbZ58toVnfxlcCyt9sowt2zlOIPQuQ5Uepd8BvCPmmLU5QQicHa9Jk797AF71+VdX8x+E96tJG24aMYPAEYefSNhIP8hw5rICp/1KglgYuHrH9HbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by VI2PR04MB10786.eurprd04.prod.outlook.com (2603:10a6:800:274::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 10:06:45 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 10:06:45 +0000
Date: Tue, 16 Sep 2025 18:06:37 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>, boris.brezillon@collabora.com
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, p.zabel@pengutronix.de, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
 simona@ffwll.ch, sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <aMk1CISrn2_p0qzJ@oss.nxp.com>
References: <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|VI2PR04MB10786:EE_
X-MS-Office365-Filtering-Correlation-Id: cb26759f-851e-41f0-cf96-08ddf508bd8e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|1800799024|7416014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UXvYu2OU/5h7tgkv6d8UpMRrHoVS+jtyQQsrCRijciYGEEYP8ZjbWEzXMPUM?=
 =?us-ascii?Q?pfh+Ia2FkLcgevXKMTSpvPJMcx3AOGK9Ggj2QGgNXcnYVU0TLl5qiwLfgLgW?=
 =?us-ascii?Q?L6duUh+yqwy+tnkGh9tGW9NnXKpECBU7fyQP+yOgy3Xm2WO0w47vCBlvO+Yr?=
 =?us-ascii?Q?OiLjZPJqQwCxOTqtZFORJU69XosYB58d4pAj7aSDSWJeoGowaDkZpbUD9cp1?=
 =?us-ascii?Q?V5P2Z/cDk/Gs2vP11jXevYAzuzrcgX10SepptdGkiO2MQNYP5/gfF6rKs3SB?=
 =?us-ascii?Q?/MIlKVNgMb/iMvLqD/HW7aoq4aZXYVBtgyaQgZCCnHo1AKqOPR2W7F9x6L5z?=
 =?us-ascii?Q?NLIKwx5+B50MpifCUHQJZL/I5rsJxvPiPDwRXSFO1bfeiSVtbFF2Cq3xruEc?=
 =?us-ascii?Q?P1y3rEDhfbA2Cn7xiEZcFCILmNrbv65/R+BEZuCaNkAaSnQkc7sXOHQKoRXP?=
 =?us-ascii?Q?SyhNRARJGTLBcQz3Nb6vocBMKwt2kGojhLftj26Itcjprlu5lV709gyRl3Gz?=
 =?us-ascii?Q?UoWSzpxYr640vz+hHzGHwPVoxHZK6ZTKxmp/aV3ZPvHEZuyYbj4bQk5rvD+m?=
 =?us-ascii?Q?PnFhn6rMlX5Rxc8O6YYHvNT+SbyS0v0b1Og/xK85R3YGvAVhDGMEFyBy1qzR?=
 =?us-ascii?Q?coa/e6g7y7F3NMRLhOGjIkQwKY4xl/n3BanFQ3tx3XuyvkMJnvOM1Woj5k8N?=
 =?us-ascii?Q?/WmRbq/5bagzmIEvJKd1QpH7QTNdc3FzZ6ZQ1QmcgARKIw9Gyo3yBeYW+HT1?=
 =?us-ascii?Q?v9JMYH5+Qu7AeO6KtIsnYBp0Zi/Nqek0jy0gz+9NbjNfb4YeOn7LibeKBvz7?=
 =?us-ascii?Q?61zsat3fXnjJENLsg0GiLYZi3EEoJ11FEiI7viLyfaFIpyWoK7Qgew6yP6EV?=
 =?us-ascii?Q?dY2XJMLAmgCHXLqe9ezWT/BNcZDzR051Z4WY0LjQhm95VKoxzjVqf21Z1sN6?=
 =?us-ascii?Q?r/jcXevWMHtD0hfSaj4bOu5kgjUxnw11qBuRL4oST84KfWZtNNFT0Wb8KYPS?=
 =?us-ascii?Q?zrtBcCCbZ7hkzY8mSGMc3dJDB9bc+Md9awC8wVMw68C1jxoT5G0f/AUsy1sK?=
 =?us-ascii?Q?pCnUCH2pdJYSKEMP+6NQrA82+NgJPY1Am5tIUYXTb2BY/TzdNB2w5GZyvnwn?=
 =?us-ascii?Q?hhzgKYPEp/mPvQUyMrzhwpd7tdPJOgKOl+RnSHcQQygJ/2tcMclOJBZTIC5q?=
 =?us-ascii?Q?RB/ZGPSNlCSvMlnrkMBdtJtx/ypXJxwRT7IFEuYoUZmNQ7DsUc/gilOvlTyp?=
 =?us-ascii?Q?rabPzyQ62Z2ySjJ2Ah9XvuB4Px8Db4X/f73PO+CAHc0I0hFOifgKJDEG77ET?=
 =?us-ascii?Q?iu9VzHhSqPncqG6gWrAoiypvrBNBobhU2dh1BDMDe2NvOHpWQqUdMzZ9qrIl?=
 =?us-ascii?Q?pnDdwwUFeDpkqFhYryehXlFBVeOSHxQj5v97bkkcMiv5wHFNByBi6k44mP2h?=
 =?us-ascii?Q?W5a8yfP8hp4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fR8ZpKro4bPj2WGOtzvzlmRVGuBd4w4Lvu3++VUNX3iaoLZ7QchlaR9ml5nu?=
 =?us-ascii?Q?9BJteVokMNhcjcfEANJyFsHQnSbuEVAze+8IH4h6fWpPhzpiD3IVcu6oEXh5?=
 =?us-ascii?Q?woWPAoMVWugxSMTkO/UiINtlBgc6sS0gTXFexqz7JLy1IRHhQxmDmQQ4ReWi?=
 =?us-ascii?Q?CsIvPoRvDmjyJW8UhC6qhAq7CzXoAAUxBKD/W3PAbP2cUOWJkk/f7lXb/4kd?=
 =?us-ascii?Q?eZjQTlcvBzy7NE6siqMNSsZQY7pJII3oCRSAzh+OJef7xwkci3NZdfxwWwyo?=
 =?us-ascii?Q?2eTVDK7FUGtCZrTHuTynY9WF9pnHeR56v0bnG8Hi65i8VojhdNjM62eyM9dt?=
 =?us-ascii?Q?NqjPHqNFIScgXdh9BA1QeBMVgExnRim+8d05QwUqsVeHU8gs2ZItkyML9v6O?=
 =?us-ascii?Q?zF0meeUqkfxN5MDDym+ON/ZZSkAVlexA/y4K0px/YELr/e0xSCOtWbJpWlnm?=
 =?us-ascii?Q?AzGBAtXysS1C7XcedmPkloQTD24QEZADHR93fbIHAYx4hcsPgqQO5EBhCclm?=
 =?us-ascii?Q?yVcgoouLXzGBLobEVyaeP+5iW4w4Ew4yoV0JluV5A3a0WgXgv1qpFkGGZ4CW?=
 =?us-ascii?Q?XzpRVlx/miOYwHzz35ATuulbvRvUHEvuTCLZXH/KAX6mivMjSphwm4LwRaYt?=
 =?us-ascii?Q?P6K70Q5qsxGCs6mLtUyRxmBmSh4ft+jBsUeciqX1lrDvh4lfYyayzWnRe9iH?=
 =?us-ascii?Q?NJhbGZY1VK/PwcCvVL/mIk+kBet4uvS1NHS4W8PBb+eXw94VQfzXhBJrWK1u?=
 =?us-ascii?Q?7cVE+OajAJlPE057UJlLVLn30sJDK1fduW5XU8Vqppy2+26RFvCqIcB76h4H?=
 =?us-ascii?Q?czE4mKOyHNdCR0KMLQj06hOllDZr+e3JwsyY8V7bQ5BX1f9DI0tn3Rw5Sirs?=
 =?us-ascii?Q?Qzf7zCN0n6w1wlplTQLFFLOnY1R82vGm1C7z1Ysvt8s2hDtkpCgh2c2UlHu5?=
 =?us-ascii?Q?gXW+XrqEpTqOgErtV6mE1hK7k3eX1A3lF1rRAmBADNP6gbhYfgF5PblMZ54h?=
 =?us-ascii?Q?/335A2oLCDnR4p+dxggP+/POHGlyrqvTP44zOp9GywKB4DCf5zAK7mW+h2wG?=
 =?us-ascii?Q?I5/eaLiaGn6+yFePWsflAc1JVmJ7Y04x/OCDLngIbJs/wk7yhsVnJntKeIMY?=
 =?us-ascii?Q?Vv+J8QP0LLDWRq+qheEEy6QGx6XzJ4i0OW6L33ok8l+yazgDA//H0LP+2dbv?=
 =?us-ascii?Q?IGsuEvQa6sjBkdoZdtAkx7zxhXQQ9ap8sVHNoCEdLubicxPpwWwees3IrC1v?=
 =?us-ascii?Q?ZYuHi5ad3M9ihLHYlX+m2VVmYJjO5x6Y6rpGmWDa92ujI43o7ISL8HFxa3EG?=
 =?us-ascii?Q?+pJSzthE7vPDFWeeHRer+DXMjAFVZ8f25cJCKH1D3nzzepmiXGsSDMqjOosJ?=
 =?us-ascii?Q?x9mu8kaa3TLcM/zVzZ3LoGI4YmCfogRkrOpHz2EvCazoCtpCWCnT74t0cZ3e?=
 =?us-ascii?Q?YmM11T3iVTK7fjfqvycgw+4sUcEHIMGNo0WlImk35xGh8wmsoAwxYqEMHc7w?=
 =?us-ascii?Q?kiMQH3Vqge6p2/mV08yihR0Xw/GhOztBFZNSnENtvLHNsa3Fgr7eWeWOPKQx?=
 =?us-ascii?Q?xp1Cw4pl82PamyufFiESlw/e0wUjsEWCmzV4CxR1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb26759f-851e-41f0-cf96-08ddf508bd8e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 10:06:44.9745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBTs9sHYA8LsqnKMCEaNzkCNhpbblHOKf6sKXLIKTOedTALfBWoZ8ybZbNbPK3j711fJiIl0vRvfAXWx4hbLaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10786
X-Mailman-Approved-At: Tue, 16 Sep 2025 22:36:40 +0000
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

On Thu, Sep 04, 2025 at 05:29:11PM +0200, Marek Vasut wrote:
>On 9/4/25 5:20 PM, Boris Brezillon wrote:
>> On Thu, 4 Sep 2025 16:54:38 +0200
>> Marek Vasut <marek.vasut@mailbox.org> wrote:
>> 
>> > On 9/4/25 4:04 PM, Boris Brezillon wrote:
>> > 
>> > Hello Boris,
>> > 
>> > > > > > I suspect the extra soft reset I did before "un-halted" the GPU and
>> > > > > > allowed it to proceed.
>> > > > > 
>> > > > > Hm, not quite. I mean, you still need to explicitly boot the MCU after
>> > > > > a reset, which is what the write to MCU_CONTROL [1] does. What the
>> > > > > soft-reset does though, is reset all GPU blocks, including the MCU.
>> > > > > This means the MCU starts from a fresh state when you reach [1].
>> > > > 
>> > > > I have a feeling the write to MCU_CONTROL does nothing in my case.
>> > > 
>> > > I believe it does, otherwise you wouldn't be able to kick the MCU
>> > > and get things working until the first runtime suspend happens. I gut
>> > > feeling is that there's something fishy in the FW or SoC integration
>> > > that causes the FW HALT request to put the MCU/GPU in a bad state
>> > > preventing further MCU_CONTROL(AUTO_START) from functioning correctly
>> > > after that point.
>> > 
>> > I wonder who at NXP could chime in ... Peng, do you know ?
>> > 
>> > > > Is there some way to probe the MCU state before/after setting GLB_HALT,
>> > > > and also before/after the MCU_CONTROL write, using
>> > > > gpu_read()/gpu_write() register operations, to find out what is going on
>> > > > with the MCU at each point ?
>> > > 
>> > > Yes, there's an MCU_STATUS register [1].
>> > Is that the only register I can use , or is there something more
>> > detailed ? This register only returns values 0..3 which is not very
>> > informative.
>> 
>> Not that I'm aware.
>
>Hmmmmm ... is there any way we can progress with the MX95 upstreaming with
>full reset , as a hardware implementation workaround in the driver, or some
>such ?

Hi Boris,

you're right.
*0x4d810008=1, this register is a write-once register, so it was moved into SM
since imx 6.12.3 release, and latest 6.6.52 release. some document work is still
needed in the future.

Hi Marek,
thanks for your effort to make the i.MX95 GPU upstreamed.
I created one PR to support i.MX95 GPU expcept the multi power domain[1],
but it seemed to be placed in the wrong location. No one responded to it,
so I closed it.

for the suspend/resume issue, the panthor driver works well with 6.12.34 
patched with pm_domains operation like you did.
run vkmark->suspend 10min in the 4th console->wakeup in the 4th console.

can you show me your SM version when uboot start,
and the G310 firmware version which can be found by search git_sha string.

[1] https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/13
