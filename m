Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DBFB8BB5C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 02:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F810E03E;
	Sat, 20 Sep 2025 00:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DxDYyAUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A3C10E03E;
 Sat, 20 Sep 2025 00:52:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTG5V/TPZxC8UtzIAoOpP7FhVemIx99l5LTyS5sUMpD6xrv6RY2ncJB7Y5rbJxf73jxj1++DQagkzrSDitm7x0DR75yU7004d9mztxcCVUziyWzG0Qyak4NuKxfXqGSoRWmhLXDQbi9z18hXvV9SW8L+3pnb2PlgAS2j9q9TGhUm+2vu2OUtsRUU0YucrZZLTZMhmIOp6h8ncbp8NMA5G4c5+cRAV8PSOdCSUnWYhiI8iofZGLrHu57P7hCvIHYQNo1awvWYbv2FJ1aALLCPq3Dlhvio6DmMufPbCdVdKxQyKAShzuzm/ogWEcn+6bDT29bQvIDxwYYyAtX8lK9Hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVdo89o9rKfx9/WeaoYjy9ICD/uCMNd19TKyAJFp8CQ=;
 b=bnu3C21JtnpGQmeS23siLfJA7YDzNEF1TGzro9sRrRrozQn8t2ek6P+xDnn6ewdFh7i0ZBpmYPTSdkglWql+EW3L6NGKj0/h6wVSYOyTL3kjKRsWBJd3miUW0+DZ8W+fq70tFPq8UyLtoMXkI2yk2Y22PCpQzD9ah3p60w8IiUy6UvLwGaCz9QRxjG6jMMQyCwmdh8CGxWw+URGr8OEsiOzfdZcLa4y93sU0Qe8n0aYCM2dZn00Wr1YBY7l8tim9revCzts62PUGCoTnGi3zhhyDw4ofz3oLuEyGQjEFrAoQsCkNGTCHDghFdtzsvBzvh2QK/29PZfHmrSEELg7mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVdo89o9rKfx9/WeaoYjy9ICD/uCMNd19TKyAJFp8CQ=;
 b=DxDYyAUGgFvY7cTn8IevO9WebYDCYgR9DL/pbbx2bbTNgRhDcVMhwlOG/KssuxDqXg0whaynKYHFQwkkilVgH0CZR4L+Om54+HRjAiI6eczidsNQRNqORizVItpfbm65wjlhXpONBQhrJpiYdcp+ji/5Ie8pFoMf4hErGRFqxBSjaanUi1TiM3+NhnLYRWJhf8RRJImrVPeCrMlAcsgZko433OMnUxy7UKKJcgggewrlMnKa3Sm7R1Svpb5HgikYUEYPwWN6Yf6eCBk3qmi2clJJoYOhB7Zt8d2RbdbWuwF6bgOdYKH2JrmjwZc3orKK6ws4U3RsJJmgfP0viFuq3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Sat, 20 Sep
 2025 00:52:47 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9137.012; Sat, 20 Sep 2025
 00:52:47 +0000
Message-ID: <569b2f95-fa8d-4bd0-9e90-512b677435fe@nvidia.com>
Date: Fri, 19 Sep 2025 17:52:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
To: Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com> <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com> <aMIqGBoNaJ7rUrYQ@yury>
 <20250916095918.GA1647262@joelbox2> <20250920003916.GA2009525@joelbox2>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250920003916.GA2009525@joelbox2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd0fe2e-cc4f-4596-e799-08ddf7e00428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0JKS3Yxa1ozSGtQUjhZcnZXY05TbXNyT2F6MUVsRk0vWFQ4NWVoYmpZQjdY?=
 =?utf-8?B?cTVURXczbytRQ1pQbitORE9taTkrRGxTV0kvczVDd3pyMHhISU5hbDZQMGxZ?=
 =?utf-8?B?a2xpVVBMTEtLZTMzNURaaThmNHF0MVNrenJFb3pEM3A0dEowclVZV0pwUmVB?=
 =?utf-8?B?NTY1MjBYTENtVHVYVVRqMzNRWlZqcmw3QlB2cjZoUnZxdWU5R3ZUTDk5aDE2?=
 =?utf-8?B?RXEyRVpZWXcxK1RCZkh0aUs5UWRmeXFDOFg1Smk0TW9ENlJKM09PbEtYN1RZ?=
 =?utf-8?B?OGNMNktIRk5EUXlqOUNvMUFTQm55SXVDRTVUQml3bWEySjJLWDlOY0d3a0NI?=
 =?utf-8?B?UlQrRWVpa2tQQlhDZUJoN1pubWhKR3R3SU9lM0k4Y1g2VVMrY2ZRbFZGU3h2?=
 =?utf-8?B?Nlg1UmJBOEZpelBUVjl6ZURQMUhWU01qRVVDNVpuczJDMVNUbm5HOCtIaFFn?=
 =?utf-8?B?dmJZTkJ6Y1NSK0N6QVNpeXZqVjVwanAvY0h5ajZ5d1BIdXJrSXAwalg4eWxI?=
 =?utf-8?B?Wm4wbFErL2U1c09CMEwvanhSOG54NjNuVUFTSjliMDZLNXJXM3VlQWw4ZXZU?=
 =?utf-8?B?QXRlWWNlV2d3MFJpcG1lbDlQYm90ZjRGWi91eFMvOUVPTWFyMkE0b2xielRw?=
 =?utf-8?B?RnVwV1MwYXVWODRKVVNTV0JsL3U0QS9VYzVyUVZoY2R0UmtoM3luSjZVczdw?=
 =?utf-8?B?WE1rUGNRWjVvVGhNNHh5eW54bG05UC8xU2FxSlptR0tYeU53NEFEeElTdFlx?=
 =?utf-8?B?Zzc4WlArakRKQXJIc2NVUUlPcTIzZnRWMzYybEdtN1FkeE1uNTl1dWJyR25U?=
 =?utf-8?B?ZW5sWFczNXp2dW1KVVk3cVZmbkdkd24wM0J6SXRUcXVORlVYa09UZDZXZUtC?=
 =?utf-8?B?bTQ3WDJCcHVyTTAyVGh3bnZTbVN5RldWNXFyNUVvSFlNR3kzTEdHT0pzVzlR?=
 =?utf-8?B?TTVxRyt1NEJIbzQ5Vm5hRDhzZHNsaGJkdWpRRG9iM0hoakc3ZWcyaDM0Tkl0?=
 =?utf-8?B?am9PNU1WczRvVFl1ckZiQUZHaXdyR3dkQ0RSTlBWeTFEYi92Ukcrd2pHVXBK?=
 =?utf-8?B?d3dXSGxudkMzQ0JQZ3Aza0hzVG5LUjdzS29BWUh3UnJLWkxDVXZad0M5a2dL?=
 =?utf-8?B?RkdBWXZjdE9HWW9xZXVqZllkNEQzTVRyeWNkK2JFaXFxZkpLNnF2SjRkNmF1?=
 =?utf-8?B?b2g3R3hkOTRNSzRmM0VPUHB4d0g5VXRXZzZJMFVjTGVvbFN1U2FUU0FEeFlw?=
 =?utf-8?B?R2JSdEdadEFRUThXUk9HYnllRWFyRitMUXVSMk9GeUxtRVdSWXVzd3dnYmZu?=
 =?utf-8?B?QUROaTFYMmUxbkJTZGQzZGdqL0o0eiszRkdxY3pzVnNTb0Q2TkNwR3ZsUnQz?=
 =?utf-8?B?L2U5N0lkQ01kM3hWblFUUHd4NFJmMU1JMEJxc2FnUXZFMU5Oalh2UmZMNGhC?=
 =?utf-8?B?ZFA0bURiRkJCMjc3NWlmMHZzWXlVNjh1V2NmUHBsQStUbHIyU1pZMnpZN0NO?=
 =?utf-8?B?VTRhYzFRdHM4RDNmUndZMGRBViswY3FyZWxxUURxckhwUjIwSVBQVWlDRlFr?=
 =?utf-8?B?UTRKaGNYeUV1cXdQcGY1UUQ4WVJNYmFrbG1HZkt0Q2NZM0VnZktCZVRNQ3I3?=
 =?utf-8?B?eEY5YVc2aG1EdEJtRE90SVQwam5IM2RTU0hLOHRnTnVTRncwdnd6a0dxRVBh?=
 =?utf-8?B?MWJHYXV1UVVITjRoTHRXN3pYcityYThtY3hmU0Y1UFV4VFZIcDQ5U1lwQ3pu?=
 =?utf-8?B?UXBadnl5d1BBTW9sR0FJOU14ZGkySmh2OTVLMXgzY0VTVG9CRlRSUmVPdUdU?=
 =?utf-8?B?eWx5YWR2c3NQR0J4eWppUTdKTS9LL2JtLzkvTVk3NWo2U3RFa1FRaENuay93?=
 =?utf-8?B?WEFWRkRPQ2RsRmt2OG0xRG1ZQ1JrZkFnRGxOKzgvSUdPd0dIQkZOKzMwL2pX?=
 =?utf-8?Q?+2dXMvt/kRM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTNyZ3VyNkpoTUhDeGlwbGJCOURyMTZkUi9zQTdEcXZ6azk3WXVGN3NWTGRt?=
 =?utf-8?B?SWtVbjM2RE9VOC9RMVhOeExYdmJMQlA4L1JzZlZqaXNlYzB2Ykl2ZjBJM29E?=
 =?utf-8?B?ZUJsVlBhRWdQMDQyWVd2NDk0TU5PdDVSdHIvYURPSmFQQTBlTHNCcnhOYm5U?=
 =?utf-8?B?eHZYM0tKVFhHNng1Q2N5ZktDZGdJT2VNTGx4UGswQ1AyWW9EQURBeFNCZlBv?=
 =?utf-8?B?R2dEaGUwOE5pQTFXVS9iU3FsSGJJVXNtanVGRjJ2cDJaODJiVmxndUZTNEtj?=
 =?utf-8?B?UHYzNVVlUkliUDNvZFc4aVlmZC9RMmcvWmYwVWltcHNJN2VOcXZFcTFFN3Bt?=
 =?utf-8?B?U01FclR3K3M0WEhRYTl0UkdsU2xZbWlVajY1cmlpWHFkaWhoWW95V1N5Z2R4?=
 =?utf-8?B?YUZkb1VoMTdDd2NEYUprZTF6TjhPdG4vREJudlpUNXlQR1V4cHBySGZwWnhh?=
 =?utf-8?B?TzNTbFpmMFdNVE5GZWUvOHluaTgybjR0bVlzZ1VOdFB6dGpBc0h2R2x2alYx?=
 =?utf-8?B?a3BlTHJtY2xEc0pUcmFEYnVmdWZFSkZwUmlaOTFuUFB0SStkZTFyUU1iY29i?=
 =?utf-8?B?SXZNWnIxRk1HVlJ6WERQRVo4ZlhkVVVnUHZ4WTF0QTNmL3VTbi9Wc2s2a1ph?=
 =?utf-8?B?d2F6VFdPK2lJenpvV25sVGE1bzVmSGROa200TjdkNnAwYXRqNTVhaFhCVXZZ?=
 =?utf-8?B?TXBTR0JxaFYzWUJVYnhXeGxQME9zUEZsUjMreHFrSHdSbVJpaTJtbmxNS3lZ?=
 =?utf-8?B?b1haUzVrcmRxWm9Zb0RPRlRTV0ZYN1RvMTlMamo5Yno4aTZaSmhTclJMMXNS?=
 =?utf-8?B?SXpuSmNKWTluTUx4dk5TZmgxUEdBMEN1VHMweUdhaGZjQVBPZlBoTTZhbVd0?=
 =?utf-8?B?bjN6MmluQkJWWnFnenJBeHA0MGExUXFXYUNnN28ycFVMS1pKMmJTWThlNXV1?=
 =?utf-8?B?eWRyZXd0bk5PZWJldzZwTkNLSEh1YzFIakVsU3ZjMVF6c0VBc2tOMGllUVcw?=
 =?utf-8?B?R09hUjZkOGdpMGRqZ1JrbVlGbTUybDlEUTg2c1E3Vi80a0J4K3R4USs1S2dL?=
 =?utf-8?B?SHRybnk0WXJNZ1JVRDBmblJzL1RhSWExbmlGcWVtYXhWbWZQazh3YmczRkl3?=
 =?utf-8?B?MzllVUNkbm5waWV1MEM5Tm1sQjFodmdrSU9DbXpDQi9UaDFQUS9MMW9nNzhP?=
 =?utf-8?B?blNwNHljY25JeDlhdEFxTFJ5U00xcTJqKzBlT3FzWHR3ZC9XMWZzM2k3ZS9u?=
 =?utf-8?B?eW8wTHFyWi9SZ0F4T05yT0FsbFZIcmpiUThuVkdkNS9LMXpDTU1rZzZuZnNO?=
 =?utf-8?B?OEwwQ2xiRWtWd0s2RUlYSzVMbHd4d3hGTU1pWWw2REF3K04zczl1WFFlSWor?=
 =?utf-8?B?YWlEQlcxLzBuc0lpY0Q5Qll3RDA5anMwdGcwRE9uTXNrd2FhQzNvK29DVjVP?=
 =?utf-8?B?SFpSMzhvNjdreS9sNTcwQVNrUC9NSU5XSzRLYSthYXJPSzJocjJ3dWNWMlVL?=
 =?utf-8?B?aks0TlFCUkswV2x6dmI4S3pDVHdFTkhDN2ZJc3o4OXFacnZkb09BcU5qVHNY?=
 =?utf-8?B?L0RxRDJZMUZuTUZ1VTJwbTV1Zjh5c2NjK0IwUnEwNHJXeTJuMWVYNnlCeFhX?=
 =?utf-8?B?TC9hL2hNVlJsaW9xYXlrWEFtMnVoRzJINnl3WnBKdWZLL2JPWGRjbk4xZlNy?=
 =?utf-8?B?ZEJZK2s0VTFkelY2T0VmUlhmdUtrbGxibjNTb1o4WnBUTlRDZ2EyYlI4Y1dR?=
 =?utf-8?B?RHpENTNpQ3ZZTnhmaDBxRWVVNHIrZGw3blVGcXFaanZadE5CbGNhS3NGSnA0?=
 =?utf-8?B?VTUzMUpZZStkaW1DQzN2cU5pamxxWnhuUEc4Lzk4T1pMVEwwTEJkVGo0Qkc1?=
 =?utf-8?B?b2NWS0t1M3VkaUVjcE5ENjBack9PQlVlSDdSdithdXZBWnhJLzB0Mnh3WkJM?=
 =?utf-8?B?LzNOUVZhTGZxMlhnUDlOYXJNaEkwZkRtRWtyeHlLbjc4U0JtY1ovTW1tZGND?=
 =?utf-8?B?T2k4OXFrVGlXejZEZi9Wak4zRjlPa1h4ZlQ3TnlLMzg0S3VKQldDYnIwQzJX?=
 =?utf-8?B?MTRwUldFUUo4Z3Q1dmU3RFRlaWRtYVltbW03bkd3OGxHd0Z6T2k1VnZONGlo?=
 =?utf-8?Q?SIhRZIkT7NS20wXEi/Kc+fcxF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd0fe2e-cc4f-4596-e799-08ddf7e00428
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 00:52:47.2974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZJgLOqXxFJ8EbeiaGalXbS4LIfW3IwGrLtTJ5Xc4LR8J1eNQuB2s3oQ4SCMYQsoL08lNKA9LqqS4zA2lh1WPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018
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

On 9/19/25 5:39 PM, Joel Fernandes wrote:
> On Tue, Sep 16, 2025 at 05:59:18AM -0400, Joel Fernandes wrote:
> [...]
>>>> In C also this is valid. If you passed a higher value than what the
>>>> bitfield can hold, the compiler will still just use the bits that it
>>>> needs and ignore the rest.
>>>
>>> In C we've got FIELD_{PREP,GET,MODIFY}, implementing the checks.
>>> So those who want to stay on safe side have a choice.
>>
>> Ah ok. We can add these checks then for the accessors, I will do so in v4.
> 
> The C checks use BUILD_BUG_ON, in rust-for-linux we have build_assert but it
> is fragile and depends on the value being a constant. Since the setter API
> accepts a run-time value and not a constant, we cannot use this.
> 
> Or, we can fail at runtime, but that requires changing the set_* to try_set_*
> and returning a Result instead of Self. Alternatively, we can have a debug
> option that panics if the setter API is misued.

Please no...

> 
> Thoughts?
> 
> Or for the moment, we can keep it simple and filter out / ignore extra bits
> of the larger value passed (which is what nova-core's register macro bitfield
> implementation currently does anyway).
> 

Yes. Assuming that I'm not completely lost here, you are proposing to
simply truncate to the size of the bitfield--no panics, no warnings. And
that's perfectly fine here IMHO.

thanks,
-- 
John Hubbard

