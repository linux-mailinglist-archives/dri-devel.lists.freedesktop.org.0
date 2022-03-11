Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 147C74D5883
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 03:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D0710E194;
	Fri, 11 Mar 2022 02:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2108.outbound.protection.outlook.com [40.107.93.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0EB10E194
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 02:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7ccDClAgKc9vlnKjnVSp6NRLUzYCMdFtMN9WCHaA1hfatDfdUlEsq5hgWzfboYq6ooAcJllYOrnhBmcslNNTimZSy61hJTzHm/os1TNxRMhe44Dh5IaPR8KxNwcxG3bk9rdK/ol6/LjVfmoveuoIb6RrXGe/hbKeyJLfWorDRXAfzHMVi9EduxUzmwX2Syg47uecUwH0+NiGTLMwk7NyY6x/vA27yOf5egrc7q2csKwdiRyzUzABeWeqUYiPMW1U/ftlnOzcohX5RPrt/5n5np96VKuCL9hYC5mA+sswqLB2w6+b3A7pPj2iETj8auw6NHGqLw7zYsyBi5HpoF7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrAza+H9OQauIgcpZ3DptTzuk6KsqPAa0/wBiYcBQJI=;
 b=D5GLJlOHwBUEQDdIOBut1r8YRrL2x8xjZrUAcUyzN1NKQu/u/vIWqrpTN17Lsprf1zCdWEUaQe2xEdbq3ySk0gRdo7NuAR+HU/rkcnoKsuzto6ZU5ciBdThkuCbZ3o4DjG8ct+suX/TbV5XxLXIssDIr8ix3QFqnRGyIG1xCJFR+ECUlitmt490faybfyp7wq5gb25u3v3J1gK1ZHjeXDJeCs6uIdYx4ztmBlZ1aoaflq57RoflXppc4MANm8u8pUvdLrTmYg5RVO3VMaV8eKSq7gSSM3LMa5i8YVdpBuTXBf7Rmk+2ZLF4fBb6c47j+nkwseVxnBTQEO7w5eVIqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrAza+H9OQauIgcpZ3DptTzuk6KsqPAa0/wBiYcBQJI=;
 b=P6ekXV1b5dve+14Ez9rbPFDCsaVhpESMxDLLk+6jJXUx5nTVyGn5fTyMJiWVCoXi27wvw6sh5KdgWyt2+kZOBuwT8sk+qXd5o0Mi/Qr7fPSsckwQmtp1gYrMdklagioaewiGRf2H1XyQDIMN+1/EK7qRpczUprIyQpRglGGqmg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by MWHPR04MB1200.namprd04.prod.outlook.com (2603:10b6:300:75::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 02:59:28 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 02:59:28 +0000
Date: Fri, 11 Mar 2022 10:59:20 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix not correct get property counts
Message-ID: <20220311025920.GA1346668@anxtwsw-Precision-3640-Tower>
References: <20220310091653.1298588-1-xji@analogixsemi.com>
 <YipJR6ERQM598/XE@ravnborg.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YipJR6ERQM598/XE@ravnborg.org>
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cf39a02-f025-4d84-389d-08da030b27f4
X-MS-TrafficTypeDiagnostic: MWHPR04MB1200:EE_
X-Microsoft-Antispam-PRVS: <MWHPR04MB1200A77A95131A13717C3788C70C9@MWHPR04MB1200.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IY+YszQAW01f3Z+l0KO4ZBOu/5kI5LdbABTNB3oSUiVpyw+FsMWBBq8/KCRZTEyFYoqbHIC0a/87w5Ub7Ym917wpIRNv8pmTTrIKhp+pvKI8PgSzkQ1Ie5LmF4xOjgJrb0ZEGOH27UnUdExRj9J6yDKJdsDccgt2xGCuy0Q0idjUD7mlfWGToa/Wx3rRNKrqd+n4GLjG/tQ55Oz3ppmwPkMrUOy5RskZdTsENqYkWlMfpYqaTXoHEqdK9jMbjS97rwCoqUNILOPU+cKc80+f7CPIdLBCBHaOvHtUrwoGf36AI/jlnmAKAS6mPogiZN0ASq98n+EYAStzpBPMgaoWg3COETVo2qCPFa1CalVAtkWthfeu1fC2FMf7fqD7d4UXF2C/pmX4uEXdH96E/jadNXLmWu8KzJgME4MeG6qVSl2OeCCsOgjrWYEP0LP6Y6rDKURGX1L9guf7fQtoN79Jyaoe57I7nqHjF34wqO6r9b2C299chfXCaVq6QDnYBF0VXzl18WZSWq5LMdAVDY/NKAZyiLigkPyvR74CYXo5G5BeJ9Qvsm9QCv0hSIiscax3cqXFb1hZmLPn3K2te41Bg6QGQE/9UoxFQFrokpnCBLRB4794UYuPvU0WFC7a3kMGLUdjo0cDuCBckJMkuBQAYwkjL59dlhZKzoRzOVbcKjhOSnZ3+dUvHZTdGrdiTunks1W9kkYjcpGQke7xF72I1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(2906002)(54906003)(6486002)(38350700002)(38100700002)(55236004)(52116002)(6916009)(6512007)(6506007)(9686003)(66946007)(8676002)(4326008)(66556008)(66476007)(86362001)(33716001)(6666004)(8936002)(1076003)(107886003)(508600001)(5660300002)(7416002)(26005)(33656002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zy6+8l14rm1ed/5/vxLMSe4AM9vp+lSF0F/jvJeycm9ti0eWPcmC8jsiMKi7?=
 =?us-ascii?Q?p23lTFlG+ExEjMze9ggI8NH8gHr+7kYr150KCj4IkVMrPQhP1DEgp+Obr6i8?=
 =?us-ascii?Q?p9HA0G0dcREBekDMkumrBEwbOhvNAOOSE7y84ckz8nQ/4yMpBa3oClFxrO/A?=
 =?us-ascii?Q?vTV9T0oQqtdPGKqvzt+v8RMLF5hFCVnTP2vjcl7NnrQV4Mw2pzqOuIV4vgZ8?=
 =?us-ascii?Q?5HcvGMbkGqmI11pqStqSh0VfqOurAUrDqsi8w9+vrgbhF0H1XoW1QFHZkqeq?=
 =?us-ascii?Q?9L0w/Mf77UA9L3fFr1NumUXOyrpZFGA8WcKNm2YfAd7ZyOnSvnzXTC4SdhC0?=
 =?us-ascii?Q?8XKsPYctzYFbg3RtJfv+wbrq2KMe6JY1Nt5Umb24eSlmykq16UIeNFx5Bi/c?=
 =?us-ascii?Q?k/E+aOFvN0NY9ijL8iNi7B3laQldq1J0qCbLaOSAYYxw46U6eQpELS6hH0g3?=
 =?us-ascii?Q?WE2vnvhXIVN9g6T6beNVYGBj57aA3Z40LltMWbCTjJp7+Gnzu93+ElfQxEcA?=
 =?us-ascii?Q?9LbUnNNEaEMkwg5Wd/wnFbJ6svorsqIaHOwQYE0iiajfrmdNsCtxLnniZk6H?=
 =?us-ascii?Q?4j/6OcJCY6CCIqUBlCzPCZeem89983ot9nWthQkQNVuCrAqm4vmGBZIjktPi?=
 =?us-ascii?Q?tv6e7ZGCzUvcq42wKXhcb8t0efgiLeOwWyn2rocU747j46sWEKTP25O1YLlP?=
 =?us-ascii?Q?zHpIwgjGEN2sV1yXwuX4uzGEPkGijEp2QACPg52o2eGt9T3Dr7R7YYt49Kby?=
 =?us-ascii?Q?WG43myooovjeAje/RpOrxkERrIfS1oIXnHMaw2qGxDQEdKHhPR32EScH3kHu?=
 =?us-ascii?Q?GkNxbEEu5DeDovjuwEkdl4Tz1Liqg/JguZX/1XibpGuUUKo3RSpt2i6OlAni?=
 =?us-ascii?Q?ZwJ68/+ZcfSzCBT3ZxwS7/8+hR5uFdd8TS1thRwoetnBjuyc4y/NV4VMloYf?=
 =?us-ascii?Q?pL7Wz272B31aQR7DSNNvyDxN5aAb4iqPb2bea7u7UdiVWA3a6bm5x7Y9MzXk?=
 =?us-ascii?Q?rR28fYod6vWL5oitv+APTBnurhbhScRsWGXNvx/fnFl3v/imc/mhLDQABDAY?=
 =?us-ascii?Q?hhqy1mQfOsv7F6UMSQ3Q4pXxejmt/txKYl+vtpAtLtBr2TzEwSUaDzi2jAQ9?=
 =?us-ascii?Q?uubqnmLhYPl5/MCYV9S1oXn9bmXhxPcm9tdTXgsBGUW3MYxRxn1S5Jd0JTae?=
 =?us-ascii?Q?O7BtqtcNVt6lLA9/ROngQ3ZAUaFF4Y6YNPCtimRWsy0BU3hBGNdvH7bwfl4N?=
 =?us-ascii?Q?3xXczsu0vSaUSGDPJsOZURmDwx6jYacpm7C+by/NfMMNRemf03mDecQM+S7X?=
 =?us-ascii?Q?8kZvmQqVVornv55HY3q/5jyt5v8jHLnKwPQNrLp8DyfiQbv9wT+ZAUgmDRmT?=
 =?us-ascii?Q?EMx4w+7WPrqTXJGsSdJNwsbhW2k10C+DuSGqoVfKG+wKZKChmGorrzpzplvZ?=
 =?us-ascii?Q?4kYKqZUO7Uefd7hd2rx1R2FW+j71VqIO?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf39a02-f025-4d84-389d-08da030b27f4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 02:59:28.0729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBOn88w6jrbmfpYhvJBrbWwxm3PYqZSkYz556yCpHIq6hmH7obStjtTzZtE6vhQMqGAOdVjdvupDjAvPcLonKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1200
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 mliu@analogixsemi.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 10, 2022 at 07:53:59PM +0100, Sam Ravnborg wrote:
> Hi Xin,
> 
> On Thu, Mar 10, 2022 at 05:16:53PM +0800, Xin Ji wrote:
> > The property length which returns from "of_get_property", divided by
> > sizeof(int) to get the total property counts.
> > 
> > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index c6a9a02ed762..87081d5b408d 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1594,6 +1594,7 @@ static int anx7625_get_swing_setting(struct device *dev,
> >  
> >  	if (of_get_property(dev->of_node,
> >  			    "analogix,lane0-swing", &num_regs)) {
> > +		num_regs /= sizeof(int);
> 
> Since the property is an array maybe use: of_property_read_u8_array()
> 
> 	Sam
Hi Sam, OK, I'll use it to get property data.

Thanks,
Xin
