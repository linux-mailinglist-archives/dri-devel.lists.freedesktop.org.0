Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0AD09536
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 13:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7125110E8B7;
	Fri,  9 Jan 2026 12:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="GtrA5tap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazhn15011022.outbound.protection.outlook.com
 [52.102.140.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A048210E8AE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 12:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naAQN3OT3EwnCtXVpqwCxjLIzg8XqA/0GMCk0PMduLz/6P9NJ1rQmuNAuJQ1EKzbnRddIOtK6X2E/xgAjQFxIGsyzFTypMZIlaQgaFzRnzMqbcnsX9qp26BgOmGXW84cLh5zXJ+HgpnHPk1iWRuvBmEIILuI3TiYVTHXCd2VrBOdZpOV0r0228Bw/THla93MkP5jVRLLCq0DgSe+6e7AFptBXEcgZzUGTvhE6UUPzILwAsocHfNs1A+RG/tPO79c+Jw0IkIB9cJHb5nloioz470oWzFA/Fn02aaGrPFhATLSW8UKljRK1IHErZV3PE7Fo8FXcQKrrwmwAEf61Qo3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlazV3jkldcqCKVWeOFDXXNZsPwfPG4WktzQ8gdsRtY=;
 b=XBUafXkBkcIzubJXqsGMbHxaN8bDDntRlLqrgO8OtHxNcy74FTnnvFgzMrD6g8Mz65yjmQJl3YqIop5eFWtHFmc895l+AC9TdhvBK/ncGxLSwX3mN439b8ByB3AcgELjGEkQDqkkvdj0LYUNZxSoiDSw9KwOdtJBiUOpy6XwR6Xkt6YbrQGGMn8KSaHplx7Pmug66fcMvso/ikjLzuHXUxPjqu3uk/rTBI3dgJyIMOpJuAz8y3oc8kSXe4eRiHyVoXiIA6zR8NDyRFEH2PzDvM7IFsV95t1L9MtdXbP1n50fiJoej9YeFvLAIZH5rNvp8V7ZvY4zSBDfS/Q8V2qvMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlazV3jkldcqCKVWeOFDXXNZsPwfPG4WktzQ8gdsRtY=;
 b=GtrA5tapg6ePFPeyBo6/C1PWv3HcX8NnSExqIwy9w4rgtWgiDw7WgOHq0QNNM5FeVDEjDisbxjPfH6qOdQZloPK13mVOxMuRwfIMEmT6inVXAVFcKAT/mk1gjNhiINJazDGRvVljO+qB40Ry12UR901GfGczBbxmFQZ6Y3aw2a0=
Received: from BYAPR06CA0008.namprd06.prod.outlook.com (2603:10b6:a03:d4::21)
 by MW4PR10MB6345.namprd10.prod.outlook.com (2603:10b6:303:1ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 12:10:50 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::30) by BYAPR06CA0008.outlook.office365.com
 (2603:10b6:a03:d4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 12:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 12:10:49 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 06:10:48 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 06:10:48 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 06:10:48 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609CAmDj4109522;
 Fri, 9 Jan 2026 06:10:48 -0600
Date: Fri, 9 Jan 2026 06:10:48 -0600
From: Nishanth Menon <nm@ti.com>
To: Michael Walle <mwalle@kernel.org>, Matt Coster <matt.coster@imgtec.com>
CC: Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Andrew Davis
 <afd@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Randolph Sapp <rs@ti.com>,
 <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpu: img: Add AM62P SoC specific
 compatible
Message-ID: <20260109121048.5usyjvczyjh2gs3q@craftsman>
References: <20251223124729.2482877-1-mwalle@kernel.org>
 <20251223124729.2482877-2-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251223124729.2482877-2-mwalle@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|MW4PR10MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: a3090c4e-62c0-4c5f-833d-08de4f782094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|34020700016|82310400026|1800799024|36860700013|376014|7416014|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iIhLcmMWYexEyqcmOKc4JG2DLIPVZb2QqQ88iGNEV5iBquCFA4u1zwcON8vQ?=
 =?us-ascii?Q?b18WA8s+ztw5x51qAFoiAK6l833vYCZIWCDnqMOxsldIkpR/tnknNGTODcq/?=
 =?us-ascii?Q?l0KSidU24JreMbFYQbjVvRnSXEoXv2qHUiFRpJPZpUETDMfWS4YPcf471d32?=
 =?us-ascii?Q?u4JqhOOgPfqVR6wh9CVINVg2YyfcHSsuaa4mimLb64quVphXyBhgqR9qU0D9?=
 =?us-ascii?Q?IOr8Qv5mUN+P3wAmlECy1s59JChN7IJm01xGQHndeH8tRg9OJ7vU6k7KqXoZ?=
 =?us-ascii?Q?mNwGOXFWQDzQeoj4JJnVzt+/lguJjEVM2liF/ndpO9P/Ohkz960YGCJAoJbE?=
 =?us-ascii?Q?6bpomGzAj55UYrboFFMyhv7vgZtDmXn5FU6C4RV1jlD1LIxlDsuj7E1HXVIY?=
 =?us-ascii?Q?A5xBULUJenxsWKJdCKDswcthsLPFIRZlkh8Lf64aGH2SrkRQTd2KlWeJT8wL?=
 =?us-ascii?Q?lrTAMzwLyBPQtFJtuBNAZyG/aeH+L/ADQ+AVWF4ELeoJDBSxN7LcuFEtLM7m?=
 =?us-ascii?Q?hSQqjH/hLeXdD99gA88bEVsvRRC53jHZp9z06sYxZ26Dnh4+XUr+0vmobwxv?=
 =?us-ascii?Q?MZK6sh2nZEes9eTjX3uqWvvLoMR95cvAkGIUUVR7W4XmbY7XmzPf2XxjQlL9?=
 =?us-ascii?Q?YSQY+w5tx1CLa0H8Q4Z8V0lawwCAi7ZltSHN5m622AA+5ODgBLlemZ1uhz9b?=
 =?us-ascii?Q?xHqgGc4/MUDKeWCQTWEmudh1jooBHvERkZ1b7La2dMtOixwHSi9HNP7Pw50A?=
 =?us-ascii?Q?bOxzeioEMO4TgUnuzjuFNBwUfYCpMuDxEQ27pwTfZowjqpt7kyttVHeW/W41?=
 =?us-ascii?Q?fNla0bf5lbHzJNBncNnnEgEgAc9HvD9jEfE3+gaX7TUa8JkEZWHHpTp2jowE?=
 =?us-ascii?Q?ucqcOBvfkUZ99LSBkT5i3OAGGRcqDM095c62UwkAHKhU4RofMLsA2YKVkBgA?=
 =?us-ascii?Q?edfZzViF26MvWP7196Vs8xwCU2MW63egSA0K98p/qhbn/4DpkNdr6tQHvG+d?=
 =?us-ascii?Q?cb9KJH/fl/q601ARjyPmNRy3dh7g4bnBdGM+gRSMPR9H5S9wLrg6h+RKCgQP?=
 =?us-ascii?Q?wcga407kAsZ2UcWJke7zcon+XIb0zG0qbddqlNGIJF5eVJ/UAlkA3ywBsch9?=
 =?us-ascii?Q?QZsjAQ5H+kPAJCzs3mLZRbhMPS9OcEDf4TWhYV/OOz5qr408FcRKgp7HQI2d?=
 =?us-ascii?Q?8BxNd3p9e8435XLrepn2boiFIYQ3DQmQY9NYJ26urbe9GQCdF5RXYQ4bDXWC?=
 =?us-ascii?Q?Ctc8GZDewoQg+bSn1ASLKRUOs/y5AITRRP8i+h34RQ+1wa1m6g+2qUdkN0VO?=
 =?us-ascii?Q?oYFDqZOYdynCg7ZBL+E904/1zp4i/VpOHMJ72SRgKr+QmwhufkqPndT2oIf6?=
 =?us-ascii?Q?n0J6fVWrMjCFu0vBBZn6lvLgH0nUDapfIXypy7CT4DylL2GKh9+CEzK1gPBj?=
 =?us-ascii?Q?MAQDdODTUtV6P/pMLaTlezlf/4wMo4729j+1vOnzQjxxjJFIrk49mc9yHUzb?=
 =?us-ascii?Q?pQL9BJwujnI8R5u/KSUjSQKGmx/y/2C+Bo0NbV/+fjI+pG4rPYngjffoakvs?=
 =?us-ascii?Q?GlULMXJAnQinmSggFwk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(34020700016)(82310400026)(1800799024)(36860700013)(376014)(7416014)(7053199007)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:10:49.3081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3090c4e-62c0-4c5f-833d-08de4f782094
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6345
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

On 13:47-20251223, Michael Walle wrote:
> The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add a
> new SoC specific compatible.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 86ef68985317..a1f54dbae3f3 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -40,6 +40,7 @@ properties:
>            - const: img,img-rogue
>        - items:
>            - enum:
> +              - ti,am62p-gpu
>                - ti,j721s2-gpu
>            - const: img,img-bxs-4-64
>            - const: img,img-rogue
> @@ -100,6 +101,7 @@ allOf:
>            contains:
>              enum:
>                - ti,am62-gpu
> +              - ti,am62p-gpu
>                - ti,j721s2-gpu
>      then:
>        properties:
> -- 
> 2.47.3
> 
> 
Matt/ DRM maintainers, could you pick this patch please?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
