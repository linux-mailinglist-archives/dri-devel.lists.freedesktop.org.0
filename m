Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAA19F19DD
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 00:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7924E10E286;
	Fri, 13 Dec 2024 23:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iTa87csb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA44010E286
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVwlBqZxVkGF/kapyVPcR97FkT7O+4Ln5xZOd28+mvvspQcdYdDe91rnc3J/Hr/g6lL34qcbHMWoEe484ZuZl/48XQ3Y49ECNo5cv6cyjwAxg/1LaRoj8mZFkXxobZVJjynP8CS+dZsSOXcQVTZB+g+fFatylnqD+0JbdsZxxe33ptc+GrvlcKH3J96H//gQznSDrqSyvzomJKu1do5tuGks9RYBBOm7xtsP7hI4x7NoGz/4Y1WEQcIGrSq+yjRmbPO21F6CFJ+iHgCzQH0hrlXYC69hoPmAD5HKSGTj410998Gwp1TKTwFkP2nI35O/2XGAsO7ay8qG+e0/W9QSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qncUh3m1cfeS0NybWQ2PaJ6Qs/6fTjwdWmA9+qNZVxA=;
 b=BOoo8JCUsRw7xFvSgY1xRycn/YLBGwZDxDt8a74gUTxIWxnkZTWlrzoIfzC094RWnHorChofYZP3ULaWYFL1lVg9gpdwOpl2JHEXz4dPhN7J7o301arob28/9ZPbaelYYl1Y2UAAEi894A9dNCGJoqzIHGyKOV/szjtlRfa7AMUfHY2ijwqPAbnVqJBNtRSWF1j9aLCdkVrvRDV1wXUSueuoiYEW5gmHHbfPcvVeg0OOh3R1g1CpQx7TMoOlITxPJf8xU7QQN93/Mtx7Mp5WvS+SC6AFxX8hVJZgEapVq/+44Ik8n1knGoO3nhMLfUovpNgH/nMwe9OzYNTV+NI03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qncUh3m1cfeS0NybWQ2PaJ6Qs/6fTjwdWmA9+qNZVxA=;
 b=iTa87csbvlQdBS5mzNF5I1lifx/jvSd00YuRS7dcxOsKT+LdwaRMwJ+OlCHqGA/PdI33eIYC8NEuFRl3mAEx0hPfi8dhOthQqkDWdjT0KDjYeY6V7CkSL7eloJNrXFE+B80c60rKnz9Ic3BQjO5CxmL2I20AjmSa9yijl/4By9Che/0QpscfJn1ZbYCI6gUWLfnTSuZbZG0ySofr0BZLCqNOjyomwuVe2Y6wESu308PMJKE9QGh16eDtxqH+uHR3dyRdsd2JyhFFOpC8H1Y5rvDb8nomljKQK5n9oF9JRH8WBS9dQlXWzyei/BRlaAIvBqqRD5d2yXWydNZfIwAikA==
Received: from SA0PR11CA0007.namprd11.prod.outlook.com (2603:10b6:806:d3::12)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 23:29:38 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:d3:cafe::39) by SA0PR11CA0007.outlook.office365.com
 (2603:10b6:806:d3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 23:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 23:29:37 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 13 Dec
 2024 15:29:34 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 13 Dec 2024 15:29:34 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 13 Dec 2024 15:29:33 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <krzk@kernel.org>
CC: <airlied@gmail.com>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, 
 <dri-devel@lists.freedesktop.org>, <johnliu@nvidia.com>,
 <jonathanh@nvidia.com>, <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
 <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <luca.ceresoli@bootlin.com>, <maarten.lankhorst@linux.intel.com>,
 <mperttunen@nvidia.com>, <mripard@kernel.org>, <robh@kernel.org>,
 <simona@ffwll.ch>, <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
 <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/5] dt-bindings: display: tegra: Add actmon information
Date: Fri, 13 Dec 2024 15:29:33 -0800
Message-ID: <20241213232933.4661-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <34kg2aoaeem3bjqh6vli43hc63tvfx7uumkmkre3wkvek2neyu@jhj5n3om7vzd>
References: <34kg2aoaeem3bjqh6vli43hc63tvfx7uumkmkre3wkvek2neyu@jhj5n3om7vzd>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fdd84b9-1777-4423-b1e3-08dd1bce02bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u7mMKDnBvEpOQkMmmf905xEFgmJtG3w87yiEJFbAvvN+ICjxG4AW7vMpnHL7?=
 =?us-ascii?Q?AUpobxsKLgXgv09qGsnFMfEx+eOa0hXCXRclaCX379fwzQi0tvDFwQNye4hH?=
 =?us-ascii?Q?4BNmJz+aGUd9CbBlM/GOY6fbdk9GzqhY7Uq40ioPdefi+jt6r5hLpEFclw4B?=
 =?us-ascii?Q?iVQhJZbs/JoitWwb+/vSquyGlQ20AuNXKzvp5rXhay9zh+xS+Zmf5KPvuON/?=
 =?us-ascii?Q?K1N2RuTIJ/PK4ZPUq2e2+CwsI8snTIMoywBTZTxCiBqHBZiIDKseZ4dDLKZd?=
 =?us-ascii?Q?pZ/pOon8i3UEVrCNw59mNln/l9yVeKdtSAtLRTZcIAfJ+76g9JaPvYMBlLaJ?=
 =?us-ascii?Q?TAt8DXgErUSmN1eYG1wfNfIFhiK3ZGLYomh+IKkcVRNiJvfG0I2GxEr/GuAe?=
 =?us-ascii?Q?0zg8visSiwKeYAvSxgCX81vsYdFWejxTJAX88XMTSe2EVMCVtxferPJxwZJN?=
 =?us-ascii?Q?cdhTrgUe0l4xK4DpukKfSuQiARfTum9lcA0uU6Sd+xel6iv5G2vDLbZi4CSG?=
 =?us-ascii?Q?A/NnTRJDQz/ete7c4/Uywsho4RJ5DuSKbMHgmOTsU64zhs8Micyo+SR37JQ1?=
 =?us-ascii?Q?/e0p/O26ClMWv7srL+x0hZPImJi2Lh4Qqgsxw6KEAqTyHhyLSZnYkDYKLax6?=
 =?us-ascii?Q?RXuEK3FZ2B0yVmAN93kkIY7t3TymolnrMe7BKEUYezP9NZk9QiTF7vEPy8bL?=
 =?us-ascii?Q?rtVFuxPRPS41Ih74GeQrpSGT55w3I8yXJ+ySdBuQ1B5eAaTzEvXvII9gqdGn?=
 =?us-ascii?Q?egEt2jMO8yex1LX8rHQ7rSd9R1CIs/WQsYRIWrjPwytBIlE9onGHY+lwmAWA?=
 =?us-ascii?Q?DZHe5f17ELeDh9BFTH4yhz4W+71I3aFO6DPoP3AEPxSPDUSOjsFRZQicS0bb?=
 =?us-ascii?Q?PhXJur2su8dsCFUi2ewYVgIiF3XYS1l6XCZPltwUlyeLrgXi0Z0ZE6VHBHJ2?=
 =?us-ascii?Q?fdVXIvpx6JqYwRvQEZZtUMX1VaE1Rv+85cPNBVapzP3bWKzZB8j+XBoGU02U?=
 =?us-ascii?Q?vZElQV/zi7IfDLpta+wzZ1QyhdTyE6mDaDxo0E15GgrCC2KjRf6vVNurZgga?=
 =?us-ascii?Q?VHffVpphPUi/gJe385q7Mw5/kZtxaqbandP8mS04b5p1R3boIPuQNXSU9C4M?=
 =?us-ascii?Q?vUGMAgEa1bPZxuaQq88Tk8DKdypFepNfb3MG8H+6byA8F2oMC+uHNxsuLGJS?=
 =?us-ascii?Q?6ccrQDqi0jcBlTWLpa1kQdu6F9n9AVX9AhQhrDX1tJ3wVI7iXAW4ZgC1DA36?=
 =?us-ascii?Q?0nAPqHAodpV1/YDWqRcQ9bXH3CjO3Wsum9t4QPjhu/MxrzorSS61T6v1Tdny?=
 =?us-ascii?Q?pLxWorsW4VWTzCIqgeE3GB3HqoirfyJIH5HQ5xQ0NjNc+702NAYDIRqn85lH?=
 =?us-ascii?Q?ZfD4c1bwIVpv0INW6HmSZQCjRHezIuj6an9nyiJqtJ1h+0+Fle+yJ2ID29C+?=
 =?us-ascii?Q?9gZceC3ehGax9YUaWyb4ZmZcURzvovJpxVR5xoYgt1dY3/+wlNT+AfrJBSnF?=
 =?us-ascii?Q?1hW3BdY4ooCqwNc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 23:29:37.8271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdd84b9-1777-4423-b1e3-08dd1bce02bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
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

> On Tue, Dec 10, 2024 at 09:45:50AM -0800, Johnny Liu wrote:
> > An activity monitor (actmon) is used to measure the device runtime
> > utilization to help drive software power management policies.
> >
> > Extend the reg space to include actmon aperture for actmon configuration
> > through host1x.
>
> We kind of see that from the diff. Say what we do not see, e.g. ABI
> impact or why this is flexible/optional for existing devices.

Since actmon is not well-supported for the previous chips (e.g. T210,
T186, T194, and etc) in this patch series, it's essential to make the
specification of regs property optional for the previous chips.

Enablement/Disablement of actmon won't affect the host1x main functionality.
Its main job is to monitor the engines behind the host1x and serve for
telemetry purpose.

I could update the commit message to include the above reason. Please
let me know if more information is required.


Thanks,
Johnny
