Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8DFC99881
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 00:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E88510E4C0;
	Mon,  1 Dec 2025 23:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EatjXjm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013050.outbound.protection.outlook.com
 [40.93.196.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0478210E4BD;
 Mon,  1 Dec 2025 23:09:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fW0cqlN7V2LrFLZdhmO8xe4tkHOcktj4dNKlsuzsLTF40/kfvp5rBZ/35VM9NOxCP3Xc6SR48z2noG9lhD+61Srnw92RyKTUJdUWwvUOvExB9Sv74HdoBooaIa9gX5mcbrIqHasrURWqet3QvmLrMA22w/CP/+V1f268JZJPuAD/VecF9/NdMfQngGLl7v+WgxPW8JAp7L1M039xKMgWOGzRIqvH6UPetpnQzKhL4UnsHWzeXn4+rOE45Z99sg26Kvjw3gZrBwj0/fT8+1P9Og7MMgtlUpymv+lkrJTzcKpW4v/5RmXDhN6qFn7TAjg30xU7vD6b7aJS35Mne5DMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzZbs/vJcsRin97QpTsQkNCIBjpMOxXH5z0+bMpKy9c=;
 b=lK+jn1QQcONdS+2MkGNjpWVNFgQjfn2svn/D638FdAzri1gmh3l7z7qmHVkMH0va1CVADFhKPgGOReifr9R++jZz0c8zK09baTTWiKO7sbVZZhPBWFpiImeBqpD4TNp1EZsWuHlkrk76exFflVF36BDQWHRwpHTLcqrGmFEPdwT0Pcv2JRI1X2ZfvoCSKWTYcMF9YX0ABfJkCE092U0tQXskj2ZGuYJ6G7i/G3bliFLOi/BXTkvHdA0q8X+F/0lcBH6Zy3r55PElLT/LCatTakeep6z+8G5JLMQ/NraT9vrkjVuMOP71jKJj+R+ySeZ7DxF+fUdIKTJJN+0IWp47eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzZbs/vJcsRin97QpTsQkNCIBjpMOxXH5z0+bMpKy9c=;
 b=EatjXjm5N5VDaQrBFwlKEDBhlMVd0UMFw2Po9z9u82zfAhn3AF8kcmoHnpMY/5y+5dkY7CvZd/BiLqbc0n5pd8BZVOtqbpbbzCFvb0/6dfcR2rzmSAB37gqAuRGrM4WpQtoQdnU1BS8V9+tWLWUn7RWxuzVUMfz0V9toJp+aufj4v+L5LRbZdb2ot1nUAz3lBaFpBV/EPq4Z/d7o8Z945pbpr8PWYbXi523OxryKDEYPDw0vezMGARA6rQqKffD3J7gFhZDXM+Kle92/LJi1sQON96PEa+TE7RXPW0Px5wMkey+8SJBy5xtyKpaogsFj1SLu6aXKT11BrLGvjWeyUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA0PR12MB7673.namprd12.prod.outlook.com (2603:10b6:208:435::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:09:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:09:38 +0000
Message-ID: <0ed2f00a-0f32-4ed4-b04b-0a94728b998c@nvidia.com>
Date: Mon, 1 Dec 2025 18:09:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
 <2700c827-d3af-403c-857a-30324e0d8502@nvidia.com>
 <4224983e-7788-4c40-8046-a67e67c9d052@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <4224983e-7788-4c40-8046-a67e67c9d052@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA0PR12MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: daa1dc84-8952-4d6d-1c48-08de312eb370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0Z6S3VqemZOT3RuVVhPT3cyOUYrWndYRGN2WE4wdTNvQXZKVUhYb0hJeGY2?=
 =?utf-8?B?ZkJ5WE9NVnNIcEJEb3lOZmVQWHM4eldUNERhQ2w2eC9BSTlyMGRvUm5OcFA1?=
 =?utf-8?B?bzBzYk1yYmhocU93VTFaTnUwc2V5ZHhXV0ZXWGliYkRtTjB0SFpMay8vckpZ?=
 =?utf-8?B?ekN5R3ltTGd3eldaWG1MV0orVjUvZXdqNEZkbEFuOXZBcEZqMkZyeGRqZHNN?=
 =?utf-8?B?aWFkalNxdUp2UWkzbnBYVTI4RzRCb2xha3RxZUJET2U5Q2d1QnM3ajUxc29k?=
 =?utf-8?B?TGVaT1FQczd6ZG1WdzlyUUVwWWQxUmtWK0UvcExFdldoZG5tUy9GeUtocjlH?=
 =?utf-8?B?NGRIWDEzKzNxQ285QUltQnp4VXV5Q3YvakhKckh6UGlBbjF1Rk9Td1d3eHpK?=
 =?utf-8?B?bXU0Ky8zNUhwUXdPS2IzVmNHSDNrY0VGcXdWT3RRLzVKTi9rODdQR1M1MlRj?=
 =?utf-8?B?TXBGZ01Ra29SYU1TMkVQVDhXQjY4UVA5WUdKYmRVbU1XNlFleWtTOFZZN2ZE?=
 =?utf-8?B?Y2FHK1pCVktIcFJaYmJSVDIweWk4VnEvaVFQMEFBSUlRZk82cDFwTzFpQW1t?=
 =?utf-8?B?MERoQ1o4T2hyK1NNMGtST05odXNNUmlaWkRIb2pETFRzYm9veEgzVVZIYmhm?=
 =?utf-8?B?WUZiMFJ3ZVFSUHIzYTYrb1EzQ2JwRG1GclMvU2twN2sxUERDeTB0cTEyd0Vy?=
 =?utf-8?B?MVFubnhEWWtLcm5PRGFuRWY3enFQTnJaeWNFalJsV1lYV2F3ZTFGcmFLclg0?=
 =?utf-8?B?YUhlQXNZMDJ4UHQyMitkOUZPOXo2eTZwR0l3MWh5VEpHOGFVOG95UndVWndo?=
 =?utf-8?B?MXhUeXY4Z2daZ3N3em5hS2RxS2ZnN2Y2K1JJT1lOUWRDcWpuVk1RS3R1NUFN?=
 =?utf-8?B?a3ZaMmtvdGFIUzhSdkZTaml1WEdaZDgraGVJUWMxSHBqLzRlZTQwRjJxS1k3?=
 =?utf-8?B?ZWphQUZtOU93WTFobzV2ZjR4RmMvald1aTR4aUdZcWZLZG5rOVhFM1p5REkw?=
 =?utf-8?B?UFRMK3ZZSUFKbkdyUEFGbmNvWG9NRll5YjFVVk1Rb2NlZ05Zbjc0WlBtcWo2?=
 =?utf-8?B?dTNxMjFKQ0FHczhqNHRScytyNEprWFRJSW9WTEQ5RVhoNEhIOFVFT0JYaVVy?=
 =?utf-8?B?QTUxU0FFVndWaHRjQXJPOHNWNk95TmVlZ1FoWnZzNGIwUlRISnhSb0tkUm9M?=
 =?utf-8?B?aWo4MnpiVU5jOG1GL2xLNUpwdHlXTWd0eE9CWjhHQ2NRd3VKUnV2TlZKbDBz?=
 =?utf-8?B?VjF1MTZvMWVRVFZTN3pXZ2VTYk5IQndUanVONlNlc2RmaG9DblJlOVlwT1Ns?=
 =?utf-8?B?RjU4OGloQWlXbU5pNGMzQnJaQzNNbG9XK1hsU2NxdWFmMDdJSDQ2N0w3N2Zi?=
 =?utf-8?B?QmE4S2hBNm9hRjZteUZQRS9VYUJTWkI3UFZwMmlVK0FORmMxRWlRVWJtQVpF?=
 =?utf-8?B?MStiQW5DTmxXM1Q1YU03QmI1dDd2Q3NzRVFPNklmQjBJamNjSC9kam9SUzYw?=
 =?utf-8?B?L0podlRLejVwaE1lK3RIQTd4c2ZxcTRlM0liaWRoTDk3U3FFbWJMOWpaRmtR?=
 =?utf-8?B?WGVMYXg0cElLK3RCRG5YOTJkMTVZYzZ2anhhR2pRVktldE9yS2VEcXF2RXJa?=
 =?utf-8?B?VWVzUDNZeG4wRm1QL3JtMXdwWVMySnVWM3F0WXQ2OVpFVGcxQmtWUjdtN0JL?=
 =?utf-8?B?K2FveHZUVVNtTzFRazZxK3pGZzM3c0s1MTJlODNDcU5SMWNtTFlQYjVlNkVr?=
 =?utf-8?B?RXBUUzR2eC9tRWhZYkEyZDJiUzFTazRCRUNRVHkxRXBmMkxvMjJLR2NONzFT?=
 =?utf-8?B?MjRsVHZJbk90SmhMQ0lxQXZIb1hsVFpxQWF1QitqMzVVaUQ3N1dXVWlwZURy?=
 =?utf-8?B?M0QxSG5HRXEzcDRwcVd4MUp0MVFGVlJySmV0dkhYdDBPb2JvSzArMEY5eVFr?=
 =?utf-8?Q?tEJO0swwpq3AT+XYqCkVTd2v5GyrU3tb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVdTd3JtZmlvTUpvZ0NxZjUzY0hONUp6OEdOMGc1MFhCK2JiOVkxRnhJT0M4?=
 =?utf-8?B?WUdNVjVVcWNOWWUrelR2MDV5WkxmbEl1MmhaMWx2amhkSXZ6UFpWRlcrazVx?=
 =?utf-8?B?emFRK2FZZ3l6UmpWVnVVUWl1NlZpU0dqL0pSN21leFdLUmgxTmVuWlpaRk8r?=
 =?utf-8?B?Y0N4MW9aSU5kK1g4aHljTzkvUHR3dFd6UmJiNFpWazE4eExyaTBzcldXRVdV?=
 =?utf-8?B?ZDc4ZnEzNG42OXZUMDc5OEVWZGhSU2xwellBNWRvUldYRG1MdlZCYXVSTnNt?=
 =?utf-8?B?ZUc3M29KNVhXckVYN2wzRDBubDJGNCs4OFNhL3VaeHd6YXd0a1BWT3hqZVVo?=
 =?utf-8?B?dlFxQmdJV3hTZ2JQMjVpZUtnVVJpNzBKOUtRbTdOcERmeEdBeEhaUmEyTGho?=
 =?utf-8?B?T0RBSjdLMjh0b0Q0OGtwVWNRaDduWEpBb3pjMko1K0d4cEJjUHN6aEN0MVJt?=
 =?utf-8?B?THR6bXY0WmVJSnNQZXRNMXljUituU2hVa25ZMW1JRGQ3LzZEOVBIa3lLNFcy?=
 =?utf-8?B?Ty9mZjE1c3NvUkdpY1FnaXJtZk1zd3RnTlpxS2tBNDRjalBMTDUySTR5dGZB?=
 =?utf-8?B?NnlDTmpFU2dFcGZJTllJV25ENFN3cGZYZUpaVDJEZmYzeTB6VmRLcXNNcU5l?=
 =?utf-8?B?dVlReDU5aURudHR1UUhkS1BvSlR6VTZPdHZWOFd6WU9McG1WaGFtMWJhMUhG?=
 =?utf-8?B?bHgzaTYwcFJLajRUeEY1R0VSSk5PVGRrTWNrSFBOYWFBa2xyckdkR0o4UGlZ?=
 =?utf-8?B?MzYwQ1BRQ24yZ0g2ZlA4N2w1cXRHb1oxcTlJeDF2VlhJTnFHKzU2a3JVZkxY?=
 =?utf-8?B?S2pzV3dLMWdta0FzczEyQjJnREQ1TmM5K2NxVTgxWmsrdVhaY2VpZ25JNE5L?=
 =?utf-8?B?K25YaGs2eEdnZ2xlYkZqR0hWSHNPbXkzK2RUNFNhbmdGczRlc0ltOThpbU5h?=
 =?utf-8?B?V0NZcGZZR0dTeVJ0cUtJNURkVGhUM05yeU5teVJxa1MxR3hmd21ncUwzTkYy?=
 =?utf-8?B?M01GNS9yeUhjR2xmcy9LQnBZT2lYUzFoUWdLZ255ZjlTT1dEMWhjWklMMzZh?=
 =?utf-8?B?SlRWT1ArN291RG9ib2lCeVVhTlREaGk2b2FBZHNCbytZMTNPbXJjZW1XRG1F?=
 =?utf-8?B?dDkxaUtRQXVIeGZHcmtvYWZtekdHVFdMakthTUM4V0J4R1l2Nk1PUldrRUgw?=
 =?utf-8?B?cU40a0ZLSnRobVdrd1BFSVROM1YwOUFmMnNQUFMwV1R0WHpQSHV5RWpWL3NJ?=
 =?utf-8?B?WnZxckJTbUREbUNjUS92c29QRlN6YWVrei9HUkVZLzU0M2Z1dlhPRW5YcEZw?=
 =?utf-8?B?bGErL3Zhd2Q2UkhxRGZhVG1FWXZESzJYUklsWk5WT3ViWjFzVm9NRXV1MXdK?=
 =?utf-8?B?aWhrb3V5SjFDcnRHWitnWUI0Z09LTmNvUEx3amhJdDQvNGo3WXpjdWswQUtw?=
 =?utf-8?B?eThwc3JXQ3RpSVNQNjZScWhXZWxNS1VYSUdvTStvY09SSVpGeUlKNmNxTHlY?=
 =?utf-8?B?NEVucTBZYkZBK05OM216aHFtYW50NXc5MHByNnVtbEJXbHdtVlMzN2Rmai9N?=
 =?utf-8?B?Y1FBMHFYWHp2Nk84RldCN3pWeGRuWUs0eFQzNlFrQkEwQW82cHRFU205d1Fk?=
 =?utf-8?B?MUQ4NDFyU0thR3h3ZitzNVUvNHlsbmJjRGo4UHR0VTYwRHNXRXhlS2V4Z1A1?=
 =?utf-8?B?MldXdXYvNjRPbnh4WjdCTTZOaGduSEdKWXNtRnM4WmRxWU1qWlhKUnI5eUpn?=
 =?utf-8?B?UzZhMktBOHpWNDlKMmYxV3dmOXp2RjNnMUdCc0cyVHNlTittN3c5aWlEMGsz?=
 =?utf-8?B?ZnZWMUVUQVh2S0wvNlVwOWdGdWY4QmM3VnhIOUx2VzMzMFE3ci9sVU56bXhL?=
 =?utf-8?B?bld6RERQL0tVTURvYmUxZTNOb2lLcGFydzk2U0pRUE9QVlNFU0xFUVlyT1h2?=
 =?utf-8?B?VGcyVGtQeW5KenlGR2pWQnZDRXlvamQ4aGlIMGlvQW5oc3BhK2FUYnBoczJN?=
 =?utf-8?B?MC91S3ZIZ0d1QjEwNithcVVTRDZxT2pZV2U3Q3hhTGF5VHRUeFJLWEx3ekxJ?=
 =?utf-8?B?STFwNlZDK1dZRXFxYkxnZkRrWittaVBEcWRLWFNsdzFhTFMvdHBSRVZWUGdO?=
 =?utf-8?Q?1UD22gmQJHARBKyi8hmdsnDd2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa1dc84-8952-4d6d-1c48-08de312eb370
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:09:38.3077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tt+fhl9YAdndrpKclgZ+k218w6n/5gWeTCZbmda8ObIpk456wYP8l0Vy29Qxk+UgveUO8g8VUYzpP8QkadNTBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7673
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



On 12/1/2025 5:52 PM, John Hubbard wrote:
>>> And actually, after writing the above...I still think it would be better
>>> to post this with its first caller (DRM_BUDDY, or BUDDY_DRM_ALUMNI, or
>>> however it ends up), so that we can see how it looks and behaves in
>>> practice.
>>>
>>> What's the rush?
>> Who said anything about a rush? I am really confused by what you mean. It is
>> useful to post patches even if there are external dependencies to get feedback.
>> So this is also an invalid review comment unfortunately. There is no rush, this
>> is v3 now, did you miss that?
>>
> I mean, doctests are far weaker than actual code that uses the new API.
> It feels rushed to propose merging code without a caller. And I don't
> think doctests are a "real enough" caller.

Actually I was already rebasing my DRM buddy bindings patches today. So the next
version was already going to be with the actual DRM buddy bindings (inclusive of
the clist patches), now that clist has mostly settled. The point of posting the
clist series was to focus on just that part and get it right. If you notice, my
first version included the DRM buddy user as well but clist required a lot of
changes first.

I don't think one needs to include all users in a series if the series is
sufficiently complex (as long as you posted the user or share a tree using it -
which I already did in the v1). Then the maintainers can decide if it needs to
be pulled in advance or with the user. That's really up to a maintainer. I
certainly want clist to merged only once the drm buddy bindings go with it - why
else would we want to do that? There is absolutely no reason. I am unable to
find where you go the idea that I was proposing merging clist without the drm
buddy bindings - there is little reason to do that considering clist.rs is
mostly independent of other things and is really easy to rebase.

thanks,

 - Joel

