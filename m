Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD0AB03D59
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 13:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5F310E46B;
	Mon, 14 Jul 2025 11:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HuW58WgX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAA310E46A;
 Mon, 14 Jul 2025 11:28:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 06E78A5700D;
 Mon, 14 Jul 2025 11:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F58C4CEED;
 Mon, 14 Jul 2025 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752492500;
 bh=sZqTm7pgCVsziSTCEnOE9O8yssbVDX/uReiosYE1Osw=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=HuW58WgXG2BbO8yPE9bYbXlpN6MZJs20fuVRO0SaqTY1sNDGwNzaHzLkFfGd+KLfx
 rtaavlFYjZAAWQ+gHOWz17SiTK3NetlUcYZlcoswyddEspEhua2iYvuTFlHd7dnTTR
 J8ZKE3j6n2BOMj3QQr3nZwkNFZm7ZG6TNVcGV60vUopUaGS3IMu0pEdamJJOvcDQF2
 PuNQWr6wyu5kE5Xzr97AaVlHMJp727dkS6nU5GwMSyKE9yIWvJ+6hq3a99jbQN3Z49
 IUabrU77rVU6uCfjkGbNNUmV4hVEg+Y6dbz6Ckj/B3o8rwFII2vYNwfy6CIxLz135A
 8olHBUGzGR7RQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 13:28:17 +0200
Message-Id: <DBBQQQVVCTAC.I1OXFG4SVLRO@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: vbios: change PmuLookupTableEntry to
 relax alignment
Cc: <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Rhys Lloyd" <krakow20@gmail.com>
References: <20250714110229.141221-1-krakow20@gmail.com>
In-Reply-To: <20250714110229.141221-1-krakow20@gmail.com>
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

(Cc: Joel)

On Mon Jul 14, 2025 at 1:02 PM CEST, Rhys Lloyd wrote:
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
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index 5b5d9f38cbb3..339c66e63c7e 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -896,21 +896,26 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
>  struct PmuLookupTableEntry {
>      application_id: u8,
>      target_id: u8,
> -    data: u32,
> +    data: [u8; 4],
>  }
> =20
>  impl PmuLookupTableEntry {
>      fn new(data: &[u8]) -> Result<Self> {
> -        if data.len() < 6 {
> +        if data.len() < core::mem::size_of::<Self>() {
>              return Err(EINVAL);
>          }
> =20
>          Ok(PmuLookupTableEntry {
>              application_id: data[0],
>              target_id: data[1],
> -            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| E=
INVAL)?),
> +            data: [data[2], data[3], data[4], data[5]],
>          })
>      }
> +
> +    /// Construct a u32 from `self.data`.
> +    fn data(&self) -> u32 {
> +        u32::from_le_bytes(self.data)
> +    }
>  }
> =20
>  /// The [`PmuLookupTableEntry`] structure is used to find the [`PmuLooku=
pTableEntry`] for a given
> @@ -1037,7 +1042,7 @@ fn setup_falcon_data(
>              .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
>          {
>              Ok(entry) =3D> {
> -                let mut ucode_offset =3D entry.data as usize;
> +                let mut ucode_offset =3D entry.data() as usize;
>                  ucode_offset -=3D pci_at_image.base.data.len();
>                  if ucode_offset < first_fwsec.base.data.len() {
>                      dev_err!(pdev.as_ref(), "Falcon Ucode offset not in =
second Fwsec.\n");
>
> base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
> prerequisite-patch-id: d80f92d314a0693d4c89ffb7810d9ab6990336fa

