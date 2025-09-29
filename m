Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82DBAA991
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 22:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8C910E068;
	Mon, 29 Sep 2025 20:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xn+gE5bQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012030.outbound.protection.outlook.com
 [40.93.195.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8C810E068;
 Mon, 29 Sep 2025 20:32:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/FCkEtlkcz0eofxyu8gmoALQn2uwn0Gvpwwq1Um7tAAvmn1DiPSinJbM3HAConQoFCz52gTbJIuliz9M2db2HVTWEwY7OsS6F52rHUMXDQ2kWQ1KBWqVgHZRW49MebaNmZlKkEe/M2yZJRHqSwLTyp3HkvNXTYvNiodUcH3X68OpDgi/JYK2LQH5QHnS+pvqvvvusdslxwejblj/RbqB83Vec5oC9kcobvl3HmyShWem9tibceaiemxkKAgDrSq/bMclkIpgGK1RA7FXQmqytjyS6lY86CL5ipBNQPiNZaxcvK6m3XDzhlrfvSQT7kNRBgutOLnTZYWAqBhgu2W+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMEAlTERN1df8ExBsuRZRUICxmNEDqwZuNMd/YfcX8U=;
 b=w7TDSHZsPC0pFAV4l36LMtXnVUDcj50ZNx5XjNW4KPvv72B91HWbTJY64QDbvUqjVBHamBTVzCSrur1OC2TgJP8RVDSnTkmvBbVvDg0tfL88h4DZ9l7314LlMwa5+Kx9DpIDgozTm/aXXbO/u7v/RQzENL7Mkl5g4seT5pjUOmxkXkARq7mT9giBHR1RdZ1vinWGD6/p1Q+tC4QO2T49+DnqQIRNBOh6Y8DmTntBa/uY1IygT5bUPCFdn8SYvVd0ml6X9dmwbQ0ziY4G/5eYwew9EgCLLTF+HCU7Co0xhiksY7UtA0ola+Tpb0f4FVBpF16JCG4IkV0WLrtMwdvsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMEAlTERN1df8ExBsuRZRUICxmNEDqwZuNMd/YfcX8U=;
 b=Xn+gE5bQvJJ/B/PSCT2E1im/ZDng1oJkflt2HY1+qiU3xE7sX0oYD0i4BRWN6uGVKj5rGliApLw49nTS7JhJZPc7iSKc8qsagSiDyPJimWzwHPRjT17JFC/IwikVGHLCwP6N/h+E1BrxTgvjtLecO/MBT/IcKeWIXvjhXGOeQNDG4M2DUM1vWFgi/KMuJf2k2WQbFEOWUWaQWrVbLxBXY3JDw0jdc22CjBZAkhyzrLkMmWc9M1k9YfSv2NoPBjpqL9J00VeSmqphkxCyUWRXrd2LOMG7R0iQd6+iiYiDVQvVgO3H0wMTi14lZOPdRMjDQ0xameKXkml1fk+FF+TUnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 20:32:47 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 20:32:47 +0000
Date: Mon, 29 Sep 2025 16:32:44 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
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
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
Message-ID: <20250929203244.GA3053897@joelbox2>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <DD52ZFG2MKAL.35RFN8L4LH5H1@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD52ZFG2MKAL.35RFN8L4LH5H1@nvidia.com>
X-ClientProxiedBy: BL0PR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:207:3d::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c2ef4e-e19c-4ddb-2ddd-08ddff97598a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6U22frd5Mx2qUFKAtT+C8nS8DcbYwCv3bX877zSDtay0JltUmo5vOmg12OHS?=
 =?us-ascii?Q?tzFgTM0mQVk8isWL+2lvKReDlO0k4zZM8zO64hifFZWhxxCg53v33womx3h8?=
 =?us-ascii?Q?Ns1d7CRH8uxCpbrvpOi+/hAqz4kU5uqNWAOMJvR/8E00mjNjjB3RGEIgC/Oq?=
 =?us-ascii?Q?XRx/XFEBmNHD/8m3aQRoaVXfOAdIxfu3PP3+c2Ypl8l0kCx0oHp4hTWhD1Ph?=
 =?us-ascii?Q?qGEwba1+0mY/MCMLCMCefMfGTm+RpGIanpdvqlc0AnQBTUf+4ti+XKOMTQxB?=
 =?us-ascii?Q?wl+2KRPOWSzaTuHA1/gdtfl/3sBYISETNqhZLvlFQYCfpUR0PUZVL9kEpPNK?=
 =?us-ascii?Q?sO3Js3AOb14Bd9IYGSBc//QAd+20FIC6CTe642e+tKjO3j5zVcnzkuD4Ej1s?=
 =?us-ascii?Q?c58bLCIp0YZBpUJrLddum1SG2+3f40Gw/QG7QME2DLCZPNCNWUKslYXfxz5A?=
 =?us-ascii?Q?/NLzgEw9a8K5T/sDaJJCP3RhplkvVTxQVZD/wxrUFgKUlNm+RQuLb36IL7S4?=
 =?us-ascii?Q?8bUo4iq1tbrJfEc45X56smCU/SDgvdIUaISi66jEFnWKpXG/VxsB9ojcJota?=
 =?us-ascii?Q?/mtRvRw0/8HOzEFDOgHoEnGBydHL2oe3g12bZQ2gaX/KZ1JjheyFPY0QRBfJ?=
 =?us-ascii?Q?5PCj5qhnsj7GsAOclsUQmI1LS02wYAQqDsjOJdvYPu4XKhmC+t5vpD9PvFXX?=
 =?us-ascii?Q?vZ3qujlwH6bKR9W8szdzcoIPbsvRaBTcbgSnlcPZj7bbZPA6q36le1qHP67j?=
 =?us-ascii?Q?fLxXG7nIzs11XflCnmSk0qHzX58MG/MTXGg0g7581uw5dw+l7IUqUChk5do8?=
 =?us-ascii?Q?aj0/+qMHVZzTYZycz7ChH4aEDlmjwD/fd8nHBkitWeFdrFCBcOKFEVP0+WeF?=
 =?us-ascii?Q?iSrDf0r3jiDqu8cVrSQ4k86e7dYIupVlW1B6V2UYcNwbddN763M5bHP/YVCa?=
 =?us-ascii?Q?cqqWLmDyN+IzJ0prvHh78NNcxvx40ErF7f2zg45TEHVm/ds5yXZUc8Z/LGuf?=
 =?us-ascii?Q?bUSmrlndNnFTIoqPUoTXSpCH0kV3jyz7mcU/C4UP614Kg5mtr6snrboMNZ2x?=
 =?us-ascii?Q?5oQh9h2ond/OlSjvi2SUbc2AL64jOhxAz/j1Vl6SnCrh/JzixdOmc3ytWS70?=
 =?us-ascii?Q?SwBLM0GJw2UYLaYfDsUrCGwOWBhkKFhWxFoEN9/ZPTDg5qOPSArRVwysfYAW?=
 =?us-ascii?Q?lV7TwNB3nW9IJJz5veRBlHNh8eJ4336nfP5H88eUoAU6sHP85FyLbp3mbIcf?=
 =?us-ascii?Q?qPsROjA/F5XjVLuXLTOBUkDOEooOnP3+hJPlCbKM5DGc5Cq42Wp1njvUhvdM?=
 =?us-ascii?Q?6jex20K6Vu/3gx+BTovxpQRvJogMpwCATrjnhdXbLya0knqMXNNEGk/rjhff?=
 =?us-ascii?Q?/P+dyMAqojFOGCtbQe6GLXakRH6ymb3VCLzYhQ1aOxDQiQ9iVbh3sfvToQow?=
 =?us-ascii?Q?6+K7y/0rxDHRT7iZIEVZWiO2eWLoLDOv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VlOU7gCpExPE+J/KvMFcEbLNhGonKAx6wrwgpqvjLeKzNE1GYnbvW/jc2vFw?=
 =?us-ascii?Q?yLi93Eh273v6MIoOPKyXom35y/pAN03+kx9aef3NxRHdF+BCzopHYgndBJU/?=
 =?us-ascii?Q?dL+ebzYwNC5b5q72BNf+1dWcCZvye+F90GOWvXcCo/DPRn0NLNXTI7sr2ge6?=
 =?us-ascii?Q?6oSUIpFE5fye/SsjaW6g820qZkWtj6C5wTY58LgbsPQcn0DyMTr9ZE0914hh?=
 =?us-ascii?Q?6bDWkNk+wPn6ivcIbgb6Q6T5yU2QiOMPGVg3FQ4I29zvapka7o4H4EjHOxi0?=
 =?us-ascii?Q?MU7DMcy3ODwXGC69iGT4sEjfX+AyGJYyYC5FnzKUiJk62bZVzvTIlfIOQMtw?=
 =?us-ascii?Q?rleXQl24idLciSsO9/sQTSc+iV73qy437VyMbHWJ4duIxXlzP+okoN5TkHCB?=
 =?us-ascii?Q?amMgLSV01+mzPMMvsvQiv6Ku0fNbuyNjl1DfTPAqt+PNHd4oVz3xa2UDBmBi?=
 =?us-ascii?Q?ZsRk1Uxqz1eWRj8dbAuCyKuUAZRMhQ/4fw38giTj9ZWSiUz8svVyGUbZI332?=
 =?us-ascii?Q?m2o17KZ5n0jerKTODZOB90LeQO3n+BE3iztpdHN90n3g8y3DIajQuMLGqffQ?=
 =?us-ascii?Q?dem2o9UovR/jgPAsznTfk12CQLYax3LwHaqWq66LFFKoKI8zAbfU55VvJpxI?=
 =?us-ascii?Q?rZF77leAf4jEB+WQfOl+Bfx8umsBoz2dO/V8FxFBWBZv/HJI5A6Mim33kp07?=
 =?us-ascii?Q?tdhgJL8fl80htAjZaqOWXH7A5vf9IygzYFMznIh2kEycUGC+VcETAXpbn9FJ?=
 =?us-ascii?Q?XctVtazc0hZEHwcddn5FtvWA6VxS8DXAne2RMKkz5OU9zCmBWFjg1Rp6PHr3?=
 =?us-ascii?Q?o8yU0GuwhkqHYsYxvDoLfkNlHrvnH1k1v1zxdMnajaS8qdFlCFbF5RqjKLUM?=
 =?us-ascii?Q?cHFCJzxUafaArJaqfLSTi++NO8ck5/1lCFCk1pasPsJTu4Gvx++60Sx12Miy?=
 =?us-ascii?Q?kNSZpvPjKQHhBFQ1D46DifF0I4t7OiwEKPXsMVlrmoxvjAsa5SGxZcTqykmn?=
 =?us-ascii?Q?aC6OQ3kpu1A6v2iPZJbzgmoLBVPf/yxBzy+xSOgaIN9m5OK2gSaTGKoIq8to?=
 =?us-ascii?Q?Ol4MuCjjjFQCtmQl14F9ZAhyS5M21qv1ksYpJIoBHy24EYk+jxji9tqiWNVd?=
 =?us-ascii?Q?WaQDdDUNTjU7jq7MU3Ks7/S5IVXYyzVj6ZT3jsYOYhL1PUIBpYnPodHQo03I?=
 =?us-ascii?Q?mp3i80lA7ct6df1SDmUdMc+/zK1+rJa5VsA2THWvfL4bhTbWvC6c9cE4qauO?=
 =?us-ascii?Q?DGq6LrTm4TG7fa3SQzkzPaQys73mL+BszCCN/9CN+JZAE0eEtuEWKqMz8w7f?=
 =?us-ascii?Q?AIg4lLGrsVrfthGztK8lC1nY8zG4pZQr9HoU7LdPLxfjFkrs5BmIne3WjMnQ?=
 =?us-ascii?Q?cFzK0N7GZpsMtOsZo5zbMv4QSmWQyolIC6xsQt4H3sNaLz0cmJPRpMkwm/v3?=
 =?us-ascii?Q?eJ6Ea9uNgfuWE263pWgRSK5jdqQVWEssL4vGiEBCf/3LGY8lxjcE3VgXE4+8?=
 =?us-ascii?Q?WTWgpH0ASgWknU0kdLMRzES0FaQzG5G5btb2C7DkVSD27uiQzNMRnQQ2xdvv?=
 =?us-ascii?Q?m7R7TNYk0I6zvTMvKckKujQuSx0cI2lOPenEfLro?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c2ef4e-e19c-4ddb-2ddd-08ddff97598a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 20:32:46.5830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrTOppXUDc4Pt0MRyybYDDpvFBhQoVVAjCmNKn3Mgxtna5W6FGYj4oS02mvJSfnj0CVMAGnWPhx7k8Pnc082RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8476
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

On Mon, Sep 29, 2025 at 03:47:08PM +0900, Alexandre Courbot wrote:
> On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
> > The bitfield macro's setter currently uses the From trait for type
> > conversion, which is overly restrictive and prevents use cases such as
> > narrowing conversions (e.g., u32 storage size to u8 field size) which
> > aren't supported by From.
> >
> > Replace 'from' with 'as' in the setter implementation to support this.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> 
> Can you add a `Link: ` tag to the discussion for context?
> 
> But I am not really convinced this is needed or desirable at all. Where
> would it make sense to define a field that is larger that its containing
> type?

The 'as' keyword is not related to the containing struct IMO.

Example:
you can have a

struct Foo(u8) {
  0:3  foo as u8;
  4:7  bar as u8;
}

Here if you just go by the 'as u8', the total width would be 16. So we should
not conflate the 'as u8' with the '(u8)', they are already 2 separate things
and incompatible. I think the following would also work:

0:3 foo as u8 => u32;

However, directly using 'as u32' is a better shortcut IMO.

Would it help if I added more documentation comments about this?

> This looks like it can introduce confusion or errors. It's already
> not ideal that we can pass values that would be truncated; but this
> makes it worse.

Actually, in new series we're no longer truncating, I will post that shortly
after we conclude feedback on this series.

> 
> Anyway, if we decide to keep this, I think you want to remove the 
> 
> +//!   Note that the compiler will error out if the size of the setter's
> arg exceeds the
> +//!   struct's storage size.
> 
> bit that was introduced in patch 2.

Ah, good catch! Will remove the comment.

thanks,

 - Joel


> 
