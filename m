Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F7B57774
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAD510E44E;
	Mon, 15 Sep 2025 11:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="JV5bzbXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BBE10E44E;
 Mon, 15 Sep 2025 11:02:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9wXAT021026;
 Mon, 15 Sep 2025 13:01:28 +0200
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013058.outbound.protection.outlook.com
 [40.107.162.58])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 494yy0xqfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 13:01:28 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Js60Fomo1HMFVsaNdig+OsCTukenX28u/DW/J9Db9LqOaHF4iBCTV71iXfECcnApJ2OuM6+fJp5Oxei8KueLA1ntCh7UIk2KOrUOMDa7hxHFOXe5NQb1Ul7qCtIj9rDtrAJWKyrW/s1GUGW5Fg96QIcSY9uI5kbuZZH1U/7iimSiH2eO/nTT7fcdpA3c7V+9QvhDo1J59QNnj0qojkbeJ1IUwtKxd8uuAHdlHwfI6rqueL49Cm5ji5mR+czjRQlAf5umA/kqcsddrwhradrnJpoJfx84EiEcpecYGeR8aBbPJmEdbpatPtyNx0j9zEQ8xKuqMhlqIYiF+hUTkovfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4eJ+el3avyU1LXsQGwkfvjRGocqXDACafODWJReeaE=;
 b=WnKiOw0CgNop+FK/N1G0jm5cer6U/znRtT/nurH2EjLoyCtqZs2Y+bGhfL3916nlvhHCzDva9fVCTv7TRmL7o1lLesDzX5xTEsrpB1u6CsoseI0Q38SwKQKceKN3z6LsWZuJtxvOAeQlMqwX8MtNc1COyBe6G/V1k9Zz33GkB0diSHkg71gTGVZ1kiNxi4D98WTV6aFkYTf0Ogo+TFS5j2jrNW+9CNRNsIcXbkrGCy/qEFC6GIwIQqDDMPOLKeAjFTeclmNJWJAQ7lTAzmRl+pDU4RuWnOn0iTz/NvszK21BDlgL7jfA2TRCh/4cQ8eBJKuwiHRJFSV74546m9RfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=redhat.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4eJ+el3avyU1LXsQGwkfvjRGocqXDACafODWJReeaE=;
 b=JV5bzbXQD6KClkOHdD/khx144c+90jj+HGHALCv4Tw5SaXsKMeJ5OqBP3UVE9Qn+L4Ffgl4Xvdw+SWJndiHWiN7jjlGaWHROYskpMUXRYQItTfdPzQK5orsORj/LIoJnJEoq8GNkyZuMzBHj7h8ebkGLtuyKXIyRmBH49K2VTMc4JlYXTEbP9xvREAEIBwvzI9XCz94uxhtJuhYB/T98ZL8i6zUR25MRhEjl/HB9JsybdkOiossDDXHojGlOh5L3teTdsym1yyu9kuwuyuMsJYLj+o74Q42SPbMHvBmOUo6T85lZbTeIcGvpUdFLq5F5AwVwCqUbzvpayiPu6drX4Q==
Received: from CWLP265CA0514.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::15)
 by PAWPR10MB8041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 11:01:22 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:400:18c:cafe::c3) by CWLP265CA0514.outlook.office365.com
 (2603:10a6:400:18c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.20 via Frontend Transport; Mon,
 15 Sep 2025 11:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 11:01:22 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 12:58:58 +0200
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 13:01:20 +0200
Message-ID: <bbdbe714-f899-4f9c-84e4-bb844650bc77@foss.st.com>
Date: Mon, 15 Sep 2025 13:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <aMawQYUIjPw9m4IO@redhat.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <aMawQYUIjPw9m4IO@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|PAWPR10MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: c91e6222-f2f8-410a-97cb-08ddf44734f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWgwaisyODh2Z3h5dW9qQnRCbXNIT3JUa2Z6b0E4LzJlRHA4WmZyT2lGelhO?=
 =?utf-8?B?SUg1RndzZlJOMXBmemVtRVhkbmwrdkJVZFBYek1GRkNDQTRmNldwbS9Icko3?=
 =?utf-8?B?QlNCUC9QODlBNzBMTjErbW5EdnNiT0cwYitTRUNORnk2cmp0KzMrRUkwMnNQ?=
 =?utf-8?B?WUUvNXdRRmdmazFubXlCNkxLdE5pSXZMNGFZUzRHY3M3NjNLajhKU2hZSis5?=
 =?utf-8?B?bldocDB0NU1CUlRmWUxFTWZjYmExTDZrSjJVV205a0RyRVR4cWlMQmlyQXZN?=
 =?utf-8?B?UjZsVHVPWXJLUTZwNk9TVDdzdytBalN6WWQzTTkvNWFYZGYraDZhTTFpN0Jz?=
 =?utf-8?B?Q0UyY3l1QlUwVnNtSC9kS0RpR3RvOVFLdEpVMUtRM0pzbjNtUHcxT1oxU3h5?=
 =?utf-8?B?WnJBU0lyc0l1NDRTNXhSU2pYWXdnVWh2YndSbXFJQW4yUmp6aFByenBHbUx3?=
 =?utf-8?B?eGNmbVdkVkZtNjB4N1RBY1Q3VUErRGJGQW1XaW8yVE9mV1dFSHhkWncwVklv?=
 =?utf-8?B?STFtOGJmQXdBTWFySVhob3FHTUVXRHB5Z1ozN0RqTG5QUitXWVgydUlwcEUz?=
 =?utf-8?B?TzhxMUorVkx4Q3JhQ0xnbkl1VlIrSW15MG0zb2YybDZlcnZyL09BYmpxNXht?=
 =?utf-8?B?VVp6RytKUEhuN252b2RJMWk0QktXRStyV3pVOUN4UnM2TjhmbU52c28zSHRr?=
 =?utf-8?B?anRxSWdObmpyWmFEdHF5WmRJVDMrSjZ6bjhYeGcxc08xRkY4YXNHS1Q3L3c4?=
 =?utf-8?B?VjI2dHpqTnRDcmh4V3gvbWduSVBkMVlXVWRxSEtJME8ydE9XRHZvRTl3cWJC?=
 =?utf-8?B?R201UE8vUUVvNkpLMFQ5OVEra3ZRNCtGSVB6SjR1RVJIT1R1cHFHam1SZGY0?=
 =?utf-8?B?T05ObkNVNzE3V0dSWTlQVGJHcElzb3dFdlZmVVNHWWlYWlNQMHd2VzRwTWwy?=
 =?utf-8?B?V0Y2aWo4NEFSUXBtdFhQNTJjTEFOSUk0RlA1Y3BwTUNNSVQ1QUhBcDlqOEJE?=
 =?utf-8?B?RERGbXB5eUU5QTB3ZVl2TzNacFdNNTlyYjE1NDNFUmxadXJ1cEh0K2YxM04z?=
 =?utf-8?B?UXZVam1QYk9HOUlQdWVlaHViYWhKSmd5Um1VUmlWT3J0YkgrQTFZRHllV0dL?=
 =?utf-8?B?SWszcFhra3crVHJGTWJ5YmFQTmx5bW1CRGsrQVlPamU3WFEwdm1qOGhoQnZJ?=
 =?utf-8?B?QW4yNzRIVjA2eU1kOCtRUys3RVE1Vys2aHo5RmtZTFBXQjY5UHFGOUxmVmlk?=
 =?utf-8?B?ZnhYd2Z3c01xNmZoaEVxSkVFT01NcldHbjJUKzZ5dlVIaXp1ZHZ3WTJIWTNi?=
 =?utf-8?B?aEcrNkIvcHp5d05Rc3RoTVlZZC9FdUdZT3ZGanNSb0Q3eXFhSWE3VFUxSUxP?=
 =?utf-8?B?RzhNZnZXQWd6K3QrbzBNK3RGVzhyajJncEZpSzVRakNKQ1RlS2JmU2NTK1k5?=
 =?utf-8?B?Vm04eHZWbGE5NTFWK0diUnJxSkZBR1BnU29VMFYrN2FIdStYVmNlVjNQUWx0?=
 =?utf-8?B?ZHdLU2VnM3duNmJ4bUVibHI2OHp2T2g5U0ExaXBmS2s5cTFBRWtROTliMnkx?=
 =?utf-8?B?VENWSFlWN1VqVExONm1ESVkwWHhmdGI4OWY3YnlrVW5mU2dzdE1tdjNCNnMz?=
 =?utf-8?B?bWlIYUxyYzFPK2UybU1BWVhlRnlBaWdQZW9FUW9KV1Zhb2d3dEhhYStjdStX?=
 =?utf-8?B?ZW5BTFZQN0JaQjMycGEyNzdmaWY0T1RyamdmUFFkT3RnQ3NHWitrWUdBVEIz?=
 =?utf-8?B?UTFnVm5na3ZlL012bFVCOUU2ZUsvb0loOTk2U3dIZ3F4VGtKK1MxcW9kWXRk?=
 =?utf-8?B?eDVhZXpmMFpnRnRvRVR6V05qcEJ2YzVOWm5BamdWYWFzdE1aQmk0N1Z3SlBs?=
 =?utf-8?B?NTBHcG0vTy9rRWhidjZZanpCM1lBeThKb29KZ2lQamtlbWFUMysrd0F5bktw?=
 =?utf-8?B?eGYvQmNUNlFGY0pJVjB6b2gxOHBUNnplWkdzR0NPQjRWUGRpMm5VWDRKSlRD?=
 =?utf-8?B?dEdiN2dGdVdtanorRXl5WE5xakFxb2k0emY3ZDQ5VkRYWDBmTEg4azRWdU0r?=
 =?utf-8?B?Sk1Na0VnbkZyYU4rL2hhWjJ2UXNmWURpZkZkZz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 11:01:22.4169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c91e6222-f2f8-410a-97cb-08ddf44734f2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8041
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyMyBTYWx0ZWRfXwAARP6g/WEJ2
 /A9hfGxx5//tcs4GetHF/qP3AheciDRNdpZ7ONHcsNkIFdM/J2yTthOlwOii9qG4X5VDysy/YTm
 n6DJvMf1+07LLhQbF0myT5oUU0MFHliAX1ulvCDGsmfrIKJZGUa0bWbtZlPxK0pnVuLF64ZKCrR
 SSmVXUEdptWRMbVQbZTE89qGsBmBb2dAceSJgezHb9RIsc7oByH2cOJuveucUo4T2PuoBEykzEA
 Gtp58tdyxLtpx7XLQ/35chJrjqlhm4I4s9Q+CwGbGLmICxjxBatSJJaEcT1wUrDlLNcc9K8Ol8I
 ROE68GZE2OOHdu8zots0ZYg5EQHcnh3XYKYZEyspWMJjrX7sBVmy2Yj1EsdWmaBPboRMcdiPqZK
 71WzHdBe
X-Proofpoint-ORIG-GUID: 4ZOSm7mw_iUQn64_9lWftUlK4R0I5FRZ
X-Proofpoint-GUID: 4ZOSm7mw_iUQn64_9lWftUlK4R0I5FRZ
X-Authority-Analysis: v=2.4 cv=X+9SKHTe c=1 sm=1 tr=0 ts=68c7f208 cx=c_pps
 a=S8DygKiaZr2zVg6elkfInw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XKbaJabmtZkA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=ERt4Ilx00Ax3ENX90bsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 suspectscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130023
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



On 9/14/25 14:08, Brian Masney wrote:
> Hi all,
>
> On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
>> The round_rate() clk ops is deprecated in the clk framework in favor
>> of the determine_rate() clk ops, so let's go ahead and convert the
>> drivers in the drm subsystem using the Coccinelle semantic patch
>> posted below. I did a few minor cosmetic cleanups of the code in a
>> few cases.
>>
>> Changes since v1:
>> - Drop space after the cast (Maxime)
>> - Added various Acked-by and Reviewed-by tags
> Would it be possible to get this picked up for v6.18? I'd like to remove
> this API from drivers/clk in v6.19.
>
> I'm not sure which tree(s) this should go through. All of the patches
> except patch 1 have at least one Acked-by or Reviewed-by.

If there are no objections I'll merge the rest of the series in the
drm-misc-next later today.

Regards,
Raphaël
>
> Thanks,
>
> Brian
>

