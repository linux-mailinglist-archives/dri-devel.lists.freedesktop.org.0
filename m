Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB977ACF93
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 07:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA87210E04F;
	Mon, 25 Sep 2023 05:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95D810E04F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 05:47:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWXJJLdmNrAJqeS+NK2GpXQ+HCsUvq3CnhuaV6gkc4uv23tvehus4c/fx/kAio/AyoDYkoC0tETkQw/wYiDV3kdK+TOahnt0rzdTPZ+ciEl3PJuLgwRxwXjSw4+NFognTkPx9eHdMBXu6LIJAVK7gLma13/Bo5ZGcAk3ewvpWK+ZVMTJXBLIONEV7HfGWON4UKcKZe3SVBMJSIZSxBFj92CvIE9/cw3aY0s0Z76dAoF5wWUb3Y927WscST5XtKBcG4QQ8sX6M+fyQXVTqNlxWpGSIKpouhhmJo+mcgpi8r7oXSqrxT0Fo7qzc86iSycB3hHK7DnbWdwSXmvPDLgzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdS8oolXxuY6oeaysw63nDJ4PurPUcAlhbipGAH/ROY=;
 b=OMGZuJZ0GkYkjWAN96PyMhXIJnZSydnIxACELwIc3Ii+GXrt5lCGrl9KkAIERcY0ihwMDvDq7AG87ntA8oPDqXG7bm8wD2GkK2wiZXOptFVWHNI1C0zorQRta85oSYpYLbVrVdsBKBVq/+iyx1zgliLUpByIw4k+Eu6AHAwqjMsuBSfUf40Qeg0hjpdPW6qvR3905hmFaZGEI5P2Qek1Vj1+BqkqEDrCIJ/i2mEbq6ZGC2gOfNEQe+/k4KbemrXd/QKIhdKSiMjaIkXfAhOl1OB3yMxi5n0C+Ak/Hh7FQ7QVVi1c+GD3S9r51OgIRRe2R19aS3hXNuZyaFNlWHegAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdS8oolXxuY6oeaysw63nDJ4PurPUcAlhbipGAH/ROY=;
 b=VBMWB8n9tuNaJXi8z2oh+0T6q54maBL5YSCQj7voX2c8NwJoNCCwabW5/nc9K58XjohnqBfI1MPIKsJep4j0G9VHVC8S6FHw8AeCEOHe4hsyBIC71YZqqhJNMkvbwnKKxnNIetjH5XjhmZX6/21rgj+31cZeIR9ae/JhyBudX28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by AM0PR04MB6803.eurprd04.prod.outlook.com
 (2603:10a6:208:187::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 05:47:15 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad16:42a5:193f:6396]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::ad16:42a5:193f:6396%7]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 05:47:15 +0000
Date: Mon, 25 Sep 2023 08:47:10 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFT PATCH v2 01/12] drm/imx/dcss: Call
 drm_atomic_helper_shutdown() at shutdown time
Message-ID: <20230925054710.r3guqn5jzdl4giwd@fsr-ub1664-121.ea.freescale.net>
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.1.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
 <20230922075610.ekrzyz6hfcd3rjsm@fsr-ub1664-121.ea.freescale.net>
 <CAD=FV=ViV-n2T1Bup+XScsWD11yWpTmW3qEOLTTDj3kTtTY4Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=ViV-n2T1Bup+XScsWD11yWpTmW3qEOLTTDj3kTtTY4Cg@mail.gmail.com>
X-ClientProxiedBy: AS4PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::8) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3902:EE_|AM0PR04MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: b5af0833-938e-4298-9709-08dbbd8adecf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dmGQ+pxrDOUZgGqy3/DWoRKETynWePi7PF4MzGDFsGgjlS7hX03Z7hO/dOn5t9I5pqXBITdaetYYiG9F9PAg8mHDgXr7+LDiAcyyhEKr3kaPZUtfN8ZCXrNRfI3CPZ/sPnJeqKHD8yaaFf49hVzoKuG66n9/aHmftkI49tXC9vF9kd8zZcGm4UhJ4aEsuiZNF89WMvJvH7Vct0kzfvcnhr6/lnCwvilR5eSaon9xua0aoIam7VW2IJmbRcmeAWDfdKLRJhlsZEKQ4hLnWWyyCNRx6RiYUFg/Ud+75xPKylxTend+OKve2ibPc4rT/EfEn8ouhkSxIY0g2PqWLKrBzRd7wu3F/sIFSQYYfQgT5hbGmCCQjLOHmjf5x2m0U5BrLAKGmP3Wkh82vqc0GAQLehrxHnyXkWCPInLG+LSFX9cgyWwJ/KrUWlfnEx7IoyciXPXMNblMHRQaOXRQQDa2S245ht0a4OeEfoda6LmS4jpUINNHmccpsI2JiGFuI1B8MHagjD/ljliIuvBIA03i8jmJ2OUH65A/ZLJse7CtDhqLe/phVZuATQQYiJOUZ45T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(366004)(136003)(346002)(230922051799003)(451199024)(1800799009)(186009)(54906003)(2906002)(5660300002)(316002)(6916009)(41300700001)(44832011)(7416002)(8676002)(8936002)(4326008)(66476007)(66556008)(66946007)(86362001)(1076003)(6486002)(53546011)(9686003)(6512007)(6666004)(6506007)(26005)(38100700002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHJ5SnRKaW1jbHdhQTZiVXlPeHRTYlc5dzI3d1UxN25BRkM1dTVBYjYzaW5T?=
 =?utf-8?B?U1VtQjVxMkVIRTFFcnkwSG80OGFRMExicmJra2cyeGFCdjZISk1rNHFGVktD?=
 =?utf-8?B?TTRDV3ljNFBqMjVDLzd5TDQ5b1R4UVZsdFFybUVGQk9pRXFXZ1RkNmtVOWJU?=
 =?utf-8?B?VzdidlZYNTZ5MFVNZWpaUnI4cFZJSWFrSFdHRXlBbjlUMy95SkFmUTNNVThW?=
 =?utf-8?B?S2w3L3diNUlTdk96aXAraVJUUUJZaFgxQlJTYzAwNHRBUFZpZ2dyVVdFWGtF?=
 =?utf-8?B?bWpvVzd5R3I0MzNBVjhObVA5YXlkSTA0OFEreldockdEL0dMZTVva2lOcUo2?=
 =?utf-8?B?UmdWdlpVYTBJNUVoY0JqTENGSjBtTzNpVkFleGpvUG53a2lNV1E2R2dadURU?=
 =?utf-8?B?Vm90Z3FsaVVhNWVuaFlsMXZHZU01SVIxdEZPeHZsUGNiZzc1QVFEeEU5RUFx?=
 =?utf-8?B?TEhXS1B4akl1a1JtNzc4Uk56WGZCSHFHVkNCeEZXaFUyeEE0UGNJV3A3b1hj?=
 =?utf-8?B?VURsaTBsYVhRcytMWWxucmNDYS90R09veHVtbVNodVJMK2NPMW1oay9oQkhU?=
 =?utf-8?B?RklpenB5ZjlRcVcxYUxLVy9INk1EL0sxU25FY01qaEpxVFRDaFRSaFZBc09q?=
 =?utf-8?B?bmlMUHBiL0ZoZ3BkSUdVOWVWSXBlTGdnRGxrajJhTDNFZGtxV1RHQU1aTkd6?=
 =?utf-8?B?M1FUQ1QyRnFQQlBYUkYrZUFQWlJubXdMM2htaldwNFlOUVh6Q3EzQ1dTM2Fn?=
 =?utf-8?B?TEVxRjFJeks0ZjJzaVdVdTZvcmdwWXE3eEN2ZmVHdWYyRDhwRElQcGpxdVdz?=
 =?utf-8?B?QXBIQ0ZCbmdBbjVxUkp4dG5zRTNjak52WmFOSGdUajNBOXZ3OThhN3d5VFBF?=
 =?utf-8?B?M1FFMjRGNy9ZWVNORURLSFJUUFhFNlQvUWhEaDJBZVZ0azdaUjVmbWJJRzhU?=
 =?utf-8?B?UmFqTmlLTmJHUWpGenovU1gxUzBMU1B6TlU5UzlzWWNHak8rK2FSMXlhMnY1?=
 =?utf-8?B?dVdpNEtnR3JTM3F0TVRxZ2UxclpZa1BSNEU3bVJuK2pDQU11WkdnMm5QT05G?=
 =?utf-8?B?RjZYb2ZUNElNRVdmZERXMTZvK0x3bWZBemdLWm9wMC84c2F6RVBIR0JscUN1?=
 =?utf-8?B?TnQ0b2dWOW15Q0JDWVgxUVFRZ3BiVUx3emVqNW83WE9QZUdtMklQUnFSaHlS?=
 =?utf-8?B?SXoyV2dTZGRnTVJtb1hIdjFBTVdnS00yaFQ5YjI5NW5TbG1vNUVhaEliQ3hx?=
 =?utf-8?B?bS9FWFNzNHFqTEdNazZicDFHUkc3VVRtSXY3bVE1WDJlV1ZFRWdTejRmTk9k?=
 =?utf-8?B?ek1McDlWTWZUeVpNZ21Uai9WTGVoeWZmbVhrYlJKVjRiaTlSbDlyN29za3RT?=
 =?utf-8?B?bzI3T0xGNHNpQVBaMURIUndaS0dxbnpRZTNjK0JMMDZEckxMQzVnaXlvQmlJ?=
 =?utf-8?B?WitzdENZU2dSRXZDc0VvcDVMWGtqU2tzOWlrNC9uZUFjVndVM3hZd2xUTUtM?=
 =?utf-8?B?a2l5eUpnQU02QjM4cGZLTWhMT1lVZFR1bnFKMWYzQUhLbmhCWkh2clRjWjBP?=
 =?utf-8?B?UnVNcTAzdWQzQ003c2hrY1YzU2VtejJjRXJHcHgyZHdiOFlUc1hjaVR0VzZJ?=
 =?utf-8?B?NzNNQkZxdDQwYzdESDQyY05oOUxvQ3JtWCt5UGlBT1JEWVZVTzZVdW9hZXIr?=
 =?utf-8?B?S2ZtUExUdEphK1V5a205Q0kyRGw1MHVRZnM5aUdtdzRjUEZnTk5pZXBNYWk4?=
 =?utf-8?B?M1N0c3lBUUpzZ0k5MjRudnBUU3RHNUY2Z1huM0h5Z1JnRUpHeTFvaG54R0dV?=
 =?utf-8?B?UDVSZDRjRFRwSlNsVHpDNVRnTFI4dEgweDVRZm55SVMrWFVQSHE5dnhhYUdo?=
 =?utf-8?B?dUFnQ2xXczlia1J5VXQ1aFZKaUxndFlvNHdDdTI3TGMwb3ExM090QXFHQTNn?=
 =?utf-8?B?dkZDYVFLd1hkNUlpenVyZzdQbURGaWZGU2owT2kxSlFwQ1VGMlhYQXVldFRa?=
 =?utf-8?B?Ym1PMm5Pb3FvK084L0J1L0x5cGs1YVVib3F3bFUvQ3cwemlBOE4ycG9Od0xq?=
 =?utf-8?B?SFArT1lPM0czTk5KdzZ1TnNuUjhwU2duWlQ3d0xWS0F0WVFSSVM5VEtldVAr?=
 =?utf-8?B?MVJXdG1pN3NPTCt5ZlVEZEEzZzZ3NU5pTExKQ053d3RVdnB0WVR2cG8yREtX?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5af0833-938e-4298-9709-08dbbd8adecf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 05:47:14.6737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwyQLwX4lHlqgyA0/pMe+p2KhY3Fhj0OrnIjCXWOu51mdVlz7yGvAXRsFw8wr6BU5eGI5xYLhrZ5KAs61CFEMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6803
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
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-imx@nxp.com, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Fri, Sep 22, 2023 at 08:44:16AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Sep 22, 2023 at 12:56 AM Laurentiu Palcu
> <laurentiu.palcu@oss.nxp.com> wrote:
> >
> > Hi,
> >
> > On Thu, Sep 21, 2023 at 12:26:44PM -0700, Douglas Anderson wrote:
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > time. Among other things, this means that if a panel is in use that it
> > > won't be cleanly powered off at system shutdown time.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > instance overview" in drm_drv.c.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > No issues found on i.MX8MQ.
> >
> > Tested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> Thanks! Would you expect this patch to land through drm-misc? If so,
> I'm happy to commit it there with your tags.

Yes, please do. The i.MX8MQ DCSS patches go through drm-misc.

> If patches to this driver normally flow through drm-misc, I'm also
> happy to post a patch to MAINTAINERS (or review a patch you post)
> adding this to the entry for "NXP i.MX 8MQ DCSS DRIVER":
> 
> T:     git git://anongit.freedesktop.org/drm/drm-misc
> 
> ...which would make it obvious in the future that things should land
> through drm-misc.

Thanks, that sounds good.

Laurentiu
