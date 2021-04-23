Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A4E369244
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 14:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209C6EB8D;
	Fri, 23 Apr 2021 12:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42336EB8B;
 Fri, 23 Apr 2021 12:38:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBr81X2vBWwXaAoSqJtMrAXOciScJA5M15PJ3WRf4Gn/8pfYLj2ad4vrR82TkD84Bjag0c3v325Z+fmtT3cOOVPw2z+XzCgQ6fykmPpPEnGcVRR/2ZDgdag8vSu0Av7yeqGjo2tvN5exDtY75MzCXsgVlNehtrBwmuwrVr65UTtlFKDFxWWawDA+4ZwShivd1NqvVAMgBiDEaFOmgjOGIJMKCubeQUmFuplVyw2DXUbL5zQwLYibf/S+PIDUeFgNTbZzg3nfjqa+Bncam1WTpwxB3bhmvQvYZ1H2qw/O0UGQee2PpSr2BW34JtrW4YSzcrC+0jP9//s7eByV/A9CQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWPNSQ9KxkqhoJ55QrzI2G+iMSmqwK5Mf8t+Kh83yWE=;
 b=Y5AHvrlmtcja5ecpQR7DgbQCwNap6yfB8MFxbSk+RbekFmnf4RYNlsEvj0ciVkAFlf/Zqr5FqDZUB68fd+zvy+ex7S0MiadqUJcfYpQEl9AyJvrbyST1ZJoX+2r9/aBRgSuFvAHcufeFC5Nh0kK/+bI8B0qzE2W806Sm4bsXALpzJNXrJnM+JPhCW0M0GSIV4UpMcbgeIK1e0sDvnoahH4DBvFBFTTcDQvvmHhNniyRAXSWEh/59+mJyq4gab08OTLpIdI0RLbZn3bLEm8xS4uZpLlpnPTn6VDfhM8a8U8yPoyRKIr+W8sEojP3RKhw58fqfYWxdJi23iDYMy2r1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWPNSQ9KxkqhoJ55QrzI2G+iMSmqwK5Mf8t+Kh83yWE=;
 b=MgN2S2jzTXzwvKoU0xjOUwMmHSWSS35AsEof+jub5VBVsLN0AaFCTxo4cP9Hl6NZaeYbz/BLJKUWerjvnkpKQ6ggButVtlzSdmftYSgIxuBeAJdmwbpFSxpXRRsfzC3H+c01wDCRjCDmzkZNzUG3/eRo4CxssibqdQkGteod5npEROq9LdDDefZOyR6Lw0fmXoTofIPzKxsFsCJCm1kFBXPwtkcJ8o8Pj18yVB7rL9T3pj7JV+tpYjrWCnxcOwyKhKD868YESqH5t61TOwb/L0wwv/TkRzGNWeLAkBQQUOs3pbubrp5JbX2TKK/hSyYAnt4BFGvvTXqSaV3hR7N0VQ==
Received: from BN9PR03CA0469.namprd03.prod.outlook.com (2603:10b6:408:139::24)
 by MWHPR12MB1598.namprd12.prod.outlook.com (2603:10b6:301:4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 23 Apr
 2021 12:38:46 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::5d) by BN9PR03CA0469.outlook.office365.com
 (2603:10b6:408:139::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Fri, 23 Apr 2021 12:38:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 12:38:45 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Apr
 2021 12:38:44 +0000
Date: Fri, 23 Apr 2021 14:39:32 +0200
From: Thierry Reding <treding@nvidia.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init, add
 __must_check and fini
Message-ID: <YILABCrcMb5MksxD@orome.fritz.box>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com>
 <YH4PPbY1qqF2NtrN@intel.com>
 <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
 <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
 <17aa145e4cfa3d8852f7411067c5c37bff771b16.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <17aa145e4cfa3d8852f7411067c5c37bff771b16.camel@redhat.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e5276e1-8862-476a-1cf8-08d90654bc93
X-MS-TrafficTypeDiagnostic: MWHPR12MB1598:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15989FB8CE68AF5EE74DD08ECF459@MWHPR12MB1598.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KbvQHVynFeiRSjoGVwxVSIyvQdCdXCNJcAOxh8oxbR1b4MxxFRAr3Ar9OB7Hp9ChX53GKj3mxErB7UZpvzuaFuRT4WcpggDrOAkwnJpiSUECha2pqIBujvDydDKix3FpvYLYVWeKS3V+30s1LhXXH9Q0+Nm5y7BK6uCB4ZiVmF3MUyQqWAGJzWPZ5HQeDrqhPjfwZkUeEUQXf2MMEHC+hD9euzciOPU3BsC1u4W+hbogNirs9LXnPMQg/cwtYP4p++izWNcTRMTWfbGhzW43NgMeNYpetqMc06HpmiQzYRj6m6fSHUDjmWrqM48kOjoBR1EumwJstvzULJfe8okcL9NJLUPYQCJJjPp5MrS+oNjI4euFAVtqJk/jv42UBQgwb1miIs3xPlqMMo+EEWFiG0pxa1vLh4ucmzAc/iSPs2W/TcIAFkvybAs7iBBbj3aJ8j/KvQ/koclwO2ZaxWGYZp5FT3L+B7YHU97oBdGzcLJ0OWmJxtrs59sE9Kvsv1OkCUi0ffUPGuOpp0gzh3u+/1zpwvCeZP5vdxEheVdSIDaEfzkex0QMMg8mGUP3SkfqTi428h4v0MFBX6yJ6KZSyKaIHddiDQP0tONbY8hrJio0Yfw6TagSCcZKa4D6A17dQplTJRtyI2hcssC5aWtyOE1jP/0euopmPqTevsTju7RgkCkQdNPJstVMVMKHJ16c
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(346002)(396003)(46966006)(36840700001)(336012)(356005)(82310400003)(36860700001)(4326008)(26005)(508600001)(2906002)(8676002)(7636003)(8936002)(44144004)(6666004)(6916009)(426003)(36906005)(54906003)(16526019)(7406005)(7416002)(70206006)(5660300002)(70586007)(21480400003)(47076005)(186003)(86362001)(9686003)(2700100001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 12:38:45.8634 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5276e1-8862-476a-1cf8-08d90654bc93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1598
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
Content-Type: multipart/mixed; boundary="===============0178424045=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0178424045==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z6W3/SDV0hp6va90"
Content-Disposition: inline

--z6W3/SDV0hp6va90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 12:11:06AM -0400, Lyude Paul wrote:
> On Thu, 2021-04-22 at 18:33 -0400, Lyude Paul wrote:
> > OK - talked with Ville a bit on this and did some of my own research, I
> > actually think that moving i2c to drm_dp_aux_init() is the right decisi=
on
> > for
> > the time being. The reasoning behind this being that as shown by my pre=
vious
> > work of fixing drivers that call drm_dp_aux_register() too early - it s=
eems
> > like there's already been drivers that have been working just fine with
> > setting up the i2c device before DRM registration.=20
> >=20
> > In the future, it'd probably be better if we can split up i2c_add_adapt=
er()
> > into an init and register function - but we'll have to talk with the i2c
> > maintainers to see if this is acceptable w/ them
>=20
> Actually - I think adding the ability to refcount dp aux adapters might b=
e a
> better solution so I'm going to try that!

I'm curious: how is a DP AUX adapter reference count going to solve the
issue of potentially registering devices too early (i.e. before the DRM
is registered)?

Is it because registering too early could cause a reference count
problem if somebody get a hold of the DP AUX adapter before the parent
DRM device is around?

Thierry

--z6W3/SDV0hp6va90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCCwAQACgkQ3SOs138+
s6EY9A//cFwPyvjLu+eHb3pLCSEg0qBzB2J77wG+98pubCnz3iEdueKUKEx++z2A
8g/F9lavI52JkTvRHvBaiIEZ5a7r0BUNOjtOE7di3A8oNJsnRLV/URw+kPIHXXSr
+9+Mc3Y8eYduNsqhOZPV6CukSSuz/FA0MVLzjX/WjVYNS30XcTOA3viGcJxVw4eS
vAwv3CuE6R6X03Op6fcRFEVFphckpkEiCVhom0KDuWadoHOUrAF31gbHeUA3zfqq
HgFI2FH22g9aRxI9jVbniRayXFBVESKR++tganMT6E0DRUK48lWnjNOppvYqjEgG
fLwLMmbHMfnqIF40kYR+xa20EfWxce/Hu9Fq7zm0Bnq6E7GP3L8MnSWefiUAdZRl
z/fCNCEG2uN27fi10oDhrAv/73lrlt4Kj14wQpzz5Kqek/Zvfcflo6qnxVjdl/Id
MsnqfOYf7ihbJ4y/mHWiIJoB4JvBM0Hm9ian9btTJz1IoaeHLPPUXWniBWWGv75O
cowItScneJVMDAqSg5ebaSTTJGDIW8lCfCO+ZxLn5J8hrKwmlTm5zWjuQfdyFffG
Rf4OugTNG+AQC74rzPKchirTKqljQNeyrDYWQk6FeOEhGzhvzjHlkgDYXTka4pKw
T1hYR1gSeug/F78aatTTWl5XPZam0G9v7mzMhUffzVa048ItTJ8=
=cfh7
-----END PGP SIGNATURE-----

--z6W3/SDV0hp6va90--

--===============0178424045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0178424045==--
