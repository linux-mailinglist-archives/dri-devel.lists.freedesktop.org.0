Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B049236923F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 14:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCC46EB8C;
	Fri, 23 Apr 2021 12:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A086EB8B;
 Fri, 23 Apr 2021 12:37:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k13WffgXsYIKJwQIC323Vaexj81LySBKEhM9BtwgjbYqou31RsvtEaec7fdN0bf31ArK95kwKFPNSgGVokBt8cae1f0ywkzDeE2Y54L5aUvy2Zje9x+UXaMEwiEmwVA4/K8YVN7Rs9QFnEjtVpXfIfalo2Ql+sCePQ5L2COb7/hRPcS7vsQgjjtyG+fU6iCrf2OcGGexLXOY3Dwqrf0My+svpPBDE+2V8F9H5eziN4018agmRM5mylyKWq1CGLxeK6sJVsakgfxYmXIiTitMh+0fbmh/LcEgwOfS1jaijVw91eAnzSZANn83FI6joS6V8jypL4vVSuu8XzlpUUI+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJVT/wFpuEXew96CBxdHKsRjLtcbHum1LEe8DTlOfrA=;
 b=J+3cwLEqCglJM8eGYlCPlX1n1DpeUlCXSPZD458y5QVF5gOABiYJotivDuYkfx+zXhwgYqikqiCqfLe7bXUqG32yntvklOUOw8fXM+asXtg4b2LP9eBtiqA/q7cjDlQqTw1lytblkk4XTs6gs141zMcVKAjJ+56RkbJFif0qpyV8itDgvyWXdOioIJaI41/r0f+6MN5YzjVYAY2EKpByyGkt5VV+VR+Gc2V8ud4B741HmGz7YPlwEj485zCUMCuAoZuuVDQkZ2c9BojA5meifa2P/qoKDoH4F9tg73nbvbIKt2FDa7ZGTGjQyC/lrCPAZO9LWCS+A+155ny0TEdQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJVT/wFpuEXew96CBxdHKsRjLtcbHum1LEe8DTlOfrA=;
 b=K9ybcfsykhbLiD3eBqkEtqq/lBgsAV/whHRqXltaN4oCejwrquZgmoY5EnUBNNbLwTP33+75nZT6c4SVz6EeWHnXIQfWEDXEDS9nM/v5fcWNmmsjOfMkTNWWdR/5vFBFSB+71RqWeKYAPiOZh0N1vSUn6oRQuSUuEvqEvStfhnHZdLdiQ7Nc7GNsyUf66qAihKnd6JM/ZT0rHKVHtNUjL2ryYkwOG7JywQqqGltTWWq78gt7kd5zsjkG8c6f1pXYsqfFlKf9gIz7YAIf6bCwFYq9k4fQlN06AQIET7hEQFvoX2tncg+IklcCVBN2LI1Hl1/Zlikhrm/5uR32PsR4yQ==
Received: from BN8PR04CA0011.namprd04.prod.outlook.com (2603:10b6:408:70::24)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 12:37:18 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::76) by BN8PR04CA0011.outlook.office365.com
 (2603:10b6:408:70::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 12:37:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 12:37:18 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Apr
 2021 12:37:17 +0000
Date: Fri, 23 Apr 2021 14:38:04 +0200
From: Thierry Reding <treding@nvidia.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v3 03/20] drm/dp: Move i2c init to drm_dp_aux_init, add
 __must_check and fini
Message-ID: <YIK/rEFE8Q7uWAJs@orome.fritz.box>
References: <20210419225523.184856-1-lyude@redhat.com>
 <20210419225523.184856-4-lyude@redhat.com>
 <YH4PPbY1qqF2NtrN@intel.com>
 <56a931c9f284ee6a23583eb3dc59de4afaa60e93.camel@redhat.com>
 <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2e211a6623664714af1d180eadcd74aa7ef417db.camel@redhat.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d7babf5-0cc2-466f-8456-08d90654883f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4041:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4041EAE114E602847F8C7AB0CF459@DM6PR12MB4041.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9vU8qAHylb9re2J69mf4XScZxQ57TVG4XPaXHh4mK0tU4kOwMdn40KKe9puuBBMf+oLH28x7NkM4w24A5GVMOUwLror11Hn4I5imS92NZYIxd6OqOPNvnRuekVP60F6Gbaej/Vw0IBV8mBtfMmVa3nDJD6JgAlavt9aro10rLInIxmGsez1dbwU9DgQJlxTvEZLxUGcjvkQhpZpYR/HraJ7gfnoTh1lG6WsRgHGdsKwrlRaKXY+pdpX+SxkvTYf1qZS4JZyxoEnezQ9BdRPONn8NLceB09xNdGIQMNRCeRWT/hp5OmYVncLyIHkhNMEG/V8a74iKRUuTX+hOo1sbCp1PzM7koFLUE5my0kWYii0XQa0D/ve6y0G3mcjMIMwuwlwFPMutiErD5jFF7sC6PflfEdzFBgOHxcm6EeSrC/HTxjilBxpjOzMxi5Myxzil1Ngrr9SLdoCg5nscgG3Vc1giFGtMebsmRSitexD7KnCZahhixfJmaqQ3gdZHMK4PipcQKnxBz4s5Q+moO5bE4aXrwKnmBvAMaMu0LVmnqAst7zjK0NXABn7UcF+52x//CU9R3Nk/vcGZjiM72hzHZkhaafeVnwmVnVtuSArHf/SJDEKhsPBz7dEFFiaTag6r1cSwdmGCpNZEtSPJtm9ZuPD4WSs1y+9i6INl/zy/jTsy3O9etoVWWZLYaStdKSD
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(46966006)(36840700001)(54906003)(336012)(6666004)(4326008)(44144004)(7406005)(478600001)(26005)(7416002)(70206006)(16526019)(8936002)(70586007)(47076005)(8676002)(186003)(6916009)(82740400003)(86362001)(7636003)(356005)(426003)(316002)(36906005)(2906002)(9686003)(21480400003)(5660300002)(36860700001)(82310400003)(2700100001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 12:37:18.0750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7babf5-0cc2-466f-8456-08d90654883f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041
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
Content-Type: multipart/mixed; boundary="===============0670864797=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0670864797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2awRgw4WK96lDbss"
Content-Disposition: inline

--2awRgw4WK96lDbss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 06:33:44PM -0400, Lyude Paul wrote:
> OK - talked with Ville a bit on this and did some of my own research, I
> actually think that moving i2c to drm_dp_aux_init() is the right decision=
 for
> the time being. The reasoning behind this being that as shown by my previ=
ous
> work of fixing drivers that call drm_dp_aux_register() too early - it see=
ms
> like there's already been drivers that have been working just fine with
> setting up the i2c device before DRM registration.=20
>=20
> In the future, it'd probably be better if we can split up i2c_add_adapter=
()
> into an init and register function - but we'll have to talk with the i2c
> maintainers to see if this is acceptable w/ them

Yeah, that sounds like a better long-term solution. We could leave
i2c_add_adapter() in place, since it's already half-way split up into
some initialization code and i2c_register_adapter(), so it shouldn't be
all that difficult to split out an i2c_init_adapter() so that outside
users can do the split setup.

Thierry

--2awRgw4WK96lDbss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCCv6wACgkQ3SOs138+
s6EUvQ//VirgmK1PPQtnPIg+Q/fAIqBo5fBYSw7NfM1dMNd4IKPcb8yhgrmPIWLy
tOjcQYVgXRlqey6ebHqvcYMLa7OrCkvlPVX+hqB+u1eEjBjvFPPCfIV4NjWOiyK3
TwZFlyOegjPRaloSOazwq+gqKUs51sDiv/88FdAr7F6xvsyipU+VGZ4KEXSTv/WI
x0j5XzkTNrQG4RjXUJdlyOMQN+YDtaGuIL5ONiFa44WTTGcybW29kTD7t385pcGv
ZvnOiVY9wUeZIVO+YAI7KyOINKTWh3NLFu/FoccaHt8DCwDTLdLF3DgvTBPYGEdp
068Y777F0ZLLZ/NEyJ2pmSK7YnCV0WvuMNXTJp/YnBCKkCMxuI2PUXD4SouaRfW9
vYQc8+c/sUJhTgxhZqSPL4fmRmx/oCStlRw21eq7Ybk/R0hbbX0HcAjv86I+KtIb
7U6RfS6DxSjpHzbPkcystSj6j0dyN3nUTjvOjNA7VOZ8tmNifSk/ZYBQZq/QxHW3
O5vD43PsQRJv48d5fLlX8sXFa49VC+ur/BxLYxTd39pa9ggwbdecU0tQf/WVnPxN
yHrJpL7r+tBCzlHCxgddCddqBy5ZoqhIXNyCBOwT24bVPvrcz3zkdOLAl5ryWWgQ
jqWgjg6ByEs5+1byL0gCEsRsEF3Q4ypz+7vg0TSoH+VvzhSFBB8=
=eYLx
-----END PGP SIGNATURE-----

--2awRgw4WK96lDbss--

--===============0670864797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0670864797==--
