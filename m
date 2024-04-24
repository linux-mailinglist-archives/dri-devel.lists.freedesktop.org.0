Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B38B12E1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 20:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA50113D33;
	Wed, 24 Apr 2024 18:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ITZJBmu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E3E113D33;
 Wed, 24 Apr 2024 18:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Geh5t/iLDwQFA0lOTZvPw8OnTdbm8h1LG9GJAZ69eZr3c/teoOzxT6/4xWfp9AD2XTkwT1yc/Sxb1mVDHgLp3CQ5uUEsZ1y/l0+ZeeRx4VvGtOXpF/tMTwZVu4SNpDLO1DSGCLIXMs/j9eVBlblw7Pigcwsav0YPWRaPD/Vh1/cBPsq0hdq0hWCfAHll4dAFU5mNgfYVanKk91RqzedWe0f82iEvcIGowYB40D1LIiFTK667cDVbL6lxOY+DKGUYU0Bjj+fcisL9Du0N7eCc0MSeseGDs9CthV/epOx2JEaj75wrZlwSCDLUmILcV3a6kYf2TzVqQzGrCsOikSy+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kV113saVlUDkbDp6PpetcWyaoJY3EW9j7SotxakYYQ=;
 b=D2kR/C4qqDMVZpiyMOVNgAwbxLBu5Un689Bn811IkuhqK8DPBozqN6QjI21y49cFcNhFwCm4UF6I48oq5Z4OgxmvtQ/vVbfPXfslgq2XeUIYkJtbEdvBoNMyNsotYv+9qWloKs+op/JymiyJSsG4uSgTe7eCmzxpwUrGqDByC+0ASg7goe9qTCPoI9lKeHHF+ofQTi3hCBsRXGRAB+F/9I9YUZNVjTP3yWvhXa+UrHOK5ttuCOjp+9QPsjTOgk23qwiJ0ZOdSLsf69vIgVyoVRaxeNyiP3SMyV5yzO1CfPDZGbSSbHlp3L1fe6fTWN+DYQb7JXvtixYbs9gJ19KQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kV113saVlUDkbDp6PpetcWyaoJY3EW9j7SotxakYYQ=;
 b=3ITZJBmugYFLCbLRYTqeiGV8iMGBg7307BCH+wILL421mLjTbs2Kx9ms22vQruIcYWJqIORJzCKAmCd1BMYeZOpKuXjWd33fuCN04LHtTd9tgqUlhtSiZ3dRN7lFMOxibpI5CyZCReU/xnYDTSO2PVqjriyz4TwTJTciPJa1pW8=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by PH7PR12MB7281.namprd12.prod.outlook.com (2603:10b6:510:208::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Wed, 24 Apr
 2024 18:51:46 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%4]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 18:51:46 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: Nathan Chancellor <nathan@kernel.org>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "patches@lists.linux.dev"
 <patches@lists.linux.dev>
Subject: Re: [PATCH 2/2] drm/amd/display: Fix CFLAGS for dml2_core_dcn4_calcs.o
Thread-Topic: [PATCH 2/2] drm/amd/display: Fix CFLAGS for
 dml2_core_dcn4_calcs.o
Thread-Index: AQHalnP5vRegRm+Bq0SzRhPEu20kJrF3w8I+
Date: Wed, 24 Apr 2024 18:51:46 +0000
Message-ID: <CH0PR12MB528408827DA4E7F92BEF5AFD8B102@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20240424-amdgpu-dml2-fix-frame-larger-than-dcn401-v1-0-5659f8fa8816@kernel.org>
 <20240424-amdgpu-dml2-fix-frame-larger-than-dcn401-v1-2-5659f8fa8816@kernel.org>
In-Reply-To: <20240424-amdgpu-dml2-fix-frame-larger-than-dcn401-v1-2-5659f8fa8816@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-04-24T18:51:45.850Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|PH7PR12MB7281:EE_
x-ms-office365-filtering-correlation-id: cab43ebd-682f-4336-132a-08dc648f9767
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|376005|38070700009|921011; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uxnKf0SPoBAwHMLteUB69RToJCRPecf9Mxjsgnhxy44QvwGFDRSfw1jkhPPe?=
 =?us-ascii?Q?wezGgLiU84ARjJGV3m93Oa9gIEEmPfo3SDPYT/pkTJkucDGB4I2lFNGU3unO?=
 =?us-ascii?Q?4hocJ8RCTwQym4T4vOIsT4wRxtc2csK8d/++UFnKy8S85BibF8GjSc//ts+x?=
 =?us-ascii?Q?A5GY3xMXqqwnYFjTo57norANdHpEi36b7B5zNd2aEdsY/RWCWw3pd2bcwipV?=
 =?us-ascii?Q?vvkOt22aBCGtCBu+gmuIgDDzE0ywg1X71aXf1/ziH95BNZaf4KyS3sotr6mV?=
 =?us-ascii?Q?FELLQdrkjjBktSHqMiEcnnoQkSeGO6odqELRzyJYlb6ksSC0PSP+yvyLGz32?=
 =?us-ascii?Q?rhtwkwrSBD5vLOdQ75OoY58fSkXMLpKvQ4ItOYwzSCcYGPMrD9WoMY6HSifc?=
 =?us-ascii?Q?t92lt+OgV891yBy0HPX330wm2ZlELxLOQGbekeJYy3YZn+/HtkAq30UDAZKO?=
 =?us-ascii?Q?h7/uaq1ehVbAGrz6EL3/3JdcPhjsBrPDdIpGKpa/EoYwG+wAdnqpDiw/KVr2?=
 =?us-ascii?Q?L1r5SEaJgk9IAkNLICIRFOa9lyqkeWYy9vgZSjILOeEvWwkC1WnuOgLN99nT?=
 =?us-ascii?Q?gJHJ8c36tKj/d9ZZdZ3QRFWFc5p9FDdjgq/nyco4zl9ogUhQ7vS/luUkZSew?=
 =?us-ascii?Q?K8YfI8odnkA4MLhDMeCRpnFS09MiACEVc7SgO5W/SCPxDqHl/qByFRp92Rkt?=
 =?us-ascii?Q?VuEETDWgEHMK6O5ukOYqMf0sYK1Wjf7AeJ/93bHoqiStgNQ72hfWztLt4qkN?=
 =?us-ascii?Q?oU2B3l3c4r99fQuRlGw9P7IpA5oCSfub75QTVl+9uqC//uslZUkpk6pTX8fL?=
 =?us-ascii?Q?2/lb7ixUO+lAbbPEbNiyRJfCenW8UTiiXHNuFEX6XHMWfVgG0eoPaYs4r0K1?=
 =?us-ascii?Q?wsPh9DTMwREaGaAjl7BcOhWJ+59Q1SxLjNGATBMIJEFCFq5h6CRQsRlEUjeN?=
 =?us-ascii?Q?wWkb64vulBgkpz+EE6Ds3ISlf/nYmtFMnw3x7G1Po7bY+RywCBvMBP/1wtoi?=
 =?us-ascii?Q?3iMXtf+x8A+HGYt9jTW1S5zBgfYCtnzrBNmhN8gQZl+EqA8P7dn6U9rm4yBJ?=
 =?us-ascii?Q?/mHXrt/cX9bGFf4MgxUSjKwst8vPnPdWwfLtUpVQjAJ7xJk2D0q0rtKQJi8t?=
 =?us-ascii?Q?DAPYcSKi+plhVdVJ3yzGDkaD6+JMMhjkFICTJ2hmp//hfvK+SAYWvH+f/9Hc?=
 =?us-ascii?Q?N5i6KqY/uUlm5xNtaGBbY/0eFqC+rlxmpHFCWBZunJ3LMDQQO6xOA0msyqTs?=
 =?us-ascii?Q?jsky7i/tnfb45zJIEr69oFotBCTCURxzZiiZW773mVo7FrMXaNc1UC/BpTk4?=
 =?us-ascii?Q?3J21HoCz5ldHvBy6WZqy+PT4GM3o4rzSKsGhTv+ggysC22+dXDh2l7L7C9im?=
 =?us-ascii?Q?8y6iB1g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009)(921011); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+DvWVYr90BreENNJ64R0KWLgn85BU10LpouBcUL7qM3ZQ62X2CbZTocfWHEW?=
 =?us-ascii?Q?8LfURH+SANPFHFSq1Q4ZoS+V6oJsFqxTvguuBkT/SSnjmX5hX3qtHocpGv2v?=
 =?us-ascii?Q?5FGHNAIDcMTN0pWt4eMXXGfAb+iogoahQ7Uuxb834D50YActgZ5Zb0FtBNq8?=
 =?us-ascii?Q?3rUyUIUNWBkU9Q/p2za2weGGtndVpVbzDC8q5BoCnWbqvIVmOefpCHNuGjW2?=
 =?us-ascii?Q?81r3NjFqZOhv2J4WunCTvY5cOS3zmE5fmS85R9HVVg9sSCPq/Cc4ZBsKHF8C?=
 =?us-ascii?Q?KQHfP4DNRs8kFXJK7T8qJwre89g4cgQoyk9snL1BoWYrCrOyIFAHwgtW4Bi5?=
 =?us-ascii?Q?hlzgyLM8hN/o01i+hGRTRtFxjSU12tfCD69I+65oQIOBKRso/kYaDOEsfhjN?=
 =?us-ascii?Q?Sbd14O/ge4+vyXl1dkZyDRDN+5GCUPbCYREC6Wcj8ZPLsKN4rz1RTvzJ+OUO?=
 =?us-ascii?Q?GN2Q0GSm38Qq4BY2cSK4HlMsGtDFOnX5gDpCysWmRLh+lbqH7+ycTk846YRS?=
 =?us-ascii?Q?TirjBjdXmP9j3zHtNuueboARSOkNj0jjnZIeZk8VoxT3R54XAkj+MGHJGdDt?=
 =?us-ascii?Q?FhYqMyg0GQwmnN9BOg8P+XKxTu10Lr8zWeOHzfFylAb8tvCHgSc6y+ZT1o+g?=
 =?us-ascii?Q?u0sEathaLPZpILAQbfvSE0gf9jHK8yF6YscVxf1LXtPbbFtIos+RGOYuuMP4?=
 =?us-ascii?Q?tOFEosFGHQ07XLLENYfTMYAsAr4jOWNPi89AiRgUFnez2jqk+HBNreY6/rh2?=
 =?us-ascii?Q?zK0K1C4G7SAJ/vzpZlUBc8HAh0t7TdGOPYVbT5r0Sb36nknMa9Cenh/Pcf5Y?=
 =?us-ascii?Q?Dh0ygAYCfcekMOlVWwndYT1HXRMaQxB3UusWj3c8dd0Vj6kJ2HYXs7y51Cnd?=
 =?us-ascii?Q?mVFcyCHP6y/rOnfv0FvWl2kyWYBYV1T/oCLR6RVGmLkDzMF4vBV9rnffRELw?=
 =?us-ascii?Q?mw2abqq/LLITmxkaDc/BUfun/8+LwqyVBxu4PDGxBQBJulrr65uWnyCFuvBD?=
 =?us-ascii?Q?ym5RJ4I4g06ERy6t0UHCxWeuucbU+/5gG/+0qWHvmnYgrI4X/Ow/Qi82oygl?=
 =?us-ascii?Q?2Suz8+DqObTrXimlpRNvWlnqDuMBpCt3v1Ol/xQR8THfFlIKT3xdCvHO7Z5Y?=
 =?us-ascii?Q?ZZ40qXAhqDTfp47NQH0fS3oi8PZFCBM+UpT4zmyDXia2tVZQARxPQQ8sI/yO?=
 =?us-ascii?Q?aJVYvI+kla0PmQ4Vc+bQ95vVYHCICF+RKIbu5hATMarLgXUjax6wEkZY+c+a?=
 =?us-ascii?Q?CZKHyx+AhlNnp9gY2L5Ufyr6gu4CuxsWAR8QzESnFhWoFjdWnnEkaItR13pJ?=
 =?us-ascii?Q?MxCaHE7lHvchs8BLnZ1LPpl1FukQ+yldzsEkWqCZxIw5FnFKcpX3We02cG9/?=
 =?us-ascii?Q?gI7r78tQq6+088G8SFmapY91ShwM3n1s6WT+2K/eFOql5X3EhfI+Ryvy/r5s?=
 =?us-ascii?Q?qMPP7dt0eeRVnwChy4HwHMfNsgySkX8c+G1HKCNw5zvc1SIuliQsVroR91XV?=
 =?us-ascii?Q?r8gdfFZV6QJFRG9rW+NpOTdFpyrOd9KOyTDqxQ8ebmHmPW0B3+AskZPA2SoQ?=
 =?us-ascii?Q?QP3a8ivzQVrompiOKR4=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB528408827DA4E7F92BEF5AFD8B102CH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab43ebd-682f-4336-132a-08dc648f9767
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 18:51:46.2610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJ5SNMZi67qFYtD+lOEQf5HZh1TzOVzotlCPSOZJr+xmUDbMwLZ/e/VbgTn2MLAG+BI0/kntecQkV9ttH+KinA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7281
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

--_000_CH0PR12MB528408827DA4E7F92BEF5AFD8B102CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Thanks for the fix.

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: Nathan Chancellor <nathan@kernel.org>
Sent: Wednesday, April 24, 2024 2:19 PM
To: Wentland, Harry <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.L=
i@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexande=
r <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>=
; Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; amd-gfx@lists.freedesktop=
.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-=
devel@lists.freedesktop.org>; llvm@lists.linux.dev <llvm@lists.linux.dev>; =
patches@lists.linux.dev <patches@lists.linux.dev>; Nathan Chancellor <natha=
n@kernel.org>
Subject: [PATCH 2/2] drm/amd/display: Fix CFLAGS for dml2_core_dcn4_calcs.o

-Wframe-larger-than=3D2048 is a part of both CFLAGS and CFLAGS_REMOVE for
dml2_core_dcn4_calcs.o, which means that it ultimately gets removed
altogether for 64-bit targets, as 2048 is the default FRAME_WARN value
for 64-bit platforms, resulting in no -Wframe-larger-than coverage for
this file.

Remove -Wframe-larger-than from CFLAGS_REMOVE_dml2_core_dcn4_calcs.o and
move to $(frame_warn_flag) for CFLAGS_dml2_core_dcn4_calcs.o, as that
accounts for the fact that -Wframe-larger-than may need to be larger
than 2048 in certain situations, such as when the sanitizers are
enabled.

Fixes: d546a39c6b10 ("drm/amd/display: Add misc DC changes for DCN401")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm=
/amd/display/dc/dml2/Makefile
index c35212a4a968..904a2d419638 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -111,7 +111,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top=
.o :=3D $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o :=3D $(dm=
l2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimization :=3D=
 $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o :=3D $(d=
ml2_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o :=
=3D $(dml2_ccflags) -Wframe-larger-than=3D2048
+CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o :=
=3D $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o :=3D =
$(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o :=3D $=
(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o :=3D $(d=
ml2_ccflags)
@@ -134,7 +134,7 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/=
dml_top.o :=3D $(dml2_rcfla
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o :=
=3D $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimizati=
on.o :=3D $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o :=
=3D $(dml2_rcflags)
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_cal=
cs.o :=3D $(dml2_rcflags) -Wframe-larger-than=3D2048
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_cal=
cs.o :=3D $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.=
o :=3D $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o=
 :=3D $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o :=
=3D $(dml2_rcflags)

--
2.44.0


--_000_CH0PR12MB528408827DA4E7F92BEF5AFD8B102CH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the fix.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" style=3D"color: inherit; background-color: inherit;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Nathan Chancellor &lt=
;nathan@kernel.org&gt;<br>
<b>Sent:</b> Wednesday, April 24, 2024 2:19 PM<br>
<b>To:</b> Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Li, Sun peng (Le=
o) &lt;Sunpeng.Li@amd.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.c=
om&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Chris=
tian &lt;Christian.Koenig@amd.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&g=
t;<br>
<b>Cc:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; amd-gfx@list=
s.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.fr=
eedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; llvm@lists.linux.dev=
 &lt;llvm@lists.linux.dev&gt;; patches@lists.linux.dev &lt;patches@lists.li=
nux.dev&gt;;
 Nathan Chancellor &lt;nathan@kernel.org&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/display: Fix CFLAGS for dml2_core_dcn4_=
calcs.o</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">-Wframe-larger-than=3D2048 is a part of both CFLAG=
S and CFLAGS_REMOVE for<br>
dml2_core_dcn4_calcs.o, which means that it ultimately gets removed<br>
altogether for 64-bit targets, as 2048 is the default FRAME_WARN value<br>
for 64-bit platforms, resulting in no -Wframe-larger-than coverage for<br>
this file.<br>
<br>
Remove -Wframe-larger-than from CFLAGS_REMOVE_dml2_core_dcn4_calcs.o and<br=
>
move to $(frame_warn_flag) for CFLAGS_dml2_core_dcn4_calcs.o, as that<br>
accounts for the fact that -Wframe-larger-than may need to be larger<br>
than 2048 in certain situations, such as when the sanitizers are<br>
enabled.<br>
<br>
Fixes: d546a39c6b10 (&quot;drm/amd/display: Add misc DC changes for DCN401&=
quot;)<br>
Signed-off-by: Nathan Chancellor &lt;nathan@kernel.org&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/dml2/Makefile | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm=
/amd/display/dc/dml2/Makefile<br>
index c35212a4a968..904a2d419638 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile<br>
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile<br>
@@ -111,7 +111,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top=
.o :=3D $(dml2_ccflags)<br>
&nbsp;CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o :=3D=
 $(dml2_ccflags)<br>
&nbsp;CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimization=
 :=3D $(dml2_ccflags)<br>
&nbsp;CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o :=
=3D $(dml2_ccflags)<br>
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o :=
=3D $(dml2_ccflags) -Wframe-larger-than=3D2048<br>
+CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o :=
=3D $(dml2_ccflags) $(frame_warn_flag)<br>
&nbsp;CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o =
:=3D $(dml2_ccflags)<br>
&nbsp;CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o :=
=3D $(dml2_ccflags) $(frame_warn_flag)<br>
&nbsp;CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o :=
=3D $(dml2_ccflags)<br>
@@ -134,7 +134,7 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/=
dml_top.o :=3D $(dml2_rcfla<br>
&nbsp;CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top_mcache=
.o :=3D $(dml2_rcflags)<br>
&nbsp;CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optim=
ization.o :=3D $(dml2_rcflags)<br>
&nbsp;CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn=
4.o :=3D $(dml2_rcflags)<br>
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_cal=
cs.o :=3D $(dml2_rcflags) -Wframe-larger-than=3D2048<br>
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_cal=
cs.o :=3D $(dml2_rcflags)<br>
&nbsp;CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_fac=
tory.o :=3D $(dml2_rcflags)<br>
&nbsp;CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_sha=
red.o :=3D $(dml2_rcflags)<br>
&nbsp;CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn=
4.o :=3D $(dml2_rcflags)<br>
<br>
-- <br>
2.44.0<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB528408827DA4E7F92BEF5AFD8B102CH0PR12MB5284namp_--
