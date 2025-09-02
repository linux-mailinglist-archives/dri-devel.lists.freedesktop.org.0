Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F746B3FFDB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C670410E694;
	Tue,  2 Sep 2025 12:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yq8LXteB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DD810E1CA;
 Tue,  2 Sep 2025 12:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFhyTn0sId3p1yx22YSNWu1v6ZB00lrfo2xxqthjcJdwqAgfAaJ5A6PtLRHY2EHCfL4adaJc2hU5SRgl2SZB9vq5llCcvM3iaga9wY5u4iLPSeCX/QwmGmShXps+iC+e4EWDhXPy3DLVlNHWRW1VgVIiJgjzQGwA1gCZw43jAXhKU82n01HOEXCMO5cEEQ5x4ifZWJjFe7/ZE38xgInJqX2UGtOyLp69BYxJ7l7tw5Rlo7NDKJcycI3ij7DcMo3Uw0OL7yegbgHu4FFItlu7GUGjh7U6fhKzo6W6gK/PgMUVPYnDmSDVRrzPtveDL0bFk1U4p/f/An9586FZK5uPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aq2H1rpDjbmSTnwCkdeqpLbp0UC+EmPJTdJ5GwO9vW4=;
 b=K3M2lfbJBmaQDZwBjhINnCKZCEdq4fuHx/YVDrlmXeZpzQR6+OprgrV2ZohoGqk/iePK4y0aLLrFoVRXW6K+RmiyRB1Bwx/3rHXSSTq4afbsozJQelTL1Ux8d9JF7KFbVzqtncE94XOCirSh0tLF8nsEbtrdoY7k/M1ouX7cUcbnBaG2hwhJn13lIZ0FtaZFvGoipC4GZ0OFzCuRl033Cfc/0/4epm3th1zUk2HNucbcOvJe02DzJGBvPgfwawFuP5H9nDfg4rs4OtnbJxYYoATZ9UXWeO2cm/rJtc9zw/3Qws2zQ6S1yTQ2lBxUQdo3lWoWBdDx0gn1WLk9irmdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq2H1rpDjbmSTnwCkdeqpLbp0UC+EmPJTdJ5GwO9vW4=;
 b=Yq8LXteBvcWQXYmQpGiGe8ctPbrBPq8cnpAVZDLFwAdnJ4IUpQuejy2j8lrEBnf0lxgCGnTOtr4rtTFsDy37sliO/GakjdLcG87s72Vh+srfgEIQzfxMTybx309UydhANXzVL4zBp6Y7w7dN5m6JtEzMLrRnmSXcwSI9rj9Em/0tWSPEP4cWSMMeWLzFH3w9KLCzm964q6Y5zn1JO6/N+3MHO7MqDeCBMdVKr42POieWlf6WWGNSEjT0/k+V7huxBo+6uZe8QXeLwF1jNThQKO0YFbYEkbmgqVKPFHlDIWvMx03r08enluurLP8mA3j1BHdNssJSzwT7Ne7xkFdG+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 12:17:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 12:17:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Sep 2025 21:17:37 +0900
Message-Id: <DCIB3RKLNNBU.3RHKEP83FDIK5@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <daniel.almeida@collabora.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250901202850.208116-1-dakr@kernel.org>
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b8bbb8-1cef-44d5-36b2-08ddea1ab64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckt5WFY3enFFRERPTlNHb3FVUVhiOU5ZNXR5ZUVsMDRxQzZCNHhUN2E4MTVE?=
 =?utf-8?B?TXVEOGQ2OVJ2VG52dml4MUE4ZEZmN1VHV2dVUlRRclhvR3MvNjBpb21OZEpT?=
 =?utf-8?B?eTBGeHFYOWdTcCtzQkt6bzhFa2FFUWNEcGw2V0VlMTZaeDl6dkVsU2NjK2Nu?=
 =?utf-8?B?eWJJMXBKczlsNzFPbVF4cE9ubzZYNXNLeUowVnpYV0RxSk5HUlk5ZFhTYWs3?=
 =?utf-8?B?Y0RHdUJ3ZjFDN1ZDVlhCZmNFTlVWV1pLWEVHN2tQdGMyU2dMMlk5cUYza3R6?=
 =?utf-8?B?dmVMbE0xRG9Sb29iTTBJajVsdW14NFdRWTNIVGNZL0pRYkRBbEtWbUVQc0Q1?=
 =?utf-8?B?V1ZUN1dSTnBab3VVMkZWRHo1NmdJT3I4OExnTnFJTEtpRVcxbUIwZzhNQUNJ?=
 =?utf-8?B?cGpkcDU2WHdRVytHMU14Y2NnZUVzY2h0UUpUYkM4cnVpMGM1czlwbGh6eVNY?=
 =?utf-8?B?OWVtMG0vRzZqV3E3ekoySEVEN1RzbVo2MTFGaWxDRHF3K0xzblpUNTY1V3ZU?=
 =?utf-8?B?VXA5Q1ozZllzeVZGcHMzdFpPZVVxa1B6ZWlvVlIxMXdjVkdyaGQ3YmE2WXRN?=
 =?utf-8?B?MTUyWVFKYWRVc3dIaklaR3hxWTJ3bklkcm9CWWp6aWFKNFdBQm9hSUlZOUQz?=
 =?utf-8?B?ZWcvVnV4WjZHOWQ2SFZWSUcvbVdJWHdIdHVMU0xrMEcrcDhUQXpqQjJGUUd4?=
 =?utf-8?B?eGxMQVZVc0hpMlZ2YTRIRk5UWnNyYWdwMXc2Q2x6dVZBSEdzMCtxaFdLUDJE?=
 =?utf-8?B?bjIvVWh5dXNXdkNnSGVGN1g4RmJvQ2t2TExmTHVTZm8zZURWdXpNbnJnOU1a?=
 =?utf-8?B?RVU3S05BRVZ2eDZnSkxycVI4cFB4YVlTVjZlbms5YTVWVkFUTjhrWVI1T0M0?=
 =?utf-8?B?YXVmZWpKNUlSeTEyZjlmTEFHRm9sbE1CMzhOcGxFWU91Q0xLSm0yUlR3MTZ1?=
 =?utf-8?B?TEhYMDhjc3VqMnJQR2hlUjZsV05rcTRRbC9xTWVRSGptN0ZQcGdZQm4wcVdo?=
 =?utf-8?B?Z2tabkQ3a3Y4d05CQXU3dExzV1QrdkVTNzgyVnIwRUlrYjZCa0lVcTRCaGw4?=
 =?utf-8?B?cDV4NkpPL1FCMzdneEYwQWFUK0hlUzF0aGQ4dW1HTDF4dW13K1hhQVFpbU83?=
 =?utf-8?B?N0E1RUY3N3BvTk56YmxqRVFodTlUaVBEZkFCam9wTERqMFhodUdXU1ZFWmd4?=
 =?utf-8?B?MXFaeFJyN1JIWlg5dTM1dEFnVzFxMVNEK1Z1aU9oYlpkRjhsMHZXSE9VMUFK?=
 =?utf-8?B?MmlGR0lRYis4TEhYV2hiRFFubTRRSEVZTHFReXVLaVRJc2dveTZ1SlBxUHNr?=
 =?utf-8?B?N21XTW10VGwzM0pXazNsS0hIa21zSWNRTXNsa3NMSWJhRk5xS0x2Q29sMlRw?=
 =?utf-8?B?WWYrTlIweDAzYUU1Uzc5N2xaWDRxbml6cTdGMUpkQzI3M3ptK0VxeDFOK0hM?=
 =?utf-8?B?VitEL0REMU16TjNUaWYyaXc5SGVnQWFNbFJIV0lINzBsMm1YL2N4RGVLTDA5?=
 =?utf-8?B?eTl5c2VLdC82dlVQcnhkM0NwWjJSMy9kOGtOZk4wTEYyUU0vd0hhZnlzbTUv?=
 =?utf-8?B?djJMRGNTZkpYaFhVc1hXbzhxdnduazBQU0t5RWFzTW52ckZVVGRHS2RoN3lR?=
 =?utf-8?B?bk92QlZTQk10aXNKYkxPMlhiQ1hicXI2UmpRcFlmRElmS0hUbDlvK2ZscCtZ?=
 =?utf-8?B?WlBPQ2ZhTUk2ODc3Sm90M21mcU1JM1FnWlh5ZHovRHZudDVOUW12V1p2d1l0?=
 =?utf-8?B?NTduQVBwZnRwK2Jma2E3UEgzVEU5NHVMYnlKRG9TNnlOZXZXZDVIWUt1eFJ3?=
 =?utf-8?B?dFdnSVIrOE1kZXBPTlFxcW9EUUcwRFRENFZ4QTNsYWhmYUtnRGVmb0hOdk9Q?=
 =?utf-8?B?eGF0ZW11ZmphUGNoRUtRc0REZitUOXRPUlRNQUJuY2Z6Sm4xVDZDanJhcG9Y?=
 =?utf-8?Q?32/WuqBRZWE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVtOWZmS0VJZy9iR2NzVjBFK2gxa0gwcDZ2dGtlKzVGVHNNM25FVFhFbEFt?=
 =?utf-8?B?UEZIVStkL2ZKbWJwUTFPbzFDQWNhODZLSC90Qm1XMkoxTG5wOWt2dS9vOWNJ?=
 =?utf-8?B?SGhGZGp6N1lyc2hQSzBJb2l1YXRBOHNKdWM2SUUyeUl2ZERVMnFLWHRPMWZa?=
 =?utf-8?B?cHlTQk1KQW1XSS9LRnk4Yk5ZK3FhVFN2OGYydEppc1I1SnpOcUZLN0MxeGpX?=
 =?utf-8?B?Qi9YbEdoMHM2dTRKTE4yWEZUSVJvWXFDQitXTkNHN0YzZDF4OTFhb09RRTRZ?=
 =?utf-8?B?WGJKRVN4eDJ0V3VJN3g0UWQ1K3lPNXl5RDc1ZTlOSWNmdHdoSHNObHVXYjMz?=
 =?utf-8?B?K0lrekw0YXpPNm1KVVJpV3IvOTVJdWZ5SjVmUHA3RkxVNUdUL1dZS1FPUXRl?=
 =?utf-8?B?ZG1GaEhuN2NDNkc4MnRoTmc2WE1Tb2tBT0lLN2p6OUZkdWN5OGRHc1dzeEFz?=
 =?utf-8?B?Q1Q5VnBnb1RYWnpDRFcrTk8xdEhpNmJFRk5FOW5MdkFOUFMzOGppdUc1Vmoy?=
 =?utf-8?B?U04xek50VWRwa2JOcFZ1emE3STVGUjZqUk1xclRmSDFMaGp5L3ljVzlzWnNM?=
 =?utf-8?B?cGN0eXNISk42b3l0amV2czkrYW1tVU92VUZDSDE0L05wd3QycUtITWRiL1Jz?=
 =?utf-8?B?elNuZnZkVEM3em5wMWtzNW5NNUd2WXJtSE05QitCYkxKbHYxZlk0UDFMVVBo?=
 =?utf-8?B?b2docHBLeDZCTkNrZG5wZEV1VmxLbnJuZ3hMZXFTMVBsczgybktKZEJjME50?=
 =?utf-8?B?Uk94bFRSeWtFZUd3dUVic1R6T3p0ZGtBTXRhZWE3QVI1aXFYNHJZd1JzcHdQ?=
 =?utf-8?B?UUhiNHNXUVoxMThkbWRIdEVGUElPTXQwRXJTYzY5SG9LYjl3cDc4V0JEYkgw?=
 =?utf-8?B?cGh1b2g0b0VqS1puMEpkS2lyUWQxRnVoYzdCTDh1QlY3NllXU1VQWi92T1hY?=
 =?utf-8?B?TDJtaWVBdGtTaWZQbS93M2NzOWhzc3lUaXdwM0NQUkFDWFZEN3R4WUZoMGhD?=
 =?utf-8?B?Q3o4NHIvSUUva0JIbjdXTms2ZEhVeFhLTWMzZFZrbUpYQ2d2Y2FQM01QSUho?=
 =?utf-8?B?N1d5RVYyU1M1OU12bURxM2dEUEsraGlOSWlMRHJYRHJEUHlQdTA4WWVmNHhx?=
 =?utf-8?B?b0ZUV2JXNXJIQ1puc3ZIWFRqMTc4MWs5bzJKOUthSDd2VU9PQnlldm1wU1pW?=
 =?utf-8?B?ZUFuSXhSd3hwUWNDS1VyUzMvRnJGcUdOSHh2U2hxN3pkMWN6NnZMMlRpZ05F?=
 =?utf-8?B?Z0JTZ1dSM0hJeEplM2tmejkySmpnS21DNElkWHN6OXlSVS91TE1MdXdvQ2c1?=
 =?utf-8?B?WTZ1UVM3NnVRU29RdmNlMnArUDBVcys3UHQybENTUEJZbXZpaCtJWVYySStF?=
 =?utf-8?B?Y1NyK2R6QkNLMHNlZWN1L05NYmM2am1UeG5SME45cWo1L1BBajNhak45YUgv?=
 =?utf-8?B?SHJFblFSQS9yVDBFZXl3eHpySEVlcWJWRGI1Y3EwOTVCTzdNMXRYMjZxZVlZ?=
 =?utf-8?B?VFd3bFFBSHRCbnh2STJYN1FiUktFL2FNdENmc0wvdDJwL0JlQXBvQWsweXRZ?=
 =?utf-8?B?MjNXZlNCa2pSdEFJOFBrTHFBdFBGdWh1V1U3dzZWL3pFbzhFZzlxWEdpcUJ3?=
 =?utf-8?B?eTk2WlJNZ2dzbzFGV0F1V2s2a3B2bkduQkZOV3lJNUtXeGNjVFFNdklIbmtv?=
 =?utf-8?B?U0JxUHRzVWxMdmprMUI3bUdjQkpGOVJ5SXYrcVZwZmdVam1yNEVqZzVuYm0w?=
 =?utf-8?B?Tzl4MmN4NUZMaGpiZDhCWjhyMVZMUEw1NUhBazhVR0VXUHh5bEJhRUlCNm9n?=
 =?utf-8?B?NDdHN295RjF4eGNXMXFwL1hkUFJuZ1ZZQ2tNNHpmMHUwekxsM0pBYm9SRVlP?=
 =?utf-8?B?c3pTZjkwRWhxejJycmxyVmNnQURidzlSeGtHYlBzWWVreXlKMXUxTm15ZGRH?=
 =?utf-8?B?WlJQOStzSzFiaGxJWkUwNjlJZEZsOFZWU1VkVEpyNTRmMTIrcU1Pc0xiODdW?=
 =?utf-8?B?WUppd1k4YjRtOE5NZTByTjhQWDcrdms3aWRDOENXdG1OMWZuMGYxRkJDS1Yw?=
 =?utf-8?B?aDJHWHc5a1duVExjWFFFZ2RqczcxOHh5Ym5oSGNhRnNORkFpdzBMTVFkOGU3?=
 =?utf-8?B?WDc5bDQrbHdSOXVvU0Y5WXZBaHBpUUtxMDY0bHA3ajZ3SU1nT2syMVpBanFD?=
 =?utf-8?Q?W/jaxBUGAoWX7w8gCspDAtc7cjpfYV/mvtLWGOStin29?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b8bbb8-1cef-44d5-36b2-08ddea1ab64a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 12:17:41.6962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqhqlAwDIZprpmHZNtC7tKbW7BTOojKMx5N/PBUlSyUQAHOflgr0hBSUC0sdtwHwpKKZJr6mcRXoLj+vKXxKHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079
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

On Tue Sep 2, 2025 at 5:26 AM JST, Danilo Krummrich wrote:
> Multiple DRM Rust drivers (e.g. nova-core, nova-drm, Tyr, rvkms) are in
> development, with at least Nova and (soon) Tyr already upstream. Having a
> shared tree will ease and accelerate development, since all drivers can
> consume new infrastructure in the same release cycle.
>
> This includes infrastructure shared with other subsystem trees (e.g. Rust
> or driver-core). By consolidating in drm-rust, we avoid adding extra
> burden to drm-misc maintainers, e.g. dealing with cross-tree topic
> branches.
>
> The drm-misc tree is not a good fit for this stage of development, since
> its documented scope is small drivers with occasional large series.
>
> Rust drivers in development upstream, however, regularly involve large
> patch series, new infrastructure, and shared topic branches, which may
> not align well with drm-misc at this stage.
>
> The drm-rust tree may not be a permanent solution. Once the core Rust,
> DRM, and KMS infrastructure have stabilized, drivers and infrastructure
> changes are expected to transition into drm-misc or standalone driver
> trees respectively. Until then, drm-rust provides a dedicated place to
> coordinate development without disrupting existing workflows too much.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
