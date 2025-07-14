Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F77B034ED
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 05:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A8E10E1E1;
	Mon, 14 Jul 2025 03:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RZE5jaXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE4210E1DD;
 Mon, 14 Jul 2025 03:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZWg3jRULkCgvSt45dkww+CXItKW6URbN0WTPpKKLWCNt+vWWcCO1p+KRRTDJPURZ6yzlfvcxn4ebC5OHvCy4RGCEDYPDigLxeMEXu4qOBuivUPygCpn5jXrKuJ3u2VOiJyNjjhTk08TFK2Z7xvz5rK2OkI+Gf2ULf7RI+t8sXsan6tA7JHFP2E5pXYjexKsxf4ZxMwjuNPJ/H7/5VOYG2/SgiuRvy/LYyYvzd809VejmwbuS26q+xRBIlYsk+32TIl9FJgOcGH91SAfLxMTPVSgdpXOzowuJr7qoxoqB/P+WM487DhVXLl3jJUT0UZIXgqJbo7WLAwPN/5Z00iKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N19n83tbiKQMjFajx8974A1bKIMGtZbsIn9wxbGQLHk=;
 b=V6LNWpmMfBPJN/0O161tDg2gxR6vbfW+MHiY/BNobZLtgFHhHcH/2dQRhkTXU2rEKYSdSfX+9X1N0x6HPUP8lo+FCzYFTdMzQZRr4sv9TQ7wo19wWRDpt1IEro9bJ7yaqsMAbaleDUEA4sNDXCUxaXrIeETitwzonY8lkD+Bj9AFz4lixivOCSYy7dlwbABlsKl/Ka0Fyr46Q2yxy5QrzX8HOB+LcfQFdosp9kJ/qi/ymRsIhlYd7BikSCmpxJIbNZWmn0Pr7Xn13tkHLfasHFueNk3yEazSFLOBnjigObMI3WfLvY06q1FZw1vC4acL1OLG4ZePxfARrldJuP/f5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=darkrefraction.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N19n83tbiKQMjFajx8974A1bKIMGtZbsIn9wxbGQLHk=;
 b=RZE5jaXjtZmTZGApgBI2KREYePeGbLkaD3g2RzyoqyAxhiIv7rTZ/hjW3k9HepIX8ay/kaoA009FM7Da3+9q3orta3nbLRxrfroNA7XZk05YSswssKaec1S9OO6qqDFjgDwOotaxwtO05/XC10dVi0x4mHDlHTHX83BDvG2ssQDZQrkw+ZoGLG69X5tUSrw6UCbvjAGMpab+bJYmoLAh/9ZCsKjHFsvPOouLKgT8ko7uHALjMjeEOA+hCKoKYC5TDU1KAOjN8+Y2agvT+LlIBlIjVxCPE/A7xGZXLbbmCBZEbvGrSaP+b4COyNenQ4D6MeIbgu6bu5r9MneAZg8o9A==
Received: from CH0PR03CA0371.namprd03.prod.outlook.com (2603:10b6:610:119::19)
 by LV3PR12MB9260.namprd12.prod.outlook.com (2603:10b6:408:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 14 Jul
 2025 03:19:32 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::5d) by CH0PR03CA0371.outlook.office365.com
 (2603:10b6:610:119::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 03:19:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 03:19:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 13 Jul
 2025 20:19:22 -0700
Received: from [10.2.185.45] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 13 Jul
 2025 20:19:20 -0700
Message-ID: <3c368bab-8f66-45f8-8b07-b8e62d43c8a9@nvidia.com>
Date: Mon, 14 Jul 2025 13:19:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
To: M Henning <mhenning@darkrefraction.com>, Timur Tabi <ttabi@nvidia.com>
CC: "kherbst@redhat.com" <kherbst@redhat.com>, "martin.peres@free.fr"
 <martin.peres@free.fr>, "faith.ekstrand@collabora.com"
 <faith.ekstrand@collabora.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
 <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
 <CAAgWFh05pj_9rk7Wcx24tFWR2sgMZH4WtBsm3hYrqM3svwniOQ@mail.gmail.com>
 <127e866b4bb4fd3a77e1cbfc5b709bcb2533c744.camel@nvidia.com>
 <CAAgWFh2vZt7Oay0NGs4ttSTdJ5oP7qv+wWeRz0MRr=L5LeF8JA@mail.gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <CAAgWFh2vZt7Oay0NGs4ttSTdJ5oP7qv+wWeRz0MRr=L5LeF8JA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|LV3PR12MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: af936d98-3256-469c-06e7-08ddc2854047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUxhVFNDQnMzbW92LzlRTlBiUksyeXpHQ0t0L2ViQ2VucWJxemlGdkxHc0Ni?=
 =?utf-8?B?dGhUNFQyT2szckE4Skt4N0pwTVRHV2ZIUDByNkRkRUNZU0tyTkJIZzh2Mnox?=
 =?utf-8?B?OHRXSHRrOU1NcHpCVlo1Q1Q2aHY0U3MrWmdUazMveTZTNWJlTmZpUlk0NjNP?=
 =?utf-8?B?Z3lLRnpya1c4K2dTVVJmOUdiUHAxaGVlSkJIMktBT3VnZFRYd3FmWDgxQ0hl?=
 =?utf-8?B?OVNEMXpRZVJqVk4xdkpuUUJQWXJEOGIxM0VjZkFwMlQvWi9Kd1BVUDkvbVVN?=
 =?utf-8?B?SjB5c3M3U2laa1BndGZhVm5nd0g4LzVpWnl0SlRhSFpPRlVoRXJJR2ZTR1pa?=
 =?utf-8?B?cDBTYzh6dFB4UHNWT2NwUWQwUVAzT1lPei9kMVF6WEN0cnpiZk9QUFMzTnhW?=
 =?utf-8?B?ZC9vZFhSbWd5Z1QwSS9UaWJaaGE2bU96ZUpMcEF1aU5lbHJGZmVlZVhBK1I1?=
 =?utf-8?B?S3BaK25JRjhtNld6ekY1bkVrbmdDK0MwR1loSExVWHhqUFh1b3hWSElhNVlQ?=
 =?utf-8?B?REM4NHRrQlJ1eTAwYTZDM292UDJ4RFkwZC9md1AyNi9ya3YrUVh5ZEE2WkYz?=
 =?utf-8?B?ZTJDNHF0WDZ2U2ZoSU5xcjMwelZXWCtaYUlOM3BrQkpEeUU2K2xxT1E3a3hB?=
 =?utf-8?B?YU4vVWQrNVpTMDZuREEwVmtLSDUxckdmRHh2MVRtMGp3blViMzFyR29UMHFQ?=
 =?utf-8?B?S0ZDd3U1cFdMd0F5NWdHRzNURmpTc3hHSDBBTHg4RXhoZXI3NGg2dFZEYVdl?=
 =?utf-8?B?S05UeGdaZWMrNHZpN3RUaFYxVGx5VnZLSzErZXdaZ2xQVnpkcVlaK1lwK09u?=
 =?utf-8?B?QTdESExMRExDWHliR1ZOVitJdDNPTGhZMXlEQVpJV2kvUkVhdE9ZbTlMS2JL?=
 =?utf-8?B?SzRtd2lvRkFtb3g4VklhUWRrZkNWeW9Td0VwRnRLOVlaSTUreUZvd0xxQUxB?=
 =?utf-8?B?NmtHdVBEQ1BuejQwWkgzc1VBSTl1UzFMSzFGS2JiM21qbDRFSGVuWDA3T2tK?=
 =?utf-8?B?dzB1THZxS0pxRnFGaUkxMlNaeUJTMzZ3ZVNsazVjelA5V0hhbW5rQmU5Um44?=
 =?utf-8?B?VDErOUc1SjdyMWNuUFI0ZVY3UEtFb0lYSWRjVjNOV0dZR0hnbWwrYWdLZmVs?=
 =?utf-8?B?RjVCOVJpSnJWZEkvSlozcGh0dnhpSVgvNXBLYWVvdzAxWXRFMTMxbktXUlB4?=
 =?utf-8?B?bGZMa1I3Y1pFaXJaOFpxZGl0a1ZPZ1lTTjVZdFRuUXVaTWlhTnZjd2JuUURJ?=
 =?utf-8?B?Ujdvd283TEJoQWNMOWIzVXdDRS9aZi96WlgwV0R3NWxoRmpaWmFzU3ZyNkhi?=
 =?utf-8?B?OGNST3ZEb25SNkdSYlF6T25rajJQUklwSVBtM0t3LzlQOXJPTVlrNjBRemV3?=
 =?utf-8?B?VldwcjlNU1c3bkFqRDJQSWpvVStvUlBrNjd4cVEwdkgyZDNWcW02a1AyaXZq?=
 =?utf-8?B?endSVmNXekIvUURxbmptaW14dWtPSlhZMVBGZ3VNc2dGS3Q4dTZkMkdSeHFY?=
 =?utf-8?B?Zm1IVmRHWlhYMXpnLy9kN2IrYTcvaytDYUtSbURuRTdISmVrRnNha2tqdjQ0?=
 =?utf-8?B?MDEzOVpyRHhML2pqNkRpS1luTFpIM1ppQTVMbnVqT3dId3phRnVjVTlETFFK?=
 =?utf-8?B?aG4yWS9KcEtHZVVNaWNVVU1SN1ZwWDN2SHA0RmhjODZia1JIS3RITWVQZ2FJ?=
 =?utf-8?B?TVl5QnJwL0N5WlAvN1JRcjJBV3B5TDlHSEsvaW05TTBKbVZ3dEp5RzhCTDRq?=
 =?utf-8?B?dEEzSDZMNWp0TXdla21lR0ZuVHJtOTdRMFovUUYrYnFiNmJreGhuWWZSOG9K?=
 =?utf-8?B?TjlqYlk1Ylp2YkVpRFpGMVZaWko1Y3UzcTMyYUc3dzVZRHlpSDAraStMTEIx?=
 =?utf-8?B?ejREazdQNWgwOXk0VWlRYmRjR3RBb2U4eG5YRVBNY1NWZWFINzN4SStRL0Nx?=
 =?utf-8?B?dVU2b3NHWkE5OGtRY2c3aUhFdlRFVVJXc0dUM2JDbGl6RGU2YjZuZVVaZnFu?=
 =?utf-8?B?ZVdCUE1NL25BYUlRbkVIWWg3d2dYWWxKcGREU2JINTFpWnBZVnNyRCswZGk4?=
 =?utf-8?B?dXNtSmVXRjU1dklSTzNhN0ZIck5ORjYwdlNtU1JmdWtJaFZRZm5xT29qMkpV?=
 =?utf-8?Q?xEM8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 03:19:31.9832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af936d98-3256-469c-06e7-08ddc2854047
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9260
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

On 6/27/25 03:15, M Henning wrote:

> On Tue, Jun 24, 2025 at 3:13 PM Timur Tabi <ttabi@nvidia.com> wrote:
>> You have a good point, but I think your change, in effect, necessitates my request.  Previously, the
>> default was no GSP-RM unless needed.  Now it's yes GSP-RM, and the concept of "need" has been
>> removed.  So there's no indication any more that some GPUs need GSP-RM and some do not.
>>
>> So to address that, I think it makes sense to add a warning if someone tries disable GSP-RM on a GPU
>> that is not supported in that configuration.
>>
>> Now, whether or not we should ignore NvGspRm=0 on Ada+ is up for debate.  If I understand the code
>> correctly, today (and still with your patches), Ada+ would fail to boot.  I can't say whether or not
>> that's a good idea.  But I think a warning should be printed either way.
> This patch behaves exactly the same as DRM_NOUVEAU_GSP_DEFAULT=y
> kernels already behave.
>
> That being said, I'm not against the additional error checking here
> and can add it to the next version of this series.

Yeah, the GPUs that don't support GSP-RM can't hit the code that used 
fwif.enable anyway, so the series should be fine as it is.

Feel free to add my:

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

