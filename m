Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0880ED1F45F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 15:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E870410E0A9;
	Wed, 14 Jan 2026 14:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="liCNZj4D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AE610E0A9;
 Wed, 14 Jan 2026 14:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtEA72Z+AoYJSAoNihj9v525S6ycH96bNBcr6MP1eDZvguDNfXbKkeAghBU1FTz2CwfliV6kECdfhQR0uCK+XYg1qup8rfMiCpFPxaL67tNBct9u7MfTjAPSEE35SX+OS+Nx2UvLBr5oriboIaReGiBMSjOT6vhHGRVC0i5MIilcd10piRScP+6oMhAHde/N2wcT+l667yRROXkNBORIdoayRbykoovuqRZtoHpkRkEy0cWh1FscD489YJMEH4+VMQuOkwo2ae90/WJjLPApmwO8GpOhA+0+ZpyoysZjlswvDFnFa4esV4TczIVUrUN6uox1wzwpFm3kQ0/pIdmlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sllNcyHE3CkcREgPlpwlzmfuS8pqNbb4Ik1Edmz59hs=;
 b=hWGuA6x9eUS05KmzWBmE7FVK83WKVGA3jeFOFITIZW5hkCYw8u5XtpyNnryb9g294cdgwgBxemoRUxmj+6vOzSLRUmxKvV04uakHgA2B3WvgQqIRbiq0sJTfwiiQwz/Hk4K2rDeizCsTE6TDkH0A70PyY07qI1v98qpesER5oDNStPDofkAM/OXt1nV1FLF86pEMw6DgElXlpR3x2xXidQ0WlKMg0nusPa4XbnXApu7QfD0PjsPz3DF2B5pBE3yJX4oOeKCU0tdPU6Jwpw1z+KaelrsUiNs9Gq0ANc4jil9eWRadLpQ2ZvTWd2TUXlo5bw1U3lWGmePuLY+qVUya9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sllNcyHE3CkcREgPlpwlzmfuS8pqNbb4Ik1Edmz59hs=;
 b=liCNZj4D4ibrt9ovHN2eKqZ0DpnOdVtakQJfPfJnUjyTustxI9u69Rnt95+5YUr6f3LZPiwgenALjW9naB4gJNSz5mk3vEsi+1a0OvwxK56ng8noZmdFfukFG0nw6pOrgFZsaDWlopm/y2asGWG2AlEKW3ZMgb9T4DhR27bAuTQXnRYU30CJdqSye8G8VX2ypj/nzfB5pTSBe1PMh9T3TBNXeT/iYU6LjfUKOuWR20xXDIJ9762mrv8GPriFeG9Qt/eoH+TM3RNZSzNAl/qovNlRl/k90T9Ja8hSGIMiRQRiBjB2HqY0HhAGpGJHuWuYNhJXL9xN/48BJtHDqECglA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 14:02:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 14:02:53 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 23:02:51 +0900
Message-Id: <DFOD9BX2FHP2.X5ST15IMUR1G@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "lossin@kernel.org" <lossin@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "boqun.feng@gmail.com"
 <boqun.feng@gmail.com>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "kwilczynski@kernel.org"
 <kwilczynski@kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "Alistair Popple"
 <apopple@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
 <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
 <DF1VQ45KF0JL.3E3GIL93DGBWL@nvidia.com>
 <64be6d1f5fd70c8f0e3988d4220212b9f3d1d418.camel@nvidia.com>
In-Reply-To: <64be6d1f5fd70c8f0e3988d4220212b9f3d1d418.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fff3f8-95f3-4606-630f-08de53759c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkVleEk0L0JKY0FNQWRCc0tWQTV5ZUJ2UjBNY0lSbWlaUkQyM1JiNENWbFNG?=
 =?utf-8?B?WjNqc2FQTm4vZWttUEYwQ3RhTHBFcGUxOE1zSFNSRy9pV3FpdHJJRWNlczVE?=
 =?utf-8?B?WDNJUU1GdmNQaUZaVWJCNUora1JQcEc0UVpsdmljWlFwK2p5Sm5CY3lsdjMz?=
 =?utf-8?B?emdqT0xHTnpGVk9lRVR1YUxJWERGT0krdE0rU0xKZVVmZG1NOHIwRUtCcGx3?=
 =?utf-8?B?QWROZElWdDNDMGorZHZEekMxWnNlSEFnbmcraXN0YXJ3enJ5RnZRdkdIazhQ?=
 =?utf-8?B?elcwditpN1VnaytuT1NZYjN3VnR1bS9nZXZmWkxSWkNuS2p5dE5iRjhleFhX?=
 =?utf-8?B?NXlCNTVmb3pzY3NZQ1pJUHQ2VmtneGpjSkpCNlJaSldGSGgyRXErbE9XRmFm?=
 =?utf-8?B?dzZrY3JSUjdseUlVcmVhQkdpRW9KbEswK3M4eEtKUjVYQlhuQU1PRWowMXVw?=
 =?utf-8?B?aUZoK0Z1NW83ZDZlZVlvMkxQaG1MRGkvcGUwaDdmcE9zYmNtWTZoZFJUUVFP?=
 =?utf-8?B?NTJTaThaVzV6ZVB1bU9qbDQ4eVFkNUc0eTB0NHkxdXhnaVpCQ1BzaG4xcmRK?=
 =?utf-8?B?K1E0Z1hJcGVZY2k0aFI2MzQ4ZWpxVGpsQ0NkWDRLSDBENWZOZ2xXb0Q0M2lh?=
 =?utf-8?B?TERac21mZVgydEdraUNXU3l5U04wd2JwaGh1UWY1bElMcnFyaDVwdlpTRFRr?=
 =?utf-8?B?TWp6SUJSZHpBd1k5Q1U2M0FzbHdEV1dkSDRCV0xMRGs2UXoyaTBvYjJkSVhL?=
 =?utf-8?B?bm1TSzdNS1VYLzNXcGlybm9xR3ArMHhJamFXMUJhVVB0ZS9wNXN4VE81cGVL?=
 =?utf-8?B?c1FEUW5IZUtvQmdiaFV3bFhRK2t4bTFzUWh3RmRieFhKUHQ5ZkJjbmZhQ3Ja?=
 =?utf-8?B?amFkblRrYk1qSlZjQjNnWHY2TjM0S2hIQldhYzRYRWFLMWtDVlNKaEl2UlVk?=
 =?utf-8?B?M2FBenpUam5aZ2l5d0h2aEFqVzVTZ0hxYWNuQ0dIVVg0UmV3RU9OT2FPYnh5?=
 =?utf-8?B?ZGVLR2NzQmFSeEM0VWdVN1M2UEZSdDRNeWVtcDhNa1FDR3F5a3IxeHIyL3N6?=
 =?utf-8?B?M3pTaEJTSURsZTI0Z21tNWV2VUwzTHk2OEc1Z2NiTVFLQVNvU1BmbXFscnhX?=
 =?utf-8?B?TXRMTjQzLzFLR3lxMDdndUNGWXRJbUUxUVR6NnJLa3pNam5kbmViZ2lNbytY?=
 =?utf-8?B?dW53ZUJNUEJBNVBsTTJxcnpFWHFCSHMwVXpYSDV5ZkVaTy9SOGdyK01QQU5Z?=
 =?utf-8?B?ZGZqWHljeVJNK1BnYWRxcmpKcDAyYjJ1dVk3OHZwVzhHR25FZHhWS3VTeisr?=
 =?utf-8?B?czhPN2ZiZ0pZVnVpOEtXdytmcXlnVU9CUGFoVEpXWVR2UkIrMnFwZ1FGUnZI?=
 =?utf-8?B?NjZsZGVuU1A1L1FkMW1CbHBmUmZkd2g4WjJDd0VLNkNzTXFRV3VQTnRjL2VL?=
 =?utf-8?B?SFkvMGlxMUJjejgzdG83bmUrejBpN0l3Z04yYWRrWVZ2RStGbmQrRXA1RE5H?=
 =?utf-8?B?enBFME92YnQxWmJKa2VQNHFETFN4bEthL05XaWFLQXdMTFRMT1RUbk96RnFX?=
 =?utf-8?B?MHNmMDk5Ym95bG9RK3AyYk5xNFYvUGl1aXoydWp6V2ppRFdNZ05hMmIxN2R5?=
 =?utf-8?B?OGdPcXlkZ3lCblJlUHM4Tm1oUUU2R0NDZFlnUE5PTmdTTE5nNnJzeDRiaWg5?=
 =?utf-8?B?WFY0ay95cGVZY24wUUhBVVJucGo2SG1NemJlNXhIV010SGpQd2dpTjBvT1J2?=
 =?utf-8?B?N2NXeGFkZzQvZFBoZ1dPdUFMcU9obUkyajJNZm5tSmM3MDdOWkU4czhVYkhZ?=
 =?utf-8?B?WkdRV0c3MTU0bGdBdFFIcllEdGJ5bFAza1lDTVlGeDZGUWNMM2dnSDhoOHgv?=
 =?utf-8?B?TDYwcVpEekQ0T2t1Y2RqeEhEYmlkUTVxNlRTNE15MUxVQVMwem11c3dZTjlX?=
 =?utf-8?B?aldQS05BSUlPMzhaRWpjeWlyNE5DQU0ySEMxR1NBVEJUUWlINUNabExsMlZ0?=
 =?utf-8?B?amYzMVBITUVYQ01rRWhWZHdnNUZoSWR5NExzVXBOWDg2K1RhRkRrZmN4LzZl?=
 =?utf-8?B?MC9KQmNKWmNRaVU2NFU2b2xPby83bW1TWStVcFo4RnBpYXJId0VycG1kc0FJ?=
 =?utf-8?Q?rOtg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZLRm5PK0lzOE5ORjZkY2VoajJoRTViSWtQRmNjVVJhMmJxTlJlU2tmaUhp?=
 =?utf-8?B?STFHek5HVmUrR0J4cXhiRSs3MDZSTWhUWnpzSzJjeVRNdi9MTnp1RDFKNjVt?=
 =?utf-8?B?aXVPYTh4TVU2TjY2eUFBbm1uU1M5VWlTcUh1K1VKTUROSmJIRSt1akxUait2?=
 =?utf-8?B?b1NRdmNLcUIzSDlnS1FBd2RDR0ZHTkJmdmJmbkhzaDE2ODNHcWx2NlhDR0Va?=
 =?utf-8?B?UmRESTZPV1NaelFwQXJsUlNIaVVUMmVLRlFsTzVIYmV2MEduSDB2bDc3ZGV3?=
 =?utf-8?B?ZTVjQ0FNUXJ2K1U2SEZFSHA3Y1hFandNL2FTbWdSaXNIOWtTL1BkNnhGaVdq?=
 =?utf-8?B?SlZYT05ZU3V4QW03Wi9WbytpeGMyeFNka0d1RFVvMXh6RHVud1ZvMGRzSTlB?=
 =?utf-8?B?SUkwdlNqdGFDd1hDT2sycEpQeEJtWC9ZUU5WVE51MHRtL0MyLytqS3duMkdQ?=
 =?utf-8?B?TVRISzZOU1VyZm1tTzl1dW9UNW9DRW1ROUNVL3dJOEd1M2VycjdPZ1U5bjNo?=
 =?utf-8?B?TkJCUGloVzlGRldMczJ5bXRvNWNqakhHMFMycHd1b2Z2QlJEZGs3dmV6aVZt?=
 =?utf-8?B?c1phaHpnZ2RPUEdGbzk3ZVl1M09iL2l4cC9tcm1sRUdpbW5zYXh0NE9QZDh1?=
 =?utf-8?B?NHJMNThNWmNKN1pKU0FUcksvTnRhZzF1MzdEOENmMHNOcjQ1YUFzaTRXVUs0?=
 =?utf-8?B?dGpTWG5yRnJ6Ym9mNDdDbnZHYjBqNVVTdXNrc21kRHQyQWhuSzFuZURqSi9H?=
 =?utf-8?B?QnZkcVZaVXVNcFQ4V29pcW5aRWptT1VKL3IzMTdMN2lXaGVDNzJtMDRHZ1V0?=
 =?utf-8?B?YitwM3V5NzZzS1I3aVpYaDNVYy9NSWF1cGVSa3d0aTRqNFcrenduMDV0cUFV?=
 =?utf-8?B?YlcyQTlnUFM3WkJhMEZ3NW0yR1U1aEx1Qm1oelZRNlh5Y3pUQTlVdFhQVGRw?=
 =?utf-8?B?UVViVlEvT1hrTEhDNGxTSklUakZ3OFZWcitqZmo5YU96a0VXU0tPbWdQaWNn?=
 =?utf-8?B?TGhhbkpzVFZ1TFZOeHFObkhCb0lXYjUwUVdKbUJZbVZWazNxR1lDUjJPdHNP?=
 =?utf-8?B?S3R3cXZ1Tm0xQWw2aHFmM3BHVTNVRk91WDNBTTkxSk92R3Avd3FtMlE4dXpS?=
 =?utf-8?B?ZFFkVHVseGQ0dENqT2psbndLYTVCelpkbEVrSlllb3d0Tmt6eVhJRTZOMnJT?=
 =?utf-8?B?WUp3cU1ZeE42a0JSY3BqOUhlcUxNODR4cnFna2ROa3g5RHV6R2xsTEJDOUVk?=
 =?utf-8?B?QXgwaTcxSkZtZGFrOVVLcHNYVEZHV3Fubkw0VGlpU1NNeU9PWlMyRy9xUFBY?=
 =?utf-8?B?NUJnNFlnaHdQVGQ0aVFLZlg0YllrOGhORHM1ZmFyYUFNTDkzYU1UbmtRK2tD?=
 =?utf-8?B?WnYvQzYzRXBKLzBNS3F3bEhBaG5QVmFPZENoOFJZelZiVjlQeG1OeVZ5Z2lV?=
 =?utf-8?B?bXdZVHk0NmN3QUZvQTR0cm8yNGJzK1JUbmhKMFUyOXlzVmUvcjcyWDN3MzF4?=
 =?utf-8?B?TDYyOTVUZ2IyNDFPelhmbnRnRlhQU2RkSDJQbzBkRWtXT0V2YlVDeXpvaW1H?=
 =?utf-8?B?RXZscDRYdjhpcFJ3UUhCWWlmZWJQT3UzK3NUVE96SVNLYlByTVZsUjlrbUF1?=
 =?utf-8?B?U1RBRkJzV1UwZWU5WWovcVB5MG9ycFhKY1BzWm5XMktvSDQ2MWlKYXBhZzRw?=
 =?utf-8?B?bXBBQXpIcHZnQ3pIbjNXYjBvOVMyNHZZc1ZQRk1uN3NXVWl4QkkrbmFCV1hI?=
 =?utf-8?B?c25kYVUxcWJDZnZLMm4wZHV4Y2RQK3lOYmhod2IyWnRDUS9NMXQ0TDA2WkNQ?=
 =?utf-8?B?R2tPamtCNGRpS2RCa1lKYWlNTnlmeEdmSWU1cHVnTkpFbDJ3bDUzYk9LcUtT?=
 =?utf-8?B?Si83enZ4WUhCVlY0WlV2WG1uRlM1TEs3a2o0cXB5RGoyMTdDSDJ4TUNPLzE4?=
 =?utf-8?B?andVekp3OWR1dlBxMGd4NVlXMS95enZXMVdHTzFyNjJ0ZzVNdGZHOHlQUGtm?=
 =?utf-8?B?dHJyVm9ySTVYS3QyZG9OLy9UQWtEZXdPcmtMWElnZ3J4Y0hmR0pwVzVObXdJ?=
 =?utf-8?B?TWpoMjFQcGFabzJrb0JGNWxNOWtxeEVFMHh4QkxIbXFZTTg0MWVxNFc4ZFc2?=
 =?utf-8?B?UkFyR1VkdlNEVy8xVWR1QU5yRGVmTnVaS0pwc0c3TU96TVd3N3doempyZk1u?=
 =?utf-8?B?M3hyMTlpSW50TXhMVGpLV2ZlQTZMV3p2MjhGMkdWaDNwTWE1d1BhM21kYzJO?=
 =?utf-8?B?U1VvcXZyZVkrUlIzZVRTckRiMkNNWHFNaFN2MjFjeFFtUFA1ZzY3bmZpT0Ri?=
 =?utf-8?B?Y29Fc2RWeWIwT0RYdlBEeFJkNFNBbmtudGJWU0d2c3U0VGhhWHJoQi8zZStR?=
 =?utf-8?Q?nDj+XK61eXZbcQLkaUX14t16K7TtZNqKxB3HcfgYuoR9F?=
X-MS-Exchange-AntiSpam-MessageData-1: LVPF3Kvxd3rJhw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fff3f8-95f3-4606-630f-08de53759c91
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 14:02:53.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0X0fvBXH+Cn1Z4B15N8JYCevXSSU3vdk4nLdyMI17lzuZ+QB4BxLhqbQpp5tBBxua6GyvzPrWgq8+gZzSWyYiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229
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

On Sun Dec 21, 2025 at 6:30 AM JST, Timur Tabi wrote:
> On Fri, 2025-12-19 at 12:39 +0900, Alexandre Courbot wrote:
>
>
>
>> Does Nouveau really handle all messages asynchronously? Just taking a
>> look at `r535_gsp_rpc_send` I see:
>>=20
>> * A potential busy-loop with `r535_gsp_rpc_handle_reply`, An argument to
>> * define whether we should wait for a reply (`policy`).
>>=20
>> So it seems like each GSP command expecting a reply is effectively
>> looping until it arrives, with some messages (LIBOS_PRINT, SEQUENCER,
>> etc.) being managed by a notifier registered with the command queue. But
>> messages sent explicitly by the driver don't seem to make use of it and
>> instead process messages until they find their reply.
>
> Yes, you're right.  But the difference is that in Nouveau, all message pr=
ocessing is handled by
> r535_gsp_msg_recv(), which always also handles all of the asynchronous "o=
ther" messages.
>
> The above `loop` expression in Nova doesn't do that.  It's missing the as=
ynchronous handler.=20
> This is the crux of my concern.

I agree with you that this is something we want to improve (either by
adding a handler to the loop, or some other way). It should be its own
patch series once we have better visibility about how we want to handle
message, as the current implementation is still very crude and ad-hoc.

