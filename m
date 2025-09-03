Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1ABB424B5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68F410E8B1;
	Wed,  3 Sep 2025 15:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MPBg9Y/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CF510E8B3;
 Wed,  3 Sep 2025 15:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/c5G9s4eQTn10CsZ6QNTaEKYgVmj8K6asXCorW+VXvRPvRPyHeCX1quvSGgDzdiwEjTpx4AXpJLFP2sF8R4sWk+PXeWB5dwqaRj/bLXk9vxgHq/WHuZ//G/yirvRDzYmNwBU7b04FqgFMO8OZpnizw5E2zwkrqGnYg6IjXOuVE1Rl0Gje78uDU0D18L5OT5RIoQj0wv+CBuyZSMlJ//Xy22SVigE/YiHIAomZz/f7VuuBD6Z0I3GBR4Kx1BCFMxKuJbX9ukpwKD93+NbZniGEfx6w9OvWevGAbMaogGDHPoJ9FQ1LnF9OpyLwMmuIIePAgyRkZ37Besq6IMexsIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9tUCO5q/qQ+A2bGu+7DVhMrLiwI/+uo8HEDbsnsH+k=;
 b=LYFQO3EIY7JSaVmA+kjPNmqC87OStcJm9Q+V74c7AnAlQECsonX5UbTenqap9lJUEZifnF70Isd6E/BFIQJYokHda6g3/LdBf8uQAUL0UZEbU/4e36s8mn0fm1kkeRpQSTw0IU9H2XsRwq/mZ68oQNWNOxvNhfSopk9UZNXcUXRzjHdQAklfRisY0yjlDvSkIS1MDoocdlcX8jNBND9AIbchWhVKwnCZ5E0XcNPkYxSxrAvdB+WK167hP/M3mQYJp53PaS+MXtjCK9f5qbfBriLcYONLf03UuqCngQcvVDLCqYRP9Hkc2Wz7CLJUAkKZjzRzK9JFLWSEQ/iBqsqYOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9tUCO5q/qQ+A2bGu+7DVhMrLiwI/+uo8HEDbsnsH+k=;
 b=MPBg9Y/TgAvHIePS28UtOLVc6K/ITpOzm9L/7RWPsfKMy8+VQZV+BvyBXnF24VkodZaneLw9wz5kaMBsIRqi1fk3EdIkKUxS5+EBxlFVVTXl4Gl4xiEkVHnwYJgJS75AayenkeAmsb9ILo1Hgy8/yPjbzAjxQdu5Ad4rKlUmv6Re8MruC0YDwHPmr34/niNmTsJHATkNkZZC+bc0K3tbHCq15OH5uV5J/Aw6KPxVHFkIWnlUgAdmGcOkvGxxhNN9Dd3SZr78FIzRAjPsGmPcgy7EamGhJdsaf4s7C1SahUsMazuJGPq/pEmWimuFqQsxtwwKy7EJ1XV0mn2qJzv3dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 15:15:16 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 15:15:14 +0000
Message-ID: <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
Date: Wed, 3 Sep 2025 11:15:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: fda70361-c085-482a-455b-08ddeafcaece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1NKRWtTN3NpelF6UWYyTC96YkxRMit1ZFA2TmFkc0w0N2p4VURCbCtUMThP?=
 =?utf-8?B?eVdCR2RXbFJ2RjAzaXg4U0ExQm5sWWlRWXZBME13MHhsU0ZzUEFOTDZCUTZi?=
 =?utf-8?B?QWNwbUFWbDQrMFVsRG1vbnhzS0tkMHBLdGhqQVBpQys4bHlwNmdyVEtzTDVZ?=
 =?utf-8?B?cm5uSmtWU2xCMXhRNC9zeGx3dnFwOE9ubVVQOUZUSjBJVlVYdUs0T3lrVEhw?=
 =?utf-8?B?VDB1d1YxZVprblNudWp4THR3dlVsU2R6OVUrUitBOHZPV3BUNkFQa29iSkJy?=
 =?utf-8?B?OTdleWkvUlFsWU0xaUc0M1FoK2JkUGlFZmEwM2xzekYvenZIUnh2NW9mcWlo?=
 =?utf-8?B?R1lZQ2tiT0hhcGplUndHRUwxNGJrOHJiTnBRWC80YjlhL1JJNVBUR3ArMFJa?=
 =?utf-8?B?OTJtRnd6WjZMTzlTT1FlcFllalkzZlNDSURqM01MZGozYzFicVVGM1FIR2tv?=
 =?utf-8?B?VzBkSlpyQU10ZjBGVk9KWEsweGo4SXZ2czIzVDJyMDFoYkg0UHFpZURCOU54?=
 =?utf-8?B?MUVJQm9NWUI0ZDN5ajg2MXVXb1J3aGNhWWVUeVllNFNhZUdhUU1WM25keDBs?=
 =?utf-8?B?ZWYrN2YzOUFhbEplQmRSdmROSjRXa3lxVGtjdXltWlZ0NG5oRWpQVDh3WjZo?=
 =?utf-8?B?SUxzMDdvb3RNbk1pcS92elQ2SzlpeUJ4bkI0VUEzRFpnZ0xaeFZkRVg5OVdN?=
 =?utf-8?B?Q1NwR2FCZkduWnRLcDZxSnhKUnFSNWNlWFlTU0dpRmd4NHQ0MGE5VGJNYi90?=
 =?utf-8?B?Tyt0NjNmb052cEhHYnVSSVFNaVQ4WEFKRDZiN1d2c0ZDL2ZYWkZ6UmU2eHdY?=
 =?utf-8?B?a210ZFRSRW1aK3VPNVJMeTBHbzRSUjJXM3ZCZk5KaUg2ZVhEd0tzOGhvQXRC?=
 =?utf-8?B?eU5uejhSbXJZUzU2MVZvNForM3FzaXVFYWtySlNRQndJdVFwTExCaTh1Sy9Y?=
 =?utf-8?B?a0xkQzJHRVhtVTA4RG9PNDNoUUFDOWdrTU5HVFo3bXROS0hlRzliTUtIMGxy?=
 =?utf-8?B?Sy9wNTdHR0FzbVJaaitDV1NHQkhZeE9WL0dvd2NLQjVYWmJRWkExd1FRT29w?=
 =?utf-8?B?cExtSXJpbEFkeXNub2J5RCt1bis5R1I2K29JUU9VNkVROGpFMW4yeW9Ldm5O?=
 =?utf-8?B?Z1A3eWJ4elB0cEQyeHhLWlIyZkJtSDRscFRZd3lwMENucXJxalZtWngvckF0?=
 =?utf-8?B?OHpkUUdoYnc0VmhudjUrZFhUS2Q1aHlETzlIWG9IMUgxRWU2WHdYWTU1VFhU?=
 =?utf-8?B?MlVxVjhQOXkwYkh6SmRJbjVQc2J3S25MTUxzSE9maVVGZGdpbFlTdWxiWTk5?=
 =?utf-8?B?bUkzeUkrRFJUSkZ5WW5xZGZMM2dEWllqRS9Gc29iT0dVMWRZVHNBUktLUnR1?=
 =?utf-8?B?Q1QrSys1akF6anROMlF1V2syUnVwRlFkbVFaaURzcUhvZjlZdzRSbVpTRUc1?=
 =?utf-8?B?Y2lQNmgxMUFwQlpqQW1DMFgyTkdaVXllbnZJRHFiblQ5d0dZMm9mVEtESHBo?=
 =?utf-8?B?WXhMUHN0YnVpc2NBa2lOUGJqM3FZU3ovQzZXU241UVhxUGxCZGRPNmlhY0Zo?=
 =?utf-8?B?N3pzU1I0Njd4UE03UVdWdjRGNmo4cklhUm93S3pBZVBTcDlDMmdJeUx3QlJU?=
 =?utf-8?B?d29SVXFjTFQ1WTFtaHNueGRGUTJ1cnN6SzBMUDgxUThxUEs4WkdOWXpseTho?=
 =?utf-8?B?Q1dob3pyRk9XUEFhbjVNb2hRYjhVMkNwL3lkcUh2RWo2dElmTnlsMVFScUxu?=
 =?utf-8?B?TFh6d3N1cFJGamFuRldiTGY5aUtFNmlrNDlKQTI5cVpSc0pGcHdyc0FJMlVJ?=
 =?utf-8?B?NHpod09odnNCMU9ublNxTE9yQ3BYYzl2dHFKcEpSTlJnZlNIclB0YXJ5S2Y0?=
 =?utf-8?B?Qzh6dzgxdmpyZFRaMFN5ck0rS1ZFcEx6dXV1Z0h6WHBYU3dReEJOMFI2VVZM?=
 =?utf-8?B?SjU3QkppS0hQSzNSemFkdzFnTHlrb0xYMEhtam9Sa1JsZlpHcHRwZjNtTHBa?=
 =?utf-8?B?TnRJSk1rMGZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3RYemxYWEdIMzZSKzdJRmNEZGNlbXNnR1lBbXpFZUF2UnpYaU50b2ZMSEE5?=
 =?utf-8?B?RC92UlYydVREczlJeXZ3SW0wNFhwYWorcWdXL1h5RHR4NGhHem9ydllVOFhC?=
 =?utf-8?B?ZUprU0MrNHpDTnVhNVU0RVZPMURXYStJckxtU3p6YVoyMGVyVjFONVo2RE1m?=
 =?utf-8?B?NVVWVmxvNE84a0VMWlkyVjlqdzFUWnBRWVFYamthVzNmUGpuVlkzZW9GeXdl?=
 =?utf-8?B?L1dvekRRaTBBSERGZjRJUE8yaEcvY0U0K2F2cTBCOXR3S281bG85QTI4ZjI3?=
 =?utf-8?B?RDVNWkRncUJ2c1ZYSlFoa3JrTTNvc0F0ekxyaGRxeWhxaXhLdTlCQzkzWitM?=
 =?utf-8?B?T2J5K1lZR1U1Y29JTHVPNTkwV3lNa2NtM2tVTGR1emZKYWJKQnFRYWhUT2JS?=
 =?utf-8?B?Sm5iQ2lqbC9DTm83UEt2aFZHNENEWXVyK3lmd1hXWTFrUCtvNUhHMGlmMmpW?=
 =?utf-8?B?MkR2L0hqZUFmNTdUa0ttMU5ETENtVkZkVDhTU3IzVmE3aHNwUitPMUZqSVR3?=
 =?utf-8?B?SHBCU2Z4aEdGbUNnQUMrWWhJVUp4ZVkzL0dyZU1UOUVEWVI4NDlaZjVCM0xz?=
 =?utf-8?B?c0pscEJDVWRxeTVNUTJqTHYzRi81ZUlDZ1pzMmZuSllyQXpFKzJPTDVyZ1VX?=
 =?utf-8?B?ZEc4OEhYa3FwMVNFdmRyMWVCSjJEdmFieGxrbEVsZDR6K3diZ2ZNeEMvc1pG?=
 =?utf-8?B?a3ZQMVJFOS9uMm90RVJ2bm5ZUzBxRzg2am9ydlVYSDVES2dmRFllUVhXMTVm?=
 =?utf-8?B?VFBFQkJOZ3pTbmJhTHVMRXpNM1RIMjdLWWFWYTMrd3pmS3NobU1EU2J0eHhH?=
 =?utf-8?B?UU8ybUpVcUFNTEttVTdMTVdmODVUVjZZeU0rdnZIczNNUWdKRllzZG40bGhH?=
 =?utf-8?B?eUVuc0doWVJvQWtKbUdGRGZ2dGZZUnlRNGV0WUJEcVp6RzlTMTh4RVBJWXlV?=
 =?utf-8?B?TTFzbVQyWTJEdWRSNHJSQ2dLd0owVmpabE1qMWhBY01JMThLU1RSbmFwL2dt?=
 =?utf-8?B?UHlaNkswdDY0dGtHeWVhaktCVTRtalpRdWJOaWFMM3dIT2FYT2NKTEN5WUlk?=
 =?utf-8?B?RG42TUVDYit0M1VuV0o0WCsxK1IrNVIySnE1eCtHVUFaaStPMVZ4YXFVblh5?=
 =?utf-8?B?WEEvc0hhWFBmbm0zQ0tPY2ZIUWkxVHNSNS9zZHVKbjAweDRIV0RGaTdXODFj?=
 =?utf-8?B?L2tmNDVqQ0VMamZzQVFOSjZ2UHlyZVRvQXpoU1A2VTkyWHM5a2M1bmRuUmFv?=
 =?utf-8?B?YWJPSmZHRXZrVEFsNWcxZzFUcmRqd1hIQnF0aHlZMXpRZk5LaGR6NlNkeFVD?=
 =?utf-8?B?cFV4R3RZOGNPK1lqcnI5L0wrWGt6ODF4djFMSWNIQ0VIRWcwRFY3UzRVY0lS?=
 =?utf-8?B?S3VBa0cvcHpUUU1sYlgyMU5kdHpLdWVqMkpDVHVqZkNhY2dGQ0lTNmNGVUMw?=
 =?utf-8?B?YmxISlpoVU1LSHNJU2V0TGRGdEFGZHNjd01Ram5oQldVU3NCNmJ6b20zOW5M?=
 =?utf-8?B?NHR0YzFkdXViVEd5b0o1VFpJeU52MHdCdkJjcVZ1eFpDYnZKVmtaOVNKVHdU?=
 =?utf-8?B?S2oxNVRHVXI2VWQ2YzlvRVpkb3hwTnh6eDZlLzl6ZVhrZmQ5eWdDcFJhdW5D?=
 =?utf-8?B?d3djVFYxMEwxV3ZvN05aUTB5RlZST3BSOHZiS1V2S0hUbzZyQjBEcmxPaGpk?=
 =?utf-8?B?NHVtRkF4em1SYi9nN1owZnU2U2ZXNUYxOVVSSGdEaTYzUFJNeW1mODZmV1cr?=
 =?utf-8?B?RVR6dTlkUFRUa2lZUTE2QTVqRUh2d09JcTc2dUVyWmh4RnVNVlNUQ00zQk1T?=
 =?utf-8?B?eUlGcy9jNHlEWUk4M1pLNmIwVEN5VlZYcDJUSm1Yb3RndFNBekVwTVk2aEow?=
 =?utf-8?B?YVdLNVlOcU5UdnpkeWs4ckNBL1dPL05HQ3BVZ1d0a0l5bkJvVU9aeDQyQkx2?=
 =?utf-8?B?bC9SOU5DVFY0MUdIUTY1blRGcU5sak04dDlRTFVWZGswVU1rWE5FSjA5a2FI?=
 =?utf-8?B?SmFyVlQ3QWZIQXpaZ24zTFhndU9NdjZORllpQmQ2QUwvd09zUTVSbDQ0QUcv?=
 =?utf-8?B?R0t3Vm9lUHNwN1NIeHFVZS91M0picllkS0FLTFpobTBGOWt4ZHVUVDdicWpn?=
 =?utf-8?Q?B6bXNcxTrdbCmuDqN6jW6ec2I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda70361-c085-482a-455b-08ddeafcaece
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 15:15:14.4485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuV1h/EFZWm/sooOG6giy/PdQ9wgPDY44Ca7UOs7i4RNHBjVFhhiX0dm+k2AuvQuJZMFAqioi0Ga9eZygCXTqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063
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

Hi Alex,

On 8/25/2025 7:07 AM, Alexandre Courbot wrote:
> Hi Joel,
> 
> On Sun Aug 24, 2025 at 10:59 PM JST, Joel Fernandes wrote:
>> Add a minimal bitfield library for defining in Rust structures (called
>> bitstruct), similar in concept to bit fields in C structs. This will be used
>> for defining page table entries and other structures in nova-core.
> 
> This is basically a rewrite (with some improvements, and some missing
> features) of the part of the `register!` macro that deals with
> bitfields. We planned to extract it into its own macro, and the split is
> already effective in its internal rules, so I'd suggest to just move the
> relevant rules into a new macro (as it will give you a couple useful
> features, like automatic conversion to enum types), and then apply your
> improvements on top of it. Otherwise we will end up with two
> implementations of the same thing, for no good justification IMHO.
> 
> We were also planning to move the `register!` macro into the kernel
> crate this cycle so Tyr can use it, but this changes the plan a bit.
> Actually it is helpful, since your version implements one thing that we
> needed in the `register!` macro before moving it: visibility specifiers.
> So I would do things in this order:
> 
> 1. Extract the bitfield-related code from the `register!` macro into its
>    own macro (in nova-core), and make `register!` call into it,
> 2. Add support for visibility specifiers and non-u32 types in your macro and
>    `register!`,
> 3. Move both macros to the kernel crate (hopefully in time for the next
>    merge window so Tyr can make use of them).
> 
> A few more comments inline.
> 

Ok, all these sound good to me.

>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/bitstruct.rs | 149 +++++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/nova_core.rs |   1 +
>>  2 files changed, 150 insertions(+)
>>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>>
>> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
>> new file mode 100644
>> index 000000000000..661a75da0a9c
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/bitstruct.rs
> 
> I wonder whether this should go under the existing `bits.rs`, or be its
> own module?

I'd say its own since it is related to structures and keeps the file smaller.

>> @@ -0,0 +1,149 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// bitstruct.rs — C-style library for bitfield-packed Rust structures
>> +//
>> +// A library that provides support for defining bit fields in Rust
>> +// structures to circumvent lack of native language support for this.
>> +//
>> +// Similar usage syntax to the register! macro.
> 
> Eventually the `register!` macro is the one that should reference this
> (simpler) one, so let's make it the reference. :)

Ah true, already fixed.

> 
>> +
>> +use kernel::prelude::*;
>> +
>> +/// Macro for defining bitfield-packed structures in Rust.
>> +/// The size of the underlying storage type is specified with #[repr(TYPE)].
>> +///
>> +/// # Example (just for illustration)
>> +/// ```rust
>> +/// bitstruct! {
>> +///     #[repr(u64)]
>> +///     pub struct PageTableEntry {
>> +///         0:0       present     as bool,
>> +///         1:1       writable    as bool,
>> +///         11:9      available   as u8,
>> +///         51:12     pfn         as u64,
>> +///         62:52     available2  as u16,
>> +///         63:63     nx          as bool,
> 
> A note on syntax: for nova-core, we may want to use the `H:L` notation,
> as this is what OpenRM uses, but in the larger kernel we might want to
> use inclusive ranges (`L..=H`) as it will look more natural in Rust
> code (and is the notation the `bits` module already uses).

Perhaps future add-on enhancement to have both syntax? I'd like to initially
keep H:L and stabilize the code first, what do you think?

> 
>> +///     }
>> +/// }
>> +/// ```
>> +///
>> +/// This generates a struct with methods:
>> +/// - Constructor: `default()` sets all bits to zero.
>> +/// - Field accessors: `present()`, `pfn()`, etc.
>> +/// - Field setters: `set_present()`, `set_pfn()`, etc.
>> +/// - Builder methods: `with_present()`, `with_pfn()`, etc.
>> +/// - Raw conversion: `from_raw()`, `into_raw()`
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct {
>> +    (
>> +        #[repr($storage:ty)]
>> +        $vis:vis struct $name:ident {
>> +            $(
>> +                $hi:literal : $lo:literal $field:ident as $field_type:tt
>> +            ),* $(,)?
>> +        }
>> +    ) => {
>> +        #[repr(transparent)]
>> +        #[derive(Copy, Clone, Default)]
>> +        $vis struct $name($storage);
>> +
>> +        impl $name {
>> +            /// Create from raw value
>> +            #[inline(always)]
>> +            $vis const fn from_raw(val: $storage) -> Self {
>> +                Self(val)
>> +            }
>> +
>> +            /// Get raw value
>> +            #[inline(always)]
>> +            $vis const fn into_raw(self) -> $storage {
>> +                self.0
>> +            }
>> +        }
>> +
>> +        impl core::fmt::Debug for $name {
>> +            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
>> +                write!(f, "{}({:#x})", stringify!($name), self.0)
>> +            }
>> +        }
>> +
>> +        // Generate all field methods
>> +        $(
>> +            bitstruct_field_impl!($vis, $name, $storage, $hi, $lo, $field as $field_type);
> 
> Maybe use internal rules [1] instead of a private macro (that cannot be so
> private :))
> 
> [1] https://lukaswirth.dev/tlborm/decl-macros/patterns/internal-rules.html

Sure, done.

> 
>> +        )*
>> +    };
>> +}
>> +
>> +/// Helper to calculate mask for bit fields
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_mask {
>> +    ($hi:literal, $lo:literal, $storage:ty) => {{
>> +        let width = ($hi - $lo + 1) as usize;
>> +        let storage_bits = 8 * core::mem::size_of::<$storage>();
>> +        if width >= storage_bits {
>> +            <$storage>::MAX
>> +        } else {
>> +            ((1 as $storage) << width) - 1
>> +        }
>> +    }};
>> +}
> 
> Is there a way to leverage the `genmask_*` functions of the `bits` module?
> 

Maybe, I'll look into it, thanks.

>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_field_impl {
>> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident as $field_type:tt) => {
>> +        impl $struct_name {
>> +            #[inline(always)]
>> +            $vis const fn $field(&self) -> $field_type {
>> +                let field_val = (self.0 >> $lo) & bitstruct_mask!($hi, $lo, $storage);
>> +                bitstruct_cast_value!(field_val, $field_type)
>> +            }
>> +        }
>> +        bitstruct_make_setters!($vis, $struct_name, $storage, $hi, $lo, $field, $field_type);
>> +    };
>> +}
>> +
>> +/// Helper macro to convert extracted value to target type
>> +///
>> +/// Special handling for bool types is required because the `as` keyword
>> +/// cannot be used to convert to bool in Rust. For bool fields, we check
>> +/// if the extracted value is non-zero. For all other types, we use the
>> +/// standard `as` conversion.
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_cast_value {
>> +    ($field_val:expr, bool) => {
>> +        $field_val != 0
>> +    };
>> +    ($field_val:expr, $field_type:tt) => {
>> +        $field_val as $field_type
>> +    };
>> +}
>> +
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_write_bits {
>> +    ($raw:expr, $hi:literal, $lo:literal, $val:expr, $storage:ty) => {{
>> +        let mask = bitstruct_mask!($hi, $lo, $storage);
>> +        ($raw & !(mask << $lo)) | ((($val as $storage) & mask) << $lo)
>> +    }};
>> +}
>> +
>> +#[allow(unused_macros)]
>> +macro_rules! bitstruct_make_setters {
>> +    ($vis:vis, $struct_name:ident, $storage:ty, $hi:literal, $lo:literal, $field:ident, $field_type:tt) => {
>> +        ::kernel::macros::paste! {
>> +            impl $struct_name {
>> +                #[inline(always)]
>> +                #[allow(dead_code)]
>> +                $vis fn [<set_ $field>](&mut self, val: $field_type) {
>> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
>> +                }
>> +
>> +                #[inline(always)]
>> +                #[allow(dead_code)]
>> +                $vis const fn [<with_ $field>](mut self, val: $field_type) -> Self {
>> +                    self.0 = bitstruct_write_bits!(self.0, $hi, $lo, val, $storage);
>> +                    self
>> +                }
>> +            }
>> +        }
>> +    };
>> +}
> 
> Yep, I think you definitely want to put these into internal rules - see
> how `register!` does it, actually it should be easy to extract these
> rules only and implement your improvements on top.
Ack, done.
 - Joel


