Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B33AB084D2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590E10E6AF;
	Thu, 17 Jul 2025 06:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s0F+I4dO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F59910E6AF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:23:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm7aY0CxuAujK+y380UvpuRhJIxa6P6CbxZ8Iw6dm47GFeJmhmlKNw4bq+ksCVrlEwSf4WvFJ2IaysVoqyOP2xV761zVvOdPQCtPMAjvxkYP3vfDgyojtL2WN78S6Cp5weRFq0PQAX3yUdYsxHzHj1gpyZ2v8rqzWEvxzuzR4D18oyQRLNfUKHzjEX/Kk5V7i1Ov2zHJZoqX/LbTFqcgrdDQ59BDofJqjAT2ij8dXgBYWNwJcvWBvXhuFXxmQcAm1Gj5S1tishaT8JDTTyjOhWPDADb9y7Q2xgIJVqKCR3mxn+usNfYEO8Jzmo80ci0EoAqaPTPPxtJOIXIixeLq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tCb7wgLmplh3nH14J58d4nDC4hcXWENxNH4qNQeL2Q=;
 b=ENUHgLwWO61+PYoKkwZ5RIVVsL53J7x6t0VTbksYJpmjWUeqqskTqJkCtOwn04aDA95nAv1xF51DxXS9b4an73sWXu+niEvkXB4RTHTNszzayC9ua6lv36r2IDnYhl+tVq480jcg27jsQ9/3Y6GUut4vLiWFVsace+HD/9WYkMnoWJTM+CeSv98GNOwRu7Y9gTAjeBinel/f8m6E0r69dzffHH+MrgTLLX9GcbAeR7V2A6lG4XA//glbyRlfz71GuYeL1R7OW5JlSh/b0aEPJ/URJizDDjl2rIPOxocc29Ckkf0Z0kKjmWO3fwfVxNrPcw39Gv2USKWO4BwZOv1PRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tCb7wgLmplh3nH14J58d4nDC4hcXWENxNH4qNQeL2Q=;
 b=s0F+I4dOx/STrJKfVfPASNjTORKTUgGg8TAmsCi2lLYpMGpW2QPyCRDXZSZCLZQUM5yZe0PyzzZL6GQeHWkOyIL0DC0HiJrsyqk7XpoUGbo4vefgPR7X4xXZo6SNEQgEvUFquXaXfrZviRyx5YG2SP61z6DE07HUdIoKGJ/jadI=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 06:23:33 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 06:23:32 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Yat Sin, David" <David.YatSin@amd.com>,
 "Freehill, Chris" <Chris.Freehill@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dcostantino@meta.com" <dcostantino@meta.com>,
 "sruffell@meta.com" <sruffell@meta.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "Francis, David" <David.Francis@amd.com>
Subject: RE: [PATCH 1/2] drm: Add DRM prime interface to reassign GEM handle
Thread-Topic: [PATCH 1/2] drm: Add DRM prime interface to reassign GEM handle
Thread-Index: AQHb8nOpGQbnVBmPwkeXYMxVKXX2irQ14JrQ
Date: Thu, 17 Jul 2025 06:23:32 +0000
Message-ID: <DM4PR12MB515221B4DA58CB5F040DFE86E351A@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20250711145342.89720-1-David.Francis@amd.com>
 <20250711145342.89720-2-David.Francis@amd.com>
In-Reply-To: <20250711145342.89720-2-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-17T06:19:30.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|DM4PR12MB5985:EE_
x-ms-office365-filtering-correlation-id: 07e06cfe-2aa4-4ffe-951e-08ddc4fa73db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?X2Rc/T7mP52a0/aMMK8IodlUIOgJBEoxyz3lN8B00RuTSJtAgqqBsU9SZuSL?=
 =?us-ascii?Q?9EP9m0tMHJON1hZTyV8UbMOARDhIjhLcbk6U6HcpLgsPPneqyXMT0OSkKxH0?=
 =?us-ascii?Q?gSspVhjU+HNDedPr7vEYFwn9GEZf7JYcciFNpX9YlggQm6hrVerKs2rqPj6+?=
 =?us-ascii?Q?nD9udONfH7jrjvMif78gw4QmlNN45aOCM8m37wEaTU0br03HhEE69fRP7DtJ?=
 =?us-ascii?Q?+GaHomNUlWH5jjzO+sM00W1ggLamofo6GdYO7zx0Yn5Wk3F8fnjF6oNCEkuI?=
 =?us-ascii?Q?FFvNf7im/xykkamPpKRQUXJBOKVvdCPy2uPqnh5nxXvQ9yXCeN3VCKuFW0IR?=
 =?us-ascii?Q?z1MbNEJx6Q4MGhFkrtcMTrfG3boexJJjVGtzIM34EIVa4MNNyK0t3tilVNH5?=
 =?us-ascii?Q?YywcR7TUD2xuzrmoveuk5HuPflT88CjNVdmt7ozahkhcFRfAYRqz05beAX9w?=
 =?us-ascii?Q?i496HZvyV08DbS7FY3Hg9aZLwDnBkqxBIPwPgYbKqxEGBfoD4y/ynQThRMZ3?=
 =?us-ascii?Q?5BuOH9o5rFtknUU/rI41FnmOxsGpLQZnG5fY/WsQJ8auFsjnd6ZSoXfoAYJB?=
 =?us-ascii?Q?NjfTvzuV349YPU65rKOD+UllCuxFPuVpNToZsjYW/1n4H2f1IPI7IZMBKqjN?=
 =?us-ascii?Q?WlCErUB3BzmdtMg4w2zizYqtqqWU23kizK0RtDejK0AqPEtxnKMRHarTMlbd?=
 =?us-ascii?Q?Y+pGwJ8FJt0tIPj0TNxapftxD2bezNwYlBZ2+BYQ0Htl2+b11b4DNHGGa2K3?=
 =?us-ascii?Q?rYvSo6ONsoDCLgGGnqxrFY7j/roKZeoL9KL0Ale2q3GEFJxr+n8yjZuQXc23?=
 =?us-ascii?Q?9BM+ttJvgPAMebcj9Y8spOsQn2yk8zGKVl+G0wVCEGyjgsNL+Kcy+7g90DQ6?=
 =?us-ascii?Q?ZSecp9kg5ByrNb+398RPSCr+BBj6jfoO9QbO0TqBzbrN9H6JYbi6xjJHUaBv?=
 =?us-ascii?Q?EMLVOUo85RLAUk5CoEwGbOFyrMZEhrfp/P3JrlVOsuEPmq/bL2t+2TZ3rU0O?=
 =?us-ascii?Q?88V1f5kaexh2uvw2+zXx6IXsIkuAJjHIR4BxB+BFPWcAtehltQDcXsvSYbfN?=
 =?us-ascii?Q?nmryqNIlGBorSUfEs4FUhcLdlsxNQX6arhm00tYAk6Vev4MsYMBSHQz9zwxg?=
 =?us-ascii?Q?MG2zAbKTxa+FpH0azXXeFK0gIWf7NtEaohZpme28NeXvcRttsn1Fxavd5/jW?=
 =?us-ascii?Q?zoh98XYpA5c5aiqlOimYw3AqLU/PHx8bDreDsS4GNT5LwkV0tYUwKN1Osxi8?=
 =?us-ascii?Q?O6fs9I++UTfhF2i5MZqIihMB7NlP3IASxZUMM+h+uxOEs5g9J1lq8aPBcG1u?=
 =?us-ascii?Q?RnsnY74R9Ln4qX6CqHGxKvnxMF3MR5d2bAOrmC/NfZf7YbG+ZSWH9fFJX1Uu?=
 =?us-ascii?Q?e5bzZEcSEaKOXLZ4s611CLrdTvKY4eEO5PM25CqnynLxu8w/Xu4QBLkWwn6I?=
 =?us-ascii?Q?2PU1gqc39K7J7hOOmI1w7GcruHOtJy1k82UuE+yyeNOi6tyr0+BfSA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FM+4paxCSXyoflz3eqBavcPEmxc1cTGxAG3B2B3fj+rNVvQ6TQr30qxOdQOl?=
 =?us-ascii?Q?JzTUHHN57VlzvhdepMQoJsxS8OFh8ACYx/ZX6z03Fs20B3NTeoeyug8U1W/B?=
 =?us-ascii?Q?MOqxae4UTnRC7rA3dv/C6hjYZBzHDFv0cilYRsckVrlzAfMKjm+nO26Jr9/t?=
 =?us-ascii?Q?fGcnuUbvqAfhdpOg5LWB9L3Q8eUBKFuXVLAMswCMrI+T7gWz0TS7yaiaWArG?=
 =?us-ascii?Q?z7TBCr54btjHCHuWDyQ2cR+7BTfnplcP4HGwxnt91Dfs4TnjDhdygbXrH4s+?=
 =?us-ascii?Q?U9PWG/c5/NBFi6784frzj7Kf/N0BWFwFdeQu04jbH8XFs84tzBixv9jLWaXT?=
 =?us-ascii?Q?lsTdDo2eCMwYdRaYQPIGyQOj552vajn7oxf+vzkColhQp9tTHlCDsZ8035Pq?=
 =?us-ascii?Q?X6FSN0e5s5rBaRzx07dLX+gYvh5UNksD/kh712LvxM7wyrTbbmw5DVvbCAym?=
 =?us-ascii?Q?RehMoLI5/FhnK6mCxMfzFMoJ9Q5iBVQrjGYsGP0On09lZD1QKo9DGaL9ZCVC?=
 =?us-ascii?Q?CznyfbR/IoORJyLdi+wky9q5/mzuOu8IDEPKlR9HGPs/0wRxz4Csn2D8wghp?=
 =?us-ascii?Q?TUjpwE5oAhrRnktMcykZOaQ1YntEtUspBHYQlLAi+qL2TMmFrHF82wNvWQLq?=
 =?us-ascii?Q?JoIYCqaPJDuQVOaFsURBZNoeBQrTZl/MUyL3ASoKBTJqxS/yJvd5Z3pU4hPL?=
 =?us-ascii?Q?ZF95RxgJiFBGj/oIMzH+Ci7R9x7eKquQqtcOMfYHa3NhAL+URPuJYx1VYhjv?=
 =?us-ascii?Q?l/JoZvpt/3QX2cvwag+8OrvfAY4aaAmbErMK5H4CKh2BdBB6ksEUDyOUrWjt?=
 =?us-ascii?Q?elbUSDD2UJD7wrPopOPqkq0rrMbDDzLKOO0kpfAWT8YawXiQhPVlbXJO+vzc?=
 =?us-ascii?Q?oyPNG92rIE8pnw+oE5opqnQ8kszW21MGLQyJuLVu3zYv+24DjNwhdJsZ0ZC/?=
 =?us-ascii?Q?E0c4EtBSlOBV3PeyCYwRDTEMKNtyCsxBVrL7txIZ2v6O4qR2Mrkqi9XxUiaj?=
 =?us-ascii?Q?80zqSI79PXwgaNB4ABQqv7x8kXcR6SEEd24GC43Lna0wAmlVCXPSB2+XBHJc?=
 =?us-ascii?Q?tKxwqyPRBootlEKFz5BGftggimLkZer9xihMzW5NMyVLIcsqS0/IW8dzrhxO?=
 =?us-ascii?Q?O86tx/A+4NxlxbTz3otpW5wQNIMEXj65MIyxk5iXHzQYwiTAUZm4gCJSbky/?=
 =?us-ascii?Q?3GVI9wHymX7BKToRYh5P+LUQo5x3EFSsWOHnKHpukUC5v2tWlScXjxoN6tia?=
 =?us-ascii?Q?fIl1ZzAYmFVNYfp7r1KSzrluYAb91TcrO/CA0poQ4tViqEOABdpEpDoFvusJ?=
 =?us-ascii?Q?u3l6Oj7Ep+SqqEAv0aTo/5gCWBIektkU5YflHX4bYk+UFOJPvs3a1wMgVrmP?=
 =?us-ascii?Q?Sxo4HoLN4a0JGaU/4mNsdrtbif7Tdsr9eCmaonK+QWHuxATrWh9/PE/2pLqd?=
 =?us-ascii?Q?C0WSsOK18f2uOboMDsHAM6Xxl2/glLzNM/KjhfSwela4GYS5FaNzxKK1zRFX?=
 =?us-ascii?Q?v7NW6TiXLidE+4hbi1iliyQDp0UXtmS+gLINeE/3X4BU9T8Tr5GfVqsn6XlG?=
 =?us-ascii?Q?Nx4PXr5gPHOjDAOSxG8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e06cfe-2aa4-4ffe-951e-08ddc4fa73db
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 06:23:32.0908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IVuR9oqunHs3KBNEbEMEbftKJ5p+ACdvjPZmkEsST1xVxqyWa4I2wP/ryzu265XMsJhkFuaoFjOzz9WXfJovvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
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

[AMD Official Use Only - AMD Internal Distribution Only]

-----Original Message-----
From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Davi=
d Francis
Sent: Friday, July 11, 2025 10:54 PM
To: dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com; Kuehling, Felix <Felix.Kuehling@amd.com>; Ya=
t Sin, David <David.YatSin@amd.com>; Freehill, Chris <Chris.Freehill@amd.co=
m>; Koenig, Christian <Christian.Koenig@amd.com>; dcostantino@meta.com; sru=
ffell@meta.com; simona@ffwll.ch; mripard@kernel.org; tzimmermann@suse.de; F=
rancis, David <David.Francis@amd.com>
Subject: [PATCH 1/2] drm: Add DRM prime interface to reassign GEM handle

CRIU restore of drm buffer objects requires the ability to create or import=
 a buffer object with a specific gem handle.

Add new drm ioctl DRM_IOCTL_GEM_CHANGE_HANDLE, which takes the gem handle o=
f an object and moves that object to a specified new gem handle.

This ioctl needs to call drm_prime_remove_buf_handle, but that function acq=
uires the prime lock, which the ioctl needs to hold for other purposes.

Make drm_prime_remove_buf_handle not acquire the prime lock, and change its=
 other caller to reflect this.

The rest of the kernel patches required to enable CRIU can be found at http=
s://lore.kernel.org/dri-devel/20250617194536.538681-1-David.Francis@amd.com=
/

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/drm_gem.c      | 54 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c    |  1 +
 drivers/gpu/drm/drm_prime.c    |  6 +---
 include/uapi/drm/drm.h         | 23 +++++++++++++++
 5 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c index c6=
240bab3fa5..3166230d0119 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -282,7 +282,12 @@ drm_gem_object_release_handle(int id, void *ptr, void =
*data)
        if (obj->funcs->close)
                obj->funcs->close(obj, file_priv);

+       mutex_lock(&file_priv->prime.lock);
+
        drm_prime_remove_buf_handle(&file_priv->prime, id);
+
+       mutex_unlock(&file_priv->prime.lock);
+
        drm_vma_node_revoke(&obj->vma_node, file_priv);

        drm_gem_object_handle_put_unlocked(obj);
@@ -933,6 +938,55 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
        return ret;
 }

+int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
+                               struct drm_file *file_priv)
+{
+       struct drm_gem_change_handle *args =3D data;
+       struct drm_gem_object *obj;
+       int ret;
+
+       if (!drm_core_check_feature(dev, DRIVER_GEM))
+               return -EOPNOTSUPP;
+
+       obj =3D drm_gem_object_lookup(file_priv, args->handle);
+       if (!obj)
+               return -ENOENT;
+
+       if (args->handle =3D=3D args->new_handle)
+               return 0;
+
+       mutex_lock(&file_priv->prime.lock);
+
+       spin_lock(&file_priv->table_lock);
+       ret =3D idr_alloc(&file_priv->object_idr, obj,
+               args->new_handle, args->new_handle + 1, GFP_NOWAIT);
+       spin_unlock(&file_priv->table_lock);
+
+       if (ret < 0)
+               goto out_unlock;
+
+       if (obj->dma_buf) {
+               ret =3D drm_prime_add_buf_handle(&file_priv->prime, obj->dm=
a_buf, args->new_handle);
+               if (ret < 0) {
+                       spin_lock(&file_priv->table_lock);
+                       idr_remove(&file_priv->object_idr, args->new_handle=
);
+                       spin_unlock(&file_priv->table_lock);
+                       goto out_unlock;
+               }
+
+               drm_prime_remove_buf_handle(&file_priv->prime, args->handle=
);
+       }
+
           Added ret =3D 0 before out_unlock to ensure proper return value
        ret =3D 0;

        Thanks
        Jesse
+       spin_lock(&file_priv->table_lock);
+       idr_remove(&file_priv->object_idr, args->handle);
+       spin_unlock(&file_priv->table_lock);
+
+out_unlock:
+       mutex_unlock(&file_priv->prime.lock);
+
+       return ret;
+}
+
 /**
  * drm_gem_open - initializes GEM file-private structures at devnode open =
time
  * @dev: drm_device which is being opened by userspace diff --git a/driver=
s/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h index b2b6a8e49dd=
a..e9d5cdf7e033 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -85,6 +85,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, =
void *data,

 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpri=
v);  void drm_prime_destroy_file_private(struct drm_prime_file_private *pri=
me_fpriv);
+int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
+                            struct dma_buf *dma_buf, uint32_t handle);
 void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpri=
v,
                                 uint32_t handle);

@@ -168,6 +170,8 @@ int drm_gem_close_ioctl(struct drm_device *dev, void *d=
ata,
                        struct drm_file *file_priv);
 int drm_gem_flink_ioctl(struct drm_device *dev, void *data,
                        struct drm_file *file_priv);
+int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
+                               struct drm_file *file_priv);
 int drm_gem_open_ioctl(struct drm_device *dev, void *data,
                       struct drm_file *file_priv);
 void drm_gem_open(struct drm_device *dev, struct drm_file *file_private); =
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c inde=
x f593dc569d31..d8a24875a7ba 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -653,6 +653,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
        DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDER_=
ALLOW),
        DRM_IOCTL_DEF(DRM_IOCTL_GEM_FLINK, drm_gem_flink_ioctl, DRM_AUTH),
        DRM_IOCTL_DEF(DRM_IOCTL_GEM_OPEN, drm_gem_open_ioctl, DRM_AUTH),
+       DRM_IOCTL_DEF(DRM_IOCTL_GEM_CHANGE_HANDLE,
+drm_gem_change_handle_ioctl, DRM_RENDER_ALLOW),

        DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETRESOURCES, drm_mode_getresources, 0=
),

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c inde=
x bdb51c8f262e..1f2e858e5000 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -93,7 +93,7 @@ struct drm_prime_member {
        struct rb_node handle_rb;
 };

-static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_f=
priv,
+int drm_prime_add_buf_handle(struct drm_prime_file_private
+*prime_fpriv,
                                    struct dma_buf *dma_buf, uint32_t handl=
e)  {
        struct drm_prime_member *member;
@@ -190,8 +190,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_=
private *prime_fpriv,  {
        struct rb_node *rb;

-       mutex_lock(&prime_fpriv->lock);
-
        rb =3D prime_fpriv->handles.rb_node;
        while (rb) {
                struct drm_prime_member *member;
@@ -210,8 +208,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_=
private *prime_fpriv,
                        rb =3D rb->rb_left;
                }
        }
-
-       mutex_unlock(&prime_fpriv->lock);
 }

 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpri=
v) diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h index 7fba3=
7b94401..e3940b657e16 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -625,6 +625,21 @@ struct drm_gem_open {
        __u64 size;
 };

+/**
+ * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_HANDL=
E ioctl.
+ * @handle: The handle of a gem object.
+ * @new_handle: An available gem handle.
+ *
+ * This ioctl changes the handle of a GEM object to the specified one.
+ * The new handle must be unused. On success the old handle is closed
+ * and all further IOCTL should refer to the new handle only.
+ * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
+ */
+struct drm_gem_change_handle {
+       __u32 handle;
+       __u32 new_handle;
+};
+
 /**
  * DRM_CAP_DUMB_BUFFER
  *
@@ -1305,6 +1320,14 @@ extern "C" {
  */
 #define DRM_IOCTL_SET_CLIENT_NAME      DRM_IOWR(0xD1, struct drm_set_clien=
t_name)

+/**
+ * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
+ *
+ * Some applications (notably CRIU) need objects to have specific gem hand=
les.
+ * This ioctl changes the object at one gem handle to use a new gem handle=
.
+ */
+#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_chang=
e_handle)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
--
2.34.1

