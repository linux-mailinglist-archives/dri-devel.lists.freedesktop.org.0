Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26600BAF52F
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3C010E66E;
	Wed,  1 Oct 2025 06:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nz2zgYgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3ED10E66E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIhwR41HcP8J7QT08CrLXD4iPTw3o4kcCjajelJPsjR7r2yNocIQpWRPK2tsq+j/2i0fEX69g5neJgcJe/cj2whe+yMrv1xc/V+s+PfnN+ykf6+m2kQemEg6sM4AaqNmj/ANyMGwovAwRDp+Wz3eGkH6jD6QTZHMzlFiM6cFIedb6Huddok+p2MG2PVWsChypwt2lhEYgZZZMccM6qQ9qix/zgBUXOWFKLIjl8q8Azuof4m4ZfWMGvnBfQE90hkIvlZ8sp26mJQvB5+Hyipl180z27CuTfnHta9MfpBBz1xxzJ841anqQhAjOhKe6HYx0EfDBH/csZWDLngI6cbirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T5qJA1XYVBPoFNxXYiiw31s4oulVwBVgK40oU3nOH0=;
 b=pg2jADA6vkvgiJqZ5REsiFmcTaVNP8ns0llZSjGxoerqawmyFW9ZlfNR9oSrDCadBJecA5gcRhtyuWE8gYkcn5NJvSo5j8FZ1FmCZ5h5IX01WlCLQMUgwRocSGiS+zeJvE61FPWPK3kiJzpRGVx5TcFYfNpgdyCvYZdC/N/nYo989EcoZXiOmaRQh3zEtpq0zyvRI39M2EWagTmaxMFEOA2W1ln4P8ZMeohv+KkPbU3C+X6fJsXHG+qbg3Q71jKD+svqQTY8IyNhnUDlALWuxJlSgEwBjXg286gZ+O7zm6IXfF+BDPT6hhEGh1zgQI1K4gOOgForGuQGGpUx6BaDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9T5qJA1XYVBPoFNxXYiiw31s4oulVwBVgK40oU3nOH0=;
 b=Nz2zgYgyHyFKLJ2frZ82GHk0vYJrrYAQce5PxkmpgDerK5JlYWBT2+k3g+46CE4ynputwvHH17LUgQW2RXGr8A7AlMo1Dv5cgFQOeHRZzC4K79ZFx7QvZSAbdIYiGOgZGugCpCk5mbieyXi67+DLqLYvvbbatp+ThJA0VZgBFipbhTJ/6UsRf9r6p2Tf1T4j2c8TR7jEAsuxtTQ9x3Vo0k3LEKalV6DUpMW+Fk9XXfONXpgPkf8VaLaSz9bQs3sLMzm7g94S+gi+/nWPMKYnN6Ph8dpWJdCAZsB0cPkUnYztKAMw5ouzD1x/ewpTy1ZLP+k/gCH987QNc3gpLzFJTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:41 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:41 +0000
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
Subject: [v7 10/16] mm/memremap: add driver callback support for folio
 splitting
Date: Wed,  1 Oct 2025 16:57:01 +1000
Message-ID: <20251001065707.920170-11-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:8:2f::34) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb4da98-0713-46d5-7696-08de00b7f463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WExrTmVsaUo1Q01vd0grbEFJdVZVZ1I1ZDdXTmNiT04vMGtDSGVpSHRsYXBh?=
 =?utf-8?B?K3B5aUJRKzcrWGtRWDMra0wxVCswM2JEQnFwVlA3TGdGQXgvRzNpT1Z5OXcx?=
 =?utf-8?B?RnlBTWtGaEFpR0hlODZIZ3ZsRWpsalNOODIzSFlzWVJiZ0RKTUlxNHJ3MEx0?=
 =?utf-8?B?S3hUWDFFWExZVEN3dDcrYWRSc3pscDFteVJtRnNQNUZlWHhPaGJ4YkN1ay93?=
 =?utf-8?B?eGlpTEhyMzhIemE1UGRlcVpUc01aaWZvOS8xNis4VE5NYmxjY2Q1QTU0U0NL?=
 =?utf-8?B?U05FekM0aklDR1N6UW1oQWg5dkVkS3dTMDFGT1N4d2N3YUgva3ROek5hNjc4?=
 =?utf-8?B?NzdpeTJtTmZORUlTY2ZmYkJFZnVNNjQvVDVNNlFmWmduVWR6UWUvOEZiL0pI?=
 =?utf-8?B?K0xFank2YXB2SEcyVi9PSjVNZFlpUDNZS0dpK3BaOU8zem8rNDI0MzNxQnJH?=
 =?utf-8?B?TWZhQjR6aXZqVkUwdTRvQVBpZTlFZ0pVQjBPWGN3dk8yV0l6a3RVaWxoWmlH?=
 =?utf-8?B?ekhmMkxRS1NKVEJ6cHl4YzdJeFNmSWZ5M2oyYXN6S2dqT1p4RTJYaFpkS0lR?=
 =?utf-8?B?bmVGWFNBK3hIZFB1NzliOUIwWXRHMkhESEZKbTRHVWtFY0JqeEVQeHFiREl6?=
 =?utf-8?B?YndRVHkybVo1eTNqbUpPY2pLT0cyQ1hCRjFIUnJDY2NJbGE0dlkraER6STRM?=
 =?utf-8?B?MWVMaTV3NUpYbWxEbmUwRkgvVzRUb3hPZVRUVnBxV2J6VTVDN0pWWlpzbDFy?=
 =?utf-8?B?eGpXZ3BXeXRJRkVFQythSTI2YzFjTVhYMzFMNnZhelp6TFZ4OVM2VkVoYjU3?=
 =?utf-8?B?MmQrRWswdzZMYlVwS09IbUVIM05zNHJGd09QdExCSytkZXoyWWNKRXlVYTBY?=
 =?utf-8?B?cWJIM0lRbGQ5UFNDN1I2QVl2MW9Yc3hUS05KdkVDakZldmRLVVRKZEJyZi9l?=
 =?utf-8?B?WDlSUlFzU3ZaWndlWnRyKy9sMHhLSHc4bEFISkV6RGdaeURUU2dKTXNiMmJ3?=
 =?utf-8?B?d0U3ZlZ6UWh5dDlLRjVoS2VoTjJqeTUyNm5BbEhnRWp0b2k4RzVXV2FVN29r?=
 =?utf-8?B?N2U3ZHFGSFliUmQ3dVJJaFJtLzNvWDVuL1dMRHE4dG9UYUU4YVNrRTFYNE9Q?=
 =?utf-8?B?TnBJRHUvWndYVUYvTm5NWGpiSGRnVTJtQ2VpeGRRN2d3ZzJoRTJybDJSajNF?=
 =?utf-8?B?MjgvUndTTW9SdE5mR2tJQnZZSjR4LzlPQkFOc0t4cUVGbG1GYzdaTStoaTdB?=
 =?utf-8?B?VWVuQjhIUTVkdjNkNFlHMFNnaVFDM0JJVkNNdzFGNEc0ajhKSHZMZGV0K0JT?=
 =?utf-8?B?WUgrbFdOK3Zmdkw2bE84K2ZRRzJ1TEIyN05hOEViYkk2MnhlMDVXNHBkWXFJ?=
 =?utf-8?B?ZUl3MU1LOHdIb0ZEVjd0UjRJRExKR2pVYWR3emlpcFlaZGQ5cXV2SjBjeHBz?=
 =?utf-8?B?VzFqZmZ1OFJNYjdHdjBvN2x0cFhZaDYwdHh3QUZnNG5pWlpobVFWRFVUbDNN?=
 =?utf-8?B?S29tWlVUYVZaOTRJMnJlUUlCNTVWTkF6TnZoYXF2UExSZ1VxQlVBUWZ2RVdu?=
 =?utf-8?B?WlBJSFFJNTlaeHRRck04QlllbitzWUlyNlkxYjBoYUd6eVJ2bjZNTzFSSk16?=
 =?utf-8?B?anpzalZySWNoNTgwa3k3UkFYQmlEMS96VEJUa2J5TW8xSUNqdXV1Z2JMMjUz?=
 =?utf-8?B?dmg4QWMvdU1EQTZyMzRvWDZXdHFKMlErUVZlY3FRVi9ldEpwREpnMDZRcVJN?=
 =?utf-8?B?ZXVLSC8xSldxTTJZZFArTHhlSFNEbEkra0xaVmdZYTdYaHZUOUdHNjF5dUxP?=
 =?utf-8?B?VWZjMThQaGZBa09aNnVyMUlScG5WTE5rTHdVNE1uNVRtVFhHazMyRFlUdEtX?=
 =?utf-8?B?UUViV09ZQjEyUlMxb2wzcnhFSDZlai9DNmNwZ3YwN0svWnAwY25aMGZlNlo1?=
 =?utf-8?Q?86wfE/aNxPSWkI94kWptYO9bPZ9jUoUW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0lDamVuTHQ2MDlRTmgreGRFTGpxNS93ZHRvUG9QdWF1T2dBTnd2V2tZZ2tK?=
 =?utf-8?B?VGZNaHdzdmJ5VFBvREZZdVRaRFZ6RGdWV0EwNWhDZ2xyNXA5aVlXczIxRHRz?=
 =?utf-8?B?b1o2SEhWanltLzZkMG9FdGJIcmloaTVRWHBWRG4rZ2RzMmZ1TUE0dEIyMjNW?=
 =?utf-8?B?REtSdnhOeVpIZkpWeGtIekZzVkdmeWZKckVld0NiSjAvZE9yZVE0cVFIRGRh?=
 =?utf-8?B?VktzMmdJOFA4a3hrU1hJMnlqdU84NTRaTkRKTFg1Q01NeGFyNHpnM0x1OTFk?=
 =?utf-8?B?Zy9oM1RIMHF5dGJSRTBDYWo4U3pDS3NLWFkybnhaZ2NtSjlKZUZjT2ZEQVlS?=
 =?utf-8?B?azlxdzlRcnFWaERnS1FHZDJEeGk5QzF6RXJCOXVKNm5UNkJkeHE2cnNsRGRn?=
 =?utf-8?B?Tk5FcjNnLytEb2R1cVVCV09RbEcxMjQ5dUxWMHZUanUrZTFoWFc4N3NyZUZH?=
 =?utf-8?B?eEZpNWNuMjNsZWJqSDB5dEl0L3RmSFdsd1gveVVSZVNNY1JWY0VQSzNNTjNO?=
 =?utf-8?B?eHcxbVEwSVQ0dUIwUW91QzVHTyt5Q1kwOUJnTDJVeWpsdUQ2Z09yNDkycjJL?=
 =?utf-8?B?OEdWeWg4UDFPOGxMMHMrTWQrMzV3bTZHNmVQdTBXd0o2TFhUcVBzL2NGZ3BF?=
 =?utf-8?B?ZUJEMkJSNjlLVENoUjljT1lMQW5aY0d3TVVPSnBmNVQ1a3IxeVg5bm1BZldG?=
 =?utf-8?B?bUloTUtQWS9rbkFrRGFnWlZ5UHYrY1RNOGtodnhSQ2JRRzhXOXd1VG10alZJ?=
 =?utf-8?B?eFNMRGx6enpTY0svbC9aS1F3STlkQnBtYmdmbjhQOVdTQVJkaTN6Q0RyT2FG?=
 =?utf-8?B?OXp6aFNnQm1qemlxNkw4bTRlVjE4Skw4UzJSOUZZZ0hmTlF5ZmNSSWpGUWta?=
 =?utf-8?B?WGF4MEdQbGRUemJmYmQySWlrWkwxYklNMXlXWXAyKzFQRXRnR0VzMi9vN05F?=
 =?utf-8?B?TERYcFU3bzRZcE1tWDBjbkMwT1hCYkh5S0hjUDBBN2l6YXN2VFp5Y2JuWjVo?=
 =?utf-8?B?c3Z5REdmN0UwS1RrUXQzbDZhcFB5Rng5Y25sT3NqVDlmdWgwYURKUHd3SEI2?=
 =?utf-8?B?TEhTZzVUTWpDNCtPWjhRRytWUy8xVld2dGdxcVVKZDd3bGFDNnVya2lZSXlF?=
 =?utf-8?B?R1hqTGpFb0FlSHA1QjJuOG9ucmtzZSs3RmpvdXpCTURra0laaUtkNU9MOEhV?=
 =?utf-8?B?VGRVYVl4UmZsallnY2V6WnhROWx6Z2UrbUdNTnI2WlhHT00rSzFONGFySkVC?=
 =?utf-8?B?YU5HbExMZUYzbzhCbElyNS81RnBkZzRaNEt2U2htU09EYWRyaVlvUWIrMElI?=
 =?utf-8?B?ZHpNclNuVVMyVkdOUUtnUXRucVNpKzlBalBBQkR6RCtOYVJRMmJhU1RDTUxT?=
 =?utf-8?B?aG80MkNEck1VUVVNWnVKNkdxclVwWFArZnRRb1NCRTBSZnl2ZWJPMWROT0xz?=
 =?utf-8?B?Z1lKK3dpSVE1dThVVTBidmJ6RUwwQ1U1cHNVY3FyV0NLeEtBdmNhbXZicHF0?=
 =?utf-8?B?RTE3ak5wVHRtNG80NnBFbWlxeS9SaWNFTXZOMjgwRXdIaXNlb2g0Zm9QYmVn?=
 =?utf-8?B?WWl5SkFYS2k5K2RsTm11WGJhY05vTDBLY1dnakplYktMU3F5ZUJDanMraGdl?=
 =?utf-8?B?engrQUI0NXVVRHJ0UTVQcEl2RmV6QnN4RVNLeGJZQ0hEaXFJUnJpR0NPM0J2?=
 =?utf-8?B?RXhKUmVpVWQvVjVsMUhVcXlIandQTTVHVnRyZjREVDdyQ0UyVm5BQStGNHMr?=
 =?utf-8?B?Uzc4c3ZuREFEYkIvaE5aYjV2UU9xWGdhSW5xaG5BM0I3ZGxKZGh3R3BzbHNt?=
 =?utf-8?B?Q3Y3MXJkRVRERXQ3UTlpUzJxTW40VFpsYkJDbjdjUGFvekh2T05hTC9JekdN?=
 =?utf-8?B?aFhVMEgwSUQ0bENNZGIrcU41cEUzejdRUGYvUXArQ0ZSQXpLSkRiZDVVMzVU?=
 =?utf-8?B?MXJwbCtzdENocnNhV1pxUUFIWktCNm0xTE16allpdnUvbnA4QlZ1TXFmY0h3?=
 =?utf-8?B?Lzdtc3BDVU5jKzBScndRYnBJTUt6RkVFcGp1MHpSWElTTnkzYitjOFZ6RTRk?=
 =?utf-8?B?L2xLVlRIVXVydzgxc3I3dlkrSVJpZ1p0aEwvTVFQWlpZd0pxekhpVW50djY0?=
 =?utf-8?B?UzR0bHZOMGlicjZ4cVprNWxJd1J3ZDREOVhpWS9rcEV6djUzS1Y0N1FhSFM3?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb4da98-0713-46d5-7696-08de00b7f463
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:41.5356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66w4XQuX77N9MxPFh03HEcV9Ofgv30/1nx+YqAnmMQDlIwdfTZMWIUUSX13aU2fVn+RWpN0WsOA5/Tr9DMbqLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
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

When a zone device page is split (via huge pmd folio split).  The driver
callback for folio_split is invoked to let the device driver know that the
folio size has been split into a smaller order.

Provide a default implementation for drivers that do not provide this
callback that copies the pgmap and mapping fields for the split folios.

Update the HMM test driver to handle the split.

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
 include/linux/memremap.h | 29 +++++++++++++++++++++++++++++
 lib/test_hmm.c           | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 7df4dd037b69..aca2b16d6889 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -100,6 +100,13 @@ struct dev_pagemap_ops {
 	 */
 	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
 			      unsigned long nr_pages, int mf_flags);
+
+	/*
+	 * Used for private (un-addressable) device memory only.
+	 * This callback is used when a folio is split into
+	 * a smaller folio
+	 */
+	void (*folio_split)(struct folio *head, struct folio *tail);
 };
 
 #define PGMAP_ALTMAP_VALID	(1 << 0)
@@ -235,6 +242,23 @@ static inline void zone_device_folio_init(struct folio *folio, unsigned int orde
 		folio_set_large_rmappable(folio);
 }
 
+static inline void zone_device_private_split_cb(struct folio *original_folio,
+						struct folio *new_folio)
+{
+	if (folio_is_device_private(original_folio)) {
+		if (!original_folio->pgmap->ops->folio_split) {
+			if (new_folio) {
+				new_folio->pgmap = original_folio->pgmap;
+				new_folio->page.mapping =
+					original_folio->page.mapping;
+			}
+		} else {
+			original_folio->pgmap->ops->folio_split(original_folio,
+								 new_folio);
+		}
+	}
+}
+
 #else
 static inline void *devm_memremap_pages(struct device *dev,
 		struct dev_pagemap *pgmap)
@@ -268,6 +292,11 @@ static inline unsigned long memremap_compat_align(void)
 {
 	return PAGE_SIZE;
 }
+
+static inline void zone_device_private_split_cb(struct folio *original_folio,
+						struct folio *new_folio)
+{
+}
 #endif /* CONFIG_ZONE_DEVICE */
 
 static inline void put_dev_pagemap(struct dev_pagemap *pgmap)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 32d402e80bcc..46fa9e200db8 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1654,9 +1654,44 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
+static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
+{
+	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
+	struct page *rpage_tail;
+	struct folio *rfolio;
+	unsigned long offset = 0;
+
+	if (!rpage) {
+		tail->page.zone_device_data = NULL;
+		return;
+	}
+
+	rfolio = page_folio(rpage);
+
+	if (tail == NULL) {
+		folio_reset_order(rfolio);
+		rfolio->mapping = NULL;
+		folio_set_count(rfolio, 1);
+		return;
+	}
+
+	offset = folio_pfn(tail) - folio_pfn(head);
+
+	rpage_tail = folio_page(rfolio, offset);
+	tail->page.zone_device_data = rpage_tail;
+	rpage_tail->zone_device_data = rpage->zone_device_data;
+	clear_compound_head(rpage_tail);
+	rpage_tail->mapping = NULL;
+
+	folio_page(tail, 0)->mapping = folio_page(head, 0)->mapping;
+	tail->pgmap = head->pgmap;
+	folio_set_count(page_folio(rpage_tail), 1);
+}
+
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
 	.folio_free	= dmirror_devmem_free,
 	.migrate_to_ram	= dmirror_devmem_fault,
+	.folio_split	= dmirror_devmem_folio_split,
 };
 
 static int dmirror_device_init(struct dmirror_device *mdevice, int id)
-- 
2.51.0

