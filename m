Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68434C9919E
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 21:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E12810E008;
	Mon,  1 Dec 2025 20:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Iey4Loqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677E210E008;
 Mon,  1 Dec 2025 20:57:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPDqQNXGQl+vKvW6gOC8MT/b1FU9S3Co2jAhzyjpR6gjVLNszdMETihLUK9sSFfOcBk18tfF5sbYbBUGDFk69Rz76H9vCYh6kLBxiKpGfNPzYRqGYPndrvsr4aZAd/S3/AzDrXhAKrI/b9YEQH3Z7wQx3t/7l4iS+jTWYCeJD/9eY9eF6MGsiDL/y1Y5ZsJj/buwpPA0F5jWZs4ZwOlTQIlvZVdo/YVAWO/ZgVZ3lPzZAu40e4UolEhc4mSS5luTVZchwzb6PloKK2EF/mgcDiBA/WvQXvagmUg5XoXJ3324zSRv+guCjGap7WCeTfvSfQ8OYk60uP7S3QPKO2ZifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81lgi6giwnAuMqHybF6yj7Nqa3Sa59zLhl+6VczBRxI=;
 b=qO0Pdwo7xElLESNcZlTGfJYFpTDvRZOSiX6ttC9S/xAOe/3L/NK0pC2G6T7eluGqJJRYkJ/K4086G9YvR9ii1zUwF9+DYA723AANNjOBd3v9sJCKQ8ItvGTXvs/2sOGHNa3poTldSWh4DvZqt/vnZESLM/A0JbNH9/8i40jJOITh0lFjBBTox4rfKF6z6+O6KPIGIs+23wc3SMykUP1KKCH4fJ0rogTyuTXm9fkIpAIdTZiAaPNc2cy28/Wdpjn/mAB6hikS4c6ZOaQRSsbVYW7Omd2thCFtOvepdg85nREDPkpKP3c8L8OQSHFUFYhvl7wMRULBg5q4oqjjlg0H2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81lgi6giwnAuMqHybF6yj7Nqa3Sa59zLhl+6VczBRxI=;
 b=Iey4LoqkmKou25cZ/tZUO6aut9ACnRqb1lhBWJAJSKqW7teYboGyYPZr/B9aGqx8eb5aZxdqUqDpX2Xp1W2uDAhWJLXFdghzZ8m012DCEnLGNIuhPftv2iU6BTQRBBKFwQ+vDjqLc38D/bDdUEe9k2WPr6RE7Q3ayLn1kLz+sLZRk/xM+KIjuWi4dJApraqSoFyuO6ZQBUgruwG8oT8PBVHuqqiPZpgQ6DVH+X/5tC15ydSxoA60/AWn2i1B9LbTFkS9ixaXdxC8sAn+qMQXf7htkizQCvIb8infjk7pIDgxt4qgakC0Fk3XElOQ8MEVf/u0ufFHrJ/8jL87MUNBew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:57:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:57:15 +0000
Message-ID: <36f2c74d-9000-4351-bc23-f164cb0d6af6@nvidia.com>
Date: Mon, 1 Dec 2025 15:57:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
Content-Language: en-US
In-Reply-To: <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c1252a-7eaf-48ed-6a2a-08de311c34d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnlmeUpSY3ZLb1BTU0YxZVVZeVdwaDFXWm9QQU5ETDBIS2NscTZCM2EyUnpW?=
 =?utf-8?B?T2lDblNnU0hkcFEzTDVYbEZQNWN3Z3gvTkY5ai8yMWd3WmNkTEJtV0k3cnFV?=
 =?utf-8?B?NE0yQ0xmN2VPRVB4bVNSRTBVY3JGS2ZPd3R1RDh4NU9nVXN1akpWTUtwK2Va?=
 =?utf-8?B?QldDVWJKNjF2TVlCM0kyQmtEekNiL0pBSDk0OWFSNkNWajFXU1cxc0Z0VnZC?=
 =?utf-8?B?R1JzbitsSnFnVis3WUVFYjBMRXk3cnk4amxwVzI4bmUxNkVuUXpXeWdaQ3BE?=
 =?utf-8?B?bG5qZWlVTkQxcTgreHRrTmVPQVY1VVQ5Z2JwTDEyVHJLMU91ajN0d2puc2Y3?=
 =?utf-8?B?ZElwY2tObEljbHBuTE1hZDJLSHRONVh6Rm81dnBnbzNqalB0R2pxUlkwelhV?=
 =?utf-8?B?c05rbVRiQWFGOWVZdC9NRWNsdnptcFFrZHFLV3h2MnBSK2pWcWJkMnI2ZWlr?=
 =?utf-8?B?NjdQeDN1ZUp5NHRPNVJKc1dTMnZjeUUyRGdmZXQxbGR4QllUVXo1WHBZWk5v?=
 =?utf-8?B?a1R3d3Y1aHJja0dYK2x6Z2xzaTVnb1F5c1haWXZyVktNVW0zNkMzbHFBQkp3?=
 =?utf-8?B?djd2bERFUVdIeXkzOU5MSlJCeit0V3dXOGlFK1lnNHh6WGk2OEFBaXN1V1lL?=
 =?utf-8?B?MWQzZVkyejJtamJrVS91b0lISzVxSVlCUCtEZk5ZVE5IOWVXVllNK2xUVGpZ?=
 =?utf-8?B?YS9tOXM4OHFqcHVRVTYvUmMyc2Rtbi92OGxkVDNXVlFOd3lmTnpCTm1wMlEx?=
 =?utf-8?B?K2RLN2g2UXk2aEN3bmN5VFdXeUY0VHMrM0FzSlNBTEwxOUt3V29LQWVoV0R0?=
 =?utf-8?B?aWtWS2xzd2NUQWx6am5EYVBuRXVOZmtGM2hteWRkZWcrM2hGRDk0SmtONlRx?=
 =?utf-8?B?cGlZdUtia0luNi9aL2FxbFg1VEI1VEtBNFhNOUlrKzFDalFObkhCNTBNOTg5?=
 =?utf-8?B?dFJpYURNbTlqVEhDeng3RUY1QWRDbXBRcFRydUZINGpZVXg3QVIxTGVhbVRB?=
 =?utf-8?B?eVhTNDdMSklJT29wbk1yUnZYa3FzdzJvU29rc2ZUdlc4bzlsVm9IZUxXVjV5?=
 =?utf-8?B?TjFJTVRLWHIwbUtNLzZGVlVsaTdyMDcrNU80MElmSklUMTk0OXdNQlo4djkv?=
 =?utf-8?B?VHNvSGNTOWk4eFRiQ1FFaWVXTTg1b092R2M1OHZVMzc5T01IWURySVVoVDNM?=
 =?utf-8?B?aEJHTFh3SDdNRERmK2FOVVZFRzh4aVU5R0FrcjFOT1NLVmRQdnpqV1NLOGt3?=
 =?utf-8?B?UXRXYURjTGx5NGVIdmlzcnBqSytvNE5oKzlxR2x1RzF4elR2M2JXbmk5eU9m?=
 =?utf-8?B?MEpYbHhPT1dnNFAvWXhrNzdiSTBDWmlienY0VGVJbzNuVEMydWhkRGtEYlVH?=
 =?utf-8?B?ZVd5aFQza1hwRCt3cnAvdytUTHNidjRVMW9oUlZSWHFDQ21JOXlyc0szUW9B?=
 =?utf-8?B?bk92VnRMaGV5RTJYcHNnTzBFV1c1ck81TzZlMVlrZ0c4SDljZWRzRkNYZ1Rm?=
 =?utf-8?B?NTllOGVlSnFTNUJ0blJSRm1jOXFybG1paGJkUFpDOHpwQWg0aVA5aW5hNVRW?=
 =?utf-8?B?MHJ5UkczS0J4ZGIrN1JoQW5jMmtiUUorWkNrdi95Z2s2M1VwTWJYd3o4WkFK?=
 =?utf-8?B?ZWJlL1BONkQ3cVZya1VxbHRORUxTa1U4WXkrSkZlRDdmbmVoZytDWWNNYlZF?=
 =?utf-8?B?emdybjR3dndpR1dTbklxZXpvZTk5RlhUR1RmWE4xemd5cElXcEhXLzZjMENo?=
 =?utf-8?B?V2E0cVpmS0N5MlRFa0tqSlRQdHk1NGk3YkZISjIzTXptMUwzZS80Nlo5WmRs?=
 =?utf-8?B?YmpEWGNnWWdzbC83L2VRcENiczVyMnkzY2o0SWphTm5wT0FyZE5RZmdHNHl5?=
 =?utf-8?B?S0pEb2ZleTNBV3MydXMxcFFITnZhUTd0L2dnU2cxWHI3dS9VUDdSVjN0ajIr?=
 =?utf-8?Q?6pNHUagAj57YEdtwvD/sCtl1+zZzaI8t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzFTUW9OQktrcDN6clJoNjhiZ3JaYkI4STZLOXZ6VmRKSlpCZUR0M3hVcldj?=
 =?utf-8?B?amZCL01EWmZGM0E3YmFBNFczajg1cS9iL3RyK3ZaRUlRSldibkd0OVBUa0Jz?=
 =?utf-8?B?ajlkUEZ6RkZaWE9vemRpWXFnaXRZcjZqMkRqVUdvNi9GcFhUR3lkNHpjTldV?=
 =?utf-8?B?ZDZZN2xWeTYrTVg2dFFWTmd2WnE5OTV5UWRQVWM3U1RFMTB5TzlaMmtPN0V6?=
 =?utf-8?B?RHhEWXB0TDFmcFdJa29aQWN0dG40aEx4c0wwUkdyQlFsRHAwdVFLQXhkSWtm?=
 =?utf-8?B?NWdFV0pIK2FVM0RKUmpmblB1SlgxSk5INmxJMjNOdDRLTG9FelRzLzBRa2dG?=
 =?utf-8?B?RDAxV1NRaUZlajJXSldNMjYwNHo0UUhOQjhVNk5IMEl2V29hYkQyRjVwa00z?=
 =?utf-8?B?N0pHWmErZVJPZ2d5bVhhLy9MVXJkbEZDbVZFcW1HeDlUb25oaVFjWDROZjR2?=
 =?utf-8?B?QzV3ZzFUZmJ6ODZDOUZkRDBEK1p0bjlEZGR1aXR6REpaUS9GMDg2Zll4c29U?=
 =?utf-8?B?MUQ1b2pMb0VIcE1nT3hnWnRHTmZ5TlJFUXlmVmdWRWlROVR0RjNiQm93VllU?=
 =?utf-8?B?czlGanozTW16MUxCMzUyNkZmZFJxZnE5T0dETGdMT2JQeHJFTmJialdsejVZ?=
 =?utf-8?B?V0tCS2o5RkI0cm1QK2Z5c1FtSk5qSUZuVXFDZHJ3Zk9oOTRsMk9OeVFmdFl6?=
 =?utf-8?B?S2Nuckc0ZTBnRWVMRGxNQ0NTVzFEYWdBalRod0RzeVZXUXlJa3owY3FKbGIx?=
 =?utf-8?B?SzVDcVU5QUwyUUg3YTlOM1V5ZktwZmllTUhsK1VLZlovV2FFbG1WUkNucU85?=
 =?utf-8?B?K3dSSlFMdzhRSjNQVXFJczZycXhVTzZiL0lNTzNPVGwzMHJVL3l5bm1ya3ZT?=
 =?utf-8?B?VllmZlc4UytFTU9DUEFzRGk3YWh6RHZVd0RuZlpmeDBxY2dhcjlmeDRjQTVX?=
 =?utf-8?B?MUVucnM1SkVuRzRTWCs5L2RoZWxBaE5PYmFTbUl0cEFXQVYzNzdRcUN5NE5x?=
 =?utf-8?B?c1ZMck5rQXBnSGRYN0c4NkRtRnd6MkFWckNNRU01RDRYUzBya2hSQUhTTmVG?=
 =?utf-8?B?eXo2eW0vR3pqSkM0ZkR4OUV2QXdseHhtcFNnZERweDNlNDUxMlZSbksydG5t?=
 =?utf-8?B?NXhqM0VRbEFIUk5pai9MQStCUzRkb3Z4RUp2SW8yYlRwNS8zay9EL09icDI5?=
 =?utf-8?B?TllyeEpsZjNFRDB6allBWkhkdUxyNTgwWmlnbjZFeEE0MXlrS1RjWit0dVNl?=
 =?utf-8?B?KytXblljSTVaam5JQXZvVmtlbDdjQ2RTSTBnc1crVGFiSWQwRDUxNUNRdEdk?=
 =?utf-8?B?SEdNV3Z2ZlREWnMwdDBMS1dDeW04SHFLZDQzL1gwMVBERFdTTEgyOTljUGxI?=
 =?utf-8?B?czNYQXl4ZU9UOTRLYTYxeGNUR3Q4dHMzUXZYdHdDdHhxQSt2bWdDaW04d1Fs?=
 =?utf-8?B?dnovcW9JdmJQdzIyQkZxMDJ1MTlIOFZkK3lxNWJMc1YvWS9oTERxSVV0R294?=
 =?utf-8?B?RTlWNkFkVW1NRXY3Q25FT1NCMytVTTluWlpQWFF1ZWZja1lZeGRpdG5qcjFk?=
 =?utf-8?B?aGI2b1htYzc4eUxTL0lSblZEUFlNRmk4QTAvSzBLaUxYbDg3WndRblYrRlZO?=
 =?utf-8?B?M0VCNVpXalRkRG81eUEyWFJpa1FXVTN4Y09JbFlKdnZyZW40dHUyOVN0bm81?=
 =?utf-8?B?dHR5WkpzZFljdWNWZGlDaDY2eHdta1MzczBzVEdHRWU3UGl6aFIyTmI2SVJY?=
 =?utf-8?B?NmhZR0RNT3BFSys1OU9DZU1zYi9VSHN4dzVxNDRYN2pWKzNuNCtPQUdDMGp5?=
 =?utf-8?B?TmVVR0V0anVhTU1EVHd5Y2JkbVBoY1JpZzZuU0x6VWpEUm1RcHA0WDFyK3BS?=
 =?utf-8?B?VURINTkwemlSWmdPbDB1OFFFVmNiVzVON1ZxOExLRmxldzRqejdiM2xyMVdZ?=
 =?utf-8?B?eHJCbmJWV0FaOG5YZDBzRHpsZi9mcVVWWFgzTzcwenVCOWszMFROcUs1cHVi?=
 =?utf-8?B?RERBUzc5VkhLZXFOb0FCU2svMjR4SGdXcVk5OWhLUkRGcE5oT0dyVDB6dytu?=
 =?utf-8?B?RlJOY2xRdlhMY2trR0VaSUVsMWZCVEZiaTNwWHdQZTlBWmlZVXRkOUUwT1Vl?=
 =?utf-8?Q?sQ6aq+O7FZRY0aR6VYZ1gn5nd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c1252a-7eaf-48ed-6a2a-08de311c34d4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 20:57:15.0398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOOFaEW1GGo9jk8BqJmxPsem8maYsJ9klAOrGJAnm8k7pZnTg1wGWXJVJ78Fk2bACWYgufGQ9OtiQoZpMjO0lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
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


On 12/1/2025 3:32 PM, Joel Fernandes wrote:
> On 11/30/2025 7:34 PM, John Hubbard wrote:

[...]

>>> +/// Refer to the examples in the [crate::clist] module documentation.
>>> +#[macro_export]
>>> +macro_rules! clist_create {
>>> +    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
>>> +        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
>>> +            { ::core::mem::offset_of!($c_type, $field) },
>>> +        >($head)
>>> +    };
>>> +}
>>
>> Unlike the corresponding C container_of() macro, this one here has no
>> compile-time verification that the field is actually a list_head.
>>
>> How about this, to add that check:
>>
>> --- a/rust/kernel/clist.rs
>> +++ b/rust/kernel/clist.rs
>>  macro_rules! clist_create {
>> -    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
>> -        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
>> +    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {{
>> +        // Compile-time check: $field must be a list_head.
>> +        const _: () = {
>> +            let _check: fn(*const $c_type) -> *const $crate::bindings::list_head =
>> +                |p| unsafe { ::core::ptr::addr_of!((*p).$field) };
>> +        };
>> +        $crate::clist::Clist::<$rust_type, { ::core::mem::offset_of!($c_type, $field) }>::from_raw(
>>              $head,
>>          )
>> -    };
>> +    }};
>
> Sure I will play with your suggested snippet and add that, thanks.
I think it works also without the 'const _:' block:
        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
            |p| unsafe { ::core::ptr::addr_of!((*p).$field) };

I will roll that in, thanks John.

 - Joel

