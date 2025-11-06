Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78393C38763
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 01:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C243A10E7D1;
	Thu,  6 Nov 2025 00:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A1s2+0Rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FD310E7D1;
 Thu,  6 Nov 2025 00:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjE1xYcsRUMnEFwqRvUM3LF2MaQUEDz6d7rRbQvdiQlATU5BAffwyAblH5yCGhsYmrbQynJIaIZz/CbztjnIdcvIEzdjosJthJK1lshD2vYq/JyS/cz898TbQmGdbgolnIcqDUbI0aDdKOqv1Xcw6OWg1d4n+jJ8hoOm9txJPiPKEH/l/266oiqsmgwNcyh5eCOFg2nDaWSy3UUaxIcOj8PMvag1CTIUWIirrc5ppplQ7rmU72AEyz9KBOzBUw/W3GawoGI0yJU0RZNbRgKxxjJbrkzEj7TdmFdaSI2I6zdXEVvICN8EyDwa/9hVNl8BvB/TpukW0QBvORxeSRQzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGUm1LcVQAtu+ss3GbaaHDMZujgMY1W5oyW9u5I0mLM=;
 b=WjwjnOkVQ+t9PcMAkHYraVJvVdyy41VZNVydPTir2jdAXi1qwV1luXX+2nDJHBDbw7knaJc3h71TfX8+isheIh5ajGmLmEPC6thd4KI8pUS8eNMeDrUF3UwhDYA9ENgDFpeeVjeNOLbSwfbWPoDhpqkShzGev9BL0UhNg5CQGDP9Ij+Pe4DcLCSks66gRNoel+q1ySrvmixPdEPzUCncZOOQq98QQgYB2vdJXRLsoj5uUyNXIeQAQFwir0lqt1lrmRS8TtHRKVN0pDkIBKEiVX73766DaW/VcnAPsn2YSAe7O5Gul5OHPVGlSDyRSacLbkbOXk9dVdbsjqyJRauCGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGUm1LcVQAtu+ss3GbaaHDMZujgMY1W5oyW9u5I0mLM=;
 b=A1s2+0Rmh8E9aWxMe1qhqzoy4url2RXVGFEuOL8PxYVBgoRvgXsiK1udHmowbB/pJPVP5yOhohs855WTK+5AN4N7zswWauyzV8MonqiTHvCJtHqKISbdKhKOEfNd6jNqcsbNqZezb7Ep6iu3WHFCId5I0BHrZVGFLUqoCQm8O/tItQ8DwhHGS7R5KkWjUik+n8k6vh3vG6owTQViH6l8cDofM/NcGaeXYUqHvMGGQfKEKOhZIZlQMIO6P0yR0hARQgBkqsd9H1Ozyn2XhNxl77QRmm2OlQRU+W3B8yivOww42EvASumr3l/dp/qrEQ+gVRn4rohT0s+R/MC21XGyIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 00:23:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 00:23:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Nov 2025 09:23:48 +0900
Message-Id: <DE16MN16DL6I.2GHH0SP7HXOPD@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] firmware_loader: make
 RUST_FW_LOADER_ABSTRACTIONS select FW_LOADER
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Danilo
 Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrew Lunn" <andrew@lunn.ch>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com>
 <20251105-b4-select-rust-fw-v2-1-156d9014ed3b@nvidia.com>
In-Reply-To: <20251105-b4-select-rust-fw-v2-1-156d9014ed3b@nvidia.com>
X-ClientProxiedBy: TY4P286CA0068.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5f144a-3781-4625-6508-08de1ccac425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEFDZnBSakNTcDFVd2RMbDR5UW9UbFJpbHlZQk1obTllVmx6T1V4cVVOSXJn?=
 =?utf-8?B?VDQ0WWVKV1dhWGlKVEJmYzNQc3l2SkYzMXZ5T1pZVElkZ3NmWTNnR2l0Qzk4?=
 =?utf-8?B?eE1hTlQyWk9xVjZBY1RkV21KZHpZeVVoOTBQaEsxdTNzcmNodTREWVJ0Q0hM?=
 =?utf-8?B?Q2hUN05KazVVTThLVlg3U2VYUWR3UXBvK3VrNXNWT2RaZ3pPYkJmSXRjQ2hw?=
 =?utf-8?B?bVhrRDVXdjZmMzMyc1pMRmhjYUM0OXF2cC9rUXJMVEZ3eTFhME5VSk5IeENC?=
 =?utf-8?B?c01QOHdLcW05R1dlVUZLR3B4Sm1zT2tQc09IWDdVZG1PRUxhbnlCajZKZkNw?=
 =?utf-8?B?NnZiSDlCRzBVdzJLUmFQOG94Mm9RWXp4TTNqcGtiOGJYaFpsZExHQWhsN3NP?=
 =?utf-8?B?aW5vWGVYUkNna3dreEprRkQxdkpDUjVOMEdNRnNpckprbVY0T1JwSDNqZzl2?=
 =?utf-8?B?bFpwVHVxai9ZRkZUbWhxRkF2M3RmTE0zc2xSQVd6WVJudlZjVDdBektjUXB4?=
 =?utf-8?B?dkVFT0pGWEwrV0hxb1JBUHhyK3hTM3R1UWpGZ2dSSUwxUmlxK3dETWd0d1ZZ?=
 =?utf-8?B?OXZ6QXJyVFBUVzVWVkpTUE90czVOSlpEWUNKZVpSdjJVcm1rRkFrRG9JZzY4?=
 =?utf-8?B?UDJMQ0RXQjRNMXFSVEhxdXp4di83RC9jVFhGU1VlNHdrTzRzYTBaQUUxcW01?=
 =?utf-8?B?enloVkFrdzRhR3ZDeHJ0Mk40Ym1yeUJSZ1lKSzBKQ0crKzl2TEJPVXhiaFVQ?=
 =?utf-8?B?aXBaU1B0bkJkcnBoeW16NGUwYjhrL3RTU0J0YzVVZXQwdDZVU1puMFZPcG5V?=
 =?utf-8?B?S0svVVFlK2drQi96a0hwa1NYVEpkRGx6aE9DS0k3K3U3RFJMQXU3QWNxTFBE?=
 =?utf-8?B?ZXQwOGtTWkxxV0lFSG1halUzL1Z3WnVISDRvQzhoZTNnei9hMGpVR2FBdGJ2?=
 =?utf-8?B?Z2pTLzNyUUh6UnZ3TGV3a01YU2lDVnpDNDNqZ2Z0dDJEK0dBQXZ3QS8zNmdE?=
 =?utf-8?B?QnZiSE1TQnhrdERQQkRMSitMTjl1ZFQyOXlrZnJqUERxQnBHdHhVWjlmcS9v?=
 =?utf-8?B?M3FGTFFWYjIzUDZVeUtOcUdIcVdpOVlkamxlM0pUSXNLNE1EU05URXJScS9I?=
 =?utf-8?B?b0ptY3plN2g0Qkk0NFBtOE41ZkZ1V2I3SloxUHlYV200eFZoTmJBNW9FTkEy?=
 =?utf-8?B?aFpVRjlscUdmZ2t5UXZFUFhjSkhsTWNneXJMaHJ5cmJoOGhGdklCaUtScGFN?=
 =?utf-8?B?N1lKRW83WTBMZEFsYmFSNXo5U0JYUFJJbWVGWXpEVkFFVWRWL3g3d1Z4cGJN?=
 =?utf-8?B?ekdSWXFLbmNlWVEvMCtjUXFqNGs3T0ZDQ2lhY2ROaHdqLytIUmxpQWplS095?=
 =?utf-8?B?cTNHWmxEckN0d3k4dngrSHowc0duRmZuSU4rUFJ5YnF3cithNVBOYisxd3Nu?=
 =?utf-8?B?L2I3RE1lTi93VENiQnk4ajdkeGpFZ20wRzdDUWx0c2k1ZVMvVTFSOWtFMGNJ?=
 =?utf-8?B?N09pK0cwM0ZzQjJJYVZiaDR0Z21OTHI3L3RCRGpDOWZpeDFiRk8rT0srdzBs?=
 =?utf-8?B?T24ybmRDbGZCYXBVcnYzVkNCMUdEKzJQdDVJMzN4QmM2L3Z5YWROSXJrQUYy?=
 =?utf-8?B?Q1FQbzZwc1psczA1d05Kd1VlWjRMQ1pmTE9jbTIxaWZodUtEQURmb1pLZlRy?=
 =?utf-8?B?UnlIYUJXWFp0bXhhR1J1NzVnY3g4SGQyM3lOWGo3YzBpN0NwTFNlOTlGWUV0?=
 =?utf-8?B?TURNOFZSdkFadGVzYmxpb1gyb3J0Z2Ric3RnSCtvUzZsWlIxK0x1YmtMM0Iy?=
 =?utf-8?B?UmticGwvYWpHVzF5MHFndUZjbC9FbHUwRE1ONjlrYW1WL25sMkU0K3NtUjBx?=
 =?utf-8?B?U2F5VmJURGtENnU3d0FPT2Q5RGY1L2EwdnF6SVkwQnEvVzFtV0NYV3dPYjFY?=
 =?utf-8?B?UmhOQzNLOFJWZE8waE5SYzV5cklhQW9jdDJvc201WTdxWU03NjFtU3g1M1Zi?=
 =?utf-8?Q?egWUpspc587upjqHjRHTMJn/rb65YY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdYTklmeE1MUmVwcnFIT1VlN3c5bXp4S2RNWTE5SDlyNll1am5vSjdLQlRL?=
 =?utf-8?B?bmZwU0x0QXR3NEt1VjB3WHhsUzR1am9nY0VFMVFobXRKbldUUHBFUyt6VkQw?=
 =?utf-8?B?bG5UWHdjb2Y0MW9BQ2wvYXdmcGV1VTV5Q29CQzZNN0x0N2ViQVRSc1d4UHZp?=
 =?utf-8?B?NVhGeVBYUW54U3JsQmRWcmlGRUdMZnRqelVyRkdqakhkcHo3ektManZCcVZ6?=
 =?utf-8?B?cG5HYUdONm5kL0Jselh5ZFJHTENMUUhTTCs4MDBDUDFqeXhSRThGdFRGMUp1?=
 =?utf-8?B?UHYyQ0tqcDV4TzV4Rk5VZGRpa0V1MHB1RVE5K2xJL003eFhoVktVbXhkRFFz?=
 =?utf-8?B?Ym12ejFWYSt3a21qNktZSmdqT0E1VlFSNSs5NlVKMjVWWDc4VUE3eitidHFo?=
 =?utf-8?B?eVR4c09FUzM4bVkyYllFZlM1RUJSTVM0eXNjaHlYS1BmUVpiZjBuWm4wc1ZZ?=
 =?utf-8?B?cklvc3VQUU85aU9wYXNqTEFpVGpsUFRYZy93TWQ3YXo0cTFDMG54NWFEVE44?=
 =?utf-8?B?OGV0T291ZWV3bWFJcmhDQzM2UEpFL2VuOHM1ZlpHQkVMV2ZtNHpPbGZlVzF0?=
 =?utf-8?B?VXUrL2pON2JQcVVTU3BLVnhiUU92WHJHRld3WEVORmlIZkZ0R0paUW5rT2xH?=
 =?utf-8?B?WmR4NkJ5ZHZiR0p6UWMvU2FYZEhObm5BT3FuR1phL2ZDYzIzclo3dXlCNFB2?=
 =?utf-8?B?Ny9ydEtTRVRxZ29wb1FFQnQvY3ZScHJTSm16NFlPWnRZUmc5d0tCWGlqNExr?=
 =?utf-8?B?ODI1Yi9XZW5EbVBvUTdqY3hpMGhzd1JOdFl3cEh2RnRmRmQ1V1ZtaE5NZTlF?=
 =?utf-8?B?RWlrVDJIcjc2VkMwZUt2VFQzYXovdzRzNzR0Ti9USjgyZkYyU2hGbFVacnkz?=
 =?utf-8?B?bHU4K1IvTk9HSnlwd1BHN2tXSTVnUC9vbWVIU1l3L3Z1bVU4WHgzQmh4dFIy?=
 =?utf-8?B?SEdhSWFiclB2YlRQVEpkK3pzZWY3YVIwemgrR2hIc2lpMWZkWS9leHZjekdn?=
 =?utf-8?B?ZkgrRDEzQmRWNEp0K0dYK0xrNWFtZU0wL3JxRVBrdGhTR05ZRVEvS0VNdnY5?=
 =?utf-8?B?Ti8xb3gyaFdKai9vem42WFJyV1hzNThsN1UrNTZ0SUphb3FRSDRCTDRNMnBi?=
 =?utf-8?B?NmhyR3plNTEyekVyc0hiWmpEL2hkZnNKT09FazBUbmxzRkY5elkrUzRNbXAx?=
 =?utf-8?B?VlkwbCtHVEF2UlMrQnEwTDJBdXM3RDVaZjNnek5LTCtaYjQvbFNna2NCZjI2?=
 =?utf-8?B?VThMelRFZlQ3UGZjWE9COGxGcmlUUHRKb0Rlc2F3aWhoTzhVL21nUkRjZGZw?=
 =?utf-8?B?R3ozZDU3bEdXVDdoOHdXMElmblV3QWtvamh4T25Gb2cveDBacTVYb2NtaEN0?=
 =?utf-8?B?czVzQmxjQzhJYXRXamRDQUw2MmdPenRUYmU4SHdUbWc3d21LMTVqNnJNVFVw?=
 =?utf-8?B?dmNhUEJQWXRoMVFrT05hL3BDTTN2WDdQam0rYlhLWnFjY0xsYWpZaUJUTlZP?=
 =?utf-8?B?Sy8zN0ZIUlQ3RDJCRlNvYldsUmFtN2hPcURUczZuaVFoa0hhQ3FEWFFFM3lE?=
 =?utf-8?B?YWNUa3lnRVFmMkxIaCtNd2FsQXRpU1lBTXV0UC95V3dvU3hweGJ5TFdQeUlB?=
 =?utf-8?B?Qmkvb2dpTm5QY1JRNTgvTWd3TnZ3T2RkOUVRUHJmaXJnU2VpU3QzSXMvajh0?=
 =?utf-8?B?VmVTOHkrWEJxUHVVR2VXQUhjbiszMFlHcUpsTWg2M09QbWZ1STUzVEdjZDJo?=
 =?utf-8?B?MFV4dHJhay9kS1JXYW9wajdzaTFUTWJ2dVV4TXo3dHora0NUcy8zZWhkNS80?=
 =?utf-8?B?V1cvcCtVQjNGdVZLSHFWUFFmc0NOUjNoNUJXa3hnT3hURHRIRHFzWDZaMUtV?=
 =?utf-8?B?VTJZSkxJRSszRDhwVkZyaW1VajlsckZxNlJPaDlwN1BIZE5ubUEyQllZWXho?=
 =?utf-8?B?MStDRzVCTXBCeVovZmdtVXNJcDFFZ0hiQVI2cDV1a05rbnJjZ2pWMEh3OXZT?=
 =?utf-8?B?aWxTQmhqRDRLVFpVelYyek83NHQ2Ni82eXY5WkpDYS9Vb1V4ZERXaWJTNUVy?=
 =?utf-8?B?NE92R1RCdWFyU1RmeW5NRlFDaHZqMzNUeHhDZnE3YjBZMy9lR1E0QTdvejlC?=
 =?utf-8?B?NWZhbTZZV3BjaC80Y0tBZlZFdCt4RWpVanc3WlNLMW1ET0hONjUyam4rRm1a?=
 =?utf-8?Q?V2QViLVw0xVBh4Kz3p4JamlRCbcAwKHtI22aVqBi7OcC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5f144a-3781-4625-6508-08de1ccac425
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 00:23:53.4671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuF5cHRwQESFC4OOX+p9f91kviKblEx0Qo5i/uf2YzzQ7r9C3Ullzx2ClDosUBpBPW6Su5q1QFvYV5XhXr2AYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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

On Wed Nov 5, 2025 at 5:03 PM JST, Alexandre Courbot wrote:
> The use of firmware_loader is an implementation detail of drivers rather
> than a dependency. FW_LOADER is typically selected rather than depended
> on; the Rust abstractions should do the same thing.
>
> Fixes: de6582833db0 ("rust: add firmware abstractions")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/base/firmware_loader/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware=
_loader/Kconfig
> index 752b9a9bea03..0e6c1343409e 100644
> --- a/drivers/base/firmware_loader/Kconfig
> +++ b/drivers/base/firmware_loader/Kconfig
> @@ -38,7 +38,7 @@ config FW_LOADER_DEBUG
>  config RUST_FW_LOADER_ABSTRACTIONS
>  	bool "Rust Firmware Loader abstractions"
>  	depends on RUST
> -	depends on FW_LOADER=3Dy
> +	select FW_LOADER=3Dy

Oops this should be `select FW_LOADER` only... respinning.
