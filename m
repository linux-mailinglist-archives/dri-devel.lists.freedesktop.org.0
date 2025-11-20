Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2FC7673D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 23:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3645610E073;
	Thu, 20 Nov 2025 22:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jjehe3+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A192610E073
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 22:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763676285; x=1795212285;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=erwA9i/Lnr5ZITUGG/ZDXL4HLvNVyKrwkTGeIKEFa2g=;
 b=Jjehe3+s4ZFsyUicJrBjT0+MM4eFdTF9Yyp9CZFEq+OqXmyTGi0qymja
 X6NDmssvFv6YVlZRdEeY/e/9GB7PIkv/N2VHIWvrT13tGcaN1ouu4jp5F
 U+7L9Xi9wjeNVOTs2spVr+qe9A3MP3rGwH3kVjX6uj+0tuPsnMKbiou04
 45/G4gBzK7L6Mpho13jDlJuhfYpkZzuk6aUzijUs+uHiFuYxAp6fKDGcp
 V8gzj+lOT+G1e55XkPvEWnkwDjsRCm0JGUD+EDYaMGJ8mbYxfzIKA1e+e
 OWjNZA2mcZ3Jef0LU1ox+XwGGSHLjSxOJnDYkQsKXs+Lq99wiHyae+S1h Q==;
X-CSE-ConnectionGUID: 2phThP/NS4KcPCHDpFv2Jw==
X-CSE-MsgGUID: R1S4W5vmRSuVEKj3iURb5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65801756"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65801756"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:04:44 -0800
X-CSE-ConnectionGUID: I/jOuEFdSXmKbxe88sWkFA==
X-CSE-MsgGUID: YWIgLLywROmxJ9wWG8tgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191310467"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 14:04:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:04:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 14:04:43 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 14:04:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcyL4nqEGO5FWfxwp9C8blxHeCkK2VVTxIZVvV36AlTN7TU5pNMey2hV2otovvFpXhoGUjkoSA8iNeUxwEeXMcCaU3HZsJnXXISH0PKb4Psy9ulScT2cdGbzxoi5yeeRILy0Ff7lPyM+2xKgJ6fyqfMKp1WnbaQP+oxHm7K/O697/tjX22F9ZEOrd13ETJ2YrO+ax51VvgsdYzxXveVvZzRgmXNoNSmKj4+YAx4PfN6BnrwI3eqCXyTTSaAyye+14E8hncWRzksq/lLNpNihiObkNeoFfvH3gVPUVVUpaDUBOzacpgfY91MkytKX4FJuArzNzSNEh9VL6InzIllJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1uN6GAqwWBgLVCLGGckGeKLQXuRhoyL2fTVUZQCSag=;
 b=HlW+JOGaRVZcKEt9t+GKYOKLvGHlVzQC/ERdVRds4RnoAT6ZIjGaPQ28JNP8ljX09nwBgljJ6Vd2W8h8ZCSDiRb9e2tiO9CuI716sQMwT1DVhq4dZrI5khHhRz2RslSUGDKPRJuOfIdRAujk58EBzd4aKc3lR6p9PfG2maurzKTy2jPz2iNQj2AlhnNRuDIhRIIYvKkYLJFN8mM9nTsED/LiGp192ZUy5TDU7tGe7oA5Z7ekbL5LTZOrrNmu9Gx473tb9dySLKpGzaqyBB1lVfOZMGthfTzkKzl6E67NfPUvKH+niWPP7pQ6Nt9tsyQN8WCEZSInePP7ev+emWzbgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 22:04:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 22:04:40 +0000
Date: Thu, 20 Nov 2025 14:04:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "David
 Hildenbrand" <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
 <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, "Oscar
 Salvador" <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Francois Dugast
 <francois.dugast@intel.com>, Balbir Singh <balbirs@nvidia.com>
Subject: Re: [PATCH] fixup: mm/migrate_device: handle partially mapped folios
 during
Message-ID: <aR+QdfjRw+U5go9+@lstrano-desk.jf.intel.com>
References: <20251120170515.46504-1-matthew.brost@intel.com>
 <a6d4dff5-15be-48e3-9bb8-00bb44dc5584@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6d4dff5-15be-48e3-9bb8-00bb44dc5584@redhat.com>
X-ClientProxiedBy: BYAPR07CA0099.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: a2fc96e1-cb4b-453b-24fb-08de2880cdc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1RoUVZxUGdrM2p2YzdtbHlncE94K3pRV2NvNnJSSHNFbE5QWFZYWXR4b1JV?=
 =?utf-8?B?UGNYYjhKdEpQajFpNnFUM1dQOUFhbFl5OWd2V2RBVE80NXRHcWM5V1I0TWlZ?=
 =?utf-8?B?Tk9YUk9DMnFVM1c2TnQ5cU9sNElST0dLc1NOM0t6WnhIcFVRNHV4SytSeVlj?=
 =?utf-8?B?b1FHbUgxTzJLeTh3alpKTmI4UnR0N3FDeEJDamluMVl3bm9SU2tZZDZYdjRu?=
 =?utf-8?B?N09UVnV5TzFLZFdydXBYNEpGTGJtR21RWG9jQmswQlBUVTdqUnVtY1pTRDF0?=
 =?utf-8?B?cXI3MFNoVkcvMVB3NC9zQ2JFNWR6ZmRYUEpncVpUN280aWVOSHQ1cGFWTUNK?=
 =?utf-8?B?VTNadHVrRktKbFpuSmlGdXhnQUdJeVhDeTQ0QmxmWUhZdjFjMmFtV1JPeTVm?=
 =?utf-8?B?SnA4bXNLL0c2S01pbEhrTHY5VG1kMk1SdEtHaEw1eGtsbEcvSmE2b2Vyc2RD?=
 =?utf-8?B?NlU4Tm9VcGNpS0s2T2Y3Z05VbEF5TU5yNUtxSXRWTTYyN2xkVW42RHQwb1A3?=
 =?utf-8?B?ZGJyRmk0UXJ6am1icmRUVkVYUS9JRGlhdG83UENrcjBJeDJXdHQ4ZGZyL3RP?=
 =?utf-8?B?ZVJ5dEZaNGtPVEFwajJSUEkwWU5XdVBVdUpVZjQ0Zjc0NXVzYjVkNDZUUjhW?=
 =?utf-8?B?YVM0VXZPL3IwNHh2QjhoWWVmRkRSbDlXRlJBK3ZwODdLWURMZThhWERpQWFz?=
 =?utf-8?B?RjBtU3dVOU9CY2l3c0QxVmZpaDlERjZjUnNaU2hwM3gxN3h6dEQxYk80M3VK?=
 =?utf-8?B?YTl4dllnRmJHRGU4ZDA4ZGVxSXA0MFNzck5YdXgxUUlJVzJGU1ZWSzRCZSs1?=
 =?utf-8?B?blpQVjk2bkI0MHZjSExOM0hSbGxLY1RMUGdZUnV2S3NjaklOUzROczdINXFX?=
 =?utf-8?B?VHFKZ1hKZU1NT2xmL0lXQkQ4MUpCYmpGck9hQ3NJK3dXeWhnK3dVMmZ1Tno1?=
 =?utf-8?B?RTQzVGU4dUVUaFRFQUFBUTl3dTVUY2lxMWdSMWkrenBNSFZFT2FlVHo4T1R2?=
 =?utf-8?B?bmFnUUJhN3JxMDByclpIT0daUjNRQ1NMQ24wSFF0bUJXU1RTVHpMRG81R1p1?=
 =?utf-8?B?VE00RFBvcWpWRXdxdmlVZkRNdU01ZENJQk01UDdJaGZ6NjdLZjErcTYwNG5q?=
 =?utf-8?B?bDA4ZGtsRDViWU1mcmhSRE9DWTRWMzJPRXdKZEtlaFB5R0hsdStiVTJ5dHRo?=
 =?utf-8?B?TERUOVRDdWVKZU82UnFIUDFQVnJFK3ZZYnlRZHc4dlJKQkJEZGJJYzc4THRU?=
 =?utf-8?B?cERHeldKSGdrY0d1dkQrdjB0bmlRQ1FLanRsd2V1WlUzc2F5cGFPSVVQRTJ5?=
 =?utf-8?B?REgzN0dPNTB6czhtNGMvT3VFa0NYRUY3SWhRZDhzbG5INGEwZ1RUQzlYYXJY?=
 =?utf-8?B?TDBQZ1FHSlB2b1I0bUVmbDVtUDI4YkxhOTN5cUk5Y1J3TGNhVlVwWUQ5Zktt?=
 =?utf-8?B?dmlucmhnK0tmMGQ0WFlOZmNvSzJiTFpMam9xOE04NTBLNkVhbWhzRkJHUWkr?=
 =?utf-8?B?NDgraEo5Smx6Z0NBaG1PbGxrVGxKVkxQYVpjL2dNdFptU2QwRzhrS0RPVzFy?=
 =?utf-8?B?akk5YXBjbThwNXVuUWpwT1Nqc1d1RVdycDV5bUszQmwxUFlxYmRpcm9NWUJD?=
 =?utf-8?B?VUt6QmlUbEd1cmlkNUVFRHozZ1d1TXRLbXZwMmxTMllEN3MzdnBmdzlhQktI?=
 =?utf-8?B?ZmIwWjBReGxiYi93bVlkSS90d09ySG1peEFNSW1VNmMzRnYyV0JCVUM4ZXpp?=
 =?utf-8?B?K3ZUWTByY2YvdzNiSldXaTBvR2VHZGViYUY0N2Q4b2RobHJQNnZYOHYvKzdS?=
 =?utf-8?B?SHdxOHJHQmRuVUh2TGJvdTc5WUowZTZ3eG9ISmNEVWVjMytuRURmR2hseVZ3?=
 =?utf-8?B?Q0ZIbFY1ZDIvRDN6RnZjVlVieERxUHM5aVU1cG5SR1EyZTdja3lhZThIS2FT?=
 =?utf-8?Q?84cSAqCM1X1ani08xklejVWPnPXZShLH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGN1M1JmS21hb05uWmRXcExFdzUvSTl4QXRiS1VVdkU2N1JwS01TR2tuZ2I4?=
 =?utf-8?B?N25QWFNSaUVPRnhCU0U4ckZBcFJ0bHRCQjAzZ1ByOXNreWFWUHNPT3FhQjJh?=
 =?utf-8?B?N3A5cWNRUVNhL1lCSnMzMnNIVm02N0VtdHJSRzdrbm94ZVBDWVpPRnpJMW9G?=
 =?utf-8?B?M0ppUnRYTSt2VlUwSGhnc2taWGJNbStqdUtVV3RnUVBZNGRNSXBHZXlsNDB3?=
 =?utf-8?B?RDJoZTZBZ1hPOHZyTnk2Z2FWbUlxTjAvdEJOSzAvaG9uUHVOOEN0ZWlDc2RP?=
 =?utf-8?B?MXl3TFdUWVdJWStRUnpBaG1WZ25wUXVEWmNERjEvZTZta1Q0eDAzSjNvS3Uz?=
 =?utf-8?B?Zkszd0xrNGthUWp4WDFiK0lLQ3M3UG9xZ09nT3Fyb0sybDlaTW9tNnVvSVJW?=
 =?utf-8?B?dFRCOTM5T04xZEtJaVVxK2dlUjFSb1U3eWJWOWJ3TUJYUGpVRWtkQU9LWHlK?=
 =?utf-8?B?K1g4Zk1EK0l5dUY2dU90ZU1wYkpPbWVUcW1aYUtvdU9PNC9IbDdwajB4Ymdq?=
 =?utf-8?B?V0FvMVdicjJlOUNxV1JrVEJXMlkrNlh2KzgyR2VHdkxpaE5xUXdRS0htL3Bq?=
 =?utf-8?B?ZElqa3ZJN0pKVkdrbFNmOWt3aDg5RFJ1Tm1KL2FjMkF6OTk0NWtOUWFwb2tU?=
 =?utf-8?B?dlRmS3JNOG81OG5tT0o4QzJqQVZJR3V4aC9SOWtsQlNOZFlWSWNXVTZyZi9P?=
 =?utf-8?B?a3RsUi9uWFF3OC9kR2I5Vm9MbzA1bTVOb0h6amtMY1VCUXJWdjdCRC84N01C?=
 =?utf-8?B?MnE1KzQ5ckZZdzFjRVQ5dC9yUXB0eU1hdFNFUWZlY0kyQmhndjB1Znc5aWZZ?=
 =?utf-8?B?SGVYR1R3OGI1cWpESmRWSnNLNGpaSGlKOGt1T2pMYlFCQkxsQ0JXVzRRR0pV?=
 =?utf-8?B?aHNzU1FCb0xpYkI5OVNPMmNtZzN2YUxpdmppc1h3eEV5cE9mWU1wWDliTTQ3?=
 =?utf-8?B?ZW1hQzlJZzNCb0NuUTdkUjJ3TnMrbG5uRVZ3QXE2eFhtUU41TlFuSGFWZXA4?=
 =?utf-8?B?cEtVRHRFNytqVHNucmxyL1NwQ2dtd3Rra0NpUVpkaEN3OXF1c0dJTkFFMjdt?=
 =?utf-8?B?aERNMXNrdzFOdlhmRUY3cHo0NXdUTFFWQ3F3b3hSOGRuV2RFUXZTRnBKZ1A2?=
 =?utf-8?B?THR6YTVrMFQ4QStOdjNoNUZJRmhMUGtaMHJ4T0M0eVoveWJDU0RONitIRlpr?=
 =?utf-8?B?dXpPeWZpSjN1ZlgzTjB0NnRFVFp4elM0N3ZKSmVUenV2UDFmdlZsdHo4amRK?=
 =?utf-8?B?cFpMTmlVV0ZadllOYmgwUWtibUl4N0IzRzYrNUNRL3cyeHRSV2M4QzBkTTF1?=
 =?utf-8?B?cmpLL2dHcUNtSHprcGpETUVPenZ0SndxbTZFQkZzd0JlSnZlb0FJZS8zQlVr?=
 =?utf-8?B?L1ZtKzRNK2lodm5iU3Q4eUtnMUZFU1FmcXArWHRxY3NMRE5GdVVyT2U3dXBL?=
 =?utf-8?B?M1QxUms5WDJBZ1hpTmpWUW1IOFdHdTZJYm5acXRkZ2I0SmY5UTJsc0lRN2VD?=
 =?utf-8?B?TVBtandaWngyaEVMU3VkWVJtTGNGQktjWTBGNkxCMGhiSW14T1RuaGNJSEwv?=
 =?utf-8?B?SFlmQkduaGk5bmUvNkI0RGdkVW9oNHNWcy9lSGUzcWtpd0pFVEM4SEI5cDlx?=
 =?utf-8?B?VFMyU2NHM3ozemdtOElkbml0SU5QT1BmR2RKQ3A1MTVkUXQrOCtSYi9YZVVI?=
 =?utf-8?B?aHY0UmhkUVVIT2ZZZ2JraUowVzFha3UzaXRSQ3J5SlB5b1UzNHJJZ01tOWxz?=
 =?utf-8?B?LzNHOTJsZnpnNEo1eHhCVmdqYldHRktKN3BRUGVOZTIxOGxyOURYdzRFRlpl?=
 =?utf-8?B?UElwY3BkUnFyWENkSkVtTEJqckFQajl4SVRBZGVQaitxL1VVZE1iRHN6UTJr?=
 =?utf-8?B?b3pRbnFzMEt5RFEveUMrNFNVK1EwTWZSN3dZNzZwdnJoanN4S3RxY05sRU1L?=
 =?utf-8?B?T01SeEhjQTFuUnBrTDBXeTllYUVvVDk3WDlJMzM0T1RMZmFIb2k4S2lkaGZY?=
 =?utf-8?B?NnhSYVpvbGlxSEpyMmlVMEp4UE1YcUxaODI3RElxeFRydGZ3ZFVmaEVURWZ1?=
 =?utf-8?B?RWl5UEppa0hPdEdhYTVnU255aFRnaDZrcEp1d3NSRWozSDFIcFpRdWtTR3U0?=
 =?utf-8?B?MlJFZEFsWm9wVUpxRmJjcGdweUpTN0ZNcXhEamVoZHJ5ZUtNazRiZHpZbFNp?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fc96e1-cb4b-453b-24fb-08de2880cdc5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 22:04:40.8504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEh9u1/rRNGe8vAwTqnHMjfWQzB4Gidog8o0Nh6xqyDrqRkmfLIPATYuNc/msQJ7I6kS2MrS+ruooXTLRmzQUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
X-OriginatorOrg: intel.com
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

On Thu, Nov 20, 2025 at 07:43:42PM +0200, Mika Penttilä wrote:
> Hi,
> 
> On 11/20/25 19:05, Matthew Brost wrote:
> 
> > Splitting a partially mapped folio caused a regression in the Intel Xe
> > SVM test suite in the mremap section, resulting in the following stack
> > trace:
> >
> >  NFO: task kworker/u65:2:1642 blocked for more than 30 seconds.
> > [  212.624286]       Tainted: G S      W           6.18.0-rc6-xe+ #1719
> > [  212.638288] Workqueue: xe_page_fault_work_queue xe_pagefault_queue_work [xe]
> > [  212.638323] Call Trace:
> > [  212.638324]  <TASK>
> > [  212.638325]  __schedule+0x4b0/0x990
> > [  212.638330]  schedule+0x22/0xd0
> > [  212.638331]  io_schedule+0x41/0x60
> > [  212.638333]  migration_entry_wait_on_locked+0x1d8/0x2d0
> > [  212.638336]  ? __pfx_wake_page_function+0x10/0x10
> > [  212.638339]  migration_entry_wait+0xd2/0xe0
> > [  212.638341]  hmm_vma_walk_pmd+0x7c9/0x8d0
> > [  212.638343]  walk_pgd_range+0x51d/0xa40
> > [  212.638345]  __walk_page_range+0x75/0x1e0
> > [  212.638347]  walk_page_range_mm+0x138/0x1f0
> > [  212.638349]  hmm_range_fault+0x59/0xa0
> > [  212.638351]  drm_gpusvm_get_pages+0x194/0x7b0 [drm_gpusvm_helper]
> > [  212.638354]  drm_gpusvm_range_get_pages+0x2d/0x40 [drm_gpusvm_helper]
> > [  212.638355]  __xe_svm_handle_pagefault+0x259/0x900 [xe]
> > [  212.638375]  ? update_load_avg+0x7f/0x6c0
> > [  212.638377]  ? update_curr+0x13d/0x170
> > [  212.638379]  xe_svm_handle_pagefault+0x37/0x90 [xe]
> > [  212.638396]  xe_pagefault_queue_work+0x2da/0x3c0 [xe]
> > [  212.638420]  process_one_work+0x16e/0x2e0
> > [  212.638422]  worker_thread+0x284/0x410
> > [  212.638423]  ? __pfx_worker_thread+0x10/0x10
> > [  212.638425]  kthread+0xec/0x210
> > [  212.638427]  ? __pfx_kthread+0x10/0x10
> > [  212.638428]  ? __pfx_kthread+0x10/0x10
> > [  212.638430]  ret_from_fork+0xbd/0x100
> > [  212.638433]  ? __pfx_kthread+0x10/0x10
> > [  212.638434]  ret_from_fork_asm+0x1a/0x30
> > [  212.638436]  </TASK>
> >
> > The issue appears to be that migration PTEs are not properly removed
> > after a split.
> >
> > This change refactors the code to perform the split in a slightly
> > different manner while retaining the original patch’s intent. With this
> > update, the Intel Xe SVM test suite fully passes.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> > Cc: Rakie Kim <rakie.kim@sk.com>
> > Cc: Byungchul Park <byungchul@sk.com>
> > Cc: Gregory Price <gourry@gourry.net>
> > Cc: Ying Huang <ying.huang@linux.alibaba.com>
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > Cc: Nico Pache <npache@redhat.com>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Dev Jain <dev.jain@arm.com>
> > Cc: Barry Song <baohua@kernel.org>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Ralph Campbell <rcampbell@nvidia.com>
> > Cc: Mika Penttilä <mpenttil@redhat.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Balbir Singh <balbirs@nvidia.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >
> > ---
> > This fixup should be squashed into the patch "mm/migrate_device: handle
> > partially mapped folios during" in mm/mm-unstable
> >
> > I replaced the original patch with a local patch I authored a while back
> > that solves the same problem but uses a different code structure. The
> > failing test case—only available on an Xe driver—passes with this patch.
> > I can attempt to fix up the original patch within its structure if
> > that’s preferred.
> > ---
> >  mm/migrate_device.c | 42 ++++++++++++++++++++++++------------------
> >  1 file changed, 24 insertions(+), 18 deletions(-)
> >
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index fa42d2ebd024..69e88f4a2563 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -254,6 +254,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  	spinlock_t *ptl;
> >  	struct folio *fault_folio = migrate->fault_page ?
> >  		page_folio(migrate->fault_page) : NULL;
> > +	struct folio *split_folio = NULL;
> >  	pte_t *ptep;
> >  
> >  again:
> > @@ -266,10 +267,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  			return 0;
> >  	}
> >  
> > -	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> > +	ptep = pte_offset_map_lock(mm, pmdp, start, &ptl);
> >  	if (!ptep)
> >  		goto again;
> >  	arch_enter_lazy_mmu_mode();
> > +	ptep += (addr - start) / PAGE_SIZE;
> >  
> >  	for (; addr < end; addr += PAGE_SIZE, ptep++) {
> >  		struct dev_pagemap *pgmap;
> > @@ -347,22 +349,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  					pgmap->owner != migrate->pgmap_owner)
> >  					goto next;
> >  			}
> > -			folio = page ? page_folio(page) : NULL;
> > -			if (folio && folio_test_large(folio)) {
> > -				int ret;
> > -
> > -				pte_unmap_unlock(ptep, ptl);
> > -				ret = migrate_vma_split_folio(folio,
> > -							  migrate->fault_page);
> > -
> > -				if (ret) {
> > -					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> > -					goto next;
> > -				}
> > -
> > -				addr = start;
> > -				goto again;
> > -			}
> >  			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> >  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
> >  		}
> > @@ -400,6 +386,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  			bool anon_exclusive;
> >  			pte_t swp_pte;
> >  
> > +			if (folio_order(folio)) {
> > +				split_folio = folio;
> > +				goto split;
> > +			}
> > +
> >  			flush_cache_page(vma, addr, pte_pfn(pte));
> >  			anon_exclusive = folio_test_anon(folio) &&
> >  					  PageAnonExclusive(page);
> > @@ -478,8 +469,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  	if (unmapped)
> >  		flush_tlb_range(walk->vma, start, end);
> >  
> > +split:
> >  	arch_leave_lazy_mmu_mode();
> > -	pte_unmap_unlock(ptep - 1, ptl);
> > +	pte_unmap_unlock(ptep - 1 + !!split_folio, ptl);
> > +
> > +	if (split_folio) {
> > +		int ret;
> > +
> > +		ret = split_folio(split_folio);
> > +		if (fault_folio != split_folio)
> > +			folio_unlock(split_folio);
> 
> I think wrong folio is left locked in case of fault_folio != NULL. Look how
> migrate_vma_split_folio() handles it.
>

Ah, yes. It took me a minute, but I think I understand what the code is
doing. It has to relock the fault page if it was included in the split.
I actually think that code has a corner-case bug in it too.
 
> > +		folio_put(split_folio);
> > +		if (ret)
> > +			return migrate_vma_collect_skip(addr, end, walk);
> > +
> > +		split_folio = NULL;
> > +		goto again;
> > +	}
> >  
> >  	return 0;
> >  }
> 
> How is this making a difference, I suppose it's only the 
> migrate_vma_collect_skip() after failed split? 

Yes, that is one part, but perhaps that is actually harmless as split
will just keep on failing.

I think the real issue is that it restarts the loop with goto again by
resetting addr to the start. If the prior pages were locked and
migration entries were installed, the second pass will fail to lock the
pages and install NULL mpfns, which results in the migration entries
never being removed—and that leads to the stack trace I’m seeing.

> Why are you just removing the other migrate_vma_split_folio() call? 

I was a bit rushed and overloaded with other things. I think I have a
way to fix this within the framework of the original patch. Another
patch in Balbir’s series has the same problem too. Let me try this one
again, testing out another version now.

Thanks for the input.

Matt

> 
> --Mika
> 
