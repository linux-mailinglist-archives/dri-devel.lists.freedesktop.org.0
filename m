Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347CBAA96F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 22:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AD910E4A2;
	Mon, 29 Sep 2025 20:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O56EdL0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827D510E4A2;
 Mon, 29 Sep 2025 20:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOspHLyZN2HBitCrjd3mZiA2F18Uk08QIYggYMM/mDk3nNY1DW1DT66DY55DCuKf5yiBHJ0Hng+V0kJzSOXa2Ils5lxcYceaeNCHyUgN/2TeZA/obTQHo9pOJJXa6czQFMjXAtzKykG7ZcRAsvO+IKKwcLclbp96T6gQQEqu3Vl+qTd1OmZK53dNDpibMnavQsIXg629aMUyrHX4wnIiGnkweQ68pGbsrit5qDLHn4KB9cn0ESA5MPZgN+qAHq2vrChfMxkl3GLrqwVLAdhTCsNaknGWl9pZTEdSZtOPEFSNOgrpy47pjuPsyChkO4xrH+v+2aJ04ztVcOA3QUwahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxjNXB2vKMSswe2szTbQa7OVeXc/cHX7xpZHJttTxC8=;
 b=qOsjO5i1vArsVyhLWcWI27D4BCz4vO/Ewu4W0YI/Chil/Bej0G2tdhcgUtWCRrBYReAw0i7+pbccr+Stuq4NVVKmAqOhMFL4TKFCES1FZ2+AHRrXl5YnuMLUU6t4z67jtnwojrTUgVfsiXewpf3LQJ0wKaYMTEa5HEOg9NuQ4VeTRmzHSuBUDfHWdgqz4Zx94eFTbprxnPW/4feBtzpX0TglcdNn/7076y4sMxk3JArfquNHQXHsuEAWoF4qieUDm2Wh3bdF4+gtA9i3FYgAFWXJKjq6ao9SRd5Qzz6UnJixqsvnfp2ClNdcKsl9EdjiOwUlGirZFoU5YHvZzJdRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxjNXB2vKMSswe2szTbQa7OVeXc/cHX7xpZHJttTxC8=;
 b=O56EdL0R4QO3ekIU6sLHAU6uSQVQyxEc8mzioUvQU8bO5WIEkMrS/DyzGBPgqVxxBTzZa3BVdzw4TQBpkiBuX8WTVHX8ghkwQ35jr51TB4wBqJeaGPvtoJvySzIm0i7+WiZ8Z1BkcFRCdfC82Hyp4lxTFJaSIBubNW5izTpC5SamAN4AFrGeh5YmQTRHbNIQoB9R40Ndo1hGcXnNgImZx8OfXfo4aAMMZgyFoYTcU1UZf8huTi6EHI3SQE/3QOKCn9wRZnFyIZ7v8gaRapN3Tw9MaeFIdJk+pTXYxyUcmHLqhzNEWPGzUME4bw3Xx/SE4vrwx9IAXZB516PICm2BVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 20:20:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 20:20:05 +0000
Message-ID: <ab427cd6-5144-400f-84b6-e280afb7e0ab@nvidia.com>
Date: Mon, 29 Sep 2025 16:20:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] nova-core: bitfield: Add support for custom
 visiblity
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-4-joelagnelf@nvidia.com>
 <DD52KU80U06J.310E5IZOAVBOC@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DD52KU80U06J.310E5IZOAVBOC@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 4798d9ac-a048-4ddc-4cad-08ddff9593af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXFWR3BXODQxYjVCV1AyblFXdXFIRlFEcUg0amVDL2lSVEdPandYVTBlNWVM?=
 =?utf-8?B?c1hYTFgwbEN1aGFSNzVJcEsxeUhXR3ErU3JXRW9LOWhKZS81T2FKcUk5eVJh?=
 =?utf-8?B?ZGpVMTFrZ1lPMVVUOXNIMkFaWkdqai9ya0VsQXMrMUxoTjRqMThiTFpzaStq?=
 =?utf-8?B?RE1GNnQxU1cvazZNSTFUZ1JFaS94NHp0VjRnUmg4N3hOMVhQSk1HbG5WUWda?=
 =?utf-8?B?ckFvWGJ5eFArekFuWTJ0VTRDTlVhZHl6Z1l2cVpDYXlPRGZabEdyd3RHRlJz?=
 =?utf-8?B?anBTN01qS0R3M1F4dGd1dGVSam9ZT2VzMUhiOFM5Zk5xK3R0NUFUL0EyTEly?=
 =?utf-8?B?ak1QbExWTG41aUtrdENOQVZ0bWhyQWQ3OUtUQlFzeHRHbkIzVHhnaXVubkdG?=
 =?utf-8?B?aEwrb2V6V21UMndIV2VrenEyMVZ2T0xjMnQxUCs2QVc3ZE5uL1RGdkhVaFlz?=
 =?utf-8?B?enRnRXNhVmNjSW5NaENxdENUT3BhWDBEdVZWb050dmxwaHU4OW05RVg3cFN2?=
 =?utf-8?B?RWh3S1djYW1vK1Jva01UWWhFNGdjcTcvZFFFd0xMcXM3S3ZZZnZlM1ZJVkVh?=
 =?utf-8?B?aVRFNE8xZ0ErQTN5bGhnbzFvZEhNYzR0TmZMUFRwRi9SMTVUalhYRkh5UEIv?=
 =?utf-8?B?Tjk0YUtoeFlCdm5rWEN4YyswY0pDdDBQRmpydXgrUUJPZ1Q5OEhrYlo2REEz?=
 =?utf-8?B?a1VnU0hEYjZVdlJjMCthNFUxemFwbFNUVDdWeUhmY1lPK09oL3NlV3RpQ0Z6?=
 =?utf-8?B?MXNhU0RVeFRqVGxuTVdpQmQrSjdvTGh2My83TE5FSEl3cUhSSXh0RjAzVEIr?=
 =?utf-8?B?cFlPT0R5WjBsMFNJL2tiOG5MR1owTzAyRnFJZ3YrYjkyL0Uzb0tVRGZIVE1F?=
 =?utf-8?B?KzZCQVlNM1AvQVNqWGphRFBaN2kxd2dxV01nZjZCS1RzbGVPOVhGbjc1VjhJ?=
 =?utf-8?B?bUVDTDZGeDJlcHNYM2tjVlBEWWhKZ3BaTXV3dEhjaytpNkRtRGx0T1Z4MThH?=
 =?utf-8?B?WjJPOENQMS9kejdITVpaQUFDbERKTWsxSkNoM1dkVnVBTERzV0ZrSm5hNzRP?=
 =?utf-8?B?cWx6WDJ0NXdlWW9qREE2ak91R2N2OUVJZk5qM1YzS2Z6MVczR1ZTcTdNdW5j?=
 =?utf-8?B?eERQamZzdlFDeGRPN2hkR2VPT0pISU53MEJyM0tjQ1dUemFsb3VlbXhMM3cy?=
 =?utf-8?B?cmRlTFdjU3VPU01hTmhVZHI5QnJsWk9sLzFlMmM1Y29sNktUank0Q1ErSjcv?=
 =?utf-8?B?aWhIVDFsVHNkd0tySmFHblZ3Ry9uRmw4dlRXeU1ab2xIM292UEtCcnA0Vkxk?=
 =?utf-8?B?MmxpclNwN3ViL2paMnNaK1dsWGN4amFUWjZ1L3JOYlIzNG5XUVowT3BrWEdZ?=
 =?utf-8?B?b1p2Nk1lMUhyRmEwUCtWNjZhL2ZnMGZsUnEvc0NoRkdtWEU4ZGJzak9DVkEv?=
 =?utf-8?B?Q0hablBhNVRSNDNPS3ZjV1h0ZktOb0NteVNUNm5qaEhHaG9TUGNGM0RFNjJF?=
 =?utf-8?B?STlXcEVTc3FqenA3bzJvT3M2TWFqcjB2NjdQWVhsZzJETUtvcTJla09DMExn?=
 =?utf-8?B?dFNRNG5tM0JiR3kyU09PcGN6cEprWFVmZ3BkNkpCU0EyNXlMT3dTTkFaWnlz?=
 =?utf-8?B?Ukx2MGlRWEMrZHE5QktMVSt0RU93ekpuSGpRRjRJOS9JeGYzcUNoRUdpTllW?=
 =?utf-8?B?cHk5ZmJ6QjlGR2JOMmc3b2loR3RBYzVLczNNWS9neHZMSjVwbDRnSVRMZnhV?=
 =?utf-8?B?MHRqNEtzWGZCK3FLcjJpK01nM3lUTEZsWDZWMmR3b1NxVFNIMVcxeFNVMlRP?=
 =?utf-8?B?eHhMTFRGQVpxZ2x6dFI4OEZrd3JmY1NUeDczeWFlT1lYYzc3L2xrYWM1UVFW?=
 =?utf-8?B?TDNrZ3ovb2pjMFZDMzhQanloUkx6TFdiekFCTUtIN1FSS1pGRCtCeWlwaWZj?=
 =?utf-8?Q?kKp1PKOIBVByUbI5I2QH1nSje3iGSOHb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L25JM3lUei9PVGljcE52MExZK0dnU1hCeHpHMThjUG5JMU9RblB5eW5vSldO?=
 =?utf-8?B?aG44ZXQwZ0RYK0ZGeXI0d0N4bUpGeFk1L1JDMXdEZTVCVTZKWStzT29tb0Q0?=
 =?utf-8?B?M3VaWWpJTzVhbFNZVUlkZlpiZ2Qrd1lBaWtOczZsejYvYVk3TWg0R0ZxRVd3?=
 =?utf-8?B?NmYvbEhyUzc3bExwM0lMbm9SQ0NWaUxuN3dUZXV6YThQNk52Wk1MK2ZqZWEy?=
 =?utf-8?B?T2FMaldwcFd3aUJwZU1TU1g1Yk1ISEtHVHdsM2txelIrMkEwTDIyV2YvK0JP?=
 =?utf-8?B?aFJ1bVlPK2E3YmtMenhLNnZSSEhOaktuU0VzT2hRcHRqQ2tDTnEwNU1FZUdW?=
 =?utf-8?B?ZjVERDVYdlhMVXltdDI4SFBnVUI5c1graWQ0WThTZFlmOFhyUnU2S3dFaXkw?=
 =?utf-8?B?QnpjR0RlWVlBaS92YkRmektFK21Rdk5xOTdOeEl2alBxSnI5RGs0UmI1bUF3?=
 =?utf-8?B?R3l0VDMreGw2NnJKTE1BV3p0OVFjM1hEN2s0dTZRSXN0bWpveWJ0b1c0MUQy?=
 =?utf-8?B?R0RjT1pxUEMvT2tmeVRFSWZGR0d2c01teWh1SzRyWWZhaXg3UHJkdTBDdWgy?=
 =?utf-8?B?Q2NVdFB1dzVZeWlWa1BjMUczSGVJRlFqNlpJWVRxbzBTbDZNNEJyMXFHMFIv?=
 =?utf-8?B?T2J4ZDFBMTJsT2xoVTl2Z011TXIzbGthTU9NQUJaS2NCeHBUbG1JY3BYVnZY?=
 =?utf-8?B?VENyc2IvUFBIUnBCRDhqT01Wb3pBTUk3UisyQU5GYWZZeC84M2pHRWthWEkz?=
 =?utf-8?B?bkJaSjlTTlR3S1lLTkwra0JheUZnQkcySWVvdkhXeFpTQjhsMWE2ckozRmZj?=
 =?utf-8?B?OUdWS25MVG9HR04wVkV2anloNFVieDlqazBHNjg1eUtYZXZZalNvL2gwUUZy?=
 =?utf-8?B?WHJ2K2pwUlh6ZWd5MS9YZGQxOXBkZmRxcDFUU1ZGcWFUSUtoY1E0bnFXTVRs?=
 =?utf-8?B?aUx3NWV2RkNXLzR5Mi91WEZVQUJuT2pTckVFUzdtVE4vZDc0UU9tOGRYd202?=
 =?utf-8?B?TjZ0U05OcG5BNWNWZjFOcDZtVkhuMDU2anFIMWwrNUZHZ0FNcDRmWXRmbXdD?=
 =?utf-8?B?ekNpK3YzL2c1cGZYVkZPOFd4MkpkQnl6U2I5b2x5bGwvcnkra0UvSG9ZMG0w?=
 =?utf-8?B?VEh4QlBoLzhFazJ5SG4wUWRkZEc3TUpiNTJLbjlacHY0TXdhYWRrQThzdjZD?=
 =?utf-8?B?R2dCQ3ZoZUJwWXR2T0FkVTNiUS91aEU3ZFVNWFY5K0Q1c2VjNkEvMkFISzdp?=
 =?utf-8?B?dmEyaUkrKzJwYmIraDlFUGx6dy9hd3BQZGR4UG5KMnF6dTExc01KV09XbXBm?=
 =?utf-8?B?L2MrNXUwZWJZMldwMmtQTDhXNFZDazR0TitOaEN3dFBWK0UrRzcwdGo2Yng5?=
 =?utf-8?B?Nk9EUVIvdzkzTk85bktqUmVxa3A5TEZiNUQ2czBFYW9hSGh2SGdxT0FhSG45?=
 =?utf-8?B?cXBhZFN2RlhEbGszTW9McWNvQTduTEZIcW84TWFITTk0dFlwUHJqR3l6VTNF?=
 =?utf-8?B?UTZ3TkVQNlJqeUlyZzBvTDJTSFJ6WUJYNjNwdWtFV0lhdFVGMHQwVDF1T0pq?=
 =?utf-8?B?M0YrL1phSUt3bWF0eXhNZmM3RU0ySVJPWUVwNGNEbnl2czJ1TVBLUnN3Ulo1?=
 =?utf-8?B?SENId1ZJSXhYTFZ1cVRhSUUrNXl5dzVET1RRVzNnanU5WFQ2VEpUUWlHQ1ZY?=
 =?utf-8?B?WGhNYjlCNmJsYzErQzFFTm5GcEx6S3Fubmk2a1NLZVBJV0RYK3lUOHJ4Y0ZW?=
 =?utf-8?B?NWwvcTlLS2xOZmVzekpFeERtMkptSVJMOWp5QWk4UEtISVhoajNzNGt2Q0Vy?=
 =?utf-8?B?TVpRN3hLa2lLZUhEZjZGMVNlNDU1SlE1TnIrSUZMVGF6Z1NvWmlVN3QzWmgy?=
 =?utf-8?B?UU8xTnhxN2VLTjU0UE8wZS8yWUp6N3dnTmc5SGZVVGxnZDVCUmdJdWhsMEJD?=
 =?utf-8?B?R1pnSUpCMmFrY3NKZnkzTGhGeDg5ejd6YnE4NnF4RisraVJyT3dSdTFqYnc5?=
 =?utf-8?B?NFh2OVNON1JFallHbGJmcDdmaW5pQVVyaFZieDllemQ5Y3Q4c1k0bzN5WVp3?=
 =?utf-8?B?ZnVsa3o4b2ZXUDZMTjZqNmpPVmtiQXc1dEc3b1dRek1BVGgwVTJxSEVuclRj?=
 =?utf-8?Q?jRXPvbZAb4iH1WK5gOBdQjcdI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4798d9ac-a048-4ddc-4cad-08ddff9593af
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 20:20:05.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3P9lGLY25yD8SkY6dge1MQj7MtJgDLPEdEGGfiopL7eCH9mq+ZhDPwdH7LDi/OFa+e44mwXf8n/vTHe5Jk0iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711
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



On 9/29/2025 8:28 AM, Alexandre Courbot wrote:
> On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
>> Add support for custom visiblity to allow for users to control visibility
>> of the structure and helpers.
>>
>> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Just one comment below; otherwise
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks.

>> @@ -161,8 +164,14 @@ fn from(val: $storage) -> Self {
>>  
>>          #[allow(dead_code)]
>>          impl $name {
>> +            /// Returns the raw underlying value
>> +            #[inline(always)]
>> +            $vis fn raw(&self) -> $storage {
>> +                self.0
>> +            }
>> +
> 
> Why does this new method suddenly appears in this patch?

Actually I've removed this already in v5, sorry about that.
 - Joel

