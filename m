Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E20467A41
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2780772FF3;
	Fri,  3 Dec 2021 15:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DB872D23;
 Fri,  3 Dec 2021 15:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtQxxN3l2oE+TdDeIl+WSjiBA99XVAO4IEXCPQSFfKNV+RT+vDLcQ4lMxpadeKWiHOf3rN2B+UC8qiYmp3A8glfwBXGsq+wZZYLXMHT8aWXioQcdkjRCGXzPjHPHKaHfEASY2rxYwNI03YvNwswImaZtslVZmjZ9Uzc9IccxI14AcgcR4A4nsRow/80fF59UdWdAFiwTuiUmzrGBlrebLH/hgUdc2XnnvBgnKgw9uQMvdS+F1ClTRgAtUInBurS3yEUEd5/bVYo0fpQwmq745vkjxqyyBwKtPbeiEU2t9+seFN3UW4MOYJP32P1c1unc9jnUtpvgEcLYM7IbvkFYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Khsr9MXi1rbi4JSXYq6FxPr62e+v6Cqmor5PpGgZjZI=;
 b=WoqBOo4/pjNLpkwC+EO2PWtVk+u4t1XnydPEX33wL56pthd4vyf2IOPJvgttT/ZQ9+tG1JicsrEuy00kaDWB5gQbGIJL0hOB36FceaM8/CyCDoIrREMFsUT43b7tqcX3uTwv7S/Lyzi2Dxu2OyGw/w2La+AFqJGbgY+kqi0yC+XZmLyflYqQ223Iiiulhr70QQFWSWFoQIGU5icFKqMURZkM7UKs4M8tPqi4jMe77FSv2y6nfFCLDsLGPjqarsCGaYYBphDi+oAy4knSkEHZhNcXbsaGhFwtEDSo1Kl3HVsFtfCYEptEv0s8r+4xlyafblptapWk1r7b0QOGyIQ8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Khsr9MXi1rbi4JSXYq6FxPr62e+v6Cqmor5PpGgZjZI=;
 b=VAS+YbmV4qYypsPpcucQDsCzKhS8Ppndz48bDsFoXTnUvCFr0Tvdus9ZidhK+OBNt/OCIf2UzW/D59Gelb75HnUTbDDsx5WeiLJfbUJkDdddqmeo2+OSH0flN5hLzgm4wjVEHE5Sp3YzHs8G9pejCqbKhWb8w9vG5z/hh/VzEGJ0p5UPbWvorMcEZLAt5KAcJLgOVpiLwPxANAJIwrwb+mQVncpnda2Em3mg1DsqjDzE3V66CvXquSCN9yuiYkShgEOGjidYDdDRfMLW7G2VAL2GdvSkL9Juma/RaJzQYXeUIG5VxPMFXBsuico8Wx/Ze38uv9rIT0aylBJZoi/B8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 DM8PR12MB5495.namprd12.prod.outlook.com (2603:10b6:8:33::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.24; Fri, 3 Dec 2021 15:29:06 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::ca2:b395:c666:f5ff]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::ca2:b395:c666:f5ff%3]) with mapi id 15.20.4755.019; Fri, 3 Dec 2021
 15:29:06 +0000
Date: Fri, 3 Dec 2021 16:28:56 +0100
From: Thierry Reding <treding@nvidia.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] drm/dp: Actually read Adjust Request Post Cursor2
 register
Message-ID: <Yao3uMmXM+IvrVrF@orome.fritz.box>
References: <20211203092517.3592532-1-keescook@chromium.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VkIp7FKiDawaU8EY"
Content-Disposition: inline
In-Reply-To: <20211203092517.3592532-1-keescook@chromium.org>
X-NVConfidentiality: public
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
X-ClientProxiedBy: AS9PR07CA0010.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::32) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
MIME-Version: 1.0
Received: from orome.fritz.box (193.209.96.43) by
 AS9PR07CA0010.eurprd07.prod.outlook.com (2603:10a6:20b:46c::32) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 3 Dec 2021 15:29:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4495b6d-2833-4694-325e-08d9b671a4de
X-MS-TrafficTypeDiagnostic: DM8PR12MB5495:
X-Microsoft-Antispam-PRVS: <DM8PR12MB549571F1B995D3D0B50D1D10CF6A9@DM8PR12MB5495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKTC3G9QJjLoPXlgJFzTW37568jndbo8VVRyL7hvc6Ejv3WqVWOS8LkFhsAQFssh8dyQqleIvoEGb0VdIvpn7IxqJ0hD+hGlLSEJRJkLxCZ8UzW0+SM5o0YLmRzVrpjxGSqKuPZcLQte8WaNubMbMLS164YybGGgvrKSYRX8I3Wp5iAPVgSWxIyaNQJHpeSFokLh+OAT/aP2Ag9/vT+TUu2I++vxNZJVMZVqcsOBAcqjPft133KnVpd4m2wmaxKOB1avjlH1uDzMYx+U7LJEgCcAmXiTDVPoZKycjnil6qhXSB0gWt5HZo7WHwQ6cP9HZ/Gi0JxD09ehsOAOIqokt6wMfsa3M/BeUf+muf/qiI4iz1h/kgk1hk1aaRSda96h0gJHQBifxEFkAhHiQlSKgT0Chl8T9jm+q3CY0U99Mm5+rDyEnO5kfaIFJ8JYYPGCMLj5btCst3/N7fMIh8WGgSOjnWsW7moeXZOTe4KmoBIZaf8aFKubMvP0ZeJGg1TUWX68r9J48IauB8uV3yrc5DldBkM7VxZyTBUGE3pGSk6ciFd3I1WeJrBRvxjjNZ2iS0XBuvmvRxhpjAdWYFm4kleV3Ns4VONM49tMFeVz6TMQ/iUDv3dOk7sqV2rnv3/zXLxfTDxeNDlcM6HianDCWwFQYpeTvYW1vqSH1a/lRQtsz4nzDiA1i9O0U7IzsFG+pBW44MTuoZVgIbe5zUwuOa8ERWRCkai7z7+m+XSLtkCYXupQD0CgDQOAiJ0Yuq8cFL7f7gDS3zKzP++m2ipi7bquy2UkMOnHuaLoNYKqZSKhPC44W+2b300UCJJqDDf3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5413.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6506007)(956004)(8676002)(55016003)(86362001)(966005)(54906003)(4326008)(83380400001)(7696005)(2906002)(66476007)(9686003)(44144004)(38100700002)(66556008)(6666004)(316002)(21480400003)(186003)(6916009)(508600001)(5660300002)(7416002)(66946007)(26005)(67856001)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q+YA53loCDCLbA283+ZcAPiAh7bs5aKu3OkDbF1UdfAdgPMTM6xhEnWeHvYN?=
 =?us-ascii?Q?S3e7Pf9ojhxMIwQ5q5ahOyp2SZsgx691kRdUTm/idyBPJyY4DUYa6ltn0xi1?=
 =?us-ascii?Q?W6ujEtgoHLzQxoLJsCy92gGlSD3hCDH+Q4mPXpE8U9kbzX3YK42cLfkiELBK?=
 =?us-ascii?Q?T3D10tHa1TCU/Weo9lj5oz894PBElAwGfdqjpxzjChnHQWpH6eVY4ZDwBg3u?=
 =?us-ascii?Q?NzU0HlHoyJ4vb7Kckus5ddx9AR1ZD4+fdnI4YpGVg+oLqsGigN7V1UHCe0cx?=
 =?us-ascii?Q?xR4aKvJ1gQmwUflcBWbngzCtUpT0kOlxx7g8s03EoCLaZ5d+LIpixBIVdDzc?=
 =?us-ascii?Q?aIQe+BADMHm2SfFCH4ImFUo8ejcRGvGeMBNQfFC56XS8uughsQF9Z0t9K1Gw?=
 =?us-ascii?Q?agiuV7sBqd3xJ0r9WKOSSBtXefKfK6JqsMgkn/aOhmqYBOZQ40QNgk/2v9gL?=
 =?us-ascii?Q?cp1vtmC3HOcdzTKHbmcUH9t8uVo5YASgGTo9+R13gwp96y5Oa+5OcSMsBPuL?=
 =?us-ascii?Q?6qYU4YAspQl1JKM86NN5KrR5r41KHiJPiV/AHt1zdyFy7TowznP6J3UJhKfY?=
 =?us-ascii?Q?q4odOPPuij7iFNHqefxw1Ep3Imxd8ZdWl8iTXOatbE7nQjtEuFOT8jR6voJq?=
 =?us-ascii?Q?1XtMVd0GUpSbyIKwmBb7bNtfjUliBXZuBKP9g6HnfKGxj1DwaCbMUIPCuWci?=
 =?us-ascii?Q?UAjiqat/ul9OeauXb5bF4kKUIp9JZQ23pctTeW8u4AWKRJlMcA00H/+Xn/vd?=
 =?us-ascii?Q?YbtCZ+oEiZeaZNBQ++DRWRoEeXr+MlfmJj0ldJnt+F4KqngKO1AKNeqqJvz4?=
 =?us-ascii?Q?++FmHSc64Mi7lSal9meVx4e2qa+BVrb2m5/V9Kxn9j2SAKOQXnVNyIDh7zr7?=
 =?us-ascii?Q?DLE3wa4tPcm51LJXbT7b4J02IPCoTcsMZBlOEsJV7zvPRr0ZdES9ADP1chKU?=
 =?us-ascii?Q?7oZmV1kezGsg7gyrHoBtdb+2yiQZ9JQTQX2sQPyeH4J9hQZZlfx+HP1C+PvH?=
 =?us-ascii?Q?iQLb/NbpmH7Aj155G7otye9njMjEjU3bkG0Wp1o8jqIUMBuaCgUpyWHd/f9O?=
 =?us-ascii?Q?bTXD7b5v94N1kC59t5oBT2CDfVDxQDOX5nL0WI6yhBdUGpf47Tgtol8+tUQc?=
 =?us-ascii?Q?9NVsflvwiZuPdog/i6IKD9IBqTIIwRDBvcXSfEKJYDoosGeMpsx28kgFy4bT?=
 =?us-ascii?Q?c/FuOTHxmn0M2i0EYm80CyXSEszdnwFAigJKlRW5+8D0RE9VjnqMMobMJyo/?=
 =?us-ascii?Q?e3MIPTNFUBLvzuvV7shSobMMgshbaY02+XNxY96+lLvfCHRsG4r0f4RYpdH6?=
 =?us-ascii?Q?5QuqqDWK1ga8RpsN3ektScYMXvcOmZ71S1H6+4DFAQ2fntMSPyFqTt3nMAW1?=
 =?us-ascii?Q?MxoZURFYAg17pd9oz2D/uPvx+m+/WJfe5VS2Fy8O6KpNZr+vJdbifg2iReli?=
 =?us-ascii?Q?8mx4pfIkfUz8rOodrkPdV0NI7HPIDAjy9j2WEuwTc5x0Lpux6KxM6PWXaSaH?=
 =?us-ascii?Q?XofpCuTvOMlwzKlzFHeEnn0qcvelXBQj1dBOZngJyf1IeNiisi2PD+JpDG+u?=
 =?us-ascii?Q?+MVNEYCtAWkekbI66LmflROBCDl+AIyB8VT210nxVjplDmFzq+rfsX39uuO1?=
 =?us-ascii?Q?myvAJm0k9M7tpSIEWXjy9S0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4495b6d-2833-4694-325e-08d9b671a4de
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 15:29:06.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3JGZrxRYH20xphV/XCIjha7r0lUSHbqSkl/Us9EghHibdvKfWdqq5jwP7Emq+N55YjXVisQpkvubDJ2ldVGpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5495
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--VkIp7FKiDawaU8EY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 03, 2021 at 01:25:17AM -0800, Kees Cook wrote:
> The link_status array was not large enough to read the Adjust Request
> Post Cursor2 register. Adjust the size to include it. Found with a
> -Warray-bounds build:
>=20
> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_p=
ost_cursor':
> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outsi=
de array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=3D=
array-bounds]
>    59 |         return link_status[r - DP_LANE0_1_STATUS];
>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_sta=
tus'
>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_=
LINK_STATUS_SIZE],
>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
>=20
> Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2: Fix missed array size change in intel_dp_check_mst_status()
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c |  8 ++++----
>  include/drm/drm_dp_helper.h             | 10 +++++++++-
>  2 files changed, 13 insertions(+), 5 deletions(-)

This sounds very familiar and I vaguely recall typing up a patch like
that a long time ago. But I obviously failed because that never seems
to have made it upstream.

Or perhaps I'm misremembering and was thinking about this instead:

	https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+=
/338590/

Bonus points for adding that comment with background information on why
we need this.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--VkIp7FKiDawaU8EY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGqN7YACgkQ3SOs138+
s6Hupw//ezsxvTy2Xe2q0ZvKLa88BWT8aE7/CjGtbmoBZbo6/BPlvXAj2Ruuj51E
S6XsQnWmS3OjmE2MXWrJPZcACH3So+VgJz4qyg0bMwy/S54a2QUTnl3bH7cGPnr/
ZMoeYFSceGlE25EkNffBnYwMwkNIu7jWjmFRESryDZRC86sIvLbPF1E46rmKyQjB
sJh/GmmqBaVpuG1vgnoAdFT2o8KOsV2PqdkgMmnsXZzT7b2tiKXx3FkdLURQ4vdE
UnzwT699ZtrYzzYn1b6XbKbEpTELu1kUSCabt9hTPLWB8GG7nbO/SH6tbDEuDpmt
d237GVQBxZMMHHdpvriwn/4ATlY5e0KC+3QKlKfPH/vkJ4yyb7vO6f2GCvThHw3m
cO/MRAeuJ0sNMT1nL/k+T5+0otMRZEhRJmNDLHYDMtxU0nEzSddXU/eSyYMpNLnX
NIoB/9qUu9XFr1CfOhStWjpcqsa7DkYc2N3+ufHHzVe881XHvP1z4Jz94RgiI4MP
fHZhk/uA85pzxIYHUOI+1kLT6s/QdKmowyIlxZSjXrNus2lkndK90lcbeX/lkTch
VvEQH9XnCOnL4drimNYtuiBRi3LHodCVJj3493KzbklLfvXpc/ubEfBgu160xB3G
49urmt4HCSu1mnTUAs7Gs5PVzgxg8IxHMNkStutxmTKYLZBvE5g=
=N22+
-----END PGP SIGNATURE-----

--VkIp7FKiDawaU8EY--
