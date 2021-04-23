Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60D36922E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 14:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8DF6EB88;
	Fri, 23 Apr 2021 12:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D726EB88;
 Fri, 23 Apr 2021 12:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFkTKoVCM4XmiFFPctpwH3FAUWmmCIp0DVtobWGn7TElhl/KS/JMd97/olKxza7AWTHgVGsvlBB2xkLbZzOlnalAOK9XKpK/RhKxqr+KLpJTwA+el+xaGk9Gl1N8Bo71criZgE7isZ0MJt061oB4IQ8na2rNDw0ia4OXCKwb+4ASrrQTB64LyFDNONfBFnVvWGmIMroXF6DEUyoIA5HfPQ1TDF23qulh/Y231X2WhIaPkAbU3umLDvt/CFSC+i9aEU3i8/ork2ogBOFYntHIsE5NXloJUdXDcB3RxmbcfRpxxWyC0eZWUOpv4jhv8r+s3SWvakwyDOcMVyjiHGTGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwygpCJ6u3uuxLaHhof0ZJJabLlpAFJDCIFy7/A6CiA=;
 b=gwXwHiZXMjYI0SW3fNqmGw0QnRPH+mdabiySjfMIr7JQ4cMvO8oh3SKY+VysFt46AuUG/ZoogWwyduh7WlX12jbYMDLmlGT5N9YstOJHvgtjkwVMwJ8VxP+oSWQnL3QSYAosnyQmeo18rAH1YPd0uDyGrlYhSZ+YESSii1Cjb/4p0y1hLgBeqocfElnzs5Yj6oow5OXBrCeKuzGfIxW7+4Peao6KMKkZfKtNcjh1Gn+E87u98wVwnXvUzyudJCn13NIprYWkgJ/ad3/NJvoXMLNPnntyc8d3KHmpRSEZ1LYtlGoxyp2F/wz1BKyHXYVH+KDQ4o3AvrqSpNZXd2yrbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwygpCJ6u3uuxLaHhof0ZJJabLlpAFJDCIFy7/A6CiA=;
 b=dJBtE8mpmJ4X2S8CdDfYjQj91XCXLymlMLBuPP/zN+6uXQNrVKG4ITBt3AjxCP5/U/lmLsiLfQlH0DFCXDxSJ4VNFYOiSAmxPu/OOZrpuFQ/sLvu3t93zArdD027M38kv/b1N1eIS09i/WEbBZirwXUimOgCorr4529q4DQ7SqPtWJJBUlpx05xBdkEIWFVXuY97K0uxs7WipVrkvQE70gSraTqE2VDoCsTEBbNKZdiwncWiCX6vewsX68NcBV42slm0pb1aelT9LyXZiDMT0G1Cw6EE6kihPVeA0UM90MZ3WwnH2yka1fi/8Q9IEHoZONA+xUMMB2Hv84pVzx4jgA==
Received: from DM5PR21CA0009.namprd21.prod.outlook.com (2603:10b6:3:ac::19) by
 MN2PR12MB4783.namprd12.prod.outlook.com (2603:10b6:208:3e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22; Fri, 23 Apr 2021 12:33:36 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::6c) by DM5PR21CA0009.outlook.office365.com
 (2603:10b6:3:ac::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.5 via Frontend
 Transport; Fri, 23 Apr 2021 12:33:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 12:33:35 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Apr
 2021 12:33:34 +0000
Date: Fri, 23 Apr 2021 14:34:22 +0200
From: Thierry Reding <treding@nvidia.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init, add
 __must_check and fini
Message-ID: <YIK+zqd31+dNQ7NR@orome.fritz.box>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com>
 <YH4PPbY1qqF2NtrN@intel.com>
 <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acef4835-0d55-4c48-60e9-08d9065403b5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4783:
X-Microsoft-Antispam-PRVS: <MN2PR12MB478390FF082D8FACBBBE8ACFCF459@MN2PR12MB4783.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSukci0wgcnBP2WFhUljxKMbZT07X7HTLoTFUlqJdlpPDOrC1q7bKN0PZr0J5Lq6cxf9j3vsAcjXdto4IlxiRUh3/2ll8TokRwztROyARqaCO1IMb9vMXLgvlEs8Tm/yPgD36G3FGd0+8Yoaeyhx6FItcAkw7jLSQr1Q0pVw5Q6KlzM0Rp9kDR+sqFDp0eC2Q+D0RuNDpPpl3rkWnKmwc66G10hpGwf4jxfRVrpaYXzXzlZvOjEDcjHh16dK3+mvets6spBUI+fkFPB4k3Ig+nFEQEuybv6sJXdfoaFuFpz0ak0LtVZSQOiF4qma5oSTPNipYNJR7m0vdaKloaK1tVd0mKml4xGg6e9hnUH3mTdtrFQHq95PseWXznkkEOfvRe0CxwA7DrcCXAKom+DFq3qKo0YEHMVRhelJndVLCUkTuurhES+zf5cfH8gSNu1K42jTS+D9Z4oMVm2R7gDzgevpykb94F/4pwkNMM3YeW/mCKNvvz3yOHnjAUYeZBRYzqEutbbQV35ZcCoMteYsalSZWMrNGLBXM5BSrQayWIX5kP3efYZv0WK9NKUqnPNQsh6LnM10KKRT0m2yrcAUWtyQfTPgC8TinHmIJNQ8NijeWMGgrMAEGG7/gNkvIQ+3Bg3Nin91B5+iW7qq3e0BL8Ruv6SPGtMTCXPjqF/4fEjRGv4g2t3hUDim1YFnY4/u
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(36840700001)(46966006)(8936002)(44144004)(7416002)(336012)(33964004)(83380400001)(2906002)(47076005)(9686003)(54906003)(7406005)(8676002)(86362001)(21480400003)(66574015)(36906005)(70206006)(186003)(426003)(316002)(36860700001)(26005)(82740400003)(356005)(16526019)(478600001)(70586007)(4326008)(7636003)(5660300002)(6666004)(6916009)(82310400003)(2700100001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 12:33:35.7764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acef4835-0d55-4c48-60e9-08d9065403b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4783
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>, dri-devel@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Thierry
 Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Sean Paul <sean@poorly.run>, Navid
 Emamdoost <navid.emamdoost@gmail.com>, Jernej
 Skrabec <jernej.skrabec@siol.net>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Robert Foss <robert.foss@linaro.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1534974996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1534974996==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q/zesarLA5snuRkf"
Content-Disposition: inline

--q/zesarLA5snuRkf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 01:18:09PM -0400, Lyude Paul wrote:
> On Tue, 2021-04-20 at 02:16 +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
> >=20
> > The init vs. register split is intentional. Registering the thing
> > and allowing userspace access to it before the rest of the driver
> > is ready isn't particularly great. For a while now we've tried to
> > move towards an architecture where the driver is fully initialzied
> > before anything gets exposed to userspace.
>=20
> Yeah-thank you for pointing this out. Thierry - do you think there's an
> alternate solution we could go with in Tegra to fix the get_device() issue
> that wouldn't require us trying to expose the i2c adapter early?

I suppose we could do it in a hackish way that grabs a reference to the
I2C adapter only upon registration. We can't do that for the regular I2C
DDC case where the I2C controller is an external one because by the time
we get to registration it could've gone again. This would make both code
paths asymmetric, so I'd prefer not to do it. Perhaps it could serve as
an stop-gap solution until something better is in place, though.

Thierry

--q/zesarLA5snuRkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCCvswACgkQ3SOs138+
s6HfrQ//ep/a4Nwbe0s5RRznEHU4uqq7eSD0F3tfSfkOTi8oBMMclzsbDNFr/Yyk
1GvAyPyAhTbSg0Tv55O4yAngfu55vRKCXnUNw/YBTGqtvmD0CAjBXAuasmsNABsX
ANHVl65Mw8G4NzbupOk45PKRddQGoRe9Y8kHC50iG5cU6smk6yd66fCFyELsUdJ+
25+1/aPfLeOId94mxMWsV54EBDoAqneaev268rhwQLNB/BmNAIOzpwJmkE+Qup6Z
wObWLYE+POa3U6QG2nqT6mP1BlvNC3iJAUYwE0+ErXufe+u21264iV17/x/WS3WA
ZfTpwgppE2gD4Ah5ejmGaqrmYbvhy60H4xaCy+re0Q+TFvQ539k/gdLCmTlsXAAg
kWW1M4e34y1dM8MCrG3Q58EENMyj7abzEv0j+apxvxjmOAEPqV8LNPpIusSBVhdO
7KYME9BxDC89c10z4GMqfBR/hPn5vU1ZNT3WAtHHefWjGeCXfh764eryBjYtgJFW
YjkNCt/IHmIYSt/f4z5Ou0kE+QxwkzWQzSNvYob9wxx/4vKRA8XLaNfW4pJtDwqz
gW6f7fPM74iG7oHidpKaekx1DC6NqlpvPIBsrLp4gv8S97zDmbe+RJrrr5L6s1M8
Svqruln5bpkb47Aow8fHD+wWrhgQWiW7d6gRpUEI4i04traAp30=
=0kz3
-----END PGP SIGNATURE-----

--q/zesarLA5snuRkf--

--===============1534974996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1534974996==--
