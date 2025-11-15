Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF72C603E2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 12:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9F10E080;
	Sat, 15 Nov 2025 11:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o3Gp9net";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011048.outbound.protection.outlook.com [52.101.62.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA1C10E080;
 Sat, 15 Nov 2025 11:27:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIQlqUyZfAuldmdTmtN9Q7sS6kdD3v4cuWVDeSfzIIrzSfbzNPdc1f74QNtNOtR6ZUbxeVYF1eZZay13gVYyberqwXCo8hJMnB5DO60jIzX5mHJzcKNmdCOC7XTQzquCIh93uHxaTSOPcw36SiLgWzWXzq8pVBGZqtDAJPvYUFapEtMwVd/QagrXZFBVKy+rg57Ju5qQ/k9xOvDU/I56LFsUsLvquUfw0BDHh/Bv4tDGefS9WtGb8Xyv94g1nwG09V/2tcDPwZBsmW0ptK1sWIlsO0G3PSZy2GyiARsTdD7Kay14q5PAja1xF4Fl3Yw1ENbZRGGSFpzKgR1AopE4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYc9bYRaiq3veoVJf98FnkZ2q9tIVBtXcGdt+i4wj20=;
 b=CiYbeyfz9i26zTyrC0hNHn7DuR2l6kGjv4DeV/J/GL4mb/ajJ44FY7T3EZR17B8geHb+RxrPUf8wKg2/lYC6CbVsdMDtO33H9dPI8M4KFLRFFNL8sg67IceQIljNUT0ATtjOCrlFPfCVeSETmTe4fBy9GZ28qOUgkQbDBAxnWDp/PsVB7BtCsc4BkVRcTI8RfE1PriN9gACuurOFbpu6y5kCXFFhZfsWDQ9DjGcuIPEcAKQN5/5o95tq0lsEJEanAL6RD3yPXBKA+rQ/RtdqEUjTDSaYzzqmFRkeS1gsTBlvPoD76WarIeG/lp3uUPmmx1AZ4zFeeFhiXoBWSueXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYc9bYRaiq3veoVJf98FnkZ2q9tIVBtXcGdt+i4wj20=;
 b=o3Gp9netq6ne3DyujHQwVa0A/n4xnQQdhOs27rcG//89yeyrzMsQ2MI5/wq36pjaEsIQ1xm2PJ786i2S1cQSFb6R260U/WrPW1bnfFo6Lkmlqxjysf+rBpQRe6TVQOhzvSj0RAisyS8gKO0OUAq5ENnm7HBVZ6SIGrgbIhmwUEHGFHtFPGz/50HmpcgYGOiMcHJ24H5vukdzqlO5QsPHRmWe76MJ+2WNEAw+vOWse6VZxp3QwZUudJz9TnCR3EPhT6uBYwoRKYkkQ8p92tV+h2CXyzHCiTTVj2C32KzRasHdP08HTt9+rUzC5g/YUsOq3wS+zqrrt/XM39fvrzN77w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.19; Sat, 15 Nov 2025 11:27:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 11:27:25 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 20:27:18 +0900
Message-Id: <DE98DJVBAXAL.2HUDNUC2SE6MM@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, "Lyude Paul" <lyude@redhat.com>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 03/13] gpu: nova-core: falcon: Move mbox
 functionalities into helper
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
 <20251114195552.739371-4-joelagnelf@nvidia.com>
In-Reply-To: <20251114195552.739371-4-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0096.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::12) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 1198a8fd-db36-4a09-9e0c-08de2439f129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2xkTTNDZjRsazBaLzdnM2ZOTjBTcVNaemNENEJTNitDQzEyc1Y1S09XbWs5?=
 =?utf-8?B?YkJETlpTZkhwNDZ1eGpRZEJ3WE92aVJaenczU1MvRk1ueXFvRnJTdFpjR0gx?=
 =?utf-8?B?TGdFZkNyYW1VMENtWXZHWDd5TWtCOEpNTU5PZ0RzLzNqZFQ5cjdjdk9wU3dP?=
 =?utf-8?B?ODJtNFlYZ1pEUDhHbTJneXp4MVE4em9aZkZkNlFDQ210QWFkd3dFUGVVL1pE?=
 =?utf-8?B?ZVU3cURKZEFuRWNUeE9yWUFtMXA2L1h5aGdqd29SWjlIbWpSeUk2WTViUUR4?=
 =?utf-8?B?QU9sY3d5Y1c0ZGI0T2pob3N0cmo4TDdtTjVUNmlwVFFxc254TkdtNjRLZ09D?=
 =?utf-8?B?dEFlYi9RK0U1WDdKNmQ4c1gxNzhkR0w1VmVLWmpvVURrNmVQK2k3eTBxcjVj?=
 =?utf-8?B?SmNZb1I0R0p6YVlRSk5MY09XQXBZWDFmeVVWMDRidVBQRmM0VHhPck9CbCtC?=
 =?utf-8?B?aGV1VVM5c3dlUlJwVWRPS3pTSkFyMFpVcUpWVVREOTB4Zzg4bnBkMW5ZaytR?=
 =?utf-8?B?ZldYWTlwbmJYMjFWaFdGYSs3SStQcjZiWkFtRW1NNVZ1bmk0SUVUek9DSmpS?=
 =?utf-8?B?L0ZxZHZKUGMvaGdmdmY0RUQxVTZFZkM5VkR3MkpES2tydW4vR3dxeVZ4dnY4?=
 =?utf-8?B?dm8yT2swWVNrMFN2SENKRjdEMnBpaUkzSnIrYkwyTHVHajZUQmpDSFc4cHpm?=
 =?utf-8?B?aUFmL0U0eUNnQXl3TFdwRnQ0UDFtc1lHVkFpcVp4N2JHTlhVYWtmNVZpblh2?=
 =?utf-8?B?cXZmZDNGOVJaL3FkUmVkM3J6L0ppcU1IU0tDRTl0L0NVc21VU3RaamZXRDJp?=
 =?utf-8?B?R1VISXcvY2EyM3VRM3Jaa3BMYWxFN2ZOUkJ6WlduOXR1Z2hRUi9UZExad0RR?=
 =?utf-8?B?elVhSityNTAxbTE4ZUpZaThTN25PMUxCbXN4eHZYL0NYRG1zNUxDSDhuY0RW?=
 =?utf-8?B?R3EzZ29aUmtaVDNVQ3NyWm9SOGY3LytQY1VLTFVTRzFER3g1NVdnM2VZRkVE?=
 =?utf-8?B?WWhyQkhsa0E3OUxpaFJhR1Z0Nkg4QmE0b0RDVmx2QllTWkhoSXk3My9CNXlH?=
 =?utf-8?B?cyt5YjVIcGlHYmo3bU9YY05oZnNHcldIZThCYnYzZlNLa0Z0aEU2eVJUY3l0?=
 =?utf-8?B?cTNIbXNyM2FEZVlvWHlWVEs5NUMzOEdBVzRXZzVOeldCcmFTcXF0dmJ0NTZS?=
 =?utf-8?B?YS9HNG40MHc5eis0NXQ1TmV4dDdqL3R1anBidHRKNXJ2d015ZU5uWkRRNlhC?=
 =?utf-8?B?SStnS0ltb095WTc0N3FYWUlyMWh6NmN5UnF3Zmx4V3NQL3F5b1A0VEtoSFRB?=
 =?utf-8?B?UFdlREQ2aXpZTEhXbk02YzZqa3RJbzh2NHBLSUh0eTBWTU0vY3lybEZrSGdM?=
 =?utf-8?B?ZWdBUVVQZUJ0dUdmbGF3Tk1hK3ViU3lPMDd1azhmZXppQy9CUmQ1NHpCMWl1?=
 =?utf-8?B?OFE1eHkrak5LYWJoNk45R04rTUJ6L1pubHNsaWsxTk43L0d6R0Z0aFVYUThP?=
 =?utf-8?B?RFhmclgrZk9EbkZrZE5FQVh6RnZIQm8rZmVkdGN6dFloNERrNHFYRjd0V3d6?=
 =?utf-8?B?YTBRbTNJY1VwRXlhOFdaOG05a0tqbVh0NGJCa0krbExmeWIvYTFIMFFlL2N3?=
 =?utf-8?B?bkpHV1ZodktuRXNtejhDMENMK2NUMUc4ZGN5S0dJVUtJelQrbTJBRGZrQ0tm?=
 =?utf-8?B?NVpnRTFpK04vSThCTGpPS1k5RVBJSGk3aktqeEROdmFvcVF2MnZDcm9qNk9I?=
 =?utf-8?B?T0k1TzZ3ZEZ5TGRiY3c2dlhBUkJQN0ErOXZXa1lOU2VidlVRN3ljZVl4K245?=
 =?utf-8?B?SEZNNHNIaHhFajY3dlpMNlhvbW8xUyt0UVA4bTBLNG1MRmpyT1JyeUhzRlhq?=
 =?utf-8?B?em1TZXNUWjlQYmRzL05VT29KVE9WNFRscENUZ3BqK21vcnlDcytTSnlFOGNw?=
 =?utf-8?Q?eNKJVf27wI6lNZ21R9Nv9VepwvTRzYYI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2lSZjNQd0tOUFZobFV6NzVJaXQxS05UVnQxM0kyMkI4SGMwVFZmVzJ0cVVS?=
 =?utf-8?B?NjI0YVdYdWo1QXNCOFdEdW90OGlkazZmaVliOXEzeG5ndlUxajhYRkhGVHg2?=
 =?utf-8?B?WU03UEdRMGppTVN6U2hnVFMwQUVySVFUVXRCMXhqdlVnSFYweDRoTGI2Z0Ey?=
 =?utf-8?B?a0FWa2hKVmY2OEVPZHFwU0xoQ2R5cmcwL1lacHRqUE5reU40RytwZ0dKcnIr?=
 =?utf-8?B?TlVxUG5Ic3NFbkVNaGxET2VLWEpQNmMva0hUbFZ3SjRXV1d4M0RkTTNxL3hN?=
 =?utf-8?B?Ti9OK3pwcnU4dWRRelZGTmpJQURXWkQ3aUg2eFNLR3E5dzJmaWNaU1k1dmVW?=
 =?utf-8?B?Rnc2ZHNvMmdrMHlDL2N1a3REVjJzblNkRWtkMk40dkw3THhsaFZBVkJUZGhi?=
 =?utf-8?B?T29hRnlITzFmdFU2eExpclNCeDRHRXF0Z1JDK2grMEJSd0NyUCtPUXVrVEdR?=
 =?utf-8?B?L0NnWkZ3WWJlbjM4UTkvc3N4bDJlNEoxdWdxTk9YQVFOUHlhTi9DQjl5emlz?=
 =?utf-8?B?eE16N2ZXYW1KeFpVVmJWU0prTExubnVlRWYyRnNrQ3JiY0RER2ExS3BMUmZF?=
 =?utf-8?B?b0hJbkpRMkhIYXF1MXpyb25HWUdTaTM5OGVNUUNoNjhIRisvbTN4SXBha21M?=
 =?utf-8?B?Slg3K0xTYW1xQnJDYklVT0x0OXdHMUJqZUk0aytQcWpnaCs0R01qV21aVlJo?=
 =?utf-8?B?YVk0d1pZUmxYdnhyd21QdllQS3F6Rk9yRUR4VmJwcDJwMzZPVW1KQjhXQTN1?=
 =?utf-8?B?ZmRsUUV2d2FRNWRXazlDZUsxUVA5UEZCRVQzVGZLRkxMRzAvNjlPSDBzOGVB?=
 =?utf-8?B?b0d5Ly9iYm93clBrcitGb3ltZkc3WlNCVDd6RDRucjBWdWdKUlFpakovMVNP?=
 =?utf-8?B?OXpwaXZ0cnhaL2I1cG00MVk3T2xHQ3VTWHhDQnZZWHR3WE11K1hDcEZHTEhy?=
 =?utf-8?B?bG5Qd0RLTmVyVXphM1RtL3NDL0dIODJLb1NnNjBFRXNMWEQrOW0zTVdFUjZo?=
 =?utf-8?B?WWd1b2k4QjhaVmc4aWZHZ0tSUGtzMVJaVlRoOEh4dE5nN1pBKzRIZHRraDYx?=
 =?utf-8?B?TjJYbGE4b3lidGRhS2JPMGZKZ3QvckhYd2l1ZW9wSyswOTNIZEExZDkyYWVa?=
 =?utf-8?B?eTJZb2wydmI4YzNXbXpVNlpiS2U1S1BBTDNVQmE2bTdHSkM5dnhNZkJ4dEEr?=
 =?utf-8?B?SG9sc0V4T01zaUZMclprOHhTN25XNjd5a2lHZmlLRXNMdnFLZXhFcG9tTHlR?=
 =?utf-8?B?WGRKNlpxSDFZN3dIajdtWUdNN2hPK3BmSXhJZUJXVnQ3SVlNUHN3SUdOaTZJ?=
 =?utf-8?B?bjI1K3paU1V3aEU4SEgzZXlaWjd2QjJLQURia09rcm9UeEtwNTk0K3orUDNZ?=
 =?utf-8?B?bDhmMiszeUE1cExRd3U3L3FqMSswSUo2eUJrd1BlLzg1U0pJZG5VUjZTL1lJ?=
 =?utf-8?B?MmFJanZ0eEJBTDRTVzVVVmRXbVJVTUZFVC9UY21DZnAzeUdXcmFtSXY5b1dl?=
 =?utf-8?B?WlVWS2ZKLzVKTVE5WFhaM0cxcC91anFkVHJzZmorbytCa3VwRjJ3bzF1YjFL?=
 =?utf-8?B?eDg5VVhQRWNzRGExanFNYnlNRkpRVHErS0pneDFiMlVyNk42UlBSblgvMFpv?=
 =?utf-8?B?aHM0bXBUQTdxS0w2MFJzOXE1emM3aXF1dk5KNTNSUmhPR2hVbExzcmE2b3RE?=
 =?utf-8?B?NTltdTYwZEdlZCtWb0ZFWTZ2MlhmTE1xVjZGM0xYMkZUdjhhQ2xvK1ErVUQ2?=
 =?utf-8?B?TndaY0Nyc3NCY2x5dVR1R05MdGlTQWFPSVIxcTZRc2pYWjdrZmg0NlhpZWVC?=
 =?utf-8?B?WnI1dlBGUUd6WnNaRzBCT0tYSTNhdXEyTDN5MWVJZ2dYNHFSK2JVS3NMYzJG?=
 =?utf-8?B?Q29ITDVjdXd4SzdrSW9mWnJTQjM1T1RXQy9ReVUwWmovNXJ6V05RRnJGS05i?=
 =?utf-8?B?UzJURWZJdVVHUzE5Y0ZJbzlGNG1DM1hnVi9KeHJ6NkJQREF3VElsTXBZMjYz?=
 =?utf-8?B?NHZiSU1DOTM3Wis2TW5Sb0tLYk1yU09QZ0YzNURZaUJaZjNkR1M1NW5xSU5D?=
 =?utf-8?B?ejZtS2EwczhRd0VoSU44K2pUaEdMQTEzdGxQemdLdHRwRzVmbGxoOVVZdFcv?=
 =?utf-8?B?RmtPSFZaWEVMbHowZ1I1MFdIOFUzZXVnRFYwUTN6YXo0YmhmK0laWmdMOHdG?=
 =?utf-8?Q?gxawbQJansPRN25EHmUCaAj5lG091ov3eXv00bhF+AVg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1198a8fd-db36-4a09-9e0c-08de2439f129
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 11:27:25.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCnDVU+BuuKWHOnAGqb/C8U3BllQuGdJBTfXj/w2QqJ9NiIhbObtPbHsrrye029HaK7SshR/Yf5C6G40H7bA/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010
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

On Sat Nov 15, 2025 at 4:55 AM JST, Joel Fernandes wrote:
> Move falcon reading/writing to mbox functionality into helper so we can
> use it from the sequencer resume flow.
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 51 +++++++++++++++++++++++----------
>  1 file changed, 36 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 30af7fc2814d..5c9f054a0f42 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -578,19 +578,13 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()=
> {
>          Ok(())
>      }
> =20
> -    /// Start running the loaded firmware.
> -    ///
> -    /// `mbox0` and `mbox1` are optional parameters to write into the `M=
BOX0` and `MBOX1` registers
> -    /// prior to running.
> -    ///
> -    /// Wait up to two seconds for the firmware to complete, and return =
its exit status read from
> -    /// the `MBOX0` and `MBOX1` registers.
> -    pub(crate) fn boot(
> +    /// Writes values to the mailbox registers if provided.
> +    pub(crate) fn write_mailboxes(
>          &self,
>          bar: &Bar0,
>          mbox0: Option<u32>,
>          mbox1: Option<u32>,
> -    ) -> Result<(u32, u32)> {
> +    ) -> Result<()> {
>          if let Some(mbox0) =3D mbox0 {
>              regs::NV_PFALCON_FALCON_MAILBOX0::default()
>                  .set_value(mbox0)
> @@ -602,18 +596,45 @@ pub(crate) fn boot(
>                  .set_value(mbox1)
>                  .write(bar, &E::ID);
>          }
> +        Ok(())
> +    }
> =20
> -        self.start(bar)?;
> -        self.wait_till_halted(bar)?;
> +    /// Reads the value from `mbox0` register.
> +    pub(crate) fn read_mailbox0(&self, bar: &Bar0) -> Result<u32> {

None of these methods can ever fail, so there is no need to return a
`Result` here. I'll make them infallible when applying.
