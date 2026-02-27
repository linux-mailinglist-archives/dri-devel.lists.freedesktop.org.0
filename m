Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBkHJCGzomlc5AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F871C1B35
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 10:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23F210E28B;
	Sat, 28 Feb 2026 09:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="q0Ka4lwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7125010E125
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 16:20:33 +0000 (UTC)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61REVPH72148436; Fri, 27 Feb 2026 08:20:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=OoF17XLnMhcWSKMEXfdgDPrGddCHnsbQibocusT/hic=; b=q0Ka4lwqEyWi
 nks8+9qlrVtnyT+bAs6jIGjC8DjovdwFeFoLOIMM5Mqtkd5iwWLzt1e/l+BKamoD
 8f9assnjRrE/1ZNB+fTDOCNRWKVtGcJM4VQ1rZvCR9FnSc5UcxVqZOwFMCAALhCD
 2sl/tyZYQXNMQwPBBbTxW7XkKJhiBD7+aajfIyDIbRgqi3I8VH72oUYFR7HuReTz
 FunpM2BPxxJ726ECwpNtOHvCZV7tZW2+wuAo3rrRzyjXrb9lHinBla6DWe1Tsn5Y
 x/5miN42gb/yJrN9vYSIzz9brqycEWamQPkGj8BYiygWgfi8OfL1WnrqRkur+bhN
 Dc2CT5Bt4w==
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4ck423wdwc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 27 Feb 2026 08:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6TloS3jtQbn+bSFHQ0YdWL22I4FkbEyrNPQgGL8WQraqIEIiLSkNkJJvnSMBs0PgIJnF1rsrhrrqtiYKsnK+PLluVNv2726muqqZ+UMkEAyctW3aFZHIBVE9gdFBlJyUJDPsIkxpe7MKnrW9/f8PlUsgcP4A7kaRtbMZ8aPdfYQdQI2ECFiYpbKizdj/eg9RUZMWsPujDh1kQ/CiqaH3j6R8Whs8zoK4m6ymj6vQ2kXKEq1AU1zRccMGzIR7Cmts9+sViX3VJ1TN9Npv+U19YOWvg+EVLUBT+pivZmzEKCuX88rApnUuue85+lTyYjA+7myMlp5yxvNiN20ivOyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoF17XLnMhcWSKMEXfdgDPrGddCHnsbQibocusT/hic=;
 b=c9ofdWOAMxqwRHc4wjGs2NGo1VQ1hYC8TDCeJUkzuLiFgXTu3JjNYQAVZp3lx9VxyLLcFkSkSvL8YMRD5d5Z29SFyr0rs6XY6kEmWkOHJzjUHoYdCfufhi48SE78RtQc4KBVh/OmMtzSaSBGUK77mZ+EOwBlsyugWD3eEejo28OoWi7xzo//VLHhi8CDWV+19YOVMnGG1wFvl1csm/Ec3iCBNu6HFj1clvM8z9SVTv54COQ8OZJ4v4YAbWvqqjUHLADZkLILLjGdyCrIhgF+m8i5hqhXT6FwR+2q+gwzpjmvaYL/Hfwsc6JSQcxPK+DX2AV3kxPhMefA+IR8U2ddoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH0PR15MB7038.namprd15.prod.outlook.com (2603:10b6:510:38d::10)
 by BL1PPF118F27D8B.namprd15.prod.outlook.com
 (2603:10b6:20f:fc04::e07) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 27 Feb
 2026 16:20:22 +0000
Received: from PH0PR15MB7038.namprd15.prod.outlook.com
 ([fe80::617b:b77c:494d:de19]) by PH0PR15MB7038.namprd15.prod.outlook.com
 ([fe80::617b:b77c:494d:de19%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:20:22 +0000
Message-ID: <b736501b-a2c4-4b1f-a6cc-6e788441f851@meta.com>
Date: Fri, 27 Feb 2026 16:19:55 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/7] dma-buf: uapi: Mechanism to revoke DMABUFs via
 ioctl()
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-5-mattev@meta.com>
 <f75088c6-5795-49cc-8932-ea46c2223d74@amd.com>
 <ad614dc4-0fd3-4897-b879-5d78a22b534f@meta.com>
 <a006b938-cd53-4c56-8131-30f557919ec6@amd.com>
From: Matt Evans <mattev@meta.com>
In-Reply-To: <a006b938-cd53-4c56-8131-30f557919ec6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::21) To PH0PR15MB7038.namprd15.prod.outlook.com
 (2603:10b6:510:38d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR15MB7038:EE_|BL1PPF118F27D8B:EE_
X-MS-Office365-Filtering-Correlation-Id: 86214e43-7a35-4c84-dfbf-08de761c1b4a
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: jqlPYxYgHws+R7Ljpl8aVh1pvq7GmRjlkMIqcf1iX+80F+ouKh8HFqgduTwyybkASKu9FsbwjqtYtkFVGHjeOEME1+OOWa4CLxWX3ve3H8WXfgfcWScflwXL4TqewwzoOJPvEH4kMqw+/id5cqWurGwqcb8gZcrlhzISieU+JhBlyp7JGk1slAJUdMe+SUo/xqwgOclpMCh3LS4v8EYquzErLy2yU33a/8zohkbgwncyaGEX36VsSd7eBx5UMdu+Kjycj1z75PPKhOlg/dDtxV8daLTV+upSzat/krcP6bbCISn3yyNB+T32Wt49Kpj93WJbED483yPLW8UmNUkawQI4SINJSDLN6N8UNhqtWrKhGpEp1yV9hlY7PkDK1WY+0ujU1XOCwowCr9HdIOuTU61rJXMc+BA00iU9yT57vL3AaehCYYtKuNzcJvj95/NGn6GR4vKMhJdwgxMUZ58XBsYoFva71Mwegids4k+PwsfzO4ObijIO5emMEdB9557hyII1DUI3yFPD5g+XcAfODaSzFqXV/x5EMF7faqZLzChz3Cyw/KxL+ISAdVPRYv319s63Hc1Xpw2P4+XVC6bM6dDVLBGdOUFTpxZBoy0TxEZ3VVcp7+6LOBVTnlcaD0cNixhkLnlLeUUrMhplWVjtWZv1nRPYEYVuxClVHNxYbJ/oNvSsja9/1IMLtvqbPajm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR15MB7038.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy83UVRpekpXckdQUitrU1hhR2RlcWlrVVZYSWtoZGMyMmZRRU51N3FObEpP?=
 =?utf-8?B?MHl6bENva2xoMlVTUmcxZkJxUnJ6eTJDRXIrZnJOaksrOWJIeGl4WnJXZG1v?=
 =?utf-8?B?M3ROUlVjejA3dWNwaXMzRlZBekJKcW1PT0c1REJnUlpNVndjRXZqR244blI0?=
 =?utf-8?B?ZDE5dkZoZU9JQ1V6c2hhK3lOL1p5a2paR1RoOFRua3VMZy94RSszc0VZYjFH?=
 =?utf-8?B?STJnZzR4K0tneE5vaC8vdlA1QVo1WFRtVnJ5UjlaVjk3WUxXN3dFZVVIWTh4?=
 =?utf-8?B?VHB2YlFKZnNxYkNxdW1RRldDMktRV2lHakEzNHh3Q1NkdzZJMmkxeGRMK05x?=
 =?utf-8?B?WU80MU4wTUowcnl1dmhsTjM2Q0NaVm9TcjBFL3NjTkRYSGc0WnhhWXZWNGlH?=
 =?utf-8?B?SkJIZ2JpdkxRNm5CcU91ejY1UkhkWjE1eURpcTBBUmhaNGd1WHNDajRscWE3?=
 =?utf-8?B?NlFRTEZtVWlOVWozRkw4SGFDRFNNM1EvMUlwVjgwZUFROFlCbVMxRFZSRHpv?=
 =?utf-8?B?bjkyWW1aSDVsME5hVlhUWGZmcmxZdWJQVm4rWEtyRkZEMHhJa2YxUC9iOVUz?=
 =?utf-8?B?aVJYcEg3cTMwQUJxdGF1WWpOQzE4Rmk3U2pKcUZrZk8rdnBGUTRLby9wUG9o?=
 =?utf-8?B?U0xJTnNndVdJalNrRFlsTlFHQXVBTkZSMzFISTUvWkgyVkhVc3Q1WFE3d01w?=
 =?utf-8?B?TGxsODF5N3FTR2gwSk5aUytUNTZNTU9ubWJTS1dKWXdNUjVxa08vbzlTeEZQ?=
 =?utf-8?B?czdGT1lIUThxN0FxV2sxQ014N1M2WHMvY0hPNTFaMVkraEdpdXllKzJBSmIv?=
 =?utf-8?B?WjN4dlg2MXFhK1NNb05wdysvZVMvcVFtMVR0U3cybTJjSnNyRkZHMEYrbnRr?=
 =?utf-8?B?d1huZzlEQjVqUjdoNFRScUowTkN3ZGhyTnNrR2FlR1JZSklqM01wZFBXd1Qx?=
 =?utf-8?B?dXVDbUU2OHI4blpodUJTbDNBNVZ1bVU4QXBQM0J3REFMQ3JCbExsNU9rWUdV?=
 =?utf-8?B?clp2NWdpakxBWExiaWdEdGRDbCs4T1FLV2ZmYTZySWl5cEFPVlh2b3ptblJS?=
 =?utf-8?B?VFdhbyt3MGFkbTNCQTFNL05qOWt3OCtuN0x2WEJ6QWY4cCtYU1dXWmNhdkpQ?=
 =?utf-8?B?Q0N2MGZ5VUNaanVrVHpqSTliZ2kvREVodTNoTVROREhhc3dKSWJPeHVTSXZx?=
 =?utf-8?B?U0F1L0l6a3lrZ2FlMktaaUJEZyswdTQvTlFXYit3MEtoem82dFE1U0VrL3dI?=
 =?utf-8?B?RjNkMmowclZWMEZEbEpXMHFJaVV6ZGd5U3JCc2g1R1lUZlAvSEJIbHFFZ2Rm?=
 =?utf-8?B?MVVaSUpNTzdiN0s4R2MvcWNVcGJvcDlLdlpuMCt3Mkw2bGFJWnJrZTZTRDZK?=
 =?utf-8?B?Vm5TeVh1NHZoZjhLZUt4UXBkVmRXT3hDRUhQeUdDelVHUDhtR3l5cW1TanZw?=
 =?utf-8?B?WjM3WXhDa0ZpdlFCb0RFOUFuR3VhTXJrdW9SOXA1UEtZSExPSjI1QTQ0RGpy?=
 =?utf-8?B?YzRIRHFGd21ZOW1OaU0rQnAyZ2ozVUR3NnN3amwxY0dzMXBTczUwRm8zWFpu?=
 =?utf-8?B?MW1Td25KOVNUR1dwbzVCZUxXeEpEdzg3eWFjalRHMEh1aEV2bnU5N0NQVTFS?=
 =?utf-8?B?VDNEWk9yWVJNaG5EY21ENGJLNmhWa0plY2JSM3hxZ0lPUjBXSjhmOXBkVmtH?=
 =?utf-8?B?Mm1qcytZZGZjcEhNcENudzZOOXlSR0l0RnVuejZPc21tZDZRTXAwUVFKTU5N?=
 =?utf-8?B?ZURLL21oTjlaQTBaTHN1QWRlZmh5TG5hL3g3aktVR0E1L1Z5cFUwSE1EbDNm?=
 =?utf-8?B?UFg4RjVSMlloZ2dnenNyYTRUMHhZamVEREVUUS9XczBQanZxSW4vM1ZjcWIv?=
 =?utf-8?B?T1dBdmtRcytOZzU0TDlwOU9JK3FHTERBclByU1MrVU1zUS9CQS8zTG51RktY?=
 =?utf-8?B?b1pQcHM2ZERUSDJJakVFNlA0VnlEcVk2UUVrUisycGwrbkZ6NTMzeUk1Y01t?=
 =?utf-8?B?VXF1Wm9SdGdBdkc3UWZlQ3AvQ3Bwb2N2T0NZcXkyb21DUXN0anhjY3MzSktI?=
 =?utf-8?B?WjdhTGsrVTdJRnpIQ04rMldyUWNOZDk0ajNCQ1ZKenFQQ0dONWpGV3k2WWli?=
 =?utf-8?B?UjNFSVhYU1cwaW9JNzdyUDdkQ3lqcDRQZjYxMDh0MDNzcE5lTjd4WlNzVXZS?=
 =?utf-8?B?ZXFESmNLOVZ5WHlzWVlVVXhvaXVXeStjVjNWQ0piRURielIxVkUvRmJacUll?=
 =?utf-8?B?VUJac0V6T1ZvZFRkMjBjdG1OSkFLWU9tS2QwQ3FPTEFMaHhZbXZydm5qYzNl?=
 =?utf-8?B?M0Z6dmx1cjFnMTV2TVBWVDdOcXd5TUd2QkdJR3BrK3lsbDNSOFJQUEc3RTZq?=
 =?utf-8?Q?B8ifSSibUwi35SD8=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86214e43-7a35-4c84-dfbf-08de761c1b4a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR15MB7038.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:20:22.4508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0N8CepE2wa1DRisc1m9HEiIbnBLa9O97RW38FotWRK9NVo8mzJ8r6ZJqI2eZ5dg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF118F27D8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE0NSBTYWx0ZWRfX+1KnjWiioZOD
 1kIQ4jbxt0NdQRugdpvJj9Z7MUHZlTR1kXp6AnjSCQ7L1E27DnpcY6eMJI/Lik4bZV/Uxbggo/H
 r4lttooDSDii5/jOzwDNbSleBa1ACB9KtIb+P+mKfAyxURW98GNZU92+Xz4Z9/tzpqjMnIdsLC1
 ox/rqmeoJjPwSK6X/SJiZ4FSlFNiEbD8re5fcCoOaH/9p4KwYA49Spgo8JGnyecUZLXDbKjviCR
 UaDjqXbmq8d643s+8lL8MRZnYpzEpzJRyPyUvHGqmm+s8+pPMMu6an9e1oBt7fAOHdD8eAprBz/
 whIVx+H8L63c+bbEAfPOMkw63jw8PxCfR40V9tMSbSlKwcaRR1mUwEWdc0PEdN0DZn+2+MCNmX3
 aJtbsKO/aGNth9MkxM7SvLEYLNU0ItqsOFQ6xo8ckREzcaLokLFiuWX3Ud+bwfGtyp0CmwMF4Ot
 +qYx+sb5acptYEyyBXQ==
X-Authority-Analysis: v=2.4 cv=T6GBjvKQ c=1 sm=1 tr=0 ts=69a1c449 cx=c_pps
 a=xBU3AFOX62plvdJ7VrUh9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=0R6VDxklJT5RH_P7GksA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: 4ZxNdmAK4Zyfm_20hIsteM9he52W4q1I
X-Proofpoint-ORIG-GUID: 4ZxNdmAK4Zyfm_20hIsteM9he52W4q1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:18:41 +0000
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[meta.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,meta.com:mid,meta.com:dkim,meta.com:email]
X-Rspamd-Queue-Id: E7F871C1B35
X-Rspamd-Action: no action

Hi Christian,

On 27/02/2026 15:20, Christian König wrote:
> Hi Matt,
> 
> On 2/27/26 14:02, Matt Evans wrote:
>> Hi Christian,
>>
>> On 27/02/2026 10:05, Christian König wrote:
>>> On 2/26/26 21:22, Matt Evans wrote:
>>>> Add a new dma-buf ioctl() op, DMA_BUF_IOCTL_REVOKE, connected to a new
>>>> (optional) dma_buf_ops callback, revoke().  An exporter receiving this
>>>> will _permanently_ revoke the DMABUF, meaning it can no longer be
>>>> mapped/attached/mmap()ed.  It also guarantees that existing
>>>> importers have been detached (e.g. via move_notify) and all mappings
>>>> made inaccessible.
>>>>
>>>> This is useful for lifecycle management in scenarios where a process
>>>> has created a DMABUF representing a resource, then delegated it to
>>>> a client process; access to the resource is revoked when the client is
>>>> deemed "done", and the resource can be safely re-used elsewhere.
>>>
>>> Well that means revoking from the importer side. That absolutely doesn't make sense to me.
>>>
>>> Why would you do that?
>>
>> Well, it's for cleanup, but directed to a specific buffer.
>>
>> Elaborating on the original example, a userspace driver creates a DMABUF
>> for parts of a BAR and then sends its fd to some other client process
>> via SCM_RIGHTS.  The client might then do all of:
>>
>> - Process mappings of the buffer
>> - iommufd IO-mappings of it
>> - other unrelated drivers import it
>> - share the fd with more processes!
>>
>> i.e. poking a programming interface and orchestrating P2P DMA to it.
>> Eventually the client completes and messages the driver to say goodbye,
>> except the client is buggy: it hangs before it munmaps or request other
>> drivers to shut down/detach their imports.
>>
>> Now the original driver can't reuse any BAR ranges it shared out, as
>> there might still be active mappings or even ongoing P2P DMA to them.
>>
>> The goal is to guarantee a point in time where resources corresponding
>> to a previously-shared DMABUF fd _cannot_ be accessed anymore:  CPUs,
>> or other drivers/importers, or any other kind of P2P DMA.  So yes, a
>> revoke must detach importers, using the synchronous revocation flow
>> Leon added in [0] ("dma-buf: Use revoke mechanism to invalidate shared
>> buffers").
>>
>> (Apologies, I should really have just built this on top of a tree
>> containing that series to make this need clearer.)
>>
>> But, it ultimately seems to have the same downstream effects as if one
>> were to, say, shut down VFIO device fds and therefore trigger
>> vfio_pci_dma_buf_cleanup().  It's just the reason to trigger revocation
>> is different:  a selective userspace-triggered revocation of a given
>> buffer, instead of an exporter cleanup-triggered revocation of all
>> buffers.  In both cases the goals are identical too, of a synchronised
>> point after which no more DMA/CPU access can happen.
>>
>> (If I've misunderstood your question please clarify, but I hope that
>> answers it!)
> 
> Yeah that makes it clear, Jasons answer also helped quite a bit to understand what you want to do here.
> 
> First of all your requirements sound reasonable, but absolutely clear NAK to the way those patches approach of implementing them. You completely mixed up the different DMA-buf roles and which is used for what.

Yep, no worries -- this is just an RFC in order to get such feedback.

> See the IOCTLs on the DMA-buf file descriptor are for the importer side to communicate with the exporter side. E.g. thinks like "I'm done writing with the CPU, please make that visible to yourself and other importers".....
> 
> But what you want to do here is just the other way around, the exporter side wants to signal to all importers that it can't use the buffer any more, correct?

Yes, that's right, it would be the role of the exporter (VFIO in the
first instance) being triggered by userspace to do this revoke.

I see this doesn't really fit with the other ioctls being
importer-centric; thanks, I do agree that an exporter revocation op
would stick out here.

(I tried in the cover letter to flag that better ways probably exist,
and the PoC intended to set context for how it'd be triggered in end-to-
end usage.  At any rate, I'm glad we're aligning on the overall concept/
goals (modulo implementation :) ).)

> If I understood that correctly then my suggestion is that you have a new IOCTL on the VFIO fd you originally used to export the DMA-buf fd. This IOCTL takes the DMA-buf fd and after double checking that it indeed is the exporter of that fd revokes all importer access to it.

This was Jason's suggestion in the other mail too, and it seems like a
much nicer way to do it.  Thank you for the suggestions, I'll redo it
like that.

> I'm certainly open on suggestions on how to improve the DMA-buf documentation to make that more clearer in the future.

I'll re-read it and see if any ideas for clarification occur, as I did
indeed miss that the fd implies the importer role, apologies.


Thanks,


Matt


> 
> Regards,
> Christian.
> 
>>
>> Cheers,
>>
>>
>> Matt
>>
>> [0] https://lore.kernel.org/linux-iommu/20260205-nocturnal-poetic-chamois-f566ad@houat/T/#m310cd07011e3a1461b6fda45e3f9b886ba76571a 
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Matt Evans <mattev@meta.com>
>>>> ---
>>>>  drivers/dma-buf/dma-buf.c    |  5 +++++
>>>>  include/linux/dma-buf.h      | 22 ++++++++++++++++++++++
>>>>  include/uapi/linux/dma-buf.h |  1 +
>>>>  3 files changed, 28 insertions(+)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>> index edaa9e4ee4ae..b9b315317f2d 100644
>>>> --- a/drivers/dma-buf/dma-buf.c
>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>> @@ -561,6 +561,11 @@ static long dma_buf_ioctl(struct file *file,
>>>>         case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
>>>>                 return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>>>>  #endif
>>>> +       case DMA_BUF_IOCTL_REVOKE:
>>>> +               if (dmabuf->ops->revoke)
>>>> +                       return dmabuf->ops->revoke(dmabuf);
>>>> +               else
>>>> +                       return -EINVAL;
>>>>
>>>>         default:
>>>>                 return -ENOTTY;
>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>> index 0bc492090237..a68c9ad7aebd 100644
>>>> --- a/include/linux/dma-buf.h
>>>> +++ b/include/linux/dma-buf.h
>>>> @@ -277,6 +277,28 @@ struct dma_buf_ops {
>>>>
>>>>         int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>>         void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>> +
>>>> +       /**
>>>> +        * @revoke:
>>>> +        *
>>>> +        * This callback is invoked from a userspace
>>>> +        * DMA_BUF_IOCTL_REVOKE operation, and requests that access to
>>>> +        * the buffer is immediately and permanently revoked.  On
>>>> +        * successful return, the buffer is not accessible through any
>>>> +        * mmap() or dma-buf import.  The request fails if the buffer
>>>> +        * is pinned; otherwise, the exporter marks the buffer as
>>>> +        * inaccessible and uses the move_notify callback to inform
>>>> +        * importers of the change.  The buffer is permanently
>>>> +        * disabled, and the exporter must refuse all map, mmap,
>>>> +        * attach, etc. requests.
>>>> +        *
>>>> +        * Returns:
>>>> +        *
>>>> +        * 0 on success, or a negative error code on failure:
>>>> +        * -ENODEV if the associated device no longer exists/is closed.
>>>> +        * -EBADFD if the buffer has already been revoked.
>>>> +        */
>>>> +       int (*revoke)(struct dma_buf *dmabuf);
>>>>  };
>>>>
>>>>  /**
>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>>> index 5a6fda66d9ad..84bf2dd2d0f3 100644
>>>> --- a/include/uapi/linux/dma-buf.h
>>>> +++ b/include/uapi/linux/dma-buf.h
>>>> @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
>>>>  #define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, __u64)
>>>>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>>>>  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
>>>> +#define DMA_BUF_IOCTL_REVOKE   _IO(DMA_BUF_BASE, 4)
>>>>
>>>>  #endif
>>>> --
>>>> 2.47.3
>>>>
>>>
>>
> 

