Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8CBC174A3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1357310E6AC;
	Tue, 28 Oct 2025 23:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lizxXMgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF9310E6A6;
 Tue, 28 Oct 2025 23:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA7ozUwCzHMmMo8qQ3M7YNW4ySzIuIGxhsaFn95hla3/NwLW78tKoE11JiyFQeyWMLgW6VStazWboMr7xz80+XFl1bjWsqDuuzakaW1HricdWuhygZbhaJKp2RUeWtHWaRNfnbSxz9wPcQWwWtxPpMaDOHiY9vfxIipPR+1FUAi5U1WhkBEBUHu1fFKmUS/ObQUlkmifhGK+Q+iUyX8524jrv7JUKprCuNwBJBAY/ME5FoP/ElLNN4ZWv5phncxcXfbR8CL8o3PQOKn3A7qVAVkD4EbmBoAMJ5715++P0i/GCaJmXgj+VPIRQpOiHnhZYi8HhOT7RCGDLKgBNLDyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukMbq45DXcrHt9DQmQp3NVnN98CLlfEHEHQFp+ZOrUc=;
 b=uEs3vgTh+JzK7DJl3l7K8As3effDpxfVqSaAAkGNYJEFQVp8uOCkzNeZf88jnacFO3bm235alqeOawn3Lz7wICQU8Azd3HwY6eHZsmlhKhwA+D5HLNx9uXPFC0kGH6WSlGvgBG6t6/Lb6KJROZE2NwpcVwWEWysBx8sOnTQ5MQzLuL1yeejtaRbAD6rQs0GqDw51bonHZurXdvFW6Wda5sCwei2IUgqdmAPlWXyNuSCl+H+dngjKawWaCToLqYopNOKwSPEP8CAoSOxA4Nr3IOsFtTEmsMbLZgHJEpvKIowLbTWv173EY5RstsLcI60qT98NUmTHOWRIMklE1ZgYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukMbq45DXcrHt9DQmQp3NVnN98CLlfEHEHQFp+ZOrUc=;
 b=lizxXMgspL6lRcz55I8BHZojztsFIKYy9J4782YCo+Q92ShQjYjhsKEWjrWeWJy/GSBA/S8UL0HfaPsSERmhGmuSXs6eyPU9Gp+USOTZSOLL9v3QyXhgJmme/+7xDKIDW14OyrSgUZs95VzbMlR7iOEoao5TI0pvPypxkhF+Fg2/DeUnpxLGGrF3CjwErNqB+uBiih5RUqiRPKIGQZQaQVoqZhDiixBwMohWLXDjj62/F6A4LBfcTQnV0jvBdjR8KP/8QdNEMdCJNUGWc0gwtRivMfnWMyTOKYX5kbj+NJtAVL96OoRJSHi+NKrE2lAe9Vau7P4V1UPHRcbS3BWz0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 23:12:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 23:12:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 08:12:14 +0900
Subject: [PATCH v3 6/6] gpu: nova-core: justify remaining uses of `as`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-as-v3-6-6a30c7333ad9@nvidia.com>
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
In-Reply-To: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:405:379::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cf631e-111d-46ca-8186-08de16777acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVQ2QVM1K3MrdjdFQm1JZXVkYmpIalgxNS8zU1Q4KzJ6bmtCTTNGUmxJVDNW?=
 =?utf-8?B?K0YyU21PNWtzb05KU3lOd3Z1N0w0a2lHVmJoZndBR2o0Y2hOUG14ZXBTQjZB?=
 =?utf-8?B?SklUbUwvMTV6ZThFSjFKMU5CaDFsZWN4UERiQjdxbktST0g3YmMrRnNQQjhx?=
 =?utf-8?B?ZUlHQlplNDRvK0VHeXNJZmZ3Rnd4bkpVT1JtemppZGxkS2VDWVR6aUVsV3ZH?=
 =?utf-8?B?Rk5OdFVRbEd1N3diaTk5SzN6Nk53M01Iai8zdlJCT2tqeGl1aFp4NEhIRFl3?=
 =?utf-8?B?c1l6ZmJ5SVdEZTVTdnBGUUF2RkxMOVA0ZERPdEgvcE9ORDF2WlA0amIrODRU?=
 =?utf-8?B?cHBoc0ZMZlUzS2hlaE50VlRuTWg1bGZPcTQ5Y3U0OHdBVTlrSDZoWFJuM00y?=
 =?utf-8?B?aG92R2xpZUxaNDNVREQzb3ZmVjUzSzkzeEJveDY0RzNiZDdpSndrNTgzZklL?=
 =?utf-8?B?dmhSSVV3ZzgwUllpeDVkcGlvQkFhQWhJMlJPM2Q2NXhoektRbUhRWjAyZ3pi?=
 =?utf-8?B?c2hZL0dJcEZDWTFEVUZ2Rk13U0l1Z2VwRHcyb1NBZkN6OUlDc2NZQk9UUVI0?=
 =?utf-8?B?TzZmUGJZYmwvRGJ6MlcwNDBLbjhZNFg3MVR6MzF4N1FSTWNJa290NTZIWlhj?=
 =?utf-8?B?aWdMNW1aVS9nS2VFQXdZRjEyemFCaGRwRUtsRTNleFVUU3dGZTBXeDJJclpK?=
 =?utf-8?B?U0YvYUJZK3RVa0Q4YUtzMW1mVnR2TjBmdXh5SncvcSs5amdMWmpYUVNaeEkr?=
 =?utf-8?B?S2VjQTZaV2hUbXN6enJ0b0JwMGxmOVRwSFJUSkpZUm9Kc2ZJcU9UNVBXam1M?=
 =?utf-8?B?V29sU2xvNHNmZHh5VHJIY3M2UTQrOWFpV2xMaXhYUVdIMnBneENCVnFUYW9H?=
 =?utf-8?B?M2F6ZXVHbnFhTkQwZy9xVzJJYmt5QlZKVVdhV2ZxQXp6VnZ5bzAvUWV3aXhR?=
 =?utf-8?B?bWdhMDNEZjR4T2ZuOXBoQ1pJYlc0a280V0FRYUxkUE4zQk5SYXRKTFZkWGla?=
 =?utf-8?B?akRxckFZY3djOENuakZjTzM0ODViTFNYVldSRER0THErYTFDVitvV09BRXhw?=
 =?utf-8?B?UTEyQ01GYWNrLzdabnNlN3NPN1Nkd3htNjF6QWxZZjBVR2tNSVB5ejVXYUJ5?=
 =?utf-8?B?MHRYbmNQeE9kZFU0YUgvUHBYN1pRbTlzRnVSNEtKS0Y1Q2d3RFUwclFpbzFE?=
 =?utf-8?B?Uk1pd3BHaWE4N1o1VGZVeUgxQWdyOU40QnM1U0tLRFJDZ2d2NjF4MlUweVN0?=
 =?utf-8?B?a2dHNG1nZXFhM1pocGk4TmpFZXhqczBQSWt2eCtSYk9uVnVua3BqUGV6anNY?=
 =?utf-8?B?ek84bTBPS1pJeHNYU1ZmSGZaUWlyMU84RW1zVHNYcTN3eVhSMytnVExFYmJo?=
 =?utf-8?B?QlBWQUhnaFRjL1hWc25SMXVwNi94TEdUME90N1A0Z2FWd2VqK1pWUW9SV2Qz?=
 =?utf-8?B?WmsvS0N3bDZWWDduay9ZK2NsV1J5ZGRsejhmUHJtdWFMd01Sdkh0QWQ3LzhV?=
 =?utf-8?B?dkZpVU1iQy9HVlkzZkxMYUR1eHQ3MDNnVmRRRmRFQ3MyOFF3cUh0RWNIeHRM?=
 =?utf-8?B?MklXQSt6QzFPVk5KaFFUelJpWkVGVytwVUpYWVFTVWs0UVRQOXRidW5vaEtq?=
 =?utf-8?B?TVhlSVlJTG9LdlFBdVZNcldza1YwUFFrM0xhKzMwT3lVNDVNWkdqRmFpditw?=
 =?utf-8?B?RHRUUzRCQTN2TEFNTDRIOHFvUTlmZXlLSnluZ0t5MVgybXZXVjhVVHIrTk12?=
 =?utf-8?B?eTVaL1p0bDNmZ2FETUpPbHR6eStreHl6ZnhCVmpYY3VkYncyL1hZSmdRUzZr?=
 =?utf-8?B?QkYycHIvcll3b3Evb0JyL0EzN1JyVDFnenRWYXFSYWd3SmhlL1l0Um1Vdmk2?=
 =?utf-8?B?M3d1cy9hSXMvNlFHcGM2NmVJYWhkWm1aUDc0RUpRbWFGRkZmamhrVlBuSkRt?=
 =?utf-8?B?Vm9WbGhQUDJwbk1LUnVzSlNFc2ZvOGlkTVE3bi9rZHZneGxkakFxenFSWjMv?=
 =?utf-8?Q?wHjDliKqe2hrkCOzJCzFQ6s00AK/us=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3p3all1Y1Rad1pDeVdBeG5TdTRpc1kyK1NXVVlibDZrWWE5UDM4RlZaWXF1?=
 =?utf-8?B?Y1pUczI4VjREdWlUcGM4NTZLVElCRVkybFVyUnk5dGdBOVA2dUR1bkZReWUz?=
 =?utf-8?B?T3ZCU214U3Qxc0s1VlE5NmFROU5qeWFWRjFMWFZUb2JkalNncE83V2hKeUVK?=
 =?utf-8?B?S25jZlErUi9SYlEzcnNBOXlyY0FFeFZ3VnJKV01EbUpKMnJaNkt6dnk5dW9h?=
 =?utf-8?B?QlRoK3NlbjBsbHRzYVBFdlhHd3RjL3QvVWFZQ0FlZDJmVFRJZVdHc0tlbDQx?=
 =?utf-8?B?emFYUmlSL0VqUTZHWTk4MkV3aDN2UE85TDFWUkVlU2MwVkYwWmtEdjY4b3Bh?=
 =?utf-8?B?Zy90OTlrbVNkSmpKeDJsNEtXWkRnNlJuVW84aVp0WkpNMHFUcmx5MHhjckto?=
 =?utf-8?B?RlNMWElaQlBCRUtWRy96Q0VxMDhuNkZadnZEVXUxTkxCcUhpMGw1NlpYVlJ4?=
 =?utf-8?B?dHY0VW1BRUtIUWxFZTVTbll2RENHMHNDdkNRcFB1VkNxa0s3YkZXdGh1dkM2?=
 =?utf-8?B?czdRdS9UaFpsck04T2xZb21WWFZDUmV4cnR5U1ZDL1pESEhSS1dGZjBFZ0ZM?=
 =?utf-8?B?UGZlNUZnckxFYlRpeVZIYy9hQzdWalZ1QTZJb0U0M1dzckQ1Mkt2Z01TeGkx?=
 =?utf-8?B?MXNSaTlGcTNSZWNpTklSR2kyUGtNUXd6UjFhdVdPcTJYSWhlV0k3a1JXeWVW?=
 =?utf-8?B?QWZnL21Galo5Y3FHdWRuK3piUWl5Z0ZXTzBWUVNRNU9ZWnpCendhNkcrckpO?=
 =?utf-8?B?dW50OFZRRnhBaXEvcE1EL05wby84Y0VqWU1WYkVqS1FYU3dmQTgxWWxLOWJH?=
 =?utf-8?B?MHVtTjdHS3pmdnpySGs0MjFzdFpHUmVaZ2pUTVNEcEJoTzRwQ2RJOCt6Yng4?=
 =?utf-8?B?WnJENDU0QStzc24vajVzOEJwY3oxdDY3anZFa2NURDJidndQWTJqdXpZRjBI?=
 =?utf-8?B?b0sxOWg0aVgzM255NFRVTzU3L3lUTHQwa0g1Wi9OdzI0cmRZeXVvclFtaDJw?=
 =?utf-8?B?UDAxYWQ3cG1JSlkwN3FVRTdaZklFZ2xkWWNXSExKaVhvaFhkWXpxWmJlTTc5?=
 =?utf-8?B?QS9aYmtwenNrakcxb2pwL0ZBZklvV3NldTVKVDd3YkVKK2ZaZUplWE9mQkR2?=
 =?utf-8?B?YUtPUWEreE1xWXpOdmNaUk1WWjZ1V3RxUVFtVU1WTDVGQjQ3ZjJnbGF6N1pH?=
 =?utf-8?B?RVR0dk56di9LbHZRQ0hQeXptblBpQTQyVW9IVUJsU2N2OXdRQ1NOTjB5UzE2?=
 =?utf-8?B?Rlh5YWJ2Rkw2RnRQOHRqc0dvdEJoQndRUVc0SHRYL3Y1dUNoOE43TlF6bmp2?=
 =?utf-8?B?MlR5a2RCcVQwZ3hmRGJwUmFTM2gzRUw4LzI1NVJkcXZvTHRBbTM3bGtSd3lY?=
 =?utf-8?B?VlFDNlh4VjNPNU9Nd21vcndQUFcwY1Iyc0I1WG55RHB2Mk1iWjB3VWF1bm5r?=
 =?utf-8?B?dHgzU3BOMklwYkdiTWtiSWhpMGhYMVRUV0NhVE9BYnRBNkpjWWdWS1lrY2V6?=
 =?utf-8?B?OFR4ZlYyV3NWeXdkN1RLTVY5Y3pJa1pWaEg4MFdnRG9KUkpZVnZuVnZteDEx?=
 =?utf-8?B?V2U1WlNtVmRRWXVNSGNzSlNNUU96b2g4N2hpbnc2RGhPTE5BQnpwZnRFaC9F?=
 =?utf-8?B?U2FKTU1CSm51QW1OUEtyL2FwcGF2RCtNN3kwdnlncmExdk8xK2sydkl2QTFs?=
 =?utf-8?B?clNNcTM5T3RnWU00TmhFWE5jcWZORUU1UjAyL3Bhdit6WFliSi9kSG1VSFdq?=
 =?utf-8?B?bVczT2FtaHBQZ294djhyYTV5QkNmQlMrOGM3SnZRVExnZ1UvSERnMDVNT0tr?=
 =?utf-8?B?eVZFNnN2eWpENkJrM2dsQUM5K2NQdW8yZU84RVNkczlURCt4MU9JcloxTTlU?=
 =?utf-8?B?ZEoxQlB2clVvL1VXdDlZQ3RuRkVmcWxLYkdIeU1yTU9HRzR4QktuaWx5N1lp?=
 =?utf-8?B?MHM1V1pQdHlrU2NVM09IN1FHM0o0UTdCQmRidlhoUU0zRExMK3Y2dFAxWTRh?=
 =?utf-8?B?Z3ZValk4Y0hmUzdHVFlpQjdIMjl5ellwNVc1TE1iaEdXWGExa3NWOFNYeXFr?=
 =?utf-8?B?TXhyNlIvUVhLMERBb2lMMXMwTW52MGxySHFHcCtvSzczeVphVlk0RDRoaDFU?=
 =?utf-8?B?WW9mYTRxSnM3SmJSdXVKWEtMSDROWm1wWnNxbTZSby9LRCtsTy9pdmR1MXVy?=
 =?utf-8?Q?Y17HfVhEH3eMqnXkucRVppPeYc8wj3cOAmpFAC33V5VM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cf631e-111d-46ca-8186-08de16777acb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:12:35.2415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTMzJ0rambAnC8HwH5Hpml10kQuYmE7M+xGRz35VfFehFZWN+czef2qBwwvLKuZRCUrnP1OuUsY4sebxLRPcOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
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

There are a few remaining cases where we *do* want to use `as`,
because we specifically want to strip the data that does not fit into
the destination type. Comment these uses to clear confusion about the
intent.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         | 4 ++++
 drivers/gpu/nova-core/fb/hal/ga100.rs   | 4 ++++
 drivers/gpu/nova-core/firmware/fwsec.rs | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index a0ae197a1489..9b5269843af5 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -479,9 +479,13 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         // Set up the base source DMA address.
 
         regs::NV_PFALCON_FALCON_DMATRFBASE::default()
+            // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which
+            // will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
             .set_base((dma_start >> 8) as u32)
             .write(bar, &E::ID);
         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
+            // CAST: `as u16` is used on purpose since the remaining bits are guaranteed to fit
+            // within a `u16`.
             .set_base((dma_start >> 40) as u16)
             .write(bar, &E::ID);
 
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 871c42bf033a..b9389fa382e5 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -18,9 +18,13 @@ pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+        // CAST: `as u32` is used on purpose since the remaining bits are guaranteed to fit within
+        // a `u32`.
         .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
         .write(bar);
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+        // CAST: `as u32` is used on purpose since we want to strip the upper bits that have been
+        // written to `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`.
         .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
         .write(bar);
 }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 96bedada91bc..90b372850062 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -161,6 +161,7 @@ unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
     if offset + size_of::<T>() > fw.size() {
         return Err(EINVAL);
     }
+    // CAST: `usize` has the same size as pointers.
     if (fw.start_ptr() as usize + offset) % align_of::<T>() != 0 {
         return Err(EINVAL);
     }
@@ -184,6 +185,7 @@ unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
     if offset + size_of::<T>() > fw.size() {
         return Err(EINVAL);
     }
+    // CAST: `usize` has the same size as pointers.
     if (fw.start_ptr_mut() as usize + offset) % align_of::<T>() != 0 {
         return Err(EINVAL);
     }

-- 
2.51.0

