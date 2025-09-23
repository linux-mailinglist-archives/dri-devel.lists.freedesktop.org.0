Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B96B952E7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA7310E5BE;
	Tue, 23 Sep 2025 09:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="YnSpUMeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7774310E5BE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:13:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8lHGV003219;
 Tue, 23 Sep 2025 11:12:49 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 499kky4qmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Sep 2025 11:12:49 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBqXtgbPCCbHC7qiTFHSQsU8PXXgsA9PG0NPH3T16+4CbchRNlhfdVRNRUdj4gKmcgi8gDoAX9oPvJgcyq/OriNkK8Zzz2DRsUo+M0dICmWgf1sBjJIn66rH9r5W1otcNg2OU6BlnLLgG9qc8nIhBwzRed/kSffF2hUcaOw0NIYAGrQlCqPABRXR8PkunESMNNcoERLl0BgTeHnEaaJPapWVIRb7mBq6HP98addZE7l41aDNGlw0LA3WhKdJrieGl++OR2MFg60QyCNE+Xwr5N4wTGQazhWc7sKNlU7tMpLggWhuu/v9zFaio+UZMSEHs62FHUyzyzW+lZMQ5Rv9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go+eP5j17bqvT4IwnVfkP53dbe+lO/69Qj3Eaq9d1cI=;
 b=b2kIKJBpsxGwU2P6Kd9g3m+GydqkifXJ+rFTfTFzmYYAWR10qUAkjdBy/5deGBzRdxJKkDZVS4ddqkfboEBDGAhgjJg4ZZyoZuQaLJMhXxrBW0/JXCyNC02fKwJbaAyYXVBEkPKkNNQtTsD4wip6BFUJ4MsA6ep9I4+bGS7fmqdTsaoQOopQKYB4CWEMxf3/U/wcxPvaYcgtFiIlUQSqGNKZXkjXNSDtyqN4C+/BwSMKSVWGtHCG/EfHBSQanVHfMTw9X2AD45+QBy3GqBU9l40+LisjwqNMRaXUB6mSgtA6Vndn6pJRrDkRmfDxWUEk8sjjuhZZJ+1PCFjhyIdzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go+eP5j17bqvT4IwnVfkP53dbe+lO/69Qj3Eaq9d1cI=;
 b=YnSpUMeUM9O/NnCjQzCoWf36Y5+btHtmDi3pLrS+fSrEKxohKU/tMyN5Hk9Q7HZcmgDGir5OnBcMP+gzNfpcJ7W9vyXgUNl8+hHR5cCuZfuFE3LgkrQivrw/y0SkD4Do+MwCH52KHcVmyoybBTrftKYCJonKJVN0inJCAr1DHjYzsvpKerIgVQtoYFW5/woAZhPDJkx+Yli8us/AiEo40tL3M+0vDDpB6gPVl+mimzXYCE2vtAnMqkiJX2zOzxL0h+1FGmESY5rWAVGH3T9XqVc6eh+g9tKYIiOpudTb41vNhmrtIVpt8k0814zhqzHNte/c2fZw/dv7mIEWbHunow==
Received: from AM6P194CA0080.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::21)
 by DU4PR10MB8468.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 09:12:47 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:209:8f:cafe::70) by AM6P194CA0080.outlook.office365.com
 (2603:10a6:209:8f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 09:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 09:12:47 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 23 Sep
 2025 11:05:26 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 23 Sep
 2025 11:12:46 +0200
Date: Tue, 23 Sep 2025 11:12:41 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/4] STi device-tree display subsystem rework
Message-ID: <20250923091241.GA109156@gnbcxd0016.gnb.st.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
 <235312e0-b912-4e10-874a-e6364131aaee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <235312e0-b912-4e10-874a-e6364131aaee@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|DU4PR10MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecc3931-fbfa-4d2c-0200-08ddfa815ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FUfa1NijDuaCr0HZNVA9CuPJVtNbPJ1kK2im3wxlZw5MSbU2NRFv8kCdps?=
 =?iso-8859-1?Q?955f8WMFK6slOHVS4o81oqMBAqr0EuPAP7WHVBwPi0vR00dY60THgJAVCm?=
 =?iso-8859-1?Q?SAKROOYYvvU9JNZ9LQ3y3lG+x4FvULjZAnvAJsL56tpU5ZTba1k6vUOIVm?=
 =?iso-8859-1?Q?YeWuYIFVJh039kg8S1SdAp5deDTbtq9tcPHwd6rn7mUFxt3zWHJh4t/2Ly?=
 =?iso-8859-1?Q?pzdgKa5DrSinNEkM58uuAuhpAzmrzglv8FfPY7Ro4JAELzLws/xwcud1T4?=
 =?iso-8859-1?Q?UbiWZoElQQQ4XGPLTOVPzoO5cXyDtD1CwcxaWtzTurFtUQANdXes1/ZiDp?=
 =?iso-8859-1?Q?6SfdVGsA/4qmZuzD/apw7Zjpq+RtySqtEYz2XiBC6SL9sKhmT57Z3dCWiJ?=
 =?iso-8859-1?Q?4Gb88u2DrOAzot3MGV+mnEcLLYz754tik3DI66T/dI5vqFonfqsW5p5XQ1?=
 =?iso-8859-1?Q?MZCw4LMWyF8JwBaFOWD1NJagjEuYYMzwMnPphxL8OdAh575CAmDgntR5qe?=
 =?iso-8859-1?Q?dy7DLytt/Yl6yOI1tB4Kz/vyXNQ8ko+4dz65inCPP+7NyfaBFLjeZkBYwg?=
 =?iso-8859-1?Q?jIY/XeqVvtBCDq9P4R7dAZUhE5hTB4LID+BJ2Ck6FzdmEqso4EmHcWvbeT?=
 =?iso-8859-1?Q?GLug7qfNCQVvm/ZBJGwwCmgfeQLuXHce8WX2ow7EiEh19B6ZyWVJIW/5M3?=
 =?iso-8859-1?Q?8IT+Xfir3FvS6hwI9U9Ldt2utvXPBvQOexntMSStWpgJbEBffrIq28pWbn?=
 =?iso-8859-1?Q?aAd3rlt1nITzonTk4dod/vLsxIl8zxuh6Y76nKTWoRbpPsjZfZgx9MFFIl?=
 =?iso-8859-1?Q?3ypfeUvGf0YgZvTzth4IfVSbMpj0uuMzjirQTgkrMTm6oVhyvu3N6okoT/?=
 =?iso-8859-1?Q?g+E2ljbVPXTnUK2rY49rXz0ViK8VYghyOTheTAzJ5APFd6t6N41D6+dXyP?=
 =?iso-8859-1?Q?lzVdnVxcP7ZoPsudKuNAS24F/VYgdf/tAFmsZn3lWwyTiIJ+2gRJ5CxOji?=
 =?iso-8859-1?Q?5nNqmkHRwzGOgGQOi5CrnnEd0JcuN72pOotQK/QH7dd5G0IeoSMbRX1Dah?=
 =?iso-8859-1?Q?Fww4m0jKrFoPgE7v79IBN0mZpSyVD+9IGZpXz8W0XwxumQH542DASw97z+?=
 =?iso-8859-1?Q?2hSFdwkaoRr4MjOgqYICpObUhEA1sWWWRW9RLPDjIy/20La3w+KP2d1Ctc?=
 =?iso-8859-1?Q?faJ4zFuUsyk8ChgRP1tYcfDBHi3PgmUTrRKFnsryssiAMScE/Cuh3KO9sV?=
 =?iso-8859-1?Q?44nOCIHX/h1iWgC1Fhc1xLcNF6AY9QIW73+4ml+MPnbwmxMXZx/nqQelHq?=
 =?iso-8859-1?Q?tpktM2ZnEnOifjHStlERPcQ1qjyMPSwYWEy9JAiKo/jGcKGTPFSjJ6U/9J?=
 =?iso-8859-1?Q?xbuiNgX8xYhbVGUiguAF7QohiUZrQX0fEIU2tmOCQ5bSi+rLVMO+eLmRdI?=
 =?iso-8859-1?Q?wf5fNSBLDLACez+InkulkVLVh1pZvhxb+F8sYqFixU0hwM+BdXGH/A0G34?=
 =?iso-8859-1?Q?2VeKDlLbiop9CuXeQKku/jw2fwh8LKj+cZ4RTty1p76ms1UyB+0bUmKwhg?=
 =?iso-8859-1?Q?RGCm1U/lj/wG7g+R0GkyjmHG9Scd?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 09:12:47.1352 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecc3931-fbfa-4d2c-0200-08ddfa815ce1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8468
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX1OBEnfRTnI4t
 SvZ4yybTyWv4FYKp19cZABpf3gJgTYFLZdN6hO5Lc+KrFngEcDgmRdKL8Vd1wsQmmzxzpHstMsE
 I59fUYr/WEdap7rPCMJ1h38y5dFsPZJ7SSDIIdJlHAzUtcEoZhewXTVa+C0LLhyuSSkEzjRsqTh
 L+Dz5l7zFj3nBDkmd9B+cKITGJcP1jlgsiqFFynfaI7OPntWcDMRtvcFWeDWNYV+aeCnGWdDKoe
 MvZ2B6TQNIluevYAr6SkM/otMMsBmGA40kD7sTtSbpGx5nxTzwJ9cOZe8cLD/BHeEy7HJLS0xqB
 s2yx16JBDsM1JI+cBHwAq6APxHAopXOxLXXUstH2iEXiqZ5WIQTt1n3kbZfy2mhFDZwyRTSM17y
 HjTIAfUE
X-Proofpoint-GUID: VpBdeLWV3vZ8FMzNfH8n9WBXFKvAZNKw
X-Proofpoint-ORIG-GUID: VpBdeLWV3vZ8FMzNfH8n9WBXFKvAZNKw
X-Authority-Analysis: v=2.4 cv=dY2A3WXe c=1 sm=1 tr=0 ts=68d26491 cx=c_pps
 a=7E8kR0TPtiWwzUzoHzRCyA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=n5dE7JB0mAkA:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=P49eyZnlcTcxUSWYZM0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022
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

Hi Raphaël,

On Wed, Sep 17, 2025 at 12:03:43AM +0200, Raphaël Gallais-Pou wrote:

(...)

> @Alain
> Do you prefer to merge it yourself or you rather let me do it ?

Please go ahead, you can merge it.

Thanks.
Alain

> 
> Best regards,
> Raphaël>   arch/arm/boot/dts/st/stih410.dtsi | 316
> ++++++++++++++++++++++----------------
> >   drivers/gpu/drm/sti/sti_drv.c     |  18 +--
> >   2 files changed, 192 insertions(+), 142 deletions(-)
> > ---
> > base-commit: b9a572f471993d3e8bf874fcb57f331d66650440
> > change-id: 20250401-sti-rework-b009551a362c
> > 
> > Best regards,
> 
