Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B752C2FC
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 21:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D0A10E9BB;
	Wed, 18 May 2022 19:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 845 seconds by postgrey-1.36 at gabe;
 Wed, 18 May 2022 19:02:47 UTC
Received: from na01-obe.outbound.protection.outlook.com (unknown
 [52.101.57.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F8E10E9BB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 19:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORjIX3K9KvGpNb9+kDvkOPfyh2ECipH8uYWV2bdLeugCjTtt/xXRmdr2yqeT3x/Lzk4s886zOSnbKpVbLdjF9PYSo+rXrBWnnWqklHE5UsjnXTLya98daZ2KI8Y5qDhKNHFNng1eW2Z4oloMmuzQo+TarKzDJIwY98W/WtsJTXr+fmB2Ce7n5fPs/92RNh5J/Jo/7MSdZFky6dYuKY0xkZMBFbbED26A+/XO+Gr/ANd3NIO4Xk9QOIgD3/oK5MFhj6U6rhNsIx2mzDFhL2VZOvhX8HGaYN4+M9J0hE/REuk3NEbLvdy55dEQdxxCNT8KwX+vN6xAPRlrAAF4QCh+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQw6Jzetz1t2EDL5xkzmn+pB87CgLVc8HHTholg8nLo=;
 b=Km9MZneBZogEeys6dvQyXYIG1u65+pJdPayeNs2cOL13UPlki2J7VmTwsPRx5zX7P+7axnAfluUIeDZ5LJoOrtlWCgnzjQjOzIiUDToOuELzqdrovwY9aITm4a3vP/A8DKQbz9diNrbsGVhQmcTpJP+DHxGh+8ZWLnbEXbLZRj7e8dFpXOmdm9SQ99Idm2PbZ+IsJ09tG2M8lRsVSYbUPcU3E6Vn1HPJEglkInQ3PIapxJFaGUfrbXvADEtNRGCOlVSwWUbe2QwrWoqq0aulqzYKLRxWDpFyjaFHfqQmV75BsArfKaHOYPki8ODbEg2RRxx/aH6go1K4TohfTL9gCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQw6Jzetz1t2EDL5xkzmn+pB87CgLVc8HHTholg8nLo=;
 b=SHya0iQRI1mVmZRLuetlXyqRtFkY6//K0DjZ4ERvbpfLGSkZpn/ha5hrsTAkUgxSiWvHyOMVa2A2U0vDX1+By8v+ls9Mg7szDc7HcicFzFTrpXu4IBXwTrw5LwWIMiIyZZF/tkLGC4X/ylaM8O1pvlzzZV89Z9QnE6JQdxItySw=
Received: from BYAPR21MB1270.namprd21.prod.outlook.com (2603:10b6:a03:105::15)
 by CH2PR21MB1399.namprd21.prod.outlook.com (2603:10b6:610:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.7; Wed, 18 May
 2022 18:48:39 +0000
Received: from BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::942c:e0f2:568:5335]) by BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::942c:e0f2:568:5335%7]) with mapi id 15.20.5293.004; Wed, 18 May 2022
 18:48:39 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Dexuan Cui <decui@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
 Wei Liu <wei.liu@kernel.org>, Saurabh Sengar <ssengar@linux.microsoft.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: RE: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB for
 Gen1
Thread-Topic: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB
 for Gen1
Thread-Index: AQHYX9YSthbGf8K4qEaTeH9fJ7H5Eq0O8UBQgBYbEhA=
Date: Wed, 18 May 2022 18:48:39 +0000
Message-ID: <BYAPR21MB1270E4CBA78869748D28C81BBFD19@BYAPR21MB1270.namprd21.prod.outlook.com>
References: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
 <20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2>
 <DM5PR21MB1749EE7458996FF22AAA9AF8CAC39@DM5PR21MB1749.namprd21.prod.outlook.com>
 <BYAPR21MB12702855D53B456E898ED5E0BFC39@BYAPR21MB1270.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB12702855D53B456E898ED5E0BFC39@BYAPR21MB1270.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ea6efad5-303e-4efd-b054-9cb15ed3afe4;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-05-04T16:37:53Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5551556-c117-4d63-d185-08da38ff05e8
x-ms-traffictypediagnostic: CH2PR21MB1399:EE_
x-microsoft-antispam-prvs: <CH2PR21MB13997861355A31055BB1DD38BFD19@CH2PR21MB1399.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: blZLNtbc7VNI8xE47iOvBSTdWLq2z0cfNLYn3D7KIBApDCyz4MkxToAA8WeArEpxOsMTWAdb5MGco/7IFULbKkHwTSHOBAYNOuDA1VERHhS23PojBwy1JF4D6eSpdRg3u31+uuCIbU96KA1lbFa2LeJ8pHkyOzkXlZkoJqLrkyCYKiHpSVDD6FngsKIFuUss0vkhS83vbvi4cMGHtWNfTRvJK/vlp7b4R4hbxwzKEx09Lty2y3D2MuP2aUjqu5LcUKFlYv7D2QspooN74E2eoLVAOHSqBiYBTMh0X16tXy9V7rrpFbd7EVrhxJOtmfU5K/KDnn5IN6+hg6MYnKNU99FrvAclgUnI97M4cdVflzHNCVIvc1muKZqCgmFr12L03M2XhshZUjrH6rrIX4WQ+2kxlLgNoayuU6TFEeGss7Dj1J7zZlgHjErrT8sIICFn4Pwa86gUOBVgPIsHPKstu5+PZL1fmFtIzKOXj1SubCI3xpiXytcz0lNxLwcd3JJTOfyfR//a0dZp0KO59w7om6/lkGKGPtMAuMnbE1Uef3CNL2p3EeRa/CYDauNCZv/HvSuCvBKPX0PmPuxaQajN3uzCrNyZ/nNKxKncYInY6UBJ/rxNUUIXfj9HO77bPatY7KvicnX9U/VNpZyuL7aq9BWOd/XSTGwPcXJOdMlmHJZNtHdPkPObeOuNYLB11tRJlzDcoSWgW+2KLKnL9mQ6BskJC5XIpGmeT4E7Dv8IXJovMxzmieQfIpSHDqKkNDJP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1270.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(82950400001)(10290500003)(82960400001)(55016003)(8936002)(83380400001)(2906002)(7696005)(122000001)(186003)(38070700005)(52536014)(508600001)(5660300002)(8990500004)(86362001)(71200400001)(38100700002)(64756008)(66446008)(66946007)(66556008)(66476007)(33656002)(110136005)(54906003)(6636002)(9686003)(8676002)(4326008)(76116006)(26005)(53546011)(6506007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U88ijy1eueUT6J02ke14aBlUvVeBrBbf4TntqSmdve2LBxT0Zr8nJmK+celB?=
 =?us-ascii?Q?l98XBiDPY0hEtlLaqFZCpIJBm99T1bfrEKSO0bgWIrk691rHE4shPm6nLcQo?=
 =?us-ascii?Q?mlZhLhMW0/FtZJ81D46pzjH4dnFcOiGwZuVjG7t3qBW2UZbZaTPT6jeRwrJk?=
 =?us-ascii?Q?+ulJZEPSy22B+vvROGxSx3ooonNREQrdTrHW4+iUYDyqoa3XefeEbVGcuUmR?=
 =?us-ascii?Q?bMWSYWVEZg8eJTyO9B3FgPLP0q5xIyxDYcQuIRoOsXwuq8QEJYc3wJ8ZuYeR?=
 =?us-ascii?Q?d9jqAgaE/WEMjdsGLfwDlkMcCzXOO3GhMclU190OOQgjJfO1/8rzCcxgG3sC?=
 =?us-ascii?Q?A/olLdxHKebkLnlCPT6Hxd2Kfh+Cyz8r6benl33oCrw7inRsNoBQK9qG2jx6?=
 =?us-ascii?Q?c1Y9Z0sgVyYgkyaAW6c5S1276pOekHp2QdXUqbrlrzH3UXWoPL1Wo7a1qoNi?=
 =?us-ascii?Q?xL+BzmZyS488Ri9QjmS1Mav49VHPF6GlVrOAaavbSSzSVekctm6RU5zwcKc4?=
 =?us-ascii?Q?3WPYWAkwixQ0hGLyd2EGR0igLpKDK1OmrvuvzAJN3Tl4Jof0/OxjLmDJvTRK?=
 =?us-ascii?Q?U87OhFcCzNn4PbGr2vsW3PGmaNVZjirNa7yMu8QgvAHQcCLFgMPOPE2riz1M?=
 =?us-ascii?Q?z+ppDSqVbac76j/0Ub6JxL2aR2TDvVqVMhoDi63QWRbAd5LOlJfu6Xtogrhw?=
 =?us-ascii?Q?nQqAhH+mvFOD2gpv3b818cval2/bEQNsV+DytoaaSxJprn1ns2w5nTm2ycgH?=
 =?us-ascii?Q?cuE4yK7woDJ+jbeVrc7OG6jMtAia+iAQs96czwhS4mh6VPZtu+/k27ZD8wUk?=
 =?us-ascii?Q?QofIr7SoPHOw4fXK1jgRsMhYh+Bbpp93CYH9cRg+JpFB37k7aoTyUr8veMqL?=
 =?us-ascii?Q?OnUYbCeWgMvN2eJKeJmBacEYg+lQZQutgQ9VIekd2+OiyvakxSM6J8S4u0g0?=
 =?us-ascii?Q?DJkQFitqkiIxei01vCmv+xaRBXWn2coa5qZbLA3L3Vhk0WDYqeuEHouHtTGb?=
 =?us-ascii?Q?BXDg/ffzKaqqdvZuXxZAa+pplVnDB2EAXKg8C2d/1N+6EurBzThjdmVyYf/Z?=
 =?us-ascii?Q?CgdfTDJIZ3WArvGE66REDYpnRHfdKc+Yw2V7pL5FGVi160z/bNVhtmjXZQRI?=
 =?us-ascii?Q?XWbuN/PzwzqkY45RFY6b+Cbd1zCy2wKIPjxvzWgZJ5+OwjMOp9+N+0sTfzo4?=
 =?us-ascii?Q?jKcnff7VNJMxlQQlgkdETC30mZ1gHmuyVAfnlO25Svi+uqFAfcEbZlcQmahc?=
 =?us-ascii?Q?2ubSYLn+IxDB+b4pwtTusEuaaMgep8tbeTUFdtqN0YflX5utIoaydslnmNCN?=
 =?us-ascii?Q?v5phP3/B/36IgnJfkyZnTSPAon39eEMjwD9NoL0GuUTK5qad11kIqMVNxRDi?=
 =?us-ascii?Q?oLgiDAAE0JiC6gAwT8wd8vtDJo1CuKA2MqpnrDdU3fC4oQhqSeQFQepkHisi?=
 =?us-ascii?Q?nE7rc/vq60LA7Qdoqvf1HPJha5sKVVRIvaxxoq5MxO5x0Dd6d8YWomjF0K8X?=
 =?us-ascii?Q?bfjWZbWxiq/bbQQYdQOf/19JR5AkXsliJ3LinIxr0rgEo9YVzakwrbsR3T6/?=
 =?us-ascii?Q?4j8OAWnX0GWkMWhwGYdcgSyHhY33b46FDpD8175AjlCjogr9uo5cMJiuPjiG?=
 =?us-ascii?Q?Z8KdHN9JwMFUzEa0GMxbpyg4TqaLQa89ymFtJlrUJEdScjtx/9UHnqEFuu6t?=
 =?us-ascii?Q?SE2D4d6/sYshtOe1ObLirw3oRzK765P34zqQIheEIDa3vT3edORlfMxWV4jT?=
 =?us-ascii?Q?U+YyPu/PGg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1270.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5551556-c117-4d63-d185-08da38ff05e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 18:48:39.2606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEeiATNxx1co9MMGH2G9zC78j7/Ng/9OKeQfZ971BGnuqKgWQlrcIS72eCKWhSRnYCJ9+JLacsJJMF9D3GuoFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1399
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
 Stephen Hemminger <sthemmin@microsoft.com>, "deller@gmx.de" <deller@gmx.de>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Dexuan Cui <decui@microsoft.com>
> Sent: Wednesday, May 4, 2022 10:05 AM
> To: Haiyang Zhang <haiyangz@microsoft.com>; Wei Liu <wei.liu@kernel.org>;
> > ...
> > When I initially implemented this driver 10 years ago, I believe there
> > was smaller limit for the fb... But I think this patch is good for the
> > newer MMIO alloc scheme. I hope to see reviews also from
> >  @Dexuan Cui @Michael Kelley (LINUX) who are more familiar with
> > the PCI/BAR/MMIO area.
> >
> > Thanks,
> > - Haiyang
>=20
> The patch looks good to me but I suggest we check with the Hyper-V
> team to figure out how a Gen1 Windows VM supports a higher
> resolution that needs a VRAM size of more than 64MB. Just in case we
> miss something..
>=20
> Thanks,
> -- Dexuan

Reviewed-by: Dexuan Cui <decui@microsoft.com>

Saurabh checked this with Hyper-V team, who said there is no
Generation 1-specific block for larger VRAM sizes in Windows VM.

When the driver was originally developed, we didn't have the API
vmbus_allocate_mmio(), and I guess we just used the PCI device's BAR
address for simplicity, and didn't realize the restriction with very high
resolutions that require >64 MB VRAM. It looks like the synthetic
VMBus framebuffer device doesn't have to use the same MMIO range
used by the Hyper-V legacy PCI framebuffer device, so the patch
looks good to me.

BTW, please check the hyperv-drm driver as well:
drivers/gpu/drm/hyperv/hyperv_drm_drv.c
I think we should make the same change there to support 7680x4320
for Gen1 VMs.

Thanks,
Dexuan
