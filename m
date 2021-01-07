Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAE2ED606
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6333E6E48C;
	Thu,  7 Jan 2021 17:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68F6E4B6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nd4PU4QGVndNbfJZv01/Mpfr9Qg+Ae5lyYuANuw00aNqoVxhscFU+eSHq75Qu1eRO5WQBXvfGLA4Ni7GQNBUEZmnw7ihRgK5WRq4N5PXwLavLK+LzHOPZR3YjnugYnzWC5KwoJr+vkhbFvOyVobF1Jrdbs3Q2H0F86Odmq6DOunvk3YOxGVMBBR2wfLtpHPkZYToFppYg8lgJfe6au9DqXEKWXqO8ukU7ZW6gqEa9qydhjsaqoqAbiN7GTOEmsPn507BqY1H6RPJCL+Qtdy/MAuZQATT5HGj8XsTb3KBZZGW6aHhJhD2d/3ns4qOjflGVyes3VUHAMMu66x5cZkxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/1G0B1l+fxaKiI5DDkuCkUDT7DWrbJ06MepZ5MCo5E=;
 b=YQLvgHm/4BhlDZxsQABWY3OTjPXvHs8Jh63facl2EJTwa6TWTSn5giQvaJGE6mzDXZAd0p0mQH7LkIHN1WfBRoIaJeCMpUfseNhNtFy+2OHwZiwT96O65Gky0Hiek4g7vyA3OEHMNtoKHcVHl+8g4wuxvxjTRYlyy1qPq5aDnPIRnlP1qXQC2ao2Z+FO3BKOlIzg1t8PiAe4cXirtXEulEjIIlxABJXl61dwRD/q8+s5lwg+tHuIj4f3yH+NOpPbV/awFZSJIYr34HlV/FOBjjDVKf03JnZ7sEoJe13f+DR1E2THNrzWoGnrNeywrJpKyS1NKfoQO+GnG5Ra7g/Qfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/1G0B1l+fxaKiI5DDkuCkUDT7DWrbJ06MepZ5MCo5E=;
 b=G/daZmDZj59Nm65aPnUXdi1dLMRgoxa0azDvk3gfNdyVqa7JO5nEhv760tYCpRfh2OOmsmfFfMvhvOJ5emgZ6OVfKsVBCMJgnwnZpYphhKnZl/Exw4IYcnoUFq1sAzANwmkEf0MYkv+MVMYwG9mxtLmUlsekIq7cfrnpaKTUtGs=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM6PR12MB3066.namprd12.prod.outlook.com (2603:10b6:5:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 17:50:48 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b%5]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 17:50:48 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: bhelgaas@google.com
Subject: [PATCH 1/4] PCI: Export pci_rebar_get_possible_sizes()
Date: Thu,  7 Jan 2021 18:50:14 +0100
Message-Id: <20210107175017.15893-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107175017.15893-1-nirmoy.das@amd.com>
References: <20210107175017.15893-1-nirmoy.das@amd.com>
X-Originating-IP: [217.86.111.165]
X-ClientProxiedBy: AM0PR03CA0093.eurprd03.prod.outlook.com
 (2603:10a6:208:69::34) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.111.165) by
 AM0PR03CA0093.eurprd03.prod.outlook.com (2603:10a6:208:69::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 17:50:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd92a075-55a5-47ea-20dd-08d8b334c414
X-MS-TrafficTypeDiagnostic: DM6PR12MB3066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3066DB73F55B7241F8F1BB6F8BAF0@DM6PR12MB3066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cEIIQpZvXoJI3V98iaHi26xedGg28HFw6eliifHO7epE2OAY+VKKHb1noqX0vFexhJTd/FvGsOx7s6hU1svNVivNXafxtKywYVh10TpBbB7nq1EEOSwKljlWvT9N0tiT2U4SDuqdt9Ovq66amj3XKOWL6BATAZRTH0LKxM9d6tESnruSlKnxpE03AHsrCrHqlNq7g//3kKLcRwVdQlkzLDJJd8+Dp/S6kUajgSGUZxS6zoQQzlA1TQtg2hqGhElCTdkVFsDl7NUkH+9oubq2hi8oH7WkWBBUsb3YXdGffeJA+rk7mw31Yo1emwTYLif9HVaggjHFK4PkpuIRYg3bHJ3FP3WZH8/3vUDag9Y8da6bW6R080575+p+IQDjHj/5Fo8x/n1umNC0gWtOUS4p0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(4326008)(6916009)(316002)(1076003)(83380400001)(478600001)(6486002)(36756003)(26005)(66476007)(66556008)(5660300002)(8936002)(66946007)(2616005)(16526019)(44832011)(2906002)(52116002)(6506007)(8676002)(86362001)(6666004)(956004)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gh1KzXsgT2H1KUAIKwHC7ysH+FKmWzJYDM096E8r2jVFbSb1LWEWCuGk4BPZ?=
 =?us-ascii?Q?25xoQwy3puB9ozI/mVTOmo4ub/6lYuuu720tgsOsZ7/mURm0qD8ojAtjCu9x?=
 =?us-ascii?Q?iXypcSwlbwAg+zQXcUBb74dCVDG+WMbq9zkfGUEEB2Bv9HwGM5gw7MO+0ekO?=
 =?us-ascii?Q?iY2ErT0UPkkCIdGaxSoUw8yCI8JzchiekDg88QMZCT7JKQUuMd7RkWtQaTd/?=
 =?us-ascii?Q?oA3xhK1ZnvrOFM2vYRiqek386d8lhF/s8gZuhvr9/t57NVLP4/jE2lSInzpL?=
 =?us-ascii?Q?GV2VN0FzRisL6Hy+gthpq9KqM/yQ1u7JVVv0N8woJkClEl3MLQ3xF41W6I24?=
 =?us-ascii?Q?+iXOLqlwZZgge0tNelBsoHjzlxd19vEhEHS+3GXt5qmLQPp8gWbHu77ymC7j?=
 =?us-ascii?Q?ueggaOmshjROgCxlUENxeuHvGb9RfwB2QmlI0NX0jAYVw/adsFs10KAz0au4?=
 =?us-ascii?Q?ELUJYTTOXLtM8wz4C1eZxUXOxZ488bM5x8tpEwKD7ET5ylpkEH0iDpfdSOZJ?=
 =?us-ascii?Q?JMYOKZJXDhdLN8Jd4HZtwmSgiJdj+IIFfa1IFn+ipWyJM5boimJvx5mBQIJg?=
 =?us-ascii?Q?iIeHz6Gzf/F28n16U7T9ZqdnG8C+AGyE5FPxRFZLiO+vToEYYnHVmkhfh25N?=
 =?us-ascii?Q?lzgB+P4ZfScQOpfMGj9/P9OtQNzQT8wfU10e6O8UZHsL76JuT9AP5rvY+bbA?=
 =?us-ascii?Q?gxGhL96cz0igohA0ZtsUmkpQYRzW52fOMUov2eCsg5fMj4ol8adeeBzzVKY7?=
 =?us-ascii?Q?xREz5yW2pDHU0B3UnPLOU+xtXMxGa/pfAkxaNL3DuRUkkyLiSuyQDjahumio?=
 =?us-ascii?Q?Blcug3/FVAAdmGt6a06+j21KCibOAeaL2SoEigZnh9bEhHhMalpQZ9Dei/IE?=
 =?us-ascii?Q?93TNM81O4JfvVj/GSLNxdUihm9WYdy/KudDc+ZPSvDZ+3KGgneQbcg+qwtyQ?=
 =?us-ascii?Q?7Xac9WQKRMz7tEMT7qP8S9afnDmM4LfeJRuWxINdv801wDZTuu69JMEp0k0q?=
 =?us-ascii?Q?bmix?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 17:50:48.1230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: bd92a075-55a5-47ea-20dd-08d8b334c414
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5V0uovua8qgxEk068eHfmk4UW/lztFTHFdM+Zly+6JzBSmK61lys7BL6S7wo5rtNjpOZdhbcubeQbmwGzxItTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3066
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
Cc: devspam@moreofthesa.me.uk, ckoenig.leichtzumerken@gmail.com,
 Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Darren Salt <devspam@moreofthesa.me.uk>

Export pci_rebar_get_possible_sizes() for use by modular drivers.

Signed-off-by: Darren Salt <devspam@moreofthesa.me.uk>
Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/pci/pci.c   | 1 +
 drivers/pci/pci.h   | 1 -
 include/linux/pci.h | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e578d34095e9..ef80ed451415 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3579,6 +3579,7 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
 	pci_read_config_dword(pdev, pos + PCI_REBAR_CAP, &cap);
 	return (cap & PCI_REBAR_CAP_SIZES) >> 4;
 }
+EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
 
 /**
  * pci_rebar_get_current_size - get the current size of a BAR
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index f86cae9aa1f4..640ae7d74fc3 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -608,7 +608,6 @@ int acpi_get_rc_resources(struct device *dev, const char *hid, u16 segment,
 			  struct resource *res);
 #endif
 
-u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 int pci_rebar_get_current_size(struct pci_dev *pdev, int bar);
 int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size);
 static inline u64 pci_rebar_size_to_bytes(int size)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 22207a79762c..9999040cfad9 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1226,6 +1226,7 @@ void pci_update_resource(struct pci_dev *dev, int resno);
 int __must_check pci_assign_resource(struct pci_dev *dev, int i);
 int __must_check pci_reassign_resource(struct pci_dev *dev, int i, resource_size_t add_size, resource_size_t align);
 void pci_release_resource(struct pci_dev *dev, int resno);
+u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
 bool pci_device_is_present(struct pci_dev *pdev);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
