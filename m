Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D8B04221
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 16:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF5210E032;
	Mon, 14 Jul 2025 14:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CqYLcRHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BCF10E032;
 Mon, 14 Jul 2025 14:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2uu0iE6P0gjgz71jJoblfF73F02xFuUiUbkd5aiqldfnrNhRVgBGQN7LHWISjnhlwdKbmr02SuTy4LaoV1+au1ljSZDIaFTa7yBsQXMK4U/sswBM6I1exYOEpHpmsjZJnnWkN6impTfOudQz2fWgotSRFGaqFvi/eENmS3RGcYxwziNG4mkcFG9YtKxe/VloUap86Ov6LwR4Nd7kSnxP1gfBIKZsbZBtM5mlx0hWNyDfD+GHbD/yeLUz2ZzVNYYf5OwUX73e30PXREpNbfnE028LD3TgHgjrfHlD5Ha1Zz+3EL/eVf+wyQFm3aJrSDWHcGlkwYWJc6qfm3bWRR87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+JUplmFphDlTBpqxGzRPCAHXx/cIvC15u1tCmfxAW8=;
 b=Uo2O/J43rCqZ7TlBmCRliv/FLEo842QAtMhFn+0y4gs3DatnpRWMV8YAtKXGxV6hczYrQdfq64U6AyfLcLKt5E5lV7zOpuU2pF0QASy5d5ehOAagZCftak1o036j2Ty6zJUxJln2gSLh3KO3Qh9kbvxm2bb/ZbeV8pIUk6GsMAMw5ibNSX7F4m7Frn19J2rT5HDWo1USa4sPSIAOrNHI5/VBaVONkzv4Se2+HBc6Mias3qCM5dUA/4W5a1LlqYJ/U56IAn7Aa3CESXni4BbbvmhkKjBz1UgD3pkMmm7t0a+rBNxHxBETUoFoL/FyzayNGxVZ6ko48GoetkpWUa45ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+JUplmFphDlTBpqxGzRPCAHXx/cIvC15u1tCmfxAW8=;
 b=CqYLcRHFHvR0cDqNP9MvHrLr7Yq3ZBRSKYGVyj2UJHbrq9Rl5zhmNm0+TdXripS2t9eInXHsejFD1KrgUhf0iG30+0ECIg8r7vqpXIQYg+tB8QEJK4G4smVMW9SXpdfCRF4lijoJpYPGE5eZ2M2p0FPhMHEihndHrCta/dp2QeVXGKpKxIFh6o0cMeyKu6+F/sEWlQ871vqXzpKWK7aHo55fY34V528xLCKkdiavlLELlFLBvpcwzki/fojIyph+S/QyP5PlBvZdH+F2VtjMRgR04d2GI5bsmykwOBcezT+hZOI7HU4BB8rCRtNQdiHP2fwQEthfmOO3vGeAqmUBdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7171.namprd12.prod.outlook.com (2603:10b6:930:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 14:48:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Mon, 14 Jul 2025
 14:48:39 +0000
Date: Mon, 14 Jul 2025 10:48:37 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Rhys Lloyd <krakow20@gmail.com>
Cc: acourbot@nvidia.com, dakr@kernel.org, rust-for-linux@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpu: nova-core: vbios: change PmuLookupTableEntry to
 relax alignment
Message-ID: <20250714144837.GA2996266@joelnvbox>
References: <20250714110229.141221-1-krakow20@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714110229.141221-1-krakow20@gmail.com>
X-ClientProxiedBy: MN2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 999cee87-0e9e-46c8-e2e4-08ddc2e58538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yIWcutlKhwTsc9W4Zdx8SzWK6pGlQ8xSVU3RJzbmcMpjMTxKawkHDYuNctgw?=
 =?us-ascii?Q?xs94XqP4KeQyrpii7GId2MOHsDLm3n2wTAwst5U9GAtShb9GQCPOxmAO/wLj?=
 =?us-ascii?Q?3S5SsiumUdQnpMqAe1gk36QY4AB6YBehUjv0UCy4WEF1oAcUdvuRrhV7Dzs+?=
 =?us-ascii?Q?LN6Xgr9NsuBaH2YWqb+B1L+EJiHbq62WOtj3gxjCKQ5UKoEaQSidxbzuykNZ?=
 =?us-ascii?Q?U+p9Lz3s54ZBG2+XKYiu9vbeO8gI/oeuwafsbiVIBP02qvCSwByZbtDsF7Mi?=
 =?us-ascii?Q?ike5Pz/O8lFf2ncRSCkp1JxwEJOMixYbRovMj6Huc4IjTFNy7y2k/nBY0rD3?=
 =?us-ascii?Q?xtm5PTRtegVXV5egMsvRyUpziWjJKaIA3LgYq9QldbSISUBBYPEBAI1HAEH+?=
 =?us-ascii?Q?c3GEKFQLLt4gcjQVoxXPXlPocUT8l7ofwza704x/w+HOfB06vV7lDeqV6OkM?=
 =?us-ascii?Q?O0onQlU2I35QNLGshf+44h6LZN27KPbLmm/pZzytz+4Y17HuabIWgjgVnR8j?=
 =?us-ascii?Q?B0EU63eXKCSoCsYatHY5DoFSLxUYW/eQKsCTkZ4/2ZK7syQlITsxKG81pJy8?=
 =?us-ascii?Q?Y1LUqZnyltnkrPxLaPi2j4WhkL6gwH4tz0Sdn8jHndOwwChT7wTKDKAaLRQh?=
 =?us-ascii?Q?JHeYEmz1w5OG9toSS3bQnp6wAFthYL+Pu423fWI5BL+FU5vmfUVe4WanM1Hc?=
 =?us-ascii?Q?SOI04GKYIZsb6GH9gzHnZHx7KmyWYuxbL5FZ17gb63nYz8MZs3SlNgltIMvk?=
 =?us-ascii?Q?KhfkndAuzt2bNlr1ThpgzXNuqdhue4ppSZ8hXQY8mf9DUku9fdE6YuVR0tu2?=
 =?us-ascii?Q?XWtDl6/b2tbKUB8blLnhAE2x3/R0UJBWkpTmwnwZ/UWMjVxpQKku5oZ9zooA?=
 =?us-ascii?Q?ssIhwOu57O7eT1EHMdnVSbafB5v7TO/jUdNvwFEPBpA96aVd9wQ725496B9H?=
 =?us-ascii?Q?g9G/HJjreJRNl16lQdEX9byV0h70y4wRMS+1+Y6JtMcfDDYY8LRtZ/hay+G7?=
 =?us-ascii?Q?IEL2nwWeczRlF6LHfhhnIzEj3X/plAw/hNx+krvQVz3UkqThgN62GdU/b/+s?=
 =?us-ascii?Q?GSzmPoSXnB8mmeuERZeFRyxlxavaR6QikEwzVVpWWvQwObDXXj+WfeJkN8s8?=
 =?us-ascii?Q?oNehjlc6mzAKTia10gtVXtjUbGkCNJ//9icpOL5a7NB7OGlXx5ZKn3MN/xGv?=
 =?us-ascii?Q?i82GBNpZU31+pBVzaSFU9ZOaU5+JS0tRSVzQkuvIxpDXtt9lpqW9/FatEJJh?=
 =?us-ascii?Q?FeWP4v9UXFhLs1nAQtqqCnWwploV9xkdsy4wA5OjKKgqUkm2jiwMDWZkp1mL?=
 =?us-ascii?Q?wUA1udjvB+CMgVMyyKmLSUCre2gwo8mU4lHpgoW+b82JDE4PSsinXdjoS+4a?=
 =?us-ascii?Q?uHKgh/cva1neVh3hXUvS8SbzG4WRrVcrjVOwo8Immw5e5OSYI+oMk159ULxw?=
 =?us-ascii?Q?HO4zy7oZUAA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?94VOolwSbe9nSx0jtc83fKwq7u5PseCo1UbYPjwCTnvGyhiowG5Vd0HMhI8j?=
 =?us-ascii?Q?UggJUywzr7DSKs1cXNVAXaKQ0d6tuZDVGIx/iYXZe2Gc85gk6mEyve6RyPbG?=
 =?us-ascii?Q?/3q+kzEtL5tKwKlGTJgvO4mUoKVLJlViB4FF0UkNReFmiWb+OmVOA+vSgJ82?=
 =?us-ascii?Q?Ho2mDFCCqNGaU9yd78kg/nvV2c/CW0AC//tsxzBOk57vOja6LMRiJgoNTUxG?=
 =?us-ascii?Q?p496iJjUKNH3o9yTrKfU8OCfyIQpz82Dvl7IKOfbbLfjtcN/0iPnqs/QAcW5?=
 =?us-ascii?Q?CuE8J6gBVQpCmplmM892vMxXtK9p8d+WdWG+Jw7XQWtQixNMm19at01cyRHQ?=
 =?us-ascii?Q?ARi8SgBe3tckn3kEd9hNVpXM5XUIfkwsrADEkItQVdvEDE+7r5VhgBoIBgQa?=
 =?us-ascii?Q?WxOwj2ESrxoFJYjP95EPR5Mi9VARL5pyVKwERrf9Lux/DJQasxNWP2yJ4y1e?=
 =?us-ascii?Q?F4uL3TRqi3T+eyqj8oXpq90XXFSmRErQFr4UAq4iQtVhzdbllMso89fDqg/N?=
 =?us-ascii?Q?ulAM+nIhpMi0eVsRycz5sflLqpWDExxEGw+P5WAb8B8YUBsujOGzb+hk4IE2?=
 =?us-ascii?Q?TSRt9ThxvZLtc9yvYupCgYab0eliXc1YwT+1xZIkPlzA9llzlZCnuiYD5r8P?=
 =?us-ascii?Q?EfBPwSmjfhZ7Eig0LuvkeQEfIzxTM70F9BOIcxMN5rGBa/0Q7Btzed0hh6VJ?=
 =?us-ascii?Q?oargTf67V46lIHZUwhAcsxI8UbGhgHpNXqVwzrGpWPz7VY/VmCFOmAXZG5vL?=
 =?us-ascii?Q?TZFHmn5uqbcQOeydQalAYM1fEtHQI11tBRi3s1Q3DqCyvXBtH9bvsav8YRiZ?=
 =?us-ascii?Q?zy2JilQ8aDcx+AbcDZDQpvLxqHz89ympep9jpMt5mLiI07eS3xVn1M8U8oil?=
 =?us-ascii?Q?3n3zXn6jFSpQEd4POpg9we/cILwJtBZnI10Ef3xLwABHsW0nxK80IVDMeOUd?=
 =?us-ascii?Q?3U9D9Jt4yc6Y2yhhjm4Qb7W2NrNXuwHrNLE0V8McvmnUBRSSE0X7iJy2H5+t?=
 =?us-ascii?Q?m6F/jqLPetU91sgyU7ULlHujrbvRbIX//Q7RV8HZipV70+7izkLIe4V6wSsV?=
 =?us-ascii?Q?/jgBwh4VxliscaAUqruZeJaIJq4Ej1uGYe188z1cBC32jyzpBfb6iviSAnyj?=
 =?us-ascii?Q?cGJ+bSpL502m3ZPoJuElvhi4PgBc5bP06DcuvQX0cVFDAIdIkuVOgSgyYtgr?=
 =?us-ascii?Q?QlyN6BHoF926dpmmsO2Es9y8Q6qjF3ieSJ6XrRBfKOFjv7tT7k/HJNoqwDnN?=
 =?us-ascii?Q?mWsG3I63NsbfXif/QTHUrlU6k+vHHdwWPONg7jedzUpy0Ba+U/fdNN9axl6i?=
 =?us-ascii?Q?H0ZwA/cGzjjT6Hiqf1fZrNz5ZCwky/jlSJQJ4Ix6utw2Q5LcSk/abkgnM0tc?=
 =?us-ascii?Q?84zUmgzS7FkoOoFKyNANFkSGIf60WdHxJ7IuIncDQfkwOaGbph84P3YBVTLZ?=
 =?us-ascii?Q?Gy0Oukm2RzKCoKzMeryTi35WTA7+Mi+0AhFm4fjBEe8RwUSE8JwRw9yf9PVT?=
 =?us-ascii?Q?Gwj624QW2riwWesrAG8fOZdfUEXhUWtmEgRl3ZuMRuuUV/9IelofMO4VBOTa?=
 =?us-ascii?Q?X70JWNtKMSNwiiY7if13WBhuvIDgsU+m3aDLaFs2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999cee87-0e9e-46c8-e2e4-08ddc2e58538
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 14:48:39.6192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWYXR8CazjgxMoC7NrMIm7KyjEEYfa39yOK6WxVsULBcT/k+tFuibq3O4QnJJrxqlaHE4XwImYidKH5tYYy8tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7171
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

Hello, Rhys,

On Mon, Jul 14, 2025 at 04:02:23AM -0700, Rhys Lloyd wrote:
> Instead of the data field containing a u32 and changing the alignment,
> change data to [u8; 4] and convert to u32 with a helper function.
> Removes another magic number by making the struct the same size as
> the data it needs to read, allowing the use of
> `size_of::<PmuLookupTableEntry>()`
> 
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> ---
> Changes in v2:
> - get_data helper function renamed to data
> 
> ---
>  drivers/gpu/nova-core/vbios.rs | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index 5b5d9f38cbb3..339c66e63c7e 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -896,21 +896,26 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
>  struct PmuLookupTableEntry {
>      application_id: u8,
>      target_id: u8,
> -    data: u32,
> +    data: [u8; 4],

Instead of this, could we make the struct as #repr[(C, packed)] or does that
not work for some reason?

>  }
>  
>  impl PmuLookupTableEntry {
>      fn new(data: &[u8]) -> Result<Self> {
> -        if data.len() < 6 {
> +        if data.len() < core::mem::size_of::<Self>() {

This part looks good, and thanks for the fix. Alex beat me to the review but
for the actual fix [1], FWIW:
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

[1] https://lore.kernel.org/all/DBBG2S0ZQAMI.2KK26Z7U58DI8@nvidia.com/#t

thanks,

 - Joel

>              return Err(EINVAL);
>          }
>  
>          Ok(PmuLookupTableEntry {
>              application_id: data[0],
>              target_id: data[1],
> -            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
> +            data: [data[2], data[3], data[4], data[5]],
>          })
>      }
> +
> +    /// Construct a u32 from `self.data`.
> +    fn data(&self) -> u32 {
> +        u32::from_le_bytes(self.data)
> +    }
>  }
>  
>  /// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLookupTableEntry`] for a given
> @@ -1037,7 +1042,7 @@ fn setup_falcon_data(
>              .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
>          {
>              Ok(entry) => {
> -                let mut ucode_offset = entry.data as usize;
> +                let mut ucode_offset = entry.data() as usize;
>                  ucode_offset -= pci_at_image.base.data.len();
>                  if ucode_offset < first_fwsec.base.data.len() {
>                      dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");
> 
> base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
> prerequisite-patch-id: d80f92d314a0693d4c89ffb7810d9ab6990336fa
> -- 
> 2.50.1
> 
