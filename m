Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA90A26533
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 22:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5458A10E12F;
	Mon,  3 Feb 2025 21:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jJqZ6JQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2F310E12F;
 Mon,  3 Feb 2025 21:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFqsODahUtNC+02DDtm29WWfJ0cnN1bDSfLMUnj8NhSiRF9OCitPPd7cB5jDnzr7Fww55wxLc/4nT0GthO+A/kBL5lRgJx0rRNrfqqcCX148aUEPMIR/SKUoWSreC8Ayd3Ii06SPUm2XNZkaaz4ejZCmPmlcor62z22Bd5a6OmNxWFD55AYtSAqT5ZJIGjX9hR/Wh8ODCZ9tnmpTVnPNtSHXtpO+UbjIio63UU/1XRzxzbrwQCdWOkO1VmGePGYMSenrOG+SbRHKO+Tg5PmrMvqdGwKksriXVxwLZS3uKRfOEaNQEkXTseQoujjQBTCsVtud+blm0W3guKFp5tSDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEvL1OXWBfJUYlGy5Le2d+ikAXjzaLqutrDUCcUMPek=;
 b=hSruqAEGUd5YOJiwbE6tl5wonIjBGB1L7su6qlBl9Pt46omTfhAWpfjAvrQgYBgtZviy+M06na6pzn7HKos3jFpk9dBgJ42sIs36LXzz17jyle93Nx9zKbTXxeUuCd0kpEBhBZAtwqFcGg8KKKx1HwqPXcDg9adI+54fBSeS4tYddYkusRfgnZaWi2dG51taBuraZwiqYY6sZ1pnfgA2O+xungV45zcbo4AdTu0U+3mIiKUUPyWdMcW9e2z1lgNJkQe+vOrhiS5NhLkBBd/k2LRRGcR6pSrOgqqKle2rswlAYCysoA5w1mxK07Ttv82mN59WWh5cOvkfm+EwM9KO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=joelfernandes.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEvL1OXWBfJUYlGy5Le2d+ikAXjzaLqutrDUCcUMPek=;
 b=jJqZ6JQVFAhLRjOVRYNgWjHEs3Ey/+0EMX92ogYNGa1DvHK06jCRd7Yws320C90jtWX6QB5I0rML4A4Yi8l2PnDVNtOFFhc/N/dOBdS4yPW3DxRIZU1UGTqPTdwfw9D8/prpJiNSfhr2Lboi1DwIlHHkLGfoMc5jnDbn8SS43ztWUXCnqHfRB4E4YSM5BSc9GFmg1O7w2cWvUXFXdMfUEVdqTCX3T6Vlyp8endDBWnaiEicWKLaTNiV6gvvoxPnWraOf6tDIneZqgskqIN9L4nf548pCyYyZo5QDAI6jw3wzsmHA5ZNPS1KHavjQP/XSVvtpRSrpKakyAgLO8P11Lg==
Received: from DM6PR12CA0012.namprd12.prod.outlook.com (2603:10b6:5:1c0::25)
 by CY8PR12MB7362.namprd12.prod.outlook.com (2603:10b6:930:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 21:00:09 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:1c0:cafe::24) by DM6PR12CA0012.outlook.office365.com
 (2603:10b6:5:1c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.23 via Frontend Transport; Mon,
 3 Feb 2025 21:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 21:00:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 3 Feb 2025
 12:59:58 -0800
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 3 Feb
 2025 12:59:58 -0800
Message-ID: <34d7a6af-5974-482e-9f70-3f92a823bd96@nvidia.com>
Date: Mon, 3 Feb 2025 12:59:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: Joel Fernandes <joel@joelfernandes.org>, Danilo Krummrich <dakr@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <corbet@lwn.net>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <ajanulgu@redhat.com>, <lyude@redhat.com>,
 <pstanner@redhat.com>, <zhiw@nvidia.com>, <cjia@nvidia.com>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <joelagnelf@nvidia.com>
References: <20250131220432.17717-1-dakr@kernel.org>
 <20250203202410.GA3936980@joelbox2>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250203202410.GA3936980@joelbox2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CY8PR12MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d2607c-d2b8-46c6-1e91-08dd4495be42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnhhckdHZkpTd2NmTGFHcVMvMmQ1VnBpbG5LMnVwbUhmVDUvdXhLcUl4dXdB?=
 =?utf-8?B?QjU3bzJsUmlNalpDTlJOUU5kUlRZakJ5UXZYWGNQLy9wSnUxMm9KSUNvZk5s?=
 =?utf-8?B?SnQ4UjVQVW85Y3M4d3NtUGJNMU5hZmpuV2lOaGM0MVZwR2pSRnFZNklBQXZX?=
 =?utf-8?B?TUltVEo4czk4bC9FdVZucU9wcmpaK0lUenhkNk1nMVVFODNPZExnNmdqTVlB?=
 =?utf-8?B?TVJXa2ljZU1CT2REVm5nTmZXMVp6c3Nwa2hKZXBxRGJwWXNVVEFHQkFva1VD?=
 =?utf-8?B?NVNTcnE2ODh0VUMvUjQ0YkdCZTc1RGJhaFNuYlVzMHJhUEo5VThvdGh1SHdo?=
 =?utf-8?B?VHBUWHYwWDIzVlNOL2FtY2dyRitOckRVY0FZTDUvNHZhY1RKTkpNVUF5Z0ZN?=
 =?utf-8?B?bGZRNzB0cWxLWnpxbUx3d2tLdnpsdnFlVlNiTkNab3VxM2JPc1A5S282bWND?=
 =?utf-8?B?YmVLN3ZmdmpNM0o4MU9wTlN3cE5UeXVMbm90aUwzd3lQTVdLbEdMK3phclRM?=
 =?utf-8?B?TzFkK2plL3JGd0N3NnRIMjJIYXkvdUY0TGR2L0R0SmZaR2gyaGdtMllBQkNr?=
 =?utf-8?B?MXdlQzd4ejBRQkVBTno2Z1BwTWU3Wk5YUkF6RGFEMEk2ZGcxc1VwUGhCdkF1?=
 =?utf-8?B?bjlLMVFma01CRzdoMXVKVXViaW1OWHpNK1cvcnlZVDQrTWlwcHJ6RjZVeExY?=
 =?utf-8?B?ZUV0dGZqZXV0TU5pdWc3dDA3ZlptQWl5K1NZb1JZTEFwYnMzLytBQkZXeWcw?=
 =?utf-8?B?bGR4MFhzWXBQYUZ0Vi9pS3JybEQ5Nkg5eC8yUkFqcVVVN3VpWDgyenNZRWRi?=
 =?utf-8?B?NlNEZTEvclJha1FIY1lob280czJGc0Z0SDV4YVF3V0c1dGpLeExvWStQQldL?=
 =?utf-8?B?QjlReDVNalpHRGhzc0lIKzdiVGpuK0Y1eEVDdkk2K3Vqck1CTEt5UXJCb3hj?=
 =?utf-8?B?VWF1cFFQRmc5ODdYSmxzak5EUDN0WDIvTmVMeUV6N1Z6VUlETlExbVJDdGM1?=
 =?utf-8?B?amdDM3hENHZSOHZZeXFtQ3c4eUpZZXJmak5qUmZocm1RYndxVXdycHJvSlhP?=
 =?utf-8?B?ZkhRd0NpdEhLUHdTZ3Exdkd3YndkVTZzcGN5N3loVERDRjhzU2VhazZBYzJU?=
 =?utf-8?B?WkUxbytOcUhEWXdFaVk4T1kra3Z5SGNFZSsvVzNwSVR6RWZ4czQ4YXdOd0F3?=
 =?utf-8?B?czRtTUVkUHgxUkx4eWZ3WW1vc1lWUTJTV1hxUkFKOEZCSjg2ZTk3M3djM1J0?=
 =?utf-8?B?WkJtL2hKZms4Z0Rhb1MzNGxMY1pXb0ZYRTRNbzVleTc3VHhqWnR3MnRsSTBD?=
 =?utf-8?B?ZHRpeHNyU1N6cU94dlBtck5wTXVEKzc5bHRmMCt5ZGhpSktkb3VtcEFaenBY?=
 =?utf-8?B?NzBuZk1Ealc1YXVFSE4yK0VWYmVsNHJEN2tLcEFUSHJvbWRqUUJIbTNRUUhi?=
 =?utf-8?B?bjJuRnF5VW5RZHJKK01VWEhmemYvaVNLdTF2b3Jlem1qZ2c5elBlS1hhVlV2?=
 =?utf-8?B?UG9sY0VkVlJuVi9PenRwUWIxOHNLNGVUZjU2T0dUZWNKOEFPaG02aE1tQ1d5?=
 =?utf-8?B?UXEwZEFrV01ZTTZTdld4eUQ3TWhKSnY3OENlVXZmL2gwcXhVM1hGWEEyMG9M?=
 =?utf-8?B?Ymd6cHNHWnpXdVhrTTcwMkRYTUFYbFJseVlLQUsxamZ6b3MwRXlaWHNTMWgr?=
 =?utf-8?B?bzJvRFBiV0hxcmNNODdteWhFYmxJOEc3NWtxZkhqN3BUandHOVVuMEdNM0l1?=
 =?utf-8?B?V0FJYXMvZVpyUTZ4Q2g1WUFvemRHaUVwWkE2dXpuZzZ5a0orVDQ2V1JzWldu?=
 =?utf-8?B?UFRZRUFuS1BURExLMGNCM0JFT29KMDI5YjROTXhTWjZWNWpmelZUQnhSSy90?=
 =?utf-8?B?b05HRGNlZytxMlN2Sk93ODZvUk1sK0xqemt6Yk5MRkhOK1FBdy9QOHNlbGhC?=
 =?utf-8?B?U09tSjdqbWIyWlEzbmVpZ0JFbVZGTU5aVERySjBIOWxlaWViYW1Fei8rNVhG?=
 =?utf-8?Q?Xdl1jc8YIJj7cPIoz4H69SRwBxuP9s=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 21:00:08.7736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d2607c-d2b8-46c6-1e91-08dd4495be42
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7362
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

On 2/3/25 12:24 PM, Joel Fernandes wrote:
> Hi Danilo,
> On Fri, Jan 31, 2025 at 11:04:24PM +0100, Danilo Krummrich wrote:
...
>> +const BAR0_SIZE: usize = 8;
>> +pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
>> +
>> +kernel::pci_device_table!(
>> +    PCI_TABLE,
>> +    MODULE_PCI_TABLE,
>> +    <NovaCore as pci::Driver>::IdInfo,
>> +    [(
>> +        pci::DeviceId::from_id(bindings::PCI_VENDOR_ID_NVIDIA, bindings::PCI_ANY_ID as _),
> 
> Does this mean it will match even non-GSP Nvidia devices?
> 

Yes, it does. However, the Gpu construction a little further down
will fail on pre-GSP GPUs, thus failing the probe(), so all is well.

More below:

>> +        ()
>> +    )]
>> +);
>> +
>> +impl pci::Driver for NovaCore {
>> +    type IdInfo = ();
>> +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
>> +
>> +    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>> {
>> +        dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
>> +
>> +        pdev.enable_device_mem()?;
>> +        pdev.set_master();
>> +
>> +        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core"))?;
>> +
>> +        let this = KBox::pin_init(
>> +            try_pin_init!(Self {
>> +                gpu <- Gpu::new(pdev, bar)?,

Here. Try to construct a Gpu, which tries to construct a GpuSpec, which
fails out if Chipset is not listed, or if CardType (which should be
renamed to Architecture) is not listed.

And only Turing+ GPUs are listed. Turing is the first GPU that has a
GSP unit.

By the way, I have loaded this on a system with a Kepler GPU (pre-Turing),
and an Ampere GPU, and traced through actually loading NovaCore, and it
behaves as described above.

thanks,
-- 
John Hubbard

