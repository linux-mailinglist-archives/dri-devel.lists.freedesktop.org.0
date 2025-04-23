Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EDA99BB9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BD310E423;
	Wed, 23 Apr 2025 22:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ulz5VEud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B5F10E429;
 Wed, 23 Apr 2025 22:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrHxypRodclECoZhXsSSjNLZBwsAZqIPZtQ7N3Y+o1Jig7QoksCKcFLV7pLpootRjl0rYyr1dkgRhtVNkSIPLi0Mo0CVkvGJVJFMt0xlEtBfldpYPn+uZtGqnTBw6+rYp98pTTmjcjRhxtQqlE+ZtFePMaaWMHVy77RYO+cSDBhJ4HPtAPkE6+t5YT+FmNUwObN16h0PjoX8zNUB91hbhmvhgnmjyUUsgI0VljvTm+anO3bbgGJdANfvoY9eqvOxBwElNdY/CAPg1onRqZInb4G1mVEodQhjg2qMeSZN00fB8zCTp/a9deUnh6lrSvUdX5xZIhvMsYEyUIY+bVrnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiaukIXfE3BaRH+tUSrlN5e7frmO8qgf5t7RQhlHuSI=;
 b=onnDEYq9rcGvv5AvrzVCjacKRmalUCKT7kkFy1h+VpPKr68TQ45GiBB9XEy95ykP+0M65tZngxh1Jdbm+9zP34PCWaCotY3jovt6tSF0BZTb0QHf/L8OQGNyOmn4crWy1MD8fX4IscOwiu4oaxrSolIyJoHNDzwJKxkAksRRTukdHhsLtkU0Lj+EzRdoUxOCqr1Jogce8LthSs/ut8WzzrabpeUE42ElBpVT78Y28WTeEm/63dSa2femZOPhMF58OiTQ+IgLwC+wWz9MiDsq6xwTGvW852GlwxF2+eZ8i6SvAC0y7qDjbuQM7482fjjZ8HTMXi8LP1ABK2Qo1G9KHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiaukIXfE3BaRH+tUSrlN5e7frmO8qgf5t7RQhlHuSI=;
 b=Ulz5VEudJSHO3xAIKONWwKipFAwqwxWtJSXBfIeQ451JXzBojsn9kO3znjdFCdysEfy4mJKlBtFMSSFNktbxnV0HZe0H2CcZFFdl7SgviPrjge4n3ia/ieltBe65BpR02uG5sEsf9vO2/vnVCsOaRRJqb1LJDqSlk8rVIfeJT4xVk4MrlOPfOBydvjS6lLUprp+fD/kvQhxM+lD/Ln9+waKdinnbZFrHxKLqJsPA9eADLVhymPalP1d2ZkgvJstdNkMNWTeRVnU4X3Q0HwSh4tqtv+/cqLZLF9WNJJMFpOU6tV7pevqamBi+ivtDFIFbmyZvbP8y8GIVizDr/vNNtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Wed, 23 Apr
 2025 22:54:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 22:54:24 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-doc@vger.kernel.org
Subject: [PATCH 3/6] nova-core: docs: Document vbios layout
Date: Wed, 23 Apr 2025 18:53:59 -0400
Message-ID: <20250423225405.139613-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423225405.139613-1-joelagnelf@nvidia.com>
References: <20250423225405.139613-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:408:e2::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fee580d-a734-431d-a819-08dd82b9caad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WENMREJLWkhqN0dHSjhHang5SUI2WWJJR1hESWg0M0JFTk13RUs0ZDlOYUVk?=
 =?utf-8?B?Y1YrVEVadElWQWJjUUhpNE13RHFsTkZ2M1ZORFJtVEg4bGdjNmtCRnFoekFq?=
 =?utf-8?B?U1VpSTZPVmJTbVBPTkxoM1lSRTUvRVNVTk9sbERWSGRvc0xlT1BrNVdQbkdr?=
 =?utf-8?B?dFNMeW5tNWd1elllTm1UaSs4ZTg5UnM2UTVvWG5YQ2FSYU1xd3huU0w0dmZq?=
 =?utf-8?B?RE5Ia2pwblZZT1kvNm8wSDhWOUhZSE4ycU9FU2VmSzZGb0ZRM3p4UUE4dEln?=
 =?utf-8?B?cGVBN2tWSEFHZGpyV0xuY2JjSjJEbmJyaHJrN2d0NWNWMnd0ZXlrekJlek1V?=
 =?utf-8?B?MDZkaklzNGU5RHphVThUQkZrNFA2T3ZjcHVrdm9PZ2UvZ1VMWnk3Z3J6OWR4?=
 =?utf-8?B?Y2ZNYkk2Z0JZaWVmNURPb3Y2K2FtWnY4NmtWTDZQYnpWUzVaRUtUOElQRFo1?=
 =?utf-8?B?dXUvaU1tTTg5dkt5WWVSaWU2Q1ZCL0JvOElKMnVWVytuTHJzcThOYTgyNkRn?=
 =?utf-8?B?QWJKSi84VHpLbjUyWjc1a2d1OXAzQzRCMUpyRi9MdG83OFF0aXMvLy9yUkVu?=
 =?utf-8?B?T3k1UVViQmpBcERPeWdZd2drOUJaYXdDU1pJbVdEd3Q1SkZCSXZyVU1nRmF3?=
 =?utf-8?B?cTl0WDlqRDBjUmkwS1lDN0hveUl1Y294K2d3OHZvTFRVbWh3aDFRM0pERlJS?=
 =?utf-8?B?V3pjM1hnalVlemdkT044VmVFOHF0eWJUWjVGNkd2ciszbFE1OTkraEdYTGxK?=
 =?utf-8?B?WTVtTDB5L253OWxMdEFHMWhrUktOTHR4NXRsN20xaDFwN2E3cVJuS1NKbnp6?=
 =?utf-8?B?c2hYSmZRN1ZjaUZDWktneE4zT3lsajRyS3B2OEtsWWU3SngwZTB3U2JIZ2lG?=
 =?utf-8?B?ZHloOEF1a0x6QVdiYStFd0JVRGRLa0x2UkUxZWowanVoSHFIQ0JONTlvTGRr?=
 =?utf-8?B?QXdUUVkrTEZieWhWNE1xMVE4UUVwbEUxYS90KzkrNXBBcDhjSUk0YzZjNFJv?=
 =?utf-8?B?TlFpa3gwZm1VS1JRYk96TmNkR0kraUdDbzJXRkFNMms4U0ZvRDRESHRuMmVZ?=
 =?utf-8?B?cWZuTDFYZjdTMmhKV3VBTW5qaWtrdWcyNXFsalNUcU1XVlIrTlB3MmFwRVda?=
 =?utf-8?B?cFVNNWsveU5VRXl6alFPWXZrZWt4ZjFtMDRHcGF2YStGSkR4MW9CU3pwdnZE?=
 =?utf-8?B?VEtSVDdHeHBEVWZXUEswaFUyS1ZudHFDT0dBeGVxUmU2TnJWTTFsOWJ2cmRv?=
 =?utf-8?B?Tndzclp5VjhvTFBhMkVzRFZWRkFkMEo4WDgxZ2g4NElYNS9LV2lJYXBMUkVx?=
 =?utf-8?B?VkdSaGtKTXZDN3VxR2tBUm4xcWlxTFoxRlhKeDRMWEpPUk5XZTYyVzh1ZU1Y?=
 =?utf-8?B?Q0Iyc1UvVzVwcFd6SUhIeW83SlVENDF2UEQ2YWpXYmRiMFdZalZDRGVrWnNZ?=
 =?utf-8?B?dXpnMmdwNWJjWkVQWFptbk1PZzh4ejI1VHk5eUYzZFB5TEhISWRrN1NjQUhi?=
 =?utf-8?B?QzkxazFWMHA1VGRONTRrVHpRc05xVmJEeHZWbFBYQll0Z1d5UjAwdUxQcFc4?=
 =?utf-8?B?WXpHNjI0SUQyYVFEb2NNZllrUmIyek9CekNYbm14THJXZEJlNVZtQ0lhbndZ?=
 =?utf-8?B?MkxPd09nV20vMThUOUFOTnBEb1ZYSDNZUG5sc1pOY1pPNjhBbXhvdzRnMFRu?=
 =?utf-8?B?LzY1c2RETlVNY0w5dVUvRmpKc3pGVXZESnA4bzkvL2hzUlpNNHo3bi9DZm1m?=
 =?utf-8?B?NldDeXp4ZHhJRlJBL2RKdjJQTFowYitnUERvRFREcmU4WmRidzNmRWoyK0Zl?=
 =?utf-8?B?M0ZaS2NmMm55d0NOMVFQbkM5UUwvY1gvZVg4dER3VHN5WklDSEx1NDFXdHlH?=
 =?utf-8?B?aEVlc3ZkN1l0VFhYRkEycGNFcXJReThDam15VndtdGlyU3Ywb3BRL0ovVUVZ?=
 =?utf-8?Q?UyszEytt8+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGhvWWZMc2E2QytGME9BL0RBWU1zSmllUjJCeUJEZjVoRzcvNnh3UFVCSjBL?=
 =?utf-8?B?bW1teGtHT0txeEZHQlJiTk9UYjdTRXRYWkFMVXc1ck9oOE1UaHVMdkh0QTNY?=
 =?utf-8?B?czZ4NitUaDAvR0wyMUZUS0d6UGJsUW5DZjhPNHQrcFk1cklLL2tpaXlFc0FJ?=
 =?utf-8?B?bGtvSDFYOGxJbFJiMkJKR3V3UVEvSTJld2d0T2dBRFoycEZsQ2FEanZZR3NH?=
 =?utf-8?B?VHpGdlo2bXNhSmVBb1FYRDV1VWM0dWdOV0JUcW5kSHBuZE1GSnEyekk4OHE2?=
 =?utf-8?B?Y3dqbGdDTVQ1dnl2TmNCQ3RUTmxFR2RhbVVQRThXRnIxb3d0VVoyTXloU1BR?=
 =?utf-8?B?Ym1rNjNCWkxKSkdmNDc3TS85K0NUNkF0a1FHaDFkNXhSQ2lDcHJvWDVRZnRl?=
 =?utf-8?B?OUpqNUVvRTNnejB6Y0pCalBKT1BseFZkYytGVVdROGgxcUkxcktYdy80K3hQ?=
 =?utf-8?B?NXZSNzkvTC9xek5TTkVDYW5IQ0RNSWsvTjZQNCtTSkgrdW84V3hBc0E2UUda?=
 =?utf-8?B?dFlFZ2FwVEw3alFlSFlvMnUzQStvb2NWeEo5QUEydThkNzlmbEVzZWNBRjc3?=
 =?utf-8?B?YzdrZDh0VWZuRjIxWWMwZGg4WjZwQXRFMXFMQ0dYT0pOb2hYRDNxeEhtQ1BR?=
 =?utf-8?B?eGxHQU95cTRNRnBSRVBDa2NaMVdxWHNHRnQyMU5lOE81VWpOMzZXSVczcnhR?=
 =?utf-8?B?bHR3SWl5aFN3VHd1eExPZ0NyejZXM3paSnh1RkVFSWJNNGJOOFNlN0FsbVVo?=
 =?utf-8?B?bzhzRGQxVW9VdlJMRUF1Smw2d2RhdXhwNTQ0bk9ydG5sS2R1YWhNVEEzUDNy?=
 =?utf-8?B?dFlZQ01zM25RY3ZSM2xlRHlhVStRbUtUc1AxOGx0YVJlVFdkSHNRTC9INmFY?=
 =?utf-8?B?V2paRnNZaXJIY3lGRkpBVEV4VU45YW9sZ3o0Vk9uZ21VYk1PSEJtUmhpeVNT?=
 =?utf-8?B?bWRPSWdXZUdEMVJSdzh1Z0YvWnA3V0Z4cXl1RitmQTloZVNmNzl6TVdlUWVq?=
 =?utf-8?B?M3lyZzQxVkJCQTNNYTZuNzdSL0owU0daNE5FcmZUY2dkTTNyNy9UT2czWEVj?=
 =?utf-8?B?YytmR0tVZFd0SzhreGVzUkx0TnJTTTNlVG1LQTJYdGlleE56ZWgzMmpxSE9s?=
 =?utf-8?B?dXNqY0orL3Q3YkFiekx2emlBQVI0UFZxckM4RDhQdVBza2gzSUxFeDVJS056?=
 =?utf-8?B?bWZJNFBRMVJGU0ZjRjdLbGxFYXA4UGVVRktDbGZRR2ZjSjlDOGU3d1lVT0p5?=
 =?utf-8?B?aHVvZkFGS3V5dWdoeXZXLzBxVVpjbHdtQjROS2tKMWl1WVFYaDVCSyt6N3Jz?=
 =?utf-8?B?bG5oN2hHZjE0QnRyempQUlF3dlZ4dTVRbk5oZVVYS3Y3UXlDNnYwMVloQkhF?=
 =?utf-8?B?cm9IRnQ0dllwaHE5M3VrNVFhN0hrMWxJcjF5bjE3dDdBZzUrNXBwK2hFVUdY?=
 =?utf-8?B?TkY0bG91elV3WjFaaUc1bWNxcmhoRVR4RXNtT2Y3ZHZjWGJjUGR5bGcwZS9z?=
 =?utf-8?B?Wk5uZlNUTG1WOXgrZGtMcWQra0VjUFpTWkx6aEJNN1hQNHNYSDl6c2xJdXN1?=
 =?utf-8?B?Z1QyT3RzanYxRWNCOEJUZmtTOXdIMGdnYmNnOGdBcjZEeEdZKzhwN01JS3pm?=
 =?utf-8?B?Tk4yOXRKTnMzMnIrbHRBZmNQMk92blZ4amE0aVNpSFNtdmFZQkdicWVWNEs4?=
 =?utf-8?B?aTR1NHI2SHdNQmFhbHZQUmE4eGFjNDlRY2ZOSFFGMEpVWnNib2paMVYxUW1k?=
 =?utf-8?B?Tmc2QTNiL3ZaRmJaMmx5WE81cDZhV3Bad0JaeXZLKzg3Y0hheGNpLzdQNnhS?=
 =?utf-8?B?Z3ZKWHRDamZBRWV0cGhLMnkxU0pNNVZvUEF2ODM0ZTV4QjNpOHFsdkh6TTAr?=
 =?utf-8?B?c3RyZ0ZlcmQyMzRBRE5udWpXRUk0ZEZUaEl1bzFVbW5ZRHRnVHlSVjkrb0Jo?=
 =?utf-8?B?RnpZNGRUUUFIYkw1WjA1TnA3OVRVcjFkNlVXRGtwZVVIODRrUU51U2x1MlhT?=
 =?utf-8?B?S0tPOWY4NkFZTkVwOTh2dHhqSGlVY1NHS3BWaVZXUlgzamdzcGErbEVMcUxS?=
 =?utf-8?B?VWNhTjBwOXI0VUxXV1dDVW04cnBPNFFwT28yTTM3NmZLNDNGOUJBUnllL05a?=
 =?utf-8?Q?qOlFoTjzD0XIbVzUwWVEqPxKT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fee580d-a734-431d-a819-08dd82b9caad
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 22:54:23.9305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AH8baBcY2s+DGV90IiYuuBHU8vqOFdkTRC97OvnMh5sPPftU0vDiRfC0yh46K5iHydVIFK9+hfJDJawv1gS9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841
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

Add detailed explanation and block diagrams of the layout of the vBIOS
on Nvidia GPUs. This is important to understand how nova-core boots an
Nvidia GPU.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/vbios.rst | 154 ++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/vbios.rst

diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/nova/core/vbios.rst
new file mode 100644
index 000000000000..17411f21b410
--- /dev/null
+++ b/Documentation/gpu/nova/core/vbios.rst
@@ -0,0 +1,154 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+==========
+VBIOS
+==========
+
+This document describes the layout of the VBIOS image which is a series of concatenated
+images in the ROM of the GPU. The VBIOS is mirrored onto the BAR 0 space and is read
+by both Boot ROM firmware (also known as IFR or init-from-rom firmware) on the GPU to
+boot strap various microcontrollers (PMU, SEC, GSP) with critical initialization before
+the driver loads, as well as by the nova-core driver in the kernel to boot the GSP.
+
+The format of the images in the ROM follow the "BIOS Specification" part of the
+PCI specification, with Nvidia-specific extensions.
+
+As an example, the following are the different image types that can be found in the
+VBIOS of an Ampere GA102 GPU which is supported by the nova-core driver.
+
+- PciAt Image (Type 0x00) - This is the standard PCI BIOS image who's naming likely
+    comes from the "IBM PC/AT" architecture.
+
+- EFI Image (Type 0x03) - This is the EFI BIOS image. It contains the UEFI GOP
+  driver that is used to display UEFI graphics output.
+
+- First FwSec Image (Type 0xE0) - The first FwSec image (Secure Firmware)
+
+- Second FwSec Image (Type 0xE0) - The second FwSec image (Secure Firmware) contains
+  various microcodes that do a range of different functions - all in high secure mode
+  where they are allowed to perform highly privileged register accesses that the CPU
+  cannot do. The 2 most important parts (also known as Application Interfaces) of this
+  are:
+    1. The devinit engine - this is loaded ontop the PMU before the driver loads
+       and interprets devinit commands which perform critical hardware initialization.
+       This will be described in a separate document.
+    2. The DMEM mapper - this is loaded onto the GSP and one of the commands it
+       performs is carving out the WPR2 area (Write protected region) and placing
+       important data called 'FRTS' into it which contains things like voltage/frequency
+       curves etc.
+
+It is not clear why FwSec has 2 different images, but they both are of type 0xE0
+and can be identified as such.
+
+VBIOS ROM Layout
+----------------
+
+The VBIOS layout is roughly a series of concatenated images as follows:
+(For more explanations of acronyms, see the detailed descriptions in vbios.rs).
+
+┌────────────────────────────────────────────────────────────────────────┐
+│ VBIOS (Starting at ROM_OFFSET: 0x300000)                               │
+├────────────────────────────────────────────────────────────────────────┤
+│ ┌───────────────────────────────────────────────┐                      │
+│ │ PciAt Image (Type 0x00)                       │                      │
+│ ├───────────────────────────────────────────────┤                      │
+│ │ ┌───────────────────┐                         │                      │
+│ │ │ ROM Header        │                         │                      │
+│ │ │ (Signature 0xAA55)│                         │                      │
+│ │ └───────────────────┘                         │                      │
+│ │         │ rom header's pci_data_struct_offset │                      │
+│ │         │ points to the PCIR structure        │                      │
+│ │         V                                     │                      │
+│ │ ┌───────────────────┐                         │                      │
+│ │ │ PCIR Structure    │                         │                      │
+│ │ │ (Signature "PCIR")│                         │                      │
+│ │ │ last_image: 0x80  │                         │                      │
+│ │ │ image_len: size   │                         │                      │
+│ │ │ in 512-byte units │                         │                      │
+│ │ └───────────────────┘                         │                      │
+│ │         │                                     │                      │
+│ │         │ NPDE immediately follows PCIR       │                      │
+│ │         V                                     │                      │
+│ │ ┌───────────────────┐                         │                      │
+│ │ │ NPDE Structure    │                         │                      │
+│ │ │ (Signature "NPDE")│                         │                      │
+│ │ │ last_image: 0x00  │                         │                      │
+│ │ └───────────────────┘                         │                      │
+│ │                                               │                      │
+│ │ ┌───────────────────┐                         │                      │
+│ │ │ BIT Header        │ (Signature scanning     │                      │
+│ │ │ (Signature "BIT") │  provides the location  │                      │
+│ │ └───────────────────┘  of the BIT table)      │                      │
+│ │         │ header is                           │                      │
+│ │         | followed by a table of tokens       │                      │
+│ │         V one of which is for falcon data.    │                      │
+│ │ ┌───────────────────┐                         │                      │
+│ │ │ BIT Tokens        │                         │                      │
+| | |  ______________   |                         |                      |
+│ │ │ │ Falcon Data │   │                         │                      │
+│ │ │ │ Token (0x70)│---+------------>------------┼──+                   │
+│ │ │ └─────────────┘   │  falcon_data_ptr()      │  │                   │
+│ │ └───────────────────┘                         │  V                   │
+│ └───────────────────────────────────────────────┘  │                   │
+│              (no gap between images)               │                   │
+│ ┌───────────────────────────────────────────────┐  │                   │
+│ │ EFI Image (Type 0x03)                         │  │                   │
+│ ├───────────────────────────────────────────────┤  │                   │
+| | Contains the UEFI GOP driver (Graphics Output)|  |                   |
+│ │ ┌───────────────────┐                         │  │                   │
+│ │ │ ROM Header        │                         │  │                   │
+│ │ +───────────────────+                         │  │                   │
+│ │ │ PCIR Structure    │                         │  │                   │
+│ │ +───────────────────+                         │  │                   │
+│ │ │ NPDE Structure    │                         │  │                   │
+│ │ └───────────────────┘                         │  │                   │
+│ │ │ Image data        │                         │  │                   │
+│ │ └───────────────────┘                         │  │                   │
+│ └───────────────────────────────────────────────┘  │                   │
+│              (no gap between images)               │                   │
+│ ┌───────────────────────────────────────────────┐  │                   │
+│ │ First FwSec Image (Type 0xE0)                 │  │                   │
+│ ├───────────────────────────────────────────────┤  │                   │
+│ │ ┌───────────────────┐                         │  │                   │
+│ │ │ ROM Header        │                         │  │                   │
+│ │ +───────────────────+                         │  │                   │
+│ │ │ PCIR Structure    │                         │  │                   │
+│ │ +───────────────────+                         │  │                   │
+│ │ │ NPDE Structure    │                         │  │                   │
+│ │ └───────────────────┘                         │  │                   │
+│ │ │ Image data        │                         │  │                   │
+│ │ └───────────────────┘                         │  │                   │
+│ └───────────────────────────────────────────────┘  │                   │
+│              (no gap between images)               │                   │
+│ ┌───────────────────────────────────────────────┐  │                   │
+│ │ Second FwSec Image (Type 0xE0)                │  │                   │
+│ ├───────────────────────────────────────────────┤  │                   │
+│ │ ┌───────────────────┐                         │  │                   │
+│ │ │ ROM Header        │                         │  │                   │
+│ │ +───────────────────+                         │  │                   │
+│ │ │ PCIR Structure    │                         │  │                   │
+│ │ +───────────────────+                         │  │                   │
+│ │ │ NPDE Structure    │                         │  │                   │
+│ │ └───────────────────┘                         │  │                   │
+│ │                                               │  │                   │
+│ │ ┌───────────────────┐                         │  │                   │
+│ │ │ PMU Lookup Table  │ <- falcon_data_offset   │<─┘                   │
+│ │ │ ┌─────────────┐   │    pmu_lookup_table     │                      │
+│ │ │ │ Entry 0x85  │   │                         │                      │
+│ │ │ │ FWSEC_PROD  │   │                         │                      │
+│ │ │ └─────────────┘   │                         │                      │
+│ │ └───────────────────┘                         │                      │
+│ │         │                                     │                      │
+│ │         │ points to                           │                      │
+│ │         V                                     │                      │
+│ │ ┌───────────────────┐                         │                      │
+│ │ │ FalconUCodeDescV3 │ <- falcon_ucode_offset  │                      │
+│ │ │ (FWSEC Firmware)  │    fwsec_header()       │                      │
+│ │ └───────────────────┘                         │                      │
+│ │         │   immediately followed  by...       │                      │
+│ │         V                                     │                      │
+│ │ ┌────────────────────────────┐                │                      │
+│ │ │ Signatures + FWSEC Ucode   │                │                      │
+│ │ │ fwsec_sigs(), fwsec_ucode()│                │                      │
+│ │ └────────────────────────────┘                │                      │
+│ └───────────────────────────────────────────────┘______________________│
+
-- 
2.43.0

