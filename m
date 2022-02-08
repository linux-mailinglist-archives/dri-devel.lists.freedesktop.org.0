Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EDF4ACF12
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 03:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF6710E19B;
	Tue,  8 Feb 2022 02:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB0B10E19B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 02:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHqGvA3yENWxrZaLLpaF5hHRpLVhcs9HUM7IANKtedHXTH2vDyaHYB2BfYh4zk4AioUdzrOPaNRp56IiQ5OQsZwXraEhPzHO0MpkHfKQiOmDUs/yJINuxteU75HQq9EmEuC38RMmV2jEKxCy83TBeOsNd2ti4JrwF3K70x5sc0BDqyNAwsis/XlxsF5C/ZAMXcryq9PjWGUeK/R9Jz+PMHo+MMSkxcyi268DrPI6LI8WzQ87+A7F9SKxbLZ3WZzTFJ4eHpyGQtJoQlrp8keFuNe4EkHAITn2wLnBhDzAiOfoZDZz3KoH1G26bxXIfdWjHF1vmbUwWIbD/SW8z1XCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe644ssAKrp/cW9vcaNS1NuD2ata9T03sUkpqTU0d7g=;
 b=XPKByadQNVaKehxHqLiItD8HpmasJpG7Ym2bUUrc+GNZwQylnsCTmJDBMNAHLeOMxErySyXicEjxiPHye9zU8PvYRi0Y2wtzS5pLpuZ8wOBZNN+NKQ9D6W3BPCOnHesV6onX+1PeAofkNOqYVi3ucjOoIyMAn7V27CCHbesShIisSqUgHGMtwq5RrgRXdH+oWQ/Fh8sMfO9A7l1GOJB1EmK+Fb/70ndkNrHxgF5hKL5eJk45OqcFnbMPDuWNrtRmTq4Wggkbrc7sQh+xcnzc04VywNB4Nw4l6TUQPlhXU1YOdxdVeXnRuxBbGPzfSOuwmayf8Lk9nCuBdoVJp0+bWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe644ssAKrp/cW9vcaNS1NuD2ata9T03sUkpqTU0d7g=;
 b=DF1//meHWgd2RMXiLpukEZEv6GqZ1YGT8o6JrP6QOBBLHS2FNzJdSvV0DJwOfxDtjwa2Wa2ajq/pTRwUqBOgHbdHN0ntA5/Ym9xuUMvJfQ+W2XeUcLi5X/jZNN+ir82GgkbcxXlkRmOUtpWXWIwS5z1hFV5CfmafpUfgCA/uLjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB7098.eurprd04.prod.outlook.com (2603:10a6:10:fd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 02:42:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 02:42:10 +0000
Message-ID: <fc56574745fd53dfcc65425aab7547d9341cd308.camel@oss.nxp.com>
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Tue, 08 Feb 2022 10:41:59 +0800
In-Reply-To: <49519f3a-060d-feb5-891d-adaad10607e2@denx.de>
References: <20220206185643.275811-1-marex@denx.de>
 <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
 <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
 <1020798373f3f54d1dd7df7174afaeb973ec86ff.camel@oss.nxp.com>
 <49519f3a-060d-feb5-891d-adaad10607e2@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c27f64e1-e89a-4655-be1a-08d9eaac9a8c
X-MS-TrafficTypeDiagnostic: DB8PR04MB7098:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB709853FCD20FE741E649B34DD92D9@DB8PR04MB7098.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lGDJ+F71YbamWr72agc5nBeRP5LHKwllJ/ICR/HfhBFl1xpGLYwDY837AN4MZHcwrMGSSL8IzOlmayNqO7kpxlKGt3ARtV8XIMOScXGCGAhbu7ZM7hpl4DP4PlyDpsoTQNZgou73eK2CiR9MNlDnsb7FjvSUYV9olEa3V5ekr6Ho1Lzn+CWVZckxe6Tf5Z+kK0F3o5r58bZocXSwbRwj0v7oPPWXYdCjw0XFpvvJCqgTVP0xmFKt6WeLeVlghbxZhvXIPaUu7xkr77gXSFG+4MBqWGGgUGSdkG+nUiOeu9L2zMF4UCJ3VZZOgxMIgUZG7yJVqoUTdsnzDBHmXKLrwtivC9Y7YVjbxhjwGawXc1xc7FYmVP10l9OnytEZIxTskGxHcIO4EAwSi4ZSaEG2HvfT2u3Q2KE1h+6RFVFZFD2hya/1XXd4xE8eu1iVDUecQ+pdjI0RvEApx5pMdyvoV6G7dA2ZHK6F+UODR817x8B1l8WE+K/GI8gPA+3562p7EFa9MtkOw5s96uEgK9GIdErGE6rtNA4kv99+sDwVawTE0VfXEbihLOaW4sQIX7sTCgSN3cvW9IOK9/bbsWgn9xCSgSMNpk2N0qRmNfzc0Fh6Zevjn1Ocsutp5Bn7UJfjPhNJgO1HFTxbzDCgo1Psd41u9CX8EIITeX5wushRZbrHbKyGY/AGfg7BdYo5NfreD8+/pgW3eqRVWR8Z7VYF28hzRSLrdOhCOz9pte14Rlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(66946007)(66476007)(8676002)(66556008)(38350700002)(38100700002)(53546011)(4326008)(6486002)(5660300002)(2906002)(6666004)(6512007)(6506007)(508600001)(83380400001)(316002)(26005)(2616005)(186003)(54906003)(86362001)(52116002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2FjdnROa1dMUzNxZGZnQjNPV2JrOVF0SlMxR1MxdEhmM3dPU1RsMlJ4OW5m?=
 =?utf-8?B?dVh2M1AraTNsZnlkWksydVdRZndRTUZVcm1CdHhkTlFZTFE3Z1FjTy9pNzVj?=
 =?utf-8?B?a1hFa0EreVhpYWIrNUtNZGFDVFI5M0VLbmFaMzdMa1BvZ3pxcHV2VmNMQm12?=
 =?utf-8?B?d1o2S1p4dUlYTDMwRzdQckNzWWk5cmI4dWFGR0QweXkrdnc3dXVNR3JIQTRs?=
 =?utf-8?B?aUFoa0c5RzN6SEhPWTZQVnpwYVBlSjRQT0VuNGtsSWV1Ti9QTkRRQVBhdkhz?=
 =?utf-8?B?VDJHVlVNNjd0L3B4SlJsaXZzbWlmL1krcktYWGJ6WS9haGFNcjFrb2RScEg2?=
 =?utf-8?B?RWVMZHRxb1hBU3B0TUJCbTd0NmJRMWI3eGc4dWgvdERxaXFPNzJPMUVVcVo5?=
 =?utf-8?B?cms0K3grV2J1ZG96MmNNYVNpZlVubksvSytBM0E4ZWVoNEFCeVZyRVoxUzV5?=
 =?utf-8?B?clQyTytvQW95T2NKTjRVYWNaN3NpWUZJVkg0UEpVMThWSU9lNkd1UGE0bmZB?=
 =?utf-8?B?dndFVHRnalZxY1NZTU15ZUJYVEE4ZmJJazhFQWNqZVFTck9CQXNLcUFpdTA5?=
 =?utf-8?B?VTAzL2FRSEZ2eWg5dk5ZWGpSTnhqWkFiWTN1K3R4ZCtSNjBJNUFMUThRbVVm?=
 =?utf-8?B?bklpcGdieWk0MzdBcXZTMTZ2ZkdzZEN5MGhZYndsNlQrcGpzTGdZWWhUSDdy?=
 =?utf-8?B?SXdISmZ3UEUvbEIrNFZ2OFVxZHhjODVGWU1iSHhMQUtKdVc5T2ViVElnVUhp?=
 =?utf-8?B?cm93eTY4YzNLTVBjdDhOSXRFeTFCYUtLM1FqZERLYXRQNzJXT0Eyam5kQzJi?=
 =?utf-8?B?Yk9EbzNEL01makZBb2hDRHNseDRrTlBIT21VSCs1OVk5d0kzMjBweGUraWEy?=
 =?utf-8?B?RjFuMWlwOFBVNHI0SFFQbU1xYTQyV21UcnpFY0Y5bEcybXFsUEdLb0RsZmZJ?=
 =?utf-8?B?Q0p4ZmxwL0pDYjhEbkRtTFFHRW1FL2N3NjQ2aENUci9NcmFGTlNpV1R3OUxi?=
 =?utf-8?B?LzNNb0N1Vksva3U0QWRnZXlaUW5qeURidUZJSDc3T3RlQ3lETUl2aWlTNlls?=
 =?utf-8?B?ZUtVdTNaSy9sWDF1eWdvZWZQVi9yKzBxWW93dklWb2dzcmc4WjAza2tTRjZT?=
 =?utf-8?B?S1R4S0VIdTBqK1pkU1pDOU0zUkh2NkV6OTFZNjQrN2s0bUkrWXZWaGkxbXY4?=
 =?utf-8?B?R2tGQUp5THY2Y3FGOEo4TGRzdGpScG1Rc3ZpUlB4cTB2d3RncUVxYS9PaVZ3?=
 =?utf-8?B?elg3U2tMV0VMTnBrdU9YOWU5U1ZoZVJzNnl1a05DbFhGaE5KaUFqYno4ZW1y?=
 =?utf-8?B?Qlc5Vy9LWDVGNi95Sm1UeHlySDk2K3JwQ1BoM2xDd1VhZTlSOGtmK3l2dWRP?=
 =?utf-8?B?Yi9XUHVuTGVPZzY1K2g5YTZHdGpvR3pGNkhmRCtwVlRyZHNZVW1Ic2p2a1pY?=
 =?utf-8?B?VTVKeEFFUXladkxMMXlpK3JHQWdMTlRwWjNhWGYwRFdhM1R3ZGFDZER6cVI3?=
 =?utf-8?B?TVJ2clJkSzdURmJqQ251QW1IQjJBQ0RxUURqU1h0ZnRkZ1BvbkVUWWtyYTBX?=
 =?utf-8?B?eTBOM1p3NngwOXM5MzJ3T3lEdjN6STVLYmJMdHcrb2pWRTNIVHF2cnlScExi?=
 =?utf-8?B?elFIb1NwNXlBSitycmhuVzdWN29SYTdva1BCeFgzS3FLQ3NGaTRRVml2Tldi?=
 =?utf-8?B?VVp3b0JDMkhkazRjVUh3a0NZanludytJN3NvQ0F1bXExU2NNSW41OHA5MnUr?=
 =?utf-8?B?ZnVJcDNqWUxJUzdsMTlEZ3pVNGJKdENHcFhuZDNYMzdzbmNTMURXRmpTdWE3?=
 =?utf-8?B?M3A0dkxuTFlRY0ovVVdIV1FsZFg0L0RCaHBpckNTbThBUGJuZnNWdm96Nnly?=
 =?utf-8?B?ek5DYms2MXpId2wxZDM0OWoxb2Y4QjArUDliaDUweWlsOVUwM2EwbWthZStF?=
 =?utf-8?B?bTYwWjV4VGtJUGQrMU8vR2p0OG1ENG1hekhDZ0tteVZyYmRkTnFuTmYwQTZZ?=
 =?utf-8?B?MmN4VlUwdjNqeXRSZHI1NDNQeCtncUdieHY3YzFjMG1uckZqbE5DeHUvZ1dJ?=
 =?utf-8?B?VkZ1bldkNnB2V1UwLzJ0Vmxwb0cwaEtvZUFRYXczOGthKzVEZEVmV1p5U1pI?=
 =?utf-8?B?aHBGUWlRWWk2Z08yempNd3o0eUxYSkFlNGx1NC8wcXg2dmZ4ZDQ1OUFGUWtJ?=
 =?utf-8?Q?9VAeQ4s3yoHEmdoP0mGJ1Ec=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27f64e1-e89a-4655-be1a-08d9eaac9a8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 02:42:10.0792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtQpkYRwiORj0E0cZQKuAQdPlRMuaQekaA4//KgR4SmGe9QE6T/tcciQnvUTm6mmGf6CMfy4XzduAop3Ckfi3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7098
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Chiras <robert.chiras@nxp.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-02-07 at 11:43 +0100, Marek Vasut wrote:
> On 2/7/22 10:18, Liu Ying wrote:
> 
> Hi,
> 
> > > > On Sun, 2022-02-06 at 19:56 +0100, Marek Vasut wrote:
> > > > > The LCDIF controller as present in i.MX6SX/i.MX8M Mini/Nano
> > > > > has a
> > > > > CRC_STAT
> > > > > register, which contains CRC32 of the frame as it was clocked
> > > > > out
> > > > > of the
> > > > > DPI interface of the LCDIF. This is likely meant as a
> > > > > functional
> > > > > safety
> > > > > register.
> > > > > 
> > > > > Unfortunatelly, there is zero documentation on how the CRC32
> > > > > is
> > > > > calculated,
> > > > > there is no documentation of the polynomial, the init value,
> > > > > nor
> > > > > on which
> > > > > data is the checksum applied.
> > > > > 
> > > > > By applying brute-force on 8 pixel / 2 line frame, which is
> > > > > the
> > > > > minimum
> > > > > size LCDIF would work with, it turns out the polynomial is
> > > > > CRC32_POLY_LE
> > > > > 0xedb88320 , init value is 0xffffffff , the input data are
> > > > > bitrev32()
> > > > > of the entire frame and the resulting CRC has to be also
> > > > > bitrev32()ed.
> > > > 
> > > > No idea how the HW calculates the CRC value.
> > > > I didn't hear anyone internal tried this feature.
> > > 
> > > It would be nice if the datasheet could be improved.
> > 
> > Agreed.
> > 
> > > 
> > > There are many blank areas which are undocumented, this LCDIF
> > > CRC32
> > > feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV NIC-
> > > 301
> > > at
> > > 0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port mapping.
> > > The
> > > NOC
> > > and NICs were documented at least up to i.MX6QP and then that
> > > information disappeared from NXP datasheets. I think
> > > reconfiguring
> > > the
> > > NOC/NIC QoS would help mitigate this shift issue described below
> > > (*).
> > 
> > I also think the QoS would help if it is configureable.
> 
> It is programmable, it's just the port mapping which is undocumented.
> 
> > > Do you know if there is some additional NOC/NIC documentation for
> > > i.MX8M
> > > Mini available ?
> > 
> > No.
> 
> Can you ask someone internally in NXP maybe ?

Maybe, you may try community.nxp.com, like the i.MXRT case.

Liu Ying

