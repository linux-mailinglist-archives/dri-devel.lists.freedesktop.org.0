Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E6B3BCB6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 15:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849A810E04E;
	Fri, 29 Aug 2025 13:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="niM/T1EI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAA210E04E;
 Fri, 29 Aug 2025 13:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSszUsXJTYEdl8r9ELoCQVv1utFXnnFTZJ8tEQ+x5mINKlguN/0rKpx/+3PvtjORFAI4bR/iEbC0SUq9/A9g4pMclRVruRET3IbWJIhgjpsKrKzJUxu6rLOho9QkFJ9cGO2BzE8cPaZWDoe0i8gzz4eqm3ldtJQLJOQipWWqp6Ipf5yCrKgFFvGVfxu4g7gYSWC80H7AfaBVR3VUy181a7ak3D30QdwKIh8nj237G4U4/8z5tHn0R+78rxQ3KXfm3bqqhOBIUZjuNMSqryWVXBMysr6VZW5FryaMCCtMYN5cYqfImQrxYFyV2oTTNCQe9ZBY/TR8rNTyLhyNBQ+S7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+iGB511p+qY9kZH6k4iL//cr2XMHhjqejlvumrpCaE=;
 b=vQtx/9DKeeeV3CtXMeW3EI7BINTFk6ugNlmnSUgVwao8h1r/0FsWRdBnl8DBrUSxfiSxobDYkblVzaQFURKvjf8SJcAxb6AZtBx2g1ksefYgvTobdYv30Gv7wA7WLTN8ldohIPsw1pN2KnWT0ntt06mW+GMBKiHbVSBdoPzQ9qScqJJs7a010vetArxxO9dYJU/8E8W5SIJl1x9mHiu0rI1xcDBk8D5FE80AU5IzceX2CeTB3zi0Ox6TqoANSxs+NXwPwtdGTMd767NhEWVvYLv6VSx83cpaRqlaq5hVRJF17czxL+JGqkfcK7ICxzLTOwbb2Rbch8FpIYovOMN63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+iGB511p+qY9kZH6k4iL//cr2XMHhjqejlvumrpCaE=;
 b=niM/T1EIWuBWbLjSgzrAMvKTkeyK2huoP3S/xF1XuIcQ5C/645wz/yo2vAQfBOe7axVA8W+BLrgSYlOTs/hFgCvCiI3DIn4Awta1lBzQCWLVtAc9KyKRW6rPrA3MruZlvLu+X2Yqm6ZHLVtym8Ly6niwV85x8dbAiTM313io/scT9S4sttcay7IttzlfXHT7VjcnJJPfXBeyWGMyVpW47Ky/TXpzKLcg8cTL6rWAZvtDsA/B5Crgyc/FvD3m45PLZnUGt+K6al4+fQ36q6PtvNIUnV5M8rXlLRjxigLRbvvbJWpof+tSPrvBP4gTla8WqlFbK9oXiWQEfyMyAAeukQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA4PR12MB9809.namprd12.prod.outlook.com (2603:10b6:208:54f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Fri, 29 Aug
 2025 13:43:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 13:43:33 +0000
Date: Fri, 29 Aug 2025 09:43:32 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpu: nova-core: vbios: store reference to Device
 where relevant
Message-ID: <20250829134332.GA1832912@joelbox2>
References: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
 <20250808-vbios_device-v1-2-834bbbab6471@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-vbios_device-v1-2-834bbbab6471@nvidia.com>
X-ClientProxiedBy: BN0PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:408:141::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA4PR12MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1badb384-e6b5-463f-601c-08dde7020c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pmHzLHeBNw51JNd0U7mQ5dvJ/Kz5e7tR+9eTzQ3s9E8N9+Flr68J5KH7QOiD?=
 =?us-ascii?Q?RH+XZ5EpVWxCYHa7S4k9vC+n+bn/AOAusE8J8aa9l+Bozl2xNyK5T9cVsMAW?=
 =?us-ascii?Q?JVMDgycErCAEGUgwTRW+6q1/K0upQO5+RqFnEdcIETVgeeAz5CJiuu7BmPH+?=
 =?us-ascii?Q?MDQH551YyABxuVmrn2HWLDvY/AI5C4PB4ZurqIaq0c8Nt07Y5nas/NWnyz+W?=
 =?us-ascii?Q?FsQqr/P/HL9a7Ky15ajOUvxMQ52lY04NS1ALF8yQ0ojaShLnpdB5Kp3JT+/J?=
 =?us-ascii?Q?a3R0jPItg+Qy16LyReAf047XoMx9CM0PRHKxDTIGe2bH7wSy94S4jl+JEpzs?=
 =?us-ascii?Q?c9fcARfXjTWUwo6N8t3vgZ6AQKMgwHBeruh7O0aR3r9xWuIHJzTpSZNY3bnw?=
 =?us-ascii?Q?bCQJEi5+uZNK/Hx16i+iEMbHqQXex4Fb/mk1et2yuC63XvOu+YhlA8F7c5qN?=
 =?us-ascii?Q?W6yq4Aa65eNaPqAXDFlc751LnrcorEYqzYNNXBjH2WjF0zbLkF4uJ6mdomex?=
 =?us-ascii?Q?BczqyuUiG09Moo/nGKeeegGeVJypQBz4c3qLzQu7i3m1HiPmIKVUeV6nK1QK?=
 =?us-ascii?Q?jEshC7bHyrRXQndTF9SGT79XU8j6MlVtSk0btIqEsJa0dujW1OQKrRTcgmu/?=
 =?us-ascii?Q?dK+GSfGtJ4SA10n8mHnMux9qM0BaRrV5oKfWXHXL2DlTTNfVXUs7hodoTc8u?=
 =?us-ascii?Q?9IMf5rQKrY/FReCyGm9ISFsKTz3BBuEXXUAf+MnGa89IEhKlwP0SCiz2w56M?=
 =?us-ascii?Q?mnYjQrRfNwsi+XsnD8IHHIGRa8pq9Q1StStxUBNFxH0F2295xnyp8oJgX6dZ?=
 =?us-ascii?Q?P+GbzxJkBi/g94oV0kZOfOMbOe38HdHI7MSJUuNvnzHkB5IeQUkRf3jcQhZK?=
 =?us-ascii?Q?VShbm09IXTZc2StmHz0FunQhwAj9rOIFtjA+mhiCVbCYbPBrYzQAKwtJVXko?=
 =?us-ascii?Q?2WYty9chZAyCuv6TI1EeDkH0Cv1EKResRp3K0Lckxkez7KX8Nr0WxzBbsBNC?=
 =?us-ascii?Q?dL7CuUkSYfji5EI/pKwbnih56/3pjN3KYLZFiqvYumK+GsXfMkl+ojIqZJc8?=
 =?us-ascii?Q?HuNVr4jw/qosu5jCDbNejC3piSClqthzFE52tvEqIFX82/9uXH3j4yzREuJv?=
 =?us-ascii?Q?2oPJfJW6o34C+IXPF/em75rZlvWYUzQJHfx6ow5jFkKC7XA+iWj7WRwZvhZD?=
 =?us-ascii?Q?q3wlnwf4swT1ZWxJq/2E5i6J+hC7eQDKh7bVSwQeduc79+wscq2Q752hqJew?=
 =?us-ascii?Q?3kqM7Q+MgD9MOCTxQsclZE9fLWzr7gaI5HLyHf0iTUgQ6RmHzmObvLrgKeku?=
 =?us-ascii?Q?zCxW/w7lRUd9+XBReQQT+9lF/Fae8+Ecg7YIye6VQBsDgn/vQi+oKpj6Bn4B?=
 =?us-ascii?Q?fo0BPFQdQZjUP46JjGdIpwycMRS2TZ4ztWqja7gLIBEOw+rQoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KWt1mYjvvrBu4u2M25bayYMH9w5eBRQzIt8KemFuwS3FLnwmPVnRZh61EM8X?=
 =?us-ascii?Q?wkRuJUj4eH+oTD3ydfDZoMbPP+n1FyNCgqPQk/824m2oN+cXBOWHIYSXGGXK?=
 =?us-ascii?Q?UAnoWbZTXpXjwpcTYQA/FeXU3ohUXDWblfdjGACofJMPXCWmmd2SgrJfQE4V?=
 =?us-ascii?Q?odzlW5agheNZs1XM/OKdxslFofwH+owil94NrPiAGPOr1pazCCEk7bo1BL67?=
 =?us-ascii?Q?5oZ+9cU6P4STb7qxzN9XQhnVj69VDPsCWnM6Ej19wELZgnkTq3HCZA078Gqv?=
 =?us-ascii?Q?RkgELIgiXLQ5tdDf9neW80KWZEPzTnktwPYI8JYgCRx+T7ZSm+Qu+zqqUGbV?=
 =?us-ascii?Q?fUnNDXTTgs8R8NdcSe5uAi28RKrWRdwaKhKK7A/uSMHMRPQ1xMNIXdUTEOVo?=
 =?us-ascii?Q?vQGooTMezfn7sFjwzHKoRy1JV+aLn7rPbU6wohnqAuBOTze5DcDs0m4+MSX3?=
 =?us-ascii?Q?Rn7y2sqRotasnP3jH3gbCnIdp27AcU0/2Sfv54oo0VyDlGTZc31Arn+grhCd?=
 =?us-ascii?Q?arpMqxutzUcAWGiIDu8DwHpfmfsbcVBiPCCUvz+a0qwA691aRwPKmBPl/Hb7?=
 =?us-ascii?Q?a03ul/w2BaoRKywU0mUQg0VAdO4PXhsKOdIUv12S6EBNnw0agBoXwexmvk4n?=
 =?us-ascii?Q?GI5fW4Q5F93o0J9LKdE1NY3lgYsk9EO8Ug77KjxnOD3AltFRzjARy+U46Mnn?=
 =?us-ascii?Q?LStGolbZFEyWeSGQ+rPiUIdIPn7sWDPTtC7Rfp38OYIY+Lez9/hErf/J35ui?=
 =?us-ascii?Q?reAs1kOHrAP9q4Tn4IVPSmQ8XLD4kyI+WS/TciVr4jA5FXtAVoe3sHQTsOom?=
 =?us-ascii?Q?xiwqUsPBQj2emWINuhTCZArs4+0+KP+UyAUHxhFZNv/dadxrIlfWT3FOP34m?=
 =?us-ascii?Q?mGOBsCS+Daoh+5z4UyPA52kjMLNkuLaFgLQYwMT5WuPnb39f4UEZYFAI5Of0?=
 =?us-ascii?Q?mL3hqZLwq5WkQTyleK4wa6m1R3qdJrrVsZvCYRzspsvs0FdIqcyueQXyVkaD?=
 =?us-ascii?Q?laOaqRH2b8CLivVEHfcT6GJqkqXRZpD3OShu1Kcxq/dAnX6gVZkck21ptMxz?=
 =?us-ascii?Q?NM6Og4SFJfcHDxj4p9fpgTYb3yK7BJLwzqVE3tqq0cklGEOas18X22f3bF6L?=
 =?us-ascii?Q?4cZEI9hF5/ru1vOK7JgD2nGCaSDOcZ2pF3S2qFGyBYEgP3t4GqMdGDGoriE8?=
 =?us-ascii?Q?WI8UFCGiJSu4Y7XxSUL9yzGeMJxfRyNMkXXEBd28nnY2qDDnXKfjGrHQsQmP?=
 =?us-ascii?Q?z5SrX88TcA0FQ/XCjBRrtbpXNaZLDEmLCV9J+uPbHDrxZR04AugiEKNtnjdI?=
 =?us-ascii?Q?n/0XCNtTaMyCqQy+gzlsxy27oai0YE1jJTMpEcSjZ+FoAlUBLeutWdLJXBWD?=
 =?us-ascii?Q?2S+kAloDic0le+xZ0K99547SVyPiTb9AGjxeSoVIrTAoPTX2EoXqsw5s0nw2?=
 =?us-ascii?Q?7LcTj6PNWwp4zAhMksO7/Gqflsp7AUzZh08rHWb1IyMVVzVCtJNiYRr5um5M?=
 =?us-ascii?Q?vhEAguJfOw/R8iOg/yFAm+eLyD+nJRDiL/JduREY8mDxPGTXbkZI1LoC9Mvo?=
 =?us-ascii?Q?QEs0Nli3GhdR7Su47t56MK6OC6oMduKAXLgA+uJO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1badb384-e6b5-463f-601c-08dde7020c2c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 13:43:33.8354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWQ54GuUOz4uJOfrCBmnBEchnlpxMl9aHrXQqOoamIVc1JCGsh1mltvEo8als3XJV+VhLgUOhgGDE2yaJORs7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9809
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

On Fri, Aug 08, 2025 at 11:46:42AM +0900, Alexandre Courbot wrote:
> Now that the vbios code uses a non-bound `Device` instance, store an
> `ARef` to it at construction time so we can use it for logging without
> having to carry an extra argument on every method for that sole purpose.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

 - Joel

> ---
>  drivers/gpu/nova-core/firmware/fwsec.rs |  8 ++--
>  drivers/gpu/nova-core/vbios.rs          | 69 ++++++++++++++++++++-------------
>  2 files changed, 46 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index 0dff3cfa90afee0cd4c3348023c8bfd7edccdb29..d9b9d1f92880cbcd36dac84b9e86a84e6465cf5d 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -253,8 +253,8 @@ impl FalconFirmware for FwsecFirmware {
>  
>  impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
>      fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
> -        let desc = bios.fwsec_image().header(dev)?;
> -        let ucode = bios.fwsec_image().ucode(dev, desc)?;
> +        let desc = bios.fwsec_image().header()?;
> +        let ucode = bios.fwsec_image().ucode(desc)?;
>          let mut dma_object = DmaObject::from_data(dev, ucode)?;
>  
>          let hdr_offset = (desc.imem_load_size + desc.interface_offset) as usize;
> @@ -343,7 +343,7 @@ pub(crate) fn new(
>          let ucode_dma = FirmwareDmaObject::<Self, _>::new_fwsec(dev, bios, cmd)?;
>  
>          // Patch signature if needed.
> -        let desc = bios.fwsec_image().header(dev)?;
> +        let desc = bios.fwsec_image().header()?;
>          let ucode_signed = if desc.signature_count != 0 {
>              let sig_base_img = (desc.imem_load_size + desc.pkc_data_offset) as usize;
>              let desc_sig_versions = u32::from(desc.signature_versions);
> @@ -382,7 +382,7 @@ pub(crate) fn new(
>              dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
>              let signature = bios
>                  .fwsec_image()
> -                .sigs(dev, desc)
> +                .sigs(desc)
>                  .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
>  
>              ucode_dma.patch_signature(signature, sig_base_img)?
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index b5564b4d3e4758e77178aa403635e4780f0378cc..6fc06b1b83655a7dec00308880dbdfc32d7105ce 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -9,6 +9,7 @@
>  use kernel::device;
>  use kernel::error::Result;
>  use kernel::prelude::*;
> +use kernel::types::ARef;
>  
>  /// The offset of the VBIOS ROM in the BAR0 space.
>  const ROM_OFFSET: usize = 0x300000;
> @@ -230,10 +231,10 @@ pub(crate) fn new(dev: &device::Device, bar0: &Bar0) -> Result<Vbios> {
>              (second_fwsec_image, first_fwsec_image, pci_at_image)
>          {
>              second
> -                .setup_falcon_data(dev, &pci_at, &first)
> +                .setup_falcon_data(&pci_at, &first)
>                  .inspect_err(|e| dev_err!(dev, "Falcon data setup failed: {:?}\n", e))?;
>              Ok(Vbios {
> -                fwsec_image: second.build(dev)?,
> +                fwsec_image: second.build()?,
>              })
>          } else {
>              dev_err!(
> @@ -742,9 +743,10 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
>  ///
>  /// Each BiosImage type has a BiosImageBase type along with other image-specific fields. Note that
>  /// Rust favors composition of types over inheritance.
> -#[derive(Debug)]
>  #[expect(dead_code)]
>  struct BiosImageBase {
> +    /// Used for logging.
> +    dev: ARef<device::Device>,
>      /// PCI ROM Expansion Header
>      rom_header: PciRomHeader,
>      /// PCI Data Structure
> @@ -801,6 +803,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
>          data_copy.extend_from_slice(data, GFP_KERNEL)?;
>  
>          Ok(BiosImageBase {
> +            dev: dev.into(),
>              rom_header,
>              pcir,
>              npde,
> @@ -836,7 +839,7 @@ fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
>      ///
>      /// This is just a 4 byte structure that contains a pointer to the Falcon data in the FWSEC
>      /// image.
> -    fn falcon_data_ptr(&self, dev: &device::Device) -> Result<u32> {
> +    fn falcon_data_ptr(&self) -> Result<u32> {
>          let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
>  
>          // Make sure we don't go out of bounds
> @@ -847,14 +850,14 @@ fn falcon_data_ptr(&self, dev: &device::Device) -> Result<u32> {
>          // read the 4 bytes at the offset specified in the token
>          let offset = token.data_offset as usize;
>          let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
> -            dev_err!(dev, "Failed to convert data slice to array");
> +            dev_err!(self.base.dev, "Failed to convert data slice to array");
>              EINVAL
>          })?;
>  
>          let data_ptr = u32::from_le_bytes(bytes);
>  
>          if (data_ptr as usize) < self.base.data.len() {
> -            dev_err!(dev, "Falcon data pointer out of bounds\n");
> +            dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
>              return Err(EINVAL);
>          }
>  
> @@ -978,11 +981,10 @@ fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
>  impl FwSecBiosBuilder {
>      fn setup_falcon_data(
>          &mut self,
> -        dev: &device::Device,
>          pci_at_image: &PciAtBiosImage,
>          first_fwsec: &FwSecBiosBuilder,
>      ) -> Result {
> -        let mut offset = pci_at_image.falcon_data_ptr(dev)? as usize;
> +        let mut offset = pci_at_image.falcon_data_ptr()? as usize;
>          let mut pmu_in_first_fwsec = false;
>  
>          // The falcon data pointer assumes that the PciAt and FWSEC images
> @@ -1005,10 +1007,15 @@ fn setup_falcon_data(
>          self.falcon_data_offset = Some(offset);
>  
>          if pmu_in_first_fwsec {
> -            self.pmu_lookup_table =
> -                Some(PmuLookupTable::new(dev, &first_fwsec.base.data[offset..])?);
> +            self.pmu_lookup_table = Some(PmuLookupTable::new(
> +                &self.base.dev,
> +                &first_fwsec.base.data[offset..],
> +            )?);
>          } else {
> -            self.pmu_lookup_table = Some(PmuLookupTable::new(dev, &self.base.data[offset..])?);
> +            self.pmu_lookup_table = Some(PmuLookupTable::new(
> +                &self.base.dev,
> +                &self.base.data[offset..],
> +            )?);
>          }
>  
>          match self
> @@ -1021,14 +1028,18 @@ fn setup_falcon_data(
>                  let mut ucode_offset = entry.data as usize;
>                  ucode_offset -= pci_at_image.base.data.len();
>                  if ucode_offset < first_fwsec.base.data.len() {
> -                    dev_err!(dev, "Falcon Ucode offset not in second Fwsec.\n");
> +                    dev_err!(self.base.dev, "Falcon Ucode offset not in second Fwsec.\n");
>                      return Err(EINVAL);
>                  }
>                  ucode_offset -= first_fwsec.base.data.len();
>                  self.falcon_ucode_offset = Some(ucode_offset);
>              }
>              Err(e) => {
> -                dev_err!(dev, "PmuLookupTableEntry not found, error: {:?}\n", e);
> +                dev_err!(
> +                    self.base.dev,
> +                    "PmuLookupTableEntry not found, error: {:?}\n",
> +                    e
> +                );
>                  return Err(EINVAL);
>              }
>          }
> @@ -1036,7 +1047,7 @@ fn setup_falcon_data(
>      }
>  
>      /// Build the final FwSecBiosImage from this builder
> -    fn build(self, dev: &device::Device) -> Result<FwSecBiosImage> {
> +    fn build(self) -> Result<FwSecBiosImage> {
>          let ret = FwSecBiosImage {
>              base: self.base,
>              falcon_ucode_offset: self.falcon_ucode_offset.ok_or(EINVAL)?,
> @@ -1044,8 +1055,8 @@ fn build(self, dev: &device::Device) -> Result<FwSecBiosImage> {
>  
>          if cfg!(debug_assertions) {
>              // Print the desc header for debugging
> -            let desc = ret.header(dev)?;
> -            dev_dbg!(dev, "PmuLookupTableEntry desc: {:#?}\n", desc);
> +            let desc = ret.header()?;
> +            dev_dbg!(ret.base.dev, "PmuLookupTableEntry desc: {:#?}\n", desc);
>          }
>  
>          Ok(ret)
> @@ -1054,13 +1065,16 @@ fn build(self, dev: &device::Device) -> Result<FwSecBiosImage> {
>  
>  impl FwSecBiosImage {
>      /// Get the FwSec header ([`FalconUCodeDescV3`]).
> -    pub(crate) fn header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
> +    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
>          // Get the falcon ucode offset that was found in setup_falcon_data.
>          let falcon_ucode_offset = self.falcon_ucode_offset;
>  
>          // Make sure the offset is within the data bounds.
>          if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
> -            dev_err!(dev, "fwsec-frts header not contained within BIOS bounds\n");
> +            dev_err!(
> +                self.base.dev,
> +                "fwsec-frts header not contained within BIOS bounds\n"
> +            );
>              return Err(ERANGE);
>          }
>  
> @@ -1072,7 +1086,7 @@ pub(crate) fn header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3>
>          let ver = (hdr & 0xff00) >> 8;
>  
>          if ver != 3 {
> -            dev_err!(dev, "invalid fwsec firmware version: {:?}\n", ver);
> +            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
>              return Err(EINVAL);
>          }
>  
> @@ -1092,7 +1106,7 @@ pub(crate) fn header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3>
>      }
>  
>      /// Get the ucode data as a byte slice
> -    pub(crate) fn ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
> +    pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
>          let falcon_ucode_offset = self.falcon_ucode_offset;
>  
>          // The ucode data follows the descriptor.
> @@ -1104,15 +1118,16 @@ pub(crate) fn ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Re
>              .data
>              .get(ucode_data_offset..ucode_data_offset + size)
>              .ok_or(ERANGE)
> -            .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
> +            .inspect_err(|_| {
> +                dev_err!(
> +                    self.base.dev,
> +                    "fwsec ucode data not contained within BIOS bounds\n"
> +                )
> +            })
>      }
>  
>      /// Get the signatures as a byte slice
> -    pub(crate) fn sigs(
> -        &self,
> -        dev: &device::Device,
> -        desc: &FalconUCodeDescV3,
> -    ) -> Result<&[Bcrt30Rsa3kSignature]> {
> +    pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
>          // The signatures data follows the descriptor.
>          let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
>          let sigs_size =
> @@ -1121,7 +1136,7 @@ pub(crate) fn sigs(
>          // Make sure the data is within bounds.
>          if sigs_data_offset + sigs_size > self.base.data.len() {
>              dev_err!(
> -                dev,
> +                self.base.dev,
>                  "fwsec signatures data not contained within BIOS bounds\n"
>              );
>              return Err(ERANGE);
> 
> -- 
> 2.50.1
> 
