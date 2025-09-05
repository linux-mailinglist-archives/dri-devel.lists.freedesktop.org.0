Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066DB45641
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 13:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D6C10E2D0;
	Fri,  5 Sep 2025 11:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="AEqGdSwt";
	dkim=pass (1024-bit key; unprotected) header.d=stmicroelectronics.onmicrosoft.com header.i=@stmicroelectronics.onmicrosoft.com header.b="AuvlQ6LD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B309010E2D0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 11:26:51 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585B9kpt023694;
 Fri, 5 Sep 2025 13:26:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tP2L/nzKdN4ILlFm+6EHGfXN+O+LzeW3tORWF++Bi2g=; b=AEqGdSwtMJl/uNZi
 dzVLEIJF6v46Q5Hww9ddwRtYeYkGQuzkB1oQ1kB/ysJAWYAoFy/LwSmfaIxxX46v
 mYIHpuTdTyMxH8SFTmblPE4Nxbw1rsoGQg2D8TN1K1xQ7cW4bC2VuP7UgVr+WiOu
 Xx8+ZOtNJltGeu6d+IDKfef2t5VGYLRZuXeJmK2gjoVN1faQKYDLfhggCLgKs7n2
 N2gaicQy7A83ChkvdOT72Q7mDBgia71bV2iUGi8rv039HfJlD8vMuDdRhrIgOlF8
 Xygi2vESJEbQhzk9//D/IBOkitCp6yrLpkmC1Pmrf+GpHzPK99UqMN5XYZnwRHf1
 WhnEcA==
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013067.outbound.protection.outlook.com
 [40.107.162.67])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav30em9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Sep 2025 13:26:33 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKM5NXQnMXrmLQZLKYDZ6GK/7UYT+4aMrsHYg6JSRmzKTq/d32FnbvJTEwyy3cOD17YjPMXR0gQm0OEd0XQJE9Xfl8+WQgO04OsnZ0kmuEJlhtowwjbD1Lyl61LMvbQCPqJki+WgVXGqmXQclAPEGxVqR9TeVizGE58wimUWoHz40dHWrOSl81un9Jw9Dc4S4BEVr2V1sZ53YeNlGzQMfgHfEBE5rGXUrKsA5/YeGHgOjyXBdw8v+7L+snpOHAT8nUZFqAGDSfJOzUwEZyEUPCsuWjPA/cgfbItBDZmzSL85C7w4BSwXlJSieKl70icyKb2Bzybk3P3+ioC22fptHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tP2L/nzKdN4ILlFm+6EHGfXN+O+LzeW3tORWF++Bi2g=;
 b=XTSSrJt6TgYWhjiLfMVlCX3JBeKgdTMBV8tWbVAN5CJFN3dF3eAdxdshzOSQYH1KqE7iw8oAUcMnHeImrJxCYZ2jv7RiA4gRfU5ID3wjVQ3HqgdEPDfp3aOWShy/G8oJNazNzr+YkK6htke3FGCiH6nOSnAHdEKNlITfffOtOLWUUtevD0XAF8rePvYUETSSGIKrS1EPvflABpOHYgKsukgRBepHUDvcKLgezyg1WzAgNIwy6y+NJX0FGM5TK74OKTRLHIIH2toaez/CzqdX6VHt/bkm2q5cRCfy3nKRz+eAHkqj9gDY3OuyFRIYilf2jsl7w7lx8q5iOG7FGSmdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=vivo.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tP2L/nzKdN4ILlFm+6EHGfXN+O+LzeW3tORWF++Bi2g=;
 b=AuvlQ6LDNTNWVq4PAd6jkOmXIk6TUJeL23lNVgIlsMpXfVp0SP1m8GyvJZJgocmwT3UdfXHgmfyW8m9zU/cE0IpwTSBavUMbc7/xqea4TyIaBmeFg/ejqsvlXs2hlKIyjTlAog/8LQfGvHY62HW+2uIEv9cI+ouM1XAQXqVDT5o=
Received: from DB7PR03CA0099.eurprd03.prod.outlook.com (2603:10a6:10:72::40)
 by DB9PR10MB6715.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 11:26:30 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::3e) by DB7PR03CA0099.outlook.office365.com
 (2603:10a6:10:72::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.20 via Frontend Transport; Fri,
 5 Sep 2025 11:26:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 11:26:30 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 13:24:11 +0200
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 5 Sep
 2025 13:26:29 +0200
Message-ID: <b5c5f3f5-5f34-4f79-b10f-62c0871cf94a@foss.st.com>
Date: Fri, 5 Sep 2025 13:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sti: Remove redundant ternary operators
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS FOR STI" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250904112738.350652-1-liaoyuanhong@vivo.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250904112738.350652-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|DB9PR10MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb28c67-260b-4a18-e932-08ddec6f0fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXNNanNvUkVxUUxJdlVDaTlsZjFlUXlWWmZVaGlMVVVMWUJlYVM4bnhRNXhJ?=
 =?utf-8?B?a0tLUTkxN0dMZDEvMmtuYUlWck9HbWxoVnQ2R1UzOU9qNVpMSm51UlVSYVNx?=
 =?utf-8?B?QUVOZlVwZkZzM1RuVmthaWl3UVlsMDhpUEN2NTBDYXpnSlpQcHI2bDM2eENW?=
 =?utf-8?B?dS9iK29NVW1vUFFvT3BkcWYrS0dlOVk4WXBwL1IyOW5kMGg2TkNKUTdSQk40?=
 =?utf-8?B?ZnNRNUdMcEIvelFwM3hnQWt1dzRVRUVuVXplTXB3KzJnWGx6RWUxR285QnMx?=
 =?utf-8?B?SUg3bHhJLy9GTGR0dmVXaVVudWlxcXBXSEZBMkVtUFNzeXRnaEtWdHo1SCtY?=
 =?utf-8?B?REZ0cHFuWGQwQUtsOVNyVmZ1bjd0VGQvU2M5REJPK2Z2TGNNZzYvQlJZNzdj?=
 =?utf-8?B?bHhDd3pGU0RhbGFUOHIzaWZCTjhqWUl3SFE2S3lEdGxrN1FLOFhIUUJoTGJJ?=
 =?utf-8?B?WWJQWjlGQlZHbDB0SXk5UVdrcDh3S2NuOXlJOUtxN2RUOTc3V3lNZ0ZHcmsy?=
 =?utf-8?B?b3ZQUnFVajdxMlp6WWlNVEgzTFZ3K0V1Y0Fhdm9NeFhTZHplYXJhVlhXVjNi?=
 =?utf-8?B?RGFydkpFakIxb0xtTUZZbFVxM0JueWFPMkpvWDRWMXQrcUZvTVUzV2oyUENX?=
 =?utf-8?B?NlhUWEVwV2ozYWlacU5HZXVXN3ErVXJaNi9aZkVNWEZqeHRBYXZ1ZW0yTTJu?=
 =?utf-8?B?ZStwaUR1VDVhSjNlSFVaMFFTKzFYOFpVTWFxS3lqNmI0bFVvaHl2US8wamxU?=
 =?utf-8?B?aHVVcEhmeUNvcDNnRTU5bmJ2bCtjRkxXbnl5LzBPVnlQVENnM0pYZlJxY0dD?=
 =?utf-8?B?ZmhpekNoWVhTczR3SnBMWVFNUFVqMnpDeWpzTnJDK3JjclAyeXFISEErSGNh?=
 =?utf-8?B?STFIeTNPSFBjSG02WmYzdmN4VDI0RmxSK0N5NDE1OGd0S3ZWZ3M0OTRVeTNK?=
 =?utf-8?B?QndJVFN2d3VsU2pMNmFTSnI5OWJLTVFEZGNZRklMN3VKZkFOTUhGd0cxRzUw?=
 =?utf-8?B?V2VycVdrYUJiaXZ1TGluK2VRdXZuUUxKUk45RXltZlVmZ2pDYUp6VmVhdUFN?=
 =?utf-8?B?L0l3UU0yamF4eXVvczFIVEtYL0x4UEJIMk4xMXJyQ053VDBZM3Vwd2hDclJp?=
 =?utf-8?B?cDRFemk3UkU5VnBKSnczR0FOdkZmS0h5bzhqK1YwUERpOGMyZzgrOC9lTGtP?=
 =?utf-8?B?SG4za1Q5bzhZZ0pVRS9WbFRGOWdTWGhCcW9TMTB4NVhKTDVaRzBVVS93WGs2?=
 =?utf-8?B?b29IVlZRenVVVi9SMkV0cHlvYnFKKzN0eHNIQWZ6K280bjFGY1I1M0RTMkQv?=
 =?utf-8?B?VUZsNlhkKzhKaldEckEwRlJad3YvbHNYdU1sVGZyMTlBRjFrcVdyQ3Nlckly?=
 =?utf-8?B?RTdyMlJtQWNPSVZVdVZ1YlQyTFEyMDlrVXZwU05FK2NqTzRGQ0hVUHc2S3RZ?=
 =?utf-8?B?cExhVitiM3VYZkgwSStyczZ0MnVzVlI1ekdJU2tzMGNheFhGK0QxN0Z3VkJq?=
 =?utf-8?B?QzdNaVB4MXcyRndSUWVGMVUzSjFsaWN2Y0U1bTk5ZWVuQUp6MWtqcVJqUzdr?=
 =?utf-8?B?VHlBcnpjanhFK1lMOEdpOWxRRFVST2ZZU3E2bklmNEpyVkRCd2NCdzJGbVVE?=
 =?utf-8?B?SjBRamFhbDl2VC9lUG5FcEh4a2VMUlpZNUYxOGY0YzluRUdpMWFQd0MrWXBV?=
 =?utf-8?B?WFJKMGNRTUtOUERSRGsxOHVkejhBZjhzVkwySnFicVNnZmEwbVNvQUN6K09U?=
 =?utf-8?B?UC9hUUlrZytFUmFXNkNKajNBM0JvRjhoVys4STE0NEhUeFhvS1FsendXZWMr?=
 =?utf-8?B?cE9xME1kTmtQdFJRSWhIN1BkUFJoVEUyNXhzVXE2MGd1Skp0TzlCMmdZV09x?=
 =?utf-8?B?SDRVYWFGRVFGZHB0VEcwS2FlLy9wb0NNcUlQVlNrVG1PbHNzNnZ1NkU5SkdW?=
 =?utf-8?B?bUxvNm1XVHB6bFJaOHRWMVhrWDVpWVoxa2xQalRmUmVlTU4vY3BuWm45YW5a?=
 =?utf-8?B?bUxDb1VFcDJFK1NtckdvRUZHUFRvVVhWUlpVRTJDWFdjaHRWeXBYN053alRZ?=
 =?utf-8?B?N2JmeGowZmhJdk91K3p6MTIvUkkydmRPdGsrQT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:26:30.3506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb28c67-260b-4a18-e932-08ddec6f0fa7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6715
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDI1MCBTYWx0ZWRfX8UsSnzJJJnko
 4mu0M1xbK4uS2hXWuQepH57mPwBEuCfnGwKFcUSJ7zakdk1SSpBe9rP7TRLahbkemplxJgNXeu5
 L5gQgplqkzQDgm1SRtrhEXH/5YDU4ngg/HwCNrRgmKvCzoo2Bw6D7V1qjicQSjsS4RYkf11SN9C
 aZbhR5BPSgk/Oj4YpKY/bQBGGTBR32PiUvclT/ondHZ7r8OVvfZ/Pgp/2cUXL68sxooSp7Hm4xK
 Ecj5kfBvo7Ya5LSN2hhlQnwrglVp+PTicvFFlU0JnmgM3vT/djR5Akc/Y0tlft4VoO3AquvtljB
 Lk7S/cw/aiUurCrOso+ALjG84XSe3yrNzIdO+lYt+xlozf+umXntewZu7fiZXI/lxhUP8094QOz
 tq8J74f7
X-Proofpoint-GUID: TbBcSDusYTblDCJVFSLAfhxRdjsSzAd-
X-Proofpoint-ORIG-GUID: TbBcSDusYTblDCJVFSLAfhxRdjsSzAd-
X-Authority-Analysis: v=2.4 cv=bchrUPPB c=1 sm=1 tr=0 ts=68bac8e9 cx=c_pps
 a=PHHD3cjIIbo0oOxUbsEG6A==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XKbaJabmtZkA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=1WtWmnkvAAAA:8
 a=KIBGs1wPn06wiQjGpBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1011
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300250
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



On 9/4/25 13:27, Liao Yuanhong wrote:
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>
Hi,

Applied to drm-misc-next.

Best regards,
Raphaël
