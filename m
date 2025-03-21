Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38772A6B324
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 04:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B98F10E2AC;
	Fri, 21 Mar 2025 03:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mWMOTJBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756E410E2AC;
 Fri, 21 Mar 2025 03:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWu7WrX1zLghaJ2Qq601qce/sRam50C3Eq0/80KfDW+kCTk4iywLbcylf/o/6PJ4OHTc2uiIM1i0N7UjHcbJhHNQxTSFImSqgf8n1kb5sGNrgy0y//dNdBulKsW6qIV8qmHS6I9mWZ6cNHjLt1k1Ug9FNd4IL9QL72WZvIX03PqCSlJ4KTBJ0aUKOrHGP+46K6cTLg1Av6rhoafBfbiKPoa1zrOt5DS3kawPPoY1D9reSsP6RgqjXOz7T5T9sVtweeSi1JV3cpgtiA8D9pwruTxYBKTdVRJPwX0LPdnhqeZ6cfK+as2DA/bj5hj7CetSx7/TrJvmDZIjV7SytLH5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OqnJeRy/fKNqHK4DTRJlSkjsJgK+Gnh6y0bZb1iIBM=;
 b=ZG1hq2C0FKn0+vlzcC+KLAkG+OcYF04C/bPYypqcGUtbP9VtY6okDAbBmq+w2W3UbMIFxW80eCsif0DwgW8cnYZYQvGYGa3TpVFLTd6B0lGXQW500+9J7vQIuSU4Kz75Dd/kSZjVrYC7Wb7IlWXZdsgp2jNesyZuUWibe/oH+P6WvIv1jnHsC3mIKf7ku4VIqOox3VQCnZxoxiU0OQsh3DCZxsriqWslhmD3BbwQaI4puOCCjlqUN8vQUnC4g5ngUZNrj48rdY8UnLxI3JgCi1ZGrQDvH5nOUF5EApTORJ3bjgyVBfcxCC3mvLHIWekwV4RK3mzqihFATdPyLwpX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OqnJeRy/fKNqHK4DTRJlSkjsJgK+Gnh6y0bZb1iIBM=;
 b=mWMOTJBubvPpcQvV+WrCSfNQ/vBVRxAaLOaz9OglJedR8dOLX9vb4tMNPIdC++Pj0rhXUKWZy7s7Lb4qMk9dkgfIV6RqOYx/x4gT196eUV6O//6WCVUpUpGe9vwYrum/GFYATnBczUD1KRBwsVsVY37urbTbNYCzxucAb3WlC+/yupYWOuqmb33Mq/6cG3+d2jPY5ksPsfsy+sP0JtUKszoh7Yczw+nRrahW+rM6j28wBAfG+OWVs0SiFqU6lngMbWPUDAVIUL3BV7H+dLKv2khkOOXfQskT3tChc5GKA5Qhyk0kOZyAnk9rIMZWJiQKnTLvM/GEhKDCFJ5ymwIp/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.29; Fri, 21 Mar
 2025 03:10:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 03:10:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 12:09:59 +0900
Message-Id: <D8LM4KOZULK7.XUJ0HXIYZH71@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter"
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC v3 6/7] gpu: nova-core: add basic timer device
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Brooks" <db48x@db48x.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
 <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com>
 <87v7s3zoha.fsf@db48x.net>
In-Reply-To: <87v7s3zoha.fsf@db48x.net>
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca91771-d72e-4e0d-230f-08dd6825e025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkVKczQrdWxVME4xU1JDQmpmbElaRU9tOHpYaTdoa21uUHFuVW9MY2kxTmNr?=
 =?utf-8?B?UU9TZjIvRUZrMG1SQ1ZFdDg2TksydnRyUUs0UmRaUlZYeWhKYTRUV3IxdFRY?=
 =?utf-8?B?WnVFVFFTQ0RGMFFtWmhraEhXUld6WmVjZ3J0bkZkdDhRL0MxNnMrdnRCb0Rh?=
 =?utf-8?B?RU50RjEvOG83WG01VWkwMG55dEJJRXgwWWxycGgxRmg2Rm9qTHNLYklEaUZ5?=
 =?utf-8?B?UUJYVElNeUoySDVXUUxkZk5rY0FrYnREYkpZa3lLNHpWcnp1NDZuVExtKzQw?=
 =?utf-8?B?VnBHMzlGVUE1MWIybTRDYkkybjV6MjRwbTN6bGc0QWEzWjIvWnBHLys5eFMz?=
 =?utf-8?B?YTRIMk02ck5jdktvUGZGekFrcFZaU1NQZDBBdHhCckU4YmRYMjNiUDZlWFUz?=
 =?utf-8?B?UXBKdGFseXhPZnByZWFucFU3bEFxbnVLRDhxV2xoT28ySVJwVXo1MTcrUnZi?=
 =?utf-8?B?R1NveWZseFNjWGRwWlFPZlMzU1BhUzVueGZwVFVsMVBFUjFBbXZTdnpzU1Ex?=
 =?utf-8?B?SDg3Mzc0bXprUkhZSnVEcFhwTUY0RTY4Z1lKNXVzVEwxQnlqQW9ZcG1ha1NP?=
 =?utf-8?B?eDdmYTY5SHNnbG41R0JqQkVNZWFMUEdYUEhZaVpYSlJFSlpEMHVxeFA4Y0ZD?=
 =?utf-8?B?YzlUdEdmb1BkMFRPQWhMRWM1ME5qNmhMY2tCSXh0czhlZHIvMDIwQUtvanFE?=
 =?utf-8?B?L2kyaEJPM1lzVnR4dCttcDAwT2MwT3JEREkybkVNcWl5TGJiSjRCaXYyK20w?=
 =?utf-8?B?YWV1OXRJSE1xTzMvSzJ5Uzk3SW15aENUQkFaWWFqVG55YWlhWlRxU1V0MThK?=
 =?utf-8?B?ekV3L0Ezd28zc3lTS2tPVVlZRWJJNFZFWWorV0xhZFRnY1Fnc2w4a2tzL0ZK?=
 =?utf-8?B?UVNUdTA0TzVWaHhjdGRnaVNTUG1sZ0N1cjJQYi9IdncwNlpYbUt2UHpyNW5K?=
 =?utf-8?B?SFJQUmUwQTdxQmJZMCt5NmtOcDdyeEhndGdYWFpPK0QzR0tzRmpqc0NnRytG?=
 =?utf-8?B?U0dIOGNjTkwxVUwrYjlhZDNYcllSN09iekhwR2lPcFdSM0Z2OG03SWVsa2Ji?=
 =?utf-8?B?emVnWXV1Mzl5T1hyUzVnZDRSWk5wZldxUGtMV1V3eTJlODUrRE54MTllaFRa?=
 =?utf-8?B?NjVTNFdxSSswUVgzOE9iNFlXbUN3WmRWeUFUR3lzbm5uMGJES01tL3IwbVlN?=
 =?utf-8?B?dEVWU1ViL3ZOYzJORGxiVXBwTWtnNWQ5eFJSVllydnYrWVo2aHBKYUI1MU1i?=
 =?utf-8?B?bTFNNksxcmVDam9mS2p1Ty82TzM5aGtiZWdoZHVQb1lvWHlvNDloTEViNHVS?=
 =?utf-8?B?SUo5enJKeUdoR0N5WTNMdktDOWRnRmpYYnU1ZnA0QTg4MVdLUWdGSlg0bDRI?=
 =?utf-8?B?cFlCNENQNy9SUklXSktHd0RNK2JBc1k1cVhNdHNnTjd4MnN3MEpyNUk0MGZm?=
 =?utf-8?B?anlqd2FqWDRBdEhJUHJyanE2aEFkUjBGV3dyMk9CNnYyUWlQVHltZHRJUGtF?=
 =?utf-8?B?d09YVHg1Zm1RTFY3UjRJTnRQeW9rMVB2eE0vK3pJcnpHU29HRmI0c0hRLzQr?=
 =?utf-8?B?MFIydnE3a0c0Q2prWkZvQXNiejd0djl0WVBWZUJOUmlmWUxmOUc2VHdaVllm?=
 =?utf-8?B?dkNZNFFzUlp5cDBzOW91UjFQb2U5L0hBTGpuRzFDV1J5Y09jRmx3TGRDTGg3?=
 =?utf-8?B?bXVzcHV6OHJGQjNGR2h5YXhIdGxmRm1IOXNCTW1kNUZUazA3NlduRkpwOGJi?=
 =?utf-8?B?NkZWTTl5bXhPcFZhYnZqSHp3NXZYVlY2L0huZ0xWN3cvNTBMUU85WFdtTFVH?=
 =?utf-8?B?bGRDZ0xQSEhJdU0rRjN3UzdFM0VwVjNxTnozbkZNZU5uenVUcDd0RXMwWHRo?=
 =?utf-8?Q?T4qziQAoS8TpX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJDU3NMcGJiODZybjlNQmhyNmVJSnU4dVM1ZXFkZm5qMVlRU0w5bG52NkNn?=
 =?utf-8?B?eEtjWjY4RXYxbjR2KzBvYXVUVXlJS0ZtWU10aHdiRFU5M3psRE9wVVVxTE83?=
 =?utf-8?B?Z2VqSFpPbnl3bThjanRkblVxUTBDZDJqaVRaSWtweXk3aXg2Zi92NVFHNE1W?=
 =?utf-8?B?S3VGUHYxTk5PNGIwcGNqN2I2MWRuL1RDOVNQZlkzK0tvajJFSVNGRzNWMFVU?=
 =?utf-8?B?a3UxWHd3elJvblRZVUQxTm9kSHJrVWxuQkR5VGI3dGp1U1ZvS1crT1ZST1RN?=
 =?utf-8?B?a29uQStXYnZqQzloY3ZRSzdxRXY1MkZheG9TUENkWmI1KzAxK2hiSGpMVWN2?=
 =?utf-8?B?VnI1YXk3SFRKeGxoZHJ2aGMxeEtNM2JkTHMydWdYb2pSZVBLR1FLYzVOWXNs?=
 =?utf-8?B?QXVVck5tcHUzVnZLbzBUbnVIeFpCVjZmWkVCZksxWE5tZlhwdUZ0a2NoSXc3?=
 =?utf-8?B?S0VrUFc3V1hHc0ttQTc2ZmVlcVJTTXVQSXh0ZXk4U2xHYjdqcTdrM2QyNFRv?=
 =?utf-8?B?WHBsVEprbk5hQ1hVcHc4NGM0MjVJY1hYVGRLU01jUmVGRElqb1RFN29ybHcz?=
 =?utf-8?B?Z3pMd1c0cHcvMFZWMFFmdVh5Nnl5TjArcmgyWWpjMEhnSTZ0QlYvbnVRNlBU?=
 =?utf-8?B?SSt4Y1RQZkk3ZEUxNlRXWEtWdkdqVUdESnV4SE5iQmVhVmhvZ2ZIRmZ4RGcx?=
 =?utf-8?B?ZDI1blBsNm9BWTdNamlUYUYyN0E1eUVESXUrenZ5WFBiRzFTOG5nSzJTY2dE?=
 =?utf-8?B?WWhFOFBmeXVXWnJGZzNPdTQrcWsyTmdoMmt0d0JndG95SlZUdFJKYnpRZVph?=
 =?utf-8?B?L2NEY25FbzgraUY1Y2ZWSEhOTHNad3h5bmVnQ0hJOStQZVJWS01wRDl6TzU1?=
 =?utf-8?B?elcrN3FQV3JiMWE4WEFXN3h4VVBPMEp5N2hCbVFQOHNoZnJxNjBrSllLbjVx?=
 =?utf-8?B?MDZORG1ycTdpTFpnNC9aNStlOTY4WXRoWWVLRXBuTWNEaXZJOUx5QVV4cXRt?=
 =?utf-8?B?VVp3M2tCdG1aQTF0T0JWeVhqLzJoT0FWM0VMdU1ZNG8yalk3Q2xLUnJqOXhp?=
 =?utf-8?B?NkZkcUF3VWhpYmVyWDJTclVUUmlVVmlPdGQ5ZlYvSmZablZjcTN6cTN5MDVO?=
 =?utf-8?B?U3JzZDN5Z3N6b0dUQUNuNWZxekgzRXVFZjFkd2NqQ0FTSWovS1h4ZUpFU2NP?=
 =?utf-8?B?bjQ3dUpDYm5DcW9CeVJ6MmZ1eHR6UWEweGRJSFlLZ2phbmh2OUp6NlV6c3pM?=
 =?utf-8?B?V09Gc25HM3h2Q0tpNVdoeUpKVmg2S0VXQXNzRkxNWjNaRkY0ZDRKVkVnZWk0?=
 =?utf-8?B?VGsxZlVDczQxUTVZclVhWHhzcnlreG85UitUZStaaXVvTVFvZmFFQnpLRTRh?=
 =?utf-8?B?dmFSN1pKZzREWUlKYTdYOHg1bGZ3c1A0NTI0bzhxOU0wMGZwR09YVUdhS01F?=
 =?utf-8?B?K1dSNFRnSU53WTdJMGo4ZHVGRzNOZmxKMm9KZFA2TElMZzJ2dkpNaFQzSWJY?=
 =?utf-8?B?bG5BRW9BcVl1Z0cyTUswajJDemVoOUlRQUVZbVFDdkNDMURhQklwbEpWb01B?=
 =?utf-8?B?WWQ5clhtTW03NnRBVERzazh5UURvcnRTU25CUEhja01hOXIwMFFCME50M2Vn?=
 =?utf-8?B?VFhLMjNRTloyRG1wV1BKcXAxNExITlBzWXRDZ08vMEVsaklXKy9rWXFBRERI?=
 =?utf-8?B?R3JmQjVVYSs4UGUxejU1eE9oTXdabVZ2SHUyaFhzVnRtQnMxbjVlOHRLbytW?=
 =?utf-8?B?ZHlTTkxlbzM1TlF1M3JGYStaVWhSMG9IVnlQME16U2xFcnRqZTc1Qm9vZkhH?=
 =?utf-8?B?d0xmWlA0K3huZXBPclJQQm5IU2R5cjJuVE1uVlFma1ZBWmc5cVVqQXk0TnJU?=
 =?utf-8?B?T2MvTEt2SE1hQzF3LytZSWpOQTlWRi9jc3p4dnRIK2dZSVdQelZQT1FDRnkx?=
 =?utf-8?B?UUQ0WTVQQUJIMHJja1I3aksvam9vb3JUU25iUmdaUU0xYVlDUWtJbXZ2dWoz?=
 =?utf-8?B?OFB4VS85T2wvSEgrWEtoY1JsSEVLV2ZBczFhNzNpR2pBamROZUJqVXVrZDFu?=
 =?utf-8?B?eEVHbEs3dVREVzhCdDdidGpTb3R6TkRDSHZNem1yQXdaNFE2Y0NyNjRObmpL?=
 =?utf-8?B?L3NSSmdQc2JjOE5paXhNS0RGSHJDMExIL1hmOURYaDVpSHE4dWthSSswcUY2?=
 =?utf-8?Q?YKe36845S/5pojh2FdMzApviSaxB1H3vkZX+RVFsie8m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca91771-d72e-4e0d-230f-08dd6825e025
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 03:10:04.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqPTqgxz3katIyLppS7oE7B1c9gUUjwwjKbiqUcwBxiN64jcrZyKbTLq9kd8Vdjx1ScErH/YxWtngf5lT9t0JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831
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

On Fri Mar 21, 2025 at 12:54 AM JST, Daniel Brooks wrote:
> Alexandre Courbot <acourbot@nvidia.com> writes:
>
>> +impl Add<Duration> for Timestamp {
>> +    type Output =3D Self;
>> +
>> +    fn add(mut self, rhs: Duration) -> Self::Output {
>> +        let mut nanos =3D rhs.as_nanos();
>> +        while nanos > u64::MAX as u128 {
>> +            self.0 =3D self.0.wrapping_add(nanos as u64);
>> +            nanos -=3D u64::MAX as u128;
>> +        }
>> +
>> +        Timestamp(self.0.wrapping_add(nanos as u64))
>> +    }
>> +}
>
> Perhaps I missed something, but couldn=E2=80=99t you simplify this method=
 like
> this:
>
>     fn add(mut self, rhs: Duration) -> Self::Output {
>         let stamp =3D self.0 as u128;
>         Timestamp(stamp.wrapping_add(rhs.as_nanos()) as u64)
>     }

You are absolutely right, this loop will just wrap self.0 to the same value
after the initial pass.

... or at least it would if there weren't two bugs in it. >_<

- It adds the lower part of nanos while substracting u64::MAX from rhs,
  which is completely wrong;
- Substracting u64::MAX is also wrong, it should be u64::MAX as u128 +
  1.

So thanks a lot for pointing this out!
