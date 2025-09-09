Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C056B4FECC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB2A10E78B;
	Tue,  9 Sep 2025 14:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VP0ORKP0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9937E10E785;
 Tue,  9 Sep 2025 14:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywKCFIufzsia73hwRWkdbAtu6ke1S8FBZ4nh6mdJ4t2TrySehhaPiVuPM6ypVDKCny5vKPpE2UQBFQectcQArViNEXAKsYPaJ2fKhaQDt8fP4slqpJN1inz1Z/efPTVS/cN623fPivhyugBXulSeLvNIH+LQfexxdk119CfHLsNVIJRGHbdhnMOqxyDmpj3T2qeeCzM8h9edGmgntc41TZRPlcBKp5zZyM3X4wYS+Qpy0la6sE1eweruuuhDZAj/kyXFtAFEBBqNkuXLOyLoQwsBp9CHgPDevmTtapsr/1gqWWmSCveozqKAgVaaIrDMH/aoTjourO4mhU+PyMEShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fJoSAwtSJxnRQHw3AH6kV/DnAcSGOlmT7pabrkYfmo=;
 b=xan0od8pWImjDBw7H/6Nb+W7WY1u4Fco1D6jdlmAZ3LWAmepuQH8tli26hSOiDDUDFlAYP/pBaQIxPhW9cDBtEavEmgYTyJwNcdtBV20TQ8oJcSyPpE8A5WHD+GTE0KfWJXBP6BU/fda15olLPvIhRISTzhEbuukLo9PviDI3wb8QFPrNd9b+xUrfg3HSaYrmOWOIOtLJVDsN1wXOqeRAzP5yV8EdtuUSRWszC7YwSBWfB7UMKPW1pn5oO2Wntn3wyhzeHg1Fc5Xby0vYPO/85fc9bN8Fg42wKg8ICfPgSsCx+5yfUakNV5Hr1xFUiTMvAJU4jEvXFbkKrg/DfxvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fJoSAwtSJxnRQHw3AH6kV/DnAcSGOlmT7pabrkYfmo=;
 b=VP0ORKP0mcPPBgoP4IJveVSye3X0KNHSfoM+8lQjB1j2wexVdXkSxGgzn1uwqi5MWu+8/nntApUklum60GUmWldrBsXFvM42jWnOcenhfOiewDCVr0Tv/m643okZk9cptRXvH1m4Ne1DSnbzlArHycIJNjc92qHoC3OLiBuE37HSbACpt18vepusohHG19Gb8+ekYyD4dDLLQrH9P6q6xq2Mn3FOl6eLCYgggAqY3IE98V3CJm46+xOgm3PF5F98NdRMAJpCnqPxWV1lokAWyKozENbgBV8BRkmEQEa9gkgcpati+GvLw8O+kDAtKEGoQe4fq4+1v9+HtsdrbQWMPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8653.namprd12.prod.outlook.com (2603:10b6:930:c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:07:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:07:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 09 Sep 2025 23:06:43 +0900
Subject: [PATCH v4 07/11] gpu: nova-core: firmware: process and prepare the
 GSP firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-nova_firmware-v4-7-4dcb433d5fee@nvidia.com>
References: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
In-Reply-To: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0168.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d1225c-ad7a-4b94-15c0-08ddefaa2c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2J5VWpnWjFKUUhyOFhtSGhicTZJbm5CVEZIcE15ZnlYZjRxbFVRR3RvTUVB?=
 =?utf-8?B?Yk84dnR6Rkp3SktzcVJCVkNjenBzblAzYkp4ZG5OSHdkRVJRZExqTnVhNTRY?=
 =?utf-8?B?R2RsUHpGUHduNjJWV2hSZXVXM2xuZkZHNG54VUczSmYyZEhoLzRwOHZqNHNy?=
 =?utf-8?B?dVBJNGdyNGtXeW9qb0VTV1YrSk9ENDh3Ry9vWCtsZjdvUS9CQURtdUJkdGtW?=
 =?utf-8?B?NlBpRlFtUjFYL0Z0OEE0N3R4L0pteVVOTUpSdFRlTTQyTk0zTjVFeTFMeFlK?=
 =?utf-8?B?VE43b1VsWXFETE03ZDlLZGp6OXpnQW8xR2xSRy96T0dWSlVZKzR4MURDblBs?=
 =?utf-8?B?MEJLY25EdlFuUFJ5bUFTajdDRkNQd256SmFxOXRoaHpUUytCNENHNzl3VVZo?=
 =?utf-8?B?c1MvMUM1a1UreHMzK0RESUVpWE4ySjY2bDhqNkw5QUJJYmR5M2xoQVJGY1I1?=
 =?utf-8?B?YTBXUXFCZWlWRDN1VGh2dUpSVzJlazJJd3RxUXk3Q2VGaFlma1hsNDF6bDY4?=
 =?utf-8?B?NWtEdVB4SnhxQ1AxSFAxZXJPS1Boc0VUWEdIR2pPR2N4RzYzQTFZUVRKWHlm?=
 =?utf-8?B?SDA5bkZPK0JZSTRHeTlTeWFxWFNwejZKWGNmVW5MOEovT01TNWo2N09HV1Zl?=
 =?utf-8?B?N0d6M25ieldLeFBHbWpLdmdnc096NjRZL1ZwS0orSERpRFl1eTQ2SlQ5ODJG?=
 =?utf-8?B?V2pZQmhCWGhqN01mZFBRZ25xaUJoTGE2UXdSZU1yNGRRWUtoWkorZnIxWE1U?=
 =?utf-8?B?MkZhbFh5RG5yNWNZNUt4NE5rek5ydmxBeDZGTk9McG1KRE5oTE9mMHlId2lL?=
 =?utf-8?B?R0h2MFlKQWE2N1ZBRzBYWU1hY245TFpmZDJtSkFPNkNSL0E4QUZ6RnpoeWZk?=
 =?utf-8?B?aEtCcUZLbTVIdFZxdTZZTW52MFZHMjN5STVZQlFCNXJJMVpXRVdxRjFBRitK?=
 =?utf-8?B?NXAwZzZMK09JNjE0cWpQcjFwWDAyU1NvdlBiZHI3RTZxUUV2MDdNTUxGRmls?=
 =?utf-8?B?eVlic1MrTlJRaEFtaGp6OGNKVnI2T29IZzNtZko1a2k5VkNVU1JNMTZ6akdZ?=
 =?utf-8?B?WVQ0RXB1NVBqa25WWVRQeWUyb1RRbzdHa05GNjBYTkxPRjVVNTlSdWwvdFJ3?=
 =?utf-8?B?Z1NNMkgxMDhvQVE0VUZVT05Ed0hVYUlvTzRZNk1QSDhIZjQ5TTgzbUtKd0pJ?=
 =?utf-8?B?TlpjVEZzTU5qMGhLanlqSXVJK0x5TjhYT0JPbWVGTG16eFRPT0JacWovNGU3?=
 =?utf-8?B?bHc4cm03WVQwOEc4NGhvaHA0UXA2Kyt3R3E3L21QdXV0TStSSXZneUZkOXZQ?=
 =?utf-8?B?TnNGVUtMbVF1VjlBellnUUlFZEcwV2t0bERjcDJzMEMwQlNUNGdlUTRNczkw?=
 =?utf-8?B?UlFueXdMZmc5SUtZZFo2QzBzNER2ZzVzTUxoU1dRb3g0T2d1MHVuQThycHM3?=
 =?utf-8?B?UjFRdjFTR2lZaVlqZmV5RkdGRlF4alhmeWdOejZaNlR0L2tzY3k2VlprVmlB?=
 =?utf-8?B?enVWb2syU1ZuTy9LRWpEZWVDL01jUlZnZlBDeHRHeDNzOFBad2R4dWVmNTBN?=
 =?utf-8?B?TjFvWVJONkdQTWNTcUlLcytHVE0zOHJqVkJZQTdJOXRvQmpSSTI2Rnp1TlRL?=
 =?utf-8?B?RmZKK3N4Wm83bDhZM21GVDZYeFZUUGR4SjlrdVh6QkM1SzJld1RZZlg2MWFz?=
 =?utf-8?B?Y3FDQzFwd2tJKzhuZURxMFR4aEFrcWFhV2NXNldNTFhmcTRQbFh1RkNCWXhM?=
 =?utf-8?B?Q01mSnIvbVVyeEowUVY5UHIyRmpPMFFhbURuMlArZ0xZTUFGZEEyR2kwNG83?=
 =?utf-8?B?NEsxcEZtOXptMjhPRU5tcExtSFJINUpNYnBwSGJtTHpMWVNZYVY3Wi9tQUhj?=
 =?utf-8?B?a04yOXpMQ1pLVmE3RjdrQ3FlYzBPVDlFbThrbk9tWHNVZm1RNHpUWDZ5Q0hk?=
 =?utf-8?B?Yk5QZjJrOExnS0hhdVRWQ1MzN3ZTK1kzTzNoVXlIeWRWQWVSVDgwNURIMFJ1?=
 =?utf-8?B?anRJMXRjVXh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTdNbFQ2T0dPRVhDQ3NrdTZRSkJrdXorVlBPaWNTZGIxNjlqV2hTMUUwYWZJ?=
 =?utf-8?B?MUg1YXo3c3hTWWljT2dpTGs2Qnd0M2pJZ0FVdTRmVTE5QjBPNVNDQnJMemdz?=
 =?utf-8?B?VUczV2tsQ3NzbVI4eGhycWdJUktZVjIwaXhzeHcrZUdkZDIwRjlmRExmdUtt?=
 =?utf-8?B?QTh0RGdhMWtoLzVsekFkbG9nVnA1QU9xTUdrZmdNMkhMRWw5ZGhUd2o3WmFu?=
 =?utf-8?B?RTlqUisvTWw3WFVxZzl0Vlk1VTFURFBpWjd1aHE3ZEVpbzlvclBLQlR5Umxs?=
 =?utf-8?B?RXBTYkxEY0hvaTZISnlYSUNRMjZlYm5DQmsvVmZaekcvVWsyU1hlT09aYUJj?=
 =?utf-8?B?OEFiRjFRT2RuU0g0ZWlCYm9ISkRFOXFJYUpZR0V4c2tsWVIxcUZlOSt1dXpI?=
 =?utf-8?B?SXMvL2J2Tm1mZVZGUjNjaXVSQjBsSU9MZy9LWEZBaWxTU2ZqREZXc1ZiNE1t?=
 =?utf-8?B?SDAzUk04V2JvYnUxV3phUGxZUWZ4cjVEb29oZXIyNXRMMjdEMzU2aUhEQmpp?=
 =?utf-8?B?WDFpMW9qM1RGVnMrcXZpbnFZU0F5VFZhR1FNRnRxaDNrb1JNMzMwaWoreHN3?=
 =?utf-8?B?bjR4dkpkN2d6b3lEWHZxZUxwa0NDUXZORmRHeGUrY2dWajRxQUFZaXIwTkdI?=
 =?utf-8?B?Ujl1a2IyZUZrak9KUEYyMDJqd0Q0cDZTQWN2eDlUSkVyeSt4b200S3dRcHpp?=
 =?utf-8?B?VnRsRThobkZKR3FWdnZpMW5uVHNXeEtDbEY3MldkTnk2YVJaQWVWdHN0U2Y0?=
 =?utf-8?B?alRuS0oxZzNnaHVldmZNS3NCYTFYTHppYkhsa1lmWmJTL05rWS9JQmlYZllr?=
 =?utf-8?B?SUIvUWNTdGJ0WUx2dGFRWUptc0xDMzJJTUNaNW9jRDI4bFJLL0hCZXZEZEpp?=
 =?utf-8?B?anRBdk9vRS81WC9TNlhSOUQ3VGFIWFV6UFNpcFhxbGNYc3BFOE5ZVU56NExH?=
 =?utf-8?B?UEVZQ01rSExGVU1TYzlUVHdBbjJJVGFDUHpJc3Rrc1RXaUNHeUNaWnVTSmc4?=
 =?utf-8?B?UENOTllodml0TGJ0eldYbmFlaUIwMGZxMGJjNjZ3UmsyMXdLMmpBY1dkQ3o1?=
 =?utf-8?B?RDVydjR5YVFnTm1aTnRTRVc2UU4weWJMeUZGU1phQXF5N1hLaCtZaTVic280?=
 =?utf-8?B?T0E3VTFYbkdYQWV1TUV5L2NCRHlCdTRkU2x4QmRxWksrOXZEcERMZ2Y5MWJn?=
 =?utf-8?B?c3puQmJadU9rTlJSSWE0bklWdE9tMStYUk1EMHZ0QjVSb2V0cDcvYWZMQ1BN?=
 =?utf-8?B?UnZjSWxTNjFxZS81NDFJcEw1NFJ1NHlHclhrZFVLZTlDOXl0VHpYanFTbDFw?=
 =?utf-8?B?b3ZzY2tLcDhiZTFTUzdnNWZ5Ym1qSFNPRFdEUnA2cmVFREsyMFBQU1dKL0JF?=
 =?utf-8?B?MGc3NnZic0FwT1BRajlaa2thaWdRVkdEZXlIOUF0cVRhajYyejR5alozWlNj?=
 =?utf-8?B?elhuUW9QK0UvSzUyUXpJcW5BL2lCNWl4dWRteDZwZmZFZEdUbDl0c09DU2lr?=
 =?utf-8?B?alpwNVRRb21aVlFFdGJiTG45MWozdFJpeExKRmt0S2YvbXhMT2pZRGZkT29L?=
 =?utf-8?B?VEd3akxtRGlnTWsxaDdrK0tSL254Rno4SFFoa2k5eURWR3I2V1JaUngrVURI?=
 =?utf-8?B?SExnM1BNRXNZblY2eVRkUmRZVFZrNUQvaTVqdUo2Y244Y3JJVnlWOXM4L05C?=
 =?utf-8?B?NHE2WjFaa09mbGg0MEtwbXpYUGZudnFnUVluMFQvaG1QUW5iN0JCK05JUWFI?=
 =?utf-8?B?MkI5L1Z2MnJqVWhnTnJLckFZZE1kVXJTUi82clUxRWtTdjYwVGFWbzkrYkVM?=
 =?utf-8?B?MjNjblZ5d3dWVHRDWFFHeW9XQXV5ZnBlekQwNFZSTkR6dWlJSjRCTDloL2o0?=
 =?utf-8?B?aWVLd296Y0w2YXRxdUZmYi9pcEUxRktRbjBxN2UyclpoTS9ZRlc4YXFzZHly?=
 =?utf-8?B?VW5qSzdDaDBobG1CbEt6T0tsL0Z0TWhsZnJvYk5GUm1hWTh3ODdjQXZoQ0l0?=
 =?utf-8?B?a2RZcnBIRE1hdWFGSkN3eE8wRzU2bUxYbGw5M3hZMFNoOGJIeDRoM3ljYngv?=
 =?utf-8?B?SXZBakJpMTVJWnBtQ05PTDVtYmsycUUrSk1uYjZXQVQvSW9qaXY5dDRvZmV5?=
 =?utf-8?B?MitQTW5PWkxEZCthR2NzeUYzakpNc2tKRWlNRHQ2ODh5TmNCMGxJT3lrVE9Q?=
 =?utf-8?Q?zPpRp9KzzlSD9VUvUKy/P6DXtbVjLlaqXHAey4H6GN9h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d1225c-ad7a-4b94-15c0-08ddefaa2c5c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:07:12.5706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fb4y3MRclo9mLSLo/8y23vn7HqeRW1mVb8R41FL3VZ4JxqASe5U1w4As976kzKB1h+Y8fu7zvhOPc99upAIYgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8653
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

The GSP firmware is a binary blob that is verified, loaded, and run by
the GSP bootloader. Its presentation is a bit peculiar as the GSP
bootloader expects to be given a DMA address to a 3-levels page table
mapping the GSP firmware at address 0 of its own address space.

Prepare such a structure containing the DMA-mapped firmware as well as
the DMA-mapped page tables, and a way to obtain the DMA handle of the
level 0 page table.

Then, move the GSP firmware instance from the `Firmware` struct to the
`start_gsp` method since it doesn't need to be kept after the GSP is
booted.

As we are performing the required ELF section parsing and radix3 page
table building, remove these items from the TODO file.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst  |  17 ---
 drivers/gpu/nova-core/firmware.rs     |   3 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 232 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          |   6 +
 drivers/gpu/nova-core/gsp.rs          |   4 +
 drivers/gpu/nova-core/nova_core.rs    |   1 +
 6 files changed, 244 insertions(+), 19 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 89431fec9041b1f35cc55799c91f48dc6bc918eb..0972cb905f7ae64dfbaef4808276757319009e9c 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -229,23 +229,6 @@ Rust abstraction for debugfs APIs.
 GPU (general)
 =============
 
-Parse firmware headers
-----------------------
-
-Parse ELF headers from the firmware files loaded from the filesystem.
-
-| Reference: ELF utils
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
-Build radix3 page table
------------------------
-
-Build the radix3 page table to map the firmware.
-
-| Complexity: Intermediate
-| Contact: Abdiel Janulgue
-
 Initial Devinit support
 -----------------------
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d954b1e98fda82c44f87d2103e31fa717c392d79..cef910a7c2dc360139fafc2a01a050a9df40e45f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -19,6 +19,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gsp;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -39,7 +40,6 @@ fn request_nv_firmware(
 #[expect(dead_code)]
 pub(crate) struct Firmware {
     bootloader: firmware::Firmware,
-    gsp: firmware::Firmware,
 }
 
 impl Firmware {
@@ -48,7 +48,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
 
         Ok(Firmware {
             bootloader: request("bootloader")?,
-            gsp: request("gsp")?,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9242e8ef6a0183cbfe5e75a3d6552ff528a2cedc
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::device;
+use kernel::dma::{DataDirection, DmaAddress};
+use kernel::kvec;
+use kernel::prelude::*;
+use kernel::scatterlist::{Owned, SGTable};
+
+use crate::dma::DmaObject;
+use crate::gpu::{Architecture, Chipset};
+use crate::gsp::GSP_PAGE_SIZE;
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use kernel::bindings;
+    use kernel::str::CStr;
+    use kernel::transmute::FromBytes;
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    #[repr(transparent)]
+    struct Elf64SHdr(bindings::elf64_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64SHdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let mut shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<Elf64SHdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr
+            .clone()
+            .nth(usize::from(hdr.e_shstrndx))
+            .and_then(Elf64SHdr::from_bytes)?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.find(|&sh| {
+            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
+                return false;
+            };
+
+            let Some(name_idx) = strhdr
+                .0
+                .sh_offset
+                .checked_add(u64::from(hdr.0.sh_name))
+                .and_then(|idx| usize::try_from(idx).ok())
+            else {
+                return false;
+            };
+
+            // Get the start of the name.
+            elf.get(name_idx..)
+                // Stop at the first `0`.
+                .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
+                // Convert into CStr. This should never fail because of the line above.
+                .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
+                // Convert into str.
+                .and_then(|c_str| c_str.to_str().ok())
+                // Check that the name matches.
+                .map(|str| str == name)
+                .unwrap_or(false)
+        })
+        // Return the slice containing the section.
+        .and_then(|sh| {
+            let hdr = Elf64SHdr::from_bytes(sh)?;
+            let start = usize::try_from(hdr.0.sh_offset).ok()?;
+            let end = usize::try_from(hdr.0.sh_size)
+                .ok()
+                .and_then(|sh_size| start.checked_add(sh_size))?;
+
+            elf.get(start..end)
+        })
+    }
+}
+
+/// GSP firmware with 3-level radix page tables for the GSP bootloader.
+///
+/// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
+/// space:
+///
+/// ```text
+/// Level 0:  1 page, 1 entry         -> points to first level 1 page
+/// Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
+/// Level 2:  Multiple pages/entries  -> each entry points to a firmware page
+/// ```
+///
+/// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
+/// Also known as "Radix3" firmware.
+#[pin_data]
+pub(crate) struct GspFirmware {
+    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
+    #[pin]
+    fw: SGTable<Owned<VVec<u8>>>,
+    /// Level 2 page table whose entries contain DMA addresses of firmware pages.
+    #[pin]
+    level2: SGTable<Owned<VVec<u8>>>,
+    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
+    #[pin]
+    level1: SGTable<Owned<VVec<u8>>>,
+    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
+    level0: DmaObject,
+    /// Size in bytes of the firmware contained in [`Self::fw`].
+    pub size: usize,
+    /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
+    signatures: DmaObject,
+}
+
+impl GspFirmware {
+    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
+    /// tables expected by the GSP bootloader to load it.
+    pub(crate) fn new<'a, 'b>(
+        dev: &'a device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &'b str,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
+        let fw = super::request_nv_firmware(dev, chipset, "gsp", ver)?;
+
+        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+
+        let sigs_section = match chipset.arch() {
+            Architecture::Ampere => ".fwsignature_ga10x",
+            _ => return Err(ENOTSUPP),
+        };
+        let signatures = elf::elf64_section(fw.data(), sigs_section)
+            .ok_or(EINVAL)
+            .and_then(|data| DmaObject::from_data(dev, data))?;
+
+        let size = fw_section.len();
+
+        // Move the firmware into a vmalloc'd vector and map it into the device address
+        // space.
+        let fw_vvec = VVec::with_capacity(fw_section.len(), GFP_KERNEL)
+            .and_then(|mut v| {
+                v.extend_from_slice(fw_section, GFP_KERNEL)?;
+                Ok(v)
+            })
+            .map_err(|_| ENOMEM)?;
+
+        Ok(try_pin_init!(Self {
+            fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
+            level2 <- {
+                // Allocate the level 2 page table, map the firmware onto it, and map it into the
+                // device address space.
+                VVec::<u8>::with_capacity(
+                    fw.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|level2| map_into_lvl(&fw, level2))
+                .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            level1 <- {
+                // Allocate the level 1 page table, map the level 2 page table onto it, and map it
+                // into the device address space.
+                VVec::<u8>::with_capacity(
+                    level2.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|level1| map_into_lvl(&level2, level1))
+                .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            level0: {
+                // Allocate the level 0 page table as a device-visible DMA object, and map the
+                // level 1 page table onto it.
+
+                // Level 0 page table data.
+                let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
+
+                // Fill level 1 page entry.
+                #[allow(clippy::useless_conversion)]
+                let level1_entry = u64::from(level1.iter().next().unwrap().dma_address());
+                let dst = &mut level0_data[..size_of_val(&level1_entry)];
+                dst.copy_from_slice(&level1_entry.to_le_bytes());
+
+                // Turn the level0 page table into a [`DmaObject`].
+                DmaObject::from_data(dev, &level0_data)?
+            },
+            size,
+            signatures,
+        }))
+    }
+
+    #[expect(unused)]
+    /// Returns the DMA handle of the radix3 level 0 page table.
+    pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
+        self.level0.dma_handle()
+    }
+}
+
+/// Build a page table from a scatter-gather list.
+///
+/// Takes each DMA-mapped region from `sg_table` and writes page table entries
+/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
+/// 4 consecutive page table entries.
+fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+    for sg_entry in sg_table.iter() {
+        // Number of pages we need to map.
+        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
+
+        for i in 0..num_pages {
+            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
+            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+        }
+    }
+
+    Ok(dst)
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 53fadbeea7b611712ca343af71bcdc01f1005673..562ad162863fdad9275cb813d0586d074dae2c4f 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -8,6 +8,7 @@
 use crate::fb::SysmemFlush;
 use crate::firmware::booter::{BooterFirmware, BooterKind};
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
+use crate::firmware::gsp::GspFirmware;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
@@ -282,6 +283,11 @@ pub(crate) fn start_gsp(
 
         let bios = Vbios::new(dev, bar)?;
 
+        let _gsp_fw = KBox::pin_init(
+            GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
+            GFP_KERNEL,
+        )?;
+
         let fb_layout = FbLayout::new(chipset, bar)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) const GSP_PAGE_SHIFT: usize = 12;
+pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cb2bbb30cba142265b354c9acf70349a6e40759e..fffcaee2249fe6cd7f55a7291c1e44be42e791d9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -9,6 +9,7 @@
 mod firmware;
 mod gfw;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;

-- 
2.51.0

