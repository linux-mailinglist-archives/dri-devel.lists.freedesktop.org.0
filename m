Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A2C350DB1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC2D6EC3A;
	Thu,  1 Apr 2021 04:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1976EC32;
 Thu,  1 Apr 2021 04:22:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF6D+lUJNhGWPtjowsf/xGnLsVpSmQox4N6U6AWnHy+p3lAsGviKnAVf5iKQefvWMeQxkWp6hjPKLoMo5yuIc1kP7/Rbek0xrvOCsPR1UWH6vaAgdf2jfK+c2sqfcYflxMfnuule7WznXjpxig6TV+qgqnJ7kQnekEpEYBNBdRPKYTpahDoeRyv2Qzx+Z99ZzV+b1omSHK8S9CpwgOknjZEG2CJmT/0st3OT5zW/Cysm98ShmvSG6DRa6U3MNK3g1KATEJclDuthpupLTnzZ8Uc0jOmX2otdoWoMRsjf8GLnxEXGaa0qkfuKhx23V6v2+QG6g0F7foa9QMuXkVGNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t70P4zptxPb6vI+N0ua7vL/SCF2QgJcPd3GUL0w0mak=;
 b=Py99J9xLtLqwd+0E/1q6kbTHC6BdQbekB+zk7VO+4NjBiyEtSsnnoCPV59FRWN7+wGz4iQSoNOs1j7g7qQLd3lrhxpLc00K/PZRmbj5aEwVRgcaf8x9bp/cA4wXSQWSJHDmYTUnCNo1nMa2pNsH9ZGB94a4y9laTpFmhGVOkQl546dyt+rqU7cigsMs4N6SM6aMnVsxeZWXQM3jYeCx6SmDSVxoNvK5rT+GsDRiu6bVxbwMiE8HTcbIvj7Ey6Lmeo1xBoyj57+nLb4z+FnON8nA9KHeTkdLp6mN/tdTy0EYljlLbQQXBLpp1M1NuMh1dNwwpFnWIFCqGkvES+Lf+Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t70P4zptxPb6vI+N0ua7vL/SCF2QgJcPd3GUL0w0mak=;
 b=VBYqDP71+nDlYDWHbsc+AoqE/EX0MSJsai1szqCwx2jOWt4j/qbPN4eAZ6+hSyj/IPQ7LgQE7Apm0LRwWTvlfUDFlTFz4nenmemTYE3hJ1iIUzP7znLrwEWbhilrVY4jufj6cgy1+IFeW8IO0hUWGE2txYIii8tzHdqr9QUjY54=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:54 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:54 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/34] drm/amdkfd: add ioctl to configure and query xnack
 retries
Date: Thu,  1 Apr 2021 00:22:07 -0400
Message-Id: <20210401042228.1423-14-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b81ec586-08cb-4835-91fb-08d8f4c5d1c1
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB491656B5630242E2FE9BD4B3927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gqnN9PIqoPdWrL65trdNjjfy6mZJe5IjT6ogt+5oE+NEoHdxj3eUfZDaa4Y7lbEEzyjMhYP2AP5mSLIm9TGY0/EZu3GSu47RsH9UbUxCVhO3H4CXsow43btXD/GO7Sv83glQhXS5PFbuSJXj+AhV+jS2iNWRp5meAfIJQrO2F9GDLS4Kug3xJA4l1z/f2SQlzH0/Qpc03KGH2UJwYfqIxAp4AiWr2+Gbio9vwhyrDZ89Eq0TqdBo6jAGFloY9IHlAVSEV4kMpqoIVLxNqRIXUdYP8RTD9cDXqpDwkH+YSLArK+HvU/hOIr/8Vm+pIh237oF4spp+6TbFy1g7U7X6g0BnxShsqbo+iGwGzkFmsGW957x8If0MVxDjtjLln2Pn2JNvbJgSuDn8yLWmqwACgdkXZtGuPVVBuJqKZ8D2MSbZcZGtpwm7r1ama5NUWEVNgxRJ6cth/OzKft+dYZlwAJqfZq7qAYdo6HbYFsR3NzXMQ0zxdalfoiDfQHllPmbHdiCN6452DAw/ajvCtTLH4GrJnDO4EGdXfWkc3G3aqKF8f4sBKnSSfCAYFTChKQy3mUdFM0bg/fSXtFDuPmc87rVevILjiPZo/EQ40efQRmCmtR7NqAmzN5P2tcD6WRpoUHxv7JjoJ1S1VG4IuY4mFB/aRRJXfWJ375aFk50BoIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HEwVOfH1gCuY1YxCSbQvrzmQOSERsoCzNNvtXowvbfBxdIezfDmGx0FVbnDd?=
 =?us-ascii?Q?Lg83ok9hyxfdjdPQReRQnzNPNEDfJWrjJhWry1yF3/uRIysO1uvzx7pWuWlL?=
 =?us-ascii?Q?B7o+dBGxSCVhBIFS75TrgS9Ni8Pia2X1tqqEK9u+lhYs6Hy5yM1CvctWsccL?=
 =?us-ascii?Q?QTBP0iXTeGimBkcYzwx66wjn/CQrmBwBtSSEaIb+wBTSRKtQ7pQIPnEBcp5w?=
 =?us-ascii?Q?7m3sp1OLFwDJGcTQcQ3uzp2NYsvQUOCZIyLcrXgYa5A5LAlYlksI3yrcBtOc?=
 =?us-ascii?Q?jK4VZoZh7/8kgmnT0+ogdPKEJhlkH+4x7O7CvqsfvJUav4fD3RFBT1bGshNH?=
 =?us-ascii?Q?lfd/l+UThrI1QmL99dbuY8FLN5Z/wuBhiu2llsgnVfP4gosMAXyQkudhdIyq?=
 =?us-ascii?Q?l9yQR6KZUL0OAH/1tUvZJXHFfa1pq5u3cZ5aSgQ+eoEozMmq9/2hAOCbQFYs?=
 =?us-ascii?Q?Ojw6sBq1z0je6sgmQ6QGs40wEHCDe+y4Zl8B6aBJbUjNjbA3Nf8Ymo9iXL7h?=
 =?us-ascii?Q?SjCbKu2Z8UY1/OS5A2wCkdnqm7AnW+ss0mkoJ7O8yyr3dhtozBu8QnI3OmrT?=
 =?us-ascii?Q?fEDC+ZGWJvTESenD9zGFBEbdlbDJOvY2mww/5Kolmkz2E/1DcZMxDEWxjjyr?=
 =?us-ascii?Q?xBoQLeRJ6G611ySnwZzy6dBU3P+29Nhg9fgd2Ci0d9GDEaxU5TRwU3BMlW4M?=
 =?us-ascii?Q?La4SzEdLR2+4ccfT7181YB0I/DMpxwRBO2gJZcN1xmxskeroe9N57GtBsJ8A?=
 =?us-ascii?Q?WLNU6c2OisJeSIWc7NEAdZ60GxK7pn+3k1R9oEhCsYcxlahq968t/ya8QDzY?=
 =?us-ascii?Q?ZHO+Taxts+IbwDWKtLBBgqQOx0liQY/vwX7D98mWK/NLt8etOyarVxB7eTOP?=
 =?us-ascii?Q?0SRfmsQQM0xsqNxGiaOzZumThIzLDvcs4o9o5hpFOz8uanIiaVzVs6znvQMZ?=
 =?us-ascii?Q?UjBMO/y+Uq84JAdU1Nl6tprBcswTgaC7c7kz/9YoHYONX3deX6SIKSAH8Op+?=
 =?us-ascii?Q?1ibOy7bywQB1FNtV2PHoY5odNSV4aAu78+oKp0zkgygZYhEoo+HEJwYVEUmz?=
 =?us-ascii?Q?ERFb/mfnHUXIIUF+VXAUgrBGtpWOgQ+CydDy32+wz6O2c6UpFI+5Os1GUfGu?=
 =?us-ascii?Q?alhhHC3Hd98BEcd+oElLQ2EtYNa8PJiWEOkmHGUSlPE7bun12e9A+VW+SdN0?=
 =?us-ascii?Q?TEUu6NdiwnLW7lRbixBAUMh/fbpckHp4JW6HnDsPleu+ZWKO9On38c1kWkPI?=
 =?us-ascii?Q?CFaB3PiJYVFY0djv3svrvkEap51nXBFU9whva78oNq+pQVqlU7/nkNhp468t?=
 =?us-ascii?Q?Ou/S9WoqiC+v4TVQJkTSs8hu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81ec586-08cb-4835-91fb-08d8f4c5d1c1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:54.1547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoVkgfCqlyUQfWFrYVOZTrSMkpiCDIn+zxX9WJV4sUbLUwGI6pwpNFNFMjjPUpLha+IloiSxz5NubkE+QQ70cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Xnack retries are used for page fault recovery. Some AMD chip
families support continuously retry while page table entries are invalid.
The driver must handle the page fault interrupt and fill in a valid entry
for the GPU to continue.

This ioctl allows to enable/disable XNACK retries per KFD process.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 28 +++++++++++++++
 include/uapi/linux/kfd_ioctl.h           | 43 +++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 9511826ac8ae..9838d0cd1f51 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1743,6 +1743,31 @@ static int kfd_ioctl_smi_events(struct file *filep,
 	return kfd_smi_event_open(dev, &args->anon_fd);
 }
 
+static int kfd_ioctl_set_xnack_mode(struct file *filep,
+				    struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_set_xnack_mode_args *args = data;
+	int r = 0;
+
+	mutex_lock(&p->mutex);
+	if (args->xnack_enabled >= 0) {
+		if (!list_empty(&p->pqm.queues)) {
+			pr_debug("Process has user queues running\n");
+			mutex_unlock(&p->mutex);
+			return -EBUSY;
+		}
+		if (args->xnack_enabled && !kfd_process_xnack_mode(p, true))
+			r = -EPERM;
+		else
+			p->xnack_enabled = args->xnack_enabled;
+	} else {
+		args->xnack_enabled = p->xnack_enabled;
+	}
+	mutex_unlock(&p->mutex);
+
+	return r;
+}
+
 static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_svm_args *args = data;
@@ -1869,6 +1894,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 			kfd_ioctl_smi_events, 0),
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SVM, kfd_ioctl_svm, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
+			kfd_ioctl_set_xnack_mode, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 247b57baa94f..3cb5b5dd9f77 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -597,6 +597,44 @@ struct kfd_ioctl_svm_args {
 	struct kfd_ioctl_svm_attribute attrs[0];
 };
 
+/**
+ * kfd_ioctl_set_xnack_mode_args - Arguments for set_xnack_mode
+ *
+ * @xnack_enabled:       [in/out] Whether to enable XNACK mode for this process
+ *
+ * @xnack_enabled indicates whether recoverable page faults should be
+ * enabled for the current process. 0 means disabled, positive means
+ * enabled, negative means leave unchanged. If enabled, virtual address
+ * translations on GFXv9 and later AMD GPUs can return XNACK and retry
+ * the access until a valid PTE is available. This is used to implement
+ * device page faults.
+ *
+ * On output, @xnack_enabled returns the (new) current mode (0 or
+ * positive). Therefore, a negative input value can be used to query
+ * the current mode without changing it.
+ *
+ * The XNACK mode fundamentally changes the way SVM managed memory works
+ * in the driver, with subtle effects on application performance and
+ * functionality.
+ *
+ * Enabling XNACK mode requires shader programs to be compiled
+ * differently. Furthermore, not all GPUs support changing the mode
+ * per-process. Therefore changing the mode is only allowed while no
+ * user mode queues exist in the process. This ensure that no shader
+ * code is running that may be compiled for the wrong mode. And GPUs
+ * that cannot change to the requested mode will prevent the XNACK
+ * mode from occurring. All GPUs used by the process must be in the
+ * same XNACK mode.
+ *
+ * GFXv8 or older GPUs do not support 48 bit virtual addresses or SVM.
+ * Therefore those GPUs are not considered for the XNACK mode switch.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+struct kfd_ioctl_set_xnack_mode_args {
+	__s32 xnack_enabled;
+};
+
 #define AMDKFD_IOCTL_BASE 'K'
 #define AMDKFD_IO(nr)			_IO(AMDKFD_IOCTL_BASE, nr)
 #define AMDKFD_IOR(nr, type)		_IOR(AMDKFD_IOCTL_BASE, nr, type)
@@ -699,7 +737,10 @@ struct kfd_ioctl_svm_args {
 
 #define AMDKFD_IOC_SVM	AMDKFD_IOWR(0x20, struct kfd_ioctl_svm_args)
 
+#define AMDKFD_IOC_SET_XNACK_MODE		\
+		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x21
+#define AMDKFD_COMMAND_END		0x22
 
 #endif
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
