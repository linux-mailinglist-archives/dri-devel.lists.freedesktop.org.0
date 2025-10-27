Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E0C0FB29
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF5410E521;
	Mon, 27 Oct 2025 17:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M/UQn/v3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2582B10E521;
 Mon, 27 Oct 2025 17:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNbrTwS1JiXQuBTl+UfuZoapIS77LRDYv3MFZ25Fg68xjHrgZtkXYGKsg91FlspXFPMTekzQETRmCkNXg7eeJED5tFVh39lb15YEK4M57vZxU+6/aDapGb4KGd2++XBEutikd+6IZxOG3nQmE6+uBqdCDxbBWtw05Y6J2+qFX7QIVGZw/fVuyHma3f3LSAAEppcLAavv06E+oP5BWbmD3YYbhyQPpz+Y0jRxnw7Oi77+VrXUJOLHO5qum93kMStpc80xKSQ7uSJimDe6+0c8iNze/v2VyEFk7zeXuztt842xcyis2CfBBobaocezcFiiSgp52FY3GMpNcd1jY5917Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0LESYIu5Xu2BoZEen3TsmF3SRKu6EQEA4H4XSJplNU=;
 b=HsS8aDrw8oMLEn27EgTNzQ1D/F9A/8WzBau/bJqAKYIbyoy/TW7ylp7zu/838/NpYiM/gbzTtoFJKFPAUpZO4dAqFoi38OkJIUxebcIuewobz3sTqWxgm2sxEFWtgVseR6L7adNutJYRvSbhN1F+4TbRT2zp4SHTshKzi3RPfuYWjFOD8Mh1aS0xFCrULLoSQ24EbMOoWI8LD6kr//FUcnptDHg9OenMiSRKDratWzFdHsR4O7zCz7pgcl4MIm0+orPJS0SIPX3SuPn2WUapWC2MrcRJZxY6tLafc2fOsfvjWTw1jYIPzNsOPadebtJ5H+Pg+/w2m6DGQIVClezSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0LESYIu5Xu2BoZEen3TsmF3SRKu6EQEA4H4XSJplNU=;
 b=M/UQn/v3uz9RMZRg1z90itPAXrk1XAjQr/jVxrEuYh1hfmMZJsr86V/Jh2C2bIfoQQmCQ4/HvJ2T+BuiyIF7prcytHFKu4DMf5lB+VEdzppbKSjCf60kro8O81NztSQjJnqaPrv0NDK1FDsBmM7I4kGaZ4fLtsr6Bn9rNOVI2YtLu+mEwqCnrByOWfx4K00CVR1aAnwxlyVPG04WiFFexmLgYupWflq3Grdf5THNCihBoE2E86rkHKWdxdzCI8cfcXXXnV2+TxodBBF+DzR9MOhyrOM8IGQVxysoV2Toc0wQ5N17GPIERhpRUMTcvTVLGzZ3JGQdNbUgTpWXlagVOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 17:37:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 27 Oct 2025
 17:37:57 +0000
Date: Mon, 27 Oct 2025 13:37:56 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 3/7] gpu: nova-core: vbios: add conversion to u8 for
 BiosImageType
Message-ID: <20251027173756.GA3188703@joelbox2>
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
 <20251027-nova-as-v2-3-a26bd1d067a4@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-nova-as-v2-3-a26bd1d067a4@nvidia.com>
X-ClientProxiedBy: BL0PR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:207:3d::43) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e46d80-bbaa-4505-b034-08de157f9127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dkI93bn8eNR5bjE7X/tjC1qd95Cj+nodYUFXxKTGuC+0aPQSJYUpG6yEH54/?=
 =?us-ascii?Q?af4TPsub/k6HmGI4ZzOOgnPaBwA8Fazg2UNF03qrDeNlqBU8l4jDvEX5g6RU?=
 =?us-ascii?Q?xKkAwR+wFJ/kzBHFxu8ajbnXtmjABpvyMlZTUokCME7BcGo/j+MntjqvUpZj?=
 =?us-ascii?Q?HrPUSKKeyexS4Ha4AZkgOkg3UdqlywELU6DdtlYveElQ6xAQAuR39Y2kD4Fa?=
 =?us-ascii?Q?4wrmfgcoFMLyI2g3xlqdu5JL9cB+KF3YFCtH8NO+IV6TnQGtJGgdPrbVHjuH?=
 =?us-ascii?Q?oUaq8j9y4qdTG1oolNkBD9UXIJHeSzHoBxWNhsWPRdvN4xygASo70oS/nkp+?=
 =?us-ascii?Q?bTab4WB9Tkz19L1/RlIAUl1ukx6BNth7hp4+d08Y7Oo4jf+7bdp8Vrl0TxaF?=
 =?us-ascii?Q?FIFr7n/kE+mteAHXS6KLVKHnoWiuLAdkDZaezlVIeTfUmbi1k/dYrBl9rZof?=
 =?us-ascii?Q?+GDR1deFKetOXCJxgT9UlfdJ8KweIn7k4nPDdvCXcQC8H9wB2gk/Sbdc4whS?=
 =?us-ascii?Q?MHKFDYRYYZkARQN1NQKGh8U8QrwgqXzewDr2uYMc8BQ6e3nqHEIL22TomTzV?=
 =?us-ascii?Q?Bph7Svxg+UpZb26XeZuRGWsabXm+ppfQPbOdytA6w3aGE3seiKFz7K73cedi?=
 =?us-ascii?Q?WqPoA+lEdgsSOD4ErqUW6hUMCEOTBBG4cbO3R97XD2XqQz6F26x6gFa3r2z2?=
 =?us-ascii?Q?ere1dZdMOu65gACAyjZExCAvNQQ7orJgb4xt4r6URNDoHo39POB1TWP6kEH/?=
 =?us-ascii?Q?69zcmJuzw8zo0DeSZtqhuAybf2jjTkRjglB8+ps8O7nZU88JlgtaiUibFBUf?=
 =?us-ascii?Q?eB0vUN/M41w0WezA7mP3RXzJgOaQVOfEqDXxqRUlprTYYzSnZSDDJpCOmw74?=
 =?us-ascii?Q?nt/4cNvjFqYSvyb/KC/CPD58KXQDkjgSknYk+A4U8VgjLWIZ7Xfwfxytdj8W?=
 =?us-ascii?Q?ae0+YjIE475eFIf1TFEiuPiyA3C5mqamZKPt3mrA3X1ZFLOztToRLgQzeQ98?=
 =?us-ascii?Q?L/moTINW9KMyOcvgdVMsPj5LoKgZmUXAqjKldwWuI8BMls6ABxbsHJAtTxLK?=
 =?us-ascii?Q?+5Fm1StswdcHprALCZqjqBSCciNf6kxFH/JXz0AoBF3p7eJ04bRD6WxB21RO?=
 =?us-ascii?Q?9cPEUxrvSyUUT8cw60yCkOfM/w/nBdFmsBlbul9RsGlbTqCTcIdLmQMOCqnI?=
 =?us-ascii?Q?UklbJwPwNH0v2/xMW1O8TahDlWdoNaqrrpY+K8hM7efCmklEsxiE5fGAoI1T?=
 =?us-ascii?Q?r2VSOcshScZyandJTOpXsCq5RDyd0lKSCLtl9SKBBmFo9/pqG1Y0NKfgPJEl?=
 =?us-ascii?Q?rHIpAI1zHXPmU77hqMNm31820RHijjCE3CpeTyPPi1IgyAHaV8/QX3+RQiMv?=
 =?us-ascii?Q?t5hZ9xQI2SjHObb4gZAsfnVbc0yiNFup+ORyvGXpz8eOcxeSVmnsAecB5byM?=
 =?us-ascii?Q?qNtOfb4U8T4RH5aoMr2bVWo+JzDxaMVb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o4Hvs2lVMCG9JBNPBkaCYIlB0UHe2XgyQcjZ+CSJSNNgDvUR1s4TeP0HqVSp?=
 =?us-ascii?Q?5VzlSadRuTb9aqzqXrRGIWOq91AO/72x6CwE37epsFsQ2MKKWEON5j1eANap?=
 =?us-ascii?Q?I9Z3myvMEDfxxHHyGtVwapPjHXleko0Yo9yYSs6TC6KeHbxz4lYhvDfMviky?=
 =?us-ascii?Q?bvKPBGIokgh5v3VDkBhHjxs4NLa90HV9/vFWTqPwjefkStM+xG6qhoRyURDX?=
 =?us-ascii?Q?dZaA7uGAfwjez/qrpTKwrhJ2Jx30SG20HwhbDH6aotc5VaHi9Lp7PaGLLnlc?=
 =?us-ascii?Q?zysLi3BBvIfdYqx6sRLAku2Ghvl/F9teohCl6NGCZnWMQFS/V93T67gGZdwd?=
 =?us-ascii?Q?oVf2lEwWC3IkgkI2i59Cl0N5r3K7bF+S8+wd8uqRPd/fG9D05uztOE60gGra?=
 =?us-ascii?Q?5mXsgsxBqs9o3YUW/e1E//oJA/onrKAN2Jic/WxI3CiADZAcYEShRyWLP+R+?=
 =?us-ascii?Q?+XiN30K/rWOe+zLfbmt7iHiSXcy15z9guwa7bmhemHDxJ351Ci+Ur6Bdq59M?=
 =?us-ascii?Q?ecZiUvhCKqKQlMCttVi5bZnCF1QOVizF3/o8qQVvaw00MQTYN+5/cboQAqho?=
 =?us-ascii?Q?PRcRNxNPdZNQ01+BpsjlMGRHLuXidKB4ID8wmD9Cb5xfdzeDDqg60QVng6P2?=
 =?us-ascii?Q?DVEQCbgsdKUgyCRvkHF8IrrdocsXi8R9bw3eO9iXjacnh3VEPd/cGrMxbbDo?=
 =?us-ascii?Q?qQBCvjJ0CJTwzS+ggwRfDxQQJy5p0tyPFJY2/NuLzsnQ0zZyIseZCpUoGHpq?=
 =?us-ascii?Q?85cDMx1OheLPwj66UaNpWv9jJddx35/SVPuQ5gfrxJOSQdwH7RlbGtQ5l8wC?=
 =?us-ascii?Q?4bUle/NwGQ4R5TVCKPJ/AJ5lnK5+R26AGnNFq+oI2MH2LInHhSnvNCTtNNHi?=
 =?us-ascii?Q?dA9gEHhBhYL/Ft857sf+0PmZPojvwhqdIAl8z65fPKlyI5RfCYBx3QfEsGiB?=
 =?us-ascii?Q?Mn44G3Qx+H8sIBbmRpUGXhuaXlV/4jIWzl9casKyjJLXuce6QAW/AKRwgS7p?=
 =?us-ascii?Q?gn9ndOeDuKlrYM6cCQXWqJgiO4BJXJnf/88YXMjCJxEC4gyD7zpa3vPRGSmU?=
 =?us-ascii?Q?wD9icnL/WaOCn8KempUB8ZDeD4btKDTvkPxj+m/WRiuKOa+H9sAcyxcs2Ags?=
 =?us-ascii?Q?OyJKTR8jhAaGGjOEg1WO55CCGMSq8Q1X8SHa2Sit1QPwrqpMDnqFekMYS9Yq?=
 =?us-ascii?Q?8Z5tW2fT7RjKb6z06dWD1GMTfPnNL59SYnAJAeqV5FCfTo2cgK7VAbNaSuDD?=
 =?us-ascii?Q?/3EVGTsdz+F1ymLQc3hAE+EUBQxC2mn5/We6u10jp2W0XnnOw0N+dBtoi1sK?=
 =?us-ascii?Q?iVWEqFqYUZYENO1jEfKmZnmoG1X28Jf0o3+QbuthIq63bLcRmBDsIUlJWkho?=
 =?us-ascii?Q?1tNKQJLZSA+qWX0RbEkX6QEixteGvSkJozTCrHiYkYJmpeO9btnTkoSHOhFq?=
 =?us-ascii?Q?6KywavMchnk8VRT0c+/k6ogr0XchVE3SGEuEH/XwneQtvNLk0sv3InQPqXSs?=
 =?us-ascii?Q?3ENzBGKTgkMNJ9rvBI60bFuE/A/6AQsXDUAh8bldItammH10/hEi8Ueh+z7T?=
 =?us-ascii?Q?6gr3+llcnqbGFuv3Y/eNdozo259aVNqz+1PzMyy3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e46d80-bbaa-4505-b034-08de157f9127
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:37:57.5483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Sb24q0hQ0wptkWu4nth9PAKsW0dn4KhhCZvjvOFLXm3M1txVkspkaFtyq2D1b4nri+CUE5sZxWgwTuK/qf5GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003
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

Hello Alex,

On Mon, Oct 27, 2025 at 09:54:43PM +0900, Alexandre Courbot wrote:
> Since `BiosImageType` is `repr(u8)`, if can safely be converted into a
> `u8` but this is not obvious when doing this in the code.
> 
> Instead, implement `From<BiosImageType>` for `u8` so the cast can be
> done in a single place, with a justifying comment.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index dbe0d6e4a015..a521c0a4df0f 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -50,6 +50,13 @@ fn try_from(code: u8) -> Result<Self> {
>      }
>  }
>  
> +impl From<BiosImageType> for u8 {
> +    fn from(value: BiosImageType) -> Self {
> +        // `BiosImageType` is `repr(u8)` and thus convertible without loss.
> +        value as u8
> +    }
> +}
> +
>  // PMU lookup table entry types. Used to locate PMU table entries
>  // in the Fwsec image, corresponding to falcon ucodes.
>  #[expect(dead_code)]
> @@ -711,7 +718,7 @@ fn image_type(&self) -> Result<BiosImageType> {
>      fn is_last(&self) -> bool {
>          // For NBSI images (type == 0x70), return true as they're
>          // considered the last image
> -        if self.pcir.code_type == BiosImageType::Nbsi as u8 {
> +        if self.pcir.code_type == BiosImageType::Nbsi.into() {

I strongly prefer u8::from(BiosImageType::Nbsi) here so there is no loss of
readability of the type. Can we please use ::from()?

thanks,

 - Joel


>              return true;
>          }
>  
> 
> -- 
> 2.51.0
> 
