Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CB4C2E092
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 21:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0151B10E485;
	Mon,  3 Nov 2025 20:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N47k4JJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE93F10E485;
 Mon,  3 Nov 2025 20:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jffyqra5lyRjpyvIiKSTLnE6LOCvsqWFt7MNk0A4KyMoVPxn6hiNUmt7K7MbSinbT7cw3DNc6RefJlqHL3lxg3OhquTgEXlYG6XyfyBSDmCRVyC3pKBMzz+qpdAQm/VOTurC6/FFlT6H1kBvOsHVCzv0fFnWF+P0GOb7tNtRi59cVyCg9AGBo6OPBNXN2h3+BcRRie7QHDs4wb1Uw+NXDAs8At9UpK2PgqWbO0Afp+FRviSU8BnNWSYTs5efbRLxe+/1viPjXWtk5Ul58/Psiot0DB1xbY4gL3vGnxmQ+0h/MYNLIQf/4yTjXXCr5tGywSJ43MGc5Tb1Dc8FaDP10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGGrH8OTlnR+fi4sdHexJKfzEL4GeVHbDJCizjQkStg=;
 b=vwTDr2kE3FbGgSiUeHOF1m2fqM/9G4GZh5irQeLKM6GpOVjkwm1ECq2ria+VwI3SnwCWq++yWapTrb73FZyoxtxyTnANpMQWhnsK4cswYQx1IoV1efYV/7Ug5h8XXBY6NAki6/mXDgv82tnzOcqEYH5eJSO1MbvzK5NourQHlE+V4JiTu2QLcC9X4JGmLgi6cidZPi8MVM+pfzIc7oYVlsT3J3fO8SQmriwPNo7zA1FCCevYZg3evq+k+m2e+772QME5DiLRgq5Hd2D5JRVIMgBXT4UyUEcBh3vQytZiyljPlBl+82VpEuyWS2EGfY9AyWobYEKB7K8aTAVB4Vvpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGGrH8OTlnR+fi4sdHexJKfzEL4GeVHbDJCizjQkStg=;
 b=N47k4JJBGp+WAeOASPThzNaiXhkzfhTWEhYtHNayevZcAD7CmaB0Puqb/EXnLiS4Cpkm52fMCxaXnrvzxrzpkiOE/8Brr1EcyxxI5JTP1g2T70Q86MYf4qeRh7ZBWqU1skGa8gRrMN5F3qkfumEe8u2GrsI9PWQaVtlZ5UWYyVXeSlOMf9akNVsqeyfKHF95r5aINg2Lvem6CktzXsWIV/crfalkKxLQxAfl43oclnuiZEWGC13qvnDnxN0LR71xbRhFL8L5TYrzyeMxngO50ViNDRzKJOx+jFxmBnGyf1IpskQxMZezC6U7jOBQ+L6OVnMTPX8Y4Yi6YXuhr8aUvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 20:31:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 20:31:39 +0000
Date: Mon, 3 Nov 2025 15:31:38 -0500
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
Subject: Re: [PATCH v3 2/6] gpu: nova-core: vbios: do not use `as` when
 comparing BiosImageType
Message-ID: <20251103203138.GA2098593@joelbox2>
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
 <20251029-nova-as-v3-2-6a30c7333ad9@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-nova-as-v3-2-6a30c7333ad9@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0752.namprd03.prod.outlook.com
 (2603:10b6:408:13a::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe0a89b-595b-4094-4265-08de1b17fe15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FZXIlwsBCHF58C0hHGxk9ZLCazH4ZYxsgqXREdNGakebVGuXIm9d5G1qLSJT?=
 =?us-ascii?Q?EAE0HA6826+Q8Sd3yIfwOH9Rc+PUnb3ph8tt/2op6IgmbzvEQQcU2mbQPf1m?=
 =?us-ascii?Q?YDGwvdEBIv9iHildTRAB8ELLLAokQIoRBiIXzT2/HOshwbEn6Jw9RD8g09CL?=
 =?us-ascii?Q?e2FnkXq1gOk6m7z/RSutbyeTSrMCWrkWEd4v4G4oKaFgRSzyj5xKWGMZ/PQ7?=
 =?us-ascii?Q?5UIJu2SZ3JtD0fh4nuwRbmW/PNyjVmjXd526Z+BTAQF1hGuXV4Ycl6GMy/mf?=
 =?us-ascii?Q?3J3577QKcNBh55AybDL1v5hqo1A4w5+i1y1WfnDboqWfaXfgxP24CllA5sah?=
 =?us-ascii?Q?6LxGdQmzt5ucU0PjT/5DBr4n6LueWwXnG23asO9q9t+u31IeDw7kHV4kuulf?=
 =?us-ascii?Q?1LuJpNVudYw1i9J1jZEuwfLLVA/oMMthyKsbG8xjd+28s/Wu/NdeaAoZ9aqE?=
 =?us-ascii?Q?Pier5DJilB1F9+z4vFZhNAt3EsgaNqCsXP0O2mUDh5hExpY6ohuMLA4hxGK6?=
 =?us-ascii?Q?rgt5iYH809P2NNFANTD86qkwrn+JI3s+Y7Fr+C56cIrnDF3qCtzrBDCMaRPc?=
 =?us-ascii?Q?5zPlXeKKh3+31ZYj0TCeaArOyn5s+iTeAXgwprVkJLLvneIAsNUOVnH2Ppg5?=
 =?us-ascii?Q?Rfd3x72rWHFBFKcepsEcQUnB9OWKoMFVF/qmVXUpaps2wODE6EaEtNhABmRW?=
 =?us-ascii?Q?guogv6RTcE2x/A+B3iuAo8z/i53DCMAL8oXkEW9uWrPtay1xnSxgs3TQF2pA?=
 =?us-ascii?Q?NzQQp3y/qVDC1iXj7q7QbLsfSVhhYbasS7XFoMwgf8hgAvlmGaXz0wDTpl1b?=
 =?us-ascii?Q?/ImwBD3WfRjTB9zC1unwXAeiLWKk5opnvjp5sUyFh3cETsbehld8NE1Kpjj7?=
 =?us-ascii?Q?imWytUQrlSTu2wIEw2znAar7RK5Nm2z8zOYwJKFeOvrG/O1CKkdqyW+YwBBN?=
 =?us-ascii?Q?RXkfptyxKX97i2dQzezvw0ag2RHkmxkxEhvwHi3PZhgsnhA86JXbCMiiOyTX?=
 =?us-ascii?Q?N2ALg717IVwzR4CGxTzvhhDTEX2mO2ub+mJNDea6qZl9ZfOWzs/5TNd8mypn?=
 =?us-ascii?Q?q/Ep41GQjZDtC7Sg6uS/aY+TKtJjJ2Jjhb+HsSRLxp0RkpOpGfIagVBRldMy?=
 =?us-ascii?Q?ppsu0uIr/ejO5InSpBm5fAYWuj2Zr0NAUDoT9Kr/2x92ptOcHAymAfsUv46n?=
 =?us-ascii?Q?BF7iuTX+4pjWcN4h1qHVOmcmUZV/yLwrwOV8Pz94RsAACwdDZ9luUmCHj4nm?=
 =?us-ascii?Q?a1WtsNi/0Fzbkr88e432hWBv2lE38XRE1WXxTCZ0EdaBgh3bUZiCJMdaxnlh?=
 =?us-ascii?Q?Iqrg5DFf7E3FKSlGaaey2JC3yPsS09FWCT5HUUL7eDpMWCn/woXfEWVYRLpk?=
 =?us-ascii?Q?5hxPqSejowLvk+C3rWf9N8iGo+qTKpNzM9Ce2YJ3LQ+YD+i8IYtCBuxdw3SS?=
 =?us-ascii?Q?/lidIYkyuzTvhG7z35VjTYcHEgHqQqH+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SUj6eR6YsmFitAJ3pf0K167SEYaDn1RTaifvDQzvwdKqt80lrCnkq3oNyc0i?=
 =?us-ascii?Q?CgZIp0xKxqZKdVhPpMx+y72JMf9e2q9ix8aaYKPOpO1ZtlxupuL3D7VDCSEK?=
 =?us-ascii?Q?hjaSCdYnYnKgisHOq7SlYiYPiVdkatPNplX1sqKsE6ufknlxG1Ndh+l7YHNE?=
 =?us-ascii?Q?WjNgbJE0qvn6XGV51MGbxJkdvrhzIXW2nyHGYhPkU8aUFJuiQtR9t+JXRabD?=
 =?us-ascii?Q?W4YkFJqGoUmBpuJPh73gK9QlwFFyv075F7VKqdWJjac4k6YAmFybjUuHtNCM?=
 =?us-ascii?Q?J1fFE16v6HaK4oUJ2UN1c+ep9bSq1PEkmIst0s5i6pAz6tSP0AJiUeFORmgz?=
 =?us-ascii?Q?Ll8YZoEs/WS8l8MjBlSEwFRcAG9aOMlr4X0j4jVRFKKCvL4tYb7PZqydaJ8l?=
 =?us-ascii?Q?sn04OutlSIU5dDctVjt0b3UNIDUQJ4rzCFxN1WbkKA/J3hc8rMZuv4I7/D3A?=
 =?us-ascii?Q?iTCx8r58Z3e8fC9c/FpC92B2sqnXzXa+ed+2iYZp38obHKF7tmFA1/di9AI/?=
 =?us-ascii?Q?+MtziuBjd6ooEvDWMkCRtBB02tjmsdpFz6hwy7QVDaMuSGP0qUEuirlOPjno?=
 =?us-ascii?Q?qNbRX12aqvj8jiMa0xq8omAwPzZsmmCkPYSztdiqJUhZpeeF2KpW/RUE4kIy?=
 =?us-ascii?Q?B/XMXh3wJPc2+Q/JT1iC6jnfQODhfWZf7Aq9CB3OGAh9yT34rZvWQTVVPggb?=
 =?us-ascii?Q?06S0DXM9Y1HMH03+KhSRz/a8BHbrg46JJw4GTrdr2Qfv8NCWxFqSG+KA+QQL?=
 =?us-ascii?Q?K8gnNZXto57biM/C5jCuiTTGDArH3ELHYZXwXoE24BwW7dZVrYtKsF9x/acD?=
 =?us-ascii?Q?Y+10+o4+J1L6EPr2rjpaVDMtRrZFR/dVUx/Xl0peXGeC5nmAMr1xmEdn+v+q?=
 =?us-ascii?Q?Y4JpulyjA18HtP8LWdj5K4+8FdK7Mi+5TwflafalZlaJYLD4hMQj6+agMUQM?=
 =?us-ascii?Q?XxMAQdH5NL+zgJgIkvWW1txnu7LOSNFG2YDpOJJjnQRIukfQLhRTRToTtQD9?=
 =?us-ascii?Q?oDhWscHCgwz6jF8LqDyVew+gSxGII03+d1buZdjKS1dpUctxLP7y81OZHym0?=
 =?us-ascii?Q?3MEZ6rtGjEmGMiSuDMdw5VCLSBM+0lysgBmqX/E0us0odMxTv8wVEdnVs3X6?=
 =?us-ascii?Q?PmMTWJNLIbiW5EuQAGKXapN526KcNTgwHGqvU03iUuE622dKqsmECtCVgBEG?=
 =?us-ascii?Q?xJhZWFalRWtZm0AmU79OTdvEiYn8fiQYcrhfng3GZ3CGTzUPFxnhQyFIXQK9?=
 =?us-ascii?Q?lfndjS3VtKBy+P8raB2X3nGN4rNfVN3CVNYb9kv0i28GwLzWa4qX8UBVxAzT?=
 =?us-ascii?Q?Lv1AmKlg3H83x+fhQIFIMGeME0qIiowXIFqizHp76cyCIxXX+tjMLqyQE81Y?=
 =?us-ascii?Q?2KVtUjp8H1OlTDEfV9YOsxVdIkvYy3Ig4sj1z34K43LFZN2+tNoUAnZ21h1m?=
 =?us-ascii?Q?/Wr+szfPbkBLVQFPa7/GnVcy2EY94K1R6CwWyJQFJ7+mDrYtLuOMuhTwcvw8?=
 =?us-ascii?Q?Gtv8gKCWmMaYY3QhcuiQofEzb9a+4zGyUp4AzxZhJgt9CfYzJ1ImkofTr/TV?=
 =?us-ascii?Q?dCIPxTbjdWD5k8OQ1qkXrfKPJJOVBeUZicywXj9M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe0a89b-595b-4094-4265-08de1b17fe15
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 20:31:39.5933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPfd+hdCXvpIoymD2LCWk3qqMmGLBEKBCRppGVJtXGPsrLUeyRnAGlPBab6h6Ii7huNe6nzrU5gVVB4vYrukaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950
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

On Wed, Oct 29, 2025 at 08:12:10AM +0900, Alexandre Courbot wrote:
> Use the `image_type` method and compare its result to avoid using `as`.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index 74ed6d61e6cc..7c1bf10b2eac 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -709,9 +709,8 @@ fn image_type(&self) -> Result<BiosImageType> {
>  
>      /// Check if this is the last image.
>      fn is_last(&self) -> bool {
> -        // For NBSI images (type == 0x70), return true as they're
> -        // considered the last image
> -        if self.pcir.code_type == BiosImageType::Nbsi as u8 {
> +        // For NBSI images, return true as they're considered the last image
> +        if self.image_type() == Ok(BiosImageType::Nbsi) {

nit: Could you add period at the end of the comment sentence as Miguel
suggested in the other thread (which I admit the initial code also didn't
have)?

With that change,

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

 - Joel


>              return true;
>          }
>  
> 
> -- 
> 2.51.0
> 
