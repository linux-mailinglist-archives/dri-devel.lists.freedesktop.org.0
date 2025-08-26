Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1962B35282
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1319E10E374;
	Tue, 26 Aug 2025 04:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DuF5MXzr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BEC10E2C6;
 Tue, 26 Aug 2025 04:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2BfcEBrjg6YRGkzT3YMAxA5Kg9ZsxTb50sE53fMKmo1ZOpuKTC6pUz4MrkHZ+O19Wegj7j1noLWln9+IC5xc6LDQmMrJu78jThomaiRt0mCepbkgf7PdiGPaSTaxWV1v4l+5REH9uzHiIPlNcitDfxfalypnGTb6/Q0WAfWI5guOTi3A/OunEF6RXAjYQfAgL2/YvrzH1TNV/jbbjeUKPXR/Uzj8nfnfZK4iYYHlQLI8S5JQhXgs7BOgT5lbo60AhJ5imweLLylBPAhuWFRl4d03tdPjS7z+wE+is25EfCfVh2HVzBzPylC3J8bVHP1BSGMWT9fxNwoxojnsNBfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vikp+lOYdjtOSDWpqzGjRJMVd42DJ0J0DAJNTgHKTJY=;
 b=iITcvUiZ93CSWSZedhCKt9Nyozh+8FC7t5D6RelWqcMie+mdF/3La6F+wXHpf2frQgvhc9enHxKmVRTnI5aq50k/fjmoqmfH82igSoo1Ek/Nqf7pE2jheORIB2nhArljXDI1HUbQ6ygTW/2+kNtLhXbrpdoCUS2ivZo7ZNNNQo7KOIEwWMsKHQ2osMkp27ngvU6D2n1oIgJ7oBZ3CgUPxAX8qhwuDDXsqcThv8PEsxEZV+0i8kiHspS0jdeaLYCrCiZFkIbg5I4JRBqqgeqIfDdMdQszuJsrzPNxttyMrbL0R/hA+jhTRFz0nMwlkZszYm2DlPSDMDBVxtEGGUsckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vikp+lOYdjtOSDWpqzGjRJMVd42DJ0J0DAJNTgHKTJY=;
 b=DuF5MXzrCMkxUP3nCceCxIKD5LdZJzLyURXfhSXWnzmmw10ebl6mvhhDhLtFIR+F0D7iymaDfgRsujRmHff4/CYYM0rs0BBdTVKhJm7h9iU/6RHmDsz2M/Dnx5WmL60EB6NHoHrL0THiscEvZORazjLgubPeHky7df2Rd7p/M+uIQoYQ2zTONSjkWp3rmioLIIM/0KGGDplHTmMp3Vw7IYiBu6sX6CGTOK0WTD2m/cZXKN8TfoTfdlpR8EsuozJU0qmsp0Qw92UBnUYgTVWSDXSAHHvFAKNZI5KIS5vmwfvaAoGD780t8MYxLd4Thq2IKwJgklWBXk7TwVf+sBu9sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:07:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:07:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 26 Aug 2025 13:07:38 +0900
Subject: [PATCH v2 2/8] gpu: nova-core: firmware: add support for common
 firmware header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea05caa-4bf8-422b-c60a-08dde4562250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTAwSHVac21vaytMbkoxUWsxMHZOa0JxQnB4Unp3aWowWk5MTkpLdTVVNzFs?=
 =?utf-8?B?MFI5VHB4YzFTOGFjUWFXaUNhaXYxR2lOYjV1NkF2Sy96aDhIbFFFR05rYlpQ?=
 =?utf-8?B?cXM2QnJ4cmpPMDZmblBoNmtqWWJVRENEMHV6K1dCYUIxT1l4aWV5YmVJRWhw?=
 =?utf-8?B?RXdFRGl3Z3VRMlR1ZGtyekR2bUxuc0wzeHZERWc5RGoxaUgyb1pQSHdkN2Jz?=
 =?utf-8?B?QlVQWTg2KzhDMFllY2M2T0FQSlJuQnUyRXR4WTRDcjhZblUzM1k5MmlrWUdJ?=
 =?utf-8?B?ZVd5VUw0bHRHN2liSVJ1VzA4RDNHaHN4K1U4RDIwdTN5ZFJIdE5PVFlhN1ZE?=
 =?utf-8?B?NEFzaU5yYTdHalMyM0RwRXVQeHNZTldVQWRKd2xpMFUwRmsrNjd1b0htdTFu?=
 =?utf-8?B?SUNaKzZ0V05jdlRhZVZoLzNqSUs1YU1TSkVSY04xLzlMNTNnamNlcmlTWk96?=
 =?utf-8?B?UW0vYWhYWGs4cEdVOGF2UE5EWU1CSWRZeHJjeis2c3VUMzlYeE5SQnY2empZ?=
 =?utf-8?B?K2E1VUNjTktDRys0TEpxMVd1Uk1HRzRDVjlEZXFOZm9iVFcxWGdOL1hmODJz?=
 =?utf-8?B?Y1JyWWVsK3lnL2NMWUZ3Tzg5dXdTZkdKSFczUzU2NFFzMGFINXhmcU1DbGs4?=
 =?utf-8?B?YitPaVJ1R0N5bmx2NnpUQjQvMDducmZCL29mUnAzRExtTUtMRmIwTG9uc1Bo?=
 =?utf-8?B?c290aWNRaFpYcVI0b3EzVzRNbm5CY0d5RmFwSm0zbzk0dEYrK3hqWWRSb1R0?=
 =?utf-8?B?SjhtVEIrMUoydjNoZjQ0Vksveis4Z1hkMkVQREdHWldTcWxBYXg3cG5mWmE2?=
 =?utf-8?B?NTVlOVJsRkwvL0krSVE4MHFXazIxazVWcjBsL3lqcGY5ZjZoaWxSNEphS1Zo?=
 =?utf-8?B?VmN6aWlqWUplZHY4N21IWURtYWhKNUpBUmVCY050alY4M0o5QTNtdjRUZVhG?=
 =?utf-8?B?Z0pRMjk1Y1FOVll6YVhkYklWbzNHTXJVSVlXSThXMVZvNnowbVdaV3JHSTBX?=
 =?utf-8?B?b2d4bU5EWWVrd2dRK0RnZ0tONGJpQ2VtbjNnZlluYjA3R3piL3R2QjZESSs0?=
 =?utf-8?B?cXBYY1BoK2R6QkVSNnVscFBGS1FwTldDd1NQS29MSTFxb3IzUE0zbEx6Zk95?=
 =?utf-8?B?b2t4ZXFxV2NjS2hFbW5rdm5HN1YwSUJIdnhXYW4remJIMW9LMmY2Qm9rYndT?=
 =?utf-8?B?RVFsL0VnTXZyb0lJY09RNHJoeCtyQWl1dXdCakxhSnZCbzBhdE1kQkp6ejF2?=
 =?utf-8?B?ZjQrR3YxZGc2QTVGSmVmUUhCdXErQ3ZBUEVvUDVNYVl3ZGExM0pRbG5hTEsr?=
 =?utf-8?B?c3RaRzhNUXZybDFVMU9IR0prcm9XSzc4dzlKN2lRS3AzVVVWRXQ1M1lua0NO?=
 =?utf-8?B?NHR0azdIV0FFUGxTYzZHeDEzbGduNTd2QTJLN2U1KzNTUDJHUWdOejFueGJq?=
 =?utf-8?B?KzlrUVZDOEJ2dGxaU002eE9LWDF5MGQvczQrdWZIRjlZRHFiV0xLZldBbHk4?=
 =?utf-8?B?dEYrNTk3WFNBNUJmcUpDMnpmVnFlQWhpMGR1VW5LMldidXBqYjNPZlBQanhD?=
 =?utf-8?B?b2UwOHQ5MHJQWnk2cTZrV1dBVjlDYTRWbUF2M1ZFTVc1NlJiSlM3Y1pUUWQz?=
 =?utf-8?B?TEIzQ3d0bUlRWXVKcHEwS3FsbDJ3YkxnUWpWU1dmUGxvaUtBWVVjbGtYbTMr?=
 =?utf-8?B?b1QvRnoxQVcxd3p2U1d4YnhwMmRWc3VIeFhORytoN2RSTkhKSml3UnMwOEpQ?=
 =?utf-8?B?c2ZhM3VGMDdIMjJzT25ubnlST3JqZlhzK3c1QUIwZ0hYUCthT1RJeFBaaVBr?=
 =?utf-8?B?ZnhMS0xtSm5JaFdTM3daUUErem9RNFI3TWNJRXF4cWZ2cHpxVFJyOFJlY21Q?=
 =?utf-8?B?azFiRndEQm81cTZpZU5sczA3Z1VwaXAwOU1Sa1R1OGRXSzZNanJMRmxLazlo?=
 =?utf-8?B?ajUwRTNCZ2ZlREdRL2VtRVYwNTZDaUIyZ0tTUHhYWTUrMnpvNkJ1QVdBUTh2?=
 =?utf-8?B?L2hjVmI1Z29RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0lPajFoaEdPdmJsSjFBSE5tOEVLdm9LOTF0ZHFOZkg5OHJ6d3c4ejhSdGxU?=
 =?utf-8?B?ajBvd2dLcmZNdHVjMHV0MVMxTnFGSDV0c3VwcU5tOHBjd085TjI1RTlpUDdh?=
 =?utf-8?B?VExiYU1YQTgwNDZ4Y0N2VVZYc3JhZG1sZkQ5YzNNdE4vNmRKaFpVbUQzVStG?=
 =?utf-8?B?MnVUSFVTbE9tK0h0WCtKTElUMUtZakxrRE9YWklqYlJCSkhkY3JRS0REZWhq?=
 =?utf-8?B?dWI3NHNidis5cFBxSWxuWGhkNld2ek8ya2I1UjR5N0JzcEViVSszMXJVaHpJ?=
 =?utf-8?B?RGpwV0xJUnpQUjl3akJwM1lQNHQ3ZnVyTXBhTi81Zm9jaHJRdk5waHhMRmda?=
 =?utf-8?B?K1MzNzBGSmdqWjZocFFQTnJZazBsUS81OG1xMi9PYXYvZXhXWE82Q3pCSlY5?=
 =?utf-8?B?cDcxUWd5R1BqYUR2eC8zZTE2UDQ2cDdMUEgzeTNxc0lXeTQrL2N2NGFJb2xT?=
 =?utf-8?B?NzRkbUFVNHhuRU5weFU0R3NRZEpBeGhFYnppRUY4WUtUdk02NUFoNjFScHpu?=
 =?utf-8?B?WUFLV082SFUxTWN4c1JObGI1emtkNHh1SnlLT2JmdlJmZk9RT0NFTkdLU0cv?=
 =?utf-8?B?Vm01VDVTcVdLb3liT291NTkyT0JYbkhtRzNYall3eklLdTkxU0p2V21XTFl3?=
 =?utf-8?B?UDRKQ3EyeEZtbTA5Q0MxL0VBZU1qVXRIQ1FWOGhPMVRqQ3o1Yjd0L21YWjdn?=
 =?utf-8?B?cTZsOExYZjg5R0xFTGtkRUJ6bzEyWlRXRFJFWnAvU3ZlVldDOHZjb1g1MXNR?=
 =?utf-8?B?bmpHdlI2bEhzcEwvVjBFL2NyWUJqNERkdEtvUFByQUVDY0p4dis1Ny9sWnRK?=
 =?utf-8?B?Rmt2TmcvRjluVzBNYWloWlJMcTFOOXlvS01MY1pVMWYvR3dPZkZWY09qcXNn?=
 =?utf-8?B?MDdyOG8zSkYzWjlvdXd1SEJhelBoNzdBOGY0MG1IQUxCOVJtclNKajVqODZz?=
 =?utf-8?B?NG1TWjBFR25jQU9zSytCYWxhZytYQVcxRDV2VzhZUnNTb3BxbUxOVVF1VFhN?=
 =?utf-8?B?ZldlMVRpNmUzS0RKN2psNG1zcnArV3l2dWpPM3BwN3JLRHpoUWkrVlZUbWVD?=
 =?utf-8?B?UytUT21nNUJ3R1pvQ1BFSWhGWlZsbmVzSnFGcHl5R2dvYTZBam55K3RtM2E0?=
 =?utf-8?B?RW5aYVFkNmZsclpyRkJ2MzdoOHFwZ0VqZmw5SkVTL0dUMFFmditkVzhZTmg4?=
 =?utf-8?B?QW9nbFA4WVlPcW02TTVzU3BXaVlFa1p6Rjhyb1BUbVFzWVNwV25jTllYL1I0?=
 =?utf-8?B?bVJnZlpyUzFHWnhrNUNrclZWSnE2ME9UY0xJamR2dFNmcjJidzVDVExnN1pU?=
 =?utf-8?B?TVMzNDd6RnAzam1mcVpvak42VmxqY0c0N2xsQ1h0L0RONUN4L1AxMGZuN0M3?=
 =?utf-8?B?eHNIM1lnR3A2d3pRR3N1aTBSRHE5WWtKczlGSG1hQ0t5WktjQ25pdDBsa1FT?=
 =?utf-8?B?bWFkUFp1WGdwRU5kNVd5enNVMS91TDNWOEthTGU2cnllMkp5dkxRUjRIOU5I?=
 =?utf-8?B?YUpGcWloTjU4WWluVEszelJwWFJ3Z2crQS8yc3ZNYVBGbjkwa2RoTDRsbDFO?=
 =?utf-8?B?TkFEUXVHK2RFaXNXWEJQcUdWaW43Q3ovTVdIRkJGSllrZGVHbVRrZmJ3Q1Fo?=
 =?utf-8?B?UW5DbHRHWVo2RWlEcXJQNy9pTUNZVFRiZEpSOTVBSUVudVZqWk94cXhVRGM3?=
 =?utf-8?B?UkZxbW5peTRmNUVrOWtYVU16MVpZK0lNQTRaQit0VzRrYnBlU3gzUXJZM3p0?=
 =?utf-8?B?WGRSbFVFSXd5WEh4NHBYWkxJZ3F5RDBWZGRkMEtZU3g4UGFhYXBOV0xBSERs?=
 =?utf-8?B?RU1qQ1JzcFNVeGNuY0w3dVFmZGRwL0NlNEdTNWs3REV4OTdLdlBrTUdDRUt6?=
 =?utf-8?B?V29kckF6VnJyVzYrYTlJVSszQkcrUStFRlNKa21ZV1YzR3ZDQjYwU2tRV0dj?=
 =?utf-8?B?Y01zUDBWZWI4WlRBRGU4UXFwRHBtNGlpUGVEbnBDMGRMZVljTzQrL2VjNDZn?=
 =?utf-8?B?ZE1aZFdHR3Jxb0Q0VVJ6TWg5VW1nMHpKODJ4WUdRMzFFVllaZWlrOFlVN3k1?=
 =?utf-8?B?SHROYjBKT1d5YW5CQXpmUVhYR0F1aER0UCtEcUV3cW1oYWdoUXArTjNxWlVX?=
 =?utf-8?B?MVpzdEx5OTM3dDNXRXlPL2wwN3c3MFQvUzNEMmphM2VmaDRxNHpXa1VhNGpZ?=
 =?utf-8?Q?/HFPb12MmpHAhEG28apdb1mNuzfXSIouMWXw1aLG0EYP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea05caa-4bf8-422b-c60a-08dde4562250
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:07:55.1690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qm8+kuUyjXqJRwPLtR+uki9oGMi5ATMtkU8eOOktykhy8n2BJvl+1Kd8FbKhNPf3GBChTcfGMNB72uK6u+yWkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

Several firmware files loaded from userspace feature a common header
that describes their payload. Add basic support for it so subsequent
patches can leverage it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2931912ddba0ea1fe6d027ccec70b39cdb40344a..ccb4d19f8fa76b0e844252dede5f50b37c590571 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,11 +4,13 @@
 //! to be loaded into a given execution unit.
 
 use core::marker::PhantomData;
+use core::mem::size_of;
 
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
+use kernel::transmute::FromBytes;
 
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
@@ -150,6 +152,66 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
     }
 }
 
+/// Header common to most firmware files.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct BinHdr {
+    /// Magic number, must be `0x10de`.
+    bin_magic: u32,
+    /// Version of the header.
+    bin_ver: u32,
+    /// Size in bytes of the binary (to be ignored).
+    bin_size: u32,
+    /// Offset of the start of the application-specific header.
+    header_offset: u32,
+    /// Offset of the start of the data payload.
+    data_offset: u32,
+    /// Size in bytes of the data payload.
+    data_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for BinHdr {}
+
+// A firmware blob starting with a `BinHdr`.
+struct BinFirmware<'a> {
+    hdr: BinHdr,
+    fw: &'a [u8],
+}
+
+#[expect(dead_code)]
+impl<'a> BinFirmware<'a> {
+    /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
+    /// corresponding [`BinFirmware`] that can be used to extract its payload.
+    fn new(fw: &'a firmware::Firmware) -> Result<Self> {
+        const BIN_MAGIC: u32 = 0x10de;
+        let fw = fw.data();
+
+        fw.get(0..size_of::<BinHdr>())
+            // Extract header.
+            .and_then(BinHdr::from_bytes_copy)
+            // Validate header.
+            .and_then(|hdr| {
+                if hdr.bin_magic == BIN_MAGIC {
+                    Some(hdr)
+                } else {
+                    None
+                }
+            })
+            .map(|hdr| Self { hdr, fw })
+            .ok_or(EINVAL)
+    }
+
+    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
+    /// the firmware image.
+    fn data(&self) -> Option<&[u8]> {
+        let fw_start = self.hdr.data_offset as usize;
+        let fw_size = self.hdr.data_size as usize;
+
+        self.fw.get(fw_start..fw_start + fw_size)
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.50.1

