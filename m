Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPTFEviyomlc5AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:18:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5651C19D8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5B410E235;
	Sat, 28 Feb 2026 09:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="AAEXXbZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3AA10EB35
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 13:02:37 +0000 (UTC)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R4DKf42148593; Fri, 27 Feb 2026 05:02:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=KlcMemkc9bJtHR8db0IfOFGZB1VB4ARKq/c6FPjxsYs=; b=AAEXXbZ1U4EF
 CrPrC4m3dcg7aiUgAipYJ5xZlBhMmYnlulh0wC6HXoVE9YWtmgxcowlAg4ocKK6r
 nCS5P+MLuesaeaySMhRCyd7fQdTVg5ZCEPXRgO+T/tpQAYcXTq4VKVly/DJDyTIy
 Aqn+Y9Ip3TqlCtdz0SUuiui/ZZYZdmMx9F0yYiSXuZqB6keAInGR9+l20KG5FjfV
 8UWF4nWD6LflBR6njnb+eLb117VidTC5R3AS2FPy2AqObzpXnQINUiHdmh0JyJUF
 qT30pAvHMZ49CKucQFBbUxDV/upVNoh2M9dpO80D41LmQnTEeIGx5eJcmx5fDtFA
 1Z9MNBzA8Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ck423ukvk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 27 Feb 2026 05:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrsiuVrFOk66PCSsFu5Vj2AbOA9vFBO9iSpZvFb3v/+937FSIydCFV6ecJlcVDs2Clg5p9AheIXRUKJZ28ilQzO43EXc3z4bz2ckmxvE97XIXuUKByZ//OtcHROLRsl9uo+lN+kssaE4vnqQa3S8lX7LR9hmfL/yNUzltbhhJQ0r8Wfk9WrGtJcpSlutWw4yTI5qBJd1re8o5bFw3kCtBdQHCHL7VVIz44pRO1b3xhv7zwLPi3YSFfztII77+qffRHao66tGnYA+GMdrD6/aYj/PcjbDfB4Nba82LBC2z7TJNhzg78tulCVCpeBFjLFKI83zpySkNEoT4hIKZ9Tngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlcMemkc9bJtHR8db0IfOFGZB1VB4ARKq/c6FPjxsYs=;
 b=bmY/PIWWWDecM85Xtre6UoT97ueefjCqF3PQ9mlX+TphdawdWCPoxKkCVHeB/VGi0DVxYnhMFaXKJvhGkKg5yX6yMspiKQhK/S2j2sHaSV+EVMxvvB228J+LIUlIuRmNIpWCYggeHcUz2NnL4sSODqdzYQ1AlpeAmhAnlOUaiK3JmtOGiMe+L05GTEoXGpfCOlDuQqd+CUiazFMFlrviGjAFXACRgvtwz44urHe2FF0tYsBzJfZJfkRsyNwKvGRuaDUR72nts2Cn9twxCTuck2d1l12OcKUBROslxmHxtg+rQthpCtwc5digNLrruuEVpuRO7xvZ5Tp7CSR8y4JigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH0PR15MB7038.namprd15.prod.outlook.com (2603:10b6:510:38d::10)
 by LV3PR15MB6481.namprd15.prod.outlook.com (2603:10b6:408:1b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 13:02:21 +0000
Received: from PH0PR15MB7038.namprd15.prod.outlook.com
 ([fe80::617b:b77c:494d:de19]) by PH0PR15MB7038.namprd15.prod.outlook.com
 ([fe80::617b:b77c:494d:de19%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 13:02:21 +0000
Message-ID: <ad614dc4-0fd3-4897-b879-5d78a22b534f@meta.com>
Date: Fri, 27 Feb 2026 13:02:08 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/7] dma-buf: uapi: Mechanism to revoke DMABUFs via
 ioctl()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-5-mattev@meta.com>
 <f75088c6-5795-49cc-8932-ea46c2223d74@amd.com>
Content-Language: en-GB
From: Matt Evans <mattev@meta.com>
In-Reply-To: <f75088c6-5795-49cc-8932-ea46c2223d74@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::7) To PH0PR15MB7038.namprd15.prod.outlook.com
 (2603:10b6:510:38d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR15MB7038:EE_|LV3PR15MB6481:EE_
X-MS-Office365-Filtering-Correlation-Id: 9721e374-3c2d-4abf-ce95-08de760071a8
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: y8Exu8QXtiiRxPeXIQL5XsuP2A8hDFMboowJe4Qt1mJUQmE8K5vTKQQGo1bfvdIFRsUoNVd1yXNZqNIxmaLjDdWOo4iDe/ZDQllgUsLUw9teYWnD33t1bQ3nPpDzSPzrbdnNmqCZyeLrc1ve9AFPHDcF0jN2HPTyPJQBZWiGjBUqoCFzCXVfGz8YZP5wYgc86LqHlCJ5zr4GZ3uI+R2Zo1BkusUSct4qnQFqvG1loIAYyalSUItRCaPIHHOwCMuUS9WRLa9fTxLZNx5bHE9XfDLT2L62n1igcQz0JdcOj3UfxkHjfkfjyks9GqGAYBQISDfATPdgHYIGlNScFMXV+flPJEr+7IPALmyhsNPDzxs6H7qtbKw6Xhi+mkafxFLIo0b3TXVOhlY8Dpc/2SdXHGyQL6fFZUBvGE0gWFsGnu+k5oQY3kELdqeH0rkP7BSelSxweJ6Y7zKTDMpOJ2sciD2UlvGBi+kpR6jzeysDPj5PiWGb7R8hAEjgAJDDLqHZBZzhjompoq6g78EwFhxnf13Z+l2SxBrs3W0iMwgZOab84dNfXeU8WnS+2479Wv1EXFXMNtMpfiC29Dp2PfYoJwH5BMPU0IQFL5nGmo+WsIG/9gEAbPMf2v7aASlGqDAFL1TXSupoAtY0f8lBefiYbtYC2KEY3HwEUFu0TrYwR4bjByBuCp2/d6OrAz0+iBdI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR15MB7038.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXozQlJseWFTaFpZbTdnTTJxMmM1cTVSREI2Tkx3VVo2RVdCbXJid3RYd0F1?=
 =?utf-8?B?eEY2aWY2WnlNOVh1VVNSb2diU1VXR2ZPREhDVVRvVVZLTDFram9xaHhNcHcx?=
 =?utf-8?B?ZldaZ2FuVE1JdldJZDVjOWJjT0dFd1diRGZvNkV0RndJRGEwVUszSHZBUmdh?=
 =?utf-8?B?b3V2emlMb0NZTkZYWVJrTnZ2dVNtdHZSRmxoR2lhYWRqdVFabW14TE9ldXFQ?=
 =?utf-8?B?NG5yMmlWdWwvbGZZU0xhUEpXV3R6STFIcGRBb1FiL1NmWWZjbFlkaHllM3Fj?=
 =?utf-8?B?KzNYY1dmUDJNd0s3bEpBai9kN0txTEJOaWczOTZkWnVvQU1KMzFONDUwa0pI?=
 =?utf-8?B?Q1JUTVM3czlZeSszenJZY0JDb2FiVnBSQndxeGFiSmdXYXFpUlpuNStkVjZo?=
 =?utf-8?B?YjJFei9CV1NoNUd2WDRZY0xyakk1QTN3TzdORWNXOW0wUWM2NnNLL1BjRjNl?=
 =?utf-8?B?M1RUMktIaUVKV0hjZkFKQWo3cVJwOG0wNE12N3RONUZwKzMwNnRaUTgwd0ZW?=
 =?utf-8?B?empTWnEyY2VnTzNoV0tVUWowMEtuUEQreE4wRFFlUDB3SnRtVTF1eHI4UC8w?=
 =?utf-8?B?bnVKSStxMkpHTEY0SkdGeHpDcTBZZ2lTcjZ5cDZEc2RSQmNHa1BHbmU2QjQ1?=
 =?utf-8?B?c1NhdmtqRGFuMVU0cG4yYStLR3hCT2VzaTA4RlhqVDRCSVdwL0hvOStTSFJu?=
 =?utf-8?B?ZlJqNHN5YWdycWtjWWpLZHc3Q1FRMXJNMlZSWVplZ05UYWNXRzBOM1VMdkE3?=
 =?utf-8?B?OVVKcEtYZkgzOUVtcTlPR3JVYjhHaTF3cFgvdTZTU3pUa2xJeGlqSnNBeGdq?=
 =?utf-8?B?TEdiQ2pNbWxKa1BtaEZIMVZKSnhUM2dHUDI3bkIrM2pCQmZia2o2eGpyUDU1?=
 =?utf-8?B?dGt1YzVCV2kvdlVxUFR6MWVzNmx5Um1iNG5OZ20rNkY0MEx1RFNDTjB1WHhW?=
 =?utf-8?B?Nm1YQ3J4bUd2bmpaVGRUVUtWMkVGS1FCcVhWZC9xbHp5ak8wdEN1Wk5KRVZE?=
 =?utf-8?B?YU13clFWR2Fra3NkVHo0bDRyNjRCQmNMeDR2azJjRi9DQ3YwRGM1c3U0SlZR?=
 =?utf-8?B?QUxlMCtFanhIKzVxQXhlTm9jQ1dnYnhYN3lyVHhBUTVsQnVqRjNOTUorNkJB?=
 =?utf-8?B?ejNEcFRnUVp1M29DcVNwS1hJRVFQMFQxaHdab2hsRDdDTjBqSnM0R0RIdVd0?=
 =?utf-8?B?VFFCWkZEbmkxZXJ5WnVMcHBlU1d5MGwwTUk2a1V2SDFTMUt5NDdOR2p4S2JU?=
 =?utf-8?B?TUtZYmxCRkVuYUhnclVSL3pNTWpkdGwxZVNQNzEzV3B1Nk84akVsQm1IblZ6?=
 =?utf-8?B?dS8rYW5TSk8rcDJKNnlFbmcxeHo4VUlxTEhuL3cvUGh2dWgvTnRiK21HS3Bu?=
 =?utf-8?B?czRoUUJYUENEK1FzWDJ5djNnTnIxY0phcmZiRFF0b0RjSDVSMHFMekNmRVkx?=
 =?utf-8?B?TFdIOWVSdlNCS1JMVVpoTlZlcUY3UGk4Skx5SUdNbTVLMysrYlNNU280YnRx?=
 =?utf-8?B?ZkUzNG9JOVMxUjlaQzhBWkRwRy8xZmRNR2NZUElyTHlnRkJMN1UrWVZWc0l1?=
 =?utf-8?B?M09lcGx6Y2JCc0Q1cXFKRDZhYVE0bkppeGlaVjlXWmF3Z2R5ejVhMG15dUZj?=
 =?utf-8?B?T1UwR1RXMU5FZ0VxaWdjMURDZWFhV3lOdzFMVkxQS09HcUlYTkN5cWNmM3hE?=
 =?utf-8?B?YkZYK1N1Q2Q2N1Y0Z2ExVUVCRkJDMGwyMEZodXgrZzNHb1FJM3ovK29tSXEy?=
 =?utf-8?B?QWoxOHhIcDMwNXUrbmk5TnV6endudU5BV25xeU5OWTljUCtYSEZHOUR6T1R1?=
 =?utf-8?B?ZmZ0R1drVGZETjV5azhtL2xxRHdTeEJMeVNoRG54QytjeTZIMnAxK3A5eFgx?=
 =?utf-8?B?dnpzTGJRcUJyTG82aU9KZ055K0ZpZ25KcGdVT1RWcCtpTkNuaENtemEwa3Zk?=
 =?utf-8?B?RER5aU51SmNUOWFTR0tqazQyTmh6V0xUL0tud0kyTGpkUmNYaGlBQ09GZjZG?=
 =?utf-8?B?V09QZ3hvaUJOSENUbHpsT09DbVN1WjZndGR6OG5VUVFBU2hxZVN1Y1ZmQmtQ?=
 =?utf-8?B?b1M4cmZoSkVQb0s5YWhYNm5kMUwwMGt5dXpzRnJMZmF2dzlob1RTYXJjeCtN?=
 =?utf-8?B?QldnSkQvbEtpVkZieXpDeGVScWtXZkFaS1NtMWJ3QWR0QUFRdjd5UDFGR3po?=
 =?utf-8?B?enpRN0lWWE0zYXlZSEFpeG1Md0ZwSU11M3Y3UHFkQm1iSVJxNmZiSzJkaEl3?=
 =?utf-8?B?UVZyWndVNE9BdE1zS3hvN2o3dE8yZkRFQWxoMHpHUVNNajBHQjZmd2I0UGsx?=
 =?utf-8?B?emUySG50cWJqcUVJQTFveDBOZWtkR0FldXQxSWloSlFERFA2dFh1c0NkODQ1?=
 =?utf-8?Q?ro8k2I8qHsZK7Sp8=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9721e374-3c2d-4abf-ce95-08de760071a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR15MB7038.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:02:21.4051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UYK4oPLelYkNZmXDRoxUyQDDMo4r2R1or0MlDceTbOdzDwi43Fc9T1Ujpb/QIFi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR15MB6481
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExNSBTYWx0ZWRfX5duXJt4+nC8q
 jcO5d8ZE3dCrTF6GSgD0tTnhCfF/liXVhM4YbSQxegBaa5iPMe7XTGrBATUXgGadtntMPOwoMNc
 koz5OgtPve9QJjLAvm1ZtXlxzktf50SYFl+6dCA0nc1LciQ1khicsxtG48CPDtp4BR8FLe1CKKx
 LFTrZnJFET4GeMydNpSZIIKXMUMDZ3NcmilDCAOmFgluj1ZrpeXQuXQIEfkKKcLHEPe7GXx2RVJ
 6cveIniHNtpuo6nyhDbL/Bg/8nCcUqDcuXM952haviXm3TeLKfhvdV5UBk7/6s5a8PmrLdO7JEk
 K/WrzjzRUKWjqaTlAEWtFlMcxVNs/dYXtIEqh85W9y9fdCaEVTtKalxxslf7LvpyyQbimk800jr
 e5Oi4HloP2AeUynH8MsvH33y8oo1K6wbPcJXKeGBEi8AFPkKJ3tGYP3wt+R3fOAtUzcbCs1G7iE
 hm9pFWjY0s39H2rOxKQ==
X-Authority-Analysis: v=2.4 cv=T6GBjvKQ c=1 sm=1 tr=0 ts=69a195e3 cx=c_pps
 a=ijphbjn0GKEIB6My7LrvAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=l-GKBj7RSL6P71OzaQwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: LDs1q2z5YdSAnREppSkthvc0pZ1HtUV2
X-Proofpoint-ORIG-GUID: LDs1q2z5YdSAnREppSkthvc0pZ1HtUV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:18:41 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[meta.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BD5651C19D8
X-Rspamd-Action: no action

Hi Christian,

On 27/02/2026 10:05, Christian König wrote:
> On 2/26/26 21:22, Matt Evans wrote:
>> Add a new dma-buf ioctl() op, DMA_BUF_IOCTL_REVOKE, connected to a new
>> (optional) dma_buf_ops callback, revoke().  An exporter receiving this
>> will _permanently_ revoke the DMABUF, meaning it can no longer be
>> mapped/attached/mmap()ed.  It also guarantees that existing
>> importers have been detached (e.g. via move_notify) and all mappings
>> made inaccessible.
>>
>> This is useful for lifecycle management in scenarios where a process
>> has created a DMABUF representing a resource, then delegated it to
>> a client process; access to the resource is revoked when the client is
>> deemed "done", and the resource can be safely re-used elsewhere.
> 
> Well that means revoking from the importer side. That absolutely doesn't make sense to me.
> 
> Why would you do that?

Well, it's for cleanup, but directed to a specific buffer.

Elaborating on the original example, a userspace driver creates a DMABUF
for parts of a BAR and then sends its fd to some other client process
via SCM_RIGHTS.  The client might then do all of:

- Process mappings of the buffer
- iommufd IO-mappings of it
- other unrelated drivers import it
- share the fd with more processes!

i.e. poking a programming interface and orchestrating P2P DMA to it.
Eventually the client completes and messages the driver to say goodbye,
except the client is buggy: it hangs before it munmaps or request other
drivers to shut down/detach their imports.

Now the original driver can't reuse any BAR ranges it shared out, as
there might still be active mappings or even ongoing P2P DMA to them.

The goal is to guarantee a point in time where resources corresponding
to a previously-shared DMABUF fd _cannot_ be accessed anymore:  CPUs,
or other drivers/importers, or any other kind of P2P DMA.  So yes, a
revoke must detach importers, using the synchronous revocation flow
Leon added in [0] ("dma-buf: Use revoke mechanism to invalidate shared
buffers").

(Apologies, I should really have just built this on top of a tree
containing that series to make this need clearer.)

But, it ultimately seems to have the same downstream effects as if one
were to, say, shut down VFIO device fds and therefore trigger
vfio_pci_dma_buf_cleanup().  It's just the reason to trigger revocation
is different:  a selective userspace-triggered revocation of a given
buffer, instead of an exporter cleanup-triggered revocation of all
buffers.  In both cases the goals are identical too, of a synchronised
point after which no more DMA/CPU access can happen.

(If I've misunderstood your question please clarify, but I hope that
answers it!)

Cheers,


Matt

[0] https://lore.kernel.org/linux-iommu/20260205-nocturnal-poetic-chamois-f566ad@houat/T/#m310cd07011e3a1461b6fda45e3f9b886ba76571a

> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Matt Evans <mattev@meta.com>
>> ---
>>  drivers/dma-buf/dma-buf.c    |  5 +++++
>>  include/linux/dma-buf.h      | 22 ++++++++++++++++++++++
>>  include/uapi/linux/dma-buf.h |  1 +
>>  3 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index edaa9e4ee4ae..b9b315317f2d 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -561,6 +561,11 @@ static long dma_buf_ioctl(struct file *file,
>>         case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
>>                 return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>>  #endif
>> +       case DMA_BUF_IOCTL_REVOKE:
>> +               if (dmabuf->ops->revoke)
>> +                       return dmabuf->ops->revoke(dmabuf);
>> +               else
>> +                       return -EINVAL;
>>
>>         default:
>>                 return -ENOTTY;
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index 0bc492090237..a68c9ad7aebd 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -277,6 +277,28 @@ struct dma_buf_ops {
>>
>>         int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>         void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>> +
>> +       /**
>> +        * @revoke:
>> +        *
>> +        * This callback is invoked from a userspace
>> +        * DMA_BUF_IOCTL_REVOKE operation, and requests that access to
>> +        * the buffer is immediately and permanently revoked.  On
>> +        * successful return, the buffer is not accessible through any
>> +        * mmap() or dma-buf import.  The request fails if the buffer
>> +        * is pinned; otherwise, the exporter marks the buffer as
>> +        * inaccessible and uses the move_notify callback to inform
>> +        * importers of the change.  The buffer is permanently
>> +        * disabled, and the exporter must refuse all map, mmap,
>> +        * attach, etc. requests.
>> +        *
>> +        * Returns:
>> +        *
>> +        * 0 on success, or a negative error code on failure:
>> +        * -ENODEV if the associated device no longer exists/is closed.
>> +        * -EBADFD if the buffer has already been revoked.
>> +        */
>> +       int (*revoke)(struct dma_buf *dmabuf);
>>  };
>>
>>  /**
>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>> index 5a6fda66d9ad..84bf2dd2d0f3 100644
>> --- a/include/uapi/linux/dma-buf.h
>> +++ b/include/uapi/linux/dma-buf.h
>> @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
>>  #define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, __u64)
>>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>>  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
>> +#define DMA_BUF_IOCTL_REVOKE   _IO(DMA_BUF_BASE, 4)
>>
>>  #endif
>> --
>> 2.47.3
>>
> 

