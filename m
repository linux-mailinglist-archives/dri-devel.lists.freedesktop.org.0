Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CC2528CD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0846EA2E;
	Wed, 26 Aug 2020 08:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4526E881
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 07:43:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMtEoM1LmRAimCh2IJ0OBAs1b4mkbLOEFJLNYaE8w4Kpu1ZnY4yPPiuwB7gwnUKeaqF0IliAbIqmw6bLVIvcfKZHztaaVzLiBwEHLRs8BXbY69UtRArP3twZ8o4pGF4+9hbwgF/TI3GnsLHrchjVYOWS5GdM4ZJYIbW8g8X/xHxdsRhDMiZ6LtpgIdihd4ksSOwOWLIYMR5KxmCEO1N9GT7BANm7zFNecq3BpdT9qBXq6QliDkYsa7vXiVmQpWz6RuelhWvE2lmbNXNRO8VOAuUpZlU2KWpe0EUZUc5e3uk7iyeXpqAIHVdGSdFHdsijegffZQ+z4o40C8Hq3GI66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3ctFhaUBWWGWxGJMcNR9fTUKiQ1m8QN4mWzuDOZmbE=;
 b=MzgoiNQCsdl5vaVop1G/U+vPLDYYDEB3p0lwF9DaPK0dPbUXqV/l7fnb7Kg55o7gRcGLQlcB948pOCiYcgZYX3ELXVbAOf7XsyqaMBQqGLM1SscbCJ0frwkRpBK3rY3qUUdNN4H3VHpB4s5/XvR2umpR424+/+FIqrD5VLsdl6UteNlSXfDN9YZJLQ8MQtPg7cqGbZxNg7qRWsaDapNb6lH0P+fshGsWAlb420WRZyImong9O7VGtLKnjI+yu4+cTfQRWy6A2wR+5cBdTRfLj7vP0TujM2tnjcEDlfgowa4KGZfW507XPJ8Y/y+Jf5gp7PRl7Dd5yUvZKbV7JhjLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3ctFhaUBWWGWxGJMcNR9fTUKiQ1m8QN4mWzuDOZmbE=;
 b=RxWzC5dBObhmMlos/WytJSXrc5a6uCLAuyhFekiABWXCG39ci0TWBsc9OpikNI3mrrSJhEaiFPg23ZJw5wM3OQcjTh9xhVWWjMrg8B1uip738LlQIzpfpaxtdc8CXLeWOoBNPHp/VxuAaC3mOjMGK5l07CNjzxYblLGKmaXSk+A=
Received: from BY5PR02MB6659.namprd02.prod.outlook.com (2603:10b6:a03:20b::9)
 by BY5PR02MB6706.namprd02.prod.outlook.com (2603:10b6:a03:208::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 07:43:19 +0000
Received: from BY5PR02MB6659.namprd02.prod.outlook.com
 ([fe80::f0c4:ce6c:6ce5:664f]) by BY5PR02MB6659.namprd02.prod.outlook.com
 ([fe80::f0c4:ce6c:6ce5:664f%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 07:43:18 +0000
From: Rohit Visavalia <RVISAVAL@xilinx.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH libdrm] modetest: set_gamma only if CRTC supports gamma
 property
Thread-Topic: [PATCH libdrm] modetest: set_gamma only if CRTC supports gamma
 property
Thread-Index: AQHV/FU9XTFd+vc8Rk2JlZt3wND4vKhVsjMAgPOswOA=
Date: Tue, 25 Aug 2020 07:43:18 +0000
Message-ID: <BY5PR02MB6659FE618A0810C235E6D755B3570@BY5PR02MB6659.namprd02.prod.outlook.com>
References: <1584447077-22539-1-git-send-email-rohit.visavalia@xilinx.com>
 <CAKb7UvgBx6bf6=Y7djDHF9_U_93hVKbqJec_ma_H=-Zc4wWD2A@mail.gmail.com>
In-Reply-To: <CAKb7UvgBx6bf6=Y7djDHF9_U_93hVKbqJec_ma_H=-Zc4wWD2A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: alum.mit.edu; dkim=none (message not signed)
 header.d=none;alum.mit.edu; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8402b967-6b8f-4a67-7e0b-08d848ca88cb
x-ms-traffictypediagnostic: BY5PR02MB6706:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6706CDD907E00A9DCFDFEBEDB3570@BY5PR02MB6706.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cJQI75YzwhykMqJSKJQLSMAhxXvDZpMhutOOCeyd0VPj4AALVFiLlubCeiH4aWT6IsR86vmQMVcFEAZsV9yQ5n724sfiVDGvrqY7HeNSQozVgDzlA7Pj8FzPmZH8wH6goEWPuP1yD+5P6aKCtnOk8WcqcXs49ScZofIvA4dGBIMFeX7y9y/pyp08MzCMnw53ZE+qaeFIL42eW6gn8SZo8WTh5/RFhQhhxLyFe/1ALDpk2WYABq6zqr/1raF8m9chbYEwytdWgguYE4lgJ82lUXp9exXh4TVz1sb+d+nF3dOppycdZxqcSkQ7YkBNHwsAnShzgpDGtz4AKLWTiF7NIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6659.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(376002)(39860400002)(366004)(52536014)(110136005)(7696005)(83380400001)(316002)(5660300002)(55016002)(71200400001)(66946007)(8936002)(9686003)(66446008)(64756008)(66556008)(66476007)(107886003)(76116006)(4326008)(478600001)(54906003)(2906002)(186003)(6506007)(8676002)(33656002)(26005)(86362001)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: KNSTtB8XOGOn86+gVJ+lplLJdbB/hdKqOXPRs5EBwqVE4mskj2eH1/xQAdxB5/Mpkg0UST+k+AJVFc/IhLvpFVsGR4b83u1GlpxZXQpdZn8SCV8ARI6Yn3T8eZvm0j4/ZlWpbguUYZfGWCecgPdrNVtyGDPRTDECxQruIyU0jhXBVC0kn0dn9xc9OL2D00rMVwqeojLcwEMhPxzvZX2d8VL11xVCNd1wXvGEdRQbx3njfbjPn12t6ooZmguEbj7O8/UWuy/jdm4MzcTOTG2tvFyWwz3eU3j+gRRV8t0DqXNExWRc2+0XwJMU+8+5CffOfLWhqYSW4Ox9mX3sdsAd7mEiH8L5Zku/jdDZ6uaxy4h1AGISEndLkSZLoF566fruFGsWZ36s26p2Vr1InLxuR3U8YyugDcKs0ey1uc4zzICUqey7AkTtVDYOj1w1AbxMRlnEz6bZmhIcoh06rNznXx6EUB95mj3gLAZDXaa2/Ams0Ojk3N+S/ioRunn7CSpwFu2Fri+OJMYVHjphtpB2ckRRRgU8L3Kj3Yi7e5kz3KBVsGeTfBJkWiTbiRjJJDp/V+7MdvVz7fTutpHrqXsCzn8mmB0/S+ZDfL/s4Ikfc750msqpIFAGDr7DoZIaAMbiND1a4DQx3VJWtYH02Za/Vw==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6659.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8402b967-6b8f-4a67-7e0b-08d848ca88cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 07:43:18.6405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJb+xc0JNwOlyPkHNrTItd24I6cC6OcPNZji0HURGNKw6xlDP4lMDxdgHzhguqqACxPtvDXmZdKU7JOeiTQvtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6706
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: Ranganathan Sk <rsk@xilinx.com>, Dhaval Rajeshbhai Shah <dshah@xilinx.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
 Devarsh Thakkar <DEVARSHT@xilinx.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

This patch is already reviewed by Ilia Mirkin <imirkin@alum.mit.edu> and I have unit tested it, if it looks good to you could you please merge it?

Thanks
Rohit

> -----Original Message-----
> From: Ilia Mirkin [mailto:imirkin@alum.mit.edu]
> Sent: Monday, March 23, 2020 11:10 AM
> To: Rohit Visavalia <RVISAVAL@xilinx.com>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>; Emil Velikov
> <emil.velikov@collabora.com>; Hyun Kwon <hyunk@xilinx.com>; Devarsh
> Thakkar <DEVARSHT@xilinx.com>; Dhaval Rajeshbhai Shah
> <dshah@xilinx.com>; Ranganathan Sk <rsk@xilinx.com>; Varunkumar
> Allagadapa <VARUNKUM@xilinx.com>
> Subject: Re: [PATCH libdrm] modetest: set_gamma only if CRTC supports
> gamma property
> 
> CAUTION: This message has originated from an External Source. Please use
> proper judgment and caution when opening attachments, clicking links, or
> responding to this email.
> 
> 
> Not an enormous fan of what you had to do in atomic_set_planes, but OTOH I
> don't see a much better way to do it either.
> 
> Reviewed-by: Ilia Mirkin <imirkin@alum.mit.edu>
> 
> On Tue, Mar 17, 2020 at 8:11 AM Rohit Visavalia <rohit.visavalia@xilinx.com>
> wrote:
> >
> > Current implementation shows error as "failed to set gamma: Function
> > no implemented" if platform specific drm has no gamma property
> > implemented
> >
> > Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
> > ---
> >  tests/modetest/modetest.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> > index b907ab3..23ee73d 100644
> > --- a/tests/modetest/modetest.c
> > +++ b/tests/modetest/modetest.c
> > @@ -1328,14 +1328,24 @@ static int set_plane(struct device *dev,
> > struct plane_arg *p)  static void atomic_set_planes(struct device *dev, struct
> plane_arg *p,
> >                               unsigned int count, bool update)  {
> > -       unsigned int i, pattern = primary_fill;
> > +       unsigned int i, j, pattern = primary_fill;
> > +       struct crtc *crtc = NULL;
> >
> >         /* set up planes */
> >         for (i = 0; i < count; i++) {
> > -               if (i > 0)
> > +               if (i > 0) {
> >                         pattern = secondary_fill;
> > -               else
> > -                       set_gamma(dev, p[i].crtc_id, p[i].fourcc);
> > +               } else {
> > +                       for (j = 0; j < dev->resources->res->count_crtcs; j++) {
> > +                               if (p[i].crtc_id ==
> > +                                   dev->resources->res->crtcs[j]) {
> > +                                       crtc = &dev->resources->crtcs[j];
> > +                                       break;
> > +                               }
> > +                       }
> > +                       if (crtc->crtc->gamma_size)
> > +                               set_gamma(dev, p[i].crtc_id, p[i].fourcc);
> > +               }
> >
> >                 if (atomic_set_plane(dev, &p[i], pattern, update))
> >                         return;
> > @@ -1522,7 +1532,8 @@ static void set_mode(struct device *dev, struct
> pipe_arg *pipes, unsigned int co
> >                         return;
> >                 }
> >
> > -               set_gamma(dev, pipe->crtc->crtc->crtc_id, pipe->fourcc);
> > +               if (pipe->crtc->crtc->gamma_size)
> > +                       set_gamma(dev, pipe->crtc->crtc->crtc_id,
> > + pipe->fourcc);
> >         }
> >  }
> >
> > --
> > 2.7.4
> >
> > This email and any attachments are intended for the sole use of the named
> recipient(s) and contain(s) confidential information that may be proprietary,
> privileged or copyrighted under applicable law. If you are not the intended
> recipient, do not read, copy, or forward this email message or any attachments.
> Delete this email message and any attachments immediately.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
