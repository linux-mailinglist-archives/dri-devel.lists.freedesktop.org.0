Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A2AC1381C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5175910E5C0;
	Tue, 28 Oct 2025 08:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="stQ19Pvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012020.outbound.protection.outlook.com [52.101.43.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C669A10E5C4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNqOfJmHjq99XFD2b/iH0QXlH0AdlsPnkt1Lm4jIRc2wzZIihCqzqltkn7BXElnHDcmXhBzx2Guibj2lvkUR9qrjpWBMIsedX6d83g/IvDo/AtD5J6qIxoF16aO/xnbJ+4LxJ197kfAyzQLSf3lRkf8U+c5nPmg1TtcrohY2I7PPTiTetClHznI60C+XzNZi1JkOkHbgMo2unD4ICFoS2TjrcRp7JJLm7KSZr/t+/F/RmMU2ChQPezmwd9EwQ9HiVamE8Shh2G/NtD2TXN9LgEdLYshgAE+F3UYXNnnqsBFrjVgdD8aEMkBaQT7DMqZQiEBlU4Lmq7FztqnKjLKueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiCND9U4OuxTnGhlbrAw/FIPcx5hIm1mcx2z0JjqLrw=;
 b=HGmtVTFKU/PP/7S0YEOiqkebzl9nbHkUz26LpD4bulbR95LqMC05b3BjbSITodTlJ2SyNTr8Ssw4qYvrbCFBXuURpJPl75/D8YmdRjIOM/iTllv1YWIKMVaSUlROxHsI8BnjyCRjIoBuHRHifbT3dE9sBVTcK10NZAiR0rswb+7fVr2J+0BbOyp2MG+rB2hOwRk31ZmYe7gpMeYAazCZxSNflhfiMjyrGzpgsFbxJqiyhJnLvAwNwTQ2AA/C34Ko8DAUNcliSdWVC0j0fUsQlsNWC1k3iUnDB+8PLj4ZNl8CXD9Xap0961CcDENA4m6evehYKBvOLmtDvPbnwu/Skw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiCND9U4OuxTnGhlbrAw/FIPcx5hIm1mcx2z0JjqLrw=;
 b=stQ19PvkCMRE1wrPGSQin/7qrXgrM1C9aYwqxKvrYg4rDOT+dJGrNU9D5FtnVWax4B1NQ+J42DtbQ3jD1SAQsDzXfhhaSgwn3cJwfMFNDg1JXEFp+LgRvHNGxYAJeNKzhn/P1b0xwEb8u7VIG5Utdo8i8GR40lKHsK40xUSdlOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6694.namprd12.prod.outlook.com (2603:10b6:510:1b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 08:21:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 08:21:04 +0000
Message-ID: <f8e9766b-b813-42d1-b03b-563850130949@amd.com>
Date: Tue, 28 Oct 2025 09:20:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
To: Paul Walmsley <pjw@kernel.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Han Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <ziyao@disroot.org>
References: <20251020053523.731353-1-uwu@icenowy.me>
 <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
 <5fed2297-4e51-6aa9-464a-6f8a2cf8fcc6@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5fed2297-4e51-6aa9-464a-6f8a2cf8fcc6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae15a27-e002-44de-0547-08de15faef63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFFZYjVuZ3E0RE5MTGRZQXZwdytURE1Db0FsVW82UFdRd01IT2psL2xEblVL?=
 =?utf-8?B?Z2hKUzdUWnNvd0lCOHh1RVhnZVhpclZXeGVySGJNQWExSmJYL3pITlgyUEEv?=
 =?utf-8?B?YUEyd0VPK29ub1A5YUxoMDJZSUo4Ny9Yd3BXdjF6WDRqQ1pWZEtkZlBrb2tT?=
 =?utf-8?B?V1NkVzR2RUxLYjhjcVhaWTdkVFpRY0VVd1N0akRLb2xPYUd5TVcveFRQTmxW?=
 =?utf-8?B?V1V2MGVEVHk4RXFhUnVGYTIyZGhPbTBkT0l1Rm1IaTRoQkZRNUE2OEtLODJq?=
 =?utf-8?B?RlhBS0ppZmRPZ0V5M0JqUDllb1RxSXM4UjczUjVoVkQyMGNkNCtueEhBZ3NM?=
 =?utf-8?B?MnZUbmtpL2JSUXB3bGU4WWl3RHdvTXNGUjNVUjlYSXdWeStJOGZRUllFUld2?=
 =?utf-8?B?ZG1XWHZLSWpWL0x3YTJTT0RRSFAxUldlZmdWYkFLSy9CT2dlY29VWjlqa2M1?=
 =?utf-8?B?RktuZllVdWpiK1NoZ0RRb04zdmhZOXA0b1QvcnMwUFhUUmxtdm5BZnBBK0hJ?=
 =?utf-8?B?akFUSmdEZndxZXJPTWx3L0JMVkVhUW5VV21BVG9FbGk0QkNSZ050eXpMeVh5?=
 =?utf-8?B?N0RrKzgvMGI5QU8zK2h5eHpNTGFsOWhVaENzbm9peWJreHZNbE1rRUt3azIx?=
 =?utf-8?B?N3pBT24ralBSZi81c2NyYm9hcUR1UTVsZSs5SFh0eXFRbGk4cGl6dFhWM05C?=
 =?utf-8?B?Nnd5SXVHYWtTM0JyNG9lbjhvb0RheDBRZWxad0YwT1N5SWNGVkZzRFNaSVl1?=
 =?utf-8?B?VEFoZ0tRZjVGWHZGNk5WNGJtQlZMWk9ObjNTNXlCd1hQL3dwSmZtNWVraEZ5?=
 =?utf-8?B?enNuY3phU1RYNWRqKzZRNTFISjh6bEtjY1NxWXFvbEJpUFZ4QXBJaytuc21U?=
 =?utf-8?B?U2dDOTVrZ3d2NFhheG13aHZEZ1FtZkh2NENXQWs1TmsyT1lZalloVWhhYVZh?=
 =?utf-8?B?RG83ME8wSURwdTNDcmxqdm9JazhwVzRtSlg1ZjBHdllTSG1XbVQwSnZ4THZl?=
 =?utf-8?B?N0g2cnhhUXhEUFNhSEp3K2I0UjBFcTA0VEhQL09aYWlHeFF2VzhjT0tSS3Q2?=
 =?utf-8?B?bUFwY1hHUUwxYTk4VFVNMXhXNDVkcVk0TEMzb1pmZXpyTzAxcVJ1ZGd1emtL?=
 =?utf-8?B?dktBeFQzS09lRnRxRmYwZFl0cy9HV0dVMVh6VXN3dG5WTHloaVZjNncwbGJq?=
 =?utf-8?B?L1ZIL1BRTmJhdlRsa1A0Y0FEczhjeHhPclZWOWRXZER2QnkyZ1VjdlZ1aTVy?=
 =?utf-8?B?VFF3ZEU3NVgyODI5eTNlS095ckxWUE55R21yVExURzN0akdRVXB6K1NrN25w?=
 =?utf-8?B?Vi9tSG4rL1pkckxOY0lHOUNqNHdLS09qdE4vYlhtdUpMQ0UxL2FmaURYZ3dj?=
 =?utf-8?B?dHZYVjgycHRMNHAyc1RnK3JMV3pZMTlqbEwxZnNkemIyb0JveUNVZFh2L0Zl?=
 =?utf-8?B?Sm9mK2R6dTFlOUIxcjRtRnlpNTJDSnZFR3ZyR1dnZVZjL3ZtZytPQWtmWTc4?=
 =?utf-8?B?S3J2MndXSndSeDVmMXUzb3l0dENGSU1HaDlkblNuYmhKR2tRWDgrRkltMWVX?=
 =?utf-8?B?Sk9RRGUvSHBzYldkRFZlajBzaXZPL01GTWVOc2szTjB6ODltdWQ5cTBvbURn?=
 =?utf-8?B?REJOdkQxZjRrb0hkOCt6ODIvY2F4aWlBcDZoWVpSQTIxMVIwa05PZGgvRW9M?=
 =?utf-8?B?K2w2eTlkYk8xL3FkUGxKMTBna2dGbHovUHdxaVdXbHoxdituNEdXTm1uNlpJ?=
 =?utf-8?B?dTdBRUl0REtYZ0Z6VDcva1ZkTjVkOGdwb1RiWmxiWjYybVhwYVdzbTNuOVox?=
 =?utf-8?B?MEJQYXFTSEFSWkp3SWloaWMyWE5SYTVxNENETkI0cVlsbEhEMERRTmhTODBt?=
 =?utf-8?B?eXFsOFk1QnI3anVNelVzZDlicTJBQU1heFVxRk5ab0w2K0N1T0pVd0EwM3hD?=
 =?utf-8?Q?gkla+dWLAEMGq4LptCQE/p3fYtmPOU3b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajB1UGR6c3VNaDVEVjE1bUV6ZnkwQkphV0lpQStZdFhhemo5NmZzamdDclhn?=
 =?utf-8?B?aGYxY01HeUQyZE1sdmpibUhEZmovZEk2bVp2WkdnYkxYekRVZThTNWh4TWM4?=
 =?utf-8?B?d3h6anhvZjVTdGtvMjNKQVh3VTdzQThpZWNoSVRiTFJYY0dpS0FhQzdrbmpF?=
 =?utf-8?B?ejZsU1RHd2dPMk9MeW5iWG4wbitZaEhTSzg2M2JDWjZFVW5kUGhnNkxkdUY0?=
 =?utf-8?B?RWx1ZE1OUGw5Nng0bVVrREFYeGd3YThobUZZcmprSEhlQ1NCSUlPUmJkRHIw?=
 =?utf-8?B?YlkxeWFnQ0NtWkVGRkNZbUhJOGdJSXM0Y0I3cktQMHQzQjZ1eVJPWm53aGxr?=
 =?utf-8?B?RHVLc0tJbWFkNE5ETnVZRzhDcEdHZEMvajh2VWdmdW1LcUtxdXJ3azgwTzNU?=
 =?utf-8?B?aU4vcC9ja1Z5ckdPelNtR21od0pzalJCVmY4TFhpbVo4VzFGaEVobHF2aHdX?=
 =?utf-8?B?SnBIRjM1OTIvNlpPSEJUR3lkREFybGlEU0VnS1MvcHlCS1JKN0oyenpYZ2dk?=
 =?utf-8?B?V2lWWXgrTjdwQ2xOQnNSOVN1V3BNQlpCN1dkNGVCd0tnV3R2Nyswci83aDI1?=
 =?utf-8?B?SnVWQ1FKRnpQMXQwY3M3T0drcjdOS0NYUllNNTQ1VlJGZDNlVnhRdUM1ODBL?=
 =?utf-8?B?VVdMamp3OGEzejdrQnc0M2FCRGNwNytpemZpZ3EzV1VpNFljSU1TSnVnQkti?=
 =?utf-8?B?NnVrNnBKTFFqNG9aZjBXWlFSbGlEV0YyQkc3dlNocWdDeWt6Q2QzWU90SzZ0?=
 =?utf-8?B?UVFOK25RZ1EwdTlodFNaVTdwcWlrSE5kcDlmODFrV2s2MjQ5VVJvU2ZiTERn?=
 =?utf-8?B?NFNoUG1rNHhUaWF5NXdlZTJIdXFNcG1IVC9ha0V5a0lRTmU3VEt6OUswSjNZ?=
 =?utf-8?B?TEtTbFluQU1nU2F1T2tET05HRmcybDZpZCtyQVJLSjVKbjUzc2ZxUk1Xam1t?=
 =?utf-8?B?WGd5Z3ZDdFlWMUlZRFRRT28vOVdBelYrUEZhdURhckpVWHJUMUIzZVMxRUdT?=
 =?utf-8?B?Y1pmNXRhbzhFSFp4U0lId3JtQU51aituYks3ZWhuK1BXTjc1R3lSSjlrZ0Jt?=
 =?utf-8?B?K1lJZzIzbFpxMWxkYWMrSXRHQ2traWMzN0dCaDZGaDZLNk1wZk9vUGx1bTVm?=
 =?utf-8?B?WWcwczN1a1FEYm5uUXFDQlFWQU1lcXk3cmFON1B6YVFhYXFtajM5cURta0NO?=
 =?utf-8?B?VEJDQTlSMDdDWkJVSHNWTkN0eTdEb2VjK0x0cGVrUStDdWxtSElKRUprSmZV?=
 =?utf-8?B?RUZUVlhPbUFvRlRwUktzN2JYbnFGMldSZGdyc0s2aHNDN21ZdVptZ1NuS3ZJ?=
 =?utf-8?B?OWUwQjVXazVac00rMWtuTUM0ODh5NGQ0TCtYL2NkNHJwSWVldlpKeThBN1Fv?=
 =?utf-8?B?OXJhK0xHSUdFTDVpY2R3N1MxUEk3L3Q4L2MzcVB1Tm9tWkR2SElhRDlBc2NU?=
 =?utf-8?B?OU85b0ZQNWJ4WnRHNFFQT3pmNG5oV0hibUZtNmkrMFRRVDh3VEZPUEk0K1pj?=
 =?utf-8?B?b2t0TVhaNHQ1NkxrU3hmNkk4S0p6NVRsREdVbWpwZWx6OS9yKzYwbERmdWU1?=
 =?utf-8?B?MXlBazZ1dVFjUHNIMnVyakdsU0RSS2FsQW16amNTckN1bG5DNmViUGNpQkwz?=
 =?utf-8?B?a094SDByS0FHU1l1TkE3Yy9xNWVrMG9VdWhaRVFSOUlELzRFUm5Hek5adFdF?=
 =?utf-8?B?OUljc3FvalovcGcxWSt5L1RQdDBBWlBVcDJDRUsrYjNEMjdaOFk0eDVtSGZk?=
 =?utf-8?B?bXk2eXI5YWZxMUxlOUtJOXhTVU5COHZZR0FkYWVsMkFlUkRNZHVGVXR1L3Bx?=
 =?utf-8?B?UDVmamQ4eXEvc2hnbFRnS3lJeXFzcTRXaFgwUW9EVGlUT0NwdGlTaGxRcXAx?=
 =?utf-8?B?VGc0V2RweHZHeXZDME5yNUttTml2SGN1M1BoYmJHb2NieHduU1lGSVY1OERY?=
 =?utf-8?B?UHZlWHRNcnlrTFlwREZGYVZTV1JNQ0YxSE9udG4yMFVneU05bTBYSU43ZXFu?=
 =?utf-8?B?czFLbGdQT3Z5bWhFTU54QVgxd3huMVd0YXprTk9CajJxTmxqL29qRTJleU51?=
 =?utf-8?B?eGpjVU8yblJob2t6SUtSLzY4UnJqZXFtOUNqTFA4S1pDUFQ5bEpPUFBzdkZZ?=
 =?utf-8?Q?BepY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae15a27-e002-44de-0547-08de15faef63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:21:03.8733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCv1yurtfLZ1I8t0dJB8wn7F1JojS7Fj+TFkOf9kMLFKPAyQgK0nIopAxa5UvItk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6694
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

On 10/27/25 17:41, Paul Walmsley wrote:
> On Mon, 27 Oct 2025, Christian König wrote:
> 
>> On 10/20/25 07:35, Icenowy Zheng wrote:
>>> The RISC-V Svpbmt privileged extension provides support for overriding
>>> page memory coherency attributes, and, along with vendor extensions like
>>> Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.
>>>
>>> Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
>>> and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
>>> access attributes.
> 
> [ ... ]
> 
>>> diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
>>> index b3fffe7b5062a..aa137ead5cc59 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_module.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_module.c
>>> @@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
>>>  #endif /* CONFIG_UML */
>>>  #endif /* __i386__ || __x86_64__ */
>>>  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
>>> -	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__)
>>> +	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__) || \
>>> +	defined(__riscv)
>>
>> Looks reasonable, but does that work on all RISC-V variants?
> 
> From an RISC-V architectural perspective, yes.
> 
> Of course there might be a hardware bug in some given manufacturer's 
> implementation, but then again, that could happen on the other 
> architectures as well.

I've added my acked-by and pushed it to drm-misc-next.

Regards,
Christian.

  
> 
> 
> - Paul

