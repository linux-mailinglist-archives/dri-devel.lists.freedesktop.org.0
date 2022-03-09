Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D05F4D30B2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D94F10EC11;
	Wed,  9 Mar 2022 14:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEFC10EC10;
 Wed,  9 Mar 2022 14:00:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsnG/J2hTPH10sLJXa4CphuIGaicQg8s0pQgqVQd5NnQETSZx15NjsCPECEOuCtPuToWYoFcRUb4koSce7mslDY17a6Eie5vtFNe7CEZLzxV6H0ISofjQZn7SV83IKOZ/YaPenoSqTxWwcBQEMT3VFQvIEPoBZ2/7lqF+7Bg13EK0c52pD9lmKhQRAvIZOqWtE8fg0S9halN9tGndPDYHwyu7fWTpm+otqRzwB1S/TUWi73ng7AhNXFYU5C4yDnj2VVdVgpdt3wTvmk6zFKXE5y25PcsSvqj9e1WbwtOSSPq+d0lFnOlhlkX8U+kU0xxAPMT2u3rfsIVWstwGqTrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYzIfP1H591S9Ma4afg5T16ICRodC4TPppNkrVB6yfk=;
 b=CZQgNvofRl+Mt/3cbNIGcObqm+q32GaaRdagHy4YbAfuH10tNG6pE7qIHNPnDaTmL30e9PDOWGMYLYa37BrOIe4N9s1/px8N4W2B6mZXD1peP+KdM1tsBg7tvcdWpt3QbjZ5gwz1crk9deVluSJMT85C7HnplpsjpIKO07Baan3vjkJn7y51GoLNsh/bx/0zl6UpglojzaSffW2EtUfhWYTBVs1qOuY9uWgJ6bYU4LaHQpVNRVAC8DsgDRIHdkpiVrIk7hIwsrJx+XCN46t3XhdR7f5SLgMhjK5c+lpHsmrG6JERqBqTT1I0hjxR56HMzNFD6IMUHL0RnS6lclU+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYzIfP1H591S9Ma4afg5T16ICRodC4TPppNkrVB6yfk=;
 b=dx+Sbn/GdBm7qoCG8HXPLU3s16usS6cewfjuZirlsKX6ZMkqytdxSQnyRNvjnFfC++6kHVrLmm9YibjnTcGzmrww275BCO08AueorWvSAfKAvHhCoTntNHY8WQwXrKpXkoRIEM/NCMwxp8RORXZ1xmV8pp2OlAGRiXzoElWRXTw=
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 BN9PR12MB5384.namprd12.prod.outlook.com (2603:10b6:408:105::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Wed, 9 Mar
 2022 14:00:47 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::3c15:749c:507b:2f32]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::3c15:749c:507b:2f32%7]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:00:47 +0000
From: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>
To: "Yat Sin, David" <David.YatSin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Thread-Topic: [PATCH] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Thread-Index: AQHYMyBsOSuJSbNnKkqTkA4t/O9yBKy3FY4g
Date: Wed, 9 Mar 2022 14:00:47 +0000
Message-ID: <DS7PR12MB5933F8FE27C846E216F0E2F9FE0A9@DS7PR12MB5933.namprd12.prod.outlook.com>
References: <20220308191148.13861-1-david.yatsin@amd.com>
In-Reply-To: <20220308191148.13861-1-david.yatsin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-03-09T14:00:46Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=7e2ca9bd-03d1-426c-9ff2-f11a2e94ead4;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49ad0e47-358a-4591-5bfb-08da01d5365b
x-ms-traffictypediagnostic: BN9PR12MB5384:EE_
x-microsoft-antispam-prvs: <BN9PR12MB5384FEF80F9A383130B8591AFE0A9@BN9PR12MB5384.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /270zOxsm0+b8mX1BV/YBTmWjwD2i6vvzG1gHUaFxvvnZcoE3WzypAXaXbTx6TfBQ1atkdRfdV5d3lxD5seWo4FNYzuBWesOW5HWSZtOR4FhezuNARnJk9i/THOMVOPUOIr10NGfDJaRldEArxQczdDGHI2EgWKIPtLUXtEkE1FpCFW/1GXME4svxHnzlW2qPS5wPPpOzLqKBzhFTUJA+CALlCA2SPvdb71agGYv5WYsILzbRulkMTJk7IZssiv4MjMXAAh/yX2UPPmMZrYBPQKnkpkcnHEwjzuel+uFcu5dv2YVkduyn3XZFkNOaFL27GCGQnWhyvSd1o29thkDdLgutCTmP0DfRspZkDgfdau1rT5jP9m1K8CJNmXcx4v1TqCmZ322g3VcizPxXj2zQqrZsqvc2AYvtTe54VCzEJtxkqf0/ReeIWYK9viJEGlH7rZahEGLHPIi9gqoZtw17laRbcl8rT7+W4iQsryygMKKeu5ZzAVR0uBaenDRtTM7G9kIUngd1PF1VfKDvPB89zxsaxv0X9hwSZPgzaqe/tApWE+XMDSCdSy+9Zkfvgn3f4gE+iR4GGb3BTOju7YJn9NiofrcxfI+m7Gk6cjsl0NzJAFQ3cmP3OxJ/JarVC6308N96JSUC0CYnFQFuQNzsfIIgcTie7ifpn1yZLZMoz4drBQ03KoZcCbM6NrIFJbzuJoC41iMnKYPijN73fhAKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(38070700005)(52536014)(2906002)(26005)(8676002)(4326008)(66476007)(66556008)(66446008)(186003)(450100002)(64756008)(66946007)(83380400001)(76116006)(5660300002)(6506007)(110136005)(9686003)(7696005)(53546011)(8936002)(86362001)(54906003)(508600001)(316002)(122000001)(71200400001)(33656002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kLivpDO5T9KlhfGiBsVC6BVZfOwvN6opZo4pfU3NCTJKSpsHBQPmP5G6/xDn?=
 =?us-ascii?Q?c0fdZT5O0PprTXTAg223LY9u4USxpB/vk86j6gj/0vPuLHO71zxi+k/2K4fF?=
 =?us-ascii?Q?YNuFRcAFQUfUXcj4KgV7CYIQStblaUxHPpXCqFOh4GFPM3H5/zueiCR9w4LV?=
 =?us-ascii?Q?xZtRpf477y5m6BgnwKtOHYowicnwEykncyWAep56YFpxv13SZKwB/0kYlQay?=
 =?us-ascii?Q?l+B+SQ/uy4ebey43ObcXDTJlqqivH8bAb63oG+AsV3Sl0/NqnL7L9GuUPUS1?=
 =?us-ascii?Q?sAr7fXrP0MmqK1UuDd/r9r25NMfnD2iOe9yKdHQJ/IvtCaGhADv6Ji+mORD4?=
 =?us-ascii?Q?pr1nX6XZ+dW8ghOnfSTtoIh4aJdBzUpQ6uge8vKdsIIBOlePCyDO9H1E1Itn?=
 =?us-ascii?Q?y1Q4AxgYoSXBEO5jkNGghvD8Fzm52X6vjIrFaNy7a8b/mjKu1SRF6qj9bpPh?=
 =?us-ascii?Q?8upipsR6LE8krOk8bkCpWWeNrRyyZ7yWOsipulSfEJQvp67+OVy2rLqge93g?=
 =?us-ascii?Q?Y0mfOTbN1/nike2S2bVoUYQ4LqczvS/qn26+ae5zR7oGTkkH0YKI65rqFYZM?=
 =?us-ascii?Q?SaJGSGOikeZ3FBFsgo6W3HrmlZdG3X0SN+wPyhlVzgAo7fMrFjYAuff8uNwN?=
 =?us-ascii?Q?p84CbSsk8l30XX8pEESvn6Qv8cbMioTM7hxk9cCTVGrNIKi+GBdSLUbD4mS8?=
 =?us-ascii?Q?9yjUt0dpghA08FnxpJDKha9cM5x5wMbgvLzYCcmTJEOQlB2T/hvGufOcmt6F?=
 =?us-ascii?Q?X42ov+cXo0kmnkfAqYdxZtWLssSbICx3ytjysuvfab6qO8X3dn9hjABUK47t?=
 =?us-ascii?Q?jG5kZSe68jq1WW6nAsTSZYbNuKq92zkospUS1zAkRm97Sbb+o6baNZdpn783?=
 =?us-ascii?Q?kcNVJbhB2MJ9Rsrd+h7yloHC0PWhMBi78A1oh1fk5oOf2KRM6y8+wSV6uFHh?=
 =?us-ascii?Q?QJnuAbg5+HTE5PumZFCEZiJo6po8G+Nl53ZcIgL+mZ3fAXXvSGsSbRJKSJSA?=
 =?us-ascii?Q?TXK4SYZ0rmM9KS2uLaj9AwRKceepyXcoQ26p0dSzsP1252WhKezz68S9Ugw8?=
 =?us-ascii?Q?OHVf3eJxFATfdRHlXADmYae4Pkq2KWbO28uwSHsKRBA5LayV9oP6TebZxY1d?=
 =?us-ascii?Q?U4YpDA9LPou3Ou2gm2gcrso7ax6JKTba3dQdIVqA4zla2bMbaG126fcpDs53?=
 =?us-ascii?Q?akiQFfzmdIckIhE2+E/uBRhZeFWHGgnfu1zUvyKgskr4snfjArUjyj8KrEv9?=
 =?us-ascii?Q?CRyJ2ekC0ZPKWeaJl0OCrKbVZ0duVo9pHe0cksND7jd7JYL5YFbaI32ZrwQ9?=
 =?us-ascii?Q?wxwk+E6lFfbFV1ka4GatthkbIqxkRJoj3zo4hoE3Ltx1EdY0sbSobGro/bvu?=
 =?us-ascii?Q?paz/LGoy/vSee/MbfGWgcbN5E4Y/effF3wK8iomHRqo23+NtaVPHwTAO4PKh?=
 =?us-ascii?Q?OrU0xmcSXYsaROoTiXPXmptE38JXCayqEXJ/eNP8MVYFB4lvbdxVUQHg0Zkp?=
 =?us-ascii?Q?Gy7msq1vwOjnD9xmC6SwBar14u+vk9lLLAxf2BxBEkyg/ZLDlREqDBodPwXx?=
 =?us-ascii?Q?tNOUvi6B0fxUZK1HllcUMXfA6OJkXl4K57zqCHAL12k//fk57FfNfQ29iwpQ?=
 =?us-ascii?Q?JcMMVlJk07taCgAyTcjXVNg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ad0e47-358a-4591-5bfb-08da01d5365b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 14:00:47.6529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uoxPqQCR67tCMXAr0TNZ2CwPLOjPatfoOdeKZ9IYyNo2/XJEBVGRv/Xye0SZMtlLuFJh8b1bFhVA6v8sPA35mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5384
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

Reviewed-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of David Ya=
t Sin
Sent: Tuesday, March 8, 2022 2:12 PM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Yat Sin, David <David.YatSin@=
amd.com>
Subject: [PATCH] drm/amdkfd: CRIU export dmabuf handles for GTT BOs

Export dmabuf handles for GTT BOs so that their contents can be accessed us=
ing SDMA during checkpoint/restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

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
--
2.17.1
