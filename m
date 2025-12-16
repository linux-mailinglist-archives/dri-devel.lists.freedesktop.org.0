Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6745CC100E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C260610E30B;
	Tue, 16 Dec 2025 05:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G4U1Hll5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011038.outbound.protection.outlook.com
 [40.93.194.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7255810E30B;
 Tue, 16 Dec 2025 05:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtJf6A0FGG83cfEIGHYXA5grE5UENlkItzKwSv/+Kjhu3vGSvLREP+ngwPK19yzRqvPN9sgCd7XVYMO/cOhNw0rfr+ejYDlvBprGx/8Ib7+jnCTXM9nqV1ISl0pE4wH3402rLXIvaszSpdtZTQUASdGk0ArFccNVVARXfs4VkcJk8t4/VmuGQvC3NJST0YO07Lc5exmeYvpKSpzYzDZivjCC++kAJa3uykvy2brqOOOhIe1aptghmUivG+/kxafMnmqBv+CebN+ejObnubH0K9GFWbV15w0xyMMAL2xdPtXB+/kT29uO2jI/wABGsOcgf8+e8dIRGYhWWV36hGg1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LDk/gvN/zUT3hXmxW0KI7dZolRHAw9W79vwlZa0oGs=;
 b=fRA7zhnMrzCNW34q92EvIy1LveXvgdqPqepU4Cg0seYDjRkZh+TI4Rrppjn+z00uvu2ORSH246G5laK6idwNGWtq2RfqKAP54xXJmE0fn33deeC5CsDflHrUwWPN3eNlk+HXtJEFT2pYkOYqp3KfTyhZTr4+N9Wkts3JdlR6yl9fzgYZCe6kLG2rajnvQWlLIRIvtG1Lfd0F8QBa7n0kufNup0GDAcUmFsw2q6vxYDfDaL5+UH2m08pkPvNDPSZYTaHc9Pu9Yr0+GU1KAaG+j9y4WM9BNI2joiyQu+f6dG6TcToIiz5qprkIc+ZvCF87csEs+ADoxMk1QyRMuXAX5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LDk/gvN/zUT3hXmxW0KI7dZolRHAw9W79vwlZa0oGs=;
 b=G4U1Hll5bcCB6jmjw12Jbc4KSbFYmAje7p+qU21tIrXwFWayIQoWQVkPDxpxeJeleSJBA3AAQKOaDCiyyypzHduxUkf3zrw/s8b/IfjCc8JQ6ThthnDjyRre+bPfRKYOSVE77qXox8EzLnsyMpei5yngMFpMPDC9rbhOJcxYZpAMhnmZjdm2wwg4mKEHb9mUIG0KtXNHwLl7fmWgDgsTuejpypgcWq5a9toMllBO+nGQmH1THjqr1MFv5wu6Mt5WcOoJEdmISNJIALw9m7KJrjZDh5jWcIRLFjb9HtU6E3dPkOmIAGAAZRGcgbP2yISAOdujr+hz+oPvzwzIM4LvEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 05:24:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 05:24:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 14:24:27 +0900
Message-Id: <DEZE2MJFASEH.91JN02AU26VA@nvidia.com>
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Danilo Krummrich" <dakr@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit"
 <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alyssa Ross" <hi@alyssa.is>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251106-b4-select-rust-fw-v3-0-771172257755@nvidia.com>
 <20251106-b4-select-rust-fw-v3-2-771172257755@nvidia.com>
 <c3e35e5hgnx6vozhoyefhvaznr64wm5qlrqwyzuhwn3v7cnuos@ueh6wqayvirf>
In-Reply-To: <c3e35e5hgnx6vozhoyefhvaznr64wm5qlrqwyzuhwn3v7cnuos@ueh6wqayvirf>
X-ClientProxiedBy: TY4PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc52ea9-53d8-4466-f47a-08de3c636445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTlBaHJwQis5R0I2SXAyckoyUFNraW9CNFpScVVTSllOUCtEN3dGbXhpZ3JL?=
 =?utf-8?B?M0RkK2pkWGZqSGpmUGpoTXJoYzdQdWxrV2U3bEVDVlpKdTEyUmF3aVlRZnVH?=
 =?utf-8?B?ZlhlcEdPOXgzSldUTUxIVWVHdU9KanNYTGpWVndXd0pFeEg3VXNqS043anZq?=
 =?utf-8?B?NFZPYzFpV2tTUHF0bHh1OFc2cU92RGxURlNDM3RjcjBGeFlWdGhPU0JPdi9X?=
 =?utf-8?B?cFd3Tk9pUDRIeFlaakI1SG1zK3Yxa1Zqb09KTWRBbldKOENGSEgrM0FDWGxm?=
 =?utf-8?B?MVIxNnRtLzBqVFBVVHlzWTZ2eGVKcTlDWXo3V2o5czBjcXM5ck54cVFjVjJC?=
 =?utf-8?B?Zk9mc0hRVlg3NFp0VFZEMVBEcStncFRBK2JIbDcvT2MvMFczcGgraHBnMHZK?=
 =?utf-8?B?MVlQK2hZbEc0b0U0RkU1NkRycm03UDVRSzJnZW4wZC9CYXdKeVV4dlBkZGFL?=
 =?utf-8?B?QmUrOTlOZWxhRTh4Q1ErY1c5UU5PM2xObThWVDNpYjNKRktaZWc2QlVqNlov?=
 =?utf-8?B?MG1CSk43K3RDRXdQTW9LL2VWZTBCZDNVb2MvaXMwZlJueWpPbUZPMCtRZnd6?=
 =?utf-8?B?WGFNcmlnak1NMW5sUmZnb2YvUHk0aEgzOEN2UzhkMXUvTUVoa0JUMkNGbmsr?=
 =?utf-8?B?KzZRSHFLeHRwenBEU0t4VDFHQzZRWTVhaitqWkJEQjkxRHBBRHNGT0dlNXBN?=
 =?utf-8?B?V1hKY0ZSOE93Qy9wc3ZJdHE5akloMFNrYUhWRUozcWZ0eEJkV3ZseVdxTmwy?=
 =?utf-8?B?UzZOT1dyK2dCS0c4cUdiY1M4V1JZQmpyYUYwNzNFQ0ViSlAyNzNVbXZCYkdj?=
 =?utf-8?B?bGZqQnEreUhvN0RhMXc5TllGS1lwc2c0Z1Q5VGlDczBuWHdQL3hITjVOZDll?=
 =?utf-8?B?VkdZejArZ3BzcGlGVnVycTFjSDd1VWxmMm5vMGQwbGsvSEVQcElMNTU1UnYy?=
 =?utf-8?B?NktubWNFajFmZ3BxS0djSGZKQWlBeFBVcGhQNkozaFFpNXZ2dmFUU2dBdk5J?=
 =?utf-8?B?aDJLZ29OUGJTUUVKZmd2OGwyNFZXTTVyZGIxVG10OTMvY2hLU0t0TmFLaXUx?=
 =?utf-8?B?b0FmUUxWaVo1MHVsNUFUcCs4UFRwbFRybno2TGhEMHl1T0dhbW1uL2JxSy9j?=
 =?utf-8?B?U3IwcDhteGtabmtNYjdXZ1d3bEc3MlVGK3Q2NVZmQ2RKT2RkMHNlTFlGSFlN?=
 =?utf-8?B?T2orNWUrOS82RmtEZGM5OHdIT2QrNTFRaG44T05UaVNqdkRxOUZwRE93dTc4?=
 =?utf-8?B?cHR4NmNtbjJuVjQ3STUva01vay94ejhNRjhBWGxnMlo2QWlkMW9NMGRIeTI2?=
 =?utf-8?B?QUZKODJLTWY2Y2ZuajBObmM1bytSL2UxbkVIeElQdCsySXd3MUI0L2VlRXd2?=
 =?utf-8?B?M2NzbXVrNi9IaVVJa0lEb0RjZzlwd3Vsb0pTZkt2ZWZlQWJ3N2lVU3dCeXRG?=
 =?utf-8?B?VW9pNE05NzNEbFBmZm9HbksvYWNPVDFvMDZneGZ0VmZjZE5pNkEzQ0U4ZEk1?=
 =?utf-8?B?WmhabUxtL2Nnd1dyYkYvS2gxYWdoaXQzeUM3clBEQ1p5MGRCdGdMMzNJTkFT?=
 =?utf-8?B?NVdId09mK1hrSWwvd3JkU0dLaDJabjRtSnJEb09EZ1I4RVp6V0RKVGVHYk1y?=
 =?utf-8?B?M2d3dFVaY0ZyR3JPTExkSlZWUVlBVGFTdG1PVm5wckNyL3g2NlNCK0kxQmdy?=
 =?utf-8?B?bjR0eGFOVHRPdFErZDdyMTgwa3YrVG16TE5JWUtJUXN5aytGN1VjOFZTcm5I?=
 =?utf-8?B?VVZndnFZekROdmgyN3ZZS09WVFVvanRKU3VabnZPVkpTS3ErdDhyeFhiSDRK?=
 =?utf-8?B?TldjSEQwQllNbFFLS0s3YUllTHBWaUpYK1FNNTByU3FkZUhObUlrakhWUi9S?=
 =?utf-8?B?N2l0NTh0MjlFckozcmxta1N2TDNpR3JOWGRDUHRsMzhuZEJLSnNJVlR5Qmh5?=
 =?utf-8?Q?QVMo5Uz9w9PtNWK/oxOATath1+zL+ptj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJsVVFoK2Q2cUlhb3VDbmZhWE9xY3hiVE1HZjBnZTZWcVpCZVRrYjRKZy9H?=
 =?utf-8?B?WTQxemtGK3dWS3o4RVBJV3U5emZHVzRUYWQ1cnhMR3RLMERQRlp3bGpqWjVT?=
 =?utf-8?B?UlcxQVRYc1RqbVk3NXA1bi9nc2lndDhNaHJwQVNUTVQ2U1dQWFdSUk9RMkV1?=
 =?utf-8?B?MjI3T3lmNEt1SlBNbkcreW1sU21KdWlOcDJHQnh0SjZ5a0VNVFlMQysybTdT?=
 =?utf-8?B?WE9jbEI1M050Njduam1tcTB5RVZGTTlZN3cvN3gzdjNRUWJtcWw1MWFvdGFt?=
 =?utf-8?B?WVpvY2xOVkQzUWF4VWZQVWZ2emIvcVU3VUc3VG50enNRc0RESExsRzVEMjFp?=
 =?utf-8?B?UFQ4L1ZoMlBsOGFvM2xwWHVzcDdRMVY3SHVpWFdHWVF2b1A5V21JMVFFd1dw?=
 =?utf-8?B?WWtNQkVhREZRQkw3NUk4VUNnVXpMYVRVWHQ2aCszdFErN2RJbERrMDhiU1gz?=
 =?utf-8?B?RkZRM1RwZnhMQXJBSVZYTGV4VEhFQ0ExNnZkZ2cxZjN0V2tRNFpHQm9rNmh1?=
 =?utf-8?B?ZUd4WUc2YTJpRjFxcGFJOGY3Yi8wVUxjODhJTkM0TGdyTExRaDBGNm9PYUdI?=
 =?utf-8?B?VWpjTkMvcVp3bzdYcXVkblhSald6QUxyQkR5UDdUaGNDaUNVQkdtanJKaSt3?=
 =?utf-8?B?YllPY1l3TEZXejJQUHdCVUpjUGpCb2JSaFdWME16V0gvVmg0TjN1VmphN1ZI?=
 =?utf-8?B?S0JNcllGNmhJLzZST2ZUbkpVVUI0U1U4bHE4TXk1NXFkajVSam9mUmNJWUda?=
 =?utf-8?B?dUlsR1hQKzlTUzIxMVRrYjErcmpmY2Q5VTJ2aWowc0t1NzFFbTF4eTVrUDhO?=
 =?utf-8?B?TFJuVDhQV3pWd0lWUnQ1Smc1Um9kZGFzcDU5R2djLzFQZHlPc21BMUFsVG5w?=
 =?utf-8?B?S0s0aG1MMjlBQjNPdjRER0NvaDZld1ZJdE5aWnpEKzNTdndhc04yUlpRcGVU?=
 =?utf-8?B?NHFuSURYSUkyOGZxTk1tbGQ1ZTBaTHJ2aVdwREN1czg0SW12eGVGdnRoUWt3?=
 =?utf-8?B?cnVYQVVZWU01dVBxZkxLbzNldUQyUFVlWnN4QkFzeHcwNmlqL1hjdDRjamw1?=
 =?utf-8?B?cWpocENYTzUvaUVldUVvaDQvSWxlcFVHRFVocWtMM3NxMXN6a2NKUnlJL2xF?=
 =?utf-8?B?Ti9BczlEaWZUMFpPUE9EclNUMFQrcjFxMHd1YU1JK0NNNXRLVDJUR0NwZGwr?=
 =?utf-8?B?akhoZnVUUHhhQUVmTk02c3R4em1VazJqVGdGUXpmRjUxL0Z5VUd6MFptd3Fx?=
 =?utf-8?B?aC9PNk1nbXRWVk52RTg2Mk5kbUVnb0wwSUlOa1dRU1NpVFVVUTQzMzV4REp2?=
 =?utf-8?B?eHVQR25YUDh6YVJwQm1xRU5iRlhIU2txMFpTdXpOOXdnY0ZRbCs4amRxdExv?=
 =?utf-8?B?NlJpVG51Zm9Ia29IM3NERUlKTGJnQVlkT09ZYktDNURoMllyVnRJQ2N2MmZD?=
 =?utf-8?B?QnJPOHB0RnY0bWdvMVVJS0ZvcjJiOExTM0N4a3JycTQ5R3NETkJRM3phb0ZE?=
 =?utf-8?B?bUtFSmpuNVRFNExUSWV3MlM2bCtLUnZ3M0FYcGY3RkdZaVNyRXNwWmFMa2pM?=
 =?utf-8?B?ZDIxd20yMnpDSGVPOUNxTlNsSkJTNHRyYWthL0pDWXc5dFp4encvVXBpTjZU?=
 =?utf-8?B?M2g2OFdhWjdCanIwTWR0RGJmTFBtaVZKYXQ1L3grYlJpUVM0RnNtRmxIdzFv?=
 =?utf-8?B?b3hCUVhaN3lTVnpYWEU0dWFHN1luaXVCNWtEdW51SEVxaXJNVTUxelE3Wm5t?=
 =?utf-8?B?UTdmM3F6R2s3bzB1ODZ0Z0h2Ym1GR1VRNFdZQzdxb2RHUXN1Tzdob1ROZnVN?=
 =?utf-8?B?RlVvblQ3TVhSUnIxR3k2MmFtYmhkZ3VPeHUxVEwxdWVRV2tzRlBTalVoVGlW?=
 =?utf-8?B?R0hZa3orOGthSUdXdDFjZDFjdVRHSSszVjlKc3lKbk1Gb1N5Y2JwMVliMFFx?=
 =?utf-8?B?S0RxUVNRaE9XWUVhNkpLMmptWE9yNjdkOVV4YklhekRMSTNlMGRLbkhqbGEr?=
 =?utf-8?B?cEJFaFh5ZXRMdk81YURyUW9rWS9Fb2F0MkNHelhMalVwL3JZTHRFdjFZV3Vq?=
 =?utf-8?B?Ym40REFiQjJWUTBsdlZIZmRyNStYWEZ5ZzFHQ083R2cvRnhaSzJzRkY0bkRi?=
 =?utf-8?B?L2h0T2htdHp5K1pEZS8zeFJSMlFkb2g1VUNVaWVkMkp1Y0RsOU9NcGplb0NE?=
 =?utf-8?Q?LsOoqsT7pVmznVpBpO2ouf9uHlecx2rwJOLXEoLjwIKc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc52ea9-53d8-4466-f47a-08de3c636445
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 05:24:31.6966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ChAWpGhaVHoNy4mkxhRLe8MUGfceH0AWhWb0huHhH4GuYVf8vYFa4iJTg5JfdDwcFmOkwywIt8OzHOum/qKww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881
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

On Mon Dec 15, 2025 at 11:59 PM JST, Alyssa Ross wrote:
> On Thu, Nov 06, 2025 at 11:40:55AM +0900, Alexandre Courbot wrote:
>> RUST_FW_LOADER_ABSTRACTIONS was depended on by NOVA_CORE, but NOVA_CORE
>> is selected by DRM_NOVA. This creates a situation where, if DRM_NOVA is
>> selected, NOVA_CORE gets enabled but not RUST_FW_LOADER_ABSTRACTIONS,
>> which results in a build error.
>>
>> Since the firmware loader is an implementation detail of the driver, it
>> should be enabled along with it, so change the "depends on" to a
>> "select".
>>
>> Fixes: 54e6baf123fd ("gpu: nova-core: add initial driver stub")
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>
> I just encountered this testing 6.19-rc1, and was pleased to discover
> this patch had already been submitted.
>
> Tested-by: Alyssa Ross <hi@alyssa.is>
>
> And it probably also makes sense to add this now that the kernel test
> robot has also found it:
>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512061721.rxKGnt5q-lkp@i=
ntel.com/

Thanks! Both tags added.

>
> (I suppose it doesn't make sense to add the Reported-by suggested there
> since your patch predates that report.)
>
> I see that the first patch from this series has already been picked up
> by Greg, but this and patch 3 are still waiting.  Is that correct?

After rebasing on top of -rc1, I can confirm. This patch is going to be
taken through the Nova tree. Patch 3 is available for the relevant
maintainers to take.

