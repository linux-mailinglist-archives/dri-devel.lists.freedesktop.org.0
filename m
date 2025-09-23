Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC68B950E3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C85410E5A0;
	Tue, 23 Sep 2025 08:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="lTxG9JF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B90110E1EC;
 Tue, 23 Sep 2025 06:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nid9vuuGxeF82fD4tzDKShbpzMEzQFiXTpNEawsK9BYsJWGWHEztdN83yFGM0J1alz5Bcbv77pg/Z/UpW4YloujpZtb/XdgvCGu3l1kHMGuhIZqKOWZoSvEdZ6iGUNpxWArF5ZbHiuEsh62oIv5T5Y5vds3e3UwX7+73Q6K53msBgYdy76RZXb08NgEjx/5HsItcPbmxYhkyKA1M3KRliKEmR3dpMTHnsfD08y7fDL7EeIAoNgrDUBnw6sQuzmh37V1z9pU3Bjcir3tZMmcQ8J47cWKFOi6xXp8M8LWFmrCTO73EEUkxVFidB65izOvMulUoCek2XzpdXwku6v5wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5WoMTCzDYFuPK3Jz4DFJ+Kc68FVQSUZU9DekAWzAqU=;
 b=wCmV4Hra3RLUSNMLIDyd3P04Tsfg9DMFE+h6FEdM+Pme3QSvg9Kkv2+onjGZt7WxZXHoV9LEZ/BUKmnvS73xK1L0do5A6s1329py56EbZuRwS89vdzuSECCet0ESy1bEQQ8NEvh+egqfbUCFpx0vu8LaPQS8azBw5sHfF1z5WINkjJalWoqQpzLLPJYTJucBDlh8eT+91HK1F/7VsNgQGVGMsdvDwYyWIC8AJy2ubQ9hRcKgQo2IRAsN8ZlQgZngKZmh9u8ZYb7mk9k2iJr4fA7VcxDXoodgn6q8vz6jq5cyn17IkQX+jgtgFQQMgEXK3K2ZYIxwY0SyWchjO3oQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5WoMTCzDYFuPK3Jz4DFJ+Kc68FVQSUZU9DekAWzAqU=;
 b=lTxG9JF/fkbaZrxILO5ZlgiZO2JacWZaedJsW/lMB+xzTUKXLl1N5stFAglFPPL+71aZEcTNdpNRqr8TzNyEOjEmmh7kAymjVPEaCSfe1TXXN+oFCbb73qDIbGYXd5usNcM1544bxnMr7XJmfWt7BQugDpVo/Bmyidi4SUb6Ld04gXsV6hA191+dxF3AkRQPFT9J07uLmHnhJgdeZIV/Zym9vRPLmuKnS4YiM+m0rMqTL9JD341gxmIqK5okOjx2tprJ0C97Llkib3U0MqpPDxGV6Eju7eY/mGGbgrcGo7mK9m2Q/D6fGmQuVZhe95kHZVjDD0ZgO4TyIQ+3WKfmwQ==
Received: from DUZPR01CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::10) by PA2PR10MB8912.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:41b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 06:38:17 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::46) by DUZPR01CA0054.outlook.office365.com
 (2603:10a6:10:469::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 06:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 06:38:17 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Tue, 23 Sep
 2025 08:38:04 +0200
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Tue, 23 Sep
 2025 08:38:03 +0200
Message-ID: <10ebc82b-7d51-4724-8de6-b44435659a08@de.bosch.com>
Date: Tue, 23 Sep 2025 08:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Danilo Krummrich <dakr@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
CC: Benno Lossin <lossin@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov
 <yury.norov@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh> <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh> <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
Content-Language: , en-GB
From: "Behme Dirk (XC-CP/ESD1)" <dirk.behme@de.bosch.com>
In-Reply-To: <DCYIX8URVIWM.2ZK3GHH3J82XQ@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.219.93]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|PA2PR10MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: e66fc2d3-1b81-4380-fa82-08ddfa6bc7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEV2ekxyWlBITmdRUmQ1RlZMeklKci9hY3l3K1lkcEFjMHZwdnB5UXljWmRi?=
 =?utf-8?B?Z1BSOHdFTDg2MkhjUGxPSjBURTZwUjg3MXNJVlpOcE81QXJnRzJWaHo2M0pn?=
 =?utf-8?B?Mi80U3prZklCbkh4RlNBYlYvU2JtWHVXOXRPZEEvWHFjcGt4bjh0a2J5c0xL?=
 =?utf-8?B?eC9BRklTY0U3amd2dW5aM1JKTXFqMmcyZThxdjlEWk15OTNCbjFuOHRvNkpU?=
 =?utf-8?B?UndKUDV5ZGxWSFh6S0lrS3hJeFRLU2pzZk1QRTJlYlF3cGtka2N0OW1VNnJL?=
 =?utf-8?B?WG1XakllZmlndDRtbFUyaHltTmMzM3BwNWtUcmo2ZUVUb0hveUFEaVIzbDJi?=
 =?utf-8?B?SDdGMW00WExlbjkwa1NVSnlobFdEWi82U2RtSHp5dUd4dlpQUDZlNkxyeUQx?=
 =?utf-8?B?TDVaY1RtYU9vWm9KbEhhV0luMy92SE1Va2twYmlTaHlZRUhUbThZTk5neU10?=
 =?utf-8?B?UC95Wis0ajJ4UFZneG9XdWhiMlh3alFnUi90WDBLK1ljbStpNkV5dVUrVklm?=
 =?utf-8?B?V09JczU0YnFQUU1QWXhBdERtMUNvdGhBYVBRMGxwSnlrOEJiTExkR2dFbkV0?=
 =?utf-8?B?RHFRSDcwS0oyc05xQ284dVVoV2VxS3hYL29yK0tVeTJaY1hUdXZSNlNTVlBL?=
 =?utf-8?B?cHpEZWIzZFRXUzdXNEEvT2lKT0svaVg2cktnMi9rK0dYV0xIeVFmbHZxZ1Fl?=
 =?utf-8?B?N1lyMHNraUdkSjhQK2h5ckJJbTdHenBLZkZIWlJDNVhwa0Y4ZmM2NHNYVWxD?=
 =?utf-8?B?cGJiRENvdVVyT2lKYlM0MGdwRk10V3V6RGM4YnZoUERWTjNVd1FmaFRBcnJx?=
 =?utf-8?B?MkZIRlUyVnRobXN3bEhqalVMY1Q1V3JkallUeDFENkVEVFhwa01BOUp1bTZw?=
 =?utf-8?B?cnBsVmZHMjg5VFd6bVFnbmNXYWZnNEZ1M3E3VHJJK2daMXNYaWY0TnlhSWRy?=
 =?utf-8?B?SmNQd3YrQ3cwSk1EQ3Q5MWFWcU9IZGorMWtFWXAwd0k1UlBidjMrcFJlZFJI?=
 =?utf-8?B?YXl4K2g3R0VIRFlnWTVUaWM1OTJ0ZWE4dTg2NFRwdHhhaTd3UWtDMFZUOFJm?=
 =?utf-8?B?QllOSEIyV2ZITEdWemQrWkt2bVlya0tCVVh4dE03UDZFdFgydmlkOUdCT2NV?=
 =?utf-8?B?aUlCNWtvN2l4SjVWNGV0cjh4T29HTUQzekNZaGQ4aXpCZThuWGZjYVdnYUZl?=
 =?utf-8?B?bWdpR2lLZzdqWnNNTGJXS0o1Rnl3eDJjN3pTSFVwK3FISld3MkFjb2dOV2Jq?=
 =?utf-8?B?U2hvVW5FaVZPcXV0S0FabHNIMUw0M3U3bTUzcFluL0YrMTFEOVgwRFljd3pp?=
 =?utf-8?B?cEJ6c2ZsQnJOMVozaWI4QkJ4WGErZjNYMUkzQUtQL21CSHpzSUdpdzEvVGdr?=
 =?utf-8?B?SlVCUzd3Vk5ibmJITFk0SmxRbXR4TFd0aVczeFB1NldkcFNLN2sxaDBsWi8y?=
 =?utf-8?B?VzVVK1QzdmhkVEhzMzJBNFlTaDhhZk9PSWZweTlYM3M5VytDN3FXd3cyQm5j?=
 =?utf-8?B?SEs3ckFjamNWWjdteVJSL3M0TVJYU0EyVGljZmhBU2pnTVVNRjFJYzZ3ZTRE?=
 =?utf-8?B?ckFNRmJaWEVpclZSMUNGVmc0VVVvdWJsZXFodHRGd1BtVTRCcG4rUm5EWHJ3?=
 =?utf-8?B?MXFZbVQ2enFSZi9Xb3RTVWV6cVVMZWJxU2tQQ2VCZE5rOUlDNVRUbnZjZjBp?=
 =?utf-8?B?SE5OMTFlcElNV3VhYVZNZXZpaUNLaVBpbmJBa0NuZ0piU0Y1SXBzc1pweGFC?=
 =?utf-8?B?R29FWlN2bWE3ODl3R3l3ZmhYc29icnhrd2JYTTRONkNmQTVVazJXZkpoZVZr?=
 =?utf-8?B?NG9JekhiS1owcVZmYzU3TXZUNHZnOFA5OEFydUtBcTJFRjc2MGZDdlN2SjRR?=
 =?utf-8?B?SFdjYXhmZE9ZL2l3UDlJdVYvQWFpRDduSlBQUXN6UmQwY0U0elFhYmlZTi9Q?=
 =?utf-8?B?dGNhbDdHT29CQklGejYrU21Ea3lDWmZkL1ZjL3lVdzhJakVsejRkZHJaUWl6?=
 =?utf-8?B?NkxsL0tiV3p3PT0=?=
X-Forefront-Antispam-Report: CIP:139.15.153.206; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 06:38:17.7528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e66fc2d3-1b81-4380-fa82-08ddfa6bc7de
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.206];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8912
X-Mailman-Approved-At: Tue, 23 Sep 2025 08:45:15 +0000
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


> On Sun Sep 21, 2025 at 2:45 PM CEST, Greg KH wrote:
>> Again, regmap handles this all just fine, why not just make bindings to
>> that api here instead?
> 
> The idea is to use this for the register!() macro, e.g.
> 
> 	register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
> 	    28:24   architecture_0 as u8, "Lower bits of the architecture";
> 	    23:20   implementation as u8, "Implementation version of the architecture";
> 	    8:8     architecture_1 as u8, "MSB of the architecture";
> 	    7:4     major_revision as u8, "Major revision of the chip";
> 	    3:0     minor_revision as u8, "Minor revision of the chip";
> 	});
> 
> (More examples in [1].)
> 
> This generates a structure with the relevant accessors; we can also implement
> additional logic, such as:
> 
> 	impl NV_PMC_BOOT_0 {
> 	    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
> 	    pub(crate) fn architecture(self) -> Result<Architecture> {
> 	        Architecture::try_from(
> 	            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
> 	        )
> 	    }
> 	
> 	    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
> 	    pub(crate) fn chipset(self) -> Result<Chipset> {
> 	        self.architecture()
> 	            .map(|arch| {
> 	                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
> 	                    | u32::from(self.implementation())
> 	            })
> 	            .and_then(Chipset::try_from)
> 	    }
> 	}
> 
> This conviniently allows us to read the register with
> 
> 	let boot0 = regs::NV_PMC_BOOT_0::read(bar);
> 
> and obtain an instance of the entire Chipset structure with
> 
> 	let chipset = boot0.chipset()?;
> 
> or pass it to a constructor that creates a Revision instance
> 
> 	let rev = Revision::from_boot0(boot0);
> 
> Analogously it allows us to modify and write registers without having to mess
> with error prone shifts, masks and casts, because that code is generated by the
> register!() macro. (Of course, unless we have more complicated cases where
> multiple fields have to be combined as illustrated above.)
> 
> Note that bar is of type pci::Bar<BAR0_SIZE> where BAR0_SIZE in our case is
> SZ_16M.
> 
> However, the type required by read() as generated by the register!() macro
> actually only requires something that implements an I/O backend, i.e
> kernel::io::Io<SIZE>.
> 
> pci::Bar is a specific implementation of kernel::io::Io.
> 
> With this we can let the actual I/O backend handle the endianness of the bus.
> 
> (Actually, we could even implement an I/O backend that uses regmap.)
> 
> So, I think the register!() stuff is rather orthogonal.
> 
> - Danilo
> 
> [1] https://gitlab.freedesktop.org/drm/rust/kernel/-/blob/drm-rust-next/drivers/gpu/nova-core/regs.rs


I really like this discussion with the thoughts and examples given above!

Some weeks ago I was wondering what might be the correct way for 
accessing registers in RfL. There are various different examples 
floating around what makes the selection of the correct one even harder. 
Most probably I have selected the wrong one ;)

So once this discussion comes to a conclusion (and gets merged?) we 
might want to have a verbose documentation with background, examples, 
possible options etc. Something like "Howto access registers (hardware?) 
in RfL (correctly)". I think this would be quite helpful.

Thanks!

Dirk

