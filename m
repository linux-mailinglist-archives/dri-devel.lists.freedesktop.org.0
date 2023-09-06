Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF97938FC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA5D10E1D0;
	Wed,  6 Sep 2023 09:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67FA10E1D0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:21 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3866CjBb015358; Wed, 6 Sep 2023 10:56:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=Y0ueGAu0yQdhkJ43WW0kCgy8ZllOSswsBtdx7zEZz3c=; b=uL3
 clcT8E3bTuzk54wamf5HGkium7njY+7yngAA/04iNbtLQgz/ohYFOlqf1vMXnpOp
 i8pFYODGM5eMBUj+VFTaIZwvUZabHjzjH+vgGA+YN4H2Ib5a3NbqCxFBnm4CFe/U
 iVJZSNXPb85RsCBM6mCAzY9WaRlM8WEqfBYFRlDE3mY16agBd2JJP1IF8FiIFAVf
 436hQ+6tnjm2XA9294fMKZAGAb1B58gVLGMm65YbZRCr/ZiCj/TMKq7a9MgYcIna
 /7irt0RU3ZUhfniIAvIV59meboHiJsKVab1CvMt026ukLEOlEplPEzui8stUdsPi
 TrumDNivXwpTZxB4AxA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuanu2rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:04 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:03 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.55) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Wed, 6 Sep 2023 10:56:03 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeQuso35e+sCCG/595zM4RnoOiLH/wO9H8PYUQFnOAuGulonU7oEH++WiTcGDcJOWzQGtg7z84DBw7Bea2hgoHOmssEeu9DzLalxXPU0VbSd8THJrRpb72T51qoSVtzQiovTeGBbEC+pnK3Z6PSSWjZ7XcuiOwkFj1mk/tOO16Vgl9+kdxWRFWPJM9hoQD0EKzazPO73SjGmXoQjiIlk1Z9VK3L2u1oESM+H7nwLTgv0v4eKSi4KAKk+a30JxH8xWWQXo/bbAjeTVfNJGJPF3I9yPoSMb4ZYnX5Ts/eTGO7hVP53m/ClVH57uhgO0S8SePOIQmS+bDKazfXvNDDMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0ueGAu0yQdhkJ43WW0kCgy8ZllOSswsBtdx7zEZz3c=;
 b=NCzVlG3UVirHOiXVR3xwoNF1BFrLPm1lN2f7Zcwj5uZNb1NU4SKyUhuxuNfRCuTT3ptk/CAvh5m/cGom5R4fgecP1N5TLGj6Avck/1bcJsFP1Bu6t394TuBa4YUBFGlX+n8JLKThjf9TP2bsu+xWPM9Yff5H76aXcmaEZi6atOFz8DoH5mrUGyOaa/tZ11FnxaJQzamr3cIuZmuYYsEQfgvr7Wg4MNFl+cfH8kGXj29oBl0Noei1lU68MDsre9ax9CPMUA4K3gWUWw1DNhrhvpk/NrxIq2Ddy+cNexkg0JVQQv0OZ2JWLgBUMoqWc5T/NU+cPVvF+ixeqWXctNwkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0ueGAu0yQdhkJ43WW0kCgy8ZllOSswsBtdx7zEZz3c=;
 b=dEgJ31D/VOYcbVuyk9bFqsEGMIWEz6dCvjaHGEI5qhqJ0SgPCGQ2uaq+HmVMvJ4ZyR4YBdgMxPshfABKd7N3Bz0Ma2mKCO5UX/3sphu+V6CKvGheUG/azRThlcMQrMkwpbITwVX42stXMXGiMqrPKRwDhbUAV2yWSf4Z+E0RvRo=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO2P265MB4992.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:56:02 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:56:02 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 02/20] drm/gpuva_mgr: Helper to get range of unmap from a
 remap op.
Date: Wed,  6 Sep 2023 10:55:24 +0100
Message-Id: <20230906095542.3280699-3-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906095542.3280699-1-sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO2P265MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6d8ecd-a752-47d2-7d1b-08dbaebf7a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lycrl8ASIBaC7EqP6AtS2enp6KToSdWropHuiw1jyic68tcD2cLumo7Eu3O6ec1RY9CCEmO6g3Qq9Yx1cbi9yTiA78mlEgZERqkzSxYcErDwSxSeqvRJrWvwmNrHT4fDnj/Eqg0RjHsarIdH6yzFf4tlgdulscSt7W/MfgN84/sq4FDkxADTkD3S2rZvcTcydMQILyZJYSDRSPUJn8rNlVcgGgCApQbzxirdLJxSCR9AdmY6DmQgf+YJyrin/U04ysylg+ClGxZ8Pi7EQLT7VqkzD0xd2wYeJSfMngKhZpTdP2mkmJDupv/uWBacXdC3Ea3IqU6uYOz9xBdJWltXDEPe1yUUOPwjwV2nXMEmEH7rq7Y69uKx4kUEX01kOAHLC2Rs01Xxqu1VNYBBL3vBWngtrGTSKc/LmepRRiZ7zZEEQLa4gAPHCLQIVtWCvz0oQFNmixcVaPv0fC4kRrTvK30Xe60ptawX9xLAtanQbwQe1HH1ggjXtmtTzLf/SWmlt+Nsv1s7a0SvecGnPRAiu8ebHW3ihsP8XBvMSFwMdHFyA+FTlInz1EBcgxhm0zxZd/NabzhkZO8bLV3qg0Pk4nWea1ZbT86kq30A+B+suuWr9YCi4lQ3VThs1fpExgBZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39850400004)(376002)(136003)(1800799009)(451199024)(186009)(8676002)(44832011)(8936002)(6506007)(5660300002)(6486002)(4326008)(6666004)(7416002)(66476007)(316002)(66556008)(66946007)(6916009)(41300700001)(478600001)(52116002)(6512007)(2906002)(26005)(1076003)(2616005)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CHcD9Avo4Ijzhypl1zFD1o29isbHYq7rQGH7HR5ZHI1dyvfQRIjRY3IFJYig?=
 =?us-ascii?Q?g1ZqJvg9SSy8+5bfALTGgtfH9BmRlpDu5CDYCu0XjfCRPho+hr49EbopWpXB?=
 =?us-ascii?Q?54T15X5MO7JG4SVm4UywvkdhZg4YrcbTtapRzhaYHTHXd9Os4yw3bbNwGCK/?=
 =?us-ascii?Q?eYQ0mZDhQKWlH+EIgpYWh0NZwV9YplGJsXDCRqVZ3j2pOk+pyEi/WZLncQ6t?=
 =?us-ascii?Q?jV90hyZfkD0PqGj8hzrlUSVgK3w3gfZoNICclrBcIF4gnu+wGe9nwgTLWoaf?=
 =?us-ascii?Q?LWgc1rJVVCxu7ARRL3Ye2aPqA26BLAgbpCD0wr8tmOkD8ebVLRJHG9vGWawN?=
 =?us-ascii?Q?0sGmd2/dvI5nN9GATATSV0LVu8zWtg5UIY5/eoDPQ8bGJuvGC5OVjdoKmogE?=
 =?us-ascii?Q?7MlJeIRLPupNcADroL6J4vP8XB6QBGBJJWexU1UpXJOyK46NP9nw4j6kcWCP?=
 =?us-ascii?Q?3Esq2ermrsed/7GvEAumHGcWO+r0/EbPK6TOcXPybccR7f7n4O3/D615oI7n?=
 =?us-ascii?Q?bVIEH7AKM+XK1RhuKBuiCcL2eE/T2zyq64p5DNzjajbtZmCrLgQcJQApq64h?=
 =?us-ascii?Q?qds6xVOO4uSZIwMFIsexdsddvOodmERfC287ThvEfaLcc/Xk7DZMdBF8MfQp?=
 =?us-ascii?Q?DaV4Omeh1zhHTbuF8kspLaj4s/laCNczc/Nf/gpmTw1bt0g+ZT+I97mE2f/a?=
 =?us-ascii?Q?B2O0jG9m79OpkblknwYk2H/GSREu109bNN/S7zgda/pj7J0wYZMLxQVvIKuG?=
 =?us-ascii?Q?KCk9TkkNDQjtQ58Sw+ThMJ6Paea4N/ZlnsVLVp3iY+6I4JTClg06Ltnv5dkq?=
 =?us-ascii?Q?YwK3fHYzNMhLZP8an+HSkvW1B9JzxGeDR3/VoNPz66AImLWAl6ZzevSItKTJ?=
 =?us-ascii?Q?Wi0l4dWuE2J/tj/2+i3/DX8Rpd/C69rbcSmaziJ0uxzen/CAYMFGckSnMAwU?=
 =?us-ascii?Q?etx/CzmdB7StPlEgK8MzjuiSBfLASjtq9I0SfAM1azGphwGcyiLUpeQNMWrf?=
 =?us-ascii?Q?pZZmzQ9g9F6vkp1t1L5FrXe1Ilw8b0aGXmcGqMI3R4udXdxgKZklQeR47nA8?=
 =?us-ascii?Q?hO5vJMBBARW6Q1P/nO9Eyv3ZvIXpApZjCuhRwKs3nLbEiVOSTHU5bU8g0ont?=
 =?us-ascii?Q?tCfiwGX7SChIuklmlFEg2e7WvIgNt9R+myLmv/ybi54s90yDeXEKOnIxxeTt?=
 =?us-ascii?Q?rkywAmY4BXr4VidK/6qqZkQ3An6FAlTok/ZJ3+cRndcVt7NHULDb+i5pY70M?=
 =?us-ascii?Q?FA3TU4Qk6EfPN66/9d8XjjZTltgd1P0WQZjJZxUWGjIzd+vlfB6frvBwGPmg?=
 =?us-ascii?Q?Qmlw8Y519qo/gatV9eC/4A48O6B4toQj9nLTJ1yCy293/Phw3nzgJhVTkYY9?=
 =?us-ascii?Q?ARmxQkeVWl9QIgecVKXKaA3qm21NbTJxqVcNUfXUD/wtTyami5x37jJKxh1g?=
 =?us-ascii?Q?aYyLmA/Oo9wnpv2tZfH76rbqSQ+XMFHgmykSHWlN04Fs20b+POlm4vrNmq6q?=
 =?us-ascii?Q?qHwdo0/SKmotMiJIUMJa835pm4QPu5ulRSjergC6+mlqZGwZZ9Kby9n7/K/r?=
 =?us-ascii?Q?++0eNf7SVWhESGc4cbmLqRZlXB1HozfLQ1StRewWKWAgmeSXG9SvpsRq8bFr?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6d8ecd-a752-47d2-7d1b-08dbaebf7a9d
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:56:02.4285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuygC6G4u0w9wTO8viTt2QqXiqG2E0XP/Jl+ieCZg+4sxt8x3vLd2hCwR5VfwSLqu3cJv9csItgaLTxEeE6m4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4992
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 6-Rh2MVL_M7_UIHfu5wfcWV4vdOJbFA4
X-Proofpoint-ORIG-GUID: 6-Rh2MVL_M7_UIHfu5wfcWV4vdOJbFA4
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Donald Robson <donald.robson@imgtec.com>

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 include/drm/drm_gpuva_mgr.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
index ed8d50200cc3..be7b3a6d7e67 100644
--- a/include/drm/drm_gpuva_mgr.h
+++ b/include/drm/drm_gpuva_mgr.h
@@ -703,4 +703,31 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
 
 void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
 
+/**
+ * drm_gpuva_op_remap_get_unmap_range() - Helper to get the start and range of
+ * the unmap stage of a remap op.
+ * @op: Remap op.
+ * @start_addr: Output pointer for the start of the required unmap.
+ * @range: Output pointer for the length of the required unmap.
+ *
+ * These parameters can then be used by the caller to unmap memory pages that
+ * are no longer required.
+ */
+static __always_inline void
+drm_gpuva_op_remap_get_unmap_range(const struct drm_gpuva_op_remap *op,
+				   u64 *start_addr, u64 *range)
+{
+	const u64 va_start = op->prev ?
+			     op->prev->va.addr + op->prev->va.range :
+			     op->unmap->va->va.addr;
+	const u64 va_end = op->next ?
+			   op->next->va.addr :
+			   op->unmap->va->va.addr + op->unmap->va->va.range;
+
+	if (start_addr)
+		*start_addr = va_start;
+	if (range)
+		*range = va_end - va_start;
+}
+
 #endif /* __DRM_GPUVA_MGR_H__ */
-- 
2.42.0

