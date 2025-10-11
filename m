Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41581BCFBE7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A514C10E361;
	Sat, 11 Oct 2025 19:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sb8DIZgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C78610E364;
 Sat, 11 Oct 2025 19:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211734; x=1791747734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gneghuJyhWG0wIhGj9NZqjCJ1xe/4DLTx+yRgum/rVc=;
 b=Sb8DIZgwsaO+lqP6C0fVxFBPM05MDFGmQNLCghxdFc4bMPr5Bw5QnlSY
 e7aL8JaPBqydrMhRFg66QIvXexyr4/gziYyDPSCcZleO1LfkAIxmdYf8Q
 5gkVDqUwqVBMHijtjM6/tIiQJ4HkAWePJdbb16Rpyq3Cih2xiiHOSBQww
 8I+CU90724x7AawYLvjQZuBhs9Fnb1KXcax60Ebey2OJTX7JMz4eKtvtl
 ugBDzHMZeiFW8DcL1q/Y4g5GNhBwphvY/8IvaNs6TMIljyc0cZP1oi0BK
 7eVO365O5d3G3+nx+zfnq0wKcHSr61LHHiROghGANPbUmWsRaBpaVPD+H Q==;
X-CSE-ConnectionGUID: 9oQGXBv7Qp65X4xbJvuyRA==
X-CSE-MsgGUID: HZvzUVJwT/uY7180HwY3RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66227523"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66227523"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:42:14 -0700
X-CSE-ConnectionGUID: aXm29+mVSt6Zo3jYYBEjNw==
X-CSE-MsgGUID: sZIKnE4mRKmsimjHgjLH7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="186525206"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:42:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:42:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:42:13 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:42:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+kFXaykYsGo3ePToPpscfnDgrHHf42NvzpDQkWuDzdEZs/TRodveMpZsnKv8RorREk3RTH7neDIhEwqninvaEDDDhZWbXpXgy8LNQTMiiK5R1r3VIWBELLulDFtNNFruef1xaCV8rdlr62+fsLYYSWFkH+5J+b8Tnd6+qkGKVJmP6p8PfcaaCDlYn+luY/XKlTT4JYBcSC6y2RCIu09Q29Ufj2jhdbfLkqYJGmhU4/Q0N9qjvuwcm8bXPD0CvaFoucOQb7ky1umHosbRO23JL4e6CaQ0+M8ZBGCh1no7X0Nh7dBEOLGy1Y9XNoJNk9ronKV/qblXQB4C26rqYiQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1WZYY8qFuuTfqdrHzc7fVIInNxE6CiDJWZNuet0NKY=;
 b=Rlk264iDFSzQu+QNblqxa3ACsMXLwCDkbzt3aJJt5pTJ9NWZQpOsUiaU4r0fMqNc89GMR2s0qpT6u/il8/NbfQfQ3wDNv9feUlkb5gPqNYOsOlHcJ1YDhRP1l7XJ9ZPWjUpWj3iyBRmwfDwi9jEe3/G3e5uDhpGNT8GxT5gPrI0BKF3kqp1rr104/mVO5QDO9duzmHphVqYgiKpKqXjJ5bXkYlKFokNZ0Dagda8adxdgMotxsJjnKGVQnBXRgTqYdWv4nvWWwX7PK+NW/xO+TWrXV/VLbzqhJJXftWSwGHCl/2+LqdfXbyK373dLX+N4HhajnpZeJrsP7FKaJcMxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Sat, 11 Oct 2025 19:42:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:42:11 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for Intel
 graphics
Date: Sat, 11 Oct 2025 21:38:47 +0200
Message-ID: <20251011193847.1836454-27-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::42) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: 922dc156-62af-418a-a938-08de08fe4561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkNNbkk0YndBK0NScTM1cFh0a2hCTjhZbVBzcHhLNUJwRmw1VWRhVm1MbEFY?=
 =?utf-8?B?bHM3Vm90ZFpkTG9HNnFoeXV2MXU2cXhOVUR3OHdiUGhjTXFFa21uR0NCTU5i?=
 =?utf-8?B?NFRSL3RrTnl6eTZRbDlZbjNEL25QYnQ1UWJqSVhHU0FsMjhtbGE4NEowRnNJ?=
 =?utf-8?B?UlY2R3o3WlcwWXZ0TDVjMlNXbEZBOXFnMFh6dWl3a3YydWlWVFBpVHQ5c3hH?=
 =?utf-8?B?NHRVdzZPTklsYTI3bTNyb2g2bE9VdCtOOE5hNkNEa1lwa2xpcThXdzNUeWM0?=
 =?utf-8?B?WU1DODMzanZoUEsyWi9vejBtM29oMDFLa1ppMkNpQkUwZlZsbXo4cEJuTWlh?=
 =?utf-8?B?aG5UMEx5L3RJYi9saGNIaUt4NWFPY2JYZW16NzR2M2dzSi9ldmdGZkE4cS8w?=
 =?utf-8?B?YVJ0dGtyQ0xoZFB5aW85L3RRMU96bjJwZXRweThrL0hnVFk4REQxeUhQdXAw?=
 =?utf-8?B?cE1hcGhxWTNqbmZPNmtUZ0N3Ym8yZDZ0bUFlb0RVQmYvVWFKaDJBbzVGSWVF?=
 =?utf-8?B?N1g5TTRCNUdjRHZlZlBETStCMjVwdHQ5S0JyWmNmOUw1a3FiZGVNMTlKZnFx?=
 =?utf-8?B?eVdtZVlwWHE5OUFuazBlUU4rOGhxb0JSTWV0V3hRVXBaTUNxaVQ1ZEhncmto?=
 =?utf-8?B?TEtBNDN6VVNBVTYrQVZWUTg2ZlEwSTI4QlRBNDdSSUkxbVRVbUo3Uy91enhJ?=
 =?utf-8?B?TElqamxoRkRtaUR5YTh4SGIzZngyMlBsSmhNR1hSai96dytKaTM4REMra21O?=
 =?utf-8?B?bHM4NFc3VkZ0dVRqZDBWRUEvNVJuSTJPS2xlUXlaaGFtZ3JFcnJPcitCbE03?=
 =?utf-8?B?bW5ycG9nbXBLSzJEMU9vVjl5UGNnMWJHWWtqMFFvUUwxL2pUUXVJT25xcUp5?=
 =?utf-8?B?WWRMa3B3MCs3Ukx3OG03RXVIR005RU1Od2k3WE9raTZSV3hDejVLT0hTbSto?=
 =?utf-8?B?ZHhEOEJIcE95WnNDWGFWU1JQaDJSa3VkNUVZNlBqZ1pjOEdITW41L21SK3JY?=
 =?utf-8?B?aE9Scy9vRUcrZEVJelNtbG1aY0MxOWdHMWlaTEM2SUpJOXlKc1hjVTBHYXVq?=
 =?utf-8?B?dThYa3Vjb1JVdHBjWlNDTHQ3RTh5aE9IZm9kM1hNdklGTjNiYTdZc0Q5K09I?=
 =?utf-8?B?cDF2QVlwT25ZcDNmUlNHZFFRNFludmZoY3M4cWhvL2VYRk4wcitSZGQvTVdX?=
 =?utf-8?B?RmZJQjlPcDg5bi9IdWJ3UW51UVlIRDdVK2xFUWNYWlUvSXFkcEo1eWdKd0pv?=
 =?utf-8?B?a1hOaDJCaUhTRk51aHRFeG5nYVZjcGZkYWhyc3lmMmh4dmYrVXlMdER6U0Y4?=
 =?utf-8?B?NVc2MzBVS1lQcFQ1UU0vMGVyVjdiNHMvSkRSOE42RnFFd08xNEg5S3JqUkFX?=
 =?utf-8?B?dW45MkJFNTJUQ25oby9XMVVlcjhjWkhiMXpINWVHaEFjUmpzeWErMitIdS9B?=
 =?utf-8?B?bWUrZzRxZWpZTko0OEppOG04Y2JBeU80ZktHVGp0aWRmSENueEZHVHlYQnVo?=
 =?utf-8?B?U2pLbjRJWjRUclBPZGdDS3hjNkI0OUEva3k1QUhVR0xyNkFtdTkvQ3hLVmJE?=
 =?utf-8?B?c2sySWJIZFBtd3pQNVVFdm5CVkRsdzIrdHZabWtic2ZLWUYycnliajk0QjZw?=
 =?utf-8?B?Vjg5UHhqb1I3Q2RWalIxOFRPcmVnTEgxUm5CRmxFeG1NMUtJdm9UdzlwZ2tr?=
 =?utf-8?B?cWV6ckJ5NnFJMDB3VG1WcWVKczN0dVhuVTNyY3Q3ckxNRW9DSkw1WDNYK0M3?=
 =?utf-8?B?UVJvYVVNWWY2NHdRRTdmRlpsWklleUh2b080QmFvbDFGM1BtUC9OSDN5STc1?=
 =?utf-8?B?VEp2aXJVMFZqMURid3lVeHRwbTQ4cmV1Q2VDZituelp1MHJZQ1BoV05aUEl3?=
 =?utf-8?B?Zm9sSXl1Qk1HWjlNVGV5bkcwdzBkaW9wbkkzUUdmdWVNb3BiV0JxcGMxOEph?=
 =?utf-8?B?VGpVZGJVVC9qSHVPVmplM3gxR21weHpUVXFwWHFsOW9iWmRmbCtYdklPUUhq?=
 =?utf-8?Q?GkLYUDxk0pRsJZQ7KDMTy4BuMoJq20=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V09lc2R4cWc4dmozY2VTZElubkxBU1FVU1ZyKzF2Z1hDc0tRbEdXNXpZaTJq?=
 =?utf-8?B?Vmh0d0NqbnJ6NWc4Ui9mbjRvVUhyMW9CanJtUjdPZ1J3cS9HZlN6dmNseDM0?=
 =?utf-8?B?VldNRzFmMzhCd1Jtb00wc09NT1Q2MW9KMmtjWFd5dmYrM2ZNWWJPTURtY1ZQ?=
 =?utf-8?B?aWs2ZXpPL2F5cWpVdW4wcE1BV3JVOG5DZ0RsUk4zYzRwQ2xtc3JFeFQ4aHJi?=
 =?utf-8?B?WFpLNUJsdG0xMG1JQUMvSHoxWXBaMGxEcGYwTVdpNnRKV2wyREtaTFlkWnFV?=
 =?utf-8?B?YmdsdkE5Mm43a2Rzb3RHblErMzBqT2tkY1lwYmJkWEVkZUd2K3Z1cTNKNDdw?=
 =?utf-8?B?UzJRL2FwQThUdmo3ZHhVdHhFOHBPYkNqK3FrNXpubXBBWllhMEZaREs3TUI1?=
 =?utf-8?B?VE1DTHJTVFRNWElEWFlRdHlLcTlmZDJDYm1RT21IbVp0WkFxWnpjQWhJblNN?=
 =?utf-8?B?SGhwL3F2QWsrZERWN1o3MkJCYmUyczRRRGlaOWQ3cytUMEQ5RWw2cjJ5VXhM?=
 =?utf-8?B?cVBjTDRPU0pEYVpqaUlLc2wwZ295dWJGKzdNT0R1dXFHSDlHanQ3WjEyeW1C?=
 =?utf-8?B?S0VWRUxsMXRwSFNyTG9qK0JXY2RBY05tcWhlWXYyWk5xRXdyNkEzd2dROFcy?=
 =?utf-8?B?cHNCdzBVbERiN2tuMVZhS1hGTU5YdWpLMnlrZVIvSjB2aUIyekJBcG5mS0Z5?=
 =?utf-8?B?am5YaU8vN2dsZjdzSlZkcFZNdy9HenZXRk1vNTBNNlRjcU01d1dib2ZNSTdG?=
 =?utf-8?B?dUxkNEd3Z25WMk1xSDJsdTl1UTBzVytXRUU3aXNZL1hSS1lEVEhIL1QzWkZy?=
 =?utf-8?B?WW10Vy9GUXIzRHg5bVFsektBWVRKWWJlenVlbFk5QWRMUHZ2TUkxUHcxRUh0?=
 =?utf-8?B?a3JFYlBZTnpDQ200Nk9UVFhiZkI3ZnlLUTNkbjh4aGJEcW0vZVRhY0I3dWN3?=
 =?utf-8?B?Qjh1MG5vcFRBNWxsSGVEUGJKc2lDWURjK0NaU1FNUmIvRlNPMDNpVDNaOSti?=
 =?utf-8?B?eWJUejgwalZIUzkvYmlZazFIb1lQUnVNNEV4dGRsN09IL0IyUmZZcGRxKy9H?=
 =?utf-8?B?aEVwQlpzMm4rTzZZQ3p1UVNHSG5ZN1JNejVDb2cxQlcvcSsyblpNd0FwdnVE?=
 =?utf-8?B?VTNmWURjaU55aHFrM3Bvb3BuV3JpRS9xSVM1KzRuSC82UDNHcmJLY29TcWVG?=
 =?utf-8?B?dnl3Rk0yNFBMY0VSaFFRUXM0NVp6V2lIQTBjTG4yeW5FZW52OS94RmFCKzZC?=
 =?utf-8?B?NmVSL0ZPYWcwK0RlU05jM0hZRE9TWWEwUjBSQkkvRW54YWhkQVRDY1ZWMTFm?=
 =?utf-8?B?UGpBTlRJNURPdnNuVS84NEJhc0k0WjNBTDdXQjF3ZGxKUHFEZWpRWFk5MEdN?=
 =?utf-8?B?b2Q1QlVpMFdZNHlsZEtibXFuSUtNL0cybDBnZ0k2cGlSQkdxeWZqalBqa1Az?=
 =?utf-8?B?SE40My9mVjlHZUwrT1ZoMHhzR0dZUUtoYnRMOFJSV1VHd2hldE1CZTB1dHNl?=
 =?utf-8?B?bFN2ZGFJMmVqS3dlWStaZXl1MjhSS1dqLzNPKzVkZFpwTENKbEdKM21nVTRB?=
 =?utf-8?B?RnlDTENGcFNMT01XcDN5T2lERHZyejJIamNNUmxnK3dPdFdRMzJHSWhNU0xV?=
 =?utf-8?B?cXdsVlk1OSt0T0ZwSnA3d1lxNVpQeUpacStnc1YvRWNxanAwUllxNndTVUsy?=
 =?utf-8?B?ZUptZDBXRVpQSUNYN1k1WUZHSTVia0ZJdk95YmsyeHNFU1B2SnpETi9LSTBu?=
 =?utf-8?B?bGdveTZaN3JFOEhPenFDcko3VXZ3OU9Xa0FBZHlPWkp2MkRZZEY0RDBHcDFD?=
 =?utf-8?B?N1ExamlhOXZ2S0x0dEhMdVp3WndVSC9GL25ubk4rUW9UQVVrUEE1bDdvazN0?=
 =?utf-8?B?VCtGS0RYaTQyaHp5TWQwMndBM2FQTFk3RW5nRDliMTR5c0ozZXhSRnZwS0wy?=
 =?utf-8?B?a0FPQzM2N3JzMy9VbnBxb0xBL1FjQmdYTUFYVVlPczUyUnRIZkw3Ni9NZzRp?=
 =?utf-8?B?WmdkbzRUcVlXbzFtNXgrVjNUbitmR0I2L3F5c2daQkJPS1R5eEUrL09KSDJi?=
 =?utf-8?B?TGVPa0QyYzdZZkozS3JlOGcrbVVnN1hBbUZEQkhCUlpiQ1VVMFl2R0xHWkdH?=
 =?utf-8?B?K2EyWkt3bFBlOFF0YWNhazlhbzloWU5UQ1NQM2x3ZzNvT3dFN25XTXpHVHJE?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 922dc156-62af-418a-a938-08de08fe4561
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:42:11.4576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcIwLPbvfTOo4M4ImOT6826REsHGPJWUR7q69toYvfJ8prIKZYcHRMh6kl3jcg6KUOraiIM7rLzPTxpAypOaZOx3tFM319CKE+6N04Yu+sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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

In addition to generic VFIO PCI functionality, the driver implements
VFIO migration uAPI, allowing userspace to enable migration for Intel
Graphics SR-IOV Virtual Functions.
The driver binds to VF device, and uses API exposed by Xe driver bound
to PF device to control VF device state and transfer the migration data.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 MAINTAINERS                  |   7 +
 drivers/vfio/pci/Kconfig     |   2 +
 drivers/vfio/pci/Makefile    |   2 +
 drivers/vfio/pci/xe/Kconfig  |  12 +
 drivers/vfio/pci/xe/Makefile |   3 +
 drivers/vfio/pci/xe/main.c   | 470 +++++++++++++++++++++++++++++++++++
 6 files changed, 496 insertions(+)
 create mode 100644 drivers/vfio/pci/xe/Kconfig
 create mode 100644 drivers/vfio/pci/xe/Makefile
 create mode 100644 drivers/vfio/pci/xe/main.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d46e9f2aaf2ad..ce84b021e6679 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26567,6 +26567,13 @@ L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/vfio/pci/virtio
 
+VFIO XE PCI DRIVER
+M:	Michał Winiarski <michal.winiarski@intel.com>
+L:	kvm@vger.kernel.org
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+F:	drivers/vfio/pci/xe
+
 VGA_SWITCHEROO
 R:	Lukas Wunner <lukas@wunner.de>
 S:	Maintained
diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index 2b0172f546652..c100f0ab87f2d 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
 
 source "drivers/vfio/pci/qat/Kconfig"
 
+source "drivers/vfio/pci/xe/Kconfig"
+
 endmenu
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index cf00c0a7e55c8..f5d46aa9347b9 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
 obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
 
 obj-$(CONFIG_QAT_VFIO_PCI) += qat/
+
+obj-$(CONFIG_XE_VFIO_PCI) += xe/
diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
new file mode 100644
index 0000000000000..787be88268685
--- /dev/null
+++ b/drivers/vfio/pci/xe/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config XE_VFIO_PCI
+	tristate "VFIO support for Intel Graphics"
+	depends on DRM_XE
+	select VFIO_PCI_CORE
+	help
+	  This option enables vendor-specific VFIO driver for Intel Graphics.
+	  In addition to generic VFIO PCI functionality, it implements VFIO
+	  migration uAPI allowing userspace to enable migration for
+	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
+
+	  If you don't know what to do here, say N.
diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
new file mode 100644
index 0000000000000..13aa0fd192cd4
--- /dev/null
+++ b/drivers/vfio/pci/xe/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
+xe-vfio-pci-y := main.o
diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
new file mode 100644
index 0000000000000..b9109b6812eb2
--- /dev/null
+++ b/drivers/vfio/pci/xe/main.c
@@ -0,0 +1,470 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/delay.h>
+#include <linux/file.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/vfio.h>
+#include <linux/vfio_pci_core.h>
+
+#include <drm/intel/xe_sriov_vfio.h>
+
+/**
+ * struct xe_vfio_pci_migration_file - file used for reading / writing migration data
+ */
+struct xe_vfio_pci_migration_file {
+	/** @filp: pointer to underlying &struct file */
+	struct file *filp;
+	/** @lock: serializes accesses to migration data */
+	struct mutex lock;
+	/** @xe_vdev: backpointer to &struct xe_vfio_pci_core_device */
+	struct xe_vfio_pci_core_device *xe_vdev;
+};
+
+/**
+ * struct xe_vfio_pci_core_device - xe-specific vfio_pci_core_device
+ *
+ * Top level structure of xe_vfio_pci.
+ */
+struct xe_vfio_pci_core_device {
+	/** @core_device: vendor-agnostic VFIO device */
+	struct vfio_pci_core_device core_device;
+
+	/** @mig_state: current device migration state */
+	enum vfio_device_mig_state mig_state;
+
+	/** @vfid: VF number used by PF, xe uses 1-based indexing for vfid */
+	unsigned int vfid;
+
+	/** @pf: pointer to driver_private of physical function */
+	struct pci_dev *pf;
+
+	/** @fd: &struct xe_vfio_pci_migration_file for userspace to read/write migration data */
+	struct xe_vfio_pci_migration_file *fd;
+};
+
+#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
+#define xe_vdev_to_pdev(xe_vdev) ((xe_vdev)->core_device.pdev)
+
+static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = migf->xe_vdev;
+
+	mutex_lock(&migf->lock);
+	xe_vdev->fd = NULL;
+	mutex_unlock(&migf->lock);
+}
+
+static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
+{
+	if (xe_vdev->fd)
+		xe_vfio_pci_disable_file(xe_vdev->fd);
+
+	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
+}
+
+static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+	int ret;
+
+	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->pf, xe_vdev->vfid);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
+
+	xe_vfio_pci_reset(xe_vdev);
+}
+
+static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
+	.reset_done = xe_vfio_pci_reset_done,
+};
+
+static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
+	int ret;
+
+	ret = vfio_pci_core_enable(vdev);
+	if (ret)
+		return ret;
+
+	vfio_pci_core_finish_enable(vdev);
+
+	return 0;
+}
+
+static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+
+	xe_vfio_pci_disable_file(migf);
+	mutex_destroy(&migf->lock);
+	kfree(migf);
+
+	return 0;
+}
+
+static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	ret = xe_sriov_vfio_data_read(migf->xe_vdev->pf, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_save_fops = {
+	.owner = THIS_MODULE,
+	.read = xe_vfio_pci_save_read,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
+					size_t len, loff_t *pos)
+{
+	struct xe_vfio_pci_migration_file *migf = filp->private_data;
+	ssize_t ret;
+
+	if (pos)
+		return -ESPIPE;
+
+	mutex_lock(&migf->lock);
+	ret = xe_sriov_vfio_data_write(migf->xe_vdev->pf, migf->xe_vdev->vfid, buf, len);
+	mutex_unlock(&migf->lock);
+
+	return ret;
+}
+
+static const struct file_operations xe_vfio_pci_resume_fops = {
+	.owner = THIS_MODULE,
+	.write = xe_vfio_pci_resume_write,
+	.release = xe_vfio_pci_release_file,
+	.llseek = noop_llseek,
+};
+
+static const char *vfio_dev_state_str(u32 state)
+{
+	switch (state) {
+	case VFIO_DEVICE_STATE_RUNNING: return "running";
+	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
+	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
+	case VFIO_DEVICE_STATE_STOP: return "stop";
+	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
+	case VFIO_DEVICE_STATE_ERROR: return "error";
+	default: return "";
+	}
+}
+
+enum xe_vfio_pci_file_type {
+	XE_VFIO_FILE_SAVE = 0,
+	XE_VFIO_FILE_RESUME,
+};
+
+static struct xe_vfio_pci_migration_file *
+xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
+		       enum xe_vfio_pci_file_type type)
+{
+	struct xe_vfio_pci_migration_file *migf;
+	const struct file_operations *fops;
+	int flags;
+
+	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
+	if (!migf)
+		return ERR_PTR(-ENOMEM);
+
+	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
+	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
+	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
+	if (IS_ERR(migf->filp)) {
+		kfree(migf);
+		return ERR_CAST(migf->filp);
+	}
+
+	mutex_init(&migf->lock);
+	migf->xe_vdev = xe_vdev;
+	xe_vdev->fd = migf;
+
+	stream_open(migf->filp->f_inode, migf->filp);
+
+	return migf;
+}
+
+static struct file *
+xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
+{
+	u32 cur = xe_vdev->mig_state;
+	int ret;
+
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
+
+	/*
+	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't have the capability to
+	 * selectively block p2p DMA transfers.
+	 * The device is not processing new workload requests when the VF is stopped, and both
+	 * memory and MMIO communication channels are transferred to destination (where processing
+	 * will be resumed).
+	 */
+	if ((cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P)) {
+		ret = xe_sriov_vfio_stop(xe_vdev->pf, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
+	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
+		return NULL;
+
+	if ((cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING) ||
+	    (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING)) {
+		ret = xe_sriov_vfio_run(xe_vdev->pf, xe_vdev->vfid);
+		if (ret)
+			goto err;
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+
+		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->pf, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if ((cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP)) {
+		if (xe_vdev->fd)
+			xe_vfio_pci_disable_file(xe_vdev->fd);
+
+		xe_sriov_vfio_stop_copy_exit(xe_vdev->pf, xe_vdev->vfid);
+
+		return NULL;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
+		struct xe_vfio_pci_migration_file *migf;
+
+		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
+		if (IS_ERR(migf)) {
+			ret = PTR_ERR(migf);
+			goto err;
+		}
+
+		ret = xe_sriov_vfio_resume_enter(xe_vdev->pf, xe_vdev->vfid);
+		if (ret) {
+			fput(migf->filp);
+			goto err;
+		}
+
+		return migf->filp;
+	}
+
+	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
+		if (xe_vdev->fd)
+			xe_vfio_pci_disable_file(xe_vdev->fd);
+
+		xe_sriov_vfio_resume_exit(xe_vdev->pf, xe_vdev->vfid);
+
+		return NULL;
+	}
+
+	if (new == VFIO_DEVICE_STATE_ERROR)
+		xe_sriov_vfio_error(xe_vdev->pf, xe_vdev->vfid);
+
+	WARN(true, "Unknown state transition %d->%d", cur, new);
+	return ERR_PTR(-EINVAL);
+
+err:
+	dev_dbg(xe_vdev_to_dev(xe_vdev),
+		"Failed to transition state: %s->%s err=%d\n",
+		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
+	return ERR_PTR(ret);
+}
+
+static struct file *
+xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
+			     enum vfio_device_mig_state new_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	enum vfio_device_mig_state next_state;
+	struct file *f = NULL;
+	int ret;
+
+	while (new_state != xe_vdev->mig_state) {
+		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
+					      new_state, &next_state);
+		if (ret) {
+			f = ERR_PTR(ret);
+			break;
+		}
+		f = xe_vfio_set_state(xe_vdev, next_state);
+		if (IS_ERR(f))
+			break;
+
+		xe_vdev->mig_state = next_state;
+
+		/* Multiple state transitions with non-NULL file in the middle */
+		if (f && new_state != xe_vdev->mig_state) {
+			fput(f);
+			f = ERR_PTR(-EINVAL);
+			break;
+		}
+	}
+
+	return f;
+}
+
+static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
+					enum vfio_device_mig_state *curr_state)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	*curr_state = xe_vdev->mig_state;
+
+	return 0;
+}
+
+static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
+				     unsigned long *stop_copy_length)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+
+	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->pf, xe_vdev->vfid);
+
+	return 0;
+}
+
+static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
+	.migration_set_state = xe_vfio_pci_set_device_state,
+	.migration_get_state = xe_vfio_pci_get_device_state,
+	.migration_get_data_size = xe_vfio_pci_get_data_size,
+};
+
+static void xe_vfio_pci_migration_init(struct vfio_device *core_vdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev =
+		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+
+	if (!xe_sriov_vfio_migration_supported(pdev->physfn))
+		return;
+
+	/* vfid starts from 1 for xe */
+	xe_vdev->vfid = pci_iov_vf_id(pdev) + 1;
+	xe_vdev->pf = pdev->physfn;
+
+	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
+	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
+}
+
+static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
+{
+	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
+
+	if (pdev->is_virtfn && strcmp(pdev->physfn->dev.driver->name, "xe") == 0)
+		xe_vfio_pci_migration_init(core_vdev);
+
+	return vfio_pci_core_init_dev(core_vdev);
+}
+
+static const struct vfio_device_ops xe_vfio_pci_ops = {
+	.name = "xe-vfio-pci",
+	.init = xe_vfio_pci_init_dev,
+	.release = vfio_pci_core_release_dev,
+	.open_device = xe_vfio_pci_open_device,
+	.close_device = vfio_pci_core_close_device,
+	.ioctl = vfio_pci_core_ioctl,
+	.device_feature = vfio_pci_core_ioctl_feature,
+	.read = vfio_pci_core_read,
+	.write = vfio_pci_core_write,
+	.mmap = vfio_pci_core_mmap,
+	.request = vfio_pci_core_request,
+	.match = vfio_pci_core_match,
+	.match_token_uuid = vfio_pci_core_match_token_uuid,
+	.bind_iommufd = vfio_iommufd_physical_bind,
+	.unbind_iommufd = vfio_iommufd_physical_unbind,
+	.attach_ioas = vfio_iommufd_physical_attach_ioas,
+	.detach_ioas = vfio_iommufd_physical_detach_ioas,
+};
+
+static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct xe_vfio_pci_core_device *xe_vdev;
+	int ret;
+
+	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
+				    &xe_vfio_pci_ops);
+	if (IS_ERR(xe_vdev))
+		return PTR_ERR(xe_vdev);
+
+	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
+
+	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
+	if (ret) {
+		vfio_put_device(&xe_vdev->core_device.vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void xe_vfio_pci_remove(struct pci_dev *pdev)
+{
+	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
+
+	vfio_pci_core_unregister_device(&xe_vdev->core_device);
+	vfio_put_device(&xe_vdev->core_device.vdev);
+}
+
+static const struct pci_device_id xe_vfio_pci_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_ANY_ID),
+		.class = PCI_BASE_CLASS_DISPLAY << 8, .class_mask = 0xff << 16,
+		.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
+
+static struct pci_driver xe_vfio_pci_driver = {
+	.name = "xe-vfio-pci",
+	.id_table = xe_vfio_pci_table,
+	.probe = xe_vfio_pci_probe,
+	.remove = xe_vfio_pci_remove,
+	.err_handler = &xe_vfio_pci_err_handlers,
+	.driver_managed_dma = true,
+};
+module_pci_driver(xe_vfio_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
-- 
2.50.1

