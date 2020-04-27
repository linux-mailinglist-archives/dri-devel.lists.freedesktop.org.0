Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8671BBDDF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AEF89D49;
	Tue, 28 Apr 2020 12:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310137.outbound.protection.outlook.com [40.107.131.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A8489DE5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 13:21:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CItuy1cqN8+MVlb+aL0L6v4/FBPWcvVPKttb+lFOg+TszrnV0MWRx+47G27RCu8nurwZYOFIFSKwkGs4guvj9oRFHwGg+LNk4uEiX/69S+fayjfnnlc+ZchZ20GP8BHeXbJNQmvAC4PqtBmsvD3amQkG1VSP9PM0E8tSpjJuMxx9ttWUB/hE345vjcvfW67lFrO3ewqHxWflIPCDL566piLQLfI8LY7wy4dk4TW7I0C7X+V+4tlmaznYItkKG8DFS7r6pt3IMNFgjmQUIaCIa3qai/3t6RlCSAQ42Oa2SNfEcQ3ui/u1fXsbi2G1HpAjnwRRKcbDgFLnKu2u53YFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcJIpyftj+669IYyd8PWOSybRTk2PfOnt/54JMJycOY=;
 b=UDdCvkltYMh/6dWQZ7mkw3fXRfvC3+xjgwwUrs27/SFS+REj5mEdqCBc6P14sca7epuBS062xz5Srrhl6RKOfZYklHxh0++4R7RIQrO1YD2rGHN3bH5GQ1RGCNv+fmH+x1HXDLasf42E9IW6k0ilAB+Xq6CraEMCUf0peWmnlhIP+PE2Xzlq0g2hW4qNTVBrQi0aYmndF0ycB+JVl/jhFpaekVQdvSjV8BbllVQ8owlA06J8vJ7A35sClZw6nGuH4S3m6vh+IfKNgvrIL9WRYxWOc1poufaGJmRGs0sejc+IJ2z19jYKJZihhKSMVP517CSO1HRwW9BriCsjEegHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcJIpyftj+669IYyd8PWOSybRTk2PfOnt/54JMJycOY=;
 b=NGSABjbFqsgo9bAqNNvmdgWfI6FD+5IOpJZFG1skvH2gZtK+1gWDGC5lYwFcvtojLdMauq4fOLXY3Gf8H+Czqsdur/BzNep9q91Qq9Kw8x3hHJx/ApVpaiNAocQOf14YbQTOoVd+YINfSKNyoD13c0L3iBdEw6/m+pDgV/IAaYs=
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com (20.177.98.81) by
 TY2PR01MB2234.jpnprd01.prod.outlook.com (52.133.182.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.22; Mon, 27 Apr 2020 13:21:16 +0000
Received: from TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::15c5:58a4:5913:d859]) by TY2PR01MB2924.jpnprd01.prod.outlook.com
 ([fe80::15c5:58a4:5913:d859%7]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 13:21:15 +0000
From: Gareth Williams <gareth.williams.jx@renesas.com>
To: Gareth Williams <gareth.williams.jx@renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Icenowy Zheng <icenowy@aosc.io>, Mauro Carvalho
 Chehab <mchehab+samsung@kernel.org>, Vivek Unune <npcomplete13@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH 0/3]
Thread-Topic: [PATCH 0/3]
Thread-Index: AQHWHGzvXFhntU7vAESnsWWN43lNnKiM8Q4w
Date: Mon, 27 Apr 2020 13:21:15 +0000
Message-ID: <TY2PR01MB2924A29DED5C3AD29950D863DFAF0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
References: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
In-Reply-To: <1587975709-2092-1-git-send-email-gareth.williams.jx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gareth.williams.jx@renesas.com; 
x-originating-ip: [79.64.184.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: abca37ea-b24f-4a6d-ada6-08d7eaaddd44
x-ms-traffictypediagnostic: TY2PR01MB2234:|TY2PR01MB2234:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB22345E80EB465787E438AD65DFAF0@TY2PR01MB2234.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2924.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(2906002)(5660300002)(478600001)(71200400001)(76116006)(66556008)(316002)(9686003)(66476007)(66946007)(66446008)(54906003)(110136005)(64756008)(55016002)(4326008)(33656002)(7696005)(186003)(6506007)(81156014)(8676002)(8936002)(7416002)(52536014)(86362001)(26005)(921003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4nq0VGgTlC90TaNfh0o3sKJ4gGwVNzl31gYu2LD8X7cgos6we06NLX6Pc/su7FmMlyAR2F+gvS+MIUe3uqLNcXVmYM0o6FUmnAoRFhEJiyaeJ7M6xjEhASGdWV+QwyGOoX8lu9yxk2EXErh4fAZ2cyegI3xXl2h1k46Lamw165uvY5QfF4f+u1rRGSbZ4AYI+7hSymZIpNXlUI0vASzp0NUFajbX+l872/EkIma2qbEC/y9eBTj9nD+55Oe0lRfXcJNAXOa/zMIDBDTFMAMV3nv0BEVN1Z9bLFUaGTSH8FjywE/UnEAqGTx9AUPFd/lOz19pJunn35cg3zh7kKb/fs7gnFubgXWwkJn3kH8uHkJbuZPleL9ZRRvDXIYVra/hoEX0XlWHFqOVXGxzbrr1YLzFGEDnRgZAsQvvTaKb03328f/QkJojweYWULYsKMk+wQTCr6MmSA6GB0zdv7W+hMmbZeluB0xkvrhb3zEx1KQ=
x-ms-exchange-antispam-messagedata: wv9FVRUGdG1J4a9yKYTiKrc4WdJ+kbY/tL+yPDRerP3RNF1C3FudEQ54YbTZu2Ewb9m7LIjHDkS24b9nTfyAQg+D6dq0WLraC4MdTwseG5krQoa3XJ+SGSylvEO5p7RSNmEWQxy/+cY3STzDMhFMoORv46WzTJYCyKEwTI3x+9XqG+EOH+mUS0eq2DhzC89JYR4n9QoJGGH82bh+V5jcsJDjLzz5dD9A/KMW/sx+5WvbK51n+xqV/Ke0PEoNu1kXuClTP6lNuH5xbeP/JI0FkOktW9K7Y7H/Cook6j2InIOXC6r4iRbwfGKwom/V3cmyLWp1EMiw+YOI+SpSsZsKfdp+QufdKFijJ6XYB4O0OFiJWObtHewgbTXgnZ5OiImKl8Cn+0OqQx7S0j3kO1elSmTH3NG5dRT80aIIAGbhFLoP8CGWfMRtdsZkLOEO4601v+PFNhEIW8Us9sOS98gcFefrC11dWEW7oIq6+cjw4urM/gVTWsWficfxpMl/j9DMQHPPKhhAWmggiuHZ0KYUKUVO4SuzLcCdYsYIMU+eJuDKQK3++IsKiqU+IVWgk/PEOmcS3fV7qGLaXeV8O7JT4s6R8Gfo9rzBNsWX2ShDYmE+1bxno4Bp0HUKFlw4qBXOXmrTOMCTh5jhDhHXQq9rbxk4jv/DLECpTC+AXtJiZHyhb8/oMhP0A3rXkoMJl8tLLvjgYTquvmnfXCGYk5qTc86ELkY0/p+F/sEBs1CFKM8nK6P0ldkuBJMIqKkLq1XAhNO7/T6QZyJn+zncXOL63Sr8OEcvR6LA1cqLJKhjZJY=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abca37ea-b24f-4a6d-ada6-08d7eaaddd44
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 13:21:15.7002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fe1q6nfh6UHzk9Oji9cDYVqD/v+Jl+ylU9ojoA/ALg4zW4Zj6VRXSdU1CkSFadctSq97n9xtBkiIDQZB2aP+DZmmL/LRuy9uLnSoz1b5gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2234
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Phil Edworthy <phil.edworthy@renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

I noticed some API changes that were not present when I first wrote this driver. 
This will need correcting so I will send out a second version and respond 
to Sam Ravnborg's feedback at the same time. I recommend waiting for that
version before reviewing as this will not function on Linux-next otherwise.

Gareth

On Mon, Apr 27, 2020 at 09:21:49AM +0100, Gareth Williams wrote:
> 
> This series adds DRM support for the Digital Blocks db9000 LCD controller with
> RZ/N1 specific changes and updates simple-panel to include the associated
> panel. As this has not previously been documented, also include a yaml file to
> provide this.
> 
> Gareth Williams (3):
>   drm/db9000: Add Digital Blocks DB9000 LCD Controller
>   drm/db9000: Add bindings documentation for LCD controller
>   drm/panel: simple: Add Newhaven ATXL#-CTP panel
> 
>  .../devicetree/bindings/display/db9000,du.yaml     |  87 ++
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  drivers/gpu/drm/Kconfig                            |   2 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/digital-blocks/Kconfig             |  13 +
>  drivers/gpu/drm/digital-blocks/Makefile            |   3 +
>  drivers/gpu/drm/digital-blocks/db9000-du.c         | 953
> +++++++++++++++++++++
>  drivers/gpu/drm/digital-blocks/db9000-du.h         | 192 +++++
>  drivers/gpu/drm/panel/panel-simple.c               |  27 +
>  9 files changed, 1280 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/db9000,du.yaml
>  create mode 100644 drivers/gpu/drm/digital-blocks/Kconfig
>  create mode 100644 drivers/gpu/drm/digital-blocks/Makefile
>  create mode 100644 drivers/gpu/drm/digital-blocks/db9000-du.c
>  create mode 100644 drivers/gpu/drm/digital-blocks/db9000-du.h
> 
> --
> 2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
