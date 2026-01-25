Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oV+rKpEzdmkQNgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 16:15:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7288121C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 16:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A6010E0E3;
	Sun, 25 Jan 2026 15:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QneWw4NR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA4710E0E3;
 Sun, 25 Jan 2026 15:15:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uglv6w3tpO8+ArAupBEY+7+RGdGAVWNZt345syXmy0GYPkA2QMlhmnb8n9qrGKUy+hClaM2aONDaM3ApAHAGvWkGoBfbmg0s+pcncKvXphUi8q/uDOjbZL5S5nWAy0waGIcrSwez3JI3/3Pt3VPhU84npO/LkLBmyPnnvBmdHn6G1CThH7dkwADB4RAWtmGJIDUXExKVI1ILJXI+K05PzK6oi/mv142icWU+7H/WXaotxGeTesE3c4gUtLzcu52PgFncrLopF5knBhmBekj2MsX3GMuI2AxlkN1IN5zSWSc17CBDaCJV0XXwHqfCoAc2H4UQxxEZ3EvOUA5XrA/ydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sy7VG+XLraWXf5HqysCxThdHZaH5gM5XfrAlArvlT4U=;
 b=Eiu/tvtRiKfU0LiBU2Ndt1yYqHg1SGUDaRb0J4D427MmWHxXEFMxx8kxGKCFPhHkTqUXu1aDafkc2MEHDx5zmzPWueFGpS5DJtf7UqhkLidSDgMXv4Mt5TvTFxyp160vUVfTOGmi18HbXNlxd18gAkxvwGqZazRMuJ07lSSa8Zo4CI3IrGfuuvEo8h29dXiRzON00NSuqR8h/kTX8zlTBjt/VDZlSj3zhRECuJTH/urBUcij7zKfIO7OgiRvQu9pzoBwX+heOeKhhBazWLhnvRzwMp9jKV+qVhYvU0GkDa9dPqrFaQxuhFQWztt1bACx2HJnaJg8MXls+2FWFvT6RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sy7VG+XLraWXf5HqysCxThdHZaH5gM5XfrAlArvlT4U=;
 b=QneWw4NRBjaVRqzCf6/j7Np6txTE0+1K5gOr4fsd9kUmvPlPkIIqvp5HH/8bqmX56QH+OyvwAbF+iNI4if2MO0bOCS9Tlrj0AW21ZfkkG7ePYlBKixi2T26PFhbb0TDmGzHltbKtBpciL229XeW3zZ4j2D6mJ3eYvWbcUGnfVo7Qk3iaQxCJFsmL1vwRmQ7fBxJiHOL4YRd6mEYzATwPdh5AIIpBMvDXNvuz6AxhxdYu8PT1E4F9Tb1xNiiNEjWvOdc2C5HMyo+n9EYOJO0PjgvgAMJPcFQf7H1EuRP66lpdtWsSw4paOu3YIXXN+W3GmGOCx8JwwzJaGYXZWT/log==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BN7PPFA42F4F89B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6dd)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sun, 25 Jan
 2026 15:15:18 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Sun, 25 Jan 2026
 15:15:18 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	<nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
In-Reply-To: <8d930ac7-11b1-437b-be18-7a785f20a72f@gmail.com>
References: <8d930ac7-11b1-437b-be18-7a785f20a72f@gmail.com>
Message-ID: <1769354007.1899374.21094@nvidia.com>
Date: Sun, 25 Jan 2026 10:13:27 -0500
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: MN2PR20CA0054.namprd20.prod.outlook.com
 (2603:10b6:208:235::23) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BN7PPFA42F4F89B:EE_
X-MS-Office365-Filtering-Correlation-Id: edfab0e4-e0a5-448e-6ebe-08de5c248c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|4676001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFVWUjM3M1MzNTkzL3ZFOTE0SlZjaTlJN3dGRjNPZGoxVHNBUmZXaU44T3gz?=
 =?utf-8?B?d1V1emFBdG4wSmxsTjNjdmhiMTlRbWJJdnREVERocmZjWXcxN0hBNExUSlZY?=
 =?utf-8?B?ZjU1QjhUdFRVUEpubVJmRTBOZUtCRnFIbW8rUHBUVzkvbmRYekpZZ0VRQ0R6?=
 =?utf-8?B?bHA2MDVHczFqeUJjaFM3dGdYMDljRytUcGlXV0lhaW5pUnQ5c1ZZWHhwWWhr?=
 =?utf-8?B?OEZ0VWI0N0lxSEhJQ1pTZnRsZ29hMUhJZUF3ZFMrRllYWUhWbXQvN3A1aFEv?=
 =?utf-8?B?ZE1Ub2psaEl1U3V2K3ZBYm1RR0dxYitycDVNTStUQ2l2Y0VacENIQmZoL0RQ?=
 =?utf-8?B?K1g1MnJnNzJaYzZ0UDI2QldrZ1N6WEk2SXRWR256eGNaNEVqZ1UxUWROVGc0?=
 =?utf-8?B?Mi9BOGxFWlRsclk5QW1rZ1czdEdEcW43SWd3SlNMc1JZQ0djcEN2SlRXZU9C?=
 =?utf-8?B?cWhuOHFiMHh1d3pYYVJXQXhFcFRwN3FsVi9vUjJoQ1BKR1lNZEN1UTVKbzFi?=
 =?utf-8?B?dyt2c0gyenRVU3dURjFsTFlOK0V3N0JLaVIyWTdFc1hLK1hhSnpwVitZalpk?=
 =?utf-8?B?K05HUGUxbW1EZVl5UEI5eEYrSFdwa0wraU9SQUFSTHVJRXFFZ1h0T05TWWlP?=
 =?utf-8?B?VjFWaDBnVS8rVnZxcmtHQzRmTFFDdmNKeUtUeGQrYmxlSFE0dVZ4N1owQm1T?=
 =?utf-8?B?UjNucFo0c2hxcWhra3pZSDNPZmtJNWtYRFByaHlLcWFqdnRPNFNJTlpzanV5?=
 =?utf-8?B?ZHBXYkR2M2ZpQjJBRGtKYVNrZmtIejUrU01IVmNROStZUHFVZ0JhTk9ZRm4r?=
 =?utf-8?B?U0VrL3ZSM0huVW0yRU9YSm5tdjZUSVdsaTF3dkxpbFVkc0tTNGpEMFNhNGEz?=
 =?utf-8?B?OXAyenN0U011Q0hKMnB0VXd1bm16YS8rTjVTWDFZU1NNMTYvcHU4YWQ0bDNl?=
 =?utf-8?B?bEc5QmtzSzNzS2FkNWpNWE1mWG5qN2RqbWJnVGV6eGM2MUhITEh5bTllT3F0?=
 =?utf-8?B?S2hyU1JRaEp4TVRCVC96a3RZbE9mZFBWRW41bk80V3lzUm15QnlNeG5PdUZ3?=
 =?utf-8?B?c2prb3Q3N2lLdnQ2cFV2S0RUSjBVLzBCYysxcWJxcWNJQUZqck1henFTVE1V?=
 =?utf-8?B?WFlkbTBCODRJOUxiSUx2eFNZOUptUUJhOFcxTW0raVE5U0JFVUZTL3ZlSkNW?=
 =?utf-8?B?Vk5aMGdqa09EWkY4bXlQNHF5Z0pIcnBnRHAzQTBSOGJWa0d4ZXdhTDNibVV6?=
 =?utf-8?B?YUdjMWJHQmNSUUs0Qjd1Ry9QMjVmbkhhVi9qSVFtVUtCR2cxT1dvVWg2QTIr?=
 =?utf-8?B?aklOckoyd0RUeHZLL1hldlVOWHVlYTN3a2FKb1ZKUXlCUzM2M0hrRDdnbHhm?=
 =?utf-8?B?RU5OWmI1akZvQldOc1NXc0JtSDRkS3NBOUtFcmpKVkJqSi9OZ0huLzBnRjVT?=
 =?utf-8?B?MDNIUWswekFhRUd3eW5QT2YxdTV0UlZjTW9VbGk2dlNCTlM1R1pTQjRmSFVN?=
 =?utf-8?B?L2p5ZHdJbXgvbHR5ZmpMRW9mSFQ1SXQ1eHo2TEhNbEZzVENDbnpXV25WT0RR?=
 =?utf-8?B?dHVCa1NFQXJYL3ZyWFVyRkZKckhFK0dOVkd1azJWSlcvWnYzcG80N215ai9x?=
 =?utf-8?B?Q0xyVkdJd1lxbEgwL0pmVXNlR01WaFZqZTRQWFF4cDNxNm5kNVlDUjNQeDgz?=
 =?utf-8?B?VHo4Ris2bm5SVDBKK2JpVkNXVXFUWmppeEV0TmJvTndrdXUrWVVkU1VuYlBS?=
 =?utf-8?B?NGU2NDNhdTY5NXYzS1VpejNNR25rK1JLcXU3d01lR3k2alh2d1YxYUF3bFp0?=
 =?utf-8?B?aUtmN1Ntc3hDVjNid1lYUDhmUUJ1K2IraVQ1MGZ6RlM4SjhMT0VFSktMbjJH?=
 =?utf-8?B?RTY2b1N2NTlCOGpjek9NLzBwQTVwOXA4WUJKb3hwRExhbmxaTnFPL3BxUzdD?=
 =?utf-8?B?c3EyMm0yd2pCL2NNRVBRdGQzd1dHNFludWJCejFhTjNVemZ5amlNRWtDQktR?=
 =?utf-8?B?ZFg5d3RSV2Nrc2xFRktBcDBLR3BNSVFuMk1hYzlqWXA4SDUrQ252VFNWNXhw?=
 =?utf-8?B?OTZVMEtSUk56bTZoVHJBSFM5S1FzOGxaeHlCWDlxQ3E4WG9Fd2cvMjlTR2U4?=
 =?utf-8?B?Mzc5Rlc5VzFZTHRsY0VpNGZZd014TDVlNzFaVVJsQ0JCQzM4aGd3ek1yN1VB?=
 =?utf-8?B?Tnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(4676001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXpsb3VnK1FmRlY1OEh0a2RJTkE0V1F3VVc5RWdEVHpRN2FwNlZxMTBINENi?=
 =?utf-8?B?OXRGME5IeDBnc3hQM2FFbVhWY1ozVXhzbW9YZGpKQnl1TCttSXJXOC9sSWpC?=
 =?utf-8?B?OFFtNnJyVW96dG04dGE2cFJvdEp3VnJwc0k0QjRaTit6OE9GK1ByVitieEdq?=
 =?utf-8?B?ckxtRWRqN1EwWk85dTFmR01OQ3FCdWJCblBlV0FEMEp4eXh4V005VFRiOUhQ?=
 =?utf-8?B?T2QrUnF4QXgyb25XaWZYODYxR3g0dXl6NGdKZEhVdWxYZzVYNWFTMDhQQzZq?=
 =?utf-8?B?dVU1YjF3aHEraDlWT3BLSkVrdXUrVlpjWDBqRVVoa3RqOUxxM2dYV0JsVmxG?=
 =?utf-8?B?VzJubTJob21SczJLOUZ2RG9GdTFQY2Z4UGVZcUJQdkhWUXphQzROMjBNeFJz?=
 =?utf-8?B?aVMrZ0FxSkpBcXV1dDVuSGxtSEpUai9kbVZwT2ZRL1diOWo2RGNDdWR6NUh0?=
 =?utf-8?B?cFpsQm5UekJkd2ptSTd6b3h0THh1Z1dkcGlHK1RhcVN0MTd4RXFCZThHZVVG?=
 =?utf-8?B?elYvQzNSTmJqaDFNL093V21pNU11ZGhOOGU2aHFoNnlhbjNLQktPTWlPSUpR?=
 =?utf-8?B?dFkxeXdTRjROcVI1dWI3NCtUcGdXUDRteXVhOERNTEd3WGhzWFB3ZkRKSlhn?=
 =?utf-8?B?enBLbzIyN2l3WFkvM2F6RG5Nc1ZBZ2ZYeldTUmRXdjZOVEJXOGU2ODd4NkUy?=
 =?utf-8?B?cGc1ajc1R3pnVHp2dUpFbkltNHR4QkVOcmNMZVc3STVKNy8yRlFFeTRRanBl?=
 =?utf-8?B?VnZqekJvbHRkWDFUQndJMzl0TkpWMUwwU2tHZkY5YmRxUkhGRXJuOFJDV1dG?=
 =?utf-8?B?a2xBd0x0dnZocEtUTlAvYXpzQWNiVFpIYmdOSXlZTGIreFExWWJ2RGlXWURv?=
 =?utf-8?B?NWMyQnlieTNjRkMxNjRpc005V0YyV3hJelY4RjJZSnZEelQ1QVptd0VDY0hv?=
 =?utf-8?B?VWhGQmNDbktlRnYwKzgyMWVaWFhVYjhFcXJUQkc0cHdEaUNtbHhVUFNsOHFr?=
 =?utf-8?B?Qzl6UmliRk03MERzMHBhUlZZQ1J4UURGY1JTZmFqancyam9MSUhPT05hTDVF?=
 =?utf-8?B?U2hCYkJveFFRNU9NcUFuMmJMRVNMVS9mMXExUEJWcWNqb2ZPVG1WTEVUOGpa?=
 =?utf-8?B?MCtJNjh5QjRhT3lGRC85MHZ3OUpPNFR4Q2daaXdQY2xMVE9PRWRLUmhRVkh5?=
 =?utf-8?B?OE5YdS9ONUpEaExQcWpNQ2QwUHhrNytiNjArNG1uK01HbTlmRkxDV21tdkhT?=
 =?utf-8?B?dGMzcEhxZkVIWS9YRm9PR3A5UlBhR2hkUmFsVWZzMWFHeGhmR3VtTWJmZy9h?=
 =?utf-8?B?eTM4RjAwM2NTajNlSy91Z2pVZjFqWHQ5dDlEbUNESzJ2VHlSVDMrVloyZ3ZE?=
 =?utf-8?B?RjhaME15SU5RR0RPazkvR1BjWUNqSzVsalZFeUIwa0FOWVV6ejRpT0R2bUls?=
 =?utf-8?B?QmFIZ0hlendlVE50emtUWjlLdHFmWXBRcVdLV09DSWh5STcxMGl1RWJ6NDRD?=
 =?utf-8?B?NjZ6SWM5SWdqU3FTMTlkY3RTcHZJT3c0bnhOREtNWkxMK1VyNGlQbjVLWkZI?=
 =?utf-8?B?Qmg2WVhUanNTSEZRNk00NC9hSWpnRTJHSzdoRGpMY0RuWUhZUzBCc3JSd3ZM?=
 =?utf-8?B?SjRjNXltRlE3ZmZVS3ZRL1l6bmJyQnkxUzFCWXRLa2hVcWhlMWlyOC9uMkJ3?=
 =?utf-8?B?eStDdFpxRzEzNTVoVDVteEVUQU1naXhYUnhuNTV4VDd3TWNDWGVQWmpLWCtH?=
 =?utf-8?B?UUZSdEowcXBaQXdQZ2Z2cmczazQ1VDc4RGxqSWN2bkhLeHh5amNVT004d0pL?=
 =?utf-8?B?NkJzWGhNRzg3Q2M4cFFNMFhXWjdLREpPNFVxb05RZ09IWmRlZUJEWG9VZ3BU?=
 =?utf-8?B?eUl5RVJwZnVwVW8vdTJ5ZURuL21YQjltTDlMRjlSL0hGSDlSRDcrdWYyUEh1?=
 =?utf-8?B?bklZQUdTbFVGWk1Vb2lmWXNnRUp3bGtZUFdncUFjSERBbzRDZUxaT1pWa1dS?=
 =?utf-8?B?Y3g3eVZPam1Rc2xMek91Z0wzSzNkcFpVWUZQUmRBV2t4N2JzSFVncEVYUEJE?=
 =?utf-8?B?eHVidFdtQkpGL2hTUTlveE52SkorY0V1SUxrYzQvbEhUUi96OURSTGZXQmxQ?=
 =?utf-8?B?akxEWjUzSC90eG5YOHJlRW0wOUZJZEJTQ21FUE9DcGdGa3FieC8ySGw3Nmdr?=
 =?utf-8?B?Ymszc3hCYWw4Ynp4c3FvejdEMGV4VlZPcW5oKzI3bjQvQVNOMEhheWlVTXVj?=
 =?utf-8?B?dXV5Yk1SUDd0djdsUUc3VmZ6L29nSWdQVU5ZZjh2aVVxUnV2RlRWbG1WMS9U?=
 =?utf-8?B?TC9SOXhuR2puamlIclFXaExINlNCck0xTW1ORHBjdmprSk13RW9FQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfab0e4-e0a5-448e-6ebe-08de5c248c84
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2026 15:15:18.0783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ds27XFTQvCk+C4DzhB/Xp6b5bA8BSTzHlx6Mtm5inZfHHx8hyM9zM4EDNakeZY7NnmnD9M/oHkspFmvATaH/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA42F4F89B
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3B7288121C
X-Rspamd-Action: no action

On Jan 25, 2026, at 4:09 AM, Dirk Behme <dirk.behme@gmail.com> wrote:
>
> Hi Joel,
>
> On 25.01.26 00:18, Joel Fernandes wrote:
>> Use checked_add() and checked_mul() when computing offsets from
>> firmware-provided values in new_fwsec().
>>
>> Without checked arithmetic, corrupt firmware could cause integer overflow. The
>> danger is not just wrapping to a huge value, but potentially wrapping to a
>> small plausible offset that passes validation yet accesses entirely wrong data,
>> causing silent corruption or security issues.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>> drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
>> 1 file changed, 35 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
>> index a8ec08a500ac..1a91bbbce3d5 100644
>> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
>> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
>> @@ -46,10 +46,7 @@
> ...
>> @@ -356,8 +362,12 @@ pub(crate) fn new(
>>         // Patch signature if needed.
>>         let desc = bios.fwsec_image().header()?;
>>         let ucode_signed = if desc.signature_count() != 0 {
>> -            let sig_base_img =
>> -                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
>> +            // Compute sig_base_img = desc.imem_load_size + desc.pkc_data_offset.
>
> Nit: Drop `desc.` to make it consistent with the other comments.

Ok, thanks. I request anyone applying the patch to fix that on apply, but I can
totally do that if respinning/resending.

-- 
Joel Fernandes
