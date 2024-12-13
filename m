Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4699F19C5
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 00:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB9410E277;
	Fri, 13 Dec 2024 23:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O4A1457o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0220810E277
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJ0Gaqes9KR+sioEN2AWlBdaPYMFKAQO8Egg1/8JaNvTWCn8dm5ngeQ3LCayLj6HFU4JMJ1klu6KJTUkngISI+E+0puCpiHxWUZLEku4irqdVuHbuKp3dEs6esM6XUSSZXDk39076VeEzp6d4ylJrTsnbWauMjKiX45SmyEh0V5Gtp8kqBsJXSxU40PkqxViTzqzAPqd+ETBDhS1bp8IYuGqDs7OVSA2Bj+yRbCiKbLbsWC2ttkH6Q/O7Vv1tXkFpBmQ8hpFUBnfwA2h7cTJN/vM5yawGj4VI4nf66Ghorfym9us+0Qfv5QY1cH+1zP88wi734SXO79EbxozFJOC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4v0NZTXm4pp8l2lX12m0eRxPzt0eiKljNKau54aoRs=;
 b=v/9YDl4+WEjERiiFd7s1Mxmr6GKwIGQ614DDdzgnD3VeHDeH4nYtGqNB0uuKu39QMqagodCmTwkM9RxYLKBsUWORRs2iMXd50pgTwvtbG/1/xBE7GPN10I9Mu7lACAyTgKyVbA3oxN1dU2w/lWSRHn+fp9L4fsxcltSRlh9bqPBTJs9xgR/L6jSIxAGGu3m6pqjkmGcwK4wQ655EUNm9ftO8266B1Gv5Vp0LmaX5+48CbbR3wcIUU/Jee6blszhFpsZqg9q44XKdlQnIh9acMD8q9QNaGq7whOEWhBtvaiIrEbS65KzfhTo0oCqeiM0jg1CjxEFYLbimHiUUwVR+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4v0NZTXm4pp8l2lX12m0eRxPzt0eiKljNKau54aoRs=;
 b=O4A1457o/Y7AdBcu347Ua2l+K0nsICYjOBBhJwsHdrvkg9ROhwUmMH7kVn+h5Ttdh6UHuNzQMQfeNlLRaVFStlD4g2scz6/fXqO9TsPgYeV/QMmsSSGGKV39l4f9Xx4moeMwZGWXohREEDKignAX7OCRmmhE6ZsKVVhqeX13fJlm4HurQnDKEMh0lYBYrt96NFH1OewmQQD85e9HsH3I+nbuPpsZB3XlM7mVjjt5iZQjb+Mxtjak9xdMOEewDVJ3bHDbIJN8GgGNxz5L0DZfcXY5AaXg4hnAv6hQLSE2ZMl/wmwSR6qchgVdXkReDUxYDdc2ZMAW70xBOzCrp5i+Cg==
Received: from MN2PR19CA0024.namprd19.prod.outlook.com (2603:10b6:208:178::37)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:223::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 13 Dec
 2024 23:17:28 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::ef) by MN2PR19CA0024.outlook.office365.com
 (2603:10b6:208:178::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Fri,
 13 Dec 2024 23:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 23:17:28 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 13 Dec
 2024 15:17:27 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 13 Dec 2024 15:17:27 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 13 Dec 2024 15:17:26 -0800
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
Subject: Re: [PATCH v1 0/5] Support host1x actmon
Date: Fri, 13 Dec 2024 15:17:26 -0800
Message-ID: <20241213231726.2568-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <jgqdgq6mifzex3tonl4sxbehwmcjo4jksfqmh7l4z5e2v4dqsj@uouomf3gyj7v>
References: <jgqdgq6mifzex3tonl4sxbehwmcjo4jksfqmh7l4z5e2v4dqsj@uouomf3gyj7v>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb4a812-01d1-4863-eecc-08dd1bcc4fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zudUWE3inrDED7qNVAPmJ8Tai9zUfwHINDxGm+jxlHtNi4MORQl9Bx4db0hA?=
 =?us-ascii?Q?PIl39yGBGy1knpnfBw/HhoXZVqn2/EuXJG3EzTuIXzVKjgGjU/4PnPumid4F?=
 =?us-ascii?Q?9h5C+LL35K6TbWGKrufdJy+cV0lEUcVwJJcxE7q3rj5DlkR6VUtGOhRWMJUF?=
 =?us-ascii?Q?odNPRJHsqQW5YOi4kAi6CfJZawopq2cuSFbGmhGYhqi/RbBf6QW5PT/8iLNj?=
 =?us-ascii?Q?BvKJubppetyTn5MXV9Mj8y9/cwmUtWGtX7iJmbNk98rYI3ME3xHWoJ5difd+?=
 =?us-ascii?Q?TKgocCDWPxP3/r39n+8j0qIs0XCJItHAHGZluqFFg4LX3yII/XBGlHUVeMHD?=
 =?us-ascii?Q?0zJfHeQwlMmzKqdk8Xx6mLZOGZoGPKvDbX6HGGrGim+yHy226N07iSuWPcan?=
 =?us-ascii?Q?DlYYEmKP79QrC8xXhBkNwo2yCX67IMpAkiaZwtB217tA5ru2iVMJJN6LdIoM?=
 =?us-ascii?Q?FIpHKnFhRXAsZ+NkHJKEooUbmDuvOudGJu8OrRKYdMRr0U0pJv1eTRM5fR4P?=
 =?us-ascii?Q?Gf3XgXhdmxhJH9/fLsQziC2hR9lGyIuHk2a1wFDD9AFN7G4qQaQwisW0zr/A?=
 =?us-ascii?Q?l2o4idCC7//p/QYbrkL18GBNNyqBsO5nOsYJjPaI4UWC24KCJPXi5EniLGiY?=
 =?us-ascii?Q?lKA1p99ox7ZkbC09IrmSx6TZzjhCPYBoXJa7RGzJ+6M8nZM0Xz1xvzu/j41v?=
 =?us-ascii?Q?yJ8tcS9djfA4u6Z60+fiSQTKUzD+umUjsfaJ7QwOH8uFyJcmBZsPxmRkbmNK?=
 =?us-ascii?Q?yB0J10aWX2cOcSuU954bNe1Ly+JDqx60gmC4IDT9iT4vJZcNDSQUrUbsLbUl?=
 =?us-ascii?Q?25GS2Fk1lw+XoBVL88ilzXlrvHox7g7XwNyWKA9QxR0kjh4xXbqmGf928OQg?=
 =?us-ascii?Q?Sq0OIxjEQtm2L0k4yYw1sVHhLpBRncX3WucmeqZbOb8Fd4NhuieHHUqShZUB?=
 =?us-ascii?Q?V5qujHZo+JrwJNRyauA6JgZ3E5dIKaEFL7mbIbnjO6iWqOqiV0oB6Qbb7igT?=
 =?us-ascii?Q?xDbaZal8lRexWC/BCvxqpYj+GlAodBqtFWveBpqZuLC79MJQc4fvy3fH7XDw?=
 =?us-ascii?Q?j1R3hp4XHObPwNNFfjdgubUOWtjNrCJVOOuyGhNpGzmTmvnGQ1TPKMt366wF?=
 =?us-ascii?Q?AB62hreouL7I7kVNZr170+RTB+F5wpMbzLQYF8wdYIL8PAell2ZZ/F5scMv8?=
 =?us-ascii?Q?5plTbLn7fy6nDCK0MkWj9I4mmCuJ/+9EdFn9pjrE4zS1fzq6T7L31io4kOMX?=
 =?us-ascii?Q?sMoS7CFL8WqtV9kZSjgA6SFWVckk0gIJFo7flu3lO+aTnktKkgZIFuaSd47A?=
 =?us-ascii?Q?jCtL7/DIKAfl7C/onyhphLZ7rfns9DX2fDeoYQVykmemKT5ySON9MZF16TyV?=
 =?us-ascii?Q?OLDl5UswYam1983gelpFMTpo9ok+m0P4wz3M7moVFLfl9n1glM6sa1hzvD5G?=
 =?us-ascii?Q?1w1AByGjXC2C2yKj0NBcJsetmZxawlJH?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 23:17:28.1040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb4a812-01d1-4863-eecc-08dd1bcc4fd1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381
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

> On Tue, Dec 10, 2024 at 09:45:49AM -0800, Johnny Liu wrote:
> > Activity monitoring (actmon for short) is a means to dynamically
> > measure the utilization of units in the system to help drive software
> > power management policies.
> >
>
> Is this a resend or v2? Please always mark your patches appropriately -
> see submitting patches document.
>
> b4 diff '20241210174554.18869-1-johnliu@nvidia.com'
> Grabbing thread from lore.kernel.org/all/20241210174554.18869-1-johnliu@nvidia.com/t.mbox.gz
> ---
> Analyzing 6 messages in the thread
> Could not find lower series to compare against.
>
> But I am sure I saw it somewhere...
>
> Or just use b4, so all this problems disappear.

This is a resend actually to include all necessary To/Cc entries based on your comment
in the previous patch series:
lore.kernel.org/linux-tegra/20241209172549.5624-1-johnliu@nvidia.com

Previous one doesn't cover all the required reviewers as you mentioned, so I don't consider
it as a valid patch series. Therefore, I resend it again and include the required folks and
consider it as a brand new patch series.

I would definitely try the b4 tool you recommended and update my workflow. I actually use
vanilla git send-mail and git format-patch currently...


Thanks,
Johnny
