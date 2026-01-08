Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCDD00FE5
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 05:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533E410E677;
	Thu,  8 Jan 2026 04:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KtHnev06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010007.outbound.protection.outlook.com
 [52.101.193.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CBB10E2F0;
 Thu,  8 Jan 2026 04:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqkPYU7hTBJO4Mgec5iYs7y2IWSkLNrWaELqBlS42efz9oq85/fVdodKFQyPe/2Yl7tnrHK7MrNM4/sXneFHKjXyE6RjPxF9XauUkGp77RCfnsus1tlUe/CgQdYsOCMPHuq/n1pr97Fa1zJp6LYoSqo3sPZSA34a+M90fX9Mi6t5V3v/1OoRI3tkNsFRQwxmZMx+1Dj61QHbbkT5hGXV55uGQMaiz1+9vcxFgviwGBDMx3+yk9GhjBfl9SCB9oqJ/BHh5ai+Qri6e6pfGKR3uq4j06EqsfCzOP/gEsPoO124Zdqi5F8B/tStlZEL0tQOwTul9JVaT6fajlJXf27xCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBOSvBXFbs7RMkcofsNfYi3GHzU83Jv2cpLdqcFzgVw=;
 b=edDKb3OANlwMeiq2SB0hm+7KuX9ftCtiVVnaAyacxCPN9oKh9rEC59MAzAve/SSypDmuTkc4N8j8rGH4qUgzOvyDATjqxNLrNf4sNNMLb4UC+1+Ulmqhm5op7rGWzl/BpdIQNBS+WS04a/sJUneN7b1y5w6l7kFCYtgxnRJot1vzaTz9Td8oGACpakd5uP+lEFONuE/7rpubmZHa6Yc4fPBz0vaoDfsr/cb2Gv4KyVlglJqWOD9O/ZFO5tliOKmjmSwMyTseW1PR6Dy6r6gLkbntDjmaxDEdJGDrZgdYfAbr2ZZlEmdZbkWyMNq1eaoNMa512rFpG0sy8RrOnWT18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBOSvBXFbs7RMkcofsNfYi3GHzU83Jv2cpLdqcFzgVw=;
 b=KtHnev06Itg6azlXxR08kPV1kPP2Q6GpL7ENjIzfhhJ9GCvO36tkvlWG9cZTF1fJnInU4CIaKpBhZa+D92JueH4V3FbXNOcbX//c9S9KvDOjXcIugoe+bjOKoM6AwA6EPWixPdGsmwlU3z0Nbym3y97HB6y2cS7h5hejW9i6Evqkjzj7GTT1I5aGwcRSJfbWBWwNBN35NG112SmexMg8oO+nLhUsJydFmBRbrdvnRgGulcr/qqmcvBjX7xFgsdTsCFJUB9JcJUuJvTQpiUBdhJm7AsyI04xlRuYj61rlCuimMWkhuFQZHBNUfP4sYrog4bn66o+jZiFrTPspOTCdFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 04:47:39 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 04:47:38 +0000
Message-ID: <6d6e17e8-9fa3-4f22-9cce-242352fefb7b@nvidia.com>
Date: Thu, 8 Jan 2026 15:47:32 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
To: Matthew Brost <matthew.brost@intel.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>, Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Matthew Wilcox <willy@infradead.org>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
 <F4EAA470-C922-4066-A115-13D6D055C73A@nvidia.com>
 <95BD5D5B-C8EB-4EFA-A895-CFD660504485@nvidia.com>
 <aV7NBE3NS1wdsXBo@lstrano-desk.jf.intel.com>
 <541B31AD-1472-4D32-A968-B92895CC6890@nvidia.com>
 <b39d13b2-cc10-4803-b6b8-0a0447aa3349@nvidia.com>
 <aV8TuK5255NXd2PS@lstrano-desk.jf.intel.com>
 <0419825F-D627-41E9-887D-51E18A2D54E7@nvidia.com>
 <w22y7ioppcgcqikwko5v6zf4c42pdv345d6vt2kvk3dcmtmi6e@mn6undehc6xb>
 <aV8np0dX/qSzGOdv@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aV8np0dX/qSzGOdv@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 264e9a98-eaa8-486f-866c-08de4e710ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnROdmRYK2pBU2dxd0xiVWxKeFFSdTRjV1l4U0Vqa1A1T01MQ2pHd3RWWFpp?=
 =?utf-8?B?aFU2Z3VFeTc4YlNteStlT0xrNCt4cFRQQ04rY3ZHWE5ReDJEWXloM25manpY?=
 =?utf-8?B?R1hCRHkycGpVK2JsMUZXZ0RZV1pvU0VyV1YrYmtmdklMVmIrVmhDSWViUjlk?=
 =?utf-8?B?Vlp6Vm5iRHM4ZkZwaTNmM1pMekxyQ282ZXRxNU9XcXd4RWRqRlhvOExaQ1Bj?=
 =?utf-8?B?M3dKWUVoVDdEU2t1Q0ViQmdMa1JSMmZuMk9COCthYnRraFhlUUNqcHR1RHZH?=
 =?utf-8?B?Lzdpc05pZGJ3VXViUDNMT1NTbVV1UGROTUN0ajNwMk1wSU1XY211UEYxMDNK?=
 =?utf-8?B?YitNZVRFS2VacVduQkdpTW1uYXZFTHdyMUhHMHNGRXE5L0VlNlpxcm9sbjNS?=
 =?utf-8?B?Z3dDeVB6SnM1eEQ0YUh4M1EzMndqczdEVmxyNnRCTGNIUEluVmloRWJJanYr?=
 =?utf-8?B?MGIrTnk2MW13TVpkamdFZjBGeWl6UUN1Sm5RZXJacDgzUllZSzk1SGRLS0w1?=
 =?utf-8?B?NFpkVE91MEVmcThrRFo1UlBEUERteTBwN2E4bld0OUpidG56ZFpYa09oL0lH?=
 =?utf-8?B?bGJKZ0dDK1Z5ak9wY2Qxcm5ldThvMDBwNHI5bGovWUhwWTliN2NHb2ZNQWg0?=
 =?utf-8?B?K2Z1UWcyZVFiN3ZOZko4ZVFHNWZHY3Qzc2Q1clRtb2RPQkN0eHNaZ0hJZG5q?=
 =?utf-8?B?VzdIUTZ0ZmpNOFI2ditaTEVpZlllajVLVXZ6Y3VBcmVCMkE4aTVJb3hxZ1hC?=
 =?utf-8?B?VlhHbWlENjRnZ2h3R3h1a04zN0lESVQ1NWcrNk5nMlZ5aFlvN2pZWVZCYVZY?=
 =?utf-8?B?RzVmN2NwQ3kwaEUwL2xKN3N5WEdJaFdrSGVOU0JOeFJwMjRWVitFeVBUL3VO?=
 =?utf-8?B?ZXpzVm1aQURGRE10MXFnMmV0bU5sRGx1TGRtZ2pmQ2p6MlVEcUI3MHRJM3gv?=
 =?utf-8?B?NU1BSks5MUFGaW45bkp4RjdSajhIUUV6dGJPVC9rWDBHV1pNR0Qxdzd6eHU2?=
 =?utf-8?B?NUZtRXo4ZWMvd25wUUdVMWdlZDNWVFRSVlk3dFA1R3VGUW91eWIrN0QwY0Iy?=
 =?utf-8?B?WU0vOFZnM2JFY29MTDJLT0N3Z28vbld5NEtZdGNTWUtJQit0cncwTnpadEZD?=
 =?utf-8?B?blhicGNCSUUzbTFQNENBVDJsNmRwRjMybDNTVDdqOXN5MVp4N3JkYy9mRy9R?=
 =?utf-8?B?cUI2UGpjMk5SM2RPcFZ5c0lGVytJRFdRU1AyeU9LTTJGSjBnMTFGa1BTaTZY?=
 =?utf-8?B?RGFmYjhNYWNiOHdDSXBCZ2Z4YnJGc1RPa0FLUzJSdEtXTGIzcDhEU0l2VUJi?=
 =?utf-8?B?NzQzVnB1MlJKMUxkR1VnNThYSC9PYlRxWXdXcnE0MzcwZ1hlMU5uY08vaEtT?=
 =?utf-8?B?MWhBVzlUUGdIU2dYUWl3RGs2eTNRY3NaTFFDSndJc0NGRjN3V0NHcEorcmdO?=
 =?utf-8?B?SVN0SUU2bkhNV2wzK3hwcGhmNXYxUXg0SCsybUd3OXY5MXVoUlpQRktIVGFw?=
 =?utf-8?B?Vlg3TnQrYjFJMUhoaGcvMFJmMzdTZ3QvUytRODdwWjViRm05aEYraWVRdDlO?=
 =?utf-8?B?NXFkWE9pRTRFUkhyZkd6K045K3p0VDJNNko4NmwzblZubEsrZGZFa2QwREtB?=
 =?utf-8?B?SUowZERzaUltaHhxNDYyem55dURGdm5XcEw2MEtqN2NVSHR5VlVIblp1bWEr?=
 =?utf-8?B?M0I4eEFHcXR3U0lkVGd0Zlc0R3pjRWNmTWxnZWw0TXZmZ2tqYmJHYnpvUTJH?=
 =?utf-8?B?eGxwWEEyQlV0L1lwbTlWYnpqL3BuRUN0QTNhZ21TWTRHeXM0OUYzdjFvSUJp?=
 =?utf-8?B?aXJRcE4rMnY5Znh6R0FrUW9Na1B0K3YzM25TV1dyWGREQmlxNEttUEN5NkRF?=
 =?utf-8?B?cGhFeHJXS0RPUjNrY1VlS2JzZDdxY3BEVmhvRkF4SHRhNEdVTXJGUFIwNzIw?=
 =?utf-8?Q?1HrcLNXqmREG/evz0yYR/yVBWCmDCmVw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkV3b3N2TEZFa3h1RisvcGFBSFIwMDlIMVo2OGNZTGJmeS9xcTRKNlorY2NO?=
 =?utf-8?B?Y2tXL1BwVll3M0xrYS9nMFFGQ2dqZHQxYVkxcmdmS2xwTEVObnJUSk1HNzhD?=
 =?utf-8?B?MGJiTC9DWXZzRnF3OXJ4UGVmcEVUNHB3SkpKM1FwdzZieDBxYThCKzJqOHRS?=
 =?utf-8?B?UmJQblN1OVFlbmI1YXIxcmhEV2JlK28vZ1lid3lSWXd5R3N4cTlJM0JCNXFG?=
 =?utf-8?B?T2U4REVZTWxWdk1od2wxVmJrNzV2NnFZdlByL0RJUWdqcWNXaVQwQUQ1T1dl?=
 =?utf-8?B?a2syYjQ4ak15YkNtRVB6Q2pxSGtpVEhIQTlNdFJPSlR4R1YzQXh6dDF6MVNS?=
 =?utf-8?B?L0lhOEdtcVFYZ2N2Wjg3MGZsK0RKa2JxdWFvbVlCMlJMOEQ3VUZNc3d5YzZI?=
 =?utf-8?B?WlJaalg5R1p3VWpuaXMyS3F2ak0waDY4eGxIazVkNXhISUt0SGdobm85bUJn?=
 =?utf-8?B?QUNxUkxkL0V5Q0pMQnREQ2pOQnN3QVREcldrbmp5SUhSUSthOUlhTjFzSS9L?=
 =?utf-8?B?MHBiQ0RuV0kyRTVQZU1pTkZ6SnkwY0YyNEh0ems3cDZ0MFlyNlJ5Ym1qdEhH?=
 =?utf-8?B?VS95QmUwaVFlTHQ5cHBvVlpJUktiOGo3bVkyaDlWNDRFaFUzU2MyVnYvSW1q?=
 =?utf-8?B?S29Ub0MzUnNWbDNXRG9icUVLZUhZZHJIREV0RHJuUHhzZFM4bGJuYlRNRW9K?=
 =?utf-8?B?Q2hlN1NIdVdCa1lNOGY5T28xQXJnK2VpVDlRYkEyQmkyZVNyVXVpWmFNWVc1?=
 =?utf-8?B?R1ZDaUpPZ1EzcU5LdnptVmNaWmg3V3YwZ2RPRXVOWVRBenNqdWU2MGVpTUJw?=
 =?utf-8?B?cnB1Y0trVXlZRnJLblBIazB2aHJWWnZiMTRJQ21aaGdQRmlzZFlhNXJVUkRF?=
 =?utf-8?B?SzZnU2d2bzhsSWM0WHZMTjJhUW5vWHI4OG5uVzlkNi9oWGFuVkFZa09HN0JV?=
 =?utf-8?B?QnFnczRxeU1pbFB2OEJRb1JkQitudFdBeUJSR2p2ajZUVy9lMkN2Yk1tYitr?=
 =?utf-8?B?eHZ5bTg2cUVPNmMrdzhiVmRFL2JIMnAzdkl2SW9venlYcitQc1F5WVB6U2tG?=
 =?utf-8?B?UWpONENNbldYTUZnZ0YrSXE4dTErQVFDZWJoNHRwY1dMd0F3U2cxZDBWOWF2?=
 =?utf-8?B?RjFmajNIZjM1ME5OVWlEbzdwemVLQkd1UzR6UHFFMEdzNk1abm1OblJBaUlF?=
 =?utf-8?B?YStzNDRmRnBBeGk3OEsxYnBMRS8wN1RoUzVla2xxeU1VUzJnSytMYXhaVzhh?=
 =?utf-8?B?QVJXdnlxakplMWJUcjFQZENzcUJzWDNzckhoQWM3RTRHb3dDem1Za0ZQTGZZ?=
 =?utf-8?B?aEhFQ2VmRGw5bE5GZXRreEM1WE8zanV1RnZDTnhNZ3JGQXBtWFJVMHVuUXZq?=
 =?utf-8?B?cGs3eVlFWGVybFJoNjQwUTJZVVBBdjMrU0hlKzVVNVE2bnZzamQyTklpRmVw?=
 =?utf-8?B?MnoyZEhuTkc3RWFteXdLU2JPT3BZVjlyWnpVNk9KUXR0Q2s2c0dRNkdsTjhs?=
 =?utf-8?B?Rm9TTTR4YmZWcWxFK05HNVkzRzRCalRpTUplUUppOUU0US8wRElkUlNqRC8x?=
 =?utf-8?B?SXZ6YzViVW1qa3hnQmhMNzl1MFB4Wk83NVlITE1wK1k2ZDJlcmtCakU0NnpH?=
 =?utf-8?B?SnRrenJsYkMzODBGQk1FU2FwN2ZKTXg0Q29XSUpBTGkzazlpM2d3ck4rOHdD?=
 =?utf-8?B?R1A2TStvRlhVKyswM0VNVG42OC9ZOXpUM0x0MFR2b1A2V0Y1OEw2UHZUS0ZC?=
 =?utf-8?B?TmorM3FiSnZGMEdGTGhBbGxlbCt0U0JaYjNUcGtCVTJTd3F0UDB0cys2WUZ5?=
 =?utf-8?B?RjJSeUNvK3lJdG1mWWI1VTE1eHVFKzFpb29PL0JaM1BrcEkvZjRkSFVOQk9v?=
 =?utf-8?B?VlFqRnFGS2FBTHczd1pxWElNYjlmZkdkMk1lWlZ3TWJ2YkZZVmx5QkNDWGpN?=
 =?utf-8?B?U2ZReHhXcmRXL3VNZDduU21lajR1R0NmQ0lyZy9PTkgwczFWREdwcDd4VGJt?=
 =?utf-8?B?SStQQjFMT3FxOGtHQzBBZUEwQU9rMFp2TFhhM3pRTGdSVnM3blJGOGhxK2tS?=
 =?utf-8?B?aGdIUmxlYnVoMXh5cXAvbnRwODRFbWxHbkhYOEtoY0gvVXorM1Myam5VUUFm?=
 =?utf-8?B?QmJTM3pVd0pBcXhFRHRmZzk3N3lHWHhNQVV6U1pKaTduSHd5Q2NXV0N0dHZI?=
 =?utf-8?B?L2lKUmszZGJZYTduY1dTSXZ4cDRGMTk4WG44MzFFSnlBYzY0Rml3azBWQW5W?=
 =?utf-8?B?bnBhM3Mwemh6OC9PekMrWTVBaXNxZTdSak9sRlk5S0RMeFNoSjYrdzdNbEF3?=
 =?utf-8?B?MjY2S01ScjVIOTdra1RYUS85czFLNkJQbWJicmJyVTl1cUNucmoxTGF2WXRX?=
 =?utf-8?Q?e/hlgdbqCvTpVv29qENzHWH7u+8dLihqq9BPzVlyUG2oy?=
X-MS-Exchange-AntiSpam-MessageData-1: 4NRQRtvQTlqX8A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264e9a98-eaa8-486f-866c-08de4e710ceb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 04:47:38.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuLtFGAtIMmshryv1ituucyRu9XiPAjelQpsrjipy7QV13aKnMffxbC3K0gOfgB3MCdVWR366M9IEBxHfzQtig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068
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

On 1/8/26 13:42, Matthew Brost wrote:
> On Thu, Jan 08, 2026 at 02:14:28PM +1100, Alistair Popple wrote:
>> On 2026-01-08 at 13:53 +1100, Zi Yan <ziy@nvidia.com> wrote...
>>> On 7 Jan 2026, at 21:17, Matthew Brost wrote:
>>>
>>>> On Thu, Jan 08, 2026 at 11:56:03AM +1100, Balbir Singh wrote:
>>>>> On 1/8/26 08:03, Zi Yan wrote:
>>>>>> On 7 Jan 2026, at 16:15, Matthew Brost wrote:
>>>>>>
>>>>>>> On Wed, Jan 07, 2026 at 03:38:35PM -0500, Zi Yan wrote:
>>>>>>>> On 7 Jan 2026, at 15:20, Zi Yan wrote:
>>>>>>>>
>>>>>>>>> +THP folks
>>>>>>>>
>>>>>>>> +willy, since he commented in another thread.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 16 Dec 2025, at 15:10, Francois Dugast wrote:
>>>>>>>>>
>>>>>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>
>>>>>>>>>> Introduce migrate_device_split_page() to split a device page into
>>>>>>>>>> lower-order pages. Used when a folio allocated as higher-order is freed
>>>>>>>>>> and later reallocated at a smaller order by the driver memory manager.
>>>>>>>>>>
>>>>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>>>>>> Cc: linux-mm@kvack.org
>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>  include/linux/huge_mm.h |  3 +++
>>>>>>>>>>  include/linux/migrate.h |  1 +
>>>>>>>>>>  mm/huge_memory.c        |  6 ++---
>>>>>>>>>>  mm/migrate_device.c     | 49 +++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>  4 files changed, 56 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>>>>>>>> index a4d9f964dfde..6ad8f359bc0d 100644
>>>>>>>>>> --- a/include/linux/huge_mm.h
>>>>>>>>>> +++ b/include/linux/huge_mm.h
>>>>>>>>>> @@ -374,6 +374,9 @@ int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list
>>>>>>>>>>  int folio_split_unmapped(struct folio *folio, unsigned int new_order);
>>>>>>>>>>  unsigned int min_order_for_split(struct folio *folio);
>>>>>>>>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>>>>>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
>>>>>>>>>> +			   struct page *split_at, struct xa_state *xas,
>>>>>>>>>> +			   struct address_space *mapping, enum split_type split_type);
>>>>>>>>>>  int folio_check_splittable(struct folio *folio, unsigned int new_order,
>>>>>>>>>>  			   enum split_type split_type);
>>>>>>>>>>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
>>>>>>>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>>>>>>>> index 26ca00c325d9..ec65e4fd5f88 100644
>>>>>>>>>> --- a/include/linux/migrate.h
>>>>>>>>>> +++ b/include/linux/migrate.h
>>>>>>>>>> @@ -192,6 +192,7 @@ void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
>>>>>>>>>>  			unsigned long npages);
>>>>>>>>>>  void migrate_device_finalize(unsigned long *src_pfns,
>>>>>>>>>>  			unsigned long *dst_pfns, unsigned long npages);
>>>>>>>>>> +int migrate_device_split_page(struct page *page);
>>>>>>>>>>
>>>>>>>>>>  #endif /* CONFIG_MIGRATION */
>>>>>>>>>>
>>>>>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>>>>>>> index 40cf59301c21..7ded35a3ecec 100644
>>>>>>>>>> --- a/mm/huge_memory.c
>>>>>>>>>> +++ b/mm/huge_memory.c
>>>>>>>>>> @@ -3621,9 +3621,9 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>>>>>>>>>   * Return: 0 - successful, <0 - failed (if -ENOMEM is returned, @folio might be
>>>>>>>>>>   * split but not to @new_order, the caller needs to check)
>>>>>>>>>>   */
>>>>>>>>>> -static int __split_unmapped_folio(struct folio *folio, int new_order,
>>>>>>>>>> -		struct page *split_at, struct xa_state *xas,
>>>>>>>>>> -		struct address_space *mapping, enum split_type split_type)
>>>>>>>>>> +int __split_unmapped_folio(struct folio *folio, int new_order,
>>>>>>>>>> +			   struct page *split_at, struct xa_state *xas,
>>>>>>>>>> +			   struct address_space *mapping, enum split_type split_type)
>>>>>>>>>>  {
>>>>>>>>>>  	const bool is_anon = folio_test_anon(folio);
>>>>>>>>>>  	int old_order = folio_order(folio);
>>>>>>>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>>>>>>>> index 23379663b1e1..eb0f0e938947 100644
>>>>>>>>>> --- a/mm/migrate_device.c
>>>>>>>>>> +++ b/mm/migrate_device.c
>>>>>>>>>> @@ -775,6 +775,49 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>>>>>>>>  EXPORT_SYMBOL(migrate_vma_setup);
>>>>>>>>>>
>>>>>>>>>>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>>>>>>>>>> +/**
>>>>>>>>>> + * migrate_device_split_page() - Split device page
>>>>>>>>>> + * @page: Device page to split
>>>>>>>>>> + *
>>>>>>>>>> + * Splits a device page into smaller pages. Typically called when reallocating a
>>>>>>>>>> + * folio to a smaller size. Inherently racy—only safe if the caller ensures
>>>>>>>>>> + * mutual exclusion within the page's folio (i.e., no other threads are using
>>>>>>>>>> + * pages within the folio). Expected to be called a free device page and
>>>>>>>>>> + * restores all split out pages to a free state.
>>>>>>>>>> + */
>>>>>>>>
>>>>>>>> Do you mind explaining why __split_unmapped_folio() is needed for a free device
>>>>>>>> page? A free page is not supposed to be a large folio, at least from a core
>>>>>>>> MM point of view. __split_unmapped_folio() is intended to work on large folios
>>>>>>>> (or compound pages), even if the input folio has refcount == 0 (because it is
>>>>>>>> frozen).
>>>>>>>>
>>>>>>>
>>>>>>> Well, then maybe this is a bug in core MM where the freed page is still
>>>>>>> a THP. Let me explain the scenario and why this is needed from my POV.
>>>>>>>
>>>>>>> Our VRAM allocator in Xe (and several other DRM drivers) is DRM buddy.
>>>>>>> This is a shared pool between traditional DRM GEMs (buffer objects) and
>>>>>>> SVM allocations (pages). It doesn’t have any view of the page backing—it
>>>>>>> basically just hands back a pointer to VRAM space that we allocate from.
>>>>>>> From that, if it’s an SVM allocation, we can derive the device pages.
>>>>>>>
>>>>>>> What I see happening is: a 2M buddy allocation occurs, we make the
>>>>>>> backing device pages a large folio, and sometime later the folio
>>>>>>> refcount goes to zero and we free the buddy allocation. Later, the buddy
>>>>>>> allocation is reused for a smaller allocation (e.g., 4K or 64K), but the
>>>>>>> backing pages are still a large folio. Here is where we need to split
>>>>>>
>>>>>> I agree with you that it might be a bug in free_zone_device_folio() based
>>>>>> on my understanding. Since zone_device_page_init() calls prep_compound_page()
>>>>>> for >0 orders, but free_zone_device_folio() never reverse the process.
>>>>>>
>>>>>> Balbir and Alistair might be able to help here.
>>
>> Just catching up after the Christmas break.
>>
> 
> I think everyone is and scrambling for the release PR. :)
> 
>>>>>
>>>>> I agree it's an API limitation
>>>
>>> I am not sure. If free_zone_device_folio() does not get rid of large folio
>>> metadata, there is no guarantee that a freed large device private folio will
>>> be reallocated as a large device private folio. And when mTHP support is
>>> added, the folio order might change too. That can cause issues when
>>> compound_head() is called on a tail page of a previously large folio, since
>>> compound_head() will return the old head page instead of the tail page itself.
>>
>> I agree that freeing the device folio should get rid of the large folio. That
>> would also keep it consistent with what we do for FS DAX for example.
>>
> 
> +1
> 
>>>>>
>>>>>>
>>>>>> I cherry picked the code from __free_frozen_pages() to reverse the process.
>>>>>> Can you give it a try to see if it solve the above issue? Thanks.
>>
>> It would be nice if this could be a common helper for freeing compound
>> ZONE_DEVICE pages. FS DAX already has this for example:
>>
>> static inline unsigned long dax_folio_put(struct folio *folio)
>> {
>> 	unsigned long ref;
>> 	int order, i;
>>
>> 	if (!dax_folio_is_shared(folio))
>> 		ref = 0;
>> 	else
>> 		ref = --folio->share;
>>
>> 	if (ref)
>> 		return ref;
>>
>> 	folio->mapping = NULL;
>> 	order = folio_order(folio);
>> 	if (!order)
>> 		return 0;
>> 	folio_reset_order(folio);
>>
>> 	for (i = 0; i < (1UL << order); i++) {
>> 		struct dev_pagemap *pgmap = page_pgmap(&folio->page);
>> 		struct page *page = folio_page(folio, i);
>> 		struct folio *new_folio = (struct folio *)page;
>>
>> 		ClearPageHead(page);
>> 		clear_compound_head(page);
>>
>> 		new_folio->mapping = NULL;
>> 		/*
>> 		 * Reset pgmap which was over-written by
>> 		 * prep_compound_page().
>> 		 */
>> 		new_folio->pgmap = pgmap;
>> 		new_folio->share = 0;
>> 		WARN_ON_ONCE(folio_ref_count(new_folio));
>> 	}
>>
>> 	return ref;
>> }
>>
>> Aside from the weird refcount checks that FS DAX needs to at the start of this
>> function I don't think there is anything specific to DEVICE_PRIVATE pages there.
>>
> 
> Thanks for the reference, Alistair. This looks roughly like what I
> hacked together in an effort to just get something working. I believe a
> common helper can be made to work. Let me churn on this tomorrow and put
> together a proper patch.
> 
>>>>>>
>>>>>> From 3aa03baa39b7e62ea079e826de6ed5aab3061e46 Mon Sep 17 00:00:00 2001
>>>>>> From: Zi Yan <ziy@nvidia.com>
>>>>>> Date: Wed, 7 Jan 2026 16:49:52 -0500
>>>>>> Subject: [PATCH] mm/memremap: free device private folio fix
>>>>>> Content-Type: text/plain; charset="utf-8"
>>>>>>
>>>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>>>> ---
>>>>>>  mm/memremap.c | 15 +++++++++++++++
>>>>>>  1 file changed, 15 insertions(+)
>>>>>>
>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>> index 63c6ab4fdf08..483666ff7271 100644
>>>>>> --- a/mm/memremap.c
>>>>>> +++ b/mm/memremap.c
>>>>>> @@ -475,6 +475,21 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>  		pgmap->ops->folio_free(folio);
>>>>>>  		break;
>>>>>>  	}
>>>>>> +
>>>>>> +	if (nr > 1) {
>>>>>> +		struct page *head = folio_page(folio, 0);
>>>>>> +
>>>>>> +		head[1].flags.f &= ~PAGE_FLAGS_SECOND;
>>>>>> +#ifdef NR_PAGES_IN_LARGE_FOLIO
>>>>>> +		folio->_nr_pages = 0;
>>>>>> +#endif
>>>>>> +		for (i = 1; i < nr; i++) {
>>>>>> +			(head + i)->mapping = NULL;
>>>>>> +			clear_compound_head(head + i);
>>>>>
>>>>> I see that your skipping the checks in free_page_tail_prepare()? IIUC, we should be able
>>>>> to invoke it even for zone device private pages
>>>
>>> I am not sure about what part of compound page is also used in device private folio.
>>> Yes, it is better to add right checks.
>>>
>>>>>
>>>>>> +		}
>>>>>> +		folio->mapping = NULL;
>>>>>
>>>>> This is already done in free_zone_device_folio()
>>>>>
>>>>>> +		head->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
>>>>>
>>>>> I don't think this is required for zone device private folios, but I suppose it
>>>>> keeps the code generic
>>>>>
>>>>
>>>> Well, the above code doesn’t work, but I think it’s the right idea.
>>>> clear_compound_head aliases to pgmap, which we don’t want to be NULL. I
>>>
>>> Thank you for pointing it out. I am not familiar with device private page code.
>>>
>>>> believe the individual pages likely need their flags cleared (?), and
>>>
>>> Yes, I missed the tail page flag clearing part.
>>>
> 
> I think the page head is the only thing that really needs to be cleared,
> though I could be wrong.
> 
>>>> this step must be done before calling folio_free and include a barrier,
>>>> as the page can be immediately reallocated.
>>>>
>>>> So here’s what I came up with, and it seems to work (for Xe, GPU SVM):
>>>>
>>>>  mm/memremap.c | 21 +++++++++++++++++++++
>>>>  1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>> index 63c6ab4fdf08..ac20abb6a441 100644
>>>> --- a/mm/memremap.c
>>>> +++ b/mm/memremap.c
>>>> @@ -448,6 +448,27 @@ void free_zone_device_folio(struct folio *folio)
>>>>             pgmap->type != MEMORY_DEVICE_GENERIC)
>>>>                 folio->mapping = NULL;
>>>>
>>>> +       if (nr > 1) {
>>>> +               struct page *head = folio_page(folio, 0);
>>>> +
>>>> +               head[1].flags.f &= ~PAGE_FLAGS_SECOND;
>>>> +#ifdef NR_PAGES_IN_LARGE_FOLIO
>>>> +               folio->_nr_pages = 0;
>>>> +#endif
>>>> +               for (i = 1; i < nr; i++) {
>>>> +                       struct folio *new_folio = (struct folio *)(head + i);
>>>> +
>>>> +                       (head + i)->mapping = NULL;
>>>> +                       (head + i)->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
>>>> +
>>>> +                       /* Overwrite compound_head with pgmap */
>>>> +                       new_folio->pgmap = pgmap;
>>>> +               }
>>>> +
>>>> +               head->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
>>>> +               smp_wmb();	/* Changes but be visable before freeing folio */
>>>> +       }
>>>> +
>>>>         switch (pgmap->type) {
>>>>         case MEMORY_DEVICE_PRIVATE:
>>>>         case MEMORY_DEVICE_COHERENT:
>>>>
>>>
>>> It looks good to me, but I am very likely missing the detail on device private
>>> pages. Like Balbir pointed out above, for tail pages, calling
>>> free_tail_page_prepare() might be better to get sanity checks like normal
>>> large folio, although you will need to set ->pgmap after it.
>>>
>>> It is better to send it as a proper patch and get reviews from other
>>> MM folks.
>>>
> 
> Yes, agreed. See above—I’ll work on a proper patch tomorrow and CC all
> the correct MM folks. Aiming to have something ready for the next
> release PR.
> 

Yes, please!

Thanks,
Balbir

