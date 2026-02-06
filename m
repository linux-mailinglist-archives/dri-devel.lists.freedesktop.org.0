Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBHYJNNlhWn2BAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 04:53:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB266F9DC2
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 04:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827EF10E03E;
	Fri,  6 Feb 2026 03:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JrFLBpRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012009.outbound.protection.outlook.com
 [40.93.195.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8E810E03E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 03:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2/n+X0oGr7HbwvEdKSaCeF8e7VKLrgQRR/euYDhpVfmPlv8ALD6cFYedSPo6qRf8Nmi8IHOUHZ7vzygks4Xi1PopwZN34NzEKGw/Nu+wYBF0OERAKk8+YvEbLHSK1hibxwauPp0bFE6ajEQUSuLwp7vGEtBC2hiGn5uSKXHjM50BMGW8sY/NWfrS0oXDHkxuAyqYKr1Zl6iUp5ZBnU/RtQgQe0ngUmIjpYykQdfNwSWVvYl/UV0X/SwT51U31Vi61fgf5/eWQnNeDbWnnMNO2Q2jzXxhnIVYekUh3DFf3vvQjsgFXrFyfaexcXtVXVLTSl4MpbD5KeAPBB8cWW93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFMedcs0ro/OBdj8LkAGmXvLCwTyXE99oSAAB09gaS0=;
 b=TTJLPgIreWGUsWnaRA62rs85J90vgP+UxGKiMtCwO5+1m9n/JYACH6VoOC3PISbSBkHacNokwTj2BrF/5/edKMEAHoy//Sge53Sz5OpekMfB3CVyDsrM+u2R793M28Zdb2A+lXn5Iex92esnhuzQFbW/j9TNpxBllRF5hNpUhHR9nghV96uK8gFUHKhA+9aP3FGuYzGvtRQCWt6Qn6ByjttrTeCAD1RXOPY22IVU03XXPmulKGQawJE2/xwoeG6Vvy0p267s7GEdavs9BA3V84U3AbZ77yJkO5BL+WQW8DfAlfwAAzGR6HpsfwUGSGaFPyLeEm5kt+HbOEYbNSxppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFMedcs0ro/OBdj8LkAGmXvLCwTyXE99oSAAB09gaS0=;
 b=JrFLBpRFMGT6iMLPfKvqiAKCLZBMM0CtlHVg07s0Kn9b1PXR0pbQ3UrJFS3+IPAVeXNLgIGVvxiCqFLFGCqdvBMi08YZatW6XRbEEO+euiQ2PNhxP1HySk9ptiyjLJxKR/SDHCs9xWTwodyJJ6/Fd6RScKSbDJQetCpElLW2GQt3e8B7S5pXNOcr8Kd9JeOjqwrAV5BuUDN2ZotEdMBOZii9Ld718RMgLnO/cNyTn/Um+Dal4T5z1jzRLKm5AySB1D1QvrRXodTz+nwTSj2HMW/iO+ECbvz528IkbWOGe22Prg4vFc7cgAmsTAWLzNe1Vj709MRUgnxuxCtRUsU08g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CY3PR12MB9703.namprd12.prod.outlook.com (2603:10b6:930:102::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 03:53:48 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 03:53:47 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, Felix Gu <ustc.gu@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH] drm/tegra: dc: Fix device node reference leak in
 tegra_dc_has_output()
Date: Fri, 06 Feb 2026 12:53:44 +0900
Message-ID: <3491452.e9J7NaK4W3@senjougahara>
In-Reply-To: <20260128-dc-v1-1-a88205826301@gmail.com>
References: <20260128-dc-v1-1-a88205826301@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CY3PR12MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1156e8-b64c-464c-f48c-08de653354ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmtNZjVxNEpWRTU2TUFUdkVxbS85V09rMEVyN0s2dDZmZWlHU2xrR0N4TzZE?=
 =?utf-8?B?ZGdEUjhoRjBHYTJPckkzTnVtN2M5NjdBUThHVzNuWTJTbHdmeitQUjNQd2Iw?=
 =?utf-8?B?Tk9ydTFCbUJpdytnckxCWjhVUjNMaGpuZCt5UWtSTGNBY3gzSDNBQmVtdndZ?=
 =?utf-8?B?N3lFUjZJV3FrYmsvWmI3MTVmY0xEV1lETURrVVlGZE83RUpSa25mV25Ka0Qz?=
 =?utf-8?B?a2xLRTRhdEIxbS8rNktsdG4yb2l3Q0JjUVJqTFBIRHlzR0hSalRUckg5eFlS?=
 =?utf-8?B?clJITS9ncHVhWGR2R1lHZXJHeTdyVzZobHVkVTMwSHp1VzF0S0Izd0NodkNI?=
 =?utf-8?B?WU9ZNXd6S3pSNiszZ1IvN2xHM0pXd3l2V3BueXBEaUkwNk9lQUUwYzA5dTht?=
 =?utf-8?B?eUxTczlYNXJLV25xL3M5cE1qNUkrNlN0Q2pEeE81YVJvK1RVTHBFMzBpT05O?=
 =?utf-8?B?S3paRXlxTDBjYWpzQzZXS1VOb0hlSmVsajJoSk1jUUY4bW52RjdmdDRlWjN2?=
 =?utf-8?B?TGxHQTJmRC9pZnNUanJiOVI1VVErOHk3RmJHc0ppeldMMHRzOW5FMWFMRXZE?=
 =?utf-8?B?Z1dyYktXMERUWVYvV2FMSUcwckN0MkFwTDJFaGtic1phSnh5RUlneU9HcXVF?=
 =?utf-8?B?RGp3Z2xLZkxqVEtZeUN0UzhCb3diZ2V3T0loZjltQlZsRVZqR0tVUENoWHd4?=
 =?utf-8?B?UzM3OTdFZEhsazlzQkJJZHpTODRpODB4cEk1bjVSVmZUV2JpMVljQUk3aTFB?=
 =?utf-8?B?TVdLVXBNV3dVeVFJb21iWG5Ld2hiOERVWVBvR3lsVHZaTnRMZHd4MDRaQ002?=
 =?utf-8?B?MW1sUGVTWDdPL2kwZHZnRjVuUGxFQ09yL1R0WUYrMy9FaG1CeEdzWlNJRjlq?=
 =?utf-8?B?Y2U4Tk9BTkk2Y05ZZExxaDNIaFcvMStSTnc2K2dpc1lXOVVrN2pUdVhsbGZl?=
 =?utf-8?B?Q3Iyd3NZZmZ0WmZYaE9PUnFiZy90THJXQ05qaFFJdkNzZjJ0dzJTcjRDc0FG?=
 =?utf-8?B?a1Z6OWxtVlhjdWd4QzRCeEtFZFQrZFpTSFJWVXIxN0lwU0tMWFZ3OFJ5U1Fq?=
 =?utf-8?B?STl2WnYxVHJ5Ty80eFlwSUxiR05ENGZEeDB6WDdlTlRjeHpUZDQ2b3ZtV2JK?=
 =?utf-8?B?Qml4elN4SHhkZ3dTWTdrZ29lWVZHVkhHSVNPMGV3eGphc3VuRlZncUo5NU5z?=
 =?utf-8?B?dTN2QUV4cTY3V1VuSDVQNzZVT2dGamlXQ3BicVFITnkxWXJtNnd5bVhTOXNT?=
 =?utf-8?B?R0RFekxTeVBqSllkbEloUGFMREx6RnVVay9yc2x6R25TTzM1K1MwL0JIVjQ3?=
 =?utf-8?B?c1d5UDFyYkVNZDNyY0JxT2RuOCsrZnhsS3c4dFdiOFNyZWNNM1RITzBoVVUw?=
 =?utf-8?B?eWM5Ky9LYmI4SHY1NjR1b2JVNVBpbTNteFpUWTQyYmdSMW9KaHBPSGR1bTVJ?=
 =?utf-8?B?TWQ5R3BpSmZIY0pGaGRPZEJoenhSQ1A2Z2ZJQmdkQkFjNHRTOU9MMlNyWWVW?=
 =?utf-8?B?a1JOemk5Y0NMTGlOV1BNa0tCcUNuTDBETzdDeklXeVNhMko1QzJka3UyYWRL?=
 =?utf-8?B?eFUzcVA4VjdKYm43ZFdIUmNYQmlkV3hBSkZMbGhHV2tzcW4vM1RxRDNaNU9H?=
 =?utf-8?B?NGpaWGtUUVlUVjc1ZU4zNm01QXV4Z2tMTzFWN2lIb0YvZHkva0pqeFl3Y0dw?=
 =?utf-8?B?SjJBd3BHS1RjbXJKM2lLNlk2SUR1c3RCdU5HeTI2MUpRUS9kcXBDWGg1Y081?=
 =?utf-8?B?eDRIa05nbVRsS2J5bE4rd284MlB2bDBqSFBVcGRyK1U3OUEzQmVJdHZDYU5N?=
 =?utf-8?B?TFVqb2piNzZOQ01BeHE0UXJnMWpXR2M0Y3A3WEZPQnN5Z0pnVFh0eG9VRUUw?=
 =?utf-8?B?UW9NWStqSVJyVE9Ka1RCQWFwb2NFUWt4VVlsUzcvYVRzZTR4NHN4dXZtK2xS?=
 =?utf-8?B?ajBFblhUYjlnbmd5SUVkMktUT3h3QkJKTVRIWmxkbjYxdTA3OFZSR2dwckRX?=
 =?utf-8?B?Z05qWU5KZ0VNeCs4Z1dIUXdiOFNncW9FMVVqNWkxUVdZSDJwbHEvNVFaMnJW?=
 =?utf-8?B?cWE4UksreTlsRmdBMzNjVTRKN3kyQ21GSjJsT0dkbFhtQS9BRUtOSWNrMDlr?=
 =?utf-8?Q?bmfw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWEvOEIzc2FCcDFLZ2RLVHkwM2ZTNENrMnRrMnc4N1U1dS9YZ0NJZk5BUXht?=
 =?utf-8?B?bXlGS1doT21mUGFMMDUwYzFoYzZ4SjZGanBBaGJURFRTOTl4a3V3czNpTnI5?=
 =?utf-8?B?aUFWMVloKzBtR25QNXJseldQVGgzekQrV05SM2FNOFRJUlp4cHJONm9uZEpO?=
 =?utf-8?B?L0p0T2RGVWR6VkxoUDhJMDlIeGJuZG9MMjZCaThFWWw3clkvbE03RlpHR0F3?=
 =?utf-8?B?MTZrSThUdDZmZjdzMkxEN3NwM0hPUmYxbWRiZDJEOGlMUmNRRlkxcWdnek05?=
 =?utf-8?B?allsZDVMK3g5R0xlZm9zc1RWcHRIWlViTmZIZjB1TU9ZRnduS29VT3FNeFZs?=
 =?utf-8?B?YWdqeEdlQzU4VGJnQTZLa05sOGQxVGFuTjFsS2NhcFhLUWRyendaRStGOXlM?=
 =?utf-8?B?ampVcjV3YVNwVVFEWGI2OHN0MnJoWnVCTnl5QldSQThHS0V6SnZjaUpOSFlk?=
 =?utf-8?B?SWJBVGV6WTcxOTRnaTR4dElreXhxMGxuODgxSjF6d3NHNzZFZUhJRkdrcDBv?=
 =?utf-8?B?WksxLzZhME1heUlvSHNQVFkrcGdFUmtVcXVsWWlyb3VDa0lqTUVFb2dWYnIr?=
 =?utf-8?B?QlIrZkhXbjZ6b1J0MXhQTzB4UW1DTHZueVR6VWM1cXFDNHVkeDFXNVBkV1ZU?=
 =?utf-8?B?eFZBQzR5eUFBUFgvdVpiQ3BJRW5VWXcxUjEyUG5QWnlPaGd0elJLclpmN0dz?=
 =?utf-8?B?Wk1oQ3czN0dhVkNmb2VjYnMrOFRUQnpGTktOb3hQbWMxa1NhM0lxdXdXNHlk?=
 =?utf-8?B?MlFQQVdhcjc2QTR2ZWlweUdIVjZQMTFTWDNlTW0wTXovK3VCOU9ESTRuWWRo?=
 =?utf-8?B?M3JLbHhrWnZCVVMrWmxuQVI4S2ZkZzRVZ3NobU91cXJLbHdXaWZCSUdmVUVZ?=
 =?utf-8?B?bi9DODJibnVRNVJpQ1FXQXJoSWM4LzY3TDZTSFdnS21KZk1BUFl4R2lzclJT?=
 =?utf-8?B?b3h1TXF2THBVbTdyY0pMTE5WV3RIVjl2YXdabkFieDdmbUxDc3diOUo5WkRV?=
 =?utf-8?B?M3c2dW5aaGE4Q1E1K2pidGVQNXlrdkVmRTczajd4d1dRZExjVVZpbjBMTC96?=
 =?utf-8?B?YUFDdHduSytsa0NFZGxPQldnZXhKOWx1SHJZM21NRXFzYW93aVpJbDBFbUpk?=
 =?utf-8?B?cndHQ2VSODUwMUoxendhcm1semswc1B3dEJtTCtOSmlQcjVqMzFiczRvU2dr?=
 =?utf-8?B?Tk5PMitOKzVTOVBLWTlRS0Z2RlJwV2xxUkpTWlRFdGc1N3R5TDU1djQrRm1X?=
 =?utf-8?B?aFkvQ0d6OGRMc2dCOVVJcDU1VmUrSGxEa1ZRRnFudWROcGxlTGhCelV0R3Yv?=
 =?utf-8?B?cmhmblNyaGtGR09NZm15bVdFN1o3c0lxMGxIRVM0d3NzMnhxUVpiSHVSOTRN?=
 =?utf-8?B?SjVQYkRVSm5VbnVFalVHK1krNFZvZUdyVFFNK3Z0eWErZG1IMHVpejdTeHNx?=
 =?utf-8?B?by9lbUFEekpuNkhDVThTWXVlZ2I5YUxpemdMRlQ1Wms3S3lQcjM0RU9PRHlH?=
 =?utf-8?B?SUsyak10ZlRzRFRKcUJzdVJBTEw3RkEyTlBla0t0ZlRndDgxOXo0UHdwbnBZ?=
 =?utf-8?B?d1M0ZlFnMENKM0tDVklnTUcyRkUvelhQb09zbVlqaWhZcEl0WE94Mi8wcGp4?=
 =?utf-8?B?NkZuWElDZzRydjZHK1lXUGtqMURRbW9JZ0I4SmlHc1g1TWlPSzNRWUQrc1B5?=
 =?utf-8?B?OHo5dW94MlhBYUZLeGxwTDFBOXV2MFl5TmtFVVJOam1zM3M4aWp0MGI4d0to?=
 =?utf-8?B?NUxmRHM4bjViZ296QlVKRTNpRUN4S0hwUzF0TmVOc05YeklBZDYyRWV4S0tY?=
 =?utf-8?B?aDlVOEY2dC83NDNWVDlNL1BRY3dHL0luMzR2bVRITDU3QTBQL0ltSGlaQzlX?=
 =?utf-8?B?VXBlbzZhNmJ3R05MTnN2WEFCVHdLck9UYWR3NkxMaVY0Vkp2V20xTnR5cnRs?=
 =?utf-8?B?anluMHZrU0o0M3psL2xEU3BkREdkMkc5S1NEQ2NlQmhDay8rUWxIS29WWjFu?=
 =?utf-8?B?c3VkRVZHemh4bzExaU02bFV2SWFxenZDK0tkSWU0cFhCMHMveFVYeFkrenF4?=
 =?utf-8?B?SXpCNjZwZEg5aGF4SU96MDYxb09EY082VU9hN1pTQjlLbGpCL1BtYW5jWW5h?=
 =?utf-8?B?cjZqTU1aZTJtNjdjUGViUmRrMG00VERmSVBxb09tY2k3SzJaOUcydnRXNFg0?=
 =?utf-8?B?SysxTm4vb2xwTHVhSzF3YTBBVUhyMWs0b2VrSlFyTXh3VllLcEl6QzNGajYy?=
 =?utf-8?B?eGRFM21JYTFxbDZpSmVSN0pON1FMajhRTmdFVGp5d0JuNC9VbHRuSi9xemhO?=
 =?utf-8?B?emJmajFySHY2RWx3SUVoQVZhMGY3TXdINm1XamJXdEFtMFNrYU1nN1ZoWFU1?=
 =?utf-8?Q?NWJfPXOhZ4Li07jmbXTRIC56kPRD8kfLJUmH/cWz0TWJZ?=
X-MS-Exchange-AntiSpam-MessageData-1: NaDUr8e1OZWxsw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1156e8-b64c-464c-f48c-08de653354ff
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 03:53:47.8798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMy+y+owZ9Yhi5UYOoXc5LgHd3O7J5TuEEIiqfFxIZTdW4hJCBX7tzll/mxF1NdQ0kZrnnB6fOwvLGQ1wsvjlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9703
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:ustc.gu@gmail.com,m:treding@nvidia.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nvidia.com,lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EB266F9DC2
X-Rspamd-Action: no action

On Wednesday, January 28, 2026 1:43=E2=80=AFAM Felix Gu wrote:
> The of_for_each_phandle() macro increments the reference count of the
> device node it iterates over. If the loop exits early, the reference must
> be released manually.
>=20
> In tegra_dc_has_output(), the function returns true immediately when a
> match is found, failing to release the current node's reference.
>=20
> Fix this by adding a call to of_node_put() before returning from the loop=
.
>=20
> Fixes: c57997bce423 ("drm/tegra: sor: Add Tegra186 support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 01e9d5011dd8..9bf6c008a5ea 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -101,8 +101,10 @@ bool tegra_dc_has_output(struct tegra_dc *dc, struct=
 device *dev)
>  	int err;
> =20
>  	of_for_each_phandle(&it, err, np, "nvidia,outputs", NULL, 0)
> -		if (it.node =3D=3D dev->of_node)
> +		if (it.node =3D=3D dev->of_node) {
> +			of_node_put(it.node);
>  			return true;
> +		}
> =20
>  	return false;
>  }
>=20
> ---
> base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
> change-id: 20260127-dc-e396ab5384da
>=20
> Best regards,
> --=20
> Felix Gu <ustc.gu@gmail.com>
>=20
>=20

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>



