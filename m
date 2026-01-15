Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290ED22C23
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352D510E6BA;
	Thu, 15 Jan 2026 07:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sjHn131A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010032.outbound.protection.outlook.com
 [40.93.198.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CA310E6BA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:15:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEFmSkQipAwql0Ba6s2GJjuu8Au5qtvCY57sRchV76BEU+nPH+nncsKRLccUNyJWJ+snkVGTniMfIrnWzKPGnEUwLWJEBGaKJVIiFNrVeqb2dwsuFCUvdvnpDrHLw4MBrN+nOOaDo3K+ROB29LsaCZsYHOPMcw7+3grUppjLt5o9QvgomNKLDQi9OmIAbyj2h3VA5L4/3HzXFUk1Mjqe3SlTUhiDa43xfKK+rajgHopRs2tWKB1vDAJLAS7gTV4mReKvV6ZZtNCn3fYVsIGnr60OAuLdSctPhSSJ3faf4dFkZai3E+7y3XglMfErCWFlNXpBhbC2bdFtEwDguj9RLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Laff4pJpgDEVyhg5zaHPCvImMRSkR9s3iF5S025/V8A=;
 b=G3otxMV65lZgpOzr72DO3oj4Q0PCAyzvIDpuHNNiAWxlgLN/K4tVb5ixNH04dr1p2r6fuVIK0Dh8a0dVrphhad6VMsqDD/Nj+wyd/wTsbo6jygif28TDUCYS8mJChjtJPd3U7JOB6QSQS2Vp2UMJRC08Z5xuYPh/pv4SKWw3XSGCCT4/kMwz9no+p7HhoYhgC07PpQb6sJGcTxPhiA1akQB9t4RVMF2vdf8Gb65nejD93bjBNARrOFWxC/vzk3fG81uKOuwB25bJvJSmAPcJzccr51xiu88NOxPW1AFi2oi0VdC3tjcCLX5gcWG/K9OGc0/fO7i+yq/977BekX+S2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Laff4pJpgDEVyhg5zaHPCvImMRSkR9s3iF5S025/V8A=;
 b=sjHn131ABuAjT9wEajR7E6euzGv09w6OpbsrDK6w2/3phCOSjbPJxwf8Uzdhtk//EIrdeKfQv1JxhU4q+3CBYovCguvfJyXFWOkYQO99ua8zl+CbY0VzkKel8rRdzHyMUgu/UpybKqEJnJSAVMBXCkXxKRsqR1I4DgtoNs6ScHJchmjtrNLMD3EmkR1aQX5GCXlzF4AaFT6LAEcE94j1RyLw+w+ieBOeusHoQYXZvAQyFX3w4BHZgxYL8R808/qUDQ2U92AbDxnfphHJ25o3o/tYIeVpVGfYgLC4ZBxRAz7vRZ4lSDGYWOg+utjQJ3VwoQ6Zp8Mp/HE1Oanj+SfSQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 07:15:42 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 07:15:42 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/7 RESEND] ARM: tn7: adjust panel node
Date: Thu, 15 Jan 2026 16:15:39 +0900
Message-ID: <10344542.CDJkKcVGEf@senjougahara>
In-Reply-To: <20251204060627.4727-4-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
 <20251204060627.4727-4-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0200.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::7) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: db2d7f01-f08d-40af-1b8c-08de5405e4be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1NWR0szRzhiTHBEV2l2U0w5NmFNQUJzby9sZ3VLZWUzeXNZeFZGUVh0eWIx?=
 =?utf-8?B?dHVhb0k0aFF4dUU0cUhXSm1NRHEvM3R2akRtL0NldVhJYmd5REtERVo1OEVS?=
 =?utf-8?B?NmZBZ3ZqWnpUS2NoUlZ0OStvaGp2V1VvWUxUd3BqSlVoVHFnRDZjN2ZwdVhT?=
 =?utf-8?B?S3hQUXREeDZXNG45bmhxdkxaTTVJVzFQblkyMGRKRVM5NXoyRFJJelllbkRT?=
 =?utf-8?B?cUd2S250UnJuVFBpYmFKZ3dBQlY4Z1djSWtDNXJlT1hNK1E3WmpnRmpjMVha?=
 =?utf-8?B?VlZoTDkvZ2kwVGV1Mnh5NGJuWFFqMlhmMjVDRGpOeG51dFliR1kzUGtMNlJl?=
 =?utf-8?B?T1lVOWpGRFJiL3ltVkh0WkdycWJDVzdvWHRoSmhMalAzWmF6WWpCdEtjcjNy?=
 =?utf-8?B?OGNaOXRRZTEvbTFoRUllOFh1YjF3cTBqaEZjS0ZWWmZMMGllRWR3RXRsTXJ5?=
 =?utf-8?B?a3VqT01yZzk0SHY5UlpmazNmSmxnZ1pSdE9yOXRodkJaV0Y2UW9meHdGY1dE?=
 =?utf-8?B?UzZoQ3M0QlFyQkphME43enlkSFZ3cStNSityS2FyeU9QUHhDZnBucDJxSVlr?=
 =?utf-8?B?empFZGtweXNicVZNcFROWmZ4TC9JOTVjM0dOcVpaT2pnQis0b2Zwa2hYSzRz?=
 =?utf-8?B?ZGFkcTN5a2lxemR1eW54UzJOMFcwdjBrTVowcEJsQk1VeUdKaGRUS2c0MkUw?=
 =?utf-8?B?bjJ6NWJNZVJQbW1BdU5aMzZJenE4aXRtVWtYNDlJNEZCRmhuNzJJdHY5OWdF?=
 =?utf-8?B?VUhtdzA3SkFmV1NKZ3V0ZFQwdG1MVnY5NkFkbHArdnFaSUdodVRudFcvZmsx?=
 =?utf-8?B?NTNlendNZHZLRlZ4a1JnSWF3Wm83NWN6T0ZYdm0zSkNmNG1ISyt2UlU5bWNF?=
 =?utf-8?B?c3hCVnZqOGk3c3pkZFVBbG4vSitGQU5EQ2FoVGc4SkdxT2NGYm9JUGgvUzhY?=
 =?utf-8?B?bTMxbHA1cWRWSnF4YUhBWThSY2gwMFFOR0pVSG9vcjVkSkhrUTJqaFAyeWRF?=
 =?utf-8?B?a1RKUXJpRlYzTU1WUnIvWStoV2NZQ2hmM3V6Z1poQmt3Z0xqM3I1ZlVPWjd1?=
 =?utf-8?B?QnQzQ3R3YmxsOHVBSDJyRnZNcDhBSUs1SnVFU0RFR3FHSXhJc0U2eGpjRTFm?=
 =?utf-8?B?Mk9CRzRJb0wzbExrNEJ3RS9FOUpYMUpXQUxHL1Z5dVhvZW93dUZqaThWbmJl?=
 =?utf-8?B?MDg4Qnh2RENjcHR0SnE0bnBaZFJ6N3J5OWZhQzB1NEdmOEt4bGV5MUdOWTJm?=
 =?utf-8?B?MDdpdFZPOHlITk96NEM2di9IWUdBZlZaNG1udSttaGh4NXR3Rmx3aUhjU3pG?=
 =?utf-8?B?aVMyaU1hRm11Q3E3Q2dnZVQxODEzem1VaDB0QzlpQ1NnbERVNWxCSzNzU1Bu?=
 =?utf-8?B?VjBhbnVOS0NHaktlL1dtVkFKL1dxNndjYll4T21XZlNQMnNIanVGSmpaQnZP?=
 =?utf-8?B?emhvVzgwQ21VVnJYa2gwL3pkeTdadVpQYlNrc056SHJ0aVM1alVwWXVMUTVH?=
 =?utf-8?B?dnpNRVlUUE82cDBhbDQrUzh1REZ0K0RoTVh4bzdNOEY2elFVc3RqWVBlNldB?=
 =?utf-8?B?WjB0Q0hxbVlNdlp0aVBYWEg2eVJVMU9raWJoNmY1Y2FYcVNvMFhTYllUZ2cv?=
 =?utf-8?B?RzMyQ2hJVHludGYrK0tOdExGZGFsR0pqd01MZHdCR1YxRS9nQUFMcjlqQTlu?=
 =?utf-8?B?aDJBZVFKbzl0ZGp5YlQ1aTNGRlJKSkpKRlZqeE1XSng4MG5ETm9PeXBGZXlC?=
 =?utf-8?B?dEhna3lHSmJXZkMwSmZrNjUyb0tWMmEzS3M3dVFHTHFGanJWVGZkN09KdzRF?=
 =?utf-8?B?WFpBVXVvb1ZPZnFtblBMNzVhTEdYMks3NWlNall1Y0pzcU10TzFRRmdZN0U3?=
 =?utf-8?B?L09DN1lPVWEyUFdWejI0Y0xMd0ZBak1LWkxaT2NkdVUzL28yUXQ5aTJSTUIv?=
 =?utf-8?B?UDkzMmxLdVhIcm0yVk5rNGZNQ0NrOGZ0NTQxVkpDMGsrdnNXcmF1U1dNdDVh?=
 =?utf-8?B?NW5hN1RSSDRFY3FhMU5EaUR2VlRKYzl0UTRXRU5IZFFVU3FsMXVPY0xzVWIr?=
 =?utf-8?B?WU1MYjZBSzErUVdsZkdleURyZndWNHFRUXpUYm9OZ0xPOEgyZWY3cjhqaTFO?=
 =?utf-8?B?ZFlRc0NaTk15OTFQVDNRTWhjZWFyZ3o5OGZOMVBJRGVoNmxaZGVkeXljMkEv?=
 =?utf-8?B?ZlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S05oS0hjZWR4bVUraG5KMzByc3dnZExFcEYzOEVzMExkN2U0YVFHODhMVzVq?=
 =?utf-8?B?Z3VhWjNsL1paeEU5TkkvTGYwZ2xFdGcrWm9nSFJaOVE4L1VUZC9scHc3WTRF?=
 =?utf-8?B?bGU3SmtpdWoyYk5wUkZNWnRmWjBiNFF0OENmYmM3c0N1SnpMVGZvUndHVWpK?=
 =?utf-8?B?Q2dsS0w3ZmxtT24wcml6eTN0Z0x0NWZjVVF3OUxoL205eDd0bEFrcjhnL1dR?=
 =?utf-8?B?aGNCbkRxWmorNE1kbUozNlJOY05OczdqdlZJVjZ5ZlBERVQ1VnhnWGhEVXE0?=
 =?utf-8?B?c0tLR09YYVlUU2xSOS9QNFhUMXpqci9LU204VzdsZVNEd282a3NqZkFTN3RZ?=
 =?utf-8?B?UkYrWDNxeHR6VkFhZW5nUHFFdkd2SHJvZEZFVnI1UCszdzZOczJZUTNJeGhv?=
 =?utf-8?B?a3NjMDlZOWdTbmNvaE5qMlhFRk0vZXdwS3g2WlV5a2NWUFFweGJtRjRLWFJq?=
 =?utf-8?B?WENBYnNKZE1iV3o4L2RYNm9UbTVDTWdqSkJXZHNoWUZmM3VhaFkrRHhYNmFC?=
 =?utf-8?B?V29HYXhTcHBEdjdhMmZGdGdhVjhualI3WExCU215TVFFWnRXNzZqQ2VBSlNR?=
 =?utf-8?B?RzN0T0t1VlFiUjBzVXVvYUtHRUVUVDd5akhIbkVML25wUWg4ZjVwand1cjFY?=
 =?utf-8?B?Unp6M3ozaFo1d21oSE1qNlFvTFRTd04xZlUyeWZIUk1RZU1PWlorazUycFlS?=
 =?utf-8?B?SjhjMVJsTTc4VU9lN0hzV3dUM1ZRSHRqeXRSN0NpM01QOWZRVkE5Tk45ZlhI?=
 =?utf-8?B?SndsK0NuMyt1STA5RFNwdEJuMGZEcEFYeENMY05CZXRjbW4rdHdBbVhLdmMr?=
 =?utf-8?B?Z3BJNlFjaXM3OUtIUnh2eTl6TUhKMXVrc2tWVkZFbVJhT2JLUGhZR1k2TWlu?=
 =?utf-8?B?OXA5NVFrZmJERTM0aDgzNzkrUDRQbXZmSmE4RkQwRjdqS09aN0dNWUQwM01I?=
 =?utf-8?B?Q24wM05PVGhoeU5JNkJtQmQ2Ui85Z3pmaUt5OE9ac054STd6Y1p3dGJBTmdH?=
 =?utf-8?B?NEllN0RHTVAybmVpSzFaZ0w5ZTJsS1RIaUp2dmw4UXJINDdQNklRY2V0dEJB?=
 =?utf-8?B?a29NUlV5NDY1L3FPMS9Rd05ob21jSGVZcCt2TmFKaWg2ZmtpaE1MeWZlcWVF?=
 =?utf-8?B?MklOQ2NCRjZEV0NWU00rVmVNeGJwalVpaDZYTjZOM3NOZklzVzEvaU8rTlhQ?=
 =?utf-8?B?VXQ2NytwVnRlYlBleWhsWklrZGl2RWRyUnlmeWV0SEU3ZjA2cDIwRUdML0V4?=
 =?utf-8?B?emlwOU5GUXhzMlJiTGc2OGNaK1RaTzhPejdpbVQ2SlJtYk52U3pGRC84ZmFh?=
 =?utf-8?B?cEE0SkZIbGhhMVlnVDVGWUNabVRXRnZTam9FQ0tnODBweFM1YUFQZEswejBU?=
 =?utf-8?B?RDdZc2xyYkZETHV3ZUlkT1loWUFtVEpHZ01uZkp4VnFqOFFGVHJXeUFNbmlW?=
 =?utf-8?B?SThoOFdWVFdCM0lnTEZyc21vOW16aGFOc0wxSXp0VmtEOXpLbVJPTVBmU2lG?=
 =?utf-8?B?Uk5QQjAyb3dTWDZHaVMweDJHNExTSjZOU1ppSEJqTUFpczZBZUNNZXlGaVMw?=
 =?utf-8?B?WGNUckNUQzkyYVNBQU85dmxSS2NIRHZlSXpYdVNNUmFCQlFGRWp2L010NTB0?=
 =?utf-8?B?R2xyK1lJeDA2eXNNbllCSG9oVkUyL1F4RTNjVHI1anljYkR2eXY3Y0hjQ09E?=
 =?utf-8?B?d25VNkpDSThFTHJ3Q2o5ZVBMeUJhNkRBejBFWmVvR2I0YjhOSE5qYXViVm5C?=
 =?utf-8?B?c0lQOFByM05acTFvTHk4a1MvQkdOSUF1T3pZOTV3QUZILy85aU5WUGpPb0cz?=
 =?utf-8?B?cHFLemZXTTIyWVd0bXRud09PelpGRnFpdWFUTWVYU1k2azVmUUQ0bXdnTnJG?=
 =?utf-8?B?dXJ0amhlampuUWVEOURldm5HZVVtbzhDbDcxQzhEaEVRVjFuZkR3YzNmcmw0?=
 =?utf-8?B?cXE0S3BQb1lNRGVrSTRjalBXcGliN2NVZGlDelZxcTZKVTdpYXZXMGIwWnRS?=
 =?utf-8?B?V215Y0o2U0FrRC9kd3JSRzB6aTlhYXZpdURYL2hwTjA2RWpVRDRWVE40M3BW?=
 =?utf-8?B?QzRSL1NBY3VFbGxkYXo0VWIrM3lLVnpSdFNVaGhtR0I5RWtUajYvRTViUURF?=
 =?utf-8?B?YTgwVnBGY1NTM3QrVlcvdnZmdWM3NVZvYWNGcGhpdWNlZmllbm9tWDVWVG1x?=
 =?utf-8?B?aGl6WS9RS2hRNGFPeGhBYmx2UUlKMllaTFZzSlNvTlB6aEZLUmZiTGpKQkVR?=
 =?utf-8?B?K3hVYzJ0YVA1SmI4dkVPS1BqUkhscjdiN1A2WUpIZnAySHczRjk0MVN4M1V1?=
 =?utf-8?B?VG11cmFOVWRpQWhQa3Y3SUZGMWlrZk1BOGRNMlRpZ1FFd05mOVhOUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2d7f01-f08d-40af-1b8c-08de5405e4be
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:15:42.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJZg0UPI4TPKIT98UYyu9K2VpL7AcoWLHgArJ+UNWKi8Tcembq+xVks2ZiB1dHrRaPmRuNK1LPVvqJ0dXy+reQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049
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

On Thursday, December 4, 2025 3:06=E2=80=AFPM Svyatoslav Ryhel wrote:
> Adjust panel node in Tegra Note 7 according to the updated schema.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114-tn7.dts | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dt=
s/nvidia/tegra114-tn7.dts
> index bfbdb345575a..75fbafb4a872 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
> @@ -43,7 +43,9 @@ panel@0 {
>  				compatible =3D "lg,ld070wx3-sl01";
>  				reg =3D <0>;
> =20
> -				power-supply =3D <&vdd_lcd>;
> +				vdd-supply =3D <&avdd_lcd>;
> +				vcc-supply =3D <&dvdd_lcd>;
> +
>  				backlight =3D <&backlight>;
>  			};
>  		};
> @@ -101,11 +103,10 @@ smps45 {
>  						regulator-boot-on;
>  					};
> =20
> -					smps6 {
> +					avdd_lcd: smps6 {
>  						regulator-name =3D "va-lcd-hv";
> -						regulator-min-microvolt =3D <3000000>;
> -						regulator-max-microvolt =3D <3000000>;
> -						regulator-always-on;
> +						regulator-min-microvolt =3D <3160000>;
> +						regulator-max-microvolt =3D <3160000>;
>  						regulator-boot-on;
>  					};
> =20
> @@ -325,7 +326,7 @@ lcd_bl_en: regulator-lcden {
>  		regulator-boot-on;
>  	};
> =20
> -	vdd_lcd: regulator-lcd {
> +	dvdd_lcd: regulator-lcd {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "VD_LCD_1V8";
>  		regulator-min-microvolt =3D <1800000>;
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>




