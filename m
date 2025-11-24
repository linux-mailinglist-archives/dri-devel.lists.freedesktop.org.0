Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EDC80D4D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 14:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C8210E2C8;
	Mon, 24 Nov 2025 13:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="aozZyIQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1033 seconds by postgrey-1.36 at gabe;
 Mon, 24 Nov 2025 13:44:46 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304F510E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:44:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AODKSAN2553085; Mon, 24 Nov 2025 14:27:11 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ampp18msk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 24 Nov 2025 14:27:11 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLQDTnUIlCWXsQjZFIPlx0OsEswR30XqeSw3ySpE6EaI6/nWzAoBk6dQvlAhk+uHB0kjyB/bjMVoVKsR6EEcSQWEiIu7A90Tw8V0g0pj1Q6kh7HAlFhYMd/yVPZV4+Aq5Nm2/48EI8FUdOX18HC5YrKWRbJTf9+2gQcIFrZQqnwe2OjLAajVxGSwX57qJgyfOXn+1D1pikIZWBVmb9jCcyrwv6gpXziPXwARJRwZSE/9EqLN2B2M3Avef9jIpw5kCIGwWqZ5PYoe23KagFimKs8vdJrD1+v3ojkroTsFcD0HgHgNjn9WnLz/l352EzecSbLwOKMhYCTOPahI6cO3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L4d7/TBGvAVMuWwDKaNwuans4sDa0Ub8dXOEkOpSZc=;
 b=Z7PcMmsZgFTu0sgxvrbPzlyd1b7ibauaZ0zLqMFIX8cK4QExzL/j1Xv4ZCe9loofq8VDvXGZAi2Ebf3Cde53UK0UBoAE/iOSCQtj7Cl0N4n7gt4Q/lhxmbuUELuVENVqLvsn+RN0LxC5m6ykY5E1iW6ZNKhQ4Gr0DPQ1QuPRMKdNhZdmzQ6qvg+JUPVsTsILdMSxfbzobeINr63QMo6e8Eog3tmgBtbkjT8rO7hrpl42tfFC1WcxJoR2zVVG8S6tYcJMS59TS7wZH174ta+5SG3koKMdni1pk5BSajocmht6KrjaRbDIXZt35P+wJkoIRUJY36aLBhPS4EiNzrd4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5L4d7/TBGvAVMuWwDKaNwuans4sDa0Ub8dXOEkOpSZc=;
 b=aozZyIQGuKvhuMbx18Jtqt839VucKsDCCaY9OPe36glep+dUULDCA8aNtKYxPWqQjNgQlIYWvcHbjr46So2k6+CbdW4t9IyqNmznDfknyc3zsbJxKk7B16bdC3L2nYhNWb8+dN33A5BoAtmOCFCt7wkQwgcPDQbhtAI+bwB8FB2Sdcht2Gxrk4zHl4GTYdavI8Y7xiEzwWSZlxEQARg8YFdtI3qdF1PvSjEnk6xbrG33U4Uiy8WxnE7KW53togTjiPJHMx9rNrifl4eebDc4/xJxfXKMH93tXeR17PlLYqabOnCMS2hbl4pxUnSHiizxLqanuu8t2c+6eA0VeZK27g==
Received: from AS4P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::20)
 by AS1PR10MB5650.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 13:27:08 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::8e) by AS4P192CA0012.outlook.office365.com
 (2603:10a6:20b:5da::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 13:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 13:27:07 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 14:27:39 +0100
Received: from localhost (10.252.8.120) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 14:27:07 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Johan Hovold <johan@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] drm: sti: fix device leaks at component probe
Date: Mon, 24 Nov 2025 14:27:04 +0100
Message-ID: <176399066927.969838.15946277530835988104.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250922122012.27407-1-johan@kernel.org>
References: <20250922122012.27407-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.8.120]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|AS1PR10MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d8aa69-958b-45a1-a674-08de2b5d2a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFVxbnpNTE9aSFF4dHhCREVWdEs0aEFzVndIVldrZWRRaTF5MXV6TE9CSTVx?=
 =?utf-8?B?NE02a1ZGemRUZU1qaU9DWnEzcStOTlNBaDlNWFJkeU9kYlFodUFIUlF3Vjh3?=
 =?utf-8?B?SW4wcHY4Z0dHSUl0b04vNE0wWEVFaGlhSnBtb3hvMjBSQzgwVFpDL0lYbGVU?=
 =?utf-8?B?dWFvbWliSVhMZWg2K3hZUHRJalFVKy9FaGw2dWFRVVpzVVJCREo1aFFuUUdu?=
 =?utf-8?B?amh0NVIwQ2dubFpidTRDWjk1UENQTGhKdE9odjNEeVZPU2JncHJwYWhpM0Vh?=
 =?utf-8?B?TnB2ZmJCL1l3ZHJwbWgwQUc1bnNOQ2RINUN0RWNRM3M5dFpySEdMVE0zU3E5?=
 =?utf-8?B?TXdCeDIvRjZaTzI5bWI2TWlIWUZyTEwxcDVERS9BUithMUc2ekt0bE9rdVpY?=
 =?utf-8?B?cXdSQU1ONjJFNkp1MzRSRk05Yko3ZFlhLzZ4OHl1VzA5bzFTK2c5NlJVUjdk?=
 =?utf-8?B?Y2UzaE1Jcm9SNTg0bTc4Y0FFUWVKa0tPdjROWmRIYWxtN1ZWbUt0cGk5eVEy?=
 =?utf-8?B?RHFTMENTQUFza0N3OUUvRWMyZUZRMWJWOExGZDQ2Uk5tYllvRkdRbzJ2VWlU?=
 =?utf-8?B?N0tJVGlqZjNNdVVxVkk2SHA1d1ovbWFjZllzc1o2eXl5UmR4Z0gyYTBwRjR4?=
 =?utf-8?B?TEpJbHZTd2JNekNJQUFTQ0d6VWd6NzFGTlhubzVmeWNYVmEyZ1ROUE05UktX?=
 =?utf-8?B?VGd1T3FvUUp2WEJNU0tPQlJGUCtVK0xSaURsVHBraThsVlcwNTVoOFhPKzZm?=
 =?utf-8?B?RXZ5ZDV0cjNrMjIvSzNadVVzbjZDOVU5MmNkWjlORytmaTBRZ0FDN3loNzBP?=
 =?utf-8?B?ZWZ3V1lPQjNsRk9ObWxKdnhSNG5hWCtIdHQvaFZianlVcmpYWFpiWHA3OTM2?=
 =?utf-8?B?amo0dG1yUjlqNnBEazBiYTBOZ0JJcjVxVkl5ajNPcjIrdXE0Yk9ONTUzc0hi?=
 =?utf-8?B?OGd6WDMrUzBFYmxjRlhKYlBndjhLQk5OcHN6bFVXOWh1OGQ2VG1jSURSaGVZ?=
 =?utf-8?B?cHdLdWUvaUcrdGhRajhLTGx1VE9oTzRXd3Z5bHowcWVQdS82bEdCMjFXZGhp?=
 =?utf-8?B?aWNQZ0huL25xL29wbE82ZFhQaUhNV1A3RFpBNlg0VGFBZzVVdkxURHNaQ0dX?=
 =?utf-8?B?K2E5WEMrKzFYRmJPSXB2bUZtMXVkekJac3gxdUZWUVBNcHloVTh6UUFEcEVr?=
 =?utf-8?B?QmdSMFM3elA1UVB1MlY4d2cvbWtwa1RSSVdNeGRLNWlocU83aUtXRXhudldm?=
 =?utf-8?B?Z3F6TWVVTjJrRnptNjZhUTRZU0MyTDJ6cWNHSk9wdERLamY0RHZxdENla3VH?=
 =?utf-8?B?RDBOQWh6SkFKRVE2YTRmMjdwV29scTJLKzl5TmFkTXJOTHRWQjI3RFBXL1Zv?=
 =?utf-8?B?bXhVKzVsNGQzN3ZhbnhYdFV1ZFJubVNPQ3pDektrUGZPWWxrRE1vQ1U3WWZh?=
 =?utf-8?B?V3U1d1ZOeERJRFpsbWo4akNxdE9GYU9aRXFGaG9NbE9kT2t0S3cvSGRwb2RL?=
 =?utf-8?B?ZW10WE9vSmw0aVdEdGtMeDhTeE4vb2hqRU52SUlsenNObUViNVFEdFpqUTk4?=
 =?utf-8?B?Tk9ybGZYMVdvbjREQllKUUQ0bTA2UnFBU0dkNUtrZzJBTHJMQ1h6enRMN2ZF?=
 =?utf-8?B?UWt1Zmd0ZWlNcnpSY1ZrK1JSY01xNkUvWmJvWkZMaTEyMjUvWFl4a0FzZ2NI?=
 =?utf-8?B?VTlFeTRlcXhXRXdQelhWZTFHVkxxWjluY0dHUUo1YmdJVUJIaEZiNSttVDh6?=
 =?utf-8?B?QmNUUHIyQVgvRGJOZ0NsSngwUnlPSkhhSlRsYW5CMG9WbGo1Sjk0RU41dmJI?=
 =?utf-8?B?d2dueWtGbDZic0hoZ3R0SkJBUFdPenNaYTE1dmY3THV5NjJEL3ByM2laSDRD?=
 =?utf-8?B?ZURJeGJrWUNudVQ1TmV3Zzk0dmttNktocHMrYTNmSFRmclhWaU9JbHZIUEZJ?=
 =?utf-8?B?UXBrT01Va0JkMU9NdXdLOHl4L2ZxaEZrVFN5c2NtWUUvSVF2VTBrSFJBU28x?=
 =?utf-8?B?NlRmVEl2Z2V0UzRQa0pCL3RBeFZPMjI4T29uaEhvaW1DWEFZMVMxajFoRGdI?=
 =?utf-8?B?bnFQdGxPVnN5c2VqemhQRk9qc1FFN08vYXlEdFE5cXIyejJBc1dKTXRXVFFR?=
 =?utf-8?Q?zRwE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 13:27:07.9075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d8aa69-958b-45a1-a674-08de2b5d2a9a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5650
X-Proofpoint-ORIG-GUID: ydihW6bPtM8pbWFNtkKIeRN4ccCTx8vF
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69245d2f cx=c_pps
 a=xxdOaL8irGPQW3NhSCKIyQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=anivtgf3n30A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Z349-iRFxQ8NQG26efYA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDExOCBTYWx0ZWRfX71SCYcgwAHiK
 cjehK8Y7y/r8OGNn92IhuxNDGZGC4ZlWBqxWFPeP2D4W6DX1btPM3uKcavJVtJjexO9FFjo/3zs
 4a3PmtCCpit+ACumk+PsC8ovOmXtvbGqAL/OQmUxEWiaB+IZjFUjYf/2C69Dd2Elk3Caq3OMOJR
 ehGNtTfdMMQ2nsBBZv8kZE1Tk5oHrn4FOugaKljjjDDStxcllZ1giB/s6dk+Lr2jmCa9S+cmh6E
 kxUaR+BLdLkfT7ZIws2HZ10O9OP8+cELdcuBbiD1/8WZ+j6xuc2DFNRUed4NOCQh9I0j9TQq9Xt
 vI9TD9OFXJjXk9qjx/PoJsnGjftLXw9mq5QhOWuc/uttnTn/dmou2BtYynvZ3+A160YA+mzgsqx
 AsSD83REy3cDXasKZQz19rUjrNSudg==
X-Proofpoint-GUID: ydihW6bPtM8pbWFNtkKIeRN4ccCTx8vF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240118
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


On Mon, 22 Sep 2025 14:20:12 +0200, Johan Hovold wrote:
> Make sure to drop the references taken to the vtg devices by
> of_find_device_by_node() when looking up their driver data during
> component probe.
> 
> Note that holding a reference to a platform device does not prevent its
> driver data from going away so there is no point in keeping the
> reference after the lookup helper returns.
> 
> [...]

Hi Johan,

Applied, thanks!

[1/1] drm: sti: fix device leaks at component probe
      commit: 620a8f131154250f6a64a07d049a4f235d6451a5

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
