Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005CA947BE
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC3B10E31D;
	Sun, 20 Apr 2025 12:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VKaeaClc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D463710E2FC;
 Sun, 20 Apr 2025 12:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmHbQX9rwW/Pe1iCCwqMC42o5++FJ5KHPErZCrOXrVYwpaTkVeR1GewzowEztzkq+YPlEieUz3l5y93sjEu1wqB99giHoDkOThn2SVuHgzdt1Itma78DoQWq6HF3yoj0n2mhP7vwDfhWh8qUw6F7x29PZrKKda+B8HgtDyGBSFF2ixKp0XjKKZLpsoAwDfY4U0O+Ss3JuLbnE/HbEJ5wMFIDuDzCIT27OnGRDdAyGGvnahA06/eTo7kinr+VS9tm8LX0eViZqwdghBefYRSM+AT0e51lBFvGt0qyQzmXjDKiWgZ36kbfzCbH5kS1mSEKDOXS35xBKTWMKDPbqspmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77KUDAHfqUNHlaHaQ4HVlaOlqj79s+YLxgwqgvvtPj0=;
 b=ZyitemY9kCsvz3aU3PYP3Txi3nnTo8GCC6iRzwSFSz8l0KpexnlTIf2yEvlyR6f995icEp6/vbf9fiErmhnArA+87GhHsy64C/EVk1h57WNzxY3BTJ1oXRWuZb4KvEM6ldi9T3Bcb2S2Ngoef3LSb4FZuzPb0/xVI44SwaphDRS29LJHUYp1HXLt48vi6e9IdEi0qJvzThczr7NKbtPWa7PIUbg1HZC94b8MVvwW9MCJfv88AsgfEqjjl3lVnFKSiUtx0u9PZ8YBmiTPegawW+HtllBc83KH57KvG5ZDJWuHZes5lSJc52MMtQMGztNW/XUml2DlRCgwVDctK640vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77KUDAHfqUNHlaHaQ4HVlaOlqj79s+YLxgwqgvvtPj0=;
 b=VKaeaClc7JlTa0y8mXNlwRBAOz2CLj6K6dQ2A5NASNXDRY4En+7yfS0fvRh2J4Mdf9AutqwnoOmYH5k+oQued+5s9BYLMczS+TwiPy4uOpLu1IgR3/1xOiREJrbENPOtBnW7YpQ3TLbkxong81a4oAABzI5UQz0WZdRZ1lT8l2kJREJrTg4SU8cYu1TcdCEYQJbzQWdR+o0G9X6LqKKFIPf2oVmCPCnNh1ioL/BofM7E1p/vZx57sjy0l9XVYFLQ/600lEP0O8YGXUV21FN7gWOQGDaoNLPTCSB0h7YUj2Z4f9fjVsIAnUp2phVoJmTD4CUkgjUSlXEaHBfv7+H9Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:46 +0900
Subject: [PATCH 14/16] gpu: nova-core: compute layout of the FRTS region
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-14-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
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
X-ClientProxiedBy: OS0P286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4189c9-aa0b-4a77-3286-08dd8005c2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTFQZnpGeE1hTnBRSVNMNmxEUERmeU5VV0o4dGNkbDlOWFZJQlUzZ0g5ZzhF?=
 =?utf-8?B?bzZtZXpwTGtMSFlaZTBmNkhJbUEzQm1lZ1VPU3hOcXlGeFlJa093QXVPb1VY?=
 =?utf-8?B?UTYzZ3dxZjRnZFVtVVFFTUVLNnRmT3BSdUVLaWJ4V0hDVUY3UkV0TjVuRTZT?=
 =?utf-8?B?clR5SlZNYUR3V0V4N1Y1M0FwUWFyQmZ6N21wNllZV0ZqcXpSV1h2YXJzUUpN?=
 =?utf-8?B?VHJKRG5lbkJvNFJ0NGNOaGh3UmpsVVpsUE54QlVheG4vNklBc05mWDhObHNE?=
 =?utf-8?B?N0QzM0EyRVJlK3NwMHhjbzBaZTFRVUxxcWtpQ1ZvdVZ0d3FDUHVzRXduMmVH?=
 =?utf-8?B?d2wvdlJPMGhVZnRpMU9kS2xZak90V0N1bU1zdWJleFRqdjVkZmxQZDcvd3Jw?=
 =?utf-8?B?Umx4KzVOYkV6b2ZpUjQrOHNNU01hd0pVMmY0UWMwYmRLVlNxWVJvVkZjV1kz?=
 =?utf-8?B?UjFmYnFQMjhiMXNkcDZaSStSMFh6RHBGMkNiNjkxT3dReGpXUjVuR3Mrem02?=
 =?utf-8?B?bTlFNFhBOFlOUHMxS3hwU2pLaUhVU2MrSzVQa3U2aE9OMWl5NERMZ09LTUpW?=
 =?utf-8?B?akd3UTZJbFRRT2p4SjJ3QytEcnpuV0t4Nit5QTR6NGlVTFRwaXFvQnJxcjc3?=
 =?utf-8?B?ZmpjbG1NZmNsb1d2RUczd25TMkdiakd6YzZTaGxzaDlEU0RBeFhYTHU3b1Z6?=
 =?utf-8?B?KzJscWw2WjRuVEJZQk1RVytZMmc4TTRXMFBHTTR0MlVScU1LS0grSFh4KytY?=
 =?utf-8?B?Zy9KaWpoejE4VmpLajB2dVQrWnErNTB3bDByaXZBN1NYZjlFb09KZ0o0K2Vr?=
 =?utf-8?B?NWpEVUc4V2o5ZzNmM1p3eTlSQkM1cUh1amw2eTdyUjNuV0lwMWhtVzJIYWVK?=
 =?utf-8?B?amZRWXQ2c3lnblhoVW55WFFLaVE3VXRGSFFsNHpFam4yNURzK3lJMnpxN1lo?=
 =?utf-8?B?YVhTbDh0dm00czFkUjVHWS85bEgrVSt0Mi8yUzNvcm5nbHVrZjVMQmZNMlBo?=
 =?utf-8?B?MnQ1UFpyaDBXMXhGQ3VWRTA0Z0czRWNrSGFZMmNsTzRueFNCT3ByQ3d5VTh3?=
 =?utf-8?B?YmVrN1lSbGpxK3NLVG9oYTFZa2FoY2ZCeXVDdXcrM0tXSmdaR2xXelRzUGMw?=
 =?utf-8?B?Q24zVGpFRERLakF4OHp6Ny96NDNWdlVwQW5jNCs1RVZJZjFHSm9FS0xuYnZD?=
 =?utf-8?B?dmc1dzFSOW0yOGpMK3BqYmpiMlZ5Ky9DOE1pUnUzQjdhNnBwQk12UXpuS0Qw?=
 =?utf-8?B?bmlQemUrYW5MREZ6cHhKakdkQW5DSFFXYmFqdkZUdld6ajBYL1FjeUdnMURW?=
 =?utf-8?B?L3FBQXNabGhlMHVTN2gvbzI5TW10TCt1azFUSFduTmljcVA3Y2RKNkw2RGRN?=
 =?utf-8?B?eWxEUDJOZkE5SzFUN1BBenpNeVorWnFYVFQvaGlNWmdtZm9HUFM3UUFua2NY?=
 =?utf-8?B?d2hubnVTRFY0cUwrQnh5R3Z1QkhoT2FQZ01zSXVGNnh2MDJJV2UvcHVKY0x0?=
 =?utf-8?B?TWhFWkRYWmVZclBoY2w3WjF0YmZQRnlOT3dDVzAwQVQwVFBhYTQwQXcvSmo2?=
 =?utf-8?B?T1BhMUZQRS92blYzOXFnZ1FNWDhhMjEwY0RmSkdCRXg1MlV6MC9HTUVkT2Rm?=
 =?utf-8?B?MkJZSlZtSGRRSnNGbzFLNlp4aFA3dUJqM1dibUZsN3BOOU1uRlJSa0RZaUE0?=
 =?utf-8?B?NFh4b3dDTHYwL1ZPaXN1Q2c2cHZ3MGxEV2NLcmNBdGpCMGVJZWlMMnNKKzNC?=
 =?utf-8?B?OE5pZi9Ec2xtVCsrWTNSdG1hTVdQWDRqdXJ2czlTR285cHgxY1dOZnB1V2k5?=
 =?utf-8?B?cThkL3Q0MzR3UWxENmNOSjhJOFZTVThzZHN5dW5rd2JvN2s1Q1ZLbHlHTjFs?=
 =?utf-8?B?V3NFcWxlNVBDejdBejg1cHI1TVIxZTBMRUdNYVdMa0ZwdWhWdUMxaEJseHVY?=
 =?utf-8?B?TmhUNmpqQ2FXbkZHQ2xYamRzQk14cEU4Z0VXTkxJZUxETnhLeW1lbGxJM0Ja?=
 =?utf-8?B?TTh6UVVTeWtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVlLaG40UzlHS2lkbk9kRTFmWTJMRjVac2w5aHpUQzZST3Bid0g4Vmo2eFMy?=
 =?utf-8?B?Ry9Hc1d0R0h6amQ1aFJPR0QwUzRtQUhPNEVTU2NGWEVvdURqSnhWNkpOOUFM?=
 =?utf-8?B?cmZFK1VTUjdMUU9oYVdYbnRCMWd4SkJWREt2QzlQUHNudVMzSmtnNUpHRkZx?=
 =?utf-8?B?Y0w2OXlkK1FoalpNa1R5Z083SFRWZkV1SzJ6dTlxOUhMdjNVTXN6NFBSbGtH?=
 =?utf-8?B?UnBLR3YwcWpOZzRveXgwSkVvbE5WdlBtSUo4YzFkdXlqbmRJVGg1blVQaWhW?=
 =?utf-8?B?OHBIWFhXQ2hNVWtDL3ltWlN3SGFZSkNYYTZ0aVlUN1Vlcnc2dUpLNjltc3Rn?=
 =?utf-8?B?Z1BrZWEraGUrZnFLWFVSRFZIUHpzK2trTk1mbjBYMnEvS255VkRXdWdMSW5l?=
 =?utf-8?B?a2JYWnhoY2hCRjF2MStkS0ZhaHJQR3FQUEk2SFUzdTllU3R4ZUkzSGZkUSt3?=
 =?utf-8?B?N0NhL2V2bHRoMnhXdWVTZzBIckpaYlBJaXV1QWwvN1RPZWRHdjBCUS8rcEpJ?=
 =?utf-8?B?Rjl1MVI1S25UWjNHZWlHUk5FU1BLVzFnNzVOUjlwK2NzTFFqdS9ZcXhvWHRH?=
 =?utf-8?B?c2VNNUNFbTlncXJHbHlDazBMcll2c0JzLzdTOFBweFlPU2ZiK2JzNUJnOWxr?=
 =?utf-8?B?Zks5T2JWekI5OHA2MVZBL2dodDFBVzEyaUtZVndIMEFSWTRhRnFSWWgybkIr?=
 =?utf-8?B?Y1laMVJtUEM4RGpITkFLL2JZaDV5TXpYZkhEcUF5aUVBT3czNEJ3Y00yS0h0?=
 =?utf-8?B?Ri96UFY3cFdMWkV3U3FTRm1GcExTUXp4Y2tsL2JDRnN4aGlod2t4K3ZnZDlV?=
 =?utf-8?B?VWdTQnl0MmlLczlzbnM2UUVDQ2MyYzVHandvUHpaeWJhMHBnYlp1dTBrc2xy?=
 =?utf-8?B?VkFXM2tMVDVjYWkwT2MwLzJubXkyMEpRK2Vjd3Q4OTNCa1BDRmdLTE56eXFu?=
 =?utf-8?B?d1dINjlhTzM2ajdIS09YLytMUndVSS84MGNSdU9iZDUvN0wvTjVCZWhHdDNn?=
 =?utf-8?B?Z1FWUU40Rm9OYzlwWHdwMkhaSFZ3N20yNDZWZFk0OFAraGhjbDN3WU84bVls?=
 =?utf-8?B?K1h5UGRlTUhyQ2lQUDdYelhHbHg3c0tjYUJLdTZ0dGo2N1dhMGJKTTBEYzBV?=
 =?utf-8?B?SDJXdWpFQkY1SkI0azc4b0FxcnI2aHdxL29XQnNzcGdpMjNlZVpEcUN3elFw?=
 =?utf-8?B?dWxvcUZYTkpBcGZUb3VZaWVsbzhUVHYyektQdkI2U09MSUp0cnlNaWVpWGRj?=
 =?utf-8?B?Wk11MFlUcnpMWjJ0T2ZzSW4yc0QzZzhnQzVRNm1QanRDQmUxVmZQS091ZTV0?=
 =?utf-8?B?dzdVNDBmQWJwODkwRmhOWDQ2K25yS3JISWJoVGZkakhNQmlock1FWllMYzRh?=
 =?utf-8?B?ZHBGTlh4MzJOWlUyRUk3UUZMSEF0Z0NTR1lJU3d1K0s3d3kwNjBGL2hkR1RZ?=
 =?utf-8?B?Q0xKZ1A1Z1dFYXRvRjZrV1dGZ2ppZk84N0NmVEZVRnZ1TjFUbm9OV2lDNnRv?=
 =?utf-8?B?RjlVZzM3K2RHdUpMdFpMOEg1cC91WWNFRklSdGZRZFp1ZG4xZTNUTVlYZW1L?=
 =?utf-8?B?ck44VXFyT3RiNUg5MTV5QTNqWmdNdzBXK1I2WlFVZGtTeGdpbW9nOFVnL01k?=
 =?utf-8?B?Um5vVXRpVFJQc0IxOTVDK241dW1ydXV4em5GYVU0aEZWQ1M0MHpxbEdWVWlO?=
 =?utf-8?B?N2J0aEZpVngzWWE5Q3g0aC9UY2FlR0E0YkZqcjhjeVFZaFc2YzZORk1TVTZ6?=
 =?utf-8?B?RmRVNUVnb243WXcxeG0yOXNXNnU4bFNWWlVVbHo1RHVCMGt2Sk9yTTl4ZFNE?=
 =?utf-8?B?eDFZRWlsQUxBRThiS05OSU5jS2lTaWRnbDJuSTY1S20wT25paWJaYWplSW80?=
 =?utf-8?B?RHBRenJLVEx3YmNKNk4vV1B3Q0RrTTJQSW9Tbnh4Q3UyQmNtOXNKOEYwMERo?=
 =?utf-8?B?a0hYNy82VEQ5cmUrdTEzV2pvbGRpaXBreTNLa3Rwa3BZUURrYW5KUHk0bTQ2?=
 =?utf-8?B?bDVYWG80Skp3dmZqUElrSVFYcnFvZXJSWFdCUFRSY0E3SWlVVmNHdmtZQ3BU?=
 =?utf-8?B?dTkxVzJ6SEwwaGtIZklHWEFtYWZxc0wxeFBTV3l5VVlXUU5Ea2U3bi9XU1pt?=
 =?utf-8?B?NVJ5K1lXalJvRnFjNVNqT3pvVGphc0VTK1k5QVB1cHhPa1hkMmhOSnd2dk8y?=
 =?utf-8?Q?IyhwdIHLF9I0LCyYJ0KjocZoRXirAK1SPxsmrkFf0LG6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4189c9-aa0b-4a77-3286-08dd8005c2f0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:39.1353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v84duASxeygktywGSL4N7TtNT3GhyOVrEagkxpl01Rse3SFn5AwXXBGOQhyAEkWgbV8yYopHFykVecYY8q6FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

FWSEC-FRTS is run with the desired address of the FRTS region as
parameter, which we need to compute depending on some hardware
parameters.

Do this in a `FbLayout` structure, that will be later extended to
describe more memory regions used to boot the GSP.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs       |   4 ++
 drivers/gpu/nova-core/gsp.rs       |   3 +
 drivers/gpu/nova-core/gsp/fb.rs    | 109 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  27 +++++++++
 5 files changed, 144 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 2344dfc69fe4246644437d70572680a4450b5bd7..b43d1fc6bba15ffd76d564eccdb9e2afe239a3a4 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -8,6 +8,7 @@
 use crate::falcon::gsp::GspFalcon;
 use crate::falcon::sec2::Sec2Falcon;
 use crate::firmware::Firmware;
+use crate::gsp::fb::FbLayout;
 use crate::regs;
 use crate::timer::Timer;
 use crate::util;
@@ -241,6 +242,9 @@ pub(crate) fn new(
 
         let bios = Vbios::probe(&bar)?;
 
+        let fb_layout = FbLayout::new(spec.chipset, &bar)?;
+        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
+
         Ok(pin_init!(Self {
             spec,
             bar,
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..27616a9d2b7069b18661fc97811fa1cac285b8f8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) mod fb;
diff --git a/drivers/gpu/nova-core/gsp/fb.rs b/drivers/gpu/nova-core/gsp/fb.rs
new file mode 100644
index 0000000000000000000000000000000000000000..63f41dfa184c434aa4eb7d4cb1f5f1e6f0552563
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fb.rs
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Range;
+
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+
+fn align_down(value: u64, align: u64) -> u64 {
+    value & !(align - 1)
+}
+
+/// Layout of the GPU framebuffer memory.
+///
+/// Contains ranges of GPU memory reserved for a given purpose during the GSP bootup process.
+#[derive(Debug)]
+#[allow(dead_code)]
+pub(crate) struct FbLayout {
+    pub fb: Range<u64>,
+
+    pub vga_workspace: Range<u64>,
+    pub bios: Range<u64>,
+
+    pub frts: Range<u64>,
+}
+
+impl FbLayout {
+    pub(crate) fn new(chipset: Chipset, bar: &Devres<Bar0>) -> Result<Self> {
+        let fb = {
+            let fb_size = with_bar!(bar, |b| vidmem_size(b, chipset))?;
+
+            0..fb_size
+        };
+        let fb_len = fb.end - fb.start;
+
+        let vga_workspace = {
+            let vga_base = with_bar!(bar, |b| vga_workspace_addr(&b, fb_len, chipset,))?;
+
+            vga_base..fb.end
+        };
+
+        let bios = vga_workspace.clone();
+
+        let frts = {
+            const FRTS_DOWN_ALIGN: u64 = 0x20000;
+            const FRTS_SIZE: u64 = 0x100000;
+            let frts_base = align_down(vga_workspace.start, FRTS_DOWN_ALIGN) - FRTS_SIZE;
+
+            frts_base..frts_base + FRTS_SIZE
+        };
+
+        Ok(Self {
+            fb,
+            vga_workspace,
+            bios,
+            frts,
+        })
+    }
+}
+
+/// Returns `true` if the display is disabled.
+fn display_disabled(bar: &Bar0, chipset: Chipset) -> bool {
+    if chipset >= Chipset::GA100 {
+        regs::FuseStatusOptDisplayAmpere::read(bar).display_disabled()
+    } else {
+        regs::FuseStatusOptDisplayMaxwell::read(bar).display_disabled()
+    }
+}
+
+/// Returns the video memory size in bytes.
+fn vidmem_size(bar: &Bar0, chipset: Chipset) -> u64 {
+    if chipset >= Chipset::GA102 {
+        (regs::Pgc6AonSecureScratchGroup42::read(bar).value() as u64) << 20
+    } else {
+        let local_mem_range = regs::PfbPriMmuLocalMemoryRange::read(bar);
+        let size =
+            (local_mem_range.lower_mag() as u64) << ((local_mem_range.lower_scale() as u64) + 20);
+
+        if local_mem_range.ecc_mode_enabled() {
+            size / 16 * 15
+        } else {
+            size
+        }
+    }
+}
+
+/// Returns the vga workspace address.
+fn vga_workspace_addr(bar: &Bar0, fb_size: u64, chipset: Chipset) -> u64 {
+    let base = fb_size - 0x100000;
+    let vga_workspace_base = if display_disabled(bar, chipset) {
+        regs::PdispVgaWorkspaceBase::read(bar)
+    } else {
+        return base;
+    };
+
+    if !vga_workspace_base.status_valid() {
+        return base;
+    }
+
+    let addr = (vga_workspace_base.addr() as u64) << 16;
+    if addr < base {
+        fb_size - 0x20000
+    } else {
+        addr
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 2858f4a0dc35eb9d6547d5cbd81de44c8fc47bae..b78a71dea6e10707dc594fdc070b71dbb663e505 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -26,6 +26,7 @@ macro_rules! with_bar {
 mod falcon;
 mod firmware;
 mod gpu;
+mod gsp;
 mod regs;
 mod timer;
 mod util;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c76a16dc8e7267a4eb54cb71e1cca6fb9e00188f..3954542fdd77debd8f96d111ddd231d72dbf5b5a 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -38,6 +38,12 @@
     23:0    adr_63_40 => as u32
 );
 
+register!(PfbPriMmuLocalMemoryRange@0x00100ce0;
+    3:0     lower_scale => as u8;
+    9:4     lower_mag => as u8;
+    30:30   ecc_mode_enabled => as_bit bool;
+);
+
 /* GC6 */
 
 register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
@@ -49,6 +55,27 @@
     31:0    value => as u32
 );
 
+register!(Pgc6AonSecureScratchGroup42@0x001183a4;
+    31:0    value => as u32
+);
+
+/* PDISP */
+
+register!(PdispVgaWorkspaceBase@0x00625f04;
+    3:3     status_valid => as_bit bool;
+    31:8    addr => as u32;
+);
+
+/* FUSE */
+
+register!(FuseStatusOptDisplayMaxwell@0x00021c04;
+    0:0     display_disabled => as_bit bool;
+);
+
+register!(FuseStatusOptDisplayAmpere@0x00820c04;
+    0:0     display_disabled => as_bit bool;
+);
+
 /* PFALCON */
 
 register!(FalconIrqsclr@+0x00000004;

-- 
2.49.0

