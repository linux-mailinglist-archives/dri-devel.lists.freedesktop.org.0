Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E459B21AD8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A768A10E575;
	Tue, 12 Aug 2025 02:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gyMbyOpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEE310E579
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQ+uJwB8fxPpLpt7T2alc/R9qjcwPLwzSL96J6Ps50LVqfLwpYFtDq2zu44nEAFfOaQTTfzlLBBL7HSOOOOShCApDc6ZQOl3WtH+udtLkk7pYlPDZ4um/pdIWdube4MsR5zjCWv2ph6CWURfdtFBErH1dhaVQS8EFJh8au4fUGzbSax7SQNeL7SN86E4ETgurVRcU+OXjWYIekxCjyB6w+TlLuRHVpQ9MpUNzkpNNwOWbnRoSQUz+NtMbXx12pNfkNFav3VS7zEmfd+G7mpZnHEQQKlV03bDbmpSwUXqnYxD70FkqBtTEVLjGN9oYSFwNlPePQF6Rz2chFCQLyprEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mPSJ6qvXlKqstThTE0pxKrOaVskUrNQDivi0wl0aXw=;
 b=MWdtL6sow80yfHtbVRQwo3l/dhPlAHtwHcrcis/ah/zToVgm4Gqi70yE2zP3LJ3TinKvb5wlSLEKIzNXuo75edG0zkD7JY/0YzohtUyuMAmSAttTKLXSgIojcrFxtswBwAjw8fth3tkHJsyIWLbrBTyuU0vP2++dHjpaUacxm4UhpGnSSmvIPXTE6RWfe/G5AFlCThz0A/WGOdBvNIdID+ORxB3J+vPjmdga++GCr+w4ZP9Z80Xb3jtKL9QmIRVfPqcnvW/2eh29k9115fa12M5ni7ewucHfAJKwygSuNe2Ty+/ip5WC5TYKXEHwZFg9z/yFPsJ+kfaf9MYLLaxq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mPSJ6qvXlKqstThTE0pxKrOaVskUrNQDivi0wl0aXw=;
 b=gyMbyOpZyDfh+EL8E4wwWYOThXRBkNhHL+3hcZGx3NHnaQPS105aw1Dft2BgVxnF6Zz+jtVIfVSS65yij8xYTr2c+OtS8gOVnPE3e1LT+Gn/dHnY5qE6Un4f5jLfkS23tjGvcYs8ltzxnmalqmblZ6Qu+yWyUnl7ibx3M9/vyK59hixQKvjXIpg9gUiH3wgv8nbvZzowEwiVg0IMlPA2xCHPD8NHlh1jMioDMVXORpH1+GmsQEcUcWiQOOgAiTV8MBuy5YK+APBc/o3w79u8MvUUz9BPuW1hxFSJt1+/sn49IXJtC7OypURESCCWJtsLh4/Oxw/Bsl26EzufG+vOkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 02:41:00 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:40:58 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [v3 05/11] lib/test_hmm: test cases and support for zone device
 private THP
Date: Tue, 12 Aug 2025 12:40:30 +1000
Message-ID: <20250812024036.690064-6-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812024036.690064-1-balbirs@nvidia.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0072.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c30b656-80fa-43ae-3569-08ddd949ab42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rng2dllEaVZ4UEduUHU2ZGV6enZJN1hmTlh1NmV5NkdZMDgyL1ByUU92SGhl?=
 =?utf-8?B?a3ZBTUNYVDQxbEJTTldlaDBwN29Ya0ZGZzRzVm1lRjQrdWxnMXM5Tlh3Sm0y?=
 =?utf-8?B?c2dVWWdzVFRrblp6ZjhmZEU5dU5TTVhYTUZSV0lHYVg0WHhHdmNUb1M2ZHAx?=
 =?utf-8?B?ekJldEV3OXNhTzh5WWxubENtV3VRVDNUUEttR0ppU1owcGxQL05KaExZaisy?=
 =?utf-8?B?REJmSFRLbk1FUVVURUF0aTRnSHg1RGNKQ3gzWkV1Z056SDFvaVhocTZteUFM?=
 =?utf-8?B?VktEVXB3Q1FGZjB5NlRvSHNOUGdIcnFUZE85MnJva3lnZCtqSW9TR3k2L3Az?=
 =?utf-8?B?SHNtOW1TaFdocG55b0hISW14MjgrVUwwNzVBVlFILzlUNy9xbEhiVTZVcWE0?=
 =?utf-8?B?NUFGQmwxOUhyZWM3VlZncUd1VTN3cEhCR1FsSXk0RUlTN3pEOEZwMUR0TGdM?=
 =?utf-8?B?K3F1SXgreUx3djBkVjRraWdkZ2YwUVhKLzFrZHZRUUJHcGF2TUJzR0U3THBp?=
 =?utf-8?B?RHFHWGd2NTlrQlQzbjR6NGRKRnN0eU1wcy9xR3BRT2tGdm1QUU1DOGt2MkQx?=
 =?utf-8?B?cU4yU1k3QlEyODlsRHNpQWZCcWYrcC8vSmNYeW9xNnhYYmc1VEpvb3AzVTh5?=
 =?utf-8?B?aVZmaEROMUpmTk16NjIzRCtGL0NrQzRxVE9jRFBDVklUWko2ZWhKQ0JvV3JU?=
 =?utf-8?B?Zko3eStlaGQ3VHlxODJSaGdsWVpSbnVSMmFhejFlTmRBNS9aQ3Y4QXFGMFQ0?=
 =?utf-8?B?WWdNK0MzSldBL0MrdjNJaUVMZ2xkR0VmcTVGbTVvTUZWRy9qZTkrTDh2UVF2?=
 =?utf-8?B?bXpOc3BJajh1N2JabW4zMmtLdGxyOFJxOHZLeEpsdDhGU3RzdUZsbVpnYWZl?=
 =?utf-8?B?VkNsbVFIM0VHVnk1MDd1VnFkVjIySmZWUVdrYzdNbXYxU2ZWU01aTmpqSEtk?=
 =?utf-8?B?VVkwVjB6aHFVcWxheWk3KzRjTGt6TUk2Z2Z6bXZwclBRWjk4NFhzVWd5VTBO?=
 =?utf-8?B?UFg5U0ZyNnQwMFRjVkNFUEdKend3WllSeml3OXhpNFE3ZExmWWdpSjhrcUd5?=
 =?utf-8?B?TXgxbG9FeVpaVGJNZC9ibVMyYjlJNkVIeEF6dWpWMit1VnpxTFhiSWRtN1Ey?=
 =?utf-8?B?empqQkk5SWZmR0xiMW83SmdVZUplL3NXZmN5KyttemtoNmNmbkFkYW5hRmRB?=
 =?utf-8?B?TDBUbVZJYXhvMGVMbWUzUXN2MEdBZ0dhUFB6cHlGRFVaOC9MbjkrM2tPZEZh?=
 =?utf-8?B?Z0hiY1FKcVg0SEU0Q3VpWUFNSWNSc1JwcHNwdHdlSUNVc2ZsWnFNYnY0QmNM?=
 =?utf-8?B?dXlNT3hRcTVJQVZrZnNHeTZROGhyVWpHeGVyT3hJZ2doNVFDSW91SkdQZDBB?=
 =?utf-8?B?cm5DWDNsdkpXeEtLQWdLWHpmLzQ3OGlNOGVFYzJuWHpQMktxMENUb3NadVdk?=
 =?utf-8?B?Y0xsUUIzOUdXV3d6QVVrSDUvVkgzcml3L3VNOG9tTmxSb2VwWkFjZjAwRmhV?=
 =?utf-8?B?QnVjYWNiZU1iYWhuT0hTaFI2WVZCaWN2ZWtqcVJ4RFlWSEx6dkxiZHFGbGdj?=
 =?utf-8?B?TFcyd2FabTdKcDlkKzlqUEtzVGdvSFB2c1M3Q3BnOU5xTnBsVlAwVlBNeFNr?=
 =?utf-8?B?dmVnWDdHSThFNWlFY0VYRTgxdkhJU2dBR2hJRUVJQWludk9Cc1FtL2RTUEhE?=
 =?utf-8?B?SStpc1FXcnkzUVRFYmNtRU1UcmRFY1Rub20rVGVESE9MNFkwKzl3RHdWaWRw?=
 =?utf-8?B?em5TaTVnQzZQTHJZY05icWxYYUo5MUZyVUZVMHVNTDgxU1BLeVQ1dXJtNFNk?=
 =?utf-8?B?dmxnSHU0SWVMU0JWeDJjVHBud0xmQ1YxZklaR1EzeWtXczZkUDN2OHR2dXV3?=
 =?utf-8?B?V3B5UFViQTVrNVYvRzJqVEl0ZnEvaFZTcllGZmNmeDE3eVU3L0tyMTNkVkNj?=
 =?utf-8?Q?2AOucBL2bB4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlZXdW1NUndDemFjQTh3QmljT1E0SHhxWDBzMVRWUEdpWWxNTlQreGxTN25G?=
 =?utf-8?B?SUdLdTRqMG9lZnk0Rit5VHo0cEd4cGZuUWI5YnZzUWtHVko5a0NHaHl0YWhZ?=
 =?utf-8?B?SVAzRDlJSDdFY3crSXBzZXhGV05zUy9hSzNrVnFRVXlZNkp4QjlNd0ZjVzRJ?=
 =?utf-8?B?TkU3T3FmNXNWZDRlR1JWSnVPenkxUGVMaGxKNG9NL25HVkVJbEdmVzh1aDFn?=
 =?utf-8?B?YzJPN05YL09tYmhOQVl0TlExZFoydm5CZzY0NlpIUFU0aUNyMEt3UVdYeW9P?=
 =?utf-8?B?amgyUnVuR1NScGtNWWNwS2tkNThpME9KNmdzeE5ZNHJHSWJ2czc2N3lMU3U3?=
 =?utf-8?B?UlJoTUkvdjBhd05zZS9aZC9VSWpFcnNSRW5lQ2xsVnE1cmtqMTFRdzNhaTI5?=
 =?utf-8?B?SmUzUXF3d2kzOU1GNmtWZktlTk9YTzBuaEFobnVCNjQ2WXRSMnhCOHpsbHEr?=
 =?utf-8?B?Vjg3Q25ERVhJT1d6YUJjRmcwMmZ0bitvZHV4a1ZZRElscExRWDIzR1h1Mzdn?=
 =?utf-8?B?SlVlUEhLMGkxRDBVdVovbHRtTGIzM3pPeVgvdHQ1QnFOeXp3WUJldDR5Zi9n?=
 =?utf-8?B?L2ExQWRIV2VucC9sVWpEZGpYVGljVXBkZTRFbFhOOER1em5TSEV5dTRkMllw?=
 =?utf-8?B?WGtXdUt5bCt0c0VhNzRuY0RUL2ZmNkw2eHJOOWlvdFQ5bHZYMmRhN0txYnlv?=
 =?utf-8?B?Rm1WWmdZUEdjUWsyWG1UZFZ2Q29XNElKbnJmOFYvTzhaemJ1NCtvakd4djNq?=
 =?utf-8?B?U2kvTGVqSCt1SGpZK2dKdVl3TDdaNzRrOHVxMC9kT0IyMTBmTkpIVXZQT3FI?=
 =?utf-8?B?L0t6N1VuY1BFTDEvRXova1d6RGR2THVEL3k0anI0UDJXa2FYV2E5Ry9Yc3N1?=
 =?utf-8?B?RjFsYURtT2VNc0dWdEFvVGtoZS91VnlwS2kxMmYrR3lPUG5BQ0trdnZNU01q?=
 =?utf-8?B?YzJwcE5DRWtXQlhpL1dkc3ZJeGRtWnMra2UxWUhpYU5pMXRnZGN5bWJ6ZGla?=
 =?utf-8?B?dWQrN2xJcFpKRVZuem0yMVhEMURtdnZZSkVxNTRyWnlWZmNjeDBTSE45c3Nj?=
 =?utf-8?B?YkF5YytFU1JvWXR1N3I1aVlYbTJ2aHBKNFJxQng4SWYzZWVIY2Z3cys2WFdl?=
 =?utf-8?B?bWQ1bUFKOFg4eE9oTUc0M1hRY2t6T0tpZHJjb3IyM2tKYmR1TWdUUFpMM251?=
 =?utf-8?B?UWM4N2VrWVIyUW1CTWlHUDhTOVBQNDdoR2RXSlkyWlNOQ2ZoOGwxZDBuaWJ2?=
 =?utf-8?B?cW9ZU2JBcjhhOVBkVkJvVW5USENCeUVOVS80L1A3UWFDUHFQOHk1VDU1ZU9R?=
 =?utf-8?B?MFFtOHF3TDN3MUdVVGtrY2VIdlRtTWJLM1NGSU5UczVvdkd1aHhDTmpmVTY0?=
 =?utf-8?B?UlNndTNlUElKRU5lcGp5WjUxL3ZwWmZjWC9DTldZdmZTelIrSXlaQk10UjBK?=
 =?utf-8?B?VXBOaXFkMk8vTEhyUUR3L3BMdTRCMG1PRFhzNEV0N25ibUFOQ1ZQUXJHUlp1?=
 =?utf-8?B?aTVDdmFJaUl2UitBMjIxQVJSTFBvMHREZ0F1Y05XM3ZCVFI4MHN0YmVaVVNH?=
 =?utf-8?B?Nm5sN2FYYzdVM0w1Z1FnWU9nbitiRmExQ1BXQWg4MndNY2s2RG1IdzdGV01a?=
 =?utf-8?B?VFlZZWNPM2Q5dnFZRDBzcDRGc1BWaHBCcUF1NWZxa0t4OUx5Y2d5TllJOVJu?=
 =?utf-8?B?dUExLzd6QkhDZVpQQ3RvbkNZVHhDQThrVG85WEU4TDM0Z2phaUZ0S0ZuNnRL?=
 =?utf-8?B?azFEMkRYTklXYVpOL2xhRWVzSW1wNUtaNjVjWTJhNlY0VHVzN3FSZlR0SmM4?=
 =?utf-8?B?K2o2cUcwVVdoWkpGaU85cnk5MkcrYTVZaVZ1LzJEZ2h5OGU0Q0tvZXNqQzJm?=
 =?utf-8?B?eVVvejJya2xxM1g3MDB0c0xXeTh0Qm5IaWdxd2ZvWXg1R2JmWU9KWE1hYjYz?=
 =?utf-8?B?ZUxtTTgwSmhrdGxPTWIzNG90YjAvV1d5dDdMMHJ6V0xWTGJmYkVSV01CZW9p?=
 =?utf-8?B?Q2kzR2F5Vml1TjRaLzRPM0RTTVNPSzlHY2YzQkdBdWJYUnpGbG1kYklBY3NK?=
 =?utf-8?B?TkFkU043N1Z3OFNZdlUvRlNObDEvY09YTDNwSUE0emNTMzllQXppNFVMN2JI?=
 =?utf-8?Q?8fOebuk1X0pkxSnfBo+lL6mrH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c30b656-80fa-43ae-3569-08ddd949ab42
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:40:58.8873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Vl4VAP+HZj9agdrt0qKCHLJavIXjsugrPpojpRHuxuHYW+Tj21Dt4C1i/EEG8zQIYIl2FOodTYTktnirzXG0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172
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

Enhance the hmm test driver (lib/test_hmm) with support for
THP pages.

A new pool of free_folios() has now been added to the dmirror
device, which can be allocated when a request for a THP zone
device private page is made.

Add compound page awareness to the allocation function during
normal migration and fault based migration. These routines also
copy folio_nr_pages() when moving data between system memory
and device memory.

args.src and args.dst used to hold migration entries are now
dynamically allocated (as they need to hold HPAGE_PMD_NR entries
or more).

Split and migrate support will be added in future patches in this
series.

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
 include/linux/memremap.h |  12 ++
 lib/test_hmm.c           | 366 +++++++++++++++++++++++++++++++--------
 2 files changed, 303 insertions(+), 75 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index a0723b35eeaa..0c5141a7d58c 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
 	return is_device_private_page(&folio->page);
 }
 
+static inline void *folio_zone_device_data(const struct folio *folio)
+{
+	VM_WARN_ON_FOLIO(!folio_is_device_private(folio), folio);
+	return folio->page.zone_device_data;
+}
+
+static inline void folio_set_zone_device_data(struct folio *folio, void *data)
+{
+	VM_WARN_ON_FOLIO(!folio_is_device_private(folio), folio);
+	folio->page.zone_device_data = data;
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 297f1e034045..d814056151d0 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -119,6 +119,7 @@ struct dmirror_device {
 	unsigned long		calloc;
 	unsigned long		cfree;
 	struct page		*free_pages;
+	struct folio		*free_folios;
 	spinlock_t		lock;		/* protects the above */
 };
 
@@ -492,7 +493,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 }
 
 static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
-				   struct page **ppage)
+				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
 	struct resource *res = NULL;
@@ -572,20 +573,45 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
-	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+	for (pfn = pfn_first; pfn < pfn_last; ) {
 		struct page *page = pfn_to_page(pfn);
 
+		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
+			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+			pfn += HPAGE_PMD_NR;
+			continue;
+		}
+
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
+		pfn++;
 	}
+
+	ret = 0;
 	if (ppage) {
-		*ppage = mdevice->free_pages;
-		mdevice->free_pages = (*ppage)->zone_device_data;
-		mdevice->calloc++;
+		if (is_large) {
+			if (!mdevice->free_folios) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+			*ppage = folio_page(mdevice->free_folios, 0);
+			mdevice->free_folios = (*ppage)->zone_device_data;
+			mdevice->calloc += HPAGE_PMD_NR;
+		} else if (mdevice->free_pages) {
+			*ppage = mdevice->free_pages;
+			mdevice->free_pages = (*ppage)->zone_device_data;
+			mdevice->calloc++;
+		} else {
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
 	}
+err_unlock:
 	spin_unlock(&mdevice->lock);
 
-	return 0;
+	return ret;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -598,10 +624,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	return ret;
 }
 
-static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
+static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
+					      bool is_large)
 {
 	struct page *dpage = NULL;
 	struct page *rpage = NULL;
+	unsigned int order = is_large ? HPAGE_PMD_ORDER : 0;
+	struct dmirror_device *mdevice = dmirror->mdevice;
 
 	/*
 	 * For ZONE_DEVICE private type, this is a fake device so we allocate
@@ -610,49 +639,55 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = alloc_page(GFP_HIGHUSER);
+		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
 		if (!rpage)
 			return NULL;
 	}
 	spin_lock(&mdevice->lock);
 
-	if (mdevice->free_pages) {
+	if (is_large && mdevice->free_folios) {
+		dpage = folio_page(mdevice->free_folios, 0);
+		mdevice->free_folios = dpage->zone_device_data;
+		mdevice->calloc += 1 << order;
+		spin_unlock(&mdevice->lock);
+	} else if (!is_large && mdevice->free_pages) {
 		dpage = mdevice->free_pages;
 		mdevice->free_pages = dpage->zone_device_data;
 		mdevice->calloc++;
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage, is_large))
 			goto error;
 	}
 
-	zone_device_page_init(dpage);
+	zone_device_folio_init(page_folio(dpage), order);
 	dpage->zone_device_data = rpage;
 	return dpage;
 
 error:
 	if (rpage)
-		__free_page(rpage);
+		__free_pages(rpage, order);
 	return NULL;
 }
 
 static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
-	struct dmirror_device *mdevice = dmirror->mdevice;
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
-	for (addr = args->start; addr < args->end; addr += PAGE_SIZE,
-						   src++, dst++) {
+	for (addr = args->start; addr < args->end; ) {
 		struct page *spage;
 		struct page *dpage;
 		struct page *rpage;
+		bool is_large = *src & MIGRATE_PFN_COMPOUND;
+		int write = (*src & MIGRATE_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		unsigned long nr = 1;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		/*
 		 * Note that spage might be NULL which is OK since it is an
@@ -662,17 +697,45 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		if (WARN(spage && is_zone_device_page(spage),
 		     "page already in device spage pfn: 0x%lx\n",
 		     page_to_pfn(spage)))
+			goto next;
+
+		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (!dpage) {
+			struct folio *folio;
+			unsigned long i;
+			unsigned long spfn = *src >> MIGRATE_PFN_SHIFT;
+			struct page *src_page;
+
+			if (!is_large)
+				goto next;
+
+			if (!spage && is_large) {
+				nr = HPAGE_PMD_NR;
+			} else {
+				folio = page_folio(spage);
+				nr = folio_nr_pages(folio);
+			}
+
+			for (i = 0; i < nr && addr < args->end; i++) {
+				dpage = dmirror_devmem_alloc_page(dmirror, false);
+				rpage = BACKING_PAGE(dpage);
+				rpage->zone_device_data = dmirror;
+
+				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				src_page = pfn_to_page(spfn + i);
+
+				if (spage)
+					copy_highpage(rpage, src_page);
+				else
+					clear_highpage(rpage);
+				src++;
+				dst++;
+				addr += PAGE_SIZE;
+			}
 			continue;
-
-		dpage = dmirror_devmem_alloc_page(mdevice);
-		if (!dpage)
-			continue;
+		}
 
 		rpage = BACKING_PAGE(dpage);
-		if (spage)
-			copy_highpage(rpage, spage);
-		else
-			clear_highpage(rpage);
 
 		/*
 		 * Normally, a device would use the page->zone_device_data to
@@ -684,10 +747,42 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if ((*src & MIGRATE_PFN_WRITE) ||
-		    (!spage && args->vma->vm_flags & VM_WRITE))
-			*dst |= MIGRATE_PFN_WRITE;
+
+		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+
+		if (is_large) {
+			int i;
+			struct folio *folio = page_folio(dpage);
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+			if (folio_test_large(folio)) {
+				for (i = 0; i < folio_nr_pages(folio); i++) {
+					struct page *dst_page =
+						pfn_to_page(page_to_pfn(rpage) + i);
+					struct page *src_page =
+						pfn_to_page(page_to_pfn(spage) + i);
+
+					if (spage)
+						copy_highpage(dst_page, src_page);
+					else
+						clear_highpage(dst_page);
+					src++;
+					dst++;
+					addr += PAGE_SIZE;
+				}
+				continue;
+			}
+		}
+
+		if (spage)
+			copy_highpage(rpage, spage);
+		else
+			clear_highpage(rpage);
+
+next:
+		src++;
+		dst++;
+		addr += PAGE_SIZE;
 	}
 }
 
@@ -734,14 +829,17 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	const unsigned long *src = args->src;
 	const unsigned long *dst = args->dst;
 	unsigned long pfn;
+	const unsigned long start_pfn = start >> PAGE_SHIFT;
+	const unsigned long end_pfn = end >> PAGE_SHIFT;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++,
-								src++, dst++) {
+	for (pfn = start_pfn; pfn < end_pfn; pfn++, src++, dst++) {
 		struct page *dpage;
 		void *entry;
+		int nr, i;
+		struct page *rpage;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
 			continue;
@@ -750,13 +848,25 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		entry = BACKING_PAGE(dpage);
-		if (*dst & MIGRATE_PFN_WRITE)
-			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
+		if (*dst & MIGRATE_PFN_COMPOUND)
+			nr = folio_nr_pages(page_folio(dpage));
+		else
+			nr = 1;
+
+		WARN_ON_ONCE(end_pfn < start_pfn + nr);
+
+		rpage = BACKING_PAGE(dpage);
+		VM_WARN_ON(folio_nr_pages(page_folio(rpage)) != nr);
+
+		for (i = 0; i < nr; i++) {
+			entry = folio_page(page_folio(rpage), i);
+			if (*dst & MIGRATE_PFN_WRITE)
+				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
+			if (xa_is_err(entry)) {
+				mutex_unlock(&dmirror->mutex);
+				return xa_err(entry);
+			}
 		}
 	}
 
@@ -829,31 +939,66 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	unsigned long start = args->start;
 	unsigned long end = args->end;
 	unsigned long addr;
+	unsigned int order = 0;
+	int i;
 
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
+	for (addr = start; addr < end; ) {
 		struct page *dpage, *spage;
 
 		spage = migrate_pfn_to_page(*src);
-		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+		if (!spage || !(*src & MIGRATE_PFN_MIGRATE)) {
+			addr += PAGE_SIZE;
+			goto next;
+		}
 
 		if (WARN_ON(!is_device_private_page(spage) &&
-			    !is_device_coherent_page(spage)))
-			continue;
+			    !is_device_coherent_page(spage))) {
+			addr += PAGE_SIZE;
+			goto next;
+		}
+
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		order = folio_order(page_folio(spage));
 
+		if (order)
+			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
+						order, args->vma, addr), 0);
+		else
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+
+		/* Try with smaller pages if large allocation fails */
+		if (!dpage && order) {
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+			if (!dpage)
+				return VM_FAULT_OOM;
+			order = 0;
+		}
+
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+				page_to_pfn(spage), page_to_pfn(dpage));
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
+		if (order)
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+		for (i = 0; i < (1 << order); i++) {
+			struct page *src_page;
+			struct page *dst_page;
+
+			src_page = pfn_to_page(page_to_pfn(spage) + i);
+			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+
+			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			copy_highpage(dst_page, src_page);
+		}
+next:
+		addr += PAGE_SIZE << order;
+		src += 1 << order;
+		dst += 1 << order;
 	}
 	return 0;
 }
@@ -879,11 +1024,14 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
 	start = cmd->addr;
 	end = start + size;
@@ -902,7 +1050,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -912,7 +1060,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = dmirror_select_device(dmirror);
+		args.flags = dmirror_select_device(dmirror) | MIGRATE_VMA_SELECT_COMPOUND;
 
 		ret = migrate_vma_setup(&args);
 		if (ret)
@@ -928,6 +1076,8 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+	kvfree(src_pfns);
+	kvfree(dst_pfns);
 
 	return ret;
 }
@@ -939,12 +1089,12 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns = NULL;
+	unsigned long *dst_pfns = NULL;
 
 	start = cmd->addr;
 	end = start + size;
@@ -955,6 +1105,18 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	if (!mmget_not_zero(mm))
 		return -EINVAL;
 
+	ret = -ENOMEM;
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!src_pfns)
+		goto free_mem;
+
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!dst_pfns)
+		goto free_mem;
+
+	ret = 0;
 	mmap_read_lock(mm);
 	for (addr = start; addr < end; addr = next) {
 		vma = vma_lookup(mm, addr);
@@ -962,7 +1124,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -972,7 +1134,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = MIGRATE_VMA_SELECT_SYSTEM |
+				MIGRATE_VMA_SELECT_COMPOUND;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -992,7 +1155,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
-		return ret;
+		goto free_mem;
 	mutex_lock(&dmirror->mutex);
 	ret = dmirror_do_read(dmirror, start, end, &bounce);
 	mutex_unlock(&dmirror->mutex);
@@ -1003,11 +1166,14 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
-	return ret;
+	goto free_mem;
 
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+free_mem:
+	kfree(src_pfns);
+	kfree(dst_pfns);
 	return ret;
 }
 
@@ -1200,6 +1366,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long i;
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
+	unsigned int order = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
@@ -1215,13 +1382,25 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
 			continue;
+
+		order = folio_order(page_folio(spage));
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+			dpage = folio_page(folio_alloc(GFP_HIGHUSER_MOVABLE,
+					      order), 0);
+		} else {
+			dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+			order = 0;
+		}
+
+		/* TODO Support splitting here */
 		lock_page(dpage);
-		copy_highpage(dpage, spage);
 		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+		if (order)
+			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
+		folio_copy(page_folio(dpage), page_folio(spage));
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -1234,7 +1413,12 @@ static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
 {
 	struct dmirror_device *mdevice = devmem->mdevice;
 	struct page *page;
+	struct folio *folio;
+
 
+	for (folio = mdevice->free_folios; folio; folio = folio_zone_device_data(folio))
+		if (dmirror_page_to_chunk(folio_page(folio, 0)) == devmem)
+			mdevice->free_folios = folio_zone_device_data(folio);
 	for (page = mdevice->free_pages; page; page = page->zone_device_data)
 		if (dmirror_page_to_chunk(page) == devmem)
 			mdevice->free_pages = page->zone_device_data;
@@ -1265,6 +1449,7 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 		mdevice->devmem_count = 0;
 		mdevice->devmem_capacity = 0;
 		mdevice->free_pages = NULL;
+		mdevice->free_folios = NULL;
 		kfree(mdevice->devmem_chunks);
 		mdevice->devmem_chunks = NULL;
 	}
@@ -1378,18 +1563,30 @@ static void dmirror_devmem_free(struct page *page)
 {
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
+	struct folio *folio = page_folio(rpage);
+	unsigned int order = folio_order(folio);
 
-	if (rpage != page)
-		__free_page(rpage);
+	if (rpage != page) {
+		if (order)
+			__free_pages(rpage, order);
+		else
+			__free_page(rpage);
+		rpage = NULL;
+	}
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
 
 	/* Return page to our allocator if not freeing the chunk */
 	if (!dmirror_page_to_chunk(page)->remove) {
-		mdevice->cfree++;
-		page->zone_device_data = mdevice->free_pages;
-		mdevice->free_pages = page;
+		mdevice->cfree += 1 << order;
+		if (order) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+		} else {
+			page->zone_device_data = mdevice->free_pages;
+			mdevice->free_pages = page;
+		}
 	}
 	spin_unlock(&mdevice->lock);
 }
@@ -1397,11 +1594,10 @@ static void dmirror_devmem_free(struct page *page)
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args = { 0 };
-	unsigned long src_pfns = 0;
-	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
+	unsigned int order, nr;
 
 	/*
 	 * Normally, a device would use the page->zone_device_data to point to
@@ -1412,21 +1608,38 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	dmirror = rpage->zone_device_data;
 
 	/* FIXME demonstrate how we can adjust migrate range */
+	order = folio_order(page_folio(vmf->page));
+	nr = 1 << order;
+
+	/*
+	 * Consider a per-cpu cache of src and dst pfns, but with
+	 * large number of cpus that might not scale well.
+	 */
+	args.start = ALIGN_DOWN(vmf->address, (PAGE_SIZE << order));
 	args.vma = vmf->vma;
-	args.start = vmf->address;
-	args.end = args.start + PAGE_SIZE;
-	args.src = &src_pfns;
-	args.dst = &dst_pfns;
+	args.end = args.start + (PAGE_SIZE << order);
+
+	nr = (args.end - args.start) >> PAGE_SHIFT;
+	args.src = kcalloc(nr, sizeof(unsigned long), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(unsigned long), GFP_KERNEL);
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
 	args.fault_page = vmf->page;
 
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
 
 	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
-		return ret;
+		goto err;
 	migrate_vma_pages(&args);
 	/*
 	 * No device finalize step is needed since
@@ -1434,7 +1647,10 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	 * invalidated the device page table.
 	 */
 	migrate_vma_finalize(&args);
-	return 0;
+err:
+	kfree(args.src);
+	kfree(args.dst);
+	return ret;
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
@@ -1465,7 +1681,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 		return ret;
 
 	/* Build a list of free ZONE_DEVICE struct pages */
-	return dmirror_allocate_chunk(mdevice, NULL);
+	return dmirror_allocate_chunk(mdevice, NULL, false);
 }
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
-- 
2.50.1

