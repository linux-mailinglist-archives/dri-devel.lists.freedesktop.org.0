Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2178F43E2E7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B739B6E975;
	Thu, 28 Oct 2021 13:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E411A6E975
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 13:59:51 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SD3Hwx023387; 
 Thu, 28 Oct 2021 13:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=edsE0LIgxk6xlpS2xeWdjwqV+In/sCMwdbruzSdqZp0=;
 b=l/R7lZ8sp+7yNZz7qvgedt939/tTbtNmnw92HRUqWCpVPGECn0gV+WBIa3CIfBrW4vNp
 189/5x5ZgLUg1ISH49Lf1jvIxB5TkNc1/oB+bwHsa3sS93YZX3axjzoLUAP9K2szCbpY
 kX2CcSWGKmxIkHIaJdgsOmsBh1mxrtWsbMWl3vdhWPv3eybktG7QIVoCAbyPKgqGFRqY
 78mlNTOukcJblOfjsohP0okWGTPoAccghBgb9+YCGaMoDAMhpB4DX+Qb8XvwIDV+c1Db
 fQd4tCm8FrMslPe2Y9PCDWQtMJFEp32U1f6sBSqLHNtP5O5T9MRZt4EOuSQCi+h7ihUV Fw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byhqrak7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 13:59:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19SDq1pF120415;
 Thu, 28 Oct 2021 13:59:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3020.oracle.com with ESMTP id 3bx4gst1h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 13:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/m3fPtWXaS1BoRZUIQSUG/eMiibPlvPGCljghdyQu1m5KbB1NhiCmYn/oX1huX1Rd5cF07CNUf0c3xV8xgMMHEaPzD7HdfQSIRfL3L/EZpy4aD7SxoEx2/OH764Izug4eebAvjq8p98ED8QEIbOJp/r6MV5mwd2VEtF2UGXUEU48yWiHAzizsu+o5Dtohe/sTLmxEfViY8De14IOrb8JS1QYC20OBAPX62HCbgthsrEVG15NsH0BcmzA7gjtmoJ6S062aYilje7pf4Pg1cB6gRRoisypN7G7XCo+7dEr/Hts3YQHPEfdSIiFLD1PvCt56IAz7jHvDIPS0Tx1V8yLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edsE0LIgxk6xlpS2xeWdjwqV+In/sCMwdbruzSdqZp0=;
 b=jwtytOUlOqFZfUoDb89Z/7/iEvaEn/eK7kUiYJocu5Jf6qze1Nt1qM1r/AQ0uTXj1C98zExeBLK7JJ7PkE5oZwhE81O9Z94RNnQEXorCyltJBis8acOSgF0mHqc7LoUMR5SmgqfoVXKdgmGXg1psa8kfLGQeRlvcrmMQbGwCi1HsKe5KqdQtaujOrJ8T0HEyIOhmBVaPvpV2Yisamga9X203tsPu/HiYsQkcZZ+flXsxCwdENLg+r7Pxief+ep4Z1qgLO1uQacDwdUvsZqLIbD/PhYIUELQrGOU6hQnGSHxd5GGMwhzxEARpNXsXoj52ggwuIZjkQ++ABmNunMG5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edsE0LIgxk6xlpS2xeWdjwqV+In/sCMwdbruzSdqZp0=;
 b=acWQ96HlLe719QZWee+gzA3udSDuzTGHLM54QGeTmBewQVhRwGNg95N4aOUstoXsodE8B554CN5f22PBhD6WOtVodcgGMk/N3MJIuD6quHl7cSN7+tqSTuwY0SUdjHf4hc6KtC9ghd5tf+B/00mN9r7MxwiYv0NLhzmbYFNg1JQ=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN8PR10MB3283.namprd10.prod.outlook.com (2603:10b6:408:d1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 13:59:35 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 13:59:35 +0000
From: George Kennedy <george.kennedy@oracle.com>
To: gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: george.kennedy@oracle.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide by
 zero
Date: Thu, 28 Oct 2021 08:57:17 -0500
Message-Id: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:334::6) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from dhcp-10-152-13-169.usdhcp.oraclecorp.com.com (209.17.40.40) by
 SJ0PR05CA0091.namprd05.prod.outlook.com (2603:10b6:a03:334::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.4 via Frontend Transport; Thu, 28 Oct 2021 13:59:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ebec9ea-e499-4592-c3bf-08d99a1b2c54
X-MS-TrafficTypeDiagnostic: BN8PR10MB3283:
X-Microsoft-Antispam-PRVS: <BN8PR10MB32835BE5E68BCF583305894AE6869@BN8PR10MB3283.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5JRzNdwh+afC2Hb6ZIgmscNu0mK8G1xVUlJSojwHkM7gklhfsfruXJl6KW1p6NVyFV7XBDzG41rKQwbVI99ziXopGG3v4VYD2mObOThPfEtf+740/VPqvcsaD0tE+PHZziRjXLIx/JK/l23cHoz0yzvo3Whx2xC1/12tBa+RiLIB5U6MnqzZ8B7Qb5z5PyezuT2Z1gISxAzZxZ3O+148eIJiOE1edfhzqfZ7n0leP8XUKDJCLnD79rvt5w4BxJgAGDNgi4hv00lBv2fw0y5DDC7wKps1cuIgjHBV0ZkBX2DJ47BLdbOtbRAM2sIoB1hqaZBDAM+dYAUeMaeStYq2U7JVHAo0ErPVYAk3gDDvOvXqFvc/JUNVdHbPmvZ+Fkyn9JW1+lovAgr4VHaNNSpfCpAx60VUe+tmkJUDLEVY1ZHFeMKSvhkYxSSgZMSeP3JrWLhabt0wY2/1SoC7SKUxy7CwCF2Oui3WWeMP+bxgVt7yPw/mwcUsz6tbnndWGOBtkW1q27bZgitSj7JLH2be5fj0xSNGNNgwClnp/EaAN1MzklobeWfJHVUPc/pr7hkDMrvDgm+gby2N54dBvX93osqn40m38PgAFVBkyKYzpiU+0a4Kng6anUzfDAQCbxC2dBs8PetG7xe4x35DRT9IJeDgJPM5dDawyKtpj3Nv2aifKDXUyW5EuzsKszRP0nOWEOKyAbX1fXfuxoiM+3h/1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(8936002)(44832011)(5660300002)(6486002)(52116002)(38350700002)(316002)(186003)(8676002)(38100700002)(36756003)(4326008)(6666004)(66476007)(66946007)(66556008)(26005)(86362001)(508600001)(6506007)(956004)(6512007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U9g0ZrjTzZm7pmGQUAj6bdjhpVmBNUBCXw+lJk/wa3XjvTIRwJhvO/q8Ap7Q?=
 =?us-ascii?Q?FE29Ib/axH5Do/ZEOVfvyRwc1spRSPzS8ak1xACt/5fpSi1v60+gfvzJ6bg/?=
 =?us-ascii?Q?YBpp08vx6ZGaj34bYm6HCcu6EnOyDXFC+UB17jlgnvxqTvbsIvdhOBDMZUDo?=
 =?us-ascii?Q?+h7LvpObblQafwv/KIQ+RwnPz4bsVwUTeaOINwUT+CIi8xUMZInni2frb9BF?=
 =?us-ascii?Q?Ab7KfqZNAd9l5xnC/urAy8WS6cOJNrUTgFR8GZpXaH4K/nxvhCs2gtsMf9xU?=
 =?us-ascii?Q?1au3KWPy4BCxLjnSHqNSZ/J0KcMKVHjI/J70qs0RwSVRXyLwxgsSGFJTMovj?=
 =?us-ascii?Q?/vHhUWtUkbWRcCmC4YhrXPoTI3hV28LsLb84mwXfmELQEvo/f4wws1XWBfBm?=
 =?us-ascii?Q?2Ioso3jJDEMo1H2LdcFZHlI3z88smSP/Pp0UyDugVuz9XCjt2WMikbPEEjdZ?=
 =?us-ascii?Q?CONZV4lw3WmOlbUuKexKLgUoVa11WbCzwEYAZ6doGmfwuyawowN7jRwBo85H?=
 =?us-ascii?Q?r9dmi0TjILdiJE3unSAB71RpLXHIFJFP3cbEdZlqdUgwM1KDQrYP+c73Rnvw?=
 =?us-ascii?Q?qJbMs3pR/UNMEiEOe7McAiglSG/5ewTsqa0Wc3ikHXVBhG7gZXws0OGfy0+E?=
 =?us-ascii?Q?ksVZ543O0pKRfidY/lDY+qx8FnK0Z7MnVkYFXbW7A0wpOe8uk0118wCTc62e?=
 =?us-ascii?Q?7UpcSdtGbmuR5N8dteRA6RnE3A2RY5dwmROBiu6EKmjnc9xGKrV27GmuQbc8?=
 =?us-ascii?Q?BvQxrP9AmSBIxE9pZWanPgirymIZSk6/DzobDlebAVucUiI4hHsWXH/Sqjw4?=
 =?us-ascii?Q?B/AMUGLL7g/4idzQt166UM9qYqA5RR+3dVHrEPc6kWe00WGhenfcDeI4upN6?=
 =?us-ascii?Q?yuIfdOkF0neO9YvKXmuH66WYM5W8OyEQqk4k/Ee21QPb7HBrXk3YLw9uyotU?=
 =?us-ascii?Q?TDe8LSoplvWOP6RAKnFy/MVWlCkswjW/sMU8Uqa8PzXK/5W4au790TsfK1H3?=
 =?us-ascii?Q?H2Cd5fYtoCBLY8Hfcyrzz1VdcEXq7ItW7dGxsAPjfDStu8Glv+uFiBlfXhbO?=
 =?us-ascii?Q?Cu4xJmNAHFDo85descBjX4SYtdepZjUYjnMxgGPxTgNIiC5t+6KMboNd6v4o?=
 =?us-ascii?Q?JHhA5WRaRtsCS13WHh5ghg/IPKEgMHjwlQe4YuX8e1Wrcan71fsQ+RNPe24g?=
 =?us-ascii?Q?JlQzLwEL4zVIi2wBWKEU1ZKvwNUW/AfgYUsph9Q8/sTME0sXbIVkWJ+B8o0Q?=
 =?us-ascii?Q?KzfRPukgJqLxXgwPnAIvVTXjAglpkWx5MYY9/VopJIDR6Tlbv+HjYBDYU51a?=
 =?us-ascii?Q?N9kwD0NolVA0aszVq06reggm0xS65BS1DRgrmW/8CuEqVtbm8SDNlONeDUWV?=
 =?us-ascii?Q?pZly1SoOAvemPj6pvlUs8bt2S4tLdnidtAFh+aW2UNQXuhNdthAA+nL17MrG?=
 =?us-ascii?Q?4iQyAy3ngtK0guUAcv9hdt+nUOdFT018EfTvsy3zVizpmXevVv/lKJyyhFge?=
 =?us-ascii?Q?ggo3nVX74JyxnLaHlLn2+tah9WPYkwMYiZSHF3NeD7k0xfj4mtOIg35k0+wz?=
 =?us-ascii?Q?fu3pvX/c+gV2ZZlNKaFzM/EmO5m2elljA9KMAXgfm3VBtZMp9pqbPMZ8lEie?=
 =?us-ascii?Q?U0kKfryJLm7EgcDlU6+FC9B4phIGC7aPihsQUnmVOdzgjkbt4b3csQ1foqev?=
 =?us-ascii?Q?II3I0w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebec9ea-e499-4592-c3bf-08d99a1b2c54
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 13:59:35.0821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCFhfBAbOEdaNu/2iSLskRo2ikqy5hkyW+ZC65M06FuPT+yyz52XA0szE9orls1x6B1Ph/dX9RuwWff3yrDGavJut9CQh5MT+F5aU2H5WPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3283
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280077
X-Proofpoint-GUID: 7nGOtMqxqKYgxx0i_oyayPCIesDrqdAA
X-Proofpoint-ORIG-GUID: 7nGOtMqxqKYgxx0i_oyayPCIesDrqdAA
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

Do a sanity check on struct drm_format_info hsub and vsub values to
avoid divide by zero.

Syzkaller reported a divide error in framebuffer_check() when the
DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
the DRM_FORMAT_Q410 pixel_pattern has ".hsub = 0" and ".vsub = 0".
fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
vsub as a divisor. These divisors need to be sanity checked for
zero before use.

divide error: 0000 [#1] SMP KASAN NOPTI
CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syzk #1
Hardware name: Red Hat KVM, BIOS 1.13.0-2
RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 [inline]
RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
drivers/gpu/drm/drm_framebuffer.c:317

Call Trace:
 drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
 drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c:391
 drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
 drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: George Kennedy <george.kennedy@oracle.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 07f5abc..a146e4b 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_device *dev,
 	/* now let the driver pick its own format info */
 	info = drm_get_format_info(dev, r);
 
+	if (info->hsub == 0) {
+		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", info->hsub);
+		return -EINVAL;
+	}
+
+	if (info->vsub == 0) {
+		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", info->vsub);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < info->num_planes; i++) {
 		unsigned int width = fb_plane_width(r->width, info, i);
 		unsigned int height = fb_plane_height(r->height, info, i);
-- 
1.8.3.1

