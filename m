Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B26AA4D65
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B948F10E0EB;
	Wed, 30 Apr 2025 13:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mm/0J95H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62310E0EB;
 Wed, 30 Apr 2025 13:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ai+AX7gZa6Ah3rRiUayHlHoCQqFrcGTi3yq0WheM0eHkWfCTT+ObmgQnNL42JcLfOcQY897CIrBjTrOnmiUv5562JYBT51V8mrjNhVg2kL36iXXHUGSU5g6FFAThFwieBOiWIQSmiDlavOzKPQSSJ6Akv5de+xo1oJ+QHYvQ9Lbsd6RvZuvHchMml3+nlaHEoIrdTer50JZnWOvW4r3l+RHLPEpt1QapJAFw+VMHsCNk6j1CfwDbPYWhHieRPAbFgaRf+Q9mrQkBbQX7bxicVati0tvV9HDBs+PWJugjUqVn1YfXTuylWuiJdbgOQWJZZlWgji3HPcfjd1WnKMoqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huRjw/1BMjRb/5dEjJHYQbCBNRQyWCrVACkA3qWwqEo=;
 b=VXzIOihlL9CWBrPHRDPnfGVr34xX0xxvire2pAdEyPj/uk0INqpc17MzrUdh8MJUUpQf7JBgLkkQp3ZrIbfLNj/Sot94Tv4PdLiWk/IY508aW0ClJ1144ak4eniDtBKQqBFBoqQ05gWbz0wOLdVQ76uNK3tWFJWP8hiPN3nMxTShpSlatzz4fDA7YKAeLsEzwMLG8AqZrEuh0EeFRYPNfvW1ffTOmk3obokMaQ/enoyDzA9c2ZskYIFsfYINVzMFztRBN3EMbN6EdnzRk50MKy1T+X9kXT8fvE26/CCrekDS+TZ40a0/gjR3+5obIkrL4+Heb/x9EdBlUO+BTNBptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huRjw/1BMjRb/5dEjJHYQbCBNRQyWCrVACkA3qWwqEo=;
 b=Mm/0J95H7O8t6nGfJEYCEYDQ3cpNJhH5oQ7Zbc4s4xf9p+17YsKtA4IuzYpPZ5j6/27TEimj1HhmAHxjwRimzt7Y/QplIvZDXkNwagpmZ6hISTZEt3p/86pNGwygCfbx5DBeAIf3nE7//OxjQQuf6e66jiyoSrAAH9S/cKPE4WXnrujQ1EOhyGNEiugs6sN1V4ssvFVGF3rrgPEsjp0LZd8cHZHyeUEtZeLsJ3/KOrDSJXK5v70tFQ/RyBcQmxaS3j7Z07YqXOtFFZSiRuVCOoL9CYx+hF6yZjNBQJVoJqoiiSwEO8CwTrxgVPt9CUrToDAujaJRqns8tMaXE6b28w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF4D350AC80.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::993) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 13:25:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 13:25:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Apr 2025 22:25:03 +0900
Message-Id: <D9K09AU4KTQJ.3TVVZPMDB0H7I@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions
 and base code
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae>
In-Reply-To: <aAerWF9j5d01pQv0@cassiopeiae>
X-ClientProxiedBy: OS3P301CA0055.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF4D350AC80:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e96d6e-1071-4853-6ad4-08dd87ea6c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVpUR1dOdWIzTGVObzhPY1RLTW9FeEFubFI1WndPOVdmRy9tTTRiNTFJVkZ5?=
 =?utf-8?B?OGdtSXZuMmVScWI4cFlGWlFET0o3TDUrWlp2eXM1Tm1ucm53eGREQW1hTnQv?=
 =?utf-8?B?YWRnaW1TZEtOY0lNQU45dFdKS1ZTaW9kSnRxRjhQWEVJYjc0aDIxdFU3RTht?=
 =?utf-8?B?SzlFWTZqUEdMUVBVa1ZkUG9UbWlDZFFFTmM4SE0vcDlTZmdDRmFFK0Q4eC9S?=
 =?utf-8?B?ckEyQ2hHSHJtbGllYlVTcGNRSC9HOGl5VVhIRDlLMEJGZzVqRkpKNW9nbkEv?=
 =?utf-8?B?WCtiVU9INEJVcklBMmtlcmpaNkREZmp4UmhlTkpBUVQ1SnFJZUJXaVF1SkZD?=
 =?utf-8?B?eklpc0hnRjZsYmhwNmpoMTNxWm1oV2lidWhCWVV3UEJHMmdjQldZNC9YR29m?=
 =?utf-8?B?bkRTL1ZESFF2WW5uRWpmaS82bEt5ZW9xdzlqcmlsUDJpd3pBM1JTWnJ6ZGdC?=
 =?utf-8?B?eXZWM1Mxd0g2R3hFRExoTWFIT1VlYi9OWUIwTFZQZ3AwWlU3UGtVTHc4VElG?=
 =?utf-8?B?UWh2UDJBYlg5d1pMWi9HaWNtaW1ZMFZNL1d2SzExVjcxM2x6dGZKN2hHYlhF?=
 =?utf-8?B?cjVWZUdDc3MzL0w1MlQ3RnBDNVBRWTc0RDFOZkkzSEdPaHR0RDJWeDU5dWtS?=
 =?utf-8?B?eEkwSGEzU1R3NnJVTlovMmtEMDZQVFRUeVUraVFscWtHWG1OOG42S2VDZGs4?=
 =?utf-8?B?aVFqanAvVjQwa242cE1Wam9FaG5XOUJTU0NKYWk5YjFndHhETDZyWGFKamZD?=
 =?utf-8?B?Vk94TnZPYm91WXFoNkkxclRYbDkwWlJUdWxNY3RZN28wTE1nODFJc2lJMnRx?=
 =?utf-8?B?Z2crMCtXdDFOS21yMCtYcEFVVkdUdjVDQUNLY3FMTytORGg2WmdWZmZmd0cr?=
 =?utf-8?B?TGdWT2h5bm1OaGQvSEZpS1FudVVWMEQ4ZldYL0RxVVVUYlNMTytod0EwaVlo?=
 =?utf-8?B?K0NLZkNVcGtPN1RaOXdLUlRmQldsWHBzY08vdmZMT0Y1c0xRZzdoSUdXU2VH?=
 =?utf-8?B?ZTMxTS9vdFprRVo3UTYvcnBGN3MvVUhuZjRpM0Vjd1E4Z2NETjdVVEhsQlFS?=
 =?utf-8?B?ZzJDSnVSdlFSaWpidERwSWdsZDVIcFd0bzBrU0l0b25qMU9HMjJ2dE1maTEw?=
 =?utf-8?B?OVhMcmlsQnpqSCtDd2REbHVxc2tVN0p4K2pEWWxvTDQwQUhyekdqQzVjdElu?=
 =?utf-8?B?SFdHYThSa3VNak9iYnRsTml5U3BPSXU5ckxVQUhDNzd5bFhnbG0yeDlrZFZD?=
 =?utf-8?B?QXloQ0c1UEFoTTJHUUJQT0MwQytkZjZ2RndZOG9rTS9Pd1RLeFRZQzJSTzAr?=
 =?utf-8?B?b1E1ald5Qm1ZT2I3MHBFUytJOWVLWE9rMTlqWHJoS21QT1BLSXR5T0REVVh5?=
 =?utf-8?B?T2ZTbEhwSWZNczlyK0lqVkIxcEo0NmtmZ0hDS0dJOUNmeHMwK1RleEZzVStS?=
 =?utf-8?B?RktISHZ0K2dDRS9TbG5kcGEvUzh0RTdpUlJIbDFSdStMVU44ckJlQW1rSVh2?=
 =?utf-8?B?L1QvQU9qQTdHK3AraFVQMnpnMndITXR6TFREc1Y4T0NSTUhUU3pYTW9PWHNI?=
 =?utf-8?B?MnNuM2hFamNJWGRKTktpVUZaSTFZNXVqNG1YNTdOT1dlZkhKZ0dkQU9nVmJR?=
 =?utf-8?B?emhHWW9hWmFlRVVaWW1BaU8xaDBHcC82bHkvK3oxNjBzMll4cjdFWDczUnpl?=
 =?utf-8?B?Y0xGUEd1VkN0UTNVUHVKZ2UzOHR4RHRaTmRyRTJaY3pWVkxna212c0J6ZS9D?=
 =?utf-8?B?dGdlQXZlK1cxczY0Sk5XbXVHVyt4cFZlN2lxL29kUW5reTFDa201Z2JCU1hZ?=
 =?utf-8?B?djJDK1FNb2lVbTc0REZEMm9WVjFFQ0syOW4zQjE4ZXhwODN2QlJsWFJMQTBM?=
 =?utf-8?B?NlltZ3ppZUFoZVVucStSNlN1YldMNTlDanlwaWd0c21kREhkdzAycHV1RFQw?=
 =?utf-8?Q?LSbe+jwlmjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly93SkhiLzFETW9zWlVzY1VuWTRwcy9rVld2VVVGekk1ZkpKek9PMEhKa3Rw?=
 =?utf-8?B?a1NiaU96aS9yYTZ0dXFRNkRYd21mYTRFZ3dxamw4Y3pVdXg0aHRhbkRlOURl?=
 =?utf-8?B?b2NrNkVTTmJETUlpZGtpblhJd0FjaWdZVm5mT2pWanhhaWs2b2lndWNzMnI0?=
 =?utf-8?B?YlltKzN0ZWphWUF1UnVub0NQT3ZieHh5M3k2b2dZekZLMG9OYXFSdFEzWG8x?=
 =?utf-8?B?Vnp5UFV2M2dVdXRUM2pKdlVPTnhwT3VQOTVIM1VwY2NwYnE2QU9hK0l6eVRt?=
 =?utf-8?B?a3U5QVNubHpkTlpWSEhQS0VKdkUya2lFUWRYaUhzT0RJTkNXMVluZFdPOExH?=
 =?utf-8?B?QUFxVDROVmdqU2duQ3o3NnZhZ3BVM0dGczlyY01xbXk4NlFvRG5RdmJyN3Nr?=
 =?utf-8?B?aVpKSm0rY3ZHaVlyR0phNzRoOWlLSFN2ekFmTHNENE5pVndnNFNoWnZCM1A1?=
 =?utf-8?B?VWdWSytxNUYwOUZTemdyRTBod3pGQ0FtRGFUamE2R25jWDFDR0ZFcnRGQ25r?=
 =?utf-8?B?Zk1RQWJtUnpDRWdsVFcxcTZrUXJ6ZTV1b2FkUitYMXUxS3g4Tk1zM2VJVHMw?=
 =?utf-8?B?K1BXd1lvTE5oLzZTTEtEbmxuS25jbzdNTVliR0kxV0JiUTNkZ2NyVFZIWHNI?=
 =?utf-8?B?eXZQR2FiQkNwZ3l6S09JTm1DdHlHcGw0UURsNFVLYTVneUpXV0kwZkgweUh1?=
 =?utf-8?B?dnhwdy9GVTVxMTZOWnNHNnplMFFxSElVcXBobXFMN2V4NjZmZFpibkV6eTl3?=
 =?utf-8?B?NDR6Z0lWUFFYalB2Q1I0N2UxQW1iOHBORGxkMW5OWXNNc3M2WFJwOFFGVy93?=
 =?utf-8?B?dzJaQlVuZ3NzZFV5cVlpZUxNVk9PdHpFWDE4ZFRDK21MWXJtWElYWmlwMEh2?=
 =?utf-8?B?cEdsemsvQzJPQTBxeG5LRGVOb3QrNVQrdCtxMmM4aDBUbkFYLzZjUGlkaEow?=
 =?utf-8?B?L0J5dVBjUnp0YWxzT0VtallWOVZtYWR3MWQ5Mk1wSElVWkkxaC9zWHVVMUR6?=
 =?utf-8?B?dWMxWWN0VW9EQmxhUUlQenFJb2ZSbFBkU1BLSmh6dHNGNWhFNXJPSVdrT2JV?=
 =?utf-8?B?cEIvbXM5SjhSZmZrR3JHTW1Sa2J4U2NwVm5lTjFNZzdVclBRanpTZ2N6bm94?=
 =?utf-8?B?ZHpncVgyU0R3YllzTGUwbHVLNXBHTi9VL0c0c25mWHJvMkVjb1MxM2xTUUdy?=
 =?utf-8?B?RC9tQlN1MWxDVXBtTXdrSHc3WDZCK0FUajIwZ0FIbTh1YVYvSWxSS0hyZi94?=
 =?utf-8?B?cWR5MWt3bnpQS3A0bG1HbXV5Z2Jsd2FXa1BENmVxUGoxcXhYa0hMYWFsOUJn?=
 =?utf-8?B?Y1B4L3lVZTFaR0xoeVlqNDFWcndMdHo3YWhCU0NMb3JqMmtBWThZbHJFWS90?=
 =?utf-8?B?OFVVdDhQdUJqRHc3N3lVcDlYVWhtQ0w4SlBtV3NhcWpNMGEyUFQ0Q0J1d1Nu?=
 =?utf-8?B?aUNNNUtIbkhSZjRLQko0dTNDU1VnTjdDeStpZm5Tak04TGliVDVxWmpCaEp3?=
 =?utf-8?B?NmdHNHllUWpjd1NVeWhMeVVOczdtT2RoUmRodnJRSW4zTkVDZ01IN3JUbEk2?=
 =?utf-8?B?aUJLNTNIclF3K0p5VlJGTkhsU1ZkelBDWFhYY1lTVkt3eEVWVUZjMnJ0RVcv?=
 =?utf-8?B?dWliLzlTUmUvUjlCSzhxVml0MjJtTkpxdC9LRlh6STZGOHQwWDRTUmRJeUg4?=
 =?utf-8?B?YjcyV3ZBVGxmWWZNMFdQc1RIcFdqR0xJcE1QSXcrR3lrYzBPS3Z4MXVXUjFh?=
 =?utf-8?B?SDJzME9YdkxmdE1KZ0RHVzVud2VTQ3BpM3lpc1FiM1lsM0RzTXYvTlR2RWs5?=
 =?utf-8?B?bW1KUGtqQ3ZvRTJyUFl3RHV2bnpLVkNWRmg2Q2FUbkRrWHE5SU52Q0xJT2xy?=
 =?utf-8?B?algxb2g3VUlpMXYvNC8vSFZpS2p0UUtmUWFwOUtHQTFhTjU1QVBvTTYvNWJD?=
 =?utf-8?B?Z0FNdDdtVnNWZEZva3hTMXdNell3UjQ0MEdDVzZqVHRBOTZ3WnBwNnIxcGVR?=
 =?utf-8?B?cXJHdk5mN05ndHNFNFFzaDVVRjBqbGE2c0FWaXpyd0VuZHNYTmpHdDFRb3Rq?=
 =?utf-8?B?L1BkaDR0dGJYNUMyWHYxSHJReG9TK0VGZFNRaWNWRlpTM1hFQjJQNWQ5L2pX?=
 =?utf-8?B?ZGpwdjM4SmdQZEppWGtKQkZ4QXNXcGRwbE1OMXJrVWJiSk1pVXo4a2I2Z2JC?=
 =?utf-8?Q?rldvldZfjcKzq5OVOBAEgY+oGb3ono/qiUAHeBAniua2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e96d6e-1071-4853-6ad4-08dd87ea6c7d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 13:25:07.4259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31asiCGlU1YiLMKGh6HcDp/jAgOKTQdAYiDacsFYyA0Yi5LEoloZoFGhPTgX3XzKLAX4cyGdUICI9CNroQfENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D350AC80
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

Hi Danilo,

On Tue Apr 22, 2025 at 11:44 PM JST, Danilo Krummrich wrote:
> This patch could probably split up a bit, to make it more pleasant to rev=
iew. :)

Probably yes. I thought since it is mostly new files, splitting up
wouldn't change much. Let me see what I can do.

>
> On Sun, Apr 20, 2025 at 09:19:43PM +0900, Alexandre Courbot wrote:
>>=20
>> +#[repr(u8)]
>> +#[derive(Debug, Default, Copy, Clone)]
>> +pub(crate) enum FalconSecurityModel {
>> +    #[default]
>> +    None =3D 0,
>> +    Light =3D 2,
>> +    Heavy =3D 3,
>> +}
>
> Please add an explanation for the different security modules. Where are t=
he
> differences?
>
> I think most of the structures, registers, abbreviations, etc. introduced=
 in
> this patch need some documentation.

I've documented things a bit better for the next revision.

>
> Please see https://docs.kernel.org/gpu/nova/guidelines.html#documentation=
.
>
>> +
>> +impl TryFrom<u32> for FalconSecurityModel {
>> +    type Error =3D Error;
>> +
>> +    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> =
{
>> +        use FalconSecurityModel::*;
>> +
>> +        let sec_model =3D match value {
>> +            0 =3D> None,
>> +            2 =3D> Light,
>> +            3 =3D> Heavy,
>> +            _ =3D> return Err(EINVAL),
>> +        };
>> +
>> +        Ok(sec_model)
>> +    }
>> +}
>> +
>> +#[repr(u8)]
>> +#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
>> +pub(crate) enum FalconCoreRevSubversion {
>> +    #[default]
>> +    Subversion0 =3D 0,
>> +    Subversion1 =3D 1,
>> +    Subversion2 =3D 2,
>> +    Subversion3 =3D 3,
>> +}
>> +
>> +impl From<u32> for FalconCoreRevSubversion {
>> +    fn from(value: u32) -> Self {
>> +        use FalconCoreRevSubversion::*;
>> +
>> +        match value & 0b11 {
>> +            0 =3D> Subversion0,
>> +            1 =3D> Subversion1,
>> +            2 =3D> Subversion2,
>> +            3 =3D> Subversion3,
>> +            // SAFETY: the `0b11` mask limits the possible values to `0=
..=3D3`.
>> +            4..=3Du32::MAX =3D> unsafe { unreachable_unchecked() },
>> +        }
>
> FalconCoreRev uses TryFrom to avoid unsafe code, I think FalconCoreRevSub=
version
> should do the same thing.

Since the field from which `FalconCoreRevSubversion` is built is only 2
bits, I thought we could avoid using `TryFrom` since we are effectively
covering all possible values (I wish Rust has n-bit integer types :)).
But yeah I have probably overthought that, and that unsafe block is
unsightly. Converted to `TryFrom`.

>
>> +/// Trait defining the parameters of a given Falcon instance.
>> +pub(crate) trait FalconEngine: Sync {
>> +    /// Base I/O address for the falcon, relative from which its regist=
ers are accessed.
>> +    const BASE: usize;
>> +}
>> +
>> +/// Represents a portion of the firmware to be loaded into a particular=
 memory (e.g. IMEM or DMEM).
>> +#[derive(Debug)]
>> +pub(crate) struct FalconLoadTarget {
>> +    /// Offset from the start of the source object to copy from.
>> +    pub(crate) src_start: u32,
>> +    /// Offset from the start of the destination memory to copy into.
>> +    pub(crate) dst_start: u32,
>> +    /// Number of bytes to copy.
>> +    pub(crate) len: u32,
>> +}
>> +
>> +#[derive(Debug)]
>> +pub(crate) struct FalconBromParams {
>> +    pub(crate) pkc_data_offset: u32,
>> +    pub(crate) engine_id_mask: u16,
>> +    pub(crate) ucode_id: u8,
>> +}
>> +
>> +pub(crate) trait FalconFirmware {
>> +    type Target: FalconEngine;
>> +
>> +    /// Returns the DMA handle of the object containing the firmware.
>> +    fn dma_handle(&self) -> bindings::dma_addr_t;
>> +
>> +    /// Returns the load parameters for `IMEM`.
>> +    fn imem_load(&self) -> FalconLoadTarget;
>> +
>> +    /// Returns the load parameters for `DMEM`.
>> +    fn dmem_load(&self) -> FalconLoadTarget;
>> +
>> +    /// Returns the parameters to write into the BROM registers.
>> +    fn brom_params(&self) -> FalconBromParams;
>> +
>> +    /// Returns the start address of the firmware.
>> +    fn boot_addr(&self) -> u32;
>> +}
>> +
>> +/// Contains the base parameters common to all Falcon instances.
>> +pub(crate) struct Falcon<E: FalconEngine> {
>> +    pub hal: Arc<dyn FalconHal<E>>,
>
> This should probably be private and instead should be exposed via Deref.

Agreed - actually not all the HAL is supposed to be exposed, so I've
added a proxy method for the only method that needs to be called from
outside this module.

>
> Also, please see my comment at create_falcon_hal() regarding the dynamic
> dispatch.
>
>> +}
>> +
>> +impl<E: FalconEngine + 'static> Falcon<E> {
>> +    pub(crate) fn new(
>> +        pdev: &pci::Device,
>> +        chipset: Chipset,
>> +        bar: &Devres<Bar0>,
>> +        need_riscv: bool,
>> +    ) -> Result<Self> {
>> +        let hwcfg1 =3D with_bar!(bar, |b| regs::FalconHwcfg1::read(b, E=
::BASE))?;
>> +        // Ensure that the revision and security model contain valid va=
lues.
>> +        let _rev =3D hwcfg1.core_rev()?;
>> +        let _sec_model =3D hwcfg1.security_model()?;
>> +
>> +        if need_riscv {
>> +            let hwcfg2 =3D with_bar!(bar, |b| regs::FalconHwcfg2::read(=
b, E::BASE))?;
>> +            if !hwcfg2.riscv() {
>> +                dev_err!(
>> +                    pdev.as_ref(),
>> +                    "riscv support requested on falcon that does not su=
pport it\n"
>> +                );
>> +                return Err(EINVAL);
>> +            }
>> +        }
>> +
>> +        Ok(Self {
>> +            hal: hal::create_falcon_hal(chipset)?,
>
> I'd prefer to move the contents of create_falcon_hal() into this construc=
tor.

I think it is actually beneficial to have this in a dedicated method:
that way the individual HAL constructors do not need to be visible to
the `falcon` module and can be contained in the `hal` sub-module, which
I think helps keeping things at their place. Is there a good reason to
prefer doing it here?

Ah, maybe you are thinking that we are returning a Boxed HAL because we
are going through this function? It's actually on purpose - see below.

>> +pub(crate) struct Gsp;
>> +impl FalconEngine for Gsp {
>> +    const BASE: usize =3D 0x00110000;
>> +}
>> +
>> +pub(crate) type GspFalcon =3D Falcon<Gsp>;
>
> Please drop this type alias, Falcon<Gsp> seems simple enough and is much =
more
> obvious IMHO.

Yeah, I wanted to avoid having to import two symbols into the gpu
module, but I've probably been overthinking it again.

>
>> +
>> +impl Falcon<Gsp> {
>> +    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register=
 to
>> +    /// allow GSP to signal CPU for processing new messages in message =
queue.
>> +    pub(crate) fn clear_swgen0_intr(&self, bar: &Devres<Bar0>) -> Resul=
t<()> {
>> +        with_bar!(bar, |b| regs::FalconIrqsclr::default()
>> +            .set_swgen0(true)
>> +            .write(b, Gsp::BASE))
>> +    }
>> +}
>> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core=
/falcon/hal.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5ebf4e88f1f25a13cf47859a=
53507be53e795d34
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/falcon/hal.rs
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use kernel::devres::Devres;
>> +use kernel::prelude::*;
>> +use kernel::sync::Arc;
>> +
>> +use crate::driver::Bar0;
>> +use crate::falcon::{FalconBromParams, FalconEngine};
>> +use crate::gpu::Chipset;
>> +use crate::timer::Timer;
>> +
>> +mod ga102;
>> +
>> +/// Hardware Abstraction Layer for Falcon cores.
>> +///
>> +/// Implements chipset-specific low-level operations. The trait is gene=
ric against [`FalconEngine`]
>> +/// so its `BASE` parameter can be used in order to avoid runtime bound=
 checks when accessing
>> +/// registers.
>> +pub(crate) trait FalconHal<E: FalconEngine>: Sync {
>> +    // Activates the Falcon core if the engine is a risvc/falcon dual e=
ngine.
>> +    fn select_core(&self, _bar: &Devres<Bar0>, _timer: &Timer) -> Resul=
t<()> {
>> +        Ok(())
>> +    }
>> +
>> +    fn get_signature_reg_fuse_version(
>> +        &self,
>> +        bar: &Devres<Bar0>,
>> +        engine_id_mask: u16,
>> +        ucode_id: u8,
>> +    ) -> Result<u32>;
>> +
>> +    // Program the BROM registers prior to starting a secure firmware.
>> +    fn program_brom(&self, bar: &Devres<Bar0>, params: &FalconBromParam=
s) -> Result<()>;
>> +}
>> +
>> +/// Returns a boxed falcon HAL adequate for the passed `chipset`.
>> +///
>> +/// We use this function and a heap-allocated trait object instead of s=
tatically defined trait
>> +/// objects because of the two-dimensional (Chipset, Engine) lookup req=
uired to return the
>> +/// requested HAL.
>
> Do we really need the dynamic dispatch? AFAICS, there's only E::BASE that=
 is
> relevant to FalconHal impls?
>
> Can't we do something like I do in the following example [1]?
>
> ```
> use std::marker::PhantomData;
> use std::ops::Deref;
>
> trait Engine {
>     const BASE: u32;
> }
>
> trait Hal<E: Engine> {
>     fn access(&self);
> }
>
> struct Gsp;
>
> impl Engine for Gsp {
>     const BASE: u32 =3D 0x1;
> }
>
> struct Sec2;
>
> impl Engine for Sec2 {
>     const BASE: u32 =3D 0x2;
> }
>
> struct GA100<E: Engine>(PhantomData<E>);
>
> impl<E: Engine> Hal<E> for GA100<E> {
>     fn access(&self) {
>         println!("Base: {}", E::BASE);
>     }
> }
>
> impl<E: Engine> GA100<E> {
>     fn new() -> Self {
>         Self(PhantomData)
>     }
> }
>
> //struct Falcon<E: Engine>(GA100<E>);
>
> struct Falcon<H: Hal<E>, E: Engine>(H, PhantomData<E>);
>
> impl<H: Hal<E>, E: Engine> Falcon<H, E> {
>     fn new(hal: H) -> Self {
>         Self(hal, PhantomData)
>     }
> }
>
> impl<H: Hal<E>, E: Engine> Deref for Falcon<H, E> {
>     type Target =3D H;
>
>     fn deref(&self) -> &Self::Target {
>         &self.0
>     }
> }
>
> fn main() {
>     let gsp =3D Falcon::new(GA100::<Gsp>::new());
>     let sec2 =3D Falcon::new(GA100::<Sec2>::new());
>
>     gsp.access();
>     sec2.access();
> }
> ```
>
> [1] https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D2=
024&gist=3Dbf7035a07e79a4047fb6834eac03a9f2

So are you have noticed there are two dimensions from which the falcons
can be instantiated:

- The engine, which determines its register BASE,
- The HAL, which is determined by the chipset.

For the engine, I want to keep things static for the main reason that if
BASE was dynamic, we would have to do all our IO using
try_read()/try_write() and check for an out-of-bounds error at each
register access. The cost of monomorphization is limited as there are
only a handful of engines.

But the HAL introduces a second dimension to this, and if we support N
engines then the amount of monomorphized code would then increase by N
for each new HAL we add. Chipsets are released at a good cadence, so
this is the dimension that risks growing the most.

It is also the one that makes use of methods to abstract things (vs.
fixed parameters), so it is a natural candidate for using virtual
methods. I am not a fan of having ever-growing boilerplate match
statements for each method that needs to be abstracted, especially since
this is that virtual methods do without requiring extra code, and for a
runtime penalty that is completely negligible in our context and IMHO
completely balanced by the smaller binary size that results from their
use.

Cheers,
Alex.
