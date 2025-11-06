Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E52C3B8A5
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB25110E8E3;
	Thu,  6 Nov 2025 14:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="lbE4oZQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazhn15012043.outbound.protection.outlook.com [52.102.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5098410E8EB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgvoUZtKxM/a3uTEsz5iY+HNPj9Wj5IsHQoNiSog0/mD0aWZ5DJgQ4PM+oHh1ZV9sVENRE3x3nCD0rH2gO29wEvYFfBaCi04ADh1uZ2NCBQ/stp/k/oJpY7Lyd9xRdW7ozUQaTRj7eeko/dqixanY/JQBsojcbukyESdlqDfLmfx1TC9tIkBMilK3Ai4Vx2oQvG8CXZFsl1rMriis7WuOPgxAtAP+stH+45ZRpyZ10c11zVysCmCmf0lV2oV3WjupTLSq3l3Vcz8/H5YGIKBo/uj+WWktVSqAp0sxLRJ8I88L0ODV/+ApVDRJSylmHwUTqvz0te2BxHOfI6Q4k3ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSgfireKZMEI8ctwNAvEb4r2B4eciMzL9uwjaujNBAc=;
 b=PgTp89Xcx8sUTTGEbJi08iIcwvPS3On5M1joPS7TCnl6R+FiaLrx3aLr1ZLdjYPUEbc8mG5MyhqZFOq9sgd1w0gjj3kWALvJA19M9bdb9h+BwWuYDgUBgO8LUaSkOPxjHWEQLhejag1IpZZXjnEzQQudPzPweEkbaWPE2wtnJwyaZWcv6MD+JR/H0uLBfTCJ09lDZ4p8Fu5W7PiOb7vNCA2j6Q/NgS40kDxUa/UjE7YzwFAYTQVlCCR9l3CTfZGOoMeZcdXTCTO84cpHTNwy9SGgQeSwq5P98xs/lmPzGMcnQqiZudfiKgjCexv5myLGXuD8ZYP0BZjE9O378WP4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSgfireKZMEI8ctwNAvEb4r2B4eciMzL9uwjaujNBAc=;
 b=lbE4oZQq4haaxxd9vKy/sd4NJK39jsK/h5DM+a/MqrnrmFep9yOw+w8WJx4Tx4WHq8+y9C1voPEyNv0A620OGLdp3syCH1rnz1Vj8pz8Ms7zTeSJBXjPzmvTa42dTiUa3HStMVeCXgc3J8/OvL7uqKH9mdsQxQT/2EJiUMqKXdo=
Received: from BY3PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:39a::8)
 by CH0PR10MB7463.namprd10.prod.outlook.com (2603:10b6:610:181::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 14:02:41 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::f) by BY3PR03CA0003.outlook.office365.com
 (2603:10b6:a03:39a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 14:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 14:02:41 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:02:39 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:02:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:02:39 -0600
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6E2Wcl1324405;
 Thu, 6 Nov 2025 08:02:33 -0600
Message-ID: <725a5700-0504-4bbf-bcd3-fa036fa74a23@ti.com>
Date: Thu, 6 Nov 2025 19:32:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/tidss: Fixes data edge sampling on AM62X and
 AM62A
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
 <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
 <louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251106134652.883148-1-s-jain1@ti.com>
Content-Language: en-US
In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH0PR10MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a553d45-727f-4c6c-27a1-08de1d3d2709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|34020700016|4022899009|1800799024|7416014|376014|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGtlWnlVYUFDOUExYUFVVFcvcHA5Z1VPaTl1UlZUME1DK21tbDlTczdhNHVN?=
 =?utf-8?B?Ri9ldjh4amN1OXNHVGpNdXo0dEp1SGxnT1BJbEFaWkdoYmh5TTN0bzY2M0pH?=
 =?utf-8?B?Z2l6eGxHWWNseXhFMUNDSnc5VXQ5cUFtZDM2ZllRaFVML0NRaUxCRms1bEFK?=
 =?utf-8?B?amt6bjZqQUpsT1lZQzlWRDcySTZzWTlFdEkwQ3dmQ20yUmZvWWN0b2NMMXc3?=
 =?utf-8?B?UUNsaUhPWVZyS1FoNDdNeDZpQ21xUTBxQi9xUU1aeDE2ekh5Y3IvUWZWWHp5?=
 =?utf-8?B?VGl2dmFadFlvWXA5Q3lxSnFxSU9VZTFVN1JSWmR4eXRNQXI1anA5a0V5NXcx?=
 =?utf-8?B?TGM3N2pyb3UrSmw2Wm11WjFpMk1VYW4yN1Ewa09pZnlJUlN1KzZ0cG1oazUy?=
 =?utf-8?B?bUVOampobG1qZEZDWm5qZVVDdTd4RDdBZEFoMnZWZDNucHA5SkZUVnp5aFNF?=
 =?utf-8?B?a3UxTWRHZDFnOXUrNmhOT3U3Z2NETytjZThiR3JteTRpT2hPdlU5anQ1Q1Nu?=
 =?utf-8?B?TFpadHd3cHZYd3lJYWhGNWFCaEpGTzE2Z0dMaGh5STFrT0s4WStqTWxOWkg1?=
 =?utf-8?B?azM0YW1kNDRVU1VkYi9HbWxLemlENm5CQU1sMWtaTXQvY0x0TnQ1SWRxZnF3?=
 =?utf-8?B?Uk9TSWo4M2YraG5CTndjK1FwdU1nVmtDVCtrYmJxb2ZhdGhKRjdLblNTVEl4?=
 =?utf-8?B?NVl1MDBjT3ZTTjFpWFl0Q0prQlFnbFZ6SkV0WkNyNU1FTG5QU29ORTdDbVJ1?=
 =?utf-8?B?WmRPU1ZJQVQ0SDlKM2dJczNXcE9UeE9vZVB3VHAwdnV0NTJDcG0zOUpRS2l1?=
 =?utf-8?B?c1dvbUJyZFcwOU96ZEF2cDZ4VGZERHZnbTJWbEpqcE15c1NHRGRtRmlBa1By?=
 =?utf-8?B?UHdkYVlzOUVmVzRnTzVyRjdxSFJzeE92TjZiMnFBN2g5SnZiOFlTckpveEJt?=
 =?utf-8?B?Sk5uaXZ1aUh6b0RQSHVBYTNMaENMeE9lcDZnQTVIQUlCdHR1dFlMayt5UnJN?=
 =?utf-8?B?amdsMUttd3E4bDBLRXJ5OGkwd0NLTmEzVHRuUnBiZWxjLytHKzBEQUVJYm94?=
 =?utf-8?B?QXhQRkV2akJ1YlZpZDBkQUR4NVdOaXpZMmNBYm5VTWdISERPVTVDVC9VRlha?=
 =?utf-8?B?SUthQWFnQnIwbTJObTdTbnVPRUQxd2FSUk44VXRFUnZrOEt5VVlSdnNiYTlJ?=
 =?utf-8?B?S0tya21kVGZvQVl1K09Yejg2OFAyQlFqMTd2bFp1dmw0K0psRzFxQjBjT1FP?=
 =?utf-8?B?OFJrSFpsVnFoRkRHTFpBNGF3TE11b2x5RGp6cWgzRjc5RmlpY05ZV0xiM0JB?=
 =?utf-8?B?RXNna0Fwb0pXLzlMY1N5bElnaGpqaEY1d3hNNmN3SmxMbmpnM0lXdzBsbm9K?=
 =?utf-8?B?aEVMZmpKSUU0RERNR1Q1UDhseWFwTXBIU3d2OXY2aDVLOVc0RXlhM3NmVW43?=
 =?utf-8?B?eXZNb0syaDc1OGpOaHppY050Q21YbFdoYm41TUFGQlU3QzFBcG5ZVmo0U1lX?=
 =?utf-8?B?b3dHVDViMWZITER4SlF1dWNtR2taN1M5dEVhR1c2UFNhK0pIb0E3enZyOEdC?=
 =?utf-8?B?MmhZbjlQd0VJNEVDa2RFZXcyQVpZMDgrMkxkSE1xNk9PYVpURjMxODA0a0d0?=
 =?utf-8?B?bFpqUytHSmFYb2lqVFlXOG85YmNUNjcvYUd3RXFWZnJwZjBPd2Vkb25VWmE4?=
 =?utf-8?B?Z21hUEJTd2pmQkFtRnAvcmE4ME1xZVIvMXoxRWIydXEvYVl3a2UwS2lGNEVE?=
 =?utf-8?B?N3QwQS9NdTlJUEV6bW1XTzhaT2s0Mk1waEhCN3V4WlBhcFQrVnVRTzQwcDhS?=
 =?utf-8?B?UTJ3ODIzaUhjNEg2MmRpZ0U4Q1lscWdDa2ZyY1hoenNURFNUVlRRRGdBQTV6?=
 =?utf-8?B?b1RBeE5WTnlrdFFrMUJRVU9sbFRYc2pENk14VFNhVHF3N0dVeHI2QmZncExN?=
 =?utf-8?B?VUpXMll3d2NYYXZYRmttTEFNa28vUlhhVkxxN1hoUEVkWmpINC9ZQVFvZm9K?=
 =?utf-8?B?QXI2R3c1YURmV2tsMnZYeGdUYXkvZ2F6TG1WSi9ML0M1R0VjQ3h0UDV0SUJ3?=
 =?utf-8?Q?SKBLl7?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(34020700016)(4022899009)(1800799024)(7416014)(376014)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:02:41.7208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a553d45-727f-4c6c-27a1-08de1d3d2709
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7463
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

Hi All,

On 11/6/25 19:16, Swamil Jain wrote:
> Currently the driver only configure the data edge sampling partially.
> AM62X, AM62A and AM62P require it to be configured in two distinct
> registers: one in tidss and one in the Control MMR registers.
> 
> Introduce a new dt property to link the proper syscon node from the main
> device registers into the tidss driver.
> 
> The series targets to fix the issue for AM62X and AM62A, later will add
> the changes required for AM62P after DSS support gets upstreamed.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
> ---
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---

Please ignore this series, will resend v2.

Regards,
Swamil

> 
> Louis Chauvet (4):
>    dt-bindings: display: ti,am65x-dss: Add clk property for data edge
>      synchronization
>    dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
>    arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
>    drm/tidss: Fix sampling edge configuration
> 
> Swamil Jain (1):
>    arm64: dts: ti: k3-am62a-main: Add tidss clk-ctrl property
> 
>   .../bindings/display/ti/ti,am65x-dss.yaml          |  6 ++++++
>   Documentation/devicetree/bindings/mfd/syscon.yaml  |  3 ++-
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |  6 ++++++
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |  7 +++++++
>   drivers/gpu/drm/tidss/tidss_dispc.c                | 14 ++++++++++++++
>   5 files changed, 35 insertions(+), 1 deletion(-)
> 
> 
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazhn15013045.outbound.protection.outlook.com [52.102.146.45])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D122D7A5;
> 	Thu,  6 Nov 2025 13:47:09 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.146.45
> ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t=1762436832; cv=fail; b=mCvCAZ5lPBCaLQpUbkgMSKLEdDU7tKIaPYKBYKRlJDJvA3HJDOF4o9rHXAmJ4Q3MZ3jAbLoVLTt3m0XFS4EsTjD0Kn9UFadq5yH3UEbaMifV9nNNCxRTagTAS/PztEgoWjO+Ua8GxyipjIw5HF/+XrgcxMjxq6apY6GQSRfEweg=
> ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
> 	s=arc-20240116; t=1762436832; c=relaxed/simple;
> 	bh=ypOQ1tnPaOwiPzoeZ/7HF8CzInLg+VdGKQTawnNwb+Y=;
> 	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
> 	 MIME-Version:Content-Type; b=e9wayDD8dozKqikO/UlCVDQJb4VPQu0qUx9TzgViM+gr7qEqAB8+LWRXnZPTboWCHUuVyfJQNCipnmxYOqwgWpqGYzqoKMQusSbfDkBVIErw+8/SmMZRXGC+2yoxAG5DmAVM6z+gNnbZdNwLIFfWkgVqmFlvIcsPRrcxKrXGqzg=
> ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ix9Yy/a0; arc=fail smtp.client-ip=52.102.146.45
> Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ix9Yy/a0"
> ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
>   b=obPqgQ+xb7bkMZ6kcbQyNTvsgRGIcxYO96liROm/j6cw6q9XbmOaVMrQ/4xNDXw8gFNY85QGYxmVkOjXleA8p1IevyGP6dpMrwpz13+V9Otce/f/zbfVctyYGCLa2TLrp3vZjgDBLgO6NY+1slq/+UiUIEc4TFr63+dtCn/HkdnEpAu02Vry98Qxr6OeptL+m823vL7OqNsTUaD5o5gwtYfdBCdUoLEvQThLrmwY2A54uMi21B6MjNfCqXvS9KzTJS9b+vTpCotPF2F4r4PxsHVPub8xlshYUHemtKUFCEU/NUgCZMCL6QgGK4iadVkkAaHTCeM4cZfVDZC5ud/gVg==
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
>   s=arcselector10001;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
>   bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=;
>   b=yL6VDDKQeN3UU1jQjcKIl/1NoiUmJywNWOOoUQSC5wJMXNFoMPQ63T2nbDCWWxUEQ1HZAYtFJF2FlGfdK1NEpvyc2Bm7OtAKG4EzVeRFvzd9FNBxnG5SJQYqSOT8sUHQlXvsLXbt2rCQ9lwgeAWVyCvDCO30xXPEZP6vfsMT4pNQBQXrVlawye6OgSI6N8pknsJTwQRU4rXY8BmO6Rrs7QDxzMoDgVkBB8Pu/cLeH/7+ipOJRMBYeFkk2pH73feZF7Od+XDY1e4snpo7lsVZD/pRyGKXyxeIH6u8YmVPp48/++reGEuP+PluFJfUgIlc/0I7blrwnxkapcr9oQUcrg==
> ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
>   198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
>   dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
>   dkim=none (message not signed); arc=none (0)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
>   bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=;
>   b=Ix9Yy/a0FCc/WH8ID0ntenOSPxcA1Ir/dV5sA03Q5v5UJfI+C296IGxJxQ/L6PPSvYOFmPiIesZpXJM2wsMesUbmBTTr3LSDcWoZiNRTbXZaJLPRj7WHIswj4jynWBVqqigIHHFZZyVb+OyJVL0a+jUtn1jhSRlnN9jhRc0Sw8M=
> Received: from CH0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:76::15)
>   by DM6PR10MB4122.namprd10.prod.outlook.com (2603:10b6:5:221::19) with
>   Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
>   2025 13:47:08 +0000
> Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
>   (2603:10b6:610:76:cafe::1b) by CH0PR04CA0010.outlook.office365.com
>   (2603:10b6:610:76::15) with Microsoft SMTP Server (version=TLS1_3,
>   cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
>   Nov 2025 13:46:55 +0000
> X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
>   smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
>   action=none header.from=ti.com;
> Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
>   198.47.23.194 as permitted sender) receiver=protection.outlook.com;
>   client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
> Received: from lewvzet200.ext.ti.com (198.47.23.194) by
>   CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
>   SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
>   15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:07 +0000
> Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
>   (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:05 -0600
> Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
>   (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:04 -0600
> Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
>   (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
>   Transport; Thu, 6 Nov 2025 07:47:04 -0600
> Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
> 	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDY1301720;
> 	Thu, 6 Nov 2025 07:46:59 -0600
> From: Swamil Jain <s-jain1@ti.com>
> To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
> 	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
> 	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
> 	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
> 	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
> 	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
> CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
> 	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
> 	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
> Subject: [PATCH v2 1/5] dt-bindings: display: ti,am65x-dss: Add clk property for data edge synchronization
> Date: Thu, 6 Nov 2025 19:16:48 +0530
> Message-ID: <20251106134652.883148-2-s-jain1@ti.com>
> X-Mailer: git-send-email 2.34.1
> In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
> References: <20251106134652.883148-1-s-jain1@ti.com>
> Precedence: bulk
> X-Mailing-List: linux-kernel@vger.kernel.org
> List-Id: <linux-kernel.vger.kernel.org>
> List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
> List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Content-Type: text/plain
> X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
> X-EOPAttributedMessage: 0
> X-MS-PublicTrafficType: Email
> X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DM6PR10MB4122:EE_
> X-MS-Office365-Filtering-Correlation-Id: 33984d1a-a850-40e1-0c88-08de1d3afa69
> X-MS-Exchange-SenderADCheck: 1
> X-MS-Exchange-AntiSpam-Relay: 0
> X-Microsoft-Antispam:
> 	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|34020700016|82310400026|921020|12100799066;
> X-Microsoft-Antispam-Message-Info:
> 	=?us-ascii?Q?2RQHSq/l7eXIEskRInwrl/UHAAnzT6a7dpANEtlnv2kyno5HCXNRbkeqKLiF?=
>   =?us-ascii?Q?fBU6j6bqnmF180mAgad7WNdCvkte0DHfp4mzgNDHLijAOMwtN9YvnLcv69rh?=
>   =?us-ascii?Q?6+BkKoMjB756LgKsgyPAHBY9SMPhGSs0ijAb1POa7TIhRrKGbVR/xNMdmynI?=
>   =?us-ascii?Q?1Ic78h1MNV+h6RK5CxWZvUbm/x4Vumk6M6XlI6flAmMIbPjVW7BMmEn2ieEK?=
>   =?us-ascii?Q?GkExLJz+ALpN+lfz879bcRZWr718IjF2b0ZDcFuNkz1M23CDuWEqMRt8pl4m?=
>   =?us-ascii?Q?hnWr/iqqTT72mM9N0pC8NMaFnS18WzijqVXfvkYXS+AIXLJUmUyFbM4FuZi0?=
>   =?us-ascii?Q?8Ua2GF/Gkr13qzkqqI7SEso+WDiOyflumKFOxbcQaBePw50g7whd/SJ9pXDT?=
>   =?us-ascii?Q?rT+fGVghHqjO1GuIwOFOqayqD8R6xu3PUFNlZwSDoCSvIxEfcjkQfHyyGUUp?=
>   =?us-ascii?Q?UIi3/iml2y/zZ+Sb52bDxdB6e+5hDE/aUnNM0c6SvG0T6wZw41vtYQw09Yue?=
>   =?us-ascii?Q?DEBsOkt7RCpp37ijXauRExHIam8HRUeC66pwo8usdRyJX6YgiqEzbuTQUG4a?=
>   =?us-ascii?Q?nXo/t2hWYWSFG9N/j9iaV5ms9LujhFCmjqtvUis1aD6+GunTE9ks1Gd6spSW?=
>   =?us-ascii?Q?axaDo1JsV8i5cbsuxt8Z+54aveVnOxXaDYRrEMU2hxvYPFpPWSYZby67Fs4/?=
>   =?us-ascii?Q?FBHyIzkFBDvoR91eDPrQryUkhDJDbPYQquD5Te2M5bWs44KggbNTeJms8GL7?=
>   =?us-ascii?Q?29pb8JSG7zxKX30Svd9MLjKGzgKEu3csOiY4QZ04DRRhCg46+OwD4mfBbFPd?=
>   =?us-ascii?Q?YHx7XZj0RARTkM4ie/Ti+REVQQgjbMuj+54S98XdbhOxN01G8qWPymWtkROM?=
>   =?us-ascii?Q?O9T+lIKIH8oiOxFyryoa+GelbsAWi4rHWR20T/OtXmVKWwm3IVdkwv6FAQ8P?=
>   =?us-ascii?Q?+pGQ4qj7b5BFIHaw2gYwZkPEoIDlQip6TTuBInqlAKYn8VWLNaHVJ/v3dfca?=
>   =?us-ascii?Q?hRNnHPLfY9RJRNX29JpRv2dcc25VKaVf4NpSS+aPzrleUA9lkBzFAEhF6Km2?=
>   =?us-ascii?Q?nLy6aCTB60nVIN39/v3bCzNqLufW6ojR9UxqtK8TvbqNelX8a1OjTTcvb2/t?=
>   =?us-ascii?Q?xI9fmgm2qMvG0Oq/udmhj0otpWwLrL0kKissat+duSrbbK+7ks/BTIhLPo41?=
>   =?us-ascii?Q?88wZ1Zcvmk2NjQ06AuVoV0Xibq6/CxtjCgdmB5zJhB92yBBxescQRm4VRL4o?=
>   =?us-ascii?Q?DLsZ/PTtivmKojnckuGQg/ZsK2MdhMIxctXEM1XLM624aj+VFD0LNUUJiKhi?=
>   =?us-ascii?Q?+RUwstam4SbpM60+SaQmmobszbuzWaXnB2g6LdUqhVzLHkLLGjgTqkwpBbfa?=
>   =?us-ascii?Q?XvrJqzJ7C28SW11Ae/BEHXT8S0W1spfhn2NF4h8+AlybVg6cnZl0iMRKClIs?=
>   =?us-ascii?Q?53DneeRYG+zoGh8OOBfatp3FHHSCJ/gCfMrPcOiV4H0radxgjuMsQmkSP/Zo?=
>   =?us-ascii?Q?G8DA+yCy8UseQL8cuogjaUa8QzfUnkJL3KWsqcxJrUC6XvCs+th317AEF1Sq?=
>   =?us-ascii?Q?kdcd0ty4xRRUpNXAwpiinwE26Bn0dfnCr0c61LRr?=
> X-Forefront-Antispam-Report:
> 	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(34020700016)(82310400026)(921020)(12100799066);DIR:OUT;SFP:1501;
> X-OriginatorOrg: ti.com
> X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:07.9237
>   (UTC)
> X-MS-Exchange-CrossTenant-Network-Message-Id: 33984d1a-a850-40e1-0c88-08de1d3afa69
> X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
> X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
> X-MS-Exchange-CrossTenant-AuthSource:
> 	CH3PEPF0000000C.namprd04.prod.outlook.com
> X-MS-Exchange-CrossTenant-AuthAs: Anonymous
> X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4122
> 
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The dt-bindings for the display, specifically ti,am65x-dss, need to
> include a clock property for data edge synchronization. The current
> implementation does not correctly apply the data edge sampling property.
> 
> To address this, synchronization of writes to two different registers is
> required: one in the TIDSS IP (which is already described in the tidss
> node) and one is in the Memory Mapped Control Register Modules.
> 
> As the Memory Mapped Control Register Modules is located in a different
> IP, we need to use a phandle to write values in its registers.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml        | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 361e9cae6896..b9a373b56917 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -133,6 +133,12 @@ properties:
>         and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
>         interface to work.
>   
> +  ti,clk-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to syscon device node mapping CFG0_CLK_CTRL registers.
> +      This property is needed for proper data sampling edge.
> +
>     max-memory-bandwidth:
>       $ref: /schemas/types.yaml#/definitions/uint32
>       description:
> 
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazhn15012043.outbound.protection.outlook.com [52.102.128.43])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8502E3B1C;
> 	Thu,  6 Nov 2025 13:47:18 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.128.43
> ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t=1762436841; cv=fail; b=s9JKlHvNTe7yjaqVylfofEcfLJENlOTuU/F5xSJqEFlEXDbQpoP0/cR/+FQvkne15Le+p8+nwG4QPA72TZSbGzK+HzsD0qys6je0LkvVWug/nfoRiyxIfJRjvINqAZ41HPTDpsvjhaZbdVNkHTSSoGo8/FEE6uF0Gih+Mu8ZQbk=
> ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
> 	s=arc-20240116; t=1762436841; c=relaxed/simple;
> 	bh=CK+pmyrZcfJyikOftXLwBi5zmPeClYXlEwbHeC0KuXE=;
> 	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
> 	 MIME-Version:Content-Type; b=CWUbCkiT7k6kY6s4FP49tui07DL1vfVBUe7g9zEXrgUj0Sotgk1nPxLCAAHiHpp1z0cBYA8hPMhNH28+wz4Tb18z4GlzQJy8/YCOFT1CmyH4KjkgJkXlbGRnGMchrj6X9OWlAwV1IFVf+61mYQLH0vkF8ke5sKSktLnmIH1nQq4=
> ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cBU1ZIZM; arc=fail smtp.client-ip=52.102.128.43
> Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cBU1ZIZM"
> ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
>   b=fR+uc410mlGxGqfFOilOFt9BqkfXNDfphAB5Va7WbliIiSaEPk21/T67N8H3sr9ya/P8ZvSEUBUowIMjic0/Z1LvPDEDal9HIAX5sDN9cmwPpZWeifJHM4i1spK77irPG4OpeTgXgayK7MhkUXseNAiIUcpHzvIkaS/7O1l488pLzrpiNZPEPlSLY48EgLZw5J7bOaEnY+t6fAUQZVY1ZAttdeLAlmBa+P4Euve14csB040ozT6pHuK0Y71RtzWzWwJE5zmJNDTwvFgXASWrARuiR2MqHIG/1Qr4uAkckqRpRNKxtByG+46YKPWHiqW13rQQwt+z4Hxz5UrC5m6OyQ==
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
>   s=arcselector10001;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
>   bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=;
>   b=eBCPZKdtNXEAyM1vf57xoUVWLpDxqVYQvYfE3Q8OtkAOCjL2P01gC73UE6sxFPvqFqd0TS9j936AxvPMrV7ovyGFqFHy0PU68SXUNAz/JD/ZF1SUsHDL1Vy9efQjq+nOcNu8xLA6WJSfO/4E7Rn/ynemZhP63Hoqv847rr1Mg6gvBOD9fu+o478d76/WJLXStuWAHXnn/GguBrDHmXsqhAZRDbHQaROHgeEeiEhQpiJ4mwF/l0yBJf09WMSkQrwpOJAsHzLN3Gc/rmCbqlX2KhfS5+1TVgZAtt+OeGYF6AFWzK0AfLE4R5ZHLB/WNT0krS4mgpbpTxLqxIzy+w4HxA==
> ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
>   198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
>   dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
>   dkim=none (message not signed); arc=none (0)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
>   bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=;
>   b=cBU1ZIZMzWcNlVy7WZDLkZ1xwVoGgoLKLHGVnI2mfQGwbXZsQwRlTxE+CbkZvH34LH5yiMuB9Kfc7N8xp9zsxLADhRoV5/lCMyVh+BuRFwIBRJb/jxKF+VXMAQpt/tPvLZbvmaTYyamQptoXMn310UjE+c7133uNu2ZK/zIexe8=
> Received: from BN9PR03CA0799.namprd03.prod.outlook.com (2603:10b6:408:13f::24)
>   by SN7PR10MB7047.namprd10.prod.outlook.com (2603:10b6:806:349::9) with
>   Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
>   2025 13:47:17 +0000
> Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
>   (2603:10b6:408:13f:cafe::eb) by BN9PR03CA0799.outlook.office365.com
>   (2603:10b6:408:13f::24) with Microsoft SMTP Server (version=TLS1_3,
>   cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
>   Nov 2025 13:47:09 +0000
> X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
>   smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
>   action=none header.from=ti.com;
> Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
>   198.47.21.195 as permitted sender) receiver=protection.outlook.com;
>   client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
> Received: from flwvzet201.ext.ti.com (198.47.21.195) by
>   BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
>   SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
>   15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:15 +0000
> Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
>   (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:11 -0600
> Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
>   (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:10 -0600
> Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
>   (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
>   Transport; Thu, 6 Nov 2025 07:47:10 -0600
> Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
> 	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDZ1301720;
> 	Thu, 6 Nov 2025 07:47:05 -0600
> From: Swamil Jain <s-jain1@ti.com>
> To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
> 	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
> 	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
> 	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
> 	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
> 	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
> CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
> 	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
> 	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
> Subject: [PATCH v2 2/5] dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
> Date: Thu, 6 Nov 2025 19:16:49 +0530
> Message-ID: <20251106134652.883148-3-s-jain1@ti.com>
> X-Mailer: git-send-email 2.34.1
> In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
> References: <20251106134652.883148-1-s-jain1@ti.com>
> Precedence: bulk
> X-Mailing-List: linux-kernel@vger.kernel.org
> List-Id: <linux-kernel.vger.kernel.org>
> List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
> List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Content-Type: text/plain
> X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
> X-EOPAttributedMessage: 0
> X-MS-PublicTrafficType: Email
> X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SN7PR10MB7047:EE_
> X-MS-Office365-Filtering-Correlation-Id: 707ee5cc-ba7b-4cfd-9fd3-08de1d3afef6
> X-MS-Exchange-SenderADCheck: 1
> X-MS-Exchange-AntiSpam-Relay: 0
> X-Microsoft-Antispam:
> 	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|34020700016|36860700013|921020|12100799066;
> X-Microsoft-Antispam-Message-Info:
> 	=?us-ascii?Q?CWBeH3gAQjWS1cYCjmp6Nr6B+HnSjS+lWZdiZ0jcx0/vfltcbfQRyM1Ck9iv?=
>   =?us-ascii?Q?X6OvwupNexSr7BWhyR8ZCHoQR3dAemhhc632qPJonhvuGgKXaaWkAIRv+9Di?=
>   =?us-ascii?Q?CHqI9GyQPFkkJpTWYP7s38jqrAdkFOMNp/lklcWlXoD2uECyJjoX0ruk+WUn?=
>   =?us-ascii?Q?uckHiXpvg1IvZb6Gh1HmfAVGgTUcFOu3C1z6jvmD46ImZrN18e4hntfzuJjI?=
>   =?us-ascii?Q?VKtjL3Ss2usMVSVSJV+fW58fHPtdMzpAGWDm2gDaBFq/tcyCrEI/pNwG/J9d?=
>   =?us-ascii?Q?rmo/lOGCwtzmHyRMZ7h+tBxgvviXkLwELWYW6Jy+iVwVJGoCQWSd34Dke28B?=
>   =?us-ascii?Q?hdTOS2EYR685LhO/XFYNvLmMzWHYlik/nXCB40mJS73P6Wd1BT+0Wg4d6hMN?=
>   =?us-ascii?Q?dnUT6MfYEyOzHIJ+PZ5tgZWTG5UGDRPTqGMen6mcbHTLXujlSEMoDqhbGgIV?=
>   =?us-ascii?Q?Bm7c79ji/wBBbakXEAv0mAvUJCEmBXxOJojR4gkAvd4ZaP1GZ1bxxXLJJvJn?=
>   =?us-ascii?Q?ZsFWlAFmC0+WBC1xsRt1ZWWGUw2BnKJg/Qm00u/BSr0ipfFOBvH45U2JxpGd?=
>   =?us-ascii?Q?gV8aN9a7dsUZFfVX5TZGnAlhhYO7cdW1tdfizPx5dpSfO0kjhDFwEv/I0DVC?=
>   =?us-ascii?Q?HbVzIhLUxxS5k93+UWM2wBbVDjZL5yOrTE6OtaOG2dy5MWM8hmfHU0Gf51Ql?=
>   =?us-ascii?Q?83yj1U/7d0Qx6ZjosNOxzH1whJJJnmkGg336YS01JcrBp1I4op5Jeum9Cj0b?=
>   =?us-ascii?Q?WIpUotI0aOoM8jF5+WtKSRrLyCuhQWzPI7FbdoTTv28XJ3MZcGmJtkAr0cwf?=
>   =?us-ascii?Q?AWYwluzTx576RfhR/JD3j6TTipjnXOyMJWTPnhErpjzelO0Mk2YViKCtsW8D?=
>   =?us-ascii?Q?IvC+aPvgSn+dI+C4OY1ibhh7yV9zeq2k5vO1QQM83/nj5SxoAEvYZ5BSQ/ZM?=
>   =?us-ascii?Q?+3h7oy5xEYcWH7YbO0pr7TpnFs9dE8NqxyeyB4RvWbTDR8JGT3iZHAHoTKje?=
>   =?us-ascii?Q?JmWfbq7KPc7jAQ+IUZnpyxtxe5TQNiS3ZXKnwcizs7yji2kUCSKIxNeQuwxn?=
>   =?us-ascii?Q?O2fxMJDF/woVumQ5aFoG29MijxROPHiKPu8+fbQrfy0pG46jGwBUkplIZ/9W?=
>   =?us-ascii?Q?rQwZVGcv3U670W618rlcq7G7EINXn5i8SM+egW/gE7iRsy0oZJxovNjrjdP6?=
>   =?us-ascii?Q?aRCp3fvsHCI0zM+yT2SAYTUam9Zs/S5H7K4la5iCf0uzNL8fSG2tWnZ3BF6I?=
>   =?us-ascii?Q?CN0HtGojFPFYCN+LbN/VzCvPTgI7jfTRLZkl9JoEHlevhAmITGXpd5mv57fj?=
>   =?us-ascii?Q?m+UXww5RlpcjrtjcyPaLcIotgDvEFO4Jk6ssB/4nMluBhNpxkgCMN9hGvYr9?=
>   =?us-ascii?Q?8HI4rgxWZ8n9aOFZowqRl+QClu3RXzUsy5OoJ5F/V9tghZcO5AjAfMgmfjLf?=
>   =?us-ascii?Q?ipttnQy4oZDrnYHrJITwHTgVLxZU9ANvfhsErPIHj0rkS7OjRb3meLkXybDX?=
>   =?us-ascii?Q?L8ccHOCMqTPrmVpxCWfCIH7fw0pICYlko4y7WTuwQRFg5IFFxKgoXbPjkf/d?=
>   =?us-ascii?Q?ZKP8dXCFq6+Vz36ZtzfYuPG9dRVXoVmyz8Csiq1q?=
> X-Forefront-Antispam-Report:
> 	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(34020700016)(36860700013)(921020)(12100799066);DIR:OUT;SFP:1501;
> X-OriginatorOrg: ti.com
> X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:15.4901
>   (UTC)
> X-MS-Exchange-CrossTenant-Network-Message-Id: 707ee5cc-ba7b-4cfd-9fd3-08de1d3afef6
> X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
> X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
> X-MS-Exchange-CrossTenant-AuthSource:
> 	BL6PEPF0001AB4F.namprd04.prod.outlook.com
> X-MS-Exchange-CrossTenant-AuthAs: Anonymous
> X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7047
> 
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The dt-bindings for the multi-function device (mfd) syscon need to include
> ti,am625-dss-clk-ctrl. On AM62X, AM62A and AM62P devicess, the display
> controller (tidss) has external registers to control certain clock
> properties. These registers are located in the device configuration
> registers, so they need to be declared using syscon. They will later be
> used with a phandle in the tidss node.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>   Documentation/devicetree/bindings/mfd/syscon.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 657c38175fba..2dace701b9a6 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -123,6 +123,7 @@ select:
>             - ti,am62-opp-efuse-table
>             - ti,am62-usb-phy-ctrl
>             - ti,am625-dss-oldi-io-ctrl
> +          - ti,am625-dss-clk-ctrl
>             - ti,am62p-cpsw-mac-efuse
>             - ti,am654-dss-oldi-io-ctrl
>             - ti,j784s4-acspcie-proxy-ctrl
> @@ -232,6 +233,7 @@ properties:
>             - ti,am62-opp-efuse-table
>             - ti,am62-usb-phy-ctrl
>             - ti,am625-dss-oldi-io-ctrl
> +          - ti,am625-dss-clk-ctrl
>             - ti,am62p-cpsw-mac-efuse
>             - ti,am654-dss-oldi-io-ctrl
>             - ti,j784s4-acspcie-proxy-ctrl
> @@ -260,4 +262,3 @@ examples:
>           compatible = "allwinner,sun8i-h3-system-controller", "syscon";
>           reg = <0x01c00000 0x1000>;
>       };
> -...
> 
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azhn15010008.outbound.protection.outlook.com [52.102.149.8])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CE0221544;
> 	Thu,  6 Nov 2025 13:47:24 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.149.8
> ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t=1762436846; cv=fail; b=gZhxpo4hTnZ9IPjrNvxWqu6B7MlFxIm+Qg4OCKotj1xXcWwBk3RW7xDrhYWfd2kqZgsoah1w7DUmorcnaN2De87S2Bt12224BXtBas0TLI2L/N3SB7lBXWKnX202cAPGwTaoHEd/yUggdQOaETSZopVUUB4fRlD3xufXyKcD2lQ=
> ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
> 	s=arc-20240116; t=1762436846; c=relaxed/simple;
> 	bh=jS5TnOiaF7LGk4K6DkvU5pPlQWWjKYeAFamdwwyIilw=;
> 	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
> 	 MIME-Version:Content-Type; b=dJzeFHiJjECWBpVapaee8+EkuHelwMhUnECu6ZJgF5540PMhKTJ8naphhtBFIYlNtv9twrAtBqSMvsgjz3XKyL/TkQEvRK0uaH7cYddvcwg66m7IxzQBOQWonqaWT7ZeiBH9rFox1Fnl53M+zdYYFWxnWQYY7U8/50XubpDgr7U=
> ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ukP6pQt3; arc=fail smtp.client-ip=52.102.149.8
> Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ukP6pQt3"
> ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
>   b=IHwM/EphYd1jaSv0yvCTCsX7l4aKYiJBN9Pa4vukNk0PlR/xO5COONTmRZa+UnPh4rbT/djilhCfQhL7Yfeuy6zbKGCEhaExC0Ll8YpabhcT8fsCPulLAK9fvc1IBqlGM31cr8i82CWJzVqs3Q8MZjj16ZADm/81Z8mYtzjadHm5h3DOcluxfzpEDtlR6NaIEfFUwT+yXcL2d/rxF7TVcByO5MpcQYP+3jAYXb6h9/lNOuE7u8bciRGEZ3UCpHpO3CABjn4SmbOFMk40FywC6uaxj2WSztS6k9yiCZYQgFTzyiyUOSbine4xyi6TidJMT9WOJiO3SpYnOTa0urPgGA==
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
>   s=arcselector10001;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
>   bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=;
>   b=uHgvlFBTfl6kRPHmdNSB6t1IGv5mYoSCOs6EHBCzaQVpeP/WfpAKro0VfgxUrp4aLKKK1UvaZrJVXaHCCzzsr4OuRz+8QKaKVEJI6ebBMckFMMji8HDacU9hcfgErB/t8WewSI+PHQD19Qv7kaGns6IljNuECGTYQKku+Ioh5JHQSs1862LSiRZHGLf4Mux+nzRPa3CYEqxYa+bYxS3ZY9xyxdysN7vDRuv4j492fueUEyEC8GoBXpxbd+l9rgD2P2G3TrTjbmvGykFaq6S1Zj5Q45KqdqKDgq2qWswyTVLjqJad2XoSu7JmNFb4+kJU2OfklS8v8PHxQV5r8qpyiA==
> ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
>   198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
>   dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
>   dkim=none (message not signed); arc=none (0)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
>   bh=niNE352IkGkIrvc5Dyg3+WvbmS/2kObJo6TSjxa1OBs=;
>   b=ukP6pQt3WADfflCuLxISG9qnDvvgKtWw6RZuzXuFg0Y31JZXhcQ9uIEWabXDILLJ8fZjHk8Lv4khCB79ul3YZysnSswXoPZBzBKHw/PaZ3czEJoQ1nWFCz6fwciRkwhSc7JMtfUj6Sb89UVi2oUF59+UQmqjZ33kR6rAmLg2v9Y=
> Received: from CH0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:76::20)
>   by DM6PR10MB4137.namprd10.prod.outlook.com (2603:10b6:5:217::24) with
>   Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
>   2025 13:47:21 +0000
> Received: from CH3PEPF00000009.namprd04.prod.outlook.com
>   (2603:10b6:610:76:cafe::46) by CH0PR04CA0015.outlook.office365.com
>   (2603:10b6:610:76::20) with Microsoft SMTP Server (version=TLS1_3,
>   cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Thu, 6
>   Nov 2025 13:47:21 +0000
> X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
>   smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
>   action=none header.from=ti.com;
> Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
>   198.47.23.194 as permitted sender) receiver=protection.outlook.com;
>   client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
> Received: from lewvzet200.ext.ti.com (198.47.23.194) by
>   CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
>   SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
>   15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:21 +0000
> Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
>   (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:17 -0600
> Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE200.ent.ti.com
>   (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:16 -0600
> Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
>   (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
>   Transport; Thu, 6 Nov 2025 07:47:16 -0600
> Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
> 	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDa1301720;
> 	Thu, 6 Nov 2025 07:47:11 -0600
> From: Swamil Jain <s-jain1@ti.com>
> To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
> 	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
> 	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
> 	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
> 	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
> 	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
> CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
> 	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
> 	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
> Subject: [PATCH v2 3/5] arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
> Date: Thu, 6 Nov 2025 19:16:50 +0530
> Message-ID: <20251106134652.883148-4-s-jain1@ti.com>
> X-Mailer: git-send-email 2.34.1
> In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
> References: <20251106134652.883148-1-s-jain1@ti.com>
> Precedence: bulk
> X-Mailing-List: linux-kernel@vger.kernel.org
> List-Id: <linux-kernel.vger.kernel.org>
> List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
> List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Content-Type: text/plain
> X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
> X-EOPAttributedMessage: 0
> X-MS-PublicTrafficType: Email
> X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DM6PR10MB4137:EE_
> X-MS-Office365-Filtering-Correlation-Id: f316d639-b98b-4b00-07b3-08de1d3b026a
> X-MS-Exchange-SenderADCheck: 1
> X-MS-Exchange-AntiSpam-Relay: 0
> X-Microsoft-Antispam:
> 	BCL:0;ARA:13230040|376014|7416014|82310400026|34020700016|36860700013|1800799024|921020|12100799066;
> X-Microsoft-Antispam-Message-Info:
> 	=?us-ascii?Q?P8he3DNXo/8OJ2rzJ9noCefF5nBhJ5RUxYhwWK+tEWKmcyLyfxAFZyYYi/wG?=
>   =?us-ascii?Q?i1v/Hb6DlDy00sBmkFDIRPsCODJmyCFRH5sZpdo2H+IJJ1jwzQU/re2zn7fd?=
>   =?us-ascii?Q?BBjFBdrbdu41omQFDWMd0svmCC5ekSyft6HJ8PsmUuj0ChwDa2hV3hGeKOBj?=
>   =?us-ascii?Q?Bci0/SdxnZMVq6tSmsHD6PqeQ2C6A9zvUw2w0pcKxF1MPp5VL85163baq8IX?=
>   =?us-ascii?Q?GqO+YLfdN4MqexfJY2air82UP+iyAvhECZCgT0v6rseUAgZzLSzCHBBOGD+n?=
>   =?us-ascii?Q?HnIxzHcllRK8moSWawdnffBvuhycbSoptPxQHETBvDpISLrbX7Wl+KBNPgof?=
>   =?us-ascii?Q?BcRDS0fc5C2e86LvtMf2d8FJYK5rFs055ZHumWXDmfU6mDGD873CHH7Nr4DH?=
>   =?us-ascii?Q?isOCVj5VhqmYngqk/az5Ytokg3I33iliY2+NOAwRLxj+ksvUlKNCHQItwQUP?=
>   =?us-ascii?Q?Vr78jDOlGbOy8BVUj1uqYWR29gCuIa3PHDvjs5yq24RqqbpOFZ2pYr7Bv/77?=
>   =?us-ascii?Q?aIhuoxdRsak/zsLO/f1fqB11r7JjCIG6nBkiZItuzR+QDE+/vj1NHQBRkVYb?=
>   =?us-ascii?Q?aG+KXrgFSOCpwN+bFd9MbCY4wELa1kpmrqSZleOayk1MTS4VD0ot4HDPHcoY?=
>   =?us-ascii?Q?HNrWcTMbkXJFt6/Xcidz2Qxyy3AZ4eliMSewB9NfgzO0mvQSeYaiuUhWqcn6?=
>   =?us-ascii?Q?jy/cSkNIXl7odI8KzHSa9ZKJ7SipJSYQTqA7tCT873Yt+CqtAbTOtNUodtM5?=
>   =?us-ascii?Q?Qo7/2GSJqr5WROjSJromB0JPva/eDtztYL168ZeUStUG6qOJryv5X12T4ycq?=
>   =?us-ascii?Q?Kl5SIwCO4K2IEYoKGpMBjim1k/QHQeSpYtn5E1mvg1WGgzs5qxkbpjyBnR1J?=
>   =?us-ascii?Q?qw9qXiqxuo55nPhsC8rHaFY5/lQu1QCRpDrGoggUjguJfTpiVFKtsns5aNGb?=
>   =?us-ascii?Q?5AFFi5W8MoBHIRRBUsxJ1UibPDg9T/xXcHuCuf27y2kXoG9yXjmhbqz3LWVE?=
>   =?us-ascii?Q?eF40xWtu8NcNgRaMD1rah8FKT1qcv2tyqEg4fZrwkG5OeG1bWT7cs8aPocJw?=
>   =?us-ascii?Q?4bSjjk4C9fptakvIM59Eo9q7b6VfZVpZweAFQkoqWDi9UFp87ZxwaCNU07Kw?=
>   =?us-ascii?Q?imQaXKJEtf6MfUMii2XSxnEZYYkAb1yJmgJdxOblephUPjeNuH0/PaccO8P3?=
>   =?us-ascii?Q?7x6zWgP1pHk3GNGMy6z5UeO9WFmvLoKVG/Q8ExXSnUytADSGh4kD0m+kT+Ph?=
>   =?us-ascii?Q?AwmVZCGq3H0Aumi7cWaa1YgKi+9475zjZj3R7uyDd4iYScBvGM+j7D74LUSy?=
>   =?us-ascii?Q?OnlgNbifvKB7wR5ITQaU/tdb98FgmxUucHV9TME4J9TL7WpxQvBNCLc48Vw5?=
>   =?us-ascii?Q?Z9zeBasE1qQVpnJ1MegrrJ1vs+trew4q6F7wewW6ziXU6X4XRSg8ZBV5GCrO?=
>   =?us-ascii?Q?8fnfdzjlS6PA7l/PIyn1zWrZuWu6nQ4L36Y9wj/C87AVZILidkuJazpp9Rbv?=
>   =?us-ascii?Q?u3N6IWA9LpSF2defZknYoGJ2JjBHThmzOfQ9p1K2W+yqUR4TOgr+kOsHfMe+?=
>   =?us-ascii?Q?vX8STvyKsIp3KivMGfKXmW1z3ZeWA/MqDosANrVd?=
> X-Forefront-Antispam-Report:
> 	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(34020700016)(36860700013)(1800799024)(921020)(12100799066);DIR:OUT;SFP:1501;
> X-OriginatorOrg: ti.com
> X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:21.2968
>   (UTC)
> X-MS-Exchange-CrossTenant-Network-Message-Id: f316d639-b98b-4b00-07b3-08de1d3b026a
> X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
> X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
> X-MS-Exchange-CrossTenant-AuthSource:
> 	CH3PEPF00000009.namprd04.prod.outlook.com
> X-MS-Exchange-CrossTenant-AuthAs: Anonymous
> X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4137
> 
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> For am62 processors, we need to use the newly created clk-ctrl property to
> properly handle data edge sampling configuration. Add them in the main
> device tree.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index a290a674767b..2b6c033ae393 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -77,6 +77,11 @@ audio_refclk1: clock-controller@82e4 {
>   			#clock-cells = <0>;
>   		};
>   
> +		dss_clk_ctrl: dss-clk-ctrl@8300 {
> +			compatible = "ti,am625-dss-clk-ctrl", "syscon";
> +			reg = <0x8300 0x4>;
> +		};
> +
>   		dss_oldi_io_ctrl: oldi-io-controller@8600 {
>   			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
>   			reg = <0x8600 0x200>;
> @@ -801,6 +806,7 @@ dss: dss@30200000 {
>   			 <&k3_clks 186 2>;
>   		clock-names = "fck", "vp1", "vp2";
>   		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +		ti,clk-ctrl = <&dss_clk_ctrl>;
>   		status = "disabled";
>   
>   		oldi-transmitters {
> 
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Return-Path: <dri-devel-bounces@lists.freedesktop.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
> 	aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C57CCFA05
> 	for <dri-devel@archiver.kernel.org>; Thu,  6 Nov 2025 13:47:13 +0000 (UTC)
> Received: from gabe.freedesktop.org (localhost [127.0.0.1])
> 	by gabe.freedesktop.org (Postfix) with ESMTP id C90F310E8DB;
> 	Thu,  6 Nov 2025 13:47:12 +0000 (UTC)
> Authentication-Results: gabe.freedesktop.org;
> 	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Ix9Yy/a0";
> 	dkim-atps=neutral
> Received: from SN4PR2101CU001.outbound.protection.outlook.com
>   (mail-southcentralusazhn15012045.outbound.protection.outlook.com
>   [52.102.140.45])
>   by gabe.freedesktop.org (Postfix) with ESMTPS id 77CE510E8D9
>   for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:47:10 +0000 (UTC)
> ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
>   b=obPqgQ+xb7bkMZ6kcbQyNTvsgRGIcxYO96liROm/j6cw6q9XbmOaVMrQ/4xNDXw8gFNY85QGYxmVkOjXleA8p1IevyGP6dpMrwpz13+V9Otce/f/zbfVctyYGCLa2TLrp3vZjgDBLgO6NY+1slq/+UiUIEc4TFr63+dtCn/HkdnEpAu02Vry98Qxr6OeptL+m823vL7OqNsTUaD5o5gwtYfdBCdUoLEvQThLrmwY2A54uMi21B6MjNfCqXvS9KzTJS9b+vTpCotPF2F4r4PxsHVPub8xlshYUHemtKUFCEU/NUgCZMCL6QgGK4iadVkkAaHTCeM4cZfVDZC5ud/gVg==
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
>   s=arcselector10001;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
>   bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=;
>   b=yL6VDDKQeN3UU1jQjcKIl/1NoiUmJywNWOOoUQSC5wJMXNFoMPQ63T2nbDCWWxUEQ1HZAYtFJF2FlGfdK1NEpvyc2Bm7OtAKG4EzVeRFvzd9FNBxnG5SJQYqSOT8sUHQlXvsLXbt2rCQ9lwgeAWVyCvDCO30xXPEZP6vfsMT4pNQBQXrVlawye6OgSI6N8pknsJTwQRU4rXY8BmO6Rrs7QDxzMoDgVkBB8Pu/cLeH/7+ipOJRMBYeFkk2pH73feZF7Od+XDY1e4snpo7lsVZD/pRyGKXyxeIH6u8YmVPp48/++reGEuP+PluFJfUgIlc/0I7blrwnxkapcr9oQUcrg==
> ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
>   198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
>   dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
>   dkim=none (message not signed); arc=none (0)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
>   bh=DPOkf2Z1yJrHEk4dyUUDc+c489fyDR3ZN2dKspwuuPY=;
>   b=Ix9Yy/a0FCc/WH8ID0ntenOSPxcA1Ir/dV5sA03Q5v5UJfI+C296IGxJxQ/L6PPSvYOFmPiIesZpXJM2wsMesUbmBTTr3LSDcWoZiNRTbXZaJLPRj7WHIswj4jynWBVqqigIHHFZZyVb+OyJVL0a+jUtn1jhSRlnN9jhRc0Sw8M=
> Received: from CH0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:76::15)
>   by DM6PR10MB4122.namprd10.prod.outlook.com (2603:10b6:5:221::19) with
>   Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
>   2025 13:47:08 +0000
> Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
>   (2603:10b6:610:76:cafe::1b) by CH0PR04CA0010.outlook.office365.com
>   (2603:10b6:610:76::15) with Microsoft SMTP Server (version=TLS1_3,
>   cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Thu, 6
>   Nov 2025 13:46:55 +0000
> X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
>   smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
>   action=none header.from=ti.com;
> Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
>   198.47.23.194 as permitted sender) receiver=protection.outlook.com;
>   client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
> Received: from lewvzet200.ext.ti.com (198.47.23.194) by
>   CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
>   SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
>   15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:07 +0000
> Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
>   (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:05 -0600
> Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
>   (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:04 -0600
> Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
>   (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
>   Transport; Thu, 6 Nov 2025 07:47:04 -0600
> Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
>   by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDY1301720;
>   Thu, 6 Nov 2025 07:46:59 -0600
> From: Swamil Jain <s-jain1@ti.com>
> To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
>   <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
>   <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
>   <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
>   <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
>   <louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
> CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
>   <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
>   <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
> Subject: [PATCH v2 1/5] dt-bindings: display: ti,
>   am65x-dss: Add clk property for data edge synchronization
> Date: Thu, 6 Nov 2025 19:16:48 +0530
> Message-ID: <20251106134652.883148-2-s-jain1@ti.com>
> X-Mailer: git-send-email 2.34.1
> In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
> References: <20251106134652.883148-1-s-jain1@ti.com>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Content-Type: text/plain
> X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
> X-EOPAttributedMessage: 0
> X-MS-PublicTrafficType: Email
> X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DM6PR10MB4122:EE_
> X-MS-Office365-Filtering-Correlation-Id: 33984d1a-a850-40e1-0c88-08de1d3afa69
> X-MS-Exchange-SenderADCheck: 1
> X-MS-Exchange-AntiSpam-Relay: 0
> X-Microsoft-Antispam: BCL:0;
>   ARA:13230040|1800799024|376014|7416014|36860700013|34020700016|82310400026|921020|12100799066;
> X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2RQHSq/l7eXIEskRInwrl/UHAAnzT6a7dpANEtlnv2kyno5HCXNRbkeqKLiF?=
>   =?us-ascii?Q?fBU6j6bqnmF180mAgad7WNdCvkte0DHfp4mzgNDHLijAOMwtN9YvnLcv69rh?=
>   =?us-ascii?Q?6+BkKoMjB756LgKsgyPAHBY9SMPhGSs0ijAb1POa7TIhRrKGbVR/xNMdmynI?=
>   =?us-ascii?Q?1Ic78h1MNV+h6RK5CxWZvUbm/x4Vumk6M6XlI6flAmMIbPjVW7BMmEn2ieEK?=
>   =?us-ascii?Q?GkExLJz+ALpN+lfz879bcRZWr718IjF2b0ZDcFuNkz1M23CDuWEqMRt8pl4m?=
>   =?us-ascii?Q?hnWr/iqqTT72mM9N0pC8NMaFnS18WzijqVXfvkYXS+AIXLJUmUyFbM4FuZi0?=
>   =?us-ascii?Q?8Ua2GF/Gkr13qzkqqI7SEso+WDiOyflumKFOxbcQaBePw50g7whd/SJ9pXDT?=
>   =?us-ascii?Q?rT+fGVghHqjO1GuIwOFOqayqD8R6xu3PUFNlZwSDoCSvIxEfcjkQfHyyGUUp?=
>   =?us-ascii?Q?UIi3/iml2y/zZ+Sb52bDxdB6e+5hDE/aUnNM0c6SvG0T6wZw41vtYQw09Yue?=
>   =?us-ascii?Q?DEBsOkt7RCpp37ijXauRExHIam8HRUeC66pwo8usdRyJX6YgiqEzbuTQUG4a?=
>   =?us-ascii?Q?nXo/t2hWYWSFG9N/j9iaV5ms9LujhFCmjqtvUis1aD6+GunTE9ks1Gd6spSW?=
>   =?us-ascii?Q?axaDo1JsV8i5cbsuxt8Z+54aveVnOxXaDYRrEMU2hxvYPFpPWSYZby67Fs4/?=
>   =?us-ascii?Q?FBHyIzkFBDvoR91eDPrQryUkhDJDbPYQquD5Te2M5bWs44KggbNTeJms8GL7?=
>   =?us-ascii?Q?29pb8JSG7zxKX30Svd9MLjKGzgKEu3csOiY4QZ04DRRhCg46+OwD4mfBbFPd?=
>   =?us-ascii?Q?YHx7XZj0RARTkM4ie/Ti+REVQQgjbMuj+54S98XdbhOxN01G8qWPymWtkROM?=
>   =?us-ascii?Q?O9T+lIKIH8oiOxFyryoa+GelbsAWi4rHWR20T/OtXmVKWwm3IVdkwv6FAQ8P?=
>   =?us-ascii?Q?+pGQ4qj7b5BFIHaw2gYwZkPEoIDlQip6TTuBInqlAKYn8VWLNaHVJ/v3dfca?=
>   =?us-ascii?Q?hRNnHPLfY9RJRNX29JpRv2dcc25VKaVf4NpSS+aPzrleUA9lkBzFAEhF6Km2?=
>   =?us-ascii?Q?nLy6aCTB60nVIN39/v3bCzNqLufW6ojR9UxqtK8TvbqNelX8a1OjTTcvb2/t?=
>   =?us-ascii?Q?xI9fmgm2qMvG0Oq/udmhj0otpWwLrL0kKissat+duSrbbK+7ks/BTIhLPo41?=
>   =?us-ascii?Q?88wZ1Zcvmk2NjQ06AuVoV0Xibq6/CxtjCgdmB5zJhB92yBBxescQRm4VRL4o?=
>   =?us-ascii?Q?DLsZ/PTtivmKojnckuGQg/ZsK2MdhMIxctXEM1XLM624aj+VFD0LNUUJiKhi?=
>   =?us-ascii?Q?+RUwstam4SbpM60+SaQmmobszbuzWaXnB2g6LdUqhVzLHkLLGjgTqkwpBbfa?=
>   =?us-ascii?Q?XvrJqzJ7C28SW11Ae/BEHXT8S0W1spfhn2NF4h8+AlybVg6cnZl0iMRKClIs?=
>   =?us-ascii?Q?53DneeRYG+zoGh8OOBfatp3FHHSCJ/gCfMrPcOiV4H0radxgjuMsQmkSP/Zo?=
>   =?us-ascii?Q?G8DA+yCy8UseQL8cuogjaUa8QzfUnkJL3KWsqcxJrUC6XvCs+th317AEF1Sq?=
>   =?us-ascii?Q?kdcd0ty4xRRUpNXAwpiinwE26Bn0dfnCr0c61LRr?=
> X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
>   IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
>   CAT:NONE;
>   SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(34020700016)(82310400026)(921020)(12100799066);
>   DIR:OUT; SFP:1501;
> X-OriginatorOrg: ti.com
> X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:07.9237 (UTC)
> X-MS-Exchange-CrossTenant-Network-Message-Id: 33984d1a-a850-40e1-0c88-08de1d3afa69
> X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
> X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
>   Helo=[lewvzet200.ext.ti.com]
> X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000C.namprd04.prod.outlook.com
> X-MS-Exchange-CrossTenant-AuthAs: Anonymous
> X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4122
> X-BeenThere: dri-devel@lists.freedesktop.org
> X-Mailman-Version: 2.1.29
> Precedence: list
> List-Id: Direct Rendering Infrastructure - Development
>   <dri-devel.lists.freedesktop.org>
> List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
>   <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
> List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
> List-Post: <mailto:dri-devel@lists.freedesktop.org>
> List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
> List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
>   <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
> Errors-To: dri-devel-bounces@lists.freedesktop.org
> Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
> 
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The dt-bindings for the display, specifically ti,am65x-dss, need to
> include a clock property for data edge synchronization. The current
> implementation does not correctly apply the data edge sampling property.
> 
> To address this, synchronization of writes to two different registers is
> required: one in the TIDSS IP (which is already described in the tidss
> node) and one is in the Memory Mapped Control Register Modules.
> 
> As the Memory Mapped Control Register Modules is located in a different
> IP, we need to use a phandle to write values in its registers.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml        | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 361e9cae6896..b9a373b56917 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -133,6 +133,12 @@ properties:
>         and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
>         interface to work.
>   
> +  ti,clk-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to syscon device node mapping CFG0_CLK_CTRL registers.
> +      This property is needed for proper data sampling edge.
> +
>     max-memory-bandwidth:
>       $ref: /schemas/types.yaml#/definitions/uint32
>       description:
> 
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazhn15010016.outbound.protection.outlook.com [52.102.133.16])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6CC329E5F;
> 	Thu,  6 Nov 2025 13:47:29 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.133.16
> ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t=1762436851; cv=fail; b=heRqP1F/i1ZEs50XYhVxNHYFqlXKfdK/u0d18AZ2FcQBREzOcy9mJ/cVfNTtEd/ICybm7RrU8qsCt/9rGiyTgyxT6LvdhvSPMMGSo6M58QmHqgaLyaNHVpd1O0n2RQrMelFIIRGFWMyKPjCS9Lm63WhEuSYAq1O7d/Z1U0IRg4E=
> ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
> 	s=arc-20240116; t=1762436851; c=relaxed/simple;
> 	bh=VlnW1+/r6zB+StaVokUdiMaeaqsmdnAGxSjhx4fztzs=;
> 	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
> 	 MIME-Version:Content-Type; b=dKC+2QFq65vl4ujCDX4IiJd2KYlenHXh2wK+s8S6tXHUx4pp3mh/WOtqCRkBGURw3ODqIgwrN/FtWe12hs6liRfGacSQUo0vsOeWmjteV4L0dKdme5W27lOOFaj4oByDewbigcMr7BtppMh9eal2+mxFjsAp2pY4GZP4sipmn6Y=
> ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NwG24bTI; arc=fail smtp.client-ip=52.102.133.16
> Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NwG24bTI"
> ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
>   b=aXx79PA82MyGNHdBwAWZaN1+ID1pZ8gTzVkPS4zqzh2f40VTZ0jBOxGQYeklNWKH/voJP5TSjGAT5nknxpsmXG9xi84QvZT2Aahro88FL5Ubx5n69pD07vhemmEf+a+m1iwB9nYex6JNXfB9XuwB/d3gWcsvk++MZMaLq/XIDeINdzCK/JcBTJkGecj41ERmWKVQVgBGMdA1DiiWgMyFdsKaFyhyRwXO/M1e5ACy5qSr9uKLWzKqx5Yvr6BpoX2bgxbv4+GwBpKvA8FVG5aJKdmFRHMN8pPOWpqT3gCutxq4/VtU7DCHV3fDQR8ojK2bYK2E+fQNwsNo1244J3WXhQ==
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
>   s=arcselector10001;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
>   bh=FvjQ34tEKk6TlSM12t43K0+W3g5wjGZVzj6ghfXpzOE=;
>   b=GXhISSBXDx/seEJlT8H5TbDr3bE7k2pJE9t7O9XXB1WDE62nsQUJqb2ActcYRuNQJUx+ZwVA5M8hTZnVvMbIMjxK2FgUduiL0f2fEQdsQu2Pd7Y3XvhezvvYgynGn35Oe+7YCbVzwYvU/FoPu2M2NZUax/ZPDf7/bSvgyZuEXaXtthRcNSXOcLNEhvcKAGD6OeeDbmicJX/TUpD7iSwcSmHDJe1F4N94iC8bIqpb1Mmk3i598/fnUh4e6L4URBqms/U6AeecBvbdgafkR/BJxZEfpu0c0/s+FD0EhkOxDftsZrduZyqVD6dXcTgha3Ld2QMprfHMnRFH3NoqtwpV/Q==
> ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
>   198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
>   dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
>   dkim=none (message not signed); arc=none (0)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
>   bh=FvjQ34tEKk6TlSM12t43K0+W3g5wjGZVzj6ghfXpzOE=;
>   b=NwG24bTINHBZKfbBdvmB5/MmWzQhnsvlzHHbGBanS5WOvpx29gryFjqmiN8Dkl0q8KMAfMUYXCJLCA/J7SqmL35hxeCLVAOVeVevYjO46cTFdOZJC9fyz2BCZKmLEUsNxja7Sip/XC1rS1FweW6mo1cmm9hlvbD2FnP7Y1AZw6Q=
> Received: from CH5P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::26)
>   by PH0PR10MB4598.namprd10.prod.outlook.com (2603:10b6:510:34::8) with
>   Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
>   2025 13:47:26 +0000
> Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
>   (2603:10b6:610:1ef:cafe::2f) by CH5P220CA0005.outlook.office365.com
>   (2603:10b6:610:1ef::26) with Microsoft SMTP Server (version=TLS1_3,
>   cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
>   6 Nov 2025 13:47:24 +0000
> X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
>   smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
>   action=none header.from=ti.com;
> Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
>   198.47.23.194 as permitted sender) receiver=protection.outlook.com;
>   client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
> Received: from lewvzet200.ext.ti.com (198.47.23.194) by
>   CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
>   SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
>   15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:26 +0000
> Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
>   (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:23 -0600
> Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE215.ent.ti.com
>   (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:23 -0600
> Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
>   (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
>   Transport; Thu, 6 Nov 2025 07:47:22 -0600
> Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
> 	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDb1301720;
> 	Thu, 6 Nov 2025 07:47:17 -0600
> From: Swamil Jain <s-jain1@ti.com>
> To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
> 	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
> 	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
> 	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
> 	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
> 	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
> CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
> 	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
> 	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
> Subject: [PATCH v2 4/5] arm64: dts: ti: k3-am62a-main: Add tidss clk-ctrl property
> Date: Thu, 6 Nov 2025 19:16:51 +0530
> Message-ID: <20251106134652.883148-5-s-jain1@ti.com>
> X-Mailer: git-send-email 2.34.1
> In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
> References: <20251106134652.883148-1-s-jain1@ti.com>
> Precedence: bulk
> X-Mailing-List: linux-kernel@vger.kernel.org
> List-Id: <linux-kernel.vger.kernel.org>
> List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
> List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Content-Type: text/plain
> X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
> X-EOPAttributedMessage: 0
> X-MS-PublicTrafficType: Email
> X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|PH0PR10MB4598:EE_
> X-MS-Office365-Filtering-Correlation-Id: 9e0dc3f3-fff2-42a6-378d-08de1d3b0554
> X-MS-Exchange-SenderADCheck: 1
> X-MS-Exchange-AntiSpam-Relay: 0
> X-Microsoft-Antispam:
> 	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|34020700016|36860700013|921020|12100799066;
> X-Microsoft-Antispam-Message-Info:
> 	=?us-ascii?Q?LVdbGlBiVGhr3Ixfg+Y1prrL711pWvK14iHkpVR4YlL0J2zlc/PNEGGChXST?=
>   =?us-ascii?Q?vhO9pVm97ywy5b8WgM6z/sGQ1Ntcvj6s/ntt8FsS11HGj7Ic1HwgxE9vtj7b?=
>   =?us-ascii?Q?vGZj6E961mnVRC87c8ZrdGTOsdH3H9SBZ3QjftIC3kg2SmyxagIm6Jn4V5xW?=
>   =?us-ascii?Q?HFwJ56gjUTdusJuA0XIFq0ypRYGXTE6DK1L15PVh2Uqvehjyiodqy8UEBD3w?=
>   =?us-ascii?Q?GLdyQ10H3bTiiIUiAnbCVPMAdLqAYFLO8WkuJdzUYYjnI+Y19PkvSKEoxOJw?=
>   =?us-ascii?Q?RdyMOQmdDZPZEdJt+fPgYIIXVnerpaZp32mtF3T8Y7DCv+XwGyDvx7UV6jYf?=
>   =?us-ascii?Q?rFE8NiLTE1Pp7p6W6h0yv/S9ibMp6Wq1T/Tx9ivew17RaBCoo1Ny8n8FegZN?=
>   =?us-ascii?Q?+bOu8CDrM/rXHqEmtpFzAZRPBlfZenzbj5f/W+RGH5YNDkWu8vMMqs0j76Sv?=
>   =?us-ascii?Q?6iN7Y6DF9DVl1LZws2GoBAM/3Yy834Cs0AW9d4M6t11luqrfUCE2FocRd05R?=
>   =?us-ascii?Q?wDHVTP93Xpyy5Y9K6PC+XHhefQNq4O7p0D+fVmkNpy1F6DdZ5uNbSfD7B61Z?=
>   =?us-ascii?Q?KICKPhkUwodPeby+QKQz7ULc58mQ9BUHsvrlYU2ARB87vUO/iTtmHnL37+jT?=
>   =?us-ascii?Q?/6lsLTD54KrKDgmRfXoJVlhHMwmevP03Uy7Ygg0OrTiVcf0URMcjy+Od9ucx?=
>   =?us-ascii?Q?uFvDXDbPbT1xxQQ0Tu1whvmBcuWZzLDWfALDY7gjiRU+C0dvkyp/s75lN3Uz?=
>   =?us-ascii?Q?0gXFJ1DMzdxpOK7KxpfDRWkVUfDElcSWVg8MR4bFBwt1xjbKz/PHQ/V+uzD0?=
>   =?us-ascii?Q?tP9TNjpugKncQAOXAOKtArwzr7U7AKaeW6ZOrWt2U2nRZIghdUXyBrPjinPJ?=
>   =?us-ascii?Q?IK78kMVW9tskOdxWIAR9kWqjUfcrZz6GDs/pgAnjLstB/Kf/zfOI+H1sFggm?=
>   =?us-ascii?Q?SAdRfw/XH/tuplgK2LLCI2Bg2UNrsYb3c76iN0eoW6ENbc0CoNgFIxN3gbdG?=
>   =?us-ascii?Q?eXQb0hULecNTpMX/djFrLKlFzclKQTIY/yiyICjJ1ScxPPL2tSH4mirgW6eC?=
>   =?us-ascii?Q?XDrCyWHOW3u8Vb47ri+3HWsb/PVeXuI+RvvsZ2apntPHIdW66qjzuorX1aKR?=
>   =?us-ascii?Q?36EfnSrXMrCihP6yVMQ+Xfxs23xC57pzmilnQy1jWc7wZCHPxz4EmCAGeTLQ?=
>   =?us-ascii?Q?qCLS/+f0YK4Ep8JgKv8cjTGQo+3gSrY0ts3M3MjVxGNdSSoKUmtVEoPvfb6Q?=
>   =?us-ascii?Q?Vp4ZXTkp4raHkAkRhZkblG28aF8J+Ki/dWBj2SJVw8BNOZ9pzCUopXW0Lspx?=
>   =?us-ascii?Q?HoRmm8fXsHQkAV/zU/f/foUlfNqDHOxgO8HYaPsXwGZ9uCM57RF+0Y8VVZdc?=
>   =?us-ascii?Q?9Bv6Dror3LZtEGgwwNoAJrdoT7WxMqXMCrpAabe2siUc4d0JTI33b9NcYvs3?=
>   =?us-ascii?Q?yW0ojZyXeuz46cL8dXkqArtRNfhWmlptsDfNfhUO+sMHozJtTIQ+RGGEUBDE?=
>   =?us-ascii?Q?mTrVRIlxWPHuhVjiAWTjP+f10fMluFcDIag14R5dzTAw9noYebQsFgX3w6L+?=
>   =?us-ascii?Q?RT3g5hR1T3zB/jiPslZQyUcVJlJiV/lZZ4r1EMfp?=
> X-Forefront-Antispam-Report:
> 	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(34020700016)(36860700013)(921020)(12100799066);DIR:OUT;SFP:1501;
> X-OriginatorOrg: ti.com
> X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:26.1835
>   (UTC)
> X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0dc3f3-fff2-42a6-378d-08de1d3b0554
> X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
> X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
> X-MS-Exchange-CrossTenant-AuthSource:
> 	CH3PEPF0000000C.namprd04.prod.outlook.com
> X-MS-Exchange-CrossTenant-AuthAs: Anonymous
> X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4598
> 
> For AM62A, we need to use the newly created clk-ctrl property to
> properly handle data edge sampling configuration. Add them in main
> device tree.
> 
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index 9e5b75a4e88e..15a9ee35dbce 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -77,6 +77,12 @@ audio_refclk1: clock-controller@82e4 {
>   			assigned-clock-parents = <&k3_clks 157 18>;
>   			#clock-cells = <0>;
>   		};
> +
> +		dss_clk_ctrl: dss-clk-ctrl@8300 {
> +			compatible = "ti,am625-dss-clk-ctrl", "syscon";
> +			reg = <0x8300 0x4>;
> +		};
> +
>   	};
>   
>   	dmss: bus@48000000 {
> @@ -1136,6 +1142,7 @@ dss: dss@30200000 {
>   			 <&k3_clks 186 2>;
>   		clock-names = "fck", "vp1", "vp2";
>   		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +		ti,clk-ctrl = <&dss_clk_ctrl>;
>   		status = "disabled";
>   
>   		dss_ports: ports {
> 
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazhn15010018.outbound.protection.outlook.com [52.102.128.18])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F314E3321B9;
> 	Thu,  6 Nov 2025 13:47:36 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.128.18
> ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t=1762436858; cv=fail; b=FTgorfYoooRcEkoEkJ9qqZQ0Uhfb/nAKOZjXhuS4ZA6uBU3rAeon5rBCWa11G3ttLrpI5u/HKKQSQoA7WQepVCDL2gmbgBVtPDi0bVYVgzpPiwuWvtsn+e/4pde4TIjT+9UO4hOSluzV9i8uOeKGOSe4SKDM5omzvAXPWLUUrqM=
> ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
> 	s=arc-20240116; t=1762436858; c=relaxed/simple;
> 	bh=edyKTNo6LdBH8aX0gpXwILlM7nEA+lvqqMqlvAHp4P0=;
> 	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
> 	 MIME-Version:Content-Type; b=mV9lvvJjjvRlA8Nnt4WieR6ECvytAyyQjmaoLM4Y2+/QvFfP/P4V66eqCvJhvQEq6W6ytZ1zvrGaBGBu3a6zz/vObwWmC19BQiHl1pHuaMJKiNvV0JBiN5KxlRD4Dhlq3czF1CQqB0YSKPQCYddVMNMue5bfFye/eWZtAZNDSKk=
> ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IESVYPaq; arc=fail smtp.client-ip=52.102.128.18
> Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IESVYPaq"
> ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
>   b=nI9/g68Lx3Pehq5q12DpzIa6gmpb5uQea9UQrmEEtDoNhcwYGnNA1xX+/K65OSRjaRn+fQCOh0oXkDGN2jPNxxvq51cYH9WVSzwfB3wkHjtdtziXDKwVeQKMhsXt/Ox0EOvOA8jFStUL51f5GvduYUgLtXV7GL+rbwNjL8asCGavO+Y4h2Aj4Wug9tM29APSXJAxOXh91Pg22KzdSewcT+DoHZrshlxYNkekhy9GOuZJotaXcp6zkfrC7m3jBuz8VP/VZswZ4JNSX6roZG9ZqRjR4rIY2pGkb0YPfsSzVo9hOlwR+RW4Chf4UjgUc0xelAMQk/nbx0Qy9AACC1Q1wQ==
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
>   s=arcselector10001;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
>   bh=wwlKsDXAyd4qlaamF8RAvN3x3zyji7/h09GYHZOJ980=;
>   b=dP8RfvDPHIKIokSxXgKBZ16xvLHqMCYk/7iD33Pc54kItS0npAIMoUputdIiWNFLaQapD1OIaob0J3Tg92cv6N8tMaNYEjWs2vxwYpm5Eknqzz3uWisIkdZdRSaxWfC9Kiyd79I4FaEDAHiZ9ATOTxbg+EOzTDkul7smokJqEpVFi0QPhnFVl1xI+zomoONuEWBeCWvJfGEAOT6rvNG0cVKD+DAAstcQaO9rJ70waIljjBTm7+SF8UwyCx9JEQK0wuM1hbeKxh/19QV7SXKJcJLFB7VbI/d11OUoYp2Tb0uNnBZK2RxeMApjbYdSM0j595KyFZOHC3QOVrcSBBCN0A==
> ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
>   198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
>   dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
>   dkim=none (message not signed); arc=none (0)
> DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
>   h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
>   bh=wwlKsDXAyd4qlaamF8RAvN3x3zyji7/h09GYHZOJ980=;
>   b=IESVYPaqNqHAju4ewz0ToE9lyQJhfjpw95AqHCBseYKWRBEchnqHWXaV0/oeIPzch0gF7odJHO+B0K9X0RxQbwE3lzuj3tf9paLy4N/JdagM5F70Df50B4Pakz8YKTNML5371xuFG38ukQtowmQRNZX07w5dJtuhkr0Jxyx6uN4=
> Received: from CH5P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::8)
>   by DS0PR10MB6872.namprd10.prod.outlook.com (2603:10b6:8:131::16) with
>   Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
>   2025 13:47:34 +0000
> Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
>   (2603:10b6:610:1ee:cafe::60) by CH5P222CA0004.outlook.office365.com
>   (2603:10b6:610:1ee::8) with Microsoft SMTP Server (version=TLS1_3,
>   cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
>   6 Nov 2025 13:47:30 +0000
> X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
>   smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
>   action=none header.from=ti.com;
> Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
>   198.47.21.194 as permitted sender) receiver=protection.outlook.com;
>   client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
> Received: from flwvzet200.ext.ti.com (198.47.21.194) by
>   CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
>   SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
>   15.20.9275.10 via Frontend Transport; Thu, 6 Nov 2025 13:47:33 +0000
> Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
>   (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:29 -0600
> Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
>   (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
>   2025 07:47:29 -0600
> Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
>   (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
>   cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
>   Transport; Thu, 6 Nov 2025 07:47:29 -0600
> Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
> 	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDc1301720;
> 	Thu, 6 Nov 2025 07:47:23 -0600
> From: Swamil Jain <s-jain1@ti.com>
> To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
> 	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
> 	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
> 	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
> 	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
> 	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
> CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
> 	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
> 	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
> Subject: [PATCH v2 5/5] drm/tidss: Fix sampling edge configuration
> Date: Thu, 6 Nov 2025 19:16:52 +0530
> Message-ID: <20251106134652.883148-6-s-jain1@ti.com>
> X-Mailer: git-send-email 2.34.1
> In-Reply-To: <20251106134652.883148-1-s-jain1@ti.com>
> References: <20251106134652.883148-1-s-jain1@ti.com>
> Precedence: bulk
> X-Mailing-List: linux-kernel@vger.kernel.org
> List-Id: <linux-kernel.vger.kernel.org>
> List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
> List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Content-Type: text/plain
> X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
> X-EOPAttributedMessage: 0
> X-MS-PublicTrafficType: Email
> X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|DS0PR10MB6872:EE_
> X-MS-Office365-Filtering-Correlation-Id: 81430622-eb84-4c26-0451-08de1d3b0979
> X-MS-Exchange-SenderADCheck: 1
> X-MS-Exchange-AntiSpam-Relay: 0
> X-Microsoft-Antispam:
> 	BCL:0;ARA:13230040|7416014|36860700013|34020700016|1800799024|376014|82310400026|921020|12100799066;
> X-Microsoft-Antispam-Message-Info:
> 	=?us-ascii?Q?j/weblWjRoAT7rTtS8dkb1XYoK5qab4WjCYrXMfoefRvIZ0yEVs2k28XXGlb?=
>   =?us-ascii?Q?yd4RsIwaYZYfq7LDm64r0TXwpznxjpYs9umyEYZm1gKOvMWaDr8HDuFAtZPS?=
>   =?us-ascii?Q?xYdJHH1kL3a614Sy7fFoJfEQrv0NrEuzklVRX3HMtb7KGViQBWgGw2zx44Lz?=
>   =?us-ascii?Q?jIUNLCvG77d8ExbJUtuWwEcF1W2YzAyKMZHYnexZt87XAUo7NPA956ptMWQ5?=
>   =?us-ascii?Q?mVDpNR+6kOjnc1uYl+36FT2S+stwSNBXH9HPKYySgqDtTb2eac6OH4SgSpGu?=
>   =?us-ascii?Q?i9AV2JcCsF3M/xUwJaO4bLFzCydNsYdVxkYtlKdNo0OQlBKhg8byTITF/Z1h?=
>   =?us-ascii?Q?h0AMd5tDVIIAjELS0jm4BKB8SPEAEPvknODx2oeEDDq0CInYuzXfF4m6V9dW?=
>   =?us-ascii?Q?va3TdQDIwfvetNv5OA9i+sLSMfLsc238enX4DiUlfCdJWqLS188Jla3tBGpL?=
>   =?us-ascii?Q?DOEaXFdGosQrnA3biVY82uCPlixGY4rELzA9qnFz45PRSxjcpkopwrt18EDf?=
>   =?us-ascii?Q?LPt0T9Q3fijBB6mhU1G3q0vSQ/UKlhubJNKUzYrY2qeXT3da1YbWyO1iha9c?=
>   =?us-ascii?Q?6yzlSrtnxo5uOGUVeNY4ZlfwX4iFpZcqE8RwbhseqzsEC804l+Zk04MnQThT?=
>   =?us-ascii?Q?3ew18Gb2rFcclsx1pNFv0HsobU3LFGyaRjTEMP6qiCSYJsp3bMlg95wSWjxP?=
>   =?us-ascii?Q?1Qo86zSl9LfhL2h2B9FVSbiapjfJDIZzlkjSBYuwGUhZZxCXD2q7Yn/OfOP+?=
>   =?us-ascii?Q?XnP2JqHxIwUR8I1q5tnK1D5Jrmhw5ops/JYI2fDhLVIiHfk70xjnS3RZCEeP?=
>   =?us-ascii?Q?rMPGASEyBN+CvpG7dgoe3EFgiVNps8w+LxRr6cW0x9vjfdmmEtQwNHZMHTPo?=
>   =?us-ascii?Q?a0Obh/7DCFb7tNMLsYXese4VDB3Q9UdCxDoUxPcJ9JLsbU+IgIy/Wk62dvFh?=
>   =?us-ascii?Q?OfFQPul5XEf+dBj7euTSh/PuepQqlXB1B4G/xSzhxwskRFMsq+wFYuaEIcUi?=
>   =?us-ascii?Q?/LpirS6fdw+eXM/j49vWHVKaFTXKJSNmynyxeWJQ0ugCk8WJqTd2vuAz81ZE?=
>   =?us-ascii?Q?SGu3uzXOGbMrFJvp8ZgdbPeHzYi0Wd7WofuPIrpk9OdnFPC42GA0ZshsN8Qa?=
>   =?us-ascii?Q?2berh9dBzRaXhDFeRP4HqTwOBpltFsbCo5jddalEChzKyRRZlh6OSgX3jQNB?=
>   =?us-ascii?Q?agBIZXiAjRZkB77/j7Xh8GYG5Gi/ImcRc74HGGwurM7P7rrc9rYjYoW8MS2i?=
>   =?us-ascii?Q?k15AmRWusB+xeO6fgH/fiHvQ6tANM0KCu3QYQ80FXFLOED3ZPIfhbnInip+y?=
>   =?us-ascii?Q?wM5NsK2JBX4S/uSIx1LToY9NYLgf8s3+P/9ur29jz2lSalfjdERMcuBUCXHT?=
>   =?us-ascii?Q?kVGZsKAchebmz1hsDTV8wuY8m+O8tgiVLYAUU3jNShsJP2mT5XfqPEbpxkgW?=
>   =?us-ascii?Q?abaGJk51Vjr5bYl9cCK9GFNgX205ZN8dz0jIdHlIkhxmnLeexRXBlC6ZAyL9?=
>   =?us-ascii?Q?FBg1TtFhvJnQH3GoZYcjElm1kdy02Pc7n0xKlQ782+Sm/HSPoNkbRPuvsj4f?=
>   =?us-ascii?Q?MgUyg/paS0hYZzAdfFJ2OL7kmUHE9CL/mSn0/uBB?=
> X-Forefront-Antispam-Report:
> 	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(34020700016)(1800799024)(376014)(82310400026)(921020)(12100799066);DIR:OUT;SFP:1501;
> X-OriginatorOrg: ti.com
> X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:33.1349
>   (UTC)
> X-MS-Exchange-CrossTenant-Network-Message-Id: 81430622-eb84-4c26-0451-08de1d3b0979
> X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
> X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
> X-MS-Exchange-CrossTenant-AuthSource:
> 	CH2PEPF0000009B.namprd02.prod.outlook.com
> X-MS-Exchange-CrossTenant-AuthAs: Anonymous
> X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6872
> 
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> As stated in the AM62x Technical Reference Manual (SPRUIV7B)[1], the data
> sampling edge needs to be configured in two distinct registers: one in the
> TIDSS IP and another in the memory-mapped control register modules. Since
> the latter is not within the same address range, a phandle to a syscon
> device is used to access the regmap.
> 
> Configure the CTRL_MMR register, as mentioned in the Technical Reference
> Manual to fix sampling edge.
> 
> [1]: https://www.ti.com/lit/ug/spruiv7b/spruiv7b.pdf
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_dispc.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index d8e1a1bcd660..d09eecb72dc0 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -500,6 +500,7 @@ struct dispc_device {
>   	const struct dispc_features *feat;
>   
>   	struct clk *fclk;
> +	struct regmap *clk_ctrl;
>   
>   	bool is_enabled;
>   
> @@ -1234,6 +1235,11 @@ void dispc_vp_prepare(struct dispc_device *dispc, u32 hw_videoport,
>   				  mode->crtc_hdisplay - 1) |
>   		       FIELD_PREP(DISPC_VP_SIZE_SCREEN_VDISPLAY_MASK,
>   				  mode->crtc_vdisplay - 1));
> +
> +	if (dispc->clk_ctrl) {
> +		regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 : 0x000);
> +		regmap_update_bits(dispc->clk_ctrl, 0, 0x200, rf ? 0x200 : 0x000);
> +	}
>   }
>   
>   void dispc_vp_enable(struct dispc_device *dispc, u32 hw_videoport)
> @@ -3003,6 +3009,14 @@ int dispc_init(struct tidss_device *tidss)
>   
>   	dispc_init_errata(dispc);
>   
> +	dispc->clk_ctrl = syscon_regmap_lookup_by_phandle_optional(tidss->dev->of_node,
> +								   "ti,clk-ctrl");
> +	if (IS_ERR(dispc->clk_ctrl)) {
> +		r = dev_err_probe(dispc->dev, PTR_ERR(dispc->clk_ctrl),
> +				  "DISPC: syscon_regmap_lookup_by_phandle failed.\n");
> +		return r;
> +	}
> +
>   	dispc->fourccs = devm_kcalloc(dev, ARRAY_SIZE(dispc_color_formats),
>   				      sizeof(*dispc->fourccs), GFP_KERNEL);
>   	if (!dispc->fourccs)
> 

