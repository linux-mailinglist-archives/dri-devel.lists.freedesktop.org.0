Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4F44326B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A8F7314E;
	Tue,  2 Nov 2021 16:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF107314A;
 Tue,  2 Nov 2021 16:12:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihpABOMcdkSVsaEmL+QEf6OonVWy1ZkwXsKXrCzgHHh2lBsSQ3UBkXuZphNAcODLCxADFNR2RnDB4/wmTnTDXR7Dx8UwaA5ESFaMXhGO9zBFik2hklH0QhR451Y16FgAE+LNgOzWM9yTZGhFn5Y0hFExPWTDHmq2+hn26MWUmwaI+SR8jqXCcBZWB7Tf9bymRQ2/Rc4iyyoeS0m5bbGBBRs2yRjvblEPfXXmpDeSeB+2FTouTv63uwA5jz2RoMo4bBE+9YZgCo9Oym843TpIaXV2f7FEUCylqiwJkGDAYkoL8pZCWA3qxyGNRAjgtSdDBe932PEY7s6C6j8JDyjuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcWXFcTJr29tcbDfZPJodxv1XBM7WxLJEvGs2yH0V+E=;
 b=AoMZTuVPoPlIh9OSiBk409jNFFmQY4WuxE8I+RE5kyqw3uQ/fGm5E+QNCUiyVV4EBXW1dTkJFqqpLvNMQSoSSJbYQCmog6U41ahGTwjpwnZV064fP0h05syNBhuO8q6y/tms40OTSOGsY7Muug9dfQ9C0YIRrjH7jo1xj9b5gGaXCNmXWC1LZmxQzSwje4lma048moV0/3pMAWbTAxMJt6LoW7uZKIe95EaY3XKxcuDc90vXp9XYMrPfpmTO2Q/PDgcny0Gp99NrzzH57A8IBmwsdriuGHbObR6NN1JsqnZKxPKux+0r7OHx3mOliSqhUj3fBOoegwNt24W4Af7OKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcWXFcTJr29tcbDfZPJodxv1XBM7WxLJEvGs2yH0V+E=;
 b=aSnDd20XdbimAHKMXcmOLGpXjc/dVut5+S6rZEgu0xoZd2QVsA+UZq0pY6p7Qrhh6vbC7lvGwF2j3s6ZIbEe+zrhq6+EYHwVOQNIitvDG6lDmix7HutAE80eeTW5yPXItY3B3dSKhIPrHNDuG7Ue53zuIcBTXB/8x3pyGDWBgEq1QbquxQkHKCMyAc86Nf4O0e0cIqVigl2TpgYvbMZhViife/6pKHXEcBrNsKjeheRjfOVekulB72jw/cVZ12bszy7JcK9J7wPwZkizpU/2lrZtRUI61fKw+jGhWMB9tjBIPLCkeltgB1x30ABVfe+gGn1xihqo31cKNdLUgLw5Yw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5125.namprd12.prod.outlook.com (2603:10b6:208:309::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:12:40 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:12:40 +0000
Date: Tue, 2 Nov 2021 13:12:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/29] drm/i915/gvt: devirtualize ->set_edid and
 ->set_opregion
Message-ID: <20211102161239.GU2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-16-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-16-hch@lst.de>
X-ClientProxiedBy: MN2PR15CA0010.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::23) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR15CA0010.namprd15.prod.outlook.com (2603:10b6:208:1b4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 2 Nov 2021 16:12:40 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwOt-005AS1-98; Tue, 02 Nov 2021 13:12:39 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5295b567-94db-45e9-f07d-08d99e1b982a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5125:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5125D622098D659D1D94D430C28B9@BL1PR12MB5125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UyRwsod8AKuGvm1f9XA2dvuqB/1OOSoDa9mRX9giSQZ4vsphVc+GQGb+z6/cvbfrFpeR3wqwb3T3EkJNTgbQKVhREy0xqVTkCOZe+LgyVJ4x+5raBwHKoiNSf2OKAxKovRb82YlW3Q9n/ncoumitjKBCSQ7oWMw3p6eK1l5p7JvX6LniT1GX4btCMIHYiwDG/fTOmDFI73xrvJltB+DTTfckavW0lRbrqVafWzAAwOGi4Vj9LC9cjaHKnGQNqgB1X08guCpbradqxP6AU671mGzUKLK2tPDwZKpwL68dB+iuzOISDne1ymzIzJJPHqnS9oBrx5r5D3Sp4GpjkpTq53TFqEqXtoTKtK6crf7Zsq43fn5RhM7Qz5hkyKmf4pEq6svE6tzuuZbxxGoI+rrO+sO5M9bv3hHPObDIIQSGtZaQfd/5VGXziEPz1nm5yEH71Gs2kWpkXNo6gqVXDlPxcmoyWFMU/VMeau5fbHzQriwXPKvv+9IZwgSeVG35wloEu6rozW0Jn6V6nF49ROyhatk+jbsihH8pBb7Q9P6doUxaiZZQ5b6BHbw4Z7DP1ySstAg8/DYwfsUT16q9d51r0M2bzx9HwgktUhAulewqeDVjouh7EqTsMzFngTn09GEdXrfG54FqlnuKkcVb0BYlOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(36756003)(66476007)(38100700002)(66556008)(54906003)(66946007)(2906002)(8676002)(33656002)(83380400001)(316002)(1076003)(9786002)(26005)(426003)(2616005)(4326008)(6916009)(7416002)(86362001)(5660300002)(9746002)(4744005)(508600001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ueF2AwEFLchV6rQ+WfO4gwuuLnaZDZUZ8z5gmcqmM54ukft0ZulBzctIbD3t?=
 =?us-ascii?Q?kUhU2EZUJ73OcjZgsvbuiTq7yrajoDGzgPm2IyDdsAm90L6guaP3TS5WXdtZ?=
 =?us-ascii?Q?/DbFAz6IuQeXCJq3Vjv7+tlicuY0D8TKntoU6Uvv5WtRtkYYFhlNKac8OjL9?=
 =?us-ascii?Q?8M5rZ73XhbkhRB0DKKjcY4qoB7Q0QE4j+Whv5YPTxVNj0Zwzza8eibXJnat6?=
 =?us-ascii?Q?yL1jnPLShbr+KlrOIB+87YDPOXizwzdkwJWONCieCo62TJUYGt8hdL1D4JoI?=
 =?us-ascii?Q?3xb/VzUCOGzrcq8gaUkwQ6Zob9CIJLOMDJQpOMHG4n0y3i3fbWVhhUvHODyY?=
 =?us-ascii?Q?XXfK2+/J1/8uJtZs+eZpTyYQyAPuln+CJutKgKmXCm+k+4YYbwioWNQ0EOwg?=
 =?us-ascii?Q?5RGB6si+TIFY8qWntgvwe0QzCZQy4EK71ntvQpD+4ReKJCtDSQlIYpiC908Z?=
 =?us-ascii?Q?6/z0fA+nKMGZdbd/EYV9Nq1YmpP10aKCxHdjaxsYoE9BPxdAAqIPxVg32v2g?=
 =?us-ascii?Q?EhBV7XB78Vqjfeq/YdctJrN6fGKYu48Cb9tekvQhYU8j3ImhSxnItEOGO7Qc?=
 =?us-ascii?Q?m4Gao/26orD7xpjHfd7EST+TwAtfq7ULnoQI1KAjyBZ0cLv/HbWiine5GHxt?=
 =?us-ascii?Q?ZM2mbKPJ/0+fZ+rPuS1jOLsGgtixAXOw+1T5CwGBeOQUIDGGhgWTUfXfPbHF?=
 =?us-ascii?Q?BaUic3Txzfx9Nr7RHJDr0MrBrZmrQB9w8liEQoirgp/atfWjQGZoWx2Jgsjl?=
 =?us-ascii?Q?y+x74QBYPeQeKWoA6JdNiz6NFgqShsCBUbkiSGVpN+6RWKK3ndaoXPiWcViX?=
 =?us-ascii?Q?SJ0Fj8uNykAuhXwpLHLG1C5M+O2YGEL9//Yv7GiaXKotVPnu6qqFkIKNY9kE?=
 =?us-ascii?Q?//i4OYfp0u4kM1zBCFsX7KIrEwAHVaD0m74VWcQy3IFkjt5m2NEHDj2hO9Nn?=
 =?us-ascii?Q?1sIzZWyBeMeP94q02NyvdLlDu5hACkFMvsuOtygQ6NDbzCi0eNFtidIX/PMi?=
 =?us-ascii?Q?8NzbV2YkmouHJr+EkUdQsUR3ELMf+SPM2LIECvBH68cJA8TVTnyHLduHRCnh?=
 =?us-ascii?Q?LQqPgOoowwV/j6FGtEVWvMN0rT0QJYQE1l05lLM1RhRT2oqM2UexXk9+5bcD?=
 =?us-ascii?Q?q4bQUOzc/fvf/X8x0M6YfqQS9MMG5gzcrTANoelIFFGncrZ+5EJ+P0f8lZr0?=
 =?us-ascii?Q?SyVuHyJLRIuqEGCU2AwnzuinaAMf62kwEmRmdntWNRMaHG3AIrXNoM2bFS3Q?=
 =?us-ascii?Q?3gGv1AAO+xoBvzAR9Tn7jU7mFDJDBeaEMBHA1ihWX7MVLejWKmOsYz43VtEw?=
 =?us-ascii?Q?BBpEXOJQuWmQ65r3RNza3roK2Tz6fDz8MfiV9JawHaeA/hbi+T5YlMiWCz+w?=
 =?us-ascii?Q?dTv375F6B14HCdYLpTlwcbXDWtobYpLkzv0lF6jO8dRtHEOh52EyuMVs/JT4?=
 =?us-ascii?Q?zRQ18Not3ANWdoK+RIlk7b05zS6vP0VnX525iFTrvNe/rj4cP06iAqI5cBNk?=
 =?us-ascii?Q?PA+JmMt285kdpPwtn2/cPbyFwzX9koboBmMws6ap8XZ5o69ArYCbaW8raC8R?=
 =?us-ascii?Q?z7V6Dhpa2nrH0zuhgOA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5295b567-94db-45e9-f07d-08d99e1b982a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:12:40.5993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KElIi2zzJ6e0yqknG7e+uRF8Fmxr0pQ3THujL/M43lK3eZqQf7JxGq6MNrJnNbAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5125
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:05:47AM +0100, Christoph Hellwig wrote:
> Just call the code to setup the opregions and EDID data directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>  drivers/gpu/drm/i915/gvt/hypercall.h |  3 ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ++----
>  drivers/gpu/drm/i915/gvt/mpt.h       | 32 ----------------------------
>  drivers/gpu/drm/i915/gvt/vgpu.c      |  6 +++---
>  5 files changed, 8 insertions(+), 42 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
