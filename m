Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9D4C2EACD
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 02:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EBB10E4F8;
	Tue,  4 Nov 2025 01:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dipVywZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB3810E4F8;
 Tue,  4 Nov 2025 01:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCq8lJIKETToktjepuUVA01/LKFYEkGDZJFdvmYvtlg0KhW+g8ja1E7F2HfYHznrADpPSzCV5sj/2eqe+Puv/xeJDR0P8OBCibUM4MJgWV2u9QvPttSJqu+4/ajkBZODYIqukMQJGeaRA4eWVrATheBCOaFBh8rX/EIfyvCz6yDNCzJHJtt6B6hU4DbXV0VJNG4qYUR3/MGGi2uEB4/VIegz6lCvnFTpfP5Mk/IBjOljzJp5vvqGEpz2FdV7kyUiIRwh/wiFq4plsup3QbVRVLmvd6RZBw7tDkMZfIT664EuVjZPU4nugO2ODA7bWqNXj73MEE0cE/Rkc0jcfqL9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGrwGNscp2xhWPoxqN6fxeXDo9tdNCy0nbwiG8g4hZY=;
 b=nUfvKh+ub3btrt0EdGoVTDTKmsOqlh3bkjq3ViNhSSVVNqbTBN0EC6PkEEwp7ntV8Tt74gHRtjNkxF3wFaz7NkBC/BfRw+af/77dt4GHNwc3yvPEaDBzE2ffOppi9Tl8ugg3vJoA/Z+TK2QH9rmnEnvbZGyck8rHUysc5B9OgoKbh8KhLueQvxRZfq2C4jBg3bBs8e5M9v0pJch+tka/hqc3V6hk+GEEdGATMohuBJ0H2OUxrvYieNwv1g3blupMheil5TgUnjmIijPw7vIeotu0UmtBIqZHQ9qBM/jhzFxBkeopW2Kv2r9jhV3tlwimkngy9CmWyBZB82S+A1Pp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGrwGNscp2xhWPoxqN6fxeXDo9tdNCy0nbwiG8g4hZY=;
 b=dipVywZf6kcBHMu9/9ccl1lldd2zIco9dCXtOv12Cp4Onv2+DzzW5VKdSXoiH08J3YAUGprdadMDuBbLubLq8ayg4mKKyM9eR6ZZMZDuxx3QjJvYKe1DjUIfNq1gSE1casRoe/35GsWX2MrWb11LlYAyeu3qJLuNzJgFYNnMkblOX9p7xBt0hKXe9/y9O3zGLmJoIvJpp5UzuKvlLBvWq/Mrh2h28mY9NxGX7JB2DxPISviLlB/ONCvLzVOqJCrLcQsY7qSYtzs21LfiOzIMO3IMbwiYf4eBMyudYje9v9eyRTM/3GaxIh3H1iclyojfhAvbOdjNZ+cyNcXyreb9lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 01:00:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 01:00:51 +0000
Message-ID: <8972320f-c38b-4bbd-856e-fe1164769607@nvidia.com>
Date: Mon, 3 Nov 2025 20:00:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] gpu: nova-core: vbios: use FromBytes for
 PmuLookupTable header
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
 <20251029-nova-vbios-frombytes-v1-2-ac441ebc1de3@nvidia.com>
 <20251103200416.GA2097762@joelbox2> <DDZGO1JLDCCU.249NOQLOZBW6R@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDZGO1JLDCCU.249NOQLOZBW6R@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0938.namprd03.prod.outlook.com
 (2603:10b6:408:108::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: af49976a-1184-4b58-76f9-08de1b3d9920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amhpcHNHK0JPTkM2V3dnUTBzelNZeEN3RUVpSVpVby9pc1Uxb0c5REZQM2Q3?=
 =?utf-8?B?ek9rcnF6NGlkblZCZzFackxpak13d09CRGUzd3B3WStrVG5OT1pYN3E1ZkRu?=
 =?utf-8?B?bWNUd1BIZ0hmSDgwUjVubWV2azVWYzZZRHR6Vi9EV0tTYmphZ0FGV1NSTG9p?=
 =?utf-8?B?RG1RWEQ0RnE1Tk84MHZpbytlRkVONFk2VFpXeVlWNm1nVjluS1diNkZmYys1?=
 =?utf-8?B?UFRTUy84Y3FIWFpGTWx6L3FqbFkzMXpEbTJnZUsvbVFUbGlURmxQY3BaZ285?=
 =?utf-8?B?bUtJRlRCMDRNSGREK1dhV2g1eW5zb1MyY254RUIvanIwQ2s3VUNOekp3K3JW?=
 =?utf-8?B?cndJVEpGNE00b0k1Q2FnTXpnNHBTVzd2ckU3S21iMzdaRFNXMWVOM0V4ZldU?=
 =?utf-8?B?KytHKzRUb2lHT0NqaWlvVGNvbzh6d09zb3VPeVk1bXdSaW9GaFBsMEx2L3dJ?=
 =?utf-8?B?SXVoMGdvdlYzYVdwZnVhRHRGVkROVC9jZXZRQnpVQStHVU1rSXZFU1g0ektF?=
 =?utf-8?B?UTVkZ2FjVW9qYk5sdk5qYjZ5bXZ2cDg4djlzc2gyRllzZ1YzUUNySU5tQTVh?=
 =?utf-8?B?R2tqL3lnbWlLUkthOUp5aWljd24xN2RTVjBtdTVoSGs3cVA1d2g4WDhHdUUw?=
 =?utf-8?B?UTBUMmFNUXNnM25CWGhoVVE2STRpNVRWTFdxZkFPU0tMMlBuV0JhTlF1MnNR?=
 =?utf-8?B?WE9yMTY4cGpWN1VzMnltdGI2ZmN6NHp2VkdjSXFJNXNOR1EzR0wwdE9LMUhK?=
 =?utf-8?B?YmlLdkU2bjVBZnQ2ZmpxZkY0WXdtY0NMN29oTnI5Nkd4Tjc0c3V0ckZaMHhL?=
 =?utf-8?B?V3Y5WE5jYlRPS2NpUDYveGw5azF3Q2FjMmNhMFdUWjRwbDNuWG5NdmZZTE4z?=
 =?utf-8?B?alhhZHJqUWpNclBrTnZuc3dzQ2s0UzUvZFQzZHMrMVo2K3lZcmRLWHpINU5Y?=
 =?utf-8?B?bDdkYitFSlU4c2ZPTlJ1M05GSVZKUVdCczlSM1BKaWpXNUVNblpjeFNZaEJR?=
 =?utf-8?B?V1dqL3lqeENjQmxUa3JBUDFzUVBIaTdOenU3eFkzOUkvUk1XOE4rbURzdGtE?=
 =?utf-8?B?RVk3dXBRdWRrVFNrWCtMVnZTcDI4MGp3bXpIeWlULzlRdjg2YitUTS9hczRH?=
 =?utf-8?B?dDk4enFOdVc0WUlDUlhNaUkxRnNJSDl5djlvY0FBQTFRK2FWSTJWZFFuNG5H?=
 =?utf-8?B?YUNyQ0hxNGFxTm9kWGR2eDNjU3kvKzJnWVVMcVdiMEFUMjBJd3ZNa1dlWWI4?=
 =?utf-8?B?dUI5Y0hNZGNVeVNybXFIbFBSQjlpZmdGamNxUGxxMDY5eVVKUzV5ejRKSFNl?=
 =?utf-8?B?OU5mMW9NRkZlbHU3UU1LL3B3STd0TXJyQzhyUG04L1krcjZrVmlTVnFud0N5?=
 =?utf-8?B?RHpFak9xQzcwQUFSM3FxUDk0b3dzVGRuZ2dQQituTzFNS2Z2eHp6VTFLb3pv?=
 =?utf-8?B?dm9Pc05CN296ZFZSbTF1S1RzWEJGWFFtM01XOUoxTkhyT0JNMUZYSnNiT0Vw?=
 =?utf-8?B?YXNWeFV1bGxGaVErd3NsQzdSTjRnVm1zVHNhSFRyVFl5ZmwwRWdDZ3ZxOW1L?=
 =?utf-8?B?eEs3TEZzdEVIcUxMN2RLVzJja1VwWGxoVnl5RVI0N1VDU1R0UjlvYXRnQnll?=
 =?utf-8?B?NXFzdW5IMmVRSitCeXY2RGM3Y0xhcDRJRG1mZ1RxbmlDZDBvVnZBNTJHVGhY?=
 =?utf-8?B?R3hrMGNjcFlPQWoxUHRxRnl3SEwyMk03cGpDUTg5TnVlZ0R2WXNoenNBcHNk?=
 =?utf-8?B?aG96SkZWVDRBcnJSbUVoSlZ1OUdzVkxCTFdSa0RQaG5kY1RtSy9EQWV4S1Uw?=
 =?utf-8?B?M3crd3VDZG5ZK1pwd1J6Rnc5UlRBODFCd2tuYnN4NUF0U3AvQkZEU2FHL3pN?=
 =?utf-8?B?WmhnRGthL3VRQWsxRUNsT2NqYVJFaVM2eU9lWEc4c243ejd3eUJoNGg3cWRM?=
 =?utf-8?Q?tQjipY5bqAVyMHPEO7OTI+a/hkPK5/I8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHhmcDlTOGFGUmIrRitiUThMbFk3Z2pmc0lpL1pGTDJVTzNYKzJ4NmdLSTZl?=
 =?utf-8?B?VDJYa2lMdGpaK1duY0pXMkdCUGtDaW9MN2lVNjBFVW4zRzA5ZGhFcFd0RTB4?=
 =?utf-8?B?Rm05N2RHYjJnTUhhSm1icFVkUWZzcnpYOE5vUXhYdzh0WkV2TWU2RWpaRWNy?=
 =?utf-8?B?QTFSYWpGaEpsVnhmMG0yRXQrQ3FBQ1Vkayt1SEtsVEE2WHdhM0FuVHNKQUlJ?=
 =?utf-8?B?ZXJBemNTM2lzd25ZZ0N1azZoMU1mNzgwaWlYaEgyak5FZlJaYUQydW05S1Zu?=
 =?utf-8?B?M2JQeHdjaVUvM3RoNzh5QTRVa0xjNFd1Vm1wUVFjeFVJK3g4TjFjc3h4eGNW?=
 =?utf-8?B?T1JXMGZNNWF2MTR5OXFPb055WUxNUk1DaDdvamtyTXFCOHBiSGxobXpTcWRn?=
 =?utf-8?B?Wjl6Szd6WjcwdGF3UndtaHNTR1R0SlZIZjcwY3U0ZWJuLzVHT3VYRko1bzFB?=
 =?utf-8?B?ZWx2RWptaHR5TjFGaU9lMTBJbnpuS1lTeW9qT2xSK0hiSVRSVHVSQlVqUk1X?=
 =?utf-8?B?WU9rSWhScWJwVzl6dWpwSlBwNVcvdXdXbVBXbWZXRlVmODdnOU1mWHFISUtO?=
 =?utf-8?B?U2tubUs5TTZ6UWp0UjVPUTdEc1l2cUVpMm9COUp6V3RwRUZBQUJuK1plekJV?=
 =?utf-8?B?U3hmVWNraWFXZUJ6Tjd4TDZ0ZkJXWkdZNlZVZi9GbnNCbFdDS1BqVWorZnZU?=
 =?utf-8?B?Y2I2UFdocnhyRTJXUHRJeGxsb1A0ckhTdjkxM3hwelVvaTRDQVlzY2h2bVNP?=
 =?utf-8?B?TGI0Zm5xcVZxYkM2ZU9tNlhHTGw5KzY0b1Zvb3JEZDhKMy9HclFuaGxHd3lv?=
 =?utf-8?B?cUlaQU1naTdmUHRhWlhlNlpsSWxEY3V0dlR6U081VGQ4cmlERk9ocVBlQVVB?=
 =?utf-8?B?S1ZhbDRlYmRMTmFiSzdNWW9oT2ZNSDlWU2s2Z3JRbkJESDcvOS9PallteHRy?=
 =?utf-8?B?YzZqMmdKQXZRN2J3Rkt1SkNpbEFiVFd0NFVQVzBQOUh3SlhEZTZpcXlQZTJG?=
 =?utf-8?B?ODVralNGV3ZNVVhTNFJjUVdCd0NISjlQREFtK0c3RmtxSkpqd2EvbmlqSHY3?=
 =?utf-8?B?WHlFMGJKTDZrd3c5QmJoMStQYWJKeEhtc3FxM3Z4R3pkWDlURlBBYlN4eThO?=
 =?utf-8?B?ZjdUbnAvUEg4Sm5YSVI4Y3dUd3E4WG5lZzYxdkhTcnFJUVZvRWxQYnhtNU5N?=
 =?utf-8?B?NEgzMkdnOEQzVXBBeklSV0lQNnhWdG5rMGZ5dzZqTlN4SHRVV0xNN25WREZ0?=
 =?utf-8?B?MVBFR0hDblY4TFRmVE5sUjVnNlVCcFMyZVF2NHo4Vmp2dlEzZGRkWXdtMFN3?=
 =?utf-8?B?cUdxQ1g1WGJta2EvT1NjTUIwbXF5T2VKN1ZweVNMTHBXSjRpbUdwOFlKK01y?=
 =?utf-8?B?aXFzTzdqbzFkS3hqeVpIUDREbVFVRzVaMU1DVnBmNko0dThnaVRIamlEanI2?=
 =?utf-8?B?YVhPTHgvUWc1THhGa3l2VkZrWE1xK25IcForSXl1by95ZE9FMkVNeHRadFZi?=
 =?utf-8?B?ODI3ZVJURmJBYXllSFY1U0F3Z3JXWitFWlRqd0VZUk5lcE5GQ09XQkdqcjVU?=
 =?utf-8?B?bzJOVEZMcXVvQW5LQU12a0RhMVpSZlFHYWpvT1dpb1hnMWRiOUQwbFNFdzRy?=
 =?utf-8?B?RGkvSUZJaFJtK2dPRXBPck9QY05OSFNybTkxSVQ1TU5oUm1OeWVFTCs2Qjlt?=
 =?utf-8?B?UTRLbUppNEduQXAyazl4UE9oVlBIZFdwN0Q4b2czclgwYlNPT2Y2akF6TzFz?=
 =?utf-8?B?MVhiYW5jeWxYbUFjM1BDSDVhK054a3dSK1RSblRlY3VORmJ0SEFyUHRVWWY2?=
 =?utf-8?B?YlFYRkN5NlQwcTNhcjEwcWhnL0ozNjdXeWpScUpWSFFWSjVETG93eVI4d1dW?=
 =?utf-8?B?czdTSEUwN3UvOVRVblRxaVZHVEhlVHBEN1RpYSt3SGs4NzUzQTM1Tms0RUU5?=
 =?utf-8?B?K09TcEtySWhsWnpoTVNUOEVRam5DaitHY0k3SnFmZEdCMURjeEtmbkRPNmRI?=
 =?utf-8?B?Y0l1MUFmQUd5YlllYkdMVVA1alltUFVKTytLZ1pvYko0U1NDajQ3eHRRWVJj?=
 =?utf-8?B?UjFvTm1KZTlXNElISng4cFYyRnAyWWZ0a3dnV2QvVWhnTCtDNjNDa1VzQVlH?=
 =?utf-8?Q?focC+DGNA5G+mxlV6hn8ixhkx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af49976a-1184-4b58-76f9-08de1b3d9920
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 01:00:51.1099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8RBikrfcw0UMcWf811FYX0tOE0ZvDEfe3/pBQJkGFNj78caOK7B0E+q8nqjr2kVibQ9x7WDmMScjm7rjDnYJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470
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



On 11/3/2025 6:50 PM, Alexandre Courbot wrote:
> On Tue Nov 4, 2025 at 5:04 AM JST, Joel Fernandes wrote:
>> Hi Alex,
>> Nice improvement, a nit:
>>
>> On Wed, Oct 29, 2025 at 12:07:37AM +0900, Alexandre Courbot wrote:
>> [..]
>>>  impl PmuLookupTable {
>>>      fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>>> -        if data.len() < 4 {
>>> -            return Err(EINVAL);
>>> -        }
>>> +        let header = PmuLookupTableHeader::from_bytes_copy_prefix(data)
>>> +            .ok_or(EINVAL)?
>>> +            .0;
>>
>> Can we change to the following, it is easier to read than using `.0` IMO.
>>
>>  let (header, _rest) = PmuLookupTableHeader::from_bytes_copy_prefix(data)
>>       .ok_or(EINVAL)?;
>>
>> (and similarly in the other patches).
> 
> We can use `let (header, _) =` to make sure the unused remainder is not
> bound to any variable. That also turns that statement into a one-liner.
> 

Perfect, that's even better, thanks!

 - Joel

