Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F37B3F16E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 02:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D2710E180;
	Tue,  2 Sep 2025 00:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YFLzKaFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D1110E180;
 Tue,  2 Sep 2025 00:09:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krjIR87SKwkSw5Sigul4jL29PfEyRZ08c4VtalSOUJQg6KXMhH3bN9knPgj1sEtVgQPt/IHc5x3MszzNrWIvK9WjfJlSmU8wrNYWcrhuMdITdMknKg7d4mv9MtbmZaqZPQ4aaMztCj9wia8jiPjK9Me6/8n9I76mJWQ10KJLEGIjbC1LxeTU6ZDlmEEztvn8Po7h6SRXC5qfO4PbncT5p9qfhRK+UNyBbSuEBU3jtYNrM787hIESlm6knAl99poUoAH5NVNZ0k4AAsJ6hI+Vcm0Q0awr274XmroBIYy51K07mMoeP6S9tnQSH8DPnjjDwfSy4z8ltRxReYqEKJ0iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNTNeklrkl+HDmU+P7vdnkOYcNGXskroj4Po3AlCVU8=;
 b=Q+fWhL4ziEvhI8oeuQKPbZzuPhOWwEL0uNoaAXoKGw02I/DmoRrWpfMGUIbGAfUL0Hd7zEsidD75dsm/7itaLIl3tNx39af8fTmpP8JvJ6PmYrcIMN03FE5CTEHGU0PRjHydI4S5oR9iDG70vGUfE2M/OqzpeGNTfoqy2V8h0Wfhd0xlVbUpJtZE5CQrp5IgcANsIEkpGFDsip9V6ERgOjb7akMGspTE9DnkoALXmwuGXzqjt98ayrYVRkOI794j7dBQb/dUudEKMzhPGAB3DSI5YuGSvxk81PhV39KktK8FKlJI7tTdGIJP3mu+lYH24ksBJyYm1ujbEaXBMAo65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNTNeklrkl+HDmU+P7vdnkOYcNGXskroj4Po3AlCVU8=;
 b=YFLzKaFdTcuNKelbSyUYVpeiUQPeYV4sRevppmuMT6eMONOCWR5VzOszuNZbtrFTJ7tj0Dnu43Rp2GwbYE+lz4r3ciVkC6Zi64l9TGeF41kv2VnqFoQusrh2hduEG3n/dsavmV+h9cg8GwRAA+yuKgJQUGh0hp33gW2dU+mc53gOSt/3hETFpdH5LH5LzmDr8KAtwsAPmzYtKUC1aKp5ilgl+3j0jjRc6jsOWY23cukEsz0lxMcc4yQIwUYqZEQOxhoN5FawaYUFLIU40HUkQXklRYkmX+byv4RoexHFZ2vQ4Vt7cNprRVdulBLGD+YKFC8hu+0yHEZ14+flDLxiMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS1SPRMB0005.namprd12.prod.outlook.com (2603:10b6:8:1e3::12) by
 PH8PR12MB7350.namprd12.prod.outlook.com (2603:10b6:510:216::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 2 Sep
 2025 00:09:02 +0000
Received: from DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f]) by DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f%5]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 00:09:02 +0000
Date: Tue, 2 Sep 2025 10:08:57 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, 
 "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "tmgross@umich.edu" <tmgross@umich.edu>, 
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "mripard@kernel.org" <mripard@kernel.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 John Hubbard <jhubbard@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 "gary@garyguo.net" <gary@garyguo.net>
Subject: Re: [PATCH 08/10] gpu: nova-core: falcon: Add support to check if
 RISC-V is active
Message-ID: <efob3ohi7d4em2sjvxm7bfusqvalrbhu2xi4c2gwpwhpuvrrah@n2x654p4ydzw>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-9-apopple@nvidia.com>
 <ed0e4a38be11a954338cafcafca66f6dbf015ce6.camel@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed0e4a38be11a954338cafcafca66f6dbf015ce6.camel@nvidia.com>
X-ClientProxiedBy: MEWPR01CA0124.ausprd01.prod.outlook.com
 (2603:10c6:220:1d3::14) To DS1SPRMB0005.namprd12.prod.outlook.com
 (2603:10b6:8:1e3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1SPRMB0005:EE_|PH8PR12MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 60438434-f273-4d60-4870-08dde9b4ec19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jaeOULf3K6mvyDaP4PM1QT4QAOOoKtb9R7WMSMYg2/m7YTJ/VbJt5yp0Z2?=
 =?iso-8859-1?Q?zRRBmdBB8nmkJihdLiYf5TwPBHIEzDE+43KLlEPaUSWzUgj+W43JKfCnp6?=
 =?iso-8859-1?Q?IP6NLglWubVTnMMgT0CtB2j+h65Xxv1WErLy40r2eu8SWui2UqCbFS0Xqo?=
 =?iso-8859-1?Q?v8LInBVsS3GhnYH3luyLTdxgQJB9NFa4yo5PUBSyySWU08jRwajZ2k4SUK?=
 =?iso-8859-1?Q?2C+vAQphFTRqoDBNvoQQlvboWcI4ZyHr2IOa8ojCFkFxQ6DcLUOEQwTkXs?=
 =?iso-8859-1?Q?lmsszvrykKuZRiBujIzVyQB9l/t6U/g06gk84yIJnyyaBR7UqLOhpYo8db?=
 =?iso-8859-1?Q?OgSVVAIkxMAOlxw3GdrqpAivJO1ehcF8QDVdQTMKwVebwG90nptvj8Kou8?=
 =?iso-8859-1?Q?2atLUvRn3TK+QV4s1pe9ZE5AefXkWtB2PVOHostMwcJkl0Gp2ePRPSFYGH?=
 =?iso-8859-1?Q?42qHpQ8d2O1x8Jk86eSVFwjerjRng5O7YMym+/b9RjIP0UMPX1n33gZAWh?=
 =?iso-8859-1?Q?3goSGyNiHSlwrAgM75P2xCDsSPoSikPta31aYqR+hzk1dl8yWcsbbkVFU2?=
 =?iso-8859-1?Q?5vsQlxQSUgmOaKEBSiqiqLNN6ghSmCJxDafvJhO6FhFHVe4KjNvJ19gd11?=
 =?iso-8859-1?Q?g28x26XuHOQElIQm07M3muiUoliye6SVihgKuKotO0uY7A2UApZUHA0Jx7?=
 =?iso-8859-1?Q?7OuUiK0Hh7SwxJE0v0ZMuzMvmgwoqfqh22LAhIcPDEoFzQLhW6j2WDpy+h?=
 =?iso-8859-1?Q?f8qnglrWJha9oN6uCrBhH6h7KwfUQKcAgiwwcCg0wZYHb57Gt28BdK8Qp7?=
 =?iso-8859-1?Q?31B96LkluDU37ZRJ+BTDBPnCwP0RQ5ucHWsAjdcXKm7AZfwlgCnfurcIDR?=
 =?iso-8859-1?Q?XGWWeJCdHh56+Rrl2NTU6ioEFW9uBqRmpNE4Z5QnnXZ19ikmQk0isIywTQ?=
 =?iso-8859-1?Q?8OsaEyorF1B6CDO3Hh9Muc0DS53hj+eS+b4i2oz8pECyX5XGZ6hW5KLGxp?=
 =?iso-8859-1?Q?DaVu2ZtuKUTGRGc56q6CB07YTd9cTAmCIudhW0cxg0JW0xzncjqfW8WMhe?=
 =?iso-8859-1?Q?9tDk4SpD2Y+2OXBIEgYF7OL11jQv0ovBVzVepjV744+YndD/B0VXVa/bMs?=
 =?iso-8859-1?Q?dvKKvxV/k6T6D4om6eiFdYTwmJpAR+sYPEnvY7dIbE1KOs1/koVBFlhx8m?=
 =?iso-8859-1?Q?Ek8UQtU49eEF2+5q+3FbxDKCPD/vxsRDPIH7qaF9JeNulknTh2nOTq0612?=
 =?iso-8859-1?Q?M6FjD7OIxZCWlTJj9jGAkOysdS86/unStEOnYXBRyBSkphm60xyUABLsdF?=
 =?iso-8859-1?Q?v+hLpywzl2rEdcO1vGg/V70X3yYrH0uUUgF53xNr+pGy37gkE16inIwFBE?=
 =?iso-8859-1?Q?zzaBa2bDgTQlng8T3uVCjh6jnJPVi5LhwJECpOvbX1jMVaYCJWjhnsc7Xs?=
 =?iso-8859-1?Q?/HWZebk0pm7O6kiGuVQq+YHRDfx5duNleja3/XDePVJmnGlOq/P/PTMUAX?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS1SPRMB0005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lEPkNM+kIzi39EW00QlbSYa2e2+5+lyt+0armuzspLRhz8ScAuDlo+96ZE?=
 =?iso-8859-1?Q?WBx+W79rneTC1xtrQMFJEE5GVeg2+Nvwt5vLuC0+I6GhUMWt2ZZEzJtuPR?=
 =?iso-8859-1?Q?zgjCzIxJsyERmceecsdlXGhjggJ2Wgqig5tWshHTETGx/tlJ90YdiTfG76?=
 =?iso-8859-1?Q?QRAejRKkql9S6Ai2cwa0znm3xR+kwBeTRUr9mtKWp8XiHd7daTSuCom+zE?=
 =?iso-8859-1?Q?Nj4ZT7mOsvbY+NtRkPoqCMTEQmYR5olBavpGyG5QDqQnjv89sTzVDIPdhe?=
 =?iso-8859-1?Q?oxkvics8riRDhsRM1xF9mQZ4HBIEenyIvrQhBDsxJpAk6kgRXvtRlXsJbO?=
 =?iso-8859-1?Q?+T7B09i5xJCmAuEERrR0ZCLsYHM67Dn4dEJLLgBUcx/7PU7v6OOMW4mWqU?=
 =?iso-8859-1?Q?IC74kb4jTEiIMgxMn+iODXruBIB3YNRlhlAjM+CdxPp7/obyqSa39eSt2U?=
 =?iso-8859-1?Q?e6fwMFCAu2j7m2nH0j4dnUR7t59qSO2Op8Hwxhnk6yABjEGiZbUWe7i8Pk?=
 =?iso-8859-1?Q?d16JOALYYqO0M6GRbbPd9rv8R3qbNqE/GecxWPDQbXu0m2dxmZZXi4X8zY?=
 =?iso-8859-1?Q?1QAyL2N6/8aspid+tC/4xyvAWxbK97fZL0PraHACHkliyFYgsjg3RPf3o/?=
 =?iso-8859-1?Q?OpfRmhcxmO4s1skc36bxD6ug38tlxujQfaaJ0Ro2BasJ1O6Ljc9ShYo/ag?=
 =?iso-8859-1?Q?3xEKtL/7PZWQwmC9yQa3Pwh2bOn/i4pdsRUWjVmkOy/azq8uyn6aqGQIHy?=
 =?iso-8859-1?Q?NoEKSX4Gw2h03lXhRn1kWimQl3TSOMWYipqSzJIIVDyGjrmgLOEShNUI9e?=
 =?iso-8859-1?Q?terrRq6jkJT3AHI13zHmvEsr5i2L/BZguL0hV6o66d0elQPFa2xQZYGhD5?=
 =?iso-8859-1?Q?M+wndIzQL//BB6z6EYQ70A/HBd8eFrmY/Ov7YMF5OV0A6/8lpj86UK0PvX?=
 =?iso-8859-1?Q?bZUzBiL8to2S5IPRbcnoynnHwoszhCHW88FtIhHn1r4jLkVB25mNcpK/AK?=
 =?iso-8859-1?Q?gvx3C5q1xCf8JF3Jsd6km1JVOUwiNb16UgfR0fTh9zTJRdLTApieZ2y0sK?=
 =?iso-8859-1?Q?sFbrndX+C4Atj9+yz+0x1uGztn/lqnpHebXO9iyhUxCTM5AKF8q9TuMe48?=
 =?iso-8859-1?Q?IJpvWiIPtHrrOTVPTiiZ9HH592TNco1LNuLQAaYO+9lTgpFdH0hIdvRPFI?=
 =?iso-8859-1?Q?ajXlraC4C+JiCP6gnMNqMer+c33OLbXjyh6VBZgo0RL7XPQ4OlAQHHDIhB?=
 =?iso-8859-1?Q?16T28XMCIzCFvVG/aJ8YUjSDOOgwG6/rO8KqZ06LxxRzNf8G9ksSA2IPHD?=
 =?iso-8859-1?Q?5OuZ80XSQ/cKH11t0N7nZx4O7pTvXP+Uvmb0VYxTXX4Y59ECFTJA87zJ7d?=
 =?iso-8859-1?Q?3ZC6U5g4aFfXuR706SCLWdX2z5YZcB9I7ZhJTxFRVrtf8H7zaUKeiJBzoe?=
 =?iso-8859-1?Q?Bjd2GB3/ZLJDSsoAQio1aVLR0DlhRCCs+dG8o3Tjte6rs+FJ5bicsOWnU2?=
 =?iso-8859-1?Q?rMB1rOxrvilSQE2YWgVGXagBiuABAjNNhge79OvC8UnCgmcdciVqGi5P6K?=
 =?iso-8859-1?Q?JnpIlEdnWgrJYVUSCWQODuJsOntn01zD/hroJXuWnNNIhaxu23V6OJwzhe?=
 =?iso-8859-1?Q?BkXbcj4Ie7hSzn27qTmGtN/GgB902zANrg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60438434-f273-4d60-4870-08dde9b4ec19
X-MS-Exchange-CrossTenant-AuthSource: DS1SPRMB0005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 00:09:02.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Odgu83ye46v3inaMZzI5lAtztM50kZQOsCKXGeC2nTWTHDB3axpoZax5AThz10uP8fCIAqPUByfkIvkChpPbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7350
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

On 2025-08-30 at 04:48 +1000, Timur Tabi <ttabi@nvidia.com> wrote...
> On Wed, 2025-08-27 at 18:20 +1000, Alistair Popple wrote:
> > +    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
> > +        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
> > +        Ok(cpuctl.active_stat())
> > +    }
> 
> I think this should return just bool instead of Result<bool>

Agreed. And looking at some of the other sequencer/falcon code in Joel's series
I believe similar comments apply there. I assume something changed with the
register reading code to make this possible.
