Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76517C1ED29
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 08:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B13110E8C6;
	Thu, 30 Oct 2025 07:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="VZ461bVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B74610E8C3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:43:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U7XfLa1282408; Thu, 30 Oct 2025 08:43:02 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013013.outbound.protection.outlook.com
 [40.107.162.13])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a3be3nu56-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 08:43:02 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbwNlC76laitIPWCZbGRxVneB6vA4drel48cEvOw15LxfNHMNGBdn13+3bS1Gj/jGroK3M8LAmmb7+3sZfbnF02UgGt+LgXAoG+x0BIZUgcfcVhh3dv0fqODQFvBO04q9hL/N3Ox8wFj2HaDeZeDnWnsYvniOEJEzrzeSV9TazOKr0OM3bXYfX4RGECBS1yZUbG54BL+2zFazPyxxFv/yx/Brf/yMwg8UUUZvrleVHhJ4LkRktEianHwLqkBcSZTwjBCLEoI+zwhd+Iv5lmQtKK1qfWYZLLXveUwOFBMPt0NQxTGH6AwvpstlQ5kFsOnrukye7Va9JmlKfJ3tqTS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOaKVTRnNwcfTImRnwy1uE5SoHQ/vXIrnPxQLZ/wFfk=;
 b=NUQCKkPjIsCrddmWPRYpb+vR4+j4AXgwbyDFmZDFSGtxT4zMk6kq7SO+RpbtZQ1pY16hau4JHIckMGwdv2rd0kdSGnDY09UX0jwVycn55Ik7MJ6kP4+KAsXkOSfwLgVWS3CSyPIa+KUgPZrJyiiLKjPLPZxVO1CFjeSDmUDPxDb/kX5aTm+99Vry/jAnBxqgZ0d78/JRUkVazu1rlN/F0JFnrz4PdEl32VlWrKIm4Z05yifvJLSTEFXiHqDEWrXSbgbCD3pei1lrSGLQqoAoq+vZuAd/Ojm6EtxIAHLvxqDTHzD/ikwHc47Y3LqE/Ui+B62NL17oklUiWUevUrUtkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOaKVTRnNwcfTImRnwy1uE5SoHQ/vXIrnPxQLZ/wFfk=;
 b=VZ461bVfcFaBtzzTRGuLROp6A+NTaASxupr8jqYpLwPq/Hg68Yc4ZS/QEAM2hL4kvzBrdk+JfmHXk62Ep60hu5zgtnBCrKB5WZoF3t6Nsco9jRfoWd50C48p8MU8ydzr853OP+OTEbmiVY3vExVrtEDSAfXzGVItyVlBPMC6zMHKv4muunwdc+N5Jou1mnpGJKXd7vW9JnO5FbuopomcoBlT5nH3htcx08CqUn5Ts5J8TVSIkq32yS/4elkltu3nvt8jCaD0LEsxlz2FOiG+4dKsLVVS+Fk7YwI73mnRUHyG1IxSja22CTDuYm/44TtU7pG/ZvxE0DD88TnpcG5QkQ==
Received: from PAYP264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::6)
 by PAWPR10MB7126.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 07:42:57 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:102:11f:cafe::20) by PAYP264CA0019.outlook.office365.com
 (2603:10a6:102:11f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Thu,
 30 Oct 2025 07:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 07:42:56 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:40:40 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:42:55 +0100
Message-ID: <c5a84e6a-ebdd-46ad-8140-40b9711b4b25@foss.st.com>
Date: Thu, 30 Oct 2025 08:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: sti: extract display subsystem out of soc
To: Raphael Gallais-Pou <rgallaispou@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
 <20250717-sti-rework-v1-3-46d516fb1ebb@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250717-sti-rework-v1-3-46d516fb1ebb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|PAWPR10MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d4ca53-fb19-4e6b-74cc-08de1787f147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0ttSW1OYTVscHJ5ZUxaV2pCeE54U0dQamJBTWdGVHpkUGo3eUI0dHVvZ1c1?=
 =?utf-8?B?djBNRHBQd3VWR2x5ZmloTHppaUdZZW1VSTRsTEgrSEJicWV3RGpuaGdhL1JJ?=
 =?utf-8?B?OERreWlJSXpaSDM4b01sNG5ZTnpqb3RHRDg5NEU2OU1lT0JvZHc0TWtQdnlk?=
 =?utf-8?B?SVY2b29CMGVnYUtDMHFxcEJQa1hzSzIzeC9zTkJuSzNFc3graEpqRTY4cUZm?=
 =?utf-8?B?aXE2cTdlR2Y2Qk1HdC9KRFJ5MmQ3dmNSSnhFRlJtamNSYTVQdlJhSlNTc2JM?=
 =?utf-8?B?OXdmVW5qa0tzYXpFZkt4N3BTZTJFelhNQkJqdFRCSldhM0RidjhKYTFGTFRi?=
 =?utf-8?B?TzRzY1ZpK0dpQ0xEWTVBVUtiRWtVMHNpckpIOXQ1eFJZZlNKeGpWd1lVRFNN?=
 =?utf-8?B?bnNSc0tZdVNXL01XVzNiMndHeG4yQi9oVWY1emc2WVgySjNLWjJuRjQ1Q0FD?=
 =?utf-8?B?d2k4NHZnUjVkMzJHNXYzS0NWZ1ZiRGJUcUFvUTJaaHIraC9weVI0Ymsrc3Z3?=
 =?utf-8?B?cEc4S2lYL1dJMytBMEdQNjFPdmh5RXpPaExyRHFVMXZHMnVmTWdhbVBGS2ll?=
 =?utf-8?B?c1RkUFo2cWhXU1d4V0xsWHhOb2FXU3c0MkRDK3d6aXc1SDUvRFVTbzRjZGVp?=
 =?utf-8?B?MERhTTE3bWRuTU15TmFFRDkzZktCUUZpOEQ0NTkyNURBRHRId2pSVWxoNHJs?=
 =?utf-8?B?S251VG9IVEZoY3lDTDR5c0VtNSt6R1VKc2RMLzhMQ2pBbWIwTlNCMnJtR1pj?=
 =?utf-8?B?SVRmdDV0eU81bFo3OE5qT1FmUmxyTEJJMjh5Vlp3UHRwbUFqMjlwOXlzcVRq?=
 =?utf-8?B?bDV1RlFOMGlZYWlKZ3ZWa1hXMjRwWEJveW9hQWtMSE10V1Nxcjg0a2lWZEts?=
 =?utf-8?B?RzNabnFDVHVsbUhOKzh3ZnByZUZwanEwK3hIMUx5SzE1TGRHSlJJVHZ4eEdv?=
 =?utf-8?B?SW1jalhLK2ZiMGFOQnlLWERsaVpsVG4wYStQYTgyTEUzMnBaV0l2MGhoWnR2?=
 =?utf-8?B?TSsxd0xqWkpSanc1dEhqOEF2S2src3pla0M5MjZNWkFTVVJ4bDQ1UERlbEgr?=
 =?utf-8?B?UkxBWlBtb05BcEFzMC93QXc5MWxONXEzT0VjOFQ5MTdqSEZZTkg5M1Q3RFFl?=
 =?utf-8?B?dXhoUG5qN0pYbDJRd3VJUU9WQm0rakdJSGR3OWQ2dFpBQ1NlaU9CQ1Z3bmdh?=
 =?utf-8?B?MTF1aXQ1M1A4cUtOVXpSaTJSMVVuc3gwb2ZEckRrSDFtUlRFeGRIbHpraXBL?=
 =?utf-8?B?Szh2dGYrNFRpZ3VIOGg0bGF2bjRBbE04K0J4U0Q4Ri9tNmlhdDQ5THRJMEdm?=
 =?utf-8?B?TVFvcHh5WjYzbTJiSkZqdFhxbTdEcGs4eTllaVd5UUhORWRZSXZNWlBKZm5y?=
 =?utf-8?B?WGM3NHk4eEVobEk1VmgzWk1zaUFNekVWNXBtTGJnTmhEd3hPWktmNjdwZ1M1?=
 =?utf-8?B?THRKRU1TTWVKaU1UMVd3MVJmTHNxRFZuS1FqM1R6NXRCblV3WUhoY1c2TE9P?=
 =?utf-8?B?cHZ2QWp3K0dFUDRwWUZKK3hvSkFPZno5NXFQUDIyK2Zhc0RhZG8vdm5xYjB1?=
 =?utf-8?B?bzRuckUzWTE2ZUFkUHBZeVZCa3BHd28xdFRjYTVlcDBsUmVWOWNKSTdIZ3JK?=
 =?utf-8?B?QllzN3lWQVd6TWwzdWU4UFBrakVveFIxUElQYzNKamc1VHF3TGtidTRtdTRl?=
 =?utf-8?B?TG94VVRvbExYeUFzKzJhcnBkZGxzTlBmMjdEM1AxeHhFa2syeUhYSVQvVmc1?=
 =?utf-8?B?RExkVjR2MDBGM210c2ZNMms2MVFyczFMRnEvOGJjRDllVHdYMFZqL0FLMFFB?=
 =?utf-8?B?c2s2MGpQVzk2S0NNWEF6RGl5ay81eG5sYVB1ZGk4dHBYYTk1WVZ3QVZHSHJP?=
 =?utf-8?B?MjZTMlNScklpY2hkREdvMWh0Qi8zekx1dk52TjlrZUlMS1lkR0ZVMHo1c0JE?=
 =?utf-8?B?MXcxaXNkUTRqd3lpakdzYkVGYkZyWndhYllGL0JDeGZiQTR1dU9GWFZDZkJM?=
 =?utf-8?B?Qm1TeDBic2ppcTlpSlJNbCs5alRlbmViWGFPN29UMTlMTmlSYm9icE5hUlE1?=
 =?utf-8?B?eGRyL0c5eDVwTzJIdmwwSGo0czFKUGVZQndraE9lSU1tbWJrRDJNWlJEeG1X?=
 =?utf-8?Q?wLnun+Sfkcd9K2NbI58z+JlAD?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 07:42:56.7989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d4ca53-fb19-4e6b-74cc-08de1787f147
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7126
X-Authority-Analysis: v=2.4 cv=JMU2csKb c=1 sm=1 tr=0 ts=69031706 cx=c_pps
 a=KhE4gu946QIFSMZrge1Egw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8
 a=Fogd_9c_AqE0UklwBAkA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: D2HaJFYl-GoRcfavp_9NjYjVh9e69DCO
X-Proofpoint-GUID: D2HaJFYl-GoRcfavp_9NjYjVh9e69DCO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MSBTYWx0ZWRfX4+58opNY30ey
 vk0fHi9Rz1FlXxtBytW/+CNDnlIzcn2Q3ZyFGl5Tb3/mwJNw6za6wpQPrHHGUcAB12H4Ksyk6Km
 xQT3YW99GdCYbP5i45XYN86D8qrCfIrwr9Iis4WqzuUdr7Cd/EghMzVMU/I4Omp6lRZYNVeyoMm
 BgossYu397Qrx1btaJeClfuLNVNDsKjDMYDMZWoeTvxm7U71svtl+XGBV2Mtb++3IfxrIwgQG71
 4xCd0A7AvdTwJZGdz1vE8S3O8HCfkixO9R9bUCB6UcKmKt0p9FNFGjrXA6LjSZvhno84KyCJ4bD
 386NmRCepZWZ6n92jXXAok0gCHZE3Zc2UqcMOeCSQVFxVaCFQih9JS+U/6OZG3C5NHyOhk1N7CS
 qx/70QxYxcZxggBSLh/cLW/syTHy5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300061
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



On 7/17/25 21:15, Raphael Gallais-Pou wrote:
> The display subsystem represent how IPs are interacting together and
> have nothing to do within the SoC node.
> 
> Extract it from the SoC node and let IPs nodes in the Soc node.
> 
> Several nodes did not use conventional name:
>  * sti-display-subsystem -> display-subsystem
>  * sti-controller -> display-controller
>  * sti-tvout -> encoder
>  * sti-hda -> analog
>  * sti-hqvdp -> plane
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  arch/arm/boot/dts/st/stih410.dtsi | 316 +++++++++++++++++++++++---------------
>  1 file changed, 188 insertions(+), 128 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stih410.dtsi b/arch/arm/boot/dts/st/stih410.dtsi
> index d56343f44fda4e9e1de2e5efc86e2d984bad14b4..47d66d7eb07a3d73d98b3e21d62b2253aa1171e4 100644
> --- a/arch/arm/boot/dts/st/stih410.dtsi
> +++ b/arch/arm/boot/dts/st/stih410.dtsi
> @@ -34,6 +34,41 @@ usb2_picophy2: phy3 {
>  		status = "disabled";
>  	};
>  
> +	display-subsystem {
> +		compatible = "st,sti-display-subsystem";
> +		ports = <&compositor>, <&hqvdp>, <&tvout>, <&sti_hdmi>;
> +
> +		assigned-clocks = <&clk_s_d2_quadfs 0>,
> +				  <&clk_s_d2_quadfs 1>,
> +				  <&clk_s_c0_pll1 0>,
> +				  <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> +				  <&clk_s_c0_flexgen CLK_MAIN_DISP>,
> +				  <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
> +				  <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
> +				  <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> +				  <&clk_s_d2_flexgen CLK_PIX_GDP2>,
> +				  <&clk_s_d2_flexgen CLK_PIX_GDP3>,
> +				  <&clk_s_d2_flexgen CLK_PIX_GDP4>;
> +
> +		assigned-clock-parents = <0>,
> +					 <0>,
> +					 <0>,
> +					 <&clk_s_c0_pll1 0>,
> +					 <&clk_s_c0_pll1 0>,
> +					 <&clk_s_d2_quadfs 0>,
> +					 <&clk_s_d2_quadfs 1>,
> +					 <&clk_s_d2_quadfs 0>,
> +					 <&clk_s_d2_quadfs 0>,
> +					 <&clk_s_d2_quadfs 0>,
> +					 <&clk_s_d2_quadfs 0>;
> +
> +		assigned-clock-rates = <297000000>,
> +				       <297000000>,
> +				       <0>,
> +				       <400000000>,
> +				       <400000000>;
> +	};
> +
>  	soc {
>  		ohci0: usb@9a03c00 {
>  			compatible = "st,st-ohci-300x";
> @@ -99,153 +134,178 @@ ehci1: usb@9a83e00 {
>  			status = "disabled";
>  		};
>  
> -		sti-display-subsystem@0 {
> -			compatible = "st,sti-display-subsystem";
> +		compositor: display-controller@9d11000 {
> +			compatible = "st,stih407-compositor";
> +			reg = <0x9d11000 0x1000>;
> +
> +			clock-names = "compo_main",
> +				      "compo_aux",
> +				      "pix_main",
> +				      "pix_aux",
> +				      "pix_gdp1",
> +				      "pix_gdp2",
> +				      "pix_gdp3",
> +				      "pix_gdp4",
> +				      "main_parent",
> +				      "aux_parent";
> +
> +			clocks = <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> +				 <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> +				 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
> +				 <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
> +				 <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> +				 <&clk_s_d2_flexgen CLK_PIX_GDP2>,
> +				 <&clk_s_d2_flexgen CLK_PIX_GDP3>,
> +				 <&clk_s_d2_flexgen CLK_PIX_GDP4>,
> +				 <&clk_s_d2_quadfs 0>,
> +				 <&clk_s_d2_quadfs 1>;
> +
> +			reset-names = "compo-main", "compo-aux";
> +			resets = <&softreset STIH407_COMPO_SOFTRESET>,
> +				 <&softreset STIH407_COMPO_SOFTRESET>;
> +			st,vtg = <&vtg_main>, <&vtg_aux>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					compo_main_out: endpoint {
> +						remote-endpoint = <&tvout_in0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					compo_aux_out: endpoint {
> +						remote-endpoint = <&tvout_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tvout: encoder@8d08000 {
> +			compatible = "st,stih407-tvout";
> +			reg = <0x8d08000 0x1000>;
> +			reg-names = "tvout-reg";
> +			reset-names = "tvout";
> +			resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
> +					  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
> +					  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> +					  <&clk_s_d0_flexgen CLK_PCM_0>,
> +					  <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
> +					  <&clk_s_d2_flexgen CLK_HDDAC>;
>  
> -			reg = <0 0>;
> -			assigned-clocks = <&clk_s_d2_quadfs 0>,
> -					  <&clk_s_d2_quadfs 1>,
> -					  <&clk_s_c0_pll1 0>,
> -					  <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> -					  <&clk_s_c0_flexgen CLK_MAIN_DISP>,
> -					  <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
> -					  <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
> -					  <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> -					  <&clk_s_d2_flexgen CLK_PIX_GDP2>,
> -					  <&clk_s_d2_flexgen CLK_PIX_GDP3>,
> -					  <&clk_s_d2_flexgen CLK_PIX_GDP4>;
> -
> -			assigned-clock-parents = <0>,
> -						 <0>,
> -						 <0>,
> -						 <&clk_s_c0_pll1 0>,
> -						 <&clk_s_c0_pll1 0>,
> -						 <&clk_s_d2_quadfs 0>,
> -						 <&clk_s_d2_quadfs 1>,
> -						 <&clk_s_d2_quadfs 0>,
> +			assigned-clock-parents = <&clk_s_d2_quadfs 0>,
> +						 <&clk_tmdsout_hdmi>,
>  						 <&clk_s_d2_quadfs 0>,
> +						 <&clk_s_d0_quadfs 0>,
>  						 <&clk_s_d2_quadfs 0>,
>  						 <&clk_s_d2_quadfs 0>;
>  
> -			assigned-clock-rates = <297000000>,
> -					       <297000000>,
> -					       <0>,
> -					       <400000000>,
> -					       <400000000>;
> -
> -			ranges;
> -
> -			sti-compositor@9d11000 {
> -				compatible = "st,stih407-compositor";
> -				reg = <0x9d11000 0x1000>;
> -
> -				clock-names = "compo_main",
> -					      "compo_aux",
> -					      "pix_main",
> -					      "pix_aux",
> -					      "pix_gdp1",
> -					      "pix_gdp2",
> -					      "pix_gdp3",
> -					      "pix_gdp4",
> -					      "main_parent",
> -					      "aux_parent";
> -
> -				clocks = <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> -					 <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> -					 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
> -					 <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
> -					 <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> -					 <&clk_s_d2_flexgen CLK_PIX_GDP2>,
> -					 <&clk_s_d2_flexgen CLK_PIX_GDP3>,
> -					 <&clk_s_d2_flexgen CLK_PIX_GDP4>,
> -					 <&clk_s_d2_quadfs 0>,
> -					 <&clk_s_d2_quadfs 1>;
> -
> -				reset-names = "compo-main", "compo-aux";
> -				resets = <&softreset STIH407_COMPO_SOFTRESET>,
> -					 <&softreset STIH407_COMPO_SOFTRESET>;
> -				st,vtg = <&vtg_main>, <&vtg_aux>;
> -			};
> -
> -			sti-tvout@8d08000 {
> -				compatible = "st,stih407-tvout";
> -				reg = <0x8d08000 0x1000>;
> -				reg-names = "tvout-reg";
> -				reset-names = "tvout";
> -				resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
> +			ports {
>  				#address-cells = <1>;
> -				#size-cells = <1>;
> -				assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
> -						  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
> -						  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> -						  <&clk_s_d0_flexgen CLK_PCM_0>,
> -						  <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
> -						  <&clk_s_d2_flexgen CLK_HDDAC>;
> +				#size-cells = <0>;
>  
> -				assigned-clock-parents = <&clk_s_d2_quadfs 0>,
> -							 <&clk_tmdsout_hdmi>,
> -							 <&clk_s_d2_quadfs 0>,
> -							 <&clk_s_d0_quadfs 0>,
> -							 <&clk_s_d2_quadfs 0>,
> -							 <&clk_s_d2_quadfs 0>;
> +				port@0 {
> +					reg = <0>;
> +					tvout_in0: endpoint {
> +						remote-endpoint = <&compo_main_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					tvout_in1: endpoint {
> +						remote-endpoint = <&compo_aux_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					tvout_out0: endpoint {
> +						remote-endpoint = <&hdmi_in>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					tvout_out1: endpoint {
> +						remote-endpoint = <&hda_in>;
> +					};
> +				};
>  			};
> +		};
>  
> -			sti_hdmi: sti-hdmi@8d04000 {
> -				compatible = "st,stih407-hdmi";
> -				reg = <0x8d04000 0x1000>;
> -				reg-names = "hdmi-reg";
> -				#sound-dai-cells = <0>;
> -				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> -				interrupt-names = "irq";
> -				clock-names = "pix",
> -					      "tmds",
> -					      "phy",
> -					      "audio",
> -					      "main_parent",
> -					      "aux_parent";
> +		sti_hdmi: hdmi@8d04000 {
> +			compatible = "st,stih407-hdmi";
> +			reg = <0x8d04000 0x1000>;
> +			reg-names = "hdmi-reg";
> +			#sound-dai-cells = <0>;
> +			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "irq";
> +			clock-names = "pix",
> +				      "tmds",
> +				      "phy",
> +				      "audio",
> +				      "main_parent",
> +				      "aux_parent";
>  
> -				clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
> -					 <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
> -					 <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> -					 <&clk_s_d0_flexgen CLK_PCM_0>,
> -					 <&clk_s_d2_quadfs 0>,
> -					 <&clk_s_d2_quadfs 1>;
> +			clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
> +				 <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
> +				 <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> +				 <&clk_s_d0_flexgen CLK_PCM_0>,
> +				 <&clk_s_d2_quadfs 0>,
> +				 <&clk_s_d2_quadfs 1>;
>  
> -				hdmi,hpd-gpio = <&pio5 3 GPIO_ACTIVE_LOW>;
> -				reset-names = "hdmi";
> -				resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
> -				ddc = <&hdmiddc>;
> +			hdmi,hpd-gpio = <&pio5 3 GPIO_ACTIVE_LOW>;
> +			reset-names = "hdmi";
> +			resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
> +			ddc = <&hdmiddc>;
> +
> +			port {
> +				hdmi_in: endpoint {
> +					remote-endpoint = <&tvout_out0>;
> +				};
>  			};
> +		};
>  
> -			sti-hda@8d02000 {
> -				compatible = "st,stih407-hda";
> -				status = "disabled";
> -				reg = <0x8d02000 0x400>, <0x92b0120 0x4>;
> -				reg-names = "hda-reg", "video-dacs-ctrl";
> -				clock-names = "pix",
> -					      "hddac",
> -					      "main_parent",
> -					      "aux_parent";
> -				clocks = <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
> -					 <&clk_s_d2_flexgen CLK_HDDAC>,
> -					 <&clk_s_d2_quadfs 0>,
> -					 <&clk_s_d2_quadfs 1>;
> -			};
> +		analog@8d02000 {
> +			compatible = "st,stih407-hda";
> +			status = "disabled";
> +			reg = <0x8d02000 0x400>, <0x92b0120 0x4>;
> +			reg-names = "hda-reg", "video-dacs-ctrl";
> +			clock-names = "pix",
> +				      "hddac",
> +				      "main_parent",
> +				      "aux_parent";
> +			clocks = <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
> +				 <&clk_s_d2_flexgen CLK_HDDAC>,
> +				 <&clk_s_d2_quadfs 0>,
> +				 <&clk_s_d2_quadfs 1>;
>  
> -			sti-hqvdp@9c00000 {
> -				compatible = "st,stih407-hqvdp";
> -				reg = <0x9C00000 0x100000>;
> -				clock-names = "hqvdp", "pix_main";
> -				clocks = <&clk_s_c0_flexgen CLK_MAIN_DISP>,
> -					 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>;
> -				reset-names = "hqvdp";
> -				resets = <&softreset STIH407_HDQVDP_SOFTRESET>;
> -				st,vtg = <&vtg_main>;
> +			port {
> +				hda_in: endpoint {
> +					remote-endpoint = <&tvout_out1>;
> +				};
>  			};
>  		};
>  
> +		hqvdp: plane@9c00000 {
> +			compatible = "st,stih407-hqvdp";
> +			reg = <0x9C00000 0x100000>;
> +			clock-names = "hqvdp", "pix_main";
> +			clocks = <&clk_s_c0_flexgen CLK_MAIN_DISP>,
> +				 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>;
> +			reset-names = "hqvdp";
> +			resets = <&softreset STIH407_HDQVDP_SOFTRESET>;
> +			st,vtg = <&vtg_main>;
> +		};
> +
>  		bdisp0:bdisp@9f10000 {
>  			compatible = "st,stih407-bdisp";
>  			reg = <0x9f10000 0x1000>;
> 
Acked-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
PAtrice
