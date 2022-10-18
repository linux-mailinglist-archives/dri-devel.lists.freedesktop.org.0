Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB0E60293F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 12:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFCA10E6F7;
	Tue, 18 Oct 2022 10:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF48C10E6F7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 10:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgwrxgkPXR1YxMxfWx0ImIX3RbH9QkFL9xmFq86r8uLWgT2ZoR8TLthYKyBGmr3J+fxf0GRjnugjO7k2v39h/VKpm3E8WHdO0b2yo1oQz5WcC1HyHhPDVq4QV63XyJPiSvWH7xwboxQOoNYEcZzEOZlhXXk6TkyQY3kx9y2zfynU5Ob0ufNGlGfRzXImrg2sZHUGPQ7RS7xLLlski8btuYY12pTHZS6a5at4NjsUFPhr9dUB0Flr0TsqFndZd6sLc3+m6b25lS3YoyBVfdGlbWdE8MsYdIWyb2+VC6DaoVb/FH/hXTNxYkvcvwJ4bcCsvVmN93i32ZP/6gmwidTr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oktLdEYbMHzDchQl396U+/73LubVb+0fd/3ensVE2U0=;
 b=lgcyb4+b5qGV+pyndlKGKP83w3dzgqxf6WJOiLcGX8HN9Z6PQIka6AjMlj5yiZwK9Fvb+Qb+xaMMzav2FgfzA+JXd6mhVZpDYdPYxcpjXO/uSYCiuYFRmCjuL98iajorbCsG0YW03yxTinWXG35UJbavxKY0HC72AbSkzsaaY8arKwx/KBulWuTzneWaQOMXVYhmHjOB8bv2Wwy7KjcaZ48mb6mU6h2fbycDzymJXU+OajWHdC4YdZZJN2tsPJobpRhZcosmoLtakSG2DaLTfY9aGU2DnT0x/imIlmmNV1ASvqDeAqIQDdjD0gHI/SQ4q3gEl+3nlO1B1eN57LPc9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oktLdEYbMHzDchQl396U+/73LubVb+0fd/3ensVE2U0=;
 b=tQ07pEHlXdQu9ldjphxCP6NyH0ERFb2C4BNjH+xIXPz8hPc5MA0ebx8WpUbWJICpwmXcRhRPxpL/kGglUpyf/saNjamkToJTxSTao0s2e9IOC3PSSMK+ZHzVMxFxOtWGvhsyna0Aam17LAeE813zON8cIpCELLQxn6OxMcNlyxk5fz0eqOCmz+/tjR2/KKROgwgx+OBmU2zaINyL7lToQMED/2jlMDqpC/f0wdGSk+c5D/CXzYuF6ty7TE26tbC78np5wPxZc3jcV9iVwozPYim8DjmdMnFFweeZFr4h/5G3tdRPb4HwMnCHbDyogtYS6Wx8XWS7dG6Gr8GDZ68rGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 BL1PR12MB5127.namprd12.prod.outlook.com (2603:10b6:208:31b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 10:22:17 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::774:7ac5:2a7e:4255]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::774:7ac5:2a7e:4255%6]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 10:22:17 +0000
Date: Tue, 18 Oct 2022 12:22:11 +0200
From: Thierry Reding <treding@nvidia.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH] drm/mipi-dsi: fix possible memory leak in
 mipi_dsi_device_register_full()
Message-ID: <Y05+U1mE0II8iFIL@orome>
References: <20221018082545.799734-1-yangyingliang@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="814WtBddUaZh9PqY"
Content-Disposition: inline
In-Reply-To: <20221018082545.799734-1-yangyingliang@huawei.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.2.7 (2022-08-07)
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5413:EE_|BL1PR12MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d14560a-15ee-45af-3207-08dab0f2a230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t7+oOKJrItplerTYfip6xFGjuzT1JsSXx+FglT/ytRXXFnWDG+LizXOF7STZzL8QQxYByUYo3CvkPW348addKbH3ISL5Gwo0KHjfg8EdewPwBms+fw0I2yP7vm984hBQHzsUiO1Qz2uTpcq/vszz7WX1j8h9ZbPaWbvwX+hQrAAtKsvjTrQhKLyzPlCBhGzCrqAqBwk9bFpyCnJiF7Ryz/xXJoG+CN82XiWzyCfnoTg0GwYWZETn65qrS7owCl5K7z39BDXyenapmyTsmEWDpTc0Z9U+XMH5YmEefSVnaZbfeGAbk/tU0TXyh1E1BxL2cZSjQUbJJDMJ4k4XZ1mYC8mWOr9ryts7WrCA7YHjOgYpx0eTYgyTlHy6ThKTCV6DbKUUmlyGk71G68QCAO6ycvaOa5NTPZcyWWzQjupWJSNrps/u/RYe8vd43BJ+6CcYavzRuBG/ZgZooajLm79p0lTQeW0Kt2l5kVWeVGXua3LNjQuXCSu3eHpDx+kZvS4n6BR6nMPISuXSho+J5RMmst3oNI7ERtXhgaoYaNM21N7xZp8jq5Meg+bnSZlva/8bS2NGXGYNXHW7Jtz+WCejDVtJyL3AGfHIzky03DI8/xpBa7SetZoNI2pzR+D9LLSGGXnVD+5udt2i9EIC+dMc88NyBy+C5G+DoLOcBGg3LNrLM5oNyLP96RT+5og4c4xm9j6Y74yulTfDC/g49VibtYfjIhtkxiUZVZtx0XxCgW77n6Xz+30g7HpWShb5YbSJzVpsFhQ+ytttZwdKA9U8tWCh7Rhf0nrKVFfMUvEQRyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5413.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(86362001)(38100700002)(2906002)(83380400001)(5660300002)(8936002)(6506007)(9686003)(6512007)(186003)(44144004)(21480400003)(6666004)(6916009)(6486002)(478600001)(316002)(33716001)(4326008)(66556008)(66476007)(8676002)(66946007)(41300700001)(2700100001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7KE0z+wWgcCwfziU3wLDIpmJlvagn6Datxixn9uj61oiSBguX3EM3Lfx9mOe?=
 =?us-ascii?Q?b3dvG5r0k40OOmpfpYlQei2JoOQ5jsKHGZbbdJJPnZOBL4+NvA/NBJhjw/b2?=
 =?us-ascii?Q?Tct4J09rEjWoItCDBD1Fslh5cePfuCocHIL7pCJLTg4VYuJkmJXCILEHgQZ+?=
 =?us-ascii?Q?nemiLvxPwTPf0Qqg5IUFB6G+fLPQMwRlQpt57sil/IliGdiI+OryVFwc+Q62?=
 =?us-ascii?Q?a88ebcFkGNvN6X2oo6pk/vbrtG9k3J9/9UvfHsmz50vufsUHOQYsuDIeQb5W?=
 =?us-ascii?Q?vrpy2EurhM9yO81+T484t69RnSPoRLmUUvfFUH/FMb5jc6UzO8MwJUM1LGuB?=
 =?us-ascii?Q?WSZu7G6pY7hKT1FAT8+zNI8ijgA7eGuyoYJ82qJFVZPEWABCJnvVNNu2hzSL?=
 =?us-ascii?Q?9WXYmrk2aLP52csbBMXGCTO8CbL8gVzzrtvAcx8T0UDPED1z1HIN5xWArNhl?=
 =?us-ascii?Q?H9yhAYVsx/C0xPfV3AY92BdIH6rCksT/v42g/DXQ8gPxlHjwPySYuPlI8Q3q?=
 =?us-ascii?Q?l5/ARhbEnmmYclZpfW8LZ9Kk1sjVRG7YQairnzUi5TYAzdTYEQGXsozguaNJ?=
 =?us-ascii?Q?yurFjprgMMmReSDL4eoIty1uOK+WbJaa+c2U0HATyw6o5v7WzRBD3yd8zO++?=
 =?us-ascii?Q?C2ALCh0Satthij0/NP+JAlYZhPt2n4eUsQFNe2vsKUIE3i7XRh07uu1XDrdm?=
 =?us-ascii?Q?SXs/g3vpJrB69gNPV9kGQTAzSDdNut4K0q6sLma44RrMch+4J1k1Ti+UgEJV?=
 =?us-ascii?Q?JWwDGhbJLr3gBpfmQPD/7Xm7CoojKjVcxE+ktS9gwexC5Pf+OE+s3Psf5eHp?=
 =?us-ascii?Q?Af5Sm7K9jtwEbD227h+w1e6tnguzEN0l4DlrGwNNcAB1iR4sg6SvzI0Zkn6j?=
 =?us-ascii?Q?DkkUE9WyAMXcj2DVP+I/CTIJT5V1n7rcmIcpgqf4zT9sX6NQqY3k9e303vUA?=
 =?us-ascii?Q?2/VPu2GpsBA2rECVzh9RoY879NxlvhcBTssgo9GIYBrxH+JYmE/2ceJTSnNF?=
 =?us-ascii?Q?Z+2Qpb5r4tdZGGU4X3GwB1eeS5Xnuz+kw3TPge9gNamUiRhuwRLQKx8PK3u2?=
 =?us-ascii?Q?AaqGejbfLN8wJKmwHFu9yvxskBexPf3SBBzoldCaEKoUT//5U5/GGqJ+2m1E?=
 =?us-ascii?Q?PDmjkz8TNb4PIvzMQkwUDre6C/mnsGkWVEb3BuSVFTa1oN4L9KyGsqziqSr8?=
 =?us-ascii?Q?dNx8U9yj6wXxgfz1ssiCOw9uX8iW6BmMxvT/Ci5cvkESS0VL+Q11ssxvkjo7?=
 =?us-ascii?Q?MpvsyddztG1cSmVPgMSAwo5JkLNQwBHxvRsqK9cmLLS2MM9zc0/+y6/Zhtuj?=
 =?us-ascii?Q?GZ2t1cddBWNlOwafjvXitPaehRwsWJSW22iPOxIICH6SKHDdpOX6Udlkx+0t?=
 =?us-ascii?Q?8H3eJUL39JeASFaO9SBpT6ZKmqDv77WjnMEhqD4NkE3Y5wj7yTRtSASw09hK?=
 =?us-ascii?Q?+nzKwfWfmvWITkqMxzabrKwCoDPVUL7W9b3L+cPLKe4f9ZPyThA6zAWF8Zpm?=
 =?us-ascii?Q?3pyuQdePTvPE/sraOiGEJjs8Du8mV3VBYo/Dz7rfIslqR5GWFLUI8lftITKe?=
 =?us-ascii?Q?4MmI/UNqdB0TVwVJrW/7aFP+0ikHm974xINBJcRgNeHxu8Hjlk9tMq96VN7r?=
 =?us-ascii?Q?BJZUo/e4McMnE+YKnINoB7yYHi7WeakhStbNw4bVmdww?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d14560a-15ee-45af-3207-08dab0f2a230
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 10:22:17.8019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWlNO928Du09jh/HKn6qeKdoWryLnNx3QJJAPngwN8EPoI91nLQbpnB3HqSSGMEWahn5Tq/BUB3b/QsMZUECAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5127
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
Cc: a.hajda@samsung.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--814WtBddUaZh9PqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 04:25:45PM +0800, Yang Yingliang wrote:
> If mipi_dsi_device_add() fails, the refcount of device is not 0, the name
> allocated in dev_set_name() is leaked. Fix this by calling put_device(),
> so that it will be freed in callback function kobject_cleanup().
>=20
> Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch! The device_initialize() function (which is called via
mipi_dsi_device_alloc() earlier in mipi_dsi_device_register_full()) has
a comment that put_device() should be used after it was called.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--814WtBddUaZh9PqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNOflMACgkQ3SOs138+
s6HbrxAAgRR42tLSRZvo46/nRQRz7jK9lUi2P6xZNT14t9Il4YH8erdRhMkDK1vI
RcxsyKaYzlREhURJlryFAwOHde5KR4qeMqYR5a6yBVq9Ow+hKsg7k4no5n688cOZ
XvgsK0I5WnAGWeJNZs+jwYAQlJ4H6Q4cMK+cPiuT1Qwo6E2fSkKP3gisSmKHZj11
xYBWzuOshOZCpyv04WDTT8GZMGe5AmfrAT96iRZCYeDipBsjfzGa1cydM/Y3lBub
l9DWZQ6NEdOCstgMGyjGaXbZwvjFpxEmfROxtxVkbMK3nunRSzNfdJLu+Gr+WaYA
ThGIbCh1Z+RCkI6bGpc6qa8sbcz9ghRe16MOPpmky+FLWSuML94sn8+WMXQxbMUF
BQPAI0g1COPe+EwBr/WiEJfJTsyE6TQcQzNr5LAgFuJZCtqk+nSWGA4ggMLRhzdC
JhpilYOGoKel+iNhqIWwB36Mqy2gVWg21WXm1qluZoYB57m3xotQcXgvkoQM0OJM
zmpe+dU9yFxV1ECyqzzCJlugy3xQB4iABFc3lr3x9VxR2lHC5nPSWETAex9nZocB
EGwcuZVMT7FJJWI9Ho0Mq9uljSCOaUmozsx4CQRpOXDTirL6ED6/RGLwKFk/E1DG
hkchReuFOiPc06+hnptFvky6Z9HR70Atk/UwGeq+YRxIDbve+Io=
=q/mp
-----END PGP SIGNATURE-----

--814WtBddUaZh9PqY--
