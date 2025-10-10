Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7382BCC051
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B63F10EB4C;
	Fri, 10 Oct 2025 08:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="ORKqkGAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9CA10E324;
 Fri, 10 Oct 2025 07:28:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRFUsH+q+cS7vODv6eGIQ/5rnJX03gMcmDEhThDi7wWczOIKfZZDg1oLYCUSb6w+e+zA879uHWk7H7zpD2GW8KENKIHx//cSPjUP302GKqr2jyZhztcVgtTdhmZim5Di8Qe6oIoz5EbvlhHV4xYGSv+Exl3KH7qonLoucetXMrTATrbgWFxbgT/NJ58Aq3e4UCtoUSTxCbaayZhy61XT09QB7dZ9IpSzt6ZcNJ6r3QZGIq0SBm5BF4ZNJsnKqkPemYFStInNEJluWSMT9qinzja1ZhXFCU61mnJZwwjEE6WrLv1Wl2YnSNzlh4XgrL+aMFgSIG2KjENCHPqHjs8E9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHrzsr9t4HAHlBe27KfHDtTVDzjnyx4Z6WIqOvemvac=;
 b=RbNTQ8WATjUY6wVeJt2vkhQGCOOleeNi2JG9mD5mDyuXH9KygVLq3PNN2uEBKG96mjHq7EdBaE6J3nYbQVbX/K59Yw0vk8MF00l98OA9L66aM1I2/3ZWKLcyj7kNMxTSBC/vRuSXEruYW6mIjNaweDH8i25EyzUqkknUvwRUWitGPFbyNiu8fDa+J1HlOyc1dYTCcILadsr84+vWp+Ai7NnxSL6qAYfaMsA7QJ83Bq8DfQgWLjqwY/KA33iEPZ0uGq8jaNseBdCtZp6CKQltvhz0altuvL7vEhoWA2qb7dhBpJnaLqgZTigC/3qsr6TAxWfiPjDPpjp4HcyhIr9w8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHrzsr9t4HAHlBe27KfHDtTVDzjnyx4Z6WIqOvemvac=;
 b=ORKqkGAiY2bheouSWLyPTR9DtT5xrYDVWYBbae+Squ1Ynru/CdPMP1H5cKnSsMUx9pV9h6YVmBTAJPP2FarYcmB4149GWgoCM1MPuvwBlm9aPbiVroC7jbJarOFNj+v2DEaza6LeckgYQgO42lUM4thw6ZH421Jlk3QDymSqQhl2qbHVvtQNVNLQu9JTGl3rxREEXK33Qa7ZHMCnehIlg18oGstDJ51kZwBgAEPB0euXGs9BY1F9IaPBlqsFePjcq+DseSSThEvMJFwVln3hpLGQK0yJiLPK1YvccC/0m17VaNqkFTf+GovxMPxM2g6aAhNLDsFASsUPpxo9JRr5lA==
Received: from PAZP264CA0203.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::35)
 by GVXPR10MB8583.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1dc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 07:28:55 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:102:237:cafe::c0) by PAZP264CA0203.outlook.office365.com
 (2603:10a6:102:237::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 07:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 07:28:54 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Fri, 10 Oct
 2025 09:28:46 +0200
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Fri, 10 Oct
 2025 09:28:45 +0200
Message-ID: <992d2e12-72ec-4692-aa64-73e8f3cce0c2@de.bosch.com>
Date: Fri, 10 Oct 2025 09:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
To: Danilo Krummrich <dakr@kernel.org>
CC: Joel Fernandes <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov
 <yury.norov@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 "Andrea Righi" <arighi@nvidia.com>, <nouveau@lists.freedesktop.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
 <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.219.93]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|GVXPR10MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b8727a-fd58-4002-ed82-08de07ceaaf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnVqaWJpejlGZms4U1V5bWV0Nnk1TTJQMkNLaFdtWE1OT1NFQW83NG0rRDBM?=
 =?utf-8?B?NzEzU3NsR3dPMWlVMzRleUpBN0J5OGs3V1lOUEtUdDVYS1hOQnVDQXRkY1Vk?=
 =?utf-8?B?UlJrVUNyYmJnTENVUkRCeHUwdjRTWGpOdFViWU9RL09PRXhGUXF3L0ZFVmFS?=
 =?utf-8?B?Y2J0MlQxdzhNeitDaWgydDB5Zk5SOEdQbUpoN1lzd056OHZaRUFKc0NBVTJh?=
 =?utf-8?B?MkdJME1qZ1R4ZFVVelJGblJZRXo1b3NYKzRURlczSHJWbnVhWmJoNzVrYlhD?=
 =?utf-8?B?dmhhdWlsdTBMdVZ1azl6UDgrNEtlM0FJQmNnVUZRd3ByZ1laRlRVUnRZaUJL?=
 =?utf-8?B?S2pVSU16d200aVU1ejhuNzhtRmJxTTN4cDg0OUVNRVhQS2Z2WUNuRnA0YUJl?=
 =?utf-8?B?OVJZSnpORitxNzl2alBocWQ4aWVtQTdqSTRZTG1saFl4cWNGZ1F3Q29FQklZ?=
 =?utf-8?B?bUVWYTU1RGlrWUwxNm5CQmZPS2w1ZTM4Q0NCWTNJZGJ2d0Y0TUcxL3RHMW11?=
 =?utf-8?B?d0d4Rkc4Yzl4YU14V2lLNHRQL3F6RHV3bGRvcWwrbzIrTjZqYW8va2FBaFVG?=
 =?utf-8?B?ZFBMTXFpUGpJVStQQjZ3bTdnYVc0VStXZGMwY2dKUWp0ZFo1ZjZ4bm5qQVUz?=
 =?utf-8?B?cjRpYWxtQ0t2K1l2Z3plNENtTW16b0xsR0w3NHVtVXZycXU4Zmp2QTNCUXQ2?=
 =?utf-8?B?QXY0enovekJWNXFpNm1ocXhaN3NlNjM2WmU3WHF1aVQ4RWRnbE5ES3BXZlly?=
 =?utf-8?B?RHI0Q3E5S0NRZmtXVno4NEVteDNuNFdTUTlVaU9mQ0JIVUdocEJXQ2hCNFda?=
 =?utf-8?B?MXVLdU9CR2hWc3laRXlyRU5VeUMyRjFWbXA4ckwrZ01UdFh2QW1iVUl3UVJ2?=
 =?utf-8?B?b0c4Y2VxcTM1c3ByUnJaSmRmK2xwSE9HSzIzZGFxbVplVjlzV3RFd1pWOVEy?=
 =?utf-8?B?MjFYbkZ3bHExbkhDMmQxM1UyZVFJYnhPbkc2ek5HUTRiMDhJdjZoaVpTa1dI?=
 =?utf-8?B?SVlSdW9saUZIZWpUN0RCeTIySWxKWlo0UXJMMXQrRlExS0hXV2ZoR0lWdkNy?=
 =?utf-8?B?YlNPdEpkU21DSSt6a0hGTVlPcW8yNUFFeU1uU2M5My80bUV2MGVUdno4cHpa?=
 =?utf-8?B?Z0lvTmZKNjRIODg3NkNjLzArMzlOY0dmUTN5NTVkSmFXSGtvajlCWHdRZXhn?=
 =?utf-8?B?SVVxUndZVXYzMjBtQlBkQXVmNUVjSUUwbU9GdldwNXZqSkYzbWdValJiaCtu?=
 =?utf-8?B?T0N6QTYwcU5zajZ0UTEwdk9JRm1OMkZiUGloZDgwYUVRSUJoT2F3MnZFcXNH?=
 =?utf-8?B?UkI4K3NVNjFuUW5uWFRiV3UrMTRXbGYrek9KM1UvYnhlWGZ3UGRIdWlMN21k?=
 =?utf-8?B?TzNOLzB3REdLNE1DUC9pTmZ3aXFOdmRlQ1lRcnY1czhJVEJmMjcvUkE1RW1r?=
 =?utf-8?B?amFmZ2pFM1gxWVE0dDhiQVFwRWovVThHN2l0RzlJdlZ5dmVCNXN2Q3kwT2Nm?=
 =?utf-8?B?aGE2aE9GZ0N4U3FXeUpnUDZtWTVFeDlJdC9UN0oxODFLaG1Eekpwb3FkZm9G?=
 =?utf-8?B?WVZaa1BPazNRL09rd1hhUHJ0RHhwR1NtK0VjaWI5cFhxc0xVWjk1bmhoQnky?=
 =?utf-8?B?SzF5WVducUM3TWtHWDh2aXRETmZqUmRQZGp2cVhKWm5yQkpCQk53anFIN1ZK?=
 =?utf-8?B?ZmZNWnpDVFhhS0owUE00T0pyT2lEQ3QyS0d3STBlcy90MjE2bEJRY2RxcHZs?=
 =?utf-8?B?dFg2TU5SYkcydWtXSmdOaTJIT2YvY3RRUEU5UUh3ODZSUXM0L3NWMmUwak42?=
 =?utf-8?B?aXk0ZzliSXFIZGMvTDZNWko0U2FYYWxrUFdTMy9EUFFGQWpIME5LYUlLSVBC?=
 =?utf-8?B?UkdiRkFFWmQ2OVNJUG42dlRIWldpU3VQeHZTa0wzczY2cjd1bW1sT05VMGpm?=
 =?utf-8?B?dVl3RDhhN05tOWVKeHNYOGE0QTQzZWZvcWF4N3QyclV2TUVYQ2w3c2tja1Yv?=
 =?utf-8?B?aWs1eEZVbzhyeUJQYmxIaTVPckFvdkF2VzhUZ0FuUEVibVcrOXQ5TzloeE1P?=
 =?utf-8?B?SzkzakJvTkE1RUtuV1dJNjdvWXhUY3Qzb2VNR29abjdZZnFVeU40aTVCUDRj?=
 =?utf-8?Q?sh9Q=3D?=
X-Forefront-Antispam-Report: CIP:139.15.153.206; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 07:28:54.5724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b8727a-fd58-4002-ed82-08de07ceaaf5
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.206];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8583
X-Mailman-Approved-At: Fri, 10 Oct 2025 08:02:40 +0000
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

On 09/10/2025 13:16, Danilo Krummrich wrote:
> On Thu Oct 9, 2025 at 8:59 AM CEST, Dirk Behme wrote:
>> Assuming that register.rs is supposed to become the "generic" way to
>> access hardware registers I started to have a look to it. Some weeks
>> back testing interrupts I used some quite simple timer with 4 registers
>> [1]. Now, thinking about converting it to register!() I have three
>> understanding / usage questions:
>>
>> * At the moment register!() is for 32-bit registers, only? So it can't
>> be used for my example having 8-bit and 16-bit registers as well?
> 
> Yes, currently the register!() macro always generates a 32-bit register type
> (mainly because nova-core did not need anything else). However, this will of
> course be generalized (which should be pretty straight forward).
> 
> Having a brief look at the TMU datasheet it looks like you should be able to
> treat TSTR and TCR as 32-bit registers without any issues for testing the
> register!() macro today. I.e. you can just define it as:
> 
> 	register!(TSTR @ 0x04, "Timer Start Register" {
> 	    2:2    str2 as bool, "Specifies whether TCNT2 is operated or stopped.";
> 	    1:1    str1 as bool, "Specifies whether TCNT1 is operated or stopped.";
> 	    0:0    str0 as bool, "Specifies whether TCNT0 is operated or stopped.";
> 	});
> 
> Same for TCR.
> 
>> * In my example I used io.try_write*() and io.try_read*() for the
>> register access. What is the relationship between these and the
>> register!() accessors (e.g. from the examples BOOT_0::read(&bar);)? Will
>> both stay? When to use which?
> 
> The try_*() variants should only be used of the offset of the register is not
> known at compile time.
> 
> If it is known at compile time (such as in your case) you should use the
> infallible variants that perform a range check at compile time.
> 
> For this to work you need to specify the minimum MMIO range your driver expects,
> i.e. instead of
> 
> 	let iomem = Arc::pin_init(request.iomap()?, GFP_KERNEL)?;
> 
> you call
> 
> 	let iomem = Arc::pin_init(request.iomap_sized::<TMU_MMIO_SIZE>()?, GFP_KERNEL)?;
> 
> where TMU_MMIO_SIZE is the minimum MMIO region size your driver is able to
> operate on. In your case this would be 0x12, given that TCR has a width of
> 16-bit. However, if you treat it as 32-bit register it would be 0x14.
> 
> Even without the register!() macro this would be a huge improvement. For
> instance, your IRQ handler from [1] can do
> 
> 	let tcr = io.read16_relaxed(TCR);
> 	if tcr & (0x1 << 8) != 0 {
> 	    io.write16_relaxed(tcr & !(0x1 << 8), TCR);
> 	}
> 
> instead of
> 
> 	let tcr = io.try_read16_relaxed(TCR).unwrap_or(0);
> 	if tcr & (0x1 << 8) != 0 {
> 	    io.try_write16_relaxed(tcr & !(0x1 << 8), TCR).unwrap_or(());
> 	}
> 
> And with the register macro it becomes
> 
> 	let tcr = TCR::read(io);
> 	if tcr.underflow() {
> 		tcr.set_underflow(false);
> 		tcr.write(io);
> 	}
> 
> Note that you can also extend the generated TCR type accordingly, for instance:
> 
> 	impl TCR {
> 	    fn handle_underflow<const SIZE: usize, T>(io: &T)
> 	    where
> 	        T: Deref<Target = Io<SIZE>>,
> 	    {
> 	        let this = Self::read(io);
> 	        if this.underflow() {
> 	            this.set_underflow(false);
> 	            this.write(io);
> 	        }
> 	    }
> 	}
> 
> and then from your IRQ handler you can just call
> 
> 	TCR::handle_underflow();


Many thanks! I think such verbose explanation helps a lot!


>> Note: Due to the file move obviously not the full content of the "new"
>> file register.rs is shown in this patch. Therefore, let me try it this
>> way, citing from register.rs:
>>
>> -- cut --
>> ...
>> /// This defines a `BOOT_0` type which can be read or written from
>> offset `0x100` of an `Io`
>> /// region
>> ....
>> /// ```ignore
>> /// // Read from the register's defined offset (0x100).
>> /// let boot0 = BOOT_0::read(&bar);
>> -- cut --
>>
>> * What is "&bar" in this example? Is it the `Io` region the explanation
>> talks about?
> 
> Yes, it's the I/O backend (a pci::Bar in this case). However, we should probably
> use a more generic name in the examples.

Intuitively for this example I was thinking about &io ;)

Thanks again!

Dirk
