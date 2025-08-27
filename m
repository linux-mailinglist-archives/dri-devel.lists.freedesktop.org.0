Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B250B377B5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 04:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA49410E30C;
	Wed, 27 Aug 2025 02:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.b="sPtCx587";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25DB10E30C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 02:26:02 +0000 (UTC)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57R0oigN4170422; Tue, 26 Aug 2025 19:25:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=cc:content-transfer-encoding:content-type:date:from
 :message-id:mime-version:subject:to; s=PPS06212021; bh=hRR4d5Qdt
 pCGsUCBBKGKJU7JLwzl4XG8Q8t222qt7yE=; b=sPtCx587p10a0dgFwQMASpx1d
 Ppf+uDWOF2jNMbYaZiEXg9+qIspeATCHDmMqt12gqhWoq2ixydvVbJQDTjm5AOLD
 dDAGEdU2S595BdReK9uz0DUcWjab9hoXdbSo7ZaraKvDWhMm3yH2Qqbidm9N+9Rl
 v2z1K7i0vvuHGkqq5fqu9lZtHeoTcU/vGs/A5fVYP/JBA3p33Y+QLBZEUzQH8HFC
 juOgPNfoXsBMJwdFE+31Q3G4MtvqXNQjp2pK3Of13R2kjf9bRmuIIArp9vOb3dWk
 OqemKyVeljZoJv/B5kk7UoWptv6J4o3IR5nxFUOT0mm7+FyeaYu6hSxM/gjuw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x23vyc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 26 Aug 2025 19:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErYfjQqQBCvoTWjYO3lxP+tV7oNFAMmLaTUUo9fqXdUypqU9qJYbhfQnzmzU5viDKv/djcbB7kguFRLV9eKQF48iIgglo/2q8mefWTm0PuQV93YU8BLYMhcJH4cFrg9iBe79BdDxyttIOcMdJCHmpMiyo6hmljfX8aOaZcDj1UMIZuHAq7tKFwDQbQMRbCG9cYFNf+dHRWakwpDu/cMdbGJ4Z6+utordWp/nrWilIaNIZOpNDiCYBrFGPbpX0fqyHKR128e5oZBe7HLs8nJf6D2eJEoKQv6Tv7DBQW5foz0IHr762e7Jco5/tA4Ftx6qmseDRjCYqFvubP2+ZjQ2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRR4d5QdtpCGsUCBBKGKJU7JLwzl4XG8Q8t222qt7yE=;
 b=FInMR51BWx54WuiWyp6XXsYOCjIrOxDs0g1K9tbxQblCw17K7pkUlYCeuNmpCbEL5iybn7YyU2gxEhnMAeGRkvlfIv9Iz2KSf18HT5kZ0hH/e7vh2maR+YWw5LJPEpqzWA0uJD66JgizN04xXIqO1RAP/EgQcZjntXlSEmI7KIah2/7RFvbcguKSVa36pu6YL+W2FINhlH4/tbfwZoJGxoN2I1fckw0fsiREZGv8iqO3KurluQLGXFZAERhvDLcnH17qmjrZKEH5tR9p2m29rllWlse6ampj6YAh/MjVm3oXm+QrEc0HyHzvp76ol2B8maUPb9X/K6QXSeLbP+fneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DM3PPF67FA1A8F8.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 02:25:48 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::6364:ea34:bd8:1f8f]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::6364:ea34:bd8:1f8f%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 02:25:48 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dmitry.baryshkov@oss.qualcomm.com, airlied@gmail.com, simona@ffwll.ch,
 dmitry.osipenko@collabora.com, boris.brezillon@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Use drm_gem_shmem_unpin() to unpin the backing pages for a
 shmem GEM
Date: Wed, 27 Aug 2025 10:25:16 +0800
Message-ID: <20250827022516.2890226-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0143.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::19) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DM3PPF67FA1A8F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc7e532-fcb2-4817-80f1-08dde511088b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u4tLiZwxjAcnFhdV+WLDy9bYdlWv74Y0iOJziPgzxFl6XxjZHNZ3zmMDC6ON?=
 =?us-ascii?Q?PWBKE76/bdDJuXqht4OoCpYBxHvro8qSVt+AKMz1U+mz3jfttzlVv/Ze+0tE?=
 =?us-ascii?Q?c8ZVhrJf9N1CmnnlkBs7S2tsXvTiPYiOs8cst5lTp+G/UbAtHTsabbq9ex9u?=
 =?us-ascii?Q?xnNDUlkXpsSuOjZcPPK0Zb+MMwCgNpl4q80iVAn+oZH16TsKOeJgqWziKgW6?=
 =?us-ascii?Q?eeSb9LBsNZ5ri5i0rOzBuZhaXRxxKuJ4fnRD1IEQ94V2ij0ip9zBcPXjqPvH?=
 =?us-ascii?Q?AHgD4qBcEbr2HrUHQYVP0gpF6Mup4QhhXr7UEf14YTfoSSTtsrGXFMpda3sm?=
 =?us-ascii?Q?E8ruGBkh3EMiofKrkQmLR33iXUbHb0OiHfrEmpme7OLzkWXtpo9PefkTjJu8?=
 =?us-ascii?Q?nmDZdi0Da/hFD+fvF9gWXkwZeaI1QvkzK/YP7YMzwzfUWuRztXcJDjrTQD6V?=
 =?us-ascii?Q?L5xotz5DEP75rS73JV9XqVJvAIpkgCND8dJ6GanI/bNcGEt0AABMq4yijMbO?=
 =?us-ascii?Q?VKtlY8GiZhqdREHMprKzU4r6Xw6ISg4YHLYUmJ9A5CNF2wALMzj4N6XBP3i/?=
 =?us-ascii?Q?NRz2aMgbhNW0qOnxg4Gau1HsvHAtjRNrWWCuPch5+mrObQdaylJncVuwtvOh?=
 =?us-ascii?Q?5fKP9GU3kFvgt05ye9u5Nl09Qbz078Ky2PRbjHv8evBXmaIf7pa29LTngtRJ?=
 =?us-ascii?Q?S3nynF09lb3bn7T+WGKuo2dbOaQYC64PI8muGYCPwUdR2JVueQdgQmm1ObVj?=
 =?us-ascii?Q?pYY0/NqAIsBpYoAH1V+adk8iMXRkAQkoO5NxzKDM+tMbByTmqlp0Qd1TH/bE?=
 =?us-ascii?Q?5W7q+qWpVUfXq0tlIJcidQZbK2bQS3kyrvOzIy15lRFCqECdEMhRgt2R6KWj?=
 =?us-ascii?Q?R6VTzvNamJcgZ7JuPKvBo65dXS+8bpx+9PD+LFemRyMlIIwSKB78IlTGyITA?=
 =?us-ascii?Q?5g3OY69niWLKPPBi0IKRkySA9QFTqI84kCR5ZWhyAIKZv/Ql/L7YVguQFrgZ?=
 =?us-ascii?Q?wIB+dV9M92DCe5wwxywFuwciLKAVyZw/XCvsl6/DgTGOqAJN7AzEQSiXTwXQ?=
 =?us-ascii?Q?d5nz+ULUBNyI0lxb4bMqSnMKPk49fPkZcd9f/TZ0RUFj7O35XMLwovcbwkxx?=
 =?us-ascii?Q?+dKzrl+/lhKqFnfSSzR/J08nEUdN0LN93kLhckWBYBV6+CAAbuC06MVYNiJG?=
 =?us-ascii?Q?Ibj1KsnJudcWBIMheX3VAH/D/+KbsmkJQ7PwnIuPQQnkXE4lYBvCizro2QAe?=
 =?us-ascii?Q?bA5DKWPX6kklowGnlTXkLpXUGG/oyjAg3d5dLD+8dhw3AfzBSxmFOQMnIlOM?=
 =?us-ascii?Q?H6f52CswD6ZTET13hpizsBdNgZypJP02M3r9q2JcQgnkqhX1ywZG1K9pTt81?=
 =?us-ascii?Q?mhdeHa+VV+JQ5EgRAy/ot5E3sNlxMjF6ntLqJNGD6hpuMtzkE10LqJkO0Kn9?=
 =?us-ascii?Q?cGQl1d3l0ES0YgCJApEPWV+xy2j7FKD//hqTC5bU5bGzTEG5U6wxnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFD667CEBB6.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6+2A5zxb0tZEQ0YxxmsqdccWpAPH9HwilQB54fuKuFOgspQfaJXaDOc8OmWa?=
 =?us-ascii?Q?KGlwX+EvX+MFVWgOo2/eFgJuW+KJwYjyIM7U3CDDgkJawfWPRnYHmxBac/eY?=
 =?us-ascii?Q?QQy0s+IXzZ1ZoAwyAZmUczKIsJJyH3SeYxfxqQwMX56YeaVHyXRzGEi8Gi7h?=
 =?us-ascii?Q?chAXpLs89IPNyKETqo9v6PLE05P8XcpJT9pYw6WvL1xbZFl3iuovBlZ9Lu9T?=
 =?us-ascii?Q?asVsIVItYujjReV5BfY0McMyxtaQHIlJj6QkS4H5ArTLclWbcWCBLHJgsULd?=
 =?us-ascii?Q?FmR1MFzYqHgMspMwgYdedkZ1vZLM+SDq4gkOXr0P2mnQucfqqungxQGou49D?=
 =?us-ascii?Q?20J1eQjoOH9esPk3xngDXl9o7Blx+jAmdqHSMJmkWR9PFp9hcz+E576DvUoU?=
 =?us-ascii?Q?zBeF1vk21pxjZmMyh0Nyqd33e79pwaKcRXOBxjZS2skwH7jFSR8Jl0NLHnaX?=
 =?us-ascii?Q?wmz6w1iN5E9PQDSS1bFNoHPJ+zAv4RsYy6UgQas0bk5OMm0uaJQrHprfadZj?=
 =?us-ascii?Q?4q0x10xh1m/lPMqi2u6CtUxwwxMeQ9FPaMhqhPuluIKsSMrerm7W+vOr7n5o?=
 =?us-ascii?Q?kqBzLWIFM/qL71vMAG460huMnh8z6HdQbjM9JNgR9psrQiIqQohS3Wh9vonq?=
 =?us-ascii?Q?Lyz7INkCyiwcIAfssObzbAIgbOY749L7OuSItKYiBWJLBw6Z6D69MBGfPE9J?=
 =?us-ascii?Q?TPdtEyTXghjS5qYfUYUGJo6/Q5/dWd21dAo4FvZy8OLc26OM+VgoOEti5FyU?=
 =?us-ascii?Q?hpjT8nVe0xT2O+I6X+aHvQraTW4rCHkKY211jAzNkX82+2fBY7coUKvoMlHJ?=
 =?us-ascii?Q?f8Wj78C5Sg9aoMhGW76ZwkmHLOe3E4QPn+YM8Ap7Fs3L8lXS8tFwtKX67MKu?=
 =?us-ascii?Q?j0KKmetz/xvKZXe8Q4uZ/SsTg/4i7wx8zzwKOlUB2f59Tckv9Kq+pR7fzirg?=
 =?us-ascii?Q?FEfiC1UIr1CBni9DV96ug2WFQPFPfmFQvzxqmYqUDrI5gXVIRzviZ0FloMBC?=
 =?us-ascii?Q?5MbzNTjhtEidek8ece/Mpdx66lTjOrXRBGOcHpp5k9pafJZNSrwq3n0fm5uq?=
 =?us-ascii?Q?6Bpl4K7E/K1HQ4y/IdQg5j0kx0EcabRRhjdCQlN8efiNJSmkoanLprXroqrU?=
 =?us-ascii?Q?owvuL9gAphOESGjRy8YarMf+dAEAb2AMCofQomN+aJryiWZA/GzfsSpSdZWV?=
 =?us-ascii?Q?7SkJucZP/mEU4sdaoW/P4yuZxmtL2VCdKL8dz5YGa+2Be2o6yt2AItPRkr3M?=
 =?us-ascii?Q?hVmcfYE37Z1zK0LwxkumTIZhKky+uso2BotPADiO9TBF5dXfY8PE7H7G7EnR?=
 =?us-ascii?Q?cmt1/p3zEjlM4nFRfn7J4LBYzu/1wVWRIPQCxZafIQ4No91vBXn8Paq+A3mQ?=
 =?us-ascii?Q?2Z5ULBuZptexITCK4ogojwWtSlxjT2G4EnVdCaC9HiBTSfqLvE74tp5cZzBp?=
 =?us-ascii?Q?fR4ujDDATewDU/44NchAjkUXBkarZFuHzqHJDDgwUKC9HCFLTHVMk2NdcSzg?=
 =?us-ascii?Q?/C2hPa6vpi0oFCQEkH2zjA+pYlwliLXf7aTqfBCuXy6y0kblEdd7QQOjPjrk?=
 =?us-ascii?Q?0yjEbnvWFZBBGIX6wWE/pmFdmhO+3hZBKMzwN3L6WDcBe3NpsPi+yY9udqtM?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc7e532-fcb2-4817-80f1-08dde511088b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:25:48.0861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S88tyZXlZF+eEf5llZfBrDBsMJn7tHq/UrK7WF28yftYz7sp5UD+fHudD0ypGI4bdOWmD1B2gv/2XYu6tyifMJOTA9t1rofM+uZUmeebiCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF67FA1A8F8
X-Proofpoint-ORIG-GUID: 1knTabfaBCI4jUTSg4X8D0NSxZ-hR_PD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDAxNyBTYWx0ZWRfX7ulgs0xNg9fH
 0k1xgqNzGsb6XP/POzh9n56DFb4NLKvLNjM6CRS8MLxvY24kdbOYk6yhVa1HfFKpholUs9M2BSa
 Hd49z+Sk9XJme+DANWSf628pekFiP9176SRxcxSmHO3c/GNzBUyqHJXn1oSW0qveQxha3chVhGV
 ZFPNH0QdbrEGXNs0tCzV11jj7uexrWCgdUmlGtqNMXkR5XA/dtM/A4hpmmFWx8bX2F+0ZuQLcP4
 HyOoHUaDLrKVZD1EX/lV/5cDwEwGjhl0MIJfTk4fhMOetS5nmmOKyMgi1kfl0l8/YYFUkKmovky
 JLpt/qFx/xbel68rmkrxQVXpZT15MIOeH1mmPPK9C2SDIJTZrbCSuJOKSax5cg=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68ae6caf cx=c_pps
 a=RjtLz+qli6Ia6ygbqnDkgw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=C1uUpZZ-KwEODqPgQmsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1knTabfaBCI4jUTSg4X8D0NSxZ-hR_PD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
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

Although drm_gem_shmem_free() will decrease the use count
on the backing pages and free backing pages for a GEM object,
the pages_pin_count count is not decremented, which results
in a warning. Therefore, use drm_gem_shmem_unpin() to unpin
the backing pages for a shmem GEM.

WARNING: CPU: 2 PID: 1106 at drivers/gpu/drm/drm_gem_shmem_helper.c:180 drm_gem_shmem_free+0x4d0/0x6f0
 Call trace:
  drm_gem_shmem_free+0x4d0/0x6f0 (P)
  drm_gem_shmem_free_wrapper+0x10/0x1c
  __kunit_action_free+0x50/0x70
  kunit_remove_resource+0x144/0x1e4
  kunit_cleanup+0x64/0xfc
  kunit_try_run_case_cleanup+0xa0/0xd4
  kunit_generic_run_threadfn_adapter+0x80/0xec
  kthread+0x3b8/0x6c0
  ret_from_fork+0x10/0x20

Fixes: 93032ae634d4 ("drm/test: add a test suite for GEM objects backed by shmem")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 68f2c3162354..e0a9f3a917ed 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -227,6 +227,7 @@ static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
 		len += sg->length;
 	}
 
+	drm_gem_shmem_unpin(shmem);
 	KUNIT_EXPECT_GE(test, len, TEST_SIZE);
 }
 
-- 
2.43.0

