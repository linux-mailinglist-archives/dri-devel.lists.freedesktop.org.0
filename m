Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3D1B595FD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BEC10E7CC;
	Tue, 16 Sep 2025 12:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mV80d2tc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A6410E7C5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:22:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBz5/YH/MoKLZcAftoxYXjhXWMlHj/ebSFHmrdwc3p8aJwh8M9PDctMypPY6MqrB6W2JfYkzO9gItgeDhxhd70XmQrorv5YrQGmsklpDMSfMkIp66CId0xAijGstTkOBa6AFvf8LEgpnyN7V0Z1Q41FJbGL4BGPWTFh56zeqPZFxbknKnl5QQKxvWFhrLSfn4P3TC3lE9mDc39n/yZPi4YYJOiHZw4e2QqyEEShITgnTmVzAtuNyrFwIJEkV/vs+AJlTZoPtRgnaylw1zpaNEX1SsZ7oSLXM02IASeNcvxW2RSZrNha6EGsYGwOkYoxul/GQlkg4NWGNiK79kcjZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJSFdPl0wgp4h8sN5D7p4Hfx5Dv4sHLnsIiWVtKBxa8=;
 b=FaKfGDfTi5GkB+dtHyn7EjBXwUx6VOzOcVPUdamdUwH/Z333NX9z7X7QCGDaoln+6WvjUeQTcAVBi7GAdA+hIyLqEjKHpDR7OaUB8uXxBnuo8XRznvoB7cphNydkn5GMqlAb2WjbG8Fu5sIyrnCHU4Vr/5stvKMnY+rUf4bW0iOxJDqE+KIEyTFwjsI4tQtXflBm4etDTHulbjlR2dJHr57ilw+GKo63KQXpeToKK2l90MXpGFGLJP9VAjNAkjTtev+DxQM1TKbqWunzB83o2l+teXMvVcb8v03SzuZO1NVXeZMDZLNasmgZOzSsgGLFj4PZfbdkYgslC/+Q3dg4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJSFdPl0wgp4h8sN5D7p4Hfx5Dv4sHLnsIiWVtKBxa8=;
 b=mV80d2tcM2Rf9tRXiayghGDQEsxZlvvTvTnyjwNn2xggud8GoIRwYmgWxI6FgodDlmmcJ3a7lXIjNiZJawFi9fKhe6cOMIFdr5l9UXJeeX8d8esHbacCIQec+H6pplmaoc/aO0pdGuUrDn+RbInrIoYv02L9EWuCq7Qr100q7VZkciMmlnGaYObJxEQx0XErZeYQmyelGIoFA9vCQNnl1DCdxaYw1wgHpMM/hNgj8wYFr0lWAqtoy8G+QClQuOwu10/Hk7QIve4KDp3/2Vr8AnfitiSR7BUqWt4P90cbh7gHa9zx0dCS77SDjGPOdicIP4c4O1OpPvMgBWR3XRkD7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 12:22:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:22:16 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
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
Subject: [v6 11/15] lib/test_hmm: add large page allocation failure testing
Date: Tue, 16 Sep 2025 22:21:24 +1000
Message-ID: <20250916122128.2098535-12-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916122128.2098535-1-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYCP282CA0007.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::19) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f83e8cf-d414-4bfd-f36d-08ddf51bac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2NrRC9FRnhBa3hMN3lVWXUzMHRsdTFyQm92eXhPaTRQeHZQY09KSzFOODJY?=
 =?utf-8?B?R2k4c2JRdzRWWUxjTFRHWFNlSTlob3dNMVJpVmV5VlpJVVRISFUxU3N3c2I3?=
 =?utf-8?B?TnFIdEVJTE95TERjRXYya0ZlVzkwZ012MmtqdmFRSU11bXovcjQ4SWdpMkZD?=
 =?utf-8?B?OXF5OG1GNDd5R2h4eUxicXJMR0EwRHY3VUw4QmJXam1rbmVsZ01aWXRkb0ov?=
 =?utf-8?B?dDJ0a0d3dFlybW1VbHZYaFlhSlNWUkIxZlhwa2U3blBwU0dXV2dMcjI0anVq?=
 =?utf-8?B?Ujh1dnRiaFhwRjFQRE5QYU9wRGtESUFlSk9ESnVRL2toVHdrNENtK01teVZ0?=
 =?utf-8?B?MWoySkI3eXY0VlF2dkp1cW9oSGRIbkhXb2czZU1oWksvcXYzN1I3dC9IM25w?=
 =?utf-8?B?d3BySk5sS0Rub1ZLSFZJeVJGNHNSOTV0MEt1ZnYrcXlCN0R6RTl4Q3p2emty?=
 =?utf-8?B?cGJtbXdUZUVqZVAxNENMTnRDTUFEQ3Z2dDUwbENHUnF6Q3p2cHVJNWRBWUhD?=
 =?utf-8?B?YmNmK0tnV25URzBqeEk3eGhkQ3JFcGRGQW4zWXJ1Y29EK2ZBeXJjOGlpMkxp?=
 =?utf-8?B?N3VDekNRWXdpdTZiMVVPVUlSMVhSVkcrT1kvZmUvQ0tZTEZjdWFnTWF4VlJZ?=
 =?utf-8?B?Z1hjdnVrWXFGTTM4T1FCenNJbXAwNmQzZEtGcnJVU0dFcEh2a2pTNUtMK3FY?=
 =?utf-8?B?QjZHK2hwWWxrRm1rT3lDeHpBM2tpL3pORDd6N0d4OThONlZIQlBJZ3g0WTcx?=
 =?utf-8?B?b0QzK2t0amltdy8wckVUU0VFeEdQb0Q2cGFvcEhlVnFmOXRHbURvNGs2NUl4?=
 =?utf-8?B?VHA5MkN1YlRjc0xuVWlDNWRrUktxSm5uMy9SQXpnM3Q0S09GTUhXdVQ3K2dx?=
 =?utf-8?B?OFZOWGhCVHlCaWtMY29IQ0RRajNsanVOSnJpTWQ4RDkvdHM3RUlJYnErLzZ6?=
 =?utf-8?B?WGVkV1RVVm4xcUc2U0dRTVBoNWQ4aFlObzltVHFlRDF3Q3lONDFxNjlZdHJ4?=
 =?utf-8?B?RlhqekVDT1J2K3IrelhZeHA5ZjBoQWJ6RXEvcjJEanJxSEJ0M0lRRVRGZHFZ?=
 =?utf-8?B?cm91bG9GMytkTVFIUHZzS0Vob2puaGRIY1l4OEhnMFhXbkZqMlVUdllIYU54?=
 =?utf-8?B?MDN2cVM2Z2g5bThmN3lqem51Qy9hSFdJM0R3bHhRendocjJOcFUzRThONWl0?=
 =?utf-8?B?ODdSSHI0RlJHUkNqVER5ZFc0aGdKZGVtclVxdVZHMngyWG8zc0F3OERpeXBF?=
 =?utf-8?B?VGZXNVZiYnM4WVdMYWN6NTNNTFg2OVNFdnZQdkxsRmlZWDl3RFM2eld5dEdS?=
 =?utf-8?B?Q0RTczBSRW1KTDdIOEJMaVAxZHBXbVRwaFJpbTZOeisxd3RwaVJHdVRFakhU?=
 =?utf-8?B?MjJueVE2WksxQUFOT2ozQ0hDYmpIRnhrOXJLbjdaNFl4dkpxZXZURHQydTBF?=
 =?utf-8?B?WjVRck5LMSt6SDJmWmduRlhwdUJ0dHpWVExGTVM0WWE5TzdyVytzclp2MUJY?=
 =?utf-8?B?WHNQazZnYlZjcjR6eDB0bjNzTWVJc21mVzFyYzRSeHVrbXpLcEJUSUlCRDBK?=
 =?utf-8?B?Q2JsTldEQUU4Wis5WFR1bnM2RVBFNFd3QmpkcGd0cUJPNC9KV0EycDRTYU5p?=
 =?utf-8?B?Z3ZpSWRXNGlMeHpNK1pQZjlKN3huSGFzZy9WalJYUE9iWk1jd0F3citNcmdF?=
 =?utf-8?B?VnVtc1dLRVAxNzZFV2NIbVU4WGpZaEgzeVFTamsxUWMxUWNGMFRrUnAyUE5z?=
 =?utf-8?B?ZXo1aURjTGYxbkN1TTBySnV0OFErWGhIbGdaUjQrUXI1eXNSS3pMKzNIUWND?=
 =?utf-8?B?cjBDOWw3SWtNMEZkMlhrVGxNRUxEbVZWNStvTWNIVGgyZCtOeTRla2FCckhQ?=
 =?utf-8?B?WllJcWUrZDVHckxWeDJOL1NVaGVmOEJMZS9WQlNxb2lPVFplY0hSU2ErbjFr?=
 =?utf-8?Q?kxf5ygiBYxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZGeTMrWFp4eE1DY3ZDNnRpTkhtZ0RUWFZHZGNsd1pxQzdpY2NrZmQ0MmVT?=
 =?utf-8?B?ZWR2V2NYMzJ4elN0Ni9PSXVrcFd6U1lnZDFBbnRXYXZ4aFAwQ2t1OGRHRUVL?=
 =?utf-8?B?WHlPbWxsdlovTXJySkpoMnpMRXZrMkg5TUlJZHV1M0ZEZzJzT1A4VXZUU1ds?=
 =?utf-8?B?OHRTU1hQL1NLYWp1MVJZVVZaWkpscTNHb01mY24yak16djFYMTViUWdWQ241?=
 =?utf-8?B?OGNabnBvZW5yQnBKUVhoRkcrQXRaTHRiUm1LdENndTFMaW5CZGVVbEpBUjFt?=
 =?utf-8?B?M0FvZXlleUFKVDVZWUlHR29oaEFSVzdwQ3phT1QrUDZjbXZPaTZieTduVS9W?=
 =?utf-8?B?ZVROckp1NEtsYjJkbldBbmpNWXVqSDFQcXZVdDZkNTByRzlMclQzb0VRVnJD?=
 =?utf-8?B?cW1ZTEJQSWJVaSttKzR2SGRhbHlTSmVWUEQwRUsxZllzTWNnbUFZWXQyZzBF?=
 =?utf-8?B?S1ZhVE14NGdZUDdDWkRlRG4wR0dXckZ4RllnR2pFUVNkL1dtcWlDU29HdFNZ?=
 =?utf-8?B?QSs5L3dvTmNBTmNINzV3MkZSdExNWnRqNjdMUzVOem5vN2RtdDFjK21zVldR?=
 =?utf-8?B?NHJoT3NMTkYxVkdwUEhFQWhBQzBlQmhnRU8zVzFCekllNVh3V2Z4UEVMMGI2?=
 =?utf-8?B?K3o0NEdHQnRzTU8rTWtDdjlRN0ExamR1dko0MkQ4cGN3K1gwT0tyMmtqb0JW?=
 =?utf-8?B?bnpHcTNQY0t0UmNPUVRQenZaZERIenJqN2t5ckJCS0hSRDBDWnphTk1MbWtV?=
 =?utf-8?B?eGFSVGJzZ2dSemNZblhCNEtuL0cwekRPVldscGc4aXBSZTVRQmZMYUp3UG1i?=
 =?utf-8?B?YmJjbklKSWdUeFhUdERLSzhORHY3WVJTTkY3YnVMZVgxYWY3SHFwQU91WnZv?=
 =?utf-8?B?QkZHbjJNNlROZG91WDFvUmZna1ZncjM5TWR1RnM3WkI4TzlSdzR2QnlhQ3Q2?=
 =?utf-8?B?RlJhTTZSR2ZScWM0dXJsczRQMHY3aFM3VkxDeUpEQVA5M2t5N1REQ3NYdTYy?=
 =?utf-8?B?S0d5cDd1QUM1ZEVUMWhmRDRFUUdsRm05Ujl3YkpKMFZLMUsrTHhvSWVQZ002?=
 =?utf-8?B?NlZDVVk3d1BraWVYS3VNZTVuNUNCZE1XeXlDSzkwRDR1TTVIcWtpV3JZZDZR?=
 =?utf-8?B?NHVkU0VGbzdhWVVzQkpwSkdRNXQzS0dueGJ5dVlhUmpGcWtDRWhKbmhUcXN1?=
 =?utf-8?B?S3hrczRXWWI5V3NrQTlJd3laemFmdk4vUVZ0Vys4U2pkK0pEZkk5VWJmeUp4?=
 =?utf-8?B?dUlNVUVVQ05meDJYTzBac3pCN3ZkcndBZ2lOTC9yWHc1clRYRlhnbGozT1dI?=
 =?utf-8?B?YkdLYlM3SVZNOTcvYnJzaUJrQlViblhRTU0yVUE0QWpqV0JuWEg5WVpMdDEx?=
 =?utf-8?B?THRsZ3BnRHNxNDVGcUw2K1ZrUWEyZTQ0T0h2MzI4OXp2SU5qRnRoSEpORWg3?=
 =?utf-8?B?WkREN1lwN0lndThSYk55Mlg1dDdmMmROcG1FMlFseGRJSHZLNlNqaWxiTUox?=
 =?utf-8?B?TG5senNWQWg5Y2phZ3c0YWllK3R2cVFtdVpqcFFGY3lodG9Rckc4emJvWFJ2?=
 =?utf-8?B?UzBoOTE0b29WTEV2dHZlRWhQSTZYSXcxaVFwanh4aUFxMG1JSTduZW5hZC9D?=
 =?utf-8?B?Vm1lVDRNaGZVQTcrZHJTeFJGWWhmaVIyR2NxYm9oMzMrUXVtdDVZR05leW4x?=
 =?utf-8?B?U2ViVFo0RkZXWmJWTG9RbmdBMEtjdGRUci9LdUErT0lqZWpyS05qWDRSMUdk?=
 =?utf-8?B?aVpWM0RidU5QMk5KU1F4QjAveks1WUJiT0Z0TkxZUmg2elJMMDhxVFNUbTd4?=
 =?utf-8?B?eTU4ckJDTVh1NTJlWlVWOGFVQmVMTm5PY2JodWZIRkxiOVN3MkhwSGp3d3A5?=
 =?utf-8?B?bU5LMy9sb3pZREIrR0o5Q2xya0VuN0RhQlFFYlBxR1lwTWZxUU9UbU95YTRT?=
 =?utf-8?B?VW5KUjR3MkRvK21yVms2MzFkeW44UnFld1lnTHZqSzA3MUtwU294RG9GcXE5?=
 =?utf-8?B?emdhczJjck5LNk9yWmwybEpGUVp5R1NXMkRKTGhqLy9jdjR2SElVcWN5WFcr?=
 =?utf-8?B?QzBvb28rc2tVNGNzeTE3RHIxVTJYTCtSY2FXeThjOEx3S1EyMFFFVndZRDlz?=
 =?utf-8?B?dmR1QXZFckhONjc5YjA0cGh1REVhTmNCVXAvVUorVVBMQWFrdlp6S0taVnZX?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f83e8cf-d414-4bfd-f36d-08ddf51bac8b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:22:16.5813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht6nyxlIxMBIJV5UvTyf1rHCcg/VJOF+1bJJeYqjr7l84rDqb1etkcJXaBIps3BM85iIEOKWl4bwWQ22jCQXMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684
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

Add HMM_DMIRROR_FLAG_FAIL_ALLOC flag to simulate large page allocation
failures, enabling testing of split migration code paths.

This test flag allows validation of the fallback behavior when destination
device cannot allocate compound pages.  This is useful for testing the
split migration functionality.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
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
---
 lib/test_hmm.c      | 61 ++++++++++++++++++++++++++++++---------------
 lib/test_hmm_uapi.h |  3 +++
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6455707df902..bb9324b9b04c 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -92,6 +92,7 @@ struct dmirror {
 	struct xarray			pt;
 	struct mmu_interval_notifier	notifier;
 	struct mutex			mutex;
+	__u64			flags;
 };
 
 /*
@@ -699,7 +700,12 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		     page_to_pfn(spage)))
 			goto next;
 
-		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			dpage = NULL;
+		} else
+			dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+
 		if (!dpage) {
 			struct folio *folio;
 			unsigned long i;
@@ -959,44 +965,55 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		spage = BACKING_PAGE(spage);
 		order = folio_order(page_folio(spage));
-
 		if (order)
+			*dst = MIGRATE_PFN_COMPOUND;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			*dst &= ~MIGRATE_PFN_COMPOUND;
+			dpage = NULL;
+		} else if (order) {
 			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
 						order, args->vma, addr), 0);
-		else
-			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-
-		/* Try with smaller pages if large allocation fails */
-		if (!dpage && order) {
+		} else {
 			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-			if (!dpage)
-				return VM_FAULT_OOM;
-			order = 0;
 		}
 
+		if (!dpage && !order)
+			return VM_FAULT_OOM;
+
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 				page_to_pfn(spage), page_to_pfn(dpage));
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-		if (order)
-			*dst |= MIGRATE_PFN_COMPOUND;
+
+		if (dpage) {
+			lock_page(dpage);
+			*dst |= migrate_pfn(page_to_pfn(dpage));
+		}
 
 		for (i = 0; i < (1 << order); i++) {
 			struct page *src_page;
 			struct page *dst_page;
 
+			/* Try with smaller pages if large allocation fails */
+			if (!dpage && order) {
+				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+				lock_page(dpage);
+				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst_page = pfn_to_page(page_to_pfn(dpage));
+				dpage = NULL; /* For the next iteration */
+			} else {
+				dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+			}
+
 			src_page = pfn_to_page(page_to_pfn(spage) + i);
-			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
 
 			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			addr += PAGE_SIZE;
 			copy_highpage(dst_page, src_page);
 		}
 next:
-		addr += PAGE_SIZE << order;
 		src += 1 << order;
 		dst += 1 << order;
 	}
@@ -1514,6 +1531,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror_device_remove_chunks(dmirror->mdevice);
 		ret = 0;
 		break;
+	case HMM_DMIRROR_FLAGS:
+		dmirror->flags = cmd.npages;
+		ret = 0;
+		break;
 
 	default:
 		return -EINVAL;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 8c818a2cf4f6..f94c6d457338 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -37,6 +37,9 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+
+#define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
-- 
2.50.1

