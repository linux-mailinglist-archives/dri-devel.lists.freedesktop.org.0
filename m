Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8FAB55C60
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 03:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C37A10E109;
	Sat, 13 Sep 2025 01:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AhigLUET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015ED10E1EC;
 Sat, 13 Sep 2025 01:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRXdGjOiGU2aZw/pACB99OdjKEE3EGv4x0qvTmRY7R3TLWHrIz9DJVJtqMGjZJOEXc7CDhPWu153CNk5fWcgufPUbFxm6sFRKNL4OqontgrDu1E0dGwPc3J81pAS/cH5cxTLd9gVHZ8GA+f3I30PoLYxJyXiRY687qY3sbN8EQ5GjJKAhC1bdSeLHafDv+83UngjNu6ijk7u0rIIodhC5UiyZVp/ZYBGUGoodfeyf4RQjMej5omHMOoUl4jRRsglzpysvjTeDXP7kj1tWIy1jzQixyFK3ewjCFBVocgK/34OyS/ULjqX5YFdSrOFEt1vzFpO13aEyge46S375CN8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SptTuagc5TVSshUl1KAM/wXVFI+zzM6rLEc3P0vm4so=;
 b=ImeiphDT+7p0/ZwLUHE+1kt4nJlZD+iSQiTC3P1iGmYOPI2Cv1GmgIltMHV/reSKAQRhZjAx+F31ab8pZr9uOiqqU2Bb2kUG+QbJY6cK1uf6xpTXXp6UhKbsBY9bKWpEdgcEQyeaMeCVdtSk/qgMSBEpZ4gY+LnA6Tk3fT1ujG+n51ZdJlVOBgVVcTjY3QF3e6Ve4yHTNFJezzZtiH8iyH1PfOpzUEl5V3SXjlG2n2vrCxbVTG3L/zy9h+wwgproW3PYNp75zlF8xkCDdxvYkj2yGhmt/0YdTcueSUfVkn1rrWThfzqNfGW+1+e2LnqyrNDs5WqiPZ+u2Vw/PzZibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SptTuagc5TVSshUl1KAM/wXVFI+zzM6rLEc3P0vm4so=;
 b=AhigLUETnRZ5hciwPHBZjBRMoxGBDiT5qlFK4+l0X1jaTfUrs21KTJadVQB7QEaC7K12zAhHHWecIfXRvdrJpxw9AVn0zKopyrQbjp3KDEeX3C7oprvdJHsmZP3A7n+hijmwRD7FzGmrRfmfYq+uJRZFVi45e8NPxXS3c15My0D+zhGj0NCV60eKgMmr2HojBWBpuO6ga4xKMw+7KSnlm80SjoNpnbh1BcDrfb5nENS9e8JkrMSleA69XAgaCS2hG0rm0y5LC8fPYyTy0vPP7aH3KeENhg3yh7zRSdFNBiWi5QH/shu45WsaS5QQFR3XLPPgqbC7fKk8qc8pYPworg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7241.namprd12.prod.outlook.com (2603:10b6:930:5a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 01:02:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 01:02:28 +0000
Date: Fri, 12 Sep 2025 21:02:26 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
Message-ID: <20250913010226.GA1478480@joelbox2>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0439.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d8ef32-5623-4b53-af93-08ddf261357c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bMlBW4lfOcd7PwqKbwuaVs2iOxwTJVEYiRfdT8r+hW9pCugq0uRh2k227zOc?=
 =?us-ascii?Q?UiifLvu7p8fQoGcbCXB/olQQK1XFYjs5oLvuxxF4OP8h6xOjHRB7UwfcHJn+?=
 =?us-ascii?Q?GKKsZO6UiFhKuhLH+4Z+UFzYikw6xMj+LsI2Q9hPCUm7D2zAJuDWHPkle/Hr?=
 =?us-ascii?Q?5wwAc/hQQLFy4TenwgVdnMa3b/0vfubtq5qdu18ul5kWukX9fSFjTswbCdPU?=
 =?us-ascii?Q?WSsuooQs6Iseyl563pXqA3piyA+jfnX7m3B/gOIprBcMXcxTz0+EClyAjCzd?=
 =?us-ascii?Q?2oBmRRaySypEcw89vYyVWkXCMy3ZHXSyM3DfHs6xYuXg/EdcbhxyPPLt5uhm?=
 =?us-ascii?Q?DxJ86ujB85KUIPXYTEw44keeSZqICq1EDTiMusc4V3lxV9F7Kse7b3nj2A0N?=
 =?us-ascii?Q?znuSu6YKuIwnJYvmpJ6E7cvUS00VWQNrZyUTJhpEljVO77WP1VpyXqkorN2O?=
 =?us-ascii?Q?OvCgistjLuNUPrzQ6W7hje6W09eeJi81jnzV0i3N7VUAWzn8XNIokjfSLKhG?=
 =?us-ascii?Q?d5XGzwhOGeUdg2z6rKYnOi8CST+lMa4QLtsKhAOJnb6hDr5/NQIEZzz4ELqy?=
 =?us-ascii?Q?PX8xvkxOzQUjbB/zRxp+FylU1yV98VHR97jjS3ecuxmvFiCwtBbhSo4lV4BA?=
 =?us-ascii?Q?CfWgAsGVIyGN9Zy+tjGrFlCV7/NXtNjdbjNuq/h6be+T6OZflH48qUzP0Jke?=
 =?us-ascii?Q?biYtUm+2q+ia4F3+VFhKdXZvFKf60YIvAzbbSb0KXb3TWwr+krY2A+c7SV10?=
 =?us-ascii?Q?bDeEY9UGa87e08nCamFYgTVdmBxGB+7r2hGIuXGKC/9qWCs+HATq72eiv90d?=
 =?us-ascii?Q?sEDmvqlZQ0DGylWGsjJDw6Dl+gnQxycGpy7VgLBn+1HFuNsq51N3vCeq8QgH?=
 =?us-ascii?Q?jM6YrAmRMiffoUyIC8MaETHpV9tYtAd5j50H4YXU2NBQ/BNaV0JtMIMLkmxj?=
 =?us-ascii?Q?u4V6/SPcFUNfy1VTgYJAdiWVpJ/YD9nu413XAHdrlKyga4niondGtSdb6sH/?=
 =?us-ascii?Q?rPzXgws/kLoViJTrT+/1vuNT+uNkJ0oIF5cR6gNSji0CS2FSgsAvStvFtrNG?=
 =?us-ascii?Q?TmCBTvHX61+K2tVMC3TOuG0IYtPsOinpm6N8qE7ecL7Ew4PCKqfxLZw1BDXA?=
 =?us-ascii?Q?RdjtZtSte3aiW0lvjm+AmpBYUpm7g4sVa1JkTavleqzJ8KZbzoZzWNYXpQkZ?=
 =?us-ascii?Q?Xai5PfW//ipdRjQRxgelBAsXGHBe/QPNx7GVcYFSGIMJQg3beQ2hMHtdQI+i?=
 =?us-ascii?Q?Iu1Z7tkvjs4yyBSLv7fJFSC3wiqUZNISHCfD1k162uA8FC8Oh3NzwK5Op0Vz?=
 =?us-ascii?Q?sEhYcxGDJOb0toQB0/UjSQKWHj0C0wIPPZWAH61RZKNigDlV6bVHOUSENXrk?=
 =?us-ascii?Q?A69Bf2egeysNiBIf9I44JHa8+VXFj3vF9jlnEshgdM2oR6TFNwj0RYPE9Hz8?=
 =?us-ascii?Q?SxZOgLfFkvY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4s9k1D1qH4qdKXTnrZP0S8jyfw83iQtD9/79atwcTcA7PXuMhnGuqOdDsdQn?=
 =?us-ascii?Q?qef+1hAuuVwHD0+o8Zm0iTF4OYZuyCXzImJohphsMz7ViT02PFw+fMnzfXXI?=
 =?us-ascii?Q?6qXAqL10ziqa8OE0Xe0iN8h7223P6HpU5Do/W6W/A2qfdYUs/CkR2tmi6Umx?=
 =?us-ascii?Q?9f3pPawOhDFmN5rixSYB3527T30A2WpZq4QVLYRhtApuYAqInrujoTEMeiht?=
 =?us-ascii?Q?mKHZaEStgxOOUROlWabkKrO4eD2TVVmAuxrGB+uANMsDjq82m+EQoy+eNNck?=
 =?us-ascii?Q?xUcmepCHR1DOAv8NgfuZthuUD+TwZRHEpDrQItNQOdhVI1rF/fC2NPQu9vfi?=
 =?us-ascii?Q?Lu5Z8VOKzSUbMwCEhADFYI+A1n1xOJZOj0NOXAxk7LhJCNlWpVnDzW+NUoMi?=
 =?us-ascii?Q?NoRgw529gZobsk3ffyTyBmkoM3TnZxWj49EpfmYt00cazquP7o2CRp/bGIYW?=
 =?us-ascii?Q?+3QBmg9muOfMd5glycbCwY+nGuiN0392arNpSvwzLARYNh301qjt7PadWRN9?=
 =?us-ascii?Q?zbHFdKRer6mECYG52N3CmcnpSADeNK7m+CfXbaTSco/OdiIaq2RKNLHa2quU?=
 =?us-ascii?Q?O+Ah1sH9ZfcXk49VVgeprROwOPZpFqqsm39nMdg7fB/AU8W27VuIbL6tbckP?=
 =?us-ascii?Q?7BQH9nmAczLsIjdKkfFj8EKkosbFoLzywDfyNd2GJ4fYGfzZu2Q1PfCm5k+i?=
 =?us-ascii?Q?7Tvfv20dGKciB8KTO4R6vQkGTPYuOudaf5NyKmGfi7o45w8VBVSWyjtMN0n9?=
 =?us-ascii?Q?gJ8K7F9srXq9X69hncX9AAc2R8xBUaNssljDR5x7lq2MWEfHXXnPJxvBb8Mq?=
 =?us-ascii?Q?yjy80rGArDYGmWogrFrNENWbwWTkascSIizSQkaDwQBcvGciUi/rp6lYteda?=
 =?us-ascii?Q?3M9JGc4bitDOU4O5F6s7FhtLysly+vLGlNnGCTLIknAzNBbrQ/bV72PlS/rD?=
 =?us-ascii?Q?B1+keYZDRafwKFTJ/eTDHlTDDMnvVJulZbjmIQiepyAYLMtmoWnn4du4QSMS?=
 =?us-ascii?Q?I3GQy/8qxwtfXguayLOIXdZsf9BULzi2WOt2z5izc27KvHYyuVJZfG0F/gUd?=
 =?us-ascii?Q?YcFe9E151A2nroEoaFoDYMtObFb9o7XCuRFGrdnInV5beAmaq6WLyR0NS+9b?=
 =?us-ascii?Q?bfbB/Kgf498vlLbbfRaheumkASkM/htHoDoHtiAVy9yPP/Ui/ihzTrKpk9PG?=
 =?us-ascii?Q?+vwWl88zlX32KKk+wP9Pap4HidSAkFS4Bg9KAtwgm1TlPChXCLnaQ1apBAxw?=
 =?us-ascii?Q?B0TnQoyX/tTO3Drd8wPXFwIKo5gCWQXXKUqG5wbD5H6Tny/F07zLJMbyzwuy?=
 =?us-ascii?Q?o8GAk4wYg1vkZ7viATheNQra1MxSo7U7M4PNTAs1pXAyCQr3KQAmPutlEe46?=
 =?us-ascii?Q?sg8ue0bkamxdnEkz2P0MEn5FJe725Sgk+U2aTw8BNJFriaqwPtGFnUhlo1Qz?=
 =?us-ascii?Q?qOqcZLXCTTkhUFSYrd7u8WYeZJ5YfI38nP5LdsjPNpYuI2fmzIu4SdP1Ktyz?=
 =?us-ascii?Q?ABIvwyqGDtH5qbggf4axZV9xr5NjDST8KeLNoyLFgum9f7HieQi3Oorhzesm?=
 =?us-ascii?Q?QHXSwxHADOzXix5koDDaMzys9GK9k+8bqiWgJNI5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d8ef32-5623-4b53-af93-08ddf261357c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 01:02:28.1097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0C4K7zGI0vPFf8M4JsbpEOBE5JlXKnnRchIbWCsbhe+F1nbLCxx1uOCibWarimxjQZc5VdEZXZP4oqqJVkbOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7241
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

On Thu, Sep 11, 2025 at 10:26:08PM +0900, Alexandre Courbot wrote:
> On Thu Sep 11, 2025 at 9:46 PM JST, Danilo Krummrich wrote:
[..] 
> >> By keeping the initialization in the GPU, we can keep the GSP object
> >> architecture-independent, and I think it makes sense from a design point
> >> of view. That's not to say this code should be in `gpu.rs`, maybe we
> >> want to move it to a GPU HAL, or if we really want this as part of the
> >> GSP a `gsp/boot` module supporting all the different archs. But I'd
> >> prefer to think about this when we start supporting several
> >> architectures.
> >
> > Didn't we talk about a struct Gsp that will eventually be returned by
> > Self::start_gsp(), or did I make this up in my head?
> >
> > The way I think about this is that we'll have a struct Gsp that represents the
> > entry point in the driver to mess with the GSP command queue.
> >
> > But either way, this throws up two questions, if Self::start_gsp() return a
> > struct GspMemObjects instead (which is probably the same thing with a different
> > name), then:
> >
> > Are we sure this won't need any locks? If it will need locking (which I expect)
> > then it needs pin-init.
> 
> Sorry, I have been imprecise: I should I said: "it can be moved" rather
> than "it doesn't need to be pinned". In that case I don't think
> `Gsp::new` needs to return an `impl PinInit`, right?

If you don't mind clarifying for me, what is the difference between "it
doesn't need to be pinned" and "it can be moved"? AFAICS, they mean the same
thing. If you don't want move semantics on something, the only way to achieve
that is pinning no?. If it can be moved, and it contains locks, then that will
break unless pinned AFAICS. So if need locking in Gsp, which I think we'll
need (to support sychrnoized command queue accesses), then I think pinning is
unavoidable.

On the other hand, if just the firmware loading part is kept separate,
then perhaps that part can remain unpinned?

Any chance we can initialize the locks later? We don't need locking until
after the boot process is completed, and if there's a way we can dynamically
"pin", where we hypothetically pin after the boot process completed, that
might also work. Though I am not sure if that's something possible in
Rust/rust4linux or if it makes sense.

Other thoughts?

thanks,

 - Joel

