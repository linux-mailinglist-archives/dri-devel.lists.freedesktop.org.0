Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF1AE0712
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF9F10EA3F;
	Thu, 19 Jun 2025 13:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZIXbNXq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DE210EA4A;
 Thu, 19 Jun 2025 13:25:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stZZHz0YjtBbR7ZIY+32ey5kvcpgNsEZM2+QP/J/AQZRQWQrOAGz4RZaYXUf7+O4Y5X8YqXNoHhtMn53RCpXWRrB5ASW9dK7hmJOoz8Uf2FvUFs3Jq4D4PscqMw/HplRVcJfovmWNWMtDzqleyJwuBKHrm5+8oz3+RCHICmqEitlMpdt02nrW2ezj59uQRGBJyxa8Fi4Adjos0OQQLNVJ6TycaZc8JxCE5t0HnZS/Pj5AhOUQPQ4Ar7HQC0tiaJYgVQBsm035rN01c2GdfQfwS4WocGum7Ta6xqiiMzCStLsb3JUkQnP4AEv3btoCnBsb9OE25IqsBqACu8LwtHRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Uk44DU7V+4z+TfwwnC927Lj2VbAdqmocrb9J0ePCKw=;
 b=XBqn1YdKPEc1PYH1JogcczEGYy/QLLAOLB+Nx44+Jq4XEeC6A5qqAk2wJeg+YqO5YYsGtfz/sY+DcDQVfS5i6hlPLwuctRNHytTbkQvx5/NxcCyU7dsNyx4oPHx4O7pxW+Od/ZdB7/AA+SbjkFT6xYWpOA7ECejBaZ+jlL2FFQV9C5FV9RPwUj88UvrZsH2JdXeizv0ehbdC+wEeZa3+929Lt+oDSHJpFYZYB9iCFF35rrDux/kAsUhNui72PhN5UtUqBNXGvkDEt98nEBnXE3U/DOKMjcT6gDnHBjs5p1S2aLf36fW0l1OcOlMdVtN7EYpsH++8l3Pv6WixjnHfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Uk44DU7V+4z+TfwwnC927Lj2VbAdqmocrb9J0ePCKw=;
 b=ZIXbNXq1uPFYWMp9r2JJyuqdhjb5ONum1QjwjY4SLeuqs3ZtzzOgb+EhTOE0IgDJnb8Kpi+isFraWb1u8bRFyPXXBQe1oem/fEVFheqvdeF49/Nmjeeoq/fGX+kbWul61U8ESIpcwTPP0SjZvmu6UCVDaHqIJkqkzN+qh9Wtf9qyHXRJ94pkROqIzn6DMQqrE2VyjZ5XvUKnH/TJhh5DqP4S4JK0I6sJXBjw9lcpMQUC5y1FYF58HLrP1HIm5qGxVSmEsx7zgud/RSWJ4InyJvYgazY+C4mwPu5EjROIp+/YeEkou6Ornqq9vf1QygLMMS+veYc/AR0p4uMbqZt6aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:00 +0900
Subject: [PATCH v6 16/24] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-16-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4PR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 0624d80e-c241-408d-7d3e-08ddaf34bde3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkxFMkVZejVMSnFvZmw2eUQ2NUN0VDIwV0tkQWRxTVIvaGFFOW9FTVdCOU56?=
 =?utf-8?B?WWk1eHZxVW5lRmhHWHQ3Y1dNaTg5RHNmcUlJdXJKNUlDa1ZhVTdSME9IY3VB?=
 =?utf-8?B?am00UmI0STJqR1pjTkhzR0k0Yi9wNjh0Tm1HZFExaUV1RmM4NWQ0bytSTU02?=
 =?utf-8?B?anlZZzJGNDNJSnU2N050R3JYU1U0ZkpoejdUMWw3VFRXWmdtWkpHdzMzbVRU?=
 =?utf-8?B?c3ZiVVplYUgrU1hGRy94QUtPQWNyQ2RkWWdhZ1QxV3lpRDRoa2xIV3RPamdM?=
 =?utf-8?B?QThHLzh5MlBwWkRYL2k4L2VSZ0hJVjcwN2NtTGpmTVBRZG1HU3N2andjZldD?=
 =?utf-8?B?a0g1WnFTeENWUXd6eisvYVA0anMyZjRsdTBsT2FpNHVyZHp1dm9jblY0NkZK?=
 =?utf-8?B?dk84YUpzbndwVW9tUzlHcktaQ0VzWDR3dHhHSGRiam1LVWxXd1ZuRFYwdGZJ?=
 =?utf-8?B?TmdpYWVFYVBGT2hTMVd4MHNLOHhNM1VQTTQ4WDYxdWp3Q2dUbFIzZ2U2Vm81?=
 =?utf-8?B?SmhQbU5OaWF5UnVhOEVoa0JORUx6SmNZbVA4ZWZwSm9KNm9lRExtb1V5Tktp?=
 =?utf-8?B?bjAwcHZHUmt4MEc0N1RDNjZyOTRwMktVS0J5T2d1WmtzRkxIcmRZeGZJSHhy?=
 =?utf-8?B?TmtQOVlPVkFabjA2aWdwcUw1ZE1uQVFSUlUvVDlaVkd6Ny9VNGg2Tkd3N0N4?=
 =?utf-8?B?aGdBcktXOTY3OWRDMVF3VU9UUkJMc1VyRi9ENEZqK0YrWm4zb2ZETFdRUjBN?=
 =?utf-8?B?UHhHd1RSekxhN3ZnSmpUSTFSbFNCS09EZnV2LzExRHk0S0FJTVNQTE0rZ3NO?=
 =?utf-8?B?MmVYMlBNYVVGY2YwSXBOR0ZDNGRaOE5pUFhPL1o0WmIwdDhPZ0xlMHZxRkZs?=
 =?utf-8?B?eitIelVzNTg2blhCdVBLOVFrSWIzSXFhelROb3ZtN09jeE4vMWwvbjhUTjcx?=
 =?utf-8?B?elBwc0p5TFhWMVRyR0Uva2UwT3NtMXZZS29tWG5QeUQ2QnRVbVFTMjExMURv?=
 =?utf-8?B?SXhqbmJBY094eXdJRktoUCs4SmpPYS9iY1RZSkJ5K1A4Zi9yUlRianFRTFoz?=
 =?utf-8?B?d0IzRE1mcVJlWmM0Wk45dnJXQWFsaGtxUFJZMHNKcUZLeHUyNkR5eFlSRmFu?=
 =?utf-8?B?aGJwRjRyOHliWmVpZzh1NHVMVmZhMC8vellnQWdrVjBidGhka3lja2c3QzNV?=
 =?utf-8?B?dmxDNFpjN2grbWVYemUwdWx4MHJFb2dQZmwxZ0d3MlVPMGxWNTFuOHhhWTNE?=
 =?utf-8?B?dzlkNHZvajJEcm1JbmhjRG5odjhWNU4yclljN0hsNWpCQUFqY3g0SnhKSWpI?=
 =?utf-8?B?R0xwdnZ3MVFkYzdFNkQyaWxaaFVLVVovaFZEMUpWcjlrYXhWNlVxNi9VaS92?=
 =?utf-8?B?cVRlaEUwemV3QUR6Vm5hSDVUOGgvRi9QdDhWNnRGcHh2RzBnTlZoa29wME5O?=
 =?utf-8?B?T2VlMlJzY3BadUQ5dGpxRWpUVmJ6Nnlmc2ZicE80T0F0MlZLcm1EU0lKWVZT?=
 =?utf-8?B?RDlncXhxeGxmeXphTXBWTnBuYlZ1KzZQYngwdWZSWTlTUmhicnNEOFZLTTE3?=
 =?utf-8?B?TnhKTy9YUEJ4THlmS050MjVKdGU3bEhKY1VXSjhlTjI0YVUzS0wzVEk2ZUl1?=
 =?utf-8?B?WDYyMC80U3NYWkQ4ZzJmUTQ0RlhiMlNJVkJQY012K1FoQmNxUzJJQkdWSDJo?=
 =?utf-8?B?RllvUjJ6aTIzeEEvZ2RmRzdZZk8vVGdGZ200OEZGd2ZjY2ZNM1hIZUNqUnV1?=
 =?utf-8?B?aGRsMmpkWElkSFJZKzkvSVpSbVpSMjd0aWkvZjYxRHd4Z2RNNmhSckJLWEFu?=
 =?utf-8?B?ckdKR24rL1VheWVIRDkzT21MaFBkaWg3eGRCY2VFaHdFSFU4TEJzeEw1WmRl?=
 =?utf-8?B?SnU5THFWbnpuZSt6ZXV1VFJxaDd3cysxZHhJL1N2N3pFSVFRa1NaazhjVnlW?=
 =?utf-8?B?Ylgyc2p2akdwUTR0RUk4VDNjTGFtUFlYMnNhbUJxRytRdkZWSlpEUEU4TXVK?=
 =?utf-8?B?OUt3aTNDYVV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUNBV3VCM3pxWUQ1cGNCaGs3aWxaeTY3T0tyODJCNloyYktLeEdLc0xqcUE5?=
 =?utf-8?B?QmE4cGRkY3VDT04zNmF5ZzhISmM3VGg1dkl1QXJ1cmVobmw4WStJU3pCdWRo?=
 =?utf-8?B?K0l0d3d5K2IvYVNuaFlkWDg1SEZBZjc1UUpuR3Rxc0h5bG5DZ2tINlVPQmRS?=
 =?utf-8?B?THdFQW1WY0tvSmZ1NTNOQ0g1MzNBWTRZdG1KK3h0UkRoQWJXWUVSdDhONFBr?=
 =?utf-8?B?Q3dpVENwVU5ENjljZDBzYTYrSHN6U2ZDUktPZUhFYkVpSWszUDIzWlRqbnJM?=
 =?utf-8?B?cWdqRlZSWHIyeVdmYmdKNEt2WHNQc3pqNGptT2FOcUplWTQzMlFpWndneU1p?=
 =?utf-8?B?bXl4VnZSWWNZTEp4dGp3WnloRUZvTlpuU1l1SzNka1NyVllabkp2OGlBZ0F0?=
 =?utf-8?B?L29EbzV6RnhLeWJSNFAzVmV1WVBUVU8vMlAwOVJmYlYvZzRXaHFJUXRDZ2ho?=
 =?utf-8?B?dUlRU1d5cDNyVDlKbEt2UGN4RUc5aE9Ud0N2ckozYnFEcDNQcVpiSVJTaDMy?=
 =?utf-8?B?ZGU4V0xnaWsrZG03aFFwZnRVbVBaMXhKM2wzd3J4MTkzaElUNkZmRzd2REJZ?=
 =?utf-8?B?bW8vOTRVMGdMWFdHVVBDMVdFS2FjcGo3Kzgrcm5zbjFFektDR09Pa1FSOFBo?=
 =?utf-8?B?Rm5nZXVLeHhMdUV1SUZwSEJyWEVpNzNqTGFVZWFUcnpORVJxb2pvWjhxVU5v?=
 =?utf-8?B?dEt5Vys5TEJoY0xhL1RLR2NJTnM0UmJPS1hxQWZCanRnUVJlamRLamtSMmQv?=
 =?utf-8?B?cm5OV25HTFIrdDZLSkJsUUYwTXZJaWk5U0lCM3kzemZLcjduS3VWMG8vOVds?=
 =?utf-8?B?UDMrQldwZGEyM2RsVWxOVUJVRGFWOVhFYStvNkVHak5mRHpsTzhxdm9RR3dV?=
 =?utf-8?B?TXZDeU1rSWNpT285SVhzR2FpOWRtUzAreERKT004YWlSZnN4NnhWcWtIWWFv?=
 =?utf-8?B?Si9uQ1N3Q2o5eVBKTUlsMkV6RXJyZDVDRjFxTWs4ME1LcjRtUDdhUzh4Q2NJ?=
 =?utf-8?B?VjhxM3c2emlUMU9ybTZpZGFqMVVHemZmSVdENUdQNmxtcDZVdmJSeG5RYU1J?=
 =?utf-8?B?bkQ0andBZGR4aWg5OWxzakkrYm44dDBkRFliSW5UalRVcm1xTzJUNVc1bDNG?=
 =?utf-8?B?MmVQRzhqdzNWNlh6eTJoTm5CM1JzeWRIZjJ5YStCN2grZ1N0MEs5ek1sb0xS?=
 =?utf-8?B?T3gwNW5rSExGRHNiY2J4a2JNamE4Zll1SHozTUl1RDFJOVZMR2xFd0FwNHVw?=
 =?utf-8?B?cGt2V05CZzBkUWE4RlpEMnZTK1BUVU1rNE1BQXdyNitNdlYxUVBTeWdCbmpL?=
 =?utf-8?B?dE12N3dyWEtVQndCSDRzRFhzZzJyN0RVbWxwdHRNTkJLdXVob3JCVHczUklP?=
 =?utf-8?B?SVJFWndHbU1yZGdjU3ZFTkNnUjNRanVjU3ZBTnk2ZDNYbG14NkRwY0hLK1pu?=
 =?utf-8?B?aVUwT2JhMHdBS1ZST0ZNTURTMDQ1bEJDWU9KTlhDVjVidXZYT2ZkZnliemtX?=
 =?utf-8?B?UFIyVGg0V0Y0eFhJZC9pSTREZUFCWUFkS20vZk1WMjB4UWhEUzFUQzNIdUZp?=
 =?utf-8?B?NC9QTVdMdSt3NFJ2dFZOd09oNmVkK0JUZ3Q4Skt2aUtwYzRqdC9EbS9tMnZI?=
 =?utf-8?B?YklIdXFVK1lXdVRCUjU5OEtycWhKUml4UkoyZDdYUUR2SGhwK2NURFpjR1lS?=
 =?utf-8?B?ZTg4OVZaamV1b1pYTzRVV1JFbk9oZzhwc2dkQ1VXbll4VlFzZ1J6OVhmai82?=
 =?utf-8?B?Y2xKcExLMmJ2bnI4cG1TZDZkeTdUSlZQQ0VWbVBQQjRvMTU1MjRvbHlVaXlX?=
 =?utf-8?B?eFlPbkV5L3g5WDZqaWdGaUJtNWpQNjcvN2ZDOWtibjlXZ05hQkdwZXBJL0Qr?=
 =?utf-8?B?TUNHRFlLUTYrQjgyVGg1aTJCOVk5MFFrQU84ZXB4ZDJMTmwyeW94TldzRzZK?=
 =?utf-8?B?a2pYSytpLzJPTGhUTUxad1UydHlEblZ5ZnM0czE5MTZPeWpSVXpjVnd2dHJF?=
 =?utf-8?B?eEpySC94RkIwNERmSlMvQll4MnJHUTE0Vm9jczNOR3JsaUhzTGVnd1lRb2R6?=
 =?utf-8?B?dlh6R0Y0eDJJZ1NYdWtSUnVKc0pUeHI1dnc0Sm9yU0JTS1VzQkZURW9oWnYz?=
 =?utf-8?B?dm1MQnhGeEdMc1ovNFE0WHpneGZJOWFrcWRORjVVWVNrNk1oMWNyVVg0YzNC?=
 =?utf-8?Q?14PoikOw4FrFSilH7W4DAwtktFwXc+Eakoq6kF0durzC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0624d80e-c241-408d-7d3e-08ddaf34bde3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:21.6763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vi6EbOkPiL7ntJ+y6ZIfVDnuSTVJ9GseS3kmqern/1ms9Ut393OKeQV2NtyDv5NcSni0XGIj0AY2J5C/askUIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
order to initiate the GSP boot process. Introduce the structure that
describes it.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4b8a38358a4f6da2a4d57f8db50ea9e788c3e4b5..2f4f5c7c7902a386a44bc9cf5eb6d46375fe0e5a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -41,6 +41,51 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
     }
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV3 {
+    /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
+    hdr: u32,
+    /// Stored size of the ucode after the header.
+    stored_size: u32,
+    /// Offset in `DMEM` at which the signature is expected to be found.
+    pub(crate) pkc_data_offset: u32,
+    /// Offset after the code segment at which the app headers are located.
+    pub(crate) interface_offset: u32,
+    /// Base address at which to load the code segment into `IMEM`.
+    pub(crate) imem_phys_base: u32,
+    /// Size in bytes of the code to copy into `IMEM`.
+    pub(crate) imem_load_size: u32,
+    /// Virtual `IMEM` address (i.e. `tag`) at which the code should start.
+    pub(crate) imem_virt_base: u32,
+    /// Base address at which to load the data segment into `DMEM`.
+    pub(crate) dmem_phys_base: u32,
+    /// Size in bytes of the data to copy into `DMEM`.
+    pub(crate) dmem_load_size: u32,
+    /// Mask of the falcon engines on which this firmware can run.
+    pub(crate) engine_id_mask: u16,
+    /// ID of the ucode used to infer a fuse register to validate the signature.
+    pub(crate) ucode_id: u8,
+    /// Number of signatures in this firmware.
+    pub(crate) signature_count: u8,
+    /// Versions of the signatures, used to infer a valid signature to use.
+    pub(crate) signature_versions: u16,
+    _reserved: u16,
+}
+
+// To be removed once that code is used.
+#[expect(dead_code)]
+impl FalconUCodeDescV3 {
+    /// Returns the size in bytes of the header.
+    pub(crate) fn size(&self) -> usize {
+        const HDR_SIZE_SHIFT: u32 = 16;
+        const HDR_SIZE_MASK: u32 = 0xffff0000;
+
+        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT) as usize
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.49.0

