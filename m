Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC36BE5FE7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 02:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8A510EAD3;
	Fri, 17 Oct 2025 00:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CWh1Y+MP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013002.outbound.protection.outlook.com
 [40.93.196.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41B110EAD2;
 Fri, 17 Oct 2025 00:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNXPrqWth/r6lM93O213VhkkA0r3WPgcNEdjxaC+X8CGhWAonx7jOC1nE+ip3PmJapzROW7ClFvna816zeHRPgQjOUP7T+J9BVXNfDBSDWJfH4FUDX6e8hohvqiH1FhHdFd1aQ2qxgeFiWk1CHeQ5f1rh1pZD/kC8eZLhfAaJsp2uRuZxtqZevJYXdzI3xT//kLw8XTSjSo8qTbodUx/kkQEau96ywEzM18MzMtIhvDU8at9onAJfzChYzbcwsix4bYrpiUCwN87hPA6d0lTAnK9DjM9CjBJcsl3/FyWovvsSuH3972JbW8EoVVzxczP1NbNmNMFzHpVFMkucwRYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIiTlkfHyB2AC4Wl0OXO8Xu6N5AnFLgAhE/Yiq8IgRg=;
 b=OsMRgCVV0lE6oCHo82pvjUOD4vIzd48VK2K6r+kqoU7bzKEuj+CvRmAB8MWYP7pDUxOteum/eBLzd29Cgmf2TtLMXufhB9aocgaAH4um5dXtG1XoOijQCaZKkwbHGX6hQmuvDako7iLLhRTjtvNREnO4y1/+PKjwW7GB/Af6egMUEQYHzGP53odOg2+gzm4+7u1unImoM8CkjqMWsYJgVy7VzCXyLIRup9gPmcYHv5iRPd5TQ1IPWUgNU0EUnmUmb2MyWLPJVXJtEde55m5yH/AsvxMOrZV/DyRM3REce9cQ9gw7ZC2lH3h05/W0Yze8omwujNDGs66Mt+aZiL2Vjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIiTlkfHyB2AC4Wl0OXO8Xu6N5AnFLgAhE/Yiq8IgRg=;
 b=CWh1Y+MPtYnQyZbid/B0kK+pGovLXgTh7lHyI895UKoEMocUruSHNnr+CoWB4SZUgOMzMdTPlMatmfAFEV035uZ1nPOmsQ2GRewci326clCGahXAN6l+anlY0GK0H6FnjB+T4ZppaYZpbCjOayQee9UPUbbZ6T1NTLtXDQirdhqpLlp4DRGND88WuRcVIByo3UllmkW5oj6NNhqL1MlGM6LXenldaREkBiPfNj2CQF/0dLuN/mK7qsE/nCeADI991nAKtMDVOmeg1Wp4Qd0MFAvpKNz1AHtAjKGGNCVGzUf2TA506PxF3/ZMPibxxj1sDkB+3Q+Kj+5P+lY0gw/zlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB7984.namprd12.prod.outlook.com (2603:10b6:510:26f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.11; Fri, 17 Oct 2025 00:56:57 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 00:56:57 +0000
Date: Fri, 17 Oct 2025 11:56:52 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v5 09/14] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
Message-ID: <5jw63qwbeb2g7ngxpapn3prgv4dbceb7uhmw6ddntljznkxiks@ppnp6gknek2z>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-10-apopple@nvidia.com>
 <DDJJ5GJI5HJ8.2388S19QXO8G0@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDJJ5GJI5HJ8.2388S19QXO8G0@nvidia.com>
X-ClientProxiedBy: SYCP282CA0020.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::32) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf6efe8-d053-4c35-60b7-08de0d181254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oGcoOz9I4mxAaLhVG1GqykZ+hEtNJvAcT3DGgRR1yEwrm9fhdME17E3ZMf7b?=
 =?us-ascii?Q?CMRnnj+7UpeKap2OBQupq1AQxc2ycML0HmpiIpFtrsxB1t7KVP+LlTGAnYZ1?=
 =?us-ascii?Q?ZdNIT+gYuQrv6oyXiRYoqDHGf4bfx0WY52+jNeWWEXuWiatFmhY4+NT7qrzc?=
 =?us-ascii?Q?B3ytkHPPGtoFGLsBTI9REVmu4GhvwoaKLXj1mMZlmNHEIubujrWrwwI6Et6M?=
 =?us-ascii?Q?k4cfl6zAjoITil5+Q7uktjEKopDFhdDsWr2Io1pnP6rS2OhQFYOrlxIW97UH?=
 =?us-ascii?Q?RVBEjpaFzTP8x1ny5WFqOKcFIEb5p9e9QCCi0dZYmj2wYL5hL2rQLHPRQoVc?=
 =?us-ascii?Q?J7ilp9MByfdxd0N6rEYdpEGChcP8WRu7++llSjtcLEhBbAClfk4XB+n4Td8S?=
 =?us-ascii?Q?owjlghqvWDHJs0DRWkT9Ky2f+iBTNpu9fl6+nPnyiZxUWDYzjGWAzkUF+epn?=
 =?us-ascii?Q?+iWoE/w4jPU1Q3b3WJnauaU7DGg0WdjmgvKJVFk55bPYBK01LQc/EC5UUaEv?=
 =?us-ascii?Q?W5nwguyI6DvB60VQI/ONcRn3foB+HzeP9j6GArN/i0xngmFBaxKLZth8rt1w?=
 =?us-ascii?Q?59bl8nuP31zjU2vLOvyRUdN8GrEIGLJiy8DRLCMpTMfym0hDGamNjb4y/764?=
 =?us-ascii?Q?Lc7fJImfVqTSlFklDLLYbLnncMVQA5WPuSw+1Cwdz51L9OL0/rP4B4CJxTi2?=
 =?us-ascii?Q?XKHdqRlLnBB8UJyTIUxvYXc2y3LDdUOJV+VAt0MT5wPhuBI9yaqJ3cEZ0vb5?=
 =?us-ascii?Q?K4jSYfq53c/lFhpTY347zK6DyCWkMH638/gJVLpq/tIjfipAlUtDkqMoYRG1?=
 =?us-ascii?Q?cS08uNhbfplSu5ToIjAVL9EB0GHVq6Rc4ObuXFgcfoA3YpGqyszJyf7ihTM/?=
 =?us-ascii?Q?dFoNqQ4p6881MPWnstwIPv0ioP14qGeGmWd2e4mfm9r6WBoeOyeWw/l0fGhr?=
 =?us-ascii?Q?XVSK9kefpM232x5x8K93e842mL/p5I5LoF3XUSbHWeo+jBYQ5x6VygQO4CKQ?=
 =?us-ascii?Q?ZkGDWyiNXKSA79tr0L8YNh2hqW/VpoBfvOj63p80WH0dC7VoWJHmYuxG+dxz?=
 =?us-ascii?Q?Rl3jv4PY/OIW3kmPh2lTDgoUyH7Kf/rkhjUzhuqtt+/k3OBTevkYb/8si1Hr?=
 =?us-ascii?Q?0WnivANpMC8/NFJ4TLJOfCK8aaOTENLe2URZ131hUow0Uq+8hLdPr2LjrbzK?=
 =?us-ascii?Q?4KDe9w5zD6szakw222sKWdUA2mnOD+wTxgmx2e4EnVgw+0km4OTF/zJB45n7?=
 =?us-ascii?Q?utgRsYlrzV9vzlav866M26CZCr45ZBHfAIgq5rSW1cKjB5YOF1D9LDYPvGLZ?=
 =?us-ascii?Q?6RLu6goPi/C8xkz90kvi3AACAPL5qyQtDpsP1jUtB/vTY4FTrTgL49fXMSwo?=
 =?us-ascii?Q?NY5pNJHGUOsf9S8eWkBgYjkegeH0+ZP92ie/N3I49maOIrCENdGtKHnMJYN1?=
 =?us-ascii?Q?IEYuKwbsTJYAjbMQxjlLFjGUdShbJ0Nu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7skczcV8+BCSOD+Fsxymx9FMc1eMviEI30yctJl8aKrDKb/QWQma7XO//GId?=
 =?us-ascii?Q?tdU6OQ33/AQMKxFqVp1eMJHHEIe5zvQIcE5VEPn/srdHNjyYl6IJs4BCFSVX?=
 =?us-ascii?Q?gj8kqKeXoUHmdkSufC6u1RVoQV+n2xFkQ+CTwq3dusX/lFY55xv8IXrU0DH3?=
 =?us-ascii?Q?PMCz8+G64uKbxGWbh6Sk2gz+co7CFmaVObITMXQ2fkFFVgLS+uL5xFxaaQ3G?=
 =?us-ascii?Q?6xiksPkiCyRp5jxcFnZoMpxBiJVjoXGVqJk5TAkkJUZYEk/widALZfKo3iTN?=
 =?us-ascii?Q?XHIoM3ASnbtIBd8xFlsXFENx6c2wtPEMz5pI9sA04Y0JpPBbU68Yc+uItdn/?=
 =?us-ascii?Q?eTcwkz/EgpJuclvV3COz1U5LraJtlNnFdQgDIrsanBxkR/bkAeSVdYbTqkhc?=
 =?us-ascii?Q?t9NS7zT08R7MnxaP3cLQQQzzVidQsRIS3/HLIbORZiTeY8bHuuGfKX+JSQsU?=
 =?us-ascii?Q?jWSX1t70jkoVYmzkg8lX/WfJOq8uTrXfVT3Z7NjDKvwglz28z5nvqaA1RoFW?=
 =?us-ascii?Q?fZ+gQ1Am8mkHumDba5AZQ27WM2YJm59Mv9zSo8Jrh7Fpf1vxUaMPLVTlYsAx?=
 =?us-ascii?Q?y1tebj3f488V/SkSE+TyheSbiyg4+KPmGArJt+4Yu3PnmQqe+gC0i2AACabf?=
 =?us-ascii?Q?xwdgoUOoV6+maEwJC/bacYpRg/Qz1P/HSqg3+xmRrT7IsqdQ/PqZdAFxUjfm?=
 =?us-ascii?Q?xbDyjEwqKIsahlNRYQYLhR16UdH0PLRvb2KtazeE690usmKkUL7lQWHic9BJ?=
 =?us-ascii?Q?+T0cJeV7fesqIU9imOSQRX2kyighGaObxNjnAf/woWp6bt6MXnGTccOO4phC?=
 =?us-ascii?Q?4NlKE+DCqM2aflWEfFkub49ePdUyQFNFxwERERZ03k/rOUZHSFq1jRoERN3y?=
 =?us-ascii?Q?cVllr8kLdc7PXxPhttwvPmWhFgDWuRELt9KHF3c5PAJmosxrAr3MPT8hF8oi?=
 =?us-ascii?Q?CsSboedvhXH73anu2QGjtbyBCxok0MWeKNNNn1nfYIcrXHUT1kuF7lndaNOh?=
 =?us-ascii?Q?Hw10HB77AtMWEb3rRBApD+MgO82gOiUo7NGpcFy6oEKtd+0uc3Z+z+NxivP8?=
 =?us-ascii?Q?qEi2tMXMbSIlxFFqtvPiHv7CPkZeAn4McIrdDktd2c7EbuCdEmQLHYummfEz?=
 =?us-ascii?Q?5IcvZVYBW9RGmqXPgqSs9fXLPKwHmUWI0D/Z7cKn0mKFsZejoeJBzjcWXzgo?=
 =?us-ascii?Q?PHmljBx+ziJXNgxdgRfM2O5MFiHKrQULbwmM07e2sMDp8cuYOGxTfeD8rYWy?=
 =?us-ascii?Q?jIueUexkw1bKWuiIT3TJKm9wmcKPP3AwW5aooe4NKKMspajtsJI+Z35su1sc?=
 =?us-ascii?Q?4uLxWpEopI3IXMclHu2AOIY6HO+jdtTSx1B6ZV8Yu0m1no/qtFq6KeHp3eU6?=
 =?us-ascii?Q?C+GbpPYTcFjPtnXWuMAsjiNvuRm2apggCReAcZA+qDqrA/UoQF2EMZohKdtr?=
 =?us-ascii?Q?PjxlhqbOqOdjCY172p8yWhLPNy5YnDPltmHWpoOv/jopt0LZG9QvI9dy1x12?=
 =?us-ascii?Q?Zt+Rqp66OOi4X27/WZtie+XrRcCAOfZ/N/4PNLsRKr9ih3FNHiemi6br/Eqi?=
 =?us-ascii?Q?L/oDjeCLGUsT2HzndmBEm9gM7qBY77ENLn2eNFzj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf6efe8-d053-4c35-60b7-08de0d181254
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 00:56:57.2778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsRd6CdQO1cLI3sEGTnQXeMIe6jMAXhQkDGlValV3ssAestFhFvtBp47hf2UO1rzXYGpvK1sHVVGTFpgFsvajw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7984
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

On 2025-10-16 at 17:24 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> > Adds bindings and an in-place initialiser for the GspSystemInfo struct.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> I am getting a new unused warnings on this patch - we should either
> annotate or merge.

Yeah there are quite a few unused warnings. They're a pain to deal with during
patch revisions and rebasing/rewriting so I was waiting until all the comments
settled down before dealing with them as it's pretty tedious work adding lint
statements in one patch and removing them in the next.

As you say the easiest solution is just to merge patches, but that just promotes
larger patches. I wish we didn't have to make that trade off, but I guess if we
want clippy bisection to be clean we have to.

I will probably just merge all the bindings into the patches that use them.
