Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1435238CF33
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1526F900;
	Fri, 21 May 2021 20:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E02B6F8FF;
 Fri, 21 May 2021 20:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILaGWG0CePYgCYlHkbmZwaYR4aJsYUjPUqgrLUC7YoxOHrvEaUQztoTWZJhbnmrafM27PoZg4Bab8Q5BRFrNclh+eKg5ralVtnonCUUFmt0JSxkZeQDH0Z/bGdwSvN2epTHj83BaV5S85rx3k4Wu1Q9mFJEPSLfMxhNdVjG41ALBYbVx1z5GdnP0U8ZLvCIrfHnXcB5ecgcKtTLmyFAS38VLaZFLDkw8SritLvu1ooDuMbPhL0QRlX8eZwomzu+OsbYl+FQi7g/Rfy+/K74EOvdkfP1SUefbL2bgoJP9Hlqz5rcWV/BwbiIcuIR9HYznrT3yXcY+UHxlrUKo9pHfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqQDIJAQl+HRCXA1R6eb263jcSWsPPdpMtygOEShuwg=;
 b=g6pKcvEwtsLlYFDOZY2rKs51q6CQRLWips3RG1XyeUoZavy7n8vfgxTooL48XhXZvOTLKS8iGGz8IlXtUS4TgZnXz1Id7mElCaNRdqad1Cn3KcRVmcYF3nApjAGt1g4ABklCdUOyrC7+FfpqnzdAGfKEZ6T6qOjeSAs1mRxkKbhtxn+9DugakycZWlgLHgoeRFV8zk4ifBY0d6cJ1bPhP/099qBmzPDs8lj58I2L0LViCiwOjtoXSfuH22n+paq7oBGB5r0OyUUzxcWu/lK1D10028e/OOK2eJtVV9ogfbrlbImEqDac+N6NKDe+1QB0v0/mc324oQCy9FadpsQk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqQDIJAQl+HRCXA1R6eb263jcSWsPPdpMtygOEShuwg=;
 b=X2SN38ipRMWBfzoC+PKsb4TRonQ6oKIKfe7HZyUjR/N1xf8MtXqWpcwkdy4pAxOVBt1zgAF5Bu4q4dpxLs1eUprdkdBeWwGB9DY+rxzfblnMvSWrtV3exJT10D1toYJsAWRCKZl6Gp/u25Vpv3hevTyORjjZjQue8KewcxgR1JY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BY5PR12MB4952.namprd12.prod.outlook.com (2603:10b6:a03:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 20:41:36 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::58e2:2ca1:afbc:5122]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::58e2:2ca1:afbc:5122%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 20:41:36 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alexander.Deucher@amd.com
Subject: [PATCH v2 1/2] drm/amdgpu: Rename flag which prevents HW access
Date: Fri, 21 May 2021 16:41:21 -0400
Message-Id: <20210521204122.762288-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d]
X-ClientProxiedBy: YT1PR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::20) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d) by
 YT1PR01CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Fri, 21 May 2021 20:41:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d74fb4ff-9d2c-45b1-d3ae-08d91c98d2f5
X-MS-TrafficTypeDiagnostic: BY5PR12MB4952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4952AF378F0CCCBD2B6B661EEA299@BY5PR12MB4952.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCsNMm0bvfgIE6V5a/jwI1AjQ4BoJ9sQMCRur9WIaRqtNsYs2Bx9YfupBU7RjfiTe5d6VuE9TJGUiOys3BGld7ZI+nytA73CW846sMnCZzacj6TPmJN+FC6TVdxkw756bang9vIR9lBSKKQoQjr2dlZqv/M6r1no4+Y0PkNycnlozVyrEsoq1VnT9qKJjqZGGEvapPxiN9U4cHEzNI0T3urFRx69psMEeYKjUXuZbPU0Puu/OTK7FiRBDyOL4ko9gfS4K5Cp+CsdOn2YlW5Y4OujLW3lx7u1PMyH0YtR6EThKzT5yhrOXNa8QGr1tZfF5jV7D/o25YXYq6rDUH5umCpTagIBNTZ9NgJY04ji731v9RzpvdmyxVDIR4oS4zKVgt12RQCMztBcxRriXI2oshzGriOPkBsVItcA6KiiA4lkW4w6lceBkR3xErgCAoMyxs+RaFRgSiX3xWbdv3AX2wKjlQAeq6ru/fEog7uIpV8zU7mMuz35b9Rv/UMUFLsaBiUhbqCl6rn0s0o91yXQxF6GYttYAit8TdRgkz7hefXiERgAWaxT1RzKf9A9JJ1MjZiKvpdFpgD+qjSsjcAXlezySugINUptWDRbcBGc4hM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(186003)(16526019)(8676002)(2616005)(316002)(52116002)(86362001)(36756003)(6666004)(8936002)(44832011)(6636002)(83380400001)(2906002)(478600001)(4326008)(5660300002)(38100700002)(6506007)(66946007)(66556008)(66476007)(1076003)(6512007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wxmsRkHu+VVAJQzSHhtujwAgRqVixArDG2ylPTZ4bOAOGh6NG9cbNmCtHwKa?=
 =?us-ascii?Q?/FbFbxR4IKgT3/lOvrse1/Z75S4hivveZgrzzkUgkIjPF6MZ2CyfLr5Wtwod?=
 =?us-ascii?Q?YUUp1HzmjY66vFCGmzqv3f4z/lAm2fD1jXOthCdNCbBlcTNxUt03jtC1TbxG?=
 =?us-ascii?Q?Pltj7wbu4P5rodn4j9bCQNkEsYFp6BpT+kWat5lDIJ4iCrsf8b6f6S3bxsQV?=
 =?us-ascii?Q?Jh0q2wbMeno2/g1pzCu01jQFExCsJykTKpMNuNvO3KbHl6vwjUMWZUJG21q/?=
 =?us-ascii?Q?k7qfrsLQG3E8RUmTEvrQ2DKvAA+suTXYCzXPKrxDU8XyjwosESoTYPjTzweR?=
 =?us-ascii?Q?2M0sJ/MpokgEE8fdDbR6bxZZU5I4F6Gsh+GhRU/ZQKcdI7GCUlINmIRf1D0Q?=
 =?us-ascii?Q?eStt+kNIAwVep83uHljkUWa2IPCTy3jV3IzTTxlsyj6gkSTeycJBaTvSQis6?=
 =?us-ascii?Q?itS+d7OLSZevksaetzwGHx1iz2QaOjVZ6kRFlB9Bo7YWLZA3z2ERd/28yKH9?=
 =?us-ascii?Q?fvglHmRwqbW8tQAeOhmc70hSJzVEop80twNDaDVqKKCrhNMBikyeWisNn4EH?=
 =?us-ascii?Q?4QmtvAb7sqVJPgaXYdVWuj9S+agEXH5C5H5PcTWSjii8resUcY7/FZKmLzS3?=
 =?us-ascii?Q?r5FebpazOSCbFVeHUSfD8V+aHPno1Xy4MhZy6dLb7zR7/a0eAbtqpnEd8UP9?=
 =?us-ascii?Q?+qVShiufXoFuIiJUey5u98oZn7BOLfCWAC9uSzxY0QaQwv5xdE7Y6blaJXN+?=
 =?us-ascii?Q?QYFa/StirpAGAsIDy3MwnmlsGeF4Hsbp8hk932YvJz9y4xsoRf8NZNR0HR09?=
 =?us-ascii?Q?g8+cIYaELaNkT48m6q8UVX7fnyVO6vK5rbpcEMKejp237Cb0ayixUPtHhKsV?=
 =?us-ascii?Q?b9mSGeveWkbSRbPPaFriDXGkO1CvvuuvEPXkOldoEKzS+pKwxsaf1FIVBzNK?=
 =?us-ascii?Q?F5E2NR56rkEfLkbwwbiVbgCkVAUsT1IHXbxTJrQdgvjFO2WeNXN/xrsEwOqC?=
 =?us-ascii?Q?mzoVLc+g2Qzxnp09VrFFpaIJ7lmejVlkyq0kpP7g1H8z29t+l3ZjUNCD7wPe?=
 =?us-ascii?Q?Hi8fNlHq99LpyyH43zn+yxR5+ek0TqlFIK/ZvHR1G+DWDebdoyMoHWnkVTGC?=
 =?us-ascii?Q?RkYJOIs3VsOd2z6Wjs6DnI1Emh7Zhss21TZP4zD+BgjK+jvdYfpqUCv7laaZ?=
 =?us-ascii?Q?Qs8py4goZDvPC4sI1btP3LF6sm8RGDOXriMfj/k0W+4UU+kD4jfi6oHoHIRH?=
 =?us-ascii?Q?B1VipNvVM9ZuhcYn5fmV5lbB/7NnahAfCk/Tm5l1ZXp9JfSIp0dCA/T7QUKU?=
 =?us-ascii?Q?VpTHfv41SJjHXLcuqoDV1cR8u3HvK9SKsV4fatRPyZdjDnjmStqADgLsBoW/?=
 =?us-ascii?Q?YTA/4zItsFZ4deVIl2vvPuwkbzP9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74fb4ff-9d2c-45b1-d3ae-08d91c98d2f5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 20:41:35.5914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xa0Md7OXFheNvotsUOXgVXbMPkX9iSdiqNMaZFa2Am815qGI4sZpxmVq2A6AJ8OLn07z8prifPZTkvmO5OqjTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4952
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
Cc: ckoenig.leichtzumerken@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make it's name not feature but function descriptive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c     | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c     | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d830a541ba89..d0e557cb5f1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1076,7 +1076,7 @@ struct amdgpu_device {
 	struct ratelimit_state		throttling_logging_rs;
 	uint32_t			ras_features;
 
-	bool                            in_pci_err_recovery;
+	bool                            no_hw_access;
 	struct pci_saved_state          *pci_state;
 
 	struct amdgpu_reset_control     *reset_cntl;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index bf5055642b82..60e945471a54 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -340,7 +340,7 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
 /* Check if hw access should be skipped because of hotplug or device error */
 bool amdgpu_device_skip_hw_access(struct amdgpu_device *adev)
 {
-	if (adev->in_pci_err_recovery)
+	if (adev->no_hw_access)
 		return true;
 
 #ifdef CONFIG_LOCKDEP
@@ -5335,9 +5335,9 @@ pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
 	set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
 	set_bit(AMDGPU_SKIP_HW_RESET, &reset_context.flags);
 
-	adev->in_pci_err_recovery = true;
+	adev->no_hw_access = true;
 	r = amdgpu_device_pre_asic_reset(adev, &reset_context);
-	adev->in_pci_err_recovery = false;
+	adev->no_hw_access = false;
 	if (r)
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index baa7d9778583..ce1577687ac2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -232,7 +232,7 @@ int psp_wait_for(struct psp_context *psp, uint32_t reg_index,
 	int i;
 	struct amdgpu_device *adev = psp->adev;
 
-	if (psp->adev->in_pci_err_recovery)
+	if (psp->adev->no_hw_access)
 		return 0;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
@@ -261,7 +261,7 @@ psp_cmd_submit_buf(struct psp_context *psp,
 	bool ras_intr = false;
 	bool skip_unsupport = false;
 
-	if (psp->adev->in_pci_err_recovery)
+	if (psp->adev->no_hw_access)
 		return 0;
 
 	if (!drm_dev_enter(&psp->adev->ddev, &idx))
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 2408ed4c7d84..540fedf787c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7332,7 +7332,7 @@ static int gfx_v10_0_hw_fini(void *handle)
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
 	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
 
-	if (!adev->in_pci_err_recovery) {
+	if (!adev->no_hw_access) {
 #ifndef BRING_UP_DEBUG
 		if (amdgpu_async_gfx_ring) {
 			r = gfx_v10_0_kiq_disable_kgq(adev);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
index dc7d2e71aa6f..9526b46582c8 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -126,7 +126,7 @@ int smu_cmn_send_smc_msg_with_param(struct smu_context *smu,
 	struct amdgpu_device *adev = smu->adev;
 	int ret = 0, index = 0;
 
-	if (smu->adev->in_pci_err_recovery)
+	if (smu->adev->no_hw_access)
 		return 0;
 
 	index = smu_cmn_to_asic_specific_index(smu,
-- 
2.25.1

