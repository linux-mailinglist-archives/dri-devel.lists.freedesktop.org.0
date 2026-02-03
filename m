Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JEHIPIcgmmhPQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:06:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD357DBABC
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 17:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30A410E6EE;
	Tue,  3 Feb 2026 16:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="UVDwivBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022094.outbound.protection.outlook.com [52.101.96.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC95910E6EF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 16:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZ4fNKzSBrW+PntWxU8R78rQlV40qTd8pQQnS6IW1l32HGpTy03kHi1+HBdWs2aB+N8LglVgX8io1Xw7+Mf0AKPwrFExoazMpYCHCs7vLf4MGz/9rCM1uRoR1QAXB9iTWYDAJOBk1+BvxF5ISB+ItLU0XHyyI7uVP81Qf7hXsTDbZR8FqM0abWUJ425o67pOC5ZDH2IOPjYa3emGL5q1e1lwGoR7cy+3ecy/0QdncwIeW0taLoj4PPPYoawc+Sxgyf8NyuMyO5xwumOlo0E6hRbVi7ZfWL5COJrZO0WQYEdtqLxHuN4CDScxffP2ii+n8YHNh7gEqTKW6VDIXrrfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ3GDieNUw3D12fzmNeFRmQpiA3Lw3dBFmNuqJpfbXY=;
 b=QkPQzLmgfVKN9fIcy5ySW1Nbrc4/45uZK4JLglO0DmsdUvJdN62Cj+M3uyCU4qK0RDv/u/8ubpDLFeUN0J30QYSUsxpHn4+5hoVcF2tVukXjscsqCO6kItSFwS7J80ItW/lwYoD2+rM892p1yHMPpUYcukVpQRTH5xGp7M5FC/1a/+b7QKoDnsB9iB77aRYZJ+jQsjqHK66oJ7dsEfNj2qjAK9XVf/DnxMcEwZfa2XHxIjb2kkxbB35Zz+AqsWoZypYY4NpfYONuc0RSQgP1QkZnm4yRq1yUgJL98DSt/O2eeh/T4j+OQFGlnJxCVNVWKxhVXBBcXhYOKJPZ7CClqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ3GDieNUw3D12fzmNeFRmQpiA3Lw3dBFmNuqJpfbXY=;
 b=UVDwivBRIiu42KJQDlJf0kfOQE8TFo19eWwHWTsPAQuHi0FiMuHK8vlqYekmFPVAHJjnltaqxJAHZxy1YumkQepkbvBl7YJ5v9Rwg+JRJgCtBxWT82Z7IRIHsUT9XuYBUvuDe6fheJvGCVuhSWi23xQOGkTB+M5ZID8P7XVESAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8695.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:05:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:05:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:05:59 +0000
Message-Id: <DG5GEI3PN79B.11GJWQDXXC1SZ@garyguo.net>
Subject: Re: [PATCH v2 3/6] rust: device: Support testing devices for equality
From: "Gary Guo" <gary@garyguo.net>
To: "Matthew Maurer" <mmaurer@google.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Satya
 Durga Srinivasu Prabhala" <satyap@quicinc.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Michal Wilczynski" <m.wilczynski@samsung.com>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>
Cc: "Trilok Soni" <tsoni@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-pwm@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-3-d6719db85637@google.com>
In-Reply-To: <20260203-qcom-socinfo-v2-3-d6719db85637@google.com>
X-ClientProxiedBy: LO4P123CA0627.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: d07c1df5-9fe4-44a5-3316-08de633e1f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGFudVEwSGoyK3VWNGxJT0l6SXBTSWZlZkNlYS8yRmFseGNDRkp0UjhiSjkz?=
 =?utf-8?B?UElySVBaemR0eThHY2Y0cW90eGg4RmRYWW5qL2xBOVd5c1hOckNVYjM1TnZv?=
 =?utf-8?B?OGxoaHFQOWNBNDNVV0JyZWZZWTJxNVhSWlhIaS8rKzJvTDdkTmd0c29ScUJW?=
 =?utf-8?B?M0FrY1RqUXRtaGl2VW5lQnFmd2J4NzhGMlpaTmhudTM2dm5KUGFGVGo4Yi9h?=
 =?utf-8?B?dFN4R0FadXZNeTNTWEwwZEQwQktaVmlmOWRRMW1HdXhEM3VCUUh0bTR1a0dP?=
 =?utf-8?B?K3FnMWQwUXhsNkNzSDJkeUxTZUtUSThNc3VjRFlyWkM0aHVzUW1xellKa2d4?=
 =?utf-8?B?UFVOb3dmS0VyODJtdGxMZzk2Z0xnRFdCcTBYNXpoc2pjSjYrWkJtWllBSDAw?=
 =?utf-8?B?WVpuM0xUT2JtSkhlYjBUVytHVEpYaUNVRzdQalJtQVI5LzRNVWwrVkdsMENm?=
 =?utf-8?B?SnJKMTR0UllaM1hGRjQzWllqVjUrbFR0eE5nSkxrYzFQTDdqcmkwQ3drc2hi?=
 =?utf-8?B?T244d0ZFN3EwelhCRUJ1bFF5YlBLQWwyY0d6WVBJeDRPaCtlRG5uRHA5b251?=
 =?utf-8?B?cXcvM1BhS2lZcW5pWUJ2MmJkU0sxNXptWkk0RjJudU9UVW45WjVPZDEzbk9J?=
 =?utf-8?B?N3RSNGNFYjh0V2cwTnM4Q3pYQkorYy9HUmhlT1VYQlBjcjYwcjdhMXg2Y1lj?=
 =?utf-8?B?SEpRaWppSkUzc1JkdFh2eXJaWkZpK21aOUc2d0JCcFF3bVdKUjkrYURETUlB?=
 =?utf-8?B?cEFKVW1qUXFyQk9LSTc5YktsRGZDVXdCeDNmRnpnTHZqY1Z0ZE9XMGhkTUpD?=
 =?utf-8?B?VW9Edld3OHVBRVgxcGdZTUlPZGVEUzd6UzNoWnIyZkxJeUJTU0gzeVRLUFNH?=
 =?utf-8?B?Z0lvTmQ4QkRLSDBDaVcvdkV5aHl0NWJaMVVsVG5MSXIxT1RqVmV6ZlhPQno1?=
 =?utf-8?B?bGhnREVtZVROd2NBWmMwMHdNMDd6NytuN1J1L3ZvNDU4OTNweHNwOGtCQlBV?=
 =?utf-8?B?YjBBLzJiTGsxMHA1QnJ3eHBDYlluWEczSE9RMHQxVXkxZ0c5QlpJZWZNc3BV?=
 =?utf-8?B?T0JkanVMalU2MzBUUkNrMUlpZWswNC9JTXh5L2M2QlZhTlRXemlzZUZ2S1VY?=
 =?utf-8?B?eHdKRVNJT1ZkaGJxWlB4K1lGdkE2MFJJMy83VERaNTJZb1lJanVGWXRuUTZS?=
 =?utf-8?B?cWE3bE1qWGRCV2ZxejNQcHB4aUdveXgyczZXaDlaSjMwUnRwcFZYR3FkZHlO?=
 =?utf-8?B?eXJVWE5vTnFMcEdLckNXQ3pBT2x5NGs2UkpwMGpkampvTDVZKytaZDVLOCs5?=
 =?utf-8?B?d3ZFa0FtMVNGZHl6R3pja3M3WWxNN3dCVkhMZHR4dUJGMGtHeUNLNmh3SlNR?=
 =?utf-8?B?U2FCVEJWT3lLL2pablE2aUxHZVJ6aGhrbFJJbndaMlVCY1B3M3o4dzhZVlRE?=
 =?utf-8?B?Z1h1dWNBcy9rUitOVnB6OFVqeTh5N3hpdVFhYVZDL0pUcFUzTEYzaEVBNjc0?=
 =?utf-8?B?VksvSzRLSklKa3lrbENJQjBqTms4VlZsZEdPQUh3cHRIcXVBUlJNYys4ejU1?=
 =?utf-8?B?dzc4NWpFaEZVRVZQVlQ5TENLQzRoNUswbWpJY1M1aU8wbkFrcXQreXdHUDZt?=
 =?utf-8?B?dklhZm5nSGp5QzRSZHdMWGR6bzFncDNZbTdkNGZ1dFMzZW1ucHlWTWJqZEFn?=
 =?utf-8?B?ZmtyNmZ1b0Q3MkhPZXc4VjVCa0VwUHdpSy80THlrU1A1UE9saE5FTzJ6YTlv?=
 =?utf-8?B?OFZDdHp3dCtjU3RpT0FMWkY3NDlaeUVwUlFJWC9DZnMrYWsvZzFUdDQzUHpy?=
 =?utf-8?B?TC91QzlsUURLeU1zRWJvQ0ZDTWlRdzV6UVFISkhMNWNiNXZGcHN0S21KQjF6?=
 =?utf-8?B?WkJuN3JWd3N4eVdjZDMxTmpyd1puT0tsN0dRTU9CaFF4M29FQXFubkxaT0Yy?=
 =?utf-8?B?Q3dLL21tVm1XbVBuM0NxMGFLT2RCTjcxVGtWOWJGT3N1cW42ZTBTaG5YcUxX?=
 =?utf-8?B?ay9FK01weXNkcEpxcStNYitFT1AybjV3NGVmbmFZUnRGVExKWVVoNmJ2dXZQ?=
 =?utf-8?B?YTF5Z3JnWnc5ZWMveEprU2lTWmZib1VQWjNFNXN0cytVaU9FcUdGWjR6V09Y?=
 =?utf-8?B?aEpwelpOdXcySUZrSzY5R3NSdW5NdTUzbWRLc2NlaU16cHhmY1RjcDM0eDEz?=
 =?utf-8?B?UkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0UvNXhOL2Z1U08wUDMrZXBBSmhMRGVEWDh0NVlDKzhHdHNMZVYrbkxtWmww?=
 =?utf-8?B?SGNiRXdTOWYreHpyS2l5SXMwWk92Zk0xaWx2T2kzalhLeUVjOWNrUFlWbU9m?=
 =?utf-8?B?MlBobTVjditBMElJeElrT3Jsdm56QVV0blBibXRUdDNvUmpLaFRGNEVkN0ZX?=
 =?utf-8?B?RkhOa0dieTNtV3hoL0g4cUlWZXRPaUU3TXQ0aCtUcjB4YURtbXNQSHRidTJ5?=
 =?utf-8?B?SlBYQnJzVktnV1NaNk55bUM1MUFTSXBoR2tZVDFzeTNMc2R0WHBvSWhKQVkz?=
 =?utf-8?B?NGd0Nm1nVmdnZnRsMjZtc08ycHo1Y2NRalRvZjdIaTJYc0pkeUUrMm9oWDls?=
 =?utf-8?B?VzM5OXdPeko2NHBMWWNYa0MzWTh2bzE0UWQxVll4dDkyV1c0R3oxU3lCcDRj?=
 =?utf-8?B?a3NOMjYvMGY4RXU3ajVidEx2VHBJZlpxRVNCTHZBRk9Rb2RsL2prSE5ZaG1T?=
 =?utf-8?B?RnVZd09kSnB6OWFmWTRsOHllVG9CLytxRVhYZ2pWUDdJR0YvQW45S08wdHpi?=
 =?utf-8?B?YmFPRlIyNzd3QkxzM3c2ZU54UG5Nam44eU9sWTVRVDdjWURvQ0RJVmtjL2or?=
 =?utf-8?B?Z3h0dFpMQjFDVVB5UjVZVDVFQW9vb3ZCdmpUNjBURFV2bmRLTVVMSjJzdnJX?=
 =?utf-8?B?NncvMzB5eGRZTGZadUk1cU1OOUc4UDdPVDd5WmVXb256V1owTDlsOEk5SVFI?=
 =?utf-8?B?K3JRcmYrOUw0VWRGWlNVVjRzSmZQSEpiRFRmT1ZmUTdEbExYSXJRMHNXNGVu?=
 =?utf-8?B?V2pVSGZzbVU5dWUzYjh6UDZmWC9MVVZ0SEhuVm84YmRYV2FUb09zaFZYUWNO?=
 =?utf-8?B?Vkc4M1l1RSt2cCs1dTRaQlNteHpKQUxKcmZwSHpsTHBhL1pLS29oaEltWSt1?=
 =?utf-8?B?UUxmbzIyRHFuQThSVG1GYm1lU2xFaHZ6cGFMZzdYcDQzaHo1bnRJSnppbGtI?=
 =?utf-8?B?OTN0OU8rNG5DYi80ZE5GVW51ZVNrOStIR09jMVNzT2pyZTZuMEpaYjluSFo2?=
 =?utf-8?B?bE5PSElnZzQ0UXlrcG5SVVhZTUc4NXU5S2xUc0NjWXV1TnNkdFN6YjEwSnFD?=
 =?utf-8?B?bkh6UUI4UkFPNzIxZURsMXV0L1FKTVdFKzF0YTl4TDl5cDFuMjBNOTBib05j?=
 =?utf-8?B?dUw3N0VIZlVCQkp3Vm5pL2VtZFlRdmxRcjZoeGRGRFYwUy9HVWNWeDZuSjBW?=
 =?utf-8?B?c2piaElxSmZPL2U0TjZXRUVvTktwNGQvME1ZMHR6ZUVPdkp5SjhhUjhhTTU2?=
 =?utf-8?B?ZTRuN0k2VHV3TkZSZ2JsbjJYbm4rcG1YMHB2WkRhNXlZdGo3TTF0bHZxNFl3?=
 =?utf-8?B?dUV6NytWUXdBclhkZERWUFE5Q2hYd2hWNlJpUGVrWWY4OERXY2ZOOVBGUGVW?=
 =?utf-8?B?SGhmNEl3OENrWU9peGZxOWNKb3FUem9sRE15dE0xbWdBN1VrVGxUSnRramV3?=
 =?utf-8?B?Sm1KUElReURoeC9kNElRRldLMExNQ0xBK2xKdE9ocXZYNjJWTS9ZeWhYWGR4?=
 =?utf-8?B?SE15dW50R1pVZytEZGU5Q2JERjMvNVh6ZjZqSDdNeW80VDg3eU9EM1AycTlo?=
 =?utf-8?B?RUtYQm1vU1EvbG5BY0tGZnYxYlJNZGR6cjY3UDduQ0pVSzU5azhPTkZrN1do?=
 =?utf-8?B?VFZtazQrL1JmUjNCbkMyd3hQZmFsSmNtSTFubzBIR1ZrS0pxbTVwU01uenVM?=
 =?utf-8?B?N0EwZnZLZVVNOE5ZNWNaeGNIdVdDTTg5ZzJ1Tzl0RHhkT0l6QmJNbXQ5a2hF?=
 =?utf-8?B?NVdnZTVMeWp5K3FWMzhYMWJoaGpzeW00c3orbE9GWDFHZmZMQXZkZ0dnWFlp?=
 =?utf-8?B?eTVBT0FpMXlldkNxUDA2NzU3QnBBQldKdzFBendxSzFIays1d3owNXhWdXBz?=
 =?utf-8?B?YzlGYjRUdFh6UW80T3NzRUJKM1U0Rkw4QjRHSHNkYzdVR3RNWEF2UzhaZ0Q3?=
 =?utf-8?B?bjVkZnAyRXFqNjlHd3VDMmM5Yis0KzF0VE5xSEVtQzJGTGlkMENhdTcxYjlj?=
 =?utf-8?B?MFAvTi9KU0dGME0xMkhlL3hNVG02ZEVEOUJwbWZGdjBtN1JrNXVVblZGNlVG?=
 =?utf-8?B?MUVTVXhyMXJqeTJHR1IxbnpXT1ZLY0lGeHBVY0dDa3FMUnAzaWNpdTg1dlRz?=
 =?utf-8?B?QUNsaDR3dDF2Q2ZTd2Y2TVZsaUtueFJuVE0zeEJ5dzlTQU9CWElVa1c5TDE2?=
 =?utf-8?B?RnBGaFZZS05wZnMxcUNjRy9FTWtMNXMxK0VZcXQ3SjhJKzJuZmJCeDVyZ0dC?=
 =?utf-8?B?ckI4Sk1HS3dITlE4RysyblRCMk5KdUs3a0FFK3BSOEtESUZTZWZFS29sUHNV?=
 =?utf-8?B?VUMwcFRhbUxiSVg5RmhFOXUvY3pIUFpNREk0TUpPRzJBQ1h3L0VUZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d07c1df5-9fe4-44a5-3316-08de633e1f42
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:05:59.7818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KGhMKpK/t3vv4TKC0Ga7Wa8pwFOe6bqbkUiXeBrGLzg0d4RKsvSS60BUYCXahHUwzGKGB2Zez0ZR1OpNLKAAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8695
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mmaurer@google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:satyap@quicinc.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:m.wilczynski@samsung.com,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:tsoni@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-pwm@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[google.com,kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: CD357DBABC
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 3:46 PM GMT, Matthew Maurer wrote:
> This allows device drivers to check if, for example, an auxiliary
> devices is one of its children by comparing the parent field, or
> checking if a device parameter is its own device.
>=20
> Also convert existing `.as_raw() !=3D .as_raw()` to  use this new
> implementation.
>=20
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/device.rs     | 8 ++++++++
>  rust/kernel/devres.rs     | 2 +-
>  rust/kernel/drm/driver.rs | 2 +-
>  rust/kernel/pwm.rs        | 2 +-
>  4 files changed, 11 insertions(+), 3 deletions(-)

