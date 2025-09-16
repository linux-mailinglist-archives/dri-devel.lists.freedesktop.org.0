Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC951B59300
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 12:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEA410E07E;
	Tue, 16 Sep 2025 10:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jlQc+UBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D6610E07E;
 Tue, 16 Sep 2025 10:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXcG9ukdI7ppumQk36zQQkqlr7SMXzWxkqhxuuSxLVu6UuT5Exg4UEoZ98h0w0kdnddMbTnKpDidbw3MnrIi52e0/WOak+a0noTx0yF4U2C1waK9CUdtcgcFbO6l33E7t3ZZwtCoW9rjb+upg6U52ZqVo8TTxuU7QyU5KTy/uOhtaqVUxy/pThKwL7odT4caWwdSL72Oxsnk1nqwLdLLmCbdfs8evcaj9GYQ9PzMtpqy/VHROAyT0NQCNJbs7nmKbJphOthsMnu1EeatMbgfGDk3ySDvJR9msgGtWsyoBynlauxEjgS6JY20SNg3pcpycnMWDyLQy7RnTz9ZYHo22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT1DPg8qI4oPEWt1DjEIiFSsYODp7qEuvAQ8TZoJB4w=;
 b=GginQRrPUjA0oB+3NHdBXXR/gE3zeHXtY3acpBDxUtaEved03qSf4sTYRjFft6MXNJGyS9WLyuFnXqRhfbSK7TRqsXgLctqw/uu6FE3VD7aZxsDONgMaO4QeRYN0gOTkFGD4fSVVDo6lUhIScJUJFvGTiRNmlZaqFQ/OLtvKmvDw0JTRFOEgo4DlmdOSWGEPhBNdGsxQd5G5MLEKVrtpPa3wRue70+Edh1h7uiMcf/WCiIaN18QYT5b5YVEworBn4SCcOb8NpZx84tEl5rULsaWA09OEV7mU7AbKeG7ZimMXYPvwh5FR5VihV76bLuVD1yCgvp0Eq5OH4whj5VB6Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT1DPg8qI4oPEWt1DjEIiFSsYODp7qEuvAQ8TZoJB4w=;
 b=jlQc+UBZfi1DsfZ+R+/BXTWTwEwCIndaCEPw+mSSaNUEl/YQDAfZyQ0nv4u9nKIkxaTH6fKJlMndNF17Yqnlr+/FIeUYl5vWJr9nPI52eO9Qhs8KEskJXuBIAcCi1kqePvpYY2aGGu9Jmq66Nsu4FzQFrNxTWOVViXC7PKXhuwuBzQ2UunIstgxGaNy4muslwtzYx7eDoqaMVHVxck0R4wtrHPlPyvtM53klbX9uNMfQprZ7/rWJzsxF6GB6kgZ5vY4L+cRkpC69QXMP4WYsmClmf5m7o0TvQ3HCK3x2exDZ2JDlROQ2FBpw+0WJa6HduKqYBO6o/caDRo1xCOZmwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB8402.namprd12.prod.outlook.com (2603:10b6:610:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 10:10:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 10:10:30 +0000
Date: Tue, 16 Sep 2025 06:10:28 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Message-ID: <20250916101028.GA1655707@joelbox2>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com>
 <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com>
 <aMIqGBoNaJ7rUrYQ@yury> <20250916095918.GA1647262@joelbox2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916095918.GA1647262@joelbox2>
X-ClientProxiedBy: BL1P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: d833cc12-2eaa-4e46-7aba-08ddf5094424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Vn0TIIQzT5n2USGiurqLb0dWITRXecSIuSO5tdX5h4tROskyNgMguibWASi?=
 =?us-ascii?Q?V1UHIF0KvbN/syGZpj5yA3O0wbxnJ2nYyaZgSKsRHPdzbAvY5bRgbP62HF7T?=
 =?us-ascii?Q?Fjt4LDCL5tjMedvv+Iuk/IYkN7S+VEBpYqHHiYGF5onn4RAWBlPIl8u9YN3W?=
 =?us-ascii?Q?GAd8K5KuWCOV22Xq3KWlrSiuKpz1eA1z2E13EHhgyfKLvPIib9Ih235vOlcd?=
 =?us-ascii?Q?pnWPglj/+zquBj2YkBnMubd/M8Fdj3sqEOqXio4Zkkk4E//ZKsKSPjt4blDo?=
 =?us-ascii?Q?6G04Rh6twnVthaqMcYn241P9gLZUiL9OoPtSEksGX6cn6d6iUP/vTVNZEbcD?=
 =?us-ascii?Q?5MwvJgqFwcz/wynqPe2lEHmQpi8zL4lUJE6nUXN8qFPpWJic8L/w4IKsP8Ne?=
 =?us-ascii?Q?tHNfpSqgnWNOIWaz2ah9JHsSxIDA7EqiX399SZ9EYNfXg23gWnMz1qBzZfTJ?=
 =?us-ascii?Q?MltHrWnzOeqxZ9SQ3F5R8BstRgKnzahHWv03GWfp3R58oiLAJFrTorReBrcZ?=
 =?us-ascii?Q?0f2z0Qx0AWW2zFJSGRCV5kPRaFlcFprEIJ5Gu85fUb6HmNAAsmhcx3Zqbueu?=
 =?us-ascii?Q?rILGzBQdLNpPm0ru5L+M966X4tzL6n44s1rLqbrxreqpGOHqirnYtgY4LJrL?=
 =?us-ascii?Q?HsX6wpQ3DZ0/0AeG8XsZmbmatyHLOOJdmy2snrwbSnSsExYh1lNvqQ5Com4I?=
 =?us-ascii?Q?XExEbfaZnmf1gwfFSMBEUsKlhOyHTUpq/fJ8+T9ai+F4O/XdnRK70YSbSSIW?=
 =?us-ascii?Q?+vmmct4xPu8o3xs3eRi7btN6/CpO354evx5erkeRGcK3m1vl06imMDWcMuSd?=
 =?us-ascii?Q?EjNrGhb4ZXFJfDe2v1eUxatch3lGPL4iroshQsEo6mHYW+/1ccHSc03vdhLf?=
 =?us-ascii?Q?Q4nbvoZKlu0pVyPlzoVxaW4SwmLdFgcuvgMJDzR3GeQuRcFkJUnu0/rP1AD8?=
 =?us-ascii?Q?+6fVz21n2hUtICNgaqHRXdh7oJuavjWVUfDSAzJwX73Qxk4X5/o4w+0Em4NH?=
 =?us-ascii?Q?gEGjqJ94ycCQO3R8tDp69vvII99JUnSdYr6ea0Qx5nszNMpbyTuCrKzJuHGz?=
 =?us-ascii?Q?S/fAvuDzvA6LEn9LeHPS+6MwbxOYVjjY0Hy2zu20kG1PsyHxBSQwim6Xdfe3?=
 =?us-ascii?Q?3QC1f8Nuve2lOAqW6fcP4kAPeyvMNsGHq4QEKouyRF0Mqas62ti2pa/jbzI5?=
 =?us-ascii?Q?sZfDikOb7DcIEHU7KVCFVe84s9zi5N/CQn6c4HlSpxaLOGXBLF/bo4GEoRFb?=
 =?us-ascii?Q?Tu3GWnkx8QStcMC17djzFLoYA1IuUkl/Q2MvFgB49oKN1Rw2sjvSv6Cxr3LB?=
 =?us-ascii?Q?yQ7Q4V9z0E8/1HJGlKTqstYZ1DT9xYKbKFnJEAtM72wQ/q7yLrVLo5mrEWyC?=
 =?us-ascii?Q?LzKSezXI36uZb36sYuetBP8Omvn5TbD+38tvi4BXWMl2wIrgrIL+gvym9zkG?=
 =?us-ascii?Q?u+T2rkN7k4s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UutfL+00L9r96P674tVTgwEQXQxRlsc6zo7WdXRptH92EgJgB2VYXjIDo7F5?=
 =?us-ascii?Q?QRI9TmiMywldqQytdQHmteSv4qgGE6Znf2Kbeioa7PamRjIZxUR4RZpDytxV?=
 =?us-ascii?Q?eE96rFQAA2ekH2lGp9r+nsMxkzecoKCiF05ykgk3izuc+8NltQcBRD9V70d4?=
 =?us-ascii?Q?ZzLTl6i8uz8DUvKgjlG66SaRNyJHZ+Mvq/1KuhawHAT207RJJiG/Ov/M48ya?=
 =?us-ascii?Q?W79GrAJs40o3oj+TvYPQSatl0kBI0SEINNQCzW8fc+c1ffcQ61bToidebf9j?=
 =?us-ascii?Q?MxZYwsL8DWB8D8rk0NP3M8aY/V+25sNW/dJbR1c9MrjE38LWbIGfCZTHuDSv?=
 =?us-ascii?Q?LUKKxDdIN10c22yhztKeFykLVW3OH6epU7mPECx0YmCC5U9Ym+DcJDdH203y?=
 =?us-ascii?Q?vHiMiz4rp5F6q6+p6Dsj0yb+p1ZIpFDz3JYsfxWE3C2xPrL987Mfq/0mdfe4?=
 =?us-ascii?Q?GQNHHDL79M9k7PpCenaewEY6w1QJ1aZjdpKPo5ToB3u/kkKarvfw4C5JPKem?=
 =?us-ascii?Q?vDd5rbO5VVTYfLGUfFGkT2ejsiOLTvGNai98zi1BpFhhInllRwnxh5JLXVoy?=
 =?us-ascii?Q?SnniIpcvpZgcjCVtvSZvagJZNoK8oPTMvLMFSVuH8TiVUrH/meHUCjG/OgRP?=
 =?us-ascii?Q?mfFhNfSgyv0L5F5UlK2w0dty4nxZq8co5+UR4TsXfd8EtODVsl78eaKnp8RK?=
 =?us-ascii?Q?SobjxMfbQZz3kkTy1QtcSQ7sdU4AC/GfPyHPlxwV5gesIW2W2FmKPoGGXYFS?=
 =?us-ascii?Q?03S/brzNNBfFH4rHj0ygpA28Po8WGT8cTIZbQp87gdHR5nvJ6e5YPhed+ifB?=
 =?us-ascii?Q?GotsxY6hxxeudDeMQFdsb/RGzshHmpZmabjYOkXh8OAXE3m3TlQjbjLWdHyP?=
 =?us-ascii?Q?SeJN5C1Lf8D36CicguX9+Mcrpq4I3nNzhwJkPhYdVmdD9vmEAOK+HouyIkJA?=
 =?us-ascii?Q?mqJvNbxx1xf1FkoIQMNPdGean8Wd7w3YTQSBWr2TFntwFPHi44rp/BO9qNxC?=
 =?us-ascii?Q?v1L+RoHLrwKl+EPl42GDyLwBFueysXdw37gPsIv4w3WPhu4+WXVjyIUQGG+T?=
 =?us-ascii?Q?QeSjqghyDC4hRuIy3FgI4S3UWyyyeinO7h5tsp5uK/cci5J5PxR5ambDpXeG?=
 =?us-ascii?Q?A+4Li647Mgi4R4YZGvzZDiXMrIgGuhxnv9ry0XoPOG5WrkPxhRpH+aYm05XI?=
 =?us-ascii?Q?KBT5z7iImWkpNzOdlChtLrNDwlVEw8WlVtiBWPnPYeI/G2II+/pV0fbxQjmC?=
 =?us-ascii?Q?ByGFKPub08QWl/U/uX9GFumCYSXPmeEX15h0pU2KPIJchVU9V9puJjpbKPMg?=
 =?us-ascii?Q?W/5zvcvGSJRXNnHb1PeroTLuHj9jvbU3+ZStq1DA8XkqE2/ePgRSD/T3jF1M?=
 =?us-ascii?Q?Z4i8+u0eYQjbENw47KwtlLo5u6h858FcYkndoTSUKL0yOxrHF3PLZCDDwcHy?=
 =?us-ascii?Q?DeNtycjNYDSLeVKQsyt1SmGzLfcB27Gxt5AfYNpdj1bv7aLZJFHKenI33ve9?=
 =?us-ascii?Q?JPqnOoEy9y0VNC3Yi4ruoujUHhFNZa4jCrgY7RLzjuLu/jIjc88sq7emdZzL?=
 =?us-ascii?Q?jaYwBZm73wqTC9Jf9JtKWJXr8ewJmjVBRH+twHs7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d833cc12-2eaa-4e46-7aba-08ddf5094424
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 10:10:30.5138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1I08Nan2Sj5Jme341La9hHDzYUjOrIJ7IJEJTUQu0MH1HA051brDg2ovB+fLVhw7EmQIvetujTCG1QtMN9YNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8402
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

On Tue, Sep 16, 2025 at 05:59:18AM -0400, Joel Fernandes wrote:
> Hi Jury,
> Sorry for late reply, I was busy with conference travel. Now I found a 3 hour
> break before my train journey. :-)
> 
> On Wed, Sep 10, 2025 at 09:47:04PM -0400, Yury Norov wrote:
> > On Wed, Sep 10, 2025 at 07:08:43PM -0400, Joel Fernandes wrote:
> > > > You've got only one negative test that covers the .from() method.
> > > > Can you add more?
> > > 
> > > Sure, but note that we can only add negative tests if there is a chance of
> > > failure, which at runtime can mainly happen with the fallible usage (?=>
> > > pattern). Also just to note, we already at ~300 lines of test code now :)
> > > 
> > > > 
> > > > What if I create a bitfield from a runtime value that exceeds
> > > > the capacity?
> > > > 
> > > >     bitfield! {
> > > >         struct bf: u8 {
> > > >             0:0       ready       as bool;
> > > >             1:1       error       as bool;
> > > >             3:2       state       as u32;
> > > Here you mean 'as u8', otherwise it wont compile.
> > 
> > No, I meant u32. Can you explain this limitation in docs please? From
> > a user perspective, the 'state' is a 2-bit variable, so any type wider
> > than that should be OK to hold the data. If it's just an implementation
> > limitation, maybe it's worth to relax it?
> 
> Yes it is a limitation because of the way the code does mask and shifts, it
> requires the width to not exceed the width of the struct itself. Yes, I can
> add a comment.
> 
> I think to do what you want, you have to write it as 'as u8 => u32'.
> Otherwise it wont compile.

I think I am convinced we should fix this, it is too much of a burden to the
user otherwise. 'as u32' should just work out of the box.. I'll add support
for this in v4 but if anyone has any objections, please let me know, thanks!

 - Joel

