Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818CAB217C5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33810E560;
	Mon, 11 Aug 2025 21:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LfDdkegH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D461710E55E;
 Mon, 11 Aug 2025 21:57:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Er3zoDrLkWrlEYrdL8bGg8iVkiXkga/ANwgl1GAV5iyrtM2WOrQk1OAcHP/ESeu2usyVK44YxYNDS10F38T4VJNnwqvy0XrnRKMGiDzmeuOb9Frt7WOOUECY5Ktb3wUj2Kt83yHOH5HALcrv6UKYsmsIH38wTH3+KBtSLx+YJr8UFiMBkU/q7e7c8m0EUdlS4O9QVCAKI/JVszf8FDySq41GIc52yJzGwqWq+6IVPPnbhK2ZSRaQpC9xNAvq06i0zYI4wtrrXALSMgnZ6XObrjUoztgk6dQJ5tcLNXRMRBi0EF52DUlIxBG0a68QybDbqycGxUxJyTxK/SKDWIUpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMDCUEYtrIFUxLONA8iGoB1QLo3MDnszV2H7rBE3jpw=;
 b=UlQ8as643A6kXSy+0y9zgd44oVlmv02jtTSEbzc8mdlmClQzlZt/2GwTONjw+Wa+/AcJvXFhZ7AV19EzMOz0OqnbsH6euzr4bhYqc2VjAp4uls85qmrz9Q1GHvP73TeMcR+zXtMi+PXqqT67NCWfsGV/alvzwoJ6MvzglqU45Hb6L8qoxbU6p29vRfQ2QqF57M+wkpD9GtGEJ7hKwooaD5EAtlyIHTFpFFpWh2ftcbiRm13NgeIgGUHP4jORtIU2A4gXw7znkCTtdqd7eQlGOh2LV4zZDJmgN7WodQbI2raKPK493vCgkEvJPs51hB0ji3kS2D9YbkzXEi5o1Y4xIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMDCUEYtrIFUxLONA8iGoB1QLo3MDnszV2H7rBE3jpw=;
 b=LfDdkegHlbzwmDQcyKPW0lwWPMT4G23RHY/ILtKBVZ+JZ7qWO53DW8puHUtPGzWOwcwMdr/KXYtRF1hX6Ntha2xvGfa7JhMAxwF9WnPkbXpyAksacujKrcdcKN+ga6zfIDnwoW7AItg9/mXou9mjCgy6PZsQ63WwLSQto7FsBQSzaVcp29r2Id+GdKOu4rt9RQvhA8Pa3Xf9tqU+pToLf8zA4HFwjZUrUs1hG2lPFJAJ6hmVM4lheQANydtfIrX2fJEDZULj11ogH7xsT1XIQRX7wKqQxgNmvM4lxQBsFab+Iatc8MLE5bcXp7Qgl4cPwqQcC9i+ABz69E+sI6lpVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:57:16 +0000
Received: from SN7PR12MB6691.namprd12.prod.outlook.com
 ([fe80::d15a:729a:9a36:4376]) by SN7PR12MB6691.namprd12.prod.outlook.com
 ([fe80::d15a:729a:9a36:4376%7]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 21:57:15 +0000
From: James Jones <jajones@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH 2/3] drm/nouveau/disp: Always accept linear modifier
Date: Mon, 11 Aug 2025 15:00:16 -0700
Message-ID: <20250811220017.1337-3-jajones@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811220017.1337-1-jajones@nvidia.com>
References: <20250811220017.1337-1-jajones@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::47) To SN7PR12MB6691.namprd12.prod.outlook.com
 (2603:10b6:806:271::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6691:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: b81317a4-b774-491e-2814-08ddd922085b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oOwFJ3kjqq2OuEvYLFpW8+GsB2NRJ+QU7g8GnnScD+hHLbAI9dy657RnRj9T?=
 =?us-ascii?Q?CagWwtPVjtEujsUnf2o4aA+/79hjd4ohLwAVovqWK/8bFsIy0Cf2rcc4g30+?=
 =?us-ascii?Q?98B1HiqEyzpujaUxtJMkcBTvcm++06X8gDTT9taqA7tkFN6Rt7WrzMledmKX?=
 =?us-ascii?Q?rReeOUQAjejuvW7A3PCqVPUook1NJUcmhEcRonIJFzCtejIJUSIqeopwJqyd?=
 =?us-ascii?Q?Y+16o6RxzglPqrrREGv/L/VDsN0iVrllXPU5ONkw7pVPpMjyuMuFNgugOPa+?=
 =?us-ascii?Q?OWgcS7uh6/1RTZ7ylRh8Yc12mjHe21v/KX5v+Iqx7z6DGLg0Qg+rU4hvsgs/?=
 =?us-ascii?Q?WEVZfreLgu0Y3RmCnVTDELP+NMMspxjni2YdfMqjh+IZvY2+nealzDkTKrJJ?=
 =?us-ascii?Q?y7wFiEM6LW67On6fcPSczphELeVcPXZ27QA/UC1dcTEYQEwekQGUiwmvm7au?=
 =?us-ascii?Q?9Ew8QksHd6sUlK0EAYxsJzXpRXbTbHKPDpoH6r3Vvc2e5+o+Owpjy4eIxS4l?=
 =?us-ascii?Q?YcCn2nKDrAUBH3u1gI4vp7/gKNtoisdw4U1NFfshddtATXuq69GeHykpoA0C?=
 =?us-ascii?Q?Vjx6tQpXqsr2ucxXuPY1KTyqJAqtqKo2eOaVsTQ9S9agPWywAbVbUxyG8pEP?=
 =?us-ascii?Q?wHR+Yj3WU3U3aciNWe3vq7rTuKyOJGR0Ervd0jcBEWIefpatkDmlpOl3I0uT?=
 =?us-ascii?Q?D9GQfnbPIzBbOOL21oyChSW9YF93ElC5NZqKI825IUNuMlbGhna3CJoBQ1Dn?=
 =?us-ascii?Q?q/eI4A+E8yPQLXPjg+V8v/yZTRVSy2VLowlxy/M6rq7kDKK7wCNBPGzWkyAN?=
 =?us-ascii?Q?6Mn51b6JQMXNeSxyVbARloeBYseuSxBDQS6ghzxWAb0JiyfoDx6cXo9D6SG3?=
 =?us-ascii?Q?QfYpR7M2m7BiuxctzWwOfkdmQPaa93W3LN6VhCKn30rm0JvLvOA1fpQGAUZT?=
 =?us-ascii?Q?+at1IRgi6ZjNBaolI3yKmz9uKhoEkvsVUxSpnrrRqO79IPT18dvXhEnm3wda?=
 =?us-ascii?Q?sdHP1rXDzeBJv2LdZt8G0mAtYys5/QoUhlBWLBNtuWPzggTi5olRboiOGVKN?=
 =?us-ascii?Q?+a5fb5YD1Eapz0rqoIAnZ5LgBGdy3Dk9geKBbj474OeD/qQx7GdhBHYgoONn?=
 =?us-ascii?Q?s11eR4WLsSHu6fpH5eBNYJdum9XBsYIpois1PkGcdtZqFazPiRZfYYJMqMDm?=
 =?us-ascii?Q?e8MGZRbaHDDTrly1TXYq2/iUZYy0LIhtTHJcEn6FFeBZ9/VFpwl5qWc8hOam?=
 =?us-ascii?Q?DQQVBPuivC5N9IHe+CTFqstmdOM0nQm8yK3/p79Ib96K25wVRt0vu1y4lUda?=
 =?us-ascii?Q?0albvoq75GDk8ub2CJ5YQQ44075WfXkoT+s4p9uRE7qWdBTLA3jBI+L1IKes?=
 =?us-ascii?Q?/5nLuTSwH5Veqr34W8GOCnrti/IjOngDxdNmeFxclHIntOhQ1q5SzjzJBr/i?=
 =?us-ascii?Q?9KNzr5pDGRE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6691.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LcFOYqUlDc6COeaw4wAARdLo44c/jEWyD5YufrhWMgoPKQGrZBfg07TOwgeM?=
 =?us-ascii?Q?+MmKhjQFBxenUolRnJ63QaxHyFBlHjJVGbzmB2pOzTVCiCaOeEi1Mey7yRq1?=
 =?us-ascii?Q?TeAy/Ifl5PGDgItPxzhUP00dBqjL+lpLKgbUcJ9POTktPmWyJnV1wFw7v9Mn?=
 =?us-ascii?Q?nLXt2qQe18HstsCszpEvUlcwZOLAQpKakJLupMn093Y7Cq/g/vqve7I9B8aW?=
 =?us-ascii?Q?zm8uQkx8efTeruGWZAbDT/gkr8idAKoX2/WXR9VA9m64ZURJCOnNpUpt8F6G?=
 =?us-ascii?Q?xzCY6T9RuR48UYbqo8xFybdHIe7oiFn4nSPTchSiAh7GSdQ74+5z1XW58x9g?=
 =?us-ascii?Q?S8QJCdgz+iFcPID9Q6LOwAdWa421wCEopncjLfKR2DbXTA2H2QumtOi58R2Z?=
 =?us-ascii?Q?reLZTg+0AT+b74h1V+f4hFRu9oesL7ET/d2LhTmfryGa/42xj+0lRwHJMzxV?=
 =?us-ascii?Q?ZDjzLI0b/jxdP5c4vDl3hfKnx4EJuzhrpa3fPNtXmnQe7eoTsk/5meWq9Ss/?=
 =?us-ascii?Q?oJgDgHpaWOwd7CBD66+jukqhu7JH1JecrygD54J9WVWY5IqUX9LZLE08TOWU?=
 =?us-ascii?Q?82/zZR+o2HadHCF5j7PM6SYtot0G4vVtr7Mt4NeeI0pa9yBT2txkk/wZomuT?=
 =?us-ascii?Q?tKbOb/3pKgovzKt7WDj3vSj+shxhObgf04MtnktRZIOpoqyJHwFrHgiXo6Hh?=
 =?us-ascii?Q?PyeLu32LcWGOL8mC7ScHXwLDDhpMtlcR7zn43azAHHwx19pyzclrvA+tDMbP?=
 =?us-ascii?Q?Dc1Ps+0PPOeuhTzUxHxheKL4ptCfojKWYPYbR3g/GeNJdO2N5Sw9gGA5Buay?=
 =?us-ascii?Q?Tq6ZDn8PZop8Vuf46cobWBW0lAkRBbj6PbXbrLbOZWSHo5C9WbTCudoZ0mIK?=
 =?us-ascii?Q?f4/YoOOEesAxsgHwRdrP+gkBJGLeqjZp38EK6TgPYukxsDJx9/wr9a/PycXn?=
 =?us-ascii?Q?nQ1fYPsazxylQTGvlv5ai3gzioVTw2Tr7s65Uqv6cR3xCJnugd17MNuFFwkR?=
 =?us-ascii?Q?98EQQ3J91Wft7rpfoDA8I2WX0Jy6Tx4s3e4I1JrgmIS345DvVD0junizIe6/?=
 =?us-ascii?Q?+tcRGhh1/zG46TFmsXVsxDb9bSmRCy4fFrHRv9VLJFXJYyOL5Kobj7umc+0P?=
 =?us-ascii?Q?LesTVS4/KeBJk6HcHfny2A2lQtx1g20rlgmfABCvDXTMvaWX4N8GEK0aBcHa?=
 =?us-ascii?Q?ff47qbS+hBsxTfFbYl75ZffSYWbbd00V+pwasjUJwKtt6I+UscFJE0h6qxIZ?=
 =?us-ascii?Q?aJaTTKBXSIqGc8Tw5uE4XTg5Bpn4000EzuQcpd0ImvvSFGpRq4eRxOG3Eian?=
 =?us-ascii?Q?nmD/+HdCMRN5R7IqPHwM5klGXSgy5ShUhOVJ4VY3TdhopST556N3rzRsAcEI?=
 =?us-ascii?Q?gqygmeL2wBg/jkfVx5mNchZAKGhE1Mr+QSRUmpmViUsBcYWrPwTCdxi89Q0E?=
 =?us-ascii?Q?KsO1Nec5AMTX/w004JopEhU0bo1uatPXjvz0TfFK77+cjNzRyyJXMyeuWZyS?=
 =?us-ascii?Q?HzGia1FoKD4JJKu7UfgT8Gh0op8qQ9Fv1IzsvA9puGVq+Htkl4Mtxo30pb+Z?=
 =?us-ascii?Q?dWPpZl6+A21mwtP7tFpSapzyM4FhQu6kIpQh+uXm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81317a4-b774-491e-2814-08ddd922085b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6691.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:57:14.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Du1d8ls0XGyS2xXF+rLPWa4s4lHDE0VAM5QSYCL79jVWGe9SF5DNVmk9h8qW1rt4Mux8rcMRIdoS3BxuERp+zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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

On some chipsets, which block-linear modifiers are
supported is format-specific. However, linear
modifiers are always be supported. The prior
modifier filtering logic was not accounting for
the linear case.

Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/nvdisp")
Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 11d5b923d6e7..e2c55f4b9c5a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -795,6 +795,10 @@ static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
 	uint8_t i;
 
+	/* All chipsets can display all formats in linear layout */
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
 	if (drm->client.device.info.chipset < 0xc0) {
 		const struct drm_format_info *info = drm_format_info(format);
 		const uint8_t kind = (modifier >> 12) & 0xff;
-- 
2.50.1

