Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A0ABEC40
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9FD10E683;
	Wed, 21 May 2025 06:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Myd6uwXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB6610E67A;
 Wed, 21 May 2025 06:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8K936K6zWUD3+HPMDT1vKQ7Xet1PteK9Sgb01K9AT1Iaq6J3j1sfPgB7iSa91n9mKyMGqewly20bRb00zW3YiG7g4anXEhatepFJVrAV4lhKPB9XBCV7mu0orTHKVKtHfvfedS/2Y/+DFdjx7+CZ1sDVgy7rzjprtay0anM0PkAAvVbHVnPBUuqT+lJyJtkc+qSb8K7qMFIn6n+hPgDaq343OeWdqSZJNQPqjUJKrbf81YlDkz6ZamS96b/sppvKaOpbuqP4ZTs4Vhx5bg1FpMPhJnHRzd5r/6StyEkCoAXKZgS7elmDZjMT7AC/BdEnM+/duqZmUj2TBMXmDTTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtkiYuB+m8zsIoPM9Xj2QJhHhjzIgwG4ia559TTF+U8=;
 b=jIJj13uDzOR+bL53yQr8CG9efKId9uE1a2wQ8q2qTig+O/AiRGIBV17TOSV2OdluJlr8TsniJen+F42udKXbRUZV0mB/M/2D4ewqgNmZyr6zhPljrxHOCNpA79FpnzRAT/3QGQI2dMaq5U3BI3JKrJt6p6xfxtW+oYsNKEeb+tltmmTAn1CbmKAz3zWnzWTkdE3TDvQYUEwjiZWOUow03gUE1r4dZHd7uZtYoGTcsmFhum1vrWo+nkH0v9e+5elmjgK+sTfRZwB33bbibGLoG8XV2Z0NOViCx68a9eKTxheoov2MRFWokPY+rqNpDvdbAqEpN7ExXW085abeL/AMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtkiYuB+m8zsIoPM9Xj2QJhHhjzIgwG4ia559TTF+U8=;
 b=Myd6uwXoWAdvZhXASNEIuSL1yeRpmoQte8b7Rd8Xs3KKv7tyLPupjJKlbgDnNVYc5MXdwECnaI49AI9iOLkR15sfbwZtsl2w4baQ7BAPRgeRLSdH5QmqTCROx6jRrBxWrXXqJs/SK3FvCXgqr9ScULdW+MRulXXibEKoKmJAKHoXkwedwLDB12q9+cGHxjr9yaGg+WN1t05VNdDhz2Dana+iAK1WUKEiJ+wJEOcagJnl9bu9+tG02tT9P+5GqJWDYWxArASV9jqY5wRBjJ4U19pq7EDA/oxYRK4Ex9O2uZRS4C7nUvYA/66ODlJiyoPDgsD/Ktditmu2nYGqeI//3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:46:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:46:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:13 +0900
Subject: [PATCH v4 18/20] gpu: nova-core: add types for patching firmware
 binaries
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-18-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYWP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::11) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c9539c-4fed-42ec-c1c6-08dd98332b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1lvd01GQ3AvdlZZQ0h4NTRGWUZwVDZOUjBqS1M0ZERZQWsrMld1V2tudmRz?=
 =?utf-8?B?WUZDRlVJcHhPdDl1RTdzb1VZb2pmQ3NJNHZYNGtKaWZpb3VialNSTnpVZURx?=
 =?utf-8?B?QWdTdCtzU21VdmdDa3BqcjQ0YTY0TFc5Wkh3NkFYSmtwdjRCWXQxZFBkK0Ri?=
 =?utf-8?B?YmNBaG02eGt3Vk9oUzV5cmJZTmN6VkkwamRnMWFYd0FFU095RU1MWmlSYm5N?=
 =?utf-8?B?U2YySWRwS3p0M2lQdzFHZVdteWJRSWNKdS9Jd3IzSC9MdkFTYWU0SmxlR1dw?=
 =?utf-8?B?SVNWYWpaYUZrQ0h2SU5Zc3czUEpBOFhySXNzaUxjeUlkQUFRaGdBMkduSmxn?=
 =?utf-8?B?NUtpdzRJS0NPbFl6d0ZsUndtNFNBYi9wWlU5RWVBTnY2aHFTamtUT2JnUjd2?=
 =?utf-8?B?UlJqYU51eFBrdWF1MXVtYjZhMUNuMVorRzlBUzJPNnhDZU9iQmdpclA1cTY4?=
 =?utf-8?B?OWRvZTY0bnN2YkhtL1FqUTVEZzRMQXhyczhveldGUU1HUjYrRjVFcFB2WlhP?=
 =?utf-8?B?N1FOazhYV0FHK2NabUJldFVpenhCYmpKZ1dMZU84VlRzaG5zTGFlaC9NQnE1?=
 =?utf-8?B?UHQvSXREL3kzQkp2dm5aQzJLYktSNy94L1pQRWpDdzlRelZVbWVYOC9SZDYz?=
 =?utf-8?B?amNpendyT2h2K0pqczg4a3hIUGE4MjVmb0xwU3BVMWVjZzJPQllwNmtUaEtX?=
 =?utf-8?B?czE1UHNDcjJia05YanpjMlEzdFVmYXNYZlZYaENnR0hDTS96WlcwT3RuTzJ5?=
 =?utf-8?B?M3BLR3QxRFQ0dytLTmRYT1ZpdnZHZU9PQjRTRkpaNjNZcU5lb01ONWF1c0FV?=
 =?utf-8?B?Um1hT2p2VzZkVjkrMGxTVkljdU55bVdSRlRFRVJ3NlhwQ05BS1cxV3dlTDNM?=
 =?utf-8?B?QllYL2JSdEJpVVJ2em5Wb2lhVGJOTzRXalRBazB5dlg2czR1SS8xTklndmNn?=
 =?utf-8?B?TVNnWkV1NkN4ZkpsUWxZcDc4dnFaRDNHSjhSeTU2eFF6VkNUZytoMlNZZ0Ra?=
 =?utf-8?B?ODdQZzJlSlcvQ3dtaElFREhCSTMwSEwyeXlFL2xMS3llNnVQbUQwZ3BSMDNm?=
 =?utf-8?B?MlJ4Smd2blJjZlh4L0NTdUhOclZ3NE9hUG1vOGF5Wmg1YjdrVkV0V2JpR2Iz?=
 =?utf-8?B?UkVEcjZPMFRyZWZPUFJQYkd4Q0V5bjN0a3lBTjU2dmwzMnliMEFxSmp6M1lk?=
 =?utf-8?B?cUJ3RHpIaXFlSng4aHpxM3RqRlkvYWhkUjB1UlhseVNMWXE1ZCt3Tlc0aXBE?=
 =?utf-8?B?YTRlSjRGT2s1OU1wNHhMaUtQRTVBdUpjSExRUGlVd2h5dXhTWmZ2V3JZRUNR?=
 =?utf-8?B?NjFqRVpJdkEzbGk4QmpacEVZOHltR0JXbUdjT3F4Qy9YVzRtZVA3dFJSQ3Nl?=
 =?utf-8?B?QlRlZlhFWERpU3YyaE85S045V2VzM3VXd2EzSWdjVnZuWllvZlZQTVd0OTlB?=
 =?utf-8?B?S3VIdzQzeWNYV1hCcTk4ZUNNNnNvVC8vMHBuaHRESGF4dzcvN0R4UVFUZ3FP?=
 =?utf-8?B?KzEyU1ZnU082aW1Makx1RGFENEVDLzg4VzVqQmNKRytOVklRMzV0QWdGcjI2?=
 =?utf-8?B?anQ4YjlFREtBYU5qbUE0VzBFcTJqekhEN25rR2lVMnJIbW4waVhNazJRZloy?=
 =?utf-8?B?WmZLdG1uTVpJZFBTRUQ0YnF6UkpuNU41MFRoSXBoaGVNNkNidDU3L2MxYjhF?=
 =?utf-8?B?MDdCQzk3SDBGbkxTVm53UUhDZHF1RjBIakRpUTdSRDFZUkpkcmxtNXNNTVBB?=
 =?utf-8?B?cUo1MGJXSlRLQUJ5WXRrZis0RVUvV2FEM2FjV243TUhkWDIzSkJHa3lHS3JT?=
 =?utf-8?B?SFFTNG9yUExUdXpVQ2pwOWc0T2hab2xpWUpDN1dqMENsNURaR2VrTEZLVWJQ?=
 =?utf-8?B?czJpdjVGd0FyUDNLcHhVRmZOUm5HWG5idXJONmJlajg5aTBVMGlMdHlGM3M0?=
 =?utf-8?B?SzlTN0luTkxHOHZOUzRRQnJiWmkrOHJMK2hVdjd4MGhZS3kzZXowU2FnTnlJ?=
 =?utf-8?B?YW1rZ3l2YzBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2RFalUvbXBFV0EyMGFudEovWGJ0TEJSY280aUxqZHVkODVHSzdlYkp3Yk9I?=
 =?utf-8?B?eGE2c3NrUk5CTUFraGM2S1E5Q0dtWGJueEpsUlk1UXBhdG10SEVqUzBpc3FE?=
 =?utf-8?B?a0tJSXhRUGVqZ2hUUHpuWXVkNHhsdlBvZzFVdVhiam42VTUvejVDOGpNWlZz?=
 =?utf-8?B?d3A1eWNGUDhHOWdzRnhNZEJBbUhlZUxlZFN6TFhmN0dZWXZSTktqaEpzZXhu?=
 =?utf-8?B?MXR0dUluYWhyUUVJanlKTEZQOUpRQ1EvVGZwcDBNM00veG9VL05kc2JRcFAz?=
 =?utf-8?B?K0lOREZuZm5xa0hzbDQxUnNmbEpDUTdtTDRkM3U0NFhadnU0NXY2b1MzTUVq?=
 =?utf-8?B?OWpMSW5xenhhL3Bib2Y3Uk5hS3JrVkYyMTY3WTlxaUJ5cWkrM3g0bTdPejIw?=
 =?utf-8?B?ZFJRMWU1dnlsYXROOHpPcFhnMlU2YVFLbVRFN2VtMFEvaDRSK2Q3UUdVTzVh?=
 =?utf-8?B?aEY1N2I3ak9oUlB0a0xDai9od3RGTmsyZWFtS29BcmJWR1RPNXI5Vzd2Rmt5?=
 =?utf-8?B?ZVlmTmp4azNNUElvODlRNTFsYVhFOGNXdURPSVh3N0hYaDU3dDB0WVFWMWpy?=
 =?utf-8?B?Yzlyam5RaFJJSmd6ejRRbGJrK0RKVnA2bnprcmFZUlJwMEl5T2FOSGhsTGdK?=
 =?utf-8?B?QmVtaWtobUZ1OGMvU3VmeThSQXJkcDM2M0pYL3RkSCs5UzBCcEhPRWNJRFZl?=
 =?utf-8?B?U0VYL0lUNVRsdUJubFdGSjlNMUdOaGROSmJtSW9hSWw1TlpNelpVc21lMGtm?=
 =?utf-8?B?RVdpR0pBMlkzMUh2QUZRU2piOEduVHJvNWFWZEhEWStTTnN1RWV0bDBBRHpv?=
 =?utf-8?B?Sll5YWJkYTRSVGVrWDBia2dxcUxFWk9ReWV3VnBIWDVDU0lQYW5RZ1RVRnZG?=
 =?utf-8?B?eFRFWnFHQTZRNzhQTEJZYnpyeUlGVUZpR2FFandXUDBOMm8yL0tmc2YzQ2lN?=
 =?utf-8?B?NnRnRkd0R3FjTW1PeVZnV2hOR2VQNVJEYWNZR29aRUNITTBDc09hWUNqaGY1?=
 =?utf-8?B?QmxwVjF2SEk1TUR3SUc2b0drY1k2R1g1ZFNrRG80c3k2eXJNeDhGR2lieHZy?=
 =?utf-8?B?MENoZzVEU2ZvNTd2NGpFZ3dDaFJ0TkhRclptSFdxbkhGaW5zOFQ3VFVuQXlS?=
 =?utf-8?B?WWhnNDZNK0JxZ0RCcFhpRlN1T0NrOUc1YTR3S2JLUXRWRzRvdVZaMUF0ajVi?=
 =?utf-8?B?QmMyM0s2cm5rUTZnZ1Z2WmNROUJKTG5RVWF2TDdpeStEbk5GSU41dGQrbGRO?=
 =?utf-8?B?QWJ2TVJEdjhqOXEwWmYxdEl2WW5GLzdEWWFQSWhEVjIrejJ6ZytDVU1KaUtl?=
 =?utf-8?B?Tm1GV0pGU0VJUEgrL1pzRW8wVmdJTDE3STRpSVZQSE5oTXplMFpaSFZWRFli?=
 =?utf-8?B?QTVCa1hLMmx4MmxQT21sMjhpb3lPbG5Jb29aYU0zL01jazdaa0Frc1ptak5n?=
 =?utf-8?B?bkkzS0t6bHVHVU1xSHQ0aVpkaS9zak90Ym5YaVZsUFNVZHJlMXRUWTVDemIw?=
 =?utf-8?B?c2RGcU5GVXRuOU8rcEIzcWY1VDZNUUVuRysxODJhZ3lTRThSdDdHbDVaK2xa?=
 =?utf-8?B?T01vR2h3Mkh6V0hST2psdG9XTVp5eEg0blB5NU1ST1JtSFQ1a0M5b1NFNXMy?=
 =?utf-8?B?QnQvY1RBbDBQYzRGb0dndmRQL0ltSlZ5ZmhyRlZ4YzZueUZwbGNONzY1UTFn?=
 =?utf-8?B?WmwxcUtNYW9rd082a1hZaHJNUTlCL0VxS0ZINTNFa29yZkY5QWxYNFpPQXhu?=
 =?utf-8?B?b3h6QWZoczVNYmtqeHVGdFZ4VDRYd2E1aHQxRzh4cTRPdXJtRmlYUE1MaEZx?=
 =?utf-8?B?aTl6WnFxajJTTkZHQWRGUTlXRFFiclZNcmovaTRlQkRpNitIZ0JVK0RGd3I4?=
 =?utf-8?B?ajhPOFlRMUJKdXdJZThFQTJSZWhxTkIvRUlhcEZSUW5IMTBpVWdNY0V6KzJD?=
 =?utf-8?B?SCt5a1NzL2ZwQStqVWFjMjVUL2w5c3ZOOGZ5aS9JSCtZdStBVCtoenhVaHFT?=
 =?utf-8?B?bVkrQUFRYnlYT014TU5kVEwzdXZuWmxpcWlFblRoSlBSZ2I4WUxCUmdHM3FQ?=
 =?utf-8?B?a3JJN21YQ2l4ZkV3VFJIdDZDdEphaVJ4bisyd1BscitUZll6Uk9CTVBXbjRt?=
 =?utf-8?B?ZGpLbUNUL0hKd28rdUlqTERkNDdWTUpjczUzU0plRzVJcnd2bXRJZ3V1Z2Zm?=
 =?utf-8?Q?U4YVO7/QyFtouWkQaVF7Zr/saW2vxIGUZHQbUYok5iQw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c9539c-4fed-42ec-c1c6-08dd98332b3a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:46:09.6096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlFIMh0p+1pGqDQaFhFtqNhv5YL16+jUEgVidoXHT27W5SDOpGFjeOLrbjx8Xj3txr/81Rh/Cgpke+avY5R6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Some of the firmwares need to be patched at load-time with a signature.
Add a couple of types and traits that sub-modules can use to implement
this behavior, while ensuring that the correct kind of signature is
applied to the firmware.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/dma.rs      |  3 ---
 drivers/gpu/nova-core/firmware.rs | 44 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 4b063aaef65ec4e2f476fc5ce9dc25341b6660ca..1f1f8c378d8e2cf51edc772e7afe392e9c9c8831 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -2,9 +2,6 @@
 
 //! Simple DMA object wrapper.
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::ops::{Deref, DerefMut};
 
 use kernel::device;
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index c5d0f16d0de0e29f9f68f2e0b37e1e997a72782d..3909ceec6ffd28466d8b2930a0116ac73629d967 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -3,11 +3,15 @@
 //! Contains structures and functions dedicated to the parsing, building and patching of firmwares
 //! to be loaded into a given execution unit.
 
+use core::marker::PhantomData;
+
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
 
+use crate::dma::DmaObject;
+use crate::falcon::FalconFirmware;
 use crate::gpu;
 use crate::gpu::Chipset;
 
@@ -82,6 +86,46 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
+/// A [`DmaObject`] containing a specific microcode ready to be loaded into a falcon.
+///
+/// This is module-local and meant for sub-modules to use internally.
+struct FirmwareDmaObject<F: FalconFirmware>(DmaObject, PhantomData<F>);
+
+/// Trait for signatures to be patched directly into a given firmware.
+///
+/// This is module-local and meant for sub-modules to use internally.
+trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
+
+#[expect(unused)]
+impl<F: FalconFirmware> FirmwareDmaObject<F> {
+    /// Creates a new `UcodeDmaObject` containing `data`.
+    fn new(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
+        DmaObject::from_data(dev, data).map(|dmaobj| Self(dmaobj, PhantomData))
+    }
+
+    /// Patches the firmware at offset `sig_base_img` with `signature`.
+    fn patch_signature<S: FirmwareSignature<F>>(
+        &mut self,
+        signature: &S,
+        sig_base_img: usize,
+    ) -> Result<()> {
+        let signature_bytes = signature.as_ref();
+        if sig_base_img + signature_bytes.len() > self.0.size() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: we are the only user of this object, so there cannot be any race.
+        let dst = unsafe { self.0.start_ptr_mut().add(sig_base_img) };
+
+        // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
+        unsafe {
+            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), dst, signature_bytes.len())
+        };
+
+        Ok(())
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.49.0

