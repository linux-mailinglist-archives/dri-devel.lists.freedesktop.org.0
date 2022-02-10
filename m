Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5724B04C2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 06:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D3B10E417;
	Thu, 10 Feb 2022 05:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C03410E417
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 05:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fn1BScVlWZR8nn21E3omzGTUcJFXXQNwUozf83RbAlr0W5KOueya9o6HyI1B4fnGhkWd667uP3bVj5RhFKzt1HW/kdVn+W9qoAuXBWvoVprVfcu34VzrMg8pcZ4iRJypHcE5osTRRLUCbhlOuY0ei1Rzm+QHIYe3F8yjZyAUHSr9jQNtZwasu9ejTFDB41HkZGSP7pxA+lLweiz9/E0IiYzIj/lqVWuk48z26Fc2sKG2iEOB64bU1HbJMYLvsKxB/a1s4SoOzNihn9Z485TmZkQNqqwEIS6BBKHxk7nW3QbeLa04YPghmYWQSdNTPAYSDg5x6Mb/L38xgmfmPn7cTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o26OE4edkNA1N/rRnOYKEThOvem2Yhbl5b44xHc5D2k=;
 b=Sm3jJKqw22TBPAzZ9PsQtkzpQzr8Fel3kBMY9ZVfQ2c7VXKc1aHAg/6x2MxM2/58I41nVqWasibnOM7ngHcl6drLiOQPy8nt/sSYDowoW5ov95bXFtd27H8OxX1mhb1bSs/06tmieBEu43VZGJ12bKnBuQOHuXb6nm0Kl2M4YoqUfB76Mb5fLXGfmOUhJsk3c19e/mxavnHjpIeXJnUPQJJWP+WtHIyiiaO2iIIp4J7jjtgvmFCBGrujTsB+5fwWMmYScnjiE+QhUFa2/j38uekFbbAur8D4CSHX/m2tQITGSJgVdwDyJSQOp5Ixk/w/gwote92tKzuZak1ETq0Jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o26OE4edkNA1N/rRnOYKEThOvem2Yhbl5b44xHc5D2k=;
 b=E1LTFDPBmwt6tNKkE9gluSrBdbXHRg7cIozQjXN+0z5YozqhPrRxxrXcmI2r87zmtdmfqcPQOYbbDwe5J8SnC6DzLNWz3vc8YbwaaZWPqLN4dZKU4JdK2p6ccEz4wniL7MmYCKIPClvsI7etsmk0ZrqaL+eGmD/2WBgTGx+p41Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB4722.eurprd04.prod.outlook.com (2603:10a6:208:c3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 05:09:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 05:09:42 +0000
Message-ID: <b1d7d9968f49c03704bd92e26fdd29d359dff38e.camel@oss.nxp.com>
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
From: Liu Ying <victor.liu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 10 Feb 2022 13:09:34 +0800
In-Reply-To: <YgHdnggH46OVxKnw@pendragon.ideasonboard.com>
References: <20220206185643.275811-1-marex@denx.de>
 <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
 <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
 <1020798373f3f54d1dd7df7174afaeb973ec86ff.camel@oss.nxp.com>
 <49519f3a-060d-feb5-891d-adaad10607e2@denx.de>
 <fc56574745fd53dfcc65425aab7547d9341cd308.camel@oss.nxp.com>
 <YgHdnggH46OVxKnw@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5826a12-d8f5-4e3b-ca61-08d9ec538bc5
X-MS-TrafficTypeDiagnostic: AM0PR04MB4722:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4722C5F4662D6A798BBBD271D92F9@AM0PR04MB4722.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vumiBe7nnlp1G8/sdddjf4b5GDgqtR62RcOeVP16mM3Dhi3tWOR2M/ML7uBmx0tcCsxaXm9Hfqw0P6deVLG5Z7H6NgJQj73QLw2NEmd3F+C4WZdAtekwdDldqli8YaNKJyNnL+LsYP3KMVYTPqVMD5KjzYMiL9FYxogeB2nteqQS5C83dl7KOq4G1DI5hYw8zPTwDzLgqj6CwC+ilREc4cwxA1KG9svpn7m0LexehYp9oV21Ewpng7UyW+9cqTVmHMUUqwOzdPzTPzyZ4k7i7Pk1ZaFaCwP2zBptVVUKOENZXFw0t+JI4ha1RF1kowGQcL+mFBkV2RtyBeUG7nnndLrkdMMBxpERkejHMkKW+HGOMYja9sWOsZ0o35rWYjR9nMSZVv3pN5Xx540uY+rtWPvVjcmpsjkpT8JZcYG4L2PzBz31Fw/b7h4wqCM70MN1ZwiTz91TX5wtmE5xHYbAldLcI99qfBrM1B1W2ihgyQCByF6V+YG4FNUEobEkGS9lnkgJvru1Iz52JATidK4V3hb/o6W3pm+UPr9o0YB4zRePTqtP/m0gNGpCa+h/EBXohUwF5Vt23m1WMRpV8J42lU4R90M5a7RnF+2pg3EtrorgknisYKYXNRKlqoUd6M90hjWBu10l034sHkbfWfHmOb/ZRmTzRq0K6WngflIsB6EganIyIwfw7FSPwKjIZbL4wWgLA/IADXD5ZKCHPG6O8y0Dx+xbDHGLcJnF649y0HI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(66556008)(6486002)(316002)(66946007)(4326008)(66476007)(8676002)(508600001)(86362001)(38350700002)(38100700002)(6916009)(186003)(52116002)(6512007)(2616005)(53546011)(6666004)(26005)(6506007)(83380400001)(5660300002)(8936002)(2906002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnEvNmxWOEZuQTlYbG5OQyt1RUppWFJveXpEa3VzQVNYN2FYZzZESCt3eTNK?=
 =?utf-8?B?aHp1YTZtRW9NVFFxbytDNC9hM1VqZWdTS0RYSFErREJkRUFKSVM5bTdLNVdO?=
 =?utf-8?B?RHZOT3hxYVZnc0hsMFpwVm94QlB3TTEreThqdXUxUzFpdVVJNXdQVWM3QkJ4?=
 =?utf-8?B?dlBNRlRGeXNzdVpiSjFSRlFvNXdtNHZ3K0JRbTdvbkc1TG5FWVlocFNFZG02?=
 =?utf-8?B?Vk9sZHlLWnFXY2N2clNIOWhUeDZVbzljSEhMbGJzZXZWbTVZQnU0dkVXb0ZK?=
 =?utf-8?B?VWpUL2kxdUJQT01aMnJibG93bkp6Qm5sZVRxaHg0cy9wWmd4Ry9SYWNVOHRm?=
 =?utf-8?B?QUFWTERqV1NZNjNQMUo0QTNudlJrNFpRMytkYXFsUFcyR3VBS2ZTRUd2T0hy?=
 =?utf-8?B?OGdKYy9qNG1OMFpuOFFONFNzV2JIS3k1NFRvY0hRR0Vyb1ZJeXl1dE12a1ln?=
 =?utf-8?B?MlZ0QjhwU0JhT2NnRnlQYVlWaE9FaEV0YXdNN2hiYlY2KzBFVFZBVERJQVJC?=
 =?utf-8?B?dTF3NzU0dmM0Q0VHSndBVWM3THp1cFE0alptMUZjb0VHOHNUanNYb05TQkhp?=
 =?utf-8?B?RStDNWN6bkR1TDgzVWZaZjhpMUNvaDNleXkzQWFaY083MURtMFFOc2ZPL1pP?=
 =?utf-8?B?a0VlNGJBRWdOM014WDR1MkVyRFlMbjgrWHJ5ZDFzNGJIQ2tmamU4eU5pYXZT?=
 =?utf-8?B?cXk5Q3VxQ1hGeHlEbzAwSlRXdXB4aGV6WDN2d1dPS1pjT2pzWmI2cEZudlJT?=
 =?utf-8?B?SE0xbkJFcFdNbi9VZ3A0dGJhSFY5bm02bnZBamdhcjNUcnh4Vit3dzZEb1Av?=
 =?utf-8?B?Ni9nWmZiRFprVUpBd3ZLbnhrQ2EybkR1TndsZDRuZ21sUmZLUWxVZ0dCTzF1?=
 =?utf-8?B?SzN2UTRHM1E5aXBoUGtBT1NrZzFmSzJMdklIM3BTWFkxSnVUOFBCaFJFOElB?=
 =?utf-8?B?N0h6NzRGZnJ3aFk5UHVOUUZKL3hNNHN5Y0JhTGgvUERQZGYxUDhpQzBkRFU0?=
 =?utf-8?B?YXluU0I3R21Pc1YwVTJoMEhqWVB5ekxWclk2VnVKVlZFKzJIaDB1R3Z5aVRG?=
 =?utf-8?B?S2YyM0NyYktYNmh1ZEc5UmxSN3BCRUlBS3l2Q1k3RVZ6dHNFaXBFdUZZVDJO?=
 =?utf-8?B?NVJ4WkliNTFsVzZXRE03NmtxWGszK2dIVVJRTDNhWGZqUy9KUnhSa1JObk5C?=
 =?utf-8?B?a0tiNHRDWWRVbXlLSGhBaFMxZ2RCTEQvSE5Zb1YzV0U4SVpXbitPWStvTDk5?=
 =?utf-8?B?SUVSaGk2Um9ZYmtTMGNDRm1qdUpybS9HdzRDaDhQckdYUU1MR0Q2cFV1VHNn?=
 =?utf-8?B?N1k3eDNaUXltT3FKMGgyVk1RTjRJMGNjY2lXYmduT0Vud3FrN3NqOExVZlVs?=
 =?utf-8?B?R0I2VUVyblNTMjl3NEJ2bFJWL0VKS2VadWZzaSs2eEVjVkF5NzdsUHNKbEc5?=
 =?utf-8?B?OGxlb2FFV0VyRzdwOGxRd2ZSKzYxcThaeDM5N3JYQVAzSnp2VXVuRmY4QUI5?=
 =?utf-8?B?OHJNcUtmOTB4Tmh1clVnTjU4eHV4cFNYN3BHSnNHK0NNNytTTDdoV01aSmtu?=
 =?utf-8?B?MUljeGw0cjdteVorOGxhTCtUUE0rdjZQUW9maTV3Q2lYeFVuRmxFK09uaE0r?=
 =?utf-8?B?ZDY2REtKcTM3YTZ2azJPTW9zc2Ftb2pGeERhdnYxVEVmaW0rWnNtQk5wcE1B?=
 =?utf-8?B?TkJzTHRGbkk5RFgyUnFXNjNxazV2N3U1TWFVUnN1S2lYMm83SUNyWTY1UzlL?=
 =?utf-8?B?UTQwNkZYM0FBcjJHWWRhQWdsYjFhRWZTNHdGY2Ewd2hGSkJhOGNuK3FRNXpT?=
 =?utf-8?B?eFNvWUdyS2lFWEtqY1NVakNsSWNPc2pQV3JIWkV3dWpxcmZKUmlwb2gyMjJP?=
 =?utf-8?B?SmNQajUxZlNSZzlLNTV4UHdKaUNyUzRBZEEwYUJ0TXlGV1lxMDBHMDd6b0Nk?=
 =?utf-8?B?aTBnTEVVTUI3RlVxZ1Q3cU5rbW1Ma2FyRVhZNHFlamRmbDFnSmllZlhqSGhD?=
 =?utf-8?B?emhXR3VVcEZtclRqYkxyWEdKOU5xN292RDFyVy9IVUR4OGlnSXc3YUdxTEpR?=
 =?utf-8?B?dXYyVkNKVHQzRDhoQVlwQWpoWVBJOFFIdlN5aFB3anFLY0cyTlNoRW51U1Jt?=
 =?utf-8?B?OUFjdm5WaTN1d0V3Q2VQQmZPWHR2OFVqK3dxWTcxWkRuNWRqK2pvYzlsRTVw?=
 =?utf-8?Q?V8QpGFwzA47g3w+VKeKtQn4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5826a12-d8f5-4e3b-ca61-08d9ec538bc5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 05:09:42.4977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXqF43wDCf1z+GTZgwJ7D3xLPEx5iMt3DA4TqP7m+oV4uFh+iAB5DnfwbmZLvLJPVB8TSqMsWDpZgB98igY9hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4722
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Laurent,

On Tue, 2022-02-08 at 05:03 +0200, Laurent Pinchart wrote:
> Hello Liu Ying,
> 
> On Tue, Feb 08, 2022 at 10:41:59AM +0800, Liu Ying wrote:
> > On Mon, 2022-02-07 at 11:43 +0100, Marek Vasut wrote:
> > > On 2/7/22 10:18, Liu Ying wrote:
> > > > > > On Sun, 2022-02-06 at 19:56 +0100, Marek Vasut wrote:
> > > > > > > The LCDIF controller as present in i.MX6SX/i.MX8M
> > > > > > > Mini/Nano has a CRC_STAT
> > > > > > > register, which contains CRC32 of the frame as it was
> > > > > > > clocked out of the
> > > > > > > DPI interface of the LCDIF. This is likely meant as a
> > > > > > > functional safety
> > > > > > > register.
> > > > > > > 
> > > > > > > Unfortunatelly, there is zero documentation on how the
> > > > > > > CRC32 is calculated,
> > > > > > > there is no documentation of the polynomial, the init
> > > > > > > value, nor on which
> > > > > > > data is the checksum applied.
> > > > > > > 
> > > > > > > By applying brute-force on 8 pixel / 2 line frame, which
> > > > > > > is the minimum
> > > > > > > size LCDIF would work with, it turns out the polynomial
> > > > > > > is CRC32_POLY_LE
> > > > > > > 0xedb88320 , init value is 0xffffffff , the input data
> > > > > > > are bitrev32()
> > > > > > > of the entire frame and the resulting CRC has to be also
> > > > > > > bitrev32()ed.
> > > > > > 
> > > > > > No idea how the HW calculates the CRC value.
> > > > > > I didn't hear anyone internal tried this feature.
> > > > > 
> > > > > It would be nice if the datasheet could be improved.
> > > > 
> > > > Agreed.
> > > > 
> > > > > There are many blank areas which are undocumented, this LCDIF
> > > > > CRC32
> > > > > feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV
> > > > > NIC-301 at
> > > > > 0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port
> > > > > mapping. The NOC
> > > > > and NICs were documented at least up to i.MX6QP and then that
> > > > > information disappeared from NXP datasheets. I think
> > > > > reconfiguring the
> > > > > NOC/NIC QoS would help mitigate this shift issue described
> > > > > below
> > > > > (*).
> > > > 
> > > > I also think the QoS would help if it is configureable.
> > > 
> > > It is programmable, it's just the port mapping which is
> > > undocumented.
> > > 
> > > > > Do you know if there is some additional NOC/NIC documentation
> > > > > for i.MX8M
> > > > > Mini available ?
> > > > 
> > > > No.
> > > 
> > > Can you ask someone internally in NXP maybe ?
> > 
> > Maybe, you may try community.nxp.com, like the i.MXRT case.
> 
> Overall we seem to have had little luck with community.nxp.com. I
> wonder
> if it would be possible for key community members to get some more
> direct access to support when working on upstream drivers. I'm pretty
> sure nobody will try to abuse it :-)

I'm not sure if it is possible. It's not a bad idea in my personal
opinion.

Liu Ying

