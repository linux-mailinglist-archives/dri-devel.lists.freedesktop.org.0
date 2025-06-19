Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D3AE0722
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE5910EA5E;
	Thu, 19 Jun 2025 13:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IUkHRu74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3B110EA5E;
 Thu, 19 Jun 2025 13:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zF45zxhHUlpbEY0/8Kif34VIdh3gU8blYo2qaL6kkJa+02aONRUOV4Q32FRnJYAe4fKqjWgKnX+dyNYOoSc4VKTb548wt0F+hXEPrFHBoqkO33VllmN8LxcruDsh0ewutsNwlng1n3I8JV96gmEwRbZdefuPVIx8pf5PfSSGZiGAfo8A6eTJvMm18acK8tTpd+il9/rfBufupYAE4L/fZmPKdYljXRaG4KgYJavwkpxyRsaDw0iD7EV5x7Ws0vm11FpBAN1wg4hjsX4LSjdVYI4wWczEDbbvW4P+0LWdEC3y78BwyEpz6p7eH3SvQ1+6kzhW+Aj8g56yqSpD3T5GlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAWQnVXBSxAMjnu9ReB+dPNH7MqVlQj/9iTkQ2xjme0=;
 b=M+dflRyF9+4EaDAUq4YyEn2xtmI4kye3BehXqaBKY7Kfd6w/D1vv82LoM0ayW3vxNBf02+Z7k7mn1o3lVMFhZjd7jm5PaZoBHgncE1OXkbNTfp2P3Wb19nMO/IohsdE1mYNhjjEZv4+D0JhEUvf4eskaRj5YeiFQWGlzcBoQG17Y06mXlZyNr1q06hkS7thtDNhHKaDdfLCvNb/09LcKG8+5CGqdRqLzhrxaGx/7EML7rbCMYsnn64VuThu6+EDBPAGT+KuhZ5iCPXCo2CZAWUhRObkv/A/0E5F3u0XJHPGQJUaL52D6KuiiBeuPSS1ujdgwbx+diSQn4VfM0bRF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAWQnVXBSxAMjnu9ReB+dPNH7MqVlQj/9iTkQ2xjme0=;
 b=IUkHRu74QwFoY5gmlGwEa5ItWAm8on6ufgnKqVGZdqRyXlUYC+BeLk2MYEmyYdobWKT05F4txPhJWur+W4VBaVJJdYMuS4my7bKeibScpgZQNA8LPXZiq9I15qEWwxfaB+ojsZuhZ1e1Q2zUv2wJqvLdQp3RNkG7ULA5cj2j5UKXKiNYFXLJJoKc9V8G8ok++bUf6I6OhIrP1ENk2TMKzBUxa+K4yfq0V6whU0t33HeJW2qTcESLZYmgxTmfEboV9uW0L4/4boV5JrWSW7YyoP8emA0zCg5bcquRcezXi0AnQOPneEwJDeYyHUSFDrNmIrPt+SVH64CklscqVw1hhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:07 +0900
Subject: [PATCH v6 23/24] gpu: nova-core: load and run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-23-ecf41ef99252@nvidia.com>
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
X-ClientProxiedBy: TYAPR01CA0212.jpnprd01.prod.outlook.com
 (2603:1096:404:29::32) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ab3a32-5409-4bcf-be8e-08ddaf34cb53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFc0N1ZML28ydnZUQU1QNmFJTmNNUHNHR1k0OEttdzJiUDlNemJ4RDEzd2kz?=
 =?utf-8?B?RTJ3eCtMVUlNUEVBUTZvUExsYTZ5OHAyUVRSTWxHcjErREsxQ1FURTFXem1M?=
 =?utf-8?B?L00yaFN4b0FTZE1MVjg4TkRjVGcyNHFFQmZSbzF4MWEvSlY4clRrbTRycDBn?=
 =?utf-8?B?K1hVRHNiTk4vTGJUeUZ2TVd6eGdGZG1CL2RpWS9ZeVE5MmFzMnhOZ1B0U0pz?=
 =?utf-8?B?Uy82aW45bERmbHZTR281cFVjUVQ4Z0ZIQXZ5ajVZM1Eva2lWaGpXek5yQVMr?=
 =?utf-8?B?Q2lxNFJuemNVVWZyZDEwZ0VkbGZsV2hsKzlkNFBzb1lwbE50OStadFBrWmhV?=
 =?utf-8?B?eGV3K3hpK3ZQRmtBV1hvSk12V0MyVVdVdlpxdEd0bGVZTDdEZlNYckQxWWxt?=
 =?utf-8?B?MDdNdU40Zmw1MjQrWmlYZDArTTJYdDJKclkrWmVDNldDa2tha3J6eW8wclkw?=
 =?utf-8?B?Q2Nzd2JMMk53Q1k4QXpNNzdxWTVYMmVoZEo3d2UvMUhCcWV6R01ISG5vdUk5?=
 =?utf-8?B?d21HN3BQV2NSaWtrb0ZzWHoxeHBreUp2SkdhajNDN1BTdXFSQitXSFBCNno3?=
 =?utf-8?B?enhmYlVUSzVhakl0aXZFc3VMZjcvRjYzQU5iWHE4VDhoMDNtS1VXMTdrVjJS?=
 =?utf-8?B?MEFnbmVRcEJ1dWFvZ1NzdklqRk9lenZTRWloUWgyYms2czZQNCtOaGVxcU5L?=
 =?utf-8?B?d1ArQkdMQ2psY0NCQ3RSdFhaSjhjWmh2dmlDMDcvb2kyalUyNDBDWEtiY0tF?=
 =?utf-8?B?a2JsSXhsSmdVM2NpYkNZQ2k1ZXNkNzhEUkdVZW0za3BjRk5wM1V2MVBaSFc4?=
 =?utf-8?B?TTlNak0xKzdNTW5kUWlTZGxpanZ5dUU2OG5MTFlWT0Q5dmNRRnlneVk5emVR?=
 =?utf-8?B?d2ltVEhZbkZyZ1VFL2hZS3lSSFJGZ2pFRlhuZkNZSWx1ZEpaSHNpQ0h0VHFZ?=
 =?utf-8?B?RjE0KzFBVW1mbUNPci9yQ2I4SkliWlBLc3IrdjNUdzhicWpCa3lQNnBIbVpr?=
 =?utf-8?B?UXN5dGd3RHBuZmpsSk9oYk10NW9WRXI3RnpHa0JHb3BLNjVBVmVrWUhyUWJX?=
 =?utf-8?B?NDVqL0x0R1dRRmgvT2Mya1kvVkZhTWQvRlVpVUhsUFI5ejZZNHFXUGZXTkRs?=
 =?utf-8?B?Z0dEM01EZEYzSUozaHZzQm9HcUxlQmlIQWhzb1o5WGtMbFF5M3Q4N2YvRyta?=
 =?utf-8?B?QUJlbjRvSHRPVVdrRlVvaEZhWmIxWUJvOFVGVXNXUXRjcm51QXJWQmtFOUFO?=
 =?utf-8?B?em5mbTZXK2ZWbjVaVGNHNTcrYnd5VFRGR1RxYXhiQ3U3RDJKdDlleWpoRE5o?=
 =?utf-8?B?a0p2NzRJa3JPZThtZ09oZDFUQ1hBcXBEa1JmZFMyUU5hSVhuaVZ5d2c0aHpa?=
 =?utf-8?B?TlJQRmdCZ0JOTmkva0gwUUpuTkg4MnEwKy9DMmttMzIvL05EazZhNUhiOTdy?=
 =?utf-8?B?SUVEY28vYnVsenp4dWlhU1hMZnMyMjdWVVlpU0FpTkxHbDZZZ3REZVVJVVgw?=
 =?utf-8?B?ME9qdm84Q1YxWnRRK0FxMUI2NGhYT3dPbVFsa21mL1BaeURpcUJkNGFoT3hm?=
 =?utf-8?B?NTM1TWVRNGQzNktVRzVNNkZQSi9pNUNjWExpM0JPaE9XNlBvcWViOE5ycndJ?=
 =?utf-8?B?cVptTDNWK1lqekZ0OGRqV25MeHBDREZMbFFsNTFEVHpPUVFCVi9yMzJoc0lH?=
 =?utf-8?B?dEdNN0xMeVphWENKTWllYW1Ob081WU5hV3BwU2pwa0hlS3RYVkh4MnM4UjZ5?=
 =?utf-8?B?cERRNGp4MHN2V1VrSnpRS2hmRWIwOHlEdFh6TlpBdGxWdEI5eHdPSVBtdWdy?=
 =?utf-8?B?TGlodzZZQyswUHcweEpqWFJEYWExcG9NYXd5elhFbDh2MTJvSGI1czJVdHRw?=
 =?utf-8?B?NmsvaHRUdGlYalBqSkZwUzFoZS8za1RRS3JLL1FEZ2R3VHNwNVE4bi9BZDNH?=
 =?utf-8?B?bGpUWTBiY3E5Zm12cmhLeGJTbXhjQnBad0l2czhCYnp3R2Z6eXFKbDdwZHpj?=
 =?utf-8?B?c0F0bkQva2xBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WC9tZWRoZDMzWVpkeHFUdmk2bkY2K3lZeVZLVkNxT0YwVUM0Mk92b2pHbUJS?=
 =?utf-8?B?ZGd2bXZHOHpLTXZkZndDYkpPMk5TbWpZUDJzZHBzNG4yY293NXg5UXFlRmti?=
 =?utf-8?B?VXNuZ05Sbng3alM1ZEUvRWJnVEJPaVQyMGMwc0lFL0hmYTZMNGl0Y0hYRlp3?=
 =?utf-8?B?ckl0aC9Xb3RSQzU0Kzl6dDB0Sm44ZFRwQkNReFNDekZlZUN6MmVRUHQ3blNw?=
 =?utf-8?B?ZzlyemJERmExOVM3SHpSRHR0OGJQSVR3UjBabFhCcEFJOXZwTWQwdTBoeGIv?=
 =?utf-8?B?U1JLdHh3MFNVRlcvQnd6aU1QdzJZTnZMaXk4OEZwZkRrN0tvcTBrS2RvV0pz?=
 =?utf-8?B?aUw4b0x5eUsrcC94VUU2RXVXTXJIVE41NE1DZzIxODRTdUx3VnhrYW1mcnNB?=
 =?utf-8?B?YkRuS3ZIUDN1TWFyVlRYUUhwUi9kUDBodUsrUW44VjJVSlNjZUdYamh3Um5H?=
 =?utf-8?B?RHI0ekh6SU9tRDZnZFNCcndKN0FJNy9wZTcxOFNmSmV3dVJDdys1N1BJL3E4?=
 =?utf-8?B?SHdmemJkU29SOS9nUkNQelJkYVZPc0JuODlhU0NBeTZSVG1heEdDbmJGV0Za?=
 =?utf-8?B?clJHMTk4RzJmZXhuL1NLQ2ZUY0NiQnVzbTlwenFGMllHTTBMOHJVc2RjUlNU?=
 =?utf-8?B?SWtZaU4raXdkYTF3QkpkQVhKcDBUZVU0ME5wbGZKb000QzJsWVBDTnltOWQ0?=
 =?utf-8?B?S2llWC9SeUt6TUtTMGhNWE1BelQrd0p3UDNXd2JYeHY2bGxnekZoTFFqM3R1?=
 =?utf-8?B?UHg1WkxDby9KYUZYZkdJS1FwTVlUcmtpaG51Ry9rWUpyWWFuRnVHU0U2OE1y?=
 =?utf-8?B?YnJkRHZlQklFck56WnhrTDRyUWFNY0piQk9hek9RQXhRYmNNK3JyN0x3dmVy?=
 =?utf-8?B?L1pabUoxZmNUY3Z2ZlIxc1NhSjVSKzVXUDAveTRyOXQ0WG1nZkhPV1VHRXNL?=
 =?utf-8?B?VVBRSDBYeCtwWjJGSkRhNW1NY0s0azh1RThLcDVtSEV3UmJzaS9xYjNSdlFP?=
 =?utf-8?B?SGh2bzlIME1ZNm9KUEh5VDRuYW11Vk1UWG5aUDZ0Y2VpVjdYRHhrbUFOSmor?=
 =?utf-8?B?QlBDK1h6R0JxWCtENVlkMU9ZY3lNdE1SeENzcXcrQnp6anB1aWZldytUU3E1?=
 =?utf-8?B?SFVMTzIvR284bzFtajB4VmVmUDh3RnhBT2RRMUVhYzNERW11QS82ZzdvUWR2?=
 =?utf-8?B?WWh2dm1hUVZVdEgxQjZCbHAvT25JL1ZoWStNVEZDRzFWd3U4NnJCZkZ2Yk4x?=
 =?utf-8?B?Zzk1N1RJU3FFdUdHeCswMUVLVEV1WUFDZFkzWEszMXZ5ZHQ3MHpFU0NaVnhO?=
 =?utf-8?B?alBMUlF6OUxNVlo5eGVsNGNQNGU0ZEZBclBvQys4ZitUTWZwalRwSk5iR25O?=
 =?utf-8?B?ODBqbk9BcytsYXV0bVU5N0pQVUdmWnZYcWJnWmF5UkVaUmh2Ykw5TW9zR2dH?=
 =?utf-8?B?dGxiNTU4Um5SblJ0Zk9XWDYwSUFxYnJJTjFSVVV3dnNUMGlPOElxQmJ3aEVa?=
 =?utf-8?B?bnVXcGM0UkNxSk9GU3pGYmc2QkNtajJDd01VYVZBVS9PTUdDUFduR0p4ZkFu?=
 =?utf-8?B?UVBSQnVtbHYwMFptdXVuL0VZUEVvUUZsejRPZmlsRHFCdFd1QVp3L3JKMnY3?=
 =?utf-8?B?OHpXWGtKTE5lZ0s3aXVVUTNVMytRTFUwL1ZBbjQ0VTFnQjdnZkh2YnZYMFZG?=
 =?utf-8?B?eUFxc3N2bjZBTXVpRFh3enR6bFA5REJxb0hscFB0eXZyNnRUbzRtV3A1S1lX?=
 =?utf-8?B?N0l4cTJtOUZxT21hRlhVUmhmYTRTc2pnbllXMkNXRWZrYlpLNzFpNEpMRkpi?=
 =?utf-8?B?ZCtIWkx5bzVXcWNyWGpKb2gwNEVVRmxhd1FoSE85VWwyRHVjMzJhTWxpak4y?=
 =?utf-8?B?TGdrZnJNWFBDZXhMM1NVOVhGbklwSTU3U0lVdVh1NE9MR3cwazhKekZoZGow?=
 =?utf-8?B?OGs3VFZKUWRqTFl1QmJtV0NsUS95VDcxSEpWQStPMDh3ZGJuQkNXOVV5RTNB?=
 =?utf-8?B?Qjd6YXNac1ZCUHV5dmswcXVzYzRiZk4rUlloRmVyWkRlalh4N0w2bVo3cDhP?=
 =?utf-8?B?Q29VUWRSQnBXZ1hQOFZRNkJqRXIxMzk0TmR5RHY5TDhrMVpKQWYvNWFzUUVJ?=
 =?utf-8?B?T1VqWlRwL1RNTGxXZGRmcWl4YUFYemxHZFpvMUl1WDcwelYyMVBiZGhzV1RT?=
 =?utf-8?Q?09xHvyJTm0l6GfIc1YYd4JMsnufHNiC3pTxO6tvGefec?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ab3a32-5409-4bcf-be8e-08ddaf34cb53
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:44.2517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UjhBCX1pFSB5dyZcYK8yAGw7HX2MH8RhNXeaP0znWKKwmQjNIoHSHhoZ1OY0gTC1uzX0xon1PJLd3NdXHqd+w==
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

With all the required pieces in place, load FWSEC-FRTS onto the GSP
falcon, run it, and check that it successfully carved out the WPR2
region out of framebuffer memory.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         |  3 --
 drivers/gpu/nova-core/firmware/fwsec.rs | 25 +++++++++
 drivers/gpu/nova-core/gpu.rs            | 90 +++++++++++++++++++++++++++++----
 drivers/gpu/nova-core/regs.rs           | 31 ++++++++++++
 4 files changed, 136 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index ba14cb24b80db89901191000a617bee683cbc060..fe4d3d458a6b105bfdd6257111d3eed8ed8aba7c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -2,9 +2,6 @@
 
 //! Falcon microprocessor base support
 
-// To be removed when all code is used.
-#![expect(dead_code)]
-
 use core::ops::Deref;
 use core::time::Duration;
 use hal::FalconHal;
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index de179c2011396fa789e868ec564b09eb48aa07ff..6058598ce76e25484cc4ebebd1be80b9dd1b469c 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -395,4 +395,29 @@ pub(crate) fn new(
             ucode: ucode_signed,
         })
     }
+
+    /// Loads the FWSEC firmware into `falcon` and execute it.
+    pub(crate) fn run(
+        &self,
+        dev: &Device<device::Bound>,
+        falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+    ) -> Result<()> {
+        // Reset falcon, load the firmware, and run it.
+        falcon
+            .reset(bar)
+            .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
+        falcon
+            .dma_load(bar, self)
+            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+        let (mbox0, _) = falcon
+            .boot(bar, Some(0), None)
+            .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
+        if mbox0 != 0 {
+            dev_err!(dev, "FWSEC firmware returned error {}\n", mbox0);
+            Err(EIO)
+        } else {
+            Ok(())
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ba926162c1a016f7e1c88da50308fb0a8686924a..ae454c0e2fb4d485e99fbf9cd80c2ebb89884887 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -188,6 +188,85 @@ fn drop(mut self: Pin<&mut Self>) {
 }
 
 impl Gpu {
+    /// Helper function to load and run the FWSEC-FRTS firmware and confirm that it has properly
+    /// created the WPR2 region.
+    ///
+    /// TODO: this needs to be moved into a larger type responsible for booting the whole GSP
+    /// (`GspBooter`?).
+    fn run_fwsec_frts(
+        dev: &device::Device<device::Bound>,
+        falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+        bios: &Vbios,
+        fb_layout: &FbLayout,
+    ) -> Result<()> {
+        // Check that the WPR2 region does not already exists - if it does, we cannot run
+        // FWSEC-FRTS until the GPU is reset.
+        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound() != 0 {
+            dev_err!(
+                dev,
+                "WPR2 region already exists - GPU needs to be reset to proceed\n"
+            );
+            return Err(EBUSY);
+        }
+
+        let fwsec_frts = FwsecFirmware::new(
+            dev,
+            falcon,
+            bar,
+            bios,
+            FwsecCommand::Frts {
+                frts_addr: fb_layout.frts.start,
+                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+            },
+        )?;
+
+        // Run FWSEC-FRTS to create the WPR2 region.
+        fwsec_frts.run(dev, falcon, bar)?;
+
+        // SCRATCH_E contains the error code for FWSEC-FRTS.
+        let frts_status = regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts_err_code();
+        if frts_status != 0 {
+            dev_err!(
+                dev,
+                "FWSEC-FRTS returned with error code {:#x}",
+                frts_status
+            );
+
+            return Err(EIO);
+        }
+
+        // Check that the WPR2 region has been created as we requested.
+        let (wpr2_lo, wpr2_hi) = (
+            regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lower_bound(),
+            regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).higher_bound(),
+        );
+
+        match (wpr2_lo, wpr2_hi) {
+            (_, 0) => {
+                dev_err!(dev, "WPR2 region not created after running FWSEC-FRTS\n");
+
+                Err(EIO)
+            }
+            (wpr2_lo, _) if wpr2_lo != fb_layout.frts.start => {
+                dev_err!(
+                    dev,
+                    "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
+                    wpr2_lo,
+                    fb_layout.frts.start,
+                );
+
+                Err(EIO)
+            }
+            (wpr2_lo, wpr2_hi) => {
+                dev_dbg!(dev, "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
+                dev_dbg!(dev, "GPU instance built\n");
+
+                Ok(())
+            }
+        }
+    }
+
     pub(crate) fn new(
         pdev: &pci::Device<device::Bound>,
         devres_bar: Devres<Bar0>,
@@ -226,16 +305,7 @@ pub(crate) fn new(
 
         let bios = Vbios::new(pdev, bar)?;
 
-        let _fwsec_frts = FwsecFirmware::new(
-            pdev.as_ref(),
-            &gsp_falcon,
-            bar,
-            &bios,
-            FwsecCommand::Frts {
-                frts_addr: fb_layout.frts.start,
-                frts_size: fb_layout.frts.end - fb_layout.frts.start,
-            },
-        )?;
+        Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 8ca7bcb5a93f4b60ee9ee488f26469af48e2f1d8..ccfaeed55cff90e66ac0acf37dcbd0eb344994c5 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -42,6 +42,13 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
+/* PBUS */
+
+// TODO: this is an array of registers.
+register!(NV_PBUS_SW_SCRATCH_0E@0x00001438  {
+    31:16   frts_err_code as u16;
+});
+
 /* PFB */
 
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
@@ -73,6 +80,30 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
+    31:4    lo_val as u32, "Bits 12..40 of the lower (inclusive) bound of the WPR2 region";
+});
+
+impl NV_PFB_PRI_MMU_WPR2_ADDR_LO {
+    /// Returns the lower (inclusive) bound of the WPR2 region.
+    pub(crate) fn lower_bound(self) -> u64 {
+        (self.lo_val() as u64) << 12
+    }
+}
+
+register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
+    31:4    hi_val as u32, "Bits 12..40 of the higher (exclusive) bound of the WPR2 region";
+});
+
+impl NV_PFB_PRI_MMU_WPR2_ADDR_HI {
+    /// Returns the higher (exclusive) bound of the WPR2 region.
+    ///
+    /// A value of zero means the WPR2 region is not set.
+    pub(crate) fn higher_bound(self) -> u64 {
+        (self.hi_val() as u64) << 12
+    }
+}
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

