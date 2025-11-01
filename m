Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A640C27CFE
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 12:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F3F10E14A;
	Sat,  1 Nov 2025 11:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y4GKeQdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BC010E141;
 Sat,  1 Nov 2025 11:47:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4zeixo4Y+odjUsn+7CNHHCyCM5G2TkeZBOSbUgE825j7NWikEf3GsmKuk0cIDD2P+cMRa+36E0z2jA7B+c4nAR0kHPDbV98/JsOjFHHJsazXdtA8kt1qYBXxQNgaa7qFxOSXqshUovueZwLvW+nURo+EsY7bbTUdkeD0pmZ61mPKAxV4XQC+NfBlo1y05E0Ys3Sg07hDIu58UkcBZDnFw+mInqAiBBC8IIgcYQTImUyZhzkiUvJsvOMgkzMqMgaL+7s7j33fDosnGKYA2wfbU8gJvp8dy7Nza49W0BhAW8ZFcN0wtJ3NjE7AoDVPa3Zom1pY0RGgSaJ9Hf1OLQdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DACM06C3l9JALVoQAE+PPWSJvBf8D/C5PZiUNI+vZk=;
 b=a7aRLix+Ht/V7NGpXgQEvR4nsWVbX0JMRsW5npIjbvp5SMPlYjphLORU2sBUOLMa6xlxYVUGlXQB6MVvfVziVu/LoMYM1zL3NL9/r6msaNZOinTvFeeDK6/42LXWPy8fShOA6oN2FIEO+Haz3530415QioWVIh5JtNZ+5m3V98vYeh80weaYMn6zdlogUEdgND0Rc67DgityAvmXaEFUvORddRz7hERvpt60gk/djzbFQtQK4CxBqHS7WlRxUtHT6q6Mmm+nwtK+SEcC+NTDhP2NLSmaSHo6G0Q7+PejQxyJi5S8MgFoB+8QcXxKGWJlB7zXR5n/nRZHh1XGrcZ65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DACM06C3l9JALVoQAE+PPWSJvBf8D/C5PZiUNI+vZk=;
 b=Y4GKeQdh+x8xZNyXfkiztskr/I6/mVX/csfsxrDWxqiE2Qsz9vBl1rXkt6GFWbdUScDNik5OPXsdeNRlb0cULXF8n0xR3HxZKQYyT3/K/bWCT7IlrY9/MJOSJMbUJWYBXzuoBPoKxvBOUYIwvKwNtUFbunW6l2warCcPFlrlHS0mpMeEjKr9TPIVjRil++jfHFOebuCDKkLMKolo7aUrcFMNM1+nPTNdyaHFs3RpAQ332+Sg14O5EGLkossOkDb8DpqCUqQ5pmf46rWwmLKF1a2qsvIv/jHayNP4upWRGBrjnx70rIWn0nZsvtbauC2IKm0f8DVKyQA1t0GUFK7lJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM3PR12MB9287.namprd12.prod.outlook.com (2603:10b6:8:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 11:47:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 11:47:19 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Nov 2025 20:47:16 +0900
Message-Id: <DDXC17HXPXFZ.3TIX7FHUJHAI7@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] nova-core: Simplify `transmute` and
 `transmute_mut` in fwsec.rs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel del Castillo" <delcastillodelarosadaniel@gmail.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
In-Reply-To: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
X-ClientProxiedBy: TYWPR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM3PR12MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: abf2abca-0d17-4454-a621-08de193c69ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDBML0ZRb3BCekFMQWJmK2NyK1ZteFA0SnRBVFFnaXBBeUJRaGdtTHEyUEp0?=
 =?utf-8?B?b3B2MEVsd2txQVVNR3FqTG9UUU41b04wVGF1NlgzYzJtZmtXOHd1cDZ3WU9X?=
 =?utf-8?B?TW9HQ3R2Rjd2RWhqcHZLU3lzcjRKQlpGQmdub01ZdXdYWFAzOGhCR2hiQjlY?=
 =?utf-8?B?Q1ZCWC82Y0kzWTlkOEU4STJvTWZHeG1JUWs0amcxM1MvYWkrVElwZktUbm1D?=
 =?utf-8?B?OUdySm9JVS9PUHZNem9kR1J4VjBkMVpIZjliWFVKT2pLcWhlOEFXVVU1aWZ4?=
 =?utf-8?B?MWF1L0JuL2VBSmtWUzU4UmIrRE44QmxzdVFiTEVEa0NwSnJPQ3RSMFkxc2xK?=
 =?utf-8?B?SUlCMnZvTlFtMnM2eFdZdHR2dHRqYnlHbDlSaGVPT1I5SnJJTDV0MzJZVHQ1?=
 =?utf-8?B?REkrRTVxWlFsbE1FUlU4RUhxUFluQk5pYWppT2I4K2RaYWFlNitmZGVMeC9S?=
 =?utf-8?B?bjVTWVZrSE8zczZQWVJmZWVzT2VZUW1ZRjZmMm1wVTlQMTRhb0IyZnB4cmpR?=
 =?utf-8?B?eEd6bE1WN3RRVDBiVVh5Q253UGNzUm5rYU44bENsV1ptV0l0bUdGTW01YURI?=
 =?utf-8?B?TlhYT3NSV2prcy9GNnl2SkZBM0RDR1NsckJyR2NBRG54NWdnVEtkYk04NFZU?=
 =?utf-8?B?ZU5WMkpjWGJLZ29WNjhyM2tGeE1YYmc2anpkSzBRSTZDczZmeHJRYzdkdkth?=
 =?utf-8?B?YmlFYjlza1hoRmw4OGNGKzJuZHBkNStzZXZrWURXa0ZuUlY3WEZSWkwzRVNz?=
 =?utf-8?B?enE0bGpEZDdGbHJtaFJUNndLeStySUhXY1podjdNR3hJTy9KVytuNWduN2N5?=
 =?utf-8?B?VlpqazVBZXNrSmxlREZ5SWJtRXN2MFVQaGhLQzdQVnFaVVJWRWxDSWpsYmFU?=
 =?utf-8?B?YVM5a0s2VlgzaHJEZWtqUUdmWWUxQlFLeFR3R2dQaE8zKzdCZytNbktxeFls?=
 =?utf-8?B?Y2ZXU3hKbGJyU2Zydy8wanRVQ2crZGVpS0t5dFlQSWRvV0hGSHJWb095enU2?=
 =?utf-8?B?Nkg5UmZzc3h5TEl4YVZEWWpUdGZjSi9QWlZTOHEvOXJERGozK2FMemNweFRs?=
 =?utf-8?B?TEZjYVd3dEdXNDFJOWdLMGkzK1hIbldjSW53TjlRMDNhNW9xRS9SOHBCV2NE?=
 =?utf-8?B?ZmQrL0VHdFBVOTVQMU9Bd2tiOHcvNlVTaTlud1lFVnpPdW1JMlY3WHdpY2JD?=
 =?utf-8?B?bFVyUWdlTGZVT3ZFVy81T3ZDZ2dwMkJnV29rMmtUa0xBWVZUQ1hJV2dWK2VZ?=
 =?utf-8?B?cmxpbCtwbWZLTi9HRnRMemZOb0ZEWENaR0xNWU5zd1dPOHJPRmRkcE5wenJz?=
 =?utf-8?B?bnFnTHhNSU81UWRSN2Z2RmRUNGgxVlozbDU0aXMrOHFjT2lSdVFqQWcyTE9j?=
 =?utf-8?B?cW5ja3U2MVh2UFdaNjFaejhtTVRrWHJPQjUrM1dlZTdFQ2s1NDVpdHBqZE5U?=
 =?utf-8?B?MVNONnJ6WDBTSlFBY3c1VC9pVSt1VnMvb2s0eGo3aDZwZE12N21XdnlCaFR1?=
 =?utf-8?B?V2V6U1pSNXVOcEJ0WEFFTjdqWXYwZjJNTllVZUxuNnBnRkl2RFl1S2tCbWpr?=
 =?utf-8?B?OTR0NnZ3S0VVN1dOSHJFNzdWVTNhb2kzTGhkWXdRV3NzZnpLbDN4dHlGWXFV?=
 =?utf-8?B?ZVF2bE0wZEwvdHM4c1ZYT1NEUWVLMnlmaTRrOFVvejFuNTRqQ3p3OFhUYWZG?=
 =?utf-8?B?NEtPMjluUkUyZW8vOGEzZGZHQkNIZVVOakNWYzk5U2UxczRsU2JMbm8vVW11?=
 =?utf-8?B?cVBvU0tNdmErMzRXQ0M2VUdESitNZDUrdkFQTHNnR0ZDdTNqcmo3ZmxpR3do?=
 =?utf-8?B?TVQ3bllIUURCY2doaGhBSXl3RnZoVEZTNTl6bnU3NWF1TnF1NXpmUUptQys5?=
 =?utf-8?B?VUhjYW1sU3pFQVJyOTlwRjhFTWFPckxsWkQ4bVRmK3Y4TVFqblY1bmJlMTNY?=
 =?utf-8?Q?H+aVkdiFiVegGORKcK2Msd9ewz4ikotK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2pjYkJXUUdYelFlZXpwNDNuN3ZSdWJzUFVaNDhwRktKMGNEcEFmdVpkdFla?=
 =?utf-8?B?dzU0Z0VMQ0ZPZXhzMUswYUhSaWRjc0RZNVBRQjIvSlUzMkUwWlVXOUt4dzBs?=
 =?utf-8?B?YnNHNW1GNXNjUHNUNGhzOXhBUmo3TmMyUGRiMFJyQTlyYnEwWlBsNkxncHBU?=
 =?utf-8?B?U1ZLZmYzS0RTbFA4U0ZlMHFkM011cjlVRmNYaWNwbjdYR3c1ZVVGUlJrZFoy?=
 =?utf-8?B?NWYvNEFFa3d1eWNUNythbzdIb1Nsc2NKelZpUmFRSDArUmdUNkRHN200bkRP?=
 =?utf-8?B?RGFGQjFFODNXTlZkQ1dqWHdlcmxsbW5paTUwZEhoMmtTOWZRbWdpcElPaWlQ?=
 =?utf-8?B?ZlBybGx2UEZyWWh1UlF4VXJGYkE2OGsxTHRybGJEK2tReFFZcjJPU0JQaDFP?=
 =?utf-8?B?eHdNaHQ5Nm5QUC9wcEdRdUN4T21VYVhNQVVzeEd1R25TVWRzZEM3VllHTVU4?=
 =?utf-8?B?SmZ4KzlyUTYyekExclEvNU9RLy9QUWhqNi9ucGNHdzV3N1ZvVlFXMFBBL3dL?=
 =?utf-8?B?YkgrVlpEZTFGTWFFN1c4VmRpamdvS3hIakNZa2ZjNHBxWG9IdmxZRjYydTJU?=
 =?utf-8?B?UnFENVZReURRMXVHWVc1NWJCY2RkS2hIN1N1cnRwbHNpUWxHaWE2NzAwY3pY?=
 =?utf-8?B?QXp5Ni9qbFd5U1ZVTWtoR1UzcGpEcDhITlhtaW5ETXdTdWdqWVJNQVJaL1VP?=
 =?utf-8?B?MHNMMjZwaExlZlhtNjh0Rjd2TzFCclYwLzBhT3E4Vk5xbU5pNTRNQnJpVjZX?=
 =?utf-8?B?czBPdk80NWYzdHBveWJCT3AxL3VjbDVGL0NNMUN6ZkVCSnEyaEFDNytqbmZ5?=
 =?utf-8?B?MTNEV2VLY3hFM2hpTkxQSUhuWFJZQndJOEw1YUgrRjAvSlBWaEprVG9Pc2tG?=
 =?utf-8?B?dEsrZjB5UGRmQ1FRWDl6TTE1NlBMTDJMdDJJUHFwQzNxSWx1eHEyM3ZKMVN1?=
 =?utf-8?B?N0pGRVRtbEFnbTVKRjZ0VHppQi9rZ0EyTjVGWjY3YzZwa3JZZmwxSWFmM2dk?=
 =?utf-8?B?K29OTWFjTHVicXg5djllcjk0OTMvSE9iaFoyMEdlQnRCU0gxVkNDbGt6RzdV?=
 =?utf-8?B?eitqNU5XRXFrcERwVFJaNjFINER6NnZqQnVtcmdHK1RsWDlaOVZmdEp2NDEz?=
 =?utf-8?B?S1NOOUNTZFhYR3FFQUZqM0txVDFVL0tUMHM2TDI3VkJidml3WjdCQkN4VEgw?=
 =?utf-8?B?U1ZxTGNuanlDWTdZYlo2UGNFNmxabnhpSTJxWjliR2U4UFVQU2p0MytzN1Fu?=
 =?utf-8?B?VEQ2TkFDV3BJUkFtbkxPcmpGekVBN2RLTjFkb0wxUmdJV0tlZUdEVUtGOEZq?=
 =?utf-8?B?TVJxRlhZV0JqZzIzRkE5eXpqMzNEaTVLMjlUblYrc2p1UjZzN1I3SVhnMHIw?=
 =?utf-8?B?MEM2aHBMUmphVUdQL2UxaUE3UG9xelk4eFMxd1ptWnRtNUlpSHFBUzd4RURY?=
 =?utf-8?B?ekJFbXVhV3RlVWhwbC9iUVE4WXBSMWdKMTBOOUt2dkFrM3pKTzZoUFQ3ZUJt?=
 =?utf-8?B?VmF6OWxWMGVnRXNqUSt6NmxXVExONDVldFpNWmRPaGdvR3hWbWg5eFgrTmE2?=
 =?utf-8?B?YmZhald0dTIrcnV3OHZTRWFXWGhyNXZVTHJuVE45eCs0bSttZlB4YzJMdWZi?=
 =?utf-8?B?QUZubWwzeUhYOWYyanFXcnZHQVZ4OUhIelJyWHBmZFBBQlJGK09NTkM1SjZU?=
 =?utf-8?B?VFEzNGp6ZS9yQ0gyemFVRFhVeC9ZZlBQRkFSSnNDWHp6b01oOWhkcmJJTzFj?=
 =?utf-8?B?OWxZdzFyTlk5NzhIbFBzU3ord2hQbWJQL1JUeGRKQ1h3Zm1KZ1FFRk1UWjFy?=
 =?utf-8?B?U0M5R2R2RDFIeVptMGtmamcvdUxFUXArV3l5S0RSd0ZkMW4yVVBpcjZUS1dS?=
 =?utf-8?B?YXlxZ3RINEFQNmdUb0IwY3lsZExEOGdwMjFjS1BEQU9ja3VxZ1BxcDlsOWFY?=
 =?utf-8?B?aWZ5aWQ5SHNYa1lHTHlQSkpqMUVxZE5OcVJKdmFCeVJZb3RuTm1FWUpLaU5P?=
 =?utf-8?B?T05uOGxYczFFbFA0REJpK3lOdEw3MGxpVlBzU2xiWWJTMjNQTDlTODFZdG1m?=
 =?utf-8?B?aXhLRURqZFJFbk04TjgvMFl2RVRwaE9GTTZBb0ZWSHJtTVJVWnRCZVRXVFU2?=
 =?utf-8?B?UkxhZnVINTEwZDExTTBuaTg4YU5QYi9lWW9RdmNxcWRwZzFVUk53U0R3bFht?=
 =?utf-8?Q?y7Oi6/rtaZW5KRI0gXcoGpoLIZGFGGdh/p6dEnAniU0m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf2abca-0d17-4454-a621-08de193c69ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 11:47:19.6130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzeqzwBesnJF4yGBYgMXilTcNZEqaVVehtmjrEeAGwR/w4gE46DU43CpK2VcCn40P6+t75VXtCxavWqzhUNVMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9287
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

On Fri Oct 24, 2025 at 5:51 AM JST, Daniel del Castillo wrote:
> This patch solves one of the existing mentions of COHA, a task
> in the Nova task list about improving the `CoherentAllocation` API.
> It uses the new `from_bytes` method from the `FromBytes` trait as
> well as the `as_slice` and `as_slice_mut` methods from
> `CoherentAllocation`.
>
> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
>
> ---
>
> I confirmed by talking to Alexandre Courbot, that the reading/writing
> methods in `CoherentAllocation` can never be safe, so
> this patch doesn't actually change `CoherentAllocation`, but rather
> tries to solve one of the existing references to [COHA].
>
> V1 -> V2: Split previous patch into two. One per reference to COHA.
>           Improved comments. Let me know if they are okay now.
>           Use of `{...}` syntax for the `if let`
>
>  drivers/gpu/nova-core/firmware/fwsec.rs | 129 +++++++++++-------------
>  1 file changed, 60 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-c=
ore/firmware/fwsec.rs
> index 8edbb5c0572c..507ef3868565 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -11,12 +11,12 @@
>  //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
> =20
>  use core::marker::PhantomData;
> -use core::mem::{align_of, size_of};
> +use core::mem::size_of;
>  use core::ops::Deref;
> =20
>  use kernel::device::{self, Device};
>  use kernel::prelude::*;
> -use kernel::transmute::FromBytes;
> +use kernel::transmute::{AsBytes, FromBytes};
> =20
>  use crate::dma::DmaObject;
>  use crate::driver::Bar0;
> @@ -35,7 +35,7 @@ struct FalconAppifHdrV1 {
>      entry_size: u8,
>      entry_count: u8,
>  }
> -// SAFETY: any byte sequence is valid for this struct.
> +// SAFETY: Any byte sequence is valid for this struct.
>  unsafe impl FromBytes for FalconAppifHdrV1 {}
> =20
>  #[repr(C, packed)]
> @@ -44,7 +44,7 @@ struct FalconAppifV1 {
>      id: u32,
>      dmem_base: u32,
>  }
> -// SAFETY: any byte sequence is valid for this struct.
> +// SAFETY: Any byte sequence is valid for this struct.
>  unsafe impl FromBytes for FalconAppifV1 {}
> =20
>  #[derive(Debug)]
> @@ -68,8 +68,10 @@ struct FalconAppifDmemmapperV3 {
>      ucode_cmd_mask1: u32,
>      multi_tgt_tbl: u32,
>  }
> -// SAFETY: any byte sequence is valid for this struct.
> +// SAFETY: Any byte sequence is valid for this struct.

I appreciate the capitalization, but these changes are a bit
distracting. :) If you absolutely want to do this, let it be its own
patch so the current one stays focused on what it actually does.

>  unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
> +// SAFETY: This struct doesn't contain unitialized bytes and doesn't hav=
e interior mutability.

Typo: s/unitialized/uninitialized (and in other comments as well).

Otherwise this looks ok - it doesn't apply cleanly on drm-rust-next
though, could you rebase for the next version?

Thanks for the cleanup!
