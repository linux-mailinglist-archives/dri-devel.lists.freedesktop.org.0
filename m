Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FBC3C6AFE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 09:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF60C6E042;
	Tue, 13 Jul 2021 07:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410115.outbound.protection.outlook.com [40.107.141.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41305895B6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 16:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLypn4mxJkWh5zlksJsgJGhDOb80IGm4XTOFesB6c/jLX0JW22ArIDDVzFzdn78q3zhI73cR2FeT6veGAljfA0b5uVWdLsaEmpAkcBugNW37zcIpIlHUUNF7vuOqDlw5zpo9Pjer8sQBBHJeqiaaX1UzM2u4dYscwlYYrm/RhdOhY1NOj2RbUXk37j61Sc/TUCCVoGcSeYcLQ6WhAmuYzs2CKVWJVpTzmf7XbXSM3v4/9sRn0MPX93WeOJs1DD4w8gkXFAkBanlt1PgKg5LBSpy+Nu/KpeOlyytPMR0QgVQ4U7ys4qRmLZi7ofhq7jOzE9k/ufc5PPZzbXIga5ycZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+2N3Pc19PFvkvydTV6B001bBKsnKeX6C1pANHtdHYU=;
 b=WDdesWvaPVRPFFf60WPHHBfeqjgql78hq7zEPWFzgeLBCsMGtk7DZmyPN7Cv48T9HBwkT4B2I8RaU0oV9U+mQdba3vwM5MgxpBW/ROEq14vKykFwuIvLRDRDiuO136iNv4JtCZaBUzBEQ3Yl//BT0N3OPuME5hkcSDimAGChSjwhs8wAuGWg0mQcuXaFE4YQ+5lobmabisBGx27e7/x7VhybTzUXcC0YF723bB6Awqb4MOVP10Swt5rNSxU0sQTip93wldDbrq8otqpYf3Vv//i1EkM9IsnoVyYfU6UPVuanXa6z8RZTuE6u2RTh6JztTUYGDo5IFNi9bE5zGvxDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+2N3Pc19PFvkvydTV6B001bBKsnKeX6C1pANHtdHYU=;
 b=SIhSQkvvGV57bZMjw694RDjh93h0qCYmKH9Nu4ltrTBaWsjZCqFCTng66BlqUiaK89EQcRCzaPZ2GrpoHi+EATRYiwXUtOcBQti51ALz0bfY+baqPDj0/Tfp5MUkeV++Bf2kdcyNf8tW+3aUTZ2GDxjSb+h4CtmyQWEzOWTuruk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4182.jpnprd01.prod.outlook.com (2603:1096:604:4c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Mon, 12 Jul
 2021 16:03:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4308.027; Mon, 12 Jul 2021
 16:03:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: [PATCH] drm/of: free the iterator object on failure
Thread-Topic: [PATCH] drm/of: free the iterator object on failure
Thread-Index: AQHXdza8yuvKKiaXE0SOB7GUW8ssjas/gHXg
Date: Mon, 12 Jul 2021 16:03:55 +0000
Message-ID: <OS0PR01MB592294867B449F855496337186159@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210712155758.48286-1-steven.price@arm.com>
In-Reply-To: <20210712155758.48286-1-steven.price@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53c84719-6d65-41f8-d6d7-08d9454ea67d
x-ms-traffictypediagnostic: OSBPR01MB4182:
x-microsoft-antispam-prvs: <OSBPR01MB4182116AD4AC098251845B4586159@OSBPR01MB4182.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6yRpI0Tlr7enjBZw+8JHpyDDv8JdRSx/oSEaL1tqqBQ2Y4EpA2S6bnAebMj5jgOa5N217j6YxQe3I7VDf+jQfclj6X/OxkuW0wO3vMdKwW26ZtwXelpwSbGo4Z7KvtDwvOmIf/Kfdez2hFlnM9ovlfivFqBd22Z/jpMCYm4enhrpuaTjzAJs9XLHpG4StbiR+oeCP8MFTojZg7dDLP0Hx2vSn8lAtYE14Uaklat27iFkCIa+J9UoAhttOvavznQ4cqrnOkqBVDj06353yCkFL0Ji1t3nFw/wgw31eGcJG8JjP2Nn4MYTNx9y5If4Hun/2pXGMmXzE6VE28v/dz7eNQeuE9/tTg4Z+D+S7JZv0fLufH/u5Mzh3qfS/CUBkpeQpF9Rpjd3sxgivvsSHiamx54jFQUiWzvRjbiUhTZRvrm/ifaThhC3F8DHchsJHMcFWiJcgwfGUgQ2CanLkrA5CXC+08oc7hP1KmJ3zZ7f0IkrboPemaxcd/tBJwbWqaYYt8bXPSHT/pppdQIPHEQlDA9YekaycaVDotghc4lmMIbAI5LlnHdTbwKNoG7E5xhn+OPsr4sixtPgyLsadPLmcnWeZtFy3gJAKQpaJ3elWi5BDMJF/nvkMc2th9LI6btiqZlSkSTVhjLCLf+53/J315p/Ll3kkWUuOeEWdzbZthEWgIGOnqgkd8Oz/pweWmU0brtZ+3rw21tuKQpJilBgigEgjDe65KQ75+RVh7Ls5ko=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39850400004)(83380400001)(66946007)(66476007)(66556008)(66446008)(64756008)(9686003)(76116006)(316002)(33656002)(966005)(53546011)(45080400002)(6506007)(5660300002)(478600001)(4326008)(110136005)(54906003)(122000001)(52536014)(2906002)(7696005)(38100700002)(7416002)(55016002)(26005)(8676002)(186003)(8936002)(71200400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A0eTAjK0UK/qp2ECKWmVfhjGbZ/VvGPsB2qGxVVDvOM9ekUDgdxxCGicOyHj?=
 =?us-ascii?Q?0/0eVDzlp++PGsfzahsLZwrjN+nSfLuG8P8/zBwovGJ3qThtlU7uExDa9leg?=
 =?us-ascii?Q?he3Vuu7fuhI9iJqH0ewE2GV/piqej9jKrgwwX69ZiNU4dmEjZdSAZs331pVw?=
 =?us-ascii?Q?xTi/YpfG+F/yls1xjmd/koInXHqE7bNzMMvrjEJBSnSB7PLv5L0aj8FsNtHm?=
 =?us-ascii?Q?5LlIV+fnsrcUas0mR61CgFdnlyem8MMOT8+1cjhTjLP4bkI1ZyDx7PNMmCSF?=
 =?us-ascii?Q?ICYmG+Hyo7o311cFUBRI03QLA1hZlXspCV84JQQXyIeaIijuNNSLk8ZHWbSc?=
 =?us-ascii?Q?oxVSvYG91Y1wGLXg90I0jAfpe5O5/+uAnr3LIwVqGtcK0Xj9hpnc+y516y+E?=
 =?us-ascii?Q?bdSlsSsmM4tFVBzDelJ5jGYNM6qxX2bDJkvHB7eGLcAFNhb1HzukqBpUErIq?=
 =?us-ascii?Q?J93I/k/QXfl+wm462jUr9dZLKvR6PJctvElepvOmkqhR8Ru3ldIfcAJFY7lX?=
 =?us-ascii?Q?vmBMZUy068LCi+g0KAP8IzQZZ2Gq3W9Zi3OeSsPvnMNe0aQYYD8fR4vknNOk?=
 =?us-ascii?Q?aYKLYYDHCh0W+atx0JhYgmW6RXQlfFtzvqg3s6o7A9CmxVgJ+f+uRhtDcMpk?=
 =?us-ascii?Q?Mnhm7Q+MLROUb25qb6UV369knyfRpAPxpwlNxEFTybGtescBOzmp+3fUHgaf?=
 =?us-ascii?Q?IDM4Myc0iF690CuHoXOCN7WEDv6tNrr7+VVIf7aKgCSGgU99HONNhZ1WnvY5?=
 =?us-ascii?Q?O+yXwXhkXOwwsGuzSZN4xY7P5Wag8dH6ZoZkDBPl1vdJuxySBzhgAj2wzDRB?=
 =?us-ascii?Q?DPM49lfIjC1pEa5f6p0H+XWrwsTydV6tX8LxEO6GPP2k0olXbtQ/6RmCDE0J?=
 =?us-ascii?Q?Xf1XYO80olGJjhhyWu42BpsBakhTfOuFzkND4X9jtjXNhDDcZ0n2a/Fo2aPK?=
 =?us-ascii?Q?evlVIaBVQVS6eFlAeFpfukIL0CsY+zOA05Efapbbk1tpo7smv3Ien1Vh/pHb?=
 =?us-ascii?Q?AmVXBxLM1jqMG4+rQqwsfaODfOKpfg+MXbgl4eOA9hQ4hGEzu0F93I78lOVd?=
 =?us-ascii?Q?sbp69bRNJooCsCo+vrOnB1/Rkt9G4t3W+vdBsZ3XImqKEeQsi+BXxgmJVWHc?=
 =?us-ascii?Q?mn6hXbpxtm4zpnjhRvRkGQQBPEFJ22yPlXwBo3bM3VLBRe74OahdlBmRTsm7?=
 =?us-ascii?Q?EKiwxMp/AVsAPvLBIQs8U/XA4HFn+UdeL22jZjaP37DJRnN1x+I+Q0buS9Jg?=
 =?us-ascii?Q?hejOngiQomQNMiWExTb1qp3Ksa46CNWwdPs2sqezXfEW4rHnP8AdoyPzMzlU?=
 =?us-ascii?Q?IwzZJfp9iTz2PLiq6u/hEzzu?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c84719-6d65-41f8-d6d7-08d9454ea67d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 16:03:55.1352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fe7hbul+KaHJ7GhfvPtvZtWRKoA3KgP6DJebgljY4/UXV9r2tqkvatxwA7HGDFWpqrRp5GicoOnUVBuWQxCL0IJcmd9frk270LqgZoNeBlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4182
X-Mailman-Approved-At: Tue, 13 Jul 2021 07:09:45 +0000
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
Cc: Pavel Machek <pavel@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Pavel

> -----Original Message-----
> From: Steven Price <steven.price@arm.com>
> Sent: 12 July 2021 16:58
> To: Daniel Vetter <daniel@ffwll.ch>; David Airlie <airlied@linux.ie>;
> Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Steven Price <steven.price@arm.com>; dri-devel@lists.freedesktop.org;
> linux-kernel@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.com>;
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Subject: [PATCH] drm/of: free the iterator object on failure
>=20
> When bailing out due to the sanity check the iterator value needs to be
> freed because the early return prevents for_each_child_of_node() from
> doing the dereference itself.
>=20
> Fixes: 4ee48cc5586b ("drm: of: Fix double-free bug")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/drm_of.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Daniel's email[1] made me take a look at this function and it appears tha=
t
> for_each_child_of_node()'s interface had caused a bad bug fix due to the
> hidden reference counting in the iterator.
>=20
> [1]
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
ker
> nel.org%2Fr%2FYOxQ5TbkNrqCGBDJ%2540phenom.ffwll.local&amp;data=3D04%7C01%=
7Cb
> iju.das.jz%40bp.renesas.com%7Cb0570b66e03a43fb8fa008d9454dddaa%7C53d82571=
d
> a1947e49cb4625a166a4a2a%7C0%7C0%7C637617023006562683%7CUnknown%7CTWFpbGZs=
b
> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
0
> 00&amp;sdata=3DcQICPYJzmgNkFsNw1wMH9Or73rohnCCGH1DrUg3hvhw%3D&amp;reserve=
d=3D0
>=20
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c index
> 197c57477344..997b8827fed2 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -331,8 +331,10 @@ static int drm_of_lvds_get_remote_pixels_type(
>  		 * configurations by passing the endpoints explicitly to
>  		 * drm_of_lvds_get_dual_link_pixel_order().
>  		 */
> -		if (!current_pt || pixels_type !=3D current_pt)
> +		if (!current_pt || pixels_type !=3D current_pt) {
> +			of_node_put(endpoint);
>  			return -EINVAL;
> +		}
>  	}
>=20
>  	return pixels_type;
> --
> 2.20.1

