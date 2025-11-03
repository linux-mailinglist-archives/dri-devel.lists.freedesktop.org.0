Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D98BC2DF8C
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 21:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8831210E455;
	Mon,  3 Nov 2025 20:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MLD6CaXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D1110E455;
 Mon,  3 Nov 2025 20:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE3ubne0fbFc3iEfiq10ZfMzvItnhJgAZ515snqzRPK14foed/6RTFt+1/bL4MWUu4RYnT3VyDCw0w7n/xRvm1ZtTBWs4RaQbQL5J3jlxBevBEzVDOrNUHkOSoPGjdY+CO3WWuYupi9uHt4ekzNyDzSRWgp0nyiIkB1N4MNm66cdia0hWUOUUjM1mn2xnS3gmtpTKSiJQd/wa2PdqIIEUEKns+mBHwLMfiLLndrTvcaZk7i/EyT31vRC38SAv/bfRcHy4IZKHSuk46tddJ8+45D+XlCP8Ytcso/lt2u4O3atUj8vQ3gpPdpI6AlQ/wa4WRXHxpxM2+BFzoUwKBxLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVMdlvpWGZqMyQa1thF1jNz93tFYrHKTzH6s+/dOOKA=;
 b=MVVjl+Kq5ddAvbjxwx+PUG8+mea4dhZ5wBzff/yT64hXEhCj9TUoivcm4gcdjHi/7PVxdc367afD3+WSeHyyiihdVWKPfAPRmgRW0dIicPkgh0yJZxq3Qqj5yLDogutqnbCI0qn61s78WAWQ0r3uaFudurU56rwVFmLm+L8SOBdo9+i0YCky4ndBf/Tvl2MWPtMFIctXjS6pzAlLTkih2rbSZ83RVQd47sYTY1lOFAd2GTWS8JnUohmhGXMYcPSdakViKKgVPVUIeSUlBp0UrOZ6rlsZeIEd1Mp3qShueJ9LGA6lz5xzdEh36l18+qclwf7nFqv2xDLpkAGfvCHJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVMdlvpWGZqMyQa1thF1jNz93tFYrHKTzH6s+/dOOKA=;
 b=MLD6CaXAJd92QQKBUR+pHUZRH2lxfQiaRjdGSJc3o6RplTrCEZNr5B8Xgw8Nyp1FN6hd/9usBlMdmTMc0u4dMdpH0/95hv/7OVK7dFow+PJVFkirk0uSQIIF7xtlgTKxTwmq/IJxJnBjYcEJ9K+1LmnLl6LBVqNk+t2auMvWpQvJl383IQo8FpBvfLJhogqS70Wp4djoF7cc8FeKGx3WiYju0i+papgUUzRYpaiSArTDYVrjvfTrZzC/718KGzb8uc60doqRz/eW/1hiRne0zOBmSUKJ87RuuVPDcJ++IWiJAqNv+5I4ReGZPU/h68uot5FcjG3qV77pjzaFKbWXVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 20:04:18 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 20:04:17 +0000
Date: Mon, 3 Nov 2025 15:04:16 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] gpu: nova-core: vbios: use FromBytes for
 PmuLookupTable header
Message-ID: <20251103200416.GA2097762@joelbox2>
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
 <20251029-nova-vbios-frombytes-v1-2-ac441ebc1de3@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-nova-vbios-frombytes-v1-2-ac441ebc1de3@nvidia.com>
X-ClientProxiedBy: BN0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:408:e6::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b782599-f3db-458e-18c1-08de1b142b83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4dCSnKuYdIFwXyC7yzy/ETl223FkimwVkc/LzOyTSoxW8f1PckhUd2sPOSU5?=
 =?us-ascii?Q?cE7jU5irH2gUzYHdcN0gyZwdBRJhHT7ybRJzUnG99WDxfWDgBvPhNT2OEK8g?=
 =?us-ascii?Q?T6briGQ7luLQB96QIKMuP9zXUkdVU3qHleWMAVrPP9x2phlh9bFcyayn6vjW?=
 =?us-ascii?Q?lArhbMUOt2cka4vjXVSFZAK6yohUU+11va1txIwSD2dX35aQKavGXEZV/DQM?=
 =?us-ascii?Q?vST6Vm5BqPIBpRHTd+gajEW/l9tIO0zw6BpoK/P46AZxv2jy5uMXRooMkJYn?=
 =?us-ascii?Q?p9e7sjk/baNQEDHi3ZT3wTmmVNTcpqIiFB40RhPjrI7gmWKOgj4d01wzC0IA?=
 =?us-ascii?Q?q8R/xLddDjhzuq1uf4ve4Do6juN/1rHJCRrQei8183wnJdKPiB/7VgxWNJ/H?=
 =?us-ascii?Q?q3xpXNJheIsPXuIUNoWOqWXpRDC05lapK3GpKaF3pFgSvFeN2iACTtCa99Ow?=
 =?us-ascii?Q?zg21ih1mRALOak24rEbUzj8KpzK41wNXJH8KY5zYykrofsjmqIxW6j+HLUCM?=
 =?us-ascii?Q?og5h4vIaMo+nj5P5mUiYTLbS3H5dPkeP7B5nUc08k6JsMx7AQeVQ5SLOJFPf?=
 =?us-ascii?Q?ha0lOxSJF2XT+aF5MjEdj+JiYbL1sKXQCU9ala1To9tFVhYZXp5cCew6EqG8?=
 =?us-ascii?Q?EhWbJHbCa5c8exKXWn0bVwUU89joSeUlc6scvINOq3cagFxIqiYn/x9JQOdq?=
 =?us-ascii?Q?tChoSiVu34B2cCcQItmhXRa0D/HH8O9QRwjU2NzPSDIgWdfBdhdL70ItVF0e?=
 =?us-ascii?Q?lfooaMyaWWHER+rC45+LMP7J7qqxC/5Z5EjNtSNVgBZo9yHCiZzTttLBekY7?=
 =?us-ascii?Q?Ny+zoW9TYPpvWsVzILrgQFoF7izxWP3MvXhkb8R1vurBHrwFGCmCDwBuhMBA?=
 =?us-ascii?Q?NGD98tkOUooLH4Ou9rSvwN6A4jk3OanmIFp6JSJAFr+EfKvamFLAj8Fwvj1r?=
 =?us-ascii?Q?1XNj01adiPbNKQCyGiiEGdNSh04CMZwNynLZ8EjjBQR5f8cN3vyJdchoG73y?=
 =?us-ascii?Q?AC2ZiNdJqUBqS4WzPVdGuV4oSXvaGuEXLDM8BuN8RuMHvNn8cso7BLxQ6snX?=
 =?us-ascii?Q?Lp1doY+YV0d4jNM0JF2F3FYcS7YGUO57sW71BcANDxF5Qe+KPXiCAKPC61tL?=
 =?us-ascii?Q?YesZWgrDcK5bSwdcwzqjHQ470uHAFuk5e2dCr968fgwmtaaWjW+0onlCEh2b?=
 =?us-ascii?Q?EMVi9fHy1dyibwpZGMLs0ccCJTIXBHwLK2/NUtQcC0XQrrY9qnR3eYi8mX9E?=
 =?us-ascii?Q?pfomKBbkfcwMVMbTmCtfZgCaNZmhNNsyh3JFSxou8Xk3tYDNRB7duUmzluf+?=
 =?us-ascii?Q?7lKAMhx9W169R89OEE4CK4+Z+9ACZIKTPwgRBesZkTEBm6cvO7kTOGFQGcv3?=
 =?us-ascii?Q?u5+QFNhVDEjoURAw2mgc9z1B2L+jR05dggXgp3bYYelPJFlyKbnqUI3+LGtA?=
 =?us-ascii?Q?AT+ssCjqMTqLKNfJdGF9sYzuarFBExCn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jOYr8DKZL8jw2J9kpx0z3PbBZ0X0Hx2/Ytw9H0jlYgeM86M2U5w8c1msn2Jd?=
 =?us-ascii?Q?1BROQrN4HkQe6MjIWR7fm7TjEZ+ZddSuUbNptiVqMOwCSCn+vwFVNl0nzpZ2?=
 =?us-ascii?Q?nQieHfGc1D0nRlS3WM5QQ0gk2fn/3dt2uORoIxJ7B1HOJcr2txD1pocHxHZp?=
 =?us-ascii?Q?/v6SQqQmWu0+ztnzuXXdQlMCvzxdRLEbdbfN/GHc9qGzylrRSIC1ekVL0wny?=
 =?us-ascii?Q?9w0UHpg8O0fXL3+KYbBhD9ahmgBfTbb+LvDW5zWAnW6kRTGkRRMZpK6EPVjs?=
 =?us-ascii?Q?5pt26skMndD3/kezz4sed89kMUkLgRi29EBG+6PRhhSr+C9DmIU/kmh5qVM0?=
 =?us-ascii?Q?zunW6wW6e5Z+CKNWLzM/Q5pt6NuJF/s+hpx6iC3fZLjASxAOoTMOnXeL6LVa?=
 =?us-ascii?Q?c0RhMRMlX4mhs6UkqI562yKB1k7HTURfC3IqeL2YXeEZzBCF1O4B4F66Q5yL?=
 =?us-ascii?Q?gHAUOVD8fMdg0t0V2kqdrCnA0cXz1grnnHF3hBguSkH2iPvI+zk7rjcYIJAA?=
 =?us-ascii?Q?/OaNo6uc3yVYI2CgCz0G4C3D4B5fgcrHgy44Ki1LVVwu9o2xaYjLTDXMe2N6?=
 =?us-ascii?Q?VCQ+LEZnlZFIeohqUhRrDkYrvGOL1R1IV5RdzsHzg6n3Br7zrFPT6xAbRzKl?=
 =?us-ascii?Q?rPmFrHAKSnYl/m+o0tSmpwtdV3nQMqVnNmJPTdkg6lz2su9wMnv+xyyuYh2J?=
 =?us-ascii?Q?ZJXwJPIKYrSg4ImSi8jHHQ7ezNPErgEWT09CQYeNY+4JyhdSQ0Yug2JLqpym?=
 =?us-ascii?Q?pe37D2G+SByFd165E27BZaooqjVF6howYG+wGts3WWpEhR3PjtG+RGqnqgaM?=
 =?us-ascii?Q?gspdF03FhNHkdXEGs9YXcs8jFkQS7GAbunO9yJ93oMuV91+/CKEA/6tX7Nen?=
 =?us-ascii?Q?hYHOfLR+icGiXYOLEqMYInmF7qxLQHFYyX3yAXCKJR1yYVH6n7PoKRycrh/+?=
 =?us-ascii?Q?YJfN+jcuAIIy4Wse0Zz+45S2gBAox0/0DquJhmbhl2qQaS3s0vFUBTFt8E/J?=
 =?us-ascii?Q?dvA9zPc4S3xN60TuhOONDgCwYDhT0MYF2aSv0Zyu42QYI0xuduymW2mkRQI1?=
 =?us-ascii?Q?FpQc43qtezwnbMx/1eTDnT6snwxVDmWlbEaOvVDfgnwQR6mz3WR7y2Q/Vntv?=
 =?us-ascii?Q?S9obadPqRgskJ4Y/M8P73hWx/9yUBPSdf7zOFJqco+swzyLU5QP1WfKlyrON?=
 =?us-ascii?Q?2LpcThU231HrLk52pUqDxE8FTgd4FDqtjWWrsA3mNn9zsiNGFMkKhsIZuF/C?=
 =?us-ascii?Q?JFPMboIznNBKvTUyd77UXHIguZijSn6P2h1fjnrPWrXb4CvPIt8BkcyFwAVo?=
 =?us-ascii?Q?zQI5LAysjN5IDw39cDJ9JDj5MKwNh/7OjgInGSDzsx8zkyVkEXeEl30dzHPf?=
 =?us-ascii?Q?u9T/VWYeDVskCU4VD39v2kMIoUcKWnb4zBajtAA2PCFXNlK3eoO2AGAZTWPx?=
 =?us-ascii?Q?lNDKIK2KWauArjfmZzryrOe3LAKvQUT6v5v5QlFbwGfDmpNKkP7oKwxbhfR3?=
 =?us-ascii?Q?fWoTtiLK6beRH9dzYURFO8JQSyCbF6hPk1M/r/Ih7S+CIQxAvhOKwA3tNhOd?=
 =?us-ascii?Q?At+wIOs8/xSF3exI5lasz4RtRveb48GSuh8yHOCi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b782599-f3db-458e-18c1-08de1b142b83
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 20:04:17.8900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUT745Ko3pbS+tIxl9KgQFhOdsckAQwl/kIT29tINMMVBRdr6hF6YmSCBBrm3Twdi8ZOvD7R5PqBD44EjRfDNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864
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

Hi Alex,
Nice improvement, a nit:

On Wed, Oct 29, 2025 at 12:07:37AM +0900, Alexandre Courbot wrote:
[..]
>  impl PmuLookupTable {
>      fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
> -        if data.len() < 4 {
> -            return Err(EINVAL);
> -        }
> +        let header = PmuLookupTableHeader::from_bytes_copy_prefix(data)
> +            .ok_or(EINVAL)?
> +            .0;

Can we change to the following, it is easier to read than using `.0` IMO.

 let (header, _rest) = PmuLookupTableHeader::from_bytes_copy_prefix(data)
      .ok_or(EINVAL)?;

(and similarly in the other patches).

thanks,

 - Joel

