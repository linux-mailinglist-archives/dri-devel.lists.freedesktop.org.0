Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A038F4D30C3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F5210EC37;
	Wed,  9 Mar 2022 14:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6C110EC35;
 Wed,  9 Mar 2022 14:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6pw2bXc+eqbiveJhmzLqPGoUc5UyV92HxGlqJXkQZwz+4erRkko6nkIGgn7+A/PY2ZqZZXGkC8xBIMd3HTKLwqobiO7gbclkQ2BLXAt4xUoIJkd3Iws9eWypeyG2zdpJ7On1Rd5gWpEkW3mhFBfPvIpOG3fQ49uKwIBPNZ6my1GhzcgaajZv4kOs6WcASgKm9eiw/CsfZUcXSxs3qVWP/6YGcGCfcSNaCFDdnHRAYKlcfmq57uyis2dO5ZW6C9zIm00c1evcCNmsvucNaOIa4dVYQqO/BuM32G2rteQk0vSg8Y33OBMnxnViKyhj1ap1a7xVot+aT/285ClhkgeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q5xmDd+EiJN1+UUuh5cnZokpW7ysX8iqLl/W3wiPwM=;
 b=bTcJyfli3eeKRfsiE4b4zxSIUtTfomiYrlxlDtl3dnGkhaVVmkx5zT88UsRwmcIE4NSHEMMMfwJJMaqsvPmG5G3TXtHnSrmdxiu7HaMzsWj6KCEuIVZ+L0jk8lXhDq/VMKl84vbHCCZT1+J2VjvC3IGA3zAcgiCGpayUZgVjoqk3q6CKCl5kxpNjx+cBbJ31Zgq5DvDR17UxNlf1Dc8V8uMxAU5k5jPbP3dOs7xdVjsDQUk8fsSaRmIR1deWx+KbmE7J0lHKd+KO4KnHcF+g1GR/976Rs6Bub0ctBUqLAwF7SvbYy5OFGbrFAN8OHvt3uBgW+EF53gVwd85Nd+MEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q5xmDd+EiJN1+UUuh5cnZokpW7ysX8iqLl/W3wiPwM=;
 b=kCiWlZzSUevoA2rKYG4SlukxenQlehbke32F8Ir0MO47hS7YVXIXEwMSgPqXwTTD1j7rtyJA11KB03YPdAc79Tpeht8PF14QEbgsU3cDOToYnreTDsZuLjOvG7AvAYugNy9QoEySfLKD0sER9uiuthGxvGcFumJzmEE0Y5ZY0Vo=
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 DM6PR12MB3804.namprd12.prod.outlook.com (2603:10b6:5:1cd::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.19; Wed, 9 Mar 2022 14:03:45 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::3c15:749c:507b:2f32]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::3c15:749c:507b:2f32%7]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:03:45 +0000
From: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>
To: "Yat Sin, David" <David.YatSin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Thread-Topic: [PATCH v2] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Thread-Index: AQHYMzCzZDsbwtl1yk69jyKPXL+4Hay3FffA
Date: Wed, 9 Mar 2022 14:03:45 +0000
Message-ID: <DS7PR12MB5933FF024B4814D848F3A16DFE0A9@DS7PR12MB5933.namprd12.prod.outlook.com>
References: <20220308210818.2864-1-david.yatsin@amd.com>
In-Reply-To: <20220308210818.2864-1-david.yatsin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-03-09T14:03:44Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=58250be6-7774-4326-aadc-48c6d71808de;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45d652ad-7d89-414a-49cd-08da01d5a045
x-ms-traffictypediagnostic: DM6PR12MB3804:EE_
x-microsoft-antispam-prvs: <DM6PR12MB380499BB5D607ACBEE90633FFE0A9@DM6PR12MB3804.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XogVKEw64unQ1vymkgeF5RgkBWpQ9TVjRFVaIj8RIQ1v3kIbrrG89Yqb6mwHCrP18FYbrdQMYKKY+Bc2w1eJZBvEl/kti3DQl1b+e8JTfnO2AR2HRzAuAEORby1H3cV71+bCkJAJ1TdMF+9lqlmdZZ9TalVN1KiMZI179W6DJau/vLP545QxGFXMu8TNii0385Y/FL7mmI0AuAMJXTnllgy9kq3MrJAJpuFuuSOKbVqdopm5i1OVcJSxfyo6izoMpcvV4Ij5rZ+ohFExVnAJGlrmBXdo30h3dkC7zbv0dtQTzyHmA9g9DbDnamNxZEd2DdlPP6MW0CnyA4k7bmmRDCKBeWAn4MNuxP8OOjv1A1rptofsCchQ5H4zTmdvpsKcIL98jFbQJ+RZLN5ABaPd8RI2CC5efysU8hB8Kcs3M7r5wplCSLn0aNZxZm0sAcx5DALcPPMK+QpgYjBzbH2pOItjpC4jtmX+06QYDN1otxqcvZETdIxt18/Aup2H/2Cy4qTfOj5Y8EXk7z9kYkseedsr6WWiOsYk9A3jCRzid0VWt2x07mCxnmYTfWTeFfhijz24h418brVxtMm5+aqRGk36FssHZqZGt36cre9RN1H3LqddDHfXScCactdxCP4vX9Hzic2qLJVw2VkxowNh3vD21x6w5tWMHyCL96gfUvbwZ4o92Z7lTe6LW/nyJKOVi7NC2/YkaQhkGdAMhVC9tQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(66556008)(8676002)(66446008)(4326008)(53546011)(64756008)(33656002)(122000001)(66946007)(7696005)(66476007)(76116006)(5660300002)(71200400001)(508600001)(38100700002)(55016003)(2906002)(8936002)(110136005)(38070700005)(52536014)(83380400001)(9686003)(450100002)(186003)(26005)(86362001)(54906003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tvFEPuM/VTbZHW653Z+qzJPfq9cnUE2mgdcx4tCU0Ql3Tgb0o5rC+kER+ZkL?=
 =?us-ascii?Q?QTpdXLlm+WpKu3IjZ3K5rzJvuRBjnC0SI8N55ZVDuzL7qttCg6TdEckH4MuH?=
 =?us-ascii?Q?MVfG1UvpZjOva2zE5pCcDUF1/ypf3vLq6w59Lpb8WeLXGkDG8AERL2fR1Tv1?=
 =?us-ascii?Q?RdKKAV6M/TqjAy/DiyfnlCdnBroTBtNx08C8aaKjG1k5fwBONZ9sENgIRJHa?=
 =?us-ascii?Q?+FPyIC9XGb4tU0fFX9klN+pmB+A+sYf+Atd7kovhk5HFwxHaYHeryL7JYr2u?=
 =?us-ascii?Q?nRXtnzICMHII2UkzMJlsW0W25Py9j7OxosV2iInFxR8P9rlmC3rxchED+ajb?=
 =?us-ascii?Q?THPXmwudC9bj2ZfRHV8EgwUgAtBnIby9TpjfJVgrr081ROoTdg+MCTj5mfSE?=
 =?us-ascii?Q?OR102SnPushb0hsQT0KGYka5JfTGxLUlLo49hEnD/RpsVMhUO7lY1cmH1XZu?=
 =?us-ascii?Q?TMVFOXCYk5s8F7GFtwp/+a4psqpsHcKEJCBVxot72s/e5azJZs3TEghOGf5A?=
 =?us-ascii?Q?eOqd2XMkGJqmxDsu9H2iihOOOThd8MiGPxIrOn1FJt2XFlm4LbhT3Xizpv4H?=
 =?us-ascii?Q?JeXP7ScrpA8VanR27H29/mVy6Su63LrsB9A/ly6eH98v4yIPboxWxxW+Dlvi?=
 =?us-ascii?Q?a19rKNrIu8PlXJcJTXneDkZdXFGtc2670BvfshoWhhveO3XJ5sfHaft5jnxB?=
 =?us-ascii?Q?hccp5PZT9p0bEMiFHV38SnvysEjcPhuVWUOLDXZnqvP5ZNROpsCK51hKNZLN?=
 =?us-ascii?Q?X7rVpGaHBpYMAi82Zj9PmQmkkxl2Y/NB7yZgfdKB9xkn5EJ03qT2mLnNSMQw?=
 =?us-ascii?Q?aH0s19G+BuJkQVBaKe1tZ5lSP3qxJs79hd4ez8r9O3hnpgibyjN5TBshO4mu?=
 =?us-ascii?Q?/KID1RilCIl1w2PZ+nKC8JJiW8l+Id1TJM567uO9S9+hraK3jEeZk4rYo3LX?=
 =?us-ascii?Q?H4Ak+57KV7k54ewb9gRwAyPQntAaM8ulU0by2e0kxmm5lxa6sj+/zsvyOBke?=
 =?us-ascii?Q?9c+cGCGZiMZoWeCPT387V1xq62FfHZYNvRmpLiaR4H0d0LHe70Kbn/Psl930?=
 =?us-ascii?Q?v+bMM+oghTy7sr/atObas0inJgPq9CQEkY2EsX2+5xHTcUFa77tuMxbPxp0F?=
 =?us-ascii?Q?hVJvZLvlnU9yr4yhLYYtIF5UpqzPpSJ13/cBQOct0WhIExqES2PKU3yFHIle?=
 =?us-ascii?Q?rGyDAbLORE3Da1IbTq5ozLHekhwOprqlf75N6bsfMHr7QjymUXTt5aH6Svus?=
 =?us-ascii?Q?ENFZPoXzy4VB/tp3ZuQD24kKnOOSaSs5ByJZmyQBs6jKTlCgjWVuNeiI+NXf?=
 =?us-ascii?Q?Mp6fjCo4yhJJtnO/cKXJG1QsYfSCnOz+8KyhoGwTOONPHD31s/V37vEnApXh?=
 =?us-ascii?Q?zoIoDX8KgcmYExA3TH+bb+eyX7NWoZ8WV9mmN8roX+6evn8eAaGve7k2sDkO?=
 =?us-ascii?Q?84QCJ66PCYJDMhlsLopGrOw8sSgzj0rr3ND1kLQk0vYaiHxwiWUPLOK8Ru85?=
 =?us-ascii?Q?ro6yXdNtuRhwZwFcm5OxZQVRl9bSnwwkLdFpqCKZs/Sy7idcrg0AP/WnXHPI?=
 =?us-ascii?Q?s+2LhPflpt1WbKNZs/Z3fXohCDlmaOFj7PGMzs0pJFzaMcdt1fJKK+IS2CTq?=
 =?us-ascii?Q?en6JnO1+uz6sLP2MaIQQbZU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d652ad-7d89-414a-49cd-08da01d5a045
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 14:03:45.3497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAjn4KnNmPXCxmbjXmKWvE6UfVWKR/qJ/Y1/XP2H4AqAUahtnfOaoGQ7skNWbxrrWycYBNFig2MOD/BJWrzmyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3804
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Yat Sin,
 David" <David.YatSin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Please ignore the previous email, that was sent in error. This one is with =
the minor version bump so this looks good.

Reviewed-by : Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of David Ya=
t Sin
Sent: Tuesday, March 8, 2022 4:08 PM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Yat Sin, David <David.YatSin@=
amd.com>
Subject: [PATCH v2] drm/amdkfd: CRIU export dmabuf handles for GTT BOs

Export dmabuf handles for GTT BOs so that their contents can be accessed us=
ing SDMA during checkpoint/restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 ++++++++----
 include/uapi/linux/kfd_ioctl.h           |  3 ++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_chardev.c
index 2c7d76e67ddb..e1e2362841f8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1759,7 +1759,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 					goto exit;
 				}
 			}
-			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+			if (bo_bucket->alloc_flags
+			    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))=20
+{
 				ret =3D criu_get_prime_handle(&dumper_bo->tbo.base,
 						bo_bucket->alloc_flags &
 						KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ? DRM_RDWR : 0, @@ -1812,7 +1813,8 =
@@ static int criu_checkpoint_bos(struct kfd_process *p,
=20
 exit:
 	while (ret && bo_index--) {
-		if (bo_buckets[bo_index].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+		if (bo_buckets[bo_index].alloc_flags
+		    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
 			close_fd(bo_buckets[bo_index].dmabuf_fd);
 	}
=20
@@ -2211,7 +2213,8 @@ static int criu_restore_bo(struct kfd_process *p,
=20
 	pr_debug("map memory was successful for the BO\n");
 	/* create the dmabuf object and export the bo */
-	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
+	if (bo_bucket->alloc_flags
+	    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
 		ret =3D criu_get_prime_handle(&kgd_mem->bo->tbo.base, DRM_RDWR,
 					    &bo_bucket->dmabuf_fd);
 		if (ret)
@@ -2281,7 +2284,8 @@ static int criu_restore_bos(struct kfd_process *p,
=20
 exit:
 	while (ret && i--) {
-		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
+		if (bo_buckets[i].alloc_flags
+		   & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
 			close_fd(bo_buckets[i].dmabuf_fd);
 	}
 	kvfree(bo_buckets);
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.=
h index b40687bf1014..eb9ff85f8556 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -33,9 +33,10 @@
  * - 1.5 - Add SVM API
  * - 1.6 - Query clear flags in SVM get_attr API
  * - 1.7 - Checkpoint Restore (CRIU) API
+ * - 1.8 - CRIU - Support for SDMA transfers with GTT BOs
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 7
+#define KFD_IOCTL_MINOR_VERSION 8
=20
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
--
2.17.1
