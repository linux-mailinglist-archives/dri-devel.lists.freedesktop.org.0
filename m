Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DC6CCD5D5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B0610E09E;
	Thu, 18 Dec 2025 19:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="bXMOSJYT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE62610E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:19:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIgOln2977349; Thu, 18 Dec 2025 19:45:09 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4780bqp7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:45:09 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxDAK+7fh1cOLd81EGe37fKP/AzjzTxFjd/ZS7OY5zkeX+istcMiXtO5R0+gkdfdf9WAgdTpYrtiTdq0ZvfrNXculShX+hj4kxeYKd55Y8hnbKFZVNF3T4IYB+rGzKnUIDzOq4xDGpwEl8ictlv8gIuyHUmMDiZ8J2C/pR1JXGbXOQsxm3zSL3NHcEViyZPfIR6MlIuZgGUS90IiOaCVnqFc+9FwXXFnfiQ8RDBeJoi+hhEolaBQ2ZsYNiW38ZJZFKFiIGc25xwQtocqnDRl5m3TTLdbY4M5Epd9ZCbaW/mMmv3RExdd+YPfzWALZGqOT/2EBlVrjZy2dFvV4zQZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+UmFbYYN3CxlFK8VsJ+1lfir2OVAP9Ro5yh0yhCoTM=;
 b=qJ/asqaG1wab+vd4KQrSF9OIdAwRB7WbuNDowikRA+F8scM4V3L9sumfy1oF3k0C1wO1qV3w7sfAt5RjgSeYlPN10XS8tsv87cVRFbiyi7xVcqrO9GdEcalL5WxSKLtCiLHYLNOqEnQSVjO/ncnH3+z/G1oFIP+GJ39TaPmEPcL3c0JHH+54WgU0eV1zZWdsYEJYK15uufmwN+g08ZAPubu8q3Ht6E7vEmdbMmunYsrmIR1VB1JkRWCTtPaU8H0tHT6rLnAZQYRPXkdLjyCydxyvmyVZ9WkNMa+IrwaMEji141cm5+6CUyxUpr5xvU5GnoY8GaK/0Vrar4qZPw1mUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+UmFbYYN3CxlFK8VsJ+1lfir2OVAP9Ro5yh0yhCoTM=;
 b=bXMOSJYT/d2b0HsoWVYr+rdFsng/U0Sui6b4Wtn2OkskHUwpXWc6VUjKFRXQs3Ol8Jc4cTEyUOrLTpCztkfVw797zyH4v8kOnoSFdc2xhFXr0JGewu2TaeK224rfaaEAIozuMqL9G+S79V1a2wgqolg7NfGQzWhNjJNB8TM2fn8TY4TqM3nM6Gl6B+03C0YfqKBaB86r21IjSKfsvCBPWcgvFs1DWMrnwKNwKrOLAhMoKjDC7zM8+s66fEJHyGXkTq6qjxdfqMtgqwrFR2hH2undzTg2yYEro7nSO49NEIuo1/aGIux0yLHLcRWygeC5vvrsAE0/Z+NaE7IHI1/w9Q==
Received: from CWLP265CA0299.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::23)
 by DB9PR10MB7625.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:45:04 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:401:5d:cafe::f9) by CWLP265CA0299.outlook.office365.com
 (2603:10a6:401:5d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:45:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:45:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:45 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:59 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:50 +0100
Subject: [PATCH 10/12] media: stm32: dcmi: addition of DMA-MDMA chaining
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-10-39948ca6cbf6@foss.st.com>
References: <20251218-stm32-dcmi-dma-chaining-v1-0-39948ca6cbf6@foss.st.com>
In-Reply-To: <20251218-stm32-dcmi-dma-chaining-v1-0-39948ca6cbf6@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.7]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|DB9PR10MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf97c6e-faca-4521-2d4e-08de3e658f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkpkOG4zcHpTSnRuOG1Jem9LajR3QUZ5Nnd4ZGpnUGFMQ25yK0VUeGZSTDUr?=
 =?utf-8?B?ZllPc29mT2Y2SkREeklpeVN1RVZuTGdpM0tWRGFiK1R5SzEwVTZZREVUNEd2?=
 =?utf-8?B?ZGNYWVpBK1BlTkpTMk1GMlhrWTlsUGhHSWRPdVBWdisvN2ZlNm1yRk1EZmp2?=
 =?utf-8?B?MlpZT29GQzIrNEZrOTNpdXJBbHA0clMweTlOb2U3MS9RVW11NEFLeit4aHRw?=
 =?utf-8?B?QnJVYzRvVVJWWVFmeVRvSGlCSHB2MTVINHg4aWVCNlM2MDNQYzAyeWdJa2ZU?=
 =?utf-8?B?UjAvdGZOeXJ6VGJ2SUhFZ29PMTB0azNWUnFIWkhWZ3hnb21vdEZpb0NWb3h1?=
 =?utf-8?B?M0ZYNGg2Z1I4WUh2V0xzSmVYdkM3N0g1ZE9PZXpORFdRaHVRUE1qS0VJV0da?=
 =?utf-8?B?TEU0SGRCQmtZMzVreTd5djhNaGk4UUxvTU5MY2tLVDZzY3E5Y2txdnJUb1Z4?=
 =?utf-8?B?b1NTNFRuak1Ld291WkIxc2QyeXVZNG42Y09XL3d5MUdJVDcxbUczQ0kxOFJ6?=
 =?utf-8?B?bWlIaXVjOUpGd29vZ0hCTW43WGpBSWtKc2pWQ0pVTzZ4SXl2emdTMk42K0Vj?=
 =?utf-8?B?YmlXZjNKSHFHOWVNcWk0VEV0cEU2aDNDbWw3ZDRQRXppWE9sZmRvQXgzNWgr?=
 =?utf-8?B?N3NSbi9rdnJkWnRVb1JsSHFNVTdBN0t4bTUvdjhFazV1UjRrdXluYU5WbkdX?=
 =?utf-8?B?VDFLVFArQ3FoTEJ3dmtCMkVsNFdYYWtzb1I3U2Npa3N1YVlVZzBFaTFXcS9E?=
 =?utf-8?B?Z0tRNERsOFArbFUwRWlkdjI1N3Q4bUxSMU5KbVRQUzc5VldYbjRjT09OMGR6?=
 =?utf-8?B?NThTeDNjRndIdzExMlJxS0hxMHE1eFpqZzhMcitncytPVTZHUitSUTNXOGl6?=
 =?utf-8?B?a3V5RVpwT3ZBZlNoNXp2aGE0c0NlejJia3BKbzdrbEN1ZWVFUlBET2RNOFNl?=
 =?utf-8?B?Y2E2eEFGbWRpZWhHYXRuR3ppTXZVL2pwenNZOS92dVN6dFdkMVdhL2c5UVky?=
 =?utf-8?B?eE9zaHlRdHU4Tld4MURBSEdSbSszaDc1RkhkMDE3WW94UmpHaXdzbnVQQzVT?=
 =?utf-8?B?NllpTFBFZ29VNkxEM2dzaTBYTXlNRFNodHRGK3M0S1BoT2dDMlN6bGgwVVlh?=
 =?utf-8?B?bXQwTzFuaTJlbkRMSU9kYnBvdFZkbGNkbmhHNDA0QWFLRGVXVHhYYWhBL3Fh?=
 =?utf-8?B?MjlWRXd5Ri91bEtNN3BhUlo2TVljYXV2OEdoN05BTlpsRExpQ1lvRUp3SCtV?=
 =?utf-8?B?V21udFR3ZSs2ZHFiQ2VCUys3SUdGV0svajVOOGFaZTJqdFVGYWMrdUh0bEJ3?=
 =?utf-8?B?dTRFdEVZc0JHNUx0VktqR005MEYrVnZScmpBdmdmbmQ4R3dLSkJlRmxHK2hx?=
 =?utf-8?B?amFXMjZlbFREbTJhSDFBeHNtU2czb08vTk8zOEJvZ05uOGoxendrSjdWWnJt?=
 =?utf-8?B?aXRuVWZ1aEttQUFTQmpzUDltcWFIWGlBT3RmWisxeDVsY0FSNmZOTmJWMXhC?=
 =?utf-8?B?Y3NtWTdXNkJUYk9zUy8wcUR1YkRGR2RoaitwSnd3dUtycDgyVll5eDZMZ3Jn?=
 =?utf-8?B?MERWSnR2YldzY1lVZHo2NnJQcXN6N0xpMU05ZzdFZWRiR2toVHRnVjJISkw4?=
 =?utf-8?B?NHcvU01XYWhERXBVT1pFVG5FbUpoN2J3dUJVSS9yNGJKSDA1TEkveENmdGdJ?=
 =?utf-8?B?TzdQdGt5aXVDYVM3MlByRkNJa0cwWXZ0MllkaEwyRGdXazJJdVYvd3M4Wlg5?=
 =?utf-8?B?SGhKV2VOS2o2Y04za1E5Vm1RMlpaSjZBbWVzNXR0Smx0ZFBXQ1pvOFVDa1pU?=
 =?utf-8?B?WCtaTXNnQnhDdGJ5MFp0S1F3ZlBTcTVIY1ozeEluajE5SVJ3bUtaZFlidEs3?=
 =?utf-8?B?Y0Jod0lJQllBRlVieVgzcTN2aHg4WkpwZjdURUZzU2QzWjRKdm5FK3dKL3FD?=
 =?utf-8?B?cTR1SjV0R2hNUFMwTUVLeloxZTFJVW04YXdaTzQxRjQxL3VFZGF6alNYaXVM?=
 =?utf-8?B?emhRQVlRTkVnVXRNOGMvQjN6L0JETlc1STZnU21HS1pmdTNSb1RaNlVQcUpp?=
 =?utf-8?B?Q3BRRENlbnhENXJCWWM0Rm5NZTNncVpKWmlVWWsxTXRQaEo2OHhib1BNMTlz?=
 =?utf-8?Q?HuFo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:45:04.6701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf97c6e-faca-4521-2d4e-08de3e658f2a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7625
X-Proofpoint-ORIG-GUID: RW_rGFsSHQKAhglntLsS1tjoQ4TyD44H
X-Authority-Analysis: v=2.4 cv=PuqergM3 c=1 sm=1 tr=0 ts=69444bb5 cx=c_pps
 a=T8SiPzmgzFXCf1C+o6d1PA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=lfp9Q9lF5-ry6RQ8HC8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: RW_rGFsSHQKAhglntLsS1tjoQ4TyD44H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfX1UfLTuVv3yOH
 mEnAMtxlQewnWwYBdcIQido2QAWiJ/vdEhXSkVlLHGIxCIflVse8gthCK/9E6GWIoaqvm7fc+M2
 d18AvHMna/kMfOTBQPsr810BqE/pLDB+jUaJ3bERxbkYPPopNF+ih/IrpMCRzA6ft4hBJq9xtzc
 PyCCBuj3eda+YAvDM5rteDQqV5YeokOm9P70ZlvcuZXV8whkSbCOnEieAsum2rHXV0q3vl6n3EM
 KJQx3GnLIcQ5/rOCSm3mzPQxPySgeUKJK6C8MKZeLfnYVXGrIAbNLBiqwBrJZjUnfaeV+XpDjBr
 fUjt3cAHD+gEZ9DqARLeKqU2MjgUB+uiZxq+TbvIBiarU2DaI2p7BR3swtJwqyDQUWbcPkz5X+v
 4fPYHZN5SuQ+C4jraLNpdkMzspyMYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180155
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

Add possibility to rely on an additional MDMA channel and chain
the DMA and MDMA channels allowing to achieve faster capture.
Indeed, on the MP15 platform, the MDMA engine has an higher
bandwidth to the DDR than the DMA engine.  Relying on that
it is possible to capture frames from the DCMI IP into the DDR
by using two channels as follow:

  DCMI -> (DMA) -> SRAM -> (MDMA) -> DDR

The DMA is able by himself to trigger a MDMA request hence, once
properly configured, the DCMI IP can simply trigger the DMA in order
to have the data pushed up to the DDR (via the SRAM and a MDMA
channel).

This behavior is detailed in the document
Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 250 +++++++++++++++++++++++----
 1 file changed, 220 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 4c0f8ed0f87e..e4a9f96a989b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -15,6 +15,7 @@
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
+#include <linux/genalloc.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -113,7 +114,9 @@ struct dcmi_buf {
 	struct vb2_v4l2_buffer	vb;
 	bool			prepared;
 	struct sg_table		sgt;
+	struct sg_table		sgt_mdma;
 	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_async_tx_descriptor *mdma_desc;
 	size_t			size;
 	struct list_head	list;
 };
@@ -159,6 +162,15 @@ struct stm32_dcmi {
 	struct dma_chan			*dma_chan;
 	dma_cookie_t			dma_cookie;
 	u32				dma_max_burst;
+
+	/* Elements for the MDMA - DMA chaining */
+	struct gen_pool			*sram_pool;
+	struct dma_chan			*mdma_chan;
+	void				*sram_buf;
+	u32				sram_buf_size;
+	dma_addr_t			sram_dma_buf;
+	dma_cookie_t			mdma_cookie;
+
 	u32				misr;
 	int				errors_count;
 	int				overrun_count;
@@ -247,12 +259,22 @@ static int dcmi_start_dma(struct stm32_dcmi *dcmi,
 			  struct dcmi_buf *buf)
 {
 	/* Push current DMA transaction in the pending queue */
+	if (dcmi->mdma_chan) {
+		dcmi->mdma_cookie = dmaengine_submit(buf->mdma_desc);
+		if (dma_submit_error(dcmi->mdma_cookie)) {
+			dev_err(dcmi->dev, "%s: MDMA submission failed\n", __func__);
+			return -ENXIO;
+		}
+	}
+
 	dcmi->dma_cookie = dmaengine_submit(buf->dma_desc);
 	if (dma_submit_error(dcmi->dma_cookie)) {
 		dev_err(dcmi->dev, "%s: DMA submission failed\n", __func__);
 		return -ENXIO;
 	}
 
+	if (dcmi->mdma_chan)
+		dma_async_issue_pending(dcmi->mdma_chan);
 	dma_async_issue_pending(dcmi->dma_chan);
 
 	return 0;
@@ -301,7 +323,9 @@ static void dcmi_set_crop(struct stm32_dcmi *dcmi)
 
 static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 {
-	struct dma_tx_state state;
+	struct dma_tx_state state, state_dma;
+	size_t bytes_used;
+
 	enum dma_status status;
 	struct dcmi_buf *buf = dcmi->active;
 
@@ -309,23 +333,36 @@ static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 		return;
 
 	/*
-	 * At the time FRAME interrupt is received, all dma req have been sent to the DMA,
-	 * however DMA might still be transferring data hence first synchronize prior to
-	 * getting the status of the DMA transfer.
-	 * Then DMA tx status gives the amount of data transferred to memory, which is then
-	 * returned to V4L2 through the active buffer payload.
+	 * Pause the DMA transfer, leading to trigger of the MDMA channel read while
+	 * keeping a valid residue value on the dma channel
 	 */
+	if (dcmi->mdma_chan) {
+		spin_unlock_irq(&dcmi->irqlock);
+		dmaengine_pause(dcmi->dma_chan);
+		spin_lock_irq(&dcmi->irqlock);
+
+		do {
+			status = dmaengine_tx_status(dcmi->mdma_chan, dcmi->mdma_cookie, &state);
+			cpu_relax();
+		} while (status != DMA_ERROR && status != DMA_COMPLETE &&
+			 state.residue && state.in_flight_bytes);
+	} else {
+		status = dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state);
+	}
 
-	spin_unlock_irq(&dcmi->irqlock);
-	/* Drain DMA */
-	dmaengine_synchronize(dcmi->dma_chan);
-	spin_lock_irq(&dcmi->irqlock);
-
-	/* Get DMA status and residue size */
-	status = dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state);
 	if (status != DMA_ERROR && state.residue < buf->size) {
+		bytes_used = buf->size - state.residue;
+
+		if (state.residue && dcmi->mdma_chan) {
+			dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state_dma);
+			/* Getting full size residue equal to no residue */
+			if (state_dma.residue == dcmi->sram_buf_size)
+				state_dma.residue = 0;
+			bytes_used -= state_dma.residue;
+		}
+
 		/* Return buffer to V4L2 with received data size */
-		dcmi_buffer_done(dcmi, buf, buf->size - state.residue, 0);
+		dcmi_buffer_done(dcmi, buf, bytes_used, 0);
 	} else {
 		dcmi->errors_count++;
 		dev_err(dcmi->dev, "%s: DMA error. status: 0x%x, residue: %d\n",
@@ -336,6 +373,8 @@ static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 
 	/* Abort DMA operation */
 	dmaengine_terminate_async(dcmi->dma_chan);
+	if (dcmi->mdma_chan)
+		dmaengine_terminate_async(dcmi->mdma_chan);
 }
 
 static irqreturn_t dcmi_irq_thread(int irq, void *arg)
@@ -354,13 +393,15 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 			dcmi->errors_count++;
 
 		dmaengine_terminate_async(dcmi->dma_chan);
+		if (dcmi->mdma_chan)
+			dmaengine_terminate_async(dcmi->mdma_chan);
 
 		if (dcmi_restart_capture(dcmi))
 			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
 		spin_unlock_irq(&dcmi->irqlock);
-
 		return IRQ_HANDLED;
 	}
+
 	if (dcmi->misr & IT_ERR)
 		dcmi->errors_count++;
 
@@ -447,28 +488,70 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 	vb2_set_plane_payload(vb, 0, size);
 
 	if (!buf->prepared) {
+		u32 max_size = dcmi->dma_max_burst;
+		unsigned int dma_nents;
+
 		/* Get memory addresses */
 		buf->size = vb2_plane_size(&buf->vb.vb2_buf, 0);
-		if (buf->size > dcmi->dma_max_burst)
-			num_sgs = DIV_ROUND_UP(buf->size, dcmi->dma_max_burst);
+		if (dcmi->mdma_chan)
+			max_size = dcmi->sram_buf_size / 2;
 
-		ret = sg_alloc_table(&buf->sgt, num_sgs, GFP_ATOMIC);
+		if (buf->size > max_size)
+			num_sgs = DIV_ROUND_UP(buf->size, max_size);
+
+		/*
+		 * If we use MDMA chaining, DMA is used in cyclic mode and the scatterlist
+		 * maximum size is thus 2
+		 */
+		dma_nents = num_sgs;
+		if (dcmi->mdma_chan)
+			dma_nents = min_t(unsigned int, num_sgs, 2);
+
+		ret = sg_alloc_table(&buf->sgt, dma_nents, GFP_ATOMIC);
 		if (ret) {
-			dev_err(dcmi->dev, "sg table alloc failed\n");
+			dev_err(dcmi->dev, "sg table alloc failed for DMA\n");
 			return ret;
 		}
 
+		if (dcmi->mdma_chan) {
+			ret = sg_alloc_table(&buf->sgt_mdma, num_sgs, GFP_ATOMIC);
+			if (ret) {
+				dev_err(dcmi->dev, "sg table alloc failed for MDMA\n");
+				return ret;
+			}
+		}
+
 		dma_buf = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 
 		dev_dbg(dcmi->dev, "buffer[%d] phy=%pad size=%zu\n",
 			vb->index, &dma_buf, buf->size);
 
-		for_each_sg(buf->sgt.sgl, sg, num_sgs, i) {
-			size_t bytes = min_t(size_t, size, dcmi->dma_max_burst);
+		for_each_sg(buf->sgt.sgl, sg, dma_nents, i) {
+			size_t bytes = min_t(size_t, size, max_size);
+
+			if (!dcmi->mdma_chan) {
+				sg_dma_address(sg) = dma_buf;
+				dma_buf += bytes;
+			} else {
+				/* Targets the beginning = first half of the sram_buf */
+				sg_dma_address(sg) = dcmi->sram_dma_buf;
+				/*
+				 * Targets the second half of the sram_bubf
+				 * for odd indexes of the item of the sg_list
+				 */
+				if (i & 1)
+					sg->dma_address += (dcmi->sram_buf_size / 2);
+			}
+			/*
+			 * In case of DMA-MDMA chaining, since the DMA is working in cyclic mode,
+			 * we need to provide two linked-list node of same size in order to have
+			 * a correct residue value computed.
+			 */
+			if (!dcmi->mdma_chan)
+				sg_dma_len(sg) = bytes;
+			else
+				sg_dma_len(sg) = dcmi->sram_buf_size / 2;
 
-			sg_dma_address(sg) = dma_buf;
-			sg_dma_len(sg) = bytes;
-			dma_buf += bytes;
 			size -= bytes;
 		}
 
@@ -480,6 +563,8 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 							DMA_PREP_INTERRUPT);
 		if (!buf->dma_desc) {
 			dev_err(dcmi->dev, "%s: DMA dmaengine_prep_slave_sg failed\n", __func__);
+			if (dcmi->mdma_chan)
+				sg_free_table(&buf->sgt_mdma);
 			sg_free_table(&buf->sgt);
 			return -EIO;
 		}
@@ -489,10 +574,48 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 		if (ret) {
 			dev_err(dcmi->dev, "%s: DMA dmaengine_desc_set_reuse failed\n", __func__);
 			dmaengine_desc_free(buf->dma_desc);
+			if (dcmi->mdma_chan)
+				sg_free_table(&buf->sgt_mdma);
 			sg_free_table(&buf->sgt);
 			return -EIO;
 		}
 
+		if (dcmi->mdma_chan) {
+			size = dcmi->fmt.fmt.pix.sizeimage;
+			for_each_sg(buf->sgt_mdma.sgl, sg, num_sgs, i) {
+				size_t bytes = min_t(size_t, size, max_size);
+
+				sg_dma_address(sg) = dma_buf;
+				sg_dma_len(sg) = bytes;
+				dma_buf += bytes;
+				size -= bytes;
+			}
+
+			buf->mdma_desc = dmaengine_prep_slave_sg(dcmi->mdma_chan, buf->sgt_mdma.sgl,
+								 buf->sgt_mdma.nents,
+								 DMA_DEV_TO_MEM,
+								 DMA_PREP_INTERRUPT);
+			if (!buf->mdma_desc) {
+				dev_err(dcmi->dev, "%s: failed dmaengine_prep_slave_sg for MDMA\n",
+					__func__);
+				dmaengine_desc_free(buf->dma_desc);
+				sg_free_table(&buf->sgt_mdma);
+				sg_free_table(&buf->sgt);
+				return -EIO;
+			}
+
+			ret = dmaengine_desc_set_reuse(buf->mdma_desc);
+			if (ret) {
+				dev_err(dcmi->dev, "%s: failed to set reuse for mdma desc\n",
+					__func__);
+				dmaengine_desc_free(buf->mdma_desc);
+				dmaengine_desc_free(buf->dma_desc);
+				sg_free_table(&buf->sgt_mdma);
+				sg_free_table(&buf->sgt);
+				return -EIO;
+			}
+		}
+
 		buf->prepared = true;
 
 		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->size);
@@ -511,6 +634,14 @@ static void dcmi_buf_cleanup(struct vb2_buffer *vb)
 	if (!buf->prepared)
 		return;
 
+	if (dcmi->mdma_chan) {
+		ret = dmaengine_desc_free(buf->mdma_desc);
+		if (ret)
+			dev_err(dcmi->dev, "%s: Failed to free the mdma descriptor (0x%x)\n",
+				__func__, ret);
+		sg_free_table(&buf->sgt_mdma);
+	}
+
 	ret = dmaengine_desc_free(buf->dma_desc);
 	if (ret)
 		dev_err(dcmi->dev, "%s: Failed to free the mdma descriptor (0x%x)\n",
@@ -816,6 +947,8 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 
 	/* Stop all pending DMA operations */
 	dmaengine_terminate_sync(dcmi->dma_chan);
+	if (dcmi->mdma_chan)
+		dmaengine_terminate_sync(dcmi->mdma_chan);
 
 	pm_runtime_put(dcmi->dev);
 
@@ -1824,9 +1957,9 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	struct stm32_dcmi *dcmi;
 	struct vb2_queue *q;
-	struct dma_chan *chan;
+	struct dma_chan *chan, *mdma_chan;
 	struct dma_slave_caps caps;
-	struct dma_slave_config dma_config;
+	struct dma_slave_config dma_config, mdma_config;
 	struct clk *mclk;
 	int ret = 0;
 
@@ -1888,15 +2021,21 @@ static int dcmi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(chan),
 				     "Failed to request DMA channel\n");
 
-	dcmi->dma_max_burst = UINT_MAX;
-	ret = dma_get_slave_caps(chan, &caps);
-	if (!ret && caps.max_sg_burst)
-		dcmi->dma_max_burst = caps.max_sg_burst	* DMA_SLAVE_BUSWIDTH_4_BYTES;
+	mdma_chan = dma_request_chan(&pdev->dev, "mdma_tx");
+	if (IS_ERR(mdma_chan)) {
+		ret = PTR_ERR(mdma_chan);
+		if (ret != -ENODEV)
+			return dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
+		mdma_chan = NULL;
+	}
 
+	/* Configure the DMA channel */
 	memset(&dma_config, 0, sizeof(dma_config));
 
 	dma_config.src_addr = (dma_addr_t)dcmi->res->start + DCMI_DR;
 	dma_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	if (mdma_chan)
+		dma_config.peripheral_size = 1; /* Indicates chaining */
 
 	/* Configure DMA channel */
 	ret = dmaengine_slave_config(chan, &dma_config);
@@ -1906,6 +2045,47 @@ static int dcmi_probe(struct platform_device *pdev)
 		goto err_dma_slave_config;
 	}
 
+	/* If we want MDMA, we also need a sram pool */
+	if (mdma_chan) {
+		dcmi->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+		if (!dcmi->sram_pool) {
+			dev_info(&pdev->dev, "No SRAM pool, can't use MDMA chaining\n");
+			goto err_dma_slave_config;
+		}
+
+		dev_info(&pdev->dev, "SRAM pool: %zu KiB for DMA/MDMA chaining\n",
+			 gen_pool_size(dcmi->sram_pool) / 1024);
+
+		dcmi->sram_buf_size = gen_pool_size(dcmi->sram_pool);
+		dcmi->sram_buf = gen_pool_dma_zalloc(dcmi->sram_pool, dcmi->sram_buf_size,
+						     &dcmi->sram_dma_buf);
+		if (!dcmi->sram_buf) {
+			dev_err(dcmi->dev, "Failed to allocate from SRAM\n");
+			goto err_dma_slave_config;
+		}
+
+		/* Configure the MDMA Channel */
+		memset(&mdma_config, 0, sizeof(mdma_config));
+		mdma_config.direction = DMA_DEV_TO_MEM;
+		mdma_config.src_addr = dcmi->sram_dma_buf;
+		mdma_config.peripheral_size = dma_config.peripheral_size;
+		mdma_config.peripheral_config = dma_config.peripheral_config;
+		ret = dmaengine_slave_config(mdma_chan, &mdma_config);
+		if (ret < 0) {
+			dev_err(dcmi->dev, "%s: MDMA channel config failed (%d)\n",
+				__func__, ret);
+			goto err_mdma_slave_config;
+		}
+	}
+
+	dcmi->dma_max_burst = UINT_MAX;
+	/* In case of using DMA-MDMA chaining we consider the maximum infini */
+	if (!mdma_chan) {
+		ret = dma_get_slave_caps(chan, &caps);
+		if (!ret && caps.max_sg_burst)
+			dcmi->dma_max_burst = caps.max_sg_burst * DMA_SLAVE_BUSWIDTH_4_BYTES;
+	}
+
 	spin_lock_init(&dcmi->irqlock);
 	mutex_init(&dcmi->lock);
 	init_completion(&dcmi->complete);
@@ -1915,6 +2095,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	dcmi->mclk = mclk;
 	dcmi->state = STOPPED;
 	dcmi->dma_chan = chan;
+	dcmi->mdma_chan = mdma_chan;
 
 	q = &dcmi->queue;
 
@@ -2023,8 +2204,13 @@ static int dcmi_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&dcmi->v4l2_dev);
 err_media_device_cleanup:
 	media_device_cleanup(&dcmi->mdev);
+err_mdma_slave_config:
+	if (dcmi->mdma_chan)
+		gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
 err_dma_slave_config:
 	dma_release_channel(dcmi->dma_chan);
+	if (dcmi->mdma_chan)
+		dma_release_channel(mdma_chan);
 
 	return ret;
 }
@@ -2042,6 +2228,10 @@ static void dcmi_remove(struct platform_device *pdev)
 	media_device_cleanup(&dcmi->mdev);
 
 	dma_release_channel(dcmi->dma_chan);
+	if (dcmi->mdma_chan) {
+		gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
+		dma_release_channel(dcmi->mdma_chan);
+	}
 }
 
 static int dcmi_runtime_suspend(struct device *dev)

-- 
2.34.1

