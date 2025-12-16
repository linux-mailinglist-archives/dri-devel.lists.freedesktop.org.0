Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0081BCC167B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 08:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC4910E4F7;
	Tue, 16 Dec 2025 07:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DGrhB+RH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011015.outbound.protection.outlook.com
 [40.93.194.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1A110E474;
 Tue, 16 Dec 2025 07:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4aLN5gZFSbrU6KD71mWUnkSqzxBMwI32bJhLgYsiQXtChuTRG7n0hKfW1WL8II+aPdBstgqqLIcZTsatndFduVaweh/zmv4ixhln2KWTNr+xPjM1GKBgLGelwmqxpTm6JEDigK7YmfVcFcjHKziTPABJU1ckxj24MOsX9djah3psIOuEhf5xnHuEwd6mWNQgIntoR4wd71xdEblp6VyHHPE08xsr5V5oQptFLbsnUmbBbemjs70e41pC3o375ySE2wwQLYfJOXAHFwhX1Q3yxMq018Zr4yMNyLUoXHGxYal9V6YykwfesgJT97vm2zBAccqx8X2FJnBprqyv/aCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2b0wLuLvjHTayCwz/sjmnAfmqyVaeed9aBjpRbOF6o=;
 b=xtdUhrU4vDXr8/FD5cJZsbEKZhF4uOyAo/Gsw77Jacxz10/Wb80wnR+rTzCYEKjfP+FR5haWcCpn8Xt+yG8vPixnoE//we9vc1QzvWx85V4julDibSbPHJBCUnbzwZkVZbfUgUnRMXeOk6SLRE+iVP/fi+aOx6L0yQ3qt3ZOadZvhr8vo0WVUtKmp1baH0X2xFwgB/0cEfLj3woRCOyik9DweRyPrmRz7PrQh30i9KzCsKxxrD6cymXxR5htXF3zHdBE6ayt+j2q4zr02jGeFqCnYyCWCiGKlTZO/dtwMrXK0Bw2v2eTW+gYT/auJkTu48fd8LiQPam4D6u+FFdsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2b0wLuLvjHTayCwz/sjmnAfmqyVaeed9aBjpRbOF6o=;
 b=DGrhB+RHJY8Lm/cd00DRH1f+reuIz4oOglbPotmYoV1HMD9jmov6Is0q0jFQqGpG5j63lmcKOZFbKEfzJcV+xouEv4N5sulyiMhkPUOpBTjOWlM7HeB9Soik3DzONVNj3aCavstVIRAp82zC75mWebrmXbVpX8Js20cBDTX1M1z2eV7bUIz+C5V2/qrADW9W6kOEn+7IiwgYyFlTh/aVz1Do6Dnm6QkMcLT4Owkc4GhBDh0W41wULZ//Ru0nGjDxJ6/ETwWZ9Ckq1chWyi+LcEMoITbE+vHxvY3BEoXIpFDjbfx9c8muCGQnEpSKBE+3plDzHUSmF4uP6ghE+Uw5rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7615.namprd12.prod.outlook.com (2603:10b6:208:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:57:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:57:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 16:57:40 +0900
Message-Id: <DEZHBXNOIVH4.2WIQRYI9W8P6P@nvidia.com>
Subject: Re: [PATCH v3 2/4] gpu: nova-core: gsp: fix length of received
 messages
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com>
 <20251216-nova-fixes-v3-2-c7469a71f7c4@nvidia.com>
 <hbo3azmt6mpaq7dyn4mnitrg3iouk3eeijjqinpl4grlufrvqr@6ieka4obgszr>
In-Reply-To: <hbo3azmt6mpaq7dyn4mnitrg3iouk3eeijjqinpl4grlufrvqr@6ieka4obgszr>
X-ClientProxiedBy: OS7PR01CA0144.jpnprd01.prod.outlook.com
 (2603:1096:604:25c::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: f73aff5c-3326-4af1-76ff-08de3c78cbc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0VXblhvMDNLSTVETzVGTU0xWGQ4U0FGM3l5QXFva3pZUzBGdXY5Z1dZZms3?=
 =?utf-8?B?MllIckMySjI3V01hYWpaZ0hWbThMaGNJS0lFYjFUR09QRnJlNk92WjVCNGs1?=
 =?utf-8?B?bm9pek9JREtqZW5qYk9nVTZQd0FkWjBvUWljQUJaVmxXWXhMWG5zUU5KRGx0?=
 =?utf-8?B?SkhOeEVDbWJlTGRYQUpSUUVYeE9XVUE2Wmd3VUpFSi9taUNieUx1bjJmRjlY?=
 =?utf-8?B?Tm5vZ2c1cjIvY3BOUEd0ZmpvVWFFUXZhOFVMTFA5M0pLTjd5WnJ0a2k3NWxC?=
 =?utf-8?B?SzYvdkk4UjA5TGVEd0EwQ0V0SzF5cFlCaUNuZlZvTE0yT1E3cWtBK2hOSVl2?=
 =?utf-8?B?ZkJ5d2JrK0x4eFQ0K1hVZ1lDcDhqN28vMURVenRUQ3JTaG1mQVhNa21EWXNR?=
 =?utf-8?B?clJLZ3JJN2xwR1c3V29KcTRDc0F2aGtPMEpSVjlCaGZDRFU2akFqd3dtSkxz?=
 =?utf-8?B?QWRGaUNaaWtBNHpnVzRRN25vNTR1RTFHaC91ODNOVXlKV01xVGRpOVhBMGJH?=
 =?utf-8?B?Q2d4dWY2NS9mblUrdTUwMmcrM2ZLVGN0WGZWSEk4YStReDNUY0lvcGtnZE03?=
 =?utf-8?B?N3B2VlFuK3ZCS3BPSzNnUkF0MWJzajdXelVlQ0toaUhIYU00NHFlNDdreXRE?=
 =?utf-8?B?UmU5WWR1b2EvbFR5YlFSUXFMbzgxRkdhWGhRL2VINFBxZmd1TERpQktmaUtS?=
 =?utf-8?B?bnllNThhNE5rYlJNbnBacGQ0K2pSOW5acy9VVkp5cDBnWERWcm5RS1U5R09J?=
 =?utf-8?B?a0F4bmUvMGt1cEFPSWtnckROVHdsYit6SkovOWZMb3Q0N1dVTVk3ZVcvallJ?=
 =?utf-8?B?STdSYlpHWjNydlN1Skk3alpIL1J5MlNINzBrc0VyaTBVaWhwdDE4RXVCTXVp?=
 =?utf-8?B?dUJXcnNBUnJSYWF0cjJuYnBXdFUxTmlFUmhwQXIyUEZ6NXZlYzZ6STRFSFo5?=
 =?utf-8?B?dVdpVWgwYXBpbkFRb1BBQlAvMnUwSng0WWZObTBQLzE1UlVjR0tDWlRsdGFt?=
 =?utf-8?B?eTE2UFRvQURFMlNuOVdEaWdhTWt5Qzk1TVRyQXpGK2xEZlRBQ0dacklkN0c4?=
 =?utf-8?B?cW5WWmVnVkdpLzZqMUlaU3p5dE0rbGJYWDRhZzlKTXo5TmQvcWpFRWd4UkV1?=
 =?utf-8?B?N2F5M25MbFJIdDAvVTEvMDBnb0ZjeXdtVzJsaTZCcmNOMzlwdzM2a1Q5OVIz?=
 =?utf-8?B?RVIxSnd2RFhTVTZYU3ZKa3krZ29hU0ZRVWZYNGZ4QjlnbXp5QW52M1N2R2ww?=
 =?utf-8?B?TGdhVzN4Tyt2azZvQmRLdGpOK2FjdG5GVm9jeU9BVkJydXg3UnRHNHgwZzl3?=
 =?utf-8?B?TlhyNGpjWHNic1hXbDBVMVBTTGRnNVlvM1gxUWQ2dGVETGZHZUcrSG5Vd1ZF?=
 =?utf-8?B?aEtyWGptamwxcyt3UEZNUXdyamR1MlM3dGRqU3VNaXArRFVpNmNjK240SlVp?=
 =?utf-8?B?Sis3NlArSnZqNDcvUkFNVTBsazhTMDNwOXRsQWF0V2NBNUlwdzlxWFpUNjN4?=
 =?utf-8?B?NHZucXREUHdVZXlVSkE1bXA4SEErQjZ0TFdDQ1JQU0l2RjRpYzlMR1hxVnY0?=
 =?utf-8?B?cURueW5WcS94anN1MmRleVdEZGo3NlpTd2JXNGRibGhEcklFNjJ5VmdMUk5N?=
 =?utf-8?B?OVUwRy85V2FSNGgvTGRoZy9pZkFvSi9sN0tEbVUwTmE4YWp2dXE0Q2d4cXow?=
 =?utf-8?B?UUthMElQNytVUHhrbVpxNGhOY1djb0l5dDBYWi9UK1oxM1phd0diVnliZk5R?=
 =?utf-8?B?UTY1anVFQVd3bjFGMW0vNmoyUEg2WDlIVjJOZ05CTTJVcS9YQkdyTGhlb3Jn?=
 =?utf-8?B?djFrK2JDZEFmU0k2OURjUFB5L1hPRjlXQXJqaGw1VWxNaHVYRHE5VHA3bDNX?=
 =?utf-8?B?SkNnaWZrVlRoNS90MWVGcjh5d3hZMkllWHdVUnZubDRMTVpBT0diK1JBODNE?=
 =?utf-8?Q?xoF72nwSaADqEvUlLqdT6qLRcKxPSI4S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHA0ZEdPckJYRFVaSGU4dVJLOHVxQzZ6UXE5RHN1UFZKdEhMcGJFQ3VoVzVi?=
 =?utf-8?B?c2sxem1SUGRVMndUaWtoUWlQTFowcEllMVZ1SDdKS2QvejdRQ2pKdFdoeVFp?=
 =?utf-8?B?WW9UTjFJNjJrNUwyRHB5SWxZek54aFM3a1l5dHR2TEdZVW1TSEo5TU9oQzlq?=
 =?utf-8?B?RzB6ZkZXMm1UaHNxMDViekI3VG5PVXZoMkIveGlYR3pOR3U3d3N3SXNVbnpH?=
 =?utf-8?B?T2pRRGtKRUVac2V2a1NwSytCTFRENkRSVlNLODdTUXJ2TkdQZkIydTdaMEp0?=
 =?utf-8?B?cTJUYlI0UXlCTGEzT1pneGZDajdiZ0FMTWlTOEV0K1NVa0IzdktQemJPRkJy?=
 =?utf-8?B?bElIWm05cmtaM3VQcGRLOHVwZUJhVUM4cVYvaW42YWp5Yzl3VnlIMTgyS0tP?=
 =?utf-8?B?TklGNkI2Y3F2VCtPU3RvS084VzhBN3N3SDZFZGpUL2VQaUVSSG5KamdvMy9k?=
 =?utf-8?B?L0JSd0RNeXpEM3ZJdFQvQzdyY1BDdVJMbndMN3JDWUZlY3FpSVcvSkNJdyt5?=
 =?utf-8?B?VXdlSmF6TFBtSk9WdFVIL2h1ekxiQXRzRHVMUEFGYTgvVS9DVzRybXdkU1BT?=
 =?utf-8?B?dHI0a0RSV2xLbXRtSHVpSTAzeVUxZ0lOdUVCNUNsMTdiRGlNYlUzTXlxSysy?=
 =?utf-8?B?V3dZc2JGRTg4Vmx2V0xvY1VrVTdmZmw1cTVvYU8xSjhjcXpiVC9lUVh3eWFl?=
 =?utf-8?B?cjMyVkFZMWw4Rkp1NGd1QWxCcXBQRUdxcXVTMFBMRS9TcEZhdzhuNVRqZ2JI?=
 =?utf-8?B?U0VFOHo1RHdjekpEMkFNL1FUZllhKzQwSm0rSzNLa1kzMzVncFNZcnNGM0dK?=
 =?utf-8?B?TVhTL0dEUVgzMWNiNjNUVXY4MWRFY0VIdkFhTTF0ZDh1aGl0NjZkZllUQ050?=
 =?utf-8?B?VVhWVmNnRWhuZkNMQ0E4RisxNFNTQzZkQS9VWHRMdDdsc3Q5UnFzM29ldW9w?=
 =?utf-8?B?TXhHcGRNQXFybWREeUpKUDMweGNKZ21oU0JZc3BFMXhobEtaOUVvektBSEpC?=
 =?utf-8?B?U1FKaEttQ1U4alE1cTUzRmRYTEhoNmpjNUNNNHdUY2pJdGVnNVpUVXh5UlFt?=
 =?utf-8?B?UFpsN1YvNHcvT0RoYWNrQXZLdTFDczZVeGd1aXltVXUrQkYwYlVRbE45TDRx?=
 =?utf-8?B?bDlmQXVCYlJvQU5jcjc1aWwvdWhwRDk0TkxlVzF1Qk5wTHNKRU5NbTY4Q1Q2?=
 =?utf-8?B?OXAxbkNCVDd5UmFaRm5VWXkydFZQMmxRc3JSMUVBVXI5bjNteG9Odzd1aGQw?=
 =?utf-8?B?Y2t3eXhpT1ZlcHI3c3VISktyS2lUQzJDSEdWQ1Jod1RzTm1aTUJFeHN2cGsr?=
 =?utf-8?B?QlJWcDlmMmZMU3FMSGUxcC9PN3o3T3Fyd1o4eGVRVU04ZytHS2VQTFd4enRh?=
 =?utf-8?B?Tmd4amVmeDRVb0RWdml5ampGSmxtZ2dmaXZFQmQvSzl5T1JtcVZQUDVheU92?=
 =?utf-8?B?MHRIb0l0SFhhM2tyejZZaVdLTDNCMWNnL1NNMzlVRDQ4QmVlUXp3bzFteTMr?=
 =?utf-8?B?MVpFZ20wVHByNWtyUEczTFlORUJWNElJUjUrL1pOWXhROVlzdVd2MHl3RDcy?=
 =?utf-8?B?ZHA2NGJzYXd0YTVPS0swcUs2bWhxVHJOQy9IeHhDamZxbS9SN3kyK21XcVdT?=
 =?utf-8?B?dHZ5a3VQbURuOUxrUlJRRHhVOEk1UG5Xai9RZkcvZ0lvT1lHNnFtbXZjYWg1?=
 =?utf-8?B?cnFNSXBNU2FwN0ZzQkx3SVA2cCtheGZYMENyQ0l0dzdlKytMaWh2WEZaSHNE?=
 =?utf-8?B?aGhnODIrcjlQYktsek90SXhvRk9aeFNUdWE1MUlMV2VFQ0E0ZnFWd0xlNVpk?=
 =?utf-8?B?Y3ErUEtWOFBDYWRCM1hzci9iQUZvVGpudE4za1laMkJDZXBhODRRZWJJQWx1?=
 =?utf-8?B?TzJhOGdESnRWbDJta2M4eXlMZitub1hlMkRpeWpCbi9aQTFxeEI4ZzBqblZZ?=
 =?utf-8?B?OE9nbmd3OHRXYzA0Y2Q1d0FoUUt0YzhNendqT05zbXNLbytRd1E3anAySW10?=
 =?utf-8?B?NUdmcWhBL1VpaE1FNEd1T2VtMWdJdERCMis1WjM1S1NISnc3Z3J2b2JaWnBN?=
 =?utf-8?B?WStiYThsRURQSnphZUFXeFNhWmVmOEJpZE13TURBNFZiUWhEQnRSeUREaWgw?=
 =?utf-8?B?WFJ2L0hWdGFFY2JXQUYwUEZlOEQ4Z3hseEMzazN6a1IxUkhha0RQazN2QXRE?=
 =?utf-8?Q?z8IauvT8PhLM72gEkNvYMjekKZ0dxqTxynkTcH6QT0pF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73aff5c-3326-4af1-76ff-08de3c78cbc6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:57:44.7831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHj387TSrX9cgGzLAAnf2BDwAcTjn5Ke9B4KV+r4BkU2qfHjEb6T5Cj1skIqpJzlTpXZ4McThMI0pCvpkuYIPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7615
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

On Tue Dec 16, 2025 at 3:14 PM JST, Alistair Popple wrote:
> On 2025-12-16 at 13:57 +1100, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> The size of messages' payload is miscalculated, leading to extra data
>> passed to the message handler. While this is not a problem with our
>> current set of commands, others with a variable-length payload may
>> misbehave. Fix this by introducing a method returning the payload size
>> and using it.
>
> The whole inconsistency of the message element struct not including it's =
header
> fields in the size whilst the rpc struct does has caused endless confusio=
n, this
> looks much better, thanks for fixing!

Indeed. It would be so much simpler if the RPC header just included the
size of its *payload* - because if we have the header to begin with, of
course it is part of the message!

Instead we have to deal with the possibility of a nonsensical length
value if it is shorter than that of the header. Thankfully a saturating
sub always yields a correct behavior, else we would have to return a
`Result`. :/

>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>

Thanks!

