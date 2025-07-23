Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B895B0E82C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 03:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27B910E03D;
	Wed, 23 Jul 2025 01:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IUMEW2OP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B43510E03D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 01:36:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFm2EdAq0RFRjoqm1YnpsG+I49qw2lGtMqZeXabCq/O+mQ4c1gLao3MuO/j0Emw0dFffXeD4mW6nRYaAgZR4Yg06pCdZN6EsUieu0Noyha9VTT9yzWpl2hHBTRdxnB/kqh1eaSfebfEt9bvdN1586HZnfLnntTWXmNHAcSmKJWxt53LsAm3pUqsE6HVaBCapuYp3CMoDAO+PeeGWXnGEVhdsmptLV4geEBq8xtLYCs4BBwO8Vmf25C3qE7Aj686lVRMVmxz0C41+eL2H9pUsuIJBQ4tqNvZi5aBwCoRaSHmD1Cw5/IwBaUr1GWlWtl0pT4iw/RrjTCh2cBEkCtmigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDunGlm+eMjJYLj6KyL6d3Jo/5Kd/P3/A03H5y4A0XI=;
 b=Q6sdY2kMSl/2E/auVZ28E7fcKvruChHxKJpTMRFPKmgm2xvfh7lzsektrKngl16qcYFfbhu6i1ockmuGL6wvr2DO39lG3Il34qC9ooIpWyprw0j/bt2AJhgqHKeOxqxPcSQCB1dvZUzNLohCfiqfB32Y9VPV1URlBPHMUF4nr7DrIFr/dkvhEsMmoJbBzy9JNfDH/9S0jRn5efGFregu/eku7kUnk5016oeLAJfc9L/REou7t0dlNPw4Gb+DvdYuyOsXPzlvt2VmzXbSgpjo3NYxsi8tltgeB0pNao3NuEFdB5nPF2lrLj0y2II6Li/9RMLHuAhKweDyus5oheBZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDunGlm+eMjJYLj6KyL6d3Jo/5Kd/P3/A03H5y4A0XI=;
 b=IUMEW2OPujnuojjKKt5zA3lGUzp+UDG90ghS8RlF8TCAK+jePvGE0QI7KBB3YEtFLnKPMfDePbeWGXZj8XjmFIllsrobRAiw6c3o/bIdGu2/xa7AjKw7xk1N58hQa0PdrIm3qU+wo5+trBoZxDyGmi2EsAl9qiY12KjjkdZhfhxv99gj0gJgtjrBlD1biBcJXJWMsvZbEhY4tg4aFqLSNEtHnsi1Fejig/5IC9PvK1iliYo6ZaMg/mZrXUIT9XwGwPTobgXBny+azL8gRts/vtFViEUOXuiqgjTPTA/hc1XeVuGDvWyeaK1vgi21hdlnaE1IGZ5yXpOp0ZcIupB6Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19)
 by SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:317::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 01:36:30 +0000
Received: from CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7]) by CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7%4]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 01:36:30 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
Date: Wed, 23 Jul 2025 10:36:22 +0900
Message-ID: <4158240.taCxCBeP46@senjougahara>
In-Reply-To: <CAPVz0n1TxOb_hKgKYTdeJ=Ka0STqfiHLtwAv+Ws=vtq=G-MAow@mail.gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
 <5474709.5fSG56mABF@senjougahara>
 <CAPVz0n1TxOb_hKgKYTdeJ=Ka0STqfiHLtwAv+Ws=vtq=G-MAow@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To CY5PR12MB6478.namprd12.prod.outlook.com
 (2603:10b6:930:35::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6478:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8c47ad-6af3-4368-71de-08ddc9895920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTNYZmdtK0pZczl4akY2ZGNiSWlpSUlwRjJxVnc1czBuM3AvRE9OaUJMWVdL?=
 =?utf-8?B?K2JNRGJFSnpXRWRJNm5tcUxaWEtabUNZS1F6eUtFZjRSVUxWT0x0MmdVZUxv?=
 =?utf-8?B?WVhIQlFTdTQvTWh3R2ZyWlBkbjdOaWdUekNmY2tFUmxRQ1FxUnNHbHZRK3lT?=
 =?utf-8?B?TUlBNFk0WmhqdXJTV1ZYZ3hDMEVwMmkxTUc2T3lFYkxYNlF4bnZVT0ZrbTZq?=
 =?utf-8?B?d1ZGcWo2Zk82ckZOUlRZSTVDK2dmR2NHMkJ1UG5hUUdhL0lqclg4aysrUktL?=
 =?utf-8?B?RnNnNGV3a3RZL3A1ZVNGMktGbS8yNW1XVC8wNTYyYjJScjBBeEtub3llMmhl?=
 =?utf-8?B?Y25PNWdPYWE5WHk3UkNnVTJHelZWNll6dWRsRnJuRWVEV2dYTkNUTDBnVzUy?=
 =?utf-8?B?ckZGajVFKzEyUm5hZTVVdHRGRUFkd3NEK2tpOFU4aDdzYU5IT0kydjJReHE1?=
 =?utf-8?B?K3A1YjF6M3EvWGFuWDIvaGR0WGNHWXNnZDJUYmMxenYrc0IwVTB4Z2lLYWd2?=
 =?utf-8?B?WEhyeXRBUVVlZE1VQWVRbjFiQmNuWVlCTlV0bkg4Q0o0Q1Vab3hkS3k0OERi?=
 =?utf-8?B?eUlrTWhNbzNXUHBWMXRVdU9CWWxJQ25oVHB0ZnY0SjNJVVJJQ0theDZnb092?=
 =?utf-8?B?eFFnUitlYjZ2VUw3TmN1NFRQMjFwR2VOVTh0MFdXRGIzdUFSd0tOS05jWjVM?=
 =?utf-8?B?TmpVYUdxbzZackxOKzdUVElDSE83Y1BLTTN3L2lnSUZiMHM5enUzYXlmSVIz?=
 =?utf-8?B?QkpJbXFxK2E0L3pvY2l3TFVHemdOR0x6K016b05IOVZaUjRIeEk3NTBSRDBX?=
 =?utf-8?B?TTE4dHFtYlhiMzVka05vSDcyUDJJRDJoU1lJOXM5ZHBxK1l6eXJDbnlBYnl5?=
 =?utf-8?B?Z0NVTDVFa0V1S3k0VGlpNFhzSXZTcUJZeXRMcXUzSVdGMFIwZEE2TjVoc1ho?=
 =?utf-8?B?VFhtTHlJOHh6OENWc2EzVjlmK0NLRVc4OEVUdmNJb2lFVENiK1YzbnovbVJI?=
 =?utf-8?B?S2taKzBrZlhSR05GZzRWNnVmOEl1eWFSVHkweDh5V0hDdzBiWTNLSjF0ck5U?=
 =?utf-8?B?aUlEOTRjL3NqeG4yWUU5OEx2eHNlelNBOStvMEYvWituTHlaMTg1WUYxTjN2?=
 =?utf-8?B?bkN0anRoSTA3Ung1WDk5ZjVmY2FERFpwRnl2RGxhbUVsc3pxbDYwNVBvZDhC?=
 =?utf-8?B?d3Z6UExGbUIyS01rWEdZdGZRT25UUVVtQTR0bERpY0JVdTIwUVhFaVNKcSt3?=
 =?utf-8?B?R3gyeHl5WXQyTG1XTndGVEdqVit2M0w1ZjhrbkRha2puK0xCdDQ2K0src09K?=
 =?utf-8?B?dis1M0pnZURSc1NLOGJrZHVZTmloV0ZzR2c5ZDB3UXhocUZDSVQySWppRDBF?=
 =?utf-8?B?QlNRTytDWjI1eFhwWG1zeGhEeHdsZXIxVkptc2hTSmxuaHF0d3ZXL1ZxYlFk?=
 =?utf-8?B?aXowWFBIbWtxRkM4QzNmOE40TmJvbjRGaTdLN2JVZWZTUEVlQ1ZPd2tOSk9y?=
 =?utf-8?B?K25LZWI3bjNsUUxBUFFaTzFmNExQSW5CVURWNTg1TmVSSzVqOWEram96WEJG?=
 =?utf-8?B?VytLQ2dUQ2FYNmhKbDhYemZMWE8rV3ZXV2YxWFVMOHVTa1JSdGhDeVVsNXI2?=
 =?utf-8?B?RVhpVkw0L1l4TjFTNmpxOThGZng1dnRJRWlSUVd0dzVTQVRGcGJqNnBhNFlD?=
 =?utf-8?B?WWhpeGdyYldUbHc3K3NLZzE4KzBrNnZzZkhTVC9JSVVVYThBYnVkRFY1MjJH?=
 =?utf-8?B?T2V5LzJGb1hVYnErTnlmbkxBTXBFeEpaVGRJQWg3eVhHK0hOTEx5WlI5WVNE?=
 =?utf-8?B?cWttaHNHVjVRa09DbTUwY2xsVGtZN1lPYSsxZkV3Z0UvaSt5bVdvdE4waW41?=
 =?utf-8?B?MXFmSkFGN1VOUEZWZ01ad01oM01mSmZlWUZ1Vnp3UFdobDEyQXJST2FLNzBV?=
 =?utf-8?Q?h2kEVKbdOd4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXZ2ZUh3U2JWMlp4ZWp2c2s4WnRLK2IvVE9qb0twVG9Hb3RoWEZoV2xoUFNq?=
 =?utf-8?B?d3p2cjNIL1l5Y1BMUTFkbmM2Z0FSaUFSaDlSOEx2QkpzZHowNDludVNISzNP?=
 =?utf-8?B?RWNPbzVZalhiN2ROa3ZwNHFGSThQNHRLaUZzbGhGMFo4Q1FUSy81Z0NXcE1o?=
 =?utf-8?B?OEpKS29PYUhYMGNzbVlMVWM0WXI5N25SRGNVdXRUMS9xYVZHZXZFeU9ldUsv?=
 =?utf-8?B?YXp1KzRRSGUrblVMQTFuVU9HQXJ2dUtGYlh4dHRIVmNNSlhaMDJWS1BJUVhQ?=
 =?utf-8?B?UVpaUzZXazFoUW5hUStRZ2VUTlFWcDN2cVd4UVBHemlIUzQwRkRQOElMQmhZ?=
 =?utf-8?B?TUxncWIrYmNGME02aWRDRWN0dGYyZm96OVF5dWwyUUF0Y29lU1p0cXRzaFlk?=
 =?utf-8?B?Slh4K2xzUkZGUkRzYXR5ZGJpMGdQVURod0t2dzBseWF0TXBzVTgxWU1rRWhj?=
 =?utf-8?B?YUJaTGFrSGxSTitRV1paSHl2ZGIwc2lTcmZObDYvVzJGL29MYnJtM1czalZE?=
 =?utf-8?B?K1ZkZWNIa3F3WnZMRVd1c3hyRFdoampRZVM4QlNKVDVad0I2ejJRR0tBeEhP?=
 =?utf-8?B?Sk9nZ0ZlQkRMbGZkajIwVGYyZVJoRkpmdnhBR056Z1ltSWpIS1FMckVlMXRI?=
 =?utf-8?B?NkV5NnpYRUMwbmVQNGp0S21tbDdzTk8zSTZLTUZlYkQ2dk04b3RCeUc3VldI?=
 =?utf-8?B?MUt4Mk9HVUtOSGVrTjdaT05ucFBVanM0N3BOa1VHb2N1NU9hWGZ0U3lYRDR0?=
 =?utf-8?B?UWJkYkw3SHppckJMZkRjNm1LaWVVL1JIVlIvNk5kS1l4b1hqSDJTKzJubW5R?=
 =?utf-8?B?bWFpV3FOYStnNUxkZ2VvZmptcmtWZUJxd0R1Q1h6b09nU0FjZ1J4VWd2emVZ?=
 =?utf-8?B?VmJ4enl4MDAvVWVXZmJsaEFTcHJsTndjQ3QvYWlQdHFXb1F3MUxtU1lCbW9D?=
 =?utf-8?B?S1JmNHNrZ2VqbjVhbnFpTi9rMXNlNjVIckI0ZU9PcERVTEdXQlptaXd4aU4y?=
 =?utf-8?B?VTF4Tkt2R3ZxTXRDcGhhYlNHTTdxZER3SVl2T2pnY215MUh4aW1BWnlaN0Vx?=
 =?utf-8?B?YkRyYnBsTHpUMjZUMnJ1Sm9iQ3U0RlkrMUJIKzk2V0lWMm9KZWgzYXF6REpa?=
 =?utf-8?B?bEJickdBM0pmcjBVZWFtYWszQVp5Y3NhaS96ZGNvU1R2Wi9oZ2xJZ2grRXUx?=
 =?utf-8?B?b0JtNHcwSSs1ajNFaU5vRmZieXR0a3JhWVRWcENBVDRWYTVObmlFazljZ0lw?=
 =?utf-8?B?eWlLNW9IV0FHZ2k0MVF5Z0VSK2JIU3NZTVF4eWhkeEFlc3huclZHeHpydWVL?=
 =?utf-8?B?anVvWGFaQnZzU01UL0o1SmhXREt2QVBFMHF2bHRjYjdqRTBCRkxZbnlZT2hR?=
 =?utf-8?B?TWpVbi9TZGIxS3ppWHFMaDIrUThneUFDVkU4S29RSVJ4VitsMjdSdUJLTlZz?=
 =?utf-8?B?aU5BdlFOcjA1Ty82RXlheVRwMTNCeTZuZE1mNm9QcnFwK0VENHkremg3SHow?=
 =?utf-8?B?QmZHLzloRmZVeVE3YTJEMmRSQmFuK2JVdU9jbGVMUzFzWWtQd2J0ZXI2Mnhh?=
 =?utf-8?B?WFUrYnQrSG1OQU1LWEwySVdoa1FzdXlLekYybGtqcXFmbGVQUlhhNFhaYjRp?=
 =?utf-8?B?SFFEb09MRVNSYXMycHd2Ly9mOEhTcHRQQ2VSbXlaMmVPd2V2QXhJMjFxYzNn?=
 =?utf-8?B?WVYyUjY0QmR1eTB4bDhHbjRPbGtlcnpyYi9yMWNodUJOTmJEbWRvSHhVZ2xF?=
 =?utf-8?B?SHNReFpQU2xoNkNwSXFJMERJNWdtcHFsU2JpOTF2dDB1V0c2SWQ5eG9DRnlz?=
 =?utf-8?B?T3pKZnNXMmo1OS90Ry9nZTd6MzA1aEY4NE9mSDF2MUtUdFdmVU5TcWZpOTJr?=
 =?utf-8?B?clcxL21FTk83VC9hVU5xTk5hTDhSTjRMcDNoUzZTU1RXU1lFR2YyeEVhMTZ0?=
 =?utf-8?B?ZzN4YzhFZFROS1dhWHMxYjhPcTJ3eWRJQXJZaCt4N2RmNm5uRUVlY2FuMVZN?=
 =?utf-8?B?bGdUVXMwWURnejBpdGJxRStGUkZCRGNtVUJJc0RpZFpFaTRvaDJWdGkrZVZa?=
 =?utf-8?B?VzRhVzNNcG5wMXNKYy9scjd5cFBvc0Fac2ltSWVpQWEzcVNhdnNSTFhzSVlB?=
 =?utf-8?B?MzZJY2VVa0gwMnpjNDNLUkswNEpXblhDU3hJS1dYeWdMaDBhN1VVaE1oZTZC?=
 =?utf-8?B?VytqejI5RURkSFJiVFB5QU9INm5lQjJZejFvalJmTG1URWp0eVl0SVJIalBt?=
 =?utf-8?B?aDVKMllJbS9HWExvU2FQNFNLaUxnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8c47ad-6af3-4368-71de-08ddc9895920
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 01:36:30.2962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mQUIKOJE9hvKGNGR6iyL9g+CY2mjuxNMey2KFZX3w4BUwDP7VQ6IFoXQkrnSYAzt4cqV2Kt9cfIv5qrWJJN6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764
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

On Friday, July 18, 2025 6:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:11 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > ...
> > > @@ -311,6 +330,43 @@ int tegra_mipi_finish_calibration(struct
> > > tegra_mipi_device *device) }
> > >=20
> > >  EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> > >=20
> > > +static int tegra20_mipi_calibration(struct tegra_mipi_device *device=
)
> > > +{
> > > +     struct tegra_mipi *mipi =3D device->mipi;
> > > +     const struct tegra_mipi_soc *soc =3D mipi->soc;
> > > +     u32 value;
> > > +     int err;
> > > +
> > > +     err =3D clk_enable(mipi->csi_clk);
> > > +     if (err < 0)
> > > +             return err;
> > > +
> > > +     mutex_lock(&mipi->lock);
> > > +
> > > +     value =3D MIPI_CAL_CONFIG_TERMOS(soc->termos);
> > > +     tegra_mipi_writel(mipi, value, CSI_CILA_MIPI_CAL_CONFIG);
> > > +
> > > +     value =3D MIPI_CAL_CONFIG_TERMOS(soc->termos);
> > > +     tegra_mipi_writel(mipi, value, CSI_CILB_MIPI_CAL_CONFIG);
> > > +
> > > +     value =3D MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> > > +             MIPI_CAL_CONFIG_HSPUOS(soc->hspuos);
> > > +     tegra_mipi_writel(mipi, value, CSI_DSI_MIPI_CAL_CONFIG);
> > > +
> > > +     value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref)=
 |
> > > +             MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> > > +     tegra_mipi_writel(mipi, value, CSI_MIPIBIAS_PAD_CONFIG);
> > > +
> > > +     tegra_mipi_writel(mipi, 0x0, CSI_CIL_PAD_CONFIG);
> > > +
> > > +     mutex_unlock(&mipi->lock);
> > > +
> > > +     clk_disable(mipi->csi_clk);
> > > +     clk_disable(mipi->clk);
> > > +
> > > +     return 0;
> > > +}
> > > +
> >=20
> > Where does this sequence come from? It looks a bit strange to me, since=
 it
> > doesn't trigger calibration at all. It would be useful to mention the
> > source in the commit message.
> >=20
> > Mikko
>=20
> Downstream nvidia sources, 3.1.10 and 3.4, dsi driver, function
> tegra_dsi_pad_calibration

Thanks!

Indeed, looks like for DSI calibration, the HW calibration is never trigger=
ed.=20
However, for CSI pads, it is. We should take this into account in the devic=
e=20
tree binding (and driver when CSI support is added) -- the parameter in=20
nvidia,mipi-calibrate should specify we're calibrating DSI (probably with a=
n=20
enumeration defined in a header file).

Another thing -- the commit subject prefix for gpu/host1x is "gpu: host1x: =
",=20
and for gpu/drm/tegra "drm/tegra: ".

Cheers,
Mikko



