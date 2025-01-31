Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30107A23FF0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1AC10E371;
	Fri, 31 Jan 2025 15:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="hmDQtEBa";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="gDS3r+6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1209 seconds by postgrey-1.36 at gabe;
 Fri, 31 Jan 2025 15:59:51 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B38410E371
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:59:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VF5bRh029021;
 Fri, 31 Jan 2025 15:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=8Ko6bjgtCPGIZeJtrA7rNoV4c
 8f5U+zRIvGLGhGJTKs=; b=hmDQtEBaFfg56RuSpWOVDrzkf+zifZJuzMDRt6Iy2
 4U+kOJynD0T7Jo86cpA0mOvoBKlMAz8oH6cdfYjoCUl8WG0BNZQ2OxBnOSrWi/EV
 gISAClDgXL5Ei0G6yBm/ynKvzn8PQUY5PL75QPQ0TaAmh79KtkouFvLY+oW51xNi
 xbTFR3xVYBU2YycwbeF5WLx5AnSZKMcDNxzzz/ShkdGZUMpkeht4aCEiy7nc/zsW
 1EWjPcJAJim4+2AFFYPdEE7nucLE8wPB2+4O8URJZ2p2jMvmElWD1O8RTF4sfZsC
 vNtO7YMW602w1By87XLQlVTd8wmCcbMPI3TDba1WntRuw==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010004.outbound.protection.outlook.com [40.93.68.4])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 44ep3c302x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 15:39:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkGnSeTp9u7gTI61pm2UB8fTCscxJ1RHcYS1k/smaPjofo3NkLnNFLuvc9QpdeRyx15cSMaSQRFuGDeR275bUXZ3Td8KDVin9XznwMoXvN9sETMwId3BedVlH1bHU8c0vzQyGiSEGjkP5v2Cx0xsdJ6zNp1UyAG/pf6qFeiFy2KcDfnPVNUZD6fldCIeLMOd+1cT+XGSxY/A2GB6hzLbnMvQNLkm3Mr5zHk68oSIszPrf0Khk3Gi1R7kwUJGc8WHtFgaINxmnhfaHZwMaNMXZFKbTtn1JtuIHpF3+DSFoCF6KpmpLXuKd0vMYcpWuILWtH5nue8sBmFpgYSVnXp8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ko6bjgtCPGIZeJtrA7rNoV4c8f5U+zRIvGLGhGJTKs=;
 b=I+IenG9uIyQF1OvVOJBZt/m8psDN7YCZj531XGtYZbjZxtiYqp3/oVcjdWP8VQ+yyR+tKq/SLbBAcOYA0DlGKQN9DJFvmOdyqYHHcKsOdfXmGAtzWVCIQ0kJlVjeW/+BidvieF20BpuCq5mlL2pqrXdXU4JWcIiRCYfLUKjfhenx5mqWxMXRa/U0WgEBo7IHFqmiYMG18vu5NdaHXRntFRGohjC/z0S+P1x2ZHxn9H3LecH9DhxPhXq7wRi/NWUX0MT17zYx7j9TV7wTrPs0oDGyYIE8z8VllHQrrE2VlIHxKpU/FTMULtKHk86XcW/RQHNeqiuXcEDJDjgolEjo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ko6bjgtCPGIZeJtrA7rNoV4c8f5U+zRIvGLGhGJTKs=;
 b=gDS3r+6pmA8VZJVrYqwhXI24f3kD/uMy32kAY6plMntLO9AAPkQy02bjiR4mbQGWVRpBIqFc+SRgTlrqqjLLKtGFG7yEgB68J5bhBlAe2p2rRxvZwayiwy3/8kRxDJxm6SxvqZo+CEnYWqF20wkiyk/YOGZyj8kXujc88qdZCTM=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5503.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Fri, 31 Jan 2025 15:39:36 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:39:36 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "jszhang@kernel.org"
 <jszhang@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 11/18] dt-bindings: gpu: Add 'resets' property for GPU
 initialization
Thread-Topic: [PATCH v4 11/18] dt-bindings: gpu: Add 'resets' property for GPU
 initialization
Thread-Index: AQHbc/ZUlA5FOtbIo0CMDzlvoWH5zA==
Date: Fri, 31 Jan 2025 15:39:36 +0000
Message-ID: <ed1920cc-7cd5-4af7-a945-bb71296010e3@imgtec.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194839eucas1p1885da20ddfec840341879c120a21f514@eucas1p1.samsung.com>
 <20250128194816.2185326-12-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-12-m.wilczynski@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5503:EE_
x-ms-office365-filtering-correlation-id: ba36b3e2-fd9e-43fa-426e-08dd420d7760
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?OWkvTGZUWkw1U0szaiswNzdtRFR6THdkeWk1aVVRYTRydUJleE5yMzhEQ3dO?=
 =?utf-8?B?OHZvVDNNdzhhMXNmY2F4TnRlQlFpMTVPTEt5TnVCc2JLcFZTZi8wRzVqenNI?=
 =?utf-8?B?SDJTZU1XeCthWTJsMnNOUXljYkQxcmg0bWR6NktBdjQ0ZWtaZkd2YmwwZW05?=
 =?utf-8?B?Y01YQzNZMW1rdEd3SExNVDE0SGVaMk5tRUprSFYxRzRGT2MyUHRYZ2pCVkZO?=
 =?utf-8?B?cFVZenU1Mk4yc244Q0dzYlhnNzZFSXVrS2MwWVVCeWk2WEFZbFRxOCtJM3Ax?=
 =?utf-8?B?clh6ZlhYdjY3UCtSd2k3akk1RGxnNThTZDVUOWNwamMvTzN3bTVDRmR3NHVz?=
 =?utf-8?B?M2hoeU9weEgrbUowMmk0NDR6NVlYd01sc3ROL3BabEZoazQxZGF4NUM2dGpJ?=
 =?utf-8?B?M2pKak5lbElHN05WWnUrNDN1WE9iSXRFZ3ZxVXVncjlJOXVTQ0VndmxmMFAr?=
 =?utf-8?B?d1prWC9oazFnamI1cnRhajZaTkNZK21nYXpaTmZmckJhU2RuRVFDYnNQL3BN?=
 =?utf-8?B?c0lhOHQwN3BUWkpLeDAycnNsbkFWSnJ0NlJab05HRUlRVTg3Rk9pVVZTRHNq?=
 =?utf-8?B?K25TZTlOa0dpOHRUSkJDbTF2bWt0cnZlQUR0WDNucXhCcnYyOUIrWEJPa2FX?=
 =?utf-8?B?K3BQa3c1VGM5V2s1MEF2NDd2LzdKNzVVemhMeHRnek0rdndDNFdjM2xOS0RX?=
 =?utf-8?B?M3R5M3h3dHNBNTQ1cFY2Z3lNMzYzaTBOTEhSaGg4VmxScWErUmEvUDVKa1Qv?=
 =?utf-8?B?QVVsR0hiN0EwQVBlWG1vVktYbUhYZElqZmgrU0pvVklvZi9jNllUYVNxQzNL?=
 =?utf-8?B?QlNSbktqRUEwNmNIb3BBTVVFT0JZZUhPZUp2QnJsaTNvKzA2TE9CWjdhOEw4?=
 =?utf-8?B?Wm9HdHpwdmwvV0p3YTMrK0dOcXZSdjd4VjNFeG8wWnlreXUzTDhlck1NUUp6?=
 =?utf-8?B?TGd1MmdwbHRyR3BPZ1JOSjJoUU5ldEhwcXhTM0RxSUMvVjJTWlVkQnF4Ykt0?=
 =?utf-8?B?M2tJMmlaeGdFVUNiQU5LNnhKK1hKdFpLb1AzUkxiREdjOVZjN1dOVkxrNEFq?=
 =?utf-8?B?amczcjdOT1ltU3J0RDVjcEdycTZjV3JVY1RyQ05za1EzYnJLMnY0bTY2L0w2?=
 =?utf-8?B?L05JZ3ZMdW1MS29WeG9Wc3FDRXpnaFJVZjBMZWxET04yYVYyL1g5Wnp6enhY?=
 =?utf-8?B?NjdkTTdOYzlIQ1dlYzc2clBpVTZhUFVvRXlxWEVkWVBibGlvcGMxZjNxbmpr?=
 =?utf-8?B?QUExZGE0T1A4YVF6cTVxTmc1OVdnYjU3MTNPczZpdEdQV2lLaTBKbmNkVWR1?=
 =?utf-8?B?eVplYUVzNHgzZlVWRHRxQ1pzUkZONmJSZTFtWnhDeEl5eUhOQXIxV2ZwRlhN?=
 =?utf-8?B?ZHVSK2JKdXM3YU1KUlNubEFsM3ZzYk5FQ2ZUMHBpcHgyN0NIZXoveHFnYWhl?=
 =?utf-8?B?YjZ4MDJOQmhuSHFZVXBITWtCcys1Tm9FeSswVzVwL3JqamdFZVJsbEY3TTg4?=
 =?utf-8?B?clFIMnBJd3FXaUZraDBKZno2bTJJaVFyS3VRdVEzNDBLSEQzZmhaTEJrK0Fr?=
 =?utf-8?B?YU5CSGhjMEFzRTdxdWExL1FhT1BSd0s5NmFQSWFvYzVRdys1L2xvOEdoNzNh?=
 =?utf-8?B?ZENRSUlLN081TkZGVTQrcU56eGMzR0ozWG5sdmFucDdCcDVSOHdVZ0lNUHZD?=
 =?utf-8?B?NWJyVGk5RmJBM3BJSU5mdEZESFl2dFJ2SXRsQXFPc2RCblVzaytpeVptWmdW?=
 =?utf-8?B?eWFUdVdBK3I2OUs4R2k2TGtYRUQ3eWUwenJpSWRqcVhsb2tsbUpKbkI4Nmg1?=
 =?utf-8?B?U0xRV29sRnBOd2ljOVlJWnJsT3Zoelh6eWdOcnBxSTl2QWtGUFRPQzNEbUJI?=
 =?utf-8?B?RHJIZ3NMVFdYb3JQaUFPOWRYeVVtSU5tMllLaUJXZ2pzam1Hb3Fub0F0Z0hu?=
 =?utf-8?B?SGh5WEgwaTZYaXFQWEhFcFVVSVBuRmh0Ymd0cTFockhVSjF3N0xuTHI5dTRF?=
 =?utf-8?B?MDFVd2FPM2J3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3JVeWt2REpZbUozbWt3ZDBYMnhTRXFuMS94VmQ5cVdMODNHMEtZcjk2a1E4?=
 =?utf-8?B?U3BTdHkxempOVnEvcEh6QjBGNTFkbS96TkxiNnpnbWdjL09vditBbDJ6RFRR?=
 =?utf-8?B?RVVWZmQ0RmJWS3lqNS9DTVJzTWtRcmlnM3F2OEgwQXVZK09xU2NwQ2hxWW9j?=
 =?utf-8?B?K1N6dHB2bHlWY0s3d0Q3bXV1NUN0L2xjNTdKWlJyMUtHbnJMdmh0L3YwM3R5?=
 =?utf-8?B?M2UrcHJEemE5NnA0YzFRUlpCRlFITlBqUFowejFYNkJTVDFjemUxWWh0cmxt?=
 =?utf-8?B?WE4ydlZvU21qT056ZFhMcnE2aVg3d29iakJ4VU1lTDNFRDA1RTlwUFhmS3V1?=
 =?utf-8?B?NWhaVzdVME1qLzB1YlE4V01hRGRRcVpGUjE4SlhzTGd6Y25XOGw3bStZVnow?=
 =?utf-8?B?MTU4dnJSK0huMGo2Q2E0aUVWSFBDRThNZWMrUmphOEVVNDZwaUNoajU0b0tz?=
 =?utf-8?B?bGlmNGJiNzZyV0dxeUpBOGdYL3loaHUwL0Q5Rk45WmxIL095QnNIeUNUR3lr?=
 =?utf-8?B?UDZxNGoxYlRwNTdoaFFTWVR2Y1FtSjVLZmFUWUJCY3FzQkpmYWtia0pnM1lK?=
 =?utf-8?B?eUZYc284V1dVRm5ZcFJVQXppdTBqT251UUpMY3NIZHdGM0U0MUxkNzBoMnkx?=
 =?utf-8?B?Tk1Wa2YwalluL0VGMFliL0FTNzluVnk3QzlkZDJIc3NUcHY4eTBtejJRU2E3?=
 =?utf-8?B?TDRuN0FuS3UycHlxT1ozMlJqQzVGenpjaDhrWFlzakNtenhvVWZnMTVleWRz?=
 =?utf-8?B?VzZGZmdGMGdGbTBwSDA5UXR6cjZIbUZhUTZpNUwyNFlhcGhZS3B1SVVXVmJX?=
 =?utf-8?B?a0xCb3pCSUJLM1lFODEzalJ0V2hVYTNhSHFnb2twM3RtenlldTAzWjVJRnYr?=
 =?utf-8?B?KzB5dEZFcVdlc1MvN2RVZ0dFOWp2N2dIYy9jOFY1MFRWMU5FNHUvaE4rRmt2?=
 =?utf-8?B?dnpaZmh2NEpxRmNydXVqdDBLVHBLVlhwcUN1VnRrS3djREpqZDVjYkQydzhJ?=
 =?utf-8?B?S09lT3Z4eStqN284bjJpL3o3SnMvbDlkNXJoQVJ1OHZ0WXVrVkl2ZnJQT3Bl?=
 =?utf-8?B?SGcwZjR4bVVpSlNrcGRpai8vS2kzZFcydEFGdVhvYndWaklNL0l1bWVsRUN3?=
 =?utf-8?B?SzFZMEFnM3Z1WnFPTWF0MWtoODZIT2FvcjRxejBzSUxBWXhaQmpsZTN2RXZ6?=
 =?utf-8?B?Z1BoU0xEcnR3QUZ2VGRxbjh1YlorS1F2T2gwcFlVMCtQbHBZOE5JZnhDeXlZ?=
 =?utf-8?B?VGNkTGdTbTRtTHR4bWsrYXpvQVBtbXYvUE45bkNEdGJyZ3NzUzN6VGNMSmZn?=
 =?utf-8?B?NUEyUENoTkwxYzRNYjN4dlp4KzBIZmdaRlhrYjd3OVhPa2loNDB4Qjl1NnJu?=
 =?utf-8?B?RTJhVmJZMW9NWEc1UmI1QUlwSlRZZDM1bTd0RC81ZVYrQnAxUlgyYnJwVFFT?=
 =?utf-8?B?bmF6U1RGL3N2SE9iV1dkUG84dEpsU2JvbCt3Tmo4WEtIYmpvWEdxK3k2alJS?=
 =?utf-8?B?SW54Qi9jM2pCdGZ0RW9yYjJpRGNnM2hWRTM0Q0FGemJDd2FXWHoycUNkaG1L?=
 =?utf-8?B?b280S3IzNFIvSHNwMkc2OVZSUjlCYm5jMXAraWQrazhzUmRzTHRQWGpLYXF1?=
 =?utf-8?B?L3B0UGdtSEE0VmE5cE9VZzJpdyswRlZDbkQybkliV3A4VzYxL1pDaWNWVWR6?=
 =?utf-8?B?cjBNaGl1NEZxSmYvQW5tSWJVWTQzaG1scXFVWkZORFlNVEdBUWVLT3RtR0NW?=
 =?utf-8?B?YzlpYldrOHIvTUk4N2IxMlhBbHRNayt5UVprN29pOExOWVU3OWN3YWMyUGNI?=
 =?utf-8?B?Q1h1R2VoOTNzYTYwYXRvSDgrWjl6NGE5YVdMOUl0TlhvOUJ0eWp4amRKcUpQ?=
 =?utf-8?B?QnBwaXpOVHZKRUZwVnZLazd2cUN2OXNibE1NenIzZG80RldZUTRncDd5bGF0?=
 =?utf-8?B?cFoyY1MyNE4vNkhXOVJFUnY2K1djaUJtWVByTlRFeVhGQlhTZFI5QzZHSGty?=
 =?utf-8?B?dTJhNXVRN0gzZnh1TmUvcW05a0g3L2pNTVcxM2pzcVVqcFdva0w1L3RyRTcv?=
 =?utf-8?B?U3djUUMvSUhreFZuYlFzRTJSancxdndPdndFTVNQSDNralRzYmh4QXh2N1lF?=
 =?utf-8?B?eEVZU0NseEdZRnAwVFFwbkl3R1U4aVQxSzB1RTVOaVpTMEovamhkSG1JNlZ6?=
 =?utf-8?B?Z3c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------P0MdgfQeEdYXNedVtX4QUROU"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba36b3e2-fd9e-43fa-426e-08dd420d7760
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 15:39:36.0946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPgtZNPh62wvB2y9rAce9anKIlW0nI7u/eg/FI6e/Dk+mqt/5S0Q1Gfp/rR8YALJi2poEsxU2dTlWuzM/rZgiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5503
X-Proofpoint-GUID: tajIFRHIY5xvnLY5hrum2L-wZSsU7Lfz
X-Authority-Analysis: v=2.4 cv=PoBpbxM3 c=1 sm=1 tr=0 ts=679ceeba cx=c_pps
 a=tbUAc5YXJZE2aXMCunvlBA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=KKAkSRfTAAAA:8 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=BkHBEoAOsqGd_N39oj4A:9
 a=QEXdDO2ut3YA:10 a=4Pkxse0IWY_76gmpYJ8A:9 a=FfaGCDsud1wA:10
 a=cvBusfyB2V15izCimMoJ:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: tajIFRHIY5xvnLY5hrum2L-wZSsU7Lfz
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

--------------P0MdgfQeEdYXNedVtX4QUROU
Content-Type: multipart/mixed; boundary="------------1RA7phgkaxBq55KTG1Fnun0P";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ed1920cc-7cd5-4af7-a945-bb71296010e3@imgtec.com>
Subject: Re: [PATCH v4 11/18] dt-bindings: gpu: Add 'resets' property for GPU
 initialization
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194839eucas1p1885da20ddfec840341879c120a21f514@eucas1p1.samsung.com>
 <20250128194816.2185326-12-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-12-m.wilczynski@samsung.com>

--------------1RA7phgkaxBq55KTG1Fnun0P
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/01/2025 19:48, Michal Wilczynski wrote:
> Many RISC-V boards featuring Imagination Technologies GPUs require a
> reset line to be de-asserted as part of the GPU power-up sequence. To
> support this, add a 'resets' property to the GPU device tree bindings.
> This ensures the GPU can be properly initialized on these platforms.

My comment on P10 ("drm/imagination: Add reset controller support for
GPU initialization") applies here too - would you mind rewording this?

Cheers,
Matt

>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 256e252f8087..bb607d4b1e07 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -37,6 +37,9 @@ properties:
>    power-domains:
>      maxItems: 1
> =20
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------1RA7phgkaxBq55KTG1Fnun0P--

--------------P0MdgfQeEdYXNedVtX4QUROU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ5zutgUDAAAAAAAKCRB5vBnz2d5qsFSt
AP9mSIN7K1rgY0V0HBRujbLzW4dYC154kcGu+tqruLd14QEAp7GKgWZaOidc5Ozlo8WyLoH2oJfa
OTHYWwLguQMotAI=
=5zhW
-----END PGP SIGNATURE-----

--------------P0MdgfQeEdYXNedVtX4QUROU--
