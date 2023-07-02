Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB84744C97
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 10:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC50A10E089;
	Sun,  2 Jul 2023 08:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE4110E089
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 08:01:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98A77601BE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 08:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0970BC433CC
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688284912;
 bh=AGKqBcZVtUqtvMJ8Dh1+gcTfNZM2gdiklSmLMXwux7I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xjk0DMbLF2rO0mvw36w3NspsZoHzJxg1ZXKVygmiDr7KmRnYY3yam0NxSCStS2ujI
 N4CH0bnMzAljQPJWG0cn54Jr72J/w0Oqfjm4GsMxuE3yLV7xRT4ZoGQCKZu+Z3bDyq
 CUwPm9o2UqDTXXZIqdE5cVDyE+bFqb++4EAuoC/07yKb4za7Ef/2n39TC4FXRMPKih
 6paXYKTbQkzc4do2iuNOu7HQkJ8yYFalmFhKCt5TXBphJw9xntLvTRLecDzg6IMNsC
 OBQGrRBlwbZasDO/DXj7OqYZQ85hX8YJ0HK+4TIE+coip4dpM05UTCE9OMIyyzGgK3
 zZZL6EAUCAhng==
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-c15a5ed884dso3705153276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 01:01:51 -0700 (PDT)
X-Gm-Message-State: ABy/qLYkGvWie5Kve64hl6NPA9y6dtE9ZVobwyW5SYHfwZtfsCxjJ7uv
 P/u93ThAMdmA2BuyoutBFwPpx5qHllzUmHRqIXE=
X-Google-Smtp-Source: APBJJlG4lzrHr5iy8DcyCDkqnYXfI6vr0OVREPdey5QbxLbrrL8xS3Y8SB3wQ09H+WYqmrGTTSOxoFpm+TOui/fO7vs=
X-Received: by 2002:a25:c504:0:b0:c01:dcdd:ed50 with SMTP id
 v4-20020a25c504000000b00c01dcdded50mr7607295ybe.14.1688284911003; Sun, 02 Jul
 2023 01:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230627144339.144478-1-Julia.Lawall@inria.fr>
 <20230627144339.144478-16-Julia.Lawall@inria.fr>
In-Reply-To: <20230627144339.144478-16-Julia.Lawall@inria.fr>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 2 Jul 2023 11:01:24 +0300
X-Gmail-Original-Message-ID: <CAFCwf13PXmSODKeNSPOyAH08QA-ovNzW5PEgFLMtg8AVAMD0GA@mail.gmail.com>
Message-ID: <CAFCwf13PXmSODKeNSPOyAH08QA-ovNzW5PEgFLMtg8AVAMD0GA@mail.gmail.com>
Subject: Re: [PATCH v2 15/24] habanalabs: use vmalloc_array and vcalloc
To: Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christophe.jaillet@wanadoo.fr, kuba@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 5:44=E2=80=AFPM Julia Lawall <Julia.Lawall@inria.fr=
> wrote:
>
> Use vmalloc_array and vcalloc to protect against
> multiplication overflows.
>
> The changes were done using the following Coccinelle
> semantic patch:
>
> // <smpl>
> @initialize:ocaml@
> @@
>
> let rename alloc =3D
>   match alloc with
>     "vmalloc" -> "vmalloc_array"
>   | "vzalloc" -> "vcalloc"
>   | _ -> failwith "unknown"
>
> @@
>     size_t e1,e2;
>     constant C1, C2;
>     expression E1, E2, COUNT, x1, x2, x3;
>     typedef u8;
>     typedef __u8;
>     type t =3D {u8,__u8,char,unsigned char};
>     identifier alloc =3D {vmalloc,vzalloc};
>     fresh identifier realloc =3D script:ocaml(alloc) { rename alloc };
> @@
>
> (
>       alloc(x1*x2*x3)
> |
>       alloc(C1 * C2)
> |
>       alloc((sizeof(t)) * (COUNT), ...)
> |
> -     alloc((e1) * (e2))
> +     realloc(e1, e2)
> |
> -     alloc((e1) * (COUNT))
> +     realloc(COUNT, e1)
> |
> -     alloc((E1) * (E2))
> +     realloc(E1, E2)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
> v2: Use vmalloc_array and vcalloc instead of array_size.
> This also leaves a multiplication of a constant by a sizeof
> as is.  Two patches are thus dropped from the series.
>
>  drivers/accel/habanalabs/common/device.c     |    3 ++-
>  drivers/accel/habanalabs/common/state_dump.c |    7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff -u -p a/drivers/accel/habanalabs/common/device.c b/drivers/accel/hab=
analabs/common/device.c
> --- a/drivers/accel/habanalabs/common/device.c
> +++ b/drivers/accel/habanalabs/common/device.c
> @@ -2594,7 +2594,8 @@ static void hl_capture_user_mappings(str
>          */
>         vfree(pgf_info->user_mappings);
>         pgf_info->user_mappings =3D
> -                       vzalloc(pgf_info->num_of_user_mappings * sizeof(s=
truct hl_user_mapping));
> +                       vcalloc(pgf_info->num_of_user_mappings,
> +                               sizeof(struct hl_user_mapping));
>         if (!pgf_info->user_mappings) {
>                 pgf_info->num_of_user_mappings =3D 0;
>                 goto finish;
> diff -u -p a/drivers/accel/habanalabs/common/state_dump.c b/drivers/accel=
/habanalabs/common/state_dump.c
> --- a/drivers/accel/habanalabs/common/state_dump.c
> +++ b/drivers/accel/habanalabs/common/state_dump.c
> @@ -272,7 +272,8 @@ static u32 *hl_state_dump_read_sync_obje
>         base_addr =3D sds->props[SP_SYNC_OBJ_BASE_ADDR] +
>                         sds->props[SP_NEXT_SYNC_OBJ_ADDR] * index;
>
> -       sync_objects =3D vmalloc(sds->props[SP_SYNC_OBJ_AMOUNT] * sizeof(=
u32));
> +       sync_objects =3D vmalloc_array(sds->props[SP_SYNC_OBJ_AMOUNT],
> +                                    sizeof(u32));
>         if (!sync_objects)
>                 return NULL;
>
> @@ -453,8 +454,8 @@ hl_state_dump_alloc_read_sm_block_monito
>         s64 base_addr; /* Base addr can be negative */
>         int i;
>
> -       monitors =3D vmalloc(sds->props[SP_MONITORS_AMOUNT] *
> -                          sizeof(struct hl_mon_state_dump));
> +       monitors =3D vmalloc_array(sds->props[SP_MONITORS_AMOUNT],
> +                                sizeof(struct hl_mon_state_dump));
>         if (!monitors)
>                 return NULL;
>
>

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
