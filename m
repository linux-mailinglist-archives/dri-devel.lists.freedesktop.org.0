Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E3B42C38
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEAE10E94B;
	Wed,  3 Sep 2025 21:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fTWPIec9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C043710E94B;
 Wed,  3 Sep 2025 21:54:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoN6V9hwNz/x11/StOiz6LxRG5EqGa+jX6DTs80UvPLg5v3Hrqoh/6uVavv+5kM96PxWOFm7Qb0tdWxwf0WXDLZrj0oVVBUtEjhzPA5Jx+Xvw8/LXuzO3IwPQoWfWv67VMH6oR2gOHldc8QG3R60PU+ggtG2y4HfAuxFPv7yoakXbe7M0t3GVlDPiM6haPSJzevcWVhf65ySeXP0vL5/FgNn/LaeLkRutPQRC2iWBBHRMoNWEhE9CZNews7NcYzym5sKDYFJ2M8XeKm3OKW5wpNe173Sy7U1TcobviEA4GYiu6ZoF6aVY6OV/1i9/q1fh7S513EHeH5IxAWTc3nm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUiRfnXjrPPjrATyci2Okjd34Esox/LB6hUaRyWJrBo=;
 b=Tz0DvtY71pWlfQNPa09uQ6jEGqFwYcCrm1GJc8RtwJSagJ2sjmpMvhbdD4qxPNg0QEna7zHfaaYl030fFASimpE88yPPJq9aCXxpPs0e0wrlzME9oD/AWsg2xB+iNlsBnZPTkD9VlkyDzfYeNv8o4/QKciVArYFz8/JMXJ7Lwq/nrDrPBkF0clGY61YLwbf/4zoaD06qAAlOUvP3PJEoXFy+prjkXT+Bx9wz/7A57WAnhcTBBP1WBVnOUgr7AT1o8jjCY2cpHE9d7UdyM1XN8VWLUsQNo3ehV3yy+BJmMCNJMxVsDEthYiRxO1EO6CLltJe+vMAapKeNz/8I6lc6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUiRfnXjrPPjrATyci2Okjd34Esox/LB6hUaRyWJrBo=;
 b=fTWPIec9ZnRFsRGR26kRztzG4htwZM33VntmnKXzREYyg+mgaT5qXQvPo0TJ77bPXjJglBgrJ2IyHlZQrDleSIF7GLTxg/9XpQ0Y0t19nXFtzyFeAt2qRZ0srawHPF6m5QOawsHofyLmth8/PhHBF9D6cFi5ItOavkinswRzaZ2AX6dpTnwBYeKsQX6ca4IH31NemmpUFj4WE4hXWODGYbcMpjULnvU1JIEoFtRFlTQ4ARpehjiFi3UXLPRn6+/7La+rC293QDz5oIEuI1er5hqoV0z+90MQKvNSp1TL5zhaHZg6muTHoOOlBWG65az8FJWJePPTa3BO2I3OWbOUOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:54:40 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 21:54:39 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v2 4/4] rust: Move register and bitstruct macros out of Nova
Date: Wed,  3 Sep 2025 17:54:28 -0400
Message-Id: <20250903215428.1296517-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903215428.1296517-1-joelagnelf@nvidia.com>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:91::36) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a859a0-0bad-4993-5253-08ddeb347b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlkvRFp2U3hoYWVUTXpVL09sUmZtTHpZb3lzYTRFWDhXcHFzQUJRUDkzWkpu?=
 =?utf-8?B?V2prYmhxYUw0N2RDQU53UHIrR1VNdjE2cGg3TTE3V0dPNWpPVFlPRldqcmtX?=
 =?utf-8?B?VVFyWjc3SHJYcVlEa0lhNU14bEFkcnFib3FsZDdSOWZXa2UwRG9sWnhGTTdq?=
 =?utf-8?B?UjBxd1VVNlFaWEpESUx5MVlYdStJdXRCT1dpR3puY0ljckR1Yzh6Wk1PNlJ6?=
 =?utf-8?B?YzcrcytpeDVJd2Y0YkhhMnJ0OWhJUE9RdHdvK1QvZ3hBSXNGbnczbXpmM2FN?=
 =?utf-8?B?cUU4Z2Y0VTRkTjhCcHg3RGpRQTNsOSsxZHpkSUFYdWtYRmdVMVJiMHFtRHhG?=
 =?utf-8?B?cFQ1UTlLbDh0RE5sVlNrQ1g0TzcreGlQMXI1bm9vcWNVWkNNOXJjbzVncEkz?=
 =?utf-8?B?cTFZV3BnQWpvWm9hZlRFM3JsWFRzaTE3MWc3R1hUcEJ3dU42enNsV2ZWT05X?=
 =?utf-8?B?Tkx0Z0E3UTRJUGEwZHRqTWIydkdxaEVpeDNveGI2Y1FBQUVrdkdIQlUvczV0?=
 =?utf-8?B?T3hhSFVMM3hpWXhzelpKdXJVYXdDdTlibmhuZmhBM2ExeFJEeUN6OGdjYURw?=
 =?utf-8?B?aU9sOFdKMW1NaWhOaUJzcEpNcnNJcUZzUGlUZG0zVFkyVFkwS0YzUEZRbDdo?=
 =?utf-8?B?MlNLaW9jRTNVdmdaTENkbCtIMHVIM0xFVEd6U2lkbzJyZVJubEdsaWYvZldG?=
 =?utf-8?B?WFYrcTBsUVVUQytyUFZML2N1ejlIVlFVcy9CYm80OWhKMjIxK1ovY2Z0d0N0?=
 =?utf-8?B?YlpFRFdZUnptMWswL3JWQjBRNW83U1BRcEpWNXJWU0FHeDZqTElwaFY3Y21S?=
 =?utf-8?B?MU5ZanJmVUlsRWhwOHl4YXpiT1J5M1B2WFErSEU0eDhHeHppN3lNVkxtNElJ?=
 =?utf-8?B?QTlVTmRVaWJuZWFIR1k1MDdESkZKQ1B3Mno0eVh6blAycEFaTlQzQ0ZiMnlJ?=
 =?utf-8?B?ZTl3bzFPamMrbXdHMld0aWh1RFMwL3hXRThhZjFvVytUSDZUM2xrN1FxQ1dW?=
 =?utf-8?B?dmpaK05mbHY3YW9KOVFxY3h0TDk5NHM3enRxZXhmbExEOUZrbVZZTmpaRy9P?=
 =?utf-8?B?bXhzcllzckZQVUhrbXlPU1lncTAvbnplV0EyVVIrSjdFamdNYzhjblBmTHRo?=
 =?utf-8?B?c1c4VHlhZlpudk9mWlg4dy9jTGdMYjBjK0JiZWIveEM3SlM1MWVxbSt4L0JW?=
 =?utf-8?B?Q3haamVlQlJhQ0llejYzck5yR1hRS1N1RXB6aVNUZTZkQTV6TEZsdjRhWXVS?=
 =?utf-8?B?NVVHb0hPZUxkZU9Jc2F5SVMxaVFWWGRpMEt1alJkeUhJRVpENUZTTFhxUEdN?=
 =?utf-8?B?a1lPQmtRNWYyVnpDYmZCQzlORWZSbW1tTEVBT2l6bkl1NUJRR1hjSEdxMi9t?=
 =?utf-8?B?c08velh3UUM0Mi95eENZSEJXdlFPUDByUWk2Tkxmb3I0a0Y2NjRUbmdhZkNJ?=
 =?utf-8?B?NFluUTVlMVArRzFHS1JXaVhGMExYWm1vVHB0OW54MWJjd3B4RzFsVzhYaFBF?=
 =?utf-8?B?UEFVNThRZTBYcmUvNTh1aXhPZjhFbUIyMjNwZVd2VWtUejhhZWFSOG5nNXha?=
 =?utf-8?B?MXFCVlRqaDlQaXNyOHlDSUxLZlQzRy9TZFcrbndmUDQrR0RTUlJwbU5BR29a?=
 =?utf-8?B?N093ek9pQ2J2ZDJzV2J3QTAyS0JRYmZ5eG95R1E0K1Ztb1VqWkkzSDRzczJL?=
 =?utf-8?B?WjZTbDM2bjVsWmhRZ2lJa2JKSS9ocmNmWHRSY0Znd1NvRDB1TVc4UkR2b0lp?=
 =?utf-8?B?UFZpemVhTFpBdFNhT0ZkWldXeDNYZ0JJMFdiNHhZMjNoSDh2UCtwNHV6SWNO?=
 =?utf-8?B?WUxjWld3WjdsbVdlTVJrUGgzek95TEtnSmdWWm5uM01yR2ZObHhHQ21YL0FK?=
 =?utf-8?B?VFA0bFp5YUdWRjBxb2JWN3dTUlIwcWJjVW1rOG5WajNRYWVFWC9iUERMcGxQ?=
 =?utf-8?Q?HeGmDvZLVcw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QitTcXdkSVEwa2ZBUlBaVmEvemxwYnpBRmtJRzVVTWo2WmtPbjlDaU9abjdh?=
 =?utf-8?B?Z0JMQ0RxRDlobzZocWQ4NGluemJSWUJBdTdUc3pERkdULzVZaFFsRE9rYWR6?=
 =?utf-8?B?RWQxQ0ZXZE54WStrOXFtOGwzR1daTTQ5Q1lZMG5LdkRSdVZBU3Q2Z2p0cVgr?=
 =?utf-8?B?WThlcWFNd0QyN1lNWnVHY2ZCVVRWRFI5Yi9rU1RvYzRMWVBEUmR0YzZtYlg0?=
 =?utf-8?B?MTlJdWI0YzdHc3dYVGw2Y3NEckI1d3lnL0dJMVpQYUtRaHExTXRDNlk5eTQ2?=
 =?utf-8?B?Z2dvdmozVHRRUkxlc1hhQVRxUzl0dXJzQTFrby8rMVAyclhNNVJ0ZGF5WTJ5?=
 =?utf-8?B?YjkvaTEzc3A5MGNRM0k4OGxaa0JnOUNLb2FnS25ibG51THN5V2RleEs5WE1Q?=
 =?utf-8?B?NTBlaUh3dm9WLys1RkpndkNxNkg4TldxVlVrQVZsdWpubC95blR0WHcvZndI?=
 =?utf-8?B?MnFSejBJSXlNSUUrTGhSN3ZKV3B6Zi94ZlQzTHlPNUhkZEpsblU4V0hDN0pj?=
 =?utf-8?B?dTRSQkNXOEdNZFNiY3ptelZpS0pCRjZtWm1KKy9XMSsvRkdRVUdjRVBCYi9C?=
 =?utf-8?B?M2xoamYwTnY4a2g4Q0tFT1lvSVk4WnFCU0c2aHQzdlI5anNqVUhKbnBkYVFo?=
 =?utf-8?B?elprM1hHeTVMU3Y2cFM3WHg2ZlZsOWlYNUtWNU1KQlQ5QUVVelZnbkd1Zm1X?=
 =?utf-8?B?YjhIb0M1bHdqUXhUV0VSdVh2eUYxWjg5M0E0STZzS1o0aE1ZaStGeDlKNTlv?=
 =?utf-8?B?eTFSVW14NjhjVFlqRUkxaVZQaCtNYlZNR0JxVXZSeDVkMFo3THpqUHVielNx?=
 =?utf-8?B?Mm8rM3oxM1JJdkdRSTdhdTBORndKTkdjTGMvV1BmQmNrTkMwcUFmQUtGeU9n?=
 =?utf-8?B?a3pDNFI0cXNZcWVkaFUxZlVvSE41R1ZhY3F4NkJYYVNEdThkM1c2Q0J3VEo1?=
 =?utf-8?B?bHVXTDI1aFFDcU1lOFh6TEd5YkxPU1QwMjBmY0pjNG5wQ0ZYVU9XTU9YSFl5?=
 =?utf-8?B?bDVQNUxjTkZ0Z3ZqRUpvRXRLUDQ1QVg3NUpaYk53VithZkdvSVBpUHBBeUc4?=
 =?utf-8?B?dVV1Y01KUUYzeGowR3ZWbTlVNmFMVTFyMzdmT0RhQVUvV1pPQ1ZiTHVocDc1?=
 =?utf-8?B?K0FBNEtUYmdrT2xIOHhQdytvc1hiZ3hSMlo3Q0tlU3d5elAraXZhdHdVRFlD?=
 =?utf-8?B?a2pzNjk3Y1p1WVVxTm1ERnMzVWhZN0RPaTV3Q2VzaW9vOTUxS010ajdXaVNv?=
 =?utf-8?B?SURvallnN09ETVFvT2NIbWcxdVB4WVcva0plaVNnVFQvNkZRQW9NNmRxNzR1?=
 =?utf-8?B?Q3g1R2lnalFocDdKdzVNblVyS0RmZU5JWVlmaFMranhlTER4WHR1Ym5laHZG?=
 =?utf-8?B?RlBQbjlBVGM4ZDJ3OHlVcGtGV3BxOVhpaWJBQTVPcTVrWEhhNmVRN3RNZkZv?=
 =?utf-8?B?b2pKRWpNWm5KcHNpaVgxeXlISWNPLy9meWNuTjNRQUp2by9keURRWFVwcjJW?=
 =?utf-8?B?Z2YraHNiYVJZWTlIVnBGSkJkU3FWeFNJQjRPS2dYR3psMlorV2hQUjJ5UWhP?=
 =?utf-8?B?WDVXN2hPeWQ5dnI3dVJHbkttV0xsME8wNWMrL3lISCttbXlWd1VJMlA5d1VK?=
 =?utf-8?B?U3JCSGtLZUtabVFGc1Z4ODJCNnVJZGRTYVlUd3ZteGZ3bmhBeWtrSU1pUDQy?=
 =?utf-8?B?cUVGSmtwc3E5OWpDYUhrWXR5c0NHNHhtTVJVRHhXTUNnRWVRV0U3VUVxRTBt?=
 =?utf-8?B?cXVGMVNrVCs5bFNlbmo0d2hsY0RsTFgzNlFLeVNIUDlSbHl2blpMWmNNTDNR?=
 =?utf-8?B?SlA1U25JanYzVmI2M09HbGZRUnM1NGNidTJQd1ZMUTZ5M2krVlRVL1dWa0Nh?=
 =?utf-8?B?UXprMk5pdDNjN1lncmMxQm1SVFhpMFduNDVobG5SU0VvRmk1MlBnMVNzWFMz?=
 =?utf-8?B?Q1lVQjkwVCtZK1lYbzRUK2JxYWtKbGpDcTdTa3VtczdLQkVWSGJFMTd2eGFW?=
 =?utf-8?B?UExTSFpKOENIaFl5b2l6bkx5YjgxamxZWktURHN4YnhQMmNBUEgzZlU1SExx?=
 =?utf-8?B?a0VWTzhrSFBJZ2poblYvTE1jVkVDZmNwWUdZMTE2Z2duUUFSSHlwUHpaaXB2?=
 =?utf-8?Q?l59nvcuclQNYD9M3fbgPVOkWW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a859a0-0bad-4993-5253-08ddeb347b5b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 21:54:39.8745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZchvlpQi10Rt3RoAT6OFv3yPhgue97/jw/29y3yFxT+lvZYznxgEXmwkiqmesEhJkSMh9UErVdFKtSf1E0sb0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589
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

Out of broad need for these macros in Rust, move them out. Several folks
have shown interest (Nova, Tyr GPU drivers).

bitstruct - defines bitfields in Rust structs similar to C.
register - support for defining hardware registers and accessors.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs               |  2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |  3 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
 drivers/gpu/nova-core/nova_core.rs            |  3 -
 drivers/gpu/nova-core/regs.rs                 |  5 +-
 .../nova-core => rust/kernel}/bitstruct.rs    | 31 ++++---
 rust/kernel/lib.rs                            |  2 +
 rust/kernel/prelude.rs                        |  2 +
 .../regs/macros.rs => rust/kernel/register.rs | 92 ++++++++++---------
 9 files changed, 74 insertions(+), 68 deletions(-)
 rename {drivers/gpu/nova-core => rust/kernel}/bitstruct.rs (92%)
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/register.rs (90%)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index be91aac6976a..06da6ce24482 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -7,6 +7,7 @@
 use kernel::bindings;
 use kernel::device;
 use kernel::prelude::*;
+use kernel::register::RegisterBase;
 use kernel::sync::aref::ARef;
 use kernel::time::Delta;
 
@@ -14,7 +15,6 @@
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
 use crate::regs;
-use crate::regs::macros::RegisterBase;
 use crate::util;
 
 pub(crate) mod gsp;
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index f17599cb49fa..9287ab148da8 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -3,8 +3,9 @@
 use crate::{
     driver::Bar0,
     falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
-    regs::{self, macros::RegisterBase},
+    regs,
 };
+use kernel::register::RegisterBase;
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
 pub(crate) struct Gsp(());
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index 815786c8480d..8f7b63b6c2b2 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
-use crate::regs::macros::RegisterBase;
+use kernel::register::RegisterBase;
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
 pub(crate) struct Sec2(());
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b218a2d42573..cb2bbb30cba1 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,9 +2,6 @@
 
 //! Nova Core GPU Driver
 
-#[macro_use]
-mod bitstruct;
-
 mod dma;
 mod driver;
 mod falcon;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..6d2f20623259 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -4,9 +4,6 @@
 // but are mapped to types.
 #![allow(non_camel_case_types)]
 
-#[macro_use]
-pub(crate) mod macros;
-
 use crate::falcon::{
     DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
     FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
@@ -331,6 +328,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 pub(crate) mod gm107 {
     // FUSE
+    use kernel::prelude::*;
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
         0:0     display_disabled as bool;
@@ -339,6 +337,7 @@ pub(crate) mod gm107 {
 
 pub(crate) mod ga100 {
     // FUSE
+    use kernel::prelude::*;
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
         0:0     display_disabled as bool;
diff --git a/drivers/gpu/nova-core/bitstruct.rs b/rust/kernel/bitstruct.rs
similarity index 92%
rename from drivers/gpu/nova-core/bitstruct.rs
rename to rust/kernel/bitstruct.rs
index 1047c5c17e2d..06e5435df383 100644
--- a/drivers/gpu/nova-core/bitstruct.rs
+++ b/rust/kernel/bitstruct.rs
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-//
-// bitstruct.rs — Bitfield library for Rust structures
-//
-// A library that provides support for defining bit fields in Rust
-// structures. Also used from things that need bitfields like register macro.
+
+//! Bitfield library for Rust structures
+//!
+//! A library that provides support for defining bit fields in Rust
+//! structures. Also used from things that need bitfields like register macro.
 ///
 /// # Syntax
 ///
@@ -32,6 +32,7 @@
 ///   the result.
 /// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
 ///   and returns the result. This is useful with fields for which not all values are valid.
+#[macro_export]
 macro_rules! bitstruct {
     // Main entry point - defines the bitfield struct with fields
     ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
@@ -125,7 +126,7 @@ impl $name {
     (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
         #[allow(clippy::eq_op)]
         const _: () = {
-            ::kernel::build_assert!(
+            build_assert!(
                 $hi == $lo,
                 concat!("boolean field `", stringify!($field), "` covers more than one bit")
             );
@@ -136,7 +137,7 @@ impl $name {
     (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
         #[allow(clippy::eq_op)]
         const _: () = {
-            ::kernel::build_assert!(
+            build_assert!(
                 $hi >= $lo,
                 concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
             );
@@ -198,15 +199,15 @@ impl $name {
         @leaf_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
-        ::kernel::macros::paste!(
+        $crate::macros::paste!(
         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
         const [<$field:upper _MASK>]: $storage = {
             // Generate mask for shifting
             match ::core::mem::size_of::<$storage>() {
-                1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
-                2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
-                4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
-                8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,
+                1 => $crate::bits::genmask_u8($lo..=$hi) as $storage,
+                2 => $crate::bits::genmask_u16($lo..=$hi) as $storage,
+                4 => $crate::bits::genmask_u32($lo..=$hi) as $storage,
+                8 => $crate::bits::genmask_u64($lo..=$hi) as $storage,
                 _ => <$storage>::MAX
             }
         };
@@ -219,7 +220,7 @@ impl $name {
         )?
         #[inline(always)]
         $vis fn $field(self) -> $res_type {
-            ::kernel::macros::paste!(
+            $crate::macros::paste!(
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
@@ -228,7 +229,7 @@ impl $name {
             $process(field)
         }
 
-        ::kernel::macros::paste!(
+        $crate::macros::paste!(
         $(
         #[doc="Sets the value of this field:"]
         #[doc=$comment]
@@ -267,7 +268,7 @@ fn default() -> Self {
                 #[allow(unused_mut)]
                 let mut value = Self(Default::default());
 
-                ::kernel::macros::paste!(
+                $crate::macros::paste!(
                 $(
                 value.[<set_ $field>](Default::default());
                 )*
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c859a8984bae..9c492fa10967 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -64,6 +64,7 @@
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
 pub mod bits;
+pub mod bitstruct;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 pub mod bug;
@@ -112,6 +113,7 @@
 pub mod prelude;
 pub mod print;
 pub mod rbtree;
+pub mod register;
 pub mod regulator;
 pub mod revocable;
 pub mod security;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 25fe97aafd02..a98c7b7ab6af 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -39,6 +39,8 @@
 
 pub use super::static_assert;
 
+pub use super::{bitstruct, register};
+
 pub use super::error::{code::*, Error, Result};
 
 pub use super::{str::CStr, ThisModule};
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/rust/kernel/register.rs
similarity index 90%
rename from drivers/gpu/nova-core/regs/macros.rs
rename to rust/kernel/register.rs
index 22a53a73b765..1f48c5335e70 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/rust/kernel/register.rs
@@ -16,7 +16,8 @@
 /// The `T` generic argument is used to distinguish which base to use, in case a type provides
 /// several bases. It is given to the `register!` macro to restrict the use of the register to
 /// implementors of this particular variant.
-pub(crate) trait RegisterBase<T> {
+pub trait RegisterBase<T> {
+    /// The base address for the register.
     const BASE: usize;
 }
 
@@ -281,6 +282,7 @@ pub(crate) trait RegisterBase<T> {
 /// # Ok(())
 /// # }
 /// ```
+#[macro_export]
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
@@ -378,7 +380,7 @@ impl $name {
             /// Read the register from its address in `io`.
             #[inline(always)]
             pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
             {
                 Self(io.read32($offset))
             }
@@ -386,7 +388,7 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
             /// Write the value contained in `self` to the register address in `io`.
             #[inline(always)]
             pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
             {
                 io.write32(self.0, $offset)
             }
@@ -398,7 +400,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
                 io: &T,
                 f: F,
             ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io));
@@ -421,13 +423,13 @@ pub(crate) fn read<const SIZE: usize, T, B>(
                 #[allow(unused_variables)]
                 base: &B,
             ) -> Self where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
             {
                 const OFFSET: usize = $name::OFFSET;
 
                 let value = io.read32(
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                    <B as $crate::register::RegisterBase<$base>>::BASE + OFFSET
                 );
 
                 Self(value)
@@ -442,14 +444,14 @@ pub(crate) fn write<const SIZE: usize, T, B>(
                 #[allow(unused_variables)]
                 base: &B,
             ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
             {
                 const OFFSET: usize = $name::OFFSET;
 
                 io.write32(
                     self.0,
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                    <B as $crate::register::RegisterBase<$base>>::BASE + OFFSET
                 );
             }
 
@@ -462,8 +464,8 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
                 base: &B,
                 f: F,
             ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, base));
@@ -486,7 +488,7 @@ pub(crate) fn read<const SIZE: usize, T>(
                 io: &T,
                 idx: usize,
             ) -> Self where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
             {
                 build_assert!(idx < Self::SIZE);
 
@@ -503,7 +505,7 @@ pub(crate) fn write<const SIZE: usize, T>(
                 io: &T,
                 idx: usize
             ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
             {
                 build_assert!(idx < Self::SIZE);
 
@@ -520,7 +522,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
                 idx: usize,
                 f: F,
             ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, idx));
@@ -535,13 +537,13 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
             pub(crate) fn try_read<const SIZE: usize, T>(
                 io: &T,
                 idx: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            ) -> $crate::error::Result<Self> where
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
             {
                 if idx < Self::SIZE {
                     Ok(Self::read(io, idx))
                 } else {
-                    Err(EINVAL)
+                    Err($crate::error::code::EINVAL)
                 }
             }
 
@@ -554,13 +556,13 @@ pub(crate) fn try_write<const SIZE: usize, T>(
                 self,
                 io: &T,
                 idx: usize,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            ) -> $crate::error::Result where
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
             {
                 if idx < Self::SIZE {
                     Ok(self.write(io, idx))
                 } else {
-                    Err(EINVAL)
+                    Err($crate::error::code::EINVAL)
                 }
             }
 
@@ -574,14 +576,14 @@ pub(crate) fn try_alter<const SIZE: usize, T, F>(
                 io: &T,
                 idx: usize,
                 f: F,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+            ) -> $crate::error::Result where
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 if idx < Self::SIZE {
                     Ok(Self::alter(io, idx, f))
                 } else {
-                    Err(EINVAL)
+                    Err($crate::error::code::EINVAL)
                 }
             }
         }
@@ -607,12 +609,12 @@ pub(crate) fn read<const SIZE: usize, T, B>(
                 base: &B,
                 idx: usize,
             ) -> Self where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
             {
                 build_assert!(idx < Self::SIZE);
 
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                let offset = <B as $crate::register::RegisterBase<$base>>::BASE +
                     Self::OFFSET + (idx * Self::STRIDE);
                 let value = io.read32(offset);
 
@@ -629,12 +631,12 @@ pub(crate) fn write<const SIZE: usize, T, B>(
                 base: &B,
                 idx: usize
             ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
             {
                 build_assert!(idx < Self::SIZE);
 
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                let offset = <B as $crate::register::RegisterBase<$base>>::BASE +
                     Self::OFFSET + (idx * Self::STRIDE);
 
                 io.write32(self.0, offset);
@@ -650,8 +652,8 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
                 idx: usize,
                 f: F,
             ) where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, base, idx));
@@ -668,14 +670,14 @@ pub(crate) fn try_read<const SIZE: usize, T, B>(
                 io: &T,
                 base: &B,
                 idx: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+            ) -> $crate::error::Result<Self> where
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
             {
                 if idx < Self::SIZE {
                     Ok(Self::read(io, base, idx))
                 } else {
-                    Err(EINVAL)
+                    Err($crate::error::code::EINVAL)
                 }
             }
 
@@ -690,14 +692,14 @@ pub(crate) fn try_write<const SIZE: usize, T, B>(
                 io: &T,
                 base: &B,
                 idx: usize,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+            ) -> $crate::error::Result where
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
             {
                 if idx < Self::SIZE {
                     Ok(self.write(io, base, idx))
                 } else {
-                    Err(EINVAL)
+                    Err($crate::error::code::EINVAL)
                 }
             }
 
@@ -713,17 +715,19 @@ pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
                 base: &B,
                 idx: usize,
                 f: F,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+            ) -> $crate::error::Result where
+                T: ::core::ops::Deref<Target = $crate::io::Io<SIZE>>,
+                B: $crate::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 if idx < Self::SIZE {
                     Ok(Self::alter(io, base, idx, f))
                 } else {
-                    Err(EINVAL)
+                    Err($crate::error::code::EINVAL)
                 }
             }
         }
     };
 }
+
+pub use register;
-- 
2.34.1

