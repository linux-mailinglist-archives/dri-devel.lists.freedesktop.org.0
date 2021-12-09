Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6198346F016
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D1D10E858;
	Thu,  9 Dec 2021 16:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD1A89FC8;
 Thu,  9 Dec 2021 15:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYBzs7bSMKpYvEEkpdsqsq9foddwFk9cUywaglMI5J/9te24HFtHI/X8DUYQ61dYKk2zVBlrXLjuggcRS+jWIWN7lE+BejiDSKzycZylVclnbLMF7ihR1Scy1i+3bH9fseTCX0FOhVdkgd8i0QTRvap2Gb2EO80a0LZ+I/fFF+OLPFV5GcYNOeVRwW8wgLf3NE/Tz2z0lwEbriaozuTAhOUhEQZoysgfcOfRUiboBwset6R76N2Qv1VyYZ6w2zrVli17ZdbDDTHVqkb88gvOJ8q3AfzjPs7Roo7/UHz36d0BnGT5/x6rvt6rH32RcXmio16XAb5qX2FiyIaRYVwTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP9hjxNKPHAuUfzmmhjJrhOleDyU5nbujbANDX43K88=;
 b=V+SrXY+ReLhaP4Z45m5r0XYvyZZBUMZcOHHun5LhGLMw1lNgnTnt0bR2ZoRnEdFJntMHg+cBwh4MSRLJFF+VSCiskhVrfc4mtNAUV3S9eQV1+yd9L8bJFz5Iuo+b3o372Njh8CNUP+EuqWCO/SFUBWzQ8civisqNysgbWDCZ5DC6lsyU7BLskfMpZpYJKuR5m6+PQgpNLwjREF5Mf28VAYi50pfemHJGkT9CxuNmOHK4kMIXLtWjJ2xFRmMagqlMJmmJaHlqb5G+AsqiRLYMIgQdGJIX62vAmTzLtDyimSj+FYQtoZE3M4xsiNMn0EvVxW7kQf90ILxXgykZJQss1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP9hjxNKPHAuUfzmmhjJrhOleDyU5nbujbANDX43K88=;
 b=Uz2qz1eYdMV5FB+/6rjGzqXxJBEIJS1dNN++mxRw8SEgVs1Uv+OksK/yfMXUYf7Lso0BCR/jHR2xgNhCdUDbFodIslv/o/QcyrwOD0VJYtTx07dDyM01zmXmYE2eBukKct2NCE00mgSXRM/TgGG+T3RgJ2XzEm8BVg3jbMX+0Uw=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Thu, 9 Dec
 2021 15:52:16 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::98f9:b924:cedc:93ad%5]) with mapi id 15.20.4778.013; Thu, 9 Dec 2021
 15:52:16 +0000
From: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
To: Matthew Auld <matthew.auld@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 4/6] drm: implement a method to free unused pages
Thread-Topic: [PATCH v4 4/6] drm: implement a method to free unused pages
Thread-Index: AQHX5tIzzwcXFgr9D0eHvlkpfFmkZKwqWxCA
Date: Thu, 9 Dec 2021 15:52:16 +0000
Message-ID: <MN2PR12MB4342E888EDC333C3089834FBE4709@MN2PR12MB4342.namprd12.prod.outlook.com>
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-4-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20211201163938.133226-4-Arunpravin.PaneerSelvam@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-12-09T15:51:27Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=fc9b7664-9cbb-4287-b7d9-370de903d03f;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2021-12-09T15:52:12Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 04c07627-8762-4f8e-842c-ee03a86381e7
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 339fef28-dfc6-4c68-aa91-08d9bb2bdfe4
x-ms-traffictypediagnostic: MN2PR12MB4335:EE_
x-microsoft-antispam-prvs: <MN2PR12MB43353DF7013A9165605BB671E4709@MN2PR12MB4335.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iJPhxJ5HGSmuH71bBEvY+RopUakRFEOOs4EFwfEUWkftSSyqdk5CKeHSOC1HaQKbXxNQau+AMzIrR3c6A7ohv7EfSO11RYCeR48X/KqmfCVd3jVG0Etd0OKntlyQHICYGvNRwQZ02VygxXfNvj6j0q7Ag9JKhS9n9dWcfXHiSFHMYN/NTk+XLxRDDWFOCtI6q9LWYa+toF75dwWpvDrF6Ierm6XUzYOOke5HMpIomAlFf20e+OVVa8ejIRWU2zt14OBKL1+UcA9yiLAh0gdCmJaD+JRUe/9TngXgOeQTnJsIbiu2YXpfp1ENKlQZMgxMV57rUqvfH7SM2Fp0TAQI9x7DhpXDu7RD0KwQhv8bGqNqF9shcsbrLUARo4RVoy1Wudyn2fvuOHm/btQPdvpsD/Gvj3wIyQ2p6W6hRXAoGLaHmQEFMsZ3F1I4mhk//ihDqZxhtyHicqJHbHn8o76opAS0CNujBySDN6KPvonV5NgvGkooBzxoJJkK+TbIcEE9JzCx+A6q+DURkbnfVES8Qy1k/i0tfCT3qK3Hr6FJuKUGbvg/ZkRiSWhRlDy6PKY5cb30c2pQVtR3kw5AJau1ertx56YTUaL49MKBviVzLaLd1LB4mPSg1z3lnCmL+LEchI4F1QTkQfZoNUH3KD3MgARSAj4945Nx/kJfg3zDUY7nDdZn/JDQPF9Zno+UsNSmZhsXHUAL18G7BmpHfSOrhA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(9686003)(76116006)(26005)(8676002)(186003)(83380400001)(508600001)(71200400001)(5660300002)(110136005)(52536014)(33656002)(54906003)(316002)(38100700002)(53546011)(7696005)(4326008)(55016003)(6506007)(2906002)(66946007)(66446008)(38070700005)(66476007)(64756008)(122000001)(86362001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MK+FNl0aYQ6+KcsQJcCenAUOIK7YIuy+7wROM+04CjriHyoXXcDMd47Z1hIZ?=
 =?us-ascii?Q?/k+9Ar5eIzAXI5Oz/Es6U+qiTUe8G8g8tpImkrUJZZst1Igr/RW6hge30vtW?=
 =?us-ascii?Q?ItWKd7QYYYwqg+5Gjyf+Wqt8k4YYePy5gE2fSj2npBVGEYqZ7PR2ve2KqxU5?=
 =?us-ascii?Q?g0HEC+prnwlZyzjTifwTrKSpLnsNFBfl9RIvg/PzOhCGZ9BFGx0tE68k5tXh?=
 =?us-ascii?Q?gEtOlpMSyAlgqXTgqKCSvHA2mNh7HvOLwmR7l+bczs20PbzeBnAq8NVXI4D+?=
 =?us-ascii?Q?k81HxP3Y05oObox1I4sP9PUMP417Gcd5sra84iwYhR0eNerDfNVAEILfWD0o?=
 =?us-ascii?Q?351vgkAy2CbOFXEQRiBmSrtPk0BWxD8902F5LBYBZ4pF+wBCY9zORyZESl66?=
 =?us-ascii?Q?lNg9pU43o/XxXEpCj+h0SjuVkIp4I3Be2jgF7H2WuhqcE/S4JPBihmgyDAMI?=
 =?us-ascii?Q?KEJvzBUNDybhVEMjWmmOnPBFXj6TH07Urm6N/5SJgxfpWxB8IqayiGjisR2d?=
 =?us-ascii?Q?HSCa0jq1fAguKPtPcOVTa2l4L+bDFHQzAC9qFf2v+7Ioodh2WNjdl5gH+DL8?=
 =?us-ascii?Q?GPrBVyARtWrqs3qc2kAdHM+FCLrwk2nbRNDLsQ9wJlw+lQOsoKHmgmk8DQm7?=
 =?us-ascii?Q?LTUFWCinq0xu/FdIC7DNgHKovJeW//l5QS5IZAYrK+OKuYHjCQfrjcmH3JBm?=
 =?us-ascii?Q?mQRoHPoNTbEepQRqugspaVunEuTCT0JCsRxAi3+R+oMpw7yLnMr0CUm0mBsg?=
 =?us-ascii?Q?/RM+15/xW0BMgvyGcJ5W7Iprccq8gd3z+rZtj9hsZt7JxRLyAcWr6BGy2f/P?=
 =?us-ascii?Q?Fpq71fYusuXe4eR/BgEtw3O21KGeGoJ9VoDrFAAvuUx61Uz/rwvFQQkLHsBi?=
 =?us-ascii?Q?NuKh4AjYoW3H9+gPDb2MgOPgwJx8lRXLfljY6Hy+RW78XDCK3GPxzKg++1D9?=
 =?us-ascii?Q?RXnfYVmNyMGBvTrckkd570jqbNJpQdIyQ23HydEUkRq+87nfyKtPTOAIkwLJ?=
 =?us-ascii?Q?OxTXNhRvrBfbaaCxohvnjIN6d7XDX1CEG01uKd8ZOY5Myh2HvUsJw8DtGRL2?=
 =?us-ascii?Q?719eFl6Dg89hpWZwVwNhS6jSFd/LkHQq5vTiOm9RolPoyfT/AYQGyzfr2GEJ?=
 =?us-ascii?Q?cchnXJsgd7ATSSVYjFGv2EAz7clHr03x16hfEi5pC5eKxEMg3GcO8Kb92tSQ?=
 =?us-ascii?Q?3n+4qDiW3v3Cqu1pRoLCZ/gcuzo8giyaCqhfsKEeAvzRdE96uejm2ykKDqV2?=
 =?us-ascii?Q?EdEm0jP44XvZSB/di6HeOMPxIDqXj/fGHGvLb5QuHcsBOlCgvVR7CWJ9Ol3f?=
 =?us-ascii?Q?AwSeQq565qfis7lJoLNveCmTHgZtGOSw2PdYbSL1OXp0c8255xgBkF1oIS7M?=
 =?us-ascii?Q?KNU9JJTYJ7WiYcWQuljYzTk8FtldOPY651n+hMipQG0fkRAnTaDxnqUpsaze?=
 =?us-ascii?Q?t+I5vWGtelbpOv2E7SRn4D0dUejDMOYq2Nekuof6NxMpCLKYtNqLBf1Aekmq?=
 =?us-ascii?Q?sJC2z8Oz0Fwjy1DsALhv5o66so4JjVqzjOHC24rH8M8Q5uzFuRmr6rBdT+dX?=
 =?us-ascii?Q?sqvFqVY7a572U1iXrXVxb7QQ9lASRZpOadsC8reXOUF4wljwL76GqLtNR3AK?=
 =?us-ascii?Q?DWRQCxNfEhMhbNn0yHAn+j0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339fef28-dfc6-4c68-aa91-08d9bb2bdfe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 15:52:16.2054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3rKuTB9V1PdFDOT88fAL21JOeWjaHgLTgZT/QCTkILHeM2Nlxts/WA/Mf56vcdJapTYjUc4vebHn1NrzFDBGYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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
Cc: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Hi Matthew,

Ping?

Regards,
Arun
-----Original Message-----
From: Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>=20
Sent: Wednesday, December 1, 2021 10:10 PM
To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; amd-g=
fx@lists.freedesktop.org
Cc: matthew.auld@intel.com; daniel@ffwll.ch; Koenig, Christian <Christian.K=
oenig@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; tzimmermann=
@suse.de; jani.nikula@linux.intel.com; Paneer Selvam, Arunpravin <Arunpravi=
n.PaneerSelvam@amd.com>
Subject: [PATCH v4 4/6] drm: implement a method to free unused pages

On contiguous allocation, we round up the size to the *next* power of 2, im=
plement a function to free the unused pages after the newly allocate block.

v2(Matthew Auld):
  - replace function name 'drm_buddy_free_unused_pages' with
    drm_buddy_block_trim
  - replace input argument name 'actual_size' with 'new_size'
  - add more validation checks for input arguments
  - add overlaps check to avoid needless searching and splitting
  - merged the below patch to see the feature in action
    - add free unused pages support to i915 driver
  - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
    are all globally visible

v3:
  - remove drm_buddy_block_trim() error handling and
    print a warn message if it fails

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 72 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
 include/drm/drm_buddy.h                       |  4 ++
 3 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c inde=
x eddc1eeda02e..707efc82216d 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -434,7 +434,8 @@ alloc_from_freelist(struct drm_buddy_mm *mm,  static in=
t __alloc_range(struct drm_buddy_mm *mm,
 			 struct list_head *dfs,
 			 u64 start, u64 size,
-			 struct list_head *blocks)
+			 struct list_head *blocks,
+			 bool trim_path)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
@@ -480,8 +481,20 @@ static int __alloc_range(struct drm_buddy_mm *mm,
=20
 		if (!drm_buddy_block_is_split(block)) {
 			err =3D split_block(mm, block);
-			if (unlikely(err))
+			if (unlikely(err)) {
+				if (trim_path)
+					/*
+					 * Here in case of trim, we return and dont goto
+					 * split failure path as it removes from the
+					 * original list and potentially also freeing
+					 * the block. so we could leave as it is,
+					 * worse case we get some internal fragmentation
+					 * and leave the decision to the user
+					 */
+					return err;
+
 				goto err_undo;
+			}
 		}
=20
 		list_add(&block->right->tmp_link, dfs); @@ -535,8 +548,61 @@ static int =
__drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 	for (i =3D 0; i < mm->n_roots; ++i)
 		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
=20
-	return __alloc_range(mm, &dfs, start, size, blocks);
+	return __alloc_range(mm, &dfs, start, size, blocks, 0); }
+
+/**
+ * drm_buddy_block_trim - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @new_size: original size requested
+ * @blocks: output list head to add allocated blocks
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and it can be freed.
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_block_trim(struct drm_buddy_mm *mm,
+			 u64 new_size,
+			 struct list_head *blocks)
+{
+	struct drm_buddy_block *block;
+	u64 new_start;
+	LIST_HEAD(dfs);
+
+	if (!list_is_singular(blocks))
+		return -EINVAL;
+
+	block =3D list_first_entry(blocks,
+				 struct drm_buddy_block,
+				 link);
+
+	if (!drm_buddy_block_is_allocated(block))
+		return -EINVAL;
+
+	if (new_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
+		return -EINVAL;
+
+	if (new_size =3D=3D drm_buddy_block_size(mm, block))
+		return 0;
+
+	list_del(&block->link);
+
+	new_start =3D drm_buddy_block_offset(block);
+
+	mark_free(mm, block);
+
+	list_add(&block->tmp_link, &dfs);
+
+	return __alloc_range(mm, &dfs, new_start, new_size, blocks, 1);
 }
+EXPORT_SYMBOL(drm_buddy_block_trim);
=20
 /**
  * drm_buddy_alloc - allocate power-of-two blocks diff --git a/drivers/gpu=
/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_ma=
nager.c
index 7c58efb60dba..c5831c27fe82 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_=
manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
=20
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		mutex_lock(&bman->lock);
+		err =3D drm_buddy_block_trim(mm,
+				(u64)n_pages << PAGE_SHIFT,
+				&bman_res->blocks);
+		mutex_unlock(&bman->lock);
+		pr_warn("drm_buddy_block_trim failed returing %d for ttm_buffer_object(%=
p)\n",
+			err, bo);
+	}
+
 	*res =3D &bman_res->base;
 	return 0;
=20
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h index 316ac0=
d25f08..90906d9dbbf0 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -146,6 +146,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
 		    struct list_head *blocks,
 		    unsigned long flags);
=20
+int drm_buddy_block_trim(struct drm_buddy_mm *mm,
+			 u64 new_size,
+			 struct list_head *blocks);
+
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block=
);
=20
 void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *object=
s);
--
2.25.1
