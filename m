Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E9D3E0F81
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 09:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BCB6E222;
	Thu,  5 Aug 2021 07:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2100.outbound.protection.outlook.com [40.107.101.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D196E222
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 07:47:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFAXzBRHe8TB7NuWhzhT3kfhuKw/59iNB8iVUD35gynaqcbBh4TLfdYp/CmwI+SACT3zWw876NFRayrwsFFakT10I9r8eGy/S5bimbdmD2Q/x87n1gTYTwTG7NjsAke+o18e9qCGFlRjaAYSRYxZPnPUG97eed3Ag3tFUv/mH5nVRgUUeP/NrPB0rWRJVLI5F4zjd+gkSSoyh4rYz90aQXZ1jOItjk3FwE1/DLk0I4xdckTJXGc1H6bexjxm5ZKdus/Xj69GGICSdnWcWJzvyLG6xEGUxuMuCFxJF6cj+aELMkepyX7F0LIarkzPYXRRmsAfxCrSKGOR9RGJUDk3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtGqRsHqrNkQuNiL4Y45Oc36aolR1QA/zELRLGD/r/o=;
 b=L1/yCFCA9TIJGEp6EAidN0pwlBdPQv2yrybSmN8Y+BjcexCy+GmiaeaQ6uqsT3Yl0BJmrb90oFcspFFWWkDiJp7dfUcOKuHmzb9rTCZJ5tyMzYyHeu7/Oh6hzpD8cwAlj3QBLjXgWjviSAvc6nHUT9Y8olW2LkUGRVbWf5eH33LPc2OSXLlskjTewjrRtrjsJHq9T9GC62l70BuFHXR6MwSwqeGftJEij8u8xL1JMvoVn1XCUsb5CYQdA75dCgbFGDqEcIedZiOL8ZwkHvgW82M8lIf29nhLitq8Z5yGrX1Wcxq99jDWO6SIgSfRzmNYWV05MZnjWogxXWjv5e3cFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtGqRsHqrNkQuNiL4Y45Oc36aolR1QA/zELRLGD/r/o=;
 b=z+nllYobbZ7hGvcWcy9IgMmGpQQZ7gvRphe+PGkbi3pFqzLzQJCbrn4NJIKqO1AgtG+E6cKGqlSLS9azQGRFB0DIRDVOn+mvS3cGzdTZQqgVGUJOUtsbhyjXZPP0i6WiOCM4LVU+xmDZQr40NxXHy8LsGwZ3BldmyiYZHAhvPVo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7631.namprd04.prod.outlook.com (2603:10b6:a03:326::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 5 Aug
 2021 07:47:42 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 07:47:42 +0000
Date: Thu, 5 Aug 2021 15:47:37 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Nicolas Boichat <drinkcat@google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>,
 Zhen Li <zhenli@analogixsemi.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
Message-ID: <20210805074737.GA2019639@anxtwsw-Precision-3640-Tower>
References: <cover.1626685856.git.xji@analogixsemi.com>
 <85126d087cb045ea5e00a5100fc7d81840744a68.1626685856.git.xji@analogixsemi.com>
 <YQL8qLpN41ocV9N0@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQL8qLpN41ocV9N0@robh.at.kernel.org>
X-ClientProxiedBy: HK2PR03CA0043.apcprd03.prod.outlook.com
 (2603:1096:202:17::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR03CA0043.apcprd03.prod.outlook.com (2603:1096:202:17::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.5 via Frontend Transport; Thu, 5 Aug 2021 07:47:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 195759da-947f-4df1-866b-08d957e54e64
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7631073091414F65B9EC1B68C7F29@SJ0PR04MB7631.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggvxV7fddbhO9ZfoW5Wumo1jSxJxyf9/iEcrKKSaHK2dI/5oLz5V95QaZf5trrrL7sJoemX84Pm3Gb9Fi5AlL8tey/kBSnO5+dFonQgTtM98vanoJ6oacIL//URmvIdd/w5/eAZULKp2gqsuL28+7H+t03O2UC1B3A3i/dl4CeDUoE49LkjGkeBDV7i9ZRnNdOpfLMY/oZ8zpMSqXU0TEd3bGG0590NJm7gEQnz1vWe0L13ouOG+ug6m4bzx6Sv0thb2jZ2669kdSXAB0rPcbKu6p90fAuEWR/qUEcQSeD5zpVf+gadV6f3MaGFrc2uOnnp8aMZVAEeMPz7WPP9pO0IQEMhExWYsj0svfBubfjfvVmU1U0oh5fQA3N+tjWgpFZBDlZdndWVM9RE4PaF0YbVQJVOQnRggSkMADpKLVDAPKbs4wmkVmarziduCtHusRuV3wU3wLCwZhvPsX2gtJHT5zEIo4UMtZGVgbjMF7MtYUcFFNBlVdGI5L0WWJHDDqrc8SG+v58PnBPfLKhRQmCCFHRgI1ctE5CsD92iGL97ZSTw3Ih07tdMgFGaiF61i0BYMor8CdJbr3fj5CpRRJGZkDBklBeZMlPJK14B7DbT0m6+vFHWQx3gyqjM2yAsKx3bY8xBqpxnMu+X7MWy3XNZTCWpocDt/jCtuktk5t5U98LClErOtSNFKP/kmLKOHXZToH9YMW5cD/fyTs0FBHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(6666004)(6916009)(83380400001)(52116002)(6496006)(5660300002)(66556008)(33656002)(38100700002)(55236004)(86362001)(38350700002)(4326008)(8936002)(33716001)(186003)(66476007)(66946007)(316002)(1076003)(508600001)(956004)(26005)(9686003)(7416002)(55016002)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?piFu50jyOzVeESuA62XnxRsa5rY7Ssnmf/+Ki2pxvi6KzXiXgtOsY2qc4vyH?=
 =?us-ascii?Q?JITnu5JfDfXJSYKRDcTEikhU5HeGXYIC0aDm09saHMRuNgrMPpzrAxS5p6iv?=
 =?us-ascii?Q?aKtiXxNgA7CKrAl2LrAbvciExt91NYCEvA8uMe2HltxwTL8lOZ6f50z5iyLG?=
 =?us-ascii?Q?Z/2a0QKLC//em+lrUeEQ9g4j8HJVdLDOSkeXsCnHLElGYNgpYi6Ost5Wq2II?=
 =?us-ascii?Q?tkH1ccMDoU/KecxsGM8lX5Iitt0CPtkyp+0oPR+cXcKKH9CS+kdOYJySo9b9?=
 =?us-ascii?Q?EtFnJS0xQQtgUVEbfW8+XUJKpYydH74k74zwU7Mh1KRNpaVcRb1v2i62872s?=
 =?us-ascii?Q?oDZBfRqNzTNhbgiFjfwrVoXfwFc0+lgFZ435dlevwdWQauNScf73rqI0BXyo?=
 =?us-ascii?Q?JHbIcKy+NU9Wvg+pLs5tAlJNiONsEr+y0AqwtF9Jlvp/zJvINNt1HIhoYP00?=
 =?us-ascii?Q?qmZPKoZfifHArX9APYtnZqsm7tNI9nWOLK6W0dLb/PlL27QrV9fAQshQY4sq?=
 =?us-ascii?Q?7T4VWG4alWj4NbWCSrChj2vNBa0NugFEJSqENnuiL86aknL0+4WZcvK6yHLc?=
 =?us-ascii?Q?FOAgGJge44cTBjH+6M5yxuXi1Y7+rJxen3CUCS2dkhVtqHULjW6sGJIA1X9m?=
 =?us-ascii?Q?capFE9+JY2JGMIJW3r1s7176tJJyZeh7gYCiX8Q0frv+L8WPLYAbSLfiUgcL?=
 =?us-ascii?Q?ebdHTcUx9TamDQn2laPyItZx92whsKKZ8By7m7ghHs8j4RTCgThQgEwb6EB/?=
 =?us-ascii?Q?ho96EGHFNvxYZC9dRooUk/TbbPTD88FRlljU7jG7SmM+9feeobn1J7G4HD+1?=
 =?us-ascii?Q?G4F0t2It+RMzmlivw+u1gyUnDnwPPxHi+CMxVgnX62uthvUvnJ1dm/wcV32Q?=
 =?us-ascii?Q?UPdX1okWnLGcVuPn5+p77wVD/r6IAWHTRwlNNrHiPWPKbRm5FaYs8RAnSJl5?=
 =?us-ascii?Q?9XFxs9gaICCwLP4kdOLJCAIwDSSfTr9xeY+6x3koJO+iT2/eTOfyD+xcLUQX?=
 =?us-ascii?Q?2juBrFbFnSPGLrBGcAnXGwmta6w0V5z92i1fNEVRopQNZ2q1zaItivd+8Ftk?=
 =?us-ascii?Q?ks8ImEtvsmLu/+vdGXOzlzYen+shCS10ZnEGhhIwDupvNsGH4atXEwCWIKVd?=
 =?us-ascii?Q?H3yDcWCJSXIVBHBtv/tLSEFfbzhdlulEaoY2gsjRr5CyW0w1q6DWnvv8u6OM?=
 =?us-ascii?Q?ZDUtb/Z/Q+hnFotrsGv5I880v8Irw961uygBAZokFALfUW833Pcn1UCMuvEi?=
 =?us-ascii?Q?CZnDK9pT8ZSi2cLk3orqERe4sj51ZMW3OjTlcIY6FuRuJ4blenuDX++imZET?=
 =?us-ascii?Q?GX9wFR8yJyMBhwT24CXj1nvT?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195759da-947f-4df1-866b-08d957e54e64
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 07:47:42.7956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Qw8uB1qgCbMt7b846XCLFDmobkUn+PZLz1SQukFnvDtx35Cxx7L6LyH9P5naMO2Co1RvKySvIVW/wRiwjHFGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7631
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

On Thu, Jul 29, 2021 at 01:08:24PM -0600, Rob Herring wrote:
> On Mon, Jul 19, 2021 at 06:10:09PM +0800, Xin Ji wrote:
> > Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> > lane1 swing register array define, and audio enable flag.
> > 
> > The device which cannot pass DP tx PHY CTS caused by long PCB trace or
> > embedded MUX, adjusting ANX7625 PHY parameters can pass the CTS test. The
> > adjusting type include Pre-emphasis, Vp-p, Rterm(Resistor Termination)
> > and Rsel(Driven Strength). Each lane has maximum 20 registers for
> > these settings.
> > 
> > For the DP tx swing setting, each lane has 10 different combination for
> > swing, as Pre0: swing3|swing2|swing1|swing0, Pre1: swing2|swing1|swing0,
> > Pre2: swing1|swing0, Pre3: swing0.
> > 
> > Register definition as:
> > [Boost_ctrl]
> > These registers control post cursor manual, increase the Boost_Ctrl
> > setting can increase Pre-emphasis value separately.
> > Lane	Condition	Register address
> > Lane0	Swing0_Pre0	0x7a:0x00 bit[3:0]
> > Lane0	Swing1_Pre0	0x7a:0x01 bit[3:0]
> > Lane0	Swing2_Pre0	0x7a:0x02 bit[3:0]
> > Lane0	Swing3_Pre0	0x7a:0x03 bit[3:0]
> > Lane0	Swing0_Pre1	0x7a:0x04 bit[3:0]
> > Lane0	Swing1_Pre1	0x7a:0x05 bit[3:0]
> > Lane0	Swing2_Pre1	0x7a:0x06 bit[3:0]
> > Lane0	Swing0_Pre2	0x7a:0x07 bit[3:0]
> > Lane0	Swing1_Pre2	0x7a:0x08 bit[3:0]
> > Lane0	Swing0_Pre3	0x7a:0x09 bit[3:0]
> > Lane1	Swing0_Pre0	0x7a:0x14 bit[3:0]
> > Lane1	Swing1_Pre0	0x7a:0x15 bit[3:0]
> > Lane1	Swing2_Pre0	0x7a:0x16 bit[3:0]
> > Lane1	Swing3_Pre0	0x7a:0x17 bit[3:0]
> > Lane1	Swing0_Pre1	0x7a:0x18 bit[3:0]
> > Lane1	Swing1_Pre1	0x7a:0x19 bit[3:0]
> > Lane1	Swing2_Pre1	0x7a:0x1a bit[3:0]
> > Lane1	Swing0_Pre2	0x7a:0x1b bit[3:0]
> > Lane1	Swing1_Pre2	0x7a:0x1c bit[3:0]
> > Lane1	Swing0_Pre3	0x7a:0x1d bit[3:0]
> > 
> > [Swing_ctrl]
> > These registers control swing manual, increase Swing_Ctrl setting can
> > increase Vp-p value separately.
> > Lane	Condition	Register address
> > Lane0	Swing0_Pre0	0x7a:0x00 bit[6:4]
> > Lane0	Swing1_Pre0	0x7a:0x01 bit[6:4]
> > Lane0	Swing2_Pre0	0x7a:0x02 bit[6:4]
> > Lane0	Swing3_Pre0	0x7a:0x03 bit[6:4]
> > Lane0	Swing0_Pre1	0x7a:0x04 bit[6:4]
> > Lane0	Swing1_Pre1	0x7a:0x05 bit[6:4]
> > Lane0	Swing2_Pre1	0x7a:0x06 bit[6:4]
> > Lane0	Swing0_Pre2	0x7a:0x07 bit[6:4]
> > Lane0	Swing1_Pre2	0x7a:0x08 bit[6:4]
> > Lane0	Swing0_Pre3	0x7a:0x09 bit[6:4]
> > Lane1	Swing0_Pre0	0x7a:0x14 bit[6:4]
> > Lane1	Swing1_Pre0	0x7a:0x15 bit[6:4]
> > Lane1	Swing2_Pre0	0x7a:0x16 bit[6:4]
> > Lane1	Swing3_Pre0	0x7a:0x17 bit[6:4]
> > Lane1	Swing0_Pre1	0x7a:0x18 bit[6:4]
> > Lane1	Swing1_Pre1	0x7a:0x19 bit[6:4]
> > Lane1	Swing2_Pre1	0x7a:0x1a bit[6:4]
> > Lane1	Swing0_Pre2	0x7a:0x1b bit[6:4]
> > Lane1	Swing1_Pre2	0x7a:0x1c bit[6:4]
> > Lane1	Swing0_Pre3	0x7a:0x1d bit[6:4]
> > 
> > [Rsel_ctrl]
> > These registers control resistor compensation manual, increase Rsel_ctrl
> > can increase the IO driven strength, increase Vp-p simultaneously.
> > Lane	Condition	Register address
> > Lane0	Swing0_Pre0	0x7a:0x0a bit[4:0]
> > Lane0	Swing1_Pre0	0x7a:0x0b bit[4:0]
> > Lane0	Swing2_Pre0	0x7a:0x0c bit[4:0]
> > Lane0	Swing3_Pre0	0x7a:0x0d bit[4:0]
> > Lane0	Swing0_Pre1	0x7a:0x0e bit[4:0]
> > Lane0	Swing1_Pre1	0x7a:0x0f bit[4:0]
> > Lane0	Swing2_Pre1	0x7a:0x10 bit[4:0]
> > Lane0	Swing0_Pre2	0x7a:0x11 bit[4:0]
> > Lane0	Swing1_Pre2	0x7a:0x12 bit[4:0]
> > Lane0	Swing0_Pre3	0x7a:0x13 bit[4:0]
> > Lane1	Swing0_Pre0	0x7a:0x1e bit[4:0]
> > Lane1	Swing1_Pre0	0x7a:0x1f bit[4:0]
> > Lane1	Swing2_Pre0	0x7a:0x20 bit[4:0]
> > Lane1	Swing3_Pre0	0x7a:0x21 bit[4:0]
> > Lane1	Swing0_Pre1	0x7a:0x22 bit[4:0]
> > Lane1	Swing1_Pre1	0x7a:0x23 bit[4:0]
> > Lane1	Swing2_Pre1	0x7a:0x24 bit[4:0]
> > Lane1	Swing0_Pre2	0x7a:0x25 bit[4:0]
> > Lane1	Swing1_Pre2	0x7a:0x26 bit[4:0]
> > Lane1	Swing0_Pre3	0x7a:0x27 bit[4:0]
> > 
> > [Rterm_ctrl]
> > These registers adjust 50ohm impedance of DP tx
> > 00:55 ohm
> > 01:50 ohm(default)
> > 10:45 ohm
> > 11:40 ohm
> > Lane	Condition	Register address
> > Lane0	Swing0_Pre0	0x7a:0x0a bit[6:5]
> > Lane0	Swing1_Pre0	0x7a:0x0b bit[6:5]
> > Lane0	Swing2_Pre0	0x7a:0x0c bit[6:5]
> > Lane0	Swing3_Pre0	0x7a:0x0d bit[6:5]
> > Lane0	Swing0_Pre1	0x7a:0x0e bit[6:5]
> > Lane0	Swing1_Pre1	0x7a:0x0f bit[6:5]
> > Lane0	Swing2_Pre1	0x7a:0x10 bit[6:5]
> > Lane0	Swing0_Pre2	0x7a:0x11 bit[6:5]
> > Lane0	Swing1_Pre2	0x7a:0x12 bit[6:5]
> > Lane0	Swing0_Pre3	0x7a:0x13 bit[6:5]
> > lane1	Swing0_Pre0	0x7a:0x1e bit[6:5]
> > Lane1	Swing1_Pre0	0x7a:0x1f bit[6:5]
> > Lane1	Swing2_Pre0	0x7a:0x20 bit[6:5]
> > Lane1	Swing3_Pre0	0x7a:0x21 bit[6:5]
> > Lane1	Swing0_Pre1	0x7a:0x22 bit[6:5]
> > Lane1	Swing1_Pre1	0x7a:0x23 bit[6:5]
> > Lane1	Swing2_Pre1	0x7a:0x24 bit[6:5]
> > Lane1	Swing0_Pre2	0x7a:0x25 bit[6:5]
> > Lane1	Swing1_Pre2	0x7a:0x26 bit[6:5]
> > Lane1	Swing0_Pre3	0x7a:0x27 bit[6:5]
> 
> All this information should be in the properties description. But the 
> above form is not all that clear in defining how to fill in the 
> properties. You need to describe what is in each word of the properties 
> and assume the reader has the datasheet. 
Hi Rob Herring, OK, I'll add it in the properties description
Thanks,
Xin
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  .../display/bridge/analogix,anx7625.yaml      | 55 ++++++++++++++++++-
> >  1 file changed, 54 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index ab48ab2f4240..77b160d7c269 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -43,6 +43,24 @@ properties:
> >    vdd33-supply:
> >      description: Regulator that provides the supply 3.3V power.
> >  
> > +  analogix,lane0-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 20
> > +    description:
> > +      an array of swing register setting for DP tx lane0 PHY.
> > +
> > +  analogix,lane1-swing:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 20
> > +    description:
> > +      an array of swing register setting for DP tx lane1 PHY.
> > +
> > +  analogix,audio-enable:
> > +    type: boolean
> > +    description: let the driver enable audio HDMI codec function or not.
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >  
> > @@ -50,13 +68,43 @@ properties:
> >        port@0:
> >          $ref: /schemas/graph.yaml#/properties/port
> 
> This needs to be #/$defs/port-base instead since you are adding child 
> properties.
> 
> Also needs 'unevaluatedProperties: false'.
> 
> >          description:
> > -          Video port for MIPI DSI input.
> > +          MIPI DSI/DPI input.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +              bus-type: true
> 
> All the possible bus-type values are supported by this h/w?
> 
> > +              data-lanes: true
> > +
> > +            required:
> > +              - remote-endpoint
> 
> Drop this.
> 
> > +
> > +        required:
> > +          - endpoint
> 
> Drop this.
> 
> > +
> >  
> >        port@1:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description:
> >            Video port for panel or connector.
> >  
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> 
> No additional properties, you don't need this reference or the rest of 
> this addition.
> 
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              remote-endpoint: true
> > +
> > +            required:
> > +              - remote-endpoint
> > +
> >      required:
> >        - port@0
> >        - port@1
> > @@ -87,6 +135,9 @@ examples:
> >              vdd10-supply = <&pp1000_mipibrdg>;
> >              vdd18-supply = <&pp1800_mipibrdg>;
> >              vdd33-supply = <&pp3300_mipibrdg>;
> > +            analogix,audio-enable;
> > +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> > +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> 
> If the values are only 8-bit, then make the type uint8-array.
> 
> >  
> >              ports {
> >                  #address-cells = <1>;
> > @@ -96,6 +147,8 @@ examples:
> >                      reg = <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint = <&mipi_dsi>;
> > +                        bus-type = <5>;
> > +                        data-lanes = <0 1 2 3>;
> >                      };
> >                  };
> >  
> > -- 
> > 2.25.1
> > 
> > 
