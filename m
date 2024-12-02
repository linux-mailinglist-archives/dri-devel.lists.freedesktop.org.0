Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644219E05B6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 15:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D349B10E787;
	Mon,  2 Dec 2024 14:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ol44MBbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C336610E79A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 14:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPeW1Uz9StivaPJw8i3NAozp8ALBNtZOjtuVzZhh39/Wj5iF1Nr6KlpGjwc8DkRBayX10TtQ3W90523+V6Q/E5RcajaDFThp6TbWrm4gNSPFhjWQz0UCWIkMDLEAIuc6tn37lZbsP4I4wG8PwLkPE58kyXP/9SFdXR4ecsEsBgd70zKd7ULOo9jOyXQWqioquDfAAMFENCrf0idCzaj1gC3CpBzcfjaDCU1eXKvS5aa/xgJPgQm4yBNF1Hoc2nQPRBCwjCPQDOxQLBCWG3QBvxhSRCizZ5viI84PtPrST5LJ96LB4JewqQMljTawXBxjlDlvuHT/g/t3h2Ek5/3RNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHZcoHWthK3VyFr6gZlLFPEV2FWP12OUHMjYZwQx1t8=;
 b=BZaCxK3lHu/zu5i77gwMq0ps0hAB/VKkHHGtNqITeoa8JCFV7SKQJw+e6oAaloAmf79H3m1uvJFlfJW6sc4D38r4aXGxom9FbOUnBRSpagjrdIGeqbiarx6MtY2LhCi9ZJ5TxNB84q0fA3/ryhtPsPog0sCR91aLcJbBqwzkjBERNRvXmxtyKQR8YwyS0uHR1WlIP/mMTPuGoCiS2Fobd37r8UQiuPnT9yIx+Ze5zGBK+vwCBmVYpvkpzGR09N/4uszjAqietnTxd0C36PA6+t6pnrWTeNKk3rsHdLh0XbPBvNrwBtjJN3gRgw6eZOhRbQl2YHgPlyfi/gGBrHtF7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHZcoHWthK3VyFr6gZlLFPEV2FWP12OUHMjYZwQx1t8=;
 b=ol44MBbYLgT6XZN8XDj0OpdfKvZgdb/RZesGxoc5G+6t2IATAdbiWwiShC6/q3Q/PkDf93zKEKW9HJYO/lwAToipomhoPKYvBAaKL7v1T9RbzARkDWwX8Dvl4siAhI0lBuEGapluhVghjTvMvbRyOaEVEbRqcDRytoR3PqyDimA=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 14:58:09 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 14:58:09 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: RE: [PATCH] drm/dp_mst: Fix drm RAD print
Thread-Topic: [PATCH] drm/dp_mst: Fix drm RAD print
Thread-Index: AQHbQLG3mX+sSjptykOFIV4h6qZFrrLOt9aAgARao9A=
Date: Mon, 2 Dec 2024 14:58:09 +0000
Message-ID: <CO6PR12MB5489B97C281217F0F931F177FC352@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20241127094938.3640463-1-Wayne.Lin@amd.com>
 <Z0oi2-Uv2ZCGKOGZ@ideak-desk.fi.intel.com>
In-Reply-To: <Z0oi2-Uv2ZCGKOGZ@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=f74c6f42-01f1-4a98-82f5-dce56e7ae583;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-12-02T14:53:32Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|IA1PR12MB8310:EE_
x-ms-office365-filtering-correlation-id: 295cdb94-59db-4dfd-3c3f-08dd12e1bc41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?QcoksXyFm22vkcaT4Ajs3dy8tQ1g2sv+AtN2to/QPkNsBNhrZsWwxGwIkK?=
 =?iso-8859-1?Q?HuIayaasfaE22athtrzyp7TClSjl/pzb5fZiJ3uWZ+EJ44KhLfm6vMWL9Y?=
 =?iso-8859-1?Q?AJuOwU+yw/gh8v+wWPEjg7kwTG2ZsSy9u8n0vJdKKjZrnzUBdaub5BXRXL?=
 =?iso-8859-1?Q?ik8ELMdxI41zzKHxB7nezoczEdqW4Pck/dgmS87AIN42uh0tFKD4P6lsHv?=
 =?iso-8859-1?Q?j9lxWxkWRz5q71Vfs66qbsK48v40RwFxo5QR01QJ4HaPdtjzYBJ2D5cJVd?=
 =?iso-8859-1?Q?KwHhPtHH4fMarxniWQu2+4YkjBxfymd7NcWJIrG55We8SNumQ0Rp1IsgSS?=
 =?iso-8859-1?Q?Y+3dDvmUZNwGc1xXrtwD8esf7uva0fg90HsGd4OWglrTlAnJf/pg8hd6bd?=
 =?iso-8859-1?Q?ZpUzrWN0P9/ZTslNPT2YibI2hOGqUpUqbFVvvfpw0cb5uAUWPlED679f3Q?=
 =?iso-8859-1?Q?KMweUXBDq9p9/66MXAg7bf357h4zTKiMKRT6UUYR1SYI92zoviGSFQnxxM?=
 =?iso-8859-1?Q?xLWTlZriVnhgjtQM8/64B1T9Pc4Be2FY9zLwlg4WzEzMmAAJlO7qwrLYNn?=
 =?iso-8859-1?Q?ZVydRKyHvpue/Yz/WNvqa9l0RPzoKiHEWZzLZqGS3kmMUwPh7Rq5WEaPqb?=
 =?iso-8859-1?Q?E33yLR2j7NAuokIIrMl3aNS8WHjGqXYHQ3LccFO6AACY30ljPT3b70gLm4?=
 =?iso-8859-1?Q?hCztSxFEdficFhkVyRpdaWya0K2qUAIsPRCSiGar66GgedmtKnNh7UHvW4?=
 =?iso-8859-1?Q?B0pqACEii2L3rqqp+YRpbx/XSCkOG2AjP2xNU9AAcm3Sug78fLmbH/danU?=
 =?iso-8859-1?Q?xjRbeAEeiNL0qvnLQ4reGkjsUGIlCMyHAFj07J9swbnbZZ1RY0ux25UETm?=
 =?iso-8859-1?Q?zrM/S9TnS0VNWhyyYexpCgZg1MWoAWGOkhhxr+fVfdPxu84KjNl/0kC6w1?=
 =?iso-8859-1?Q?wB/LKP+jXtAEJrI//S4Yth8YVhVsM6jbWE6EKos3GL+yYu1Y9sCLC4us90?=
 =?iso-8859-1?Q?Y2j5QaCHcWkly1IyKT6/WkzkkaY2RNMPkLQrpdHYPDnvsEQQX0Ho19Lb8y?=
 =?iso-8859-1?Q?CxisIf1BhKU4aJsCfvVJuVyUmmFs1nzX0+KsdFQiZTlH2Td0uPTibrnnt/?=
 =?iso-8859-1?Q?UxkRQRHuOtsY+5NtC5oAc7+pRKLrJOQyzFJFF4qMm047fM/m21vHgufjBf?=
 =?iso-8859-1?Q?skkXb4yogyGiKh/35d3zorc3OU9rKVjfsZn9Hf9H0klzmygGa/4oQcYYKf?=
 =?iso-8859-1?Q?KRHMXAVFgZRq0e7fVdfCkMC2v4uLeDaw2zh/DmxG4JWlHbqFCozaAaW5Y5?=
 =?iso-8859-1?Q?6Hyzh946gX2ul57BHrQKMPseqHkT6MLXnnF2urI+29IQaUtEr/PVlnqW+B?=
 =?iso-8859-1?Q?1BcNr3UXYygcKV/7N5l64ASV7HANHdlP+5ytdvAfmAQ/L81MUSKlG9XHI0?=
 =?iso-8859-1?Q?BitMiRtFgTJOVNiJM56HkZzqoVX01dZGrLg06Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?N9MJ/koMrfYcif8ND3WduG2xzTEfQmpPEgzXBh/nQR4Svd0d5Jj46abKtu?=
 =?iso-8859-1?Q?FrxmZpzo6MJdVnbIvffCLVB/5gw6/oxruBRDDjBrSMfvji1jNnzTAeJOFN?=
 =?iso-8859-1?Q?ydrcqysKzoVlE+FDnkuk8S9D6T+l54d4JsnqMtGVwuOMaClrV5D8qppp6V?=
 =?iso-8859-1?Q?AfT+EWEDB8EcgKuYwUqbyuAa7qLjAnNDxlrm0iStctT/Qvw7+z4JReZGHl?=
 =?iso-8859-1?Q?IXJiBDmHk/1DsBzI+g8gNxLj6LJmE1gvoeB/00BkpqJmZRx94R2vQUa2I1?=
 =?iso-8859-1?Q?+7dTi0qHcfq8YVrOHmTlIdFQPzokc0Ynm1jDJb2qFakq9TQ8mH+qK6n0e+?=
 =?iso-8859-1?Q?HS3rTRLmviSSPRbVxFCX7WRKNzmuZ7gnMSVzguj0oeJHV4HjkUgg19MXy8?=
 =?iso-8859-1?Q?aMczlpAJ8i+epsS1mXu9RMF4Rmay/l/aoFtXjvPjWI1CiT0or52XD8s1jO?=
 =?iso-8859-1?Q?m0dgVzhYY2UepKycWcTaHyuJJ8jrPTTgacTMYkU3Ylaj2547Ea4hA+txGT?=
 =?iso-8859-1?Q?iI5PV70rQaB6MI8TnHsw7CSiByDsaio06judg5s3dpHW9Exot/+tkxuGMP?=
 =?iso-8859-1?Q?vuf39iRMnf0olHG1Jq0QkWjH/Khiynkz4pZPZEWAQlUD0fbOdN+syWK5Cq?=
 =?iso-8859-1?Q?f9LWxJ8ea2FNrvZLkN4BM3MnOKX9QzFmwF4g46exYMzKzm4vnH/mHrECC7?=
 =?iso-8859-1?Q?JqrGpTexdKlblw0VHkwcX9YPF9idpr6FgTq+6TLZcz0Oy2SZJW+soyNwJt?=
 =?iso-8859-1?Q?BOy+8s7h8E4AYdlBgScUMnuZugQ/oFy68j4+uqAWkfKABNz3W1jvt1bnix?=
 =?iso-8859-1?Q?CRhJq86h0BWtBUGNVSzwuocVRORvptK3EhAuaGSlHHV6LM1IgciYVjOexn?=
 =?iso-8859-1?Q?q41sWxMcZhZ/yRsGsB26FnVNCjtofVoY5+0v4Jfwbvh3zr/ilyZbNUneGd?=
 =?iso-8859-1?Q?2NnMP7HeP5WpXgEWlET9moicTcWUaqLDqV4DpXEl3om7HRIRHVbAgK1QiV?=
 =?iso-8859-1?Q?3AnYvR0ot/5ZTXJsy26u+aqu+qsbINnklDPw5yxvnNTXwGsmF4jIqD+UPc?=
 =?iso-8859-1?Q?fTDpGZi9s1UoCuavtHqotNr9GWEsNlcr5pML/ZcL6USL0BbhJu55I0dPGz?=
 =?iso-8859-1?Q?++as3iK8X2uRSk1Z6SP8Tv0VYiSFebEhbH82CtjMX8MpU0OoIKhQcpxx0S?=
 =?iso-8859-1?Q?niy21eg6hvbkBglca0jpUDl0b++Ktwe4/VWR7cdzwlURPSKzG8EKutqZ5F?=
 =?iso-8859-1?Q?fyXerr2pEZinR6PsNXVwzhMLr8eaSmpXB94xTI8lfv8WmMkTg69XNsuEkd?=
 =?iso-8859-1?Q?nqWhVXtTw87Hy8ctUbeihZ6tyr+xdCvocn6P6Ee/Vijqm6erGDCWdkyaK9?=
 =?iso-8859-1?Q?H4jQHsJzHSCg0YXNvvGgiPUE48JKDSj/0y7DoeWTn667bSVb77E17P3omY?=
 =?iso-8859-1?Q?9l0TzrcOCYA3o7UqPJz4oBRijWTsP7m6Blw1PFlFAUUfOGZPeewanNzrQ7?=
 =?iso-8859-1?Q?OsS4FR/X+V/gKy641Iah7OkewI9WNZ2vV1m2JAM7ogfeZGXKgnzNkLBc9i?=
 =?iso-8859-1?Q?+YPe1xzXRdkNgdEwiRnykYI479DZvSP9R3Oa9XkAs5DByHL5/oVHXhwkTr?=
 =?iso-8859-1?Q?8nchhMd/xcxnk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295cdb94-59db-4dfd-3c3f-08dd12e1bc41
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 14:58:09.1309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PiCR3OumMCRZw+vf/j//YK7fio3HdBtPibxQ6kHXCFufKwIYJsiTUF/Gzj5M7kYsIeFcB0r2xQiCrg078VBAnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310
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

[Public]

Hi Imre,

Thanks for your time and suggestions!
I'll adjust it and send out v2 later.

Thanks,
Wayne

> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Saturday, November 30, 2024 4:24 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; lyude@redhat.com; Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com>; Wentland, Harry <Harry.Wentland@amd.com>
> Subject: Re: [PATCH] drm/dp_mst: Fix drm RAD print
>
> On Wed, Nov 27, 2024 at 05:49:38PM +0800, Wayne Lin wrote:
> > [Why]
> > The RAD of sideband message printed today is incorrect.
> > For RAD stored within MST branch
> > - If MST branch LCT is 1, it's RAD array is untouched and remained as 0=
.
> > - If MST branch LCT is larger than 1, usd nibble to store the up facing
> >   port number in cascaded sequence as illustrated below:
> >
> >   u8 RAD[0] =3D (LCT_2_UFP << 4) | LCT_3_UFP
> >      RAD[1] =3D (LCT_4_UFP << 4) | LCT_5_UFP
> >      ...
> >
> > In drm_dp_mst_rad_to_str(), it wrongly to use BIT_MASK(4) to fetch the
> > port number of one nibble.
> >
> > [How]
> > Adjust the code by:
> > - RAD array items are valuable only for LCT >=3D 1.
> > - Use 0xF as the mask to replace BIT_MASK(4)
> >
> > Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> > selftests")
> > Cc: Imre Deak <imre.deak@intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Harry Wentland <hwentlan@amd.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index f7c6b60629c2..152c60f1e80f 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -179,13 +179,13 @@ static int
> >  drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
> > {
> >     int i;
> > -   u8 unpacked_rad[16];
> > +   u8 unpacked_rad[16] =3D {0};
>
> The usual way is arr[16] =3D {};
>
> >
> > -   for (i =3D 0; i < lct; i++) {
> > +   for (i =3D 1; i < lct; i++) {
> >             if (i % 2)
> > -                   unpacked_rad[i] =3D rad[i / 2] >> 4;
> > +                   unpacked_rad[i] =3D rad[(i - 1) / 2] >> 4;
> >             else
> > -                   unpacked_rad[i] =3D rad[i / 2] & BIT_MASK(4);
> > +                   unpacked_rad[i] =3D rad[(i - 1) / 2] & 0xF;
> >     }
>
> So unpacked_rad[0] will be always zero, which represents
> drm_dp_mst_topology_mgr::mst_primary, but not actually stored in
> drm_dp_mst_branch::rad[]. In each element of rad[] the nibbles are ordere=
d the
> most signifcant 4 bits first and the least significant 4 bits second. Thi=
s could be
> documented at drm_dp_mst_branch::rad[] imo.
>
> The fix looks ok to me:
> Acked-by: Imre Deak <imre.deak@intel.com>
>
> drm_dp_get_mst_branch_device() needs the same logic as above extracting o=
ne
> element of RAD at a given index, so a helper for this could be added and =
used in
> both places.
>
> >
> >     /* TODO: Eventually add something to printk so we can format the ra=
d
> > --
> > 2.37.3
> >
