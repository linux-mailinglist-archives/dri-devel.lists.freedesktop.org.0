Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CF8743CEA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 15:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0268310E1B6;
	Fri, 30 Jun 2023 13:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9BE10E1B6;
 Fri, 30 Jun 2023 13:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY1apBV+G0D43GIy2sjF22lqXwW8YBZ2ibqLCvw3PrAz5VYYtNxyFcP5nI988uVwKgDeVKgo7ligZY89kCnZvCGVuNh+/wLEq53aNFXrUi8O6cYoSiQ4MRNz1Uh3fi9GDDqRInORf+zl1vSJ/+XlHgMS7bv5RxSM/lgyZe09dTkJ8ASPGzeAJHGjxZ3tQK6FjnC8qLLcDi4LBhKMaxWEPZ2mCFNKnf66rOhMx0wemOdokx10trVvYzFZoiaRLe5uCOMzI3ayAeZ8/Qe8vy6Ds9bRx4r6baM4h+wYVmgJ7sJAU9TvrlHh3r1fz8MYwxE+/i3Sba4Oo/TxH55E/dcFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXikBvj/pVJ0VPbfZan3q79e4S6bCEu3UnCdyCmCUU0=;
 b=g9ly4iherxhhJJ8+K1BiB+n5WK9ZkYdPjpXx50xa2Ly6muwAGC7Qqo6+910+EGzlgHhG8v2ML1ywO6Xt/uDOB/5FRTbvgN2Sa4n+MGYEZnllUfN5xzAgCjQ1HRUzjg4qXjEbGbZqCQ1qXa1zCMtCbj1i9P/LC+zZqG2jjNb5ISfgfQNkn7qn1xrXTsHiFCCxmtdjOP54StQZ3vKXgEqdmcWORA9WhmllSsBJ4/+LdkD+vuO7K0o9yJlkNdT6tnPhwDFe4H3qPCmYJpP8Q3J/TMNyO+K7qxh7Oefu/3uCzPYNfw1FnLG9fLWXL/mvsqK5FtCnVDUFh7bWnrGqWwD3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXikBvj/pVJ0VPbfZan3q79e4S6bCEu3UnCdyCmCUU0=;
 b=Vsb1S/giWb2A4EMBzhGhhHfaUUoaprXIuYJ1jbHxaLo9ZDihpIpNXnc7j95HtccCFxEc2vnu+nenFcb8Ux+nPpWUTaozvcxAXRZNFIl3NIw+V+jD6C3NGS4CV05KQPqVI0pEmQpl4j6f94z0sIRSzT5CSvH+B0y+TrvBeKBDgB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by DS7PR13MB4639.namprd13.prod.outlook.com (2603:10b6:5:3ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 13:38:51 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%5]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 13:38:51 +0000
Date: Fri, 30 Jun 2023 15:38:42 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Evan Quan <evan.quan@amd.com>
Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Message-ID: <ZJ7a4pvrjJbU2qjJ@corigine.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630103240.1557100-2-evan.quan@amd.com>
X-ClientProxiedBy: AM0PR03CA0038.eurprd03.prod.outlook.com (2603:10a6:208::15)
 To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|DS7PR13MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: a63e7b10-28fc-42db-d9f0-08db796f5741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mvWGI+hI6dv2MwuxbwmJTh5rckYyi7b8ss1PY75TzpZDD8nYecX+kpi4pFo4+1PCiOHpWm8eK2BgpNLKiTabUNTt/VNrwnvMNqJQyHhIYVIKx1lCcIZ5G4dOASouLviY6VNH9dE3vSWo++95sF5+lAVCn52QuNpP62IfEgrfrnnn/CFJoZOxA9YndOfrLeQMG+UKZtwkkCNLwJPZ0+b/J1twRqTCzed0Xh9PdpYUi3LMCzXavAghVzVcEZiJsXlQqvPRUMtbSpTp/c3MdcOT0ZL5xL3wdAHxoWQCw5maTR2+bsNwZJSdML/bcNhBbCURNSpaIO9nHxm/Gm1LeI1rQreXdsWuodYBYl3p+DhfcVXPtlE7WSDHjKo8BDWInbN3ttY6FpVYn2LFqZ09bgmXYhctAccNEqpA2L841iCcD2xbKOa1R5K/abV9wYLKn/tKdXMbI5OFHb2+ovB3b3UyVCMCJEZgxOSFx8gxOvXqUpPKzvJ71n9RhcI/PyUUl9F+EVRZBedotXIDrE/52SYDIlTgoU0RxlwOGy/PgLGpcluIr0EtcM2B7x9KYEgBwVk4kEN5owP1taIEGiD5JhTg/4EZtijZUTIwalo7bYdMsIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(39840400004)(346002)(451199021)(6512007)(8936002)(66556008)(4326008)(66476007)(66946007)(7406005)(44832011)(7416002)(86362001)(6916009)(41300700001)(8676002)(316002)(5660300002)(38100700002)(6506007)(36756003)(6486002)(2906002)(6666004)(186003)(2616005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KnrmHxlx4dCgeCyYHl8E+eA/BEZbR+Hhkl+hZtpEIm8Y/DJCHcdfGxC6gv1y?=
 =?us-ascii?Q?MmQoR/2flrHU9rTywuKelboj6Q09aJW1PIM07WR3QY5mZhgDtyQQINuXkpjJ?=
 =?us-ascii?Q?KyHz6E+hqGzEq4kgyhURaGbi5yXlPek4xwxk9URf245hWIBak8AByH6+m753?=
 =?us-ascii?Q?D1Luc2AmlNtEe1rPtsQoyNz/LsNH1o19DLK3Ak4RKgkuxoCMolGPX7ncrWsi?=
 =?us-ascii?Q?EJiQJWCZ8N8U6MsGvsYhW/zFdodlhfsfGOBZmnb5a+cX0Rt/79Ek8+geoaEg?=
 =?us-ascii?Q?nAJh/OMIy3z7oTVPuOvCVHcNIt6jnL1bpneYJWbg2nsKzHIo4J8u7Sm8Oj6g?=
 =?us-ascii?Q?PnqufVRf8inTzV0G8s7Ewp3wsjkXShqzutbmBBEKfglcMauZ3W9BUXlbKObF?=
 =?us-ascii?Q?L3uz8NnnkYUKBvx2MiiKIlg2YxzFTw5DFHxi/JHjkUKW3C3uj1vFh9Ev0cVC?=
 =?us-ascii?Q?g7Xf4tEHBoZz7iRiHHXIjQElj4rWRuLDknhv2oN+74/132XuzGkipds5fPgl?=
 =?us-ascii?Q?QfmpBT6fLNnr7W8ECAs8K5bjTUKn8+UrxRzIDaMZfE71KHsEpuPzUoIgaCxq?=
 =?us-ascii?Q?hHMppPX5VGkQ88mZKMfPXwT+iFaRxKuCNy+4gtn5SRAQmHUCz/G45sVL5lc7?=
 =?us-ascii?Q?l24d3IarAnkEFfLw9x7wehDQDwjrq/cm7M2oX3UMjBIxovpWYHyrcAJ6bJey?=
 =?us-ascii?Q?b1VcApBjn3vM+/9YJg9HhHpttADraGTaIe4svPx/T3mK5Fbpoz6Qo60ue4BD?=
 =?us-ascii?Q?ArFn8bjI9966cdUD8xBn5SdEDkVCAwPJOmxqjH5BdVk4TD89HCM+JaDKDDFn?=
 =?us-ascii?Q?Q0NIKdJ+qZsJnpSBXAxly25CBPtFSzSw36YM9I5MA044mPxLHqCRifIdQWZa?=
 =?us-ascii?Q?TEnwAJ5iX07PnpF7jsb5I19FVB/wB3WzFtHF+HTpWzfgyoP6TApMAQspPzAk?=
 =?us-ascii?Q?zWvd5FB1fXkIe5qa8vrj9ARQ5N9jM+vFnCwNHsCAPXSCqnpQzXa4Y5L5/pqC?=
 =?us-ascii?Q?k+S95BSNA1iBqq+xHr9A4cBqRSG7BNWSAHYIRNw5COxcFiVbW8wLjIVm4uQS?=
 =?us-ascii?Q?eVd72DtLegOMriJ9jFu6nY82Gy98cuF6p4Mc/TlKx0dxaicar4t8QczAPb2N?=
 =?us-ascii?Q?WC8Cy33TaHZF7fS8CT6mNlLOTnuspUBShndUx7nyKVN8sM8pbC+Lu+0BIGYP?=
 =?us-ascii?Q?KX5yUDkF55HpYaemdKifzamMc2ekiUveEyNuU8LVXylBc+H9HHDHZLQdv2v6?=
 =?us-ascii?Q?rHodEqZPaj+D/2fnjsrKbJ8IzMmeVTobgTgIEN5lyAFXsfLwPbKNG2G45abO?=
 =?us-ascii?Q?dYno+EbNWHqHPcYTJ5hgKMEtusoZfHVc0EdrC9SSzXNL2tU81Sb5q9Y45Aw4?=
 =?us-ascii?Q?g6g7i16KJO6M0HVEbgWCzpKJ1ng4aq4B358EPEk50RvZTqLonwdzF4RTRlFc?=
 =?us-ascii?Q?6VQQIZEU/v3j8LTL/nUGsQXtswR6UtzTGmNy3UVFyXRyViVosZTMWRCo8Xhb?=
 =?us-ascii?Q?NjWOyHOstOtkFiAtV3E9p8sfgBPYQfhlXR0FoYX6mUBn1+x6+qt0L1oe/63b?=
 =?us-ascii?Q?uFbyJ4VT5vcKujAx49Kcoqk2w27r2QlHc2EK6XkKKsDjbGm0l2HhtVBqElKT?=
 =?us-ascii?Q?Vmw6aEmJKPwSaMPtUqxGRWSFQquzGunPwoAng9qcssMk91YNnGigAKhe20RU?=
 =?us-ascii?Q?sMK+XQ=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63e7b10-28fc-42db-d9f0-08db796f5741
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 13:38:51.6898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4fwxOj0siDetAKKt4ESAAs6FMsXGp7CjadoZqwAjPfgowBLmluHcMzpCUG42paoxm+tK40EUt/8I7zy3oxePxQtzDUdCJDSU0stlbSE7vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR13MB4639
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, Lijo.Lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com, Mario.Limonciello@amd.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, Christian.Koenig@amd.com,
 tzimmermann@suse.de, Alexander.Deucher@amd.com, johannes@sipsolutions.net,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 06:32:32PM +0800, Evan Quan wrote:

...

> diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h
> new file mode 100644
> index 000000000000..3ca95786cef5
> --- /dev/null
> +++ b/include/linux/wbrf.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Wifi Band Exclusion Interface
> + * Copyright (C) 2023 Advanced Micro Devices
> + */
> +
> +#ifndef _LINUX_WBRF_H
> +#define _LINUX_WBRF_H
> +
> +#include <linux/device.h>
> +
> +/* Maximum number of wbrf ranges */
> +#define MAX_NUM_OF_WBRF_RANGES		11
> +
> +struct exclusion_range {
> +	/* start and end point of the frequency range in Hz */
> +	uint64_t	start;
> +	uint64_t	end;
> +};
> +
> +struct exclusion_range_pool {
> +	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
> +	uint64_t		ref_counter[MAX_NUM_OF_WBRF_RANGES];
> +};
> +
> +struct wbrf_ranges_in {
> +	/* valid entry: `start` and `end` filled with non-zero values */
> +	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
> +};
> +
> +struct wbrf_ranges_out {
> +	uint32_t		num_of_ranges;
> +	struct exclusion_range	band_list[MAX_NUM_OF_WBRF_RANGES];
> +} __packed;
> +
> +enum wbrf_notifier_actions {
> +	WBRF_CHANGED,
> +};

Hi Evan,

checkpatch suggests that u64 and u32 might be more appropriate types here,
as they are Kernel types, whereas the ones use are user-space types.

...
