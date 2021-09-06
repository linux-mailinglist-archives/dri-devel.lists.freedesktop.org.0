Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2240125E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 03:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F8089A92;
	Mon,  6 Sep 2021 01:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CE189944;
 Mon,  6 Sep 2021 01:08:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLHFx3NFlds0KsCVR9wDqSstGvtz3ykqhbkLsxcwCWsDzZr2jnUOy1bvONnSk0gFXGHmVdgDCbHEWMN7gCsd5uMndSPa9fLZGWdSzeuwfaj9wZRYjchmHS9+wqJcPGIoJR9uojSZY+hRFgX1uL14J4OX2YfOROLQ6h2/KwG7Ty5frr1zG3lvkoKJ66JPS5sLsNEUKkSlWw8KRlEC3XbOxzECfkYF4MwW5jv4zr3erQHq958ySB9N4vB+ccqaMPG/NpfLBCCl7vsOfKu4aIbElQIuDtjvdTUZcNZ6NTpIPW8brjJ3HAc3H+snmW6XBQyyKgyFWuKjjHnrmCcKenxDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Zf8R8OOTepd6/fVZS3uaEM9a/+cztjIJ14WaoOv6ncg=;
 b=N2A9N8qIcgnFoYGsSPRf/hSPG5c+wvCXtQJls+TPOA22ucrZiGt4tAQ6dSAGLh5SIz7iTO0kCh1uEAANXJe2IXSfPCVvhN5oCUOj56arebftx/nFlhSntgCxo3KzLySA/d1g1hf3jNuPPQVu8L4tKycYeDVHJVOnZIc/JRDIHbMnXyhIdqgGs5tONGVvedtTAc5YLNU4Ri5zRj4tRtgQ3uaF0ScuOugE11A9sXORqLKtnmOgTFdC9H7goethV2vENmI04L7HiEvf7ozHXLzWc9zFZApSDuxIu0zNEUXNAoQXWtTg6QMXD3Qv9XaNphPQGZOBBLz35h8YzxT3e4mNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf8R8OOTepd6/fVZS3uaEM9a/+cztjIJ14WaoOv6ncg=;
 b=Tw5JX9NuU03MTVqjF9KMgSI55jRAYaTw7UqswZ8eH8CV48Hm440WWnYAHf5+dWhCgszeik6jYH2o5CK20MHm91x/e9L+4m6KPtqh2APaqmdzYivwRNbpGZDdSeEr9RbVjr+obcK8vRKDxf/6+nuqr9a/edv44jFAdkdsqrrossc=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5101.namprd12.prod.outlook.com (2603:10b6:5:390::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Mon, 6 Sep 2021 01:08:36 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 01:08:36 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: [PATCH v2 1/2] drm/ttm: Fix a deadlock if the target BO is not idle
 during swap
Thread-Topic: [PATCH v2 1/2] drm/ttm: Fix a deadlock if the target BO is not
 idle  during swap
Thread-Index: AQHXoruneNx0ebjVfkuCSfTXZI/x3w==
Date: Mon, 6 Sep 2021 01:08:36 +0000
Message-ID: <DM4PR12MB5165F8DD4CB3F59C9CA2947587D29@DM4PR12MB5165.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-06T01:08:36.221Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 7b9a144b-874c-0558-ce58-2c57815891ad
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40f7a02d-de75-46a7-1252-08d970d2daea
x-ms-traffictypediagnostic: DM4PR12MB5101:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB51017DC9906D1D2E963EAF3B87D29@DM4PR12MB5101.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LiDfLqgWFChE+hlHwd27XKJZfKp1CSYGzQH2WECM9MAWmhiCqB3PFWk3PM2iyxGnOgBQUHJ9iIg6QXwyp6YKy65ykTl1gXuCIITfY1092WBLjqx7qp++L6z0E5Gzn6RtR0Y93ErYsPwC+BcRPH8ic9MsEBZsRQGQHNv3TQ9kw4XN6RW13FuaL3dXdBlH6bJQi+o48lqxd5JQJv/8H7cJ4PDBhIseR6QMgEIqAMssejMVD/vcn61b7VafoAZohVsm8zYmmidwT/wJ/ZaVrINWGIG8v+ph1cPKWX9cYXykeo2cGnRoDey6ZLAZwFzrI8blbiD36QR8wR0RcYgBJ6l5Yi2M25tvkcFE2zjRewfnMcZ2gkFdkpkAckwg8eMDMPZ9khDrJr0p9iM5A2kaN+4iUFQTynmqnE6eVYEZARomzpXPy7ywkhjWQHYLPrgzcdfDocCDs9m1mkH+jlG2pDKwL3JAL6C9uOjXNaXgL3eGmFSeAPdo6N0PNXfHIyFTPXHprBNkssfvSANwshSbb5xPAEhh4iaGNrX3W0obhyt9URX7Db72h71X//wGqxYhFK1U43Vk1beExDcZa0B82JIt0It+ct/vt9xdKhSv9C0cRu/IFRFZODkBm8Xqi5Qgw3XC02l6jjYWx+GiUJgKBDedmYqkiplnkufjiaoCJtYHNbVVG46cOXzIsuGGVYR46hAqWJ1EqPBXtiKYO4Ml+/d6SA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(8936002)(8676002)(450100002)(91956017)(71200400001)(5660300002)(76116006)(54906003)(38100700002)(55016002)(110136005)(52536014)(26005)(66556008)(64756008)(66476007)(33656002)(66446008)(86362001)(9686003)(122000001)(66946007)(6506007)(186003)(316002)(7696005)(4326008)(38070700005)(2906002)(66574015)(83380400001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mGOu0/MnJxCt5wxEMOh+6mW18FFfSPtcPKE3E/8BTrX3ET6V63HIESLykf?=
 =?iso-8859-1?Q?yeUndq2XTcawrF5ZP4ZRVJBQlvioaYvs1kQGsK84tiN1V485Vlf/pYjLX5?=
 =?iso-8859-1?Q?tT2uXi55aBILZ+sQa50X6xiQGSuZoU3+0Kkt4X8rnQvqV5e0GRQCulNGhd?=
 =?iso-8859-1?Q?ZYMJ1ADt2tdnxF35HTkVWaXan/FC8QKCzSCwPnkyP/P7HvJU3C7LgroMZ6?=
 =?iso-8859-1?Q?F6TAKL5bt0Ws8wrRvKAMEcv/klUfb9AS+XEo/gl+ZPbbHbIr1518zMNlx/?=
 =?iso-8859-1?Q?wDKrnQoo0yYbs2qWAAfZzV3wZeE+Ns0u0I87VIinYQ2EtBp8guFU5FPXpC?=
 =?iso-8859-1?Q?t5+A3SF9fxPHFQiwOfhGp7qWTxKehOUiWThH0CroRqDTgb6iwKT7TB+7j1?=
 =?iso-8859-1?Q?sb4ghn4wVMx82C4oE8LAXaICUcPMw1/42jvsE8OhePSg0mBSM9PMxIfVWG?=
 =?iso-8859-1?Q?4WFg29UqM9kuNLU1OT03e5VgKB1YOiamH9VIEhczgBlBJhCnb9siB02YcY?=
 =?iso-8859-1?Q?nEotoqC0qtQBWqJiQG+MpMuaZ8ghpS1oDyKjLGPx1+I3dYifZQC/+gmZF+?=
 =?iso-8859-1?Q?VN5Ol9XUArEDsRIE2f8HUFycAZNCoNFcxfHAw8X/210eOmOxlDgbtO2/pd?=
 =?iso-8859-1?Q?zVjIxPGNHM1jxA1qDrV/JfUT4fCdDQlQBUi6HIsmphDWm6QyscMRQw+snw?=
 =?iso-8859-1?Q?d73en3rXr13V/KsLAcz5QbLT3CCmSXUYqJD4+5QAJRQ8VeZeWMz/rVuYII?=
 =?iso-8859-1?Q?8DKWBYrpVcooqqqE261qxi+ljnts7cKAF1mgRSqPOtETBwZN7THL9CK/OD?=
 =?iso-8859-1?Q?kGfrJbyZaixrZPOPyOJWBovglxiBIdwGJiAvTyULr6h2dJbyDzVGCkaaUP?=
 =?iso-8859-1?Q?R08sDglrrYMy1v5F7NYw6ehdtwSN998LQw8RxVky/Oru9CvRcKHKAqWTP7?=
 =?iso-8859-1?Q?93dltKEAsDdh43BE0ERX2gFRh99+CtsD1hml3WiT5A6r8WI/tdMmI7gEaw?=
 =?iso-8859-1?Q?Ju3iCHf9Oo/t3k2QNPoQQOpd4/qbTDnQkNz875AVcC7UJmDm5ZLnwcOHqy?=
 =?iso-8859-1?Q?EJqRlBJqCyJsD0914CeyEEZ19OfEF18M71g1aZ5o3GJD2slr3Qz/x8Xf1r?=
 =?iso-8859-1?Q?agIACtnmb/RJAAzvaX8mhoAWxpEu3K5EEOYEwE1+x9ne1o1bhUwFiAxC2X?=
 =?iso-8859-1?Q?h3gK6YZcAglNgDRuliZ31nQaH3odaF1j8uf1PVgMohQeqO8tAx2UYUj85E?=
 =?iso-8859-1?Q?CbOfttPFSGUWT9u7AN0VK1bfOBezSoy6/KZNFamXJyFJKESFH8HUoxVlDx?=
 =?iso-8859-1?Q?ItyJLF+CZE2K8dHMPo04fCbsc/r+d6JHupZIx1el09ecyTtljpEmYjXA/1?=
 =?iso-8859-1?Q?u40sBseKoR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f7a02d-de75-46a7-1252-08d970d2daea
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 01:08:36.6647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eb0xDhDjOxQuLQGYKloOGz+FCrZFsztyN2D9nr61ffsuhSqiW2A5Mc/xTXsMQAw1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5101
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

[AMD Official Use Only]

The ret value might be -EBUSY, caller will think lru lock is still
locked but actually NOT. So return -ENOSPC instead. Otherwise we hit
list corruption.

ttm_bo_cleanup_refs might fail too if BO is not idle. If we return 0,
caller(ttm_tt_populate -> ttm_global_swapout ->ttm_device_swapout) will
be stuck as we actually did not free any BO memory. This usually happens
when the fence is not signaled for a long time.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 1fedd0eb67ba..f1367107925b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1159,9 +1159,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, stru=
ct ttm_operation_ctx *ctx,
        }

        if (bo->deleted) {
-               ttm_bo_cleanup_refs(bo, false, false, locked);
+               ret =3D ttm_bo_cleanup_refs(bo, false, false, locked);
                ttm_bo_put(bo);
-               return 0;
+               return ret =3D=3D -EBUSY ? -ENOSPC : ret;
        }

        ttm_bo_move_to_pinned(bo);
@@ -1215,7 +1215,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, stru=
ct ttm_operation_ctx *ctx,
        if (locked)
                dma_resv_unlock(bo->base.resv);
        ttm_bo_put(bo);
-       return ret;
+       return ret =3D=3D -EBUSY ? -ENOSPC : ret;
 }

 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
--
2.25.1

