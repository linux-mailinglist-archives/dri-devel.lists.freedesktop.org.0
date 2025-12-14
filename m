Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354BCBC1CF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 00:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BA310E034;
	Sun, 14 Dec 2025 23:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q+xUg/c4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947A810E034;
 Sun, 14 Dec 2025 23:43:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoHRMQXpNOVdhSKcYR9icugPhXDuXZm6ruTKwdelxPqaZcedd8h3i0tcpsKaCZxV1I/ETrSpLNu8ejpzWwtcIKycjNn1fwbpr2X5jltZOj4aZgozbun7Xypwp5Rocr4hwKQ8FSPHgzxod+3uQqQFgajsyPZdZmPnHQFGW1dWqhnJQfS/O5pw5vHMr+oj5hJcjTN6/DTPPSddljxSYQweioahLvWOg5Snx0wp79uSSsGzozYWYFiP2FoVmbvfBb4n/5CX7TQTBeOboRBuUUnGm1xLoeGzWX/stlUwJxWD9bO+RIZQur0D15I68Td5Nv1QbyoFn2iuXmuFpNMKdGeVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDq8/RjUhWBpO1WFNHzQWKwZKkCPqrC2D+P0bTp4b/Q=;
 b=ViJCgfnK4VajCnFRJD1oi+YS8o8RjbS6Suin6/g4Re0GSTGFdh7o45OKCL1DMN6Re5PjuQy8A/wM/WOaO9Yht2wWO89RI1Vzwj6HDM5z4Zr7J4DybSaUPSqssbEPr/sXBHetub0qO+U/kXsHO0aQziJOYvWLLTOFG16yDY/sjkqFa8qu14wfvP3HndFeX9TeySNwXgkYSpOjDbDXkpO9p5+bAFZQBsPJPjtQBbg3faAxrKl+S45IBzswqYT4o5VvHAW1jXzEgbmXGlhXglkxSDHo8c9EPGQhK4TBpBeRgCKYZrtAGfrsqBbt0w5RxEQElYCNqJrbJBI6r/72Y85Bog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDq8/RjUhWBpO1WFNHzQWKwZKkCPqrC2D+P0bTp4b/Q=;
 b=q+xUg/c41uxf7WM7Z47HykABWurxnycfGD0RvUu04750Mc6trJc/Ku+kDO7CTxyk8w3SqTzu+ClLj9DR6aoTo6hIFxDIDgYlLd7KMO6u6m5xnGThG2rmIY2jFaGc1/m1LMbURy4T4w1lYIHvv95DLxld/ldx/K+qDy9C4CyKUJOLczLWULrYKZslpRs2l8W/R1kcFJOLhj5whJgsxjICmI0oewnn6MPoerqJN/ekGER6oZRAMtD09SGYcDSEUwJ4xxE8MDgmBM7U64B9cJdse1mTOpGRiqVnp6js0Ltays+mTY21cEB0CR0FDgW1ozWN9UN3VVsCGc4ombVoUrsQRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA5PPFCB4F033D6.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e2)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sun, 14 Dec
 2025 23:43:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9412.011; Sun, 14 Dec 2025
 23:43:27 +0000
Date: Mon, 15 Dec 2025 10:43:17 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Message-ID: <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
 <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
X-ClientProxiedBy: SY5P300CA0002.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA5PPFCB4F033D6:EE_
X-MS-Office365-Filtering-Correlation-Id: cf63b212-a850-4c85-9909-08de3b6a93ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjA4ZnRNYnY2MnlrWjBsSzRCNGQyQ0Q1TWZXMUtKVDhWMytSUW4wRW4zNS9s?=
 =?utf-8?B?dWRkd3hQWFYzUVRIUE9wQ0FJblRIRmVmSHZ5R21JUG5OTHJEanVxVTJGWnBy?=
 =?utf-8?B?K3pmdWQzWlZMeDhLTTFSYzlRZUJtWHdTWEpWMGVpN2ZUNnQ5M2Y0cE5lYnlk?=
 =?utf-8?B?YmZpUzc0cXROZzBzYlRSbWU1M2FWN2ZqYSs2TTR6Y1QrWE1ybThvZWZURDg4?=
 =?utf-8?B?bnFoZkIxU3JTcG9OT2xSYXd3SG9Bc1FUK01LVFFiNnYycTZrNjltbGVtd0Fs?=
 =?utf-8?B?aTBBZHpSV2pFd3VJUjd4blkrT0NVQXZCSTVPaFpDSzZmSEgvVjI4SW0vcCs5?=
 =?utf-8?B?TXJWb0ZrQzFEbkpVL1l3dEREL210Z1RtTElya0NjKytESFlFQ21yaVp0endI?=
 =?utf-8?B?d25Cb1BkdTE1cWEzbkJuZnFIUit0dUc4eW11ekVMeVUvQXJtYkZEeGV6U29Z?=
 =?utf-8?B?SFI0dlRRWGdPa2tHcUlEU0R1RmVPYXJBamk0VVVnUi94WGFlcmxDU1ZwN3Vj?=
 =?utf-8?B?Ym45VkpVVVdTNW9vNzN2VzNqcWMwUzRPM2EyR1BoRHo2bXdKcGxJRGthWXRC?=
 =?utf-8?B?NlZ0VWlPaXhsSVp5bG9PSkZQVmRYY0EvZmxGYXM3dVFWZVlBdUo1TStzSEo4?=
 =?utf-8?B?Mk94b3ZMaXd4Y3BPbVhvY05xOXltM0JBQ3NMZkZpdFNvaVc0RUdrUDFIaSta?=
 =?utf-8?B?YkJ4Q0FhamZvV2pDZnVKYmZSaURrZDhHdlVwY1p4bUk0N3pWYklXNGdoT1FQ?=
 =?utf-8?B?cjNGT3J5WnkybXN1Ty9oTDFsM0lRNGRuU1YyRGxWVFliU1VtRGdsemc5NkE0?=
 =?utf-8?B?RUt6eFhKdjVLbG1MUm0rYStmOWcxR3hBWDc1S1FYVVZhcWhWV1BJSzZWUFZ5?=
 =?utf-8?B?YjJRZlQ3SUpzZ3l0VThxbzlabGo1dm1iQUdZOS8xTHk4WEowNS9YU2Vua05Q?=
 =?utf-8?B?RExLcGNOMXFTMXEvZjE5MUpXOTU5UElkZjVxRUZQZi9NZ1BqTzA0RW1OWS9D?=
 =?utf-8?B?ZjNzT1ZZd1NaNzd3K2kzaDg2QXFZazhQVGxYK0c3OHM0MFptUTRLL0JKQjh4?=
 =?utf-8?B?YlB3amNIUm4vZ1k4MnZFalFTaThRS0ZQKzVIdkJzYld1K3ZSQ0tmTTdVRVBU?=
 =?utf-8?B?V29hU2t4VEFHc0poM2gxYVlUcTRtckVnb1VHc1NGT2xRZ0lHMzV3MnpWOXhJ?=
 =?utf-8?B?SkhuR0tOeHJZWlpoQkRwZ0M1NnA3TzNBWld0RzUxVjV2QVNNQVdRVWs2UjN0?=
 =?utf-8?B?M2RZc1pYYUlHYWtsVDJmVUZhSCtNczJ2Q0dGeTZMQjhaRXR6V21lNldWZEti?=
 =?utf-8?B?clJsaVB1aHRlOGV5d1EwbDVDaVBwdzRMcnlPRzJMUWF3SG9JUHIySWZiWmlW?=
 =?utf-8?B?V3FpUGNocWRjcFNmL1czTzQyUFBvK3c5amdtSEE1cUJNMFJ2K3ExS0RqZ0lS?=
 =?utf-8?B?R3dGU1lZTVB3TVd6MmdVZXN0bVAycmsyYU94bFlGREJMVTN0eEZ0aFRJYjhU?=
 =?utf-8?B?RlpwdWMrMUlQSDYvaUYyNVFTamw4aG1heU01SFF5NytpSDJvcnA3bjNYd2hQ?=
 =?utf-8?B?N2M0VUdKSDBaY0Z1RW5HMmEzZ3dXWTBmeERLNUtQcWw1a0NCRVBzTFZXdG1w?=
 =?utf-8?B?Q2NBYS8xM0J4ZlRJelVDdlZUWFRSYklLZkh5cU5hUmRVK1RVVlNyelBxK3BS?=
 =?utf-8?B?SG5QbXBoV0g4cE9FdDNLbzNHTTZDc2tJTUMva2pkdEROWXl4MHNUdGIxMHlu?=
 =?utf-8?B?ZjRoRlh0dTlGMUF4ZTVtNXlyS3ZwQXR0QkxBS2Y4dHFJaTNTcGtHdzBBM3BQ?=
 =?utf-8?B?YUFFdUlsenBJdFN1d2RLcUh4V213R1M0VFhoY1R0a3RTMTRHU05PRFFLOHU1?=
 =?utf-8?B?WGxoaHdDdGlibmduMnFHUFNaaUM3Zmw0elQvS0p4K2h5WjR6RzdJZW9ZVm5X?=
 =?utf-8?Q?HVSfUz/BD83pO+hOJzCysRS23nHVoSJb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxMZEQvZmpjN1VSUlVycTJuUk1FemhYYlg1SWFpaDA2UFVQQTlYSlhOVVJC?=
 =?utf-8?B?WUgzZjJSUHNENmJVcWI5Qi9tOVpYSnlnMXpkQ3dkeUVBRnRER0EvQkNIZ3RI?=
 =?utf-8?B?Y24wM1ZVdGFYZW1TWmczMStNUEQ5VFozU0FPVG9ZZFg1TkhyQ0s4WmdYKzMv?=
 =?utf-8?B?Mkt4SGRQQ2VZU0dmbnN2bVAwU09LNHhvSVQ1WTNHcGgvT012NnNTM1NFVUNm?=
 =?utf-8?B?ZVcvK3FLU2dZQlBLdXFKOURCeUJNYXpvbnVwK3RNUVZ6RXU3WVZ4V3c5M3FL?=
 =?utf-8?B?eU9Xd3lCSXJsN2YwNTc0UVhEN1RHUkplM1BkL2RoUVFDSzlGVGxvblVBNUpr?=
 =?utf-8?B?UUlyS2dTQ1I3eW4vOGs3bmRPNDVRWXNNVGZ0SnhwdklqdjFNOVhHZ21QTkV2?=
 =?utf-8?B?UTdYaUZHclFmN0g4UlFBdTJUUXllZTFjakNxMkVGSHZrMlNlOWpkMHF1U0th?=
 =?utf-8?B?ZlpHd1cvdlh5ZDRTWHk2dUZqK1R3UkN6cmpZNXZ3Nm1Ea3NzcUpQaTI4R1Rt?=
 =?utf-8?B?aWNaVTN3WU5PYkxiK3l1OWZQbkFjRkNSVVFvN3dkR0JPS0FiNkZqcEhjbE04?=
 =?utf-8?B?d05kQk9rRlQ0eDFPVkR1QUdYWDVUWDBscS9xTVZlb3V5Y3pabnNCMk1tZnBL?=
 =?utf-8?B?RnBWaUpnclNaclZWOEFycEUvWlVSMTZSenE1Snh1WGljaXhOYmZxaDcwcy9p?=
 =?utf-8?B?RnpiczJSM09nR0Ric0NwcDhBNllJV09DZ1RHU013WjI3VkxzMUE0Y2lNbVZz?=
 =?utf-8?B?alk4OEFHRm54TjRNMjBtbThiKzk0dmN2Z210SEh2RkZJWVBWY2NHSVdUNWZJ?=
 =?utf-8?B?MDZkbkRMcEtacG9UeTF4WEFkZWU1UTZIaS9MNk1DQXZRdFNJZW1RaXhUSlV6?=
 =?utf-8?B?TmV1UDhQWEdiMWlCUThka1JnMmFweU9YeUNCUE1wUUJQaFZqWUk0Wkd5UEd4?=
 =?utf-8?B?RWE5SVhuU3hETW5wVFhQODMxUTZWeTZ5VWJhTDFrNitrejZYZVZ3SE9VeHYy?=
 =?utf-8?B?TFlzMGtOUTcxN3VhQjJ6K0RDalgyU2d2M0ZqWGhtdlNOV3hZb0d1aWJVMHVM?=
 =?utf-8?B?dnpCOS9xZWlrUFlFTWY4Y1VobkV3cSt0ck5MN1czOWx2NjAzd2Q0K0tMTlky?=
 =?utf-8?B?V053ZFoycE9PdEd2UnRSeUk0MjZBdDZ5bmM4R0xNV0taajFqZkFrSnYrOEFL?=
 =?utf-8?B?c21SRUpYMklTbDZ2RGEwUkJZcGdnWVRvZVYzQXRlWXp1OU1La1Y1WEhRRWNh?=
 =?utf-8?B?QWxRK285M1N3Nmw3Wjg5L0R5T0puOVhEQy9UVTZZNFlzQllHcXlCRU93anVp?=
 =?utf-8?B?Z1VIQ0FaRG1UaWNTdjJCODZFYkNVUXp0d1BJL3VZS2tIcS9HS0dyY2Z5YmFx?=
 =?utf-8?B?QmczTmNnVnlNb2s2YmpyaG5MMjBQQ0RLVGFaV1ZNNm5qdTcwZ1NXV0JmcXNi?=
 =?utf-8?B?T2FaV1dkV09KaGx5V1g2MUFRVzFmTnY3VFRWUXFRS0VzSmVOdEVZeElrc1NG?=
 =?utf-8?B?bVFSUzA1VnFKMzJhWWFtb08xVGp2b01sbjh6OU5WcTVoODlDZCtMY2tSUGda?=
 =?utf-8?B?bE1sYjBuSjlvOVJpZGZlWEVvMDBxU3RuY285Zkh2cnA4bnZYeS9OM2ZSM2FF?=
 =?utf-8?B?R01qb0NlSENGQWJNRzY5dWJjbksyU1JSNWpKcU9kcmYxeVpwcjZKakxIeW1J?=
 =?utf-8?B?UmxiK1NBTkg2LzdEVWlOV0ZYMnVNSWNJWGQ5S25sYmpZNDkzb2tQM0wrM2E0?=
 =?utf-8?B?QVZ3NGZrTThnRFdETEt1WkJ5TStnamZZamVJNVk5RElwZWN1eDlxRmE1d0F2?=
 =?utf-8?B?ODZrSmFtUmxkNWV1S0hxZVhiSWR5YjhDbXc4eTExTnRNa2tkQ1RqQ3B3Z0Fl?=
 =?utf-8?B?eS9GNWRlc2UvZ3VMRFZhYy9FWlpySDRaaHM4anQ3aFNNaFBlVFRzZ3AxU05H?=
 =?utf-8?B?dzZUWEtaMmhVL2VYZkIyRlNwbzZqZ3JaaVBvVWRhelREeitvc2lnaDc2RFlt?=
 =?utf-8?B?UTNSOEk1RThxdDlkcVhnVHBPb2liMTJEM0F1QzdFSU9FVVdzbS94QzN4YnZ0?=
 =?utf-8?B?M1lNVUh6YW1ZL3JaYmsrUW80ZlpscDZra2RVNG1oamIwc2k5TnhkVHVvb0xk?=
 =?utf-8?Q?p/rIx/QIBQtZ0chpFNV7tqyYA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf63b212-a850-4c85-9909-08de3b6a93ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2025 23:43:27.4423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0q/Z99Kw/8t8KY1YzmzwN+xomqE2kLjXQTMsWvdFNQc6LKIwu45H8D3YOKyAbpJR049zYX6PIdyQKlP/ORzimw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6
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

On 2025-12-12 at 19:10 +1100, Dirk Behme <dirk.behme@gmail.com> wrote...
> On 12.12.25 08:59, Joel Fernandes wrote:
> > Hi Alex,
> > 
> >> On Nov 22, 2025, at 12:00 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> >>
> >> ﻿The size of messages' payload is miscalculated, leading to extra data
> >> passed to the message handler. While this is not a problem with our
> >> current set of commands, others with a variable-length payload may
> >> misbehave. Fix this.
> >>
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >> drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
> >> drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
> >> 2 files changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> >> index 6f946d14868a..dab73377c526 100644
> >> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> >> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> >> @@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
> >>             header.length(),
> >>         );
> >>
> >> +        // The length of the message that follows the header.
> >> +        let msg_length = header.length() - size_of::<GspMsgElement>();
> > 
> > Is this immune to under flow without one of the checked subtraction wrappers? Either way, we should not tolerate the underflow I think. Which means it can panic when the rust overflow checks are enabled. Since the header length comes from firmware, this cannot be guaranteed to not underflow in the event of a malformed message.

I think we're guaranteed not to underflow here - check out the implementation for header.length():
 
    /// Returns the total length of the message.
    pub(crate) fn length(&self) -> usize {
        // `rpc.length` includes the length of the GspRpcHeader but not the message header.
        size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
            + num::u32_as_usize(self.inner.rpc.length)
    }

So the above calculation expands to:

msg_length = size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
            + num::u32_as_usize(self.inner.rpc.length) - size_of::<GspMsgElement>();

Where self.inner.rpc.length is guaranteed to be >= size_of::<rpc_message_header_v>() by the construction of the type.

> Would this be a possible use case for the untrusted data proposal
> 
> https://lwn.net/Articles/1034603/
> 
> ?

Responding here because Joel appears to have sent a HTML only response ;-)

I agree with Joel's points - this does sound useful but as a separate project.
I'd imagine we'd want to it one layer lower though - ie. in the construction of
the GspMsgElement.

> Cheers
> 
> Dirk
