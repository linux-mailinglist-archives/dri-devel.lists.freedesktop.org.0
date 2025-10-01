Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB4BAF51A
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD04A10E2F9;
	Wed,  1 Oct 2025 06:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ps/MtzGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012024.outbound.protection.outlook.com
 [40.93.195.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B1810E2F9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viiWR72s8KauAvJZFJ4CNKu3SftI3kZHDeRiwl8yWhAQGqOng+4dBs1OMmbptuzUD+xQT9Y2ipJ2zAtaZKuL1L9Fo0eaiZkFCTrrKZ2SFUYvFFRhUbXA45bkfkHLXIPdYZsChUlhVQAW6ziThPBve4cxL4ghQnjzzGMOlihPF7KJx3Jj+fPul16lJ5uIP//gfGM2JPjfUxO/9icS+chZpd3eogFBjD2JmybAUSNPx7QsPuXC/LACOeo2f8lytDPl7YtWCFeo6Xsp3rXafCyDuSq3e8WkIdsZkKeTu3BE40d1Cc74I9tRhRBVBnJuZj4jZeEtTbv/NPEQvrVSmpbOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsmfsT5rShSAsH7ZfHbs/HULcRgsXc5ehSBKLkKjo7w=;
 b=RWFwzezzUdteVepkEA4FC9YnhHiFNX7KCbC44IdTJblQiICvGbB+1PHBEhu4hVUlMtzdmt07tzA+w6RTnKnMZaP91gZoKu+2n8bEw3pO37k7OIde7PB0bH4msm7woq1FA/XtTsnj9FXeIOYAAdKIJaYMnrX23hpnlcmDTzWG0RtPecTu6hSHaMhgxnJ3XoFgWrGRRVmy/MbwELLQLxC9oDZFLc0iQ/AGKXTVet0439m0fEhGhHc/X1XFuLLbvXBW8672peLWOgnEgxqOOTrWgEXXKNDI1RReLfKkcZrA5BEO6myMkTIuneVK8AQmNlrrFDLP4p46V4f3BpXu5FCFJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsmfsT5rShSAsH7ZfHbs/HULcRgsXc5ehSBKLkKjo7w=;
 b=Ps/MtzGhGPA3WQjmF7PALPbFP2SxVtAftVZThi46oDmYPKtVBSgbUKCbmsahrvaABH5Xp2ahkA1se8Z8uwvMuRp2DMz3Ydf8t1ed5vRDcu0lTRQl6NGqfjd5w4BB+OyR0OjbbzJmA/X7cTBBWfXGgkL7Y16EYpaT+5ZeGmobdBvy261MBaw16ULtUS3FN4gqKCL8LnNmOcY/y4IcM5qnUNIABcekVo1Ck2EC9CIcK/dIqRc+G/IwKXkDaiAI7spOgMUBxi4vzBsGb28vj1gPfSMLK1rrW46sD4JKGvJRTkB7rilddxOZo3+dAAGlltZGKTa2gDgGf5okspSDU+0VmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:19 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:19 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Balbir Singh <balbirs@nvidia.com>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v7 05/16] mm/huge_memory: implement device-private THP splitting
Date: Wed,  1 Oct 2025 16:56:56 +1000
Message-ID: <20251001065707.920170-6-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::19) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fdf3ca-d5db-4326-cded-08de00b7e748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGhUakx4eDFQc2o2SElWYS9WQUdOVzRGSHlpQUl6NUtzaEpOL0dzVGgraStP?=
 =?utf-8?B?dlE4TlJyVTlFODVpYmVJcUVDUlpQcFh2R0lnejBCM0RGL2hqYlZSVHgrSXhq?=
 =?utf-8?B?OWFTMWhFT1M4enNSa3pjOGszQUdjbCtOMmVLWUJaL1VVNC9WNUhGV0F5SG5i?=
 =?utf-8?B?aStBOWFxamU1bWJ1cVY3TTJsU21ON3VNbUx1QTYzRU9LbWdRd3BpMjJhT0E4?=
 =?utf-8?B?bXgrS1BSTWRhazFvVC93eGR4N1k4alI4Y2I4TVZldGpaa0sxbHZQOFB4UmhP?=
 =?utf-8?B?bWJwZk45cXBta1RWd0UvaE40TmhMbmJ1U3N6YkJlS2NBdU5UYTV2Q1FhQWk0?=
 =?utf-8?B?MDNPT1hqMlBpOGRDclQxL1ljUlpxNTFNQjhqbnhiR0xOMWE4cXBabTFwd1hr?=
 =?utf-8?B?MUdybUV2a3VKc1RTSmNXZG9VU3NOTFlOb1I0bXBCeXdoZmZtV3FaVStSL1pz?=
 =?utf-8?B?azM5blZsOTdqWW5hZjc5K3U3dm1MbTVqcE54MjFFTmF3Q2QwRHQwTWNydVFt?=
 =?utf-8?B?SlNOUWtIVGV0d3doazZHaFpGZnlhTEYyS2VOMU5WMW1iMFJzS3RZSnQ3VkVR?=
 =?utf-8?B?ZnpCWWhHNHhDM0IzWGRZeHBLc0xrZmkxVkkxbWhzMUF6RndmR2xYUHphdUZF?=
 =?utf-8?B?YUR1M1NxMFFxWGJMbFZ0b0l0Rlo4NDBJVS8wNWN3UFV0Qy9sWTZER0tBbExZ?=
 =?utf-8?B?emxEV0lWL211MjY0VFAyOE1MUWNkTGVsYngrcmRKaVRpVENoTDdkUDY3YnJn?=
 =?utf-8?B?SERwcTdNczkyWW9oRVhHYTdoRnM4V1RRUGEydnRYYnhsTzF6dEpINkpsTGZn?=
 =?utf-8?B?QVVPWW9RN2ZMYi9idlN2S2YxQzY3VGtDdFoxUFRuK3hKUmd4UU5zbmZ2eHlH?=
 =?utf-8?B?TWtCcXRWSjgvT3hxWmR6TzUvUVNYb3RySFpnNGhGalh6akdzdE9GQnQxNTVZ?=
 =?utf-8?B?cG90RXRPTnlScGxsZU02b1dXU1ZHbGVxZmhMeUVOSnVyYURyREZLNkxzaFpz?=
 =?utf-8?B?Qko0OHU0ckE4U3pzRmxxcEhMbTJmUHd5MitKYzVsRXYrVUx3bFprV08yVEhp?=
 =?utf-8?B?eE1kTjcwSE9vY3BMM0VEU3dSNmlzUTNUVW5lNmJHQ2JqMkNUNHNPSzVCMHZG?=
 =?utf-8?B?MFQ4blVCNjlCVGlBdDZBU0F0dXRqcWhINnhiWjcxamNRdkt4L0owUUNSamJX?=
 =?utf-8?B?eS9HQk9YV2NZclVrNjN5SCtWM2FIUjFhYmZIc1V5dmhqMVAvbHpRS2tCK0V2?=
 =?utf-8?B?YkJDZ0JMcTZLNkFYTEdFdURyM3RHMHZSazgyNkJtQUpWalJGaittWERJR21x?=
 =?utf-8?B?M2JCMENjKzFjYjhOdkxLclhsV215RFZxajNjZUs5czlEQXpaZjVlME9TeDha?=
 =?utf-8?B?QnJxUXZvSnE5LzdnWUFwdmxsUzBvTUQwUEU4dEdXTWhRbC9mUHA3Uys1RGR4?=
 =?utf-8?B?UnRqM0ljTFRWUzVjTDMwVkJndG5DdVhCcWF1b2RPYVFrUUhPMkRBeUlEZGNt?=
 =?utf-8?B?aVd2Z0Ywd0pJdEJPdHIwZkJpOG5rM3BYZ3lTR1d4elZVYktJOWZVczErdEti?=
 =?utf-8?B?d2Y1em9EUnZ4MjJOTHc3NklEcUFROHBIeFE0Vk9tVTMyLy9DTlFReXdJb3NG?=
 =?utf-8?B?MG5yNEFzUTQzbS91RXU0SGd5SlNrTWFHTG5ubVY5dDlaVnRjOG45azVHMWpi?=
 =?utf-8?B?Znl1a2lrQ1NwMXUrZzdEa1pPTW12NVRORC9HZG1NYXBKWmhQenYrVHM1bURw?=
 =?utf-8?B?R2RybXpUWDZPVmljbmFDSHZuNUVjaEgwOThWejBZUEZpd1ZYYUw3VDlTTHdK?=
 =?utf-8?B?ak42NU1YUjIwd0s4b29Dc3d6SG5ReDVQdS9rR2VRWm0za2pLQXpidUgwbjhT?=
 =?utf-8?B?ZkRwSkZoUm5tN1M5V3A4SEk3TlAvT2tacVk1UHZ6b0JhT2VxQjVYWWVwRGUx?=
 =?utf-8?Q?zTb2nyiVKyhlVk88jfe2MuERQulS8JVN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVEbFhOdDZGRVg2TTlNeFRLTjJwWWF6cVhqcldBV3hUMHB6bGlqK2dpV3BC?=
 =?utf-8?B?UEVIMGxVbEV4MkNqY1hjUmlqNXoxS2JTZjJNOStvZ09pdXlQVFJEbjMrRXpJ?=
 =?utf-8?B?YmNMSHg0QVF3ZlRBRkRrMG1KQnhRK3VwaTdoTUdUOWxZdFZnUEY5czJoRUtJ?=
 =?utf-8?B?RFFQbnhzUGhMNURiWW5aOHNJMDVSYVV0U3dFdzBDeHRTOGI1YnJTdUhmZXdK?=
 =?utf-8?B?WjJSVWxzQ0o0VUQwS0orMG1kclR4bHZQbFRtVG1UYkMxWE1MVlh4RjdCelVV?=
 =?utf-8?B?S1hPcE1nTm0rcENjSmdoUXlvL0pGTCtxakZKTXhYcWtHbTAzMmFPaEh3QW1Q?=
 =?utf-8?B?dlhtelpTODlQRjdoUkFIOTlBWmFiSS84b2lhaVhsaDkyQ3RZNTQ5cmZlY0dI?=
 =?utf-8?B?QmF2OFBJd090TWg1blBBRHBrSDIwSzBjc3JyUGR4WlJmbEgyeFF0U1ExTEox?=
 =?utf-8?B?d201T0VpV3dYd3pBWFcraUltb0Zyb0k4TDhqakR3OHAyR01ZZ1kzelJQNkVR?=
 =?utf-8?B?RGswSXhWWHk5aG9reWhWN3E5K2dYOTRVV2U5bytsTHhQYVU3SGo0UG1ndkxi?=
 =?utf-8?B?ekNCU3lQcFBrUGMyWlIzVTdRSjlsa0svelFOS3pGYVNqNGRLenJkbUthcERv?=
 =?utf-8?B?NzhoNFgrL3J6RnRrdWhDVlh5Sk11SE9IKzRPY2FMNTV6cUNvbUdhY09xOGtV?=
 =?utf-8?B?Yjg1QTYxNi9rYnh3azNjQmJWRUczSlQxVTJQbkdLMlduUjRRUWpzZHRpYWk1?=
 =?utf-8?B?T2N1dVdYRjZUTWVid1pMMzVFQ2NyYTcwVVQvczQ4Wk1kUjYyYjhibEFvaW1Y?=
 =?utf-8?B?MmdGanZsRlYxYzh6M0MyTkJxZjZqVkNRckQ4dmQ5d0o3WUEyMkdva0M5dWpP?=
 =?utf-8?B?VFBCMjV6TXEyTjFyREc2d3Q2bVZIbGhnb2VlZy9kTEx5UVVmcG0rbHdNT2dh?=
 =?utf-8?B?V0d3MXJpOEVSMy9zVWExRU9wQ3JnUUw2ZE5TNlloYjJiVXIrTWlENTV3dzh6?=
 =?utf-8?B?MStWZmxJUkZBMktQcGhLNnhPaE5hbGhGNDRQSEsrVHpoQ1BFQWVsSHVFaVJ3?=
 =?utf-8?B?S01DSFJ2c1BQSTl4N25DQlI2SVF1UXozWTZyNVVtU1E2QzBUK2VQK0pUTTI4?=
 =?utf-8?B?cHhiQXFEalcxTUxyRXhCNzhINTRpZzNyaXNnS2pyZU1CMEJjVnljVFhodEcr?=
 =?utf-8?B?MjJ3aFVtaG1oOG5pbHREa0pQWW1wTG8zRjZaeHJ2UHhPVzBsdXZqa3ZvTEkw?=
 =?utf-8?B?N3lXV05HMzU3WkM5VnNXNGNua1I2VjVZZlVHUlpHcHNJaUwrOGNXc1BmaG5R?=
 =?utf-8?B?MVB5YUsyOU9IT3hYbS9pNnFhemdqNGI5T1RDRXBoREE3QldMbERKQUhqM2xk?=
 =?utf-8?B?SURudjVFUlQ0ZEdKdmJJSmEvSkVlRjVGR1FRSUNtT0gvcnhCT0theFlpTEZF?=
 =?utf-8?B?aUFxVUpHWUhoRFJWNFRwZUZuNUlnRlpTWi91NFJvOU9nNnFNaFl6Z3VVeXdm?=
 =?utf-8?B?TmIrb0JqLzB0NU1XS0ZtOUpiUGk1SjFhbWpya3F5bXVlaEhJQldwNGlJQXB5?=
 =?utf-8?B?UzdKRGxpcW9IT1hSUDZWTk92SDROeVRQOG5QTmVtMCtXdE02TWR6QVJwOWlk?=
 =?utf-8?B?dzBjOGxGTWttQXlnemc3TVVNSmpYY1VSU3R3VVdtOHd5WEMyekx5QzRqdno2?=
 =?utf-8?B?UFJkMFNUZ1kzdzNyd0hJcThUQXRFRFlGMVhNZVp4M01xWkdEVEhEU0UvTkpN?=
 =?utf-8?B?d0V1UUdHSWNRT2hGT2J6THkyZy9SNm44TW9WVVVRcmQva25XaWEvYUZucUN2?=
 =?utf-8?B?N0ZYVDFDbDBidmdSbURFVDJPNU8vcGQvazZvYmhuWjdyWnArSWQvbjhnemY4?=
 =?utf-8?B?dDVvRDE0ckVVaTZ5R2dRU1htN1ErK3o0RjRHQ1Y3dkJPVG56MUhuQm1DaitE?=
 =?utf-8?B?Y0Nzb2M5ODFCWlVVYUE3UWtMR1dtb2ZJVjMxcDRmd2JOZElJeFhEb25BVjJn?=
 =?utf-8?B?SnhLcDF6TzNDRTBKRFI5bzIvbEdRVWg3ajBaNzI0TFY5Mk5jOFVGbXN0a0px?=
 =?utf-8?B?QXhOczdkR3RyaExHazFYQkhWanFpTkticVVUTVc3cHN1dy8yUkVwYUJSWlBO?=
 =?utf-8?B?NGxIWGVFSjJRaG8rWWlNelRWZHdlcWdHUHFPcmhmdEZ6TVkxbTlBZU1Nd1VS?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fdf3ca-d5db-4326-cded-08de00b7e748
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:19.7652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DN1sH9LEONKuW9QCDoqDVKfA2DKWuDdIxInNAeXbw+h9TMfRN8kOFhLv20yK0vmp+MBfGoWEMMerwmt8uLO7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

Add support for splitting device-private THP folios, enabling fallback
to smaller page sizes when large page allocation or migration fails.

Key changes:
- split_huge_pmd(): Handle device-private PMD entries during splitting
- Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
- Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
  don't support shared zero page semantics

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/huge_memory.c | 87 +++++++++++++++++++++++++++++++++++++++++-------
 mm/migrate.c     |  1 +
 2 files changed, 76 insertions(+), 12 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 483b8341ce22..05c68f5b5fe3 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2872,16 +2872,18 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	struct page *page;
 	pgtable_t pgtable;
 	pmd_t old_pmd, _pmd;
-	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
+	bool soft_dirty, uffd_wp = false, young = false, write = false;
 	bool anon_exclusive = false, dirty = false;
 	unsigned long addr;
 	pte_t *pte;
 	int i;
+	swp_entry_t entry;
 
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
 	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
+
+	VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd) && !pmd_trans_huge(*pmd));
 
 	count_vm_event(THP_SPLIT_PMD);
 
@@ -2929,20 +2931,51 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	pmd_migration = is_pmd_migration_entry(*pmd);
-	if (unlikely(pmd_migration)) {
-		swp_entry_t entry;
 
+	if (is_pmd_migration_entry(*pmd)) {
 		old_pmd = *pmd;
 		entry = pmd_to_swp_entry(old_pmd);
 		page = pfn_swap_entry_to_page(entry);
+		folio = page_folio(page);
+
+		soft_dirty = pmd_swp_soft_dirty(old_pmd);
+		uffd_wp = pmd_swp_uffd_wp(old_pmd);
+
 		write = is_writable_migration_entry(entry);
 		if (PageAnon(page))
 			anon_exclusive = is_readable_exclusive_migration_entry(entry);
 		young = is_migration_entry_young(entry);
 		dirty = is_migration_entry_dirty(entry);
+	} else if (is_pmd_device_private_entry(*pmd)) {
+		old_pmd = *pmd;
+		entry = pmd_to_swp_entry(old_pmd);
+		page = pfn_swap_entry_to_page(entry);
+		folio = page_folio(page);
+
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
+
+		write = is_writable_device_private_entry(entry);
+		anon_exclusive = PageAnonExclusive(page);
+
+		/*
+		 * Device private THP should be treated the same as regular
+		 * folios w.r.t anon exclusive handling. See the comments for
+		 * folio handling and anon_exclusive below.
+		 */
+		if (freeze && anon_exclusive &&
+		    folio_try_share_anon_rmap_pmd(folio, page))
+			freeze = false;
+		if (!freeze) {
+			rmap_t rmap_flags = RMAP_NONE;
+
+			folio_ref_add(folio, HPAGE_PMD_NR - 1);
+			if (anon_exclusive)
+				rmap_flags |= RMAP_EXCLUSIVE;
+
+			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
+						 vma, haddr, rmap_flags);
+		}
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -3026,11 +3059,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_migration) {
-		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
-			pte_t entry;
-			swp_entry_t swp_entry;
+	if (freeze || is_pmd_migration_entry(old_pmd)) {
+		pte_t entry;
+		swp_entry_t swp_entry;
 
+		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			if (write)
 				swp_entry = make_writable_migration_entry(
 							page_to_pfn(page + i));
@@ -3049,7 +3082,33 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 				entry = pte_swp_mksoft_dirty(entry);
 			if (uffd_wp)
 				entry = pte_swp_mkuffd_wp(entry);
+			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
+			set_pte_at(mm, addr, pte + i, entry);
+		}
+	} else if (is_pmd_device_private_entry(old_pmd)) {
+		pte_t entry;
+		swp_entry_t swp_entry;
 
+		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
+			/*
+			 * anon_exclusive was already propagated to the relevant
+			 * pages corresponding to the pte entries when freeze
+			 * is false.
+			 */
+			if (write)
+				swp_entry = make_writable_device_private_entry(
+							page_to_pfn(page + i));
+			else
+				swp_entry = make_readable_device_private_entry(
+							page_to_pfn(page + i));
+			/*
+			 * Young and dirty bits are not progated via swp_entry
+			 */
+			entry = swp_entry_to_pte(swp_entry);
+			if (soft_dirty)
+				entry = pte_swp_mksoft_dirty(entry);
+			if (uffd_wp)
+				entry = pte_swp_mkuffd_wp(entry);
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
@@ -3076,7 +3135,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_migration)
+	if (!is_pmd_migration_entry(*pmd))
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
@@ -3089,7 +3148,7 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze)
 {
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
+	if (pmd_trans_huge(*pmd) || is_pmd_non_present_folio_entry(*pmd))
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 }
 
@@ -3268,6 +3327,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
 	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
 	lockdep_assert_held(&lruvec->lru_lock);
 
+	if (folio_is_device_private(folio))
+		return;
+
 	if (list) {
 		/* page reclaim is reclaiming a huge page */
 		VM_WARN_ON(folio_test_lru(folio));
@@ -3885,8 +3947,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	if (nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
 
-	if (!ret && is_anon)
+	if (!ret && is_anon && !folio_is_device_private(folio))
 		remap_flags = RMP_USE_SHARED_ZEROPAGE;
+
 	remap_page(folio, 1 << order, remap_flags);
 
 	/*
diff --git a/mm/migrate.c b/mm/migrate.c
index ce83c2c3c287..11fbfe905e3c 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -307,6 +307,7 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 	VM_BUG_ON_PAGE(!PageAnon(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(pte_present(ptep_get(pvmw->pte)), page);
+	VM_WARN_ON_ONCE_FOLIO(folio_is_device_private(folio), folio);
 
 	if (folio_test_mlocked(folio) || (pvmw->vma->vm_flags & VM_LOCKED) ||
 	    mm_forbids_zeropage(pvmw->vma->vm_mm))
-- 
2.51.0

