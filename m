Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A985EB7E32E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C6810E113;
	Wed, 17 Sep 2025 06:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="ODoFRTIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B6C10E113
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 06:05:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H61f4a029124;
 Wed, 17 Sep 2025 08:05:32 +0200
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxcsma0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Sep 2025 08:05:32 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GD6mqawb8evG9uyfgz3FXwN/VMSY2VUOOy5affd+WgN3bPMGMOkJYOjb4tzKL60yI/RrlhavzJ0L7T1VGmqLWgWWljB3qR39iIYRHAPbP3ZJEgB34KMckkIyb+FcYbRduIKhjQlwIRHSXrQXnukLTvZEDH1nm7g4RRa/pjamKov8zHV8G0h2fZSLxiBeApeBFxt0VvBe5CC/lEqYMZDKchLbt3Y0rQubV+TOLy841fWWYjAh9eoH7KOq0JXUo1ATydNxV/e1vQoh0W0ci0WalgPdiWP9vPClG32782ew2ngpNZpcbiQfiYXA2UtoOMNAfmCsRc5/fr0NV9/ofF1S7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwIMnJmI7baPt3PJC7IBPZTYC1JxZHLV7rKYgamji9U=;
 b=hgYqT4b4Tca8O1/XGQZIdChRVDsZzjXYO/50UMemsysOHZEluqE/Yjwh7PijIUoKhObphzT3cmnkGBcYQawOkQ0tO3s+f7rrAZxIi8c88+C6Y9fMXnp2bcnaQ29pULKoeEnyF3+3qj2ZBqxSUgeKr1KcjxNesFx6wWSTrg4xrQ/MSJf+TZxJHHtWICGZlmEvXlM03nV8MLEQbaDS4KYsWjPEHQ8s278L8lisiz3U7jGZoZ6K3Fccjbvvy8V2yTg8MqnTDpcrizJDuBLbVwiI8f1oPR28b7alio/LaBEBbfYY6lX7l91tl0Yujhqe9NP7dCxc0oyBlgpN8UU3LqDOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwIMnJmI7baPt3PJC7IBPZTYC1JxZHLV7rKYgamji9U=;
 b=ODoFRTIY5BLZn8FZcI+ta8+15zXTlsfb2UO3VK1519ODi0dL3pctXP+7WBa6rla4XYS2HRc84rTDz16VPfyPRq5qlyVam1wFVKsWA8ksO+ALUBt8Pj4FDoXh7K1F3PS2JaKBjznKgbALz/IjvTQ9oRIWr7hpCIQs2aSA/kGu111Zeb+7mOOUHWDfiL59CpaQgbm+m+/KsucEMD3WPAWGEgXMFdDsO3sNX3ZS0fWlCEziYlGlbgxsPUNcCgfY0wkBg/qWQk0PXqBvbd6HOpwT3k+E88llCa1PlnrDU+Hv3UbLCNWyR+Ker4To+PsgTDJrdNYWW5ZowQw6PKshlkqhBQ==
Received: from DUZPR01CA0181.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::22) by PRAPR10MB5180.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:278::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 06:05:27 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::aa) by DUZPR01CA0181.outlook.office365.com
 (2603:10a6:10:4b3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 06:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 06:05:27 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 08:03:02 +0200
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 17 Sep
 2025 08:05:26 +0200
Message-ID: <31279611-bf8a-45b9-854e-7fd09d725661@foss.st.com>
Date: Wed, 17 Sep 2025 08:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] STi device-tree display subsystem rework
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
 <235312e0-b912-4e10-874a-e6364131aaee@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <235312e0-b912-4e10-874a-e6364131aaee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|PRAPR10MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: d5135fca-b16f-4083-38e7-08ddf5b03301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026|7053199007|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk5pZ2dHZkZ5Yk9DcWlxSDhhT21ZcmU0VXZTQkhKdWpkUEJxZkUyVGlqWnFX?=
 =?utf-8?B?ckM5SnpneTRrK3BDbzdlVjZrRGFqSlpSQzBPRmUwbGowTTJ0Z3ZRTGo3Qlds?=
 =?utf-8?B?RU9KVTliYTVlTDBvcFNUNmszUlpFeU1vMWFxZDF1V2xPd2RxTmxuV1VkdGJZ?=
 =?utf-8?B?QitRejZDODlPZ2VOck13M21rdGlvV1dkNkxrelJyODBLdDAxdEFoemhqL3FJ?=
 =?utf-8?B?NUl5ZWVqRTN2WTJxWGliejM5SHAvOVBzNHRTeVhIZm1XczBURmkzOS9rak5M?=
 =?utf-8?B?T1ExVTNvem9rUVJrV2tuSjVVT0VlcXBtekgxTVFyWWpxMXlnSjNpN3A1N0Ns?=
 =?utf-8?B?NWd2ZGw4V0tXYjdqL3p3d1lDczZEK3FUZkF1N1o4bE5DTkZXQjlLQmJYd1ZF?=
 =?utf-8?B?SmFNZFlleFJvWkdHNnlWQWFDdFZHcGJodW9PcFhxQTZ6QnRudGpuNU1melZs?=
 =?utf-8?B?UGg2cDc1dWFzNHAzOXZUVmFDaVFCL1dobjVvMkZ0Z3NaQzZDZERidkhQdzZm?=
 =?utf-8?B?bjBxQ0RjWXN1N2pCQXpnYnM4MGNoS0hlVHlQak1MWW5JT094UGRTUlJoMnRi?=
 =?utf-8?B?Q2xOT3dEQytHcG4yTG5DMXR5R1pSS3NZRUN4ckJDUFZQbTRzWEFrM3MvMlFh?=
 =?utf-8?B?VFBuSG9HTTJabDZrdXRwd3FPQWgza0VIRENGM09SZFYwbFRFNGhock1KM2tO?=
 =?utf-8?B?UUZLYndYM25iT2tSN0dKelZWSDd4NVl0WjhBWnRQSmtMSFZaOUZMWFNLL1ZQ?=
 =?utf-8?B?ZERIMEdabUVYY242QnpKZnBVTzA1bDk4alppdDErYUVWaUdmZm1mUjdHTHlP?=
 =?utf-8?B?NjFvTzRIWXdhZ25RSU55TmQvMVpRYnZybnE5TWM5MXJWYXhFTU1XM3kzRStl?=
 =?utf-8?B?SHNUclRxN1ZlMEpDNW9sN3JxN2piWlMrZjVseHVyOCtkY2MzV2xIbGJxdlVx?=
 =?utf-8?B?MEVwVWRpbWR6WEFqYi9MSXdRSFkveXRpWGRMdEZ2K0gyQnFuU3VTdW1qcUhO?=
 =?utf-8?B?NWlyYm5XOGxCV2NjZ3JxZ21XZHNKalh1SldwQ25ENTJoZFUzbHZLMEREWlM4?=
 =?utf-8?B?M0J0cXBLeWx4THlUbVYvMXQrL292TFIxVEt5U0NpMGgwcTRGQVQvWFpMc3Zy?=
 =?utf-8?B?SUVKNkkzMUN3Q01KL1MzbFhjSnBVdVUreTBGa1FjRzhFZGVncStxWVJ3MDJX?=
 =?utf-8?B?c3JPaGMyaDNXaitoS0xWM2tCVUFhdWczU3FKcHRrME1UZGsvY1ZJYWcrbkY5?=
 =?utf-8?B?bGFhSEFEUWtMYmI5ZmowcGoybG5qdU1yYlVFY21wMFdZZDZTcGNvang3dS94?=
 =?utf-8?B?UjhhdXdSM3M4cnFsUFEvYU9HVTJZTHdBbzdWOWF3ckY0UlRNL0lMVTFzVmpR?=
 =?utf-8?B?Wm5sV3hLWEFsbkpBRW8zZlcvNkFGMWhxWndKaEkzS1FtbTVnMUwyeW9IcDk0?=
 =?utf-8?B?QTBtS1VKL3lCM3c4QTI1dHV2UXdnOHRVUFRKR05qV1JPeXlRTTd3c2t3SE0r?=
 =?utf-8?B?V01pNC91YzN5RDhYa21WWno4dk00WHBzNk40QmZPOWkxZG4xcUpOOU05ajNP?=
 =?utf-8?B?Z1BFbUxXS2wzUDQyZlhac1JCOW9qQklya3k4S1N5SkxybXp2TEg0Q3ZrSnBS?=
 =?utf-8?B?QisvRFZnQWVicHZraS9qWlUzcGFzQTR3YVExS3I1b0RHR2tvZkh3MzJiclhh?=
 =?utf-8?B?WTlLWnJTa3hMelY1ZjRYYWY1NFNyRTREZFRjdGZzcW9vUnlCcmgxbW9sVjhT?=
 =?utf-8?B?VFUzV2tkZElMSm5oL1BJUVVkMlllUGN0TzFiVW9FWC9zTTVjWnh2VVpkc1E5?=
 =?utf-8?B?YjJCVXVOVktZOXUrSVphMitza2t2Rm5FanV6K2c1K1hDNm1zMnhKRElyZzJB?=
 =?utf-8?B?ekNtL0d1cVVWWFYyeGtHZEgxcUNva2pHU2pTbmg4Y3dzbDNJYmExR3BDa0xz?=
 =?utf-8?B?T3RKYUphWWd3TnpVMHZtV0YrSTRHWUY3WWVNN3BseC91WlJBQW9jSGNNODRj?=
 =?utf-8?B?cUNWYS9IcURoU0dnQmFydnFOTEVxa1k5K25tTE9adE41TEkxbUdhY01LS1FW?=
 =?utf-8?B?b0dqUThvMzNPS3dFZ1ZJR3QwWWRXUkJLbDMyQT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026)(7053199007)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 06:05:27.2821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5135fca-b16f-4083-38e7-08ddf5b03301
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5180
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1sD9JOflCye5
 GlmPdzALFxa10wJjU72GJI5P05zrW4CDx0T7hf4weGr9xpcyaRhANsffisF+OHGgiVDmSMfEhVp
 iwOW/jaTB8wPJYCk/dUqQSgUq3nQzBKWdaCV4Ygqvtppp8tCwYaahxgevm2H6ZF3wmNOLa9xDtP
 36es3RoXFDd8pbZcH/Y8iO6VHJv1UpwaQq6sN0r0+qZ5nyVJgoZVfSTK/w7RR58pNRDNBJ5fDT/
 J8bMBbLj9PWuU/CjbOxdObSibQxpqwZVuPqITCdVtmYe461v/4ku9OlSgXkSWw3hle+HVF6sR5q
 dvfT4UzFGSQmeKenpSANYj2C20smCST7DEJRzirKJz/26IMF7FCksLKXL0v3QvLt2n+l5bj1XKR
 3bIG1hiL
X-Proofpoint-ORIG-GUID: yIyG_56eU0F8pKgYqNzw6Id7HGk-Nn4W
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68ca4fac cx=c_pps
 a=xROmSCIA31MF1jNH4FQa8A==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SAHXIHsbQyQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=49RGCd1ShMPX65mifRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yIyG_56eU0F8pKgYqNzw6Id7HGk-Nn4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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



On 9/17/25 00:03, Raphaël Gallais-Pou wrote:
> 
> 
> Le 17/07/2025 à 21:15, Raphael Gallais-Pou a écrit :
>> This serie aims to rework the display-subsystem node, which was
>> previously included directly within the SoC node.  This was wrong
>> because it is an abstraction and describes how IPs behave together, not
>> what the hardware is.  Instead, extract display-subsystem outside of the
>> SoC node, and let IPs describe their connections.  Doing so helps the
>> readability, and eases the understanding of the hardware.
>>
>> Several nodes have been renamed to stick to the generic names defined in
>> the device-tree specification.
>>
>> This series depends on another sent a few days ago.  It is not critical
>> though, since not having it only triggers warnings when building
>> deprecated device-trees.  Please see link below.
>>
>> Link: https://lore.kernel.org/lkml/20250714-sti-rework-v2-0-f4274920858b@gmail.com
>>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
>> ---
>> Raphael Gallais-Pou (4):
>>        drm/sti: check dma_set_coherent_mask return value
>>        drm/sti: make use of drm_of_component_probe
>>        ARM: dts: sti: extract display subsystem out of soc
>>        ARM: dts: sti: remove useless cells fields
>>
> Hi,
> 
> @Patrice
> Would you agree to make the device-tree patches go through drm-misc instead of your tree ? So that the breaking change lands in -next in the same time as the driver changes.
> 

Hi Raphael

Yes of course.

Thanks
Patrice

> I will send another series to convert display subsystem bindings to DT schema as soon as the series is merged.
> 
> @Alain
> Do you prefer to merge it yourself or you rather let me do it ?
> 
> Best regards,
> Raphaël>   arch/arm/boot/dts/st/stih410.dtsi | 316 ++++++++++++++++++++++----------------
>>   drivers/gpu/drm/sti/sti_drv.c     |  18 +--
>>   2 files changed, 192 insertions(+), 142 deletions(-)
>> ---
>> base-commit: b9a572f471993d3e8bf874fcb57f331d66650440
>> change-id: 20250401-sti-rework-b009551a362c
>>
>> Best regards,
> 
