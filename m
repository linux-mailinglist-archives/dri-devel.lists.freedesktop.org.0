Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF724975FC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 23:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A3410E295;
	Sun, 23 Jan 2022 22:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azon11021022.outbound.protection.outlook.com [52.101.57.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53010E4DB
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 22:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIaWVrbG4kxh3duSbFR9QKNYywQDUgvsqtq60zb7bK4q0eZKjarkolWWmsh9pgzqMQrwc53K6e9wlZgn24T/kf9tCWidRnsEiMfVCQYfj6TNEjbAqqbL7A0blI5bl95UThKUVzZrg15Bel9RVOOWQ1iZUOm0bNYoj75KqKuZzvM6oEd6VRdJ21BvFQ9VQjUXv3uIN1t8mxEjB+5V+7uUuPuQH134e/OZ1avXj32/BhaJgihPbDJyez1/ftlR62y8TSHuUjVLcZ+IwFQimBNCuTZBKS7PxB74ry4Kho1hzLtl3JnN9m+bXH8Gg5Wglv/zAMHjCJarwryEam8KGOpgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZw0Mkg+hEOUa5oq7kg9+6ntClnocH9SQdl+z+4nCvI=;
 b=JmEt49jo48ylBC+YBcsOKNHUYx4p4FAcFlCROmNaJh4UydfTC4D468fMg9jDr+ENXuPRJnSkEcS3NVR4+iElUxsx23Ld5V/GSEANKU4uzOp7YUs8YJV/NWzVP6YTSY/Vw8Q6B6MnPkQzI5wC9l74PXDUSmL73bQXEJGWb6c5CqMlf2dY97Wu+LNd6oVj5tQYWONH3Ax2S6473PFvjuBeI9YlwWVI+pvk70Zy6pK1DjO/yqX5Ee/382glAOI7MgFEhC41tLt9ExVVdDFfPatYuSG/a7WH9YK+9KM+jJxLTmhcaHCTILuIo9EuEIT0DDX8EdCJrTR0flZsCBmCSq5WAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZw0Mkg+hEOUa5oq7kg9+6ntClnocH9SQdl+z+4nCvI=;
 b=OCZQzlC9lg3KzWeM2Xd+C2zb/bLFyofzVvki29EGIwjo9yA/oOiSzxE2klsx+kVO9stmFU077RnSUeUdX3V/X+SSQHQhQB7R0pQRJRsX7qP+wGCerLgs8xxdHcTaP4dvcNemWPRNHLwj42Ztz8qykTaIz0dzHfyDZtH17T9nNeg=
Received: from MWHPR21MB1593.namprd21.prod.outlook.com (2603:10b6:301:7c::11)
 by CY4PR21MB0165.namprd21.prod.outlook.com (2603:10b6:903:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.3; Sun, 23 Jan
 2022 22:27:56 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::61d3:a4c2:9674:9db6]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::61d3:a4c2:9674:9db6%7]) with mapi id 15.20.4951.003; Sun, 23 Jan 2022
 22:27:56 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Wei Liu <wei.liu@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>
Subject: RE: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Thread-Topic: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Thread-Index: AQHYCw3qMBbGche/+kepDREm+RMnaaxmMMYAgAsBKQCAAAgrQA==
Date: Sun, 23 Jan 2022 22:27:56 +0000
Message-ID: <MWHPR21MB1593ED650DA82BC3009F66CED75D9@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
 <MN2PR21MB1295CE3BD15D4EB257A158DCCA569@MN2PR21MB1295.namprd21.prod.outlook.com>
 <20220123215606.fzycryooluavtar4@liuwe-devbox-debian-v2>
In-Reply-To: <20220123215606.fzycryooluavtar4@liuwe-devbox-debian-v2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ca038e2a-b641-43d8-acb0-e95f9f3562a9;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-23T22:25:20Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d6ec0e5-fc30-46b4-ddfc-08d9debf9ab4
x-ms-traffictypediagnostic: CY4PR21MB0165:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <CY4PR21MB01654B10E056CC02A5A60DDDD75D9@CY4PR21MB0165.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /dYPfNdMQ73LR/teHlbAMT93pYZlS6lauxZq9swOq6T9lK0K2TGJx4sMIvN6otDBe5Lzl1T+R0B+EipF66INGvIISITfFC3yDkBGzjEXbBf5w+TQs85Lmb3BO1VeY6Z4GwcTiURVVhgTayeRpjqzSABV035ZkPFCPFYeg1EsHYybsXCGFS8jB7nvvfic0nVAXUM3gXVMyjWQ5GpJyFQWuObzpubLldS5tg77bUKgX0ccbyV9Az2BRbNJ8cSSkFoqroIvuVrQRC/OggMs73ADvyAye5ZYdnXvq7zaMW4eA9wh9bAsImXTeQfs5kvVU+0Kb6Wy5oEd3X6XwCXLnVP1CjOjK1pY9EXuYFii9NgOhwPzIrtCqTnpVZKvOpikxO7Nc4ZILMsZfVsrUNW05+3B6MeNLChyedcRlbnwIq7c/QI1BjZwwSYJ1alXbwdc+kFLkbfhXW7Tt3GVejgcVlCHkQKFLcyYVd2OA8N8sAWBwcEKrFAC4+mYB1KL46b4Ody1pfe8DepDPOi05QC+Ule8McRnftUKQC62i+IRGfAccjgvzx/BfkRm1+3tWkfzUexMewQs8AXG7esXGAo81eWSav24vdwRQoHJ2WcQ8AAezm2XL2FtwJSGkc/fqeuY4+8xftP330gq2gcfzt+ISiLJbmmU+AEMr5bIGZDq2ttuKrxDCahV+uNFu8Cd58WG0KSqOZm1SeaMCtluNQOs494UqePxLvn5Gw5gX5I1j9+kwESW/WnUa43MfFxDtSxnNgiidgbG1srTI4kKaazeTXhouHDGcLXDivGapvX3NYGflm/3Gy9ROhhkXs1Ek07rXWjdARKeM6/AKc0Hn2Mct6f/hQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(122000001)(2906002)(8990500004)(55016003)(66476007)(66556008)(76116006)(10290500003)(66446008)(64756008)(8936002)(66946007)(4326008)(8676002)(82950400001)(54906003)(82960400001)(6636002)(38070700005)(38100700002)(5660300002)(110136005)(316002)(53546011)(7696005)(6506007)(33656002)(966005)(71200400001)(86362001)(508600001)(9686003)(83380400001)(26005)(186003)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xP3EgikGj1n+b2T9fR9a1y8MX4hoCF5lI7WCDd2zJIt+tcM4BHCASJ/zJ3pO?=
 =?us-ascii?Q?5gAPsSisaqLpCbfbGJO7J5TUt7r9ax114wzUXkFTx+Ly31FhHRk74D+we8Px?=
 =?us-ascii?Q?t5n5wb3Xo/tysbit3QXCGVZOkPQHDMe6HPF8X8XBwZ3F7TMTcLzdCcfxsWs7?=
 =?us-ascii?Q?0CRVfgix1RLb2+zi6j+JaCtMxru+pHL/cy3LKeShBbEBC+O9uzX438qBEgO+?=
 =?us-ascii?Q?GYl+V2eN5Ve8zx7tq8mimhUAIQJxpGmkDk/317/N0XNrfKjMpMIjAjgm4MCZ?=
 =?us-ascii?Q?OGpb2m7vKJjwv//XsQo/H50k8FBch6qL6VzE7ZcRMzVFhArSzljgFORhBa62?=
 =?us-ascii?Q?MOAc+qdqm3ljMXLsMdtw+EQJ4daH/sVT/9MWKTNTguA6kFuP/zjgrBAXxnYj?=
 =?us-ascii?Q?WP8j2ZV8Di/tF7qdb9fM2wNckm80aM3lonWcKjVIa/BENeeoMqFKt6/OI+BW?=
 =?us-ascii?Q?2cdDeAiSTNTV2c61Ru299qwiFLA7NsHJa2fn/cbmBppTc/rjwBAxvD3Tt4V6?=
 =?us-ascii?Q?yzZDquVQ7AnKV5rQEeYRRjiWWyTfyenxafXIScn/CORbbMXl50rWOiW2BqKL?=
 =?us-ascii?Q?6VHVw9yjkliRB0K7TB8VAESDK1JSibx9iawEkef6QZcrBxYyGeiYvx94ogbl?=
 =?us-ascii?Q?SSlx15Gs/7opbVnQPknBzBfjGb//1cPciXW/bTdozySsvCYQzQCw1ZWmKMVX?=
 =?us-ascii?Q?ICEbKmohQpkdE4HGhW4pD2O1wAKCEzHV5ALupZbLj8GQQuFMwbcm8xnz2mys?=
 =?us-ascii?Q?id8R20/uojKW5RxsqdFIBDx0sq6Y239mDsMaZnxNDVYkBTxYhgvNE9MFhZSG?=
 =?us-ascii?Q?72D4qH8BqhlDQTy1QmMJTDqC1C7pZnhqgTZjpFsy4pP/k+INczFP5TJL3XNt?=
 =?us-ascii?Q?GZkA6v1mdB+LDF4WQfODaqoxLknar4i7Jtl2Uswo6/nGzXZ+fohY5odyyohI?=
 =?us-ascii?Q?psySYCT8EOPB+v72f6E17FNSMA6VqkK/cZ3fQshidPXrhT86mZzuV717J+iI?=
 =?us-ascii?Q?n7KuXqwz0MP2MS6a+XnPOdyJ5+rjKYCyTTYynC5Fan6St+7WhHkcyRBypg2r?=
 =?us-ascii?Q?7oG8K/aPcc/nvCpa0T9OLWaVA7zNfmxIH8FtXCo3W2RFweJ9qEBRiLS5nKWb?=
 =?us-ascii?Q?K+kl0EzZk546MzCtle0A0W635TbnA4rD1sncHP7qZqM7BSrn8bGAXdgbIjXt?=
 =?us-ascii?Q?t+9fOUBriXrYLA0vj2N50X9V8lu848LRVJT1OMFZpuQWD3HE1fOhTHk1g/Qe?=
 =?us-ascii?Q?h1sWdtSJ7h8pjQD2V7MMFCuIpTQuxReKPAVmPl5HXmDsoAmheqXrIbZ02E8r?=
 =?us-ascii?Q?tUYgUyFrwcvCy+unWj2Ubq6zsQfPeHIxPMrlYeycjLogWg7VTl2jajl6aCwy?=
 =?us-ascii?Q?CbY4RL3UzDO3tKnsnRzTh0TLHYKSIjW+28FL1SBM6Lfgrc+siD6ObQP6nUnk?=
 =?us-ascii?Q?qNXsly+Ul+agJiYxb8aHdPC4LsrmhugANyuyAe7tZIKG7ZWPkTvzmN1j/N2G?=
 =?us-ascii?Q?/+ItJNM9JH+Ke+UxwZMlZdOz7JgrAPPLymc76nk/Ksm7jIWz/mflFy+czKMf?=
 =?us-ascii?Q?F9S46/2xjNpzrYBEkwJczNfLDm1Ld8A7h21Gm7lyTNaMCk1kl+i9XbVl5and?=
 =?us-ascii?Q?V7i/EtPevcK9K5+28uPF7iC3JWocCxDACqmJNNbRdbw74RGTSz37NdoVFlPl?=
 =?us-ascii?Q?fDGPSA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6ec0e5-fc30-46b4-ddfc-08d9debf9ab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2022 22:27:56.3850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SAfVgE7ash/iImGfXqQO8e3pbztVFexvqsD9QNzdznOjZjVM1a+5uDpD5iWR+xVE9SP97gUK4wZAKdqJHA9f07avAA5boIBjnhEblTTZpuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0165
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Wei Hu <weh@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, hhei <hhei@redhat.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Liu <wei.liu@kernel.org> Sent: Sunday, January 23, 2022 1:56 PM
>=20
> On Sun, Jan 16, 2022 at 09:53:06PM +0000, Haiyang Zhang wrote:
> >
> >
> > > -----Original Message-----
> > > From: Michael Kelley (LINUX) <mikelley@microsoft.com>
> > > Sent: Sunday, January 16, 2022 2:19 PM
> > > To: KY Srinivasan <kys@microsoft.com>; Haiyang Zhang
> <haiyangz@microsoft.com>; Stephen
> > > Hemminger <sthemmin@microsoft.com>; wei.liu@kernel.org; Wei Hu
> <weh@microsoft.com>; Dexuan
> > > Cui <decui@microsoft.com>; drawat.floss@gmail.com; hhei <hhei@redhat.=
com>;
> linux-
> > > kernel@vger.kernel.org; linux-hyperv@vger.kernel.org; linux-
> fbdev@vger.kernel.org; dri-
> > > devel@lists.freedesktop.org
> > > Cc: Michael Kelley (LINUX) <mikelley@microsoft.com>
> > > Subject: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resol=
ution
> > >
> > > In the WIN10 version of the Synthetic Video protocol with Hyper-V,
> > > Hyper-V reports a list of supported resolutions as part of the protoc=
ol
> > > negotiation. The driver calculates the maximum width and height from
> > > the list of resolutions, and uses those maximums to validate any scre=
en
> > > resolution specified in the video=3D option on the kernel boot line.
> > >
> > > This method of validation is incorrect. For example, the list of
> > > supported resolutions could contain 1600x1200 and 1920x1080, both of
> > > which fit in an 8 Mbyte frame buffer.  But calculating the max width
> > > and height yields 1920 and 1200, and 1920x1200 resolution does not fi=
t
> > > in an 8 Mbyte frame buffer.  Unfortunately, this resolution is accept=
ed,
> > > causing a kernel fault when the driver accesses memory outside the
> > > frame buffer.
> > >
> > > Instead, validate the specified screen resolution by calculating
> > > its size, and comparing against the frame buffer size.  Delete the
> > > code for calculating the max width and height from the list of
> > > resolutions, since these max values have no use.  Also add the
> > > frame buffer size to the info message to aid in understanding why
> > > a resolution might be rejected.
> > >
> > > Fixes: 67e7cdb4829d ("video: hyperv: hyperv_fb: Obtain screen resolut=
ion from Hyper-V
> > > host")
> > > Signed-off-by: Michael Kelley <mikelley@microsoft.com>
> [...]
> >
> > Reviewed-by: Haiyang Zhang <haiyangz@microsoft.com>
> >
>=20
> Applied to hyperv-fixes. Thanks.

This fix got pulled into the fbdev/for-next tree by a new maintainer, Helge=
 Deller.
See https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/=
commit/?h=3Dfor-next&id=3Dbcc48f8d980b12e66a3d59dfa1041667db971d86

Michael
