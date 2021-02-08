Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F263135EA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 16:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B997F6E904;
	Mon,  8 Feb 2021 15:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9884A6E902;
 Mon,  8 Feb 2021 15:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihvTbcJihcegesZempr3RNyg6kZS/xwO/AhsuVPRRpsjRWTbLxhjdlAUYeSl5XnfxrKxB1Dndx0tOKdBZtU+E+JeOWOpP/7rV+K518fO4wNoVGdxK+jUaAOEiaiEfmaHvwptJCwzdvBOCBYjPX2UDgNlB0T05u+NEmqD8H6yLBbqYvcFcxDfiudr/zTDyIi6SP5/FhaVNLr2dWMpvyFWmY+utGcwlNye2E9TekMhvePDetG3khriMHrXGL5RCtLqfuXFa+mHoOdT9IeJukzihjaFUcfWplnVyeME6JbtIQL84WyeWmsEKkxYfX6NdlIszBQkoD6fkSFWuRNp633OtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTl8Fl35zSogNzgde4G0TSpfuNLP6qvGPchlkpF6ePU=;
 b=XC9JBxUPn3289VMlUZfaBd/Ix9e36lJX9zCt64H6bcLMwmDj/ssM+gYFeo0BG6NUFJtoamIxLbXNqKglTAeW1WvcdjzFxCux24ib48aJLjIApfGMC700kqcYsaUQpVjPL5fHrgnfY27fLQ5La+rqpDVbEr+UywkMwhy6AFHsWBanfiFVE5SI3XIWt7sCApnwwbxQy9YP2q+OZgwjupBhyv8alyMRTeiBRvneuSQnSriolx/+WQx7CEUxnt7oTYNlDtkqxnQBK1zpmcmOCK/kktBhoi/Xa1/xRhWlfAGyDc/EdRYqGMY5NTN4PMAeOlcZqoPFF2lj0MUYQdTR5eXg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTl8Fl35zSogNzgde4G0TSpfuNLP6qvGPchlkpF6ePU=;
 b=c9KOSooVGG73ovLNUSWBqVMwEomTUHtD4NbCCgbGDrdhPpMUjsFiQtd53Wi5drr9CTjTxBMuPoSEYyyjQJ+dibWc6fuszc8SyzaAs+bsWq8a4IbLFPaevenOje1Ek+ffuz1boJb/Z7EEPyYy9mkpVhLBsSrJSfje7bTk29d8NK8=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB2369.namprd12.prod.outlook.com (2603:10b6:207:40::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Mon, 8 Feb
 2021 15:02:39 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af%8]) with mapi id 15.20.3805.038; Mon, 8 Feb 2021
 15:02:39 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Takashi Iwai <tiwai@suse.de>, Alex Deucher <alexdeucher@gmail.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>
Subject: RE: [PATCH 1/2] drm/amd/display: Fix the brightness read via aux
Thread-Topic: [PATCH 1/2] drm/amd/display: Fix the brightness read via aux
Thread-Index: AQHW+ioTQZnT5M+oKU6X+twDGO8ro6pJxdkAgAFNKwCAA0cN8A==
Date: Mon, 8 Feb 2021 15:02:39 +0000
Message-ID: <MN2PR12MB4488E65961A45A113864E4E0F78F9@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210203124241.8512-1-tiwai@suse.de>
 <20210203124241.8512-2-tiwai@suse.de>
 <CADnq5_PZFcXG2E28O2PrJRm+twp6Stq71EE+yckEOZbE7NUW6Q@mail.gmail.com>
 <s5h8s811isn.wl-tiwai@suse.de>
In-Reply-To: <s5h8s811isn.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Nicholas.Kazlauskas@amd.com,Rodrigo.Siqueira@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-02-08T15:02:32Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=c18fc772-d308-4f3d-8860-c0b681490e21;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.78.237]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c1c96d76-91ff-4452-3f21-08d8cc429406
x-ms-traffictypediagnostic: BL0PR12MB2369:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB23691E3287B4CD117569943AF78F9@BL0PR12MB2369.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gDV8hN4/s4J8sj8UXlkBZdSngUx85IoVlpe2lwKbwZ3fBbzdDpT6nf/b2nhyACnJCSRNllFK/P4aFycKCgZBYTXclRsxf/cplSJ1pNoNuhT1bukdmtoXvxKLqz/tDxUYcE52ySK/KE9tWBGdfST2bcKvsTE1wmvQL/CXdKBJYhvvBMEVOMTKUxcPPE6PACljOKhc36LdaHEp47Ky5njfbhrjQVCKClfXTWWEHRuO2ahTXNTlkKlAEWN8KLILYNeYIDDbFVoeVIu/fGKvusrzNgvfroUtzw2EAFz9o8G7K2mJgDrMRk9lwEoZ4GA/b+JfDz2+jgnheMkoG5wy18mjXwNLmjvg4qvssn2LonDN9e8rqutPPvwCcVjQOtWU9N2YDS2CWMyfDbV9t7Uwy/KnJ49+ct1H+JsIyKncuDPYZYTNdBrq1e5d7dE+zwouDIj2FXniP52bJQUtbSGzCQ23zGhjPlmrVwk0eYY1rFIdSKaduSj0g9MYeG6xHIWIHXI9Ih6CSEQtLZmCWqBaXPMxn0b78KJQvVS29fZRqTc5DZztzsRa4jPAQSgeF5aaSUD9QEe2uVGNInNHmot8UDjim67dOoM6osnUc4vEljEB9x/DRu0y7+p531V+EoIBCZJEgDkuPqVHZOhdEdjSAVKifQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(186003)(64756008)(66946007)(66556008)(26005)(2906002)(966005)(66476007)(4326008)(66446008)(52536014)(33656002)(76116006)(8936002)(45080400002)(7696005)(83380400001)(53546011)(110136005)(54906003)(6506007)(86362001)(8676002)(6636002)(5660300002)(55016002)(316002)(9686003)(71200400001)(478600001)(473944003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jC7c959OsxndIImUYGLcRrdPWlV2HxQnXS3G0zBXynHDcG5BiEibSALI6Nx7?=
 =?us-ascii?Q?T0BQ6Qex2FPE9N/GzRarV/rGttVjv/JrCVZueDeXGN1xV6wvcVmj0fbbuSXX?=
 =?us-ascii?Q?/ET+PwwBZg8df7nMgOSHh2eW4uSamdWe1Iys0Qc+GDl7QSNuArPVq/UcyH/K?=
 =?us-ascii?Q?3ymyxW1WlpRS2kBK4EJNJyMI9DtRAdkcuczS8ARfdTfU8Zvw0RwDYqyZ9wE2?=
 =?us-ascii?Q?AvthgLEccEePWw26sJej+IV9hq8m/IykZ+B+zg1ssnHtl/y12WOFIjkjAr6M?=
 =?us-ascii?Q?2tadfD75SNG/E5qU0fpxAABh2Jpo53+ecR2noVT0TbnN4uXkoJVSL5TgnKTk?=
 =?us-ascii?Q?0BzwIj/l8yFEYXnqoorn/QHdl+145W0jCidal7ZBV1xTfmxTfBdT5cskT6MK?=
 =?us-ascii?Q?s5WH/lQh+qLFQvNI0v4JxS1PSo5NKsDqT4ICcCw5ADHodBVLb3GKjYPTyF9i?=
 =?us-ascii?Q?zEltWJNTse8YY3DTc4eAz+F0+gNvUlO+GggLlzPcIZg3VnOdxP9M2jmE6fNO?=
 =?us-ascii?Q?dgGX5OZpwG5a2cy+MuoWYfAE/B9mIqeWVwg2Xgq0il6/i/ABqIw52l/gd8J+?=
 =?us-ascii?Q?sb8Jtz8S5hGthrVRml35EXY13HenfYRZtHU0zYBPTRlRMAqeoywg6t9/9KDi?=
 =?us-ascii?Q?8+mnFu8vanhEN9Yhg5oG8oDi9ZosBLj8VDovA6jDgnWWR8rWg/IPWqUL+UIc?=
 =?us-ascii?Q?f1nI2+ic+IEpO1Vp1mt3C+77HdwWpASDCG5XERvO4lpmYOyTzLmCfd1r0cQ3?=
 =?us-ascii?Q?S2RYLOdm/u+Lfd/Z4VIOl2J53BUlzNybwQ9u/aIb9cy8lb83GeZDXHX5VuC8?=
 =?us-ascii?Q?knK7o1VxCtKKOwd48k0p7x4/jf6e4hOILR7lRvJbndvw2MaKBMMWQGQC0tlM?=
 =?us-ascii?Q?6+H7qk1jhZFAYOLMvLk3YYSORT+NSsoD2JfJxjKT9U/9ykXf89BW5HZ+ugVi?=
 =?us-ascii?Q?emnCg0f7xAWkfRAGCOgvgL75+TjoDVqPeWfbzSmueIjyWQG2ilHElFIAtgU1?=
 =?us-ascii?Q?8tM8q77M4NvhP2W0dpG3itI+9kiEw0C7jA4lCKJM/7oUx1BP3NGFVaFGGhaG?=
 =?us-ascii?Q?Ik6NwXnAWYEadsirmrxNnXJ0LqUPWG9kk34H1Uv6eo+IT849U+BMhgQREX/w?=
 =?us-ascii?Q?5b605A1M5TIgQFceK9y4q/VGJp+OjbOLQf7EmBWHGZ1uPftbYuDA18/3GbXn?=
 =?us-ascii?Q?PLB9lX1qm5BgQS30AfollPRouGbYgVVl5iPXWhjk9xnNBs9QIsHV6yqv2DfK?=
 =?us-ascii?Q?nrFImyxbJL9l/EwoQrlCqPkN9pWAVNnKicyKrd82b+oAbev8MyKjjg3tD4v3?=
 =?us-ascii?Q?++GPGSDoOgfpeHRpONpp8qWt?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c96d76-91ff-4452-3f21-08d8cc429406
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 15:02:39.5573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cr1HbT1jVzbQjxGyUMqUYvWvwQOr8n5KdN1pHutEJKWSeTZbHdwU/sDnMpFLiAICKNPCECFjOtEHGhME4CQPbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2369
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Public Use]

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Saturday, February 6, 2021 7:29 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>;
> Wentland, Harry <Harry.Wentland@amd.com>; Maling list - DRI developers
> <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-
> gfx@lists.freedesktop.org>
> Subject: Re: [PATCH 1/2] drm/amd/display: Fix the brightness read via aux
> 
> On Fri, 05 Feb 2021 17:36:44 +0100,
> Alex Deucher wrote:
> >
> > On Wed, Feb 3, 2021 at 7:42 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > The current code tries to read the brightness value via
> > > dc_link_get_backlight_level() no matter whether it's controlled via
> > > aux or not, and this results in a bogus value returned.
> > > Fix it to read the current value via
> > > dc_link_get_backlight_level_nits() for the aux.
> > >
> > > BugLink:
> > >
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbu
> > >
> gzilla.opensuse.org%2Fshow_bug.cgi%3Fid%3D1180749&amp;data=04%7C01
> %7
> > >
> Calexander.deucher%40amd.com%7Ce5579cfe56f74b572f1508d8ca9ad0ac%7
> C3d
> > >
> d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637482113562863043%7CU
> nknow
> > >
> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> Wwi
> > >
> LCJXVCI6Mn0%3D%7C1000&amp;sdata=HVtqM2r6oxSWd3XGGQZotO8wrvM
> qCTcwfq1L
> > > 2%2FeCmSE%3D&amp;reserved=0
> > > BugLink:
> > >
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgi
> > > tlab.freedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1438&amp;data=04%7C0
> > >
> 1%7Calexander.deucher%40amd.com%7Ce5579cfe56f74b572f1508d8ca9ad0
> ac%7
> > >
> C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637482113562863043%
> 7CUnk
> > >
> nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I
> k1ha
> > >
> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TdYgwNJ%2FvkuoDLNb9ATFb1P
> yznlp%2F
> > > P8TLuYSR%2BVkNqY%3D&amp;reserved=0
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >
> > This looks fine to me.  FWIW, I have a similar patch set here:
> > https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.f
> >
> reedesktop.org%2F~agd5f%2Flinux%2Flog%2F%3Fh%3Dbacklight_wip&amp;
> data=
> >
> 04%7C01%7Calexander.deucher%40amd.com%7Ce5579cfe56f74b572f1508d8
> ca9ad0
> >
> ac%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637482113562863
> 043%7CU
> >
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> 6Ik1ha
> >
> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=aoMSY0nvHjrLocUPJtdgckqIH7x
> LUPbwpH0
> > ZjhuuJO8%3D&amp;reserved=0
> 
> I'm fine to scratch mine as long as the issue gets fixed :)
> 
> FWIW, the biggest problem so far was the aux channel backlight didn't work
> as expected, the actual backlight isn't changed by the backlight sysfs write.
> (And the sysfs read gives a bogus value, but it's not the cause of the non-
> working backlight control.)
> 
> Does the aux channel backlight really work with the current code?
> Or is this rather a device-specific issue (e.g. broken BIOS) and we might need
> to come up with a deny list or such?
> 

@Kazlauskas, Nicholas, @Siqueira, Rodrigo

Has there been any progress on the backlight fixes?

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
