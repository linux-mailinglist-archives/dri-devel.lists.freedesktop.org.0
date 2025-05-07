Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B470AAE15E
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CC010E7E1;
	Wed,  7 May 2025 13:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cHmnkhjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C7510E7E1;
 Wed,  7 May 2025 13:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sN5GCYwzKldLpH7yscgsYfBQzU41E5y/ZI3dWw1pkLlgF3xTjZXDV4qoZrHVElC/tSHlfqDgWt+QLbiSVgopxaOa/6hzukAiWSCBsUo6i7pIZl7+HQXL4Q8UVUKN5Sj2pDjoeeawumzjcGKo5IThYnxIyMaa74aa1wGtOVfnFa1NWwCmvQTDQjodTjqIou6Xzr3lyK424Y2hoEDG+zrPQHW8Y7/hI0obUCSIUlp4jVMunDMJTHRmW1iHADyUBC7KY+PDD3lGexEjuuAp/8IRrdcIgz3bsgwnrftOI9/X/DDubIGuaWKuIUm0p7EcP3si7CPzOdrmddHvUfVUxNqQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNdIUZOGUBA8bqX743RV4RAhbdDpl/1y5DCmOIqKFOE=;
 b=hR9I4dk9V/q6RUwYwKkEM/2w41mLvJp/C6tISPx4h4Jov5VVSdH3I+pYVvkoCDYcwzas6c7khZn52hYDj5W2chAyq3KMvCdXR91o2E8xqjLxCkKKvAgEwNY7xUoq4LJd6PGuTPTFSuh1cuxRwgBcPTejv7uwDmNHycYjIcAN0OTXn6P+WjvvAy4SBgLZmoWaZobv3UaH7U4zKaaZbSVZ4bZAMTeRx00l9MulJJPfcw+wmetcdaUipJSSvCnYJSy4+3+UpANbBbk+m1fWGZ/c05qjKG1A8TWj6BiKPaA/O6utuZ7SpwJn/MKffo8UB8ugszMIwusSQlNy1pxtMo+meA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNdIUZOGUBA8bqX743RV4RAhbdDpl/1y5DCmOIqKFOE=;
 b=cHmnkhjE1l8lvkiUNMljOTeh5i53Zjyv/9p4zmERvrb3SDTxw6OjIOIT9v2g+zT54RQlJLHiWS45vFlNzMN63ZMeZFwLl8pr3K0sy1i2byARMKV9D4QFekSohgH0GKGXpZPjF1XNtlDacvl5g36a4WToyP+c7XvO12xuGvV3S75P5avnbiOaU7sZB8JVch59PNSzTwXvXIfNmB1sYXAXPBlL2UnVDMB/kGl5UyZ8YqmXDBw24zaksoRztn/FK8msIh1dadQB75wveHwCkn3Rv8ZP6meGBkjqmIi6Y2uRILvOg8g7lnguBcS1nCVEX+p+1RfRJX0srQTHQNrs5LpFAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:35 +0900
Subject: [PATCH v3 08/19] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-8-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OSTP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e414a95-db1e-4ca7-3eaf-08dd8d6e7ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWxXdWp5OUMyL1VZd2lxWUgrMDZJOW5lRm9EUEx2U1BkUVRpYUdjVDNTNllp?=
 =?utf-8?B?TVdHL2E3VENOanV2VmZvUUFyV0FoQTRhNXFma1F0VDA1Vy93MzcrMk9aUTdl?=
 =?utf-8?B?NWxBQVR5bnlqWDd0TEs4WGNIZVcxZkdVQWM3d2xsak1vU1l4T2c4NjJ1SXdT?=
 =?utf-8?B?UmJwVjRLSmZKVjVIeWFKWTU1ZVBRdTN3QVg2WUhLT1NIenRrRWJ2N09pR2J6?=
 =?utf-8?B?b043bzQ3U1dQektVeXBhdHdjZE1KZTRLWllybC9Rb2tCNk1adGJEZEZPcXNL?=
 =?utf-8?B?Z2RqcEFmam1mZ3pzcTlkMVlicXhLREl0dkh2RlM3T3hOZWN0bVR4NlJjVUJZ?=
 =?utf-8?B?aTdMbHFabGtTSW1yWWp1b09iYzJtYTZVaWgxdkV6bCtzNDNlTXhxUitZN3Zu?=
 =?utf-8?B?WVdKUCtHdU1QQ29EaUhBT2VzYllabU04RmsrYmMvdVB1YjlwZnFOVVpyQzBz?=
 =?utf-8?B?VEJqNmJ4dXl3SGc2RTRSQXI0aGJjelhZMDY4TDZWN3gxdG1Ia2YvSXk5R3dF?=
 =?utf-8?B?aXdXMnNUNlpkdmlITTRvKzc5RVRyMVBFV1VFUC8xRVQ5YkZFSkp2bGpFR2ha?=
 =?utf-8?B?MkFXQUFsZVBzOTFPemVGV0s1WUs4Umk1YUNJUkp1aE5xKy9rUkZ0VDI4Yndr?=
 =?utf-8?B?S3hCbnd4N3JOMk5UVjlpSkQySUhsK2d2dCt6TlF6czBuWDFQSjROd3UwdWJG?=
 =?utf-8?B?azBHNEJVTFhESWliYkQ2djcvVGlHWGlpcU1ZbjBGYy90RzdjZUhVZk8wK1hj?=
 =?utf-8?B?U004Z3Q1a1lDelNLTUxOU0NwaGtMNWJYckdBcG1IWmY4azhGeVBGQTFDTkhi?=
 =?utf-8?B?K2hJUE8vRlJ5TEtXR1lwTDF1RCtySm0rdE92N1dmcElpYWFUUWphT2FzOGpx?=
 =?utf-8?B?WkFvUUVrWThoWUljM0IrZnQyZHhmRFhUWTFNbExueWlVWEtyTC9CMFp4UU90?=
 =?utf-8?B?eDVoRzlYK2ErcDhodU1MclRsTVlxbklRMWFZT3lPZk8xREhPdnU2U2syemxE?=
 =?utf-8?B?WnZkNmE0UFFQT1ZmZzh2N0gwZVVQZDNpY2hxajN0WXN1ZFpwcmZ3a0hDOWFW?=
 =?utf-8?B?Rm83OUN0YVZvVG5wT25Ga1ZVdVIxNzkwVmpJT0VWUVVKa0lsaG5WdkJweWJT?=
 =?utf-8?B?Tm82SnB5d0VCSVZ4NWFhT3ZRTU9nTjBKT0tmR2E0QnROVERPbzdWQVV2R20y?=
 =?utf-8?B?NVF4Q3l6QWJ3S3BKMklJdVdLa3JMdit6a1Y1Y0h2UnJ4eUc2TlZyOUVKQmZs?=
 =?utf-8?B?TGxNNm9aUDNaeXUxcEl1cURZR3Q1Sk5CQjNFVjFqMEJNbTBtTmxZeWJJeDI0?=
 =?utf-8?B?aWNnSFo0RDZuYmN5cHhJMVZzdDF5REFoYSszdjlTSG96eUZHM1orODJvajNl?=
 =?utf-8?B?cWQ4aGRna2JDVjRnNVdPQ1lZL0RzMWxvanJ2WUk2djVqMU1CUmMrZXFhaExK?=
 =?utf-8?B?L3QyUXBsc21WMGI1WFczdE9sZzlXd0JEY0w2cnFTT29oaUVLOXVqQ1dzWWFv?=
 =?utf-8?B?aStZZnZwUmpzQUd5WHlBMHN2RDIxNW5tWVF5U3NRY05RYUxQRFZmdnZiTjkr?=
 =?utf-8?B?VWk1aWFURWlaRTNZaWVSdzZtL2pTcmh6WVdVOFhIcWU5ZkxZQWlSeUNaZ0xi?=
 =?utf-8?B?TEx5Mnk3VjdGTWxwSERLbEZMYmtJZkd6TlVhUTIxdW03aElwYWEwcUtBWWxO?=
 =?utf-8?B?NVVBb0ZSN0piMzRXbThQZmw0enh1OE8zalpTQ1VXUXlkMTlGYi8wZ09XQlZ2?=
 =?utf-8?B?WXVHSXp5MlhobTUwVDFRb0grZE9SV3Z6dUV6VTlkaCsrYisvRDJBWDZacXlL?=
 =?utf-8?B?YWtWVUV6YW1aVFpsUk9ISG1sL0VUSEVGd3Z4Q3ZhU2lQd2o4QXJJQTNldFVV?=
 =?utf-8?B?MUtON0xabTk4N2NuZHFGN3NXZUlQcmoranR3MmhxZElTcUVzQldCeGVOb01Y?=
 =?utf-8?B?UTgvVVMwUktpdWgrN09FaVBWQ3VmUHlNa3ZKdVJ5N0plOHpyUDFCdWFkSEVP?=
 =?utf-8?B?L21QU3ViVHZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxtVFE3UlA5SU9JVXlnTXRtMFZUSHBMQklLbWRnWVZGWWo0dDMrbkJhWkcy?=
 =?utf-8?B?RjhFZ3RJd1B2YzdsRVJFODQ0MHN1L2RKQlVVbit5MHlwZFVCaGlIMmh1d2Yr?=
 =?utf-8?B?ZktoMUhVMEFxKzJvenVZTnVDKzkweDQ0ZHJkRWQ4VHA5ZmFFWjZTdjVnYjVC?=
 =?utf-8?B?RE4zZFZoanQwMml3dUFDODJKWEdtc1pVNURCTjFyZ0JwSUd4SmUwd0kzVWs0?=
 =?utf-8?B?QUFNSUhrLzV5eS9lSTNPaUs1RWNPN0loZkRhbmI4bHc5UjM0WGtEODBTZ215?=
 =?utf-8?B?Qjl3bUc2N0NoK0QyQ2RsRWNiZU9xWC9LcTZBZk1JWitNek1ualZTZXlaRG5M?=
 =?utf-8?B?MGhaQlF5dFBDanpwOGZQa2xFc2Rla1BaSTFwbkg4NVZ2cnRBaXovZW05ZXZD?=
 =?utf-8?B?MUF3bUhSc0RXdXZxRURRdmZMUjBLMDdvdDR2VkladGNYK002aG1aV0kwL2Nm?=
 =?utf-8?B?Z0NZTGVlcGsrcG15bS9HaUVYODJqRjZyNEpoL29kVkFwUUZNTHJnN2J3RmVt?=
 =?utf-8?B?MkU3SlFQN2pnUEd4dVNKTTI0VlREVng4cEtCYUtRK0xWekRnVFlPNW1NN2dU?=
 =?utf-8?B?K1E0T0x3bThMUnhjaWJXekREbjlEUmFYL003S2tUUUdLa2tTTUl4cjlSVDVh?=
 =?utf-8?B?cFhVWURvdCtlS051S0JyOXR1dmkwQ2RlVS9CT1BTMVppU2NPMC8xVmlmQ2xB?=
 =?utf-8?B?WHFPK0JSdHFmckhHeU1DWnU3ejkvTm5HVzVaZ2JZbTNWWVdpeVNETjhsc2VE?=
 =?utf-8?B?T0pobCttQzQ4MTA2RjhleGxtNVNxNTg3c1ZYS01COHoxTXk0U0VCek5QYlgr?=
 =?utf-8?B?UU5abDAvTjlmOUJJM0dmaWo0M3VrNHQreFZ0VVdSbkJyVElib3R4a202eXdD?=
 =?utf-8?B?d3NtOTlJOVdSb0prUFJ2a1FrVm9IdUhnaVNLbzNtQXV2MUJ6OFRWZjdteGUr?=
 =?utf-8?B?QW1pSHI5Z3U3RmIwNDZnMkpiOC82RTVwNWVBc1JJa3JKcThUcjVQUWthR3Fx?=
 =?utf-8?B?K2dISklrb2lFTjNSWFpWRGFIUG5RNWhHTjRCRVJ5ZlNaVGgvSjhISGVMbjgr?=
 =?utf-8?B?dkMvZDU1elJwdmRUU1Nmc2NvdjVQVTMyUVlXTDc0TUJubVBZdmppOWJwb2tm?=
 =?utf-8?B?Q05jcTd2Q2R1VDhUd1NrakdJSHYyTjcwcFFZQ3hFOEM1V2twVnBoTENVYjY0?=
 =?utf-8?B?M09PelhEbU5oS0RENDdZSkNrSzNtbU53MlAyVVhkQWpTWlNjMWUzZkV5WGFi?=
 =?utf-8?B?Mkkrak5XVzR6VzhydzlzUC8vWjdXWEpad1Z1SkdHcjBUZ1oxMzBzb1d2QVBK?=
 =?utf-8?B?WGVnbzVGWng3V0xtSVB1QVhLQjJvS3hRK3Z6dVQyWkRhamJvRktpd0ErTWJV?=
 =?utf-8?B?UXNkbzVKVEFuQWkydHg1VDcvLzVzeHUvRXI2UWpBOWJCZExTVExUaFVVTXFw?=
 =?utf-8?B?OVg5bWsvcHo2UkQ0b21PNE14WnEwb1BSbVhPK1JwYlhLNjVSbUxGVlRGa1hC?=
 =?utf-8?B?UXIzZGxwWFp5ZzdJb2kxUlF6QkhlaHlPbm8yWnhmU24xTzJoQ3loVHg0VnB5?=
 =?utf-8?B?MWhXZEpDUnVVQnF5SmhUUmlibHA4NWtTYjRlRnFWcWdwRVRzWWpkWGlxK3Fr?=
 =?utf-8?B?WlhqeHFOeSs5U0t3dnk1M1N3dmRkWkdjMjVkZnpEc0ZVNjJ5Mnd1Q2R6bW1G?=
 =?utf-8?B?R2gwWWVESFVoT3Mwend3VnNmemFkL0tjSDQ3a1ZoeCtkaFoyZDk2YWtHVVNR?=
 =?utf-8?B?OGxRTHZ4TTkwd0dQRnBkdmFyV3lHd3dxSEt1bFRWRTY1NkJMWHV2RGRWaUpj?=
 =?utf-8?B?dUxENlVrMk5uK3BIdXVLN0NMbFpxTWE4SUl1YlVLRk9oWDdJU2gvb2ZyM1lx?=
 =?utf-8?B?ZlBNY05obmNvYlpTcUN3b25IK3laUTFNbVpZNnE3REdCNUw3TGtVc1l3K1d5?=
 =?utf-8?B?NlZzRUdVYkZyaTZlQk9YMEdhaTVHOWlIYWJ6dktyZ3VCbFhRT2lrdWFyVWJk?=
 =?utf-8?B?UzJqaEhkelFiYzEydnE4NHFSR2E4WXRtd1E4UkZPaVpwUFZCVTk4SkpqQzlT?=
 =?utf-8?B?NXpvTXBIMytZV01UNFFCRFdEWUczVG9zUjg3WUNUODhlSnlDUTZGZEMrOVlj?=
 =?utf-8?B?UUJrVnNYS0IwU2t4WUxlR1JtQVBMblJkVnNxcXVHbThuVGtMY2RTdHdJUHdk?=
 =?utf-8?Q?lgMB1RZ6jCIE4gX+Njiu+mkGXycRroultXdU50F1gNzS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e414a95-db1e-4ca7-3eaf-08dd8d6e7ff1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:09.1671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4tw4Yds/YL9I3ZmQjiZ/GDPkPBpX+1xz91VtsypQbXEfEG/dpqYIBMe8WUrybzun8F/ToEGAmdzu/tT2d6q2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

We will use this error in the nova-core driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4379b94748c0ba1965f4e1865b633..083c7b068cf4e185100de96e520c54437898ee72 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -65,6 +65,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");

-- 
2.49.0

