Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28C4B04D6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 06:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8211C10E6F1;
	Thu, 10 Feb 2022 05:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4618210E6F1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 05:22:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzaGd+oFuZoQEm/B9ZjE06w6fiARvjegrfdqia2I+BPxMYGDSMHsR3KGeM3kdKkm0xDoXBrnVzu/bhi77aNKfSEk5Z9/VrkVgYscZUtczUunMrq/IfK/vWYIYrGjhccUcsoaz5SaUrdHMJ9Ba0PUWz59caWpYRPcXwrFQZw4EhY2V9YKHJzwzVCKC+zuLT1PZZHR8xaUuoDynbBmCASy/pVobApY7WEteVFf4L7E1C6+1Jtnc62aF99oGkCoFVuegzNViI6hGxTwfGyzGxA1gZip3gUQM5LXkX0PvDSAHFGNG/ItdE6YTkOeNLN3V4S7aisvJ4ZMCz1hcnt3ExXGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUyFaJNoAqVQG3FyMhwaIPu2ygZL3KN0uZwNxgbk4RM=;
 b=mu4wAo91+vtpjf8KwvmSi5hoZxGvPTVoqdE+5lM5LuTotHYFu5Rof6htWVzT9sHx0ppbWxJwdIeSb2trOBqj9VkcPkrXnezfVGRvTRO6ZEeeODy8GEpN4PonSojFTn3XBsOTQWXehBRd9BvV15oc3nkFQyCZBaOpA9rbpwjsTfvXZmIZMRv7WLbBMyBPkCCfIHUQ6Eh4rc53h0d6rGdC6xn4jGppMohW17InPBYweAKlWmui/E6/a5bKTtIsMF84B5yPCMAQBdkHXhNGjSCHCz51m0MwyFZJLro6sn4T/FEHLk/8m+lCDjMYgYJMlU1rtHM70exoDBZ00+IkqB66kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUyFaJNoAqVQG3FyMhwaIPu2ygZL3KN0uZwNxgbk4RM=;
 b=Lu8dJWCJW9EFKB3AEuLoHVlDgL/GAhiG13kgsSm+D9xJEC1Kls4ioAT7L+JFehhEZ4Fc8qYQB+zFEsbAl/d+CRXEN0BrQzdtcLXmRO+qOqQNtWNOx/yCDMZsqHWheGK5WkFtjwGe8RF+ik7uwQ9gwhRbKt3noXBJ8PfCPuLTL/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB4451.eurprd04.prod.outlook.com (2603:10a6:208:74::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 05:22:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::ddca:beb1:95b0:1ae1%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 05:22:27 +0000
Message-ID: <695e387cf1cbe12060a394095322ea9bcf824678.camel@oss.nxp.com>
Subject: Re: [PATCH] [RFC] drm: mxsfb: Implement LCDIF scanout CRC32 support
From: Liu Ying <victor.liu@oss.nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 10 Feb 2022 13:22:17 +0800
In-Reply-To: <024db28a-491e-3252-48f7-79f0e2cc2d12@denx.de>
References: <20220206185643.275811-1-marex@denx.de>
 <d5ac849dc8aae325d98f215d4f92d492abd909c4.camel@oss.nxp.com>
 <9a2cc781-3277-7e09-530b-05c7361cdaa8@denx.de>
 <1020798373f3f54d1dd7df7174afaeb973ec86ff.camel@oss.nxp.com>
 <49519f3a-060d-feb5-891d-adaad10607e2@denx.de>
 <fc56574745fd53dfcc65425aab7547d9341cd308.camel@oss.nxp.com>
 <024db28a-491e-3252-48f7-79f0e2cc2d12@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c17912b5-00fa-44cd-1bd9-08d9ec555405
X-MS-TrafficTypeDiagnostic: AM0PR04MB4451:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4451EE5A0E9CB0DCD462558AD92F9@AM0PR04MB4451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBXup40O5CpM7QZXiRtfRAUTg6SAZVtu4r6YSTG0kgyZdrVwck+pv5L2x0/UfPsdXzJlcJE4EUGzuNrHzHv7cH9AEUOa7v/FsmMaGiqiwwb8kOplutXEf2qC+mr4y/Cg2slbfFDuWo4EwoYZf2+sq+7QOvoW2qBfJpwe0DQl1qwDmmzOPMoHyosgmGQl6LrsvhSUyass3Tf7zKMS2YfN3J5G2P3dxqscowiMTEeM7877K5PufIpivoy7BJowAF8QZ2D9V7iw7phvyTBPsYqIzUFjOYaICrT9/WSgmKy9c0iSLmmaAFFN2ekCKSl98/rKazpx4UZbxzPYucdn4KxZywH37ulPZb0HKJmSRpTfj1HSdP51398Bx2enILenISo2kG6twQZzFERuQ4M7/vt+LTi2/9Qn0Ev866X1XIT/fvQFFNcS2poo0Yf6Z+Xo43suTG+T69SCP5JUnYFnOpOgLLYgVICyJW5SzHSI3Duy7+1jhoP4JJEZdfVVHwPoqAy0cYIdjk8Ymh890a/hyToGtrwdDJiBeegxdl5d/XtmSO0xEr2QfJBATZ3e7sT+ekN1O+aHRZd24jQ3F5pHpDfFBG6oyyffeFHXX6srllrfsp93DKuh2Mwf8ayvimmoHKyqkwNYielYmsNkXzq8/OYwSvwZVKwyegkMpIMF7rfL4xHA/GagejNyYH6LJ4P0wNSXU+02q2Py7H1tGzSthde5QbltkMZEIBvbTwsy6QqmUAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(86362001)(66556008)(316002)(53546011)(6512007)(6486002)(508600001)(2616005)(52116002)(6506007)(4326008)(66946007)(2906002)(66476007)(8676002)(8936002)(5660300002)(26005)(38350700002)(38100700002)(186003)(6666004)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVA1OVBoSXRaUEk0cXpkbnFsTGd6ajhVcklMTmFZL0xGM01Zb2RqRTlQZXJV?=
 =?utf-8?B?N2UxZU52NWxGVGd1Vkxoc2R3R3E5YTk5Vjdqa3F4TUtHNVV0V2FPSGdkYjNF?=
 =?utf-8?B?QU5Xc1dDZ25XVFlzcitrTk1LOXlTZ0FZcWN5WHJac3NpRWtJcE5nSHdqVzBs?=
 =?utf-8?B?RzdrWUV3azRkSFhXZVF1YTF2S0hoT3BNU2VDVXBDaDlUaG5TVVo2ZVBEQnk3?=
 =?utf-8?B?N2VubTlvclo2S1hXNWZuRW1NaHp6SGhOM1lRbWlFK2M1WUpxKzl4Qm02WDNF?=
 =?utf-8?B?QlNCRVpnQlhsWEpJazM0WDg4QXhvYVVNTVY4SHBmRkdFbTVTRFlNOVJ5RUpY?=
 =?utf-8?B?d0szbndrNnNxYlEwNzZqVjVYUnJtNlhIODZRQlJXS2lUb3lDbXBVTVIxTm1W?=
 =?utf-8?B?VHBuUmFDUFBRd05BUVdBdTJpQnUyanU5S0dyZ3BocmRUV0RyNlIybi9pMklh?=
 =?utf-8?B?UU1NWHg1UW1saU4xZ1JtOVlQUW1RNFdFS2dsSzJmeVgzNXlMUXNrcncraC8v?=
 =?utf-8?B?Y2pFb3FVeXh1Q0dJTXVOV04xSy9MVytabTY4UndDa013b1BCMVNhZHZhaWRl?=
 =?utf-8?B?RDh4aTFuckhNaU1mQVJORjBaekd0RFhDSitzQ21ka2kwWlhQTmlyK2V2Y2Nj?=
 =?utf-8?B?aFF4dzhCSGtHei9DbDRheDdDV2d6ZE9XOFZWSm1kTnBianYwdGZDcjlTWUJB?=
 =?utf-8?B?TGd2TGZqMk5YRFNZTGpSejQrRTlqd0xtUk45a2FOcWlQMEE1V3F5ditxWU5j?=
 =?utf-8?B?Qm4wZElNcjhPbTQvemlsQ2QwNnRSMW5xZzRnc2JIMGxBSUdVUGZsdG1nVzNx?=
 =?utf-8?B?Uk1ORFRBcUR0aWVwbGhMNW9acE5pYlp1WERYQ3VuVG9JSjFnRVpBUmZ3Rmt4?=
 =?utf-8?B?blF0dVhBRU14RzlkNCtrTjFsZnNHR1NXQWRRS2RBaUpQQUhoU2szNXJ4RHBU?=
 =?utf-8?B?SnFsMGpEUVMwOENMQmYxMmN3WmNoVkZxbmpPd1pzUndsejBMUFBoUWtBYklq?=
 =?utf-8?B?bUNEVG9HY2VPR1l6aDJEd044b09MRnloN3I4WWRNMmpWMmh4RkEzakhJL2g3?=
 =?utf-8?B?RHg3Z3IxQ1JRazl4VFlNa0RWTGJRbWxXZlpxWGtoYVBLeUdXZitSbHdXL1dz?=
 =?utf-8?B?U25yeC9IK3NGWXBENGJVVG84eWJaOHlCQytZR0dvR0ZNcWk3a1FkT01tVW9X?=
 =?utf-8?B?cXdpRTJwQVlIWnFaUWVTZk9RS1Y5Y21PSnNQL3FwWmNiU0MzeWhYN3c0Vml6?=
 =?utf-8?B?ZGlBTFlSdEVOR1JOeDRzL2l1UWpVazJjakcrTDJvU3FvakRDbXZabnkyUVBF?=
 =?utf-8?B?eXF6RklmRXFhaHBnUitWb0h0MDlLR1huYnNtWTZNak1yajBWbWYrd2Vkbndn?=
 =?utf-8?B?WktoR2NuaTVDMEdhVU16eUpab3FVakpjT01JWW4xMW5VaWVqWCtQd05hVnB6?=
 =?utf-8?B?TG9neTJ6eHlDcndTdVRMc1RKM2lQSHFLdXVuNHRCZHEwQVFoNXB2SVZZazBh?=
 =?utf-8?B?cXVYVXRRQTlRYkNVdzFhM3pMUkliUjdiOTl2aTVSV1hPYVBGbFNxWlBlRFJR?=
 =?utf-8?B?UnIvYnhXL25LZ0FqbzBxbXc5YWZFUldFREZwSEhpMks5bDlSa1ZocEY1QmRZ?=
 =?utf-8?B?aDBhOERjSXJ6NTlOdEFvQkl4MThDTUNQbERlOVVTMU9Ubi9zdXgyZXJLVXhZ?=
 =?utf-8?B?SnVzNjFYR2x6NThQcGUyRjJjdXI0NE9YclYvQWY5S2Zqa0FyVFR2YXVYcDJE?=
 =?utf-8?B?SGNIZFF0V2Jwb2NTVHV2eDIwU1Y5Kzh3VjJIWVBEeXVMQ1FjT2tSUHU1NHkx?=
 =?utf-8?B?bWJrTTM5TnVSZFE4alh0bERHVUx3Wld6MytlT0cySW9QdHBJMk9hUlZNNVhu?=
 =?utf-8?B?cFNENXpzc0tXZVlTZW1wNG9qSFZ0Ri9NYzJzNEthREl2UXBhR0ZEMHFXQ0VU?=
 =?utf-8?B?akhmeU9JTGZXWkJKU2dBZ3BrYWNlREpNeDNkSThTNm1vSXMzUWU2U0lZY2Z6?=
 =?utf-8?B?TFg0WU9kdHBpY3FOS09oSXo2TElWOERwbVNKeUZpbkVsWVp2eDZUUjRHZ0cx?=
 =?utf-8?B?cTV2UnA5SXZValN3dGFRWDhNVmJvT09VdjVNeXZKWW9zSEkxQjVVRld4OVVY?=
 =?utf-8?B?UjlxMVNkZ2dDSG5lUUNjekUxLzFxS0VZWXZDTDFDLzNnL1RGUnEwcGx1NVNO?=
 =?utf-8?Q?TRzuuDz6xU2E7wm/hmKbkuA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17912b5-00fa-44cd-1bd9-08d9ec555405
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 05:22:27.8287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBLZScpfAO7XDSi7bcuIc9acaYqrBvHN2vjH9tLVXAyh8uNlOgJxUhTI3B7yRZu0P1DGhWEI2KUeJbeTMdzRCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4451
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

On Tue, 2022-02-08 at 11:02 +0100, Marek Vasut wrote:
> On 2/8/22 03:41, Liu Ying wrote:
> 
> Hello everyone,
> 
> > > > > There are many blank areas which are undocumented, this LCDIF
> > > > > CRC32
> > > > > feature, i.MX8M Mini Arteris NOC at 0x32700000 , the ARM GPV
> > > > > NIC-
> > > > > 301
> > > > > at
> > > > > 0x32{0,1,2,3,4,5,6,8}00000 and their master/slave port
> > > > > mapping.
> > > > > The
> > > > > NOC
> > > > > and NICs were documented at least up to i.MX6QP and then that
> > > > > information disappeared from NXP datasheets. I think
> > > > > reconfiguring
> > > > > the
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
> > > > > for
> > > > > i.MX8M
> > > > > Mini available ?
> > > > 
> > > > No.
> > > 
> > > Can you ask someone internally in NXP maybe ?
> > 
> > Maybe, you may try community.nxp.com, like the i.MXRT case.
> 
> The community.nxp.com is unhelpful, the i.MXRT case it a good example
> -- 
> the solution to the problem has been found by the person who asked
> the 
> question on their own, and elsewhere too.

AFAIK, there are questions answered by internal support team and RnD
team at that community.  I personally take it as a resource to use. 

> 
> But note that the i.MXRT interconnect documentation is available in
> the 
> i.MXRT datasheet, which made that possible in the first place. On
> i.MX, 
> all that information has been removed from the datasheet in i.MX7
> and 
> i.MX8M, so I cannot even help myself, even if I wanted to. This is
> very bad.

I'm not familiar with the documention in that area, so I personally
will not be helpful at the documention topic.  The main purpose I
jumped in this thread is to review the patch and share the idea to use
the existing drm debugfs crc support instead of creating a sysfs
attribute.

Liu Ying 

